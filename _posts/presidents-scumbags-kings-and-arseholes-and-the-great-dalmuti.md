---
title        : "Presidents, Scumbags, Kings and Arseholes, and The Great Dalmuti"
date         : 2016-03-31 12:00:00
categories   : []
tags         : [haskell, javascript]
extra-script : dalmuti-extra-script.html
extra-style  : dalmuti-extra-style.html
---

One of my favourite games is [The Great Dalmuti][BoardGameGeek]. It's
a variant of a widely-played card game with many, many names:
President, Scumbag, Kings and Arseholes. Each of these may have
*slightly* different rules, and *slightly* different decks, but they
all share one thing---a lesson:

> Regardless of skill, the wealthy stay wealthy, the poor stay poor.

I've played many variants of this game, but there is something
pleasing about the deck The Great Dalmuti uses which keeps drawing
me it. Plus, I own a copy of it, so why not?

<div id="tabs">
  <ul>
    <span id="runmain">Run</span>
  </ul>
</div>

Some words in between.

``` javascript
{
    play : function(player,game) {
        var hand = JSON.stringify(game.hands[player]);
        var play = JSON.stringify(playWorstCards(game));
        var text = prompt("Your hand is "+hand+".\nWhat would you like to play?",play);
        return (text === null) ? [] : JSON.parse(text);
    },
    give : function (player,n,hand) {
        var give = JSON.stringify(giveWorstCards(n,hand));
        var text = prompt("Your hand is "+hand+".\nWhat would you like to give?",give);
        return (text === null) ? [] : JSON.parse(text);
    }
}
```

Some words after.

---

[BoardGameGeek]: https://boardgamegeek.com/boardgame/929/great-dalmuti
