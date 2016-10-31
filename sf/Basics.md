---
title         : "Basics: Functional Programming in Agda"
layout        : default
hide-implicit : false
extra-script  : agda-extra-script.html
extra-style   : agda-extra-style.html
---

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="224" class="Keyword"
      >module</a
      ><a name="230"
      > </a
      ><a name="231" href="Basics.html#1" class="Module"
      >Basics</a
      ><a name="237"
      > </a
      ><a name="238" class="Keyword"
      >where</a
      ><a name="243"
      >

  </a
      ><a name="247" class="Keyword"
      >open</a
      ><a name="251"
      > </a
      ><a name="252" class="Keyword"
      >import</a
      ><a name="258"
      > </a
      ><a name="259" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.html#1" class="Module"
      >Relation.Binary.PropositionalEquality</a
      ><a name="296"
      > </a
      ><a name="297" class="Keyword"
      >using</a
      ><a name="302"
      > </a
      ><a name="303" class="Symbol"
      >(</a
      ><a name="304" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >_&#8801;_</a
      ><a name="307" class="Symbol"
      >;</a
      ><a name="308"
      > </a
      ><a name="309" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="313" class="Symbol"
      >)</a
      >
{% endraw %}</pre>
</div>

# Basics: Functional Programming in Agda

The functional programming style brings programming closer to
simple, everyday mathematics: If a procedure or method has no side
effects, then (ignoring efficiency) all we need to understand
about it is how it maps inputs to outputs -- that is, we can think
of it as just a concrete method for computing a mathematical
function.  This is one sense of the word "functional" in
"functional programming."  The direct connection between programs
and simple mathematical objects supports both formal correctness
proofs and sound informal reasoning about program behavior.

The other sense in which functional programming is "functional" is
that it emphasizes the use of functions (or methods) as
*first-class* values -- i.e., values that can be passed as
arguments to other functions, returned as results, included in
data structures, etc.  The recognition that functions can be
treated as data in this way enables a host of useful and powerful
idioms.

Other common features of functional languages include *algebraic
data types* and *pattern matching*, which make it easy to
construct and manipulate rich data structures, and sophisticated
*polymorphic type systems* supporting abstraction and code reuse.
Agda shares all of these features.

This chapter introduces the most essential elements of Agda.

## Enumerated Types

One unusual aspect of Agda is that its set of built-in
features is *extremely* small. For example, instead of providing
the usual palette of atomic data types (booleans, integers,
strings, etc.), Agda offers a powerful mechanism for defining new
data types from scratch, from which all these familiar types arise
as instances.

Naturally, the Agda distribution comes with an extensive standard
library providing definitions of booleans, numbers, and many
common data structures like lists and hash tables.  But there is
nothing magic or primitive about these library definitions.  To
illustrate this, we will explicitly recapitulate all the
definitions we need in this course, rather than just getting them
implicitly from the library.

To see how this definition mechanism works, let's start with a
very simple example.

### Days of the Week

The following declaration tells Agda that we are defining
a new set of data values -- a *type*.

<pre class="Agda">{% raw %}
  <a name="2654" class="Keyword"
      >data</a
      ><a name="2658"
      > </a
      ><a name="2659" href="Basics.html#2659" class="Datatype"
      >Day</a
      ><a name="2662"
      > </a
      ><a name="2663" class="Symbol"
      >:</a
      ><a name="2664"
      > </a
      ><a name="2665" class="PrimitiveType"
      >Set</a
      ><a name="2668"
      > </a
      ><a name="2669" class="Keyword"
      >where</a
      ><a name="2674"
      >
    </a
      ><a name="2679" href="Basics.html#2679" class="InductiveConstructor"
      >monday</a
      ><a name="2685"
      >    </a
      ><a name="2689" class="Symbol"
      >:</a
      ><a name="2690"
      > </a
      ><a name="2691" href="Basics.html#2659" class="Datatype"
      >Day</a
      ><a name="2694"
      >
    </a
      ><a name="2699" href="Basics.html#2699" class="InductiveConstructor"
      >tuesday</a
      ><a name="2706"
      >   </a
      ><a name="2709" class="Symbol"
      >:</a
      ><a name="2710"
      > </a
      ><a name="2711" href="Basics.html#2659" class="Datatype"
      >Day</a
      ><a name="2714"
      >
    </a
      ><a name="2719" href="Basics.html#2719" class="InductiveConstructor"
      >wednesday</a
      ><a name="2728"
      > </a
      ><a name="2729" class="Symbol"
      >:</a
      ><a name="2730"
      > </a
      ><a name="2731" href="Basics.html#2659" class="Datatype"
      >Day</a
      ><a name="2734"
      >
    </a
      ><a name="2739" href="Basics.html#2739" class="InductiveConstructor"
      >thursday</a
      ><a name="2747"
      >  </a
      ><a name="2749" class="Symbol"
      >:</a
      ><a name="2750"
      > </a
      ><a name="2751" href="Basics.html#2659" class="Datatype"
      >Day</a
      ><a name="2754"
      >
    </a
      ><a name="2759" href="Basics.html#2759" class="InductiveConstructor"
      >friday</a
      ><a name="2765"
      >    </a
      ><a name="2769" class="Symbol"
      >:</a
      ><a name="2770"
      > </a
      ><a name="2771" href="Basics.html#2659" class="Datatype"
      >Day</a
      ><a name="2774"
      >
    </a
      ><a name="2779" href="Basics.html#2779" class="InductiveConstructor"
      >saturday</a
      ><a name="2787"
      >  </a
      ><a name="2789" class="Symbol"
      >:</a
      ><a name="2790"
      > </a
      ><a name="2791" href="Basics.html#2659" class="Datatype"
      >Day</a
      ><a name="2794"
      >
    </a
      ><a name="2799" href="Basics.html#2799" class="InductiveConstructor"
      >sunday</a
      ><a name="2805"
      >    </a
      ><a name="2809" class="Symbol"
      >:</a
      ><a name="2810"
      > </a
      ><a name="2811" href="Basics.html#2659" class="Datatype"
      >Day</a
      >
{% endraw %}</pre>

The type is called `day`, and its members are `monday`,
`tuesday`, etc.  The second and following lines of the definition
can be read "`monday` is a `day`, `tuesday` is a `day`, etc."

Having defined `day`, we can write functions that operate on
days.

<pre class="Agda">{% raw %}
  <a name="3095" href="Basics.html#3095" class="Function"
      >nextWeekday</a
      ><a name="3106"
      > </a
      ><a name="3107" class="Symbol"
      >:</a
      ><a name="3108"
      > </a
      ><a name="3109" href="Basics.html#2659" class="Datatype"
      >Day</a
      ><a name="3112"
      > </a
      ><a name="3113" class="Symbol"
      >-&gt;</a
      ><a name="3115"
      > </a
      ><a name="3116" href="Basics.html#2659" class="Datatype"
      >Day</a
      ><a name="3119"
      >
  </a
      ><a name="3122" href="Basics.html#3095" class="Function"
      >nextWeekday</a
      ><a name="3133"
      > </a
      ><a name="3134" href="Basics.html#2679" class="InductiveConstructor"
      >monday</a
      ><a name="3140"
      >    </a
      ><a name="3144" class="Symbol"
      >=</a
      ><a name="3145"
      > </a
      ><a name="3146" href="Basics.html#2699" class="InductiveConstructor"
      >tuesday</a
      ><a name="3153"
      >
  </a
      ><a name="3156" href="Basics.html#3095" class="Function"
      >nextWeekday</a
      ><a name="3167"
      > </a
      ><a name="3168" href="Basics.html#2699" class="InductiveConstructor"
      >tuesday</a
      ><a name="3175"
      >   </a
      ><a name="3178" class="Symbol"
      >=</a
      ><a name="3179"
      > </a
      ><a name="3180" href="Basics.html#2719" class="InductiveConstructor"
      >wednesday</a
      ><a name="3189"
      >
  </a
      ><a name="3192" href="Basics.html#3095" class="Function"
      >nextWeekday</a
      ><a name="3203"
      > </a
      ><a name="3204" href="Basics.html#2719" class="InductiveConstructor"
      >wednesday</a
      ><a name="3213"
      > </a
      ><a name="3214" class="Symbol"
      >=</a
      ><a name="3215"
      > </a
      ><a name="3216" href="Basics.html#2739" class="InductiveConstructor"
      >thursday</a
      ><a name="3224"
      >
  </a
      ><a name="3227" href="Basics.html#3095" class="Function"
      >nextWeekday</a
      ><a name="3238"
      > </a
      ><a name="3239" href="Basics.html#2739" class="InductiveConstructor"
      >thursday</a
      ><a name="3247"
      >  </a
      ><a name="3249" class="Symbol"
      >=</a
      ><a name="3250"
      > </a
      ><a name="3251" href="Basics.html#2759" class="InductiveConstructor"
      >friday</a
      ><a name="3257"
      >
  </a
      ><a name="3260" href="Basics.html#3095" class="Function"
      >nextWeekday</a
      ><a name="3271"
      > </a
      ><a name="3272" href="Basics.html#2759" class="InductiveConstructor"
      >friday</a
      ><a name="3278"
      >    </a
      ><a name="3282" class="Symbol"
      >=</a
      ><a name="3283"
      > </a
      ><a name="3284" href="Basics.html#2679" class="InductiveConstructor"
      >monday</a
      ><a name="3290"
      >
  </a
      ><a name="3293" href="Basics.html#3095" class="Function"
      >nextWeekday</a
      ><a name="3304"
      > </a
      ><a name="3305" href="Basics.html#2779" class="InductiveConstructor"
      >saturday</a
      ><a name="3313"
      >  </a
      ><a name="3315" class="Symbol"
      >=</a
      ><a name="3316"
      > </a
      ><a name="3317" href="Basics.html#2679" class="InductiveConstructor"
      >monday</a
      ><a name="3323"
      >
  </a
      ><a name="3326" href="Basics.html#3095" class="Function"
      >nextWeekday</a
      ><a name="3337"
      > </a
      ><a name="3338" href="Basics.html#2799" class="InductiveConstructor"
      >sunday</a
      ><a name="3344"
      >    </a
      ><a name="3348" class="Symbol"
      >=</a
      ><a name="3349"
      > </a
      ><a name="3350" href="Basics.html#2679" class="InductiveConstructor"
      >monday</a
      >
{% endraw %}</pre>

One thing to note is that the argument and return types of
this function are explicitly declared.  Like most functional
programming languages, Agda can often figure out these types for
itself when they are not given explicitly -- i.e., it performs
*type inference* -- but we'll include them to make reading
easier.

Having defined a function, we should check that it works on
some examples. There are actually three different ways to do this
in Agda.

First, we can use the Emacs command `C-c C-n` to evaluate a
compound expression involving `nextWeekday`. For instance, `nextWeekday
friday` should evaluate to `monday`. If you have a computer handy, this
would be an excellent moment to fire up Agda and try this for yourself.
Load this file, `Basics.lagda`, load it using `C-c C-l`, submit the
above example to Agda, and observe the result.

Second, we can record what we *expect* the result to be in the
form of an Agda type:

<pre class="Agda">{% raw %}
  <a name="4314" href="Basics.html#4314" class="Function Operator"
      >test_nextWeekday</a
      ><a name="4330"
      > </a
      ><a name="4331" class="Symbol"
      >:</a
      ><a name="4332"
      > </a
      ><a name="4333" href="Basics.html#3095" class="Function"
      >nextWeekday</a
      ><a name="4344"
      > </a
      ><a name="4345" class="Symbol"
      >(</a
      ><a name="4346" href="Basics.html#3095" class="Function"
      >nextWeekday</a
      ><a name="4357"
      > </a
      ><a name="4358" href="Basics.html#2779" class="InductiveConstructor"
      >saturday</a
      ><a name="4366" class="Symbol"
      >)</a
      ><a name="4367"
      > </a
      ><a name="4368" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="4369"
      > </a
      ><a name="4370" href="Basics.html#2699" class="InductiveConstructor"
      >tuesday</a
      >
{% endraw %}</pre>

This declaration does two things: it makes an assertion (that the second
weekday after `saturday` is `tuesday`), and it gives the assertion a name
that can be used to refer to it later.

Having made the assertion, we must also verify it. We do this by giving
a term of the above type:

<pre class="Agda">{% raw %}
  <a name="4691" href="Basics.html#4314" class="Function Operator"
      >test_nextWeekday</a
      ><a name="4707"
      > </a
      ><a name="4708" class="Symbol"
      >=</a
      ><a name="4709"
      > </a
      ><a name="4710" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      >
{% endraw %}</pre>

There is no essential difference between the definition for
`test_nextWeekday` here and the definition for `nextWeekday` above,
except for the new symbol for equality `≡` and the constructor `refl`.
The details of these are not important for now (we'll come back to them in
a bit), but essentially `refl` can be read as "The assertion we've made
can be proved by observing that both sides of the equality evaluate to the
same thing, after some simplification."

Third, we can ask Agda to *compile* some program involving our definition,
This facility is very interesting, since it gives us a way to construct
*fully certified* programs. We'll come back to this topic in later chapters.
