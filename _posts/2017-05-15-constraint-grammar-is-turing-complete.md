---
title      : "Constraint Grammar is Turing Complete"
date       : 2017-05-15 12:00:00
categories : [compling]
tags       : [constraint grammar]
---

This post is a continuation of *[Constraint Grammar can count!]({% post_url 2016-03-16-constraint-grammar-can-count %})*, in which I talked about the expressiveness of constraint grammar. 
Now, for most of that post, whenever I said "constraint grammar" I actually meant the fragment which only uses the `REMOVE` rule, with a few concessions here and there. The reason for this is that the full version of VISL CG-3 has commands such as `EXTERNAL`, which allow you to call any other program. This obviously simplifies the question of expressiveness---can we simulate a Turing machine? Yes, by calling a Turing machine. 
However, I always had the suspicion that I'd be pretty easy to simulate a Turing machine using only the `ADDCOHORT` and `REMCOHORT` commands, treating the list of cohorts as the Turing machine's tape---and I don't think I was the only one to harbour such suspicions. 
If we had such a program, this would prove that using only the `ADDCOHORT` and `REMCOHORT` commands, VISL CG-3 is Turing complete---given that the VISL CG-3 implementation itself is a pretty decent proof that we can run constraint grammars on a Turing machine. 
So last week I decided to finally work out the details. Turns out, it is.

For this post, we'll encode the first Turing machine program I could find as a constraint grammar using only `ADDCOHORT` and `REMCOHORT`[^add], and explain the general principle as we go. But first, I should probably briefly go over how a Turing machine works---though I hope you'll forgive me if I'm a little informal. If you don't want to read through a whole bunch about Turing machines, it's probably best to skip right to [the meat](#constraint-grammar-turing-machines).


# So what's this Turing machine business?

A Turing machine is a tiny machine, which sits whirring away on top of an infinite roll of tape. It has a reading head, a writing head---both hoovering over the same cell of the tape---and a tiny bit of memory---a single number which tells it what "state" it's in, basically a way to remember what it was doing. It was never supposed to be built, but of course someone did: 

![An actual Turing machine.](https://upload.wikimedia.org/wikipedia/commons/a/ad/Model_of_a_Turing_machine.jpg)

Many people did, actually. Out of everything from [wood and scrap metal](https://www.newscientist.com/blogs/nstv/2011/03/turing-machine-built-from-wood-and-scrap-metal.html), to [Legos](http://www.legoturingmachine.org/lego-turing-machine/), to [artificial muscle](http://dx.doi.org/10.1063/1.4793648).

Anyway, every Turing machine has a table, which contains its program. At every step, the Turing machine will use its reading head to read the cell it's hoovering over, and check it's memory to see what state it's in, and look those two things up in its table. The table will then tell it what to write---overwriting whatever it just read---what its next state should be, and whether to move the tape one cell to the left or one cell to the right. It'll do this until it enters its stop state. Then---if ever---it stops.

As an example, the first search result for "Turing machine example program" is a machine which increments binary numbers, and it's table looks like this:

![Transition function for a Turing machine which computes the binary successor.]({{ "/images/BitSuccTM.png" | prepend: site.baseurl }})
(Taken from <https://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/turing-machine/four.html>.)

These programs are a little hard to read, so let's go over what the Turing machine will be doing at each of these states. 

The machine expects the input number---the one we want to increment---to be written on the tape at the beginning of the program. However, we don't promise the head of the Turing machine will be pointing right at the beginning of the number. Therefore, state 0 is there to ensure that if we start with the head somewhere in the middle of the number, we move the head left to the beginning. Once we move past the number into blank space, we go to state 1 and move right once back to the beginning of the number. 

If you look at the entries for state 2, you see that this does much the same as state 0. Once we've incremented the number---because we want to be nice and well-behaved---we move the head right back to the beginning of the number before stopping.

So that means all the real work is done in state 1. What this state does is move the head progressively to the right, overwriting every 1 with a 0, until it reads either a 0 or a blank space. This last one it changes to a 1. A brief check will tell you this increments the number---keeping in mind that these are written from left-to-right instead of the usual right-to-left. For instance, below is the trace for incrementing 11 to 12, writing an `H` before the cell that the machine is currently reading:

``` python
H "1"   "1"   "0"   "1" # state 0: move to front, state 1
H "1"   "1"   "0"   "1" # state 1: read 1, write 0, state 1
  "0" H "1"   "0"   "1" # state 1: read 1, write 0, state 1
  "0"   "0" H "0"   "1" # state 1: read 0, write 1, state 2
  "0"   "0"   "1" H "1" # state 2: move to front, stop
H "0"   "0"   "1"   "1"
```

Great! So now we've got that out of the way, let's have a look at implementing this machine in VISL CG-3, because why not?


# Constraint Grammar Turing Machines

We're going to represent the Turing machine's tape as a list of cohorts. This means that when we pass in the number 11, we pass VISL CG-3 the following text:

``` python
"<Cell>" "1"
"<Cell>" "1"
"<Cell>" "0"
"<Cell>" "1"
```

We will take a cue from the nice infix notation we used above, and write the current state to the tape, right before the cell which the head is currently on. For instance, the third row in the execution trace above would be written as:

``` python
"<Cell>" "0"
"<State>" "State1"
"<Cell>" "1"
"<Cell>" "0"
"<Cell>" "1"
```

To start off, our constraint grammar will add a cohort for the start state. It'll add it right before the first cell of our input. This kind-of makes the whole of state 0 superfluous, but we'll keep it anyway, for good form:

``` python
BEFORE-SECTIONS
ADDCOHORT ("<State>" "State0") BEFORE ("<Cell>") IF (-1 (>>>));
```

Now the meat. We will encode the program of our Turing machine. This is a recursive specification, we we'll need to wrap it in a `SECTION`. First, we mark the current state cohort and the cell we're reading as old:

``` python
ADD ("<State>" "OLD") ("<State>");
ADD ("<Cell>" "OLD") ("<Cell>") IF (-1 ("<State>" "OLD"));
```

I realise that these are `ADD` commands, and I promised to only use `ADDCOHORT` and `REMCOHORT`, but hear me out. We can simulate this usage of `ADD` by adding a cohort `"<Old>"` *after* the cohort we're marking. However, every time we now select a cohort using e.g. `("<Cell>" "OLD")`, we'd have to change this to `(0 ("<Cell>") LINK 1 ("<Old>"))`... and we'd have to take into account the expected number of `"<Old>"` cohorts, and move every selection by that. Anyway, it wouldn't be pretty. So please allow me this one thing.

Ok. Back to our scheduled program. Once we've marked our old state cohort and the cell we're reading as old, we can introduce new ones. We will compile every single entry in the Turing machine's program to *two* rules. One which introduces the next state, and one which writes a new cell to replace the old one. For instance, the rule which says that "if we are in state 1, and we read a 1, then we write a 0, move the tape to the right, and continue in state 1," is compiled to the following two rules:

``` python
ADDCOHORT ("<State>" "State1")
   BEFORE ("<Cell>")
       IF (-2 ("<State>" "State1" "OLD") LINK
            1 ("<Cell>" "1" "OLD"));
ADDCOHORT ("<Cell>" "0")
    AFTER ("<Cell>" "1" "OLD")
       IF (-1 ("<State>" "State1" "OLD"));
```

And the rule which says that "if we are in state 1, and we read a blank, then we write a 1, move the tape to the left, and change to state 2" is compiled to the following two rules:

``` python
ADDCOHORT ("<State>" "State2")
   BEFORE ("<Cell>")
       IF (1 ("<State>" "State1" "OLD") LINK
           1 ("<Cell>" "_" "OLD"));
ADDCOHORT ("<Cell>" "1")
    AFTER ("<Cell>" "_" "OLD")
       IF (-1 ("<State>" "State1" "OLD"));
```

In both pairs, the first rule inserts the next state in the appropriate place, and the second rule inserts the newly written cell after the one marked as old.

After all these rules---of which at most one pair will match, because we check for both the state and the cell marked as old---we clean up, simply removing every cohort marked as old:

``` python
REMCOHORT ("<State>" "OLD");
REMCOHORT ("<Cell>" "OLD");
```

This cycle of marking as old, applying the transitions, and removing the old cohorts will repeat until there are no further changes. Since there are no transitions which match on a stop state, the repetitions will stop here, and the stop state will be marked as old and removed.

Finally, because moving the head back to the start of the number is rather pointless in this implementation, we have a final cleanup step. We remove any leading or trailing blank cells:

``` python
AFTER-SECTIONS
REMCOHORT ("<Cell>" "_") IF (NOT -1* SYMB);
REMCOHORT ("<Cell>" "_") IF (NOT  1* SYMB);
```

Hooray! We've implemented a Turing machine! Or have we? There's one tiny issue with the above implementation. Our little Turing machine sits whirring on top of an *infinite* amount of tape. Here, our implementation only ever writes to cells which were already filled in the input. This means we've actually been implementing a linear bounded automaton all this time---i.e. we've proven that `ADDCOHORT` and `REMCOHORT` cover at least the context-sensitive languages! But really, we'd like to be able to simulate Turing machines, so...

There is a simple way to extend this framework to Turing machines. We add two rules, *right* at the start of the `SECTION`, which simply add more blank cells to the edges of the tape whenever the head gets too close:

``` python
ADDCOHORT ("<Cell>" "_")
   BEFORE ("<State>")
       IF (-1 (>>>));
ADDCOHORT ("<Cell>" "_")
    AFTER ("<Cell>")
       IF (0 (<<<) LINK -1 ("<State>"));
```

The first of these rules adds a blank cell at the beginning if the state cohort is the *first* cohort. The second adds a blank cell at the end if the state cohort is the second-to-last cohort---because, remember, we are reading the cell right after the cohort.

Of course I implemented all of this in a small Haskell library. There's an implementation of Turing machines in Haskell, an implementation the example Turing machine---the binary successor function---and a set of QuickCheck functions which compare Haskell's `(+1)` to the evaluation of the Turing machine in my code and the evaluation of the *compiled* Turing machine in VISL CG-3. If you want to have a go, the library is available [on my Github](https://github.com/pepijnkokke/cgtm), and you can get VISL CG-3 [here](http://beta.visl.sdu.dk/cg3/chunked/installation.html).

---

[^add]: Well, those and the `ADD` command---we can theoretically encode our use of `ADD` with `ADDCOHORT`, but it really doesn't get any prettier if we do so.
