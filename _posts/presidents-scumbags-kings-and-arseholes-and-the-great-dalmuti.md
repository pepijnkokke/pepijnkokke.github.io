---
title        : "Presidents, Scumbags, Kings and Arseholes, and The Great Dalmuti"
date         : 2016-03-31 12:00:00
categories   : []
tags         : [haskell, javascript]
extra-script : dalmuti-extra-script.html
extra-style  : dalmuti-extra-style.html
---

One of my favourite card games is [The Great Dalmuti][BoardGameGeek].
It's  a variant of a widely-played card game with many, many names:
President, Scumbag, Kings and Arseholes. Each of these may have
*slightly* different rules, and *slightly* different decks, but they
are all more or less the same game.

I've had a bunch of discussions about this game over the years, most
of which were about the possible strategies. Personally, I don't
believe that this game is all that hard to play well---and
consequently, that it isn't all that hard to write an AI for it.
Therefore, I thought I'd write a little playground for AIs to play
in. I'll get back to that later in this post, though if you're
familiar with the game, you may as well
[skip the next section](#an-ai-playground).


## The Rules

Before I get that that, though, it's probably prudent to at least
briefly talk about the game. The rules of the game are fairly simple,
so I'll summarise them here:

  - **Rank**: Each player has a rank, with the top ranks usually called
    something like "president" and "vice president", and the lower
    ranks called something like "scumbag" and, well, "vice scumbag";
  - **Setup**: To start the game, *all the cards* in the deck are distributed
    evenly amongst the players; the highest ranking player then starts
    the first round;
  - **Rounds**: Starting with the player who starts that round
    (obviously) each player either plays some cards or passes, with
    the turn passing to the next in rank (after the lowest rank, the
    turn passes to the highest in rank);
  - **Legal Plays**: For any play, it is legal if:
      * it is the first play, and the cards are all identical in
        number; or
      * there are previous plays, the new play has the same number of
        cards as the previous plays, and all of the cards in the play
        are the identical in number and strictly "better" than those
        of the previous play.
  - **Winning the Round**: Once there is an entire round of passes,
    the player who was the last to play cards wins the round, and
    starts the next one;
  - **Winning the Game**: The goal is for players to get rid of all of
    their cards as fast as possible. The order in which they do so,
    determines their ranks in the next game, going from high to low.

Each variant of the game adds their own rules to this, but this much
is shared more or less by all of them. Note that I haven't said
anything about what cards there are in the deck---this is because
every variant has different rules about what cards there are in a
deck, and which is "better" than which other.
I've played many variants of this game, but there's just something
pleasing about the deck The Great Dalmuti uses---one one, two
twos, three threes, up to twelve twelves---plus, I own a copy of
it, so why not use it as an example?
Anyway, The Great Dalmuti adds the following rules:

  - **Deck**: It uses the deck outlined above (with one one, two twos,
    three threes, up to twelve twelves). Confusingly, the lower cards
    are "better", so a `1` is better than a `5`, which in turn is
    better than a `12`;
  - **Jokers**: There are two jokers, which are counted as a `13` when
    played by themselves. However, they can be used to complete any
    set. For instance, `[3,13,13]` is a legal set of three threes;
  - **Taxation**: Before the game starts, there is a
    "taxation". During taxation, The lowest ranking player gives their
    two *best* cards to the highest ranking player, and gets any two
    cards in return. The second lowest and second highest player
    exchange a *single card* in a similar manner;
  - **Revolution**: Before the taxation, there is a check. If any
    player has *both* jokers in their hand, they may cry "Revolution!"
    If this happens, the taxation phase is skipped; if the lowest
    ranking player cries "Revolution!", instead of skipping the
    taxation, there is an actual revolution---the lowest ranking
    player changes places with the highest ranking player, and the
    second lowest ranking player changes places with the second
    highest ranking player.


### An AI Playground

Personally, I think I'd be quite easy to implement an AI which can
competently play The Great Dalmuti. A simple, rule-based AI should
already do quite well. As a first step in demonstrating this, I've
written a small playground where AIs can compete with one another.
Below, you should see a number of tabs, the first of which is labelled
'Console'. In it, there should be a button that looks like this: <span
class="runmain">&#9654;</span>. If you click it, the AIs in the other
tabs will be pitted against one another in a game of The Great Dalmuti.
Try it!

<div id="tabs">
  <ul>
  </ul>
  <span class="runmain">&#9654;</span>
</div>
<div id="tabs-noscript">
  <img alt="Screenshot of UI of embedded The Great Dalmuti after an example run." src="{{ "/images/dalmuti-example.png" | prepend: site.baseurl }}" />
</div>

Some words in between.

``` javascript
{
    play : function(player,game) {
        var hand = JSON.stringify(game.hands[player]);
        var play = JSON.stringify(playWorstCards(game));
        var text = prompt("Your hand is "+hand+".\n"
                          + "What would you like to play?",play);
        return (text === null) ? [] : JSON.parse(text);
    },
    give : function (player,n,hand) {
        var give = JSON.stringify(giveWorstCards(n,hand));
        var text = prompt("Your hand is "+hand+".\n"
                          + "What would you like to give?",give);
        return (text === null) ? [] : JSON.parse(text);
    }
}
```

Some words after.

---

[BoardGameGeek]: https://boardgamegeek.com/boardgame/929/great-dalmuti
