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


#### Exercise: 3 stars (subst-correct)
The definition that we gave above defines substitution as a _function_.
Suppose, instead, we wanted to define substitution as an inductive _relation_.
We've begun the definition by providing the `data` header and
one of the constructors; your job is to fill in the rest of the constructors
and prove that the relation you've defined coincides with the function given
above.
<pre class="Agda">{% raw %}
<a name="13906" class="Keyword"
      >data</a
      ><a name="13910"
      > </a
      ><a name="13911" href="Stlc.html#13911" class="Datatype Operator"
      >[_:=_]_==&gt;_</a
      ><a name="13922"
      > </a
      ><a name="13923" class="Symbol"
      >(</a
      ><a name="13924" href="Stlc.html#13924" class="Bound"
      >x</a
      ><a name="13925"
      > </a
      ><a name="13926" class="Symbol"
      >:</a
      ><a name="13927"
      > </a
      ><a name="13928" href="Stlc.html#5686" class="Datatype"
      >Id</a
      ><a name="13930" class="Symbol"
      >)</a
      ><a name="13931"
      > </a
      ><a name="13932" class="Symbol"
      >(</a
      ><a name="13933" href="Stlc.html#13933" class="Bound"
      >s</a
      ><a name="13934"
      > </a
      ><a name="13935" class="Symbol"
      >:</a
      ><a name="13936"
      > </a
      ><a name="13937" href="Stlc.html#6022" class="Datatype"
      >Term</a
      ><a name="13941" class="Symbol"
      >)</a
      ><a name="13942"
      > </a
      ><a name="13943" class="Symbol"
      >:</a
      ><a name="13944"
      > </a
      ><a name="13945" href="Stlc.html#6022" class="Datatype"
      >Term</a
      ><a name="13949"
      > </a
      ><a name="13950" class="Symbol"
      >-&gt;</a
      ><a name="13952"
      > </a
      ><a name="13953" href="Stlc.html#6022" class="Datatype"
      >Term</a
      ><a name="13957"
      > </a
      ><a name="13958" class="Symbol"
      >-&gt;</a
      ><a name="13960"
      > </a
      ><a name="13961" class="PrimitiveType"
      >Set</a
      ><a name="13964"
      > </a
      ><a name="13965" class="Keyword"
      >where</a
      ><a name="13970"
      >
  </a
      ><a name="13973" href="Stlc.html#13973" class="InductiveConstructor"
      >var1</a
      ><a name="13977"
      > </a
      ><a name="13978" class="Symbol"
      >:</a
      ><a name="13979"
      > </a
      ><a name="13980" href="Stlc.html#13911" class="Datatype Operator"
      >[</a
      ><a name="13981"
      > </a
      ><a name="13982" href="Stlc.html#13924" class="Bound"
      >x</a
      ><a name="13983"
      > </a
      ><a name="13984" href="Stlc.html#13911" class="Datatype Operator"
      >:=</a
      ><a name="13986"
      > </a
      ><a name="13987" href="Stlc.html#13933" class="Bound"
      >s</a
      ><a name="13988"
      > </a
      ><a name="13989" href="Stlc.html#13911" class="Datatype Operator"
      >]</a
      ><a name="13990"
      > </a
      ><a name="13991" class="Symbol"
      >(</a
      ><a name="13992" href="Stlc.html#6041" class="InductiveConstructor"
      >var</a
      ><a name="13995"
      > </a
      ><a name="13996" href="Stlc.html#13924" class="Bound"
      >x</a
      ><a name="13997" class="Symbol"
      >)</a
      ><a name="13998"
      > </a
      ><a name="13999" href="Stlc.html#13911" class="Datatype Operator"
      >==&gt;</a
      ><a name="14002"
      > </a
      ><a name="14003" href="Stlc.html#13933" class="Bound"
      >s</a
      ><a name="14004"
      >
  </a
      ><a name="14007" class="Comment"
      >{- FILL IN HERE -}</a
      >
{% endraw %}</pre>

<pre class="Agda">{% raw %}
<a name="14051" href="Stlc.html#14051" class="Function"
      >subst-correct</a
      ><a name="14064"
      > </a
      ><a name="14065" class="Symbol"
      >:</a
      ><a name="14066"
      > </a
      ><a name="14067" class="Symbol"
      >&#8704;</a
      ><a name="14068"
      > </a
      ><a name="14069" href="Stlc.html#14069" class="Bound"
      >s</a
      ><a name="14070"
      > </a
      ><a name="14071" href="Stlc.html#14071" class="Bound"
      >x</a
      ><a name="14072"
      > </a
      ><a name="14073" href="Stlc.html#14073" class="Bound"
      >t</a
      ><a name="14074"
      > </a
      ><a name="14075" href="Stlc.html#14075" class="Bound"
      >t'</a
      ><a name="14077"
      >
              </a
      ><a name="14092" class="Symbol"
      >&#8594;</a
      ><a name="14093"
      > </a
      ><a name="14094" href="Stlc.html#12567" class="Function Operator"
      >[</a
      ><a name="14095"
      > </a
      ><a name="14096" href="Stlc.html#14071" class="Bound"
      >x</a
      ><a name="14097"
      > </a
      ><a name="14098" href="Stlc.html#12567" class="Function Operator"
      >:=</a
      ><a name="14100"
      > </a
      ><a name="14101" href="Stlc.html#14069" class="Bound"
      >s</a
      ><a name="14102"
      > </a
      ><a name="14103" href="Stlc.html#12567" class="Function Operator"
      >]</a
      ><a name="14104"
      > </a
      ><a name="14105" href="Stlc.html#14073" class="Bound"
      >t</a
      ><a name="14106"
      > </a
      ><a name="14107" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="14108"
      > </a
      ><a name="14109" href="Stlc.html#14075" class="Bound"
      >t'</a
      ><a name="14111"
      >
              </a
      ><a name="14126" class="Symbol"
      >&#8594;</a
      ><a name="14127"
      > </a
      ><a name="14128" href="Stlc.html#13911" class="Datatype Operator"
      >[</a
      ><a name="14129"
      > </a
      ><a name="14130" href="Stlc.html#14071" class="Bound"
      >x</a
      ><a name="14131"
      > </a
      ><a name="14132" href="Stlc.html#13911" class="Datatype Operator"
      >:=</a
      ><a name="14134"
      > </a
      ><a name="14135" href="Stlc.html#14069" class="Bound"
      >s</a
      ><a name="14136"
      > </a
      ><a name="14137" href="Stlc.html#13911" class="Datatype Operator"
      >]</a
      ><a name="14138"
      > </a
      ><a name="14139" href="Stlc.html#14073" class="Bound"
      >t</a
      ><a name="14140"
      > </a
      ><a name="14141" href="Stlc.html#13911" class="Datatype Operator"
      >==&gt;</a
      ><a name="14144"
      > </a
      ><a name="14145" href="Stlc.html#14075" class="Bound"
      >t'</a
      ><a name="14147"
      >
</a
      ><a name="14148" href="Stlc.html#14051" class="Function"
      >subst-correct</a
      ><a name="14161"
      > </a
      ><a name="14162" href="Stlc.html#14162" class="Bound"
      >s</a
      ><a name="14163"
      > </a
      ><a name="14164" href="Stlc.html#14164" class="Bound"
      >x</a
      ><a name="14165"
      > </a
      ><a name="14166" href="Stlc.html#14166" class="Bound"
      >t</a
      ><a name="14167"
      > </a
      ><a name="14168" href="Stlc.html#14168" class="Bound"
      >t'</a
      ><a name="14170"
      > </a
      ><a name="14171" href="Stlc.html#14171" class="Bound"
      >p</a
      ><a name="14172"
      > </a
      ><a name="14173" class="Symbol"
      >=</a
      ><a name="14174"
      > </a
      ><a name="14175" class="Symbol"
      >{!!}</a
      ><a name="14179"
      > </a
      ><a name="14180" class="Comment"
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
<a name="15459" class="Keyword"
      >data</a
      ><a name="15463"
      > </a
      ><a name="15464" href="Stlc.html#15464" class="Datatype Operator"
      >_==&gt;_</a
      ><a name="15469"
      > </a
      ><a name="15470" class="Symbol"
      >:</a
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
      ><a name="15479" href="Stlc.html#6022" class="Datatype"
      >Term</a
      ><a name="15483"
      > </a
      ><a name="15484" class="Symbol"
      >&#8594;</a
      ><a name="15485"
      > </a
      ><a name="15486" class="PrimitiveType"
      >Set</a
      ><a name="15489"
      > </a
      ><a name="15490" class="Keyword"
      >where</a
      ><a name="15495"
      >
  </a
      ><a name="15498" href="Stlc.html#15498" class="InductiveConstructor"
      >red</a
      ><a name="15501"
      >     </a
      ><a name="15506" class="Symbol"
      >:</a
      ><a name="15507"
      > </a
      ><a name="15508" class="Symbol"
      >&#8704;</a
      ><a name="15509"
      > </a
      ><a name="15510" class="Symbol"
      >{</a
      ><a name="15511" href="Stlc.html#15511" class="Bound"
      >x</a
      ><a name="15512"
      > </a
      ><a name="15513" href="Stlc.html#15513" class="Bound"
      >A</a
      ><a name="15514"
      > </a
      ><a name="15515" href="Stlc.html#15515" class="Bound"
      >s</a
      ><a name="15516"
      > </a
      ><a name="15517" href="Stlc.html#15517" class="Bound"
      >t</a
      ><a name="15518" class="Symbol"
      >}</a
      ><a name="15519"
      >
          </a
      ><a name="15530" class="Symbol"
      >&#8594;</a
      ><a name="15531"
      > </a
      ><a name="15532" href="Stlc.html#9347" class="Datatype"
      >Value</a
      ><a name="15537"
      > </a
      ><a name="15538" href="Stlc.html#15517" class="Bound"
      >t</a
      ><a name="15539"
      >
          </a
      ><a name="15550" class="Symbol"
      >&#8594;</a
      ><a name="15551"
      > </a
      ><a name="15552" href="Stlc.html#6061" class="InductiveConstructor"
      >app</a
      ><a name="15555"
      > </a
      ><a name="15556" class="Symbol"
      >(</a
      ><a name="15557" href="Stlc.html#6090" class="InductiveConstructor"
      >abs</a
      ><a name="15560"
      > </a
      ><a name="15561" href="Stlc.html#15511" class="Bound"
      >x</a
      ><a name="15562"
      > </a
      ><a name="15563" href="Stlc.html#15513" class="Bound"
      >A</a
      ><a name="15564"
      > </a
      ><a name="15565" href="Stlc.html#15515" class="Bound"
      >s</a
      ><a name="15566" class="Symbol"
      >)</a
      ><a name="15567"
      > </a
      ><a name="15568" href="Stlc.html#15517" class="Bound"
      >t</a
      ><a name="15569"
      > </a
      ><a name="15570" href="Stlc.html#15464" class="Datatype Operator"
      >==&gt;</a
      ><a name="15573"
      > </a
      ><a name="15574" href="Stlc.html#12567" class="Function Operator"
      >[</a
      ><a name="15575"
      > </a
      ><a name="15576" href="Stlc.html#15511" class="Bound"
      >x</a
      ><a name="15577"
      > </a
      ><a name="15578" href="Stlc.html#12567" class="Function Operator"
      >:=</a
      ><a name="15580"
      > </a
      ><a name="15581" href="Stlc.html#15517" class="Bound"
      >t</a
      ><a name="15582"
      > </a
      ><a name="15583" href="Stlc.html#12567" class="Function Operator"
      >]</a
      ><a name="15584"
      > </a
      ><a name="15585" href="Stlc.html#15515" class="Bound"
      >s</a
      ><a name="15586"
      >
  </a
      ><a name="15589" href="Stlc.html#15589" class="InductiveConstructor"
      >app1</a
      ><a name="15593"
      >    </a
      ><a name="15597" class="Symbol"
      >:</a
      ><a name="15598"
      > </a
      ><a name="15599" class="Symbol"
      >&#8704;</a
      ><a name="15600"
      > </a
      ><a name="15601" class="Symbol"
      >{</a
      ><a name="15602" href="Stlc.html#15602" class="Bound"
      >s</a
      ><a name="15603"
      > </a
      ><a name="15604" href="Stlc.html#15604" class="Bound"
      >s'</a
      ><a name="15606"
      > </a
      ><a name="15607" href="Stlc.html#15607" class="Bound"
      >t</a
      ><a name="15608" class="Symbol"
      >}</a
      ><a name="15609"
      >
          </a
      ><a name="15620" class="Symbol"
      >&#8594;</a
      ><a name="15621"
      > </a
      ><a name="15622" href="Stlc.html#15602" class="Bound"
      >s</a
      ><a name="15623"
      > </a
      ><a name="15624" href="Stlc.html#15464" class="Datatype Operator"
      >==&gt;</a
      ><a name="15627"
      > </a
      ><a name="15628" href="Stlc.html#15604" class="Bound"
      >s'</a
      ><a name="15630"
      >
          </a
      ><a name="15641" class="Symbol"
      >&#8594;</a
      ><a name="15642"
      > </a
      ><a name="15643" href="Stlc.html#6061" class="InductiveConstructor"
      >app</a
      ><a name="15646"
      > </a
      ><a name="15647" href="Stlc.html#15602" class="Bound"
      >s</a
      ><a name="15648"
      > </a
      ><a name="15649" href="Stlc.html#15607" class="Bound"
      >t</a
      ><a name="15650"
      > </a
      ><a name="15651" href="Stlc.html#15464" class="Datatype Operator"
      >==&gt;</a
      ><a name="15654"
      > </a
      ><a name="15655" href="Stlc.html#6061" class="InductiveConstructor"
      >app</a
      ><a name="15658"
      > </a
      ><a name="15659" href="Stlc.html#15604" class="Bound"
      >s'</a
      ><a name="15661"
      > </a
      ><a name="15662" href="Stlc.html#15607" class="Bound"
      >t</a
      ><a name="15663"
      >
  </a
      ><a name="15666" href="Stlc.html#15666" class="InductiveConstructor"
      >app2</a
      ><a name="15670"
      >    </a
      ><a name="15674" class="Symbol"
      >:</a
      ><a name="15675"
      > </a
      ><a name="15676" class="Symbol"
      >&#8704;</a
      ><a name="15677"
      > </a
      ><a name="15678" class="Symbol"
      >{</a
      ><a name="15679" href="Stlc.html#15679" class="Bound"
      >s</a
      ><a name="15680"
      > </a
      ><a name="15681" href="Stlc.html#15681" class="Bound"
      >t</a
      ><a name="15682"
      > </a
      ><a name="15683" href="Stlc.html#15683" class="Bound"
      >t'</a
      ><a name="15685" class="Symbol"
      >}</a
      ><a name="15686"
      >
          </a
      ><a name="15697" class="Symbol"
      >&#8594;</a
      ><a name="15698"
      > </a
      ><a name="15699" href="Stlc.html#9347" class="Datatype"
      >Value</a
      ><a name="15704"
      > </a
      ><a name="15705" href="Stlc.html#15679" class="Bound"
      >s</a
      ><a name="15706"
      >
          </a
      ><a name="15717" class="Symbol"
      >&#8594;</a
      ><a name="15718"
      > </a
      ><a name="15719" href="Stlc.html#15681" class="Bound"
      >t</a
      ><a name="15720"
      > </a
      ><a name="15721" href="Stlc.html#15464" class="Datatype Operator"
      >==&gt;</a
      ><a name="15724"
      > </a
      ><a name="15725" href="Stlc.html#15683" class="Bound"
      >t'</a
      ><a name="15727"
      >
          </a
      ><a name="15738" class="Symbol"
      >&#8594;</a
      ><a name="15739"
      > </a
      ><a name="15740" href="Stlc.html#6061" class="InductiveConstructor"
      >app</a
      ><a name="15743"
      > </a
      ><a name="15744" href="Stlc.html#15679" class="Bound"
      >s</a
      ><a name="15745"
      > </a
      ><a name="15746" href="Stlc.html#15681" class="Bound"
      >t</a
      ><a name="15747"
      > </a
      ><a name="15748" href="Stlc.html#15464" class="Datatype Operator"
      >==&gt;</a
      ><a name="15751"
      > </a
      ><a name="15752" href="Stlc.html#6061" class="InductiveConstructor"
      >app</a
      ><a name="15755"
      > </a
      ><a name="15756" href="Stlc.html#15679" class="Bound"
      >s</a
      ><a name="15757"
      > </a
      ><a name="15758" href="Stlc.html#15683" class="Bound"
      >t'</a
      ><a name="15760"
      >
  </a
      ><a name="15763" href="Stlc.html#15763" class="InductiveConstructor"
      >if</a
      ><a name="15765"
      >      </a
      ><a name="15771" class="Symbol"
      >:</a
      ><a name="15772"
      > </a
      ><a name="15773" class="Symbol"
      >&#8704;</a
      ><a name="15774"
      > </a
      ><a name="15775" class="Symbol"
      >{</a
      ><a name="15776" href="Stlc.html#15776" class="Bound"
      >s</a
      ><a name="15777"
      > </a
      ><a name="15778" href="Stlc.html#15778" class="Bound"
      >s'</a
      ><a name="15780"
      > </a
      ><a name="15781" href="Stlc.html#15781" class="Bound"
      >t</a
      ><a name="15782"
      > </a
      ><a name="15783" href="Stlc.html#15783" class="Bound"
      >u</a
      ><a name="15784" class="Symbol"
      >}</a
      ><a name="15785"
      >
          </a
      ><a name="15796" class="Symbol"
      >&#8594;</a
      ><a name="15797"
      > </a
      ><a name="15798" href="Stlc.html#15776" class="Bound"
      >s</a
      ><a name="15799"
      > </a
      ><a name="15800" href="Stlc.html#15464" class="Datatype Operator"
      >==&gt;</a
      ><a name="15803"
      > </a
      ><a name="15804" href="Stlc.html#15778" class="Bound"
      >s'</a
      ><a name="15806"
      >
          </a
      ><a name="15817" class="Symbol"
      >&#8594;</a
      ><a name="15818"
      > </a
      ><a name="15819" href="Stlc.html#6154" class="InductiveConstructor Operator"
      >if</a
      ><a name="15821"
      > </a
      ><a name="15822" href="Stlc.html#15776" class="Bound"
      >s</a
      ><a name="15823"
      > </a
      ><a name="15824" href="Stlc.html#6154" class="InductiveConstructor Operator"
      >then</a
      ><a name="15828"
      > </a
      ><a name="15829" href="Stlc.html#15781" class="Bound"
      >t</a
      ><a name="15830"
      > </a
      ><a name="15831" href="Stlc.html#6154" class="InductiveConstructor Operator"
      >else</a
      ><a name="15835"
      > </a
      ><a name="15836" href="Stlc.html#15783" class="Bound"
      >u</a
      ><a name="15837"
      > </a
      ><a name="15838" href="Stlc.html#15464" class="Datatype Operator"
      >==&gt;</a
      ><a name="15841"
      > </a
      ><a name="15842" href="Stlc.html#6154" class="InductiveConstructor Operator"
      >if</a
      ><a name="15844"
      > </a
      ><a name="15845" href="Stlc.html#15778" class="Bound"
      >s'</a
      ><a name="15847"
      > </a
      ><a name="15848" href="Stlc.html#6154" class="InductiveConstructor Operator"
      >then</a
      ><a name="15852"
      > </a
      ><a name="15853" href="Stlc.html#15781" class="Bound"
      >t</a
      ><a name="15854"
      > </a
      ><a name="15855" href="Stlc.html#6154" class="InductiveConstructor Operator"
      >else</a
      ><a name="15859"
      > </a
      ><a name="15860" href="Stlc.html#15783" class="Bound"
      >u</a
      ><a name="15861"
      >
  </a
      ><a name="15864" href="Stlc.html#15864" class="InductiveConstructor"
      >iftrue</a
      ><a name="15870"
      >  </a
      ><a name="15872" class="Symbol"
      >:</a
      ><a name="15873"
      > </a
      ><a name="15874" class="Symbol"
      >&#8704;</a
      ><a name="15875"
      > </a
      ><a name="15876" class="Symbol"
      >{</a
      ><a name="15877" href="Stlc.html#15877" class="Bound"
      >s</a
      ><a name="15878"
      > </a
      ><a name="15879" href="Stlc.html#15879" class="Bound"
      >t</a
      ><a name="15880" class="Symbol"
      >}</a
      ><a name="15881"
      >
          </a
      ><a name="15892" class="Symbol"
      >&#8594;</a
      ><a name="15893"
      > </a
      ><a name="15894" href="Stlc.html#6154" class="InductiveConstructor Operator"
      >if</a
      ><a name="15896"
      > </a
      ><a name="15897" href="Stlc.html#6124" class="InductiveConstructor"
      >true</a
      ><a name="15901"
      > </a
      ><a name="15902" href="Stlc.html#6154" class="InductiveConstructor Operator"
      >then</a
      ><a name="15906"
      > </a
      ><a name="15907" href="Stlc.html#15877" class="Bound"
      >s</a
      ><a name="15908"
      > </a
      ><a name="15909" href="Stlc.html#6154" class="InductiveConstructor Operator"
      >else</a
      ><a name="15913"
      > </a
      ><a name="15914" href="Stlc.html#15879" class="Bound"
      >t</a
      ><a name="15915"
      > </a
      ><a name="15916" href="Stlc.html#15464" class="Datatype Operator"
      >==&gt;</a
      ><a name="15919"
      > </a
      ><a name="15920" href="Stlc.html#15877" class="Bound"
      >s</a
      ><a name="15921"
      >
  </a
      ><a name="15924" href="Stlc.html#15924" class="InductiveConstructor"
      >iffalse</a
      ><a name="15931"
      > </a
      ><a name="15932" class="Symbol"
      >:</a
      ><a name="15933"
      > </a
      ><a name="15934" class="Symbol"
      >&#8704;</a
      ><a name="15935"
      > </a
      ><a name="15936" class="Symbol"
      >{</a
      ><a name="15937" href="Stlc.html#15937" class="Bound"
      >s</a
      ><a name="15938"
      > </a
      ><a name="15939" href="Stlc.html#15939" class="Bound"
      >t</a
      ><a name="15940" class="Symbol"
      >}</a
      ><a name="15941"
      >
          </a
      ><a name="15952" class="Symbol"
      >&#8594;</a
      ><a name="15953"
      > </a
      ><a name="15954" href="Stlc.html#6154" class="InductiveConstructor Operator"
      >if</a
      ><a name="15956"
      > </a
      ><a name="15957" href="Stlc.html#6139" class="InductiveConstructor"
      >false</a
      ><a name="15962"
      > </a
      ><a name="15963" href="Stlc.html#6154" class="InductiveConstructor Operator"
      >then</a
      ><a name="15967"
      > </a
      ><a name="15968" href="Stlc.html#15937" class="Bound"
      >s</a
      ><a name="15969"
      > </a
      ><a name="15970" href="Stlc.html#6154" class="InductiveConstructor Operator"
      >else</a
      ><a name="15974"
      > </a
      ><a name="15975" href="Stlc.html#15939" class="Bound"
      >t</a
      ><a name="15976"
      > </a
      ><a name="15977" href="Stlc.html#15464" class="Datatype Operator"
      >==&gt;</a
      ><a name="15980"
      > </a
      ><a name="15981" href="Stlc.html#15939" class="Bound"
      >t</a
      ><a name="15982"
      >

</a
      ><a name="15984" class="Keyword"
      >infix</a
      ><a name="15989"
      > </a
      ><a name="15990" class="Number"
      >1</a
      >
{% endraw %}</pre>

<pre class="Agda">{% raw %}
<a name="16023" class="Keyword"
      >data</a
      ><a name="16027"
      > </a
      ><a name="16028" href="Stlc.html#16028" class="Datatype"
      >Multi</a
      ><a name="16033"
      > </a
      ><a name="16034" class="Symbol"
      >(</a
      ><a name="16035" href="Stlc.html#16035" class="Bound"
      >R</a
      ><a name="16036"
      > </a
      ><a name="16037" class="Symbol"
      >:</a
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
      ><a name="16046" href="Stlc.html#6022" class="Datatype"
      >Term</a
      ><a name="16050"
      > </a
      ><a name="16051" class="Symbol"
      >&#8594;</a
      ><a name="16052"
      > </a
      ><a name="16053" class="PrimitiveType"
      >Set</a
      ><a name="16056" class="Symbol"
      >)</a
      ><a name="16057"
      > </a
      ><a name="16058" class="Symbol"
      >:</a
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
      ><a name="16067" href="Stlc.html#6022" class="Datatype"
      >Term</a
      ><a name="16071"
      > </a
      ><a name="16072" class="Symbol"
      >&#8594;</a
      ><a name="16073"
      > </a
      ><a name="16074" class="PrimitiveType"
      >Set</a
      ><a name="16077"
      > </a
      ><a name="16078" class="Keyword"
      >where</a
      ><a name="16083"
      >
  </a
      ><a name="16086" href="Stlc.html#16086" class="InductiveConstructor"
      >refl</a
      ><a name="16090"
      > </a
      ><a name="16091" class="Symbol"
      >:</a
      ><a name="16092"
      > </a
      ><a name="16093" class="Symbol"
      >&#8704;</a
      ><a name="16094"
      > </a
      ><a name="16095" class="Symbol"
      >{</a
      ><a name="16096" href="Stlc.html#16096" class="Bound"
      >x</a
      ><a name="16097" class="Symbol"
      >}</a
      ><a name="16098"
      > </a
      ><a name="16099" class="Symbol"
      >-&gt;</a
      ><a name="16101"
      > </a
      ><a name="16102" href="Stlc.html#16028" class="Datatype"
      >Multi</a
      ><a name="16107"
      > </a
      ><a name="16108" href="Stlc.html#16035" class="Bound"
      >R</a
      ><a name="16109"
      > </a
      ><a name="16110" href="Stlc.html#16096" class="Bound"
      >x</a
      ><a name="16111"
      > </a
      ><a name="16112" href="Stlc.html#16096" class="Bound"
      >x</a
      ><a name="16113"
      >
  </a
      ><a name="16116" href="Stlc.html#16116" class="InductiveConstructor"
      >step</a
      ><a name="16120"
      > </a
      ><a name="16121" class="Symbol"
      >:</a
      ><a name="16122"
      > </a
      ><a name="16123" class="Symbol"
      >&#8704;</a
      ><a name="16124"
      > </a
      ><a name="16125" class="Symbol"
      >{</a
      ><a name="16126" href="Stlc.html#16126" class="Bound"
      >x</a
      ><a name="16127"
      > </a
      ><a name="16128" href="Stlc.html#16128" class="Bound"
      >y</a
      ><a name="16129"
      > </a
      ><a name="16130" href="Stlc.html#16130" class="Bound"
      >z</a
      ><a name="16131" class="Symbol"
      >}</a
      ><a name="16132"
      > </a
      ><a name="16133" class="Symbol"
      >-&gt;</a
      ><a name="16135"
      > </a
      ><a name="16136" href="Stlc.html#16035" class="Bound"
      >R</a
      ><a name="16137"
      > </a
      ><a name="16138" href="Stlc.html#16126" class="Bound"
      >x</a
      ><a name="16139"
      > </a
      ><a name="16140" href="Stlc.html#16128" class="Bound"
      >y</a
      ><a name="16141"
      > </a
      ><a name="16142" class="Symbol"
      >-&gt;</a
      ><a name="16144"
      > </a
      ><a name="16145" href="Stlc.html#16028" class="Datatype"
      >Multi</a
      ><a name="16150"
      > </a
      ><a name="16151" href="Stlc.html#16035" class="Bound"
      >R</a
      ><a name="16152"
      > </a
      ><a name="16153" href="Stlc.html#16128" class="Bound"
      >y</a
      ><a name="16154"
      > </a
      ><a name="16155" href="Stlc.html#16130" class="Bound"
      >z</a
      ><a name="16156"
      > </a
      ><a name="16157" class="Symbol"
      >-&gt;</a
      ><a name="16159"
      > </a
      ><a name="16160" href="Stlc.html#16028" class="Datatype"
      >Multi</a
      ><a name="16165"
      > </a
      ><a name="16166" href="Stlc.html#16035" class="Bound"
      >R</a
      ><a name="16167"
      > </a
      ><a name="16168" href="Stlc.html#16126" class="Bound"
      >x</a
      ><a name="16169"
      > </a
      ><a name="16170" href="Stlc.html#16130" class="Bound"
      >z</a
      >
{% endraw %}</pre>

<pre class="Agda">{% raw %}
<a name="16197" href="Stlc.html#16197" class="Function Operator"
      >_==&gt;*_</a
      ><a name="16203"
      > </a
      ><a name="16204" class="Symbol"
      >:</a
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
      ><a name="16213" href="Stlc.html#6022" class="Datatype"
      >Term</a
      ><a name="16217"
      > </a
      ><a name="16218" class="Symbol"
      >&#8594;</a
      ><a name="16219"
      > </a
      ><a name="16220" class="PrimitiveType"
      >Set</a
      ><a name="16223"
      >
</a
      ><a name="16224" href="Stlc.html#16197" class="Function Operator"
      >_==&gt;*_</a
      ><a name="16230"
      > </a
      ><a name="16231" class="Symbol"
      >=</a
      ><a name="16232"
      > </a
      ><a name="16233" href="Stlc.html#16028" class="Datatype"
      >Multi</a
      ><a name="16238"
      > </a
      ><a name="16239" href="Stlc.html#15464" class="Datatype Operator"
      >_==&gt;_</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="16291" class="Symbol"
      >{-#</a
      ><a name="16294"
      > </a
      ><a name="16295" class="Keyword"
      >DISPLAY</a
      ><a name="16302"
      > </a
      ><a name="16303" href="Stlc.html#16028" class="Datatype"
      >Multi</a
      ><a name="16308"
      > </a
      ><a name="16309" href="Stlc.html#16309" class="Bound Operator"
      >_==&gt;_</a
      ><a name="16314"
      > = </a
      ><a name="16317" href="Stlc.html#16197" class="Function Operator"
      >_==&gt;*_</a
      ><a name="16323"
      > </a
      ><a name="16324" class="Symbol"
      >#-}</a
      >
{% endraw %}</pre>
</div>

### Examples

Example:

$$((\lambda x:bool\rightarrow bool. x) (\lambda x:bool. x)) \Longrightarrow^* (\lambda x:bool. x)$$.

<pre class="Agda">{% raw %}
<a name="16486" href="Stlc.html#16486" class="Function"
      >step-example1</a
      ><a name="16499"
      > </a
      ><a name="16500" class="Symbol"
      >:</a
      ><a name="16501"
      > </a
      ><a name="16502" class="Symbol"
      >(</a
      ><a name="16503" href="Stlc.html#6061" class="InductiveConstructor"
      >app</a
      ><a name="16506"
      > </a
      ><a name="16507" href="Stlc.html#6958" class="Function"
      >idBB</a
      ><a name="16511"
      > </a
      ><a name="16512" href="Stlc.html#6852" class="Function"
      >idB</a
      ><a name="16515" class="Symbol"
      >)</a
      ><a name="16516"
      > </a
      ><a name="16517" href="Stlc.html#16197" class="Function Operator"
      >==&gt;*</a
      ><a name="16521"
      > </a
      ><a name="16522" href="Stlc.html#6852" class="Function"
      >idB</a
      ><a name="16525"
      >
</a
      ><a name="16526" href="Stlc.html#16486" class="Function"
      >step-example1</a
      ><a name="16539"
      > </a
      ><a name="16540" class="Symbol"
      >=</a
      ><a name="16541"
      > </a
      ><a name="16542" href="Stlc.html#16116" class="InductiveConstructor"
      >step</a
      ><a name="16546"
      > </a
      ><a name="16547" class="Symbol"
      >(</a
      ><a name="16548" href="Stlc.html#15498" class="InductiveConstructor"
      >red</a
      ><a name="16551"
      > </a
      ><a name="16552" href="Stlc.html#9374" class="InductiveConstructor"
      >abs</a
      ><a name="16555" class="Symbol"
      >)</a
      ><a name="16556"
      >
              </a
      ><a name="16571" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="16572"
      > </a
      ><a name="16573" href="Stlc.html#16086" class="InductiveConstructor"
      >refl</a
      >
{% endraw %}</pre>

Example:

$$(\lambda x:bool\rightarrow bool. x) \;((\lambda x:bool\rightarrow bool. x)\;(\lambda x:bool. x))) \Longrightarrow^* (\lambda x:bool. x)$$.

<pre class="Agda">{% raw %}
<a name="16755" href="Stlc.html#16755" class="Function"
      >step-example2</a
      ><a name="16768"
      > </a
      ><a name="16769" class="Symbol"
      >:</a
      ><a name="16770"
      > </a
      ><a name="16771" class="Symbol"
      >(</a
      ><a name="16772" href="Stlc.html#6061" class="InductiveConstructor"
      >app</a
      ><a name="16775"
      > </a
      ><a name="16776" href="Stlc.html#6958" class="Function"
      >idBB</a
      ><a name="16780"
      > </a
      ><a name="16781" class="Symbol"
      >(</a
      ><a name="16782" href="Stlc.html#6061" class="InductiveConstructor"
      >app</a
      ><a name="16785"
      > </a
      ><a name="16786" href="Stlc.html#6958" class="Function"
      >idBB</a
      ><a name="16790"
      > </a
      ><a name="16791" href="Stlc.html#6852" class="Function"
      >idB</a
      ><a name="16794" class="Symbol"
      >))</a
      ><a name="16796"
      > </a
      ><a name="16797" href="Stlc.html#16197" class="Function Operator"
      >==&gt;*</a
      ><a name="16801"
      > </a
      ><a name="16802" href="Stlc.html#6852" class="Function"
      >idB</a
      ><a name="16805"
      >
</a
      ><a name="16806" href="Stlc.html#16755" class="Function"
      >step-example2</a
      ><a name="16819"
      > </a
      ><a name="16820" class="Symbol"
      >=</a
      ><a name="16821"
      > </a
      ><a name="16822" href="Stlc.html#16116" class="InductiveConstructor"
      >step</a
      ><a name="16826"
      > </a
      ><a name="16827" class="Symbol"
      >(</a
      ><a name="16828" href="Stlc.html#15666" class="InductiveConstructor"
      >app2</a
      ><a name="16832"
      > </a
      ><a name="16833" href="Stlc.html#9374" class="InductiveConstructor"
      >abs</a
      ><a name="16836"
      > </a
      ><a name="16837" class="Symbol"
      >(</a
      ><a name="16838" href="Stlc.html#15498" class="InductiveConstructor"
      >red</a
      ><a name="16841"
      > </a
      ><a name="16842" href="Stlc.html#9374" class="InductiveConstructor"
      >abs</a
      ><a name="16845" class="Symbol"
      >))</a
      ><a name="16847"
      >
              </a
      ><a name="16862" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="16863"
      > </a
      ><a name="16864" href="Stlc.html#16116" class="InductiveConstructor"
      >step</a
      ><a name="16868"
      > </a
      ><a name="16869" class="Symbol"
      >(</a
      ><a name="16870" href="Stlc.html#15498" class="InductiveConstructor"
      >red</a
      ><a name="16873"
      > </a
      ><a name="16874" href="Stlc.html#9374" class="InductiveConstructor"
      >abs</a
      ><a name="16877" class="Symbol"
      >)</a
      ><a name="16878"
      >
              </a
      ><a name="16893" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="16894"
      > </a
      ><a name="16895" href="Stlc.html#16086" class="InductiveConstructor"
      >refl</a
      >
{% endraw %}</pre>

Example:

$$((\lambda x:bool\rightarrow bool. x)\;(\lambda x:bool. \text{if }x\text{ then }false\text{ else }true))\;true\Longrightarrow^* false$$.

<pre class="Agda">{% raw %}
<a name="17074" href="Stlc.html#17074" class="Function"
      >step-example3</a
      ><a name="17087"
      > </a
      ><a name="17088" class="Symbol"
      >:</a
      ><a name="17089"
      > </a
      ><a name="17090" class="Symbol"
      >(</a
      ><a name="17091" href="Stlc.html#6061" class="InductiveConstructor"
      >app</a
      ><a name="17094"
      > </a
      ><a name="17095" class="Symbol"
      >(</a
      ><a name="17096" href="Stlc.html#6061" class="InductiveConstructor"
      >app</a
      ><a name="17099"
      > </a
      ><a name="17100" href="Stlc.html#6958" class="Function"
      >idBB</a
      ><a name="17104"
      > </a
      ><a name="17105" href="Stlc.html#7391" class="Function"
      >notB</a
      ><a name="17109" class="Symbol"
      >)</a
      ><a name="17110"
      > </a
      ><a name="17111" href="Stlc.html#6124" class="InductiveConstructor"
      >true</a
      ><a name="17115" class="Symbol"
      >)</a
      ><a name="17116"
      > </a
      ><a name="17117" href="Stlc.html#16197" class="Function Operator"
      >==&gt;*</a
      ><a name="17121"
      > </a
      ><a name="17122" href="Stlc.html#6139" class="InductiveConstructor"
      >false</a
      ><a name="17127"
      >
</a
      ><a name="17128" href="Stlc.html#17074" class="Function"
      >step-example3</a
      ><a name="17141"
      > </a
      ><a name="17142" class="Symbol"
      >=</a
      ><a name="17143"
      > </a
      ><a name="17144" href="Stlc.html#16116" class="InductiveConstructor"
      >step</a
      ><a name="17148"
      > </a
      ><a name="17149" class="Symbol"
      >(</a
      ><a name="17150" href="Stlc.html#15589" class="InductiveConstructor"
      >app1</a
      ><a name="17154"
      > </a
      ><a name="17155" class="Symbol"
      >(</a
      ><a name="17156" href="Stlc.html#15498" class="InductiveConstructor"
      >red</a
      ><a name="17159"
      > </a
      ><a name="17160" href="Stlc.html#9374" class="InductiveConstructor"
      >abs</a
      ><a name="17163" class="Symbol"
      >))</a
      ><a name="17165"
      >
              </a
      ><a name="17180" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="17181"
      > </a
      ><a name="17182" href="Stlc.html#16116" class="InductiveConstructor"
      >step</a
      ><a name="17186"
      > </a
      ><a name="17187" class="Symbol"
      >(</a
      ><a name="17188" href="Stlc.html#15498" class="InductiveConstructor"
      >red</a
      ><a name="17191"
      > </a
      ><a name="17192" href="Stlc.html#9422" class="InductiveConstructor"
      >true</a
      ><a name="17196" class="Symbol"
      >)</a
      ><a name="17197"
      >
              </a
      ><a name="17212" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="17213"
      > </a
      ><a name="17214" href="Stlc.html#16116" class="InductiveConstructor"
      >step</a
      ><a name="17218"
      > </a
      ><a name="17219" href="Stlc.html#15864" class="InductiveConstructor"
      >iftrue</a
      ><a name="17225"
      >
              </a
      ><a name="17240" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="17241"
      > </a
      ><a name="17242" href="Stlc.html#16086" class="InductiveConstructor"
      >refl</a
      >
{% endraw %}</pre>

Example:

$$((\lambda x:bool\rightarrow bool. x)\;((\lambda x:bool. \text{if }x\text{ then }false\text{ else }true)\;true))\Longrightarrow^* false$$.

<pre class="Agda">{% raw %}
<a name="17423" href="Stlc.html#17423" class="Function"
      >step-example4</a
      ><a name="17436"
      > </a
      ><a name="17437" class="Symbol"
      >:</a
      ><a name="17438"
      > </a
      ><a name="17439" class="Symbol"
      >(</a
      ><a name="17440" href="Stlc.html#6061" class="InductiveConstructor"
      >app</a
      ><a name="17443"
      > </a
      ><a name="17444" href="Stlc.html#6958" class="Function"
      >idBB</a
      ><a name="17448"
      > </a
      ><a name="17449" class="Symbol"
      >(</a
      ><a name="17450" href="Stlc.html#6061" class="InductiveConstructor"
      >app</a
      ><a name="17453"
      > </a
      ><a name="17454" href="Stlc.html#7391" class="Function"
      >notB</a
      ><a name="17458"
      > </a
      ><a name="17459" href="Stlc.html#6124" class="InductiveConstructor"
      >true</a
      ><a name="17463" class="Symbol"
      >))</a
      ><a name="17465"
      > </a
      ><a name="17466" href="Stlc.html#16197" class="Function Operator"
      >==&gt;*</a
      ><a name="17470"
      > </a
      ><a name="17471" href="Stlc.html#6139" class="InductiveConstructor"
      >false</a
      ><a name="17476"
      >
</a
      ><a name="17477" href="Stlc.html#17423" class="Function"
      >step-example4</a
      ><a name="17490"
      > </a
      ><a name="17491" class="Symbol"
      >=</a
      ><a name="17492"
      > </a
      ><a name="17493" href="Stlc.html#16116" class="InductiveConstructor"
      >step</a
      ><a name="17497"
      > </a
      ><a name="17498" class="Symbol"
      >(</a
      ><a name="17499" href="Stlc.html#15666" class="InductiveConstructor"
      >app2</a
      ><a name="17503"
      > </a
      ><a name="17504" href="Stlc.html#9374" class="InductiveConstructor"
      >abs</a
      ><a name="17507"
      > </a
      ><a name="17508" class="Symbol"
      >(</a
      ><a name="17509" href="Stlc.html#15498" class="InductiveConstructor"
      >red</a
      ><a name="17512"
      > </a
      ><a name="17513" href="Stlc.html#9422" class="InductiveConstructor"
      >true</a
      ><a name="17517" class="Symbol"
      >))</a
      ><a name="17519"
      >
              </a
      ><a name="17534" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="17535"
      > </a
      ><a name="17536" href="Stlc.html#16116" class="InductiveConstructor"
      >step</a
      ><a name="17540"
      > </a
      ><a name="17541" class="Symbol"
      >(</a
      ><a name="17542" href="Stlc.html#15666" class="InductiveConstructor"
      >app2</a
      ><a name="17546"
      > </a
      ><a name="17547" href="Stlc.html#9374" class="InductiveConstructor"
      >abs</a
      ><a name="17550"
      > </a
      ><a name="17551" href="Stlc.html#15864" class="InductiveConstructor"
      >iftrue</a
      ><a name="17557" class="Symbol"
      >)</a
      ><a name="17558"
      >
              </a
      ><a name="17573" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="17574"
      > </a
      ><a name="17575" href="Stlc.html#16116" class="InductiveConstructor"
      >step</a
      ><a name="17579"
      > </a
      ><a name="17580" class="Symbol"
      >(</a
      ><a name="17581" href="Stlc.html#15498" class="InductiveConstructor"
      >red</a
      ><a name="17584"
      > </a
      ><a name="17585" href="Stlc.html#9443" class="InductiveConstructor"
      >false</a
      ><a name="17590" class="Symbol"
      >)</a
      ><a name="17591"
      >
              </a
      ><a name="17606" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="17607"
      > </a
      ><a name="17608" href="Stlc.html#16086" class="InductiveConstructor"
      >refl</a
      >
{% endraw %}</pre>

#### Exercise: 2 stars (step-example5)

<pre class="Agda">{% raw %}
<a name="17678" href="Stlc.html#17678" class="Function"
      >step-example5</a
      ><a name="17691"
      > </a
      ><a name="17692" class="Symbol"
      >:</a
      ><a name="17693"
      > </a
      ><a name="17694" class="Symbol"
      >(</a
      ><a name="17695" href="Stlc.html#6061" class="InductiveConstructor"
      >app</a
      ><a name="17698"
      > </a
      ><a name="17699" class="Symbol"
      >(</a
      ><a name="17700" href="Stlc.html#6061" class="InductiveConstructor"
      >app</a
      ><a name="17703"
      > </a
      ><a name="17704" href="Stlc.html#7112" class="Function"
      >idBBBB</a
      ><a name="17710"
      > </a
      ><a name="17711" href="Stlc.html#6958" class="Function"
      >idBB</a
      ><a name="17715" class="Symbol"
      >)</a
      ><a name="17716"
      > </a
      ><a name="17717" href="Stlc.html#6852" class="Function"
      >idB</a
      ><a name="17720" class="Symbol"
      >)</a
      ><a name="17721"
      > </a
      ><a name="17722" href="Stlc.html#16197" class="Function Operator"
      >==&gt;*</a
      ><a name="17726"
      > </a
      ><a name="17727" href="Stlc.html#6852" class="Function"
      >idB</a
      ><a name="17730"
      >
</a
      ><a name="17731" href="Stlc.html#17678" class="Function"
      >step-example5</a
      ><a name="17744"
      > </a
      ><a name="17745" class="Symbol"
      >=</a
      ><a name="17746"
      > </a
      ><a name="17747" class="Symbol"
      >{!!}</a
      ><a name="17751"
      > </a
      ><a name="17752" class="Comment"
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
<a name="18484" href="Stlc.html#18484" class="Function"
      >Ctxt</a
      ><a name="18488"
      > </a
      ><a name="18489" class="Symbol"
      >:</a
      ><a name="18490"
      > </a
      ><a name="18491" class="PrimitiveType"
      >Set</a
      ><a name="18494"
      >
</a
      ><a name="18495" href="Stlc.html#18484" class="Function"
      >Ctxt</a
      ><a name="18499"
      > </a
      ><a name="18500" class="Symbol"
      >=</a
      ><a name="18501"
      > </a
      ><a name="18502" href="Stlc.html#5686" class="Datatype"
      >Id</a
      ><a name="18504"
      > </a
      ><a name="18505" class="Symbol"
      >&#8594;</a
      ><a name="18506"
      > </a
      ><a name="18507" href="https://agda.github.io/agda-stdlib/Data.Maybe.Base.html#335" class="Datatype"
      >Maybe</a
      ><a name="18512"
      > </a
      ><a name="18513" href="Stlc.html#5519" class="Datatype"
      >Type</a
      ><a name="18517"
      >

</a
      ><a name="18519" href="Stlc.html#18519" class="Function"
      >&#8709;</a
      ><a name="18520"
      > </a
      ><a name="18521" class="Symbol"
      >:</a
      ><a name="18522"
      > </a
      ><a name="18523" href="Stlc.html#18484" class="Function"
      >Ctxt</a
      ><a name="18527"
      >
</a
      ><a name="18528" href="Stlc.html#18519" class="Function"
      >&#8709;</a
      ><a name="18529"
      > </a
      ><a name="18530" class="Symbol"
      >=</a
      ><a name="18531"
      > </a
      ><a name="18532" class="Symbol"
      >&#955;</a
      ><a name="18533"
      > </a
      ><a name="18534" href="Stlc.html#18534" class="Bound"
      >_</a
      ><a name="18535"
      > </a
      ><a name="18536" class="Symbol"
      >&#8594;</a
      ><a name="18537"
      > </a
      ><a name="18538" href="https://agda.github.io/agda-stdlib/Data.Maybe.Base.html#403" class="InductiveConstructor"
      >nothing</a
      ><a name="18545"
      >

</a
      ><a name="18547" href="Stlc.html#18547" class="Function Operator"
      >_,_&#8758;_</a
      ><a name="18552"
      > </a
      ><a name="18553" class="Symbol"
      >:</a
      ><a name="18554"
      > </a
      ><a name="18555" href="Stlc.html#18484" class="Function"
      >Ctxt</a
      ><a name="18559"
      > </a
      ><a name="18560" class="Symbol"
      >-&gt;</a
      ><a name="18562"
      > </a
      ><a name="18563" href="Stlc.html#5686" class="Datatype"
      >Id</a
      ><a name="18565"
      > </a
      ><a name="18566" class="Symbol"
      >-&gt;</a
      ><a name="18568"
      > </a
      ><a name="18569" href="Stlc.html#5519" class="Datatype"
      >Type</a
      ><a name="18573"
      > </a
      ><a name="18574" class="Symbol"
      >-&gt;</a
      ><a name="18576"
      > </a
      ><a name="18577" href="Stlc.html#18484" class="Function"
      >Ctxt</a
      ><a name="18581"
      >
</a
      ><a name="18582" class="Symbol"
      >(</a
      ><a name="18583" href="Stlc.html#18583" class="Bound"
      >&#915;</a
      ><a name="18584"
      > </a
      ><a name="18585" href="Stlc.html#18547" class="Function Operator"
      >,</a
      ><a name="18586"
      > </a
      ><a name="18587" href="Stlc.html#18587" class="Bound"
      >x</a
      ><a name="18588"
      > </a
      ><a name="18589" href="Stlc.html#18547" class="Function Operator"
      >&#8758;</a
      ><a name="18590"
      > </a
      ><a name="18591" href="Stlc.html#18591" class="Bound"
      >A</a
      ><a name="18592" class="Symbol"
      >)</a
      ><a name="18593"
      > </a
      ><a name="18594" href="Stlc.html#18594" class="Bound"
      >y</a
      ><a name="18595"
      > </a
      ><a name="18596" class="Keyword"
      >with</a
      ><a name="18600"
      > </a
      ><a name="18601" href="Stlc.html#18587" class="Bound"
      >x</a
      ><a name="18602"
      > </a
      ><a name="18603" href="Stlc.html#5761" class="Function Operator"
      >&#8799;</a
      ><a name="18604"
      > </a
      ><a name="18605" href="Stlc.html#18594" class="Bound"
      >y</a
      ><a name="18606"
      >
</a
      ><a name="18607" class="Symbol"
      >...</a
      ><a name="18610"
      > </a
      ><a name="18611" class="Symbol"
      >|</a
      ><a name="18612"
      > </a
      ><a name="18613" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="18616"
      > </a
      ><a name="18617" href="Stlc.html#18617" class="Bound"
      >x=y</a
      ><a name="18620"
      > </a
      ><a name="18621" class="Symbol"
      >=</a
      ><a name="18622"
      > </a
      ><a name="18623" href="https://agda.github.io/agda-stdlib/Data.Maybe.Base.html#373" class="InductiveConstructor"
      >just</a
      ><a name="18627"
      > </a
      ><a name="18628" href="Stlc.html#18591" class="Bound"
      >A</a
      ><a name="18629"
      >
</a
      ><a name="18630" class="Symbol"
      >...</a
      ><a name="18633"
      > </a
      ><a name="18634" class="Symbol"
      >|</a
      ><a name="18635"
      > </a
      ><a name="18636" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="18638"
      >  </a
      ><a name="18640" href="Stlc.html#18640" class="Bound"
      >x&#8800;y</a
      ><a name="18643"
      > </a
      ><a name="18644" class="Symbol"
      >=</a
      ><a name="18645"
      > </a
      ><a name="18646" href="Stlc.html#18583" class="Bound"
      >&#915;</a
      ><a name="18647"
      > </a
      ><a name="18648" href="Stlc.html#18594" class="Bound"
      >y</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="18696" class="Keyword"
      >infixl</a
      ><a name="18702"
      > </a
      ><a name="18703" class="Number"
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
<a name="19485" class="Keyword"
      >data</a
      ><a name="19489"
      > </a
      ><a name="19490" href="Stlc.html#19490" class="Datatype Operator"
      >_&#8866;_&#8758;_</a
      ><a name="19495"
      > </a
      ><a name="19496" class="Symbol"
      >:</a
      ><a name="19497"
      > </a
      ><a name="19498" href="Stlc.html#18484" class="Function"
      >Ctxt</a
      ><a name="19502"
      > </a
      ><a name="19503" class="Symbol"
      >-&gt;</a
      ><a name="19505"
      > </a
      ><a name="19506" href="Stlc.html#6022" class="Datatype"
      >Term</a
      ><a name="19510"
      > </a
      ><a name="19511" class="Symbol"
      >-&gt;</a
      ><a name="19513"
      > </a
      ><a name="19514" href="Stlc.html#5519" class="Datatype"
      >Type</a
      ><a name="19518"
      > </a
      ><a name="19519" class="Symbol"
      >-&gt;</a
      ><a name="19521"
      > </a
      ><a name="19522" class="PrimitiveType"
      >Set</a
      ><a name="19525"
      > </a
      ><a name="19526" class="Keyword"
      >where</a
      ><a name="19531"
      >
  </a
      ><a name="19534" href="Stlc.html#19534" class="InductiveConstructor"
      >var</a
      ><a name="19537"
      >           </a
      ><a name="19548" class="Symbol"
      >:</a
      ><a name="19549"
      > </a
      ><a name="19550" class="Symbol"
      >&#8704;</a
      ><a name="19551"
      > </a
      ><a name="19552" class="Symbol"
      >{</a
      ><a name="19553" href="Stlc.html#19553" class="Bound"
      >&#915;</a
      ><a name="19554" class="Symbol"
      >}</a
      ><a name="19555"
      > </a
      ><a name="19556" href="Stlc.html#19556" class="Bound"
      >x</a
      ><a name="19557"
      > </a
      ><a name="19558" class="Symbol"
      >{</a
      ><a name="19559" href="Stlc.html#19559" class="Bound"
      >A</a
      ><a name="19560" class="Symbol"
      >}</a
      ><a name="19561"
      >
                </a
      ><a name="19578" class="Symbol"
      >&#8594;</a
      ><a name="19579"
      > </a
      ><a name="19580" href="Stlc.html#19553" class="Bound"
      >&#915;</a
      ><a name="19581"
      > </a
      ><a name="19582" href="Stlc.html#19556" class="Bound"
      >x</a
      ><a name="19583"
      > </a
      ><a name="19584" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="19585"
      > </a
      ><a name="19586" href="https://agda.github.io/agda-stdlib/Data.Maybe.Base.html#373" class="InductiveConstructor"
      >just</a
      ><a name="19590"
      > </a
      ><a name="19591" href="Stlc.html#19559" class="Bound"
      >A</a
      ><a name="19592"
      >
                </a
      ><a name="19609" class="Symbol"
      >&#8594;</a
      ><a name="19610"
      > </a
      ><a name="19611" href="Stlc.html#19553" class="Bound"
      >&#915;</a
      ><a name="19612"
      > </a
      ><a name="19613" href="Stlc.html#19490" class="Datatype Operator"
      >&#8866;</a
      ><a name="19614"
      > </a
      ><a name="19615" href="Stlc.html#6041" class="InductiveConstructor"
      >var</a
      ><a name="19618"
      > </a
      ><a name="19619" href="Stlc.html#19556" class="Bound"
      >x</a
      ><a name="19620"
      > </a
      ><a name="19621" href="Stlc.html#19490" class="Datatype Operator"
      >&#8758;</a
      ><a name="19622"
      > </a
      ><a name="19623" href="Stlc.html#19559" class="Bound"
      >A</a
      ><a name="19624"
      >
  </a
      ><a name="19627" href="Stlc.html#19627" class="InductiveConstructor"
      >abs</a
      ><a name="19630"
      >           </a
      ><a name="19641" class="Symbol"
      >:</a
      ><a name="19642"
      > </a
      ><a name="19643" class="Symbol"
      >&#8704;</a
      ><a name="19644"
      > </a
      ><a name="19645" class="Symbol"
      >{</a
      ><a name="19646" href="Stlc.html#19646" class="Bound"
      >&#915;</a
      ><a name="19647" class="Symbol"
      >}</a
      ><a name="19648"
      > </a
      ><a name="19649" class="Symbol"
      >{</a
      ><a name="19650" href="Stlc.html#19650" class="Bound"
      >x</a
      ><a name="19651" class="Symbol"
      >}</a
      ><a name="19652"
      > </a
      ><a name="19653" class="Symbol"
      >{</a
      ><a name="19654" href="Stlc.html#19654" class="Bound"
      >A</a
      ><a name="19655" class="Symbol"
      >}</a
      ><a name="19656"
      > </a
      ><a name="19657" class="Symbol"
      >{</a
      ><a name="19658" href="Stlc.html#19658" class="Bound"
      >B</a
      ><a name="19659" class="Symbol"
      >}</a
      ><a name="19660"
      > </a
      ><a name="19661" class="Symbol"
      >{</a
      ><a name="19662" href="Stlc.html#19662" class="Bound"
      >s</a
      ><a name="19663" class="Symbol"
      >}</a
      ><a name="19664"
      >
                </a
      ><a name="19681" class="Symbol"
      >&#8594;</a
      ><a name="19682"
      > </a
      ><a name="19683" href="Stlc.html#19646" class="Bound"
      >&#915;</a
      ><a name="19684"
      > </a
      ><a name="19685" href="Stlc.html#18547" class="Function Operator"
      >,</a
      ><a name="19686"
      > </a
      ><a name="19687" href="Stlc.html#19650" class="Bound"
      >x</a
      ><a name="19688"
      > </a
      ><a name="19689" href="Stlc.html#18547" class="Function Operator"
      >&#8758;</a
      ><a name="19690"
      > </a
      ><a name="19691" href="Stlc.html#19654" class="Bound"
      >A</a
      ><a name="19692"
      > </a
      ><a name="19693" href="Stlc.html#19490" class="Datatype Operator"
      >&#8866;</a
      ><a name="19694"
      > </a
      ><a name="19695" href="Stlc.html#19662" class="Bound"
      >s</a
      ><a name="19696"
      > </a
      ><a name="19697" href="Stlc.html#19490" class="Datatype Operator"
      >&#8758;</a
      ><a name="19698"
      > </a
      ><a name="19699" href="Stlc.html#19658" class="Bound"
      >B</a
      ><a name="19700"
      >
                </a
      ><a name="19717" class="Symbol"
      >&#8594;</a
      ><a name="19718"
      > </a
      ><a name="19719" href="Stlc.html#19646" class="Bound"
      >&#915;</a
      ><a name="19720"
      > </a
      ><a name="19721" href="Stlc.html#19490" class="Datatype Operator"
      >&#8866;</a
      ><a name="19722"
      > </a
      ><a name="19723" href="Stlc.html#6090" class="InductiveConstructor"
      >abs</a
      ><a name="19726"
      > </a
      ><a name="19727" href="Stlc.html#19650" class="Bound"
      >x</a
      ><a name="19728"
      > </a
      ><a name="19729" href="Stlc.html#19654" class="Bound"
      >A</a
      ><a name="19730"
      > </a
      ><a name="19731" href="Stlc.html#19662" class="Bound"
      >s</a
      ><a name="19732"
      > </a
      ><a name="19733" href="Stlc.html#19490" class="Datatype Operator"
      >&#8758;</a
      ><a name="19734"
      > </a
      ><a name="19735" href="Stlc.html#19654" class="Bound"
      >A</a
      ><a name="19736"
      > </a
      ><a name="19737" href="Stlc.html#5552" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="19738"
      > </a
      ><a name="19739" href="Stlc.html#19658" class="Bound"
      >B</a
      ><a name="19740"
      >
  </a
      ><a name="19743" href="Stlc.html#19743" class="InductiveConstructor"
      >app</a
      ><a name="19746"
      >           </a
      ><a name="19757" class="Symbol"
      >:</a
      ><a name="19758"
      > </a
      ><a name="19759" class="Symbol"
      >&#8704;</a
      ><a name="19760"
      > </a
      ><a name="19761" class="Symbol"
      >{</a
      ><a name="19762" href="Stlc.html#19762" class="Bound"
      >&#915;</a
      ><a name="19763" class="Symbol"
      >}</a
      ><a name="19764"
      > </a
      ><a name="19765" class="Symbol"
      >{</a
      ><a name="19766" href="Stlc.html#19766" class="Bound"
      >A</a
      ><a name="19767" class="Symbol"
      >}</a
      ><a name="19768"
      > </a
      ><a name="19769" class="Symbol"
      >{</a
      ><a name="19770" href="Stlc.html#19770" class="Bound"
      >B</a
      ><a name="19771" class="Symbol"
      >}</a
      ><a name="19772"
      > </a
      ><a name="19773" class="Symbol"
      >{</a
      ><a name="19774" href="Stlc.html#19774" class="Bound"
      >s</a
      ><a name="19775" class="Symbol"
      >}</a
      ><a name="19776"
      > </a
      ><a name="19777" class="Symbol"
      >{</a
      ><a name="19778" href="Stlc.html#19778" class="Bound"
      >t</a
      ><a name="19779" class="Symbol"
      >}</a
      ><a name="19780"
      >
                </a
      ><a name="19797" class="Symbol"
      >&#8594;</a
      ><a name="19798"
      > </a
      ><a name="19799" href="Stlc.html#19762" class="Bound"
      >&#915;</a
      ><a name="19800"
      > </a
      ><a name="19801" href="Stlc.html#19490" class="Datatype Operator"
      >&#8866;</a
      ><a name="19802"
      > </a
      ><a name="19803" href="Stlc.html#19774" class="Bound"
      >s</a
      ><a name="19804"
      > </a
      ><a name="19805" href="Stlc.html#19490" class="Datatype Operator"
      >&#8758;</a
      ><a name="19806"
      > </a
      ><a name="19807" href="Stlc.html#19766" class="Bound"
      >A</a
      ><a name="19808"
      > </a
      ><a name="19809" href="Stlc.html#5552" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="19810"
      > </a
      ><a name="19811" href="Stlc.html#19770" class="Bound"
      >B</a
      ><a name="19812"
      >
                </a
      ><a name="19829" class="Symbol"
      >&#8594;</a
      ><a name="19830"
      > </a
      ><a name="19831" href="Stlc.html#19762" class="Bound"
      >&#915;</a
      ><a name="19832"
      > </a
      ><a name="19833" href="Stlc.html#19490" class="Datatype Operator"
      >&#8866;</a
      ><a name="19834"
      > </a
      ><a name="19835" href="Stlc.html#19778" class="Bound"
      >t</a
      ><a name="19836"
      > </a
      ><a name="19837" href="Stlc.html#19490" class="Datatype Operator"
      >&#8758;</a
      ><a name="19838"
      > </a
      ><a name="19839" href="Stlc.html#19766" class="Bound"
      >A</a
      ><a name="19840"
      >
                </a
      ><a name="19857" class="Symbol"
      >&#8594;</a
      ><a name="19858"
      > </a
      ><a name="19859" href="Stlc.html#19762" class="Bound"
      >&#915;</a
      ><a name="19860"
      > </a
      ><a name="19861" href="Stlc.html#19490" class="Datatype Operator"
      >&#8866;</a
      ><a name="19862"
      > </a
      ><a name="19863" href="Stlc.html#6061" class="InductiveConstructor"
      >app</a
      ><a name="19866"
      > </a
      ><a name="19867" href="Stlc.html#19774" class="Bound"
      >s</a
      ><a name="19868"
      > </a
      ><a name="19869" href="Stlc.html#19778" class="Bound"
      >t</a
      ><a name="19870"
      > </a
      ><a name="19871" href="Stlc.html#19490" class="Datatype Operator"
      >&#8758;</a
      ><a name="19872"
      > </a
      ><a name="19873" href="Stlc.html#19770" class="Bound"
      >B</a
      ><a name="19874"
      >
  </a
      ><a name="19877" href="Stlc.html#19877" class="InductiveConstructor"
      >true</a
      ><a name="19881"
      >          </a
      ><a name="19891" class="Symbol"
      >:</a
      ><a name="19892"
      > </a
      ><a name="19893" class="Symbol"
      >&#8704;</a
      ><a name="19894"
      > </a
      ><a name="19895" class="Symbol"
      >{</a
      ><a name="19896" href="Stlc.html#19896" class="Bound"
      >&#915;</a
      ><a name="19897" class="Symbol"
      >}</a
      ><a name="19898"
      >
                </a
      ><a name="19915" class="Symbol"
      >&#8594;</a
      ><a name="19916"
      > </a
      ><a name="19917" href="Stlc.html#19896" class="Bound"
      >&#915;</a
      ><a name="19918"
      > </a
      ><a name="19919" href="Stlc.html#19490" class="Datatype Operator"
      >&#8866;</a
      ><a name="19920"
      > </a
      ><a name="19921" href="Stlc.html#6124" class="InductiveConstructor"
      >true</a
      ><a name="19925"
      >  </a
      ><a name="19927" href="Stlc.html#19490" class="Datatype Operator"
      >&#8758;</a
      ><a name="19928"
      > </a
      ><a name="19929" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="19933"
      >
  </a
      ><a name="19936" href="Stlc.html#19936" class="InductiveConstructor"
      >false</a
      ><a name="19941"
      >         </a
      ><a name="19950" class="Symbol"
      >:</a
      ><a name="19951"
      > </a
      ><a name="19952" class="Symbol"
      >&#8704;</a
      ><a name="19953"
      > </a
      ><a name="19954" class="Symbol"
      >{</a
      ><a name="19955" href="Stlc.html#19955" class="Bound"
      >&#915;</a
      ><a name="19956" class="Symbol"
      >}</a
      ><a name="19957"
      >
                </a
      ><a name="19974" class="Symbol"
      >&#8594;</a
      ><a name="19975"
      > </a
      ><a name="19976" href="Stlc.html#19955" class="Bound"
      >&#915;</a
      ><a name="19977"
      > </a
      ><a name="19978" href="Stlc.html#19490" class="Datatype Operator"
      >&#8866;</a
      ><a name="19979"
      > </a
      ><a name="19980" href="Stlc.html#6139" class="InductiveConstructor"
      >false</a
      ><a name="19985"
      > </a
      ><a name="19986" href="Stlc.html#19490" class="Datatype Operator"
      >&#8758;</a
      ><a name="19987"
      > </a
      ><a name="19988" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="19992"
      >
  </a
      ><a name="19995" href="Stlc.html#19995" class="InductiveConstructor Operator"
      >if_then_else_</a
      ><a name="20008"
      > </a
      ><a name="20009" class="Symbol"
      >:</a
      ><a name="20010"
      > </a
      ><a name="20011" class="Symbol"
      >&#8704;</a
      ><a name="20012"
      > </a
      ><a name="20013" class="Symbol"
      >{</a
      ><a name="20014" href="Stlc.html#20014" class="Bound"
      >&#915;</a
      ><a name="20015" class="Symbol"
      >}</a
      ><a name="20016"
      > </a
      ><a name="20017" class="Symbol"
      >{</a
      ><a name="20018" href="Stlc.html#20018" class="Bound"
      >s</a
      ><a name="20019" class="Symbol"
      >}</a
      ><a name="20020"
      > </a
      ><a name="20021" class="Symbol"
      >{</a
      ><a name="20022" href="Stlc.html#20022" class="Bound"
      >t</a
      ><a name="20023" class="Symbol"
      >}</a
      ><a name="20024"
      > </a
      ><a name="20025" class="Symbol"
      >{</a
      ><a name="20026" href="Stlc.html#20026" class="Bound"
      >u</a
      ><a name="20027" class="Symbol"
      >}</a
      ><a name="20028"
      > </a
      ><a name="20029" class="Symbol"
      >{</a
      ><a name="20030" href="Stlc.html#20030" class="Bound"
      >A</a
      ><a name="20031" class="Symbol"
      >}</a
      ><a name="20032"
      >
                </a
      ><a name="20049" class="Symbol"
      >&#8594;</a
      ><a name="20050"
      > </a
      ><a name="20051" href="Stlc.html#20014" class="Bound"
      >&#915;</a
      ><a name="20052"
      > </a
      ><a name="20053" href="Stlc.html#19490" class="Datatype Operator"
      >&#8866;</a
      ><a name="20054"
      > </a
      ><a name="20055" href="Stlc.html#20018" class="Bound"
      >s</a
      ><a name="20056"
      > </a
      ><a name="20057" href="Stlc.html#19490" class="Datatype Operator"
      >&#8758;</a
      ><a name="20058"
      > </a
      ><a name="20059" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="20063"
      >
                </a
      ><a name="20080" class="Symbol"
      >&#8594;</a
      ><a name="20081"
      > </a
      ><a name="20082" href="Stlc.html#20014" class="Bound"
      >&#915;</a
      ><a name="20083"
      > </a
      ><a name="20084" href="Stlc.html#19490" class="Datatype Operator"
      >&#8866;</a
      ><a name="20085"
      > </a
      ><a name="20086" href="Stlc.html#20022" class="Bound"
      >t</a
      ><a name="20087"
      > </a
      ><a name="20088" href="Stlc.html#19490" class="Datatype Operator"
      >&#8758;</a
      ><a name="20089"
      > </a
      ><a name="20090" href="Stlc.html#20030" class="Bound"
      >A</a
      ><a name="20091"
      >
                </a
      ><a name="20108" class="Symbol"
      >&#8594;</a
      ><a name="20109"
      > </a
      ><a name="20110" href="Stlc.html#20014" class="Bound"
      >&#915;</a
      ><a name="20111"
      > </a
      ><a name="20112" href="Stlc.html#19490" class="Datatype Operator"
      >&#8866;</a
      ><a name="20113"
      > </a
      ><a name="20114" href="Stlc.html#20026" class="Bound"
      >u</a
      ><a name="20115"
      > </a
      ><a name="20116" href="Stlc.html#19490" class="Datatype Operator"
      >&#8758;</a
      ><a name="20117"
      > </a
      ><a name="20118" href="Stlc.html#20030" class="Bound"
      >A</a
      ><a name="20119"
      >
                </a
      ><a name="20136" class="Symbol"
      >&#8594;</a
      ><a name="20137"
      > </a
      ><a name="20138" href="Stlc.html#20014" class="Bound"
      >&#915;</a
      ><a name="20139"
      > </a
      ><a name="20140" href="Stlc.html#19490" class="Datatype Operator"
      >&#8866;</a
      ><a name="20141"
      > </a
      ><a name="20142" href="Stlc.html#6154" class="InductiveConstructor Operator"
      >if</a
      ><a name="20144"
      > </a
      ><a name="20145" href="Stlc.html#20018" class="Bound"
      >s</a
      ><a name="20146"
      > </a
      ><a name="20147" href="Stlc.html#6154" class="InductiveConstructor Operator"
      >then</a
      ><a name="20151"
      > </a
      ><a name="20152" href="Stlc.html#20022" class="Bound"
      >t</a
      ><a name="20153"
      > </a
      ><a name="20154" href="Stlc.html#6154" class="InductiveConstructor Operator"
      >else</a
      ><a name="20158"
      > </a
      ><a name="20159" href="Stlc.html#20026" class="Bound"
      >u</a
      ><a name="20160"
      > </a
      ><a name="20161" href="Stlc.html#19490" class="Datatype Operator"
      >&#8758;</a
      ><a name="20162"
      > </a
      ><a name="20163" href="Stlc.html#20030" class="Bound"
      >A</a
      ><a name="20164"
      >

</a
      ><a name="20166" class="Keyword"
      >infix</a
      ><a name="20171"
      > </a
      ><a name="20172" class="Number"
      >1</a
      >
{% endraw %}</pre>

### Examples

<pre class="Agda">{% raw %}
<a name="20219" href="Stlc.html#20219" class="Function"
      >typing-example1</a
      ><a name="20234"
      > </a
      ><a name="20235" class="Symbol"
      >:</a
      ><a name="20236"
      > </a
      ><a name="20237" href="Stlc.html#18519" class="Function"
      >&#8709;</a
      ><a name="20238"
      > </a
      ><a name="20239" href="Stlc.html#19490" class="Datatype Operator"
      >&#8866;</a
      ><a name="20240"
      > </a
      ><a name="20241" href="Stlc.html#6852" class="Function"
      >idB</a
      ><a name="20244"
      > </a
      ><a name="20245" href="Stlc.html#19490" class="Datatype Operator"
      >&#8758;</a
      ><a name="20246"
      > </a
      ><a name="20247" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="20251"
      > </a
      ><a name="20252" href="Stlc.html#5552" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="20253"
      > </a
      ><a name="20254" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="20258"
      >
</a
      ><a name="20259" href="Stlc.html#20219" class="Function"
      >typing-example1</a
      ><a name="20274"
      > </a
      ><a name="20275" class="Symbol"
      >=</a
      ><a name="20276"
      > </a
      ><a name="20277" href="Stlc.html#19627" class="InductiveConstructor"
      >abs</a
      ><a name="20280"
      > </a
      ><a name="20281" class="Symbol"
      >(</a
      ><a name="20282" href="Stlc.html#19534" class="InductiveConstructor"
      >var</a
      ><a name="20285"
      > </a
      ><a name="20286" href="Stlc.html#6621" class="Function"
      >x</a
      ><a name="20287"
      > </a
      ><a name="20288" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="20292" class="Symbol"
      >)</a
      >
{% endraw %}</pre>

Another example:

$$\varnothing\vdash \lambda x:A. \lambda y:A\rightarrow A. y\;(y\;x) : A\rightarrow (A\rightarrow A)\rightarrow A$$.

<pre class="Agda">{% raw %}
<a name="20455" href="Stlc.html#20455" class="Function"
      >typing-example2</a
      ><a name="20470"
      > </a
      ><a name="20471" class="Symbol"
      >:</a
      ><a name="20472"
      > </a
      ><a name="20473" href="Stlc.html#18519" class="Function"
      >&#8709;</a
      ><a name="20474"
      > </a
      ><a name="20475" href="Stlc.html#19490" class="Datatype Operator"
      >&#8866;</a
      ><a name="20476"
      >
  </a
      ><a name="20479" class="Symbol"
      >(</a
      ><a name="20480" href="Stlc.html#6090" class="InductiveConstructor"
      >abs</a
      ><a name="20483"
      > </a
      ><a name="20484" href="Stlc.html#6621" class="Function"
      >x</a
      ><a name="20485"
      > </a
      ><a name="20486" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="20490"
      >
    </a
      ><a name="20495" class="Symbol"
      >(</a
      ><a name="20496" href="Stlc.html#6090" class="InductiveConstructor"
      >abs</a
      ><a name="20499"
      > </a
      ><a name="20500" href="Stlc.html#6630" class="Function"
      >y</a
      ><a name="20501"
      > </a
      ><a name="20502" class="Symbol"
      >(</a
      ><a name="20503" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="20507"
      > </a
      ><a name="20508" href="Stlc.html#5552" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="20509"
      > </a
      ><a name="20510" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="20514" class="Symbol"
      >)</a
      ><a name="20515"
      >
      </a
      ><a name="20522" class="Symbol"
      >(</a
      ><a name="20523" href="Stlc.html#6061" class="InductiveConstructor"
      >app</a
      ><a name="20526"
      > </a
      ><a name="20527" class="Symbol"
      >(</a
      ><a name="20528" href="Stlc.html#6041" class="InductiveConstructor"
      >var</a
      ><a name="20531"
      > </a
      ><a name="20532" href="Stlc.html#6630" class="Function"
      >y</a
      ><a name="20533" class="Symbol"
      >)</a
      ><a name="20534"
      >
        </a
      ><a name="20543" class="Symbol"
      >(</a
      ><a name="20544" href="Stlc.html#6061" class="InductiveConstructor"
      >app</a
      ><a name="20547"
      > </a
      ><a name="20548" class="Symbol"
      >(</a
      ><a name="20549" href="Stlc.html#6041" class="InductiveConstructor"
      >var</a
      ><a name="20552"
      > </a
      ><a name="20553" href="Stlc.html#6630" class="Function"
      >y</a
      ><a name="20554" class="Symbol"
      >)</a
      ><a name="20555"
      > </a
      ><a name="20556" class="Symbol"
      >(</a
      ><a name="20557" href="Stlc.html#6041" class="InductiveConstructor"
      >var</a
      ><a name="20560"
      > </a
      ><a name="20561" href="Stlc.html#6621" class="Function"
      >x</a
      ><a name="20562" class="Symbol"
      >)))))</a
      ><a name="20567"
      > </a
      ><a name="20568" href="Stlc.html#19490" class="Datatype Operator"
      >&#8758;</a
      ><a name="20569"
      >
  </a
      ><a name="20572" class="Symbol"
      >(</a
      ><a name="20573" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="20577"
      > </a
      ><a name="20578" href="Stlc.html#5552" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="20579"
      > </a
      ><a name="20580" class="Symbol"
      >(</a
      ><a name="20581" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="20585"
      > </a
      ><a name="20586" href="Stlc.html#5552" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="20587"
      > </a
      ><a name="20588" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="20592" class="Symbol"
      >)</a
      ><a name="20593"
      > </a
      ><a name="20594" href="Stlc.html#5552" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="20595"
      > </a
      ><a name="20596" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="20600" class="Symbol"
      >)</a
      ><a name="20601"
      >
</a
      ><a name="20602" href="Stlc.html#20455" class="Function"
      >typing-example2</a
      ><a name="20617"
      > </a
      ><a name="20618" class="Symbol"
      >=</a
      ><a name="20619"
      >
  </a
      ><a name="20622" class="Symbol"
      >(</a
      ><a name="20623" href="Stlc.html#19627" class="InductiveConstructor"
      >abs</a
      ><a name="20626"
      >
    </a
      ><a name="20631" class="Symbol"
      >(</a
      ><a name="20632" href="Stlc.html#19627" class="InductiveConstructor"
      >abs</a
      ><a name="20635"
      >
      </a
      ><a name="20642" class="Symbol"
      >(</a
      ><a name="20643" href="Stlc.html#19743" class="InductiveConstructor"
      >app</a
      ><a name="20646"
      > </a
      ><a name="20647" class="Symbol"
      >(</a
      ><a name="20648" href="Stlc.html#19534" class="InductiveConstructor"
      >var</a
      ><a name="20651"
      > </a
      ><a name="20652" href="Stlc.html#6630" class="Function"
      >y</a
      ><a name="20653"
      > </a
      ><a name="20654" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="20658" class="Symbol"
      >)</a
      ><a name="20659"
      >
        </a
      ><a name="20668" class="Symbol"
      >(</a
      ><a name="20669" href="Stlc.html#19743" class="InductiveConstructor"
      >app</a
      ><a name="20672"
      > </a
      ><a name="20673" class="Symbol"
      >(</a
      ><a name="20674" href="Stlc.html#19534" class="InductiveConstructor"
      >var</a
      ><a name="20677"
      > </a
      ><a name="20678" href="Stlc.html#6630" class="Function"
      >y</a
      ><a name="20679"
      > </a
      ><a name="20680" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="20684" class="Symbol"
      >)</a
      ><a name="20685"
      > </a
      ><a name="20686" class="Symbol"
      >(</a
      ><a name="20687" href="Stlc.html#19534" class="InductiveConstructor"
      >var</a
      ><a name="20690"
      > </a
      ><a name="20691" href="Stlc.html#6621" class="Function"
      >x</a
      ><a name="20692"
      > </a
      ><a name="20693" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="20697" class="Symbol"
      >)</a
      ><a name="20698"
      > </a
      ><a name="20699" class="Symbol"
      >))))</a
      >
{% endraw %}</pre>

#### Exercise: 2 stars (typing-example3)
Formally prove the following typing derivation holds:

$$\exists A, \varnothing\vdash \lambda x:bool\rightarrow B. \lambda y:bool\rightarrow bool. \lambda z:bool. y\;(x\;z) : A$$.

<pre class="Agda">{% raw %}
<a name="20951" href="Stlc.html#20951" class="Function"
      >typing-example3</a
      ><a name="20966"
      > </a
      ><a name="20967" class="Symbol"
      >:</a
      ><a name="20968"
      > </a
      ><a name="20969" href="https://agda.github.io/agda-stdlib/Data.Product.html#823" class="Function"
      >&#8707;</a
      ><a name="20970"
      > </a
      ><a name="20971" class="Symbol"
      >&#955;</a
      ><a name="20972"
      > </a
      ><a name="20973" href="Stlc.html#20973" class="Bound"
      >A</a
      ><a name="20974"
      > </a
      ><a name="20975" class="Symbol"
      >&#8594;</a
      ><a name="20976"
      > </a
      ><a name="20977" href="Stlc.html#18519" class="Function"
      >&#8709;</a
      ><a name="20978"
      > </a
      ><a name="20979" href="Stlc.html#19490" class="Datatype Operator"
      >&#8866;</a
      ><a name="20980"
      >
  </a
      ><a name="20983" class="Symbol"
      >(</a
      ><a name="20984" href="Stlc.html#6090" class="InductiveConstructor"
      >abs</a
      ><a name="20987"
      > </a
      ><a name="20988" href="Stlc.html#6621" class="Function"
      >x</a
      ><a name="20989"
      > </a
      ><a name="20990" class="Symbol"
      >(</a
      ><a name="20991" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="20995"
      > </a
      ><a name="20996" href="Stlc.html#5552" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="20997"
      > </a
      ><a name="20998" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="21002" class="Symbol"
      >)</a
      ><a name="21003"
      >
    </a
      ><a name="21008" class="Symbol"
      >(</a
      ><a name="21009" href="Stlc.html#6090" class="InductiveConstructor"
      >abs</a
      ><a name="21012"
      > </a
      ><a name="21013" href="Stlc.html#6630" class="Function"
      >y</a
      ><a name="21014"
      > </a
      ><a name="21015" class="Symbol"
      >(</a
      ><a name="21016" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="21020"
      > </a
      ><a name="21021" href="Stlc.html#5552" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="21022"
      > </a
      ><a name="21023" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="21027" class="Symbol"
      >)</a
      ><a name="21028"
      >
      </a
      ><a name="21035" class="Symbol"
      >(</a
      ><a name="21036" href="Stlc.html#6090" class="InductiveConstructor"
      >abs</a
      ><a name="21039"
      > </a
      ><a name="21040" href="Stlc.html#6639" class="Function"
      >z</a
      ><a name="21041"
      > </a
      ><a name="21042" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="21046"
      >
        </a
      ><a name="21055" class="Symbol"
      >(</a
      ><a name="21056" href="Stlc.html#6061" class="InductiveConstructor"
      >app</a
      ><a name="21059"
      > </a
      ><a name="21060" class="Symbol"
      >(</a
      ><a name="21061" href="Stlc.html#6041" class="InductiveConstructor"
      >var</a
      ><a name="21064"
      > </a
      ><a name="21065" href="Stlc.html#6630" class="Function"
      >y</a
      ><a name="21066" class="Symbol"
      >)</a
      ><a name="21067"
      > </a
      ><a name="21068" class="Symbol"
      >(</a
      ><a name="21069" href="Stlc.html#6061" class="InductiveConstructor"
      >app</a
      ><a name="21072"
      > </a
      ><a name="21073" class="Symbol"
      >(</a
      ><a name="21074" href="Stlc.html#6041" class="InductiveConstructor"
      >var</a
      ><a name="21077"
      > </a
      ><a name="21078" href="Stlc.html#6621" class="Function"
      >x</a
      ><a name="21079" class="Symbol"
      >)</a
      ><a name="21080"
      > </a
      ><a name="21081" class="Symbol"
      >(</a
      ><a name="21082" href="Stlc.html#6041" class="InductiveConstructor"
      >var</a
      ><a name="21085"
      > </a
      ><a name="21086" href="Stlc.html#6639" class="Function"
      >z</a
      ><a name="21087" class="Symbol"
      >))))))</a
      ><a name="21093"
      > </a
      ><a name="21094" href="Stlc.html#19490" class="Datatype Operator"
      >&#8758;</a
      ><a name="21095"
      > </a
      ><a name="21096" href="Stlc.html#20973" class="Bound"
      >A</a
      ><a name="21097"
      >
</a
      ><a name="21098" href="Stlc.html#20951" class="Function"
      >typing-example3</a
      ><a name="21113"
      > </a
      ><a name="21114" class="Symbol"
      >=</a
      ><a name="21115"
      > </a
      ><a name="21116" class="Symbol"
      >{!!}</a
      ><a name="21120"
      > </a
      ><a name="21121" class="Comment"
      >-- FILL IN HERE</a
      >
{% endraw %}</pre>

We can also show that terms are _not_ typable.  For example, let's
formally check that there is no typing derivation assigning a type
to the term $$\lambda x:bool. \lambda y:bool. x\;y$$---i.e.,


$$\nexists A, \varnothing\vdash \lambda x:bool. \lambda y:bool. x\;y : A$$.

<pre class="Agda">{% raw %}
<a name="21436" href="Stlc.html#21436" class="Function"
      >typing-nonexample1</a
      ><a name="21454"
      > </a
      ><a name="21455" class="Symbol"
      >:</a
      ><a name="21456"
      > </a
      ><a name="21457" href="https://agda.github.io/agda-stdlib/Data.Product.html#884" class="Function"
      >&#8708;</a
      ><a name="21458"
      > </a
      ><a name="21459" class="Symbol"
      >&#955;</a
      ><a name="21460"
      > </a
      ><a name="21461" href="Stlc.html#21461" class="Bound"
      >A</a
      ><a name="21462"
      > </a
      ><a name="21463" class="Symbol"
      >&#8594;</a
      ><a name="21464"
      > </a
      ><a name="21465" href="Stlc.html#18519" class="Function"
      >&#8709;</a
      ><a name="21466"
      > </a
      ><a name="21467" href="Stlc.html#19490" class="Datatype Operator"
      >&#8866;</a
      ><a name="21468"
      >
  </a
      ><a name="21471" class="Symbol"
      >(</a
      ><a name="21472" href="Stlc.html#6090" class="InductiveConstructor"
      >abs</a
      ><a name="21475"
      > </a
      ><a name="21476" href="Stlc.html#6621" class="Function"
      >x</a
      ><a name="21477"
      > </a
      ><a name="21478" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="21482"
      >
    </a
      ><a name="21487" class="Symbol"
      >(</a
      ><a name="21488" href="Stlc.html#6090" class="InductiveConstructor"
      >abs</a
      ><a name="21491"
      > </a
      ><a name="21492" href="Stlc.html#6630" class="Function"
      >y</a
      ><a name="21493"
      > </a
      ><a name="21494" href="Stlc.html#5538" class="InductiveConstructor"
      >bool</a
      ><a name="21498"
      >
      </a
      ><a name="21505" class="Symbol"
      >(</a
      ><a name="21506" href="Stlc.html#6061" class="InductiveConstructor"
      >app</a
      ><a name="21509"
      > </a
      ><a name="21510" class="Symbol"
      >(</a
      ><a name="21511" href="Stlc.html#6041" class="InductiveConstructor"
      >var</a
      ><a name="21514"
      > </a
      ><a name="21515" href="Stlc.html#6621" class="Function"
      >x</a
      ><a name="21516" class="Symbol"
      >)</a
      ><a name="21517"
      > </a
      ><a name="21518" class="Symbol"
      >(</a
      ><a name="21519" href="Stlc.html#6041" class="InductiveConstructor"
      >var</a
      ><a name="21522"
      > </a
      ><a name="21523" href="Stlc.html#6630" class="Function"
      >y</a
      ><a name="21524" class="Symbol"
      >))))</a
      ><a name="21528"
      > </a
      ><a name="21529" href="Stlc.html#19490" class="Datatype Operator"
      >&#8758;</a
      ><a name="21530"
      > </a
      ><a name="21531" href="Stlc.html#21461" class="Bound"
      >A</a
      ><a name="21532"
      >
</a
      ><a name="21533" href="Stlc.html#21436" class="Function"
      >typing-nonexample1</a
      ><a name="21551"
      > </a
      ><a name="21552" class="Symbol"
      >=</a
      ><a name="21553"
      > </a
      ><a name="21554" class="Symbol"
      >{!!}</a
      ><a name="21558"
      > </a
      ><a name="21559" class="Comment"
      >-- FILL IN HERE</a
      >
{% endraw %}</pre>

#### Exercise: 3 stars, optional (typing-nonexample2)
Another nonexample:

$$\nexists A, \exists B, \varnothing\vdash \lambda x:A. x\;x : B$$.

<pre class="Agda">{% raw %}
<a name="21744" href="Stlc.html#21744" class="Function"
      >typing-nonexample2</a
      ><a name="21762"
      > </a
      ><a name="21763" class="Symbol"
      >:</a
      ><a name="21764"
      > </a
      ><a name="21765" href="https://agda.github.io/agda-stdlib/Data.Product.html#884" class="Function"
      >&#8708;</a
      ><a name="21766"
      > </a
      ><a name="21767" class="Symbol"
      >&#955;</a
      ><a name="21768"
      > </a
      ><a name="21769" href="Stlc.html#21769" class="Bound"
      >A</a
      ><a name="21770"
      > </a
      ><a name="21771" class="Symbol"
      >&#8594;</a
      ><a name="21772"
      > </a
      ><a name="21773" href="https://agda.github.io/agda-stdlib/Data.Product.html#823" class="Function"
      >&#8707;</a
      ><a name="21774"
      > </a
      ><a name="21775" class="Symbol"
      >&#955;</a
      ><a name="21776"
      > </a
      ><a name="21777" href="Stlc.html#21777" class="Bound"
      >B</a
      ><a name="21778"
      > </a
      ><a name="21779" class="Symbol"
      >&#8594;</a
      ><a name="21780"
      > </a
      ><a name="21781" href="Stlc.html#18519" class="Function"
      >&#8709;</a
      ><a name="21782"
      > </a
      ><a name="21783" href="Stlc.html#19490" class="Datatype Operator"
      >&#8866;</a
      ><a name="21784"
      >
  </a
      ><a name="21787" class="Symbol"
      >(</a
      ><a name="21788" href="Stlc.html#6090" class="InductiveConstructor"
      >abs</a
      ><a name="21791"
      > </a
      ><a name="21792" href="Stlc.html#6621" class="Function"
      >x</a
      ><a name="21793"
      > </a
      ><a name="21794" href="Stlc.html#21777" class="Bound"
      >B</a
      ><a name="21795"
      > </a
      ><a name="21796" class="Symbol"
      >(</a
      ><a name="21797" href="Stlc.html#6061" class="InductiveConstructor"
      >app</a
      ><a name="21800"
      > </a
      ><a name="21801" class="Symbol"
      >(</a
      ><a name="21802" href="Stlc.html#6041" class="InductiveConstructor"
      >var</a
      ><a name="21805"
      > </a
      ><a name="21806" href="Stlc.html#6621" class="Function"
      >x</a
      ><a name="21807" class="Symbol"
      >)</a
      ><a name="21808"
      > </a
      ><a name="21809" class="Symbol"
      >(</a
      ><a name="21810" href="Stlc.html#6041" class="InductiveConstructor"
      >var</a
      ><a name="21813"
      > </a
      ><a name="21814" href="Stlc.html#6621" class="Function"
      >x</a
      ><a name="21815" class="Symbol"
      >)))</a
      ><a name="21818"
      > </a
      ><a name="21819" href="Stlc.html#19490" class="Datatype Operator"
      >&#8758;</a
      ><a name="21820"
      > </a
      ><a name="21821" href="Stlc.html#21769" class="Bound"
      >A</a
      ><a name="21822"
      >
</a
      ><a name="21823" href="Stlc.html#21744" class="Function"
      >typing-nonexample2</a
      ><a name="21841"
      > </a
      ><a name="21842" class="Symbol"
      >=</a
      ><a name="21843"
      > </a
      ><a name="21844" class="Symbol"
      >{!!}</a
      ><a name="21848"
      > </a
      ><a name="21849" class="Comment"
      >-- FILL IN HERE</a
      >
{% endraw %}</pre>
