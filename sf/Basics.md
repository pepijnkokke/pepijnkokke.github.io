---
title         : "Basics: Functional Programming in Agda"
layout        : default
hide-implicit : false
extra-script  : agda-extra-script.html
extra-style   : agda-extra-style.html
permalink     : "/sf/Basics.html"
---

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="258" class="Keyword"
      >module</a
      ><a name="264"
      > </a
      ><a name="265" href="Basics.html#1" class="Module"
      >Basics</a
      ><a name="271"
      > </a
      ><a name="272" class="Keyword"
      >where</a
      ><a name="277"
      >

  </a
      ><a name="281" class="Keyword"
      >open</a
      ><a name="285"
      > </a
      ><a name="286" class="Keyword"
      >import</a
      ><a name="292"
      > </a
      ><a name="293" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.html#1" class="Module"
      >Relation.Binary.PropositionalEquality</a
      ><a name="330"
      > </a
      ><a name="331" class="Keyword"
      >using</a
      ><a name="336"
      > </a
      ><a name="337" class="Symbol"
      >(</a
      ><a name="338" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >_&#8801;_</a
      ><a name="341" class="Symbol"
      >;</a
      ><a name="342"
      > </a
      ><a name="343" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="347" class="Symbol"
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
  <a name="2688" class="Keyword"
      >data</a
      ><a name="2692"
      > </a
      ><a name="2693" href="Basics.html#2693" class="Datatype"
      >Day</a
      ><a name="2696"
      > </a
      ><a name="2697" class="Symbol"
      >:</a
      ><a name="2698"
      > </a
      ><a name="2699" class="PrimitiveType"
      >Set</a
      ><a name="2702"
      > </a
      ><a name="2703" class="Keyword"
      >where</a
      ><a name="2708"
      >
    </a
      ><a name="2713" href="Basics.html#2713" class="InductiveConstructor"
      >monday</a
      ><a name="2719"
      >    </a
      ><a name="2723" class="Symbol"
      >:</a
      ><a name="2724"
      > </a
      ><a name="2725" href="Basics.html#2693" class="Datatype"
      >Day</a
      ><a name="2728"
      >
    </a
      ><a name="2733" href="Basics.html#2733" class="InductiveConstructor"
      >tuesday</a
      ><a name="2740"
      >   </a
      ><a name="2743" class="Symbol"
      >:</a
      ><a name="2744"
      > </a
      ><a name="2745" href="Basics.html#2693" class="Datatype"
      >Day</a
      ><a name="2748"
      >
    </a
      ><a name="2753" href="Basics.html#2753" class="InductiveConstructor"
      >wednesday</a
      ><a name="2762"
      > </a
      ><a name="2763" class="Symbol"
      >:</a
      ><a name="2764"
      > </a
      ><a name="2765" href="Basics.html#2693" class="Datatype"
      >Day</a
      ><a name="2768"
      >
    </a
      ><a name="2773" href="Basics.html#2773" class="InductiveConstructor"
      >thursday</a
      ><a name="2781"
      >  </a
      ><a name="2783" class="Symbol"
      >:</a
      ><a name="2784"
      > </a
      ><a name="2785" href="Basics.html#2693" class="Datatype"
      >Day</a
      ><a name="2788"
      >
    </a
      ><a name="2793" href="Basics.html#2793" class="InductiveConstructor"
      >friday</a
      ><a name="2799"
      >    </a
      ><a name="2803" class="Symbol"
      >:</a
      ><a name="2804"
      > </a
      ><a name="2805" href="Basics.html#2693" class="Datatype"
      >Day</a
      ><a name="2808"
      >
    </a
      ><a name="2813" href="Basics.html#2813" class="InductiveConstructor"
      >saturday</a
      ><a name="2821"
      >  </a
      ><a name="2823" class="Symbol"
      >:</a
      ><a name="2824"
      > </a
      ><a name="2825" href="Basics.html#2693" class="Datatype"
      >Day</a
      ><a name="2828"
      >
    </a
      ><a name="2833" href="Basics.html#2833" class="InductiveConstructor"
      >sunday</a
      ><a name="2839"
      >    </a
      ><a name="2843" class="Symbol"
      >:</a
      ><a name="2844"
      > </a
      ><a name="2845" href="Basics.html#2693" class="Datatype"
      >Day</a
      >
{% endraw %}</pre>

The type is called `day`, and its members are `monday`,
`tuesday`, etc.  The second and following lines of the definition
can be read "`monday` is a `day`, `tuesday` is a `day`, etc."

Having defined `day`, we can write functions that operate on
days.

<pre class="Agda">{% raw %}
  <a name="3129" href="Basics.html#3129" class="Function"
      >nextWeekday</a
      ><a name="3140"
      > </a
      ><a name="3141" class="Symbol"
      >:</a
      ><a name="3142"
      > </a
      ><a name="3143" href="Basics.html#2693" class="Datatype"
      >Day</a
      ><a name="3146"
      > </a
      ><a name="3147" class="Symbol"
      >-&gt;</a
      ><a name="3149"
      > </a
      ><a name="3150" href="Basics.html#2693" class="Datatype"
      >Day</a
      ><a name="3153"
      >
  </a
      ><a name="3156" href="Basics.html#3129" class="Function"
      >nextWeekday</a
      ><a name="3167"
      > </a
      ><a name="3168" href="Basics.html#2713" class="InductiveConstructor"
      >monday</a
      ><a name="3174"
      >    </a
      ><a name="3178" class="Symbol"
      >=</a
      ><a name="3179"
      > </a
      ><a name="3180" href="Basics.html#2733" class="InductiveConstructor"
      >tuesday</a
      ><a name="3187"
      >
  </a
      ><a name="3190" href="Basics.html#3129" class="Function"
      >nextWeekday</a
      ><a name="3201"
      > </a
      ><a name="3202" href="Basics.html#2733" class="InductiveConstructor"
      >tuesday</a
      ><a name="3209"
      >   </a
      ><a name="3212" class="Symbol"
      >=</a
      ><a name="3213"
      > </a
      ><a name="3214" href="Basics.html#2753" class="InductiveConstructor"
      >wednesday</a
      ><a name="3223"
      >
  </a
      ><a name="3226" href="Basics.html#3129" class="Function"
      >nextWeekday</a
      ><a name="3237"
      > </a
      ><a name="3238" href="Basics.html#2753" class="InductiveConstructor"
      >wednesday</a
      ><a name="3247"
      > </a
      ><a name="3248" class="Symbol"
      >=</a
      ><a name="3249"
      > </a
      ><a name="3250" href="Basics.html#2773" class="InductiveConstructor"
      >thursday</a
      ><a name="3258"
      >
  </a
      ><a name="3261" href="Basics.html#3129" class="Function"
      >nextWeekday</a
      ><a name="3272"
      > </a
      ><a name="3273" href="Basics.html#2773" class="InductiveConstructor"
      >thursday</a
      ><a name="3281"
      >  </a
      ><a name="3283" class="Symbol"
      >=</a
      ><a name="3284"
      > </a
      ><a name="3285" href="Basics.html#2793" class="InductiveConstructor"
      >friday</a
      ><a name="3291"
      >
  </a
      ><a name="3294" href="Basics.html#3129" class="Function"
      >nextWeekday</a
      ><a name="3305"
      > </a
      ><a name="3306" href="Basics.html#2793" class="InductiveConstructor"
      >friday</a
      ><a name="3312"
      >    </a
      ><a name="3316" class="Symbol"
      >=</a
      ><a name="3317"
      > </a
      ><a name="3318" href="Basics.html#2713" class="InductiveConstructor"
      >monday</a
      ><a name="3324"
      >
  </a
      ><a name="3327" href="Basics.html#3129" class="Function"
      >nextWeekday</a
      ><a name="3338"
      > </a
      ><a name="3339" href="Basics.html#2813" class="InductiveConstructor"
      >saturday</a
      ><a name="3347"
      >  </a
      ><a name="3349" class="Symbol"
      >=</a
      ><a name="3350"
      > </a
      ><a name="3351" href="Basics.html#2713" class="InductiveConstructor"
      >monday</a
      ><a name="3357"
      >
  </a
      ><a name="3360" href="Basics.html#3129" class="Function"
      >nextWeekday</a
      ><a name="3371"
      > </a
      ><a name="3372" href="Basics.html#2833" class="InductiveConstructor"
      >sunday</a
      ><a name="3378"
      >    </a
      ><a name="3382" class="Symbol"
      >=</a
      ><a name="3383"
      > </a
      ><a name="3384" href="Basics.html#2713" class="InductiveConstructor"
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
  <a name="4348" href="Basics.html#4348" class="Function Operator"
      >test_nextWeekday</a
      ><a name="4364"
      > </a
      ><a name="4365" class="Symbol"
      >:</a
      ><a name="4366"
      > </a
      ><a name="4367" href="Basics.html#3129" class="Function"
      >nextWeekday</a
      ><a name="4378"
      > </a
      ><a name="4379" class="Symbol"
      >(</a
      ><a name="4380" href="Basics.html#3129" class="Function"
      >nextWeekday</a
      ><a name="4391"
      > </a
      ><a name="4392" href="Basics.html#2813" class="InductiveConstructor"
      >saturday</a
      ><a name="4400" class="Symbol"
      >)</a
      ><a name="4401"
      > </a
      ><a name="4402" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="4403"
      > </a
      ><a name="4404" href="Basics.html#2733" class="InductiveConstructor"
      >tuesday</a
      >
{% endraw %}</pre>

This declaration does two things: it makes an assertion (that the second
weekday after `saturday` is `tuesday`), and it gives the assertion a name
that can be used to refer to it later.

Having made the assertion, we must also verify it. We do this by giving
a term of the above type:

<pre class="Agda">{% raw %}
  <a name="4725" href="Basics.html#4348" class="Function Operator"
      >test_nextWeekday</a
      ><a name="4741"
      > </a
      ><a name="4742" class="Symbol"
      >=</a
      ><a name="4743"
      > </a
      ><a name="4744" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
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
