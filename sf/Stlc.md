---
title         : "Stlc: The Simply Typed Lambda-Calculus"
layout        : default
hide-implicit : false
extra-script  : agda-extra-script.html
extra-style   : agda-extra-style.html
permalink     : "sf/Stlc.html"
---

<!--{% raw %}--><pre class="Agda">
<a name="234" class="Keyword"
      >module</a
      ><a name="240"
      > </a
      ><a name="241" href="Stlc.html#1" class="Module"
      >Stlc</a
      ><a name="245"
      > </a
      ><a name="246" class="Keyword"
      >where</a
      >
</pre><!--{% endraw %}-->

<div class="hidden">
<!--{% raw %}--><pre class="Agda">
<a name="298" class="Keyword"
      >open</a
      ><a name="302"
      > </a
      ><a name="303" class="Keyword"
      >import</a
      ><a name="309"
      > </a
      ><a name="310" class="Module"
      >Maps</a
      ><a name="314"
      > </a
      ><a name="315" class="Keyword"
      >using</a
      ><a name="320"
      > </a
      ><a name="321" class="Symbol"
      >(</a
      ><a name="322" href="Maps.html#2638" class="Datatype"
      >Id</a
      ><a name="324" class="Symbol"
      >;</a
      ><a name="325"
      > </a
      ><a name="326" href="Maps.html#2655" class="InductiveConstructor"
      >id</a
      ><a name="328" class="Symbol"
      >;</a
      ><a name="329"
      > </a
      ><a name="330" href="Maps.html#2692" class="Function Operator"
      >_&#8799;_</a
      ><a name="333" class="Symbol"
      >;</a
      ><a name="334"
      > </a
      ><a name="335" href="Maps.html#9758" class="Function"
      >PartialMap</a
      ><a name="345" class="Symbol"
      >;</a
      ><a name="346"
      > </a
      ><a name="347" class="Keyword"
      >module</a
      ><a name="353"
      > </a
      ><a name="354" href="Maps.html#9847" class="Module"
      >PartialMap</a
      ><a name="364" class="Symbol"
      >)</a
      ><a name="365"
      >
</a
      ><a name="366" class="Keyword"
      >open</a
      ><a name="370"
      > </a
      ><a name="371" class="Keyword"
      >import</a
      ><a name="377"
      > </a
      ><a name="378" href="https://agda.github.io/agda-stdlib/Data.Empty.html#1" class="Module"
      >Data.Empty</a
      ><a name="388"
      > </a
      ><a name="389" class="Keyword"
      >using</a
      ><a name="394"
      > </a
      ><a name="395" class="Symbol"
      >(</a
      ><a name="396" href="https://agda.github.io/agda-stdlib/Data.Empty.html#243" class="Datatype"
      >&#8869;</a
      ><a name="397" class="Symbol"
      >;</a
      ><a name="398"
      > </a
      ><a name="399" href="https://agda.github.io/agda-stdlib/Data.Empty.html#348" class="Function"
      >&#8869;-elim</a
      ><a name="405" class="Symbol"
      >)</a
      ><a name="406"
      >
</a
      ><a name="407" class="Keyword"
      >open</a
      ><a name="411"
      > </a
      ><a name="412" class="Keyword"
      >import</a
      ><a name="418"
      > </a
      ><a name="419" href="https://agda.github.io/agda-stdlib/Data.Maybe.html#1" class="Module"
      >Data.Maybe</a
      ><a name="429"
      > </a
      ><a name="430" class="Keyword"
      >using</a
      ><a name="435"
      > </a
      ><a name="436" class="Symbol"
      >(</a
      ><a name="437" href="https://agda.github.io/agda-stdlib/Data.Maybe.Base.html#335" class="Datatype"
      >Maybe</a
      ><a name="442" class="Symbol"
      >;</a
      ><a name="443"
      > </a
      ><a name="444" href="https://agda.github.io/agda-stdlib/Data.Maybe.html#1527" class="InductiveConstructor"
      >just</a
      ><a name="448" class="Symbol"
      >;</a
      ><a name="449"
      > </a
      ><a name="450" href="https://agda.github.io/agda-stdlib/Data.Maybe.html#1588" class="InductiveConstructor"
      >nothing</a
      ><a name="457" class="Symbol"
      >)</a
      ><a name="458"
      >
</a
      ><a name="459" class="Keyword"
      >open</a
      ><a name="463"
      > </a
      ><a name="464" class="Keyword"
      >import</a
      ><a name="470"
      > </a
      ><a name="471" href="https://agda.github.io/agda-stdlib/Data.Nat.html#1" class="Module"
      >Data.Nat</a
      ><a name="479"
      > </a
      ><a name="480" class="Keyword"
      >using</a
      ><a name="485"
      > </a
      ><a name="486" class="Symbol"
      >(</a
      ><a name="487" href="Agda.Builtin.Nat.html#69" class="Datatype"
      >&#8469;</a
      ><a name="488" class="Symbol"
      >;</a
      ><a name="489"
      > </a
      ><a name="490" href="Agda.Builtin.Nat.html#100" class="InductiveConstructor"
      >suc</a
      ><a name="493" class="Symbol"
      >;</a
      ><a name="494"
      > </a
      ><a name="495" href="Agda.Builtin.Nat.html#87" class="InductiveConstructor"
      >zero</a
      ><a name="499" class="Symbol"
      >;</a
      ><a name="500"
      > </a
      ><a name="501" href="Agda.Builtin.Nat.html#202" class="Primitive Operator"
      >_+_</a
      ><a name="504" class="Symbol"
      >)</a
      ><a name="505"
      >
</a
      ><a name="506" class="Keyword"
      >open</a
      ><a name="510"
      > </a
      ><a name="511" class="Keyword"
      >import</a
      ><a name="517"
      > </a
      ><a name="518" href="https://agda.github.io/agda-stdlib/Data.Product.html#1" class="Module"
      >Data.Product</a
      ><a name="530"
      > </a
      ><a name="531" class="Keyword"
      >using</a
      ><a name="536"
      > </a
      ><a name="537" class="Symbol"
      >(</a
      ><a name="538" href="https://agda.github.io/agda-stdlib/Data.Product.html#823" class="Function"
      >&#8707;</a
      ><a name="539" class="Symbol"
      >;</a
      ><a name="540"
      > </a
      ><a name="541" href="https://agda.github.io/agda-stdlib/Data.Product.html#884" class="Function"
      >&#8708;</a
      ><a name="542" class="Symbol"
      >;</a
      ><a name="543"
      > </a
      ><a name="544" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >_,_</a
      ><a name="547" class="Symbol"
      >)</a
      ><a name="548"
      >
</a
      ><a name="549" class="Keyword"
      >open</a
      ><a name="553"
      > </a
      ><a name="554" class="Keyword"
      >import</a
      ><a name="560"
      > </a
      ><a name="561" href="https://agda.github.io/agda-stdlib/Function.html#1" class="Module"
      >Function</a
      ><a name="569"
      > </a
      ><a name="570" class="Keyword"
      >using</a
      ><a name="575"
      > </a
      ><a name="576" class="Symbol"
      >(</a
      ><a name="577" href="https://agda.github.io/agda-stdlib/Function.html#713" class="Function Operator"
      >_&#8728;_</a
      ><a name="580" class="Symbol"
      >;</a
      ><a name="581"
      > </a
      ><a name="582" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >_$_</a
      ><a name="585" class="Symbol"
      >)</a
      ><a name="586"
      >
</a
      ><a name="587" class="Keyword"
      >open</a
      ><a name="591"
      > </a
      ><a name="592" class="Keyword"
      >import</a
      ><a name="598"
      > </a
      ><a name="599" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#1" class="Module"
      >Relation.Nullary</a
      ><a name="615"
      > </a
      ><a name="616" class="Keyword"
      >using</a
      ><a name="621"
      > </a
      ><a name="622" class="Symbol"
      >(</a
      ><a name="623" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#484" class="Datatype"
      >Dec</a
      ><a name="626" class="Symbol"
      >;</a
      ><a name="627"
      > </a
      ><a name="628" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="631" class="Symbol"
      >;</a
      ><a name="632"
      > </a
      ><a name="633" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="635" class="Symbol"
      >)</a
      ><a name="636"
      >
</a
      ><a name="637" class="Keyword"
      >open</a
      ><a name="641"
      > </a
      ><a name="642" class="Keyword"
      >import</a
      ><a name="648"
      > </a
      ><a name="649" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.html#1" class="Module"
      >Relation.Binary.PropositionalEquality</a
      ><a name="686"
      > </a
      ><a name="687" class="Keyword"
      >using</a
      ><a name="692"
      > </a
      ><a name="693" class="Symbol"
      >(</a
      ><a name="694" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >_&#8801;_</a
      ><a name="697" class="Symbol"
      >;</a
      ><a name="698"
      > </a
      ><a name="699" href="https://agda.github.io/agda-stdlib/Relation.Binary.Core.html#4493" class="Function Operator"
      >_&#8802;_</a
      ><a name="702" class="Symbol"
      >;</a
      ><a name="703"
      > </a
      ><a name="704" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="708" class="Symbol"
      >)</a
      >
</pre><!--{% endraw %}-->
</div>

# The Simply Typed Lambda-Calculus

The simply typed lambda-calculus (STLC) is a tiny core
calculus embodying the key concept of _functional abstraction_,
which shows up in pretty much every real-world programming
language in some form (functions, procedures, methods, etc.).

We will follow exactly the same pattern as in the previous chapter
when formalizing this calculus (syntax, small-step semantics,
typing rules) and its main properties (progress and preservation).
The new technical challenges arise from the mechanisms of
_variable binding_ and _substitution_.  It which will take some
work to deal with these.


## Overview

The STLC is built on some collection of _base types_:
booleans, numbers, strings, etc.  The exact choice of base types
doesn't matter much---the construction of the language and its
theoretical properties work out the same no matter what we
choose---so for the sake of brevity let's take just $$bool$$ for
the moment.  At the end of the chapter we'll see how to add more
base types, and in later chapters we'll enrich the pure STLC with
other useful constructs like pairs, records, subtyping, and
mutable state.

Starting from boolean constants and conditionals, we add three
things:

  - variables
  - function abstractions
  - application

This gives us the following collection of abstract syntax
constructors (written out first in informal BNF notation---we'll
formalize it below).

$$
  \begin{array}{rll}
    \text{Terms}\;s,t,u
    ::=  & x & \text{variable} \\
    \mid & \lambda x : A . t & \text{abstraction} \\
    \mid & s\;t & \text{application} \\
    \mid & true & \text{constant true} \\
    \mid & false & \text{constant false} \\
    \mid & \text{if }s\text{ then }t\text{ else }u & \text{conditional}
  \end{array}
$$

In a lambda abstraction $$\lambda x : A . t$$, the variable $$x$$ is called the
_parameter_ to the function; the term $$t$$ is its _body_.  The annotation $$:A$$
specifies the type of arguments that the function can be applied to.

Some examples:

  - The identity function for booleans:

    $$\lambda x:bool. x$$.
  - The identity function for booleans, applied to the boolean $$true$$:

    $$(\lambda x:bool. x)\;true$$.
  - The boolean "not" function:

    $$\lambda x:bool. \text{if }x\text{ then }false\text{ else }true$$.
  - The constant function that takes every (boolean) argument to $$true$$:

    $$\lambda x:bool. true$$.
  - A two-argument function that takes two booleans and returns the
    first one:

    $$\lambda x:bool. \lambda y:bool. x$$.

    As in Agda, a two-argument function is really a
    one-argument function whose body is also a one-argument function.
  - A two-argument function that takes two booleans and returns the
    first one, applied to the booleans $$false$$ and $$true$$:

    $$(\lambda x:bool. \lambda y:bool. x)\;false\;true$$.

    As in Agda, application associates to the left---i.e., this
    expression is parsed as

    $$((\lambda x:bool. \lambda y:bool. x)\;false)\;true$$.

  - A higher-order function that takes a _function_ $$f$$ (from booleans
    to booleans) as an argument, applies $$f$$ to $$true$$, and applies
    $$f$$ again to the result:

    $$\lambda f:bool\rightarrow bool. f\;(f\;true)$$.

  - The same higher-order function, applied to the constantly $$false$$
    function:

    $$(\lambda f:bool\rightarrow bool. f\;(f\;true))\;(\lambda x:bool. false)$$.

As the last several examples show, the STLC is a language of
_higher-order_ functions: we can write down functions that take
other functions as arguments and/or return other functions as
results.

The STLC doesn't provide any primitive syntax for defining _named_
functions---all functions are "anonymous."  We'll see in chapter
`MoreStlc` that it is easy to add named functions to what we've
got---indeed, the fundamental naming and binding mechanisms are
exactly the same.

The _types_ of the STLC include $$bool$$, which classifies the
boolean constants $$true$$ and $$false$$ as well as more complex
computations that yield booleans, plus _arrow types_ that classify
functions.

$$
    \text{Types}\;A,B ::= bool \mid A \rightarrow B
$$

For example:

  - $$\lambda x:bool. false$$ has type $$bool\rightarrow bool$$;
  - $$\lambda x:bool. x$$ has type $$bool\rightarrow bool$$;
  - $$(\lambda x:bool. x)\;true$$ has type $$bool$$;
  - $$\lambda x:bool. \lambda y:bool. x$$ has type
    $$bool\rightarrow bool\rightarrow bool$$
    (i.e., $$bool\rightarrow (bool\rightarrow bool)$$)
  - $$(\lambda x:bool. \lambda y:bool. x)\;false$$ has type $$bool\rightarrow bool$$
  - $$(\lambda x:bool. \lambda y:bool. x)\;false\;true$$ has type $$bool$$

## Syntax

We begin by formalizing the syntax of the STLC.
Unfortunately, $$\rightarrow$$ is already used for Agda's function type,
so we will STLC's function type as `_⇒_`.


### Types

<!--{% raw %}--><pre class="Agda">
<a name="5581" class="Keyword"
      >data</a
      ><a name="5585"
      > </a
      ><a name="5586" href="Stlc.html#5586" class="Datatype"
      >Type</a
      ><a name="5590"
      > </a
      ><a name="5591" class="Symbol"
      >:</a
      ><a name="5592"
      > </a
      ><a name="5593" class="PrimitiveType"
      >Set</a
      ><a name="5596"
      > </a
      ><a name="5597" class="Keyword"
      >where</a
      ><a name="5602"
      >
  </a
      ><a name="5605" href="Stlc.html#5605" class="InductiveConstructor"
      >bool</a
      ><a name="5609"
      > </a
      ><a name="5610" class="Symbol"
      >:</a
      ><a name="5611"
      > </a
      ><a name="5612" href="Stlc.html#5586" class="Datatype"
      >Type</a
      ><a name="5616"
      >
  </a
      ><a name="5619" href="Stlc.html#5619" class="InductiveConstructor Operator"
      >_&#8658;_</a
      ><a name="5622"
      >  </a
      ><a name="5624" class="Symbol"
      >:</a
      ><a name="5625"
      > </a
      ><a name="5626" href="Stlc.html#5586" class="Datatype"
      >Type</a
      ><a name="5630"
      > </a
      ><a name="5631" class="Symbol"
      >&#8594;</a
      ><a name="5632"
      > </a
      ><a name="5633" href="Stlc.html#5586" class="Datatype"
      >Type</a
      ><a name="5637"
      > </a
      ><a name="5638" class="Symbol"
      >&#8594;</a
      ><a name="5639"
      > </a
      ><a name="5640" href="Stlc.html#5586" class="Datatype"
      >Type</a
      >
</pre><!--{% endraw %}-->

<div class="hidden">
<!--{% raw %}--><pre class="Agda">
<a name="5691" class="Keyword"
      >infixr</a
      ><a name="5697"
      > </a
      ><a name="5698" class="Number"
      >5</a
      >
</pre><!--{% endraw %}-->
</div>


### Terms

<!--{% raw %}--><pre class="Agda">
<a name="5748" class="Keyword"
      >data</a
      ><a name="5752"
      > </a
      ><a name="5753" href="Stlc.html#5753" class="Datatype"
      >Term</a
      ><a name="5757"
      > </a
      ><a name="5758" class="Symbol"
      >:</a
      ><a name="5759"
      > </a
      ><a name="5760" class="PrimitiveType"
      >Set</a
      ><a name="5763"
      > </a
      ><a name="5764" class="Keyword"
      >where</a
      ><a name="5769"
      >
  </a
      ><a name="5772" href="Stlc.html#5772" class="InductiveConstructor"
      >var</a
      ><a name="5775"
      >   </a
      ><a name="5778" class="Symbol"
      >:</a
      ><a name="5779"
      > </a
      ><a name="5780" href="Maps.html#2638" class="Datatype"
      >Id</a
      ><a name="5782"
      > </a
      ><a name="5783" class="Symbol"
      >&#8594;</a
      ><a name="5784"
      > </a
      ><a name="5785" href="Stlc.html#5753" class="Datatype"
      >Term</a
      ><a name="5789"
      >
  </a
      ><a name="5792" href="Stlc.html#5792" class="InductiveConstructor"
      >app</a
      ><a name="5795"
      >   </a
      ><a name="5798" class="Symbol"
      >:</a
      ><a name="5799"
      > </a
      ><a name="5800" href="Stlc.html#5753" class="Datatype"
      >Term</a
      ><a name="5804"
      > </a
      ><a name="5805" class="Symbol"
      >&#8594;</a
      ><a name="5806"
      > </a
      ><a name="5807" href="Stlc.html#5753" class="Datatype"
      >Term</a
      ><a name="5811"
      > </a
      ><a name="5812" class="Symbol"
      >&#8594;</a
      ><a name="5813"
      > </a
      ><a name="5814" href="Stlc.html#5753" class="Datatype"
      >Term</a
      ><a name="5818"
      >
  </a
      ><a name="5821" href="Stlc.html#5821" class="InductiveConstructor"
      >abs</a
      ><a name="5824"
      >   </a
      ><a name="5827" class="Symbol"
      >:</a
      ><a name="5828"
      > </a
      ><a name="5829" href="Maps.html#2638" class="Datatype"
      >Id</a
      ><a name="5831"
      > </a
      ><a name="5832" class="Symbol"
      >&#8594;</a
      ><a name="5833"
      > </a
      ><a name="5834" href="Stlc.html#5586" class="Datatype"
      >Type</a
      ><a name="5838"
      > </a
      ><a name="5839" class="Symbol"
      >&#8594;</a
      ><a name="5840"
      > </a
      ><a name="5841" href="Stlc.html#5753" class="Datatype"
      >Term</a
      ><a name="5845"
      > </a
      ><a name="5846" class="Symbol"
      >&#8594;</a
      ><a name="5847"
      > </a
      ><a name="5848" href="Stlc.html#5753" class="Datatype"
      >Term</a
      ><a name="5852"
      >
  </a
      ><a name="5855" href="Stlc.html#5855" class="InductiveConstructor"
      >true</a
      ><a name="5859"
      >  </a
      ><a name="5861" class="Symbol"
      >:</a
      ><a name="5862"
      > </a
      ><a name="5863" href="Stlc.html#5753" class="Datatype"
      >Term</a
      ><a name="5867"
      >
  </a
      ><a name="5870" href="Stlc.html#5870" class="InductiveConstructor"
      >false</a
      ><a name="5875"
      > </a
      ><a name="5876" class="Symbol"
      >:</a
      ><a name="5877"
      > </a
      ><a name="5878" href="Stlc.html#5753" class="Datatype"
      >Term</a
      ><a name="5882"
      >
  </a
      ><a name="5885" href="Stlc.html#5885" class="InductiveConstructor Operator"
      >if_then_else_</a
      ><a name="5898"
      > </a
      ><a name="5899" class="Symbol"
      >:</a
      ><a name="5900"
      > </a
      ><a name="5901" href="Stlc.html#5753" class="Datatype"
      >Term</a
      ><a name="5905"
      > </a
      ><a name="5906" class="Symbol"
      >&#8594;</a
      ><a name="5907"
      > </a
      ><a name="5908" href="Stlc.html#5753" class="Datatype"
      >Term</a
      ><a name="5912"
      > </a
      ><a name="5913" class="Symbol"
      >&#8594;</a
      ><a name="5914"
      > </a
      ><a name="5915" href="Stlc.html#5753" class="Datatype"
      >Term</a
      ><a name="5919"
      > </a
      ><a name="5920" class="Symbol"
      >&#8594;</a
      ><a name="5921"
      > </a
      ><a name="5922" href="Stlc.html#5753" class="Datatype"
      >Term</a
      >
</pre><!--{% endraw %}-->

<div class="hidden">
<!--{% raw %}--><pre class="Agda">
<a name="5973" class="Keyword"
      >infixr</a
      ><a name="5979"
      > </a
      ><a name="5980" class="Number"
      >8</a
      >
</pre><!--{% endraw %}-->
</div>

Note that an abstraction $$\lambda x:A.t$$ (formally, `abs x A t`) is
always annotated with the type $$A$$ of its parameter, in contrast
to Agda (and other functional languages like ML, Haskell, etc.),
which use _type inference_ to fill in missing annotations.  We're
not considering type inference here.

Some examples...

<!--{% raw %}--><pre class="Agda">
<a name="6352" href="Stlc.html#6352" class="Function"
      >x</a
      ><a name="6353"
      > </a
      ><a name="6354" class="Symbol"
      >=</a
      ><a name="6355"
      > </a
      ><a name="6356" href="Maps.html#2655" class="InductiveConstructor"
      >id</a
      ><a name="6358"
      > </a
      ><a name="6359" class="Number"
      >0</a
      ><a name="6360"
      >
</a
      ><a name="6361" href="Stlc.html#6361" class="Function"
      >y</a
      ><a name="6362"
      > </a
      ><a name="6363" class="Symbol"
      >=</a
      ><a name="6364"
      > </a
      ><a name="6365" href="Maps.html#2655" class="InductiveConstructor"
      >id</a
      ><a name="6367"
      > </a
      ><a name="6368" class="Number"
      >1</a
      ><a name="6369"
      >
</a
      ><a name="6370" href="Stlc.html#6370" class="Function"
      >z</a
      ><a name="6371"
      > </a
      ><a name="6372" class="Symbol"
      >=</a
      ><a name="6373"
      > </a
      ><a name="6374" href="Maps.html#2655" class="InductiveConstructor"
      >id</a
      ><a name="6376"
      > </a
      ><a name="6377" class="Number"
      >2</a
      >
</pre><!--{% endraw %}-->

<div class="hidden">
<!--{% raw %}--><pre class="Agda">
<a name="6425" class="Symbol"
      >{-#</a
      ><a name="6428"
      > </a
      ><a name="6429" class="Keyword"
      >DISPLAY</a
      ><a name="6436"
      > </a
      ><a name="6437" href="Agda.Builtin.Nat.html#87" class="InductiveConstructor"
      >zero</a
      ><a name="6441"
      > = </a
      ><a name="6444" href="Stlc.html#6352" class="Function"
      >x</a
      ><a name="6445"
      > </a
      ><a name="6446" class="Symbol"
      >#-}</a
      ><a name="6449"
      >
</a
      ><a name="6450" class="Symbol"
      >{-#</a
      ><a name="6453"
      > </a
      ><a name="6454" class="Keyword"
      >DISPLAY</a
      ><a name="6461"
      > </a
      ><a name="6462" href="Agda.Builtin.Nat.html#100" class="InductiveConstructor"
      >suc</a
      ><a name="6465"
      > </a
      ><a name="6466" href="Agda.Builtin.Nat.html#87" class="InductiveConstructor"
      >zero</a
      ><a name="6470"
      > = </a
      ><a name="6473" href="Stlc.html#6361" class="Function"
      >y</a
      ><a name="6474"
      > </a
      ><a name="6475" class="Symbol"
      >#-}</a
      ><a name="6478"
      >
</a
      ><a name="6479" class="Symbol"
      >{-#</a
      ><a name="6482"
      > </a
      ><a name="6483" class="Keyword"
      >DISPLAY</a
      ><a name="6490"
      > </a
      ><a name="6491" href="Agda.Builtin.Nat.html#100" class="InductiveConstructor"
      >suc</a
      ><a name="6494"
      > (</a
      ><a name="6496" href="Agda.Builtin.Nat.html#100" class="InductiveConstructor"
      >suc</a
      ><a name="6499"
      > </a
      ><a name="6500" href="Agda.Builtin.Nat.html#87" class="InductiveConstructor"
      >zero</a
      ><a name="6504"
      >) = </a
      ><a name="6508" href="Stlc.html#6370" class="Function"
      >z</a
      ><a name="6509"
      > </a
      ><a name="6510" class="Symbol"
      >#-}</a
      >
</pre><!--{% endraw %}-->
</div>

$$\text{idB} = \lambda x:bool. x$$.

<!--{% raw %}--><pre class="Agda">
<a name="6583" href="Stlc.html#6583" class="Function"
      >idB</a
      ><a name="6586"
      > </a
      ><a name="6587" class="Symbol"
      >=</a
      ><a name="6588"
      > </a
      ><a name="6589" class="Symbol"
      >(</a
      ><a name="6590" href="Stlc.html#5821" class="InductiveConstructor"
      >abs</a
      ><a name="6593"
      > </a
      ><a name="6594" href="Stlc.html#6352" class="Function"
      >x</a
      ><a name="6595"
      > </a
      ><a name="6596" href="Stlc.html#5605" class="InductiveConstructor"
      >bool</a
      ><a name="6600"
      > </a
      ><a name="6601" class="Symbol"
      >(</a
      ><a name="6602" href="Stlc.html#5772" class="InductiveConstructor"
      >var</a
      ><a name="6605"
      > </a
      ><a name="6606" href="Stlc.html#6352" class="Function"
      >x</a
      ><a name="6607" class="Symbol"
      >))</a
      >
</pre><!--{% endraw %}-->

$$\text{idBB} = \lambda x:bool\rightarrow bool. x$$.

<!--{% raw %}--><pre class="Agda">
<a name="6689" href="Stlc.html#6689" class="Function"
      >idBB</a
      ><a name="6693"
      > </a
      ><a name="6694" class="Symbol"
      >=</a
      ><a name="6695"
      > </a
      ><a name="6696" class="Symbol"
      >(</a
      ><a name="6697" href="Stlc.html#5821" class="InductiveConstructor"
      >abs</a
      ><a name="6700"
      > </a
      ><a name="6701" href="Stlc.html#6352" class="Function"
      >x</a
      ><a name="6702"
      > </a
      ><a name="6703" class="Symbol"
      >(</a
      ><a name="6704" href="Stlc.html#5605" class="InductiveConstructor"
      >bool</a
      ><a name="6708"
      > </a
      ><a name="6709" href="Stlc.html#5619" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="6710"
      > </a
      ><a name="6711" href="Stlc.html#5605" class="InductiveConstructor"
      >bool</a
      ><a name="6715" class="Symbol"
      >)</a
      ><a name="6716"
      > </a
      ><a name="6717" class="Symbol"
      >(</a
      ><a name="6718" href="Stlc.html#5772" class="InductiveConstructor"
      >var</a
      ><a name="6721"
      > </a
      ><a name="6722" href="Stlc.html#6352" class="Function"
      >x</a
      ><a name="6723" class="Symbol"
      >))</a
      >
</pre><!--{% endraw %}-->

$$\text{idBBBB} = \lambda x:(bool\rightarrow bool)\rightarrow (bool\rightarrow bool). x$$.

<!--{% raw %}--><pre class="Agda">
<a name="6843" href="Stlc.html#6843" class="Function"
      >idBBBB</a
      ><a name="6849"
      > </a
      ><a name="6850" class="Symbol"
      >=</a
      ><a name="6851"
      > </a
      ><a name="6852" class="Symbol"
      >(</a
      ><a name="6853" href="Stlc.html#5821" class="InductiveConstructor"
      >abs</a
      ><a name="6856"
      > </a
      ><a name="6857" href="Stlc.html#6352" class="Function"
      >x</a
      ><a name="6858"
      > </a
      ><a name="6859" class="Symbol"
      >((</a
      ><a name="6861" href="Stlc.html#5605" class="InductiveConstructor"
      >bool</a
      ><a name="6865"
      > </a
      ><a name="6866" href="Stlc.html#5619" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="6867"
      > </a
      ><a name="6868" href="Stlc.html#5605" class="InductiveConstructor"
      >bool</a
      ><a name="6872" class="Symbol"
      >)</a
      ><a name="6873"
      > </a
      ><a name="6874" href="Stlc.html#5619" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="6875"
      > </a
      ><a name="6876" class="Symbol"
      >(</a
      ><a name="6877" href="Stlc.html#5605" class="InductiveConstructor"
      >bool</a
      ><a name="6881"
      > </a
      ><a name="6882" href="Stlc.html#5619" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="6883"
      > </a
      ><a name="6884" href="Stlc.html#5605" class="InductiveConstructor"
      >bool</a
      ><a name="6888" class="Symbol"
      >))</a
      ><a name="6890"
      > </a
      ><a name="6891" class="Symbol"
      >(</a
      ><a name="6892" href="Stlc.html#5772" class="InductiveConstructor"
      >var</a
      ><a name="6895"
      > </a
      ><a name="6896" href="Stlc.html#6352" class="Function"
      >x</a
      ><a name="6897" class="Symbol"
      >))</a
      >
</pre><!--{% endraw %}-->

$$\text{k} = \lambda x:bool. \lambda y:bool. x$$.

<!--{% raw %}--><pre class="Agda">
<a name="6976" href="Stlc.html#6976" class="Function"
      >k</a
      ><a name="6977"
      > </a
      ><a name="6978" class="Symbol"
      >=</a
      ><a name="6979"
      > </a
      ><a name="6980" class="Symbol"
      >(</a
      ><a name="6981" href="Stlc.html#5821" class="InductiveConstructor"
      >abs</a
      ><a name="6984"
      > </a
      ><a name="6985" href="Stlc.html#6352" class="Function"
      >x</a
      ><a name="6986"
      > </a
      ><a name="6987" href="Stlc.html#5605" class="InductiveConstructor"
      >bool</a
      ><a name="6991"
      > </a
      ><a name="6992" class="Symbol"
      >(</a
      ><a name="6993" href="Stlc.html#5821" class="InductiveConstructor"
      >abs</a
      ><a name="6996"
      > </a
      ><a name="6997" href="Stlc.html#6361" class="Function"
      >y</a
      ><a name="6998"
      > </a
      ><a name="6999" href="Stlc.html#5605" class="InductiveConstructor"
      >bool</a
      ><a name="7003"
      > </a
      ><a name="7004" class="Symbol"
      >(</a
      ><a name="7005" href="Stlc.html#5772" class="InductiveConstructor"
      >var</a
      ><a name="7008"
      > </a
      ><a name="7009" href="Stlc.html#6352" class="Function"
      >x</a
      ><a name="7010" class="Symbol"
      >)))</a
      >
</pre><!--{% endraw %}-->

$$\text{notB} = \lambda x:bool. \text{if }x\text{ then }false\text{ else }true$$.

<!--{% raw %}--><pre class="Agda">
<a name="7122" href="Stlc.html#7122" class="Function"
      >notB</a
      ><a name="7126"
      > </a
      ><a name="7127" class="Symbol"
      >=</a
      ><a name="7128"
      > </a
      ><a name="7129" class="Symbol"
      >(</a
      ><a name="7130" href="Stlc.html#5821" class="InductiveConstructor"
      >abs</a
      ><a name="7133"
      > </a
      ><a name="7134" href="Stlc.html#6352" class="Function"
      >x</a
      ><a name="7135"
      > </a
      ><a name="7136" href="Stlc.html#5605" class="InductiveConstructor"
      >bool</a
      ><a name="7140"
      > </a
      ><a name="7141" class="Symbol"
      >(</a
      ><a name="7142" href="Stlc.html#5885" class="InductiveConstructor Operator"
      >if</a
      ><a name="7144"
      > </a
      ><a name="7145" class="Symbol"
      >(</a
      ><a name="7146" href="Stlc.html#5772" class="InductiveConstructor"
      >var</a
      ><a name="7149"
      > </a
      ><a name="7150" href="Stlc.html#6352" class="Function"
      >x</a
      ><a name="7151" class="Symbol"
      >)</a
      ><a name="7152"
      > </a
      ><a name="7153" href="Stlc.html#5885" class="InductiveConstructor Operator"
      >then</a
      ><a name="7157"
      > </a
      ><a name="7158" href="Stlc.html#5870" class="InductiveConstructor"
      >false</a
      ><a name="7163"
      > </a
      ><a name="7164" href="Stlc.html#5885" class="InductiveConstructor Operator"
      >else</a
      ><a name="7168"
      > </a
      ><a name="7169" href="Stlc.html#5855" class="InductiveConstructor"
      >true</a
      ><a name="7173" class="Symbol"
      >))</a
      >
</pre><!--{% endraw %}-->

<div class="hidden">
<!--{% raw %}--><pre class="Agda">
<a name="7222" class="Symbol"
      >{-#</a
      ><a name="7225"
      > </a
      ><a name="7226" class="Keyword"
      >DISPLAY</a
      ><a name="7233"
      > </a
      ><a name="7234" href="Stlc.html#5821" class="InductiveConstructor"
      >abs</a
      ><a name="7237"
      > 0 </a
      ><a name="7240" href="Stlc.html#5605" class="InductiveConstructor"
      >bool</a
      ><a name="7244"
      > (</a
      ><a name="7246" href="Stlc.html#5772" class="InductiveConstructor"
      >var</a
      ><a name="7249"
      > 0) = </a
      ><a name="7255" href="Stlc.html#6583" class="Function"
      >idB</a
      ><a name="7258"
      > </a
      ><a name="7259" class="Symbol"
      >#-}</a
      ><a name="7262"
      >
</a
      ><a name="7263" class="Symbol"
      >{-#</a
      ><a name="7266"
      > </a
      ><a name="7267" class="Keyword"
      >DISPLAY</a
      ><a name="7274"
      > </a
      ><a name="7275" href="Stlc.html#5821" class="InductiveConstructor"
      >abs</a
      ><a name="7278"
      > 0 (</a
      ><a name="7282" href="Stlc.html#5605" class="InductiveConstructor"
      >bool</a
      ><a name="7286"
      > </a
      ><a name="7287" href="Stlc.html#5619" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="7288"
      > </a
      ><a name="7289" href="Stlc.html#5605" class="InductiveConstructor"
      >bool</a
      ><a name="7293"
      >) (</a
      ><a name="7296" href="Stlc.html#5772" class="InductiveConstructor"
      >var</a
      ><a name="7299"
      > 0) = </a
      ><a name="7305" href="Stlc.html#6689" class="Function"
      >idBB</a
      ><a name="7309"
      > </a
      ><a name="7310" class="Symbol"
      >#-}</a
      ><a name="7313"
      >
</a
      ><a name="7314" class="Symbol"
      >{-#</a
      ><a name="7317"
      > </a
      ><a name="7318" class="Keyword"
      >DISPLAY</a
      ><a name="7325"
      > </a
      ><a name="7326" href="Stlc.html#5821" class="InductiveConstructor"
      >abs</a
      ><a name="7329"
      > 0 ((</a
      ><a name="7334" href="Stlc.html#5605" class="InductiveConstructor"
      >bool</a
      ><a name="7338"
      > </a
      ><a name="7339" href="Stlc.html#5619" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="7340"
      > </a
      ><a name="7341" href="Stlc.html#5605" class="InductiveConstructor"
      >bool</a
      ><a name="7345"
      >) </a
      ><a name="7347" href="Stlc.html#5619" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="7348"
      > (</a
      ><a name="7350" href="Stlc.html#5605" class="InductiveConstructor"
      >bool</a
      ><a name="7354"
      > </a
      ><a name="7355" href="Stlc.html#5619" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="7356"
      > </a
      ><a name="7357" href="Stlc.html#5605" class="InductiveConstructor"
      >bool</a
      ><a name="7361"
      >)) (</a
      ><a name="7365" href="Stlc.html#5772" class="InductiveConstructor"
      >var</a
      ><a name="7368"
      > 0) = </a
      ><a name="7374" href="Stlc.html#6843" class="Function"
      >idBBBB</a
      ><a name="7380"
      > </a
      ><a name="7381" class="Symbol"
      >#-}</a
      ><a name="7384"
      >
</a
      ><a name="7385" class="Symbol"
      >{-#</a
      ><a name="7388"
      > </a
      ><a name="7389" class="Keyword"
      >DISPLAY</a
      ><a name="7396"
      > </a
      ><a name="7397" href="Stlc.html#5821" class="InductiveConstructor"
      >abs</a
      ><a name="7400"
      > 0 </a
      ><a name="7403" href="Stlc.html#5605" class="InductiveConstructor"
      >bool</a
      ><a name="7407"
      > (</a
      ><a name="7409" href="Stlc.html#5821" class="InductiveConstructor"
      >abs</a
      ><a name="7412"
      > </a
      ><a name="7413" href="Stlc.html#7413" class="Bound"
      >y</a
      ><a name="7414"
      > </a
      ><a name="7415" href="Stlc.html#5605" class="InductiveConstructor"
      >bool</a
      ><a name="7419"
      > (</a
      ><a name="7421" href="Stlc.html#5772" class="InductiveConstructor"
      >var</a
      ><a name="7424"
      > 0)) = </a
      ><a name="7431" href="Stlc.html#6976" class="Function"
      >k</a
      ><a name="7432"
      > </a
      ><a name="7433" class="Symbol"
      >#-}</a
      ><a name="7436"
      >
</a
      ><a name="7437" class="Symbol"
      >{-#</a
      ><a name="7440"
      > </a
      ><a name="7441" class="Keyword"
      >DISPLAY</a
      ><a name="7448"
      > </a
      ><a name="7449" href="Stlc.html#5821" class="InductiveConstructor"
      >abs</a
      ><a name="7452"
      > 0 </a
      ><a name="7455" href="Stlc.html#5605" class="InductiveConstructor"
      >bool</a
      ><a name="7459"
      > (</a
      ><a name="7461" href="Stlc.html#5885" class="InductiveConstructor Operator"
      >if</a
      ><a name="7463"
      > (</a
      ><a name="7465" href="Stlc.html#5772" class="InductiveConstructor"
      >var</a
      ><a name="7468"
      > 0) </a
      ><a name="7472" href="Stlc.html#5885" class="InductiveConstructor Operator"
      >then</a
      ><a name="7476"
      > </a
      ><a name="7477" href="Stlc.html#5870" class="InductiveConstructor"
      >false</a
      ><a name="7482"
      > </a
      ><a name="7483" href="Stlc.html#5885" class="InductiveConstructor Operator"
      >else</a
      ><a name="7487"
      > </a
      ><a name="7488" href="Stlc.html#5855" class="InductiveConstructor"
      >true</a
      ><a name="7492"
      >) = </a
      ><a name="7496" href="Stlc.html#7122" class="Function"
      >notB</a
      ><a name="7500"
      > </a
      ><a name="7501" class="Symbol"
      >#-}</a
      >
</pre><!--{% endraw %}-->
</div>

## Operational Semantics

To define the small-step semantics of STLC terms, we begin,
as always, by defining the set of values.  Next, we define the
critical notions of _free variables_ and _substitution_, which are
used in the reduction rule for application expressions.  And
finally we give the small-step relation itself.

### Values

To define the values of the STLC, we have a few cases to consider.

First, for the boolean part of the language, the situation is
clear: $$true$$ and $$false$$ are the only values.  An $$\text{if}$$
expression is never a value.

Second, an application is clearly not a value: It represents a
function being invoked on some argument, which clearly still has
work left to do.

Third, for abstractions, we have a choice:

  - We can say that $$\lambda x:A. t$$ is a value only when $$t$$ is a
    value---i.e., only if the function's body has been
    reduced (as much as it can be without knowing what argument it
    is going to be applied to).

  - Or we can say that $$\lambda x:A. t$$ is always a value, no matter
    whether $$t$$ is one or not---in other words, we can say that
    reduction stops at abstractions.

Agda makes the first choice---for example,

<!--{% raw %}--><pre class="Agda">
<a name="8739" href="Stlc.html#8739" class="Function Operator"
      >test_normalizeUnderLambda</a
      ><a name="8764"
      > </a
      ><a name="8765" class="Symbol"
      >:</a
      ><a name="8766"
      > </a
      ><a name="8767" class="Symbol"
      >(&#955;</a
      ><a name="8769"
      > </a
      ><a name="8770" class="Symbol"
      >(</a
      ><a name="8771" href="Stlc.html#8771" class="Bound"
      >x</a
      ><a name="8772"
      > </a
      ><a name="8773" class="Symbol"
      >:</a
      ><a name="8774"
      > </a
      ><a name="8775" href="Agda.Builtin.Nat.html#69" class="Datatype"
      >&#8469;</a
      ><a name="8776" class="Symbol"
      >)</a
      ><a name="8777"
      > </a
      ><a name="8778" class="Symbol"
      >&#8594;</a
      ><a name="8779"
      > </a
      ><a name="8780" class="Number"
      >3</a
      ><a name="8781"
      > </a
      ><a name="8782" href="Agda.Builtin.Nat.html#202" class="Primitive Operator"
      >+</a
      ><a name="8783"
      > </a
      ><a name="8784" class="Number"
      >4</a
      ><a name="8785" class="Symbol"
      >)</a
      ><a name="8786"
      > </a
      ><a name="8787" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="8788"
      > </a
      ><a name="8789" class="Symbol"
      >(&#955;</a
      ><a name="8791"
      > </a
      ><a name="8792" class="Symbol"
      >(</a
      ><a name="8793" href="Stlc.html#8793" class="Bound"
      >x</a
      ><a name="8794"
      > </a
      ><a name="8795" class="Symbol"
      >:</a
      ><a name="8796"
      > </a
      ><a name="8797" href="Agda.Builtin.Nat.html#69" class="Datatype"
      >&#8469;</a
      ><a name="8798" class="Symbol"
      >)</a
      ><a name="8799"
      > </a
      ><a name="8800" class="Symbol"
      >&#8594;</a
      ><a name="8801"
      > </a
      ><a name="8802" class="Number"
      >7</a
      ><a name="8803" class="Symbol"
      >)</a
      ><a name="8804"
      >
</a
      ><a name="8805" href="Stlc.html#8739" class="Function Operator"
      >test_normalizeUnderLambda</a
      ><a name="8830"
      > </a
      ><a name="8831" class="Symbol"
      >=</a
      ><a name="8832"
      > </a
      ><a name="8833" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      >
</pre><!--{% endraw %}-->

Most real-world functional programming languages make the second
choice---reduction of a function's body only begins when the
function is actually applied to an argument.  We also make the
second choice here.

<!--{% raw %}--><pre class="Agda">
<a name="9073" class="Keyword"
      >data</a
      ><a name="9077"
      > </a
      ><a name="9078" href="Stlc.html#9078" class="Datatype"
      >Value</a
      ><a name="9083"
      > </a
      ><a name="9084" class="Symbol"
      >:</a
      ><a name="9085"
      > </a
      ><a name="9086" href="Stlc.html#5753" class="Datatype"
      >Term</a
      ><a name="9090"
      > </a
      ><a name="9091" class="Symbol"
      >&#8594;</a
      ><a name="9092"
      > </a
      ><a name="9093" class="PrimitiveType"
      >Set</a
      ><a name="9096"
      > </a
      ><a name="9097" class="Keyword"
      >where</a
      ><a name="9102"
      >
  </a
      ><a name="9105" href="Stlc.html#9105" class="InductiveConstructor"
      >abs</a
      ><a name="9108"
      >   </a
      ><a name="9111" class="Symbol"
      >:</a
      ><a name="9112"
      > </a
      ><a name="9113" class="Symbol"
      >&#8704;</a
      ><a name="9114"
      > </a
      ><a name="9115" class="Symbol"
      >{</a
      ><a name="9116" href="Stlc.html#9116" class="Bound"
      >x</a
      ><a name="9117"
      > </a
      ><a name="9118" href="Stlc.html#9118" class="Bound"
      >A</a
      ><a name="9119"
      > </a
      ><a name="9120" href="Stlc.html#9120" class="Bound"
      >t</a
      ><a name="9121" class="Symbol"
      >}</a
      ><a name="9122"
      >
        </a
      ><a name="9131" class="Symbol"
      >&#8594;</a
      ><a name="9132"
      > </a
      ><a name="9133" href="Stlc.html#9078" class="Datatype"
      >Value</a
      ><a name="9138"
      > </a
      ><a name="9139" class="Symbol"
      >(</a
      ><a name="9140" href="Stlc.html#5821" class="InductiveConstructor"
      >abs</a
      ><a name="9143"
      > </a
      ><a name="9144" href="Stlc.html#9116" class="Bound"
      >x</a
      ><a name="9145"
      > </a
      ><a name="9146" href="Stlc.html#9118" class="Bound"
      >A</a
      ><a name="9147"
      > </a
      ><a name="9148" href="Stlc.html#9120" class="Bound"
      >t</a
      ><a name="9149" class="Symbol"
      >)</a
      ><a name="9150"
      >
  </a
      ><a name="9153" href="Stlc.html#9153" class="InductiveConstructor"
      >true</a
      ><a name="9157"
      >  </a
      ><a name="9159" class="Symbol"
      >:</a
      ><a name="9160"
      > </a
      ><a name="9161" href="Stlc.html#9078" class="Datatype"
      >Value</a
      ><a name="9166"
      > </a
      ><a name="9167" href="Stlc.html#5855" class="InductiveConstructor"
      >true</a
      ><a name="9171"
      >
  </a
      ><a name="9174" href="Stlc.html#9174" class="InductiveConstructor"
      >false</a
      ><a name="9179"
      > </a
      ><a name="9180" class="Symbol"
      >:</a
      ><a name="9181"
      > </a
      ><a name="9182" href="Stlc.html#9078" class="Datatype"
      >Value</a
      ><a name="9187"
      > </a
      ><a name="9188" href="Stlc.html#5870" class="InductiveConstructor"
      >false</a
      >
</pre><!--{% endraw %}-->

Finally, we must consider what constitutes a _complete_ program.

Intuitively, a "complete program" must not refer to any undefined
variables.  We'll see shortly how to define the _free_ variables
in a STLC term.  A complete program is _closed_---that is, it
contains no free variables.

Having made the choice not to reduce under abstractions, we don't
need to worry about whether variables are values, since we'll
always be reducing programs "from the outside in," and that means
the small-step relation will always be working with closed terms.


### Substitution

Now we come to the heart of the STLC: the operation of
substituting one term for a variable in another term.  This
operation is used below to define the operational semantics of
function application, where we will need to substitute the
argument term for the function parameter in the function's body.
For example, we reduce

$$(\lambda x:bool. \text{if }x\text{ then }true\text{ else }x)\;false$$

to

$$\text{if }false\text{ then }true\text{ else }false$$

by substituting $$false$$ for the parameter $$x$$ in the body of the
function.

In general, we need to be able to substitute some given term $$s$$
for occurrences of some variable $$x$$ in another term $$t$$.  In
informal discussions, this is usually written $$[x:=s]t$$ and
pronounced "substitute $$x$$ with $$s$$ in $$t$$."

Here are some examples:

  - $$[x:=true](\text{if }x\text{ then }x\text{ else }false)$$
     yields $$\text{if }true\text{ then }true\text{ else }false$$

  - $$[x:=true]x$$
    yields $$true$$

  - $$[x:=true](\text{if }x\text{ then }x\text{ else }y)$$
    yields $$\text{if }true\text{ then }true\text{ else }y$$

  - $$[x:=true]y$$
    yields $$y$$

  - $$[x:=true]false$$
    yields $$false$$ (vacuous substitution)

  - $$[x:=true](\lambda y:bool. \text{if }y\text{ then }x\text{ else }false)$$
    yields $$\lambda y:bool. \text{if }y\text{ then }true\text{ else }false$$

  - $$[x:=true](\lambda y:bool. x)$$
    yields $$\lambda y:bool. true$$

  - $$[x:=true](\lambda y:bool. y)$$
    yields $$\lambda y:bool. y$$

  - $$[x:=true](\lambda x:bool. x)$$
    yields $$\lambda x:bool. x$$

The last example is very important: substituting $$x$$ with $$true$$ in
$$\lambda x:bool. x$$ does _not_ yield $$\lambda x:bool. true$$!  The reason for
this is that the $$x$$ in the body of $$\lambda x:bool. x$$ is _bound_ by the
abstraction: it is a new, local name that just happens to be
spelled the same as some global name $$x$$.

Here is the definition, informally...

$$
  \begin{aligned}
    &[x:=s]x                &&= s \\
    &[x:=s]y                &&= y \;\{\text{if }x\neq y\} \\
    &[x:=s](\lambda x:A. t) &&= \lambda x:A. t \\
    &[x:=s](\lambda y:A. t) &&= \lambda y:A. [x:=s]t \;\{\text{if }x\neq y\} \\
    &[x:=s](t1\;t2)         &&= ([x:=s]t1) ([x:=s]t2) \\
    &[x:=s]true             &&= true \\
    &[x:=s]false            &&= false \\
    &[x:=s](\text{if }t1\text{ then }t2\text{ else }t3) &&=
       \text{if }[x:=s]t1\text{ then }[x:=s]t2\text{ else }[x:=s]t3
  \end{aligned}
$$

... and formally:

<!--{% raw %}--><pre class="Agda">
<a name="12298" href="Stlc.html#12298" class="Function Operator"
      >[_:=_]_</a
      ><a name="12305"
      > </a
      ><a name="12306" class="Symbol"
      >:</a
      ><a name="12307"
      > </a
      ><a name="12308" href="Maps.html#2638" class="Datatype"
      >Id</a
      ><a name="12310"
      > </a
      ><a name="12311" class="Symbol"
      >-&gt;</a
      ><a name="12313"
      > </a
      ><a name="12314" href="Stlc.html#5753" class="Datatype"
      >Term</a
      ><a name="12318"
      > </a
      ><a name="12319" class="Symbol"
      >-&gt;</a
      ><a name="12321"
      > </a
      ><a name="12322" href="Stlc.html#5753" class="Datatype"
      >Term</a
      ><a name="12326"
      > </a
      ><a name="12327" class="Symbol"
      >-&gt;</a
      ><a name="12329"
      > </a
      ><a name="12330" href="Stlc.html#5753" class="Datatype"
      >Term</a
      ><a name="12334"
      >
</a
      ><a name="12335" href="Stlc.html#12298" class="Function Operator"
      >[</a
      ><a name="12336"
      > </a
      ><a name="12337" href="Stlc.html#12337" class="Bound"
      >x</a
      ><a name="12338"
      > </a
      ><a name="12339" href="Stlc.html#12298" class="Function Operator"
      >:=</a
      ><a name="12341"
      > </a
      ><a name="12342" href="Stlc.html#12342" class="Bound"
      >v</a
      ><a name="12343"
      > </a
      ><a name="12344" href="Stlc.html#12298" class="Function Operator"
      >]</a
      ><a name="12345"
      > </a
      ><a name="12346" class="Symbol"
      >(</a
      ><a name="12347" href="Stlc.html#5772" class="InductiveConstructor"
      >var</a
      ><a name="12350"
      > </a
      ><a name="12351" href="Stlc.html#12351" class="Bound"
      >y</a
      ><a name="12352" class="Symbol"
      >)</a
      ><a name="12353"
      > </a
      ><a name="12354" class="Keyword"
      >with</a
      ><a name="12358"
      > </a
      ><a name="12359" href="Stlc.html#12337" class="Bound"
      >x</a
      ><a name="12360"
      > </a
      ><a name="12361" href="Maps.html#2692" class="Function Operator"
      >&#8799;</a
      ><a name="12362"
      > </a
      ><a name="12363" href="Stlc.html#12351" class="Bound"
      >y</a
      ><a name="12364"
      >
</a
      ><a name="12365" class="Symbol"
      >...</a
      ><a name="12368"
      > </a
      ><a name="12369" class="Symbol"
      >|</a
      ><a name="12370"
      > </a
      ><a name="12371" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="12374"
      > </a
      ><a name="12375" href="Stlc.html#12375" class="Bound"
      >x=y</a
      ><a name="12378"
      > </a
      ><a name="12379" class="Symbol"
      >=</a
      ><a name="12380"
      > </a
      ><a name="12381" href="Stlc.html#12342" class="Bound"
      >v</a
      ><a name="12382"
      >
</a
      ><a name="12383" class="Symbol"
      >...</a
      ><a name="12386"
      > </a
      ><a name="12387" class="Symbol"
      >|</a
      ><a name="12388"
      > </a
      ><a name="12389" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="12391"
      >  </a
      ><a name="12393" href="Stlc.html#12393" class="Bound"
      >x&#8800;y</a
      ><a name="12396"
      > </a
      ><a name="12397" class="Symbol"
      >=</a
      ><a name="12398"
      > </a
      ><a name="12399" href="Stlc.html#5772" class="InductiveConstructor"
      >var</a
      ><a name="12402"
      > </a
      ><a name="12403" href="Stlc.html#12351" class="Bound"
      >y</a
      ><a name="12404"
      >
</a
      ><a name="12405" href="Stlc.html#12298" class="Function Operator"
      >[</a
      ><a name="12406"
      > </a
      ><a name="12407" href="Stlc.html#12407" class="Bound"
      >x</a
      ><a name="12408"
      > </a
      ><a name="12409" href="Stlc.html#12298" class="Function Operator"
      >:=</a
      ><a name="12411"
      > </a
      ><a name="12412" href="Stlc.html#12412" class="Bound"
      >v</a
      ><a name="12413"
      > </a
      ><a name="12414" href="Stlc.html#12298" class="Function Operator"
      >]</a
      ><a name="12415"
      > </a
      ><a name="12416" class="Symbol"
      >(</a
      ><a name="12417" href="Stlc.html#5792" class="InductiveConstructor"
      >app</a
      ><a name="12420"
      > </a
      ><a name="12421" href="Stlc.html#12421" class="Bound"
      >s</a
      ><a name="12422"
      > </a
      ><a name="12423" href="Stlc.html#12423" class="Bound"
      >t</a
      ><a name="12424" class="Symbol"
      >)</a
      ><a name="12425"
      > </a
      ><a name="12426" class="Symbol"
      >=</a
      ><a name="12427"
      > </a
      ><a name="12428" href="Stlc.html#5792" class="InductiveConstructor"
      >app</a
      ><a name="12431"
      > </a
      ><a name="12432" class="Symbol"
      >(</a
      ><a name="12433" href="Stlc.html#12298" class="Function Operator"
      >[</a
      ><a name="12434"
      > </a
      ><a name="12435" href="Stlc.html#12407" class="Bound"
      >x</a
      ><a name="12436"
      > </a
      ><a name="12437" href="Stlc.html#12298" class="Function Operator"
      >:=</a
      ><a name="12439"
      > </a
      ><a name="12440" href="Stlc.html#12412" class="Bound"
      >v</a
      ><a name="12441"
      > </a
      ><a name="12442" href="Stlc.html#12298" class="Function Operator"
      >]</a
      ><a name="12443"
      > </a
      ><a name="12444" href="Stlc.html#12421" class="Bound"
      >s</a
      ><a name="12445" class="Symbol"
      >)</a
      ><a name="12446"
      > </a
      ><a name="12447" class="Symbol"
      >(</a
      ><a name="12448" href="Stlc.html#12298" class="Function Operator"
      >[</a
      ><a name="12449"
      > </a
      ><a name="12450" href="Stlc.html#12407" class="Bound"
      >x</a
      ><a name="12451"
      > </a
      ><a name="12452" href="Stlc.html#12298" class="Function Operator"
      >:=</a
      ><a name="12454"
      > </a
      ><a name="12455" href="Stlc.html#12412" class="Bound"
      >v</a
      ><a name="12456"
      > </a
      ><a name="12457" href="Stlc.html#12298" class="Function Operator"
      >]</a
      ><a name="12458"
      > </a
      ><a name="12459" href="Stlc.html#12423" class="Bound"
      >t</a
      ><a name="12460" class="Symbol"
      >)</a
      ><a name="12461"
      >
</a
      ><a name="12462" href="Stlc.html#12298" class="Function Operator"
      >[</a
      ><a name="12463"
      > </a
      ><a name="12464" href="Stlc.html#12464" class="Bound"
      >x</a
      ><a name="12465"
      > </a
      ><a name="12466" href="Stlc.html#12298" class="Function Operator"
      >:=</a
      ><a name="12468"
      > </a
      ><a name="12469" href="Stlc.html#12469" class="Bound"
      >v</a
      ><a name="12470"
      > </a
      ><a name="12471" href="Stlc.html#12298" class="Function Operator"
      >]</a
      ><a name="12472"
      > </a
      ><a name="12473" class="Symbol"
      >(</a
      ><a name="12474" href="Stlc.html#5821" class="InductiveConstructor"
      >abs</a
      ><a name="12477"
      > </a
      ><a name="12478" href="Stlc.html#12478" class="Bound"
      >y</a
      ><a name="12479"
      > </a
      ><a name="12480" href="Stlc.html#12480" class="Bound"
      >A</a
      ><a name="12481"
      > </a
      ><a name="12482" href="Stlc.html#12482" class="Bound"
      >t</a
      ><a name="12483" class="Symbol"
      >)</a
      ><a name="12484"
      > </a
      ><a name="12485" class="Keyword"
      >with</a
      ><a name="12489"
      > </a
      ><a name="12490" href="Stlc.html#12464" class="Bound"
      >x</a
      ><a name="12491"
      > </a
      ><a name="12492" href="Maps.html#2692" class="Function Operator"
      >&#8799;</a
      ><a name="12493"
      > </a
      ><a name="12494" href="Stlc.html#12478" class="Bound"
      >y</a
      ><a name="12495"
      >
</a
      ><a name="12496" class="Symbol"
      >...</a
      ><a name="12499"
      > </a
      ><a name="12500" class="Symbol"
      >|</a
      ><a name="12501"
      > </a
      ><a name="12502" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="12505"
      > </a
      ><a name="12506" href="Stlc.html#12506" class="Bound"
      >x=y</a
      ><a name="12509"
      > </a
      ><a name="12510" class="Symbol"
      >=</a
      ><a name="12511"
      > </a
      ><a name="12512" href="Stlc.html#5821" class="InductiveConstructor"
      >abs</a
      ><a name="12515"
      > </a
      ><a name="12516" href="Stlc.html#12478" class="Bound"
      >y</a
      ><a name="12517"
      > </a
      ><a name="12518" href="Stlc.html#12480" class="Bound"
      >A</a
      ><a name="12519"
      > </a
      ><a name="12520" href="Stlc.html#12482" class="Bound"
      >t</a
      ><a name="12521"
      >
</a
      ><a name="12522" class="Symbol"
      >...</a
      ><a name="12525"
      > </a
      ><a name="12526" class="Symbol"
      >|</a
      ><a name="12527"
      > </a
      ><a name="12528" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="12530"
      >  </a
      ><a name="12532" href="Stlc.html#12532" class="Bound"
      >x&#8800;y</a
      ><a name="12535"
      > </a
      ><a name="12536" class="Symbol"
      >=</a
      ><a name="12537"
      > </a
      ><a name="12538" href="Stlc.html#5821" class="InductiveConstructor"
      >abs</a
      ><a name="12541"
      > </a
      ><a name="12542" href="Stlc.html#12478" class="Bound"
      >y</a
      ><a name="12543"
      > </a
      ><a name="12544" href="Stlc.html#12480" class="Bound"
      >A</a
      ><a name="12545"
      > </a
      ><a name="12546" class="Symbol"
      >(</a
      ><a name="12547" href="Stlc.html#12298" class="Function Operator"
      >[</a
      ><a name="12548"
      > </a
      ><a name="12549" href="Stlc.html#12464" class="Bound"
      >x</a
      ><a name="12550"
      > </a
      ><a name="12551" href="Stlc.html#12298" class="Function Operator"
      >:=</a
      ><a name="12553"
      > </a
      ><a name="12554" href="Stlc.html#12469" class="Bound"
      >v</a
      ><a name="12555"
      > </a
      ><a name="12556" href="Stlc.html#12298" class="Function Operator"
      >]</a
      ><a name="12557"
      > </a
      ><a name="12558" href="Stlc.html#12482" class="Bound"
      >t</a
      ><a name="12559" class="Symbol"
      >)</a
      ><a name="12560"
      >
</a
      ><a name="12561" href="Stlc.html#12298" class="Function Operator"
      >[</a
      ><a name="12562"
      > </a
      ><a name="12563" href="Stlc.html#12563" class="Bound"
      >x</a
      ><a name="12564"
      > </a
      ><a name="12565" href="Stlc.html#12298" class="Function Operator"
      >:=</a
      ><a name="12567"
      > </a
      ><a name="12568" href="Stlc.html#12568" class="Bound"
      >v</a
      ><a name="12569"
      > </a
      ><a name="12570" href="Stlc.html#12298" class="Function Operator"
      >]</a
      ><a name="12571"
      > </a
      ><a name="12572" href="Stlc.html#5855" class="InductiveConstructor"
      >true</a
      ><a name="12576"
      >  </a
      ><a name="12578" class="Symbol"
      >=</a
      ><a name="12579"
      > </a
      ><a name="12580" href="Stlc.html#5855" class="InductiveConstructor"
      >true</a
      ><a name="12584"
      >
</a
      ><a name="12585" href="Stlc.html#12298" class="Function Operator"
      >[</a
      ><a name="12586"
      > </a
      ><a name="12587" href="Stlc.html#12587" class="Bound"
      >x</a
      ><a name="12588"
      > </a
      ><a name="12589" href="Stlc.html#12298" class="Function Operator"
      >:=</a
      ><a name="12591"
      > </a
      ><a name="12592" href="Stlc.html#12592" class="Bound"
      >v</a
      ><a name="12593"
      > </a
      ><a name="12594" href="Stlc.html#12298" class="Function Operator"
      >]</a
      ><a name="12595"
      > </a
      ><a name="12596" href="Stlc.html#5870" class="InductiveConstructor"
      >false</a
      ><a name="12601"
      > </a
      ><a name="12602" class="Symbol"
      >=</a
      ><a name="12603"
      > </a
      ><a name="12604" href="Stlc.html#5870" class="InductiveConstructor"
      >false</a
      ><a name="12609"
      >
</a
      ><a name="12610" href="Stlc.html#12298" class="Function Operator"
      >[</a
      ><a name="12611"
      > </a
      ><a name="12612" href="Stlc.html#12612" class="Bound"
      >x</a
      ><a name="12613"
      > </a
      ><a name="12614" href="Stlc.html#12298" class="Function Operator"
      >:=</a
      ><a name="12616"
      > </a
      ><a name="12617" href="Stlc.html#12617" class="Bound"
      >v</a
      ><a name="12618"
      > </a
      ><a name="12619" href="Stlc.html#12298" class="Function Operator"
      >]</a
      ><a name="12620"
      > </a
      ><a name="12621" class="Symbol"
      >(</a
      ><a name="12622" href="Stlc.html#5885" class="InductiveConstructor Operator"
      >if</a
      ><a name="12624"
      > </a
      ><a name="12625" href="Stlc.html#12625" class="Bound"
      >s</a
      ><a name="12626"
      > </a
      ><a name="12627" href="Stlc.html#5885" class="InductiveConstructor Operator"
      >then</a
      ><a name="12631"
      > </a
      ><a name="12632" href="Stlc.html#12632" class="Bound"
      >t</a
      ><a name="12633"
      > </a
      ><a name="12634" href="Stlc.html#5885" class="InductiveConstructor Operator"
      >else</a
      ><a name="12638"
      > </a
      ><a name="12639" href="Stlc.html#12639" class="Bound"
      >u</a
      ><a name="12640" class="Symbol"
      >)</a
      ><a name="12641"
      > </a
      ><a name="12642" class="Symbol"
      >=</a
      ><a name="12643"
      >
  </a
      ><a name="12646" href="Stlc.html#5885" class="InductiveConstructor Operator"
      >if</a
      ><a name="12648"
      > </a
      ><a name="12649" href="Stlc.html#12298" class="Function Operator"
      >[</a
      ><a name="12650"
      > </a
      ><a name="12651" href="Stlc.html#12612" class="Bound"
      >x</a
      ><a name="12652"
      > </a
      ><a name="12653" href="Stlc.html#12298" class="Function Operator"
      >:=</a
      ><a name="12655"
      > </a
      ><a name="12656" href="Stlc.html#12617" class="Bound"
      >v</a
      ><a name="12657"
      > </a
      ><a name="12658" href="Stlc.html#12298" class="Function Operator"
      >]</a
      ><a name="12659"
      > </a
      ><a name="12660" href="Stlc.html#12625" class="Bound"
      >s</a
      ><a name="12661"
      > </a
      ><a name="12662" href="Stlc.html#5885" class="InductiveConstructor Operator"
      >then</a
      ><a name="12666"
      > </a
      ><a name="12667" href="Stlc.html#12298" class="Function Operator"
      >[</a
      ><a name="12668"
      > </a
      ><a name="12669" href="Stlc.html#12612" class="Bound"
      >x</a
      ><a name="12670"
      > </a
      ><a name="12671" href="Stlc.html#12298" class="Function Operator"
      >:=</a
      ><a name="12673"
      > </a
      ><a name="12674" href="Stlc.html#12617" class="Bound"
      >v</a
      ><a name="12675"
      > </a
      ><a name="12676" href="Stlc.html#12298" class="Function Operator"
      >]</a
      ><a name="12677"
      > </a
      ><a name="12678" href="Stlc.html#12632" class="Bound"
      >t</a
      ><a name="12679"
      > </a
      ><a name="12680" href="Stlc.html#5885" class="InductiveConstructor Operator"
      >else</a
      ><a name="12684"
      >  </a
      ><a name="12686" href="Stlc.html#12298" class="Function Operator"
      >[</a
      ><a name="12687"
      > </a
      ><a name="12688" href="Stlc.html#12612" class="Bound"
      >x</a
      ><a name="12689"
      > </a
      ><a name="12690" href="Stlc.html#12298" class="Function Operator"
      >:=</a
      ><a name="12692"
      > </a
      ><a name="12693" href="Stlc.html#12617" class="Bound"
      >v</a
      ><a name="12694"
      > </a
      ><a name="12695" href="Stlc.html#12298" class="Function Operator"
      >]</a
      ><a name="12696"
      > </a
      ><a name="12697" href="Stlc.html#12639" class="Bound"
      >u</a
      >
</pre><!--{% endraw %}-->

<div class="hidden">
<!--{% raw %}--><pre class="Agda">
<a name="12745" class="Keyword"
      >infix</a
      ><a name="12750"
      > </a
      ><a name="12751" class="Number"
      >9</a
      >
</pre><!--{% endraw %}-->
</div>

_Technical note_: Substitution becomes trickier to define if we
consider the case where $$s$$, the term being substituted for a
variable in some other term, may itself contain free variables.
Since we are only interested here in defining the small-step relation
on closed terms (i.e., terms like $$\lambda x:bool. x$$ that include
binders for all of the variables they mention), we can avoid this
extra complexity here, but it must be dealt with when formalizing
richer languages.


#### Exercise: 3 stars (subst-correct)
The definition that we gave above defines substitution as a _function_.
Suppose, instead, we wanted to define substitution as an inductive _relation_.
We've begun the definition by providing the `data` header and
one of the constructors; your job is to fill in the rest of the constructors
and prove that the relation you've defined coincides with the function given
above.
<!--{% raw %}--><pre class="Agda">
<a name="13689" class="Keyword"
      >data</a
      ><a name="13693"
      > </a
      ><a name="13694" href="Stlc.html#13694" class="Datatype Operator"
      >[_:=_]_==&gt;_</a
      ><a name="13705"
      > </a
      ><a name="13706" class="Symbol"
      >(</a
      ><a name="13707" href="Stlc.html#13707" class="Bound"
      >x</a
      ><a name="13708"
      > </a
      ><a name="13709" class="Symbol"
      >:</a
      ><a name="13710"
      > </a
      ><a name="13711" href="Maps.html#2638" class="Datatype"
      >Id</a
      ><a name="13713" class="Symbol"
      >)</a
      ><a name="13714"
      > </a
      ><a name="13715" class="Symbol"
      >(</a
      ><a name="13716" href="Stlc.html#13716" class="Bound"
      >s</a
      ><a name="13717"
      > </a
      ><a name="13718" class="Symbol"
      >:</a
      ><a name="13719"
      > </a
      ><a name="13720" href="Stlc.html#5753" class="Datatype"
      >Term</a
      ><a name="13724" class="Symbol"
      >)</a
      ><a name="13725"
      > </a
      ><a name="13726" class="Symbol"
      >:</a
      ><a name="13727"
      > </a
      ><a name="13728" href="Stlc.html#5753" class="Datatype"
      >Term</a
      ><a name="13732"
      > </a
      ><a name="13733" class="Symbol"
      >-&gt;</a
      ><a name="13735"
      > </a
      ><a name="13736" href="Stlc.html#5753" class="Datatype"
      >Term</a
      ><a name="13740"
      > </a
      ><a name="13741" class="Symbol"
      >-&gt;</a
      ><a name="13743"
      > </a
      ><a name="13744" class="PrimitiveType"
      >Set</a
      ><a name="13747"
      > </a
      ><a name="13748" class="Keyword"
      >where</a
      ><a name="13753"
      >
  </a
      ><a name="13756" href="Stlc.html#13756" class="InductiveConstructor"
      >var1</a
      ><a name="13760"
      > </a
      ><a name="13761" class="Symbol"
      >:</a
      ><a name="13762"
      > </a
      ><a name="13763" href="Stlc.html#13694" class="Datatype Operator"
      >[</a
      ><a name="13764"
      > </a
      ><a name="13765" href="Stlc.html#13707" class="Bound"
      >x</a
      ><a name="13766"
      > </a
      ><a name="13767" href="Stlc.html#13694" class="Datatype Operator"
      >:=</a
      ><a name="13769"
      > </a
      ><a name="13770" href="Stlc.html#13716" class="Bound"
      >s</a
      ><a name="13771"
      > </a
      ><a name="13772" href="Stlc.html#13694" class="Datatype Operator"
      >]</a
      ><a name="13773"
      > </a
      ><a name="13774" class="Symbol"
      >(</a
      ><a name="13775" href="Stlc.html#5772" class="InductiveConstructor"
      >var</a
      ><a name="13778"
      > </a
      ><a name="13779" href="Stlc.html#13707" class="Bound"
      >x</a
      ><a name="13780" class="Symbol"
      >)</a
      ><a name="13781"
      > </a
      ><a name="13782" href="Stlc.html#13694" class="Datatype Operator"
      >==&gt;</a
      ><a name="13785"
      > </a
      ><a name="13786" href="Stlc.html#13716" class="Bound"
      >s</a
      ><a name="13787"
      >
  </a
      ><a name="13790" class="Comment"
      >{- FILL IN HERE -}</a
      >
</pre><!--{% endraw %}-->

<!--{% raw %}--><pre class="Agda">
<a name="13834" class="Keyword"
      >postulate</a
      ><a name="13843"
      >
  </a
      ><a name="13846" href="Stlc.html#13846" class="Postulate"
      >subst-correct</a
      ><a name="13859"
      > </a
      ><a name="13860" class="Symbol"
      >:</a
      ><a name="13861"
      > </a
      ><a name="13862" class="Symbol"
      >&#8704;</a
      ><a name="13863"
      > </a
      ><a name="13864" href="Stlc.html#13864" class="Bound"
      >s</a
      ><a name="13865"
      > </a
      ><a name="13866" href="Stlc.html#13866" class="Bound"
      >x</a
      ><a name="13867"
      > </a
      ><a name="13868" href="Stlc.html#13868" class="Bound"
      >t</a
      ><a name="13869"
      > </a
      ><a name="13870" href="Stlc.html#13870" class="Bound"
      >t'</a
      ><a name="13872"
      >
                </a
      ><a name="13889" class="Symbol"
      >&#8594;</a
      ><a name="13890"
      > </a
      ><a name="13891" href="Stlc.html#12298" class="Function Operator"
      >[</a
      ><a name="13892"
      > </a
      ><a name="13893" href="Stlc.html#13866" class="Bound"
      >x</a
      ><a name="13894"
      > </a
      ><a name="13895" href="Stlc.html#12298" class="Function Operator"
      >:=</a
      ><a name="13897"
      > </a
      ><a name="13898" href="Stlc.html#13864" class="Bound"
      >s</a
      ><a name="13899"
      > </a
      ><a name="13900" href="Stlc.html#12298" class="Function Operator"
      >]</a
      ><a name="13901"
      > </a
      ><a name="13902" href="Stlc.html#13868" class="Bound"
      >t</a
      ><a name="13903"
      > </a
      ><a name="13904" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="13905"
      > </a
      ><a name="13906" href="Stlc.html#13870" class="Bound"
      >t'</a
      ><a name="13908"
      >
                </a
      ><a name="13925" class="Symbol"
      >&#8594;</a
      ><a name="13926"
      > </a
      ><a name="13927" href="Stlc.html#13694" class="Datatype Operator"
      >[</a
      ><a name="13928"
      > </a
      ><a name="13929" href="Stlc.html#13866" class="Bound"
      >x</a
      ><a name="13930"
      > </a
      ><a name="13931" href="Stlc.html#13694" class="Datatype Operator"
      >:=</a
      ><a name="13933"
      > </a
      ><a name="13934" href="Stlc.html#13864" class="Bound"
      >s</a
      ><a name="13935"
      > </a
      ><a name="13936" href="Stlc.html#13694" class="Datatype Operator"
      >]</a
      ><a name="13937"
      > </a
      ><a name="13938" href="Stlc.html#13868" class="Bound"
      >t</a
      ><a name="13939"
      > </a
      ><a name="13940" href="Stlc.html#13694" class="Datatype Operator"
      >==&gt;</a
      ><a name="13943"
      > </a
      ><a name="13944" href="Stlc.html#13870" class="Bound"
      >t'</a
      >
</pre><!--{% endraw %}-->


### Reduction

The small-step reduction relation for STLC now follows the
same pattern as the ones we have seen before.  Intuitively, to
reduce a function application, we first reduce its left-hand
side (the function) until it becomes an abstraction; then we
reduce its right-hand side (the argument) until it is also a
value; and finally we substitute the argument for the bound
variable in the body of the abstraction.  This last rule, written
informally as

$$
(\lambda x : A . t) v \Longrightarrow [x:=v]t
$$

is traditionally called "beta-reduction".

$$
\begin{array}{cl}
  \frac{value(v)}{(\lambda x : A . t) v \Longrightarrow [x:=v]t}&(red)\\\\
  \frac{s \Longrightarrow s'}{s\;t \Longrightarrow s'\;t}&(app1)\\\\
  \frac{value(v)\quad t \Longrightarrow t'}{v\;t \Longrightarrow v\;t'}&(app2)
\end{array}
$$

... plus the usual rules for booleans:

$$
\begin{array}{cl}
  \frac{}{(\text{if }true\text{ then }t_1\text{ else }t_2) \Longrightarrow t_1}&(iftrue)\\\\
  \frac{}{(\text{if }false\text{ then }t_1\text{ else }t_2) \Longrightarrow t_2}&(iffalse)\\\\
  \frac{s \Longrightarrow s'}{\text{if }s\text{ then }t_1\text{ else }t_2
    \Longrightarrow \text{if }s\text{ then }t_1\text{ else }t_2}&(if)
\end{array}
$$

Formally:

<!--{% raw %}--><pre class="Agda">
<a name="15210" class="Keyword"
      >data</a
      ><a name="15214"
      > </a
      ><a name="15215" href="Stlc.html#15215" class="Datatype Operator"
      >_==&gt;_</a
      ><a name="15220"
      > </a
      ><a name="15221" class="Symbol"
      >:</a
      ><a name="15222"
      > </a
      ><a name="15223" href="Stlc.html#5753" class="Datatype"
      >Term</a
      ><a name="15227"
      > </a
      ><a name="15228" class="Symbol"
      >&#8594;</a
      ><a name="15229"
      > </a
      ><a name="15230" href="Stlc.html#5753" class="Datatype"
      >Term</a
      ><a name="15234"
      > </a
      ><a name="15235" class="Symbol"
      >&#8594;</a
      ><a name="15236"
      > </a
      ><a name="15237" class="PrimitiveType"
      >Set</a
      ><a name="15240"
      > </a
      ><a name="15241" class="Keyword"
      >where</a
      ><a name="15246"
      >
  </a
      ><a name="15249" href="Stlc.html#15249" class="InductiveConstructor"
      >red</a
      ><a name="15252"
      >     </a
      ><a name="15257" class="Symbol"
      >:</a
      ><a name="15258"
      > </a
      ><a name="15259" class="Symbol"
      >&#8704;</a
      ><a name="15260"
      > </a
      ><a name="15261" class="Symbol"
      >{</a
      ><a name="15262" href="Stlc.html#15262" class="Bound"
      >x</a
      ><a name="15263"
      > </a
      ><a name="15264" href="Stlc.html#15264" class="Bound"
      >A</a
      ><a name="15265"
      > </a
      ><a name="15266" href="Stlc.html#15266" class="Bound"
      >s</a
      ><a name="15267"
      > </a
      ><a name="15268" href="Stlc.html#15268" class="Bound"
      >t</a
      ><a name="15269" class="Symbol"
      >}</a
      ><a name="15270"
      >
          </a
      ><a name="15281" class="Symbol"
      >&#8594;</a
      ><a name="15282"
      > </a
      ><a name="15283" href="Stlc.html#9078" class="Datatype"
      >Value</a
      ><a name="15288"
      > </a
      ><a name="15289" href="Stlc.html#15268" class="Bound"
      >t</a
      ><a name="15290"
      >
          </a
      ><a name="15301" class="Symbol"
      >&#8594;</a
      ><a name="15302"
      > </a
      ><a name="15303" href="Stlc.html#5792" class="InductiveConstructor"
      >app</a
      ><a name="15306"
      > </a
      ><a name="15307" class="Symbol"
      >(</a
      ><a name="15308" href="Stlc.html#5821" class="InductiveConstructor"
      >abs</a
      ><a name="15311"
      > </a
      ><a name="15312" href="Stlc.html#15262" class="Bound"
      >x</a
      ><a name="15313"
      > </a
      ><a name="15314" href="Stlc.html#15264" class="Bound"
      >A</a
      ><a name="15315"
      > </a
      ><a name="15316" href="Stlc.html#15266" class="Bound"
      >s</a
      ><a name="15317" class="Symbol"
      >)</a
      ><a name="15318"
      > </a
      ><a name="15319" href="Stlc.html#15268" class="Bound"
      >t</a
      ><a name="15320"
      > </a
      ><a name="15321" href="Stlc.html#15215" class="Datatype Operator"
      >==&gt;</a
      ><a name="15324"
      > </a
      ><a name="15325" href="Stlc.html#12298" class="Function Operator"
      >[</a
      ><a name="15326"
      > </a
      ><a name="15327" href="Stlc.html#15262" class="Bound"
      >x</a
      ><a name="15328"
      > </a
      ><a name="15329" href="Stlc.html#12298" class="Function Operator"
      >:=</a
      ><a name="15331"
      > </a
      ><a name="15332" href="Stlc.html#15268" class="Bound"
      >t</a
      ><a name="15333"
      > </a
      ><a name="15334" href="Stlc.html#12298" class="Function Operator"
      >]</a
      ><a name="15335"
      > </a
      ><a name="15336" href="Stlc.html#15266" class="Bound"
      >s</a
      ><a name="15337"
      >
  </a
      ><a name="15340" href="Stlc.html#15340" class="InductiveConstructor"
      >app1</a
      ><a name="15344"
      >    </a
      ><a name="15348" class="Symbol"
      >:</a
      ><a name="15349"
      > </a
      ><a name="15350" class="Symbol"
      >&#8704;</a
      ><a name="15351"
      > </a
      ><a name="15352" class="Symbol"
      >{</a
      ><a name="15353" href="Stlc.html#15353" class="Bound"
      >s</a
      ><a name="15354"
      > </a
      ><a name="15355" href="Stlc.html#15355" class="Bound"
      >s'</a
      ><a name="15357"
      > </a
      ><a name="15358" href="Stlc.html#15358" class="Bound"
      >t</a
      ><a name="15359" class="Symbol"
      >}</a
      ><a name="15360"
      >
          </a
      ><a name="15371" class="Symbol"
      >&#8594;</a
      ><a name="15372"
      > </a
      ><a name="15373" href="Stlc.html#15353" class="Bound"
      >s</a
      ><a name="15374"
      > </a
      ><a name="15375" href="Stlc.html#15215" class="Datatype Operator"
      >==&gt;</a
      ><a name="15378"
      > </a
      ><a name="15379" href="Stlc.html#15355" class="Bound"
      >s'</a
      ><a name="15381"
      >
          </a
      ><a name="15392" class="Symbol"
      >&#8594;</a
      ><a name="15393"
      > </a
      ><a name="15394" href="Stlc.html#5792" class="InductiveConstructor"
      >app</a
      ><a name="15397"
      > </a
      ><a name="15398" href="Stlc.html#15353" class="Bound"
      >s</a
      ><a name="15399"
      > </a
      ><a name="15400" href="Stlc.html#15358" class="Bound"
      >t</a
      ><a name="15401"
      > </a
      ><a name="15402" href="Stlc.html#15215" class="Datatype Operator"
      >==&gt;</a
      ><a name="15405"
      > </a
      ><a name="15406" href="Stlc.html#5792" class="InductiveConstructor"
      >app</a
      ><a name="15409"
      > </a
      ><a name="15410" href="Stlc.html#15355" class="Bound"
      >s'</a
      ><a name="15412"
      > </a
      ><a name="15413" href="Stlc.html#15358" class="Bound"
      >t</a
      ><a name="15414"
      >
  </a
      ><a name="15417" href="Stlc.html#15417" class="InductiveConstructor"
      >app2</a
      ><a name="15421"
      >    </a
      ><a name="15425" class="Symbol"
      >:</a
      ><a name="15426"
      > </a
      ><a name="15427" class="Symbol"
      >&#8704;</a
      ><a name="15428"
      > </a
      ><a name="15429" class="Symbol"
      >{</a
      ><a name="15430" href="Stlc.html#15430" class="Bound"
      >s</a
      ><a name="15431"
      > </a
      ><a name="15432" href="Stlc.html#15432" class="Bound"
      >t</a
      ><a name="15433"
      > </a
      ><a name="15434" href="Stlc.html#15434" class="Bound"
      >t'</a
      ><a name="15436" class="Symbol"
      >}</a
      ><a name="15437"
      >
          </a
      ><a name="15448" class="Symbol"
      >&#8594;</a
      ><a name="15449"
      > </a
      ><a name="15450" href="Stlc.html#9078" class="Datatype"
      >Value</a
      ><a name="15455"
      > </a
      ><a name="15456" href="Stlc.html#15430" class="Bound"
      >s</a
      ><a name="15457"
      >
          </a
      ><a name="15468" class="Symbol"
      >&#8594;</a
      ><a name="15469"
      > </a
      ><a name="15470" href="Stlc.html#15432" class="Bound"
      >t</a
      ><a name="15471"
      > </a
      ><a name="15472" href="Stlc.html#15215" class="Datatype Operator"
      >==&gt;</a
      ><a name="15475"
      > </a
      ><a name="15476" href="Stlc.html#15434" class="Bound"
      >t'</a
      ><a name="15478"
      >
          </a
      ><a name="15489" class="Symbol"
      >&#8594;</a
      ><a name="15490"
      > </a
      ><a name="15491" href="Stlc.html#5792" class="InductiveConstructor"
      >app</a
      ><a name="15494"
      > </a
      ><a name="15495" href="Stlc.html#15430" class="Bound"
      >s</a
      ><a name="15496"
      > </a
      ><a name="15497" href="Stlc.html#15432" class="Bound"
      >t</a
      ><a name="15498"
      > </a
      ><a name="15499" href="Stlc.html#15215" class="Datatype Operator"
      >==&gt;</a
      ><a name="15502"
      > </a
      ><a name="15503" href="Stlc.html#5792" class="InductiveConstructor"
      >app</a
      ><a name="15506"
      > </a
      ><a name="15507" href="Stlc.html#15430" class="Bound"
      >s</a
      ><a name="15508"
      > </a
      ><a name="15509" href="Stlc.html#15434" class="Bound"
      >t'</a
      ><a name="15511"
      >
  </a
      ><a name="15514" href="Stlc.html#15514" class="InductiveConstructor"
      >if</a
      ><a name="15516"
      >      </a
      ><a name="15522" class="Symbol"
      >:</a
      ><a name="15523"
      > </a
      ><a name="15524" class="Symbol"
      >&#8704;</a
      ><a name="15525"
      > </a
      ><a name="15526" class="Symbol"
      >{</a
      ><a name="15527" href="Stlc.html#15527" class="Bound"
      >s</a
      ><a name="15528"
      > </a
      ><a name="15529" href="Stlc.html#15529" class="Bound"
      >s'</a
      ><a name="15531"
      > </a
      ><a name="15532" href="Stlc.html#15532" class="Bound"
      >t</a
      ><a name="15533"
      > </a
      ><a name="15534" href="Stlc.html#15534" class="Bound"
      >u</a
      ><a name="15535" class="Symbol"
      >}</a
      ><a name="15536"
      >
          </a
      ><a name="15547" class="Symbol"
      >&#8594;</a
      ><a name="15548"
      > </a
      ><a name="15549" href="Stlc.html#15527" class="Bound"
      >s</a
      ><a name="15550"
      > </a
      ><a name="15551" href="Stlc.html#15215" class="Datatype Operator"
      >==&gt;</a
      ><a name="15554"
      > </a
      ><a name="15555" href="Stlc.html#15529" class="Bound"
      >s'</a
      ><a name="15557"
      >
          </a
      ><a name="15568" class="Symbol"
      >&#8594;</a
      ><a name="15569"
      > </a
      ><a name="15570" href="Stlc.html#5885" class="InductiveConstructor Operator"
      >if</a
      ><a name="15572"
      > </a
      ><a name="15573" href="Stlc.html#15527" class="Bound"
      >s</a
      ><a name="15574"
      > </a
      ><a name="15575" href="Stlc.html#5885" class="InductiveConstructor Operator"
      >then</a
      ><a name="15579"
      > </a
      ><a name="15580" href="Stlc.html#15532" class="Bound"
      >t</a
      ><a name="15581"
      > </a
      ><a name="15582" href="Stlc.html#5885" class="InductiveConstructor Operator"
      >else</a
      ><a name="15586"
      > </a
      ><a name="15587" href="Stlc.html#15534" class="Bound"
      >u</a
      ><a name="15588"
      > </a
      ><a name="15589" href="Stlc.html#15215" class="Datatype Operator"
      >==&gt;</a
      ><a name="15592"
      > </a
      ><a name="15593" href="Stlc.html#5885" class="InductiveConstructor Operator"
      >if</a
      ><a name="15595"
      > </a
      ><a name="15596" href="Stlc.html#15529" class="Bound"
      >s'</a
      ><a name="15598"
      > </a
      ><a name="15599" href="Stlc.html#5885" class="InductiveConstructor Operator"
      >then</a
      ><a name="15603"
      > </a
      ><a name="15604" href="Stlc.html#15532" class="Bound"
      >t</a
      ><a name="15605"
      > </a
      ><a name="15606" href="Stlc.html#5885" class="InductiveConstructor Operator"
      >else</a
      ><a name="15610"
      > </a
      ><a name="15611" href="Stlc.html#15534" class="Bound"
      >u</a
      ><a name="15612"
      >
  </a
      ><a name="15615" href="Stlc.html#15615" class="InductiveConstructor"
      >iftrue</a
      ><a name="15621"
      >  </a
      ><a name="15623" class="Symbol"
      >:</a
      ><a name="15624"
      > </a
      ><a name="15625" class="Symbol"
      >&#8704;</a
      ><a name="15626"
      > </a
      ><a name="15627" class="Symbol"
      >{</a
      ><a name="15628" href="Stlc.html#15628" class="Bound"
      >s</a
      ><a name="15629"
      > </a
      ><a name="15630" href="Stlc.html#15630" class="Bound"
      >t</a
      ><a name="15631" class="Symbol"
      >}</a
      ><a name="15632"
      >
          </a
      ><a name="15643" class="Symbol"
      >&#8594;</a
      ><a name="15644"
      > </a
      ><a name="15645" href="Stlc.html#5885" class="InductiveConstructor Operator"
      >if</a
      ><a name="15647"
      > </a
      ><a name="15648" href="Stlc.html#5855" class="InductiveConstructor"
      >true</a
      ><a name="15652"
      > </a
      ><a name="15653" href="Stlc.html#5885" class="InductiveConstructor Operator"
      >then</a
      ><a name="15657"
      > </a
      ><a name="15658" href="Stlc.html#15628" class="Bound"
      >s</a
      ><a name="15659"
      > </a
      ><a name="15660" href="Stlc.html#5885" class="InductiveConstructor Operator"
      >else</a
      ><a name="15664"
      > </a
      ><a name="15665" href="Stlc.html#15630" class="Bound"
      >t</a
      ><a name="15666"
      > </a
      ><a name="15667" href="Stlc.html#15215" class="Datatype Operator"
      >==&gt;</a
      ><a name="15670"
      > </a
      ><a name="15671" href="Stlc.html#15628" class="Bound"
      >s</a
      ><a name="15672"
      >
  </a
      ><a name="15675" href="Stlc.html#15675" class="InductiveConstructor"
      >iffalse</a
      ><a name="15682"
      > </a
      ><a name="15683" class="Symbol"
      >:</a
      ><a name="15684"
      > </a
      ><a name="15685" class="Symbol"
      >&#8704;</a
      ><a name="15686"
      > </a
      ><a name="15687" class="Symbol"
      >{</a
      ><a name="15688" href="Stlc.html#15688" class="Bound"
      >s</a
      ><a name="15689"
      > </a
      ><a name="15690" href="Stlc.html#15690" class="Bound"
      >t</a
      ><a name="15691" class="Symbol"
      >}</a
      ><a name="15692"
      >
          </a
      ><a name="15703" class="Symbol"
      >&#8594;</a
      ><a name="15704"
      > </a
      ><a name="15705" href="Stlc.html#5885" class="InductiveConstructor Operator"
      >if</a
      ><a name="15707"
      > </a
      ><a name="15708" href="Stlc.html#5870" class="InductiveConstructor"
      >false</a
      ><a name="15713"
      > </a
      ><a name="15714" href="Stlc.html#5885" class="InductiveConstructor Operator"
      >then</a
      ><a name="15718"
      > </a
      ><a name="15719" href="Stlc.html#15688" class="Bound"
      >s</a
      ><a name="15720"
      > </a
      ><a name="15721" href="Stlc.html#5885" class="InductiveConstructor Operator"
      >else</a
      ><a name="15725"
      > </a
      ><a name="15726" href="Stlc.html#15690" class="Bound"
      >t</a
      ><a name="15727"
      > </a
      ><a name="15728" href="Stlc.html#15215" class="Datatype Operator"
      >==&gt;</a
      ><a name="15731"
      > </a
      ><a name="15732" href="Stlc.html#15690" class="Bound"
      >t</a
      >
</pre><!--{% endraw %}-->

<div class="hidden">
<!--{% raw %}--><pre class="Agda">
<a name="15780" class="Keyword"
      >infix</a
      ><a name="15785"
      > </a
      ><a name="15786" class="Number"
      >1</a
      >
</pre><!--{% endraw %}-->
</div>

<!--{% raw %}--><pre class="Agda">
<a name="15826" class="Keyword"
      >data</a
      ><a name="15830"
      > </a
      ><a name="15831" href="Stlc.html#15831" class="Datatype"
      >Multi</a
      ><a name="15836"
      > </a
      ><a name="15837" class="Symbol"
      >(</a
      ><a name="15838" href="Stlc.html#15838" class="Bound"
      >R</a
      ><a name="15839"
      > </a
      ><a name="15840" class="Symbol"
      >:</a
      ><a name="15841"
      > </a
      ><a name="15842" href="Stlc.html#5753" class="Datatype"
      >Term</a
      ><a name="15846"
      > </a
      ><a name="15847" class="Symbol"
      >&#8594;</a
      ><a name="15848"
      > </a
      ><a name="15849" href="Stlc.html#5753" class="Datatype"
      >Term</a
      ><a name="15853"
      > </a
      ><a name="15854" class="Symbol"
      >&#8594;</a
      ><a name="15855"
      > </a
      ><a name="15856" class="PrimitiveType"
      >Set</a
      ><a name="15859" class="Symbol"
      >)</a
      ><a name="15860"
      > </a
      ><a name="15861" class="Symbol"
      >:</a
      ><a name="15862"
      > </a
      ><a name="15863" href="Stlc.html#5753" class="Datatype"
      >Term</a
      ><a name="15867"
      > </a
      ><a name="15868" class="Symbol"
      >&#8594;</a
      ><a name="15869"
      > </a
      ><a name="15870" href="Stlc.html#5753" class="Datatype"
      >Term</a
      ><a name="15874"
      > </a
      ><a name="15875" class="Symbol"
      >&#8594;</a
      ><a name="15876"
      > </a
      ><a name="15877" class="PrimitiveType"
      >Set</a
      ><a name="15880"
      > </a
      ><a name="15881" class="Keyword"
      >where</a
      ><a name="15886"
      >
  </a
      ><a name="15889" href="Stlc.html#15889" class="InductiveConstructor"
      >refl</a
      ><a name="15893"
      > </a
      ><a name="15894" class="Symbol"
      >:</a
      ><a name="15895"
      > </a
      ><a name="15896" class="Symbol"
      >&#8704;</a
      ><a name="15897"
      > </a
      ><a name="15898" class="Symbol"
      >{</a
      ><a name="15899" href="Stlc.html#15899" class="Bound"
      >x</a
      ><a name="15900" class="Symbol"
      >}</a
      ><a name="15901"
      > </a
      ><a name="15902" class="Symbol"
      >-&gt;</a
      ><a name="15904"
      > </a
      ><a name="15905" href="Stlc.html#15831" class="Datatype"
      >Multi</a
      ><a name="15910"
      > </a
      ><a name="15911" href="Stlc.html#15838" class="Bound"
      >R</a
      ><a name="15912"
      > </a
      ><a name="15913" href="Stlc.html#15899" class="Bound"
      >x</a
      ><a name="15914"
      > </a
      ><a name="15915" href="Stlc.html#15899" class="Bound"
      >x</a
      ><a name="15916"
      >
  </a
      ><a name="15919" href="Stlc.html#15919" class="InductiveConstructor"
      >step</a
      ><a name="15923"
      > </a
      ><a name="15924" class="Symbol"
      >:</a
      ><a name="15925"
      > </a
      ><a name="15926" class="Symbol"
      >&#8704;</a
      ><a name="15927"
      > </a
      ><a name="15928" class="Symbol"
      >{</a
      ><a name="15929" href="Stlc.html#15929" class="Bound"
      >x</a
      ><a name="15930"
      > </a
      ><a name="15931" href="Stlc.html#15931" class="Bound"
      >y</a
      ><a name="15932"
      > </a
      ><a name="15933" href="Stlc.html#15933" class="Bound"
      >z</a
      ><a name="15934" class="Symbol"
      >}</a
      ><a name="15935"
      > </a
      ><a name="15936" class="Symbol"
      >-&gt;</a
      ><a name="15938"
      > </a
      ><a name="15939" href="Stlc.html#15838" class="Bound"
      >R</a
      ><a name="15940"
      > </a
      ><a name="15941" href="Stlc.html#15929" class="Bound"
      >x</a
      ><a name="15942"
      > </a
      ><a name="15943" href="Stlc.html#15931" class="Bound"
      >y</a
      ><a name="15944"
      > </a
      ><a name="15945" class="Symbol"
      >-&gt;</a
      ><a name="15947"
      > </a
      ><a name="15948" href="Stlc.html#15831" class="Datatype"
      >Multi</a
      ><a name="15953"
      > </a
      ><a name="15954" href="Stlc.html#15838" class="Bound"
      >R</a
      ><a name="15955"
      > </a
      ><a name="15956" href="Stlc.html#15931" class="Bound"
      >y</a
      ><a name="15957"
      > </a
      ><a name="15958" href="Stlc.html#15933" class="Bound"
      >z</a
      ><a name="15959"
      > </a
      ><a name="15960" class="Symbol"
      >-&gt;</a
      ><a name="15962"
      > </a
      ><a name="15963" href="Stlc.html#15831" class="Datatype"
      >Multi</a
      ><a name="15968"
      > </a
      ><a name="15969" href="Stlc.html#15838" class="Bound"
      >R</a
      ><a name="15970"
      > </a
      ><a name="15971" href="Stlc.html#15929" class="Bound"
      >x</a
      ><a name="15972"
      > </a
      ><a name="15973" href="Stlc.html#15933" class="Bound"
      >z</a
      >
</pre><!--{% endraw %}-->

<!--{% raw %}--><pre class="Agda">
<a name="16000" href="Stlc.html#16000" class="Function Operator"
      >_==&gt;*_</a
      ><a name="16006"
      > </a
      ><a name="16007" class="Symbol"
      >:</a
      ><a name="16008"
      > </a
      ><a name="16009" href="Stlc.html#5753" class="Datatype"
      >Term</a
      ><a name="16013"
      > </a
      ><a name="16014" class="Symbol"
      >&#8594;</a
      ><a name="16015"
      > </a
      ><a name="16016" href="Stlc.html#5753" class="Datatype"
      >Term</a
      ><a name="16020"
      > </a
      ><a name="16021" class="Symbol"
      >&#8594;</a
      ><a name="16022"
      > </a
      ><a name="16023" class="PrimitiveType"
      >Set</a
      ><a name="16026"
      >
</a
      ><a name="16027" href="Stlc.html#16000" class="Function Operator"
      >_==&gt;*_</a
      ><a name="16033"
      > </a
      ><a name="16034" class="Symbol"
      >=</a
      ><a name="16035"
      > </a
      ><a name="16036" href="Stlc.html#15831" class="Datatype"
      >Multi</a
      ><a name="16041"
      > </a
      ><a name="16042" href="Stlc.html#15215" class="Datatype Operator"
      >_==&gt;_</a
      >
</pre><!--{% endraw %}-->

<div class="hidden">
<!--{% raw %}--><pre class="Agda">
<a name="16094" class="Symbol"
      >{-#</a
      ><a name="16097"
      > </a
      ><a name="16098" class="Keyword"
      >DISPLAY</a
      ><a name="16105"
      > </a
      ><a name="16106" href="Stlc.html#15831" class="Datatype"
      >Multi</a
      ><a name="16111"
      > </a
      ><a name="16112" href="Stlc.html#16112" class="Bound Operator"
      >_==&gt;_</a
      ><a name="16117"
      > = </a
      ><a name="16120" href="Stlc.html#16000" class="Function Operator"
      >_==&gt;*_</a
      ><a name="16126"
      > </a
      ><a name="16127" class="Symbol"
      >#-}</a
      >
</pre><!--{% endraw %}-->
</div>

### Examples

Example:

$$((\lambda x:bool\rightarrow bool. x) (\lambda x:bool. x)) \Longrightarrow^* (\lambda x:bool. x)$$.

<!--{% raw %}--><pre class="Agda">
<a name="16289" href="Stlc.html#16289" class="Function"
      >step-example1</a
      ><a name="16302"
      > </a
      ><a name="16303" class="Symbol"
      >:</a
      ><a name="16304"
      > </a
      ><a name="16305" class="Symbol"
      >(</a
      ><a name="16306" href="Stlc.html#5792" class="InductiveConstructor"
      >app</a
      ><a name="16309"
      > </a
      ><a name="16310" href="Stlc.html#6689" class="Function"
      >idBB</a
      ><a name="16314"
      > </a
      ><a name="16315" href="Stlc.html#6583" class="Function"
      >idB</a
      ><a name="16318" class="Symbol"
      >)</a
      ><a name="16319"
      > </a
      ><a name="16320" href="Stlc.html#16000" class="Function Operator"
      >==&gt;*</a
      ><a name="16324"
      > </a
      ><a name="16325" href="Stlc.html#6583" class="Function"
      >idB</a
      ><a name="16328"
      >
</a
      ><a name="16329" href="Stlc.html#16289" class="Function"
      >step-example1</a
      ><a name="16342"
      > </a
      ><a name="16343" class="Symbol"
      >=</a
      ><a name="16344"
      > </a
      ><a name="16345" href="Stlc.html#15919" class="InductiveConstructor"
      >step</a
      ><a name="16349"
      > </a
      ><a name="16350" class="Symbol"
      >(</a
      ><a name="16351" href="Stlc.html#15249" class="InductiveConstructor"
      >red</a
      ><a name="16354"
      > </a
      ><a name="16355" href="Stlc.html#9105" class="InductiveConstructor"
      >abs</a
      ><a name="16358" class="Symbol"
      >)</a
      ><a name="16359"
      >
              </a
      ><a name="16374" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="16375"
      > </a
      ><a name="16376" href="Stlc.html#15889" class="InductiveConstructor"
      >refl</a
      >
</pre><!--{% endraw %}-->

Example:

$$(\lambda x:bool\rightarrow bool. x) \;((\lambda x:bool\rightarrow bool. x)\;(\lambda x:bool. x))) \Longrightarrow^* (\lambda x:bool. x)$$.

<!--{% raw %}--><pre class="Agda">
<a name="16558" href="Stlc.html#16558" class="Function"
      >step-example2</a
      ><a name="16571"
      > </a
      ><a name="16572" class="Symbol"
      >:</a
      ><a name="16573"
      > </a
      ><a name="16574" class="Symbol"
      >(</a
      ><a name="16575" href="Stlc.html#5792" class="InductiveConstructor"
      >app</a
      ><a name="16578"
      > </a
      ><a name="16579" href="Stlc.html#6689" class="Function"
      >idBB</a
      ><a name="16583"
      > </a
      ><a name="16584" class="Symbol"
      >(</a
      ><a name="16585" href="Stlc.html#5792" class="InductiveConstructor"
      >app</a
      ><a name="16588"
      > </a
      ><a name="16589" href="Stlc.html#6689" class="Function"
      >idBB</a
      ><a name="16593"
      > </a
      ><a name="16594" href="Stlc.html#6583" class="Function"
      >idB</a
      ><a name="16597" class="Symbol"
      >))</a
      ><a name="16599"
      > </a
      ><a name="16600" href="Stlc.html#16000" class="Function Operator"
      >==&gt;*</a
      ><a name="16604"
      > </a
      ><a name="16605" href="Stlc.html#6583" class="Function"
      >idB</a
      ><a name="16608"
      >
</a
      ><a name="16609" href="Stlc.html#16558" class="Function"
      >step-example2</a
      ><a name="16622"
      > </a
      ><a name="16623" class="Symbol"
      >=</a
      ><a name="16624"
      > </a
      ><a name="16625" href="Stlc.html#15919" class="InductiveConstructor"
      >step</a
      ><a name="16629"
      > </a
      ><a name="16630" class="Symbol"
      >(</a
      ><a name="16631" href="Stlc.html#15417" class="InductiveConstructor"
      >app2</a
      ><a name="16635"
      > </a
      ><a name="16636" href="Stlc.html#9105" class="InductiveConstructor"
      >abs</a
      ><a name="16639"
      > </a
      ><a name="16640" class="Symbol"
      >(</a
      ><a name="16641" href="Stlc.html#15249" class="InductiveConstructor"
      >red</a
      ><a name="16644"
      > </a
      ><a name="16645" href="Stlc.html#9105" class="InductiveConstructor"
      >abs</a
      ><a name="16648" class="Symbol"
      >))</a
      ><a name="16650"
      >
              </a
      ><a name="16665" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="16666"
      > </a
      ><a name="16667" href="Stlc.html#15919" class="InductiveConstructor"
      >step</a
      ><a name="16671"
      > </a
      ><a name="16672" class="Symbol"
      >(</a
      ><a name="16673" href="Stlc.html#15249" class="InductiveConstructor"
      >red</a
      ><a name="16676"
      > </a
      ><a name="16677" href="Stlc.html#9105" class="InductiveConstructor"
      >abs</a
      ><a name="16680" class="Symbol"
      >)</a
      ><a name="16681"
      >
              </a
      ><a name="16696" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="16697"
      > </a
      ><a name="16698" href="Stlc.html#15889" class="InductiveConstructor"
      >refl</a
      >
</pre><!--{% endraw %}-->

Example:

$$((\lambda x:bool\rightarrow bool. x)\;(\lambda x:bool. \text{if }x\text{ then }false\text{ else }true))\;true\Longrightarrow^* false$$.

<!--{% raw %}--><pre class="Agda">
<a name="16877" href="Stlc.html#16877" class="Function"
      >step-example3</a
      ><a name="16890"
      > </a
      ><a name="16891" class="Symbol"
      >:</a
      ><a name="16892"
      > </a
      ><a name="16893" class="Symbol"
      >(</a
      ><a name="16894" href="Stlc.html#5792" class="InductiveConstructor"
      >app</a
      ><a name="16897"
      > </a
      ><a name="16898" class="Symbol"
      >(</a
      ><a name="16899" href="Stlc.html#5792" class="InductiveConstructor"
      >app</a
      ><a name="16902"
      > </a
      ><a name="16903" href="Stlc.html#6689" class="Function"
      >idBB</a
      ><a name="16907"
      > </a
      ><a name="16908" href="Stlc.html#7122" class="Function"
      >notB</a
      ><a name="16912" class="Symbol"
      >)</a
      ><a name="16913"
      > </a
      ><a name="16914" href="Stlc.html#5855" class="InductiveConstructor"
      >true</a
      ><a name="16918" class="Symbol"
      >)</a
      ><a name="16919"
      > </a
      ><a name="16920" href="Stlc.html#16000" class="Function Operator"
      >==&gt;*</a
      ><a name="16924"
      > </a
      ><a name="16925" href="Stlc.html#5870" class="InductiveConstructor"
      >false</a
      ><a name="16930"
      >
</a
      ><a name="16931" href="Stlc.html#16877" class="Function"
      >step-example3</a
      ><a name="16944"
      > </a
      ><a name="16945" class="Symbol"
      >=</a
      ><a name="16946"
      > </a
      ><a name="16947" href="Stlc.html#15919" class="InductiveConstructor"
      >step</a
      ><a name="16951"
      > </a
      ><a name="16952" class="Symbol"
      >(</a
      ><a name="16953" href="Stlc.html#15340" class="InductiveConstructor"
      >app1</a
      ><a name="16957"
      > </a
      ><a name="16958" class="Symbol"
      >(</a
      ><a name="16959" href="Stlc.html#15249" class="InductiveConstructor"
      >red</a
      ><a name="16962"
      > </a
      ><a name="16963" href="Stlc.html#9105" class="InductiveConstructor"
      >abs</a
      ><a name="16966" class="Symbol"
      >))</a
      ><a name="16968"
      >
              </a
      ><a name="16983" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="16984"
      > </a
      ><a name="16985" href="Stlc.html#15919" class="InductiveConstructor"
      >step</a
      ><a name="16989"
      > </a
      ><a name="16990" class="Symbol"
      >(</a
      ><a name="16991" href="Stlc.html#15249" class="InductiveConstructor"
      >red</a
      ><a name="16994"
      > </a
      ><a name="16995" href="Stlc.html#9153" class="InductiveConstructor"
      >true</a
      ><a name="16999" class="Symbol"
      >)</a
      ><a name="17000"
      >
              </a
      ><a name="17015" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="17016"
      > </a
      ><a name="17017" href="Stlc.html#15919" class="InductiveConstructor"
      >step</a
      ><a name="17021"
      > </a
      ><a name="17022" href="Stlc.html#15615" class="InductiveConstructor"
      >iftrue</a
      ><a name="17028"
      >
              </a
      ><a name="17043" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="17044"
      > </a
      ><a name="17045" href="Stlc.html#15889" class="InductiveConstructor"
      >refl</a
      >
</pre><!--{% endraw %}-->

Example:

$$((\lambda x:bool\rightarrow bool. x)\;((\lambda x:bool. \text{if }x\text{ then }false\text{ else }true)\;true))\Longrightarrow^* false$$.

<!--{% raw %}--><pre class="Agda">
<a name="17226" href="Stlc.html#17226" class="Function"
      >step-example4</a
      ><a name="17239"
      > </a
      ><a name="17240" class="Symbol"
      >:</a
      ><a name="17241"
      > </a
      ><a name="17242" class="Symbol"
      >(</a
      ><a name="17243" href="Stlc.html#5792" class="InductiveConstructor"
      >app</a
      ><a name="17246"
      > </a
      ><a name="17247" href="Stlc.html#6689" class="Function"
      >idBB</a
      ><a name="17251"
      > </a
      ><a name="17252" class="Symbol"
      >(</a
      ><a name="17253" href="Stlc.html#5792" class="InductiveConstructor"
      >app</a
      ><a name="17256"
      > </a
      ><a name="17257" href="Stlc.html#7122" class="Function"
      >notB</a
      ><a name="17261"
      > </a
      ><a name="17262" href="Stlc.html#5855" class="InductiveConstructor"
      >true</a
      ><a name="17266" class="Symbol"
      >))</a
      ><a name="17268"
      > </a
      ><a name="17269" href="Stlc.html#16000" class="Function Operator"
      >==&gt;*</a
      ><a name="17273"
      > </a
      ><a name="17274" href="Stlc.html#5870" class="InductiveConstructor"
      >false</a
      ><a name="17279"
      >
</a
      ><a name="17280" href="Stlc.html#17226" class="Function"
      >step-example4</a
      ><a name="17293"
      > </a
      ><a name="17294" class="Symbol"
      >=</a
      ><a name="17295"
      > </a
      ><a name="17296" href="Stlc.html#15919" class="InductiveConstructor"
      >step</a
      ><a name="17300"
      > </a
      ><a name="17301" class="Symbol"
      >(</a
      ><a name="17302" href="Stlc.html#15417" class="InductiveConstructor"
      >app2</a
      ><a name="17306"
      > </a
      ><a name="17307" href="Stlc.html#9105" class="InductiveConstructor"
      >abs</a
      ><a name="17310"
      > </a
      ><a name="17311" class="Symbol"
      >(</a
      ><a name="17312" href="Stlc.html#15249" class="InductiveConstructor"
      >red</a
      ><a name="17315"
      > </a
      ><a name="17316" href="Stlc.html#9153" class="InductiveConstructor"
      >true</a
      ><a name="17320" class="Symbol"
      >))</a
      ><a name="17322"
      >
              </a
      ><a name="17337" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="17338"
      > </a
      ><a name="17339" href="Stlc.html#15919" class="InductiveConstructor"
      >step</a
      ><a name="17343"
      > </a
      ><a name="17344" class="Symbol"
      >(</a
      ><a name="17345" href="Stlc.html#15417" class="InductiveConstructor"
      >app2</a
      ><a name="17349"
      > </a
      ><a name="17350" href="Stlc.html#9105" class="InductiveConstructor"
      >abs</a
      ><a name="17353"
      > </a
      ><a name="17354" href="Stlc.html#15615" class="InductiveConstructor"
      >iftrue</a
      ><a name="17360" class="Symbol"
      >)</a
      ><a name="17361"
      >
              </a
      ><a name="17376" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="17377"
      > </a
      ><a name="17378" href="Stlc.html#15919" class="InductiveConstructor"
      >step</a
      ><a name="17382"
      > </a
      ><a name="17383" class="Symbol"
      >(</a
      ><a name="17384" href="Stlc.html#15249" class="InductiveConstructor"
      >red</a
      ><a name="17387"
      > </a
      ><a name="17388" href="Stlc.html#9174" class="InductiveConstructor"
      >false</a
      ><a name="17393" class="Symbol"
      >)</a
      ><a name="17394"
      >
              </a
      ><a name="17409" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="17410"
      > </a
      ><a name="17411" href="Stlc.html#15889" class="InductiveConstructor"
      >refl</a
      >
</pre><!--{% endraw %}-->

#### Exercise: 2 stars (step-example5)

<!--{% raw %}--><pre class="Agda">
<a name="17481" class="Keyword"
      >postulate</a
      ><a name="17490"
      >
  </a
      ><a name="17493" href="Stlc.html#17493" class="Postulate"
      >step-example5</a
      ><a name="17506"
      > </a
      ><a name="17507" class="Symbol"
      >:</a
      ><a name="17508"
      > </a
      ><a name="17509" class="Symbol"
      >(</a
      ><a name="17510" href="Stlc.html#5792" class="InductiveConstructor"
      >app</a
      ><a name="17513"
      > </a
      ><a name="17514" class="Symbol"
      >(</a
      ><a name="17515" href="Stlc.html#5792" class="InductiveConstructor"
      >app</a
      ><a name="17518"
      > </a
      ><a name="17519" href="Stlc.html#6843" class="Function"
      >idBBBB</a
      ><a name="17525"
      > </a
      ><a name="17526" href="Stlc.html#6689" class="Function"
      >idBB</a
      ><a name="17530" class="Symbol"
      >)</a
      ><a name="17531"
      > </a
      ><a name="17532" href="Stlc.html#6583" class="Function"
      >idB</a
      ><a name="17535" class="Symbol"
      >)</a
      ><a name="17536"
      > </a
      ><a name="17537" href="Stlc.html#16000" class="Function Operator"
      >==&gt;*</a
      ><a name="17541"
      > </a
      ><a name="17542" href="Stlc.html#6583" class="Function"
      >idB</a
      >
</pre><!--{% endraw %}-->

## Typing

Next we consider the typing relation of the STLC.

### Contexts

_Question_: What is the type of the term "$$x\;y$$"?

_Answer_: It depends on the types of $$x$$ and $$y$$!

I.e., in order to assign a type to a term, we need to know
what assumptions we should make about the types of its free
variables.

This leads us to a three-place _typing judgment_, informally
written $$\Gamma\vdash t : A$$, where $$\Gamma$$ is a
"typing context"---a mapping from variables to their types.

Informally, we'll write $$\Gamma , x:A$$ for "extend the partial function
$$\Gamma$$ to also map $$x$$ to $$A$$."  Formally, we use the function `_,_∶_`
(or "update") to add a binding to a context.

<!--{% raw %}--><pre class="Agda">
<a name="18262" href="Stlc.html#18262" class="Function"
      >Ctxt</a
      ><a name="18266"
      > </a
      ><a name="18267" class="Symbol"
      >:</a
      ><a name="18268"
      > </a
      ><a name="18269" class="PrimitiveType"
      >Set</a
      ><a name="18272"
      >
</a
      ><a name="18273" href="Stlc.html#18262" class="Function"
      >Ctxt</a
      ><a name="18277"
      > </a
      ><a name="18278" class="Symbol"
      >=</a
      ><a name="18279"
      > </a
      ><a name="18280" href="Maps.html#9758" class="Function"
      >PartialMap</a
      ><a name="18290"
      > </a
      ><a name="18291" href="Stlc.html#5586" class="Datatype"
      >Type</a
      ><a name="18295"
      >

</a
      ><a name="18297" href="Stlc.html#18297" class="Function"
      >&#8709;</a
      ><a name="18298"
      > </a
      ><a name="18299" class="Symbol"
      >:</a
      ><a name="18300"
      > </a
      ><a name="18301" href="Stlc.html#18262" class="Function"
      >Ctxt</a
      ><a name="18305"
      >
</a
      ><a name="18306" href="Stlc.html#18297" class="Function"
      >&#8709;</a
      ><a name="18307"
      > </a
      ><a name="18308" class="Symbol"
      >=</a
      ><a name="18309"
      > </a
      ><a name="18310" href="Maps.html#9891" class="Function"
      >PartialMap.empty</a
      ><a name="18326"
      >

</a
      ><a name="18328" href="Stlc.html#18328" class="Function Operator"
      >_,_&#8758;_</a
      ><a name="18333"
      > </a
      ><a name="18334" class="Symbol"
      >:</a
      ><a name="18335"
      > </a
      ><a name="18336" href="Stlc.html#18262" class="Function"
      >Ctxt</a
      ><a name="18340"
      > </a
      ><a name="18341" class="Symbol"
      >-&gt;</a
      ><a name="18343"
      > </a
      ><a name="18344" href="Maps.html#2638" class="Datatype"
      >Id</a
      ><a name="18346"
      > </a
      ><a name="18347" class="Symbol"
      >-&gt;</a
      ><a name="18349"
      > </a
      ><a name="18350" href="Stlc.html#5586" class="Datatype"
      >Type</a
      ><a name="18354"
      > </a
      ><a name="18355" class="Symbol"
      >-&gt;</a
      ><a name="18357"
      > </a
      ><a name="18358" href="Stlc.html#18262" class="Function"
      >Ctxt</a
      ><a name="18362"
      >
</a
      ><a name="18363" href="Stlc.html#18328" class="Function Operator"
      >_,_&#8758;_</a
      ><a name="18368"
      > </a
      ><a name="18369" class="Symbol"
      >=</a
      ><a name="18370"
      > </a
      ><a name="18371" href="Maps.html#9980" class="Function"
      >PartialMap.update</a
      >
</pre><!--{% endraw %}-->

<div class="hidden">
<!--{% raw %}--><pre class="Agda">
<a name="18435" class="Keyword"
      >infixl</a
      ><a name="18441"
      > </a
      ><a name="18442" class="Number"
      >3</a
      >
</pre><!--{% endraw %}-->
</div>


### Typing Relation

$$
  \begin{array}{cl}
  \frac{\Gamma\;x = A}{\Gamma\vdash{x:A}}&(var)\\\\
  \frac{\Gamma,x:A\vdash t:B}{\Gamma\vdash (\lambda x:A.t) : A\rightarrow B}&(abs)\\\\
  \frac{\Gamma\vdash s:A\rightarrow B\quad\Gamma\vdash t:A}{\Gamma\vdash (s\;t) : B}&(app)\\\\
  \frac{}{\Gamma\vdash true : bool}&(true)\\\\
  \frac{}{\Gamma\vdash false : bool}&(true)\\\\
  \frac{\Gamma\vdash s:bool \quad \Gamma\vdash t1:A \quad \Gamma\vdash t2:A}{\Gamma\vdash\text{if }s\text{ then }t1\text{ else }t2 : A}&(if)
  \end{array}
$$

We can read the three-place relation $$\Gamma\vdash (t : A)$$ as:
"to the term $$t$$ we can assign the type $$A$$ using as types for
the free variables of $$t$$ the ones specified in the context
$$\Gamma$$."

<!--{% raw %}--><pre class="Agda">
<a name="19224" class="Keyword"
      >data</a
      ><a name="19228"
      > </a
      ><a name="19229" href="Stlc.html#19229" class="Datatype Operator"
      >_&#8866;_&#8758;_</a
      ><a name="19234"
      > </a
      ><a name="19235" class="Symbol"
      >:</a
      ><a name="19236"
      > </a
      ><a name="19237" href="Stlc.html#18262" class="Function"
      >Ctxt</a
      ><a name="19241"
      > </a
      ><a name="19242" class="Symbol"
      >-&gt;</a
      ><a name="19244"
      > </a
      ><a name="19245" href="Stlc.html#5753" class="Datatype"
      >Term</a
      ><a name="19249"
      > </a
      ><a name="19250" class="Symbol"
      >-&gt;</a
      ><a name="19252"
      > </a
      ><a name="19253" href="Stlc.html#5586" class="Datatype"
      >Type</a
      ><a name="19257"
      > </a
      ><a name="19258" class="Symbol"
      >-&gt;</a
      ><a name="19260"
      > </a
      ><a name="19261" class="PrimitiveType"
      >Set</a
      ><a name="19264"
      > </a
      ><a name="19265" class="Keyword"
      >where</a
      ><a name="19270"
      >
  </a
      ><a name="19273" href="Stlc.html#19273" class="InductiveConstructor"
      >var</a
      ><a name="19276"
      >           </a
      ><a name="19287" class="Symbol"
      >:</a
      ><a name="19288"
      > </a
      ><a name="19289" class="Symbol"
      >&#8704;</a
      ><a name="19290"
      > </a
      ><a name="19291" class="Symbol"
      >{</a
      ><a name="19292" href="Stlc.html#19292" class="Bound"
      >&#915;</a
      ><a name="19293" class="Symbol"
      >}</a
      ><a name="19294"
      > </a
      ><a name="19295" href="Stlc.html#19295" class="Bound"
      >x</a
      ><a name="19296"
      > </a
      ><a name="19297" class="Symbol"
      >{</a
      ><a name="19298" href="Stlc.html#19298" class="Bound"
      >A</a
      ><a name="19299" class="Symbol"
      >}</a
      ><a name="19300"
      >
                </a
      ><a name="19317" class="Symbol"
      >&#8594;</a
      ><a name="19318"
      > </a
      ><a name="19319" href="Stlc.html#19292" class="Bound"
      >&#915;</a
      ><a name="19320"
      > </a
      ><a name="19321" href="Stlc.html#19295" class="Bound"
      >x</a
      ><a name="19322"
      > </a
      ><a name="19323" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="19324"
      > </a
      ><a name="19325" href="https://agda.github.io/agda-stdlib/Data.Maybe.Base.html#373" class="InductiveConstructor"
      >just</a
      ><a name="19329"
      > </a
      ><a name="19330" href="Stlc.html#19298" class="Bound"
      >A</a
      ><a name="19331"
      >
                </a
      ><a name="19348" class="Symbol"
      >&#8594;</a
      ><a name="19349"
      > </a
      ><a name="19350" href="Stlc.html#19292" class="Bound"
      >&#915;</a
      ><a name="19351"
      > </a
      ><a name="19352" href="Stlc.html#19229" class="Datatype Operator"
      >&#8866;</a
      ><a name="19353"
      > </a
      ><a name="19354" href="Stlc.html#5772" class="InductiveConstructor"
      >var</a
      ><a name="19357"
      > </a
      ><a name="19358" href="Stlc.html#19295" class="Bound"
      >x</a
      ><a name="19359"
      > </a
      ><a name="19360" href="Stlc.html#19229" class="Datatype Operator"
      >&#8758;</a
      ><a name="19361"
      > </a
      ><a name="19362" href="Stlc.html#19298" class="Bound"
      >A</a
      ><a name="19363"
      >
  </a
      ><a name="19366" href="Stlc.html#19366" class="InductiveConstructor"
      >abs</a
      ><a name="19369"
      >           </a
      ><a name="19380" class="Symbol"
      >:</a
      ><a name="19381"
      > </a
      ><a name="19382" class="Symbol"
      >&#8704;</a
      ><a name="19383"
      > </a
      ><a name="19384" class="Symbol"
      >{</a
      ><a name="19385" href="Stlc.html#19385" class="Bound"
      >&#915;</a
      ><a name="19386" class="Symbol"
      >}</a
      ><a name="19387"
      > </a
      ><a name="19388" class="Symbol"
      >{</a
      ><a name="19389" href="Stlc.html#19389" class="Bound"
      >x</a
      ><a name="19390" class="Symbol"
      >}</a
      ><a name="19391"
      > </a
      ><a name="19392" class="Symbol"
      >{</a
      ><a name="19393" href="Stlc.html#19393" class="Bound"
      >A</a
      ><a name="19394" class="Symbol"
      >}</a
      ><a name="19395"
      > </a
      ><a name="19396" class="Symbol"
      >{</a
      ><a name="19397" href="Stlc.html#19397" class="Bound"
      >B</a
      ><a name="19398" class="Symbol"
      >}</a
      ><a name="19399"
      > </a
      ><a name="19400" class="Symbol"
      >{</a
      ><a name="19401" href="Stlc.html#19401" class="Bound"
      >s</a
      ><a name="19402" class="Symbol"
      >}</a
      ><a name="19403"
      >
                </a
      ><a name="19420" class="Symbol"
      >&#8594;</a
      ><a name="19421"
      > </a
      ><a name="19422" href="Stlc.html#19385" class="Bound"
      >&#915;</a
      ><a name="19423"
      > </a
      ><a name="19424" href="Stlc.html#18328" class="Function Operator"
      >,</a
      ><a name="19425"
      > </a
      ><a name="19426" href="Stlc.html#19389" class="Bound"
      >x</a
      ><a name="19427"
      > </a
      ><a name="19428" href="Stlc.html#18328" class="Function Operator"
      >&#8758;</a
      ><a name="19429"
      > </a
      ><a name="19430" href="Stlc.html#19393" class="Bound"
      >A</a
      ><a name="19431"
      > </a
      ><a name="19432" href="Stlc.html#19229" class="Datatype Operator"
      >&#8866;</a
      ><a name="19433"
      > </a
      ><a name="19434" href="Stlc.html#19401" class="Bound"
      >s</a
      ><a name="19435"
      > </a
      ><a name="19436" href="Stlc.html#19229" class="Datatype Operator"
      >&#8758;</a
      ><a name="19437"
      > </a
      ><a name="19438" href="Stlc.html#19397" class="Bound"
      >B</a
      ><a name="19439"
      >
                </a
      ><a name="19456" class="Symbol"
      >&#8594;</a
      ><a name="19457"
      > </a
      ><a name="19458" href="Stlc.html#19385" class="Bound"
      >&#915;</a
      ><a name="19459"
      > </a
      ><a name="19460" href="Stlc.html#19229" class="Datatype Operator"
      >&#8866;</a
      ><a name="19461"
      > </a
      ><a name="19462" href="Stlc.html#5821" class="InductiveConstructor"
      >abs</a
      ><a name="19465"
      > </a
      ><a name="19466" href="Stlc.html#19389" class="Bound"
      >x</a
      ><a name="19467"
      > </a
      ><a name="19468" href="Stlc.html#19393" class="Bound"
      >A</a
      ><a name="19469"
      > </a
      ><a name="19470" href="Stlc.html#19401" class="Bound"
      >s</a
      ><a name="19471"
      > </a
      ><a name="19472" href="Stlc.html#19229" class="Datatype Operator"
      >&#8758;</a
      ><a name="19473"
      > </a
      ><a name="19474" href="Stlc.html#19393" class="Bound"
      >A</a
      ><a name="19475"
      > </a
      ><a name="19476" href="Stlc.html#5619" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="19477"
      > </a
      ><a name="19478" href="Stlc.html#19397" class="Bound"
      >B</a
      ><a name="19479"
      >
  </a
      ><a name="19482" href="Stlc.html#19482" class="InductiveConstructor"
      >app</a
      ><a name="19485"
      >           </a
      ><a name="19496" class="Symbol"
      >:</a
      ><a name="19497"
      > </a
      ><a name="19498" class="Symbol"
      >&#8704;</a
      ><a name="19499"
      > </a
      ><a name="19500" class="Symbol"
      >{</a
      ><a name="19501" href="Stlc.html#19501" class="Bound"
      >&#915;</a
      ><a name="19502" class="Symbol"
      >}</a
      ><a name="19503"
      > </a
      ><a name="19504" class="Symbol"
      >{</a
      ><a name="19505" href="Stlc.html#19505" class="Bound"
      >A</a
      ><a name="19506" class="Symbol"
      >}</a
      ><a name="19507"
      > </a
      ><a name="19508" class="Symbol"
      >{</a
      ><a name="19509" href="Stlc.html#19509" class="Bound"
      >B</a
      ><a name="19510" class="Symbol"
      >}</a
      ><a name="19511"
      > </a
      ><a name="19512" class="Symbol"
      >{</a
      ><a name="19513" href="Stlc.html#19513" class="Bound"
      >s</a
      ><a name="19514" class="Symbol"
      >}</a
      ><a name="19515"
      > </a
      ><a name="19516" class="Symbol"
      >{</a
      ><a name="19517" href="Stlc.html#19517" class="Bound"
      >t</a
      ><a name="19518" class="Symbol"
      >}</a
      ><a name="19519"
      >
                </a
      ><a name="19536" class="Symbol"
      >&#8594;</a
      ><a name="19537"
      > </a
      ><a name="19538" href="Stlc.html#19501" class="Bound"
      >&#915;</a
      ><a name="19539"
      > </a
      ><a name="19540" href="Stlc.html#19229" class="Datatype Operator"
      >&#8866;</a
      ><a name="19541"
      > </a
      ><a name="19542" href="Stlc.html#19513" class="Bound"
      >s</a
      ><a name="19543"
      > </a
      ><a name="19544" href="Stlc.html#19229" class="Datatype Operator"
      >&#8758;</a
      ><a name="19545"
      > </a
      ><a name="19546" href="Stlc.html#19505" class="Bound"
      >A</a
      ><a name="19547"
      > </a
      ><a name="19548" href="Stlc.html#5619" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="19549"
      > </a
      ><a name="19550" href="Stlc.html#19509" class="Bound"
      >B</a
      ><a name="19551"
      >
                </a
      ><a name="19568" class="Symbol"
      >&#8594;</a
      ><a name="19569"
      > </a
      ><a name="19570" href="Stlc.html#19501" class="Bound"
      >&#915;</a
      ><a name="19571"
      > </a
      ><a name="19572" href="Stlc.html#19229" class="Datatype Operator"
      >&#8866;</a
      ><a name="19573"
      > </a
      ><a name="19574" href="Stlc.html#19517" class="Bound"
      >t</a
      ><a name="19575"
      > </a
      ><a name="19576" href="Stlc.html#19229" class="Datatype Operator"
      >&#8758;</a
      ><a name="19577"
      > </a
      ><a name="19578" href="Stlc.html#19505" class="Bound"
      >A</a
      ><a name="19579"
      >
                </a
      ><a name="19596" class="Symbol"
      >&#8594;</a
      ><a name="19597"
      > </a
      ><a name="19598" href="Stlc.html#19501" class="Bound"
      >&#915;</a
      ><a name="19599"
      > </a
      ><a name="19600" href="Stlc.html#19229" class="Datatype Operator"
      >&#8866;</a
      ><a name="19601"
      > </a
      ><a name="19602" href="Stlc.html#5792" class="InductiveConstructor"
      >app</a
      ><a name="19605"
      > </a
      ><a name="19606" href="Stlc.html#19513" class="Bound"
      >s</a
      ><a name="19607"
      > </a
      ><a name="19608" href="Stlc.html#19517" class="Bound"
      >t</a
      ><a name="19609"
      > </a
      ><a name="19610" href="Stlc.html#19229" class="Datatype Operator"
      >&#8758;</a
      ><a name="19611"
      > </a
      ><a name="19612" href="Stlc.html#19509" class="Bound"
      >B</a
      ><a name="19613"
      >
  </a
      ><a name="19616" href="Stlc.html#19616" class="InductiveConstructor"
      >true</a
      ><a name="19620"
      >          </a
      ><a name="19630" class="Symbol"
      >:</a
      ><a name="19631"
      > </a
      ><a name="19632" class="Symbol"
      >&#8704;</a
      ><a name="19633"
      > </a
      ><a name="19634" class="Symbol"
      >{</a
      ><a name="19635" href="Stlc.html#19635" class="Bound"
      >&#915;</a
      ><a name="19636" class="Symbol"
      >}</a
      ><a name="19637"
      >
                </a
      ><a name="19654" class="Symbol"
      >&#8594;</a
      ><a name="19655"
      > </a
      ><a name="19656" href="Stlc.html#19635" class="Bound"
      >&#915;</a
      ><a name="19657"
      > </a
      ><a name="19658" href="Stlc.html#19229" class="Datatype Operator"
      >&#8866;</a
      ><a name="19659"
      > </a
      ><a name="19660" href="Stlc.html#5855" class="InductiveConstructor"
      >true</a
      ><a name="19664"
      >  </a
      ><a name="19666" href="Stlc.html#19229" class="Datatype Operator"
      >&#8758;</a
      ><a name="19667"
      > </a
      ><a name="19668" href="Stlc.html#5605" class="InductiveConstructor"
      >bool</a
      ><a name="19672"
      >
  </a
      ><a name="19675" href="Stlc.html#19675" class="InductiveConstructor"
      >false</a
      ><a name="19680"
      >         </a
      ><a name="19689" class="Symbol"
      >:</a
      ><a name="19690"
      > </a
      ><a name="19691" class="Symbol"
      >&#8704;</a
      ><a name="19692"
      > </a
      ><a name="19693" class="Symbol"
      >{</a
      ><a name="19694" href="Stlc.html#19694" class="Bound"
      >&#915;</a
      ><a name="19695" class="Symbol"
      >}</a
      ><a name="19696"
      >
                </a
      ><a name="19713" class="Symbol"
      >&#8594;</a
      ><a name="19714"
      > </a
      ><a name="19715" href="Stlc.html#19694" class="Bound"
      >&#915;</a
      ><a name="19716"
      > </a
      ><a name="19717" href="Stlc.html#19229" class="Datatype Operator"
      >&#8866;</a
      ><a name="19718"
      > </a
      ><a name="19719" href="Stlc.html#5870" class="InductiveConstructor"
      >false</a
      ><a name="19724"
      > </a
      ><a name="19725" href="Stlc.html#19229" class="Datatype Operator"
      >&#8758;</a
      ><a name="19726"
      > </a
      ><a name="19727" href="Stlc.html#5605" class="InductiveConstructor"
      >bool</a
      ><a name="19731"
      >
  </a
      ><a name="19734" href="Stlc.html#19734" class="InductiveConstructor Operator"
      >if_then_else_</a
      ><a name="19747"
      > </a
      ><a name="19748" class="Symbol"
      >:</a
      ><a name="19749"
      > </a
      ><a name="19750" class="Symbol"
      >&#8704;</a
      ><a name="19751"
      > </a
      ><a name="19752" class="Symbol"
      >{</a
      ><a name="19753" href="Stlc.html#19753" class="Bound"
      >&#915;</a
      ><a name="19754" class="Symbol"
      >}</a
      ><a name="19755"
      > </a
      ><a name="19756" class="Symbol"
      >{</a
      ><a name="19757" href="Stlc.html#19757" class="Bound"
      >s</a
      ><a name="19758" class="Symbol"
      >}</a
      ><a name="19759"
      > </a
      ><a name="19760" class="Symbol"
      >{</a
      ><a name="19761" href="Stlc.html#19761" class="Bound"
      >t</a
      ><a name="19762" class="Symbol"
      >}</a
      ><a name="19763"
      > </a
      ><a name="19764" class="Symbol"
      >{</a
      ><a name="19765" href="Stlc.html#19765" class="Bound"
      >u</a
      ><a name="19766" class="Symbol"
      >}</a
      ><a name="19767"
      > </a
      ><a name="19768" class="Symbol"
      >{</a
      ><a name="19769" href="Stlc.html#19769" class="Bound"
      >A</a
      ><a name="19770" class="Symbol"
      >}</a
      ><a name="19771"
      >
                </a
      ><a name="19788" class="Symbol"
      >&#8594;</a
      ><a name="19789"
      > </a
      ><a name="19790" href="Stlc.html#19753" class="Bound"
      >&#915;</a
      ><a name="19791"
      > </a
      ><a name="19792" href="Stlc.html#19229" class="Datatype Operator"
      >&#8866;</a
      ><a name="19793"
      > </a
      ><a name="19794" href="Stlc.html#19757" class="Bound"
      >s</a
      ><a name="19795"
      > </a
      ><a name="19796" href="Stlc.html#19229" class="Datatype Operator"
      >&#8758;</a
      ><a name="19797"
      > </a
      ><a name="19798" href="Stlc.html#5605" class="InductiveConstructor"
      >bool</a
      ><a name="19802"
      >
                </a
      ><a name="19819" class="Symbol"
      >&#8594;</a
      ><a name="19820"
      > </a
      ><a name="19821" href="Stlc.html#19753" class="Bound"
      >&#915;</a
      ><a name="19822"
      > </a
      ><a name="19823" href="Stlc.html#19229" class="Datatype Operator"
      >&#8866;</a
      ><a name="19824"
      > </a
      ><a name="19825" href="Stlc.html#19761" class="Bound"
      >t</a
      ><a name="19826"
      > </a
      ><a name="19827" href="Stlc.html#19229" class="Datatype Operator"
      >&#8758;</a
      ><a name="19828"
      > </a
      ><a name="19829" href="Stlc.html#19769" class="Bound"
      >A</a
      ><a name="19830"
      >
                </a
      ><a name="19847" class="Symbol"
      >&#8594;</a
      ><a name="19848"
      > </a
      ><a name="19849" href="Stlc.html#19753" class="Bound"
      >&#915;</a
      ><a name="19850"
      > </a
      ><a name="19851" href="Stlc.html#19229" class="Datatype Operator"
      >&#8866;</a
      ><a name="19852"
      > </a
      ><a name="19853" href="Stlc.html#19765" class="Bound"
      >u</a
      ><a name="19854"
      > </a
      ><a name="19855" href="Stlc.html#19229" class="Datatype Operator"
      >&#8758;</a
      ><a name="19856"
      > </a
      ><a name="19857" href="Stlc.html#19769" class="Bound"
      >A</a
      ><a name="19858"
      >
                </a
      ><a name="19875" class="Symbol"
      >&#8594;</a
      ><a name="19876"
      > </a
      ><a name="19877" href="Stlc.html#19753" class="Bound"
      >&#915;</a
      ><a name="19878"
      > </a
      ><a name="19879" href="Stlc.html#19229" class="Datatype Operator"
      >&#8866;</a
      ><a name="19880"
      > </a
      ><a name="19881" href="Stlc.html#5885" class="InductiveConstructor Operator"
      >if</a
      ><a name="19883"
      > </a
      ><a name="19884" href="Stlc.html#19757" class="Bound"
      >s</a
      ><a name="19885"
      > </a
      ><a name="19886" href="Stlc.html#5885" class="InductiveConstructor Operator"
      >then</a
      ><a name="19890"
      > </a
      ><a name="19891" href="Stlc.html#19761" class="Bound"
      >t</a
      ><a name="19892"
      > </a
      ><a name="19893" href="Stlc.html#5885" class="InductiveConstructor Operator"
      >else</a
      ><a name="19897"
      > </a
      ><a name="19898" href="Stlc.html#19765" class="Bound"
      >u</a
      ><a name="19899"
      > </a
      ><a name="19900" href="Stlc.html#19229" class="Datatype Operator"
      >&#8758;</a
      ><a name="19901"
      > </a
      ><a name="19902" href="Stlc.html#19769" class="Bound"
      >A</a
      >
</pre><!--{% endraw %}-->

<div class="hidden">
<!--{% raw %}--><pre class="Agda">
<a name="19950" class="Keyword"
      >infix</a
      ><a name="19955"
      > </a
      ><a name="19956" class="Number"
      >1</a
      >
</pre><!--{% endraw %}-->
</div>


### Examples

<!--{% raw %}--><pre class="Agda">
<a name="20011" href="Stlc.html#20011" class="Function"
      >typing-example1</a
      ><a name="20026"
      > </a
      ><a name="20027" class="Symbol"
      >:</a
      ><a name="20028"
      > </a
      ><a name="20029" href="Stlc.html#18297" class="Function"
      >&#8709;</a
      ><a name="20030"
      > </a
      ><a name="20031" href="Stlc.html#19229" class="Datatype Operator"
      >&#8866;</a
      ><a name="20032"
      > </a
      ><a name="20033" href="Stlc.html#6583" class="Function"
      >idB</a
      ><a name="20036"
      > </a
      ><a name="20037" href="Stlc.html#19229" class="Datatype Operator"
      >&#8758;</a
      ><a name="20038"
      > </a
      ><a name="20039" href="Stlc.html#5605" class="InductiveConstructor"
      >bool</a
      ><a name="20043"
      > </a
      ><a name="20044" href="Stlc.html#5619" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="20045"
      > </a
      ><a name="20046" href="Stlc.html#5605" class="InductiveConstructor"
      >bool</a
      ><a name="20050"
      >
</a
      ><a name="20051" href="Stlc.html#20011" class="Function"
      >typing-example1</a
      ><a name="20066"
      > </a
      ><a name="20067" class="Symbol"
      >=</a
      ><a name="20068"
      > </a
      ><a name="20069" href="Stlc.html#19366" class="InductiveConstructor"
      >abs</a
      ><a name="20072"
      > </a
      ><a name="20073" class="Symbol"
      >(</a
      ><a name="20074" href="Stlc.html#19273" class="InductiveConstructor"
      >var</a
      ><a name="20077"
      > </a
      ><a name="20078" href="Stlc.html#6352" class="Function"
      >x</a
      ><a name="20079"
      > </a
      ><a name="20080" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="20084" class="Symbol"
      >)</a
      >
</pre><!--{% endraw %}-->

Another example:

$$\varnothing\vdash \lambda x:A. \lambda y:A\rightarrow A. y\;(y\;x) : A\rightarrow (A\rightarrow A)\rightarrow A$$.

<!--{% raw %}--><pre class="Agda">
<a name="20247" href="Stlc.html#20247" class="Function"
      >typing-example2</a
      ><a name="20262"
      > </a
      ><a name="20263" class="Symbol"
      >:</a
      ><a name="20264"
      > </a
      ><a name="20265" href="Stlc.html#18297" class="Function"
      >&#8709;</a
      ><a name="20266"
      > </a
      ><a name="20267" href="Stlc.html#19229" class="Datatype Operator"
      >&#8866;</a
      ><a name="20268"
      >
  </a
      ><a name="20271" class="Symbol"
      >(</a
      ><a name="20272" href="Stlc.html#5821" class="InductiveConstructor"
      >abs</a
      ><a name="20275"
      > </a
      ><a name="20276" href="Stlc.html#6352" class="Function"
      >x</a
      ><a name="20277"
      > </a
      ><a name="20278" href="Stlc.html#5605" class="InductiveConstructor"
      >bool</a
      ><a name="20282"
      >
    </a
      ><a name="20287" class="Symbol"
      >(</a
      ><a name="20288" href="Stlc.html#5821" class="InductiveConstructor"
      >abs</a
      ><a name="20291"
      > </a
      ><a name="20292" href="Stlc.html#6361" class="Function"
      >y</a
      ><a name="20293"
      > </a
      ><a name="20294" class="Symbol"
      >(</a
      ><a name="20295" href="Stlc.html#5605" class="InductiveConstructor"
      >bool</a
      ><a name="20299"
      > </a
      ><a name="20300" href="Stlc.html#5619" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="20301"
      > </a
      ><a name="20302" href="Stlc.html#5605" class="InductiveConstructor"
      >bool</a
      ><a name="20306" class="Symbol"
      >)</a
      ><a name="20307"
      >
      </a
      ><a name="20314" class="Symbol"
      >(</a
      ><a name="20315" href="Stlc.html#5792" class="InductiveConstructor"
      >app</a
      ><a name="20318"
      > </a
      ><a name="20319" class="Symbol"
      >(</a
      ><a name="20320" href="Stlc.html#5772" class="InductiveConstructor"
      >var</a
      ><a name="20323"
      > </a
      ><a name="20324" href="Stlc.html#6361" class="Function"
      >y</a
      ><a name="20325" class="Symbol"
      >)</a
      ><a name="20326"
      >
        </a
      ><a name="20335" class="Symbol"
      >(</a
      ><a name="20336" href="Stlc.html#5792" class="InductiveConstructor"
      >app</a
      ><a name="20339"
      > </a
      ><a name="20340" class="Symbol"
      >(</a
      ><a name="20341" href="Stlc.html#5772" class="InductiveConstructor"
      >var</a
      ><a name="20344"
      > </a
      ><a name="20345" href="Stlc.html#6361" class="Function"
      >y</a
      ><a name="20346" class="Symbol"
      >)</a
      ><a name="20347"
      > </a
      ><a name="20348" class="Symbol"
      >(</a
      ><a name="20349" href="Stlc.html#5772" class="InductiveConstructor"
      >var</a
      ><a name="20352"
      > </a
      ><a name="20353" href="Stlc.html#6352" class="Function"
      >x</a
      ><a name="20354" class="Symbol"
      >)))))</a
      ><a name="20359"
      >
  </a
      ><a name="20362" href="Stlc.html#19229" class="Datatype Operator"
      >&#8758;</a
      ><a name="20363"
      > </a
      ><a name="20364" class="Symbol"
      >(</a
      ><a name="20365" href="Stlc.html#5605" class="InductiveConstructor"
      >bool</a
      ><a name="20369"
      > </a
      ><a name="20370" href="Stlc.html#5619" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="20371"
      > </a
      ><a name="20372" class="Symbol"
      >(</a
      ><a name="20373" href="Stlc.html#5605" class="InductiveConstructor"
      >bool</a
      ><a name="20377"
      > </a
      ><a name="20378" href="Stlc.html#5619" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="20379"
      > </a
      ><a name="20380" href="Stlc.html#5605" class="InductiveConstructor"
      >bool</a
      ><a name="20384" class="Symbol"
      >)</a
      ><a name="20385"
      > </a
      ><a name="20386" href="Stlc.html#5619" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="20387"
      > </a
      ><a name="20388" href="Stlc.html#5605" class="InductiveConstructor"
      >bool</a
      ><a name="20392" class="Symbol"
      >)</a
      ><a name="20393"
      >
</a
      ><a name="20394" href="Stlc.html#20247" class="Function"
      >typing-example2</a
      ><a name="20409"
      > </a
      ><a name="20410" class="Symbol"
      >=</a
      ><a name="20411"
      >
  </a
      ><a name="20414" class="Symbol"
      >(</a
      ><a name="20415" href="Stlc.html#19366" class="InductiveConstructor"
      >abs</a
      ><a name="20418"
      >
    </a
      ><a name="20423" class="Symbol"
      >(</a
      ><a name="20424" href="Stlc.html#19366" class="InductiveConstructor"
      >abs</a
      ><a name="20427"
      >
      </a
      ><a name="20434" class="Symbol"
      >(</a
      ><a name="20435" href="Stlc.html#19482" class="InductiveConstructor"
      >app</a
      ><a name="20438"
      > </a
      ><a name="20439" class="Symbol"
      >(</a
      ><a name="20440" href="Stlc.html#19273" class="InductiveConstructor"
      >var</a
      ><a name="20443"
      > </a
      ><a name="20444" href="Stlc.html#6361" class="Function"
      >y</a
      ><a name="20445"
      > </a
      ><a name="20446" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="20450" class="Symbol"
      >)</a
      ><a name="20451"
      >
        </a
      ><a name="20460" class="Symbol"
      >(</a
      ><a name="20461" href="Stlc.html#19482" class="InductiveConstructor"
      >app</a
      ><a name="20464"
      > </a
      ><a name="20465" class="Symbol"
      >(</a
      ><a name="20466" href="Stlc.html#19273" class="InductiveConstructor"
      >var</a
      ><a name="20469"
      > </a
      ><a name="20470" href="Stlc.html#6361" class="Function"
      >y</a
      ><a name="20471"
      > </a
      ><a name="20472" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="20476" class="Symbol"
      >)</a
      ><a name="20477"
      > </a
      ><a name="20478" class="Symbol"
      >(</a
      ><a name="20479" href="Stlc.html#19273" class="InductiveConstructor"
      >var</a
      ><a name="20482"
      > </a
      ><a name="20483" href="Stlc.html#6352" class="Function"
      >x</a
      ><a name="20484"
      > </a
      ><a name="20485" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="20489" class="Symbol"
      >)</a
      ><a name="20490"
      > </a
      ><a name="20491" class="Symbol"
      >))))</a
      >
</pre><!--{% endraw %}-->

#### Exercise: 2 stars (typing-example3)
Formally prove the following typing derivation holds:

$$\exists A, \varnothing\vdash \lambda x:bool\rightarrow B. \lambda y:bool\rightarrow bool. \lambda z:bool. y\;(x\;z) : A$$.

<!--{% raw %}--><pre class="Agda">
<a name="20743" class="Keyword"
      >postulate</a
      ><a name="20752"
      >
  </a
      ><a name="20755" href="Stlc.html#20755" class="Postulate"
      >typing-example3</a
      ><a name="20770"
      > </a
      ><a name="20771" class="Symbol"
      >:</a
      ><a name="20772"
      > </a
      ><a name="20773" href="https://agda.github.io/agda-stdlib/Data.Product.html#823" class="Function"
      >&#8707;</a
      ><a name="20774"
      > </a
      ><a name="20775" class="Symbol"
      >&#955;</a
      ><a name="20776"
      > </a
      ><a name="20777" href="Stlc.html#20777" class="Bound"
      >A</a
      ><a name="20778"
      > </a
      ><a name="20779" class="Symbol"
      >&#8594;</a
      ><a name="20780"
      > </a
      ><a name="20781" href="Stlc.html#18297" class="Function"
      >&#8709;</a
      ><a name="20782"
      > </a
      ><a name="20783" href="Stlc.html#19229" class="Datatype Operator"
      >&#8866;</a
      ><a name="20784"
      >
    </a
      ><a name="20789" class="Symbol"
      >(</a
      ><a name="20790" href="Stlc.html#5821" class="InductiveConstructor"
      >abs</a
      ><a name="20793"
      > </a
      ><a name="20794" href="Stlc.html#6352" class="Function"
      >x</a
      ><a name="20795"
      > </a
      ><a name="20796" class="Symbol"
      >(</a
      ><a name="20797" href="Stlc.html#5605" class="InductiveConstructor"
      >bool</a
      ><a name="20801"
      > </a
      ><a name="20802" href="Stlc.html#5619" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="20803"
      > </a
      ><a name="20804" href="Stlc.html#5605" class="InductiveConstructor"
      >bool</a
      ><a name="20808" class="Symbol"
      >)</a
      ><a name="20809"
      >
      </a
      ><a name="20816" class="Symbol"
      >(</a
      ><a name="20817" href="Stlc.html#5821" class="InductiveConstructor"
      >abs</a
      ><a name="20820"
      > </a
      ><a name="20821" href="Stlc.html#6361" class="Function"
      >y</a
      ><a name="20822"
      > </a
      ><a name="20823" class="Symbol"
      >(</a
      ><a name="20824" href="Stlc.html#5605" class="InductiveConstructor"
      >bool</a
      ><a name="20828"
      > </a
      ><a name="20829" href="Stlc.html#5619" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="20830"
      > </a
      ><a name="20831" href="Stlc.html#5605" class="InductiveConstructor"
      >bool</a
      ><a name="20835" class="Symbol"
      >)</a
      ><a name="20836"
      >
        </a
      ><a name="20845" class="Symbol"
      >(</a
      ><a name="20846" href="Stlc.html#5821" class="InductiveConstructor"
      >abs</a
      ><a name="20849"
      > </a
      ><a name="20850" href="Stlc.html#6370" class="Function"
      >z</a
      ><a name="20851"
      > </a
      ><a name="20852" href="Stlc.html#5605" class="InductiveConstructor"
      >bool</a
      ><a name="20856"
      >
          </a
      ><a name="20867" class="Symbol"
      >(</a
      ><a name="20868" href="Stlc.html#5792" class="InductiveConstructor"
      >app</a
      ><a name="20871"
      > </a
      ><a name="20872" class="Symbol"
      >(</a
      ><a name="20873" href="Stlc.html#5772" class="InductiveConstructor"
      >var</a
      ><a name="20876"
      > </a
      ><a name="20877" href="Stlc.html#6361" class="Function"
      >y</a
      ><a name="20878" class="Symbol"
      >)</a
      ><a name="20879"
      > </a
      ><a name="20880" class="Symbol"
      >(</a
      ><a name="20881" href="Stlc.html#5792" class="InductiveConstructor"
      >app</a
      ><a name="20884"
      > </a
      ><a name="20885" class="Symbol"
      >(</a
      ><a name="20886" href="Stlc.html#5772" class="InductiveConstructor"
      >var</a
      ><a name="20889"
      > </a
      ><a name="20890" href="Stlc.html#6352" class="Function"
      >x</a
      ><a name="20891" class="Symbol"
      >)</a
      ><a name="20892"
      > </a
      ><a name="20893" class="Symbol"
      >(</a
      ><a name="20894" href="Stlc.html#5772" class="InductiveConstructor"
      >var</a
      ><a name="20897"
      > </a
      ><a name="20898" href="Stlc.html#6370" class="Function"
      >z</a
      ><a name="20899" class="Symbol"
      >))))))</a
      ><a name="20905"
      > </a
      ><a name="20906" href="Stlc.html#19229" class="Datatype Operator"
      >&#8758;</a
      ><a name="20907"
      > </a
      ><a name="20908" href="Stlc.html#20777" class="Bound"
      >A</a
      >
</pre><!--{% endraw %}-->

We can also show that terms are _not_ typable.  For example, let's
formally check that there is no typing derivation assigning a type
to the term $$\lambda x:bool. \lambda y:bool. x\;y$$---i.e.,


$$\nexists A, \varnothing\vdash \lambda x:bool. \lambda y:bool. x\;y : A$$.

<!--{% raw %}--><pre class="Agda">
<a name="21209" class="Keyword"
      >postulate</a
      ><a name="21218"
      >
  </a
      ><a name="21221" href="Stlc.html#21221" class="Postulate"
      >typing-nonexample1</a
      ><a name="21239"
      > </a
      ><a name="21240" class="Symbol"
      >:</a
      ><a name="21241"
      > </a
      ><a name="21242" href="https://agda.github.io/agda-stdlib/Data.Product.html#884" class="Function"
      >&#8708;</a
      ><a name="21243"
      > </a
      ><a name="21244" class="Symbol"
      >&#955;</a
      ><a name="21245"
      > </a
      ><a name="21246" href="Stlc.html#21246" class="Bound"
      >A</a
      ><a name="21247"
      > </a
      ><a name="21248" class="Symbol"
      >&#8594;</a
      ><a name="21249"
      > </a
      ><a name="21250" href="Stlc.html#18297" class="Function"
      >&#8709;</a
      ><a name="21251"
      > </a
      ><a name="21252" href="Stlc.html#19229" class="Datatype Operator"
      >&#8866;</a
      ><a name="21253"
      >
    </a
      ><a name="21258" class="Symbol"
      >(</a
      ><a name="21259" href="Stlc.html#5821" class="InductiveConstructor"
      >abs</a
      ><a name="21262"
      > </a
      ><a name="21263" href="Stlc.html#6352" class="Function"
      >x</a
      ><a name="21264"
      > </a
      ><a name="21265" href="Stlc.html#5605" class="InductiveConstructor"
      >bool</a
      ><a name="21269"
      >
      </a
      ><a name="21276" class="Symbol"
      >(</a
      ><a name="21277" href="Stlc.html#5821" class="InductiveConstructor"
      >abs</a
      ><a name="21280"
      > </a
      ><a name="21281" href="Stlc.html#6361" class="Function"
      >y</a
      ><a name="21282"
      > </a
      ><a name="21283" href="Stlc.html#5605" class="InductiveConstructor"
      >bool</a
      ><a name="21287"
      >
        </a
      ><a name="21296" class="Symbol"
      >(</a
      ><a name="21297" href="Stlc.html#5792" class="InductiveConstructor"
      >app</a
      ><a name="21300"
      > </a
      ><a name="21301" class="Symbol"
      >(</a
      ><a name="21302" href="Stlc.html#5772" class="InductiveConstructor"
      >var</a
      ><a name="21305"
      > </a
      ><a name="21306" href="Stlc.html#6352" class="Function"
      >x</a
      ><a name="21307" class="Symbol"
      >)</a
      ><a name="21308"
      > </a
      ><a name="21309" class="Symbol"
      >(</a
      ><a name="21310" href="Stlc.html#5772" class="InductiveConstructor"
      >var</a
      ><a name="21313"
      > </a
      ><a name="21314" href="Stlc.html#6361" class="Function"
      >y</a
      ><a name="21315" class="Symbol"
      >))))</a
      ><a name="21319"
      > </a
      ><a name="21320" href="Stlc.html#19229" class="Datatype Operator"
      >&#8758;</a
      ><a name="21321"
      > </a
      ><a name="21322" href="Stlc.html#21246" class="Bound"
      >A</a
      >
</pre><!--{% endraw %}-->

#### Exercise: 3 stars, optional (typing-nonexample2)
Another nonexample:

$$\nexists A, \exists B, \varnothing\vdash \lambda x:A. x\;x : B$$.

<!--{% raw %}--><pre class="Agda">
<a name="21493" class="Keyword"
      >postulate</a
      ><a name="21502"
      >
  </a
      ><a name="21505" href="Stlc.html#21505" class="Postulate"
      >typing-nonexample2</a
      ><a name="21523"
      > </a
      ><a name="21524" class="Symbol"
      >:</a
      ><a name="21525"
      > </a
      ><a name="21526" href="https://agda.github.io/agda-stdlib/Data.Product.html#884" class="Function"
      >&#8708;</a
      ><a name="21527"
      > </a
      ><a name="21528" class="Symbol"
      >&#955;</a
      ><a name="21529"
      > </a
      ><a name="21530" href="Stlc.html#21530" class="Bound"
      >A</a
      ><a name="21531"
      > </a
      ><a name="21532" class="Symbol"
      >&#8594;</a
      ><a name="21533"
      > </a
      ><a name="21534" href="https://agda.github.io/agda-stdlib/Data.Product.html#823" class="Function"
      >&#8707;</a
      ><a name="21535"
      > </a
      ><a name="21536" class="Symbol"
      >&#955;</a
      ><a name="21537"
      > </a
      ><a name="21538" href="Stlc.html#21538" class="Bound"
      >B</a
      ><a name="21539"
      > </a
      ><a name="21540" class="Symbol"
      >&#8594;</a
      ><a name="21541"
      > </a
      ><a name="21542" href="Stlc.html#18297" class="Function"
      >&#8709;</a
      ><a name="21543"
      > </a
      ><a name="21544" href="Stlc.html#19229" class="Datatype Operator"
      >&#8866;</a
      ><a name="21545"
      >
    </a
      ><a name="21550" class="Symbol"
      >(</a
      ><a name="21551" href="Stlc.html#5821" class="InductiveConstructor"
      >abs</a
      ><a name="21554"
      > </a
      ><a name="21555" href="Stlc.html#6352" class="Function"
      >x</a
      ><a name="21556"
      > </a
      ><a name="21557" href="Stlc.html#21538" class="Bound"
      >B</a
      ><a name="21558"
      > </a
      ><a name="21559" class="Symbol"
      >(</a
      ><a name="21560" href="Stlc.html#5792" class="InductiveConstructor"
      >app</a
      ><a name="21563"
      > </a
      ><a name="21564" class="Symbol"
      >(</a
      ><a name="21565" href="Stlc.html#5772" class="InductiveConstructor"
      >var</a
      ><a name="21568"
      > </a
      ><a name="21569" href="Stlc.html#6352" class="Function"
      >x</a
      ><a name="21570" class="Symbol"
      >)</a
      ><a name="21571"
      > </a
      ><a name="21572" class="Symbol"
      >(</a
      ><a name="21573" href="Stlc.html#5772" class="InductiveConstructor"
      >var</a
      ><a name="21576"
      > </a
      ><a name="21577" href="Stlc.html#6352" class="Function"
      >x</a
      ><a name="21578" class="Symbol"
      >)))</a
      ><a name="21581"
      > </a
      ><a name="21582" href="Stlc.html#19229" class="Datatype Operator"
      >&#8758;</a
      ><a name="21583"
      > </a
      ><a name="21584" href="Stlc.html#21530" class="Bound"
      >A</a
      >
</pre><!--{% endraw %}-->
