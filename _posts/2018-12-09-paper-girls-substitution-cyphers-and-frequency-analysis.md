---
title      : "Paper Girls, Substitution Ciphers, and Frequency Analysis"
date       : 2018-12-09 12:00:00
categories : [compling]
tags       : [comics, cryptography, linguistics]
---

<span style="font-family:PaperGirls;font-size:large;">
THIS WEEKEND, I PICKED UP A COPY OF PAPER GIRLS, A MYSTERY/SCIENCE FICTION COMIC ABOUT FOUR GIRLS ON A PAPER ROUTE.
WAIT, CAN YOU UNDERSTAND ME?
OH, FUCK, IT DOESN'T LOOK LIKE IT.
SORRY, LET ME ADJUST.
</span>

Ah, I'm so sorry, is this any better? Once again, so sorry, I think I've been reading this stuff for too long, think I got carried away... Anyway, I'll take it from the start. So this weekend, I picked up a copy of *[Paper Girls][papergirls]*, a mystery/science fiction comic about four girls on a paper route...

![]({{ site.baseurl }}/assets/images/PaperGirls_1.jpg)

It starts simple. Our four heroes band together to deliver papers on Halloween morning. But it quickly escalates. Testament to this fact, thirty-five pages in we meet three time traveling teenagers, wrapped in black bandages, speaking in *these things*...

![]({{ site.baseurl }}/assets/images/PaperGirls_2.png)

These glyphs are used for the rest of the book, and---best I can tell---the rest of the series without any real explanation... which leaves me with the following question: 

> What in fuck's name are they saying?

Wanna guess what today's topic is? Yep. Welcome to my class, "Help! These letters are all funky! (Part 1, Substitution Ciphers)".

Now, I've done this before. Several years ago, I was given a copy of *[Johnny 23][johnny23]* by Charles Burns which is, euh, a book put together using panels from *[X'ed Out][xedout]*, with an entirely new "story" written in strange glyphs... Sound, well, semi-familiar at least?

![]({{ site.baseurl }}/assets/images/XedOut.jpg)

It turns out that what Charles had done was basically a substitution cipher---you make up one crazy glyph for each letter of the alphabet, and then instead of writing letters from the alphabet, you use the alien glyphs you came up with...

Honestly, there's some pretty good reasons to assume that *Paper Girls* does the same. Substitution ciphers are really easy to come up with---you basically have to come up with one weird glyph for ever letter in your alphabet. Plus, they get the job done! At least, it's pretty clear to me that our time traveling teenagers are speaking some arcane language!

Substitution ciphers are pretty easy to solve, but compare that more complex ciphers. We could have the cipher evolve over time, say, shift those sinister glyphs by one every time we turn a page. But... do the characters know what page they're on? Could you speak a language where the sounds you make to say, say *chair*, change every few minutes? 

And actual cryptographic ciphers? We might as well be putting random noise on the page! There's no way any reader would crack anything like that, and no way any human could actually speak, say, [RSA-encrypted][rsa] English.

*"So how do I crack this stuff?!"*, you cry out in frustration. Right, good point.

# How do I crack this stuff?

<div class="language-python highlighter-rouge">
<div class="highlight">
<pre class="highlight">
<code><span class="n">data</span> <span class="o">=</span> <span class="p">[</span>
    <span class="s" style="font-family:PaperGirls;font-size:large;">"GODDAMNIT.",</span>
    <span class="s" style="font-family:PaperGirls;font-size:large;">"SPLIT UP. WE'Ll MEeT AT THE SECOND FOLDING.",</span>
    <span class="s" style="font-family:PaperGirls;font-size:large;">"STAY AWAY FROM ME!",</span>
    <span class="s" style="font-family:PaperGirls;font-size:large;">"STOP!",</span>
    <span class="s" style="font-family:PaperGirls;font-size:large;">"PLEASE!",</span>
    <span class="s" style="font-family:PaperGirls;font-size:large;">"YOURE GOING TO GET YOURSELVES KILlED!",</span>
    <span class="s" style="font-family:PaperGirls;font-size:large;">"YOU PEOPLE ARE OUT OF YOUR",</span>
    <span class="s" style="font-family:PaperGirls;font-size:large;">"NO",</span>
    <span class="s">...</span>
<span class="p">]</span></code>
</pre>
</div>
</div>


  
[papergirls]: https://imagecomics.com/comics/releases/paper-girls-1
[johnny23]: https://www.goodreads.com/book/show/11161195-johnny-23
[xedout]: https://www.goodreads.com/book/show/7814774-x-ed-out
[rsa]: https://en.wikipedia.org/wiki/RSA_(cryptosystem)
