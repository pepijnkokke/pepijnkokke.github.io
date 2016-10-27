---
title        : "Lit and Unlit"
date         : 2016-10-27 12:00:00
categories   : []
tags         : [haskell]
---

> {-# LANGUAGE OverloadedStrings #-}
> import Control.Arrow (first,second)
> import Data.Char (isSpace)
> import Data.Text (Text)
> import qualified Data.Text as T
> import qualified Data.Text.IO as T

> main :: IO ()
> main = T.interact unlit

> unlit :: Text -> Text
> unlit text =
>   let (ts,cs)   = enter text
>       toSpace c = if isSpace c then c else ' '
>       ts'       = [ T.map toSpace t | t <- ts ]
>   in  T.concat (merge ts' cs)

> merge :: [a] -> [a] -> [a]
> merge [] ys = ys
> merge (x:xs) ys = x : (merge ys xs)

> enter :: Text -> ([Text],[Text])
> enter text
>   | T.null text = ([],[])
>   | otherwise   =
>   let (t, rest) = T.breakOn openTag text
>       (ts, cs)  = leave (T.drop (T.length openTag) rest)
>   in  (T.append t openTag : ts, cs)
>
> leave :: Text -> ([Text],[Text])
> leave text =
>   let (c,rest) = T.breakOn closeTag text
>       (ts,cs)  = enter rest
>   in  (ts,c:cs)

> openTag, closeTag :: Text
> openTag  = "``` haskell\n"
> closeTag = "```\n"
