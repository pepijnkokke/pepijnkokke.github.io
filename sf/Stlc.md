---
title         : "Stlc: The Simply Typed Lambda-Calculus"
layout        : default
hide-implicit : false
extra-script  : agda-extra-script.html
extra-style   : agda-extra-style.html
permalink     : "/sf/Stlc.html"
---

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="256" class="Keyword"
      >open</a
      ><a name="260"
      > </a
      ><a name="261" class="Keyword"
      >import</a
      ><a name="267"
      > </a
      ><a name="268" href="https://agda.github.io/agda-stdlib/Data.Empty.html#1" class="Module"
      >Data.Empty</a
      ><a name="278"
      > </a
      ><a name="279" class="Keyword"
      >using</a
      ><a name="284"
      > </a
      ><a name="285" class="Symbol"
      >(</a
      ><a name="286" href="https://agda.github.io/agda-stdlib/Data.Empty.html#243" class="Datatype"
      >&#8869;</a
      ><a name="287" class="Symbol"
      >;</a
      ><a name="288"
      > </a
      ><a name="289" href="https://agda.github.io/agda-stdlib/Data.Empty.html#348" class="Function"
      >&#8869;-elim</a
      ><a name="295" class="Symbol"
      >)</a
      ><a name="296"
      >
</a
      ><a name="297" class="Keyword"
      >open</a
      ><a name="301"
      > </a
      ><a name="302" class="Keyword"
      >import</a
      ><a name="308"
      > </a
      ><a name="309" href="https://agda.github.io/agda-stdlib/Data.Maybe.html#1" class="Module"
      >Data.Maybe</a
      ><a name="319"
      > </a
      ><a name="320" class="Keyword"
      >using</a
      ><a name="325"
      > </a
      ><a name="326" class="Symbol"
      >(</a
      ><a name="327" href="https://agda.github.io/agda-stdlib/Data.Maybe.Base.html#335" class="Datatype"
      >Maybe</a
      ><a name="332" class="Symbol"
      >;</a
      ><a name="333"
      > </a
      ><a name="334" href="https://agda.github.io/agda-stdlib/Data.Maybe.html#1527" class="InductiveConstructor"
      >just</a
      ><a name="338" class="Symbol"
      >;</a
      ><a name="339"
      > </a
      ><a name="340" href="https://agda.github.io/agda-stdlib/Data.Maybe.html#1588" class="InductiveConstructor"
      >nothing</a
      ><a name="347" class="Symbol"
      >)</a
      ><a name="348"
      >
</a
      ><a name="349" class="Keyword"
      >open</a
      ><a name="353"
      > </a
      ><a name="354" class="Keyword"
      >import</a
      ><a name="360"
      > </a
      ><a name="361" href="https://agda.github.io/agda-stdlib/Data.Nat.html#1" class="Module"
      >Data.Nat</a
      ><a name="369"
      > </a
      ><a name="370" class="Keyword"
      >using</a
      ><a name="375"
      > </a
      ><a name="376" class="Symbol"
      >(</a
      ><a name="377" href="Agda.Builtin.Nat.html#69" class="Datatype"
      >&#8469;</a
      ><a name="378" class="Symbol"
      >;</a
      ><a name="379"
      > </a
      ><a name="380" href="Agda.Builtin.Nat.html#100" class="InductiveConstructor"
      >suc</a
      ><a name="383" class="Symbol"
      >;</a
      ><a name="384"
      > </a
      ><a name="385" href="Agda.Builtin.Nat.html#87" class="InductiveConstructor"
      >zero</a
      ><a name="389" class="Symbol"
      >;</a
      ><a name="390"
      > </a
      ><a name="391" href="Agda.Builtin.Nat.html#202" class="Primitive Operator"
      >_+_</a
      ><a name="394" class="Symbol"
      >)</a
      ><a name="395"
      >
</a
      ><a name="396" class="Keyword"
      >open</a
      ><a name="400"
      > </a
      ><a name="401" class="Keyword"
      >import</a
      ><a name="407"
      > </a
      ><a name="408" href="https://agda.github.io/agda-stdlib/Data.Product.html#1" class="Module"
      >Data.Product</a
      ><a name="420"
      > </a
      ><a name="421" class="Keyword"
      >using</a
      ><a name="426"
      > </a
      ><a name="427" class="Symbol"
      >(</a
      ><a name="428" href="https://agda.github.io/agda-stdlib/Data.Product.html#823" class="Function"
      >&#8707;</a
      ><a name="429" class="Symbol"
      >;</a
      ><a name="430"
      > </a
      ><a name="431" href="https://agda.github.io/agda-stdlib/Data.Product.html#884" class="Function"
      >&#8708;</a
      ><a name="432" class="Symbol"
      >;</a
      ><a name="433"
      > </a
      ><a name="434" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >_,_</a
      ><a name="437" class="Symbol"
      >)</a
      ><a name="438"
      >
</a
      ><a name="439" class="Keyword"
      >open</a
      ><a name="443"
      > </a
      ><a name="444" class="Keyword"
      >import</a
      ><a name="450"
      > </a
      ><a name="451" href="https://agda.github.io/agda-stdlib/Function.html#1" class="Module"
      >Function</a
      ><a name="459"
      > </a
      ><a name="460" class="Keyword"
      >using</a
      ><a name="465"
      > </a
      ><a name="466" class="Symbol"
      >(</a
      ><a name="467" href="https://agda.github.io/agda-stdlib/Function.html#713" class="Function Operator"
      >_&#8728;_</a
      ><a name="470" class="Symbol"
      >;</a
      ><a name="471"
      > </a
      ><a name="472" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >_$_</a
      ><a name="475" class="Symbol"
      >)</a
      ><a name="476"
      >
</a
      ><a name="477" class="Keyword"
      >open</a
      ><a name="481"
      > </a
      ><a name="482" class="Keyword"
      >import</a
      ><a name="488"
      > </a
      ><a name="489" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#1" class="Module"
      >Relation.Nullary</a
      ><a name="505"
      > </a
      ><a name="506" class="Keyword"
      >using</a
      ><a name="511"
      > </a
      ><a name="512" class="Symbol"
      >(</a
      ><a name="513" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#484" class="Datatype"
      >Dec</a
      ><a name="516" class="Symbol"
      >;</a
      ><a name="517"
      > </a
      ><a name="518" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="521" class="Symbol"
      >;</a
      ><a name="522"
      > </a
      ><a name="523" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="525" class="Symbol"
      >)</a
      ><a name="526"
      >
</a
      ><a name="527" class="Keyword"
      >open</a
      ><a name="531"
      > </a
      ><a name="532" class="Keyword"
      >import</a
      ><a name="538"
      > </a
      ><a name="539" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.html#1" class="Module"
      >Relation.Binary.PropositionalEquality</a
      ><a name="576"
      > </a
      ><a name="577" class="Keyword"
      >using</a
      ><a name="582"
      > </a
      ><a name="583" class="Symbol"
      >(</a
      ><a name="584" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >_&#8801;_</a
      ><a name="587" class="Symbol"
      >;</a
      ><a name="588"
      > </a
      ><a name="589" href="https://agda.github.io/agda-stdlib/Relation.Binary.Core.html#4493" class="Function Operator"
      >_&#8802;_</a
      ><a name="592" class="Symbol"
      >;</a
      ><a name="593"
      > </a
      ><a name="594" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="598" class="Symbol"
      >)</a
      >
{% endraw %}</pre>
</div>

<pre class="Agda">{% raw %}
<a name="632" class="Keyword"
      >module</a
      ><a name="638"
      > </a
      ><a name="639" href="Stlc.html#1" class="Module"
      >Stlc</a
      ><a name="643"
      > </a
      ><a name="644" class="Keyword"
      >where</a
      >
{% endraw %}</pre>

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

<pre class="Agda">{% raw %}
<a name="5514" class="Keyword"
      >data</a
      ><a name="5518"
      > </a
      ><a name="5519" href="Stlc.html#5519" class="Datatype"
      >Type</a
      ><a name="5523"
      > </a
      ><a name="5524" class="Symbol"
      >:</a
      ><a name="5525"
      > </a
      ><a name="5526" class="PrimitiveType"
      >Set</a
      ><a name="5529"
      > </a
      ><a name="5530" class="Keyword"
      >where</a
      ><a name="5535"
      >
  </a
      ><a name="5538" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="5542"
      > </a
      ><a name="5543" class="Symbol"
      >:</a
      ><a name="5544"
      > </a
      ><a name="5545" href="Stlc.html#5519" class="Datatype"
      >Type</a
      ><a name="5549"
      >
  </a
      ><a name="5552" href="Stlc.html#5552" class="InductiveConstructor Operator"
      >_&#8658;_</a
      ><a name="5555"
      >  </a
      ><a name="5557" class="Symbol"
      >:</a
      ><a name="5558"
      > </a
      ><a name="5559" href="Stlc.html#5519" class="Datatype"
      >Type</a
      ><a name="5563"
      > </a
      ><a name="5564" class="Symbol"
      >&#8594;</a
      ><a name="5565"
      > </a
      ><a name="5566" href="Stlc.html#5519" class="Datatype"
      >Type</a
      ><a name="5570"
      > </a
      ><a name="5571" class="Symbol"
      >&#8594;</a
      ><a name="5572"
      > </a
      ><a name="5573" href="Stlc.html#5519" class="Datatype"
      >Type</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="5624" class="Keyword"
      >infixr</a
      ><a name="5630"
      > </a
      ><a name="5631" class="Number"
      >5</a
      >
{% endraw %}</pre>
</div>


### Terms

<pre class="Agda">{% raw %}
<a name="5681" class="Keyword"
      >data</a
      ><a name="5685"
      > </a
      ><a name="5686" href="Stlc.html#5686" class="Datatype"
      >Id</a
      ><a name="5688"
      > </a
      ><a name="5689" class="Symbol"
      >:</a
      ><a name="5690"
      > </a
      ><a name="5691" class="PrimitiveType"
      >Set</a
      ><a name="5694"
      > </a
      ><a name="5695" class="Keyword"
      >where</a
      ><a name="5700"
      >
  </a
      ><a name="5703" href="Stlc.html#5703" class="InductiveConstructor"
      >id</a
      ><a name="5705"
      > </a
      ><a name="5706" class="Symbol"
      >:</a
      ><a name="5707"
      > </a
      ><a name="5708" href="Agda.Builtin.Nat.html#69" class="Datatype"
      >&#8469;</a
      ><a name="5709"
      > </a
      ><a name="5710" class="Symbol"
      >&#8594;</a
      ><a name="5711"
      > </a
      ><a name="5712" href="Stlc.html#5686" class="Datatype"
      >Id</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="5761" href="Stlc.html#5761" class="Function Operator"
      >_&#8799;_</a
      ><a name="5764"
      > </a
      ><a name="5765" class="Symbol"
      >:</a
      ><a name="5766"
      > </a
      ><a name="5767" class="Symbol"
      >(</a
      ><a name="5768" href="Stlc.html#5768" class="Bound"
      >x</a
      ><a name="5769"
      > </a
      ><a name="5770" href="Stlc.html#5770" class="Bound"
      >y</a
      ><a name="5771"
      > </a
      ><a name="5772" class="Symbol"
      >:</a
      ><a name="5773"
      > </a
      ><a name="5774" href="Stlc.html#5686" class="Datatype"
      >Id</a
      ><a name="5776" class="Symbol"
      >)</a
      ><a name="5777"
      > </a
      ><a name="5778" class="Symbol"
      >&#8594;</a
      ><a name="5779"
      > </a
      ><a name="5780" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#484" class="Datatype"
      >Dec</a
      ><a name="5783"
      > </a
      ><a name="5784" class="Symbol"
      >(</a
      ><a name="5785" href="Stlc.html#5768" class="Bound"
      >x</a
      ><a name="5786"
      > </a
      ><a name="5787" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="5788"
      > </a
      ><a name="5789" href="Stlc.html#5770" class="Bound"
      >y</a
      ><a name="5790" class="Symbol"
      >)</a
      ><a name="5791"
      >
</a
      ><a name="5792" href="Stlc.html#5703" class="InductiveConstructor"
      >id</a
      ><a name="5794"
      > </a
      ><a name="5795" href="Stlc.html#5795" class="Bound"
      >x</a
      ><a name="5796"
      > </a
      ><a name="5797" href="Stlc.html#5761" class="Function Operator"
      >&#8799;</a
      ><a name="5798"
      > </a
      ><a name="5799" href="Stlc.html#5703" class="InductiveConstructor"
      >id</a
      ><a name="5801"
      > </a
      ><a name="5802" href="Stlc.html#5802" class="Bound"
      >y</a
      ><a name="5803"
      > </a
      ><a name="5804" class="Keyword"
      >with</a
      ><a name="5808"
      > </a
      ><a name="5809" href="Stlc.html#5795" class="Bound"
      >x</a
      ><a name="5810"
      > </a
      ><a name="5811" href="https://agda.github.io/agda-stdlib/Data.Nat.Base.html#3199" class="Function Operator"
      >Data.Nat.&#8799;</a
      ><a name="5821"
      > </a
      ><a name="5822" href="Stlc.html#5802" class="Bound"
      >y</a
      ><a name="5823"
      >
</a
      ><a name="5824" href="Stlc.html#5703" class="InductiveConstructor"
      >id</a
      ><a name="5826"
      > </a
      ><a name="5827" href="Stlc.html#5827" class="Bound"
      >x</a
      ><a name="5828"
      > </a
      ><a name="5829" href="Stlc.html#5761" class="Function Operator"
      >&#8799;</a
      ><a name="5830"
      > </a
      ><a name="5831" href="Stlc.html#5703" class="InductiveConstructor"
      >id</a
      ><a name="5833"
      > </a
      ><a name="5834" href="Stlc.html#5834" class="Bound"
      >y</a
      ><a name="5835"
      > </a
      ><a name="5836" class="Symbol"
      >|</a
      ><a name="5837"
      > </a
      ><a name="5838" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="5841"
      > </a
      ><a name="5842" href="Stlc.html#5842" class="Bound"
      >x=y</a
      ><a name="5845"
      > </a
      ><a name="5846" class="Keyword"
      >rewrite</a
      ><a name="5853"
      > </a
      ><a name="5854" href="Stlc.html#5842" class="Bound"
      >x=y</a
      ><a name="5857"
      > </a
      ><a name="5858" class="Symbol"
      >=</a
      ><a name="5859"
      > </a
      ><a name="5860" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="5863"
      > </a
      ><a name="5864" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="5868"
      >
</a
      ><a name="5869" href="Stlc.html#5703" class="InductiveConstructor"
      >id</a
      ><a name="5871"
      > </a
      ><a name="5872" href="Stlc.html#5872" class="Bound"
      >x</a
      ><a name="5873"
      > </a
      ><a name="5874" href="Stlc.html#5761" class="Function Operator"
      >&#8799;</a
      ><a name="5875"
      > </a
      ><a name="5876" href="Stlc.html#5703" class="InductiveConstructor"
      >id</a
      ><a name="5878"
      > </a
      ><a name="5879" href="Stlc.html#5879" class="Bound"
      >y</a
      ><a name="5880"
      > </a
      ><a name="5881" class="Symbol"
      >|</a
      ><a name="5882"
      > </a
      ><a name="5883" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="5885"
      >  </a
      ><a name="5887" href="Stlc.html#5887" class="Bound"
      >x&#8800;y</a
      ><a name="5890"
      > </a
      ><a name="5891" class="Symbol"
      >=</a
      ><a name="5892"
      > </a
      ><a name="5893" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="5895"
      > </a
      ><a name="5896" class="Symbol"
      >(</a
      ><a name="5897" href="Stlc.html#5887" class="Bound"
      >x&#8800;y</a
      ><a name="5900"
      > </a
      ><a name="5901" href="https://agda.github.io/agda-stdlib/Function.html#713" class="Function Operator"
      >&#8728;</a
      ><a name="5902"
      > </a
      ><a name="5903" href="Stlc.html#5923" class="Function"
      >id-inj</a
      ><a name="5909" class="Symbol"
      >)</a
      ><a name="5910"
      >
  </a
      ><a name="5913" class="Keyword"
      >where</a
      ><a name="5918"
      >
    </a
      ><a name="5923" href="Stlc.html#5923" class="Function"
      >id-inj</a
      ><a name="5929"
      > </a
      ><a name="5930" class="Symbol"
      >:</a
      ><a name="5931"
      > </a
      ><a name="5932" class="Symbol"
      >&#8704;</a
      ><a name="5933"
      > </a
      ><a name="5934" class="Symbol"
      >{</a
      ><a name="5935" href="Stlc.html#5935" class="Bound"
      >x</a
      ><a name="5936"
      > </a
      ><a name="5937" href="Stlc.html#5937" class="Bound"
      >y</a
      ><a name="5938" class="Symbol"
      >}</a
      ><a name="5939"
      > </a
      ><a name="5940" class="Symbol"
      >&#8594;</a
      ><a name="5941"
      > </a
      ><a name="5942" href="Stlc.html#5703" class="InductiveConstructor"
      >id</a
      ><a name="5944"
      > </a
      ><a name="5945" href="Stlc.html#5935" class="Bound"
      >x</a
      ><a name="5946"
      > </a
      ><a name="5947" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="5948"
      > </a
      ><a name="5949" href="Stlc.html#5703" class="InductiveConstructor"
      >id</a
      ><a name="5951"
      > </a
      ><a name="5952" href="Stlc.html#5937" class="Bound"
      >y</a
      ><a name="5953"
      > </a
      ><a name="5954" class="Symbol"
      >&#8594;</a
      ><a name="5955"
      > </a
      ><a name="5956" href="Stlc.html#5935" class="Bound"
      >x</a
      ><a name="5957"
      > </a
      ><a name="5958" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="5959"
      > </a
      ><a name="5960" href="Stlc.html#5937" class="Bound"
      >y</a
      ><a name="5961"
      >
    </a
      ><a name="5966" href="Stlc.html#5923" class="Function"
      >id-inj</a
      ><a name="5972"
      > </a
      ><a name="5973" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="5977"
      > </a
      ><a name="5978" class="Symbol"
      >=</a
      ><a name="5979"
      > </a
      ><a name="5980" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      >
{% endraw %}</pre>
</div>

<pre class="Agda">{% raw %}
<a name="6017" class="Keyword"
      >data</a
      ><a name="6021"
      > </a
      ><a name="6022" href="Stlc.html#6022" class="Datatype"
      >Term</a
      ><a name="6026"
      > </a
      ><a name="6027" class="Symbol"
      >:</a
      ><a name="6028"
      > </a
      ><a name="6029" class="PrimitiveType"
      >Set</a
      ><a name="6032"
      > </a
      ><a name="6033" class="Keyword"
      >where</a
      ><a name="6038"
      >
  </a
      ><a name="6041" href="Stlc.html#6041" class="InductiveConstructor"
      >var</a
      ><a name="6044"
      >   </a
      ><a name="6047" class="Symbol"
      >:</a
      ><a name="6048"
      > </a
      ><a name="6049" href="Stlc.html#5686" class="Datatype"
      >Id</a
      ><a name="6051"
      > </a
      ><a name="6052" class="Symbol"
      >&#8594;</a
      ><a name="6053"
      > </a
      ><a name="6054" href="Stlc.html#6022" class="Datatype"
      >Term</a
      ><a name="6058"
      >
  </a
      ><a name="6061" href="Stlc.html#6061" class="InductiveConstructor"
      >app</a
      ><a name="6064"
      >   </a
      ><a name="6067" class="Symbol"
      >:</a
      ><a name="6068"
      > </a
      ><a name="6069" href="Stlc.html#6022" class="Datatype"
      >Term</a
      ><a name="6073"
      > </a
      ><a name="6074" class="Symbol"
      >&#8594;</a
      ><a name="6075"
      > </a
      ><a name="6076" href="Stlc.html#6022" class="Datatype"
      >Term</a
      ><a name="6080"
      > </a
      ><a name="6081" class="Symbol"
      >&#8594;</a
      ><a name="6082"
      > </a
      ><a name="6083" href="Stlc.html#6022" class="Datatype"
      >Term</a
      ><a name="6087"
      >
  </a
      ><a name="6090" href="Stlc.html#6090" class="InductiveConstructor"
      >abs</a
      ><a name="6093"
      >   </a
      ><a name="6096" class="Symbol"
      >:</a
      ><a name="6097"
      > </a
      ><a name="6098" href="Stlc.html#5686" class="Datatype"
      >Id</a
      ><a name="6100"
      > </a
      ><a name="6101" class="Symbol"
      >&#8594;</a
      ><a name="6102"
      > </a
      ><a name="6103" href="Stlc.html#5519" class="Datatype"
      >Type</a
      ><a name="6107"
      > </a
      ><a name="6108" class="Symbol"
      >&#8594;</a
      ><a name="6109"
      > </a
      ><a name="6110" href="Stlc.html#6022" class="Datatype"
      >Term</a
      ><a name="6114"
      > </a
      ><a name="6115" class="Symbol"
      >&#8594;</a
      ><a name="6116"
      > </a
      ><a name="6117" href="Stlc.html#6022" class="Datatype"
      >Term</a
      ><a name="6121"
      >
  </a
      ><a name="6124" href="Stlc.html#6124" class="InductiveConstructor"
      >true</a
      ><a name="6128"
      >  </a
      ><a name="6130" class="Symbol"
      >:</a
      ><a name="6131"
      > </a
      ><a name="6132" href="Stlc.html#6022" class="Datatype"
      >Term</a
      ><a name="6136"
      >
  </a
      ><a name="6139" href="Stlc.html#6139" class="InductiveConstructor"
      >false</a
      ><a name="6144"
      > </a
      ><a name="6145" class="Symbol"
      >:</a
      ><a name="6146"
      > </a
      ><a name="6147" href="Stlc.html#6022" class="Datatype"
      >Term</a
      ><a name="6151"
      >
  </a
      ><a name="6154" href="Stlc.html#6154" class="InductiveConstructor Operator"
      >if_then_else_</a
      ><a name="6167"
      > </a
      ><a name="6168" class="Symbol"
      >:</a
      ><a name="6169"
      > </a
      ><a name="6170" href="Stlc.html#6022" class="Datatype"
      >Term</a
      ><a name="6174"
      > </a
      ><a name="6175" class="Symbol"
      >&#8594;</a
      ><a name="6176"
      > </a
      ><a name="6177" href="Stlc.html#6022" class="Datatype"
      >Term</a
      ><a name="6181"
      > </a
      ><a name="6182" class="Symbol"
      >&#8594;</a
      ><a name="6183"
      > </a
      ><a name="6184" href="Stlc.html#6022" class="Datatype"
      >Term</a
      ><a name="6188"
      > </a
      ><a name="6189" class="Symbol"
      >&#8594;</a
      ><a name="6190"
      > </a
      ><a name="6191" href="Stlc.html#6022" class="Datatype"
      >Term</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="6242" class="Keyword"
      >infixr</a
      ><a name="6248"
      > </a
      ><a name="6249" class="Number"
      >8</a
      >
{% endraw %}</pre>
</div>

Note that an abstraction $$\lambda x:A.t$$ (formally, `abs x A t`) is
always annotated with the type $$A$$ of its parameter, in contrast
to Agda (and other functional languages like ML, Haskell, etc.),
which use _type inference_ to fill in missing annotations.  We're
not considering type inference here.

Some examples...

<pre class="Agda">{% raw %}
<a name="6621" href="Stlc.html#6621" class="Function"
      >x</a
      ><a name="6622"
      > </a
      ><a name="6623" class="Symbol"
      >=</a
      ><a name="6624"
      > </a
      ><a name="6625" href="Stlc.html#5703" class="InductiveConstructor"
      >id</a
      ><a name="6627"
      > </a
      ><a name="6628" class="Number"
      >0</a
      ><a name="6629"
      >
</a
      ><a name="6630" href="Stlc.html#6630" class="Function"
      >y</a
      ><a name="6631"
      > </a
      ><a name="6632" class="Symbol"
      >=</a
      ><a name="6633"
      > </a
      ><a name="6634" href="Stlc.html#5703" class="InductiveConstructor"
      >id</a
      ><a name="6636"
      > </a
      ><a name="6637" class="Number"
      >1</a
      ><a name="6638"
      >
</a
      ><a name="6639" href="Stlc.html#6639" class="Function"
      >z</a
      ><a name="6640"
      > </a
      ><a name="6641" class="Symbol"
      >=</a
      ><a name="6642"
      > </a
      ><a name="6643" href="Stlc.html#5703" class="InductiveConstructor"
      >id</a
      ><a name="6645"
      > </a
      ><a name="6646" class="Number"
      >2</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="6694" class="Symbol"
      >{-#</a
      ><a name="6697"
      > </a
      ><a name="6698" class="Keyword"
      >DISPLAY</a
      ><a name="6705"
      > </a
      ><a name="6706" href="Agda.Builtin.Nat.html#87" class="InductiveConstructor"
      >zero</a
      ><a name="6710"
      > = </a
      ><a name="6713" href="Stlc.html#6621" class="Function"
      >x</a
      ><a name="6714"
      > </a
      ><a name="6715" class="Symbol"
      >#-}</a
      ><a name="6718"
      >
</a
      ><a name="6719" class="Symbol"
      >{-#</a
      ><a name="6722"
      > </a
      ><a name="6723" class="Keyword"
      >DISPLAY</a
      ><a name="6730"
      > </a
      ><a name="6731" href="Agda.Builtin.Nat.html#100" class="InductiveConstructor"
      >suc</a
      ><a name="6734"
      > </a
      ><a name="6735" href="Agda.Builtin.Nat.html#87" class="InductiveConstructor"
      >zero</a
      ><a name="6739"
      > = </a
      ><a name="6742" href="Stlc.html#6630" class="Function"
      >y</a
      ><a name="6743"
      > </a
      ><a name="6744" class="Symbol"
      >#-}</a
      ><a name="6747"
      >
</a
      ><a name="6748" class="Symbol"
      >{-#</a
      ><a name="6751"
      > </a
      ><a name="6752" class="Keyword"
      >DISPLAY</a
      ><a name="6759"
      > </a
      ><a name="6760" href="Agda.Builtin.Nat.html#100" class="InductiveConstructor"
      >suc</a
      ><a name="6763"
      > (</a
      ><a name="6765" href="Agda.Builtin.Nat.html#100" class="InductiveConstructor"
      >suc</a
      ><a name="6768"
      > </a
      ><a name="6769" href="Agda.Builtin.Nat.html#87" class="InductiveConstructor"
      >zero</a
      ><a name="6773"
      >) = </a
      ><a name="6777" href="Stlc.html#6639" class="Function"
      >z</a
      ><a name="6778"
      > </a
      ><a name="6779" class="Symbol"
      >#-}</a
      >
{% endraw %}</pre>
</div>

$$\text{idB} = \lambda x:bool. x$$.

<pre class="Agda">{% raw %}
<a name="6852" href="Stlc.html#6852" class="Function"
      >idB</a
      ><a name="6855"
      > </a
      ><a name="6856" class="Symbol"
      >=</a
      ><a name="6857"
      > </a
      ><a name="6858" class="Symbol"
      >(</a
      ><a name="6859" href="Stlc.html#6090" class="InductiveConstructor"
      >abs</a
      ><a name="6862"
      > </a
      ><a name="6863" href="Stlc.html#6621" class="Function"
      >x</a
      ><a name="6864"
      > </a
      ><a name="6865" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="6869"
      > </a
      ><a name="6870" class="Symbol"
      >(</a
      ><a name="6871" href="Stlc.html#6041" class="InductiveConstructor"
      >var</a
      ><a name="6874"
      > </a
      ><a name="6875" href="Stlc.html#6621" class="Function"
      >x</a
      ><a name="6876" class="Symbol"
      >))</a
      >
{% endraw %}</pre>

$$\text{idBB} = \lambda x:bool\rightarrow bool. x$$.

<pre class="Agda">{% raw %}
<a name="6958" href="Stlc.html#6958" class="Function"
      >idBB</a
      ><a name="6962"
      > </a
      ><a name="6963" class="Symbol"
      >=</a
      ><a name="6964"
      > </a
      ><a name="6965" class="Symbol"
      >(</a
      ><a name="6966" href="Stlc.html#6090" class="InductiveConstructor"
      >abs</a
      ><a name="6969"
      > </a
      ><a name="6970" href="Stlc.html#6621" class="Function"
      >x</a
      ><a name="6971"
      > </a
      ><a name="6972" class="Symbol"
      >(</a
      ><a name="6973" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="6977"
      > </a
      ><a name="6978" href="Stlc.html#5552" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="6979"
      > </a
      ><a name="6980" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="6984" class="Symbol"
      >)</a
      ><a name="6985"
      > </a
      ><a name="6986" class="Symbol"
      >(</a
      ><a name="6987" href="Stlc.html#6041" class="InductiveConstructor"
      >var</a
      ><a name="6990"
      > </a
      ><a name="6991" href="Stlc.html#6621" class="Function"
      >x</a
      ><a name="6992" class="Symbol"
      >))</a
      >
{% endraw %}</pre>

$$\text{idBBBB} = \lambda x:(bool\rightarrow bool)\rightarrow (bool\rightarrow bool). x$$.

<pre class="Agda">{% raw %}
<a name="7112" href="Stlc.html#7112" class="Function"
      >idBBBB</a
      ><a name="7118"
      > </a
      ><a name="7119" class="Symbol"
      >=</a
      ><a name="7120"
      > </a
      ><a name="7121" class="Symbol"
      >(</a
      ><a name="7122" href="Stlc.html#6090" class="InductiveConstructor"
      >abs</a
      ><a name="7125"
      > </a
      ><a name="7126" href="Stlc.html#6621" class="Function"
      >x</a
      ><a name="7127"
      > </a
      ><a name="7128" class="Symbol"
      >((</a
      ><a name="7130" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="7134"
      > </a
      ><a name="7135" href="Stlc.html#5552" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="7136"
      > </a
      ><a name="7137" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="7141" class="Symbol"
      >)</a
      ><a name="7142"
      > </a
      ><a name="7143" href="Stlc.html#5552" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="7144"
      > </a
      ><a name="7145" class="Symbol"
      >(</a
      ><a name="7146" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="7150"
      > </a
      ><a name="7151" href="Stlc.html#5552" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="7152"
      > </a
      ><a name="7153" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="7157" class="Symbol"
      >))</a
      ><a name="7159"
      > </a
      ><a name="7160" class="Symbol"
      >(</a
      ><a name="7161" href="Stlc.html#6041" class="InductiveConstructor"
      >var</a
      ><a name="7164"
      > </a
      ><a name="7165" href="Stlc.html#6621" class="Function"
      >x</a
      ><a name="7166" class="Symbol"
      >))</a
      >
{% endraw %}</pre>

$$\text{k} = \lambda x:bool. \lambda y:bool. x$$.

<pre class="Agda">{% raw %}
<a name="7245" href="Stlc.html#7245" class="Function"
      >k</a
      ><a name="7246"
      > </a
      ><a name="7247" class="Symbol"
      >=</a
      ><a name="7248"
      > </a
      ><a name="7249" class="Symbol"
      >(</a
      ><a name="7250" href="Stlc.html#6090" class="InductiveConstructor"
      >abs</a
      ><a name="7253"
      > </a
      ><a name="7254" href="Stlc.html#6621" class="Function"
      >x</a
      ><a name="7255"
      > </a
      ><a name="7256" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="7260"
      > </a
      ><a name="7261" class="Symbol"
      >(</a
      ><a name="7262" href="Stlc.html#6090" class="InductiveConstructor"
      >abs</a
      ><a name="7265"
      > </a
      ><a name="7266" href="Stlc.html#6630" class="Function"
      >y</a
      ><a name="7267"
      > </a
      ><a name="7268" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="7272"
      > </a
      ><a name="7273" class="Symbol"
      >(</a
      ><a name="7274" href="Stlc.html#6041" class="InductiveConstructor"
      >var</a
      ><a name="7277"
      > </a
      ><a name="7278" href="Stlc.html#6621" class="Function"
      >x</a
      ><a name="7279" class="Symbol"
      >)))</a
      >
{% endraw %}</pre>

$$\text{notB} = \lambda x:bool. \text{if }x\text{ then }false\text{ else }true$$.

<pre class="Agda">{% raw %}
<a name="7391" href="Stlc.html#7391" class="Function"
      >notB</a
      ><a name="7395"
      > </a
      ><a name="7396" class="Symbol"
      >=</a
      ><a name="7397"
      > </a
      ><a name="7398" class="Symbol"
      >(</a
      ><a name="7399" href="Stlc.html#6090" class="InductiveConstructor"
      >abs</a
      ><a name="7402"
      > </a
      ><a name="7403" href="Stlc.html#6621" class="Function"
      >x</a
      ><a name="7404"
      > </a
      ><a name="7405" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="7409"
      > </a
      ><a name="7410" class="Symbol"
      >(</a
      ><a name="7411" href="Stlc.html#6154" class="InductiveConstructor Operator"
      >if</a
      ><a name="7413"
      > </a
      ><a name="7414" class="Symbol"
      >(</a
      ><a name="7415" href="Stlc.html#6041" class="InductiveConstructor"
      >var</a
      ><a name="7418"
      > </a
      ><a name="7419" href="Stlc.html#6621" class="Function"
      >x</a
      ><a name="7420" class="Symbol"
      >)</a
      ><a name="7421"
      > </a
      ><a name="7422" href="Stlc.html#6154" class="InductiveConstructor Operator"
      >then</a
      ><a name="7426"
      > </a
      ><a name="7427" href="Stlc.html#6139" class="InductiveConstructor"
      >false</a
      ><a name="7432"
      > </a
      ><a name="7433" href="Stlc.html#6154" class="InductiveConstructor Operator"
      >else</a
      ><a name="7437"
      > </a
      ><a name="7438" href="Stlc.html#6124" class="InductiveConstructor"
      >true</a
      ><a name="7442" class="Symbol"
      >))</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="7491" class="Symbol"
      >{-#</a
      ><a name="7494"
      > </a
      ><a name="7495" class="Keyword"
      >DISPLAY</a
      ><a name="7502"
      > </a
      ><a name="7503" href="Stlc.html#6090" class="InductiveConstructor"
      >abs</a
      ><a name="7506"
      > 0 </a
      ><a name="7509" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="7513"
      > (</a
      ><a name="7515" href="Stlc.html#6041" class="InductiveConstructor"
      >var</a
      ><a name="7518"
      > 0) = </a
      ><a name="7524" href="Stlc.html#6852" class="Function"
      >idB</a
      ><a name="7527"
      > </a
      ><a name="7528" class="Symbol"
      >#-}</a
      ><a name="7531"
      >
</a
      ><a name="7532" class="Symbol"
      >{-#</a
      ><a name="7535"
      > </a
      ><a name="7536" class="Keyword"
      >DISPLAY</a
      ><a name="7543"
      > </a
      ><a name="7544" href="Stlc.html#6090" class="InductiveConstructor"
      >abs</a
      ><a name="7547"
      > 0 (</a
      ><a name="7551" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="7555"
      > </a
      ><a name="7556" href="Stlc.html#5552" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="7557"
      > </a
      ><a name="7558" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="7562"
      >) (</a
      ><a name="7565" href="Stlc.html#6041" class="InductiveConstructor"
      >var</a
      ><a name="7568"
      > 0) = </a
      ><a name="7574" href="Stlc.html#6958" class="Function"
      >idBB</a
      ><a name="7578"
      > </a
      ><a name="7579" class="Symbol"
      >#-}</a
      ><a name="7582"
      >
</a
      ><a name="7583" class="Symbol"
      >{-#</a
      ><a name="7586"
      > </a
      ><a name="7587" class="Keyword"
      >DISPLAY</a
      ><a name="7594"
      > </a
      ><a name="7595" href="Stlc.html#6090" class="InductiveConstructor"
      >abs</a
      ><a name="7598"
      > 0 ((</a
      ><a name="7603" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="7607"
      > </a
      ><a name="7608" href="Stlc.html#5552" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="7609"
      > </a
      ><a name="7610" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="7614"
      >) </a
      ><a name="7616" href="Stlc.html#5552" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="7617"
      > (</a
      ><a name="7619" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="7623"
      > </a
      ><a name="7624" href="Stlc.html#5552" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="7625"
      > </a
      ><a name="7626" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="7630"
      >)) (</a
      ><a name="7634" href="Stlc.html#6041" class="InductiveConstructor"
      >var</a
      ><a name="7637"
      > 0) = </a
      ><a name="7643" href="Stlc.html#7112" class="Function"
      >idBBBB</a
      ><a name="7649"
      > </a
      ><a name="7650" class="Symbol"
      >#-}</a
      ><a name="7653"
      >
</a
      ><a name="7654" class="Symbol"
      >{-#</a
      ><a name="7657"
      > </a
      ><a name="7658" class="Keyword"
      >DISPLAY</a
      ><a name="7665"
      > </a
      ><a name="7666" href="Stlc.html#6090" class="InductiveConstructor"
      >abs</a
      ><a name="7669"
      > 0 </a
      ><a name="7672" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="7676"
      > (</a
      ><a name="7678" href="Stlc.html#6090" class="InductiveConstructor"
      >abs</a
      ><a name="7681"
      > </a
      ><a name="7682" href="Stlc.html#7682" class="Bound"
      >y</a
      ><a name="7683"
      > </a
      ><a name="7684" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="7688"
      > (</a
      ><a name="7690" href="Stlc.html#6041" class="InductiveConstructor"
      >var</a
      ><a name="7693"
      > 0)) = </a
      ><a name="7700" href="Stlc.html#7245" class="Function"
      >k</a
      ><a name="7701"
      > </a
      ><a name="7702" class="Symbol"
      >#-}</a
      ><a name="7705"
      >
</a
      ><a name="7706" class="Symbol"
      >{-#</a
      ><a name="7709"
      > </a
      ><a name="7710" class="Keyword"
      >DISPLAY</a
      ><a name="7717"
      > </a
      ><a name="7718" href="Stlc.html#6090" class="InductiveConstructor"
      >abs</a
      ><a name="7721"
      > 0 </a
      ><a name="7724" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="7728"
      > (</a
      ><a name="7730" href="Stlc.html#6154" class="InductiveConstructor Operator"
      >if</a
      ><a name="7732"
      > (</a
      ><a name="7734" href="Stlc.html#6041" class="InductiveConstructor"
      >var</a
      ><a name="7737"
      > 0) </a
      ><a name="7741" href="Stlc.html#6154" class="InductiveConstructor Operator"
      >then</a
      ><a name="7745"
      > </a
      ><a name="7746" href="Stlc.html#6139" class="InductiveConstructor"
      >false</a
      ><a name="7751"
      > </a
      ><a name="7752" href="Stlc.html#6154" class="InductiveConstructor Operator"
      >else</a
      ><a name="7756"
      > </a
      ><a name="7757" href="Stlc.html#6124" class="InductiveConstructor"
      >true</a
      ><a name="7761"
      >) = </a
      ><a name="7765" href="Stlc.html#7391" class="Function"
      >notB</a
      ><a name="7769"
      > </a
      ><a name="7770" class="Symbol"
      >#-}</a
      >
{% endraw %}</pre>
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

<pre class="Agda">{% raw %}
<a name="9008" href="Stlc.html#9008" class="Function Operator"
      >test_normalizeUnderLambda</a
      ><a name="9033"
      > </a
      ><a name="9034" class="Symbol"
      >:</a
      ><a name="9035"
      > </a
      ><a name="9036" class="Symbol"
      >(&#955;</a
      ><a name="9038"
      > </a
      ><a name="9039" class="Symbol"
      >(</a
      ><a name="9040" href="Stlc.html#9040" class="Bound"
      >x</a
      ><a name="9041"
      > </a
      ><a name="9042" class="Symbol"
      >:</a
      ><a name="9043"
      > </a
      ><a name="9044" href="Agda.Builtin.Nat.html#69" class="Datatype"
      >&#8469;</a
      ><a name="9045" class="Symbol"
      >)</a
      ><a name="9046"
      > </a
      ><a name="9047" class="Symbol"
      >&#8594;</a
      ><a name="9048"
      > </a
      ><a name="9049" class="Number"
      >3</a
      ><a name="9050"
      > </a
      ><a name="9051" href="Agda.Builtin.Nat.html#202" class="Primitive Operator"
      >+</a
      ><a name="9052"
      > </a
      ><a name="9053" class="Number"
      >4</a
      ><a name="9054" class="Symbol"
      >)</a
      ><a name="9055"
      > </a
      ><a name="9056" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="9057"
      > </a
      ><a name="9058" class="Symbol"
      >(&#955;</a
      ><a name="9060"
      > </a
      ><a name="9061" class="Symbol"
      >(</a
      ><a name="9062" href="Stlc.html#9062" class="Bound"
      >x</a
      ><a name="9063"
      > </a
      ><a name="9064" class="Symbol"
      >:</a
      ><a name="9065"
      > </a
      ><a name="9066" href="Agda.Builtin.Nat.html#69" class="Datatype"
      >&#8469;</a
      ><a name="9067" class="Symbol"
      >)</a
      ><a name="9068"
      > </a
      ><a name="9069" class="Symbol"
      >&#8594;</a
      ><a name="9070"
      > </a
      ><a name="9071" class="Number"
      >7</a
      ><a name="9072" class="Symbol"
      >)</a
      ><a name="9073"
      >
</a
      ><a name="9074" href="Stlc.html#9008" class="Function Operator"
      >test_normalizeUnderLambda</a
      ><a name="9099"
      > </a
      ><a name="9100" class="Symbol"
      >=</a
      ><a name="9101"
      > </a
      ><a name="9102" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      >
{% endraw %}</pre>

Most real-world functional programming languages make the second
choice---reduction of a function's body only begins when the
function is actually applied to an argument.  We also make the
second choice here.

<pre class="Agda">{% raw %}
<a name="9342" class="Keyword"
      >data</a
      ><a name="9346"
      > </a
      ><a name="9347" href="Stlc.html#9347" class="Datatype"
      >Value</a
      ><a name="9352"
      > </a
      ><a name="9353" class="Symbol"
      >:</a
      ><a name="9354"
      > </a
      ><a name="9355" href="Stlc.html#6022" class="Datatype"
      >Term</a
      ><a name="9359"
      > </a
      ><a name="9360" class="Symbol"
      >&#8594;</a
      ><a name="9361"
      > </a
      ><a name="9362" class="PrimitiveType"
      >Set</a
      ><a name="9365"
      > </a
      ><a name="9366" class="Keyword"
      >where</a
      ><a name="9371"
      >
  </a
      ><a name="9374" href="Stlc.html#9374" class="InductiveConstructor"
      >abs</a
      ><a name="9377"
      >   </a
      ><a name="9380" class="Symbol"
      >:</a
      ><a name="9381"
      > </a
      ><a name="9382" class="Symbol"
      >&#8704;</a
      ><a name="9383"
      > </a
      ><a name="9384" class="Symbol"
      >{</a
      ><a name="9385" href="Stlc.html#9385" class="Bound"
      >x</a
      ><a name="9386"
      > </a
      ><a name="9387" href="Stlc.html#9387" class="Bound"
      >A</a
      ><a name="9388"
      > </a
      ><a name="9389" href="Stlc.html#9389" class="Bound"
      >t</a
      ><a name="9390" class="Symbol"
      >}</a
      ><a name="9391"
      >
        </a
      ><a name="9400" class="Symbol"
      >&#8594;</a
      ><a name="9401"
      > </a
      ><a name="9402" href="Stlc.html#9347" class="Datatype"
      >Value</a
      ><a name="9407"
      > </a
      ><a name="9408" class="Symbol"
      >(</a
      ><a name="9409" href="Stlc.html#6090" class="InductiveConstructor"
      >abs</a
      ><a name="9412"
      > </a
      ><a name="9413" href="Stlc.html#9385" class="Bound"
      >x</a
      ><a name="9414"
      > </a
      ><a name="9415" href="Stlc.html#9387" class="Bound"
      >A</a
      ><a name="9416"
      > </a
      ><a name="9417" href="Stlc.html#9389" class="Bound"
      >t</a
      ><a name="9418" class="Symbol"
      >)</a
      ><a name="9419"
      >
  </a
      ><a name="9422" href="Stlc.html#9422" class="InductiveConstructor"
      >true</a
      ><a name="9426"
      >  </a
      ><a name="9428" class="Symbol"
      >:</a
      ><a name="9429"
      > </a
      ><a name="9430" href="Stlc.html#9347" class="Datatype"
      >Value</a
      ><a name="9435"
      > </a
      ><a name="9436" href="Stlc.html#6124" class="InductiveConstructor"
      >true</a
      ><a name="9440"
      >
  </a
      ><a name="9443" href="Stlc.html#9443" class="InductiveConstructor"
      >false</a
      ><a name="9448"
      > </a
      ><a name="9449" class="Symbol"
      >:</a
      ><a name="9450"
      > </a
      ><a name="9451" href="Stlc.html#9347" class="Datatype"
      >Value</a
      ><a name="9456"
      > </a
      ><a name="9457" href="Stlc.html#6139" class="InductiveConstructor"
      >false</a
      >
{% endraw %}</pre>

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

<pre class="Agda">{% raw %}
<a name="12567" href="Stlc.html#12567" class="Function Operator"
      >[_:=_]_</a
      ><a name="12574"
      > </a
      ><a name="12575" class="Symbol"
      >:</a
      ><a name="12576"
      > </a
      ><a name="12577" href="Stlc.html#5686" class="Datatype"
      >Id</a
      ><a name="12579"
      > </a
      ><a name="12580" class="Symbol"
      >-&gt;</a
      ><a name="12582"
      > </a
      ><a name="12583" href="Stlc.html#6022" class="Datatype"
      >Term</a
      ><a name="12587"
      > </a
      ><a name="12588" class="Symbol"
      >-&gt;</a
      ><a name="12590"
      > </a
      ><a name="12591" href="Stlc.html#6022" class="Datatype"
      >Term</a
      ><a name="12595"
      > </a
      ><a name="12596" class="Symbol"
      >-&gt;</a
      ><a name="12598"
      > </a
      ><a name="12599" href="Stlc.html#6022" class="Datatype"
      >Term</a
      ><a name="12603"
      >
</a
      ><a name="12604" href="Stlc.html#12567" class="Function Operator"
      >[</a
      ><a name="12605"
      > </a
      ><a name="12606" href="Stlc.html#12606" class="Bound"
      >x</a
      ><a name="12607"
      > </a
      ><a name="12608" href="Stlc.html#12567" class="Function Operator"
      >:=</a
      ><a name="12610"
      > </a
      ><a name="12611" href="Stlc.html#12611" class="Bound"
      >v</a
      ><a name="12612"
      > </a
      ><a name="12613" href="Stlc.html#12567" class="Function Operator"
      >]</a
      ><a name="12614"
      > </a
      ><a name="12615" class="Symbol"
      >(</a
      ><a name="12616" href="Stlc.html#6041" class="InductiveConstructor"
      >var</a
      ><a name="12619"
      > </a
      ><a name="12620" href="Stlc.html#12620" class="Bound"
      >y</a
      ><a name="12621" class="Symbol"
      >)</a
      ><a name="12622"
      > </a
      ><a name="12623" class="Keyword"
      >with</a
      ><a name="12627"
      > </a
      ><a name="12628" href="Stlc.html#12606" class="Bound"
      >x</a
      ><a name="12629"
      > </a
      ><a name="12630" href="Stlc.html#5761" class="Function Operator"
      >&#8799;</a
      ><a name="12631"
      > </a
      ><a name="12632" href="Stlc.html#12620" class="Bound"
      >y</a
      ><a name="12633"
      >
</a
      ><a name="12634" class="Symbol"
      >...</a
      ><a name="12637"
      > </a
      ><a name="12638" class="Symbol"
      >|</a
      ><a name="12639"
      > </a
      ><a name="12640" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="12643"
      > </a
      ><a name="12644" href="Stlc.html#12644" class="Bound"
      >x=y</a
      ><a name="12647"
      > </a
      ><a name="12648" class="Symbol"
      >=</a
      ><a name="12649"
      > </a
      ><a name="12650" href="Stlc.html#12611" class="Bound"
      >v</a
      ><a name="12651"
      >
</a
      ><a name="12652" class="Symbol"
      >...</a
      ><a name="12655"
      > </a
      ><a name="12656" class="Symbol"
      >|</a
      ><a name="12657"
      > </a
      ><a name="12658" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="12660"
      >  </a
      ><a name="12662" href="Stlc.html#12662" class="Bound"
      >x&#8800;y</a
      ><a name="12665"
      > </a
      ><a name="12666" class="Symbol"
      >=</a
      ><a name="12667"
      > </a
      ><a name="12668" href="Stlc.html#6041" class="InductiveConstructor"
      >var</a
      ><a name="12671"
      > </a
      ><a name="12672" href="Stlc.html#12620" class="Bound"
      >y</a
      ><a name="12673"
      >
</a
      ><a name="12674" href="Stlc.html#12567" class="Function Operator"
      >[</a
      ><a name="12675"
      > </a
      ><a name="12676" href="Stlc.html#12676" class="Bound"
      >x</a
      ><a name="12677"
      > </a
      ><a name="12678" href="Stlc.html#12567" class="Function Operator"
      >:=</a
      ><a name="12680"
      > </a
      ><a name="12681" href="Stlc.html#12681" class="Bound"
      >v</a
      ><a name="12682"
      > </a
      ><a name="12683" href="Stlc.html#12567" class="Function Operator"
      >]</a
      ><a name="12684"
      > </a
      ><a name="12685" class="Symbol"
      >(</a
      ><a name="12686" href="Stlc.html#6061" class="InductiveConstructor"
      >app</a
      ><a name="12689"
      > </a
      ><a name="12690" href="Stlc.html#12690" class="Bound"
      >s</a
      ><a name="12691"
      > </a
      ><a name="12692" href="Stlc.html#12692" class="Bound"
      >t</a
      ><a name="12693" class="Symbol"
      >)</a
      ><a name="12694"
      > </a
      ><a name="12695" class="Symbol"
      >=</a
      ><a name="12696"
      > </a
      ><a name="12697" href="Stlc.html#6061" class="InductiveConstructor"
      >app</a
      ><a name="12700"
      > </a
      ><a name="12701" class="Symbol"
      >(</a
      ><a name="12702" href="Stlc.html#12567" class="Function Operator"
      >[</a
      ><a name="12703"
      > </a
      ><a name="12704" href="Stlc.html#12676" class="Bound"
      >x</a
      ><a name="12705"
      > </a
      ><a name="12706" href="Stlc.html#12567" class="Function Operator"
      >:=</a
      ><a name="12708"
      > </a
      ><a name="12709" href="Stlc.html#12681" class="Bound"
      >v</a
      ><a name="12710"
      > </a
      ><a name="12711" href="Stlc.html#12567" class="Function Operator"
      >]</a
      ><a name="12712"
      > </a
      ><a name="12713" href="Stlc.html#12690" class="Bound"
      >s</a
      ><a name="12714" class="Symbol"
      >)</a
      ><a name="12715"
      > </a
      ><a name="12716" class="Symbol"
      >(</a
      ><a name="12717" href="Stlc.html#12567" class="Function Operator"
      >[</a
      ><a name="12718"
      > </a
      ><a name="12719" href="Stlc.html#12676" class="Bound"
      >x</a
      ><a name="12720"
      > </a
      ><a name="12721" href="Stlc.html#12567" class="Function Operator"
      >:=</a
      ><a name="12723"
      > </a
      ><a name="12724" href="Stlc.html#12681" class="Bound"
      >v</a
      ><a name="12725"
      > </a
      ><a name="12726" href="Stlc.html#12567" class="Function Operator"
      >]</a
      ><a name="12727"
      > </a
      ><a name="12728" href="Stlc.html#12692" class="Bound"
      >t</a
      ><a name="12729" class="Symbol"
      >)</a
      ><a name="12730"
      >
</a
      ><a name="12731" href="Stlc.html#12567" class="Function Operator"
      >[</a
      ><a name="12732"
      > </a
      ><a name="12733" href="Stlc.html#12733" class="Bound"
      >x</a
      ><a name="12734"
      > </a
      ><a name="12735" href="Stlc.html#12567" class="Function Operator"
      >:=</a
      ><a name="12737"
      > </a
      ><a name="12738" href="Stlc.html#12738" class="Bound"
      >v</a
      ><a name="12739"
      > </a
      ><a name="12740" href="Stlc.html#12567" class="Function Operator"
      >]</a
      ><a name="12741"
      > </a
      ><a name="12742" class="Symbol"
      >(</a
      ><a name="12743" href="Stlc.html#6090" class="InductiveConstructor"
      >abs</a
      ><a name="12746"
      > </a
      ><a name="12747" href="Stlc.html#12747" class="Bound"
      >y</a
      ><a name="12748"
      > </a
      ><a name="12749" href="Stlc.html#12749" class="Bound"
      >A</a
      ><a name="12750"
      > </a
      ><a name="12751" href="Stlc.html#12751" class="Bound"
      >t</a
      ><a name="12752" class="Symbol"
      >)</a
      ><a name="12753"
      > </a
      ><a name="12754" class="Keyword"
      >with</a
      ><a name="12758"
      > </a
      ><a name="12759" href="Stlc.html#12733" class="Bound"
      >x</a
      ><a name="12760"
      > </a
      ><a name="12761" href="Stlc.html#5761" class="Function Operator"
      >&#8799;</a
      ><a name="12762"
      > </a
      ><a name="12763" href="Stlc.html#12747" class="Bound"
      >y</a
      ><a name="12764"
      >
</a
      ><a name="12765" class="Symbol"
      >...</a
      ><a name="12768"
      > </a
      ><a name="12769" class="Symbol"
      >|</a
      ><a name="12770"
      > </a
      ><a name="12771" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="12774"
      > </a
      ><a name="12775" href="Stlc.html#12775" class="Bound"
      >x=y</a
      ><a name="12778"
      > </a
      ><a name="12779" class="Symbol"
      >=</a
      ><a name="12780"
      > </a
      ><a name="12781" href="Stlc.html#6090" class="InductiveConstructor"
      >abs</a
      ><a name="12784"
      > </a
      ><a name="12785" href="Stlc.html#12747" class="Bound"
      >y</a
      ><a name="12786"
      > </a
      ><a name="12787" href="Stlc.html#12749" class="Bound"
      >A</a
      ><a name="12788"
      > </a
      ><a name="12789" href="Stlc.html#12751" class="Bound"
      >t</a
      ><a name="12790"
      >
</a
      ><a name="12791" class="Symbol"
      >...</a
      ><a name="12794"
      > </a
      ><a name="12795" class="Symbol"
      >|</a
      ><a name="12796"
      > </a
      ><a name="12797" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="12799"
      >  </a
      ><a name="12801" href="Stlc.html#12801" class="Bound"
      >x&#8800;y</a
      ><a name="12804"
      > </a
      ><a name="12805" class="Symbol"
      >=</a
      ><a name="12806"
      > </a
      ><a name="12807" href="Stlc.html#6090" class="InductiveConstructor"
      >abs</a
      ><a name="12810"
      > </a
      ><a name="12811" href="Stlc.html#12747" class="Bound"
      >y</a
      ><a name="12812"
      > </a
      ><a name="12813" href="Stlc.html#12749" class="Bound"
      >A</a
      ><a name="12814"
      > </a
      ><a name="12815" class="Symbol"
      >(</a
      ><a name="12816" href="Stlc.html#12567" class="Function Operator"
      >[</a
      ><a name="12817"
      > </a
      ><a name="12818" href="Stlc.html#12733" class="Bound"
      >x</a
      ><a name="12819"
      > </a
      ><a name="12820" href="Stlc.html#12567" class="Function Operator"
      >:=</a
      ><a name="12822"
      > </a
      ><a name="12823" href="Stlc.html#12738" class="Bound"
      >v</a
      ><a name="12824"
      > </a
      ><a name="12825" href="Stlc.html#12567" class="Function Operator"
      >]</a
      ><a name="12826"
      > </a
      ><a name="12827" href="Stlc.html#12751" class="Bound"
      >t</a
      ><a name="12828" class="Symbol"
      >)</a
      ><a name="12829"
      >
</a
      ><a name="12830" href="Stlc.html#12567" class="Function Operator"
      >[</a
      ><a name="12831"
      > </a
      ><a name="12832" href="Stlc.html#12832" class="Bound"
      >x</a
      ><a name="12833"
      > </a
      ><a name="12834" href="Stlc.html#12567" class="Function Operator"
      >:=</a
      ><a name="12836"
      > </a
      ><a name="12837" href="Stlc.html#12837" class="Bound"
      >v</a
      ><a name="12838"
      > </a
      ><a name="12839" href="Stlc.html#12567" class="Function Operator"
      >]</a
      ><a name="12840"
      > </a
      ><a name="12841" href="Stlc.html#6124" class="InductiveConstructor"
      >true</a
      ><a name="12845"
      >  </a
      ><a name="12847" class="Symbol"
      >=</a
      ><a name="12848"
      > </a
      ><a name="12849" href="Stlc.html#6124" class="InductiveConstructor"
      >true</a
      ><a name="12853"
      >
</a
      ><a name="12854" href="Stlc.html#12567" class="Function Operator"
      >[</a
      ><a name="12855"
      > </a
      ><a name="12856" href="Stlc.html#12856" class="Bound"
      >x</a
      ><a name="12857"
      > </a
      ><a name="12858" href="Stlc.html#12567" class="Function Operator"
      >:=</a
      ><a name="12860"
      > </a
      ><a name="12861" href="Stlc.html#12861" class="Bound"
      >v</a
      ><a name="12862"
      > </a
      ><a name="12863" href="Stlc.html#12567" class="Function Operator"
      >]</a
      ><a name="12864"
      > </a
      ><a name="12865" href="Stlc.html#6139" class="InductiveConstructor"
      >false</a
      ><a name="12870"
      > </a
      ><a name="12871" class="Symbol"
      >=</a
      ><a name="12872"
      > </a
      ><a name="12873" href="Stlc.html#6139" class="InductiveConstructor"
      >false</a
      ><a name="12878"
      >
</a
      ><a name="12879" href="Stlc.html#12567" class="Function Operator"
      >[</a
      ><a name="12880"
      > </a
      ><a name="12881" href="Stlc.html#12881" class="Bound"
      >x</a
      ><a name="12882"
      > </a
      ><a name="12883" href="Stlc.html#12567" class="Function Operator"
      >:=</a
      ><a name="12885"
      > </a
      ><a name="12886" href="Stlc.html#12886" class="Bound"
      >v</a
      ><a name="12887"
      > </a
      ><a name="12888" href="Stlc.html#12567" class="Function Operator"
      >]</a
      ><a name="12889"
      > </a
      ><a name="12890" class="Symbol"
      >(</a
      ><a name="12891" href="Stlc.html#6154" class="InductiveConstructor Operator"
      >if</a
      ><a name="12893"
      > </a
      ><a name="12894" href="Stlc.html#12894" class="Bound"
      >s</a
      ><a name="12895"
      > </a
      ><a name="12896" href="Stlc.html#6154" class="InductiveConstructor Operator"
      >then</a
      ><a name="12900"
      > </a
      ><a name="12901" href="Stlc.html#12901" class="Bound"
      >t</a
      ><a name="12902"
      > </a
      ><a name="12903" href="Stlc.html#6154" class="InductiveConstructor Operator"
      >else</a
      ><a name="12907"
      > </a
      ><a name="12908" href="Stlc.html#12908" class="Bound"
      >u</a
      ><a name="12909" class="Symbol"
      >)</a
      ><a name="12910"
      > </a
      ><a name="12911" class="Symbol"
      >=</a
      ><a name="12912"
      >
  </a
      ><a name="12915" href="Stlc.html#6154" class="InductiveConstructor Operator"
      >if</a
      ><a name="12917"
      > </a
      ><a name="12918" href="Stlc.html#12567" class="Function Operator"
      >[</a
      ><a name="12919"
      > </a
      ><a name="12920" href="Stlc.html#12881" class="Bound"
      >x</a
      ><a name="12921"
      > </a
      ><a name="12922" href="Stlc.html#12567" class="Function Operator"
      >:=</a
      ><a name="12924"
      > </a
      ><a name="12925" href="Stlc.html#12886" class="Bound"
      >v</a
      ><a name="12926"
      > </a
      ><a name="12927" href="Stlc.html#12567" class="Function Operator"
      >]</a
      ><a name="12928"
      > </a
      ><a name="12929" href="Stlc.html#12894" class="Bound"
      >s</a
      ><a name="12930"
      > </a
      ><a name="12931" href="Stlc.html#6154" class="InductiveConstructor Operator"
      >then</a
      ><a name="12935"
      > </a
      ><a name="12936" href="Stlc.html#12567" class="Function Operator"
      >[</a
      ><a name="12937"
      > </a
      ><a name="12938" href="Stlc.html#12881" class="Bound"
      >x</a
      ><a name="12939"
      > </a
      ><a name="12940" href="Stlc.html#12567" class="Function Operator"
      >:=</a
      ><a name="12942"
      > </a
      ><a name="12943" href="Stlc.html#12886" class="Bound"
      >v</a
      ><a name="12944"
      > </a
      ><a name="12945" href="Stlc.html#12567" class="Function Operator"
      >]</a
      ><a name="12946"
      > </a
      ><a name="12947" href="Stlc.html#12901" class="Bound"
      >t</a
      ><a name="12948"
      > </a
      ><a name="12949" href="Stlc.html#6154" class="InductiveConstructor Operator"
      >else</a
      ><a name="12953"
      >  </a
      ><a name="12955" href="Stlc.html#12567" class="Function Operator"
      >[</a
      ><a name="12956"
      > </a
      ><a name="12957" href="Stlc.html#12881" class="Bound"
      >x</a
      ><a name="12958"
      > </a
      ><a name="12959" href="Stlc.html#12567" class="Function Operator"
      >:=</a
      ><a name="12961"
      > </a
      ><a name="12962" href="Stlc.html#12886" class="Bound"
      >v</a
      ><a name="12963"
      > </a
      ><a name="12964" href="Stlc.html#12567" class="Function Operator"
      >]</a
      ><a name="12965"
      > </a
      ><a name="12966" href="Stlc.html#12908" class="Bound"
      >u</a
      ><a name="12967"
      >

</a
      ><a name="12969" class="Keyword"
      >infix</a
      ><a name="12974"
      > </a
      ><a name="12975" class="Number"
      >9</a
      >
{% endraw %}</pre>

_Technical note_: Substitution becomes trickier to define if we
consider the case where $$s$$, the term being substituted for a
variable in some other term, may itself contain free variables.
Since we are only interested here in defining the small-step relation
on closed terms (i.e., terms like $$\lambda x:bool. x$$ that include
binders for all of the variables they mention), we can avoid this
extra complexity here, but it must be dealt with when formalizing
richer languages.


#### Exercise: 3 stars (substi)
The definition that we gave above defines substitution as a _function_.
Suppose, instead, we wanted to define substitution as an inductive _relation_.
We've begun the definition by providing the `data` header and
one of the constructors; your job is to fill in the rest of the constructors
and prove that the relation you've defined coincides with the function given
above.
<pre class="Agda">{% raw %}
<a name="13899" class="Keyword"
      >data</a
      ><a name="13903"
      > </a
      ><a name="13904" href="Stlc.html#13904" class="Datatype Operator"
      >[_:=_]_==&gt;_</a
      ><a name="13915"
      > </a
      ><a name="13916" class="Symbol"
      >(</a
      ><a name="13917" href="Stlc.html#13917" class="Bound"
      >x</a
      ><a name="13918"
      > </a
      ><a name="13919" class="Symbol"
      >:</a
      ><a name="13920"
      > </a
      ><a name="13921" href="Stlc.html#5686" class="Datatype"
      >Id</a
      ><a name="13923" class="Symbol"
      >)</a
      ><a name="13924"
      > </a
      ><a name="13925" class="Symbol"
      >(</a
      ><a name="13926" href="Stlc.html#13926" class="Bound"
      >s</a
      ><a name="13927"
      > </a
      ><a name="13928" class="Symbol"
      >:</a
      ><a name="13929"
      > </a
      ><a name="13930" href="Stlc.html#6022" class="Datatype"
      >Term</a
      ><a name="13934" class="Symbol"
      >)</a
      ><a name="13935"
      > </a
      ><a name="13936" class="Symbol"
      >:</a
      ><a name="13937"
      > </a
      ><a name="13938" href="Stlc.html#6022" class="Datatype"
      >Term</a
      ><a name="13942"
      > </a
      ><a name="13943" class="Symbol"
      >-&gt;</a
      ><a name="13945"
      > </a
      ><a name="13946" href="Stlc.html#6022" class="Datatype"
      >Term</a
      ><a name="13950"
      > </a
      ><a name="13951" class="Symbol"
      >-&gt;</a
      ><a name="13953"
      > </a
      ><a name="13954" class="PrimitiveType"
      >Set</a
      ><a name="13957"
      > </a
      ><a name="13958" class="Keyword"
      >where</a
      ><a name="13963"
      >
  </a
      ><a name="13966" href="Stlc.html#13966" class="InductiveConstructor"
      >var1</a
      ><a name="13970"
      > </a
      ><a name="13971" class="Symbol"
      >:</a
      ><a name="13972"
      > </a
      ><a name="13973" href="Stlc.html#13904" class="Datatype Operator"
      >[</a
      ><a name="13974"
      > </a
      ><a name="13975" href="Stlc.html#13917" class="Bound"
      >x</a
      ><a name="13976"
      > </a
      ><a name="13977" href="Stlc.html#13904" class="Datatype Operator"
      >:=</a
      ><a name="13979"
      > </a
      ><a name="13980" href="Stlc.html#13926" class="Bound"
      >s</a
      ><a name="13981"
      > </a
      ><a name="13982" href="Stlc.html#13904" class="Datatype Operator"
      >]</a
      ><a name="13983"
      > </a
      ><a name="13984" class="Symbol"
      >(</a
      ><a name="13985" href="Stlc.html#6041" class="InductiveConstructor"
      >var</a
      ><a name="13988"
      > </a
      ><a name="13989" href="Stlc.html#13917" class="Bound"
      >x</a
      ><a name="13990" class="Symbol"
      >)</a
      ><a name="13991"
      > </a
      ><a name="13992" href="Stlc.html#13904" class="Datatype Operator"
      >==&gt;</a
      ><a name="13995"
      > </a
      ><a name="13996" href="Stlc.html#13926" class="Bound"
      >s</a
      ><a name="13997"
      >
  </a
      ><a name="14000" class="Comment"
      >{- FILL IN HERE -}</a
      >
{% endraw %}</pre>

<pre class="Agda">{% raw %}
<a name="14044" href="Stlc.html#14044" class="Function"
      >subst-correct</a
      ><a name="14057"
      > </a
      ><a name="14058" class="Symbol"
      >:</a
      ><a name="14059"
      > </a
      ><a name="14060" class="Symbol"
      >&#8704;</a
      ><a name="14061"
      > </a
      ><a name="14062" href="Stlc.html#14062" class="Bound"
      >s</a
      ><a name="14063"
      > </a
      ><a name="14064" href="Stlc.html#14064" class="Bound"
      >x</a
      ><a name="14065"
      > </a
      ><a name="14066" href="Stlc.html#14066" class="Bound"
      >t</a
      ><a name="14067"
      > </a
      ><a name="14068" href="Stlc.html#14068" class="Bound"
      >t'</a
      ><a name="14070"
      >
              </a
      ><a name="14085" class="Symbol"
      >&#8594;</a
      ><a name="14086"
      > </a
      ><a name="14087" href="Stlc.html#12567" class="Function Operator"
      >[</a
      ><a name="14088"
      > </a
      ><a name="14089" href="Stlc.html#14064" class="Bound"
      >x</a
      ><a name="14090"
      > </a
      ><a name="14091" href="Stlc.html#12567" class="Function Operator"
      >:=</a
      ><a name="14093"
      > </a
      ><a name="14094" href="Stlc.html#14062" class="Bound"
      >s</a
      ><a name="14095"
      > </a
      ><a name="14096" href="Stlc.html#12567" class="Function Operator"
      >]</a
      ><a name="14097"
      > </a
      ><a name="14098" href="Stlc.html#14066" class="Bound"
      >t</a
      ><a name="14099"
      > </a
      ><a name="14100" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="14101"
      > </a
      ><a name="14102" href="Stlc.html#14068" class="Bound"
      >t'</a
      ><a name="14104"
      >
              </a
      ><a name="14119" class="Symbol"
      >&#8594;</a
      ><a name="14120"
      > </a
      ><a name="14121" href="Stlc.html#13904" class="Datatype Operator"
      >[</a
      ><a name="14122"
      > </a
      ><a name="14123" href="Stlc.html#14064" class="Bound"
      >x</a
      ><a name="14124"
      > </a
      ><a name="14125" href="Stlc.html#13904" class="Datatype Operator"
      >:=</a
      ><a name="14127"
      > </a
      ><a name="14128" href="Stlc.html#14062" class="Bound"
      >s</a
      ><a name="14129"
      > </a
      ><a name="14130" href="Stlc.html#13904" class="Datatype Operator"
      >]</a
      ><a name="14131"
      > </a
      ><a name="14132" href="Stlc.html#14066" class="Bound"
      >t</a
      ><a name="14133"
      > </a
      ><a name="14134" href="Stlc.html#13904" class="Datatype Operator"
      >==&gt;</a
      ><a name="14137"
      > </a
      ><a name="14138" href="Stlc.html#14068" class="Bound"
      >t'</a
      ><a name="14140"
      >
</a
      ><a name="14141" href="Stlc.html#14044" class="Function"
      >subst-correct</a
      ><a name="14154"
      > </a
      ><a name="14155" href="Stlc.html#14155" class="Bound"
      >s</a
      ><a name="14156"
      > </a
      ><a name="14157" href="Stlc.html#14157" class="Bound"
      >x</a
      ><a name="14158"
      > </a
      ><a name="14159" href="Stlc.html#14159" class="Bound"
      >t</a
      ><a name="14160"
      > </a
      ><a name="14161" href="Stlc.html#14161" class="Bound"
      >t'</a
      ><a name="14163"
      > </a
      ><a name="14164" href="Stlc.html#14164" class="Bound"
      >p</a
      ><a name="14165"
      > </a
      ><a name="14166" class="Symbol"
      >=</a
      ><a name="14167"
      > </a
      ><a name="14168" class="Symbol"
      >{!!}</a
      ><a name="14172"
      > </a
      ><a name="14173" class="Comment"
      >-- FILL IN HERE</a
      >
{% endraw %}</pre>


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

<pre class="Agda">{% raw %}
<a name="15452" class="Keyword"
      >data</a
      ><a name="15456"
      > </a
      ><a name="15457" href="Stlc.html#15457" class="Datatype Operator"
      >_==&gt;_</a
      ><a name="15462"
      > </a
      ><a name="15463" class="Symbol"
      >:</a
      ><a name="15464"
      > </a
      ><a name="15465" href="Stlc.html#6022" class="Datatype"
      >Term</a
      ><a name="15469"
      > </a
      ><a name="15470" class="Symbol"
      >&#8594;</a
      ><a name="15471"
      > </a
      ><a name="15472" href="Stlc.html#6022" class="Datatype"
      >Term</a
      ><a name="15476"
      > </a
      ><a name="15477" class="Symbol"
      >&#8594;</a
      ><a name="15478"
      > </a
      ><a name="15479" class="PrimitiveType"
      >Set</a
      ><a name="15482"
      > </a
      ><a name="15483" class="Keyword"
      >where</a
      ><a name="15488"
      >
  </a
      ><a name="15491" href="Stlc.html#15491" class="InductiveConstructor"
      >red</a
      ><a name="15494"
      >     </a
      ><a name="15499" class="Symbol"
      >:</a
      ><a name="15500"
      > </a
      ><a name="15501" class="Symbol"
      >&#8704;</a
      ><a name="15502"
      > </a
      ><a name="15503" class="Symbol"
      >{</a
      ><a name="15504" href="Stlc.html#15504" class="Bound"
      >x</a
      ><a name="15505"
      > </a
      ><a name="15506" href="Stlc.html#15506" class="Bound"
      >A</a
      ><a name="15507"
      > </a
      ><a name="15508" href="Stlc.html#15508" class="Bound"
      >s</a
      ><a name="15509"
      > </a
      ><a name="15510" href="Stlc.html#15510" class="Bound"
      >t</a
      ><a name="15511" class="Symbol"
      >}</a
      ><a name="15512"
      >
          </a
      ><a name="15523" class="Symbol"
      >&#8594;</a
      ><a name="15524"
      > </a
      ><a name="15525" href="Stlc.html#9347" class="Datatype"
      >Value</a
      ><a name="15530"
      > </a
      ><a name="15531" href="Stlc.html#15510" class="Bound"
      >t</a
      ><a name="15532"
      >
          </a
      ><a name="15543" class="Symbol"
      >&#8594;</a
      ><a name="15544"
      > </a
      ><a name="15545" href="Stlc.html#6061" class="InductiveConstructor"
      >app</a
      ><a name="15548"
      > </a
      ><a name="15549" class="Symbol"
      >(</a
      ><a name="15550" href="Stlc.html#6090" class="InductiveConstructor"
      >abs</a
      ><a name="15553"
      > </a
      ><a name="15554" href="Stlc.html#15504" class="Bound"
      >x</a
      ><a name="15555"
      > </a
      ><a name="15556" href="Stlc.html#15506" class="Bound"
      >A</a
      ><a name="15557"
      > </a
      ><a name="15558" href="Stlc.html#15508" class="Bound"
      >s</a
      ><a name="15559" class="Symbol"
      >)</a
      ><a name="15560"
      > </a
      ><a name="15561" href="Stlc.html#15510" class="Bound"
      >t</a
      ><a name="15562"
      > </a
      ><a name="15563" href="Stlc.html#15457" class="Datatype Operator"
      >==&gt;</a
      ><a name="15566"
      > </a
      ><a name="15567" href="Stlc.html#12567" class="Function Operator"
      >[</a
      ><a name="15568"
      > </a
      ><a name="15569" href="Stlc.html#15504" class="Bound"
      >x</a
      ><a name="15570"
      > </a
      ><a name="15571" href="Stlc.html#12567" class="Function Operator"
      >:=</a
      ><a name="15573"
      > </a
      ><a name="15574" href="Stlc.html#15510" class="Bound"
      >t</a
      ><a name="15575"
      > </a
      ><a name="15576" href="Stlc.html#12567" class="Function Operator"
      >]</a
      ><a name="15577"
      > </a
      ><a name="15578" href="Stlc.html#15508" class="Bound"
      >s</a
      ><a name="15579"
      >
  </a
      ><a name="15582" href="Stlc.html#15582" class="InductiveConstructor"
      >app1</a
      ><a name="15586"
      >    </a
      ><a name="15590" class="Symbol"
      >:</a
      ><a name="15591"
      > </a
      ><a name="15592" class="Symbol"
      >&#8704;</a
      ><a name="15593"
      > </a
      ><a name="15594" class="Symbol"
      >{</a
      ><a name="15595" href="Stlc.html#15595" class="Bound"
      >s</a
      ><a name="15596"
      > </a
      ><a name="15597" href="Stlc.html#15597" class="Bound"
      >s'</a
      ><a name="15599"
      > </a
      ><a name="15600" href="Stlc.html#15600" class="Bound"
      >t</a
      ><a name="15601" class="Symbol"
      >}</a
      ><a name="15602"
      >
          </a
      ><a name="15613" class="Symbol"
      >&#8594;</a
      ><a name="15614"
      > </a
      ><a name="15615" href="Stlc.html#15595" class="Bound"
      >s</a
      ><a name="15616"
      > </a
      ><a name="15617" href="Stlc.html#15457" class="Datatype Operator"
      >==&gt;</a
      ><a name="15620"
      > </a
      ><a name="15621" href="Stlc.html#15597" class="Bound"
      >s'</a
      ><a name="15623"
      >
          </a
      ><a name="15634" class="Symbol"
      >&#8594;</a
      ><a name="15635"
      > </a
      ><a name="15636" href="Stlc.html#6061" class="InductiveConstructor"
      >app</a
      ><a name="15639"
      > </a
      ><a name="15640" href="Stlc.html#15595" class="Bound"
      >s</a
      ><a name="15641"
      > </a
      ><a name="15642" href="Stlc.html#15600" class="Bound"
      >t</a
      ><a name="15643"
      > </a
      ><a name="15644" href="Stlc.html#15457" class="Datatype Operator"
      >==&gt;</a
      ><a name="15647"
      > </a
      ><a name="15648" href="Stlc.html#6061" class="InductiveConstructor"
      >app</a
      ><a name="15651"
      > </a
      ><a name="15652" href="Stlc.html#15597" class="Bound"
      >s'</a
      ><a name="15654"
      > </a
      ><a name="15655" href="Stlc.html#15600" class="Bound"
      >t</a
      ><a name="15656"
      >
  </a
      ><a name="15659" href="Stlc.html#15659" class="InductiveConstructor"
      >app2</a
      ><a name="15663"
      >    </a
      ><a name="15667" class="Symbol"
      >:</a
      ><a name="15668"
      > </a
      ><a name="15669" class="Symbol"
      >&#8704;</a
      ><a name="15670"
      > </a
      ><a name="15671" class="Symbol"
      >{</a
      ><a name="15672" href="Stlc.html#15672" class="Bound"
      >s</a
      ><a name="15673"
      > </a
      ><a name="15674" href="Stlc.html#15674" class="Bound"
      >t</a
      ><a name="15675"
      > </a
      ><a name="15676" href="Stlc.html#15676" class="Bound"
      >t'</a
      ><a name="15678" class="Symbol"
      >}</a
      ><a name="15679"
      >
          </a
      ><a name="15690" class="Symbol"
      >&#8594;</a
      ><a name="15691"
      > </a
      ><a name="15692" href="Stlc.html#9347" class="Datatype"
      >Value</a
      ><a name="15697"
      > </a
      ><a name="15698" href="Stlc.html#15672" class="Bound"
      >s</a
      ><a name="15699"
      >
          </a
      ><a name="15710" class="Symbol"
      >&#8594;</a
      ><a name="15711"
      > </a
      ><a name="15712" href="Stlc.html#15674" class="Bound"
      >t</a
      ><a name="15713"
      > </a
      ><a name="15714" href="Stlc.html#15457" class="Datatype Operator"
      >==&gt;</a
      ><a name="15717"
      > </a
      ><a name="15718" href="Stlc.html#15676" class="Bound"
      >t'</a
      ><a name="15720"
      >
          </a
      ><a name="15731" class="Symbol"
      >&#8594;</a
      ><a name="15732"
      > </a
      ><a name="15733" href="Stlc.html#6061" class="InductiveConstructor"
      >app</a
      ><a name="15736"
      > </a
      ><a name="15737" href="Stlc.html#15672" class="Bound"
      >s</a
      ><a name="15738"
      > </a
      ><a name="15739" href="Stlc.html#15674" class="Bound"
      >t</a
      ><a name="15740"
      > </a
      ><a name="15741" href="Stlc.html#15457" class="Datatype Operator"
      >==&gt;</a
      ><a name="15744"
      > </a
      ><a name="15745" href="Stlc.html#6061" class="InductiveConstructor"
      >app</a
      ><a name="15748"
      > </a
      ><a name="15749" href="Stlc.html#15672" class="Bound"
      >s</a
      ><a name="15750"
      > </a
      ><a name="15751" href="Stlc.html#15676" class="Bound"
      >t'</a
      ><a name="15753"
      >
  </a
      ><a name="15756" href="Stlc.html#15756" class="InductiveConstructor"
      >if</a
      ><a name="15758"
      >      </a
      ><a name="15764" class="Symbol"
      >:</a
      ><a name="15765"
      > </a
      ><a name="15766" class="Symbol"
      >&#8704;</a
      ><a name="15767"
      > </a
      ><a name="15768" class="Symbol"
      >{</a
      ><a name="15769" href="Stlc.html#15769" class="Bound"
      >s</a
      ><a name="15770"
      > </a
      ><a name="15771" href="Stlc.html#15771" class="Bound"
      >s'</a
      ><a name="15773"
      > </a
      ><a name="15774" href="Stlc.html#15774" class="Bound"
      >t</a
      ><a name="15775"
      > </a
      ><a name="15776" href="Stlc.html#15776" class="Bound"
      >u</a
      ><a name="15777" class="Symbol"
      >}</a
      ><a name="15778"
      >
          </a
      ><a name="15789" class="Symbol"
      >&#8594;</a
      ><a name="15790"
      > </a
      ><a name="15791" href="Stlc.html#15769" class="Bound"
      >s</a
      ><a name="15792"
      > </a
      ><a name="15793" href="Stlc.html#15457" class="Datatype Operator"
      >==&gt;</a
      ><a name="15796"
      > </a
      ><a name="15797" href="Stlc.html#15771" class="Bound"
      >s'</a
      ><a name="15799"
      >
          </a
      ><a name="15810" class="Symbol"
      >&#8594;</a
      ><a name="15811"
      > </a
      ><a name="15812" href="Stlc.html#6154" class="InductiveConstructor Operator"
      >if</a
      ><a name="15814"
      > </a
      ><a name="15815" href="Stlc.html#15769" class="Bound"
      >s</a
      ><a name="15816"
      > </a
      ><a name="15817" href="Stlc.html#6154" class="InductiveConstructor Operator"
      >then</a
      ><a name="15821"
      > </a
      ><a name="15822" href="Stlc.html#15774" class="Bound"
      >t</a
      ><a name="15823"
      > </a
      ><a name="15824" href="Stlc.html#6154" class="InductiveConstructor Operator"
      >else</a
      ><a name="15828"
      > </a
      ><a name="15829" href="Stlc.html#15776" class="Bound"
      >u</a
      ><a name="15830"
      > </a
      ><a name="15831" href="Stlc.html#15457" class="Datatype Operator"
      >==&gt;</a
      ><a name="15834"
      > </a
      ><a name="15835" href="Stlc.html#6154" class="InductiveConstructor Operator"
      >if</a
      ><a name="15837"
      > </a
      ><a name="15838" href="Stlc.html#15771" class="Bound"
      >s'</a
      ><a name="15840"
      > </a
      ><a name="15841" href="Stlc.html#6154" class="InductiveConstructor Operator"
      >then</a
      ><a name="15845"
      > </a
      ><a name="15846" href="Stlc.html#15774" class="Bound"
      >t</a
      ><a name="15847"
      > </a
      ><a name="15848" href="Stlc.html#6154" class="InductiveConstructor Operator"
      >else</a
      ><a name="15852"
      > </a
      ><a name="15853" href="Stlc.html#15776" class="Bound"
      >u</a
      ><a name="15854"
      >
  </a
      ><a name="15857" href="Stlc.html#15857" class="InductiveConstructor"
      >iftrue</a
      ><a name="15863"
      >  </a
      ><a name="15865" class="Symbol"
      >:</a
      ><a name="15866"
      > </a
      ><a name="15867" class="Symbol"
      >&#8704;</a
      ><a name="15868"
      > </a
      ><a name="15869" class="Symbol"
      >{</a
      ><a name="15870" href="Stlc.html#15870" class="Bound"
      >s</a
      ><a name="15871"
      > </a
      ><a name="15872" href="Stlc.html#15872" class="Bound"
      >t</a
      ><a name="15873" class="Symbol"
      >}</a
      ><a name="15874"
      >
          </a
      ><a name="15885" class="Symbol"
      >&#8594;</a
      ><a name="15886"
      > </a
      ><a name="15887" href="Stlc.html#6154" class="InductiveConstructor Operator"
      >if</a
      ><a name="15889"
      > </a
      ><a name="15890" href="Stlc.html#6124" class="InductiveConstructor"
      >true</a
      ><a name="15894"
      > </a
      ><a name="15895" href="Stlc.html#6154" class="InductiveConstructor Operator"
      >then</a
      ><a name="15899"
      > </a
      ><a name="15900" href="Stlc.html#15870" class="Bound"
      >s</a
      ><a name="15901"
      > </a
      ><a name="15902" href="Stlc.html#6154" class="InductiveConstructor Operator"
      >else</a
      ><a name="15906"
      > </a
      ><a name="15907" href="Stlc.html#15872" class="Bound"
      >t</a
      ><a name="15908"
      > </a
      ><a name="15909" href="Stlc.html#15457" class="Datatype Operator"
      >==&gt;</a
      ><a name="15912"
      > </a
      ><a name="15913" href="Stlc.html#15870" class="Bound"
      >s</a
      ><a name="15914"
      >
  </a
      ><a name="15917" href="Stlc.html#15917" class="InductiveConstructor"
      >iffalse</a
      ><a name="15924"
      > </a
      ><a name="15925" class="Symbol"
      >:</a
      ><a name="15926"
      > </a
      ><a name="15927" class="Symbol"
      >&#8704;</a
      ><a name="15928"
      > </a
      ><a name="15929" class="Symbol"
      >{</a
      ><a name="15930" href="Stlc.html#15930" class="Bound"
      >s</a
      ><a name="15931"
      > </a
      ><a name="15932" href="Stlc.html#15932" class="Bound"
      >t</a
      ><a name="15933" class="Symbol"
      >}</a
      ><a name="15934"
      >
          </a
      ><a name="15945" class="Symbol"
      >&#8594;</a
      ><a name="15946"
      > </a
      ><a name="15947" href="Stlc.html#6154" class="InductiveConstructor Operator"
      >if</a
      ><a name="15949"
      > </a
      ><a name="15950" href="Stlc.html#6139" class="InductiveConstructor"
      >false</a
      ><a name="15955"
      > </a
      ><a name="15956" href="Stlc.html#6154" class="InductiveConstructor Operator"
      >then</a
      ><a name="15960"
      > </a
      ><a name="15961" href="Stlc.html#15930" class="Bound"
      >s</a
      ><a name="15962"
      > </a
      ><a name="15963" href="Stlc.html#6154" class="InductiveConstructor Operator"
      >else</a
      ><a name="15967"
      > </a
      ><a name="15968" href="Stlc.html#15932" class="Bound"
      >t</a
      ><a name="15969"
      > </a
      ><a name="15970" href="Stlc.html#15457" class="Datatype Operator"
      >==&gt;</a
      ><a name="15973"
      > </a
      ><a name="15974" href="Stlc.html#15932" class="Bound"
      >t</a
      ><a name="15975"
      >

</a
      ><a name="15977" class="Keyword"
      >infix</a
      ><a name="15982"
      > </a
      ><a name="15983" class="Number"
      >1</a
      >
{% endraw %}</pre>

<pre class="Agda">{% raw %}
<a name="16016" class="Keyword"
      >data</a
      ><a name="16020"
      > </a
      ><a name="16021" href="Stlc.html#16021" class="Datatype"
      >Multi</a
      ><a name="16026"
      > </a
      ><a name="16027" class="Symbol"
      >(</a
      ><a name="16028" href="Stlc.html#16028" class="Bound"
      >R</a
      ><a name="16029"
      > </a
      ><a name="16030" class="Symbol"
      >:</a
      ><a name="16031"
      > </a
      ><a name="16032" href="Stlc.html#6022" class="Datatype"
      >Term</a
      ><a name="16036"
      > </a
      ><a name="16037" class="Symbol"
      >&#8594;</a
      ><a name="16038"
      > </a
      ><a name="16039" href="Stlc.html#6022" class="Datatype"
      >Term</a
      ><a name="16043"
      > </a
      ><a name="16044" class="Symbol"
      >&#8594;</a
      ><a name="16045"
      > </a
      ><a name="16046" class="PrimitiveType"
      >Set</a
      ><a name="16049" class="Symbol"
      >)</a
      ><a name="16050"
      > </a
      ><a name="16051" class="Symbol"
      >:</a
      ><a name="16052"
      > </a
      ><a name="16053" href="Stlc.html#6022" class="Datatype"
      >Term</a
      ><a name="16057"
      > </a
      ><a name="16058" class="Symbol"
      >&#8594;</a
      ><a name="16059"
      > </a
      ><a name="16060" href="Stlc.html#6022" class="Datatype"
      >Term</a
      ><a name="16064"
      > </a
      ><a name="16065" class="Symbol"
      >&#8594;</a
      ><a name="16066"
      > </a
      ><a name="16067" class="PrimitiveType"
      >Set</a
      ><a name="16070"
      > </a
      ><a name="16071" class="Keyword"
      >where</a
      ><a name="16076"
      >
  </a
      ><a name="16079" href="Stlc.html#16079" class="InductiveConstructor"
      >refl</a
      ><a name="16083"
      > </a
      ><a name="16084" class="Symbol"
      >:</a
      ><a name="16085"
      > </a
      ><a name="16086" class="Symbol"
      >&#8704;</a
      ><a name="16087"
      > </a
      ><a name="16088" class="Symbol"
      >{</a
      ><a name="16089" href="Stlc.html#16089" class="Bound"
      >x</a
      ><a name="16090" class="Symbol"
      >}</a
      ><a name="16091"
      > </a
      ><a name="16092" class="Symbol"
      >-&gt;</a
      ><a name="16094"
      > </a
      ><a name="16095" href="Stlc.html#16021" class="Datatype"
      >Multi</a
      ><a name="16100"
      > </a
      ><a name="16101" href="Stlc.html#16028" class="Bound"
      >R</a
      ><a name="16102"
      > </a
      ><a name="16103" href="Stlc.html#16089" class="Bound"
      >x</a
      ><a name="16104"
      > </a
      ><a name="16105" href="Stlc.html#16089" class="Bound"
      >x</a
      ><a name="16106"
      >
  </a
      ><a name="16109" href="Stlc.html#16109" class="InductiveConstructor"
      >step</a
      ><a name="16113"
      > </a
      ><a name="16114" class="Symbol"
      >:</a
      ><a name="16115"
      > </a
      ><a name="16116" class="Symbol"
      >&#8704;</a
      ><a name="16117"
      > </a
      ><a name="16118" class="Symbol"
      >{</a
      ><a name="16119" href="Stlc.html#16119" class="Bound"
      >x</a
      ><a name="16120"
      > </a
      ><a name="16121" href="Stlc.html#16121" class="Bound"
      >y</a
      ><a name="16122"
      > </a
      ><a name="16123" href="Stlc.html#16123" class="Bound"
      >z</a
      ><a name="16124" class="Symbol"
      >}</a
      ><a name="16125"
      > </a
      ><a name="16126" class="Symbol"
      >-&gt;</a
      ><a name="16128"
      > </a
      ><a name="16129" href="Stlc.html#16028" class="Bound"
      >R</a
      ><a name="16130"
      > </a
      ><a name="16131" href="Stlc.html#16119" class="Bound"
      >x</a
      ><a name="16132"
      > </a
      ><a name="16133" href="Stlc.html#16121" class="Bound"
      >y</a
      ><a name="16134"
      > </a
      ><a name="16135" class="Symbol"
      >-&gt;</a
      ><a name="16137"
      > </a
      ><a name="16138" href="Stlc.html#16021" class="Datatype"
      >Multi</a
      ><a name="16143"
      > </a
      ><a name="16144" href="Stlc.html#16028" class="Bound"
      >R</a
      ><a name="16145"
      > </a
      ><a name="16146" href="Stlc.html#16121" class="Bound"
      >y</a
      ><a name="16147"
      > </a
      ><a name="16148" href="Stlc.html#16123" class="Bound"
      >z</a
      ><a name="16149"
      > </a
      ><a name="16150" class="Symbol"
      >-&gt;</a
      ><a name="16152"
      > </a
      ><a name="16153" href="Stlc.html#16021" class="Datatype"
      >Multi</a
      ><a name="16158"
      > </a
      ><a name="16159" href="Stlc.html#16028" class="Bound"
      >R</a
      ><a name="16160"
      > </a
      ><a name="16161" href="Stlc.html#16119" class="Bound"
      >x</a
      ><a name="16162"
      > </a
      ><a name="16163" href="Stlc.html#16123" class="Bound"
      >z</a
      >
{% endraw %}</pre>

<pre class="Agda">{% raw %}
<a name="16190" href="Stlc.html#16190" class="Function Operator"
      >_==&gt;*_</a
      ><a name="16196"
      > </a
      ><a name="16197" class="Symbol"
      >:</a
      ><a name="16198"
      > </a
      ><a name="16199" href="Stlc.html#6022" class="Datatype"
      >Term</a
      ><a name="16203"
      > </a
      ><a name="16204" class="Symbol"
      >&#8594;</a
      ><a name="16205"
      > </a
      ><a name="16206" href="Stlc.html#6022" class="Datatype"
      >Term</a
      ><a name="16210"
      > </a
      ><a name="16211" class="Symbol"
      >&#8594;</a
      ><a name="16212"
      > </a
      ><a name="16213" class="PrimitiveType"
      >Set</a
      ><a name="16216"
      >
</a
      ><a name="16217" href="Stlc.html#16190" class="Function Operator"
      >_==&gt;*_</a
      ><a name="16223"
      > </a
      ><a name="16224" class="Symbol"
      >=</a
      ><a name="16225"
      > </a
      ><a name="16226" href="Stlc.html#16021" class="Datatype"
      >Multi</a
      ><a name="16231"
      > </a
      ><a name="16232" href="Stlc.html#15457" class="Datatype Operator"
      >_==&gt;_</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="16284" class="Symbol"
      >{-#</a
      ><a name="16287"
      > </a
      ><a name="16288" class="Keyword"
      >DISPLAY</a
      ><a name="16295"
      > </a
      ><a name="16296" href="Stlc.html#16021" class="Datatype"
      >Multi</a
      ><a name="16301"
      > </a
      ><a name="16302" href="Stlc.html#16302" class="Bound Operator"
      >_==&gt;_</a
      ><a name="16307"
      > = </a
      ><a name="16310" href="Stlc.html#16190" class="Function Operator"
      >_==&gt;*_</a
      ><a name="16316"
      > </a
      ><a name="16317" class="Symbol"
      >#-}</a
      >
{% endraw %}</pre>
</div>

### Examples

Example:

$$((\lambda x:bool\rightarrow bool. x) (\lambda x:bool. x)) \Longrightarrow^* (\lambda x:bool. x)$$.

<pre class="Agda">{% raw %}
<a name="16479" href="Stlc.html#16479" class="Function"
      >step-example1</a
      ><a name="16492"
      > </a
      ><a name="16493" class="Symbol"
      >:</a
      ><a name="16494"
      > </a
      ><a name="16495" class="Symbol"
      >(</a
      ><a name="16496" href="Stlc.html#6061" class="InductiveConstructor"
      >app</a
      ><a name="16499"
      > </a
      ><a name="16500" href="Stlc.html#6958" class="Function"
      >idBB</a
      ><a name="16504"
      > </a
      ><a name="16505" href="Stlc.html#6852" class="Function"
      >idB</a
      ><a name="16508" class="Symbol"
      >)</a
      ><a name="16509"
      > </a
      ><a name="16510" href="Stlc.html#16190" class="Function Operator"
      >==&gt;*</a
      ><a name="16514"
      > </a
      ><a name="16515" href="Stlc.html#6852" class="Function"
      >idB</a
      ><a name="16518"
      >
</a
      ><a name="16519" href="Stlc.html#16479" class="Function"
      >step-example1</a
      ><a name="16532"
      > </a
      ><a name="16533" class="Symbol"
      >=</a
      ><a name="16534"
      > </a
      ><a name="16535" href="Stlc.html#16109" class="InductiveConstructor"
      >step</a
      ><a name="16539"
      > </a
      ><a name="16540" class="Symbol"
      >(</a
      ><a name="16541" href="Stlc.html#15491" class="InductiveConstructor"
      >red</a
      ><a name="16544"
      > </a
      ><a name="16545" href="Stlc.html#9374" class="InductiveConstructor"
      >abs</a
      ><a name="16548" class="Symbol"
      >)</a
      ><a name="16549"
      >
              </a
      ><a name="16564" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="16565"
      > </a
      ><a name="16566" href="Stlc.html#16079" class="InductiveConstructor"
      >refl</a
      >
{% endraw %}</pre>

Example:

$$(\lambda x:bool\rightarrow bool. x) \;((\lambda x:bool\rightarrow bool. x)\;(\lambda x:bool. x))) \Longrightarrow^* (\lambda x:bool. x)$$.

<pre class="Agda">{% raw %}
<a name="16748" href="Stlc.html#16748" class="Function"
      >step-example2</a
      ><a name="16761"
      > </a
      ><a name="16762" class="Symbol"
      >:</a
      ><a name="16763"
      > </a
      ><a name="16764" class="Symbol"
      >(</a
      ><a name="16765" href="Stlc.html#6061" class="InductiveConstructor"
      >app</a
      ><a name="16768"
      > </a
      ><a name="16769" href="Stlc.html#6958" class="Function"
      >idBB</a
      ><a name="16773"
      > </a
      ><a name="16774" class="Symbol"
      >(</a
      ><a name="16775" href="Stlc.html#6061" class="InductiveConstructor"
      >app</a
      ><a name="16778"
      > </a
      ><a name="16779" href="Stlc.html#6958" class="Function"
      >idBB</a
      ><a name="16783"
      > </a
      ><a name="16784" href="Stlc.html#6852" class="Function"
      >idB</a
      ><a name="16787" class="Symbol"
      >))</a
      ><a name="16789"
      > </a
      ><a name="16790" href="Stlc.html#16190" class="Function Operator"
      >==&gt;*</a
      ><a name="16794"
      > </a
      ><a name="16795" href="Stlc.html#6852" class="Function"
      >idB</a
      ><a name="16798"
      >
</a
      ><a name="16799" href="Stlc.html#16748" class="Function"
      >step-example2</a
      ><a name="16812"
      > </a
      ><a name="16813" class="Symbol"
      >=</a
      ><a name="16814"
      > </a
      ><a name="16815" href="Stlc.html#16109" class="InductiveConstructor"
      >step</a
      ><a name="16819"
      > </a
      ><a name="16820" class="Symbol"
      >(</a
      ><a name="16821" href="Stlc.html#15659" class="InductiveConstructor"
      >app2</a
      ><a name="16825"
      > </a
      ><a name="16826" href="Stlc.html#9374" class="InductiveConstructor"
      >abs</a
      ><a name="16829"
      > </a
      ><a name="16830" class="Symbol"
      >(</a
      ><a name="16831" href="Stlc.html#15491" class="InductiveConstructor"
      >red</a
      ><a name="16834"
      > </a
      ><a name="16835" href="Stlc.html#9374" class="InductiveConstructor"
      >abs</a
      ><a name="16838" class="Symbol"
      >))</a
      ><a name="16840"
      >
              </a
      ><a name="16855" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="16856"
      > </a
      ><a name="16857" href="Stlc.html#16109" class="InductiveConstructor"
      >step</a
      ><a name="16861"
      > </a
      ><a name="16862" class="Symbol"
      >(</a
      ><a name="16863" href="Stlc.html#15491" class="InductiveConstructor"
      >red</a
      ><a name="16866"
      > </a
      ><a name="16867" href="Stlc.html#9374" class="InductiveConstructor"
      >abs</a
      ><a name="16870" class="Symbol"
      >)</a
      ><a name="16871"
      >
              </a
      ><a name="16886" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="16887"
      > </a
      ><a name="16888" href="Stlc.html#16079" class="InductiveConstructor"
      >refl</a
      >
{% endraw %}</pre>

Example:

$$((\lambda x:bool\rightarrow bool. x)\;(\lambda x:bool. \text{if }x\text{ then }false\text{ else }true))\;true\Longrightarrow^* false$$.

<pre class="Agda">{% raw %}
<a name="17067" href="Stlc.html#17067" class="Function"
      >step-example3</a
      ><a name="17080"
      > </a
      ><a name="17081" class="Symbol"
      >:</a
      ><a name="17082"
      > </a
      ><a name="17083" class="Symbol"
      >(</a
      ><a name="17084" href="Stlc.html#6061" class="InductiveConstructor"
      >app</a
      ><a name="17087"
      > </a
      ><a name="17088" class="Symbol"
      >(</a
      ><a name="17089" href="Stlc.html#6061" class="InductiveConstructor"
      >app</a
      ><a name="17092"
      > </a
      ><a name="17093" href="Stlc.html#6958" class="Function"
      >idBB</a
      ><a name="17097"
      > </a
      ><a name="17098" href="Stlc.html#7391" class="Function"
      >notB</a
      ><a name="17102" class="Symbol"
      >)</a
      ><a name="17103"
      > </a
      ><a name="17104" href="Stlc.html#6124" class="InductiveConstructor"
      >true</a
      ><a name="17108" class="Symbol"
      >)</a
      ><a name="17109"
      > </a
      ><a name="17110" href="Stlc.html#16190" class="Function Operator"
      >==&gt;*</a
      ><a name="17114"
      > </a
      ><a name="17115" href="Stlc.html#6139" class="InductiveConstructor"
      >false</a
      ><a name="17120"
      >
</a
      ><a name="17121" href="Stlc.html#17067" class="Function"
      >step-example3</a
      ><a name="17134"
      > </a
      ><a name="17135" class="Symbol"
      >=</a
      ><a name="17136"
      > </a
      ><a name="17137" href="Stlc.html#16109" class="InductiveConstructor"
      >step</a
      ><a name="17141"
      > </a
      ><a name="17142" class="Symbol"
      >(</a
      ><a name="17143" href="Stlc.html#15582" class="InductiveConstructor"
      >app1</a
      ><a name="17147"
      > </a
      ><a name="17148" class="Symbol"
      >(</a
      ><a name="17149" href="Stlc.html#15491" class="InductiveConstructor"
      >red</a
      ><a name="17152"
      > </a
      ><a name="17153" href="Stlc.html#9374" class="InductiveConstructor"
      >abs</a
      ><a name="17156" class="Symbol"
      >))</a
      ><a name="17158"
      >
              </a
      ><a name="17173" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="17174"
      > </a
      ><a name="17175" href="Stlc.html#16109" class="InductiveConstructor"
      >step</a
      ><a name="17179"
      > </a
      ><a name="17180" class="Symbol"
      >(</a
      ><a name="17181" href="Stlc.html#15491" class="InductiveConstructor"
      >red</a
      ><a name="17184"
      > </a
      ><a name="17185" href="Stlc.html#9422" class="InductiveConstructor"
      >true</a
      ><a name="17189" class="Symbol"
      >)</a
      ><a name="17190"
      >
              </a
      ><a name="17205" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="17206"
      > </a
      ><a name="17207" href="Stlc.html#16109" class="InductiveConstructor"
      >step</a
      ><a name="17211"
      > </a
      ><a name="17212" href="Stlc.html#15857" class="InductiveConstructor"
      >iftrue</a
      ><a name="17218"
      >
              </a
      ><a name="17233" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="17234"
      > </a
      ><a name="17235" href="Stlc.html#16079" class="InductiveConstructor"
      >refl</a
      >
{% endraw %}</pre>

Example:

$$((\lambda x:bool\rightarrow bool. x)\;((\lambda x:bool. \text{if }x\text{ then }false\text{ else }true)\;true))\Longrightarrow^* false$$.

<pre class="Agda">{% raw %}
<a name="17416" href="Stlc.html#17416" class="Function"
      >step-example4</a
      ><a name="17429"
      > </a
      ><a name="17430" class="Symbol"
      >:</a
      ><a name="17431"
      > </a
      ><a name="17432" class="Symbol"
      >(</a
      ><a name="17433" href="Stlc.html#6061" class="InductiveConstructor"
      >app</a
      ><a name="17436"
      > </a
      ><a name="17437" href="Stlc.html#6958" class="Function"
      >idBB</a
      ><a name="17441"
      > </a
      ><a name="17442" class="Symbol"
      >(</a
      ><a name="17443" href="Stlc.html#6061" class="InductiveConstructor"
      >app</a
      ><a name="17446"
      > </a
      ><a name="17447" href="Stlc.html#7391" class="Function"
      >notB</a
      ><a name="17451"
      > </a
      ><a name="17452" href="Stlc.html#6124" class="InductiveConstructor"
      >true</a
      ><a name="17456" class="Symbol"
      >))</a
      ><a name="17458"
      > </a
      ><a name="17459" href="Stlc.html#16190" class="Function Operator"
      >==&gt;*</a
      ><a name="17463"
      > </a
      ><a name="17464" href="Stlc.html#6139" class="InductiveConstructor"
      >false</a
      ><a name="17469"
      >
</a
      ><a name="17470" href="Stlc.html#17416" class="Function"
      >step-example4</a
      ><a name="17483"
      > </a
      ><a name="17484" class="Symbol"
      >=</a
      ><a name="17485"
      > </a
      ><a name="17486" href="Stlc.html#16109" class="InductiveConstructor"
      >step</a
      ><a name="17490"
      > </a
      ><a name="17491" class="Symbol"
      >(</a
      ><a name="17492" href="Stlc.html#15659" class="InductiveConstructor"
      >app2</a
      ><a name="17496"
      > </a
      ><a name="17497" href="Stlc.html#9374" class="InductiveConstructor"
      >abs</a
      ><a name="17500"
      > </a
      ><a name="17501" class="Symbol"
      >(</a
      ><a name="17502" href="Stlc.html#15491" class="InductiveConstructor"
      >red</a
      ><a name="17505"
      > </a
      ><a name="17506" href="Stlc.html#9422" class="InductiveConstructor"
      >true</a
      ><a name="17510" class="Symbol"
      >))</a
      ><a name="17512"
      >
              </a
      ><a name="17527" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="17528"
      > </a
      ><a name="17529" href="Stlc.html#16109" class="InductiveConstructor"
      >step</a
      ><a name="17533"
      > </a
      ><a name="17534" class="Symbol"
      >(</a
      ><a name="17535" href="Stlc.html#15659" class="InductiveConstructor"
      >app2</a
      ><a name="17539"
      > </a
      ><a name="17540" href="Stlc.html#9374" class="InductiveConstructor"
      >abs</a
      ><a name="17543"
      > </a
      ><a name="17544" href="Stlc.html#15857" class="InductiveConstructor"
      >iftrue</a
      ><a name="17550" class="Symbol"
      >)</a
      ><a name="17551"
      >
              </a
      ><a name="17566" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="17567"
      > </a
      ><a name="17568" href="Stlc.html#16109" class="InductiveConstructor"
      >step</a
      ><a name="17572"
      > </a
      ><a name="17573" class="Symbol"
      >(</a
      ><a name="17574" href="Stlc.html#15491" class="InductiveConstructor"
      >red</a
      ><a name="17577"
      > </a
      ><a name="17578" href="Stlc.html#9443" class="InductiveConstructor"
      >false</a
      ><a name="17583" class="Symbol"
      >)</a
      ><a name="17584"
      >
              </a
      ><a name="17599" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="17600"
      > </a
      ><a name="17601" href="Stlc.html#16079" class="InductiveConstructor"
      >refl</a
      >
{% endraw %}</pre>

#### Exercise: 2 stars (step-example5)

<pre class="Agda">{% raw %}
<a name="17671" href="Stlc.html#17671" class="Function"
      >step-example5</a
      ><a name="17684"
      > </a
      ><a name="17685" class="Symbol"
      >:</a
      ><a name="17686"
      > </a
      ><a name="17687" class="Symbol"
      >(</a
      ><a name="17688" href="Stlc.html#6061" class="InductiveConstructor"
      >app</a
      ><a name="17691"
      > </a
      ><a name="17692" class="Symbol"
      >(</a
      ><a name="17693" href="Stlc.html#6061" class="InductiveConstructor"
      >app</a
      ><a name="17696"
      > </a
      ><a name="17697" href="Stlc.html#7112" class="Function"
      >idBBBB</a
      ><a name="17703"
      > </a
      ><a name="17704" href="Stlc.html#6958" class="Function"
      >idBB</a
      ><a name="17708" class="Symbol"
      >)</a
      ><a name="17709"
      > </a
      ><a name="17710" href="Stlc.html#6852" class="Function"
      >idB</a
      ><a name="17713" class="Symbol"
      >)</a
      ><a name="17714"
      > </a
      ><a name="17715" href="Stlc.html#16190" class="Function Operator"
      >==&gt;*</a
      ><a name="17719"
      > </a
      ><a name="17720" href="Stlc.html#6852" class="Function"
      >idB</a
      ><a name="17723"
      >
</a
      ><a name="17724" href="Stlc.html#17671" class="Function"
      >step-example5</a
      ><a name="17737"
      > </a
      ><a name="17738" class="Symbol"
      >=</a
      ><a name="17739"
      > </a
      ><a name="17740" class="Symbol"
      >{!!}</a
      ><a name="17744"
      > </a
      ><a name="17745" class="Comment"
      >-- FILL IN HERE</a
      >
{% endraw %}</pre>


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

<pre class="Agda">{% raw %}
<a name="18478" href="Stlc.html#18478" class="Function"
      >Ctxt</a
      ><a name="18482"
      > </a
      ><a name="18483" class="Symbol"
      >:</a
      ><a name="18484"
      > </a
      ><a name="18485" class="PrimitiveType"
      >Set</a
      ><a name="18488"
      >
</a
      ><a name="18489" href="Stlc.html#18478" class="Function"
      >Ctxt</a
      ><a name="18493"
      > </a
      ><a name="18494" class="Symbol"
      >=</a
      ><a name="18495"
      > </a
      ><a name="18496" href="Stlc.html#5686" class="Datatype"
      >Id</a
      ><a name="18498"
      > </a
      ><a name="18499" class="Symbol"
      >&#8594;</a
      ><a name="18500"
      > </a
      ><a name="18501" href="https://agda.github.io/agda-stdlib/Data.Maybe.Base.html#335" class="Datatype"
      >Maybe</a
      ><a name="18506"
      > </a
      ><a name="18507" href="Stlc.html#5519" class="Datatype"
      >Type</a
      ><a name="18511"
      >

</a
      ><a name="18513" href="Stlc.html#18513" class="Function"
      >&#8709;</a
      ><a name="18514"
      > </a
      ><a name="18515" class="Symbol"
      >:</a
      ><a name="18516"
      > </a
      ><a name="18517" href="Stlc.html#18478" class="Function"
      >Ctxt</a
      ><a name="18521"
      >
</a
      ><a name="18522" href="Stlc.html#18513" class="Function"
      >&#8709;</a
      ><a name="18523"
      > </a
      ><a name="18524" class="Symbol"
      >=</a
      ><a name="18525"
      > </a
      ><a name="18526" class="Symbol"
      >&#955;</a
      ><a name="18527"
      > </a
      ><a name="18528" href="Stlc.html#18528" class="Bound"
      >_</a
      ><a name="18529"
      > </a
      ><a name="18530" class="Symbol"
      >&#8594;</a
      ><a name="18531"
      > </a
      ><a name="18532" href="https://agda.github.io/agda-stdlib/Data.Maybe.Base.html#403" class="InductiveConstructor"
      >nothing</a
      ><a name="18539"
      >

</a
      ><a name="18541" href="Stlc.html#18541" class="Function Operator"
      >_,_&#8758;_</a
      ><a name="18546"
      > </a
      ><a name="18547" class="Symbol"
      >:</a
      ><a name="18548"
      > </a
      ><a name="18549" href="Stlc.html#18478" class="Function"
      >Ctxt</a
      ><a name="18553"
      > </a
      ><a name="18554" class="Symbol"
      >-&gt;</a
      ><a name="18556"
      > </a
      ><a name="18557" href="Stlc.html#5686" class="Datatype"
      >Id</a
      ><a name="18559"
      > </a
      ><a name="18560" class="Symbol"
      >-&gt;</a
      ><a name="18562"
      > </a
      ><a name="18563" href="Stlc.html#5519" class="Datatype"
      >Type</a
      ><a name="18567"
      > </a
      ><a name="18568" class="Symbol"
      >-&gt;</a
      ><a name="18570"
      > </a
      ><a name="18571" href="Stlc.html#18478" class="Function"
      >Ctxt</a
      ><a name="18575"
      >
</a
      ><a name="18576" class="Symbol"
      >(</a
      ><a name="18577" href="Stlc.html#18577" class="Bound"
      >&#915;</a
      ><a name="18578"
      > </a
      ><a name="18579" href="Stlc.html#18541" class="Function Operator"
      >,</a
      ><a name="18580"
      > </a
      ><a name="18581" href="Stlc.html#18581" class="Bound"
      >x</a
      ><a name="18582"
      > </a
      ><a name="18583" href="Stlc.html#18541" class="Function Operator"
      >&#8758;</a
      ><a name="18584"
      > </a
      ><a name="18585" href="Stlc.html#18585" class="Bound"
      >A</a
      ><a name="18586" class="Symbol"
      >)</a
      ><a name="18587"
      > </a
      ><a name="18588" href="Stlc.html#18588" class="Bound"
      >y</a
      ><a name="18589"
      > </a
      ><a name="18590" class="Keyword"
      >with</a
      ><a name="18594"
      > </a
      ><a name="18595" href="Stlc.html#18581" class="Bound"
      >x</a
      ><a name="18596"
      > </a
      ><a name="18597" href="Stlc.html#5761" class="Function Operator"
      >&#8799;</a
      ><a name="18598"
      > </a
      ><a name="18599" href="Stlc.html#18588" class="Bound"
      >y</a
      ><a name="18600"
      >
</a
      ><a name="18601" class="Symbol"
      >...</a
      ><a name="18604"
      > </a
      ><a name="18605" class="Symbol"
      >|</a
      ><a name="18606"
      > </a
      ><a name="18607" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="18610"
      > </a
      ><a name="18611" href="Stlc.html#18611" class="Bound"
      >x=y</a
      ><a name="18614"
      > </a
      ><a name="18615" class="Symbol"
      >=</a
      ><a name="18616"
      > </a
      ><a name="18617" href="https://agda.github.io/agda-stdlib/Data.Maybe.Base.html#373" class="InductiveConstructor"
      >just</a
      ><a name="18621"
      > </a
      ><a name="18622" href="Stlc.html#18585" class="Bound"
      >A</a
      ><a name="18623"
      >
</a
      ><a name="18624" class="Symbol"
      >...</a
      ><a name="18627"
      > </a
      ><a name="18628" class="Symbol"
      >|</a
      ><a name="18629"
      > </a
      ><a name="18630" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="18632"
      >  </a
      ><a name="18634" href="Stlc.html#18634" class="Bound"
      >x&#8800;y</a
      ><a name="18637"
      > </a
      ><a name="18638" class="Symbol"
      >=</a
      ><a name="18639"
      > </a
      ><a name="18640" href="Stlc.html#18577" class="Bound"
      >&#915;</a
      ><a name="18641"
      > </a
      ><a name="18642" href="Stlc.html#18588" class="Bound"
      >y</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="18690" class="Keyword"
      >infixl</a
      ><a name="18696"
      > </a
      ><a name="18697" class="Number"
      >3</a
      >
{% endraw %}</pre>
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

<pre class="Agda">{% raw %}
<a name="19479" class="Keyword"
      >data</a
      ><a name="19483"
      > </a
      ><a name="19484" href="Stlc.html#19484" class="Datatype Operator"
      >_&#8866;_&#8758;_</a
      ><a name="19489"
      > </a
      ><a name="19490" class="Symbol"
      >:</a
      ><a name="19491"
      > </a
      ><a name="19492" href="Stlc.html#18478" class="Function"
      >Ctxt</a
      ><a name="19496"
      > </a
      ><a name="19497" class="Symbol"
      >-&gt;</a
      ><a name="19499"
      > </a
      ><a name="19500" href="Stlc.html#6022" class="Datatype"
      >Term</a
      ><a name="19504"
      > </a
      ><a name="19505" class="Symbol"
      >-&gt;</a
      ><a name="19507"
      > </a
      ><a name="19508" href="Stlc.html#5519" class="Datatype"
      >Type</a
      ><a name="19512"
      > </a
      ><a name="19513" class="Symbol"
      >-&gt;</a
      ><a name="19515"
      > </a
      ><a name="19516" class="PrimitiveType"
      >Set</a
      ><a name="19519"
      > </a
      ><a name="19520" class="Keyword"
      >where</a
      ><a name="19525"
      >
  </a
      ><a name="19528" href="Stlc.html#19528" class="InductiveConstructor"
      >var</a
      ><a name="19531"
      >           </a
      ><a name="19542" class="Symbol"
      >:</a
      ><a name="19543"
      > </a
      ><a name="19544" class="Symbol"
      >&#8704;</a
      ><a name="19545"
      > </a
      ><a name="19546" class="Symbol"
      >{</a
      ><a name="19547" href="Stlc.html#19547" class="Bound"
      >&#915;</a
      ><a name="19548" class="Symbol"
      >}</a
      ><a name="19549"
      > </a
      ><a name="19550" href="Stlc.html#19550" class="Bound"
      >x</a
      ><a name="19551"
      > </a
      ><a name="19552" class="Symbol"
      >{</a
      ><a name="19553" href="Stlc.html#19553" class="Bound"
      >A</a
      ><a name="19554" class="Symbol"
      >}</a
      ><a name="19555"
      >
                </a
      ><a name="19572" class="Symbol"
      >&#8594;</a
      ><a name="19573"
      > </a
      ><a name="19574" href="Stlc.html#19547" class="Bound"
      >&#915;</a
      ><a name="19575"
      > </a
      ><a name="19576" href="Stlc.html#19550" class="Bound"
      >x</a
      ><a name="19577"
      > </a
      ><a name="19578" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="19579"
      > </a
      ><a name="19580" href="https://agda.github.io/agda-stdlib/Data.Maybe.Base.html#373" class="InductiveConstructor"
      >just</a
      ><a name="19584"
      > </a
      ><a name="19585" href="Stlc.html#19553" class="Bound"
      >A</a
      ><a name="19586"
      >
                </a
      ><a name="19603" class="Symbol"
      >&#8594;</a
      ><a name="19604"
      > </a
      ><a name="19605" href="Stlc.html#19547" class="Bound"
      >&#915;</a
      ><a name="19606"
      > </a
      ><a name="19607" href="Stlc.html#19484" class="Datatype Operator"
      >&#8866;</a
      ><a name="19608"
      > </a
      ><a name="19609" href="Stlc.html#6041" class="InductiveConstructor"
      >var</a
      ><a name="19612"
      > </a
      ><a name="19613" href="Stlc.html#19550" class="Bound"
      >x</a
      ><a name="19614"
      > </a
      ><a name="19615" href="Stlc.html#19484" class="Datatype Operator"
      >&#8758;</a
      ><a name="19616"
      > </a
      ><a name="19617" href="Stlc.html#19553" class="Bound"
      >A</a
      ><a name="19618"
      >
  </a
      ><a name="19621" href="Stlc.html#19621" class="InductiveConstructor"
      >abs</a
      ><a name="19624"
      >           </a
      ><a name="19635" class="Symbol"
      >:</a
      ><a name="19636"
      > </a
      ><a name="19637" class="Symbol"
      >&#8704;</a
      ><a name="19638"
      > </a
      ><a name="19639" class="Symbol"
      >{</a
      ><a name="19640" href="Stlc.html#19640" class="Bound"
      >&#915;</a
      ><a name="19641" class="Symbol"
      >}</a
      ><a name="19642"
      > </a
      ><a name="19643" class="Symbol"
      >{</a
      ><a name="19644" href="Stlc.html#19644" class="Bound"
      >x</a
      ><a name="19645" class="Symbol"
      >}</a
      ><a name="19646"
      > </a
      ><a name="19647" class="Symbol"
      >{</a
      ><a name="19648" href="Stlc.html#19648" class="Bound"
      >A</a
      ><a name="19649" class="Symbol"
      >}</a
      ><a name="19650"
      > </a
      ><a name="19651" class="Symbol"
      >{</a
      ><a name="19652" href="Stlc.html#19652" class="Bound"
      >B</a
      ><a name="19653" class="Symbol"
      >}</a
      ><a name="19654"
      > </a
      ><a name="19655" class="Symbol"
      >{</a
      ><a name="19656" href="Stlc.html#19656" class="Bound"
      >s</a
      ><a name="19657" class="Symbol"
      >}</a
      ><a name="19658"
      >
                </a
      ><a name="19675" class="Symbol"
      >&#8594;</a
      ><a name="19676"
      > </a
      ><a name="19677" href="Stlc.html#19640" class="Bound"
      >&#915;</a
      ><a name="19678"
      > </a
      ><a name="19679" href="Stlc.html#18541" class="Function Operator"
      >,</a
      ><a name="19680"
      > </a
      ><a name="19681" href="Stlc.html#19644" class="Bound"
      >x</a
      ><a name="19682"
      > </a
      ><a name="19683" href="Stlc.html#18541" class="Function Operator"
      >&#8758;</a
      ><a name="19684"
      > </a
      ><a name="19685" href="Stlc.html#19648" class="Bound"
      >A</a
      ><a name="19686"
      > </a
      ><a name="19687" href="Stlc.html#19484" class="Datatype Operator"
      >&#8866;</a
      ><a name="19688"
      > </a
      ><a name="19689" href="Stlc.html#19656" class="Bound"
      >s</a
      ><a name="19690"
      > </a
      ><a name="19691" href="Stlc.html#19484" class="Datatype Operator"
      >&#8758;</a
      ><a name="19692"
      > </a
      ><a name="19693" href="Stlc.html#19652" class="Bound"
      >B</a
      ><a name="19694"
      >
                </a
      ><a name="19711" class="Symbol"
      >&#8594;</a
      ><a name="19712"
      > </a
      ><a name="19713" href="Stlc.html#19640" class="Bound"
      >&#915;</a
      ><a name="19714"
      > </a
      ><a name="19715" href="Stlc.html#19484" class="Datatype Operator"
      >&#8866;</a
      ><a name="19716"
      > </a
      ><a name="19717" href="Stlc.html#6090" class="InductiveConstructor"
      >abs</a
      ><a name="19720"
      > </a
      ><a name="19721" href="Stlc.html#19644" class="Bound"
      >x</a
      ><a name="19722"
      > </a
      ><a name="19723" href="Stlc.html#19648" class="Bound"
      >A</a
      ><a name="19724"
      > </a
      ><a name="19725" href="Stlc.html#19656" class="Bound"
      >s</a
      ><a name="19726"
      > </a
      ><a name="19727" href="Stlc.html#19484" class="Datatype Operator"
      >&#8758;</a
      ><a name="19728"
      > </a
      ><a name="19729" href="Stlc.html#19648" class="Bound"
      >A</a
      ><a name="19730"
      > </a
      ><a name="19731" href="Stlc.html#5552" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="19732"
      > </a
      ><a name="19733" href="Stlc.html#19652" class="Bound"
      >B</a
      ><a name="19734"
      >
  </a
      ><a name="19737" href="Stlc.html#19737" class="InductiveConstructor"
      >app</a
      ><a name="19740"
      >           </a
      ><a name="19751" class="Symbol"
      >:</a
      ><a name="19752"
      > </a
      ><a name="19753" class="Symbol"
      >&#8704;</a
      ><a name="19754"
      > </a
      ><a name="19755" class="Symbol"
      >{</a
      ><a name="19756" href="Stlc.html#19756" class="Bound"
      >&#915;</a
      ><a name="19757" class="Symbol"
      >}</a
      ><a name="19758"
      > </a
      ><a name="19759" class="Symbol"
      >{</a
      ><a name="19760" href="Stlc.html#19760" class="Bound"
      >A</a
      ><a name="19761" class="Symbol"
      >}</a
      ><a name="19762"
      > </a
      ><a name="19763" class="Symbol"
      >{</a
      ><a name="19764" href="Stlc.html#19764" class="Bound"
      >B</a
      ><a name="19765" class="Symbol"
      >}</a
      ><a name="19766"
      > </a
      ><a name="19767" class="Symbol"
      >{</a
      ><a name="19768" href="Stlc.html#19768" class="Bound"
      >s</a
      ><a name="19769" class="Symbol"
      >}</a
      ><a name="19770"
      > </a
      ><a name="19771" class="Symbol"
      >{</a
      ><a name="19772" href="Stlc.html#19772" class="Bound"
      >t</a
      ><a name="19773" class="Symbol"
      >}</a
      ><a name="19774"
      >
                </a
      ><a name="19791" class="Symbol"
      >&#8594;</a
      ><a name="19792"
      > </a
      ><a name="19793" href="Stlc.html#19756" class="Bound"
      >&#915;</a
      ><a name="19794"
      > </a
      ><a name="19795" href="Stlc.html#19484" class="Datatype Operator"
      >&#8866;</a
      ><a name="19796"
      > </a
      ><a name="19797" href="Stlc.html#19768" class="Bound"
      >s</a
      ><a name="19798"
      > </a
      ><a name="19799" href="Stlc.html#19484" class="Datatype Operator"
      >&#8758;</a
      ><a name="19800"
      > </a
      ><a name="19801" href="Stlc.html#19760" class="Bound"
      >A</a
      ><a name="19802"
      > </a
      ><a name="19803" href="Stlc.html#5552" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="19804"
      > </a
      ><a name="19805" href="Stlc.html#19764" class="Bound"
      >B</a
      ><a name="19806"
      >
                </a
      ><a name="19823" class="Symbol"
      >&#8594;</a
      ><a name="19824"
      > </a
      ><a name="19825" href="Stlc.html#19756" class="Bound"
      >&#915;</a
      ><a name="19826"
      > </a
      ><a name="19827" href="Stlc.html#19484" class="Datatype Operator"
      >&#8866;</a
      ><a name="19828"
      > </a
      ><a name="19829" href="Stlc.html#19772" class="Bound"
      >t</a
      ><a name="19830"
      > </a
      ><a name="19831" href="Stlc.html#19484" class="Datatype Operator"
      >&#8758;</a
      ><a name="19832"
      > </a
      ><a name="19833" href="Stlc.html#19760" class="Bound"
      >A</a
      ><a name="19834"
      >
                </a
      ><a name="19851" class="Symbol"
      >&#8594;</a
      ><a name="19852"
      > </a
      ><a name="19853" href="Stlc.html#19756" class="Bound"
      >&#915;</a
      ><a name="19854"
      > </a
      ><a name="19855" href="Stlc.html#19484" class="Datatype Operator"
      >&#8866;</a
      ><a name="19856"
      > </a
      ><a name="19857" href="Stlc.html#6061" class="InductiveConstructor"
      >app</a
      ><a name="19860"
      > </a
      ><a name="19861" href="Stlc.html#19768" class="Bound"
      >s</a
      ><a name="19862"
      > </a
      ><a name="19863" href="Stlc.html#19772" class="Bound"
      >t</a
      ><a name="19864"
      > </a
      ><a name="19865" href="Stlc.html#19484" class="Datatype Operator"
      >&#8758;</a
      ><a name="19866"
      > </a
      ><a name="19867" href="Stlc.html#19764" class="Bound"
      >B</a
      ><a name="19868"
      >
  </a
      ><a name="19871" href="Stlc.html#19871" class="InductiveConstructor"
      >true</a
      ><a name="19875"
      >          </a
      ><a name="19885" class="Symbol"
      >:</a
      ><a name="19886"
      > </a
      ><a name="19887" class="Symbol"
      >&#8704;</a
      ><a name="19888"
      > </a
      ><a name="19889" class="Symbol"
      >{</a
      ><a name="19890" href="Stlc.html#19890" class="Bound"
      >&#915;</a
      ><a name="19891" class="Symbol"
      >}</a
      ><a name="19892"
      >
                </a
      ><a name="19909" class="Symbol"
      >&#8594;</a
      ><a name="19910"
      > </a
      ><a name="19911" href="Stlc.html#19890" class="Bound"
      >&#915;</a
      ><a name="19912"
      > </a
      ><a name="19913" href="Stlc.html#19484" class="Datatype Operator"
      >&#8866;</a
      ><a name="19914"
      > </a
      ><a name="19915" href="Stlc.html#6124" class="InductiveConstructor"
      >true</a
      ><a name="19919"
      >  </a
      ><a name="19921" href="Stlc.html#19484" class="Datatype Operator"
      >&#8758;</a
      ><a name="19922"
      > </a
      ><a name="19923" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="19927"
      >
  </a
      ><a name="19930" href="Stlc.html#19930" class="InductiveConstructor"
      >false</a
      ><a name="19935"
      >         </a
      ><a name="19944" class="Symbol"
      >:</a
      ><a name="19945"
      > </a
      ><a name="19946" class="Symbol"
      >&#8704;</a
      ><a name="19947"
      > </a
      ><a name="19948" class="Symbol"
      >{</a
      ><a name="19949" href="Stlc.html#19949" class="Bound"
      >&#915;</a
      ><a name="19950" class="Symbol"
      >}</a
      ><a name="19951"
      >
                </a
      ><a name="19968" class="Symbol"
      >&#8594;</a
      ><a name="19969"
      > </a
      ><a name="19970" href="Stlc.html#19949" class="Bound"
      >&#915;</a
      ><a name="19971"
      > </a
      ><a name="19972" href="Stlc.html#19484" class="Datatype Operator"
      >&#8866;</a
      ><a name="19973"
      > </a
      ><a name="19974" href="Stlc.html#6139" class="InductiveConstructor"
      >false</a
      ><a name="19979"
      > </a
      ><a name="19980" href="Stlc.html#19484" class="Datatype Operator"
      >&#8758;</a
      ><a name="19981"
      > </a
      ><a name="19982" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="19986"
      >
  </a
      ><a name="19989" href="Stlc.html#19989" class="InductiveConstructor Operator"
      >if_then_else_</a
      ><a name="20002"
      > </a
      ><a name="20003" class="Symbol"
      >:</a
      ><a name="20004"
      > </a
      ><a name="20005" class="Symbol"
      >&#8704;</a
      ><a name="20006"
      > </a
      ><a name="20007" class="Symbol"
      >{</a
      ><a name="20008" href="Stlc.html#20008" class="Bound"
      >&#915;</a
      ><a name="20009" class="Symbol"
      >}</a
      ><a name="20010"
      > </a
      ><a name="20011" class="Symbol"
      >{</a
      ><a name="20012" href="Stlc.html#20012" class="Bound"
      >s</a
      ><a name="20013" class="Symbol"
      >}</a
      ><a name="20014"
      > </a
      ><a name="20015" class="Symbol"
      >{</a
      ><a name="20016" href="Stlc.html#20016" class="Bound"
      >t</a
      ><a name="20017" class="Symbol"
      >}</a
      ><a name="20018"
      > </a
      ><a name="20019" class="Symbol"
      >{</a
      ><a name="20020" href="Stlc.html#20020" class="Bound"
      >u</a
      ><a name="20021" class="Symbol"
      >}</a
      ><a name="20022"
      > </a
      ><a name="20023" class="Symbol"
      >{</a
      ><a name="20024" href="Stlc.html#20024" class="Bound"
      >A</a
      ><a name="20025" class="Symbol"
      >}</a
      ><a name="20026"
      >
                </a
      ><a name="20043" class="Symbol"
      >&#8594;</a
      ><a name="20044"
      > </a
      ><a name="20045" href="Stlc.html#20008" class="Bound"
      >&#915;</a
      ><a name="20046"
      > </a
      ><a name="20047" href="Stlc.html#19484" class="Datatype Operator"
      >&#8866;</a
      ><a name="20048"
      > </a
      ><a name="20049" href="Stlc.html#20012" class="Bound"
      >s</a
      ><a name="20050"
      > </a
      ><a name="20051" href="Stlc.html#19484" class="Datatype Operator"
      >&#8758;</a
      ><a name="20052"
      > </a
      ><a name="20053" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="20057"
      >
                </a
      ><a name="20074" class="Symbol"
      >&#8594;</a
      ><a name="20075"
      > </a
      ><a name="20076" href="Stlc.html#20008" class="Bound"
      >&#915;</a
      ><a name="20077"
      > </a
      ><a name="20078" href="Stlc.html#19484" class="Datatype Operator"
      >&#8866;</a
      ><a name="20079"
      > </a
      ><a name="20080" href="Stlc.html#20016" class="Bound"
      >t</a
      ><a name="20081"
      > </a
      ><a name="20082" href="Stlc.html#19484" class="Datatype Operator"
      >&#8758;</a
      ><a name="20083"
      > </a
      ><a name="20084" href="Stlc.html#20024" class="Bound"
      >A</a
      ><a name="20085"
      >
                </a
      ><a name="20102" class="Symbol"
      >&#8594;</a
      ><a name="20103"
      > </a
      ><a name="20104" href="Stlc.html#20008" class="Bound"
      >&#915;</a
      ><a name="20105"
      > </a
      ><a name="20106" href="Stlc.html#19484" class="Datatype Operator"
      >&#8866;</a
      ><a name="20107"
      > </a
      ><a name="20108" href="Stlc.html#20020" class="Bound"
      >u</a
      ><a name="20109"
      > </a
      ><a name="20110" href="Stlc.html#19484" class="Datatype Operator"
      >&#8758;</a
      ><a name="20111"
      > </a
      ><a name="20112" href="Stlc.html#20024" class="Bound"
      >A</a
      ><a name="20113"
      >
                </a
      ><a name="20130" class="Symbol"
      >&#8594;</a
      ><a name="20131"
      > </a
      ><a name="20132" href="Stlc.html#20008" class="Bound"
      >&#915;</a
      ><a name="20133"
      > </a
      ><a name="20134" href="Stlc.html#19484" class="Datatype Operator"
      >&#8866;</a
      ><a name="20135"
      > </a
      ><a name="20136" href="Stlc.html#6154" class="InductiveConstructor Operator"
      >if</a
      ><a name="20138"
      > </a
      ><a name="20139" href="Stlc.html#20012" class="Bound"
      >s</a
      ><a name="20140"
      > </a
      ><a name="20141" href="Stlc.html#6154" class="InductiveConstructor Operator"
      >then</a
      ><a name="20145"
      > </a
      ><a name="20146" href="Stlc.html#20016" class="Bound"
      >t</a
      ><a name="20147"
      > </a
      ><a name="20148" href="Stlc.html#6154" class="InductiveConstructor Operator"
      >else</a
      ><a name="20152"
      > </a
      ><a name="20153" href="Stlc.html#20020" class="Bound"
      >u</a
      ><a name="20154"
      > </a
      ><a name="20155" href="Stlc.html#19484" class="Datatype Operator"
      >&#8758;</a
      ><a name="20156"
      > </a
      ><a name="20157" href="Stlc.html#20024" class="Bound"
      >A</a
      ><a name="20158"
      >

</a
      ><a name="20160" class="Keyword"
      >infix</a
      ><a name="20165"
      > </a
      ><a name="20166" class="Number"
      >1</a
      >
{% endraw %}</pre>

### Examples

<pre class="Agda">{% raw %}
<a name="20213" href="Stlc.html#20213" class="Function"
      >typing-example1</a
      ><a name="20228"
      > </a
      ><a name="20229" class="Symbol"
      >:</a
      ><a name="20230"
      > </a
      ><a name="20231" href="Stlc.html#18513" class="Function"
      >&#8709;</a
      ><a name="20232"
      > </a
      ><a name="20233" href="Stlc.html#19484" class="Datatype Operator"
      >&#8866;</a
      ><a name="20234"
      > </a
      ><a name="20235" href="Stlc.html#6852" class="Function"
      >idB</a
      ><a name="20238"
      > </a
      ><a name="20239" href="Stlc.html#19484" class="Datatype Operator"
      >&#8758;</a
      ><a name="20240"
      > </a
      ><a name="20241" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="20245"
      > </a
      ><a name="20246" href="Stlc.html#5552" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="20247"
      > </a
      ><a name="20248" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="20252"
      >
</a
      ><a name="20253" href="Stlc.html#20213" class="Function"
      >typing-example1</a
      ><a name="20268"
      > </a
      ><a name="20269" class="Symbol"
      >=</a
      ><a name="20270"
      > </a
      ><a name="20271" href="Stlc.html#19621" class="InductiveConstructor"
      >abs</a
      ><a name="20274"
      > </a
      ><a name="20275" class="Symbol"
      >(</a
      ><a name="20276" href="Stlc.html#19528" class="InductiveConstructor"
      >var</a
      ><a name="20279"
      > </a
      ><a name="20280" href="Stlc.html#6621" class="Function"
      >x</a
      ><a name="20281"
      > </a
      ><a name="20282" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="20286" class="Symbol"
      >)</a
      >
{% endraw %}</pre>

Another example:

$$\varnothing\vdash \lambda x:A. \lambda y:A\rightarrow A. y\;(y\;x) : A\rightarrow (A\rightarrow A)\rightarrow A$$.

<pre class="Agda">{% raw %}
<a name="20449" href="Stlc.html#20449" class="Function"
      >typing-example2</a
      ><a name="20464"
      > </a
      ><a name="20465" class="Symbol"
      >:</a
      ><a name="20466"
      > </a
      ><a name="20467" href="Stlc.html#18513" class="Function"
      >&#8709;</a
      ><a name="20468"
      > </a
      ><a name="20469" href="Stlc.html#19484" class="Datatype Operator"
      >&#8866;</a
      ><a name="20470"
      >
  </a
      ><a name="20473" class="Symbol"
      >(</a
      ><a name="20474" href="Stlc.html#6090" class="InductiveConstructor"
      >abs</a
      ><a name="20477"
      > </a
      ><a name="20478" href="Stlc.html#6621" class="Function"
      >x</a
      ><a name="20479"
      > </a
      ><a name="20480" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="20484"
      >
    </a
      ><a name="20489" class="Symbol"
      >(</a
      ><a name="20490" href="Stlc.html#6090" class="InductiveConstructor"
      >abs</a
      ><a name="20493"
      > </a
      ><a name="20494" href="Stlc.html#6630" class="Function"
      >y</a
      ><a name="20495"
      > </a
      ><a name="20496" class="Symbol"
      >(</a
      ><a name="20497" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="20501"
      > </a
      ><a name="20502" href="Stlc.html#5552" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="20503"
      > </a
      ><a name="20504" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="20508" class="Symbol"
      >)</a
      ><a name="20509"
      >
      </a
      ><a name="20516" class="Symbol"
      >(</a
      ><a name="20517" href="Stlc.html#6061" class="InductiveConstructor"
      >app</a
      ><a name="20520"
      > </a
      ><a name="20521" class="Symbol"
      >(</a
      ><a name="20522" href="Stlc.html#6041" class="InductiveConstructor"
      >var</a
      ><a name="20525"
      > </a
      ><a name="20526" href="Stlc.html#6630" class="Function"
      >y</a
      ><a name="20527" class="Symbol"
      >)</a
      ><a name="20528"
      >
        </a
      ><a name="20537" class="Symbol"
      >(</a
      ><a name="20538" href="Stlc.html#6061" class="InductiveConstructor"
      >app</a
      ><a name="20541"
      > </a
      ><a name="20542" class="Symbol"
      >(</a
      ><a name="20543" href="Stlc.html#6041" class="InductiveConstructor"
      >var</a
      ><a name="20546"
      > </a
      ><a name="20547" href="Stlc.html#6630" class="Function"
      >y</a
      ><a name="20548" class="Symbol"
      >)</a
      ><a name="20549"
      > </a
      ><a name="20550" class="Symbol"
      >(</a
      ><a name="20551" href="Stlc.html#6041" class="InductiveConstructor"
      >var</a
      ><a name="20554"
      > </a
      ><a name="20555" href="Stlc.html#6621" class="Function"
      >x</a
      ><a name="20556" class="Symbol"
      >)))))</a
      ><a name="20561"
      > </a
      ><a name="20562" href="Stlc.html#19484" class="Datatype Operator"
      >&#8758;</a
      ><a name="20563"
      >
  </a
      ><a name="20566" class="Symbol"
      >(</a
      ><a name="20567" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="20571"
      > </a
      ><a name="20572" href="Stlc.html#5552" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="20573"
      > </a
      ><a name="20574" class="Symbol"
      >(</a
      ><a name="20575" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="20579"
      > </a
      ><a name="20580" href="Stlc.html#5552" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="20581"
      > </a
      ><a name="20582" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="20586" class="Symbol"
      >)</a
      ><a name="20587"
      > </a
      ><a name="20588" href="Stlc.html#5552" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="20589"
      > </a
      ><a name="20590" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="20594" class="Symbol"
      >)</a
      ><a name="20595"
      >
</a
      ><a name="20596" href="Stlc.html#20449" class="Function"
      >typing-example2</a
      ><a name="20611"
      > </a
      ><a name="20612" class="Symbol"
      >=</a
      ><a name="20613"
      >
  </a
      ><a name="20616" class="Symbol"
      >(</a
      ><a name="20617" href="Stlc.html#19621" class="InductiveConstructor"
      >abs</a
      ><a name="20620"
      >
    </a
      ><a name="20625" class="Symbol"
      >(</a
      ><a name="20626" href="Stlc.html#19621" class="InductiveConstructor"
      >abs</a
      ><a name="20629"
      >
      </a
      ><a name="20636" class="Symbol"
      >(</a
      ><a name="20637" href="Stlc.html#19737" class="InductiveConstructor"
      >app</a
      ><a name="20640"
      > </a
      ><a name="20641" class="Symbol"
      >(</a
      ><a name="20642" href="Stlc.html#19528" class="InductiveConstructor"
      >var</a
      ><a name="20645"
      > </a
      ><a name="20646" href="Stlc.html#6630" class="Function"
      >y</a
      ><a name="20647"
      > </a
      ><a name="20648" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="20652" class="Symbol"
      >)</a
      ><a name="20653"
      >
        </a
      ><a name="20662" class="Symbol"
      >(</a
      ><a name="20663" href="Stlc.html#19737" class="InductiveConstructor"
      >app</a
      ><a name="20666"
      > </a
      ><a name="20667" class="Symbol"
      >(</a
      ><a name="20668" href="Stlc.html#19528" class="InductiveConstructor"
      >var</a
      ><a name="20671"
      > </a
      ><a name="20672" href="Stlc.html#6630" class="Function"
      >y</a
      ><a name="20673"
      > </a
      ><a name="20674" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="20678" class="Symbol"
      >)</a
      ><a name="20679"
      > </a
      ><a name="20680" class="Symbol"
      >(</a
      ><a name="20681" href="Stlc.html#19528" class="InductiveConstructor"
      >var</a
      ><a name="20684"
      > </a
      ><a name="20685" href="Stlc.html#6621" class="Function"
      >x</a
      ><a name="20686"
      > </a
      ><a name="20687" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="20691" class="Symbol"
      >)</a
      ><a name="20692"
      > </a
      ><a name="20693" class="Symbol"
      >))))</a
      >
{% endraw %}</pre>

#### Exercise: 2 stars (typing_example_3)
Formally prove the following typing derivation holds:

$$\exists A, \varnothing\vdash \lambda x:bool\rightarrow B. \lambda y:bool\rightarrow bool. \lambda z:bool. y\;(x\;z) : A$$.

<pre class="Agda">{% raw %}
<a name="20946" href="Stlc.html#20946" class="Function"
      >typing-example3</a
      ><a name="20961"
      > </a
      ><a name="20962" class="Symbol"
      >:</a
      ><a name="20963"
      > </a
      ><a name="20964" href="https://agda.github.io/agda-stdlib/Data.Product.html#823" class="Function"
      >&#8707;</a
      ><a name="20965"
      > </a
      ><a name="20966" class="Symbol"
      >&#955;</a
      ><a name="20967"
      > </a
      ><a name="20968" href="Stlc.html#20968" class="Bound"
      >A</a
      ><a name="20969"
      > </a
      ><a name="20970" class="Symbol"
      >&#8594;</a
      ><a name="20971"
      > </a
      ><a name="20972" href="Stlc.html#18513" class="Function"
      >&#8709;</a
      ><a name="20973"
      > </a
      ><a name="20974" href="Stlc.html#19484" class="Datatype Operator"
      >&#8866;</a
      ><a name="20975"
      >
  </a
      ><a name="20978" class="Symbol"
      >(</a
      ><a name="20979" href="Stlc.html#6090" class="InductiveConstructor"
      >abs</a
      ><a name="20982"
      > </a
      ><a name="20983" href="Stlc.html#6621" class="Function"
      >x</a
      ><a name="20984"
      > </a
      ><a name="20985" class="Symbol"
      >(</a
      ><a name="20986" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="20990"
      > </a
      ><a name="20991" href="Stlc.html#5552" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="20992"
      > </a
      ><a name="20993" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="20997" class="Symbol"
      >)</a
      ><a name="20998"
      >
    </a
      ><a name="21003" class="Symbol"
      >(</a
      ><a name="21004" href="Stlc.html#6090" class="InductiveConstructor"
      >abs</a
      ><a name="21007"
      > </a
      ><a name="21008" href="Stlc.html#6630" class="Function"
      >y</a
      ><a name="21009"
      > </a
      ><a name="21010" class="Symbol"
      >(</a
      ><a name="21011" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="21015"
      > </a
      ><a name="21016" href="Stlc.html#5552" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="21017"
      > </a
      ><a name="21018" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="21022" class="Symbol"
      >)</a
      ><a name="21023"
      >
      </a
      ><a name="21030" class="Symbol"
      >(</a
      ><a name="21031" href="Stlc.html#6090" class="InductiveConstructor"
      >abs</a
      ><a name="21034"
      > </a
      ><a name="21035" href="Stlc.html#6639" class="Function"
      >z</a
      ><a name="21036"
      > </a
      ><a name="21037" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="21041"
      >
        </a
      ><a name="21050" class="Symbol"
      >(</a
      ><a name="21051" href="Stlc.html#6061" class="InductiveConstructor"
      >app</a
      ><a name="21054"
      > </a
      ><a name="21055" class="Symbol"
      >(</a
      ><a name="21056" href="Stlc.html#6041" class="InductiveConstructor"
      >var</a
      ><a name="21059"
      > </a
      ><a name="21060" href="Stlc.html#6630" class="Function"
      >y</a
      ><a name="21061" class="Symbol"
      >)</a
      ><a name="21062"
      > </a
      ><a name="21063" class="Symbol"
      >(</a
      ><a name="21064" href="Stlc.html#6061" class="InductiveConstructor"
      >app</a
      ><a name="21067"
      > </a
      ><a name="21068" class="Symbol"
      >(</a
      ><a name="21069" href="Stlc.html#6041" class="InductiveConstructor"
      >var</a
      ><a name="21072"
      > </a
      ><a name="21073" href="Stlc.html#6621" class="Function"
      >x</a
      ><a name="21074" class="Symbol"
      >)</a
      ><a name="21075"
      > </a
      ><a name="21076" class="Symbol"
      >(</a
      ><a name="21077" href="Stlc.html#6041" class="InductiveConstructor"
      >var</a
      ><a name="21080"
      > </a
      ><a name="21081" href="Stlc.html#6639" class="Function"
      >z</a
      ><a name="21082" class="Symbol"
      >))))))</a
      ><a name="21088"
      > </a
      ><a name="21089" href="Stlc.html#19484" class="Datatype Operator"
      >&#8758;</a
      ><a name="21090"
      > </a
      ><a name="21091" href="Stlc.html#20968" class="Bound"
      >A</a
      ><a name="21092"
      >
</a
      ><a name="21093" href="Stlc.html#20946" class="Function"
      >typing-example3</a
      ><a name="21108"
      > </a
      ><a name="21109" class="Symbol"
      >=</a
      ><a name="21110"
      > </a
      ><a name="21111" class="Symbol"
      >{!!}</a
      ><a name="21115"
      > </a
      ><a name="21116" class="Comment"
      >-- FILL IN HERE</a
      >
{% endraw %}</pre>

We can also show that terms are _not_ typable.  For example, let's
formally check that there is no typing derivation assigning a type
to the term $$\lambda x:bool. \lambda y:bool. x\;y$$---i.e.,


$$\nexists A, \varnothing\vdash \lambda x:bool. \lambda y:bool. x\;y : A$$.

<pre class="Agda">{% raw %}
<a name="21431" href="Stlc.html#21431" class="Function"
      >typing-nonexample1</a
      ><a name="21449"
      > </a
      ><a name="21450" class="Symbol"
      >:</a
      ><a name="21451"
      > </a
      ><a name="21452" href="https://agda.github.io/agda-stdlib/Data.Product.html#884" class="Function"
      >&#8708;</a
      ><a name="21453"
      > </a
      ><a name="21454" class="Symbol"
      >&#955;</a
      ><a name="21455"
      > </a
      ><a name="21456" href="Stlc.html#21456" class="Bound"
      >A</a
      ><a name="21457"
      > </a
      ><a name="21458" class="Symbol"
      >&#8594;</a
      ><a name="21459"
      > </a
      ><a name="21460" href="Stlc.html#18513" class="Function"
      >&#8709;</a
      ><a name="21461"
      > </a
      ><a name="21462" href="Stlc.html#19484" class="Datatype Operator"
      >&#8866;</a
      ><a name="21463"
      >
  </a
      ><a name="21466" class="Symbol"
      >(</a
      ><a name="21467" href="Stlc.html#6090" class="InductiveConstructor"
      >abs</a
      ><a name="21470"
      > </a
      ><a name="21471" href="Stlc.html#6621" class="Function"
      >x</a
      ><a name="21472"
      > </a
      ><a name="21473" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="21477"
      >
    </a
      ><a name="21482" class="Symbol"
      >(</a
      ><a name="21483" href="Stlc.html#6090" class="InductiveConstructor"
      >abs</a
      ><a name="21486"
      > </a
      ><a name="21487" href="Stlc.html#6630" class="Function"
      >y</a
      ><a name="21488"
      > </a
      ><a name="21489" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="21493"
      >
      </a
      ><a name="21500" class="Symbol"
      >(</a
      ><a name="21501" href="Stlc.html#6061" class="InductiveConstructor"
      >app</a
      ><a name="21504"
      > </a
      ><a name="21505" class="Symbol"
      >(</a
      ><a name="21506" href="Stlc.html#6041" class="InductiveConstructor"
      >var</a
      ><a name="21509"
      > </a
      ><a name="21510" href="Stlc.html#6621" class="Function"
      >x</a
      ><a name="21511" class="Symbol"
      >)</a
      ><a name="21512"
      > </a
      ><a name="21513" class="Symbol"
      >(</a
      ><a name="21514" href="Stlc.html#6041" class="InductiveConstructor"
      >var</a
      ><a name="21517"
      > </a
      ><a name="21518" href="Stlc.html#6630" class="Function"
      >y</a
      ><a name="21519" class="Symbol"
      >))))</a
      ><a name="21523"
      > </a
      ><a name="21524" href="Stlc.html#19484" class="Datatype Operator"
      >&#8758;</a
      ><a name="21525"
      > </a
      ><a name="21526" href="Stlc.html#21456" class="Bound"
      >A</a
      ><a name="21527"
      >
</a
      ><a name="21528" href="Stlc.html#21431" class="Function"
      >typing-nonexample1</a
      ><a name="21546"
      > </a
      ><a name="21547" class="Symbol"
      >=</a
      ><a name="21548"
      > </a
      ><a name="21549" class="Symbol"
      >{!!}</a
      ><a name="21553"
      > </a
      ><a name="21554" class="Comment"
      >-- FILL IN HERE</a
      >
{% endraw %}</pre>

#### Exercise: 3 stars, optional (typing_nonexample_3)
Another nonexample:

$$\nexists A, \exists B, \varnothing\vdash \lambda x:A. x\;x : B$$.

<pre class="Agda">{% raw %}
<a name="21740" href="Stlc.html#21740" class="Function"
      >typing-nonexample2</a
      ><a name="21758"
      > </a
      ><a name="21759" class="Symbol"
      >:</a
      ><a name="21760"
      > </a
      ><a name="21761" href="https://agda.github.io/agda-stdlib/Data.Product.html#884" class="Function"
      >&#8708;</a
      ><a name="21762"
      > </a
      ><a name="21763" class="Symbol"
      >&#955;</a
      ><a name="21764"
      > </a
      ><a name="21765" href="Stlc.html#21765" class="Bound"
      >A</a
      ><a name="21766"
      > </a
      ><a name="21767" class="Symbol"
      >&#8594;</a
      ><a name="21768"
      > </a
      ><a name="21769" href="https://agda.github.io/agda-stdlib/Data.Product.html#823" class="Function"
      >&#8707;</a
      ><a name="21770"
      > </a
      ><a name="21771" class="Symbol"
      >&#955;</a
      ><a name="21772"
      > </a
      ><a name="21773" href="Stlc.html#21773" class="Bound"
      >B</a
      ><a name="21774"
      > </a
      ><a name="21775" class="Symbol"
      >&#8594;</a
      ><a name="21776"
      > </a
      ><a name="21777" href="Stlc.html#18513" class="Function"
      >&#8709;</a
      ><a name="21778"
      > </a
      ><a name="21779" href="Stlc.html#19484" class="Datatype Operator"
      >&#8866;</a
      ><a name="21780"
      >
  </a
      ><a name="21783" class="Symbol"
      >(</a
      ><a name="21784" href="Stlc.html#6090" class="InductiveConstructor"
      >abs</a
      ><a name="21787"
      > </a
      ><a name="21788" href="Stlc.html#6621" class="Function"
      >x</a
      ><a name="21789"
      > </a
      ><a name="21790" href="Stlc.html#21773" class="Bound"
      >B</a
      ><a name="21791"
      > </a
      ><a name="21792" class="Symbol"
      >(</a
      ><a name="21793" href="Stlc.html#6061" class="InductiveConstructor"
      >app</a
      ><a name="21796"
      > </a
      ><a name="21797" class="Symbol"
      >(</a
      ><a name="21798" href="Stlc.html#6041" class="InductiveConstructor"
      >var</a
      ><a name="21801"
      > </a
      ><a name="21802" href="Stlc.html#6621" class="Function"
      >x</a
      ><a name="21803" class="Symbol"
      >)</a
      ><a name="21804"
      > </a
      ><a name="21805" class="Symbol"
      >(</a
      ><a name="21806" href="Stlc.html#6041" class="InductiveConstructor"
      >var</a
      ><a name="21809"
      > </a
      ><a name="21810" href="Stlc.html#6621" class="Function"
      >x</a
      ><a name="21811" class="Symbol"
      >)))</a
      ><a name="21814"
      > </a
      ><a name="21815" href="Stlc.html#19484" class="Datatype Operator"
      >&#8758;</a
      ><a name="21816"
      > </a
      ><a name="21817" href="Stlc.html#21765" class="Bound"
      >A</a
      ><a name="21818"
      >
</a
      ><a name="21819" href="Stlc.html#21740" class="Function"
      >typing-nonexample2</a
      ><a name="21837"
      > </a
      ><a name="21838" class="Symbol"
      >=</a
      ><a name="21839"
      > </a
      ><a name="21840" class="Symbol"
      >{!!}</a
      ><a name="21844"
      > </a
      ><a name="21845" class="Comment"
      >-- FILL IN HERE</a
      >
{% endraw %}</pre>
