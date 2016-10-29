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
<a name="256" class="Symbol"
      >{-#</a
      ><a name="259"
      > </a
      ><a name="260" class="Keyword"
      >OPTIONS</a
      ><a name="267"
      > --allow-unsolved-metas </a
      ><a name="291" class="Symbol"
      >#-}</a
      >
{% endraw %}</pre>
</div>

<pre class="Agda">{% raw %}
<a name="327" class="Keyword"
      >module</a
      ><a name="333"
      > </a
      ><a name="334" href="Stlc.html#1" class="Module"
      >Stlc</a
      ><a name="338"
      > </a
      ><a name="339" class="Keyword"
      >where</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="391" class="Keyword"
      >open</a
      ><a name="395"
      > </a
      ><a name="396" class="Keyword"
      >import</a
      ><a name="402"
      > </a
      ><a name="403" href="https://agda.github.io/agda-stdlib/Data.Empty.html#1" class="Module"
      >Data.Empty</a
      ><a name="413"
      > </a
      ><a name="414" class="Keyword"
      >using</a
      ><a name="419"
      > </a
      ><a name="420" class="Symbol"
      >(</a
      ><a name="421" href="https://agda.github.io/agda-stdlib/Data.Empty.html#243" class="Datatype"
      >&#8869;</a
      ><a name="422" class="Symbol"
      >;</a
      ><a name="423"
      > </a
      ><a name="424" href="https://agda.github.io/agda-stdlib/Data.Empty.html#348" class="Function"
      >&#8869;-elim</a
      ><a name="430" class="Symbol"
      >)</a
      ><a name="431"
      >
</a
      ><a name="432" class="Keyword"
      >open</a
      ><a name="436"
      > </a
      ><a name="437" class="Keyword"
      >import</a
      ><a name="443"
      > </a
      ><a name="444" href="https://agda.github.io/agda-stdlib/Data.Maybe.html#1" class="Module"
      >Data.Maybe</a
      ><a name="454"
      > </a
      ><a name="455" class="Keyword"
      >using</a
      ><a name="460"
      > </a
      ><a name="461" class="Symbol"
      >(</a
      ><a name="462" href="https://agda.github.io/agda-stdlib/Data.Maybe.Base.html#335" class="Datatype"
      >Maybe</a
      ><a name="467" class="Symbol"
      >;</a
      ><a name="468"
      > </a
      ><a name="469" href="https://agda.github.io/agda-stdlib/Data.Maybe.html#1527" class="InductiveConstructor"
      >just</a
      ><a name="473" class="Symbol"
      >;</a
      ><a name="474"
      > </a
      ><a name="475" href="https://agda.github.io/agda-stdlib/Data.Maybe.html#1588" class="InductiveConstructor"
      >nothing</a
      ><a name="482" class="Symbol"
      >)</a
      ><a name="483"
      >
</a
      ><a name="484" class="Keyword"
      >open</a
      ><a name="488"
      > </a
      ><a name="489" class="Keyword"
      >import</a
      ><a name="495"
      > </a
      ><a name="496" href="https://agda.github.io/agda-stdlib/Data.Nat.html#1" class="Module"
      >Data.Nat</a
      ><a name="504"
      > </a
      ><a name="505" class="Keyword"
      >using</a
      ><a name="510"
      > </a
      ><a name="511" class="Symbol"
      >(</a
      ><a name="512" href="Agda.Builtin.Nat.html#69" class="Datatype"
      >&#8469;</a
      ><a name="513" class="Symbol"
      >;</a
      ><a name="514"
      > </a
      ><a name="515" href="Agda.Builtin.Nat.html#100" class="InductiveConstructor"
      >suc</a
      ><a name="518" class="Symbol"
      >;</a
      ><a name="519"
      > </a
      ><a name="520" href="Agda.Builtin.Nat.html#87" class="InductiveConstructor"
      >zero</a
      ><a name="524" class="Symbol"
      >;</a
      ><a name="525"
      > </a
      ><a name="526" href="Agda.Builtin.Nat.html#202" class="Primitive Operator"
      >_+_</a
      ><a name="529" class="Symbol"
      >)</a
      ><a name="530"
      >
</a
      ><a name="531" class="Keyword"
      >open</a
      ><a name="535"
      > </a
      ><a name="536" class="Keyword"
      >import</a
      ><a name="542"
      > </a
      ><a name="543" href="https://agda.github.io/agda-stdlib/Data.Product.html#1" class="Module"
      >Data.Product</a
      ><a name="555"
      > </a
      ><a name="556" class="Keyword"
      >using</a
      ><a name="561"
      > </a
      ><a name="562" class="Symbol"
      >(</a
      ><a name="563" href="https://agda.github.io/agda-stdlib/Data.Product.html#823" class="Function"
      >&#8707;</a
      ><a name="564" class="Symbol"
      >;</a
      ><a name="565"
      > </a
      ><a name="566" href="https://agda.github.io/agda-stdlib/Data.Product.html#884" class="Function"
      >&#8708;</a
      ><a name="567" class="Symbol"
      >;</a
      ><a name="568"
      > </a
      ><a name="569" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >_,_</a
      ><a name="572" class="Symbol"
      >)</a
      ><a name="573"
      >
</a
      ><a name="574" class="Keyword"
      >open</a
      ><a name="578"
      > </a
      ><a name="579" class="Keyword"
      >import</a
      ><a name="585"
      > </a
      ><a name="586" href="https://agda.github.io/agda-stdlib/Function.html#1" class="Module"
      >Function</a
      ><a name="594"
      > </a
      ><a name="595" class="Keyword"
      >using</a
      ><a name="600"
      > </a
      ><a name="601" class="Symbol"
      >(</a
      ><a name="602" href="https://agda.github.io/agda-stdlib/Function.html#713" class="Function Operator"
      >_&#8728;_</a
      ><a name="605" class="Symbol"
      >;</a
      ><a name="606"
      > </a
      ><a name="607" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >_$_</a
      ><a name="610" class="Symbol"
      >)</a
      ><a name="611"
      >
</a
      ><a name="612" class="Keyword"
      >open</a
      ><a name="616"
      > </a
      ><a name="617" class="Keyword"
      >import</a
      ><a name="623"
      > </a
      ><a name="624" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#1" class="Module"
      >Relation.Nullary</a
      ><a name="640"
      > </a
      ><a name="641" class="Keyword"
      >using</a
      ><a name="646"
      > </a
      ><a name="647" class="Symbol"
      >(</a
      ><a name="648" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#484" class="Datatype"
      >Dec</a
      ><a name="651" class="Symbol"
      >;</a
      ><a name="652"
      > </a
      ><a name="653" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="656" class="Symbol"
      >;</a
      ><a name="657"
      > </a
      ><a name="658" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="660" class="Symbol"
      >)</a
      ><a name="661"
      >
</a
      ><a name="662" class="Keyword"
      >open</a
      ><a name="666"
      > </a
      ><a name="667" class="Keyword"
      >import</a
      ><a name="673"
      > </a
      ><a name="674" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.html#1" class="Module"
      >Relation.Binary.PropositionalEquality</a
      ><a name="711"
      > </a
      ><a name="712" class="Keyword"
      >using</a
      ><a name="717"
      > </a
      ><a name="718" class="Symbol"
      >(</a
      ><a name="719" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >_&#8801;_</a
      ><a name="722" class="Symbol"
      >;</a
      ><a name="723"
      > </a
      ><a name="724" href="https://agda.github.io/agda-stdlib/Relation.Binary.Core.html#4493" class="Function Operator"
      >_&#8802;_</a
      ><a name="727" class="Symbol"
      >;</a
      ><a name="728"
      > </a
      ><a name="729" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="733" class="Symbol"
      >)</a
      >
{% endraw %}</pre>
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

<pre class="Agda">{% raw %}
<a name="5606" class="Keyword"
      >data</a
      ><a name="5610"
      > </a
      ><a name="5611" href="Stlc.html#5611" class="Datatype"
      >Type</a
      ><a name="5615"
      > </a
      ><a name="5616" class="Symbol"
      >:</a
      ><a name="5617"
      > </a
      ><a name="5618" class="PrimitiveType"
      >Set</a
      ><a name="5621"
      > </a
      ><a name="5622" class="Keyword"
      >where</a
      ><a name="5627"
      >
  </a
      ><a name="5630" href="Stlc.html#5630" class="InductiveConstructor"
      >bool</a
      ><a name="5634"
      > </a
      ><a name="5635" class="Symbol"
      >:</a
      ><a name="5636"
      > </a
      ><a name="5637" href="Stlc.html#5611" class="Datatype"
      >Type</a
      ><a name="5641"
      >
  </a
      ><a name="5644" href="Stlc.html#5644" class="InductiveConstructor Operator"
      >_&#8658;_</a
      ><a name="5647"
      >  </a
      ><a name="5649" class="Symbol"
      >:</a
      ><a name="5650"
      > </a
      ><a name="5651" href="Stlc.html#5611" class="Datatype"
      >Type</a
      ><a name="5655"
      > </a
      ><a name="5656" class="Symbol"
      >&#8594;</a
      ><a name="5657"
      > </a
      ><a name="5658" href="Stlc.html#5611" class="Datatype"
      >Type</a
      ><a name="5662"
      > </a
      ><a name="5663" class="Symbol"
      >&#8594;</a
      ><a name="5664"
      > </a
      ><a name="5665" href="Stlc.html#5611" class="Datatype"
      >Type</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="5716" class="Keyword"
      >infixr</a
      ><a name="5722"
      > </a
      ><a name="5723" class="Number"
      >5</a
      >
{% endraw %}</pre>
</div>


### Terms

<pre class="Agda">{% raw %}
<a name="5773" class="Keyword"
      >data</a
      ><a name="5777"
      > </a
      ><a name="5778" href="Stlc.html#5778" class="Datatype"
      >Id</a
      ><a name="5780"
      > </a
      ><a name="5781" class="Symbol"
      >:</a
      ><a name="5782"
      > </a
      ><a name="5783" class="PrimitiveType"
      >Set</a
      ><a name="5786"
      > </a
      ><a name="5787" class="Keyword"
      >where</a
      ><a name="5792"
      >
  </a
      ><a name="5795" href="Stlc.html#5795" class="InductiveConstructor"
      >id</a
      ><a name="5797"
      > </a
      ><a name="5798" class="Symbol"
      >:</a
      ><a name="5799"
      > </a
      ><a name="5800" href="Agda.Builtin.Nat.html#69" class="Datatype"
      >&#8469;</a
      ><a name="5801"
      > </a
      ><a name="5802" class="Symbol"
      >&#8594;</a
      ><a name="5803"
      > </a
      ><a name="5804" href="Stlc.html#5778" class="Datatype"
      >Id</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="5853" href="Stlc.html#5853" class="Function Operator"
      >_&#8799;_</a
      ><a name="5856"
      > </a
      ><a name="5857" class="Symbol"
      >:</a
      ><a name="5858"
      > </a
      ><a name="5859" class="Symbol"
      >(</a
      ><a name="5860" href="Stlc.html#5860" class="Bound"
      >x</a
      ><a name="5861"
      > </a
      ><a name="5862" href="Stlc.html#5862" class="Bound"
      >y</a
      ><a name="5863"
      > </a
      ><a name="5864" class="Symbol"
      >:</a
      ><a name="5865"
      > </a
      ><a name="5866" href="Stlc.html#5778" class="Datatype"
      >Id</a
      ><a name="5868" class="Symbol"
      >)</a
      ><a name="5869"
      > </a
      ><a name="5870" class="Symbol"
      >&#8594;</a
      ><a name="5871"
      > </a
      ><a name="5872" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#484" class="Datatype"
      >Dec</a
      ><a name="5875"
      > </a
      ><a name="5876" class="Symbol"
      >(</a
      ><a name="5877" href="Stlc.html#5860" class="Bound"
      >x</a
      ><a name="5878"
      > </a
      ><a name="5879" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="5880"
      > </a
      ><a name="5881" href="Stlc.html#5862" class="Bound"
      >y</a
      ><a name="5882" class="Symbol"
      >)</a
      ><a name="5883"
      >
</a
      ><a name="5884" href="Stlc.html#5795" class="InductiveConstructor"
      >id</a
      ><a name="5886"
      > </a
      ><a name="5887" href="Stlc.html#5887" class="Bound"
      >x</a
      ><a name="5888"
      > </a
      ><a name="5889" href="Stlc.html#5853" class="Function Operator"
      >&#8799;</a
      ><a name="5890"
      > </a
      ><a name="5891" href="Stlc.html#5795" class="InductiveConstructor"
      >id</a
      ><a name="5893"
      > </a
      ><a name="5894" href="Stlc.html#5894" class="Bound"
      >y</a
      ><a name="5895"
      > </a
      ><a name="5896" class="Keyword"
      >with</a
      ><a name="5900"
      > </a
      ><a name="5901" href="Stlc.html#5887" class="Bound"
      >x</a
      ><a name="5902"
      > </a
      ><a name="5903" href="https://agda.github.io/agda-stdlib/Data.Nat.Base.html#3199" class="Function Operator"
      >Data.Nat.&#8799;</a
      ><a name="5913"
      > </a
      ><a name="5914" href="Stlc.html#5894" class="Bound"
      >y</a
      ><a name="5915"
      >
</a
      ><a name="5916" href="Stlc.html#5795" class="InductiveConstructor"
      >id</a
      ><a name="5918"
      > </a
      ><a name="5919" href="Stlc.html#5919" class="Bound"
      >x</a
      ><a name="5920"
      > </a
      ><a name="5921" href="Stlc.html#5853" class="Function Operator"
      >&#8799;</a
      ><a name="5922"
      > </a
      ><a name="5923" href="Stlc.html#5795" class="InductiveConstructor"
      >id</a
      ><a name="5925"
      > </a
      ><a name="5926" href="Stlc.html#5926" class="Bound"
      >y</a
      ><a name="5927"
      > </a
      ><a name="5928" class="Symbol"
      >|</a
      ><a name="5929"
      > </a
      ><a name="5930" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="5933"
      > </a
      ><a name="5934" href="Stlc.html#5934" class="Bound"
      >x=y</a
      ><a name="5937"
      > </a
      ><a name="5938" class="Keyword"
      >rewrite</a
      ><a name="5945"
      > </a
      ><a name="5946" href="Stlc.html#5934" class="Bound"
      >x=y</a
      ><a name="5949"
      > </a
      ><a name="5950" class="Symbol"
      >=</a
      ><a name="5951"
      > </a
      ><a name="5952" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="5955"
      > </a
      ><a name="5956" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="5960"
      >
</a
      ><a name="5961" href="Stlc.html#5795" class="InductiveConstructor"
      >id</a
      ><a name="5963"
      > </a
      ><a name="5964" href="Stlc.html#5964" class="Bound"
      >x</a
      ><a name="5965"
      > </a
      ><a name="5966" href="Stlc.html#5853" class="Function Operator"
      >&#8799;</a
      ><a name="5967"
      > </a
      ><a name="5968" href="Stlc.html#5795" class="InductiveConstructor"
      >id</a
      ><a name="5970"
      > </a
      ><a name="5971" href="Stlc.html#5971" class="Bound"
      >y</a
      ><a name="5972"
      > </a
      ><a name="5973" class="Symbol"
      >|</a
      ><a name="5974"
      > </a
      ><a name="5975" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="5977"
      >  </a
      ><a name="5979" href="Stlc.html#5979" class="Bound"
      >x&#8800;y</a
      ><a name="5982"
      > </a
      ><a name="5983" class="Symbol"
      >=</a
      ><a name="5984"
      > </a
      ><a name="5985" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="5987"
      > </a
      ><a name="5988" class="Symbol"
      >(</a
      ><a name="5989" href="Stlc.html#5979" class="Bound"
      >x&#8800;y</a
      ><a name="5992"
      > </a
      ><a name="5993" href="https://agda.github.io/agda-stdlib/Function.html#713" class="Function Operator"
      >&#8728;</a
      ><a name="5994"
      > </a
      ><a name="5995" href="Stlc.html#6015" class="Function"
      >id-inj</a
      ><a name="6001" class="Symbol"
      >)</a
      ><a name="6002"
      >
  </a
      ><a name="6005" class="Keyword"
      >where</a
      ><a name="6010"
      >
    </a
      ><a name="6015" href="Stlc.html#6015" class="Function"
      >id-inj</a
      ><a name="6021"
      > </a
      ><a name="6022" class="Symbol"
      >:</a
      ><a name="6023"
      > </a
      ><a name="6024" class="Symbol"
      >&#8704;</a
      ><a name="6025"
      > </a
      ><a name="6026" class="Symbol"
      >{</a
      ><a name="6027" href="Stlc.html#6027" class="Bound"
      >x</a
      ><a name="6028"
      > </a
      ><a name="6029" href="Stlc.html#6029" class="Bound"
      >y</a
      ><a name="6030" class="Symbol"
      >}</a
      ><a name="6031"
      > </a
      ><a name="6032" class="Symbol"
      >&#8594;</a
      ><a name="6033"
      > </a
      ><a name="6034" href="Stlc.html#5795" class="InductiveConstructor"
      >id</a
      ><a name="6036"
      > </a
      ><a name="6037" href="Stlc.html#6027" class="Bound"
      >x</a
      ><a name="6038"
      > </a
      ><a name="6039" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="6040"
      > </a
      ><a name="6041" href="Stlc.html#5795" class="InductiveConstructor"
      >id</a
      ><a name="6043"
      > </a
      ><a name="6044" href="Stlc.html#6029" class="Bound"
      >y</a
      ><a name="6045"
      > </a
      ><a name="6046" class="Symbol"
      >&#8594;</a
      ><a name="6047"
      > </a
      ><a name="6048" href="Stlc.html#6027" class="Bound"
      >x</a
      ><a name="6049"
      > </a
      ><a name="6050" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="6051"
      > </a
      ><a name="6052" href="Stlc.html#6029" class="Bound"
      >y</a
      ><a name="6053"
      >
    </a
      ><a name="6058" href="Stlc.html#6015" class="Function"
      >id-inj</a
      ><a name="6064"
      > </a
      ><a name="6065" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="6069"
      > </a
      ><a name="6070" class="Symbol"
      >=</a
      ><a name="6071"
      > </a
      ><a name="6072" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      >
{% endraw %}</pre>
</div>

<pre class="Agda">{% raw %}
<a name="6109" class="Keyword"
      >data</a
      ><a name="6113"
      > </a
      ><a name="6114" href="Stlc.html#6114" class="Datatype"
      >Term</a
      ><a name="6118"
      > </a
      ><a name="6119" class="Symbol"
      >:</a
      ><a name="6120"
      > </a
      ><a name="6121" class="PrimitiveType"
      >Set</a
      ><a name="6124"
      > </a
      ><a name="6125" class="Keyword"
      >where</a
      ><a name="6130"
      >
  </a
      ><a name="6133" href="Stlc.html#6133" class="InductiveConstructor"
      >var</a
      ><a name="6136"
      >   </a
      ><a name="6139" class="Symbol"
      >:</a
      ><a name="6140"
      > </a
      ><a name="6141" href="Stlc.html#5778" class="Datatype"
      >Id</a
      ><a name="6143"
      > </a
      ><a name="6144" class="Symbol"
      >&#8594;</a
      ><a name="6145"
      > </a
      ><a name="6146" href="Stlc.html#6114" class="Datatype"
      >Term</a
      ><a name="6150"
      >
  </a
      ><a name="6153" href="Stlc.html#6153" class="InductiveConstructor"
      >app</a
      ><a name="6156"
      >   </a
      ><a name="6159" class="Symbol"
      >:</a
      ><a name="6160"
      > </a
      ><a name="6161" href="Stlc.html#6114" class="Datatype"
      >Term</a
      ><a name="6165"
      > </a
      ><a name="6166" class="Symbol"
      >&#8594;</a
      ><a name="6167"
      > </a
      ><a name="6168" href="Stlc.html#6114" class="Datatype"
      >Term</a
      ><a name="6172"
      > </a
      ><a name="6173" class="Symbol"
      >&#8594;</a
      ><a name="6174"
      > </a
      ><a name="6175" href="Stlc.html#6114" class="Datatype"
      >Term</a
      ><a name="6179"
      >
  </a
      ><a name="6182" href="Stlc.html#6182" class="InductiveConstructor"
      >abs</a
      ><a name="6185"
      >   </a
      ><a name="6188" class="Symbol"
      >:</a
      ><a name="6189"
      > </a
      ><a name="6190" href="Stlc.html#5778" class="Datatype"
      >Id</a
      ><a name="6192"
      > </a
      ><a name="6193" class="Symbol"
      >&#8594;</a
      ><a name="6194"
      > </a
      ><a name="6195" href="Stlc.html#5611" class="Datatype"
      >Type</a
      ><a name="6199"
      > </a
      ><a name="6200" class="Symbol"
      >&#8594;</a
      ><a name="6201"
      > </a
      ><a name="6202" href="Stlc.html#6114" class="Datatype"
      >Term</a
      ><a name="6206"
      > </a
      ><a name="6207" class="Symbol"
      >&#8594;</a
      ><a name="6208"
      > </a
      ><a name="6209" href="Stlc.html#6114" class="Datatype"
      >Term</a
      ><a name="6213"
      >
  </a
      ><a name="6216" href="Stlc.html#6216" class="InductiveConstructor"
      >true</a
      ><a name="6220"
      >  </a
      ><a name="6222" class="Symbol"
      >:</a
      ><a name="6223"
      > </a
      ><a name="6224" href="Stlc.html#6114" class="Datatype"
      >Term</a
      ><a name="6228"
      >
  </a
      ><a name="6231" href="Stlc.html#6231" class="InductiveConstructor"
      >false</a
      ><a name="6236"
      > </a
      ><a name="6237" class="Symbol"
      >:</a
      ><a name="6238"
      > </a
      ><a name="6239" href="Stlc.html#6114" class="Datatype"
      >Term</a
      ><a name="6243"
      >
  </a
      ><a name="6246" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >if_then_else_</a
      ><a name="6259"
      > </a
      ><a name="6260" class="Symbol"
      >:</a
      ><a name="6261"
      > </a
      ><a name="6262" href="Stlc.html#6114" class="Datatype"
      >Term</a
      ><a name="6266"
      > </a
      ><a name="6267" class="Symbol"
      >&#8594;</a
      ><a name="6268"
      > </a
      ><a name="6269" href="Stlc.html#6114" class="Datatype"
      >Term</a
      ><a name="6273"
      > </a
      ><a name="6274" class="Symbol"
      >&#8594;</a
      ><a name="6275"
      > </a
      ><a name="6276" href="Stlc.html#6114" class="Datatype"
      >Term</a
      ><a name="6280"
      > </a
      ><a name="6281" class="Symbol"
      >&#8594;</a
      ><a name="6282"
      > </a
      ><a name="6283" href="Stlc.html#6114" class="Datatype"
      >Term</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="6334" class="Keyword"
      >infixr</a
      ><a name="6340"
      > </a
      ><a name="6341" class="Number"
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
<a name="6713" href="Stlc.html#6713" class="Function"
      >x</a
      ><a name="6714"
      > </a
      ><a name="6715" class="Symbol"
      >=</a
      ><a name="6716"
      > </a
      ><a name="6717" href="Stlc.html#5795" class="InductiveConstructor"
      >id</a
      ><a name="6719"
      > </a
      ><a name="6720" class="Number"
      >0</a
      ><a name="6721"
      >
</a
      ><a name="6722" href="Stlc.html#6722" class="Function"
      >y</a
      ><a name="6723"
      > </a
      ><a name="6724" class="Symbol"
      >=</a
      ><a name="6725"
      > </a
      ><a name="6726" href="Stlc.html#5795" class="InductiveConstructor"
      >id</a
      ><a name="6728"
      > </a
      ><a name="6729" class="Number"
      >1</a
      ><a name="6730"
      >
</a
      ><a name="6731" href="Stlc.html#6731" class="Function"
      >z</a
      ><a name="6732"
      > </a
      ><a name="6733" class="Symbol"
      >=</a
      ><a name="6734"
      > </a
      ><a name="6735" href="Stlc.html#5795" class="InductiveConstructor"
      >id</a
      ><a name="6737"
      > </a
      ><a name="6738" class="Number"
      >2</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="6786" class="Symbol"
      >{-#</a
      ><a name="6789"
      > </a
      ><a name="6790" class="Keyword"
      >DISPLAY</a
      ><a name="6797"
      > </a
      ><a name="6798" href="Agda.Builtin.Nat.html#87" class="InductiveConstructor"
      >zero</a
      ><a name="6802"
      > = </a
      ><a name="6805" href="Stlc.html#6713" class="Function"
      >x</a
      ><a name="6806"
      > </a
      ><a name="6807" class="Symbol"
      >#-}</a
      ><a name="6810"
      >
</a
      ><a name="6811" class="Symbol"
      >{-#</a
      ><a name="6814"
      > </a
      ><a name="6815" class="Keyword"
      >DISPLAY</a
      ><a name="6822"
      > </a
      ><a name="6823" href="Agda.Builtin.Nat.html#100" class="InductiveConstructor"
      >suc</a
      ><a name="6826"
      > </a
      ><a name="6827" href="Agda.Builtin.Nat.html#87" class="InductiveConstructor"
      >zero</a
      ><a name="6831"
      > = </a
      ><a name="6834" href="Stlc.html#6722" class="Function"
      >y</a
      ><a name="6835"
      > </a
      ><a name="6836" class="Symbol"
      >#-}</a
      ><a name="6839"
      >
</a
      ><a name="6840" class="Symbol"
      >{-#</a
      ><a name="6843"
      > </a
      ><a name="6844" class="Keyword"
      >DISPLAY</a
      ><a name="6851"
      > </a
      ><a name="6852" href="Agda.Builtin.Nat.html#100" class="InductiveConstructor"
      >suc</a
      ><a name="6855"
      > (</a
      ><a name="6857" href="Agda.Builtin.Nat.html#100" class="InductiveConstructor"
      >suc</a
      ><a name="6860"
      > </a
      ><a name="6861" href="Agda.Builtin.Nat.html#87" class="InductiveConstructor"
      >zero</a
      ><a name="6865"
      >) = </a
      ><a name="6869" href="Stlc.html#6731" class="Function"
      >z</a
      ><a name="6870"
      > </a
      ><a name="6871" class="Symbol"
      >#-}</a
      >
{% endraw %}</pre>
</div>

$$\text{idB} = \lambda x:bool. x$$.

<pre class="Agda">{% raw %}
<a name="6944" href="Stlc.html#6944" class="Function"
      >idB</a
      ><a name="6947"
      > </a
      ><a name="6948" class="Symbol"
      >=</a
      ><a name="6949"
      > </a
      ><a name="6950" class="Symbol"
      >(</a
      ><a name="6951" href="Stlc.html#6182" class="InductiveConstructor"
      >abs</a
      ><a name="6954"
      > </a
      ><a name="6955" href="Stlc.html#6713" class="Function"
      >x</a
      ><a name="6956"
      > </a
      ><a name="6957" href="Stlc.html#5630" class="InductiveConstructor"
      >bool</a
      ><a name="6961"
      > </a
      ><a name="6962" class="Symbol"
      >(</a
      ><a name="6963" href="Stlc.html#6133" class="InductiveConstructor"
      >var</a
      ><a name="6966"
      > </a
      ><a name="6967" href="Stlc.html#6713" class="Function"
      >x</a
      ><a name="6968" class="Symbol"
      >))</a
      >
{% endraw %}</pre>

$$\text{idBB} = \lambda x:bool\rightarrow bool. x$$.

<pre class="Agda">{% raw %}
<a name="7050" href="Stlc.html#7050" class="Function"
      >idBB</a
      ><a name="7054"
      > </a
      ><a name="7055" class="Symbol"
      >=</a
      ><a name="7056"
      > </a
      ><a name="7057" class="Symbol"
      >(</a
      ><a name="7058" href="Stlc.html#6182" class="InductiveConstructor"
      >abs</a
      ><a name="7061"
      > </a
      ><a name="7062" href="Stlc.html#6713" class="Function"
      >x</a
      ><a name="7063"
      > </a
      ><a name="7064" class="Symbol"
      >(</a
      ><a name="7065" href="Stlc.html#5630" class="InductiveConstructor"
      >bool</a
      ><a name="7069"
      > </a
      ><a name="7070" href="Stlc.html#5644" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="7071"
      > </a
      ><a name="7072" href="Stlc.html#5630" class="InductiveConstructor"
      >bool</a
      ><a name="7076" class="Symbol"
      >)</a
      ><a name="7077"
      > </a
      ><a name="7078" class="Symbol"
      >(</a
      ><a name="7079" href="Stlc.html#6133" class="InductiveConstructor"
      >var</a
      ><a name="7082"
      > </a
      ><a name="7083" href="Stlc.html#6713" class="Function"
      >x</a
      ><a name="7084" class="Symbol"
      >))</a
      >
{% endraw %}</pre>

$$\text{idBBBB} = \lambda x:(bool\rightarrow bool)\rightarrow (bool\rightarrow bool). x$$.

<pre class="Agda">{% raw %}
<a name="7204" href="Stlc.html#7204" class="Function"
      >idBBBB</a
      ><a name="7210"
      > </a
      ><a name="7211" class="Symbol"
      >=</a
      ><a name="7212"
      > </a
      ><a name="7213" class="Symbol"
      >(</a
      ><a name="7214" href="Stlc.html#6182" class="InductiveConstructor"
      >abs</a
      ><a name="7217"
      > </a
      ><a name="7218" href="Stlc.html#6713" class="Function"
      >x</a
      ><a name="7219"
      > </a
      ><a name="7220" class="Symbol"
      >((</a
      ><a name="7222" href="Stlc.html#5630" class="InductiveConstructor"
      >bool</a
      ><a name="7226"
      > </a
      ><a name="7227" href="Stlc.html#5644" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="7228"
      > </a
      ><a name="7229" href="Stlc.html#5630" class="InductiveConstructor"
      >bool</a
      ><a name="7233" class="Symbol"
      >)</a
      ><a name="7234"
      > </a
      ><a name="7235" href="Stlc.html#5644" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="7236"
      > </a
      ><a name="7237" class="Symbol"
      >(</a
      ><a name="7238" href="Stlc.html#5630" class="InductiveConstructor"
      >bool</a
      ><a name="7242"
      > </a
      ><a name="7243" href="Stlc.html#5644" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="7244"
      > </a
      ><a name="7245" href="Stlc.html#5630" class="InductiveConstructor"
      >bool</a
      ><a name="7249" class="Symbol"
      >))</a
      ><a name="7251"
      > </a
      ><a name="7252" class="Symbol"
      >(</a
      ><a name="7253" href="Stlc.html#6133" class="InductiveConstructor"
      >var</a
      ><a name="7256"
      > </a
      ><a name="7257" href="Stlc.html#6713" class="Function"
      >x</a
      ><a name="7258" class="Symbol"
      >))</a
      >
{% endraw %}</pre>

$$\text{k} = \lambda x:bool. \lambda y:bool. x$$.

<pre class="Agda">{% raw %}
<a name="7337" href="Stlc.html#7337" class="Function"
      >k</a
      ><a name="7338"
      > </a
      ><a name="7339" class="Symbol"
      >=</a
      ><a name="7340"
      > </a
      ><a name="7341" class="Symbol"
      >(</a
      ><a name="7342" href="Stlc.html#6182" class="InductiveConstructor"
      >abs</a
      ><a name="7345"
      > </a
      ><a name="7346" href="Stlc.html#6713" class="Function"
      >x</a
      ><a name="7347"
      > </a
      ><a name="7348" href="Stlc.html#5630" class="InductiveConstructor"
      >bool</a
      ><a name="7352"
      > </a
      ><a name="7353" class="Symbol"
      >(</a
      ><a name="7354" href="Stlc.html#6182" class="InductiveConstructor"
      >abs</a
      ><a name="7357"
      > </a
      ><a name="7358" href="Stlc.html#6722" class="Function"
      >y</a
      ><a name="7359"
      > </a
      ><a name="7360" href="Stlc.html#5630" class="InductiveConstructor"
      >bool</a
      ><a name="7364"
      > </a
      ><a name="7365" class="Symbol"
      >(</a
      ><a name="7366" href="Stlc.html#6133" class="InductiveConstructor"
      >var</a
      ><a name="7369"
      > </a
      ><a name="7370" href="Stlc.html#6713" class="Function"
      >x</a
      ><a name="7371" class="Symbol"
      >)))</a
      >
{% endraw %}</pre>

$$\text{notB} = \lambda x:bool. \text{if }x\text{ then }false\text{ else }true$$.

<pre class="Agda">{% raw %}
<a name="7483" href="Stlc.html#7483" class="Function"
      >notB</a
      ><a name="7487"
      > </a
      ><a name="7488" class="Symbol"
      >=</a
      ><a name="7489"
      > </a
      ><a name="7490" class="Symbol"
      >(</a
      ><a name="7491" href="Stlc.html#6182" class="InductiveConstructor"
      >abs</a
      ><a name="7494"
      > </a
      ><a name="7495" href="Stlc.html#6713" class="Function"
      >x</a
      ><a name="7496"
      > </a
      ><a name="7497" href="Stlc.html#5630" class="InductiveConstructor"
      >bool</a
      ><a name="7501"
      > </a
      ><a name="7502" class="Symbol"
      >(</a
      ><a name="7503" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >if</a
      ><a name="7505"
      > </a
      ><a name="7506" class="Symbol"
      >(</a
      ><a name="7507" href="Stlc.html#6133" class="InductiveConstructor"
      >var</a
      ><a name="7510"
      > </a
      ><a name="7511" href="Stlc.html#6713" class="Function"
      >x</a
      ><a name="7512" class="Symbol"
      >)</a
      ><a name="7513"
      > </a
      ><a name="7514" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >then</a
      ><a name="7518"
      > </a
      ><a name="7519" href="Stlc.html#6231" class="InductiveConstructor"
      >false</a
      ><a name="7524"
      > </a
      ><a name="7525" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >else</a
      ><a name="7529"
      > </a
      ><a name="7530" href="Stlc.html#6216" class="InductiveConstructor"
      >true</a
      ><a name="7534" class="Symbol"
      >))</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="7583" class="Symbol"
      >{-#</a
      ><a name="7586"
      > </a
      ><a name="7587" class="Keyword"
      >DISPLAY</a
      ><a name="7594"
      > </a
      ><a name="7595" href="Stlc.html#6182" class="InductiveConstructor"
      >abs</a
      ><a name="7598"
      > 0 </a
      ><a name="7601" href="Stlc.html#5630" class="InductiveConstructor"
      >bool</a
      ><a name="7605"
      > (</a
      ><a name="7607" href="Stlc.html#6133" class="InductiveConstructor"
      >var</a
      ><a name="7610"
      > 0) = </a
      ><a name="7616" href="Stlc.html#6944" class="Function"
      >idB</a
      ><a name="7619"
      > </a
      ><a name="7620" class="Symbol"
      >#-}</a
      ><a name="7623"
      >
</a
      ><a name="7624" class="Symbol"
      >{-#</a
      ><a name="7627"
      > </a
      ><a name="7628" class="Keyword"
      >DISPLAY</a
      ><a name="7635"
      > </a
      ><a name="7636" href="Stlc.html#6182" class="InductiveConstructor"
      >abs</a
      ><a name="7639"
      > 0 (</a
      ><a name="7643" href="Stlc.html#5630" class="InductiveConstructor"
      >bool</a
      ><a name="7647"
      > </a
      ><a name="7648" href="Stlc.html#5644" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="7649"
      > </a
      ><a name="7650" href="Stlc.html#5630" class="InductiveConstructor"
      >bool</a
      ><a name="7654"
      >) (</a
      ><a name="7657" href="Stlc.html#6133" class="InductiveConstructor"
      >var</a
      ><a name="7660"
      > 0) = </a
      ><a name="7666" href="Stlc.html#7050" class="Function"
      >idBB</a
      ><a name="7670"
      > </a
      ><a name="7671" class="Symbol"
      >#-}</a
      ><a name="7674"
      >
</a
      ><a name="7675" class="Symbol"
      >{-#</a
      ><a name="7678"
      > </a
      ><a name="7679" class="Keyword"
      >DISPLAY</a
      ><a name="7686"
      > </a
      ><a name="7687" href="Stlc.html#6182" class="InductiveConstructor"
      >abs</a
      ><a name="7690"
      > 0 ((</a
      ><a name="7695" href="Stlc.html#5630" class="InductiveConstructor"
      >bool</a
      ><a name="7699"
      > </a
      ><a name="7700" href="Stlc.html#5644" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="7701"
      > </a
      ><a name="7702" href="Stlc.html#5630" class="InductiveConstructor"
      >bool</a
      ><a name="7706"
      >) </a
      ><a name="7708" href="Stlc.html#5644" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="7709"
      > (</a
      ><a name="7711" href="Stlc.html#5630" class="InductiveConstructor"
      >bool</a
      ><a name="7715"
      > </a
      ><a name="7716" href="Stlc.html#5644" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="7717"
      > </a
      ><a name="7718" href="Stlc.html#5630" class="InductiveConstructor"
      >bool</a
      ><a name="7722"
      >)) (</a
      ><a name="7726" href="Stlc.html#6133" class="InductiveConstructor"
      >var</a
      ><a name="7729"
      > 0) = </a
      ><a name="7735" href="Stlc.html#7204" class="Function"
      >idBBBB</a
      ><a name="7741"
      > </a
      ><a name="7742" class="Symbol"
      >#-}</a
      ><a name="7745"
      >
</a
      ><a name="7746" class="Symbol"
      >{-#</a
      ><a name="7749"
      > </a
      ><a name="7750" class="Keyword"
      >DISPLAY</a
      ><a name="7757"
      > </a
      ><a name="7758" href="Stlc.html#6182" class="InductiveConstructor"
      >abs</a
      ><a name="7761"
      > 0 </a
      ><a name="7764" href="Stlc.html#5630" class="InductiveConstructor"
      >bool</a
      ><a name="7768"
      > (</a
      ><a name="7770" href="Stlc.html#6182" class="InductiveConstructor"
      >abs</a
      ><a name="7773"
      > </a
      ><a name="7774" href="Stlc.html#7774" class="Bound"
      >y</a
      ><a name="7775"
      > </a
      ><a name="7776" href="Stlc.html#5630" class="InductiveConstructor"
      >bool</a
      ><a name="7780"
      > (</a
      ><a name="7782" href="Stlc.html#6133" class="InductiveConstructor"
      >var</a
      ><a name="7785"
      > 0)) = </a
      ><a name="7792" href="Stlc.html#7337" class="Function"
      >k</a
      ><a name="7793"
      > </a
      ><a name="7794" class="Symbol"
      >#-}</a
      ><a name="7797"
      >
</a
      ><a name="7798" class="Symbol"
      >{-#</a
      ><a name="7801"
      > </a
      ><a name="7802" class="Keyword"
      >DISPLAY</a
      ><a name="7809"
      > </a
      ><a name="7810" href="Stlc.html#6182" class="InductiveConstructor"
      >abs</a
      ><a name="7813"
      > 0 </a
      ><a name="7816" href="Stlc.html#5630" class="InductiveConstructor"
      >bool</a
      ><a name="7820"
      > (</a
      ><a name="7822" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >if</a
      ><a name="7824"
      > (</a
      ><a name="7826" href="Stlc.html#6133" class="InductiveConstructor"
      >var</a
      ><a name="7829"
      > 0) </a
      ><a name="7833" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >then</a
      ><a name="7837"
      > </a
      ><a name="7838" href="Stlc.html#6231" class="InductiveConstructor"
      >false</a
      ><a name="7843"
      > </a
      ><a name="7844" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >else</a
      ><a name="7848"
      > </a
      ><a name="7849" href="Stlc.html#6216" class="InductiveConstructor"
      >true</a
      ><a name="7853"
      >) = </a
      ><a name="7857" href="Stlc.html#7483" class="Function"
      >notB</a
      ><a name="7861"
      > </a
      ><a name="7862" class="Symbol"
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
<a name="9100" href="Stlc.html#9100" class="Function Operator"
      >test_normalizeUnderLambda</a
      ><a name="9125"
      > </a
      ><a name="9126" class="Symbol"
      >:</a
      ><a name="9127"
      > </a
      ><a name="9128" class="Symbol"
      >(&#955;</a
      ><a name="9130"
      > </a
      ><a name="9131" class="Symbol"
      >(</a
      ><a name="9132" href="Stlc.html#9132" class="Bound"
      >x</a
      ><a name="9133"
      > </a
      ><a name="9134" class="Symbol"
      >:</a
      ><a name="9135"
      > </a
      ><a name="9136" href="Agda.Builtin.Nat.html#69" class="Datatype"
      >&#8469;</a
      ><a name="9137" class="Symbol"
      >)</a
      ><a name="9138"
      > </a
      ><a name="9139" class="Symbol"
      >&#8594;</a
      ><a name="9140"
      > </a
      ><a name="9141" class="Number"
      >3</a
      ><a name="9142"
      > </a
      ><a name="9143" href="Agda.Builtin.Nat.html#202" class="Primitive Operator"
      >+</a
      ><a name="9144"
      > </a
      ><a name="9145" class="Number"
      >4</a
      ><a name="9146" class="Symbol"
      >)</a
      ><a name="9147"
      > </a
      ><a name="9148" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="9149"
      > </a
      ><a name="9150" class="Symbol"
      >(&#955;</a
      ><a name="9152"
      > </a
      ><a name="9153" class="Symbol"
      >(</a
      ><a name="9154" href="Stlc.html#9154" class="Bound"
      >x</a
      ><a name="9155"
      > </a
      ><a name="9156" class="Symbol"
      >:</a
      ><a name="9157"
      > </a
      ><a name="9158" href="Agda.Builtin.Nat.html#69" class="Datatype"
      >&#8469;</a
      ><a name="9159" class="Symbol"
      >)</a
      ><a name="9160"
      > </a
      ><a name="9161" class="Symbol"
      >&#8594;</a
      ><a name="9162"
      > </a
      ><a name="9163" class="Number"
      >7</a
      ><a name="9164" class="Symbol"
      >)</a
      ><a name="9165"
      >
</a
      ><a name="9166" href="Stlc.html#9100" class="Function Operator"
      >test_normalizeUnderLambda</a
      ><a name="9191"
      > </a
      ><a name="9192" class="Symbol"
      >=</a
      ><a name="9193"
      > </a
      ><a name="9194" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      >
{% endraw %}</pre>

Most real-world functional programming languages make the second
choice---reduction of a function's body only begins when the
function is actually applied to an argument.  We also make the
second choice here.

<pre class="Agda">{% raw %}
<a name="9434" class="Keyword"
      >data</a
      ><a name="9438"
      > </a
      ><a name="9439" href="Stlc.html#9439" class="Datatype"
      >Value</a
      ><a name="9444"
      > </a
      ><a name="9445" class="Symbol"
      >:</a
      ><a name="9446"
      > </a
      ><a name="9447" href="Stlc.html#6114" class="Datatype"
      >Term</a
      ><a name="9451"
      > </a
      ><a name="9452" class="Symbol"
      >&#8594;</a
      ><a name="9453"
      > </a
      ><a name="9454" class="PrimitiveType"
      >Set</a
      ><a name="9457"
      > </a
      ><a name="9458" class="Keyword"
      >where</a
      ><a name="9463"
      >
  </a
      ><a name="9466" href="Stlc.html#9466" class="InductiveConstructor"
      >abs</a
      ><a name="9469"
      >   </a
      ><a name="9472" class="Symbol"
      >:</a
      ><a name="9473"
      > </a
      ><a name="9474" class="Symbol"
      >&#8704;</a
      ><a name="9475"
      > </a
      ><a name="9476" class="Symbol"
      >{</a
      ><a name="9477" href="Stlc.html#9477" class="Bound"
      >x</a
      ><a name="9478"
      > </a
      ><a name="9479" href="Stlc.html#9479" class="Bound"
      >A</a
      ><a name="9480"
      > </a
      ><a name="9481" href="Stlc.html#9481" class="Bound"
      >t</a
      ><a name="9482" class="Symbol"
      >}</a
      ><a name="9483"
      >
        </a
      ><a name="9492" class="Symbol"
      >&#8594;</a
      ><a name="9493"
      > </a
      ><a name="9494" href="Stlc.html#9439" class="Datatype"
      >Value</a
      ><a name="9499"
      > </a
      ><a name="9500" class="Symbol"
      >(</a
      ><a name="9501" href="Stlc.html#6182" class="InductiveConstructor"
      >abs</a
      ><a name="9504"
      > </a
      ><a name="9505" href="Stlc.html#9477" class="Bound"
      >x</a
      ><a name="9506"
      > </a
      ><a name="9507" href="Stlc.html#9479" class="Bound"
      >A</a
      ><a name="9508"
      > </a
      ><a name="9509" href="Stlc.html#9481" class="Bound"
      >t</a
      ><a name="9510" class="Symbol"
      >)</a
      ><a name="9511"
      >
  </a
      ><a name="9514" href="Stlc.html#9514" class="InductiveConstructor"
      >true</a
      ><a name="9518"
      >  </a
      ><a name="9520" class="Symbol"
      >:</a
      ><a name="9521"
      > </a
      ><a name="9522" href="Stlc.html#9439" class="Datatype"
      >Value</a
      ><a name="9527"
      > </a
      ><a name="9528" href="Stlc.html#6216" class="InductiveConstructor"
      >true</a
      ><a name="9532"
      >
  </a
      ><a name="9535" href="Stlc.html#9535" class="InductiveConstructor"
      >false</a
      ><a name="9540"
      > </a
      ><a name="9541" class="Symbol"
      >:</a
      ><a name="9542"
      > </a
      ><a name="9543" href="Stlc.html#9439" class="Datatype"
      >Value</a
      ><a name="9548"
      > </a
      ><a name="9549" href="Stlc.html#6231" class="InductiveConstructor"
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
<a name="12659" href="Stlc.html#12659" class="Function Operator"
      >[_:=_]_</a
      ><a name="12666"
      > </a
      ><a name="12667" class="Symbol"
      >:</a
      ><a name="12668"
      > </a
      ><a name="12669" href="Stlc.html#5778" class="Datatype"
      >Id</a
      ><a name="12671"
      > </a
      ><a name="12672" class="Symbol"
      >-&gt;</a
      ><a name="12674"
      > </a
      ><a name="12675" href="Stlc.html#6114" class="Datatype"
      >Term</a
      ><a name="12679"
      > </a
      ><a name="12680" class="Symbol"
      >-&gt;</a
      ><a name="12682"
      > </a
      ><a name="12683" href="Stlc.html#6114" class="Datatype"
      >Term</a
      ><a name="12687"
      > </a
      ><a name="12688" class="Symbol"
      >-&gt;</a
      ><a name="12690"
      > </a
      ><a name="12691" href="Stlc.html#6114" class="Datatype"
      >Term</a
      ><a name="12695"
      >
</a
      ><a name="12696" href="Stlc.html#12659" class="Function Operator"
      >[</a
      ><a name="12697"
      > </a
      ><a name="12698" href="Stlc.html#12698" class="Bound"
      >x</a
      ><a name="12699"
      > </a
      ><a name="12700" href="Stlc.html#12659" class="Function Operator"
      >:=</a
      ><a name="12702"
      > </a
      ><a name="12703" href="Stlc.html#12703" class="Bound"
      >v</a
      ><a name="12704"
      > </a
      ><a name="12705" href="Stlc.html#12659" class="Function Operator"
      >]</a
      ><a name="12706"
      > </a
      ><a name="12707" class="Symbol"
      >(</a
      ><a name="12708" href="Stlc.html#6133" class="InductiveConstructor"
      >var</a
      ><a name="12711"
      > </a
      ><a name="12712" href="Stlc.html#12712" class="Bound"
      >y</a
      ><a name="12713" class="Symbol"
      >)</a
      ><a name="12714"
      > </a
      ><a name="12715" class="Keyword"
      >with</a
      ><a name="12719"
      > </a
      ><a name="12720" href="Stlc.html#12698" class="Bound"
      >x</a
      ><a name="12721"
      > </a
      ><a name="12722" href="Stlc.html#5853" class="Function Operator"
      >&#8799;</a
      ><a name="12723"
      > </a
      ><a name="12724" href="Stlc.html#12712" class="Bound"
      >y</a
      ><a name="12725"
      >
</a
      ><a name="12726" class="Symbol"
      >...</a
      ><a name="12729"
      > </a
      ><a name="12730" class="Symbol"
      >|</a
      ><a name="12731"
      > </a
      ><a name="12732" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="12735"
      > </a
      ><a name="12736" href="Stlc.html#12736" class="Bound"
      >x=y</a
      ><a name="12739"
      > </a
      ><a name="12740" class="Symbol"
      >=</a
      ><a name="12741"
      > </a
      ><a name="12742" href="Stlc.html#12703" class="Bound"
      >v</a
      ><a name="12743"
      >
</a
      ><a name="12744" class="Symbol"
      >...</a
      ><a name="12747"
      > </a
      ><a name="12748" class="Symbol"
      >|</a
      ><a name="12749"
      > </a
      ><a name="12750" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="12752"
      >  </a
      ><a name="12754" href="Stlc.html#12754" class="Bound"
      >x&#8800;y</a
      ><a name="12757"
      > </a
      ><a name="12758" class="Symbol"
      >=</a
      ><a name="12759"
      > </a
      ><a name="12760" href="Stlc.html#6133" class="InductiveConstructor"
      >var</a
      ><a name="12763"
      > </a
      ><a name="12764" href="Stlc.html#12712" class="Bound"
      >y</a
      ><a name="12765"
      >
</a
      ><a name="12766" href="Stlc.html#12659" class="Function Operator"
      >[</a
      ><a name="12767"
      > </a
      ><a name="12768" href="Stlc.html#12768" class="Bound"
      >x</a
      ><a name="12769"
      > </a
      ><a name="12770" href="Stlc.html#12659" class="Function Operator"
      >:=</a
      ><a name="12772"
      > </a
      ><a name="12773" href="Stlc.html#12773" class="Bound"
      >v</a
      ><a name="12774"
      > </a
      ><a name="12775" href="Stlc.html#12659" class="Function Operator"
      >]</a
      ><a name="12776"
      > </a
      ><a name="12777" class="Symbol"
      >(</a
      ><a name="12778" href="Stlc.html#6153" class="InductiveConstructor"
      >app</a
      ><a name="12781"
      > </a
      ><a name="12782" href="Stlc.html#12782" class="Bound"
      >s</a
      ><a name="12783"
      > </a
      ><a name="12784" href="Stlc.html#12784" class="Bound"
      >t</a
      ><a name="12785" class="Symbol"
      >)</a
      ><a name="12786"
      > </a
      ><a name="12787" class="Symbol"
      >=</a
      ><a name="12788"
      > </a
      ><a name="12789" href="Stlc.html#6153" class="InductiveConstructor"
      >app</a
      ><a name="12792"
      > </a
      ><a name="12793" class="Symbol"
      >(</a
      ><a name="12794" href="Stlc.html#12659" class="Function Operator"
      >[</a
      ><a name="12795"
      > </a
      ><a name="12796" href="Stlc.html#12768" class="Bound"
      >x</a
      ><a name="12797"
      > </a
      ><a name="12798" href="Stlc.html#12659" class="Function Operator"
      >:=</a
      ><a name="12800"
      > </a
      ><a name="12801" href="Stlc.html#12773" class="Bound"
      >v</a
      ><a name="12802"
      > </a
      ><a name="12803" href="Stlc.html#12659" class="Function Operator"
      >]</a
      ><a name="12804"
      > </a
      ><a name="12805" href="Stlc.html#12782" class="Bound"
      >s</a
      ><a name="12806" class="Symbol"
      >)</a
      ><a name="12807"
      > </a
      ><a name="12808" class="Symbol"
      >(</a
      ><a name="12809" href="Stlc.html#12659" class="Function Operator"
      >[</a
      ><a name="12810"
      > </a
      ><a name="12811" href="Stlc.html#12768" class="Bound"
      >x</a
      ><a name="12812"
      > </a
      ><a name="12813" href="Stlc.html#12659" class="Function Operator"
      >:=</a
      ><a name="12815"
      > </a
      ><a name="12816" href="Stlc.html#12773" class="Bound"
      >v</a
      ><a name="12817"
      > </a
      ><a name="12818" href="Stlc.html#12659" class="Function Operator"
      >]</a
      ><a name="12819"
      > </a
      ><a name="12820" href="Stlc.html#12784" class="Bound"
      >t</a
      ><a name="12821" class="Symbol"
      >)</a
      ><a name="12822"
      >
</a
      ><a name="12823" href="Stlc.html#12659" class="Function Operator"
      >[</a
      ><a name="12824"
      > </a
      ><a name="12825" href="Stlc.html#12825" class="Bound"
      >x</a
      ><a name="12826"
      > </a
      ><a name="12827" href="Stlc.html#12659" class="Function Operator"
      >:=</a
      ><a name="12829"
      > </a
      ><a name="12830" href="Stlc.html#12830" class="Bound"
      >v</a
      ><a name="12831"
      > </a
      ><a name="12832" href="Stlc.html#12659" class="Function Operator"
      >]</a
      ><a name="12833"
      > </a
      ><a name="12834" class="Symbol"
      >(</a
      ><a name="12835" href="Stlc.html#6182" class="InductiveConstructor"
      >abs</a
      ><a name="12838"
      > </a
      ><a name="12839" href="Stlc.html#12839" class="Bound"
      >y</a
      ><a name="12840"
      > </a
      ><a name="12841" href="Stlc.html#12841" class="Bound"
      >A</a
      ><a name="12842"
      > </a
      ><a name="12843" href="Stlc.html#12843" class="Bound"
      >t</a
      ><a name="12844" class="Symbol"
      >)</a
      ><a name="12845"
      > </a
      ><a name="12846" class="Keyword"
      >with</a
      ><a name="12850"
      > </a
      ><a name="12851" href="Stlc.html#12825" class="Bound"
      >x</a
      ><a name="12852"
      > </a
      ><a name="12853" href="Stlc.html#5853" class="Function Operator"
      >&#8799;</a
      ><a name="12854"
      > </a
      ><a name="12855" href="Stlc.html#12839" class="Bound"
      >y</a
      ><a name="12856"
      >
</a
      ><a name="12857" class="Symbol"
      >...</a
      ><a name="12860"
      > </a
      ><a name="12861" class="Symbol"
      >|</a
      ><a name="12862"
      > </a
      ><a name="12863" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="12866"
      > </a
      ><a name="12867" href="Stlc.html#12867" class="Bound"
      >x=y</a
      ><a name="12870"
      > </a
      ><a name="12871" class="Symbol"
      >=</a
      ><a name="12872"
      > </a
      ><a name="12873" href="Stlc.html#6182" class="InductiveConstructor"
      >abs</a
      ><a name="12876"
      > </a
      ><a name="12877" href="Stlc.html#12839" class="Bound"
      >y</a
      ><a name="12878"
      > </a
      ><a name="12879" href="Stlc.html#12841" class="Bound"
      >A</a
      ><a name="12880"
      > </a
      ><a name="12881" href="Stlc.html#12843" class="Bound"
      >t</a
      ><a name="12882"
      >
</a
      ><a name="12883" class="Symbol"
      >...</a
      ><a name="12886"
      > </a
      ><a name="12887" class="Symbol"
      >|</a
      ><a name="12888"
      > </a
      ><a name="12889" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="12891"
      >  </a
      ><a name="12893" href="Stlc.html#12893" class="Bound"
      >x&#8800;y</a
      ><a name="12896"
      > </a
      ><a name="12897" class="Symbol"
      >=</a
      ><a name="12898"
      > </a
      ><a name="12899" href="Stlc.html#6182" class="InductiveConstructor"
      >abs</a
      ><a name="12902"
      > </a
      ><a name="12903" href="Stlc.html#12839" class="Bound"
      >y</a
      ><a name="12904"
      > </a
      ><a name="12905" href="Stlc.html#12841" class="Bound"
      >A</a
      ><a name="12906"
      > </a
      ><a name="12907" class="Symbol"
      >(</a
      ><a name="12908" href="Stlc.html#12659" class="Function Operator"
      >[</a
      ><a name="12909"
      > </a
      ><a name="12910" href="Stlc.html#12825" class="Bound"
      >x</a
      ><a name="12911"
      > </a
      ><a name="12912" href="Stlc.html#12659" class="Function Operator"
      >:=</a
      ><a name="12914"
      > </a
      ><a name="12915" href="Stlc.html#12830" class="Bound"
      >v</a
      ><a name="12916"
      > </a
      ><a name="12917" href="Stlc.html#12659" class="Function Operator"
      >]</a
      ><a name="12918"
      > </a
      ><a name="12919" href="Stlc.html#12843" class="Bound"
      >t</a
      ><a name="12920" class="Symbol"
      >)</a
      ><a name="12921"
      >
</a
      ><a name="12922" href="Stlc.html#12659" class="Function Operator"
      >[</a
      ><a name="12923"
      > </a
      ><a name="12924" href="Stlc.html#12924" class="Bound"
      >x</a
      ><a name="12925"
      > </a
      ><a name="12926" href="Stlc.html#12659" class="Function Operator"
      >:=</a
      ><a name="12928"
      > </a
      ><a name="12929" href="Stlc.html#12929" class="Bound"
      >v</a
      ><a name="12930"
      > </a
      ><a name="12931" href="Stlc.html#12659" class="Function Operator"
      >]</a
      ><a name="12932"
      > </a
      ><a name="12933" href="Stlc.html#6216" class="InductiveConstructor"
      >true</a
      ><a name="12937"
      >  </a
      ><a name="12939" class="Symbol"
      >=</a
      ><a name="12940"
      > </a
      ><a name="12941" href="Stlc.html#6216" class="InductiveConstructor"
      >true</a
      ><a name="12945"
      >
</a
      ><a name="12946" href="Stlc.html#12659" class="Function Operator"
      >[</a
      ><a name="12947"
      > </a
      ><a name="12948" href="Stlc.html#12948" class="Bound"
      >x</a
      ><a name="12949"
      > </a
      ><a name="12950" href="Stlc.html#12659" class="Function Operator"
      >:=</a
      ><a name="12952"
      > </a
      ><a name="12953" href="Stlc.html#12953" class="Bound"
      >v</a
      ><a name="12954"
      > </a
      ><a name="12955" href="Stlc.html#12659" class="Function Operator"
      >]</a
      ><a name="12956"
      > </a
      ><a name="12957" href="Stlc.html#6231" class="InductiveConstructor"
      >false</a
      ><a name="12962"
      > </a
      ><a name="12963" class="Symbol"
      >=</a
      ><a name="12964"
      > </a
      ><a name="12965" href="Stlc.html#6231" class="InductiveConstructor"
      >false</a
      ><a name="12970"
      >
</a
      ><a name="12971" href="Stlc.html#12659" class="Function Operator"
      >[</a
      ><a name="12972"
      > </a
      ><a name="12973" href="Stlc.html#12973" class="Bound"
      >x</a
      ><a name="12974"
      > </a
      ><a name="12975" href="Stlc.html#12659" class="Function Operator"
      >:=</a
      ><a name="12977"
      > </a
      ><a name="12978" href="Stlc.html#12978" class="Bound"
      >v</a
      ><a name="12979"
      > </a
      ><a name="12980" href="Stlc.html#12659" class="Function Operator"
      >]</a
      ><a name="12981"
      > </a
      ><a name="12982" class="Symbol"
      >(</a
      ><a name="12983" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >if</a
      ><a name="12985"
      > </a
      ><a name="12986" href="Stlc.html#12986" class="Bound"
      >s</a
      ><a name="12987"
      > </a
      ><a name="12988" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >then</a
      ><a name="12992"
      > </a
      ><a name="12993" href="Stlc.html#12993" class="Bound"
      >t</a
      ><a name="12994"
      > </a
      ><a name="12995" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >else</a
      ><a name="12999"
      > </a
      ><a name="13000" href="Stlc.html#13000" class="Bound"
      >u</a
      ><a name="13001" class="Symbol"
      >)</a
      ><a name="13002"
      > </a
      ><a name="13003" class="Symbol"
      >=</a
      ><a name="13004"
      >
  </a
      ><a name="13007" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >if</a
      ><a name="13009"
      > </a
      ><a name="13010" href="Stlc.html#12659" class="Function Operator"
      >[</a
      ><a name="13011"
      > </a
      ><a name="13012" href="Stlc.html#12973" class="Bound"
      >x</a
      ><a name="13013"
      > </a
      ><a name="13014" href="Stlc.html#12659" class="Function Operator"
      >:=</a
      ><a name="13016"
      > </a
      ><a name="13017" href="Stlc.html#12978" class="Bound"
      >v</a
      ><a name="13018"
      > </a
      ><a name="13019" href="Stlc.html#12659" class="Function Operator"
      >]</a
      ><a name="13020"
      > </a
      ><a name="13021" href="Stlc.html#12986" class="Bound"
      >s</a
      ><a name="13022"
      > </a
      ><a name="13023" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >then</a
      ><a name="13027"
      > </a
      ><a name="13028" href="Stlc.html#12659" class="Function Operator"
      >[</a
      ><a name="13029"
      > </a
      ><a name="13030" href="Stlc.html#12973" class="Bound"
      >x</a
      ><a name="13031"
      > </a
      ><a name="13032" href="Stlc.html#12659" class="Function Operator"
      >:=</a
      ><a name="13034"
      > </a
      ><a name="13035" href="Stlc.html#12978" class="Bound"
      >v</a
      ><a name="13036"
      > </a
      ><a name="13037" href="Stlc.html#12659" class="Function Operator"
      >]</a
      ><a name="13038"
      > </a
      ><a name="13039" href="Stlc.html#12993" class="Bound"
      >t</a
      ><a name="13040"
      > </a
      ><a name="13041" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >else</a
      ><a name="13045"
      >  </a
      ><a name="13047" href="Stlc.html#12659" class="Function Operator"
      >[</a
      ><a name="13048"
      > </a
      ><a name="13049" href="Stlc.html#12973" class="Bound"
      >x</a
      ><a name="13050"
      > </a
      ><a name="13051" href="Stlc.html#12659" class="Function Operator"
      >:=</a
      ><a name="13053"
      > </a
      ><a name="13054" href="Stlc.html#12978" class="Bound"
      >v</a
      ><a name="13055"
      > </a
      ><a name="13056" href="Stlc.html#12659" class="Function Operator"
      >]</a
      ><a name="13057"
      > </a
      ><a name="13058" href="Stlc.html#13000" class="Bound"
      >u</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="13106" class="Keyword"
      >infix</a
      ><a name="13111"
      > </a
      ><a name="13112" class="Number"
      >9</a
      >
{% endraw %}</pre>
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
<pre class="Agda">{% raw %}
<a name="14050" class="Keyword"
      >data</a
      ><a name="14054"
      > </a
      ><a name="14055" href="Stlc.html#14055" class="Datatype Operator"
      >[_:=_]_==&gt;_</a
      ><a name="14066"
      > </a
      ><a name="14067" class="Symbol"
      >(</a
      ><a name="14068" href="Stlc.html#14068" class="Bound"
      >x</a
      ><a name="14069"
      > </a
      ><a name="14070" class="Symbol"
      >:</a
      ><a name="14071"
      > </a
      ><a name="14072" href="Stlc.html#5778" class="Datatype"
      >Id</a
      ><a name="14074" class="Symbol"
      >)</a
      ><a name="14075"
      > </a
      ><a name="14076" class="Symbol"
      >(</a
      ><a name="14077" href="Stlc.html#14077" class="Bound"
      >s</a
      ><a name="14078"
      > </a
      ><a name="14079" class="Symbol"
      >:</a
      ><a name="14080"
      > </a
      ><a name="14081" href="Stlc.html#6114" class="Datatype"
      >Term</a
      ><a name="14085" class="Symbol"
      >)</a
      ><a name="14086"
      > </a
      ><a name="14087" class="Symbol"
      >:</a
      ><a name="14088"
      > </a
      ><a name="14089" href="Stlc.html#6114" class="Datatype"
      >Term</a
      ><a name="14093"
      > </a
      ><a name="14094" class="Symbol"
      >-&gt;</a
      ><a name="14096"
      > </a
      ><a name="14097" href="Stlc.html#6114" class="Datatype"
      >Term</a
      ><a name="14101"
      > </a
      ><a name="14102" class="Symbol"
      >-&gt;</a
      ><a name="14104"
      > </a
      ><a name="14105" class="PrimitiveType"
      >Set</a
      ><a name="14108"
      > </a
      ><a name="14109" class="Keyword"
      >where</a
      ><a name="14114"
      >
  </a
      ><a name="14117" href="Stlc.html#14117" class="InductiveConstructor"
      >var1</a
      ><a name="14121"
      > </a
      ><a name="14122" class="Symbol"
      >:</a
      ><a name="14123"
      > </a
      ><a name="14124" href="Stlc.html#14055" class="Datatype Operator"
      >[</a
      ><a name="14125"
      > </a
      ><a name="14126" href="Stlc.html#14068" class="Bound"
      >x</a
      ><a name="14127"
      > </a
      ><a name="14128" href="Stlc.html#14055" class="Datatype Operator"
      >:=</a
      ><a name="14130"
      > </a
      ><a name="14131" href="Stlc.html#14077" class="Bound"
      >s</a
      ><a name="14132"
      > </a
      ><a name="14133" href="Stlc.html#14055" class="Datatype Operator"
      >]</a
      ><a name="14134"
      > </a
      ><a name="14135" class="Symbol"
      >(</a
      ><a name="14136" href="Stlc.html#6133" class="InductiveConstructor"
      >var</a
      ><a name="14139"
      > </a
      ><a name="14140" href="Stlc.html#14068" class="Bound"
      >x</a
      ><a name="14141" class="Symbol"
      >)</a
      ><a name="14142"
      > </a
      ><a name="14143" href="Stlc.html#14055" class="Datatype Operator"
      >==&gt;</a
      ><a name="14146"
      > </a
      ><a name="14147" href="Stlc.html#14077" class="Bound"
      >s</a
      ><a name="14148"
      >
  </a
      ><a name="14151" class="Comment"
      >{- FILL IN HERE -}</a
      >
{% endraw %}</pre>

<pre class="Agda">{% raw %}
<a name="14195" class="Keyword"
      >postulate</a
      ><a name="14204"
      >
  </a
      ><a name="14207" href="Stlc.html#14207" class="Postulate"
      >subst-correct</a
      ><a name="14220"
      > </a
      ><a name="14221" class="Symbol"
      >:</a
      ><a name="14222"
      > </a
      ><a name="14223" class="Symbol"
      >&#8704;</a
      ><a name="14224"
      > </a
      ><a name="14225" href="Stlc.html#14225" class="Bound"
      >s</a
      ><a name="14226"
      > </a
      ><a name="14227" href="Stlc.html#14227" class="Bound"
      >x</a
      ><a name="14228"
      > </a
      ><a name="14229" href="Stlc.html#14229" class="Bound"
      >t</a
      ><a name="14230"
      > </a
      ><a name="14231" href="Stlc.html#14231" class="Bound"
      >t'</a
      ><a name="14233"
      >
                </a
      ><a name="14250" class="Symbol"
      >&#8594;</a
      ><a name="14251"
      > </a
      ><a name="14252" href="Stlc.html#12659" class="Function Operator"
      >[</a
      ><a name="14253"
      > </a
      ><a name="14254" href="Stlc.html#14227" class="Bound"
      >x</a
      ><a name="14255"
      > </a
      ><a name="14256" href="Stlc.html#12659" class="Function Operator"
      >:=</a
      ><a name="14258"
      > </a
      ><a name="14259" href="Stlc.html#14225" class="Bound"
      >s</a
      ><a name="14260"
      > </a
      ><a name="14261" href="Stlc.html#12659" class="Function Operator"
      >]</a
      ><a name="14262"
      > </a
      ><a name="14263" href="Stlc.html#14229" class="Bound"
      >t</a
      ><a name="14264"
      > </a
      ><a name="14265" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="14266"
      > </a
      ><a name="14267" href="Stlc.html#14231" class="Bound"
      >t'</a
      ><a name="14269"
      >
                </a
      ><a name="14286" class="Symbol"
      >&#8594;</a
      ><a name="14287"
      > </a
      ><a name="14288" href="Stlc.html#14055" class="Datatype Operator"
      >[</a
      ><a name="14289"
      > </a
      ><a name="14290" href="Stlc.html#14227" class="Bound"
      >x</a
      ><a name="14291"
      > </a
      ><a name="14292" href="Stlc.html#14055" class="Datatype Operator"
      >:=</a
      ><a name="14294"
      > </a
      ><a name="14295" href="Stlc.html#14225" class="Bound"
      >s</a
      ><a name="14296"
      > </a
      ><a name="14297" href="Stlc.html#14055" class="Datatype Operator"
      >]</a
      ><a name="14298"
      > </a
      ><a name="14299" href="Stlc.html#14229" class="Bound"
      >t</a
      ><a name="14300"
      > </a
      ><a name="14301" href="Stlc.html#14055" class="Datatype Operator"
      >==&gt;</a
      ><a name="14304"
      > </a
      ><a name="14305" href="Stlc.html#14231" class="Bound"
      >t'</a
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
<a name="15571" class="Keyword"
      >data</a
      ><a name="15575"
      > </a
      ><a name="15576" href="Stlc.html#15576" class="Datatype Operator"
      >_==&gt;_</a
      ><a name="15581"
      > </a
      ><a name="15582" class="Symbol"
      >:</a
      ><a name="15583"
      > </a
      ><a name="15584" href="Stlc.html#6114" class="Datatype"
      >Term</a
      ><a name="15588"
      > </a
      ><a name="15589" class="Symbol"
      >&#8594;</a
      ><a name="15590"
      > </a
      ><a name="15591" href="Stlc.html#6114" class="Datatype"
      >Term</a
      ><a name="15595"
      > </a
      ><a name="15596" class="Symbol"
      >&#8594;</a
      ><a name="15597"
      > </a
      ><a name="15598" class="PrimitiveType"
      >Set</a
      ><a name="15601"
      > </a
      ><a name="15602" class="Keyword"
      >where</a
      ><a name="15607"
      >
  </a
      ><a name="15610" href="Stlc.html#15610" class="InductiveConstructor"
      >red</a
      ><a name="15613"
      >     </a
      ><a name="15618" class="Symbol"
      >:</a
      ><a name="15619"
      > </a
      ><a name="15620" class="Symbol"
      >&#8704;</a
      ><a name="15621"
      > </a
      ><a name="15622" class="Symbol"
      >{</a
      ><a name="15623" href="Stlc.html#15623" class="Bound"
      >x</a
      ><a name="15624"
      > </a
      ><a name="15625" href="Stlc.html#15625" class="Bound"
      >A</a
      ><a name="15626"
      > </a
      ><a name="15627" href="Stlc.html#15627" class="Bound"
      >s</a
      ><a name="15628"
      > </a
      ><a name="15629" href="Stlc.html#15629" class="Bound"
      >t</a
      ><a name="15630" class="Symbol"
      >}</a
      ><a name="15631"
      >
          </a
      ><a name="15642" class="Symbol"
      >&#8594;</a
      ><a name="15643"
      > </a
      ><a name="15644" href="Stlc.html#9439" class="Datatype"
      >Value</a
      ><a name="15649"
      > </a
      ><a name="15650" href="Stlc.html#15629" class="Bound"
      >t</a
      ><a name="15651"
      >
          </a
      ><a name="15662" class="Symbol"
      >&#8594;</a
      ><a name="15663"
      > </a
      ><a name="15664" href="Stlc.html#6153" class="InductiveConstructor"
      >app</a
      ><a name="15667"
      > </a
      ><a name="15668" class="Symbol"
      >(</a
      ><a name="15669" href="Stlc.html#6182" class="InductiveConstructor"
      >abs</a
      ><a name="15672"
      > </a
      ><a name="15673" href="Stlc.html#15623" class="Bound"
      >x</a
      ><a name="15674"
      > </a
      ><a name="15675" href="Stlc.html#15625" class="Bound"
      >A</a
      ><a name="15676"
      > </a
      ><a name="15677" href="Stlc.html#15627" class="Bound"
      >s</a
      ><a name="15678" class="Symbol"
      >)</a
      ><a name="15679"
      > </a
      ><a name="15680" href="Stlc.html#15629" class="Bound"
      >t</a
      ><a name="15681"
      > </a
      ><a name="15682" href="Stlc.html#15576" class="Datatype Operator"
      >==&gt;</a
      ><a name="15685"
      > </a
      ><a name="15686" href="Stlc.html#12659" class="Function Operator"
      >[</a
      ><a name="15687"
      > </a
      ><a name="15688" href="Stlc.html#15623" class="Bound"
      >x</a
      ><a name="15689"
      > </a
      ><a name="15690" href="Stlc.html#12659" class="Function Operator"
      >:=</a
      ><a name="15692"
      > </a
      ><a name="15693" href="Stlc.html#15629" class="Bound"
      >t</a
      ><a name="15694"
      > </a
      ><a name="15695" href="Stlc.html#12659" class="Function Operator"
      >]</a
      ><a name="15696"
      > </a
      ><a name="15697" href="Stlc.html#15627" class="Bound"
      >s</a
      ><a name="15698"
      >
  </a
      ><a name="15701" href="Stlc.html#15701" class="InductiveConstructor"
      >app1</a
      ><a name="15705"
      >    </a
      ><a name="15709" class="Symbol"
      >:</a
      ><a name="15710"
      > </a
      ><a name="15711" class="Symbol"
      >&#8704;</a
      ><a name="15712"
      > </a
      ><a name="15713" class="Symbol"
      >{</a
      ><a name="15714" href="Stlc.html#15714" class="Bound"
      >s</a
      ><a name="15715"
      > </a
      ><a name="15716" href="Stlc.html#15716" class="Bound"
      >s'</a
      ><a name="15718"
      > </a
      ><a name="15719" href="Stlc.html#15719" class="Bound"
      >t</a
      ><a name="15720" class="Symbol"
      >}</a
      ><a name="15721"
      >
          </a
      ><a name="15732" class="Symbol"
      >&#8594;</a
      ><a name="15733"
      > </a
      ><a name="15734" href="Stlc.html#15714" class="Bound"
      >s</a
      ><a name="15735"
      > </a
      ><a name="15736" href="Stlc.html#15576" class="Datatype Operator"
      >==&gt;</a
      ><a name="15739"
      > </a
      ><a name="15740" href="Stlc.html#15716" class="Bound"
      >s'</a
      ><a name="15742"
      >
          </a
      ><a name="15753" class="Symbol"
      >&#8594;</a
      ><a name="15754"
      > </a
      ><a name="15755" href="Stlc.html#6153" class="InductiveConstructor"
      >app</a
      ><a name="15758"
      > </a
      ><a name="15759" href="Stlc.html#15714" class="Bound"
      >s</a
      ><a name="15760"
      > </a
      ><a name="15761" href="Stlc.html#15719" class="Bound"
      >t</a
      ><a name="15762"
      > </a
      ><a name="15763" href="Stlc.html#15576" class="Datatype Operator"
      >==&gt;</a
      ><a name="15766"
      > </a
      ><a name="15767" href="Stlc.html#6153" class="InductiveConstructor"
      >app</a
      ><a name="15770"
      > </a
      ><a name="15771" href="Stlc.html#15716" class="Bound"
      >s'</a
      ><a name="15773"
      > </a
      ><a name="15774" href="Stlc.html#15719" class="Bound"
      >t</a
      ><a name="15775"
      >
  </a
      ><a name="15778" href="Stlc.html#15778" class="InductiveConstructor"
      >app2</a
      ><a name="15782"
      >    </a
      ><a name="15786" class="Symbol"
      >:</a
      ><a name="15787"
      > </a
      ><a name="15788" class="Symbol"
      >&#8704;</a
      ><a name="15789"
      > </a
      ><a name="15790" class="Symbol"
      >{</a
      ><a name="15791" href="Stlc.html#15791" class="Bound"
      >s</a
      ><a name="15792"
      > </a
      ><a name="15793" href="Stlc.html#15793" class="Bound"
      >t</a
      ><a name="15794"
      > </a
      ><a name="15795" href="Stlc.html#15795" class="Bound"
      >t'</a
      ><a name="15797" class="Symbol"
      >}</a
      ><a name="15798"
      >
          </a
      ><a name="15809" class="Symbol"
      >&#8594;</a
      ><a name="15810"
      > </a
      ><a name="15811" href="Stlc.html#9439" class="Datatype"
      >Value</a
      ><a name="15816"
      > </a
      ><a name="15817" href="Stlc.html#15791" class="Bound"
      >s</a
      ><a name="15818"
      >
          </a
      ><a name="15829" class="Symbol"
      >&#8594;</a
      ><a name="15830"
      > </a
      ><a name="15831" href="Stlc.html#15793" class="Bound"
      >t</a
      ><a name="15832"
      > </a
      ><a name="15833" href="Stlc.html#15576" class="Datatype Operator"
      >==&gt;</a
      ><a name="15836"
      > </a
      ><a name="15837" href="Stlc.html#15795" class="Bound"
      >t'</a
      ><a name="15839"
      >
          </a
      ><a name="15850" class="Symbol"
      >&#8594;</a
      ><a name="15851"
      > </a
      ><a name="15852" href="Stlc.html#6153" class="InductiveConstructor"
      >app</a
      ><a name="15855"
      > </a
      ><a name="15856" href="Stlc.html#15791" class="Bound"
      >s</a
      ><a name="15857"
      > </a
      ><a name="15858" href="Stlc.html#15793" class="Bound"
      >t</a
      ><a name="15859"
      > </a
      ><a name="15860" href="Stlc.html#15576" class="Datatype Operator"
      >==&gt;</a
      ><a name="15863"
      > </a
      ><a name="15864" href="Stlc.html#6153" class="InductiveConstructor"
      >app</a
      ><a name="15867"
      > </a
      ><a name="15868" href="Stlc.html#15791" class="Bound"
      >s</a
      ><a name="15869"
      > </a
      ><a name="15870" href="Stlc.html#15795" class="Bound"
      >t'</a
      ><a name="15872"
      >
  </a
      ><a name="15875" href="Stlc.html#15875" class="InductiveConstructor"
      >if</a
      ><a name="15877"
      >      </a
      ><a name="15883" class="Symbol"
      >:</a
      ><a name="15884"
      > </a
      ><a name="15885" class="Symbol"
      >&#8704;</a
      ><a name="15886"
      > </a
      ><a name="15887" class="Symbol"
      >{</a
      ><a name="15888" href="Stlc.html#15888" class="Bound"
      >s</a
      ><a name="15889"
      > </a
      ><a name="15890" href="Stlc.html#15890" class="Bound"
      >s'</a
      ><a name="15892"
      > </a
      ><a name="15893" href="Stlc.html#15893" class="Bound"
      >t</a
      ><a name="15894"
      > </a
      ><a name="15895" href="Stlc.html#15895" class="Bound"
      >u</a
      ><a name="15896" class="Symbol"
      >}</a
      ><a name="15897"
      >
          </a
      ><a name="15908" class="Symbol"
      >&#8594;</a
      ><a name="15909"
      > </a
      ><a name="15910" href="Stlc.html#15888" class="Bound"
      >s</a
      ><a name="15911"
      > </a
      ><a name="15912" href="Stlc.html#15576" class="Datatype Operator"
      >==&gt;</a
      ><a name="15915"
      > </a
      ><a name="15916" href="Stlc.html#15890" class="Bound"
      >s'</a
      ><a name="15918"
      >
          </a
      ><a name="15929" class="Symbol"
      >&#8594;</a
      ><a name="15930"
      > </a
      ><a name="15931" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >if</a
      ><a name="15933"
      > </a
      ><a name="15934" href="Stlc.html#15888" class="Bound"
      >s</a
      ><a name="15935"
      > </a
      ><a name="15936" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >then</a
      ><a name="15940"
      > </a
      ><a name="15941" href="Stlc.html#15893" class="Bound"
      >t</a
      ><a name="15942"
      > </a
      ><a name="15943" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >else</a
      ><a name="15947"
      > </a
      ><a name="15948" href="Stlc.html#15895" class="Bound"
      >u</a
      ><a name="15949"
      > </a
      ><a name="15950" href="Stlc.html#15576" class="Datatype Operator"
      >==&gt;</a
      ><a name="15953"
      > </a
      ><a name="15954" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >if</a
      ><a name="15956"
      > </a
      ><a name="15957" href="Stlc.html#15890" class="Bound"
      >s'</a
      ><a name="15959"
      > </a
      ><a name="15960" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >then</a
      ><a name="15964"
      > </a
      ><a name="15965" href="Stlc.html#15893" class="Bound"
      >t</a
      ><a name="15966"
      > </a
      ><a name="15967" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >else</a
      ><a name="15971"
      > </a
      ><a name="15972" href="Stlc.html#15895" class="Bound"
      >u</a
      ><a name="15973"
      >
  </a
      ><a name="15976" href="Stlc.html#15976" class="InductiveConstructor"
      >iftrue</a
      ><a name="15982"
      >  </a
      ><a name="15984" class="Symbol"
      >:</a
      ><a name="15985"
      > </a
      ><a name="15986" class="Symbol"
      >&#8704;</a
      ><a name="15987"
      > </a
      ><a name="15988" class="Symbol"
      >{</a
      ><a name="15989" href="Stlc.html#15989" class="Bound"
      >s</a
      ><a name="15990"
      > </a
      ><a name="15991" href="Stlc.html#15991" class="Bound"
      >t</a
      ><a name="15992" class="Symbol"
      >}</a
      ><a name="15993"
      >
          </a
      ><a name="16004" class="Symbol"
      >&#8594;</a
      ><a name="16005"
      > </a
      ><a name="16006" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >if</a
      ><a name="16008"
      > </a
      ><a name="16009" href="Stlc.html#6216" class="InductiveConstructor"
      >true</a
      ><a name="16013"
      > </a
      ><a name="16014" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >then</a
      ><a name="16018"
      > </a
      ><a name="16019" href="Stlc.html#15989" class="Bound"
      >s</a
      ><a name="16020"
      > </a
      ><a name="16021" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >else</a
      ><a name="16025"
      > </a
      ><a name="16026" href="Stlc.html#15991" class="Bound"
      >t</a
      ><a name="16027"
      > </a
      ><a name="16028" href="Stlc.html#15576" class="Datatype Operator"
      >==&gt;</a
      ><a name="16031"
      > </a
      ><a name="16032" href="Stlc.html#15989" class="Bound"
      >s</a
      ><a name="16033"
      >
  </a
      ><a name="16036" href="Stlc.html#16036" class="InductiveConstructor"
      >iffalse</a
      ><a name="16043"
      > </a
      ><a name="16044" class="Symbol"
      >:</a
      ><a name="16045"
      > </a
      ><a name="16046" class="Symbol"
      >&#8704;</a
      ><a name="16047"
      > </a
      ><a name="16048" class="Symbol"
      >{</a
      ><a name="16049" href="Stlc.html#16049" class="Bound"
      >s</a
      ><a name="16050"
      > </a
      ><a name="16051" href="Stlc.html#16051" class="Bound"
      >t</a
      ><a name="16052" class="Symbol"
      >}</a
      ><a name="16053"
      >
          </a
      ><a name="16064" class="Symbol"
      >&#8594;</a
      ><a name="16065"
      > </a
      ><a name="16066" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >if</a
      ><a name="16068"
      > </a
      ><a name="16069" href="Stlc.html#6231" class="InductiveConstructor"
      >false</a
      ><a name="16074"
      > </a
      ><a name="16075" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >then</a
      ><a name="16079"
      > </a
      ><a name="16080" href="Stlc.html#16049" class="Bound"
      >s</a
      ><a name="16081"
      > </a
      ><a name="16082" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >else</a
      ><a name="16086"
      > </a
      ><a name="16087" href="Stlc.html#16051" class="Bound"
      >t</a
      ><a name="16088"
      > </a
      ><a name="16089" href="Stlc.html#15576" class="Datatype Operator"
      >==&gt;</a
      ><a name="16092"
      > </a
      ><a name="16093" href="Stlc.html#16051" class="Bound"
      >t</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="16141" class="Keyword"
      >infix</a
      ><a name="16146"
      > </a
      ><a name="16147" class="Number"
      >1</a
      >
{% endraw %}</pre>
</div>

<pre class="Agda">{% raw %}
<a name="16187" class="Keyword"
      >data</a
      ><a name="16191"
      > </a
      ><a name="16192" href="Stlc.html#16192" class="Datatype"
      >Multi</a
      ><a name="16197"
      > </a
      ><a name="16198" class="Symbol"
      >(</a
      ><a name="16199" href="Stlc.html#16199" class="Bound"
      >R</a
      ><a name="16200"
      > </a
      ><a name="16201" class="Symbol"
      >:</a
      ><a name="16202"
      > </a
      ><a name="16203" href="Stlc.html#6114" class="Datatype"
      >Term</a
      ><a name="16207"
      > </a
      ><a name="16208" class="Symbol"
      >&#8594;</a
      ><a name="16209"
      > </a
      ><a name="16210" href="Stlc.html#6114" class="Datatype"
      >Term</a
      ><a name="16214"
      > </a
      ><a name="16215" class="Symbol"
      >&#8594;</a
      ><a name="16216"
      > </a
      ><a name="16217" class="PrimitiveType"
      >Set</a
      ><a name="16220" class="Symbol"
      >)</a
      ><a name="16221"
      > </a
      ><a name="16222" class="Symbol"
      >:</a
      ><a name="16223"
      > </a
      ><a name="16224" href="Stlc.html#6114" class="Datatype"
      >Term</a
      ><a name="16228"
      > </a
      ><a name="16229" class="Symbol"
      >&#8594;</a
      ><a name="16230"
      > </a
      ><a name="16231" href="Stlc.html#6114" class="Datatype"
      >Term</a
      ><a name="16235"
      > </a
      ><a name="16236" class="Symbol"
      >&#8594;</a
      ><a name="16237"
      > </a
      ><a name="16238" class="PrimitiveType"
      >Set</a
      ><a name="16241"
      > </a
      ><a name="16242" class="Keyword"
      >where</a
      ><a name="16247"
      >
  </a
      ><a name="16250" href="Stlc.html#16250" class="InductiveConstructor"
      >refl</a
      ><a name="16254"
      > </a
      ><a name="16255" class="Symbol"
      >:</a
      ><a name="16256"
      > </a
      ><a name="16257" class="Symbol"
      >&#8704;</a
      ><a name="16258"
      > </a
      ><a name="16259" class="Symbol"
      >{</a
      ><a name="16260" href="Stlc.html#16260" class="Bound"
      >x</a
      ><a name="16261" class="Symbol"
      >}</a
      ><a name="16262"
      > </a
      ><a name="16263" class="Symbol"
      >-&gt;</a
      ><a name="16265"
      > </a
      ><a name="16266" href="Stlc.html#16192" class="Datatype"
      >Multi</a
      ><a name="16271"
      > </a
      ><a name="16272" href="Stlc.html#16199" class="Bound"
      >R</a
      ><a name="16273"
      > </a
      ><a name="16274" href="Stlc.html#16260" class="Bound"
      >x</a
      ><a name="16275"
      > </a
      ><a name="16276" href="Stlc.html#16260" class="Bound"
      >x</a
      ><a name="16277"
      >
  </a
      ><a name="16280" href="Stlc.html#16280" class="InductiveConstructor"
      >step</a
      ><a name="16284"
      > </a
      ><a name="16285" class="Symbol"
      >:</a
      ><a name="16286"
      > </a
      ><a name="16287" class="Symbol"
      >&#8704;</a
      ><a name="16288"
      > </a
      ><a name="16289" class="Symbol"
      >{</a
      ><a name="16290" href="Stlc.html#16290" class="Bound"
      >x</a
      ><a name="16291"
      > </a
      ><a name="16292" href="Stlc.html#16292" class="Bound"
      >y</a
      ><a name="16293"
      > </a
      ><a name="16294" href="Stlc.html#16294" class="Bound"
      >z</a
      ><a name="16295" class="Symbol"
      >}</a
      ><a name="16296"
      > </a
      ><a name="16297" class="Symbol"
      >-&gt;</a
      ><a name="16299"
      > </a
      ><a name="16300" href="Stlc.html#16199" class="Bound"
      >R</a
      ><a name="16301"
      > </a
      ><a name="16302" href="Stlc.html#16290" class="Bound"
      >x</a
      ><a name="16303"
      > </a
      ><a name="16304" href="Stlc.html#16292" class="Bound"
      >y</a
      ><a name="16305"
      > </a
      ><a name="16306" class="Symbol"
      >-&gt;</a
      ><a name="16308"
      > </a
      ><a name="16309" href="Stlc.html#16192" class="Datatype"
      >Multi</a
      ><a name="16314"
      > </a
      ><a name="16315" href="Stlc.html#16199" class="Bound"
      >R</a
      ><a name="16316"
      > </a
      ><a name="16317" href="Stlc.html#16292" class="Bound"
      >y</a
      ><a name="16318"
      > </a
      ><a name="16319" href="Stlc.html#16294" class="Bound"
      >z</a
      ><a name="16320"
      > </a
      ><a name="16321" class="Symbol"
      >-&gt;</a
      ><a name="16323"
      > </a
      ><a name="16324" href="Stlc.html#16192" class="Datatype"
      >Multi</a
      ><a name="16329"
      > </a
      ><a name="16330" href="Stlc.html#16199" class="Bound"
      >R</a
      ><a name="16331"
      > </a
      ><a name="16332" href="Stlc.html#16290" class="Bound"
      >x</a
      ><a name="16333"
      > </a
      ><a name="16334" href="Stlc.html#16294" class="Bound"
      >z</a
      >
{% endraw %}</pre>

<pre class="Agda">{% raw %}
<a name="16361" href="Stlc.html#16361" class="Function Operator"
      >_==&gt;*_</a
      ><a name="16367"
      > </a
      ><a name="16368" class="Symbol"
      >:</a
      ><a name="16369"
      > </a
      ><a name="16370" href="Stlc.html#6114" class="Datatype"
      >Term</a
      ><a name="16374"
      > </a
      ><a name="16375" class="Symbol"
      >&#8594;</a
      ><a name="16376"
      > </a
      ><a name="16377" href="Stlc.html#6114" class="Datatype"
      >Term</a
      ><a name="16381"
      > </a
      ><a name="16382" class="Symbol"
      >&#8594;</a
      ><a name="16383"
      > </a
      ><a name="16384" class="PrimitiveType"
      >Set</a
      ><a name="16387"
      >
</a
      ><a name="16388" href="Stlc.html#16361" class="Function Operator"
      >_==&gt;*_</a
      ><a name="16394"
      > </a
      ><a name="16395" class="Symbol"
      >=</a
      ><a name="16396"
      > </a
      ><a name="16397" href="Stlc.html#16192" class="Datatype"
      >Multi</a
      ><a name="16402"
      > </a
      ><a name="16403" href="Stlc.html#15576" class="Datatype Operator"
      >_==&gt;_</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="16455" class="Symbol"
      >{-#</a
      ><a name="16458"
      > </a
      ><a name="16459" class="Keyword"
      >DISPLAY</a
      ><a name="16466"
      > </a
      ><a name="16467" href="Stlc.html#16192" class="Datatype"
      >Multi</a
      ><a name="16472"
      > </a
      ><a name="16473" href="Stlc.html#16473" class="Bound Operator"
      >_==&gt;_</a
      ><a name="16478"
      > = </a
      ><a name="16481" href="Stlc.html#16361" class="Function Operator"
      >_==&gt;*_</a
      ><a name="16487"
      > </a
      ><a name="16488" class="Symbol"
      >#-}</a
      >
{% endraw %}</pre>
</div>

### Examples

Example:

$$((\lambda x:bool\rightarrow bool. x) (\lambda x:bool. x)) \Longrightarrow^* (\lambda x:bool. x)$$.

<pre class="Agda">{% raw %}
<a name="16650" href="Stlc.html#16650" class="Function"
      >step-example1</a
      ><a name="16663"
      > </a
      ><a name="16664" class="Symbol"
      >:</a
      ><a name="16665"
      > </a
      ><a name="16666" class="Symbol"
      >(</a
      ><a name="16667" href="Stlc.html#6153" class="InductiveConstructor"
      >app</a
      ><a name="16670"
      > </a
      ><a name="16671" href="Stlc.html#7050" class="Function"
      >idBB</a
      ><a name="16675"
      > </a
      ><a name="16676" href="Stlc.html#6944" class="Function"
      >idB</a
      ><a name="16679" class="Symbol"
      >)</a
      ><a name="16680"
      > </a
      ><a name="16681" href="Stlc.html#16361" class="Function Operator"
      >==&gt;*</a
      ><a name="16685"
      > </a
      ><a name="16686" href="Stlc.html#6944" class="Function"
      >idB</a
      ><a name="16689"
      >
</a
      ><a name="16690" href="Stlc.html#16650" class="Function"
      >step-example1</a
      ><a name="16703"
      > </a
      ><a name="16704" class="Symbol"
      >=</a
      ><a name="16705"
      > </a
      ><a name="16706" href="Stlc.html#16280" class="InductiveConstructor"
      >step</a
      ><a name="16710"
      > </a
      ><a name="16711" class="Symbol"
      >(</a
      ><a name="16712" href="Stlc.html#15610" class="InductiveConstructor"
      >red</a
      ><a name="16715"
      > </a
      ><a name="16716" href="Stlc.html#9466" class="InductiveConstructor"
      >abs</a
      ><a name="16719" class="Symbol"
      >)</a
      ><a name="16720"
      >
              </a
      ><a name="16735" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="16736"
      > </a
      ><a name="16737" href="Stlc.html#16250" class="InductiveConstructor"
      >refl</a
      >
{% endraw %}</pre>

Example:

$$(\lambda x:bool\rightarrow bool. x) \;((\lambda x:bool\rightarrow bool. x)\;(\lambda x:bool. x))) \Longrightarrow^* (\lambda x:bool. x)$$.

<pre class="Agda">{% raw %}
<a name="16919" href="Stlc.html#16919" class="Function"
      >step-example2</a
      ><a name="16932"
      > </a
      ><a name="16933" class="Symbol"
      >:</a
      ><a name="16934"
      > </a
      ><a name="16935" class="Symbol"
      >(</a
      ><a name="16936" href="Stlc.html#6153" class="InductiveConstructor"
      >app</a
      ><a name="16939"
      > </a
      ><a name="16940" href="Stlc.html#7050" class="Function"
      >idBB</a
      ><a name="16944"
      > </a
      ><a name="16945" class="Symbol"
      >(</a
      ><a name="16946" href="Stlc.html#6153" class="InductiveConstructor"
      >app</a
      ><a name="16949"
      > </a
      ><a name="16950" href="Stlc.html#7050" class="Function"
      >idBB</a
      ><a name="16954"
      > </a
      ><a name="16955" href="Stlc.html#6944" class="Function"
      >idB</a
      ><a name="16958" class="Symbol"
      >))</a
      ><a name="16960"
      > </a
      ><a name="16961" href="Stlc.html#16361" class="Function Operator"
      >==&gt;*</a
      ><a name="16965"
      > </a
      ><a name="16966" href="Stlc.html#6944" class="Function"
      >idB</a
      ><a name="16969"
      >
</a
      ><a name="16970" href="Stlc.html#16919" class="Function"
      >step-example2</a
      ><a name="16983"
      > </a
      ><a name="16984" class="Symbol"
      >=</a
      ><a name="16985"
      > </a
      ><a name="16986" href="Stlc.html#16280" class="InductiveConstructor"
      >step</a
      ><a name="16990"
      > </a
      ><a name="16991" class="Symbol"
      >(</a
      ><a name="16992" href="Stlc.html#15778" class="InductiveConstructor"
      >app2</a
      ><a name="16996"
      > </a
      ><a name="16997" href="Stlc.html#9466" class="InductiveConstructor"
      >abs</a
      ><a name="17000"
      > </a
      ><a name="17001" class="Symbol"
      >(</a
      ><a name="17002" href="Stlc.html#15610" class="InductiveConstructor"
      >red</a
      ><a name="17005"
      > </a
      ><a name="17006" href="Stlc.html#9466" class="InductiveConstructor"
      >abs</a
      ><a name="17009" class="Symbol"
      >))</a
      ><a name="17011"
      >
              </a
      ><a name="17026" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="17027"
      > </a
      ><a name="17028" href="Stlc.html#16280" class="InductiveConstructor"
      >step</a
      ><a name="17032"
      > </a
      ><a name="17033" class="Symbol"
      >(</a
      ><a name="17034" href="Stlc.html#15610" class="InductiveConstructor"
      >red</a
      ><a name="17037"
      > </a
      ><a name="17038" href="Stlc.html#9466" class="InductiveConstructor"
      >abs</a
      ><a name="17041" class="Symbol"
      >)</a
      ><a name="17042"
      >
              </a
      ><a name="17057" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="17058"
      > </a
      ><a name="17059" href="Stlc.html#16250" class="InductiveConstructor"
      >refl</a
      >
{% endraw %}</pre>

Example:

$$((\lambda x:bool\rightarrow bool. x)\;(\lambda x:bool. \text{if }x\text{ then }false\text{ else }true))\;true\Longrightarrow^* false$$.

<pre class="Agda">{% raw %}
<a name="17238" href="Stlc.html#17238" class="Function"
      >step-example3</a
      ><a name="17251"
      > </a
      ><a name="17252" class="Symbol"
      >:</a
      ><a name="17253"
      > </a
      ><a name="17254" class="Symbol"
      >(</a
      ><a name="17255" href="Stlc.html#6153" class="InductiveConstructor"
      >app</a
      ><a name="17258"
      > </a
      ><a name="17259" class="Symbol"
      >(</a
      ><a name="17260" href="Stlc.html#6153" class="InductiveConstructor"
      >app</a
      ><a name="17263"
      > </a
      ><a name="17264" href="Stlc.html#7050" class="Function"
      >idBB</a
      ><a name="17268"
      > </a
      ><a name="17269" href="Stlc.html#7483" class="Function"
      >notB</a
      ><a name="17273" class="Symbol"
      >)</a
      ><a name="17274"
      > </a
      ><a name="17275" href="Stlc.html#6216" class="InductiveConstructor"
      >true</a
      ><a name="17279" class="Symbol"
      >)</a
      ><a name="17280"
      > </a
      ><a name="17281" href="Stlc.html#16361" class="Function Operator"
      >==&gt;*</a
      ><a name="17285"
      > </a
      ><a name="17286" href="Stlc.html#6231" class="InductiveConstructor"
      >false</a
      ><a name="17291"
      >
</a
      ><a name="17292" href="Stlc.html#17238" class="Function"
      >step-example3</a
      ><a name="17305"
      > </a
      ><a name="17306" class="Symbol"
      >=</a
      ><a name="17307"
      > </a
      ><a name="17308" href="Stlc.html#16280" class="InductiveConstructor"
      >step</a
      ><a name="17312"
      > </a
      ><a name="17313" class="Symbol"
      >(</a
      ><a name="17314" href="Stlc.html#15701" class="InductiveConstructor"
      >app1</a
      ><a name="17318"
      > </a
      ><a name="17319" class="Symbol"
      >(</a
      ><a name="17320" href="Stlc.html#15610" class="InductiveConstructor"
      >red</a
      ><a name="17323"
      > </a
      ><a name="17324" href="Stlc.html#9466" class="InductiveConstructor"
      >abs</a
      ><a name="17327" class="Symbol"
      >))</a
      ><a name="17329"
      >
              </a
      ><a name="17344" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="17345"
      > </a
      ><a name="17346" href="Stlc.html#16280" class="InductiveConstructor"
      >step</a
      ><a name="17350"
      > </a
      ><a name="17351" class="Symbol"
      >(</a
      ><a name="17352" href="Stlc.html#15610" class="InductiveConstructor"
      >red</a
      ><a name="17355"
      > </a
      ><a name="17356" href="Stlc.html#9514" class="InductiveConstructor"
      >true</a
      ><a name="17360" class="Symbol"
      >)</a
      ><a name="17361"
      >
              </a
      ><a name="17376" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="17377"
      > </a
      ><a name="17378" href="Stlc.html#16280" class="InductiveConstructor"
      >step</a
      ><a name="17382"
      > </a
      ><a name="17383" href="Stlc.html#15976" class="InductiveConstructor"
      >iftrue</a
      ><a name="17389"
      >
              </a
      ><a name="17404" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="17405"
      > </a
      ><a name="17406" href="Stlc.html#16250" class="InductiveConstructor"
      >refl</a
      >
{% endraw %}</pre>

Example:

$$((\lambda x:bool\rightarrow bool. x)\;((\lambda x:bool. \text{if }x\text{ then }false\text{ else }true)\;true))\Longrightarrow^* false$$.

<pre class="Agda">{% raw %}
<a name="17587" href="Stlc.html#17587" class="Function"
      >step-example4</a
      ><a name="17600"
      > </a
      ><a name="17601" class="Symbol"
      >:</a
      ><a name="17602"
      > </a
      ><a name="17603" class="Symbol"
      >(</a
      ><a name="17604" href="Stlc.html#6153" class="InductiveConstructor"
      >app</a
      ><a name="17607"
      > </a
      ><a name="17608" href="Stlc.html#7050" class="Function"
      >idBB</a
      ><a name="17612"
      > </a
      ><a name="17613" class="Symbol"
      >(</a
      ><a name="17614" href="Stlc.html#6153" class="InductiveConstructor"
      >app</a
      ><a name="17617"
      > </a
      ><a name="17618" href="Stlc.html#7483" class="Function"
      >notB</a
      ><a name="17622"
      > </a
      ><a name="17623" href="Stlc.html#6216" class="InductiveConstructor"
      >true</a
      ><a name="17627" class="Symbol"
      >))</a
      ><a name="17629"
      > </a
      ><a name="17630" href="Stlc.html#16361" class="Function Operator"
      >==&gt;*</a
      ><a name="17634"
      > </a
      ><a name="17635" href="Stlc.html#6231" class="InductiveConstructor"
      >false</a
      ><a name="17640"
      >
</a
      ><a name="17641" href="Stlc.html#17587" class="Function"
      >step-example4</a
      ><a name="17654"
      > </a
      ><a name="17655" class="Symbol"
      >=</a
      ><a name="17656"
      > </a
      ><a name="17657" href="Stlc.html#16280" class="InductiveConstructor"
      >step</a
      ><a name="17661"
      > </a
      ><a name="17662" class="Symbol"
      >(</a
      ><a name="17663" href="Stlc.html#15778" class="InductiveConstructor"
      >app2</a
      ><a name="17667"
      > </a
      ><a name="17668" href="Stlc.html#9466" class="InductiveConstructor"
      >abs</a
      ><a name="17671"
      > </a
      ><a name="17672" class="Symbol"
      >(</a
      ><a name="17673" href="Stlc.html#15610" class="InductiveConstructor"
      >red</a
      ><a name="17676"
      > </a
      ><a name="17677" href="Stlc.html#9514" class="InductiveConstructor"
      >true</a
      ><a name="17681" class="Symbol"
      >))</a
      ><a name="17683"
      >
              </a
      ><a name="17698" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="17699"
      > </a
      ><a name="17700" href="Stlc.html#16280" class="InductiveConstructor"
      >step</a
      ><a name="17704"
      > </a
      ><a name="17705" class="Symbol"
      >(</a
      ><a name="17706" href="Stlc.html#15778" class="InductiveConstructor"
      >app2</a
      ><a name="17710"
      > </a
      ><a name="17711" href="Stlc.html#9466" class="InductiveConstructor"
      >abs</a
      ><a name="17714"
      > </a
      ><a name="17715" href="Stlc.html#15976" class="InductiveConstructor"
      >iftrue</a
      ><a name="17721" class="Symbol"
      >)</a
      ><a name="17722"
      >
              </a
      ><a name="17737" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="17738"
      > </a
      ><a name="17739" href="Stlc.html#16280" class="InductiveConstructor"
      >step</a
      ><a name="17743"
      > </a
      ><a name="17744" class="Symbol"
      >(</a
      ><a name="17745" href="Stlc.html#15610" class="InductiveConstructor"
      >red</a
      ><a name="17748"
      > </a
      ><a name="17749" href="Stlc.html#9535" class="InductiveConstructor"
      >false</a
      ><a name="17754" class="Symbol"
      >)</a
      ><a name="17755"
      >
              </a
      ><a name="17770" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="17771"
      > </a
      ><a name="17772" href="Stlc.html#16250" class="InductiveConstructor"
      >refl</a
      >
{% endraw %}</pre>

#### Exercise: 2 stars (step-example5)

<pre class="Agda">{% raw %}
<a name="17842" class="Keyword"
      >postulate</a
      ><a name="17851"
      >
  </a
      ><a name="17854" href="Stlc.html#17854" class="Postulate"
      >step-example5</a
      ><a name="17867"
      > </a
      ><a name="17868" class="Symbol"
      >:</a
      ><a name="17869"
      > </a
      ><a name="17870" class="Symbol"
      >(</a
      ><a name="17871" href="Stlc.html#6153" class="InductiveConstructor"
      >app</a
      ><a name="17874"
      > </a
      ><a name="17875" class="Symbol"
      >(</a
      ><a name="17876" href="Stlc.html#6153" class="InductiveConstructor"
      >app</a
      ><a name="17879"
      > </a
      ><a name="17880" href="Stlc.html#7204" class="Function"
      >idBBBB</a
      ><a name="17886"
      > </a
      ><a name="17887" href="Stlc.html#7050" class="Function"
      >idBB</a
      ><a name="17891" class="Symbol"
      >)</a
      ><a name="17892"
      > </a
      ><a name="17893" href="Stlc.html#6944" class="Function"
      >idB</a
      ><a name="17896" class="Symbol"
      >)</a
      ><a name="17897"
      > </a
      ><a name="17898" href="Stlc.html#16361" class="Function Operator"
      >==&gt;*</a
      ><a name="17902"
      > </a
      ><a name="17903" href="Stlc.html#6944" class="Function"
      >idB</a
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
<a name="18623" href="Stlc.html#18623" class="Function"
      >Ctxt</a
      ><a name="18627"
      > </a
      ><a name="18628" class="Symbol"
      >:</a
      ><a name="18629"
      > </a
      ><a name="18630" class="PrimitiveType"
      >Set</a
      ><a name="18633"
      >
</a
      ><a name="18634" href="Stlc.html#18623" class="Function"
      >Ctxt</a
      ><a name="18638"
      > </a
      ><a name="18639" class="Symbol"
      >=</a
      ><a name="18640"
      > </a
      ><a name="18641" href="Stlc.html#5778" class="Datatype"
      >Id</a
      ><a name="18643"
      > </a
      ><a name="18644" class="Symbol"
      >&#8594;</a
      ><a name="18645"
      > </a
      ><a name="18646" href="https://agda.github.io/agda-stdlib/Data.Maybe.Base.html#335" class="Datatype"
      >Maybe</a
      ><a name="18651"
      > </a
      ><a name="18652" href="Stlc.html#5611" class="Datatype"
      >Type</a
      ><a name="18656"
      >

</a
      ><a name="18658" href="Stlc.html#18658" class="Function"
      >&#8709;</a
      ><a name="18659"
      > </a
      ><a name="18660" class="Symbol"
      >:</a
      ><a name="18661"
      > </a
      ><a name="18662" href="Stlc.html#18623" class="Function"
      >Ctxt</a
      ><a name="18666"
      >
</a
      ><a name="18667" href="Stlc.html#18658" class="Function"
      >&#8709;</a
      ><a name="18668"
      > </a
      ><a name="18669" class="Symbol"
      >=</a
      ><a name="18670"
      > </a
      ><a name="18671" class="Symbol"
      >&#955;</a
      ><a name="18672"
      > </a
      ><a name="18673" href="Stlc.html#18673" class="Bound"
      >_</a
      ><a name="18674"
      > </a
      ><a name="18675" class="Symbol"
      >&#8594;</a
      ><a name="18676"
      > </a
      ><a name="18677" href="https://agda.github.io/agda-stdlib/Data.Maybe.Base.html#403" class="InductiveConstructor"
      >nothing</a
      ><a name="18684"
      >

</a
      ><a name="18686" href="Stlc.html#18686" class="Function Operator"
      >_,_&#8758;_</a
      ><a name="18691"
      > </a
      ><a name="18692" class="Symbol"
      >:</a
      ><a name="18693"
      > </a
      ><a name="18694" href="Stlc.html#18623" class="Function"
      >Ctxt</a
      ><a name="18698"
      > </a
      ><a name="18699" class="Symbol"
      >-&gt;</a
      ><a name="18701"
      > </a
      ><a name="18702" href="Stlc.html#5778" class="Datatype"
      >Id</a
      ><a name="18704"
      > </a
      ><a name="18705" class="Symbol"
      >-&gt;</a
      ><a name="18707"
      > </a
      ><a name="18708" href="Stlc.html#5611" class="Datatype"
      >Type</a
      ><a name="18712"
      > </a
      ><a name="18713" class="Symbol"
      >-&gt;</a
      ><a name="18715"
      > </a
      ><a name="18716" href="Stlc.html#18623" class="Function"
      >Ctxt</a
      ><a name="18720"
      >
</a
      ><a name="18721" class="Symbol"
      >(</a
      ><a name="18722" href="Stlc.html#18722" class="Bound"
      >&#915;</a
      ><a name="18723"
      > </a
      ><a name="18724" href="Stlc.html#18686" class="Function Operator"
      >,</a
      ><a name="18725"
      > </a
      ><a name="18726" href="Stlc.html#18726" class="Bound"
      >x</a
      ><a name="18727"
      > </a
      ><a name="18728" href="Stlc.html#18686" class="Function Operator"
      >&#8758;</a
      ><a name="18729"
      > </a
      ><a name="18730" href="Stlc.html#18730" class="Bound"
      >A</a
      ><a name="18731" class="Symbol"
      >)</a
      ><a name="18732"
      > </a
      ><a name="18733" href="Stlc.html#18733" class="Bound"
      >y</a
      ><a name="18734"
      > </a
      ><a name="18735" class="Keyword"
      >with</a
      ><a name="18739"
      > </a
      ><a name="18740" href="Stlc.html#18726" class="Bound"
      >x</a
      ><a name="18741"
      > </a
      ><a name="18742" href="Stlc.html#5853" class="Function Operator"
      >&#8799;</a
      ><a name="18743"
      > </a
      ><a name="18744" href="Stlc.html#18733" class="Bound"
      >y</a
      ><a name="18745"
      >
</a
      ><a name="18746" class="Symbol"
      >...</a
      ><a name="18749"
      > </a
      ><a name="18750" class="Symbol"
      >|</a
      ><a name="18751"
      > </a
      ><a name="18752" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="18755"
      > </a
      ><a name="18756" href="Stlc.html#18756" class="Bound"
      >x=y</a
      ><a name="18759"
      > </a
      ><a name="18760" class="Symbol"
      >=</a
      ><a name="18761"
      > </a
      ><a name="18762" href="https://agda.github.io/agda-stdlib/Data.Maybe.Base.html#373" class="InductiveConstructor"
      >just</a
      ><a name="18766"
      > </a
      ><a name="18767" href="Stlc.html#18730" class="Bound"
      >A</a
      ><a name="18768"
      >
</a
      ><a name="18769" class="Symbol"
      >...</a
      ><a name="18772"
      > </a
      ><a name="18773" class="Symbol"
      >|</a
      ><a name="18774"
      > </a
      ><a name="18775" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="18777"
      >  </a
      ><a name="18779" href="Stlc.html#18779" class="Bound"
      >x&#8800;y</a
      ><a name="18782"
      > </a
      ><a name="18783" class="Symbol"
      >=</a
      ><a name="18784"
      > </a
      ><a name="18785" href="Stlc.html#18722" class="Bound"
      >&#915;</a
      ><a name="18786"
      > </a
      ><a name="18787" href="Stlc.html#18733" class="Bound"
      >y</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="18835" class="Keyword"
      >infixl</a
      ><a name="18841"
      > </a
      ><a name="18842" class="Number"
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
<a name="19624" class="Keyword"
      >data</a
      ><a name="19628"
      > </a
      ><a name="19629" href="Stlc.html#19629" class="Datatype Operator"
      >_&#8866;_&#8758;_</a
      ><a name="19634"
      > </a
      ><a name="19635" class="Symbol"
      >:</a
      ><a name="19636"
      > </a
      ><a name="19637" href="Stlc.html#18623" class="Function"
      >Ctxt</a
      ><a name="19641"
      > </a
      ><a name="19642" class="Symbol"
      >-&gt;</a
      ><a name="19644"
      > </a
      ><a name="19645" href="Stlc.html#6114" class="Datatype"
      >Term</a
      ><a name="19649"
      > </a
      ><a name="19650" class="Symbol"
      >-&gt;</a
      ><a name="19652"
      > </a
      ><a name="19653" href="Stlc.html#5611" class="Datatype"
      >Type</a
      ><a name="19657"
      > </a
      ><a name="19658" class="Symbol"
      >-&gt;</a
      ><a name="19660"
      > </a
      ><a name="19661" class="PrimitiveType"
      >Set</a
      ><a name="19664"
      > </a
      ><a name="19665" class="Keyword"
      >where</a
      ><a name="19670"
      >
  </a
      ><a name="19673" href="Stlc.html#19673" class="InductiveConstructor"
      >var</a
      ><a name="19676"
      >           </a
      ><a name="19687" class="Symbol"
      >:</a
      ><a name="19688"
      > </a
      ><a name="19689" class="Symbol"
      >&#8704;</a
      ><a name="19690"
      > </a
      ><a name="19691" class="Symbol"
      >{</a
      ><a name="19692" href="Stlc.html#19692" class="Bound"
      >&#915;</a
      ><a name="19693" class="Symbol"
      >}</a
      ><a name="19694"
      > </a
      ><a name="19695" href="Stlc.html#19695" class="Bound"
      >x</a
      ><a name="19696"
      > </a
      ><a name="19697" class="Symbol"
      >{</a
      ><a name="19698" href="Stlc.html#19698" class="Bound"
      >A</a
      ><a name="19699" class="Symbol"
      >}</a
      ><a name="19700"
      >
                </a
      ><a name="19717" class="Symbol"
      >&#8594;</a
      ><a name="19718"
      > </a
      ><a name="19719" href="Stlc.html#19692" class="Bound"
      >&#915;</a
      ><a name="19720"
      > </a
      ><a name="19721" href="Stlc.html#19695" class="Bound"
      >x</a
      ><a name="19722"
      > </a
      ><a name="19723" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="19724"
      > </a
      ><a name="19725" href="https://agda.github.io/agda-stdlib/Data.Maybe.Base.html#373" class="InductiveConstructor"
      >just</a
      ><a name="19729"
      > </a
      ><a name="19730" href="Stlc.html#19698" class="Bound"
      >A</a
      ><a name="19731"
      >
                </a
      ><a name="19748" class="Symbol"
      >&#8594;</a
      ><a name="19749"
      > </a
      ><a name="19750" href="Stlc.html#19692" class="Bound"
      >&#915;</a
      ><a name="19751"
      > </a
      ><a name="19752" href="Stlc.html#19629" class="Datatype Operator"
      >&#8866;</a
      ><a name="19753"
      > </a
      ><a name="19754" href="Stlc.html#6133" class="InductiveConstructor"
      >var</a
      ><a name="19757"
      > </a
      ><a name="19758" href="Stlc.html#19695" class="Bound"
      >x</a
      ><a name="19759"
      > </a
      ><a name="19760" href="Stlc.html#19629" class="Datatype Operator"
      >&#8758;</a
      ><a name="19761"
      > </a
      ><a name="19762" href="Stlc.html#19698" class="Bound"
      >A</a
      ><a name="19763"
      >
  </a
      ><a name="19766" href="Stlc.html#19766" class="InductiveConstructor"
      >abs</a
      ><a name="19769"
      >           </a
      ><a name="19780" class="Symbol"
      >:</a
      ><a name="19781"
      > </a
      ><a name="19782" class="Symbol"
      >&#8704;</a
      ><a name="19783"
      > </a
      ><a name="19784" class="Symbol"
      >{</a
      ><a name="19785" href="Stlc.html#19785" class="Bound"
      >&#915;</a
      ><a name="19786" class="Symbol"
      >}</a
      ><a name="19787"
      > </a
      ><a name="19788" class="Symbol"
      >{</a
      ><a name="19789" href="Stlc.html#19789" class="Bound"
      >x</a
      ><a name="19790" class="Symbol"
      >}</a
      ><a name="19791"
      > </a
      ><a name="19792" class="Symbol"
      >{</a
      ><a name="19793" href="Stlc.html#19793" class="Bound"
      >A</a
      ><a name="19794" class="Symbol"
      >}</a
      ><a name="19795"
      > </a
      ><a name="19796" class="Symbol"
      >{</a
      ><a name="19797" href="Stlc.html#19797" class="Bound"
      >B</a
      ><a name="19798" class="Symbol"
      >}</a
      ><a name="19799"
      > </a
      ><a name="19800" class="Symbol"
      >{</a
      ><a name="19801" href="Stlc.html#19801" class="Bound"
      >s</a
      ><a name="19802" class="Symbol"
      >}</a
      ><a name="19803"
      >
                </a
      ><a name="19820" class="Symbol"
      >&#8594;</a
      ><a name="19821"
      > </a
      ><a name="19822" href="Stlc.html#19785" class="Bound"
      >&#915;</a
      ><a name="19823"
      > </a
      ><a name="19824" href="Stlc.html#18686" class="Function Operator"
      >,</a
      ><a name="19825"
      > </a
      ><a name="19826" href="Stlc.html#19789" class="Bound"
      >x</a
      ><a name="19827"
      > </a
      ><a name="19828" href="Stlc.html#18686" class="Function Operator"
      >&#8758;</a
      ><a name="19829"
      > </a
      ><a name="19830" href="Stlc.html#19793" class="Bound"
      >A</a
      ><a name="19831"
      > </a
      ><a name="19832" href="Stlc.html#19629" class="Datatype Operator"
      >&#8866;</a
      ><a name="19833"
      > </a
      ><a name="19834" href="Stlc.html#19801" class="Bound"
      >s</a
      ><a name="19835"
      > </a
      ><a name="19836" href="Stlc.html#19629" class="Datatype Operator"
      >&#8758;</a
      ><a name="19837"
      > </a
      ><a name="19838" href="Stlc.html#19797" class="Bound"
      >B</a
      ><a name="19839"
      >
                </a
      ><a name="19856" class="Symbol"
      >&#8594;</a
      ><a name="19857"
      > </a
      ><a name="19858" href="Stlc.html#19785" class="Bound"
      >&#915;</a
      ><a name="19859"
      > </a
      ><a name="19860" href="Stlc.html#19629" class="Datatype Operator"
      >&#8866;</a
      ><a name="19861"
      > </a
      ><a name="19862" href="Stlc.html#6182" class="InductiveConstructor"
      >abs</a
      ><a name="19865"
      > </a
      ><a name="19866" href="Stlc.html#19789" class="Bound"
      >x</a
      ><a name="19867"
      > </a
      ><a name="19868" href="Stlc.html#19793" class="Bound"
      >A</a
      ><a name="19869"
      > </a
      ><a name="19870" href="Stlc.html#19801" class="Bound"
      >s</a
      ><a name="19871"
      > </a
      ><a name="19872" href="Stlc.html#19629" class="Datatype Operator"
      >&#8758;</a
      ><a name="19873"
      > </a
      ><a name="19874" href="Stlc.html#19793" class="Bound"
      >A</a
      ><a name="19875"
      > </a
      ><a name="19876" href="Stlc.html#5644" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="19877"
      > </a
      ><a name="19878" href="Stlc.html#19797" class="Bound"
      >B</a
      ><a name="19879"
      >
  </a
      ><a name="19882" href="Stlc.html#19882" class="InductiveConstructor"
      >app</a
      ><a name="19885"
      >           </a
      ><a name="19896" class="Symbol"
      >:</a
      ><a name="19897"
      > </a
      ><a name="19898" class="Symbol"
      >&#8704;</a
      ><a name="19899"
      > </a
      ><a name="19900" class="Symbol"
      >{</a
      ><a name="19901" href="Stlc.html#19901" class="Bound"
      >&#915;</a
      ><a name="19902" class="Symbol"
      >}</a
      ><a name="19903"
      > </a
      ><a name="19904" class="Symbol"
      >{</a
      ><a name="19905" href="Stlc.html#19905" class="Bound"
      >A</a
      ><a name="19906" class="Symbol"
      >}</a
      ><a name="19907"
      > </a
      ><a name="19908" class="Symbol"
      >{</a
      ><a name="19909" href="Stlc.html#19909" class="Bound"
      >B</a
      ><a name="19910" class="Symbol"
      >}</a
      ><a name="19911"
      > </a
      ><a name="19912" class="Symbol"
      >{</a
      ><a name="19913" href="Stlc.html#19913" class="Bound"
      >s</a
      ><a name="19914" class="Symbol"
      >}</a
      ><a name="19915"
      > </a
      ><a name="19916" class="Symbol"
      >{</a
      ><a name="19917" href="Stlc.html#19917" class="Bound"
      >t</a
      ><a name="19918" class="Symbol"
      >}</a
      ><a name="19919"
      >
                </a
      ><a name="19936" class="Symbol"
      >&#8594;</a
      ><a name="19937"
      > </a
      ><a name="19938" href="Stlc.html#19901" class="Bound"
      >&#915;</a
      ><a name="19939"
      > </a
      ><a name="19940" href="Stlc.html#19629" class="Datatype Operator"
      >&#8866;</a
      ><a name="19941"
      > </a
      ><a name="19942" href="Stlc.html#19913" class="Bound"
      >s</a
      ><a name="19943"
      > </a
      ><a name="19944" href="Stlc.html#19629" class="Datatype Operator"
      >&#8758;</a
      ><a name="19945"
      > </a
      ><a name="19946" href="Stlc.html#19905" class="Bound"
      >A</a
      ><a name="19947"
      > </a
      ><a name="19948" href="Stlc.html#5644" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="19949"
      > </a
      ><a name="19950" href="Stlc.html#19909" class="Bound"
      >B</a
      ><a name="19951"
      >
                </a
      ><a name="19968" class="Symbol"
      >&#8594;</a
      ><a name="19969"
      > </a
      ><a name="19970" href="Stlc.html#19901" class="Bound"
      >&#915;</a
      ><a name="19971"
      > </a
      ><a name="19972" href="Stlc.html#19629" class="Datatype Operator"
      >&#8866;</a
      ><a name="19973"
      > </a
      ><a name="19974" href="Stlc.html#19917" class="Bound"
      >t</a
      ><a name="19975"
      > </a
      ><a name="19976" href="Stlc.html#19629" class="Datatype Operator"
      >&#8758;</a
      ><a name="19977"
      > </a
      ><a name="19978" href="Stlc.html#19905" class="Bound"
      >A</a
      ><a name="19979"
      >
                </a
      ><a name="19996" class="Symbol"
      >&#8594;</a
      ><a name="19997"
      > </a
      ><a name="19998" href="Stlc.html#19901" class="Bound"
      >&#915;</a
      ><a name="19999"
      > </a
      ><a name="20000" href="Stlc.html#19629" class="Datatype Operator"
      >&#8866;</a
      ><a name="20001"
      > </a
      ><a name="20002" href="Stlc.html#6153" class="InductiveConstructor"
      >app</a
      ><a name="20005"
      > </a
      ><a name="20006" href="Stlc.html#19913" class="Bound"
      >s</a
      ><a name="20007"
      > </a
      ><a name="20008" href="Stlc.html#19917" class="Bound"
      >t</a
      ><a name="20009"
      > </a
      ><a name="20010" href="Stlc.html#19629" class="Datatype Operator"
      >&#8758;</a
      ><a name="20011"
      > </a
      ><a name="20012" href="Stlc.html#19909" class="Bound"
      >B</a
      ><a name="20013"
      >
  </a
      ><a name="20016" href="Stlc.html#20016" class="InductiveConstructor"
      >true</a
      ><a name="20020"
      >          </a
      ><a name="20030" class="Symbol"
      >:</a
      ><a name="20031"
      > </a
      ><a name="20032" class="Symbol"
      >&#8704;</a
      ><a name="20033"
      > </a
      ><a name="20034" class="Symbol"
      >{</a
      ><a name="20035" href="Stlc.html#20035" class="Bound"
      >&#915;</a
      ><a name="20036" class="Symbol"
      >}</a
      ><a name="20037"
      >
                </a
      ><a name="20054" class="Symbol"
      >&#8594;</a
      ><a name="20055"
      > </a
      ><a name="20056" href="Stlc.html#20035" class="Bound"
      >&#915;</a
      ><a name="20057"
      > </a
      ><a name="20058" href="Stlc.html#19629" class="Datatype Operator"
      >&#8866;</a
      ><a name="20059"
      > </a
      ><a name="20060" href="Stlc.html#6216" class="InductiveConstructor"
      >true</a
      ><a name="20064"
      >  </a
      ><a name="20066" href="Stlc.html#19629" class="Datatype Operator"
      >&#8758;</a
      ><a name="20067"
      > </a
      ><a name="20068" href="Stlc.html#5630" class="InductiveConstructor"
      >bool</a
      ><a name="20072"
      >
  </a
      ><a name="20075" href="Stlc.html#20075" class="InductiveConstructor"
      >false</a
      ><a name="20080"
      >         </a
      ><a name="20089" class="Symbol"
      >:</a
      ><a name="20090"
      > </a
      ><a name="20091" class="Symbol"
      >&#8704;</a
      ><a name="20092"
      > </a
      ><a name="20093" class="Symbol"
      >{</a
      ><a name="20094" href="Stlc.html#20094" class="Bound"
      >&#915;</a
      ><a name="20095" class="Symbol"
      >}</a
      ><a name="20096"
      >
                </a
      ><a name="20113" class="Symbol"
      >&#8594;</a
      ><a name="20114"
      > </a
      ><a name="20115" href="Stlc.html#20094" class="Bound"
      >&#915;</a
      ><a name="20116"
      > </a
      ><a name="20117" href="Stlc.html#19629" class="Datatype Operator"
      >&#8866;</a
      ><a name="20118"
      > </a
      ><a name="20119" href="Stlc.html#6231" class="InductiveConstructor"
      >false</a
      ><a name="20124"
      > </a
      ><a name="20125" href="Stlc.html#19629" class="Datatype Operator"
      >&#8758;</a
      ><a name="20126"
      > </a
      ><a name="20127" href="Stlc.html#5630" class="InductiveConstructor"
      >bool</a
      ><a name="20131"
      >
  </a
      ><a name="20134" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >if_then_else_</a
      ><a name="20147"
      > </a
      ><a name="20148" class="Symbol"
      >:</a
      ><a name="20149"
      > </a
      ><a name="20150" class="Symbol"
      >&#8704;</a
      ><a name="20151"
      > </a
      ><a name="20152" class="Symbol"
      >{</a
      ><a name="20153" href="Stlc.html#20153" class="Bound"
      >&#915;</a
      ><a name="20154" class="Symbol"
      >}</a
      ><a name="20155"
      > </a
      ><a name="20156" class="Symbol"
      >{</a
      ><a name="20157" href="Stlc.html#20157" class="Bound"
      >s</a
      ><a name="20158" class="Symbol"
      >}</a
      ><a name="20159"
      > </a
      ><a name="20160" class="Symbol"
      >{</a
      ><a name="20161" href="Stlc.html#20161" class="Bound"
      >t</a
      ><a name="20162" class="Symbol"
      >}</a
      ><a name="20163"
      > </a
      ><a name="20164" class="Symbol"
      >{</a
      ><a name="20165" href="Stlc.html#20165" class="Bound"
      >u</a
      ><a name="20166" class="Symbol"
      >}</a
      ><a name="20167"
      > </a
      ><a name="20168" class="Symbol"
      >{</a
      ><a name="20169" href="Stlc.html#20169" class="Bound"
      >A</a
      ><a name="20170" class="Symbol"
      >}</a
      ><a name="20171"
      >
                </a
      ><a name="20188" class="Symbol"
      >&#8594;</a
      ><a name="20189"
      > </a
      ><a name="20190" href="Stlc.html#20153" class="Bound"
      >&#915;</a
      ><a name="20191"
      > </a
      ><a name="20192" href="Stlc.html#19629" class="Datatype Operator"
      >&#8866;</a
      ><a name="20193"
      > </a
      ><a name="20194" href="Stlc.html#20157" class="Bound"
      >s</a
      ><a name="20195"
      > </a
      ><a name="20196" href="Stlc.html#19629" class="Datatype Operator"
      >&#8758;</a
      ><a name="20197"
      > </a
      ><a name="20198" href="Stlc.html#5630" class="InductiveConstructor"
      >bool</a
      ><a name="20202"
      >
                </a
      ><a name="20219" class="Symbol"
      >&#8594;</a
      ><a name="20220"
      > </a
      ><a name="20221" href="Stlc.html#20153" class="Bound"
      >&#915;</a
      ><a name="20222"
      > </a
      ><a name="20223" href="Stlc.html#19629" class="Datatype Operator"
      >&#8866;</a
      ><a name="20224"
      > </a
      ><a name="20225" href="Stlc.html#20161" class="Bound"
      >t</a
      ><a name="20226"
      > </a
      ><a name="20227" href="Stlc.html#19629" class="Datatype Operator"
      >&#8758;</a
      ><a name="20228"
      > </a
      ><a name="20229" href="Stlc.html#20169" class="Bound"
      >A</a
      ><a name="20230"
      >
                </a
      ><a name="20247" class="Symbol"
      >&#8594;</a
      ><a name="20248"
      > </a
      ><a name="20249" href="Stlc.html#20153" class="Bound"
      >&#915;</a
      ><a name="20250"
      > </a
      ><a name="20251" href="Stlc.html#19629" class="Datatype Operator"
      >&#8866;</a
      ><a name="20252"
      > </a
      ><a name="20253" href="Stlc.html#20165" class="Bound"
      >u</a
      ><a name="20254"
      > </a
      ><a name="20255" href="Stlc.html#19629" class="Datatype Operator"
      >&#8758;</a
      ><a name="20256"
      > </a
      ><a name="20257" href="Stlc.html#20169" class="Bound"
      >A</a
      ><a name="20258"
      >
                </a
      ><a name="20275" class="Symbol"
      >&#8594;</a
      ><a name="20276"
      > </a
      ><a name="20277" href="Stlc.html#20153" class="Bound"
      >&#915;</a
      ><a name="20278"
      > </a
      ><a name="20279" href="Stlc.html#19629" class="Datatype Operator"
      >&#8866;</a
      ><a name="20280"
      > </a
      ><a name="20281" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >if</a
      ><a name="20283"
      > </a
      ><a name="20284" href="Stlc.html#20157" class="Bound"
      >s</a
      ><a name="20285"
      > </a
      ><a name="20286" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >then</a
      ><a name="20290"
      > </a
      ><a name="20291" href="Stlc.html#20161" class="Bound"
      >t</a
      ><a name="20292"
      > </a
      ><a name="20293" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >else</a
      ><a name="20297"
      > </a
      ><a name="20298" href="Stlc.html#20165" class="Bound"
      >u</a
      ><a name="20299"
      > </a
      ><a name="20300" href="Stlc.html#19629" class="Datatype Operator"
      >&#8758;</a
      ><a name="20301"
      > </a
      ><a name="20302" href="Stlc.html#20169" class="Bound"
      >A</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="20350" class="Keyword"
      >infix</a
      ><a name="20355"
      > </a
      ><a name="20356" class="Number"
      >1</a
      >
{% endraw %}</pre>
</div>


### Examples

<pre class="Agda">{% raw %}
<a name="20411" href="Stlc.html#20411" class="Function"
      >typing-example1</a
      ><a name="20426"
      > </a
      ><a name="20427" class="Symbol"
      >:</a
      ><a name="20428"
      > </a
      ><a name="20429" href="Stlc.html#18658" class="Function"
      >&#8709;</a
      ><a name="20430"
      > </a
      ><a name="20431" href="Stlc.html#19629" class="Datatype Operator"
      >&#8866;</a
      ><a name="20432"
      > </a
      ><a name="20433" href="Stlc.html#6944" class="Function"
      >idB</a
      ><a name="20436"
      > </a
      ><a name="20437" href="Stlc.html#19629" class="Datatype Operator"
      >&#8758;</a
      ><a name="20438"
      > </a
      ><a name="20439" href="Stlc.html#5630" class="InductiveConstructor"
      >bool</a
      ><a name="20443"
      > </a
      ><a name="20444" href="Stlc.html#5644" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="20445"
      > </a
      ><a name="20446" href="Stlc.html#5630" class="InductiveConstructor"
      >bool</a
      ><a name="20450"
      >
</a
      ><a name="20451" href="Stlc.html#20411" class="Function"
      >typing-example1</a
      ><a name="20466"
      > </a
      ><a name="20467" class="Symbol"
      >=</a
      ><a name="20468"
      > </a
      ><a name="20469" href="Stlc.html#19766" class="InductiveConstructor"
      >abs</a
      ><a name="20472"
      > </a
      ><a name="20473" class="Symbol"
      >(</a
      ><a name="20474" href="Stlc.html#19673" class="InductiveConstructor"
      >var</a
      ><a name="20477"
      > </a
      ><a name="20478" href="Stlc.html#6713" class="Function"
      >x</a
      ><a name="20479"
      > </a
      ><a name="20480" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="20484" class="Symbol"
      >)</a
      >
{% endraw %}</pre>

Another example:

$$\varnothing\vdash \lambda x:A. \lambda y:A\rightarrow A. y\;(y\;x) : A\rightarrow (A\rightarrow A)\rightarrow A$$.

<pre class="Agda">{% raw %}
<a name="20647" href="Stlc.html#20647" class="Function"
      >typing-example2</a
      ><a name="20662"
      > </a
      ><a name="20663" class="Symbol"
      >:</a
      ><a name="20664"
      > </a
      ><a name="20665" href="Stlc.html#18658" class="Function"
      >&#8709;</a
      ><a name="20666"
      > </a
      ><a name="20667" href="Stlc.html#19629" class="Datatype Operator"
      >&#8866;</a
      ><a name="20668"
      >
  </a
      ><a name="20671" class="Symbol"
      >(</a
      ><a name="20672" href="Stlc.html#6182" class="InductiveConstructor"
      >abs</a
      ><a name="20675"
      > </a
      ><a name="20676" href="Stlc.html#6713" class="Function"
      >x</a
      ><a name="20677"
      > </a
      ><a name="20678" href="Stlc.html#5630" class="InductiveConstructor"
      >bool</a
      ><a name="20682"
      >
    </a
      ><a name="20687" class="Symbol"
      >(</a
      ><a name="20688" href="Stlc.html#6182" class="InductiveConstructor"
      >abs</a
      ><a name="20691"
      > </a
      ><a name="20692" href="Stlc.html#6722" class="Function"
      >y</a
      ><a name="20693"
      > </a
      ><a name="20694" class="Symbol"
      >(</a
      ><a name="20695" href="Stlc.html#5630" class="InductiveConstructor"
      >bool</a
      ><a name="20699"
      > </a
      ><a name="20700" href="Stlc.html#5644" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="20701"
      > </a
      ><a name="20702" href="Stlc.html#5630" class="InductiveConstructor"
      >bool</a
      ><a name="20706" class="Symbol"
      >)</a
      ><a name="20707"
      >
      </a
      ><a name="20714" class="Symbol"
      >(</a
      ><a name="20715" href="Stlc.html#6153" class="InductiveConstructor"
      >app</a
      ><a name="20718"
      > </a
      ><a name="20719" class="Symbol"
      >(</a
      ><a name="20720" href="Stlc.html#6133" class="InductiveConstructor"
      >var</a
      ><a name="20723"
      > </a
      ><a name="20724" href="Stlc.html#6722" class="Function"
      >y</a
      ><a name="20725" class="Symbol"
      >)</a
      ><a name="20726"
      >
        </a
      ><a name="20735" class="Symbol"
      >(</a
      ><a name="20736" href="Stlc.html#6153" class="InductiveConstructor"
      >app</a
      ><a name="20739"
      > </a
      ><a name="20740" class="Symbol"
      >(</a
      ><a name="20741" href="Stlc.html#6133" class="InductiveConstructor"
      >var</a
      ><a name="20744"
      > </a
      ><a name="20745" href="Stlc.html#6722" class="Function"
      >y</a
      ><a name="20746" class="Symbol"
      >)</a
      ><a name="20747"
      > </a
      ><a name="20748" class="Symbol"
      >(</a
      ><a name="20749" href="Stlc.html#6133" class="InductiveConstructor"
      >var</a
      ><a name="20752"
      > </a
      ><a name="20753" href="Stlc.html#6713" class="Function"
      >x</a
      ><a name="20754" class="Symbol"
      >)))))</a
      ><a name="20759"
      > </a
      ><a name="20760" href="Stlc.html#19629" class="Datatype Operator"
      >&#8758;</a
      ><a name="20761"
      >
  </a
      ><a name="20764" class="Symbol"
      >(</a
      ><a name="20765" href="Stlc.html#5630" class="InductiveConstructor"
      >bool</a
      ><a name="20769"
      > </a
      ><a name="20770" href="Stlc.html#5644" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="20771"
      > </a
      ><a name="20772" class="Symbol"
      >(</a
      ><a name="20773" href="Stlc.html#5630" class="InductiveConstructor"
      >bool</a
      ><a name="20777"
      > </a
      ><a name="20778" href="Stlc.html#5644" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="20779"
      > </a
      ><a name="20780" href="Stlc.html#5630" class="InductiveConstructor"
      >bool</a
      ><a name="20784" class="Symbol"
      >)</a
      ><a name="20785"
      > </a
      ><a name="20786" href="Stlc.html#5644" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="20787"
      > </a
      ><a name="20788" href="Stlc.html#5630" class="InductiveConstructor"
      >bool</a
      ><a name="20792" class="Symbol"
      >)</a
      ><a name="20793"
      >
</a
      ><a name="20794" href="Stlc.html#20647" class="Function"
      >typing-example2</a
      ><a name="20809"
      > </a
      ><a name="20810" class="Symbol"
      >=</a
      ><a name="20811"
      >
  </a
      ><a name="20814" class="Symbol"
      >(</a
      ><a name="20815" href="Stlc.html#19766" class="InductiveConstructor"
      >abs</a
      ><a name="20818"
      >
    </a
      ><a name="20823" class="Symbol"
      >(</a
      ><a name="20824" href="Stlc.html#19766" class="InductiveConstructor"
      >abs</a
      ><a name="20827"
      >
      </a
      ><a name="20834" class="Symbol"
      >(</a
      ><a name="20835" href="Stlc.html#19882" class="InductiveConstructor"
      >app</a
      ><a name="20838"
      > </a
      ><a name="20839" class="Symbol"
      >(</a
      ><a name="20840" href="Stlc.html#19673" class="InductiveConstructor"
      >var</a
      ><a name="20843"
      > </a
      ><a name="20844" href="Stlc.html#6722" class="Function"
      >y</a
      ><a name="20845"
      > </a
      ><a name="20846" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="20850" class="Symbol"
      >)</a
      ><a name="20851"
      >
        </a
      ><a name="20860" class="Symbol"
      >(</a
      ><a name="20861" href="Stlc.html#19882" class="InductiveConstructor"
      >app</a
      ><a name="20864"
      > </a
      ><a name="20865" class="Symbol"
      >(</a
      ><a name="20866" href="Stlc.html#19673" class="InductiveConstructor"
      >var</a
      ><a name="20869"
      > </a
      ><a name="20870" href="Stlc.html#6722" class="Function"
      >y</a
      ><a name="20871"
      > </a
      ><a name="20872" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="20876" class="Symbol"
      >)</a
      ><a name="20877"
      > </a
      ><a name="20878" class="Symbol"
      >(</a
      ><a name="20879" href="Stlc.html#19673" class="InductiveConstructor"
      >var</a
      ><a name="20882"
      > </a
      ><a name="20883" href="Stlc.html#6713" class="Function"
      >x</a
      ><a name="20884"
      > </a
      ><a name="20885" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="20889" class="Symbol"
      >)</a
      ><a name="20890"
      > </a
      ><a name="20891" class="Symbol"
      >))))</a
      >
{% endraw %}</pre>

#### Exercise: 2 stars (typing-example3)
Formally prove the following typing derivation holds:

$$\exists A, \varnothing\vdash \lambda x:bool\rightarrow B. \lambda y:bool\rightarrow bool. \lambda z:bool. y\;(x\;z) : A$$.

<pre class="Agda">{% raw %}
<a name="21143" class="Keyword"
      >postulate</a
      ><a name="21152"
      >
  </a
      ><a name="21155" href="Stlc.html#21155" class="Postulate"
      >typing-example3</a
      ><a name="21170"
      > </a
      ><a name="21171" class="Symbol"
      >:</a
      ><a name="21172"
      > </a
      ><a name="21173" href="https://agda.github.io/agda-stdlib/Data.Product.html#823" class="Function"
      >&#8707;</a
      ><a name="21174"
      > </a
      ><a name="21175" class="Symbol"
      >&#955;</a
      ><a name="21176"
      > </a
      ><a name="21177" href="Stlc.html#21177" class="Bound"
      >A</a
      ><a name="21178"
      > </a
      ><a name="21179" class="Symbol"
      >&#8594;</a
      ><a name="21180"
      > </a
      ><a name="21181" href="Stlc.html#18658" class="Function"
      >&#8709;</a
      ><a name="21182"
      > </a
      ><a name="21183" href="Stlc.html#19629" class="Datatype Operator"
      >&#8866;</a
      ><a name="21184"
      >
    </a
      ><a name="21189" class="Symbol"
      >(</a
      ><a name="21190" href="Stlc.html#6182" class="InductiveConstructor"
      >abs</a
      ><a name="21193"
      > </a
      ><a name="21194" href="Stlc.html#6713" class="Function"
      >x</a
      ><a name="21195"
      > </a
      ><a name="21196" class="Symbol"
      >(</a
      ><a name="21197" href="Stlc.html#5630" class="InductiveConstructor"
      >bool</a
      ><a name="21201"
      > </a
      ><a name="21202" href="Stlc.html#5644" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="21203"
      > </a
      ><a name="21204" href="Stlc.html#5630" class="InductiveConstructor"
      >bool</a
      ><a name="21208" class="Symbol"
      >)</a
      ><a name="21209"
      >
      </a
      ><a name="21216" class="Symbol"
      >(</a
      ><a name="21217" href="Stlc.html#6182" class="InductiveConstructor"
      >abs</a
      ><a name="21220"
      > </a
      ><a name="21221" href="Stlc.html#6722" class="Function"
      >y</a
      ><a name="21222"
      > </a
      ><a name="21223" class="Symbol"
      >(</a
      ><a name="21224" href="Stlc.html#5630" class="InductiveConstructor"
      >bool</a
      ><a name="21228"
      > </a
      ><a name="21229" href="Stlc.html#5644" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="21230"
      > </a
      ><a name="21231" href="Stlc.html#5630" class="InductiveConstructor"
      >bool</a
      ><a name="21235" class="Symbol"
      >)</a
      ><a name="21236"
      >
        </a
      ><a name="21245" class="Symbol"
      >(</a
      ><a name="21246" href="Stlc.html#6182" class="InductiveConstructor"
      >abs</a
      ><a name="21249"
      > </a
      ><a name="21250" href="Stlc.html#6731" class="Function"
      >z</a
      ><a name="21251"
      > </a
      ><a name="21252" href="Stlc.html#5630" class="InductiveConstructor"
      >bool</a
      ><a name="21256"
      >
          </a
      ><a name="21267" class="Symbol"
      >(</a
      ><a name="21268" href="Stlc.html#6153" class="InductiveConstructor"
      >app</a
      ><a name="21271"
      > </a
      ><a name="21272" class="Symbol"
      >(</a
      ><a name="21273" href="Stlc.html#6133" class="InductiveConstructor"
      >var</a
      ><a name="21276"
      > </a
      ><a name="21277" href="Stlc.html#6722" class="Function"
      >y</a
      ><a name="21278" class="Symbol"
      >)</a
      ><a name="21279"
      > </a
      ><a name="21280" class="Symbol"
      >(</a
      ><a name="21281" href="Stlc.html#6153" class="InductiveConstructor"
      >app</a
      ><a name="21284"
      > </a
      ><a name="21285" class="Symbol"
      >(</a
      ><a name="21286" href="Stlc.html#6133" class="InductiveConstructor"
      >var</a
      ><a name="21289"
      > </a
      ><a name="21290" href="Stlc.html#6713" class="Function"
      >x</a
      ><a name="21291" class="Symbol"
      >)</a
      ><a name="21292"
      > </a
      ><a name="21293" class="Symbol"
      >(</a
      ><a name="21294" href="Stlc.html#6133" class="InductiveConstructor"
      >var</a
      ><a name="21297"
      > </a
      ><a name="21298" href="Stlc.html#6731" class="Function"
      >z</a
      ><a name="21299" class="Symbol"
      >))))))</a
      ><a name="21305"
      > </a
      ><a name="21306" href="Stlc.html#19629" class="Datatype Operator"
      >&#8758;</a
      ><a name="21307"
      > </a
      ><a name="21308" href="Stlc.html#21177" class="Bound"
      >A</a
      >
{% endraw %}</pre>

We can also show that terms are _not_ typable.  For example, let's
formally check that there is no typing derivation assigning a type
to the term $$\lambda x:bool. \lambda y:bool. x\;y$$---i.e.,


$$\nexists A, \varnothing\vdash \lambda x:bool. \lambda y:bool. x\;y : A$$.

<pre class="Agda">{% raw %}
<a name="21609" class="Keyword"
      >postulate</a
      ><a name="21618"
      >
  </a
      ><a name="21621" href="Stlc.html#21621" class="Postulate"
      >typing-nonexample1</a
      ><a name="21639"
      > </a
      ><a name="21640" class="Symbol"
      >:</a
      ><a name="21641"
      > </a
      ><a name="21642" href="https://agda.github.io/agda-stdlib/Data.Product.html#884" class="Function"
      >&#8708;</a
      ><a name="21643"
      > </a
      ><a name="21644" class="Symbol"
      >&#955;</a
      ><a name="21645"
      > </a
      ><a name="21646" href="Stlc.html#21646" class="Bound"
      >A</a
      ><a name="21647"
      > </a
      ><a name="21648" class="Symbol"
      >&#8594;</a
      ><a name="21649"
      > </a
      ><a name="21650" href="Stlc.html#18658" class="Function"
      >&#8709;</a
      ><a name="21651"
      > </a
      ><a name="21652" href="Stlc.html#19629" class="Datatype Operator"
      >&#8866;</a
      ><a name="21653"
      >
    </a
      ><a name="21658" class="Symbol"
      >(</a
      ><a name="21659" href="Stlc.html#6182" class="InductiveConstructor"
      >abs</a
      ><a name="21662"
      > </a
      ><a name="21663" href="Stlc.html#6713" class="Function"
      >x</a
      ><a name="21664"
      > </a
      ><a name="21665" href="Stlc.html#5630" class="InductiveConstructor"
      >bool</a
      ><a name="21669"
      >
      </a
      ><a name="21676" class="Symbol"
      >(</a
      ><a name="21677" href="Stlc.html#6182" class="InductiveConstructor"
      >abs</a
      ><a name="21680"
      > </a
      ><a name="21681" href="Stlc.html#6722" class="Function"
      >y</a
      ><a name="21682"
      > </a
      ><a name="21683" href="Stlc.html#5630" class="InductiveConstructor"
      >bool</a
      ><a name="21687"
      >
        </a
      ><a name="21696" class="Symbol"
      >(</a
      ><a name="21697" href="Stlc.html#6153" class="InductiveConstructor"
      >app</a
      ><a name="21700"
      > </a
      ><a name="21701" class="Symbol"
      >(</a
      ><a name="21702" href="Stlc.html#6133" class="InductiveConstructor"
      >var</a
      ><a name="21705"
      > </a
      ><a name="21706" href="Stlc.html#6713" class="Function"
      >x</a
      ><a name="21707" class="Symbol"
      >)</a
      ><a name="21708"
      > </a
      ><a name="21709" class="Symbol"
      >(</a
      ><a name="21710" href="Stlc.html#6133" class="InductiveConstructor"
      >var</a
      ><a name="21713"
      > </a
      ><a name="21714" href="Stlc.html#6722" class="Function"
      >y</a
      ><a name="21715" class="Symbol"
      >))))</a
      ><a name="21719"
      > </a
      ><a name="21720" href="Stlc.html#19629" class="Datatype Operator"
      >&#8758;</a
      ><a name="21721"
      > </a
      ><a name="21722" href="Stlc.html#21646" class="Bound"
      >A</a
      >
{% endraw %}</pre>

#### Exercise: 3 stars, optional (typing-nonexample2)
Another nonexample:

$$\nexists A, \exists B, \varnothing\vdash \lambda x:A. x\;x : B$$.

<pre class="Agda">{% raw %}
<a name="21893" class="Keyword"
      >postulate</a
      ><a name="21902"
      >
  </a
      ><a name="21905" href="Stlc.html#21905" class="Postulate"
      >typing-nonexample2</a
      ><a name="21923"
      > </a
      ><a name="21924" class="Symbol"
      >:</a
      ><a name="21925"
      > </a
      ><a name="21926" href="https://agda.github.io/agda-stdlib/Data.Product.html#884" class="Function"
      >&#8708;</a
      ><a name="21927"
      > </a
      ><a name="21928" class="Symbol"
      >&#955;</a
      ><a name="21929"
      > </a
      ><a name="21930" href="Stlc.html#21930" class="Bound"
      >A</a
      ><a name="21931"
      > </a
      ><a name="21932" class="Symbol"
      >&#8594;</a
      ><a name="21933"
      > </a
      ><a name="21934" href="https://agda.github.io/agda-stdlib/Data.Product.html#823" class="Function"
      >&#8707;</a
      ><a name="21935"
      > </a
      ><a name="21936" class="Symbol"
      >&#955;</a
      ><a name="21937"
      > </a
      ><a name="21938" href="Stlc.html#21938" class="Bound"
      >B</a
      ><a name="21939"
      > </a
      ><a name="21940" class="Symbol"
      >&#8594;</a
      ><a name="21941"
      > </a
      ><a name="21942" href="Stlc.html#18658" class="Function"
      >&#8709;</a
      ><a name="21943"
      > </a
      ><a name="21944" href="Stlc.html#19629" class="Datatype Operator"
      >&#8866;</a
      ><a name="21945"
      >
    </a
      ><a name="21950" class="Symbol"
      >(</a
      ><a name="21951" href="Stlc.html#6182" class="InductiveConstructor"
      >abs</a
      ><a name="21954"
      > </a
      ><a name="21955" href="Stlc.html#6713" class="Function"
      >x</a
      ><a name="21956"
      > </a
      ><a name="21957" href="Stlc.html#21938" class="Bound"
      >B</a
      ><a name="21958"
      > </a
      ><a name="21959" class="Symbol"
      >(</a
      ><a name="21960" href="Stlc.html#6153" class="InductiveConstructor"
      >app</a
      ><a name="21963"
      > </a
      ><a name="21964" class="Symbol"
      >(</a
      ><a name="21965" href="Stlc.html#6133" class="InductiveConstructor"
      >var</a
      ><a name="21968"
      > </a
      ><a name="21969" href="Stlc.html#6713" class="Function"
      >x</a
      ><a name="21970" class="Symbol"
      >)</a
      ><a name="21971"
      > </a
      ><a name="21972" class="Symbol"
      >(</a
      ><a name="21973" href="Stlc.html#6133" class="InductiveConstructor"
      >var</a
      ><a name="21976"
      > </a
      ><a name="21977" href="Stlc.html#6713" class="Function"
      >x</a
      ><a name="21978" class="Symbol"
      >)))</a
      ><a name="21981"
      > </a
      ><a name="21982" href="Stlc.html#19629" class="Datatype Operator"
      >&#8758;</a
      ><a name="21983"
      > </a
      ><a name="21984" href="Stlc.html#21930" class="Bound"
      >A</a
      >
{% endraw %}</pre>
