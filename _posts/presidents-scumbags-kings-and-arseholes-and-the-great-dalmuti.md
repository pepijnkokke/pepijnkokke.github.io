---
title        : "Presidents, Scumbags, Kings and Arseholes, and The Great Dalmuti"
date         : 2016-03-31 12:00:00
categories   : []
tags         : [haskell, javascript]
extra-script : dalmuti-extra-script.html
extra-style  : dalmuti-extra-style.html
---

Some words before.

<div id="tabs">
  <ul>
    <span id="runmain">Run</span>
  </ul>
</div>

Some words in between.

``` javascript
var hand = JSON.stringify(game.hands[player]);
var play = JSON.stringify(playWorstCards(game));
var text = prompt("Your hand is "+hand+".\nWhat would you like to play?",play);
(text === null) ? [] : JSON.parse(text);
```

Some words after.
