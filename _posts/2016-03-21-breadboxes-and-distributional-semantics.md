---
title      : "Breadboxes, Plenty Questions and Distributional Semantics"
date       : 2016-03-20 12:00:00
categories : [python, compling]
tags       : [python, compling, distsem]
script     : 2016-03-21-breadboxes-and-distributional-semantics-script.html
style      : 2016-03-21-breadboxes-and-distributional-semantics-style.html
---

Quite a while ago, [UnicornPower][UnicornPower] introduced me to a
game called *Breadbox*. It's an experimental cousin of *20 Questions*,
also known as *Plenty Questions*, which is played by two players---or
more, really---who we'll name Allie and Blake:

 1. Allie thinks of something.
 2. As their first question, Blake asks *"Is it a breadbox?"*
 3. Allie---who, seeing the mandatory first question, obviously
    wouldn't choose a breadbox---answers *"No, it's not!"*

From there on out, all Blake's questions have to be of the form...

> Is it more like a *breadbox*, or more like...?

...where *breadbox* is replaced by whatever the current guess is, and
the dots are filled in with whatever Blake wants. For instance, a
quick game might look like this:

Allie
: I'm thinking of something...

Blake
: Is it a breadbox?

Allie
: No, it's not.

Blake
: Is it more like a breadbox or more like a dog?

Allie
: It's more like a dog...

Blake
: Is it more like a dog or more like a cat?

Allie
: It's more like a cat...

Blake
: Is it more like a cat or more like a unicorn?

Allie
: It's more like a cat...

Blake
: Is it more like a cat or more like a garden?

Allie
: It's more like a garden...

Blake
: Is it more like a garden or more like a house?

Allie
: It's more like a house...

Blake
: Is it more like a house or more like a friend?

Allie
: It's more like a friend...

Blake
: Is it more like a friend or more like a lover?

Allie
: It's more like a friend...

Blake
: Is it more like a friend or more like a relative?

Allie
: It's more like a friend...

Blake
: Is it more like a friend or more like a neighbour?

Allie
: That's exactly what I was thinking of!
{:.chat}

Since this game tends to bring out the... best in people, Blake might
just have to give up. After this, Allie may be called on to explain
what the word she chose even means:

Blake
: I give up... what was it?

Allie
: Reverberation!

Allie
: It's the repetition of a sound resulting from reflection of the sound waves!
{:.chat}

The game does a *fantastic* job of revealing how hierarchical people
tend to think. For instance, I would say that a dolphin is more like
an orca than it is like a mammal, *even though a dolphin isn't an
orca*. But while playing the game, I often find myself slipping into
hierarchical thinking: "Oh, it's not like an animal... so we can
exclude all animals."

It is exactly this---the fact that the game forces you to consider a
*total* order on your internal ontology, insofar as one exists---which
makes it so fascinating to play. I heartily recommend you <a
href="#breadbox">try it!</a>

---

In the summer of 2014, I took
[a course on distributional semantics][ESSLLI2014] taught by Marco
Baroni and Georgiana Dinu.... and the first thing I thought to do was
to use their dataset to implement an AI for Breadbox:

<div id="breadbox" class="breadbox-container">
  <div class="breadbox-console">
    <div class="breadbox-line breadbox-white">
    Welcome to Breadbox 1.0! Type 'help' for instructions, or simply start guessing!
    </div>
    <div class="breadbox-line">&nbsp;</div>
  </div>
  <div class="breadbox-bottom">
    <div class="breadbox-label">></div>
    <div id="breadbox-input"></div>
  </div>
</div>




---

[UnicornPower]: https://github.com/UnicornPower
[ESSLLI2014]: http://www.esslli2014.info/program/week-two/course-29
