---
title : "Neural Networks with Cube Cats"
date  : 2020-09-10 12:00:00
tags  : [neural networks]
---

Neural Networks. They’re, uh, pretty pervasive by know, so you’ve probably heard of them, telling you which of your friends is in that picture, and that they know what you wanna text better than you do. But what do they know? Do they know things? *Let’s find out!*

So uh, it’s kinda important that we talk about *discrete* versus *continuous* things first, but I checked Wikipedia, and it just told me that *discrete* things are things that aren’t continuous. So far duh. But that’s not super helpful, so I guess I’ll have a crack at it.

## Cubes and Blobs

*Discrete* things are neatly separated. You’ve got your cat cube over here, and your dog cube over there, and the two can meet, that’s fine, but they’re separate things.

<div style="text-align:center;">
<img style="width:7.5em; margin-right:5em;" src="{{ site.baseurl }}/assets/images/cube-cat.png" />
<img style="width:7.5em;" src="{{ site.baseurl }}/assets/images/cube-dog.png" />
</div>

Programmers are really good at telling computers how to solve problems that deal with discrete things. “Got three cat cubes, and you wanna have them in a line from big to small? Sure! Computer, just swap the bigger ones to one side ’til it looks right.”

<div style="text-align:center;">
<img style="width:10em; margin-right:1em;" src="{{ site.baseurl }}/assets/images/cube-cat.png" />
<img style="width:7.5em; margin-bottom:1em; margin-right:1em;" src="{{ site.baseurl }}/assets/images/cube-cat.png" />
<img style="width:5em; margin-bottom:2em;" src="{{ site.baseurl }}/assets/images/cube-cat.png" />
</div>

*Continuous* things are all blobby… Imagine your cat cube and your dog cube melting together in an adorable blob of hug. It’s hard to tell where the cat part of the blob ends and the dog part of the blob starts. It’s just *one massive blob of catdog*.

<div style="text-align:center;">
<img style="width:15em; margin-right:1em;" src="{{ site.baseurl }}/assets/images/blob-of-catdog.png" />
</div>

When our cube pets melted, we lost something. We lost the *distinction*, the fact that cat cube and dog cube were two separate things, and we knew what was part of cat cube and what was part of dog cube. Sure, there’s bits of it where you’re like “Well, surely *this* bit is dog!”, but are you sure about *all the bits?* That’s a very different kind of problem from what we had before! It’s a *classification problem!*


## Pictures of Cats, Dogs, and Non-Dogs
