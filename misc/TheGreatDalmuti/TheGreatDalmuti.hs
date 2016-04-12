{-# LANGUAGE CPP #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE RecordWildCards #-}
module Main where


import           Control.Monad          (when,forM,forM_)
import           Control.Monad.Random
import           Data.List              ((\\),group,inits,sort,partition,find)
import qualified Data.List.Ordered as L (subset,merge)
import           Data.Map               (Map,(!))
import qualified Data.Map          as M (update,mapWithKey,fromList,toList,insert)
import           Data.Maybe             (listToMaybe)
import qualified Data.Array.ST     as A (runSTArray)
import qualified GHC.Arr           as A (thawSTArray,listArray,readSTArray,writeSTArray,elems)
import           GHC.Generics           (Generic)
import           Text.Printf            (printf)


#ifdef __GHCJS__
import           Control.Arrow          ((&&&))
import           Data.Aeson             (FromJSON,fromJSON,ToJSON,Result(..))
import           Data.JSString          (JSString,unpack,pack)
import           GHCJS.Marshal          (fromJSVal,toJSVal_aeson,toJSVal)
import           GHCJS.Foreign.Callback (Callback,syncCallback',syncCallback1',syncCallback2')
import           GHCJS.Types            (JSVal)
#endif


-- * Sample game AIs

data Message
     = Play       Player [Card]
     | Pass       Player
     | Win        Player
     | Finish     Player
     | Hand       Player [Card]
     | Illegal    Player [Card]
     | Give       Player Player [Card]
     | Revolution Player
     | StartTaxation
     | StartGame
     | AllPass
     deriving (Generic)

instance Show Message where
  show (Play       player play) = player ++ " plays " ++ show play
  show (Pass       player)      = player ++ " passes"
  show (Win        player)      = player ++ " wins the round"
  show (Finish     player)      = player ++ " is out of cards"
  show (Hand       player hand) = player ++ " is dealt " ++ show hand
  show (Illegal    player play) = player ++ " attempted the illegal move " ++ show play
  show (Revolution player)      = player ++ " cries revolution!"
  show  StartTaxation           = "Taxation starts."
  show  StartGame               = "The game starts."
  show  AllPass                 = "The game ended early, because all players passed."


type Rank = Int


data AI = AI
          { runPlay   ::         Game -> IO Play
          , runGive   :: Int  -> Hand -> IO Play
          , runRevolt :: Rank -> Hand -> IO Bool
          }


defaultPlayers :: [(Player, AI)]
defaultPlayers =
  [("Ezra", playWorstCardsAI)
  ,("Neil", playBestCardsAI)
  ,("Ruth", passAI)
  ,("Abby", playWorstCardsAI)
  ]

allPlays :: Bool -> Game -> [Play]
allPlays allowSplit game@Game{..} = let

    me              = head active
    (jokers,hand)   = partition isJoker (hands ! me)
    groups          = concatMap (\j -> map (++j) (group hand)) (inits jokers)
    groups'
      | null jokers = groups
      | otherwise   = groups ++ [jokers]

    in case findPlay game of
        Nothing         -> groups'
        Just (_ , [])   -> groups'
        Just (_ , play) -> do
          filter (isLegal game me) $
            if allowSplit then map (take (length play)) groups' else groups'


passAI :: AI
passAI = AI
  { runPlay   = return . const []
  , runGive   = \n hand -> return (giveWorstCards n hand)
  , runRevolt = \rank hand -> return (revoltIfNotHighRanking rank hand) }

playBestCardsAI :: AI
playBestCardsAI  = passAI
  { runPlay = return . playBestCards
  , runGive = \n hand -> return (giveBestCards n hand) }

playWorstCardsAI :: AI
playWorstCardsAI = passAI
  { runPlay = return . playWorstCards }


giveBestCards :: Int -> Hand -> Play
giveBestCards n hand = take n hand

giveWorstCards :: Int -> Hand -> Play
giveWorstCards n hand = take n (filter (not . isJoker) (reverse hand))


playBestCards :: Game -> Play
playBestCards = bestPlay . allPlays False
  where
    bestPlay :: [Play] -> Play
    bestPlay [] = []
    bestPlay xs = head xs

playWorstCards :: Game -> Play
playWorstCards = worstPlay . allPlays False
  where
    worstPlay :: [Play] -> Play
    worstPlay [] = []
    worstPlay xs = last xs


revoltIfNotHighRanking :: Rank -> Hand -> Bool
revoltIfNotHighRanking rank _ = rank > 2

canCryRevolution :: Hand -> Bool
canCryRevolution = (==2) . length . filter isJoker


-- * Game mechanics

taxationOrRevolution :: [(Player, AI)] -> Game -> IO Game
taxationOrRevolution players initState = do

  let
    playersWithHandsAndRanks :: [(((Player, AI) , Rank) , Hand)]
    playersWithHandsAndRanks =
      zip (zip players [1..]) (map ((hands initState !) . fst) players)

    revolutionCandidate :: Maybe (((Player, AI) , Rank) , Hand)
    revolutionCandidate =
      find (canCryRevolution . snd) playersWithHandsAndRanks

    revolutionCrier :: Maybe (((Player, AI) , Rank) , Hand) -> IO (Maybe Player)
    revolutionCrier Nothing = return Nothing
    revolutionCrier (Just (((player,ai),rank),hand)) = do
      criesRevolution <- runRevolt ai rank hand
      if criesRevolution
        then return (Just player)
        else return Nothing

  revolutionCrier' <- revolutionCrier revolutionCandidate

  case revolutionCrier' of
    Just player -> do

      -- Player cries revolution, no taxation is held:
      announce (Revolution player)
      return initState

    Nothing         -> do

      -- Nobody cries revolution, taxation continues as usual:
      announce StartTaxation
      let
        highest  = take 2 players
        lowest   = take 2 (reverse players)

        taxation :: [Game -> IO Game]
        taxation = flip map (zip3 highest lowest [2,1]) $
          \((highPlayer,highAI),(lowPlayer,lowAI),n) game -> do

            let lowHand   = hands game ! lowPlayer
            let lowGive   = giveBestCards n lowHand
            let highHand  = hands game ! highPlayer
            highGive     <- runGive highAI n highHand

            -- If AI tries to give the wrong number of cards,
            -- punish them by giving away their best cards.
            let highGive' = if   length highGive == n
                            then highGive
                            else giveBestCards n highHand

            announce (Give lowPlayer  highPlayer lowGive)
            announce (Give highPlayer lowPlayer  highGive')

            let lowHand'  = L.merge highGive (lowHand  \\ lowGive)
            let highHand' = L.merge lowGive  (highHand \\ highGive')
            let hands'    = M.insert lowPlayer  lowHand'
                          . M.insert highPlayer highHand'
                          $ hands game

            return $ game { hands = hands' }

      foldr (=<<) (return initState) taxation


playGame :: [(Player, AI)] -> Game -> IO [Player]
playGame players initState = do

  let playerMap = M.fromList players

  announce StartGame

  Game{..} <-
    untilM gameOver
    (
      \state0 -> do

        statek <-
          untilM roundOver
            (\statei -> do

              let player = head (active statei)
              let ai     = playerMap ! player
              play      <- sort <$> runPlay ai (playerView player statei)

              -- N.B. Any illegal move is interpreted as a PASS.
              let isLegal' = isLegal statei player play
              let play'   = if isLegal' then play else []

              if isLegal'
                then if null play'
                     then announce (Pass player)
                     else announce (Play player play')
                else announce (Illegal player play)

              let statei' = handlePlay statei player play'
              when (Just player == listToMaybe (finished statei')) (announce (Finish player))
              return statei'
            )
            state0

        -- cycle the list of active players until we reach the winner
        -- of the current round.
        let winner = roundWinner statek
        when (not (gameOver statek)) (announce (Win winner))
        let statek' = statek { plays = [] , active = cycleUntil winner (active statek) }

        if all (isPass . snd) (plays statek)
          then do announce AllPass; return $ statek' { allPass = True }
          else return $ statek'
    )
    initState

  return (reverse finished ++ active)


playGameWithTaxation :: [(Player, AI)] -> IO [Player]
playGameWithTaxation players = do

  initState <- evalRandIO (defaultSetup (map fst players))

  forM_ (M.toList (hands initState)) $ \(player,hand) ->
    announce (Hand player hand)

  let
    playerNames      = map fst players
    lowestPlayer     = last playerNames
    lowestPlayerHand = hands initState ! lowestPlayer

  if canCryRevolution lowestPlayerHand
    then do

      announce (Revolution lowestPlayer)
      let
        (highestTwo,rest)  = splitAt 2 playerNames
        (lowestTwo,middle) = splitAt 2 (reverse rest)
      return (lowestTwo ++ reverse middle ++ highestTwo)

    else do

      initState' <- taxationOrRevolution players initState
      playGame players initState'


-- |Given a game, a player and a play from that player, determine if
--  the play is a legal move. Precondition: there is at least one
--  active player, and the play is sorted.
isLegal :: Game -> Player -> Play -> Bool
isLegal game@Game{..} player play
  = isActivePlayer && playInHand && allCardsEqual && (null play || isFirst || sizeOK && valueOK)
  where
    isActivePlayer = player == head active
    playInHand     = play `L.subset` (hands ! player)
    allCardsEqual  = allEqual (filter (not . isJoker) play)
    isFirst        = null plays || null previous
    previous       = snd (mostRecentPlay game)
    sizeOK         = length  play == length  previous
    valueOK        = valueOf play <  valueOf previous

-- |Given a game, a player and a play from that player, add the play
--  to the list of plays, remove the played cards from the player's
--  hand, and move the player to the end of the queue. Precondition:
--  the play is legal and sorted in ascending order.
handlePlay :: Game -> Player -> Play -> Game
handlePlay game@Game{..} player play = let

  newHands     = M.update (return . (\\ play)) player hands
  newPlays     = (player, play) : plays
  isFinished   = null (newHands ! player)

  in if isFinished
     then game { active = tail active, finished = player : finished, hands = newHands, plays = newPlays }
     else game { active = tail active ++ [player], hands = newHands, plays = newPlays }

-- |Given a game, check if the round is over.
--  Precondition: at least one play that is not a pass has been made.
roundOver :: Game -> Bool
roundOver game = all (`elem` passed) (active game \\ current)
  where
    (passes,rest) = break (not . isPass . snd) (plays game)

    current,passed :: [Player]
    current = map fst (take 1 rest) -- last player to play cards, if any
    passed  = map fst passes        -- players who have passed


-- |Given a game, return the round winner.
--  Precondition: the round is over (as determined by `roundOver`).
roundWinner :: Game -> Player
roundWinner game = fst (mostRecentPlay game)


-- |Given a game, check if the game is over.
gameOver :: Game -> Bool
gameOver Game{..} = length active <= 1 || allPass


-- * Game Setup

-- |The default Dalmuti deck, with 12 twelves, 11 elevens, etc.
defaultDeck :: [Card]
defaultDeck = map Card (concatMap (\n -> replicate n n) [1..12] ++ [13,13])

-- |Given a list of players, return a random setup for the game.
--  Note: this function leaves the order of the players intact.
defaultSetup :: RandomGen g => [Player] -> Rand g Game
defaultSetup players = do
  shuffledDeck <- shuffle defaultDeck
  return Game
    { ranks    = players
    , active   = players
    , finished = []
    , hands    = deal players shuffledDeck
    , plays    = []
    , allPass  = False
    }


-- |Given a list of players and a deck, distribute the cards in the
--  deck randomly over the players.
--  Additionally, for 6 or 7 players, the function will move the
--  first two hands to the back. This is important in Dalmuti to
--  ensure that the leftover cards are dealt to the middle players,
--  skipping the first and last two.
deal :: [Player] -> Deck -> Map Player Hand
deal players deck = M.fromList (zip players hands)
  where
    n     = length players
    hands = map sort (changeOrder (deal' (replicate n []) deck))
    --  Note: The order of the hands may be significant. In a game of
    --  Dalmuti excess cards are usually given to the Merchants. In this
    --  implementation of @deal@, the hands with excess cards will be
    --  last. Therefore, the first four hands should always be dealt to
    --  the Greater and Lesser Dalmuti and the Greater and Lesser Peon.
    deal' :: [Hand] -> Deck -> [Hand]
    deal' hs [] = hs
    deal' (h : hs) (c : cs) = deal' (hs ++ [c : h]) cs
    -- In order to change this, we move the first two hands to the
    -- end of the list for `n` ∈ {6,7}.
    changeOrder hs@(h1 : h2 : rest)
      | n == 6 || n == 7 = rest ++ [h1, h2]
      | otherwise        = hs



-- * Game Data

-- |Cards are represented by the numbers 1 to 13, with 13 being the
--  Joker.
newtype Card = Card Int deriving (Eq,Ord,Generic)

instance Show Card where
  show (Card i) = show i


-- |Players are represented by a `String` identifying them. The game
--  will assume that all player names are different.
type Player = String


type Play = [Card]
type Deck = [Card]
type Hand = [Card]


-- |Games are represented by a list of players
data Game = Game
  { ranks    :: [Player]
  , active   :: [Player]
  , finished :: [Player]
  , hands    :: Map Player [Card]
  , plays    :: [(Player, Play)]
  , allPass  :: Bool
  }
  deriving (Show,Generic)


-- |Given a player and a map of hands, compute the map of hands which
--  only returns the cards for the given player, and returns hands
--  filled with 0s for the other players (because the number of cards
--  in hand is public information).
playerView :: Player -> Game -> Game
playerView player1 game@Game{..} = game { hands = helper hands }
  where
    helper :: Map Player [Card] -> Map Player [Card]
    helper = M.mapWithKey (\player2 -> if player1 == player2 then id else map (const (Card 0)))


-- |Given a game, return the number of finished players.
numberOfFinishedPlayers :: Game -> Int
numberOfFinishedPlayers game = length (finished game)


-- |Given a game, return the number of active players.
numberOfActivePlayers :: Game -> Int
numberOfActivePlayers game = length (active game)


-- |Given a play, determine if it is a pass.
isPass :: Play -> Bool
isPass = null


-- |Given a card, determine if it's a joker (13).
isJoker :: Card -> Bool
isJoker (Card n) = n == 13


-- |Given a play, calculate the value of the play. The value of a
--  pass is 0. Precondition: the play is sorted in ascending order.
valueOf :: Play -> Int
valueOf []           = 0
valueOf (Card c : _) = c


-- |Given a game, return the lastest play that was not a pass, and
--  the player who made it.
--  Warning: partial function, will fail for any list which is empty,
--  or solely made up out of passes. Check that the first play is an
--  actual play (i.e. pass is not a legal move for the first play).
mostRecentPlay :: Game -> (Player, Play)
mostRecentPlay game = case dropWhile (isPass . snd) (plays game) of
  []     -> last (plays game)
  (x:xs) -> x


findPlay :: Game -> Maybe (Player, Play)
findPlay Game{..} = case dropWhile (isPass . snd) plays of
  []         -> Nothing
  (play : _) -> Just play



-- * Utility functions


-- |Given a predicate, a monadic action and an initial value, perform
--  the action on the value iteratively until the predicate holds.
untilM :: (Monad m) => (a -> Bool) -> (a -> m a) -> a -> m a
untilM p f = go
  where
    go x | p x       = return x
         | otherwise = f x >>= go


-- |Given an element and a list, cycle the list until said element is
--  at the front of the list. Precondition: given element must occur
--  in given list.
cycleUntil :: (Eq a) => a -> [a] -> [a]
cycleUntil x xs = go xs []
  where
    go [      ] acc
                  = reverse acc
    go (y : ys) acc
      | x == y    = (x : ys ++ reverse acc)
      | otherwise = go ys (y : acc)


-- |Given a list, determine if all elements in it are equal.
allEqual :: (Eq a) => [a] -> Bool
allEqual [] = True
allEqual (x : xs) = all (== x) xs


-- |Given a list, return a randomly shuffled version of that list.
shuffle :: RandomGen g => [a] -> Rand g [a]
shuffle xs = do
    let l = length xs
    rands <- take l `fmap` getRandomRs (0, l-1)
    let ar = A.runSTArray $ do
               ar <- A.thawSTArray $ A.listArray (0, l-1) xs
               forM_ (zip [0..(l-1)] rands) $ \(i, j) -> do
                 vi <- A.readSTArray ar i
                 vj <- A.readSTArray ar j
                 A.writeSTArray ar j vi
                 A.writeSTArray ar i vj
               return ar
    return (A.elems ar)




-- * JavaScript integration

announce :: Message -> IO ()
#ifdef __GHCJS__
announce msg = _announce =<< toJSVal_aeson msg
#else
announce = print
#endif

#ifdef __GHCJS__
foreign import javascript unsafe "window.__main__ = $1"
  _provideMain :: Callback a -> IO ()

foreign import javascript unsafe "window.allPlays = $1"
  _provideAllPlays :: Callback a -> IO ()

foreign import javascript unsafe "window.playWorstCards = $1"
  _providePlayWorstCards :: Callback a -> IO ()

foreign import javascript unsafe "window.playBestCards = $1"
  _providePlayBestCards :: Callback a -> IO ()

foreign import javascript unsafe "window.giveWorstCards = $1"
  _provideGiveWorstCards :: Callback a -> IO ()

foreign import javascript unsafe "window.giveBestCards = $1"
  _provideGiveBestCards :: Callback a -> IO ()

foreign import javascript unsafe "window.players = $1"
  _setPlayers :: JSVal -> IO ()

foreign import javascript unsafe "window.players"
  _getPlayers :: IO JSVal

foreign import javascript unsafe "play($1,$2)"
  _runPlay :: JSString -> JSVal -> IO JSVal

foreign import javascript unsafe "give($1,$2,$3)"
  _runGive :: JSString -> JSVal -> JSVal -> IO JSVal

foreign import javascript unsafe "revolt($1,$2,$3)"
  _runRevolt  :: JSString -> JSVal -> JSVal -> IO JSVal

foreign import javascript unsafe "announce($1)"
  _announce :: JSVal -> IO ()

instance ToJSON Card
instance ToJSON Game
instance ToJSON Message
instance FromJSON Card
instance FromJSON Game

main :: IO ()
main = do
  _provideAllPlays       =<< syncCallback2' allPlays'
  _providePlayWorstCards =<< syncCallback1' playWorstCards'
  _providePlayBestCards  =<< syncCallback1' playBestCards'
  _provideGiveWorstCards =<< syncCallback2' giveWorstCards'
  _provideGiveBestCards  =<< syncCallback2' giveBestCards'
  _provideMain           =<< syncCallback'  playGameWithTaxation'

playGameWithTaxation' :: IO JSVal
playGameWithTaxation' = do
  players <- _getPlayers
  Just players <- fromJSVal players
  case fromJSON players of
    Error   msg     -> error msg
    Success players -> do
      players <- playGameWithTaxation . map (id &&& getAI) $ players
      players <- toJSVal_aeson players
      _setPlayers players
      return players

getAI :: Player -> AI
getAI player = AI
  { runPlay = \game -> do
      play <- _runPlay (pack player) =<< toJSVal_aeson game
      Just play <- fromJSVal play
      case fromJSON play of
        Error   msg  -> error msg
        Success play -> return play
  , runGive = \n hand -> do
      n    <- toJSVal n
      hand <- toJSVal_aeson hand
      give <- _runGive (pack player) n hand
      Just give <- fromJSVal give
      case fromJSON give of
        Error   msg  -> error msg
        Success give -> return give
  , runRevolt  = \n hand -> do
      n      <- toJSVal n
      hand   <- toJSVal_aeson hand
      revolt <- _runRevolt (pack player) n hand
      Just revolt <- fromJSVal revolt
      case fromJSON revolt of
        Error   msg    -> error msg
        Success revolt -> return revolt
  }

allPlays' :: JSVal -> JSVal -> IO JSVal
allPlays' allowSplit game = do
  Just allowSplit <- fromJSVal allowSplit
  Just game       <- fromJSVal game
  case fromJSON allowSplit of
    Error   msg        -> error msg
    Success allowSplit ->
      case fromJSON game of
        Error   msg  -> error msg
        Success game -> toJSVal_aeson (allPlays allowSplit game)

playWorstCards' :: JSVal -> IO JSVal
playWorstCards' game = do
  Just game <- fromJSVal game
  case fromJSON game of
    Error   msg  -> error msg
    Success game -> toJSVal_aeson (playWorstCards game)

playBestCards' :: JSVal -> IO JSVal
playBestCards' game = do
  Just game <- fromJSVal game
  case fromJSON game of
    Error   msg  -> error msg
    Success game -> toJSVal_aeson (playBestCards game)

giveWorstCards' :: JSVal -> JSVal -> IO JSVal
giveWorstCards' n hand = do
  Just n    <- fromJSVal n
  Just hand <- fromJSVal hand
  case fromJSON hand of
    Error   msg  -> error msg
    Success hand -> toJSVal_aeson (giveWorstCards n hand)

giveBestCards' :: JSVal -> JSVal -> IO JSVal
giveBestCards' n hand = do
  Just n    <- fromJSVal n
  Just hand <- fromJSVal hand
  case fromJSON hand of
    Error   msg  -> error msg
    Success hand -> toJSVal_aeson (giveBestCards n hand)

#else
main :: IO ()
main = playGameWithTaxation defaultPlayers >>= print
#endif
