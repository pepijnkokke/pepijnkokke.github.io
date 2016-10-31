---
title         : "Stlc: The Simply Typed Lambda-Calculus"
layout        : default
hide-implicit : false
extra-script  : agda-extra-script.html
extra-style   : agda-extra-style.html
---

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="224" class="Symbol"
      >{-#</a
      ><a name="227"
      > </a
      ><a name="228" class="Keyword"
      >OPTIONS</a
      ><a name="235"
      > --allow-unsolved-metas </a
      ><a name="259" class="Symbol"
      >#-}</a
      >
{% endraw %}</pre>
</div>

<pre class="Agda">{% raw %}
<a name="295" class="Keyword"
      >module</a
      ><a name="301"
      > </a
      ><a name="302" href="Stlc.html#1" class="Module"
      >Stlc</a
      ><a name="306"
      > </a
      ><a name="307" class="Keyword"
      >where</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="359" class="Keyword"
      >open</a
      ><a name="363"
      > </a
      ><a name="364" class="Keyword"
      >import</a
      ><a name="370"
      > </a
      ><a name="371" href="https://agda.github.io/agda-stdlib/Data.Empty.html#1" class="Module"
      >Data.Empty</a
      ><a name="381"
      > </a
      ><a name="382" class="Keyword"
      >using</a
      ><a name="387"
      > </a
      ><a name="388" class="Symbol"
      >(</a
      ><a name="389" href="https://agda.github.io/agda-stdlib/Data.Empty.html#243" class="Datatype"
      >&#8869;</a
      ><a name="390" class="Symbol"
      >;</a
      ><a name="391"
      > </a
      ><a name="392" href="https://agda.github.io/agda-stdlib/Data.Empty.html#348" class="Function"
      >&#8869;-elim</a
      ><a name="398" class="Symbol"
      >)</a
      ><a name="399"
      >
</a
      ><a name="400" class="Keyword"
      >open</a
      ><a name="404"
      > </a
      ><a name="405" class="Keyword"
      >import</a
      ><a name="411"
      > </a
      ><a name="412" href="https://agda.github.io/agda-stdlib/Data.Maybe.html#1" class="Module"
      >Data.Maybe</a
      ><a name="422"
      > </a
      ><a name="423" class="Keyword"
      >using</a
      ><a name="428"
      > </a
      ><a name="429" class="Symbol"
      >(</a
      ><a name="430" href="https://agda.github.io/agda-stdlib/Data.Maybe.Base.html#335" class="Datatype"
      >Maybe</a
      ><a name="435" class="Symbol"
      >;</a
      ><a name="436"
      > </a
      ><a name="437" href="https://agda.github.io/agda-stdlib/Data.Maybe.html#1527" class="InductiveConstructor"
      >just</a
      ><a name="441" class="Symbol"
      >;</a
      ><a name="442"
      > </a
      ><a name="443" href="https://agda.github.io/agda-stdlib/Data.Maybe.html#1588" class="InductiveConstructor"
      >nothing</a
      ><a name="450" class="Symbol"
      >)</a
      ><a name="451"
      >
</a
      ><a name="452" class="Keyword"
      >open</a
      ><a name="456"
      > </a
      ><a name="457" class="Keyword"
      >import</a
      ><a name="463"
      > </a
      ><a name="464" href="https://agda.github.io/agda-stdlib/Data.Nat.html#1" class="Module"
      >Data.Nat</a
      ><a name="472"
      > </a
      ><a name="473" class="Keyword"
      >using</a
      ><a name="478"
      > </a
      ><a name="479" class="Symbol"
      >(</a
      ><a name="480" href="Agda.Builtin.Nat.html#69" class="Datatype"
      >&#8469;</a
      ><a name="481" class="Symbol"
      >;</a
      ><a name="482"
      > </a
      ><a name="483" href="Agda.Builtin.Nat.html#100" class="InductiveConstructor"
      >suc</a
      ><a name="486" class="Symbol"
      >;</a
      ><a name="487"
      > </a
      ><a name="488" href="Agda.Builtin.Nat.html#87" class="InductiveConstructor"
      >zero</a
      ><a name="492" class="Symbol"
      >;</a
      ><a name="493"
      > </a
      ><a name="494" href="Agda.Builtin.Nat.html#202" class="Primitive Operator"
      >_+_</a
      ><a name="497" class="Symbol"
      >)</a
      ><a name="498"
      >
</a
      ><a name="499" class="Keyword"
      >open</a
      ><a name="503"
      > </a
      ><a name="504" class="Keyword"
      >import</a
      ><a name="510"
      > </a
      ><a name="511" href="https://agda.github.io/agda-stdlib/Data.Product.html#1" class="Module"
      >Data.Product</a
      ><a name="523"
      > </a
      ><a name="524" class="Keyword"
      >using</a
      ><a name="529"
      > </a
      ><a name="530" class="Symbol"
      >(</a
      ><a name="531" href="https://agda.github.io/agda-stdlib/Data.Product.html#823" class="Function"
      >&#8707;</a
      ><a name="532" class="Symbol"
      >;</a
      ><a name="533"
      > </a
      ><a name="534" href="https://agda.github.io/agda-stdlib/Data.Product.html#884" class="Function"
      >&#8708;</a
      ><a name="535" class="Symbol"
      >;</a
      ><a name="536"
      > </a
      ><a name="537" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >_,_</a
      ><a name="540" class="Symbol"
      >)</a
      ><a name="541"
      >
</a
      ><a name="542" class="Keyword"
      >open</a
      ><a name="546"
      > </a
      ><a name="547" class="Keyword"
      >import</a
      ><a name="553"
      > </a
      ><a name="554" href="https://agda.github.io/agda-stdlib/Function.html#1" class="Module"
      >Function</a
      ><a name="562"
      > </a
      ><a name="563" class="Keyword"
      >using</a
      ><a name="568"
      > </a
      ><a name="569" class="Symbol"
      >(</a
      ><a name="570" href="https://agda.github.io/agda-stdlib/Function.html#713" class="Function Operator"
      >_&#8728;_</a
      ><a name="573" class="Symbol"
      >;</a
      ><a name="574"
      > </a
      ><a name="575" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >_$_</a
      ><a name="578" class="Symbol"
      >)</a
      ><a name="579"
      >
</a
      ><a name="580" class="Keyword"
      >open</a
      ><a name="584"
      > </a
      ><a name="585" class="Keyword"
      >import</a
      ><a name="591"
      > </a
      ><a name="592" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#1" class="Module"
      >Relation.Nullary</a
      ><a name="608"
      > </a
      ><a name="609" class="Keyword"
      >using</a
      ><a name="614"
      > </a
      ><a name="615" class="Symbol"
      >(</a
      ><a name="616" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#484" class="Datatype"
      >Dec</a
      ><a name="619" class="Symbol"
      >;</a
      ><a name="620"
      > </a
      ><a name="621" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="624" class="Symbol"
      >;</a
      ><a name="625"
      > </a
      ><a name="626" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="628" class="Symbol"
      >)</a
      ><a name="629"
      >
</a
      ><a name="630" class="Keyword"
      >open</a
      ><a name="634"
      > </a
      ><a name="635" class="Keyword"
      >import</a
      ><a name="641"
      > </a
      ><a name="642" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.html#1" class="Module"
      >Relation.Binary.PropositionalEquality</a
      ><a name="679"
      > </a
      ><a name="680" class="Keyword"
      >using</a
      ><a name="685"
      > </a
      ><a name="686" class="Symbol"
      >(</a
      ><a name="687" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >_&#8801;_</a
      ><a name="690" class="Symbol"
      >;</a
      ><a name="691"
      > </a
      ><a name="692" href="https://agda.github.io/agda-stdlib/Relation.Binary.Core.html#4493" class="Function Operator"
      >_&#8802;_</a
      ><a name="695" class="Symbol"
      >;</a
      ><a name="696"
      > </a
      ><a name="697" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="701" class="Symbol"
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
<a name="5574" class="Keyword"
      >data</a
      ><a name="5578"
      > </a
      ><a name="5579" href="Stlc.html#5579" class="Datatype"
      >Type</a
      ><a name="5583"
      > </a
      ><a name="5584" class="Symbol"
      >:</a
      ><a name="5585"
      > </a
      ><a name="5586" class="PrimitiveType"
      >Set</a
      ><a name="5589"
      > </a
      ><a name="5590" class="Keyword"
      >where</a
      ><a name="5595"
      >
  </a
      ><a name="5598" href="Stlc.html#5598" class="InductiveConstructor"
      >bool</a
      ><a name="5602"
      > </a
      ><a name="5603" class="Symbol"
      >:</a
      ><a name="5604"
      > </a
      ><a name="5605" href="Stlc.html#5579" class="Datatype"
      >Type</a
      ><a name="5609"
      >
  </a
      ><a name="5612" href="Stlc.html#5612" class="InductiveConstructor Operator"
      >_&#8658;_</a
      ><a name="5615"
      >  </a
      ><a name="5617" class="Symbol"
      >:</a
      ><a name="5618"
      > </a
      ><a name="5619" href="Stlc.html#5579" class="Datatype"
      >Type</a
      ><a name="5623"
      > </a
      ><a name="5624" class="Symbol"
      >&#8594;</a
      ><a name="5625"
      > </a
      ><a name="5626" href="Stlc.html#5579" class="Datatype"
      >Type</a
      ><a name="5630"
      > </a
      ><a name="5631" class="Symbol"
      >&#8594;</a
      ><a name="5632"
      > </a
      ><a name="5633" href="Stlc.html#5579" class="Datatype"
      >Type</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="5684" class="Keyword"
      >infixr</a
      ><a name="5690"
      > </a
      ><a name="5691" class="Number"
      >5</a
      >
{% endraw %}</pre>
</div>


### Terms

<pre class="Agda">{% raw %}
<a name="5741" class="Keyword"
      >data</a
      ><a name="5745"
      > </a
      ><a name="5746" href="Stlc.html#5746" class="Datatype"
      >Id</a
      ><a name="5748"
      > </a
      ><a name="5749" class="Symbol"
      >:</a
      ><a name="5750"
      > </a
      ><a name="5751" class="PrimitiveType"
      >Set</a
      ><a name="5754"
      > </a
      ><a name="5755" class="Keyword"
      >where</a
      ><a name="5760"
      >
  </a
      ><a name="5763" href="Stlc.html#5763" class="InductiveConstructor"
      >id</a
      ><a name="5765"
      > </a
      ><a name="5766" class="Symbol"
      >:</a
      ><a name="5767"
      > </a
      ><a name="5768" href="Agda.Builtin.Nat.html#69" class="Datatype"
      >&#8469;</a
      ><a name="5769"
      > </a
      ><a name="5770" class="Symbol"
      >&#8594;</a
      ><a name="5771"
      > </a
      ><a name="5772" href="Stlc.html#5746" class="Datatype"
      >Id</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="5821" href="Stlc.html#5821" class="Function Operator"
      >_&#8799;_</a
      ><a name="5824"
      > </a
      ><a name="5825" class="Symbol"
      >:</a
      ><a name="5826"
      > </a
      ><a name="5827" class="Symbol"
      >(</a
      ><a name="5828" href="Stlc.html#5828" class="Bound"
      >x</a
      ><a name="5829"
      > </a
      ><a name="5830" href="Stlc.html#5830" class="Bound"
      >y</a
      ><a name="5831"
      > </a
      ><a name="5832" class="Symbol"
      >:</a
      ><a name="5833"
      > </a
      ><a name="5834" href="Stlc.html#5746" class="Datatype"
      >Id</a
      ><a name="5836" class="Symbol"
      >)</a
      ><a name="5837"
      > </a
      ><a name="5838" class="Symbol"
      >&#8594;</a
      ><a name="5839"
      > </a
      ><a name="5840" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#484" class="Datatype"
      >Dec</a
      ><a name="5843"
      > </a
      ><a name="5844" class="Symbol"
      >(</a
      ><a name="5845" href="Stlc.html#5828" class="Bound"
      >x</a
      ><a name="5846"
      > </a
      ><a name="5847" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="5848"
      > </a
      ><a name="5849" href="Stlc.html#5830" class="Bound"
      >y</a
      ><a name="5850" class="Symbol"
      >)</a
      ><a name="5851"
      >
</a
      ><a name="5852" href="Stlc.html#5763" class="InductiveConstructor"
      >id</a
      ><a name="5854"
      > </a
      ><a name="5855" href="Stlc.html#5855" class="Bound"
      >x</a
      ><a name="5856"
      > </a
      ><a name="5857" href="Stlc.html#5821" class="Function Operator"
      >&#8799;</a
      ><a name="5858"
      > </a
      ><a name="5859" href="Stlc.html#5763" class="InductiveConstructor"
      >id</a
      ><a name="5861"
      > </a
      ><a name="5862" href="Stlc.html#5862" class="Bound"
      >y</a
      ><a name="5863"
      > </a
      ><a name="5864" class="Keyword"
      >with</a
      ><a name="5868"
      > </a
      ><a name="5869" href="Stlc.html#5855" class="Bound"
      >x</a
      ><a name="5870"
      > </a
      ><a name="5871" href="https://agda.github.io/agda-stdlib/Data.Nat.Base.html#3199" class="Function Operator"
      >Data.Nat.&#8799;</a
      ><a name="5881"
      > </a
      ><a name="5882" href="Stlc.html#5862" class="Bound"
      >y</a
      ><a name="5883"
      >
</a
      ><a name="5884" href="Stlc.html#5763" class="InductiveConstructor"
      >id</a
      ><a name="5886"
      > </a
      ><a name="5887" href="Stlc.html#5887" class="Bound"
      >x</a
      ><a name="5888"
      > </a
      ><a name="5889" href="Stlc.html#5821" class="Function Operator"
      >&#8799;</a
      ><a name="5890"
      > </a
      ><a name="5891" href="Stlc.html#5763" class="InductiveConstructor"
      >id</a
      ><a name="5893"
      > </a
      ><a name="5894" href="Stlc.html#5894" class="Bound"
      >y</a
      ><a name="5895"
      > </a
      ><a name="5896" class="Symbol"
      >|</a
      ><a name="5897"
      > </a
      ><a name="5898" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="5901"
      > </a
      ><a name="5902" href="Stlc.html#5902" class="Bound"
      >x=y</a
      ><a name="5905"
      > </a
      ><a name="5906" class="Keyword"
      >rewrite</a
      ><a name="5913"
      > </a
      ><a name="5914" href="Stlc.html#5902" class="Bound"
      >x=y</a
      ><a name="5917"
      > </a
      ><a name="5918" class="Symbol"
      >=</a
      ><a name="5919"
      > </a
      ><a name="5920" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="5923"
      > </a
      ><a name="5924" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="5928"
      >
</a
      ><a name="5929" href="Stlc.html#5763" class="InductiveConstructor"
      >id</a
      ><a name="5931"
      > </a
      ><a name="5932" href="Stlc.html#5932" class="Bound"
      >x</a
      ><a name="5933"
      > </a
      ><a name="5934" href="Stlc.html#5821" class="Function Operator"
      >&#8799;</a
      ><a name="5935"
      > </a
      ><a name="5936" href="Stlc.html#5763" class="InductiveConstructor"
      >id</a
      ><a name="5938"
      > </a
      ><a name="5939" href="Stlc.html#5939" class="Bound"
      >y</a
      ><a name="5940"
      > </a
      ><a name="5941" class="Symbol"
      >|</a
      ><a name="5942"
      > </a
      ><a name="5943" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="5945"
      >  </a
      ><a name="5947" href="Stlc.html#5947" class="Bound"
      >x&#8800;y</a
      ><a name="5950"
      > </a
      ><a name="5951" class="Symbol"
      >=</a
      ><a name="5952"
      > </a
      ><a name="5953" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="5955"
      > </a
      ><a name="5956" class="Symbol"
      >(</a
      ><a name="5957" href="Stlc.html#5947" class="Bound"
      >x&#8800;y</a
      ><a name="5960"
      > </a
      ><a name="5961" href="https://agda.github.io/agda-stdlib/Function.html#713" class="Function Operator"
      >&#8728;</a
      ><a name="5962"
      > </a
      ><a name="5963" href="Stlc.html#5983" class="Function"
      >id-inj</a
      ><a name="5969" class="Symbol"
      >)</a
      ><a name="5970"
      >
  </a
      ><a name="5973" class="Keyword"
      >where</a
      ><a name="5978"
      >
    </a
      ><a name="5983" href="Stlc.html#5983" class="Function"
      >id-inj</a
      ><a name="5989"
      > </a
      ><a name="5990" class="Symbol"
      >:</a
      ><a name="5991"
      > </a
      ><a name="5992" class="Symbol"
      >&#8704;</a
      ><a name="5993"
      > </a
      ><a name="5994" class="Symbol"
      >{</a
      ><a name="5995" href="Stlc.html#5995" class="Bound"
      >x</a
      ><a name="5996"
      > </a
      ><a name="5997" href="Stlc.html#5997" class="Bound"
      >y</a
      ><a name="5998" class="Symbol"
      >}</a
      ><a name="5999"
      > </a
      ><a name="6000" class="Symbol"
      >&#8594;</a
      ><a name="6001"
      > </a
      ><a name="6002" href="Stlc.html#5763" class="InductiveConstructor"
      >id</a
      ><a name="6004"
      > </a
      ><a name="6005" href="Stlc.html#5995" class="Bound"
      >x</a
      ><a name="6006"
      > </a
      ><a name="6007" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="6008"
      > </a
      ><a name="6009" href="Stlc.html#5763" class="InductiveConstructor"
      >id</a
      ><a name="6011"
      > </a
      ><a name="6012" href="Stlc.html#5997" class="Bound"
      >y</a
      ><a name="6013"
      > </a
      ><a name="6014" class="Symbol"
      >&#8594;</a
      ><a name="6015"
      > </a
      ><a name="6016" href="Stlc.html#5995" class="Bound"
      >x</a
      ><a name="6017"
      > </a
      ><a name="6018" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="6019"
      > </a
      ><a name="6020" href="Stlc.html#5997" class="Bound"
      >y</a
      ><a name="6021"
      >
    </a
      ><a name="6026" href="Stlc.html#5983" class="Function"
      >id-inj</a
      ><a name="6032"
      > </a
      ><a name="6033" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="6037"
      > </a
      ><a name="6038" class="Symbol"
      >=</a
      ><a name="6039"
      > </a
      ><a name="6040" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      >
{% endraw %}</pre>
</div>

<pre class="Agda">{% raw %}
<a name="6077" class="Keyword"
      >data</a
      ><a name="6081"
      > </a
      ><a name="6082" href="Stlc.html#6082" class="Datatype"
      >Term</a
      ><a name="6086"
      > </a
      ><a name="6087" class="Symbol"
      >:</a
      ><a name="6088"
      > </a
      ><a name="6089" class="PrimitiveType"
      >Set</a
      ><a name="6092"
      > </a
      ><a name="6093" class="Keyword"
      >where</a
      ><a name="6098"
      >
  </a
      ><a name="6101" href="Stlc.html#6101" class="InductiveConstructor"
      >var</a
      ><a name="6104"
      >   </a
      ><a name="6107" class="Symbol"
      >:</a
      ><a name="6108"
      > </a
      ><a name="6109" href="Stlc.html#5746" class="Datatype"
      >Id</a
      ><a name="6111"
      > </a
      ><a name="6112" class="Symbol"
      >&#8594;</a
      ><a name="6113"
      > </a
      ><a name="6114" href="Stlc.html#6082" class="Datatype"
      >Term</a
      ><a name="6118"
      >
  </a
      ><a name="6121" href="Stlc.html#6121" class="InductiveConstructor"
      >app</a
      ><a name="6124"
      >   </a
      ><a name="6127" class="Symbol"
      >:</a
      ><a name="6128"
      > </a
      ><a name="6129" href="Stlc.html#6082" class="Datatype"
      >Term</a
      ><a name="6133"
      > </a
      ><a name="6134" class="Symbol"
      >&#8594;</a
      ><a name="6135"
      > </a
      ><a name="6136" href="Stlc.html#6082" class="Datatype"
      >Term</a
      ><a name="6140"
      > </a
      ><a name="6141" class="Symbol"
      >&#8594;</a
      ><a name="6142"
      > </a
      ><a name="6143" href="Stlc.html#6082" class="Datatype"
      >Term</a
      ><a name="6147"
      >
  </a
      ><a name="6150" href="Stlc.html#6150" class="InductiveConstructor"
      >abs</a
      ><a name="6153"
      >   </a
      ><a name="6156" class="Symbol"
      >:</a
      ><a name="6157"
      > </a
      ><a name="6158" href="Stlc.html#5746" class="Datatype"
      >Id</a
      ><a name="6160"
      > </a
      ><a name="6161" class="Symbol"
      >&#8594;</a
      ><a name="6162"
      > </a
      ><a name="6163" href="Stlc.html#5579" class="Datatype"
      >Type</a
      ><a name="6167"
      > </a
      ><a name="6168" class="Symbol"
      >&#8594;</a
      ><a name="6169"
      > </a
      ><a name="6170" href="Stlc.html#6082" class="Datatype"
      >Term</a
      ><a name="6174"
      > </a
      ><a name="6175" class="Symbol"
      >&#8594;</a
      ><a name="6176"
      > </a
      ><a name="6177" href="Stlc.html#6082" class="Datatype"
      >Term</a
      ><a name="6181"
      >
  </a
      ><a name="6184" href="Stlc.html#6184" class="InductiveConstructor"
      >true</a
      ><a name="6188"
      >  </a
      ><a name="6190" class="Symbol"
      >:</a
      ><a name="6191"
      > </a
      ><a name="6192" href="Stlc.html#6082" class="Datatype"
      >Term</a
      ><a name="6196"
      >
  </a
      ><a name="6199" href="Stlc.html#6199" class="InductiveConstructor"
      >false</a
      ><a name="6204"
      > </a
      ><a name="6205" class="Symbol"
      >:</a
      ><a name="6206"
      > </a
      ><a name="6207" href="Stlc.html#6082" class="Datatype"
      >Term</a
      ><a name="6211"
      >
  </a
      ><a name="6214" href="Stlc.html#6214" class="InductiveConstructor Operator"
      >if_then_else_</a
      ><a name="6227"
      > </a
      ><a name="6228" class="Symbol"
      >:</a
      ><a name="6229"
      > </a
      ><a name="6230" href="Stlc.html#6082" class="Datatype"
      >Term</a
      ><a name="6234"
      > </a
      ><a name="6235" class="Symbol"
      >&#8594;</a
      ><a name="6236"
      > </a
      ><a name="6237" href="Stlc.html#6082" class="Datatype"
      >Term</a
      ><a name="6241"
      > </a
      ><a name="6242" class="Symbol"
      >&#8594;</a
      ><a name="6243"
      > </a
      ><a name="6244" href="Stlc.html#6082" class="Datatype"
      >Term</a
      ><a name="6248"
      > </a
      ><a name="6249" class="Symbol"
      >&#8594;</a
      ><a name="6250"
      > </a
      ><a name="6251" href="Stlc.html#6082" class="Datatype"
      >Term</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="6302" class="Keyword"
      >infixr</a
      ><a name="6308"
      > </a
      ><a name="6309" class="Number"
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
<a name="6681" href="Stlc.html#6681" class="Function"
      >x</a
      ><a name="6682"
      > </a
      ><a name="6683" class="Symbol"
      >=</a
      ><a name="6684"
      > </a
      ><a name="6685" href="Stlc.html#5763" class="InductiveConstructor"
      >id</a
      ><a name="6687"
      > </a
      ><a name="6688" class="Number"
      >0</a
      ><a name="6689"
      >
</a
      ><a name="6690" href="Stlc.html#6690" class="Function"
      >y</a
      ><a name="6691"
      > </a
      ><a name="6692" class="Symbol"
      >=</a
      ><a name="6693"
      > </a
      ><a name="6694" href="Stlc.html#5763" class="InductiveConstructor"
      >id</a
      ><a name="6696"
      > </a
      ><a name="6697" class="Number"
      >1</a
      ><a name="6698"
      >
</a
      ><a name="6699" href="Stlc.html#6699" class="Function"
      >z</a
      ><a name="6700"
      > </a
      ><a name="6701" class="Symbol"
      >=</a
      ><a name="6702"
      > </a
      ><a name="6703" href="Stlc.html#5763" class="InductiveConstructor"
      >id</a
      ><a name="6705"
      > </a
      ><a name="6706" class="Number"
      >2</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="6754" class="Symbol"
      >{-#</a
      ><a name="6757"
      > </a
      ><a name="6758" class="Keyword"
      >DISPLAY</a
      ><a name="6765"
      > </a
      ><a name="6766" href="Agda.Builtin.Nat.html#87" class="InductiveConstructor"
      >zero</a
      ><a name="6770"
      > = </a
      ><a name="6773" href="Stlc.html#6681" class="Function"
      >x</a
      ><a name="6774"
      > </a
      ><a name="6775" class="Symbol"
      >#-}</a
      ><a name="6778"
      >
</a
      ><a name="6779" class="Symbol"
      >{-#</a
      ><a name="6782"
      > </a
      ><a name="6783" class="Keyword"
      >DISPLAY</a
      ><a name="6790"
      > </a
      ><a name="6791" href="Agda.Builtin.Nat.html#100" class="InductiveConstructor"
      >suc</a
      ><a name="6794"
      > </a
      ><a name="6795" href="Agda.Builtin.Nat.html#87" class="InductiveConstructor"
      >zero</a
      ><a name="6799"
      > = </a
      ><a name="6802" href="Stlc.html#6690" class="Function"
      >y</a
      ><a name="6803"
      > </a
      ><a name="6804" class="Symbol"
      >#-}</a
      ><a name="6807"
      >
</a
      ><a name="6808" class="Symbol"
      >{-#</a
      ><a name="6811"
      > </a
      ><a name="6812" class="Keyword"
      >DISPLAY</a
      ><a name="6819"
      > </a
      ><a name="6820" href="Agda.Builtin.Nat.html#100" class="InductiveConstructor"
      >suc</a
      ><a name="6823"
      > (</a
      ><a name="6825" href="Agda.Builtin.Nat.html#100" class="InductiveConstructor"
      >suc</a
      ><a name="6828"
      > </a
      ><a name="6829" href="Agda.Builtin.Nat.html#87" class="InductiveConstructor"
      >zero</a
      ><a name="6833"
      >) = </a
      ><a name="6837" href="Stlc.html#6699" class="Function"
      >z</a
      ><a name="6838"
      > </a
      ><a name="6839" class="Symbol"
      >#-}</a
      >
{% endraw %}</pre>
</div>

$$\text{idB} = \lambda x:bool. x$$.

<pre class="Agda">{% raw %}
<a name="6912" href="Stlc.html#6912" class="Function"
      >idB</a
      ><a name="6915"
      > </a
      ><a name="6916" class="Symbol"
      >=</a
      ><a name="6917"
      > </a
      ><a name="6918" class="Symbol"
      >(</a
      ><a name="6919" href="Stlc.html#6150" class="InductiveConstructor"
      >abs</a
      ><a name="6922"
      > </a
      ><a name="6923" href="Stlc.html#6681" class="Function"
      >x</a
      ><a name="6924"
      > </a
      ><a name="6925" href="Stlc.html#5598" class="InductiveConstructor"
      >bool</a
      ><a name="6929"
      > </a
      ><a name="6930" class="Symbol"
      >(</a
      ><a name="6931" href="Stlc.html#6101" class="InductiveConstructor"
      >var</a
      ><a name="6934"
      > </a
      ><a name="6935" href="Stlc.html#6681" class="Function"
      >x</a
      ><a name="6936" class="Symbol"
      >))</a
      >
{% endraw %}</pre>

$$\text{idBB} = \lambda x:bool\rightarrow bool. x$$.

<pre class="Agda">{% raw %}
<a name="7018" href="Stlc.html#7018" class="Function"
      >idBB</a
      ><a name="7022"
      > </a
      ><a name="7023" class="Symbol"
      >=</a
      ><a name="7024"
      > </a
      ><a name="7025" class="Symbol"
      >(</a
      ><a name="7026" href="Stlc.html#6150" class="InductiveConstructor"
      >abs</a
      ><a name="7029"
      > </a
      ><a name="7030" href="Stlc.html#6681" class="Function"
      >x</a
      ><a name="7031"
      > </a
      ><a name="7032" class="Symbol"
      >(</a
      ><a name="7033" href="Stlc.html#5598" class="InductiveConstructor"
      >bool</a
      ><a name="7037"
      > </a
      ><a name="7038" href="Stlc.html#5612" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="7039"
      > </a
      ><a name="7040" href="Stlc.html#5598" class="InductiveConstructor"
      >bool</a
      ><a name="7044" class="Symbol"
      >)</a
      ><a name="7045"
      > </a
      ><a name="7046" class="Symbol"
      >(</a
      ><a name="7047" href="Stlc.html#6101" class="InductiveConstructor"
      >var</a
      ><a name="7050"
      > </a
      ><a name="7051" href="Stlc.html#6681" class="Function"
      >x</a
      ><a name="7052" class="Symbol"
      >))</a
      >
{% endraw %}</pre>

$$\text{idBBBB} = \lambda x:(bool\rightarrow bool)\rightarrow (bool\rightarrow bool). x$$.

<pre class="Agda">{% raw %}
<a name="7172" href="Stlc.html#7172" class="Function"
      >idBBBB</a
      ><a name="7178"
      > </a
      ><a name="7179" class="Symbol"
      >=</a
      ><a name="7180"
      > </a
      ><a name="7181" class="Symbol"
      >(</a
      ><a name="7182" href="Stlc.html#6150" class="InductiveConstructor"
      >abs</a
      ><a name="7185"
      > </a
      ><a name="7186" href="Stlc.html#6681" class="Function"
      >x</a
      ><a name="7187"
      > </a
      ><a name="7188" class="Symbol"
      >((</a
      ><a name="7190" href="Stlc.html#5598" class="InductiveConstructor"
      >bool</a
      ><a name="7194"
      > </a
      ><a name="7195" href="Stlc.html#5612" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="7196"
      > </a
      ><a name="7197" href="Stlc.html#5598" class="InductiveConstructor"
      >bool</a
      ><a name="7201" class="Symbol"
      >)</a
      ><a name="7202"
      > </a
      ><a name="7203" href="Stlc.html#5612" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="7204"
      > </a
      ><a name="7205" class="Symbol"
      >(</a
      ><a name="7206" href="Stlc.html#5598" class="InductiveConstructor"
      >bool</a
      ><a name="7210"
      > </a
      ><a name="7211" href="Stlc.html#5612" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="7212"
      > </a
      ><a name="7213" href="Stlc.html#5598" class="InductiveConstructor"
      >bool</a
      ><a name="7217" class="Symbol"
      >))</a
      ><a name="7219"
      > </a
      ><a name="7220" class="Symbol"
      >(</a
      ><a name="7221" href="Stlc.html#6101" class="InductiveConstructor"
      >var</a
      ><a name="7224"
      > </a
      ><a name="7225" href="Stlc.html#6681" class="Function"
      >x</a
      ><a name="7226" class="Symbol"
      >))</a
      >
{% endraw %}</pre>

$$\text{k} = \lambda x:bool. \lambda y:bool. x$$.

<pre class="Agda">{% raw %}
<a name="7305" href="Stlc.html#7305" class="Function"
      >k</a
      ><a name="7306"
      > </a
      ><a name="7307" class="Symbol"
      >=</a
      ><a name="7308"
      > </a
      ><a name="7309" class="Symbol"
      >(</a
      ><a name="7310" href="Stlc.html#6150" class="InductiveConstructor"
      >abs</a
      ><a name="7313"
      > </a
      ><a name="7314" href="Stlc.html#6681" class="Function"
      >x</a
      ><a name="7315"
      > </a
      ><a name="7316" href="Stlc.html#5598" class="InductiveConstructor"
      >bool</a
      ><a name="7320"
      > </a
      ><a name="7321" class="Symbol"
      >(</a
      ><a name="7322" href="Stlc.html#6150" class="InductiveConstructor"
      >abs</a
      ><a name="7325"
      > </a
      ><a name="7326" href="Stlc.html#6690" class="Function"
      >y</a
      ><a name="7327"
      > </a
      ><a name="7328" href="Stlc.html#5598" class="InductiveConstructor"
      >bool</a
      ><a name="7332"
      > </a
      ><a name="7333" class="Symbol"
      >(</a
      ><a name="7334" href="Stlc.html#6101" class="InductiveConstructor"
      >var</a
      ><a name="7337"
      > </a
      ><a name="7338" href="Stlc.html#6681" class="Function"
      >x</a
      ><a name="7339" class="Symbol"
      >)))</a
      >
{% endraw %}</pre>

$$\text{notB} = \lambda x:bool. \text{if }x\text{ then }false\text{ else }true$$.

<pre class="Agda">{% raw %}
<a name="7451" href="Stlc.html#7451" class="Function"
      >notB</a
      ><a name="7455"
      > </a
      ><a name="7456" class="Symbol"
      >=</a
      ><a name="7457"
      > </a
      ><a name="7458" class="Symbol"
      >(</a
      ><a name="7459" href="Stlc.html#6150" class="InductiveConstructor"
      >abs</a
      ><a name="7462"
      > </a
      ><a name="7463" href="Stlc.html#6681" class="Function"
      >x</a
      ><a name="7464"
      > </a
      ><a name="7465" href="Stlc.html#5598" class="InductiveConstructor"
      >bool</a
      ><a name="7469"
      > </a
      ><a name="7470" class="Symbol"
      >(</a
      ><a name="7471" href="Stlc.html#6214" class="InductiveConstructor Operator"
      >if</a
      ><a name="7473"
      > </a
      ><a name="7474" class="Symbol"
      >(</a
      ><a name="7475" href="Stlc.html#6101" class="InductiveConstructor"
      >var</a
      ><a name="7478"
      > </a
      ><a name="7479" href="Stlc.html#6681" class="Function"
      >x</a
      ><a name="7480" class="Symbol"
      >)</a
      ><a name="7481"
      > </a
      ><a name="7482" href="Stlc.html#6214" class="InductiveConstructor Operator"
      >then</a
      ><a name="7486"
      > </a
      ><a name="7487" href="Stlc.html#6199" class="InductiveConstructor"
      >false</a
      ><a name="7492"
      > </a
      ><a name="7493" href="Stlc.html#6214" class="InductiveConstructor Operator"
      >else</a
      ><a name="7497"
      > </a
      ><a name="7498" href="Stlc.html#6184" class="InductiveConstructor"
      >true</a
      ><a name="7502" class="Symbol"
      >))</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="7551" class="Symbol"
      >{-#</a
      ><a name="7554"
      > </a
      ><a name="7555" class="Keyword"
      >DISPLAY</a
      ><a name="7562"
      > </a
      ><a name="7563" href="Stlc.html#6150" class="InductiveConstructor"
      >abs</a
      ><a name="7566"
      > 0 </a
      ><a name="7569" href="Stlc.html#5598" class="InductiveConstructor"
      >bool</a
      ><a name="7573"
      > (</a
      ><a name="7575" href="Stlc.html#6101" class="InductiveConstructor"
      >var</a
      ><a name="7578"
      > 0) = </a
      ><a name="7584" href="Stlc.html#6912" class="Function"
      >idB</a
      ><a name="7587"
      > </a
      ><a name="7588" class="Symbol"
      >#-}</a
      ><a name="7591"
      >
</a
      ><a name="7592" class="Symbol"
      >{-#</a
      ><a name="7595"
      > </a
      ><a name="7596" class="Keyword"
      >DISPLAY</a
      ><a name="7603"
      > </a
      ><a name="7604" href="Stlc.html#6150" class="InductiveConstructor"
      >abs</a
      ><a name="7607"
      > 0 (</a
      ><a name="7611" href="Stlc.html#5598" class="InductiveConstructor"
      >bool</a
      ><a name="7615"
      > </a
      ><a name="7616" href="Stlc.html#5612" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="7617"
      > </a
      ><a name="7618" href="Stlc.html#5598" class="InductiveConstructor"
      >bool</a
      ><a name="7622"
      >) (</a
      ><a name="7625" href="Stlc.html#6101" class="InductiveConstructor"
      >var</a
      ><a name="7628"
      > 0) = </a
      ><a name="7634" href="Stlc.html#7018" class="Function"
      >idBB</a
      ><a name="7638"
      > </a
      ><a name="7639" class="Symbol"
      >#-}</a
      ><a name="7642"
      >
</a
      ><a name="7643" class="Symbol"
      >{-#</a
      ><a name="7646"
      > </a
      ><a name="7647" class="Keyword"
      >DISPLAY</a
      ><a name="7654"
      > </a
      ><a name="7655" href="Stlc.html#6150" class="InductiveConstructor"
      >abs</a
      ><a name="7658"
      > 0 ((</a
      ><a name="7663" href="Stlc.html#5598" class="InductiveConstructor"
      >bool</a
      ><a name="7667"
      > </a
      ><a name="7668" href="Stlc.html#5612" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="7669"
      > </a
      ><a name="7670" href="Stlc.html#5598" class="InductiveConstructor"
      >bool</a
      ><a name="7674"
      >) </a
      ><a name="7676" href="Stlc.html#5612" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="7677"
      > (</a
      ><a name="7679" href="Stlc.html#5598" class="InductiveConstructor"
      >bool</a
      ><a name="7683"
      > </a
      ><a name="7684" href="Stlc.html#5612" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="7685"
      > </a
      ><a name="7686" href="Stlc.html#5598" class="InductiveConstructor"
      >bool</a
      ><a name="7690"
      >)) (</a
      ><a name="7694" href="Stlc.html#6101" class="InductiveConstructor"
      >var</a
      ><a name="7697"
      > 0) = </a
      ><a name="7703" href="Stlc.html#7172" class="Function"
      >idBBBB</a
      ><a name="7709"
      > </a
      ><a name="7710" class="Symbol"
      >#-}</a
      ><a name="7713"
      >
</a
      ><a name="7714" class="Symbol"
      >{-#</a
      ><a name="7717"
      > </a
      ><a name="7718" class="Keyword"
      >DISPLAY</a
      ><a name="7725"
      > </a
      ><a name="7726" href="Stlc.html#6150" class="InductiveConstructor"
      >abs</a
      ><a name="7729"
      > 0 </a
      ><a name="7732" href="Stlc.html#5598" class="InductiveConstructor"
      >bool</a
      ><a name="7736"
      > (</a
      ><a name="7738" href="Stlc.html#6150" class="InductiveConstructor"
      >abs</a
      ><a name="7741"
      > </a
      ><a name="7742" href="Stlc.html#7742" class="Bound"
      >y</a
      ><a name="7743"
      > </a
      ><a name="7744" href="Stlc.html#5598" class="InductiveConstructor"
      >bool</a
      ><a name="7748"
      > (</a
      ><a name="7750" href="Stlc.html#6101" class="InductiveConstructor"
      >var</a
      ><a name="7753"
      > 0)) = </a
      ><a name="7760" href="Stlc.html#7305" class="Function"
      >k</a
      ><a name="7761"
      > </a
      ><a name="7762" class="Symbol"
      >#-}</a
      ><a name="7765"
      >
</a
      ><a name="7766" class="Symbol"
      >{-#</a
      ><a name="7769"
      > </a
      ><a name="7770" class="Keyword"
      >DISPLAY</a
      ><a name="7777"
      > </a
      ><a name="7778" href="Stlc.html#6150" class="InductiveConstructor"
      >abs</a
      ><a name="7781"
      > 0 </a
      ><a name="7784" href="Stlc.html#5598" class="InductiveConstructor"
      >bool</a
      ><a name="7788"
      > (</a
      ><a name="7790" href="Stlc.html#6214" class="InductiveConstructor Operator"
      >if</a
      ><a name="7792"
      > (</a
      ><a name="7794" href="Stlc.html#6101" class="InductiveConstructor"
      >var</a
      ><a name="7797"
      > 0) </a
      ><a name="7801" href="Stlc.html#6214" class="InductiveConstructor Operator"
      >then</a
      ><a name="7805"
      > </a
      ><a name="7806" href="Stlc.html#6199" class="InductiveConstructor"
      >false</a
      ><a name="7811"
      > </a
      ><a name="7812" href="Stlc.html#6214" class="InductiveConstructor Operator"
      >else</a
      ><a name="7816"
      > </a
      ><a name="7817" href="Stlc.html#6184" class="InductiveConstructor"
      >true</a
      ><a name="7821"
      >) = </a
      ><a name="7825" href="Stlc.html#7451" class="Function"
      >notB</a
      ><a name="7829"
      > </a
      ><a name="7830" class="Symbol"
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
<a name="9068" href="Stlc.html#9068" class="Function Operator"
      >test_normalizeUnderLambda</a
      ><a name="9093"
      > </a
      ><a name="9094" class="Symbol"
      >:</a
      ><a name="9095"
      > </a
      ><a name="9096" class="Symbol"
      >(&#955;</a
      ><a name="9098"
      > </a
      ><a name="9099" class="Symbol"
      >(</a
      ><a name="9100" href="Stlc.html#9100" class="Bound"
      >x</a
      ><a name="9101"
      > </a
      ><a name="9102" class="Symbol"
      >:</a
      ><a name="9103"
      > </a
      ><a name="9104" href="Agda.Builtin.Nat.html#69" class="Datatype"
      >&#8469;</a
      ><a name="9105" class="Symbol"
      >)</a
      ><a name="9106"
      > </a
      ><a name="9107" class="Symbol"
      >&#8594;</a
      ><a name="9108"
      > </a
      ><a name="9109" class="Number"
      >3</a
      ><a name="9110"
      > </a
      ><a name="9111" href="Agda.Builtin.Nat.html#202" class="Primitive Operator"
      >+</a
      ><a name="9112"
      > </a
      ><a name="9113" class="Number"
      >4</a
      ><a name="9114" class="Symbol"
      >)</a
      ><a name="9115"
      > </a
      ><a name="9116" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="9117"
      > </a
      ><a name="9118" class="Symbol"
      >(&#955;</a
      ><a name="9120"
      > </a
      ><a name="9121" class="Symbol"
      >(</a
      ><a name="9122" href="Stlc.html#9122" class="Bound"
      >x</a
      ><a name="9123"
      > </a
      ><a name="9124" class="Symbol"
      >:</a
      ><a name="9125"
      > </a
      ><a name="9126" href="Agda.Builtin.Nat.html#69" class="Datatype"
      >&#8469;</a
      ><a name="9127" class="Symbol"
      >)</a
      ><a name="9128"
      > </a
      ><a name="9129" class="Symbol"
      >&#8594;</a
      ><a name="9130"
      > </a
      ><a name="9131" class="Number"
      >7</a
      ><a name="9132" class="Symbol"
      >)</a
      ><a name="9133"
      >
</a
      ><a name="9134" href="Stlc.html#9068" class="Function Operator"
      >test_normalizeUnderLambda</a
      ><a name="9159"
      > </a
      ><a name="9160" class="Symbol"
      >=</a
      ><a name="9161"
      > </a
      ><a name="9162" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      >
{% endraw %}</pre>

Most real-world functional programming languages make the second
choice---reduction of a function's body only begins when the
function is actually applied to an argument.  We also make the
second choice here.

<pre class="Agda">{% raw %}
<a name="9402" class="Keyword"
      >data</a
      ><a name="9406"
      > </a
      ><a name="9407" href="Stlc.html#9407" class="Datatype"
      >Value</a
      ><a name="9412"
      > </a
      ><a name="9413" class="Symbol"
      >:</a
      ><a name="9414"
      > </a
      ><a name="9415" href="Stlc.html#6082" class="Datatype"
      >Term</a
      ><a name="9419"
      > </a
      ><a name="9420" class="Symbol"
      >&#8594;</a
      ><a name="9421"
      > </a
      ><a name="9422" class="PrimitiveType"
      >Set</a
      ><a name="9425"
      > </a
      ><a name="9426" class="Keyword"
      >where</a
      ><a name="9431"
      >
  </a
      ><a name="9434" href="Stlc.html#9434" class="InductiveConstructor"
      >abs</a
      ><a name="9437"
      >   </a
      ><a name="9440" class="Symbol"
      >:</a
      ><a name="9441"
      > </a
      ><a name="9442" class="Symbol"
      >&#8704;</a
      ><a name="9443"
      > </a
      ><a name="9444" class="Symbol"
      >{</a
      ><a name="9445" href="Stlc.html#9445" class="Bound"
      >x</a
      ><a name="9446"
      > </a
      ><a name="9447" href="Stlc.html#9447" class="Bound"
      >A</a
      ><a name="9448"
      > </a
      ><a name="9449" href="Stlc.html#9449" class="Bound"
      >t</a
      ><a name="9450" class="Symbol"
      >}</a
      ><a name="9451"
      >
        </a
      ><a name="9460" class="Symbol"
      >&#8594;</a
      ><a name="9461"
      > </a
      ><a name="9462" href="Stlc.html#9407" class="Datatype"
      >Value</a
      ><a name="9467"
      > </a
      ><a name="9468" class="Symbol"
      >(</a
      ><a name="9469" href="Stlc.html#6150" class="InductiveConstructor"
      >abs</a
      ><a name="9472"
      > </a
      ><a name="9473" href="Stlc.html#9445" class="Bound"
      >x</a
      ><a name="9474"
      > </a
      ><a name="9475" href="Stlc.html#9447" class="Bound"
      >A</a
      ><a name="9476"
      > </a
      ><a name="9477" href="Stlc.html#9449" class="Bound"
      >t</a
      ><a name="9478" class="Symbol"
      >)</a
      ><a name="9479"
      >
  </a
      ><a name="9482" href="Stlc.html#9482" class="InductiveConstructor"
      >true</a
      ><a name="9486"
      >  </a
      ><a name="9488" class="Symbol"
      >:</a
      ><a name="9489"
      > </a
      ><a name="9490" href="Stlc.html#9407" class="Datatype"
      >Value</a
      ><a name="9495"
      > </a
      ><a name="9496" href="Stlc.html#6184" class="InductiveConstructor"
      >true</a
      ><a name="9500"
      >
  </a
      ><a name="9503" href="Stlc.html#9503" class="InductiveConstructor"
      >false</a
      ><a name="9508"
      > </a
      ><a name="9509" class="Symbol"
      >:</a
      ><a name="9510"
      > </a
      ><a name="9511" href="Stlc.html#9407" class="Datatype"
      >Value</a
      ><a name="9516"
      > </a
      ><a name="9517" href="Stlc.html#6199" class="InductiveConstructor"
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
<a name="12627" href="Stlc.html#12627" class="Function Operator"
      >[_:=_]_</a
      ><a name="12634"
      > </a
      ><a name="12635" class="Symbol"
      >:</a
      ><a name="12636"
      > </a
      ><a name="12637" href="Stlc.html#5746" class="Datatype"
      >Id</a
      ><a name="12639"
      > </a
      ><a name="12640" class="Symbol"
      >-&gt;</a
      ><a name="12642"
      > </a
      ><a name="12643" href="Stlc.html#6082" class="Datatype"
      >Term</a
      ><a name="12647"
      > </a
      ><a name="12648" class="Symbol"
      >-&gt;</a
      ><a name="12650"
      > </a
      ><a name="12651" href="Stlc.html#6082" class="Datatype"
      >Term</a
      ><a name="12655"
      > </a
      ><a name="12656" class="Symbol"
      >-&gt;</a
      ><a name="12658"
      > </a
      ><a name="12659" href="Stlc.html#6082" class="Datatype"
      >Term</a
      ><a name="12663"
      >
</a
      ><a name="12664" href="Stlc.html#12627" class="Function Operator"
      >[</a
      ><a name="12665"
      > </a
      ><a name="12666" href="Stlc.html#12666" class="Bound"
      >x</a
      ><a name="12667"
      > </a
      ><a name="12668" href="Stlc.html#12627" class="Function Operator"
      >:=</a
      ><a name="12670"
      > </a
      ><a name="12671" href="Stlc.html#12671" class="Bound"
      >v</a
      ><a name="12672"
      > </a
      ><a name="12673" href="Stlc.html#12627" class="Function Operator"
      >]</a
      ><a name="12674"
      > </a
      ><a name="12675" class="Symbol"
      >(</a
      ><a name="12676" href="Stlc.html#6101" class="InductiveConstructor"
      >var</a
      ><a name="12679"
      > </a
      ><a name="12680" href="Stlc.html#12680" class="Bound"
      >y</a
      ><a name="12681" class="Symbol"
      >)</a
      ><a name="12682"
      > </a
      ><a name="12683" class="Keyword"
      >with</a
      ><a name="12687"
      > </a
      ><a name="12688" href="Stlc.html#12666" class="Bound"
      >x</a
      ><a name="12689"
      > </a
      ><a name="12690" href="Stlc.html#5821" class="Function Operator"
      >&#8799;</a
      ><a name="12691"
      > </a
      ><a name="12692" href="Stlc.html#12680" class="Bound"
      >y</a
      ><a name="12693"
      >
</a
      ><a name="12694" class="Symbol"
      >...</a
      ><a name="12697"
      > </a
      ><a name="12698" class="Symbol"
      >|</a
      ><a name="12699"
      > </a
      ><a name="12700" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="12703"
      > </a
      ><a name="12704" href="Stlc.html#12704" class="Bound"
      >x=y</a
      ><a name="12707"
      > </a
      ><a name="12708" class="Symbol"
      >=</a
      ><a name="12709"
      > </a
      ><a name="12710" href="Stlc.html#12671" class="Bound"
      >v</a
      ><a name="12711"
      >
</a
      ><a name="12712" class="Symbol"
      >...</a
      ><a name="12715"
      > </a
      ><a name="12716" class="Symbol"
      >|</a
      ><a name="12717"
      > </a
      ><a name="12718" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="12720"
      >  </a
      ><a name="12722" href="Stlc.html#12722" class="Bound"
      >x&#8800;y</a
      ><a name="12725"
      > </a
      ><a name="12726" class="Symbol"
      >=</a
      ><a name="12727"
      > </a
      ><a name="12728" href="Stlc.html#6101" class="InductiveConstructor"
      >var</a
      ><a name="12731"
      > </a
      ><a name="12732" href="Stlc.html#12680" class="Bound"
      >y</a
      ><a name="12733"
      >
</a
      ><a name="12734" href="Stlc.html#12627" class="Function Operator"
      >[</a
      ><a name="12735"
      > </a
      ><a name="12736" href="Stlc.html#12736" class="Bound"
      >x</a
      ><a name="12737"
      > </a
      ><a name="12738" href="Stlc.html#12627" class="Function Operator"
      >:=</a
      ><a name="12740"
      > </a
      ><a name="12741" href="Stlc.html#12741" class="Bound"
      >v</a
      ><a name="12742"
      > </a
      ><a name="12743" href="Stlc.html#12627" class="Function Operator"
      >]</a
      ><a name="12744"
      > </a
      ><a name="12745" class="Symbol"
      >(</a
      ><a name="12746" href="Stlc.html#6121" class="InductiveConstructor"
      >app</a
      ><a name="12749"
      > </a
      ><a name="12750" href="Stlc.html#12750" class="Bound"
      >s</a
      ><a name="12751"
      > </a
      ><a name="12752" href="Stlc.html#12752" class="Bound"
      >t</a
      ><a name="12753" class="Symbol"
      >)</a
      ><a name="12754"
      > </a
      ><a name="12755" class="Symbol"
      >=</a
      ><a name="12756"
      > </a
      ><a name="12757" href="Stlc.html#6121" class="InductiveConstructor"
      >app</a
      ><a name="12760"
      > </a
      ><a name="12761" class="Symbol"
      >(</a
      ><a name="12762" href="Stlc.html#12627" class="Function Operator"
      >[</a
      ><a name="12763"
      > </a
      ><a name="12764" href="Stlc.html#12736" class="Bound"
      >x</a
      ><a name="12765"
      > </a
      ><a name="12766" href="Stlc.html#12627" class="Function Operator"
      >:=</a
      ><a name="12768"
      > </a
      ><a name="12769" href="Stlc.html#12741" class="Bound"
      >v</a
      ><a name="12770"
      > </a
      ><a name="12771" href="Stlc.html#12627" class="Function Operator"
      >]</a
      ><a name="12772"
      > </a
      ><a name="12773" href="Stlc.html#12750" class="Bound"
      >s</a
      ><a name="12774" class="Symbol"
      >)</a
      ><a name="12775"
      > </a
      ><a name="12776" class="Symbol"
      >(</a
      ><a name="12777" href="Stlc.html#12627" class="Function Operator"
      >[</a
      ><a name="12778"
      > </a
      ><a name="12779" href="Stlc.html#12736" class="Bound"
      >x</a
      ><a name="12780"
      > </a
      ><a name="12781" href="Stlc.html#12627" class="Function Operator"
      >:=</a
      ><a name="12783"
      > </a
      ><a name="12784" href="Stlc.html#12741" class="Bound"
      >v</a
      ><a name="12785"
      > </a
      ><a name="12786" href="Stlc.html#12627" class="Function Operator"
      >]</a
      ><a name="12787"
      > </a
      ><a name="12788" href="Stlc.html#12752" class="Bound"
      >t</a
      ><a name="12789" class="Symbol"
      >)</a
      ><a name="12790"
      >
</a
      ><a name="12791" href="Stlc.html#12627" class="Function Operator"
      >[</a
      ><a name="12792"
      > </a
      ><a name="12793" href="Stlc.html#12793" class="Bound"
      >x</a
      ><a name="12794"
      > </a
      ><a name="12795" href="Stlc.html#12627" class="Function Operator"
      >:=</a
      ><a name="12797"
      > </a
      ><a name="12798" href="Stlc.html#12798" class="Bound"
      >v</a
      ><a name="12799"
      > </a
      ><a name="12800" href="Stlc.html#12627" class="Function Operator"
      >]</a
      ><a name="12801"
      > </a
      ><a name="12802" class="Symbol"
      >(</a
      ><a name="12803" href="Stlc.html#6150" class="InductiveConstructor"
      >abs</a
      ><a name="12806"
      > </a
      ><a name="12807" href="Stlc.html#12807" class="Bound"
      >y</a
      ><a name="12808"
      > </a
      ><a name="12809" href="Stlc.html#12809" class="Bound"
      >A</a
      ><a name="12810"
      > </a
      ><a name="12811" href="Stlc.html#12811" class="Bound"
      >t</a
      ><a name="12812" class="Symbol"
      >)</a
      ><a name="12813"
      > </a
      ><a name="12814" class="Keyword"
      >with</a
      ><a name="12818"
      > </a
      ><a name="12819" href="Stlc.html#12793" class="Bound"
      >x</a
      ><a name="12820"
      > </a
      ><a name="12821" href="Stlc.html#5821" class="Function Operator"
      >&#8799;</a
      ><a name="12822"
      > </a
      ><a name="12823" href="Stlc.html#12807" class="Bound"
      >y</a
      ><a name="12824"
      >
</a
      ><a name="12825" class="Symbol"
      >...</a
      ><a name="12828"
      > </a
      ><a name="12829" class="Symbol"
      >|</a
      ><a name="12830"
      > </a
      ><a name="12831" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="12834"
      > </a
      ><a name="12835" href="Stlc.html#12835" class="Bound"
      >x=y</a
      ><a name="12838"
      > </a
      ><a name="12839" class="Symbol"
      >=</a
      ><a name="12840"
      > </a
      ><a name="12841" href="Stlc.html#6150" class="InductiveConstructor"
      >abs</a
      ><a name="12844"
      > </a
      ><a name="12845" href="Stlc.html#12807" class="Bound"
      >y</a
      ><a name="12846"
      > </a
      ><a name="12847" href="Stlc.html#12809" class="Bound"
      >A</a
      ><a name="12848"
      > </a
      ><a name="12849" href="Stlc.html#12811" class="Bound"
      >t</a
      ><a name="12850"
      >
</a
      ><a name="12851" class="Symbol"
      >...</a
      ><a name="12854"
      > </a
      ><a name="12855" class="Symbol"
      >|</a
      ><a name="12856"
      > </a
      ><a name="12857" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="12859"
      >  </a
      ><a name="12861" href="Stlc.html#12861" class="Bound"
      >x&#8800;y</a
      ><a name="12864"
      > </a
      ><a name="12865" class="Symbol"
      >=</a
      ><a name="12866"
      > </a
      ><a name="12867" href="Stlc.html#6150" class="InductiveConstructor"
      >abs</a
      ><a name="12870"
      > </a
      ><a name="12871" href="Stlc.html#12807" class="Bound"
      >y</a
      ><a name="12872"
      > </a
      ><a name="12873" href="Stlc.html#12809" class="Bound"
      >A</a
      ><a name="12874"
      > </a
      ><a name="12875" class="Symbol"
      >(</a
      ><a name="12876" href="Stlc.html#12627" class="Function Operator"
      >[</a
      ><a name="12877"
      > </a
      ><a name="12878" href="Stlc.html#12793" class="Bound"
      >x</a
      ><a name="12879"
      > </a
      ><a name="12880" href="Stlc.html#12627" class="Function Operator"
      >:=</a
      ><a name="12882"
      > </a
      ><a name="12883" href="Stlc.html#12798" class="Bound"
      >v</a
      ><a name="12884"
      > </a
      ><a name="12885" href="Stlc.html#12627" class="Function Operator"
      >]</a
      ><a name="12886"
      > </a
      ><a name="12887" href="Stlc.html#12811" class="Bound"
      >t</a
      ><a name="12888" class="Symbol"
      >)</a
      ><a name="12889"
      >
</a
      ><a name="12890" href="Stlc.html#12627" class="Function Operator"
      >[</a
      ><a name="12891"
      > </a
      ><a name="12892" href="Stlc.html#12892" class="Bound"
      >x</a
      ><a name="12893"
      > </a
      ><a name="12894" href="Stlc.html#12627" class="Function Operator"
      >:=</a
      ><a name="12896"
      > </a
      ><a name="12897" href="Stlc.html#12897" class="Bound"
      >v</a
      ><a name="12898"
      > </a
      ><a name="12899" href="Stlc.html#12627" class="Function Operator"
      >]</a
      ><a name="12900"
      > </a
      ><a name="12901" href="Stlc.html#6184" class="InductiveConstructor"
      >true</a
      ><a name="12905"
      >  </a
      ><a name="12907" class="Symbol"
      >=</a
      ><a name="12908"
      > </a
      ><a name="12909" href="Stlc.html#6184" class="InductiveConstructor"
      >true</a
      ><a name="12913"
      >
</a
      ><a name="12914" href="Stlc.html#12627" class="Function Operator"
      >[</a
      ><a name="12915"
      > </a
      ><a name="12916" href="Stlc.html#12916" class="Bound"
      >x</a
      ><a name="12917"
      > </a
      ><a name="12918" href="Stlc.html#12627" class="Function Operator"
      >:=</a
      ><a name="12920"
      > </a
      ><a name="12921" href="Stlc.html#12921" class="Bound"
      >v</a
      ><a name="12922"
      > </a
      ><a name="12923" href="Stlc.html#12627" class="Function Operator"
      >]</a
      ><a name="12924"
      > </a
      ><a name="12925" href="Stlc.html#6199" class="InductiveConstructor"
      >false</a
      ><a name="12930"
      > </a
      ><a name="12931" class="Symbol"
      >=</a
      ><a name="12932"
      > </a
      ><a name="12933" href="Stlc.html#6199" class="InductiveConstructor"
      >false</a
      ><a name="12938"
      >
</a
      ><a name="12939" href="Stlc.html#12627" class="Function Operator"
      >[</a
      ><a name="12940"
      > </a
      ><a name="12941" href="Stlc.html#12941" class="Bound"
      >x</a
      ><a name="12942"
      > </a
      ><a name="12943" href="Stlc.html#12627" class="Function Operator"
      >:=</a
      ><a name="12945"
      > </a
      ><a name="12946" href="Stlc.html#12946" class="Bound"
      >v</a
      ><a name="12947"
      > </a
      ><a name="12948" href="Stlc.html#12627" class="Function Operator"
      >]</a
      ><a name="12949"
      > </a
      ><a name="12950" class="Symbol"
      >(</a
      ><a name="12951" href="Stlc.html#6214" class="InductiveConstructor Operator"
      >if</a
      ><a name="12953"
      > </a
      ><a name="12954" href="Stlc.html#12954" class="Bound"
      >s</a
      ><a name="12955"
      > </a
      ><a name="12956" href="Stlc.html#6214" class="InductiveConstructor Operator"
      >then</a
      ><a name="12960"
      > </a
      ><a name="12961" href="Stlc.html#12961" class="Bound"
      >t</a
      ><a name="12962"
      > </a
      ><a name="12963" href="Stlc.html#6214" class="InductiveConstructor Operator"
      >else</a
      ><a name="12967"
      > </a
      ><a name="12968" href="Stlc.html#12968" class="Bound"
      >u</a
      ><a name="12969" class="Symbol"
      >)</a
      ><a name="12970"
      > </a
      ><a name="12971" class="Symbol"
      >=</a
      ><a name="12972"
      >
  </a
      ><a name="12975" href="Stlc.html#6214" class="InductiveConstructor Operator"
      >if</a
      ><a name="12977"
      > </a
      ><a name="12978" href="Stlc.html#12627" class="Function Operator"
      >[</a
      ><a name="12979"
      > </a
      ><a name="12980" href="Stlc.html#12941" class="Bound"
      >x</a
      ><a name="12981"
      > </a
      ><a name="12982" href="Stlc.html#12627" class="Function Operator"
      >:=</a
      ><a name="12984"
      > </a
      ><a name="12985" href="Stlc.html#12946" class="Bound"
      >v</a
      ><a name="12986"
      > </a
      ><a name="12987" href="Stlc.html#12627" class="Function Operator"
      >]</a
      ><a name="12988"
      > </a
      ><a name="12989" href="Stlc.html#12954" class="Bound"
      >s</a
      ><a name="12990"
      > </a
      ><a name="12991" href="Stlc.html#6214" class="InductiveConstructor Operator"
      >then</a
      ><a name="12995"
      > </a
      ><a name="12996" href="Stlc.html#12627" class="Function Operator"
      >[</a
      ><a name="12997"
      > </a
      ><a name="12998" href="Stlc.html#12941" class="Bound"
      >x</a
      ><a name="12999"
      > </a
      ><a name="13000" href="Stlc.html#12627" class="Function Operator"
      >:=</a
      ><a name="13002"
      > </a
      ><a name="13003" href="Stlc.html#12946" class="Bound"
      >v</a
      ><a name="13004"
      > </a
      ><a name="13005" href="Stlc.html#12627" class="Function Operator"
      >]</a
      ><a name="13006"
      > </a
      ><a name="13007" href="Stlc.html#12961" class="Bound"
      >t</a
      ><a name="13008"
      > </a
      ><a name="13009" href="Stlc.html#6214" class="InductiveConstructor Operator"
      >else</a
      ><a name="13013"
      >  </a
      ><a name="13015" href="Stlc.html#12627" class="Function Operator"
      >[</a
      ><a name="13016"
      > </a
      ><a name="13017" href="Stlc.html#12941" class="Bound"
      >x</a
      ><a name="13018"
      > </a
      ><a name="13019" href="Stlc.html#12627" class="Function Operator"
      >:=</a
      ><a name="13021"
      > </a
      ><a name="13022" href="Stlc.html#12946" class="Bound"
      >v</a
      ><a name="13023"
      > </a
      ><a name="13024" href="Stlc.html#12627" class="Function Operator"
      >]</a
      ><a name="13025"
      > </a
      ><a name="13026" href="Stlc.html#12968" class="Bound"
      >u</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="13074" class="Keyword"
      >infix</a
      ><a name="13079"
      > </a
      ><a name="13080" class="Number"
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
<a name="14018" class="Keyword"
      >data</a
      ><a name="14022"
      > </a
      ><a name="14023" href="Stlc.html#14023" class="Datatype Operator"
      >[_:=_]_==&gt;_</a
      ><a name="14034"
      > </a
      ><a name="14035" class="Symbol"
      >(</a
      ><a name="14036" href="Stlc.html#14036" class="Bound"
      >x</a
      ><a name="14037"
      > </a
      ><a name="14038" class="Symbol"
      >:</a
      ><a name="14039"
      > </a
      ><a name="14040" href="Stlc.html#5746" class="Datatype"
      >Id</a
      ><a name="14042" class="Symbol"
      >)</a
      ><a name="14043"
      > </a
      ><a name="14044" class="Symbol"
      >(</a
      ><a name="14045" href="Stlc.html#14045" class="Bound"
      >s</a
      ><a name="14046"
      > </a
      ><a name="14047" class="Symbol"
      >:</a
      ><a name="14048"
      > </a
      ><a name="14049" href="Stlc.html#6082" class="Datatype"
      >Term</a
      ><a name="14053" class="Symbol"
      >)</a
      ><a name="14054"
      > </a
      ><a name="14055" class="Symbol"
      >:</a
      ><a name="14056"
      > </a
      ><a name="14057" href="Stlc.html#6082" class="Datatype"
      >Term</a
      ><a name="14061"
      > </a
      ><a name="14062" class="Symbol"
      >-&gt;</a
      ><a name="14064"
      > </a
      ><a name="14065" href="Stlc.html#6082" class="Datatype"
      >Term</a
      ><a name="14069"
      > </a
      ><a name="14070" class="Symbol"
      >-&gt;</a
      ><a name="14072"
      > </a
      ><a name="14073" class="PrimitiveType"
      >Set</a
      ><a name="14076"
      > </a
      ><a name="14077" class="Keyword"
      >where</a
      ><a name="14082"
      >
  </a
      ><a name="14085" href="Stlc.html#14085" class="InductiveConstructor"
      >var1</a
      ><a name="14089"
      > </a
      ><a name="14090" class="Symbol"
      >:</a
      ><a name="14091"
      > </a
      ><a name="14092" href="Stlc.html#14023" class="Datatype Operator"
      >[</a
      ><a name="14093"
      > </a
      ><a name="14094" href="Stlc.html#14036" class="Bound"
      >x</a
      ><a name="14095"
      > </a
      ><a name="14096" href="Stlc.html#14023" class="Datatype Operator"
      >:=</a
      ><a name="14098"
      > </a
      ><a name="14099" href="Stlc.html#14045" class="Bound"
      >s</a
      ><a name="14100"
      > </a
      ><a name="14101" href="Stlc.html#14023" class="Datatype Operator"
      >]</a
      ><a name="14102"
      > </a
      ><a name="14103" class="Symbol"
      >(</a
      ><a name="14104" href="Stlc.html#6101" class="InductiveConstructor"
      >var</a
      ><a name="14107"
      > </a
      ><a name="14108" href="Stlc.html#14036" class="Bound"
      >x</a
      ><a name="14109" class="Symbol"
      >)</a
      ><a name="14110"
      > </a
      ><a name="14111" href="Stlc.html#14023" class="Datatype Operator"
      >==&gt;</a
      ><a name="14114"
      > </a
      ><a name="14115" href="Stlc.html#14045" class="Bound"
      >s</a
      ><a name="14116"
      >
  </a
      ><a name="14119" class="Comment"
      >{- FILL IN HERE -}</a
      >
{% endraw %}</pre>

<pre class="Agda">{% raw %}
<a name="14163" class="Keyword"
      >postulate</a
      ><a name="14172"
      >
  </a
      ><a name="14175" href="Stlc.html#14175" class="Postulate"
      >subst-correct</a
      ><a name="14188"
      > </a
      ><a name="14189" class="Symbol"
      >:</a
      ><a name="14190"
      > </a
      ><a name="14191" class="Symbol"
      >&#8704;</a
      ><a name="14192"
      > </a
      ><a name="14193" href="Stlc.html#14193" class="Bound"
      >s</a
      ><a name="14194"
      > </a
      ><a name="14195" href="Stlc.html#14195" class="Bound"
      >x</a
      ><a name="14196"
      > </a
      ><a name="14197" href="Stlc.html#14197" class="Bound"
      >t</a
      ><a name="14198"
      > </a
      ><a name="14199" href="Stlc.html#14199" class="Bound"
      >t'</a
      ><a name="14201"
      >
                </a
      ><a name="14218" class="Symbol"
      >&#8594;</a
      ><a name="14219"
      > </a
      ><a name="14220" href="Stlc.html#12627" class="Function Operator"
      >[</a
      ><a name="14221"
      > </a
      ><a name="14222" href="Stlc.html#14195" class="Bound"
      >x</a
      ><a name="14223"
      > </a
      ><a name="14224" href="Stlc.html#12627" class="Function Operator"
      >:=</a
      ><a name="14226"
      > </a
      ><a name="14227" href="Stlc.html#14193" class="Bound"
      >s</a
      ><a name="14228"
      > </a
      ><a name="14229" href="Stlc.html#12627" class="Function Operator"
      >]</a
      ><a name="14230"
      > </a
      ><a name="14231" href="Stlc.html#14197" class="Bound"
      >t</a
      ><a name="14232"
      > </a
      ><a name="14233" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="14234"
      > </a
      ><a name="14235" href="Stlc.html#14199" class="Bound"
      >t'</a
      ><a name="14237"
      >
                </a
      ><a name="14254" class="Symbol"
      >&#8594;</a
      ><a name="14255"
      > </a
      ><a name="14256" href="Stlc.html#14023" class="Datatype Operator"
      >[</a
      ><a name="14257"
      > </a
      ><a name="14258" href="Stlc.html#14195" class="Bound"
      >x</a
      ><a name="14259"
      > </a
      ><a name="14260" href="Stlc.html#14023" class="Datatype Operator"
      >:=</a
      ><a name="14262"
      > </a
      ><a name="14263" href="Stlc.html#14193" class="Bound"
      >s</a
      ><a name="14264"
      > </a
      ><a name="14265" href="Stlc.html#14023" class="Datatype Operator"
      >]</a
      ><a name="14266"
      > </a
      ><a name="14267" href="Stlc.html#14197" class="Bound"
      >t</a
      ><a name="14268"
      > </a
      ><a name="14269" href="Stlc.html#14023" class="Datatype Operator"
      >==&gt;</a
      ><a name="14272"
      > </a
      ><a name="14273" href="Stlc.html#14199" class="Bound"
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
<a name="15539" class="Keyword"
      >data</a
      ><a name="15543"
      > </a
      ><a name="15544" href="Stlc.html#15544" class="Datatype Operator"
      >_==&gt;_</a
      ><a name="15549"
      > </a
      ><a name="15550" class="Symbol"
      >:</a
      ><a name="15551"
      > </a
      ><a name="15552" href="Stlc.html#6082" class="Datatype"
      >Term</a
      ><a name="15556"
      > </a
      ><a name="15557" class="Symbol"
      >&#8594;</a
      ><a name="15558"
      > </a
      ><a name="15559" href="Stlc.html#6082" class="Datatype"
      >Term</a
      ><a name="15563"
      > </a
      ><a name="15564" class="Symbol"
      >&#8594;</a
      ><a name="15565"
      > </a
      ><a name="15566" class="PrimitiveType"
      >Set</a
      ><a name="15569"
      > </a
      ><a name="15570" class="Keyword"
      >where</a
      ><a name="15575"
      >
  </a
      ><a name="15578" href="Stlc.html#15578" class="InductiveConstructor"
      >red</a
      ><a name="15581"
      >     </a
      ><a name="15586" class="Symbol"
      >:</a
      ><a name="15587"
      > </a
      ><a name="15588" class="Symbol"
      >&#8704;</a
      ><a name="15589"
      > </a
      ><a name="15590" class="Symbol"
      >{</a
      ><a name="15591" href="Stlc.html#15591" class="Bound"
      >x</a
      ><a name="15592"
      > </a
      ><a name="15593" href="Stlc.html#15593" class="Bound"
      >A</a
      ><a name="15594"
      > </a
      ><a name="15595" href="Stlc.html#15595" class="Bound"
      >s</a
      ><a name="15596"
      > </a
      ><a name="15597" href="Stlc.html#15597" class="Bound"
      >t</a
      ><a name="15598" class="Symbol"
      >}</a
      ><a name="15599"
      >
          </a
      ><a name="15610" class="Symbol"
      >&#8594;</a
      ><a name="15611"
      > </a
      ><a name="15612" href="Stlc.html#9407" class="Datatype"
      >Value</a
      ><a name="15617"
      > </a
      ><a name="15618" href="Stlc.html#15597" class="Bound"
      >t</a
      ><a name="15619"
      >
          </a
      ><a name="15630" class="Symbol"
      >&#8594;</a
      ><a name="15631"
      > </a
      ><a name="15632" href="Stlc.html#6121" class="InductiveConstructor"
      >app</a
      ><a name="15635"
      > </a
      ><a name="15636" class="Symbol"
      >(</a
      ><a name="15637" href="Stlc.html#6150" class="InductiveConstructor"
      >abs</a
      ><a name="15640"
      > </a
      ><a name="15641" href="Stlc.html#15591" class="Bound"
      >x</a
      ><a name="15642"
      > </a
      ><a name="15643" href="Stlc.html#15593" class="Bound"
      >A</a
      ><a name="15644"
      > </a
      ><a name="15645" href="Stlc.html#15595" class="Bound"
      >s</a
      ><a name="15646" class="Symbol"
      >)</a
      ><a name="15647"
      > </a
      ><a name="15648" href="Stlc.html#15597" class="Bound"
      >t</a
      ><a name="15649"
      > </a
      ><a name="15650" href="Stlc.html#15544" class="Datatype Operator"
      >==&gt;</a
      ><a name="15653"
      > </a
      ><a name="15654" href="Stlc.html#12627" class="Function Operator"
      >[</a
      ><a name="15655"
      > </a
      ><a name="15656" href="Stlc.html#15591" class="Bound"
      >x</a
      ><a name="15657"
      > </a
      ><a name="15658" href="Stlc.html#12627" class="Function Operator"
      >:=</a
      ><a name="15660"
      > </a
      ><a name="15661" href="Stlc.html#15597" class="Bound"
      >t</a
      ><a name="15662"
      > </a
      ><a name="15663" href="Stlc.html#12627" class="Function Operator"
      >]</a
      ><a name="15664"
      > </a
      ><a name="15665" href="Stlc.html#15595" class="Bound"
      >s</a
      ><a name="15666"
      >
  </a
      ><a name="15669" href="Stlc.html#15669" class="InductiveConstructor"
      >app1</a
      ><a name="15673"
      >    </a
      ><a name="15677" class="Symbol"
      >:</a
      ><a name="15678"
      > </a
      ><a name="15679" class="Symbol"
      >&#8704;</a
      ><a name="15680"
      > </a
      ><a name="15681" class="Symbol"
      >{</a
      ><a name="15682" href="Stlc.html#15682" class="Bound"
      >s</a
      ><a name="15683"
      > </a
      ><a name="15684" href="Stlc.html#15684" class="Bound"
      >s'</a
      ><a name="15686"
      > </a
      ><a name="15687" href="Stlc.html#15687" class="Bound"
      >t</a
      ><a name="15688" class="Symbol"
      >}</a
      ><a name="15689"
      >
          </a
      ><a name="15700" class="Symbol"
      >&#8594;</a
      ><a name="15701"
      > </a
      ><a name="15702" href="Stlc.html#15682" class="Bound"
      >s</a
      ><a name="15703"
      > </a
      ><a name="15704" href="Stlc.html#15544" class="Datatype Operator"
      >==&gt;</a
      ><a name="15707"
      > </a
      ><a name="15708" href="Stlc.html#15684" class="Bound"
      >s'</a
      ><a name="15710"
      >
          </a
      ><a name="15721" class="Symbol"
      >&#8594;</a
      ><a name="15722"
      > </a
      ><a name="15723" href="Stlc.html#6121" class="InductiveConstructor"
      >app</a
      ><a name="15726"
      > </a
      ><a name="15727" href="Stlc.html#15682" class="Bound"
      >s</a
      ><a name="15728"
      > </a
      ><a name="15729" href="Stlc.html#15687" class="Bound"
      >t</a
      ><a name="15730"
      > </a
      ><a name="15731" href="Stlc.html#15544" class="Datatype Operator"
      >==&gt;</a
      ><a name="15734"
      > </a
      ><a name="15735" href="Stlc.html#6121" class="InductiveConstructor"
      >app</a
      ><a name="15738"
      > </a
      ><a name="15739" href="Stlc.html#15684" class="Bound"
      >s'</a
      ><a name="15741"
      > </a
      ><a name="15742" href="Stlc.html#15687" class="Bound"
      >t</a
      ><a name="15743"
      >
  </a
      ><a name="15746" href="Stlc.html#15746" class="InductiveConstructor"
      >app2</a
      ><a name="15750"
      >    </a
      ><a name="15754" class="Symbol"
      >:</a
      ><a name="15755"
      > </a
      ><a name="15756" class="Symbol"
      >&#8704;</a
      ><a name="15757"
      > </a
      ><a name="15758" class="Symbol"
      >{</a
      ><a name="15759" href="Stlc.html#15759" class="Bound"
      >s</a
      ><a name="15760"
      > </a
      ><a name="15761" href="Stlc.html#15761" class="Bound"
      >t</a
      ><a name="15762"
      > </a
      ><a name="15763" href="Stlc.html#15763" class="Bound"
      >t'</a
      ><a name="15765" class="Symbol"
      >}</a
      ><a name="15766"
      >
          </a
      ><a name="15777" class="Symbol"
      >&#8594;</a
      ><a name="15778"
      > </a
      ><a name="15779" href="Stlc.html#9407" class="Datatype"
      >Value</a
      ><a name="15784"
      > </a
      ><a name="15785" href="Stlc.html#15759" class="Bound"
      >s</a
      ><a name="15786"
      >
          </a
      ><a name="15797" class="Symbol"
      >&#8594;</a
      ><a name="15798"
      > </a
      ><a name="15799" href="Stlc.html#15761" class="Bound"
      >t</a
      ><a name="15800"
      > </a
      ><a name="15801" href="Stlc.html#15544" class="Datatype Operator"
      >==&gt;</a
      ><a name="15804"
      > </a
      ><a name="15805" href="Stlc.html#15763" class="Bound"
      >t'</a
      ><a name="15807"
      >
          </a
      ><a name="15818" class="Symbol"
      >&#8594;</a
      ><a name="15819"
      > </a
      ><a name="15820" href="Stlc.html#6121" class="InductiveConstructor"
      >app</a
      ><a name="15823"
      > </a
      ><a name="15824" href="Stlc.html#15759" class="Bound"
      >s</a
      ><a name="15825"
      > </a
      ><a name="15826" href="Stlc.html#15761" class="Bound"
      >t</a
      ><a name="15827"
      > </a
      ><a name="15828" href="Stlc.html#15544" class="Datatype Operator"
      >==&gt;</a
      ><a name="15831"
      > </a
      ><a name="15832" href="Stlc.html#6121" class="InductiveConstructor"
      >app</a
      ><a name="15835"
      > </a
      ><a name="15836" href="Stlc.html#15759" class="Bound"
      >s</a
      ><a name="15837"
      > </a
      ><a name="15838" href="Stlc.html#15763" class="Bound"
      >t'</a
      ><a name="15840"
      >
  </a
      ><a name="15843" href="Stlc.html#15843" class="InductiveConstructor"
      >if</a
      ><a name="15845"
      >      </a
      ><a name="15851" class="Symbol"
      >:</a
      ><a name="15852"
      > </a
      ><a name="15853" class="Symbol"
      >&#8704;</a
      ><a name="15854"
      > </a
      ><a name="15855" class="Symbol"
      >{</a
      ><a name="15856" href="Stlc.html#15856" class="Bound"
      >s</a
      ><a name="15857"
      > </a
      ><a name="15858" href="Stlc.html#15858" class="Bound"
      >s'</a
      ><a name="15860"
      > </a
      ><a name="15861" href="Stlc.html#15861" class="Bound"
      >t</a
      ><a name="15862"
      > </a
      ><a name="15863" href="Stlc.html#15863" class="Bound"
      >u</a
      ><a name="15864" class="Symbol"
      >}</a
      ><a name="15865"
      >
          </a
      ><a name="15876" class="Symbol"
      >&#8594;</a
      ><a name="15877"
      > </a
      ><a name="15878" href="Stlc.html#15856" class="Bound"
      >s</a
      ><a name="15879"
      > </a
      ><a name="15880" href="Stlc.html#15544" class="Datatype Operator"
      >==&gt;</a
      ><a name="15883"
      > </a
      ><a name="15884" href="Stlc.html#15858" class="Bound"
      >s'</a
      ><a name="15886"
      >
          </a
      ><a name="15897" class="Symbol"
      >&#8594;</a
      ><a name="15898"
      > </a
      ><a name="15899" href="Stlc.html#6214" class="InductiveConstructor Operator"
      >if</a
      ><a name="15901"
      > </a
      ><a name="15902" href="Stlc.html#15856" class="Bound"
      >s</a
      ><a name="15903"
      > </a
      ><a name="15904" href="Stlc.html#6214" class="InductiveConstructor Operator"
      >then</a
      ><a name="15908"
      > </a
      ><a name="15909" href="Stlc.html#15861" class="Bound"
      >t</a
      ><a name="15910"
      > </a
      ><a name="15911" href="Stlc.html#6214" class="InductiveConstructor Operator"
      >else</a
      ><a name="15915"
      > </a
      ><a name="15916" href="Stlc.html#15863" class="Bound"
      >u</a
      ><a name="15917"
      > </a
      ><a name="15918" href="Stlc.html#15544" class="Datatype Operator"
      >==&gt;</a
      ><a name="15921"
      > </a
      ><a name="15922" href="Stlc.html#6214" class="InductiveConstructor Operator"
      >if</a
      ><a name="15924"
      > </a
      ><a name="15925" href="Stlc.html#15858" class="Bound"
      >s'</a
      ><a name="15927"
      > </a
      ><a name="15928" href="Stlc.html#6214" class="InductiveConstructor Operator"
      >then</a
      ><a name="15932"
      > </a
      ><a name="15933" href="Stlc.html#15861" class="Bound"
      >t</a
      ><a name="15934"
      > </a
      ><a name="15935" href="Stlc.html#6214" class="InductiveConstructor Operator"
      >else</a
      ><a name="15939"
      > </a
      ><a name="15940" href="Stlc.html#15863" class="Bound"
      >u</a
      ><a name="15941"
      >
  </a
      ><a name="15944" href="Stlc.html#15944" class="InductiveConstructor"
      >iftrue</a
      ><a name="15950"
      >  </a
      ><a name="15952" class="Symbol"
      >:</a
      ><a name="15953"
      > </a
      ><a name="15954" class="Symbol"
      >&#8704;</a
      ><a name="15955"
      > </a
      ><a name="15956" class="Symbol"
      >{</a
      ><a name="15957" href="Stlc.html#15957" class="Bound"
      >s</a
      ><a name="15958"
      > </a
      ><a name="15959" href="Stlc.html#15959" class="Bound"
      >t</a
      ><a name="15960" class="Symbol"
      >}</a
      ><a name="15961"
      >
          </a
      ><a name="15972" class="Symbol"
      >&#8594;</a
      ><a name="15973"
      > </a
      ><a name="15974" href="Stlc.html#6214" class="InductiveConstructor Operator"
      >if</a
      ><a name="15976"
      > </a
      ><a name="15977" href="Stlc.html#6184" class="InductiveConstructor"
      >true</a
      ><a name="15981"
      > </a
      ><a name="15982" href="Stlc.html#6214" class="InductiveConstructor Operator"
      >then</a
      ><a name="15986"
      > </a
      ><a name="15987" href="Stlc.html#15957" class="Bound"
      >s</a
      ><a name="15988"
      > </a
      ><a name="15989" href="Stlc.html#6214" class="InductiveConstructor Operator"
      >else</a
      ><a name="15993"
      > </a
      ><a name="15994" href="Stlc.html#15959" class="Bound"
      >t</a
      ><a name="15995"
      > </a
      ><a name="15996" href="Stlc.html#15544" class="Datatype Operator"
      >==&gt;</a
      ><a name="15999"
      > </a
      ><a name="16000" href="Stlc.html#15957" class="Bound"
      >s</a
      ><a name="16001"
      >
  </a
      ><a name="16004" href="Stlc.html#16004" class="InductiveConstructor"
      >iffalse</a
      ><a name="16011"
      > </a
      ><a name="16012" class="Symbol"
      >:</a
      ><a name="16013"
      > </a
      ><a name="16014" class="Symbol"
      >&#8704;</a
      ><a name="16015"
      > </a
      ><a name="16016" class="Symbol"
      >{</a
      ><a name="16017" href="Stlc.html#16017" class="Bound"
      >s</a
      ><a name="16018"
      > </a
      ><a name="16019" href="Stlc.html#16019" class="Bound"
      >t</a
      ><a name="16020" class="Symbol"
      >}</a
      ><a name="16021"
      >
          </a
      ><a name="16032" class="Symbol"
      >&#8594;</a
      ><a name="16033"
      > </a
      ><a name="16034" href="Stlc.html#6214" class="InductiveConstructor Operator"
      >if</a
      ><a name="16036"
      > </a
      ><a name="16037" href="Stlc.html#6199" class="InductiveConstructor"
      >false</a
      ><a name="16042"
      > </a
      ><a name="16043" href="Stlc.html#6214" class="InductiveConstructor Operator"
      >then</a
      ><a name="16047"
      > </a
      ><a name="16048" href="Stlc.html#16017" class="Bound"
      >s</a
      ><a name="16049"
      > </a
      ><a name="16050" href="Stlc.html#6214" class="InductiveConstructor Operator"
      >else</a
      ><a name="16054"
      > </a
      ><a name="16055" href="Stlc.html#16019" class="Bound"
      >t</a
      ><a name="16056"
      > </a
      ><a name="16057" href="Stlc.html#15544" class="Datatype Operator"
      >==&gt;</a
      ><a name="16060"
      > </a
      ><a name="16061" href="Stlc.html#16019" class="Bound"
      >t</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="16109" class="Keyword"
      >infix</a
      ><a name="16114"
      > </a
      ><a name="16115" class="Number"
      >1</a
      >
{% endraw %}</pre>
</div>

<pre class="Agda">{% raw %}
<a name="16155" class="Keyword"
      >data</a
      ><a name="16159"
      > </a
      ><a name="16160" href="Stlc.html#16160" class="Datatype"
      >Multi</a
      ><a name="16165"
      > </a
      ><a name="16166" class="Symbol"
      >(</a
      ><a name="16167" href="Stlc.html#16167" class="Bound"
      >R</a
      ><a name="16168"
      > </a
      ><a name="16169" class="Symbol"
      >:</a
      ><a name="16170"
      > </a
      ><a name="16171" href="Stlc.html#6082" class="Datatype"
      >Term</a
      ><a name="16175"
      > </a
      ><a name="16176" class="Symbol"
      >&#8594;</a
      ><a name="16177"
      > </a
      ><a name="16178" href="Stlc.html#6082" class="Datatype"
      >Term</a
      ><a name="16182"
      > </a
      ><a name="16183" class="Symbol"
      >&#8594;</a
      ><a name="16184"
      > </a
      ><a name="16185" class="PrimitiveType"
      >Set</a
      ><a name="16188" class="Symbol"
      >)</a
      ><a name="16189"
      > </a
      ><a name="16190" class="Symbol"
      >:</a
      ><a name="16191"
      > </a
      ><a name="16192" href="Stlc.html#6082" class="Datatype"
      >Term</a
      ><a name="16196"
      > </a
      ><a name="16197" class="Symbol"
      >&#8594;</a
      ><a name="16198"
      > </a
      ><a name="16199" href="Stlc.html#6082" class="Datatype"
      >Term</a
      ><a name="16203"
      > </a
      ><a name="16204" class="Symbol"
      >&#8594;</a
      ><a name="16205"
      > </a
      ><a name="16206" class="PrimitiveType"
      >Set</a
      ><a name="16209"
      > </a
      ><a name="16210" class="Keyword"
      >where</a
      ><a name="16215"
      >
  </a
      ><a name="16218" href="Stlc.html#16218" class="InductiveConstructor"
      >refl</a
      ><a name="16222"
      > </a
      ><a name="16223" class="Symbol"
      >:</a
      ><a name="16224"
      > </a
      ><a name="16225" class="Symbol"
      >&#8704;</a
      ><a name="16226"
      > </a
      ><a name="16227" class="Symbol"
      >{</a
      ><a name="16228" href="Stlc.html#16228" class="Bound"
      >x</a
      ><a name="16229" class="Symbol"
      >}</a
      ><a name="16230"
      > </a
      ><a name="16231" class="Symbol"
      >-&gt;</a
      ><a name="16233"
      > </a
      ><a name="16234" href="Stlc.html#16160" class="Datatype"
      >Multi</a
      ><a name="16239"
      > </a
      ><a name="16240" href="Stlc.html#16167" class="Bound"
      >R</a
      ><a name="16241"
      > </a
      ><a name="16242" href="Stlc.html#16228" class="Bound"
      >x</a
      ><a name="16243"
      > </a
      ><a name="16244" href="Stlc.html#16228" class="Bound"
      >x</a
      ><a name="16245"
      >
  </a
      ><a name="16248" href="Stlc.html#16248" class="InductiveConstructor"
      >step</a
      ><a name="16252"
      > </a
      ><a name="16253" class="Symbol"
      >:</a
      ><a name="16254"
      > </a
      ><a name="16255" class="Symbol"
      >&#8704;</a
      ><a name="16256"
      > </a
      ><a name="16257" class="Symbol"
      >{</a
      ><a name="16258" href="Stlc.html#16258" class="Bound"
      >x</a
      ><a name="16259"
      > </a
      ><a name="16260" href="Stlc.html#16260" class="Bound"
      >y</a
      ><a name="16261"
      > </a
      ><a name="16262" href="Stlc.html#16262" class="Bound"
      >z</a
      ><a name="16263" class="Symbol"
      >}</a
      ><a name="16264"
      > </a
      ><a name="16265" class="Symbol"
      >-&gt;</a
      ><a name="16267"
      > </a
      ><a name="16268" href="Stlc.html#16167" class="Bound"
      >R</a
      ><a name="16269"
      > </a
      ><a name="16270" href="Stlc.html#16258" class="Bound"
      >x</a
      ><a name="16271"
      > </a
      ><a name="16272" href="Stlc.html#16260" class="Bound"
      >y</a
      ><a name="16273"
      > </a
      ><a name="16274" class="Symbol"
      >-&gt;</a
      ><a name="16276"
      > </a
      ><a name="16277" href="Stlc.html#16160" class="Datatype"
      >Multi</a
      ><a name="16282"
      > </a
      ><a name="16283" href="Stlc.html#16167" class="Bound"
      >R</a
      ><a name="16284"
      > </a
      ><a name="16285" href="Stlc.html#16260" class="Bound"
      >y</a
      ><a name="16286"
      > </a
      ><a name="16287" href="Stlc.html#16262" class="Bound"
      >z</a
      ><a name="16288"
      > </a
      ><a name="16289" class="Symbol"
      >-&gt;</a
      ><a name="16291"
      > </a
      ><a name="16292" href="Stlc.html#16160" class="Datatype"
      >Multi</a
      ><a name="16297"
      > </a
      ><a name="16298" href="Stlc.html#16167" class="Bound"
      >R</a
      ><a name="16299"
      > </a
      ><a name="16300" href="Stlc.html#16258" class="Bound"
      >x</a
      ><a name="16301"
      > </a
      ><a name="16302" href="Stlc.html#16262" class="Bound"
      >z</a
      >
{% endraw %}</pre>

<pre class="Agda">{% raw %}
<a name="16329" href="Stlc.html#16329" class="Function Operator"
      >_==&gt;*_</a
      ><a name="16335"
      > </a
      ><a name="16336" class="Symbol"
      >:</a
      ><a name="16337"
      > </a
      ><a name="16338" href="Stlc.html#6082" class="Datatype"
      >Term</a
      ><a name="16342"
      > </a
      ><a name="16343" class="Symbol"
      >&#8594;</a
      ><a name="16344"
      > </a
      ><a name="16345" href="Stlc.html#6082" class="Datatype"
      >Term</a
      ><a name="16349"
      > </a
      ><a name="16350" class="Symbol"
      >&#8594;</a
      ><a name="16351"
      > </a
      ><a name="16352" class="PrimitiveType"
      >Set</a
      ><a name="16355"
      >
</a
      ><a name="16356" href="Stlc.html#16329" class="Function Operator"
      >_==&gt;*_</a
      ><a name="16362"
      > </a
      ><a name="16363" class="Symbol"
      >=</a
      ><a name="16364"
      > </a
      ><a name="16365" href="Stlc.html#16160" class="Datatype"
      >Multi</a
      ><a name="16370"
      > </a
      ><a name="16371" href="Stlc.html#15544" class="Datatype Operator"
      >_==&gt;_</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="16423" class="Symbol"
      >{-#</a
      ><a name="16426"
      > </a
      ><a name="16427" class="Keyword"
      >DISPLAY</a
      ><a name="16434"
      > </a
      ><a name="16435" href="Stlc.html#16160" class="Datatype"
      >Multi</a
      ><a name="16440"
      > </a
      ><a name="16441" href="Stlc.html#16441" class="Bound Operator"
      >_==&gt;_</a
      ><a name="16446"
      > = </a
      ><a name="16449" href="Stlc.html#16329" class="Function Operator"
      >_==&gt;*_</a
      ><a name="16455"
      > </a
      ><a name="16456" class="Symbol"
      >#-}</a
      >
{% endraw %}</pre>
</div>

### Examples

Example:

$$((\lambda x:bool\rightarrow bool. x) (\lambda x:bool. x)) \Longrightarrow^* (\lambda x:bool. x)$$.

<pre class="Agda">{% raw %}
<a name="16618" href="Stlc.html#16618" class="Function"
      >step-example1</a
      ><a name="16631"
      > </a
      ><a name="16632" class="Symbol"
      >:</a
      ><a name="16633"
      > </a
      ><a name="16634" class="Symbol"
      >(</a
      ><a name="16635" href="Stlc.html#6121" class="InductiveConstructor"
      >app</a
      ><a name="16638"
      > </a
      ><a name="16639" href="Stlc.html#7018" class="Function"
      >idBB</a
      ><a name="16643"
      > </a
      ><a name="16644" href="Stlc.html#6912" class="Function"
      >idB</a
      ><a name="16647" class="Symbol"
      >)</a
      ><a name="16648"
      > </a
      ><a name="16649" href="Stlc.html#16329" class="Function Operator"
      >==&gt;*</a
      ><a name="16653"
      > </a
      ><a name="16654" href="Stlc.html#6912" class="Function"
      >idB</a
      ><a name="16657"
      >
</a
      ><a name="16658" href="Stlc.html#16618" class="Function"
      >step-example1</a
      ><a name="16671"
      > </a
      ><a name="16672" class="Symbol"
      >=</a
      ><a name="16673"
      > </a
      ><a name="16674" href="Stlc.html#16248" class="InductiveConstructor"
      >step</a
      ><a name="16678"
      > </a
      ><a name="16679" class="Symbol"
      >(</a
      ><a name="16680" href="Stlc.html#15578" class="InductiveConstructor"
      >red</a
      ><a name="16683"
      > </a
      ><a name="16684" href="Stlc.html#9434" class="InductiveConstructor"
      >abs</a
      ><a name="16687" class="Symbol"
      >)</a
      ><a name="16688"
      >
              </a
      ><a name="16703" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="16704"
      > </a
      ><a name="16705" href="Stlc.html#16218" class="InductiveConstructor"
      >refl</a
      >
{% endraw %}</pre>

Example:

$$(\lambda x:bool\rightarrow bool. x) \;((\lambda x:bool\rightarrow bool. x)\;(\lambda x:bool. x))) \Longrightarrow^* (\lambda x:bool. x)$$.

<pre class="Agda">{% raw %}
<a name="16887" href="Stlc.html#16887" class="Function"
      >step-example2</a
      ><a name="16900"
      > </a
      ><a name="16901" class="Symbol"
      >:</a
      ><a name="16902"
      > </a
      ><a name="16903" class="Symbol"
      >(</a
      ><a name="16904" href="Stlc.html#6121" class="InductiveConstructor"
      >app</a
      ><a name="16907"
      > </a
      ><a name="16908" href="Stlc.html#7018" class="Function"
      >idBB</a
      ><a name="16912"
      > </a
      ><a name="16913" class="Symbol"
      >(</a
      ><a name="16914" href="Stlc.html#6121" class="InductiveConstructor"
      >app</a
      ><a name="16917"
      > </a
      ><a name="16918" href="Stlc.html#7018" class="Function"
      >idBB</a
      ><a name="16922"
      > </a
      ><a name="16923" href="Stlc.html#6912" class="Function"
      >idB</a
      ><a name="16926" class="Symbol"
      >))</a
      ><a name="16928"
      > </a
      ><a name="16929" href="Stlc.html#16329" class="Function Operator"
      >==&gt;*</a
      ><a name="16933"
      > </a
      ><a name="16934" href="Stlc.html#6912" class="Function"
      >idB</a
      ><a name="16937"
      >
</a
      ><a name="16938" href="Stlc.html#16887" class="Function"
      >step-example2</a
      ><a name="16951"
      > </a
      ><a name="16952" class="Symbol"
      >=</a
      ><a name="16953"
      > </a
      ><a name="16954" href="Stlc.html#16248" class="InductiveConstructor"
      >step</a
      ><a name="16958"
      > </a
      ><a name="16959" class="Symbol"
      >(</a
      ><a name="16960" href="Stlc.html#15746" class="InductiveConstructor"
      >app2</a
      ><a name="16964"
      > </a
      ><a name="16965" href="Stlc.html#9434" class="InductiveConstructor"
      >abs</a
      ><a name="16968"
      > </a
      ><a name="16969" class="Symbol"
      >(</a
      ><a name="16970" href="Stlc.html#15578" class="InductiveConstructor"
      >red</a
      ><a name="16973"
      > </a
      ><a name="16974" href="Stlc.html#9434" class="InductiveConstructor"
      >abs</a
      ><a name="16977" class="Symbol"
      >))</a
      ><a name="16979"
      >
              </a
      ><a name="16994" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="16995"
      > </a
      ><a name="16996" href="Stlc.html#16248" class="InductiveConstructor"
      >step</a
      ><a name="17000"
      > </a
      ><a name="17001" class="Symbol"
      >(</a
      ><a name="17002" href="Stlc.html#15578" class="InductiveConstructor"
      >red</a
      ><a name="17005"
      > </a
      ><a name="17006" href="Stlc.html#9434" class="InductiveConstructor"
      >abs</a
      ><a name="17009" class="Symbol"
      >)</a
      ><a name="17010"
      >
              </a
      ><a name="17025" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="17026"
      > </a
      ><a name="17027" href="Stlc.html#16218" class="InductiveConstructor"
      >refl</a
      >
{% endraw %}</pre>

Example:

$$((\lambda x:bool\rightarrow bool. x)\;(\lambda x:bool. \text{if }x\text{ then }false\text{ else }true))\;true\Longrightarrow^* false$$.

<pre class="Agda">{% raw %}
<a name="17206" href="Stlc.html#17206" class="Function"
      >step-example3</a
      ><a name="17219"
      > </a
      ><a name="17220" class="Symbol"
      >:</a
      ><a name="17221"
      > </a
      ><a name="17222" class="Symbol"
      >(</a
      ><a name="17223" href="Stlc.html#6121" class="InductiveConstructor"
      >app</a
      ><a name="17226"
      > </a
      ><a name="17227" class="Symbol"
      >(</a
      ><a name="17228" href="Stlc.html#6121" class="InductiveConstructor"
      >app</a
      ><a name="17231"
      > </a
      ><a name="17232" href="Stlc.html#7018" class="Function"
      >idBB</a
      ><a name="17236"
      > </a
      ><a name="17237" href="Stlc.html#7451" class="Function"
      >notB</a
      ><a name="17241" class="Symbol"
      >)</a
      ><a name="17242"
      > </a
      ><a name="17243" href="Stlc.html#6184" class="InductiveConstructor"
      >true</a
      ><a name="17247" class="Symbol"
      >)</a
      ><a name="17248"
      > </a
      ><a name="17249" href="Stlc.html#16329" class="Function Operator"
      >==&gt;*</a
      ><a name="17253"
      > </a
      ><a name="17254" href="Stlc.html#6199" class="InductiveConstructor"
      >false</a
      ><a name="17259"
      >
</a
      ><a name="17260" href="Stlc.html#17206" class="Function"
      >step-example3</a
      ><a name="17273"
      > </a
      ><a name="17274" class="Symbol"
      >=</a
      ><a name="17275"
      > </a
      ><a name="17276" href="Stlc.html#16248" class="InductiveConstructor"
      >step</a
      ><a name="17280"
      > </a
      ><a name="17281" class="Symbol"
      >(</a
      ><a name="17282" href="Stlc.html#15669" class="InductiveConstructor"
      >app1</a
      ><a name="17286"
      > </a
      ><a name="17287" class="Symbol"
      >(</a
      ><a name="17288" href="Stlc.html#15578" class="InductiveConstructor"
      >red</a
      ><a name="17291"
      > </a
      ><a name="17292" href="Stlc.html#9434" class="InductiveConstructor"
      >abs</a
      ><a name="17295" class="Symbol"
      >))</a
      ><a name="17297"
      >
              </a
      ><a name="17312" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="17313"
      > </a
      ><a name="17314" href="Stlc.html#16248" class="InductiveConstructor"
      >step</a
      ><a name="17318"
      > </a
      ><a name="17319" class="Symbol"
      >(</a
      ><a name="17320" href="Stlc.html#15578" class="InductiveConstructor"
      >red</a
      ><a name="17323"
      > </a
      ><a name="17324" href="Stlc.html#9482" class="InductiveConstructor"
      >true</a
      ><a name="17328" class="Symbol"
      >)</a
      ><a name="17329"
      >
              </a
      ><a name="17344" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="17345"
      > </a
      ><a name="17346" href="Stlc.html#16248" class="InductiveConstructor"
      >step</a
      ><a name="17350"
      > </a
      ><a name="17351" href="Stlc.html#15944" class="InductiveConstructor"
      >iftrue</a
      ><a name="17357"
      >
              </a
      ><a name="17372" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="17373"
      > </a
      ><a name="17374" href="Stlc.html#16218" class="InductiveConstructor"
      >refl</a
      >
{% endraw %}</pre>

Example:

$$((\lambda x:bool\rightarrow bool. x)\;((\lambda x:bool. \text{if }x\text{ then }false\text{ else }true)\;true))\Longrightarrow^* false$$.

<pre class="Agda">{% raw %}
<a name="17555" href="Stlc.html#17555" class="Function"
      >step-example4</a
      ><a name="17568"
      > </a
      ><a name="17569" class="Symbol"
      >:</a
      ><a name="17570"
      > </a
      ><a name="17571" class="Symbol"
      >(</a
      ><a name="17572" href="Stlc.html#6121" class="InductiveConstructor"
      >app</a
      ><a name="17575"
      > </a
      ><a name="17576" href="Stlc.html#7018" class="Function"
      >idBB</a
      ><a name="17580"
      > </a
      ><a name="17581" class="Symbol"
      >(</a
      ><a name="17582" href="Stlc.html#6121" class="InductiveConstructor"
      >app</a
      ><a name="17585"
      > </a
      ><a name="17586" href="Stlc.html#7451" class="Function"
      >notB</a
      ><a name="17590"
      > </a
      ><a name="17591" href="Stlc.html#6184" class="InductiveConstructor"
      >true</a
      ><a name="17595" class="Symbol"
      >))</a
      ><a name="17597"
      > </a
      ><a name="17598" href="Stlc.html#16329" class="Function Operator"
      >==&gt;*</a
      ><a name="17602"
      > </a
      ><a name="17603" href="Stlc.html#6199" class="InductiveConstructor"
      >false</a
      ><a name="17608"
      >
</a
      ><a name="17609" href="Stlc.html#17555" class="Function"
      >step-example4</a
      ><a name="17622"
      > </a
      ><a name="17623" class="Symbol"
      >=</a
      ><a name="17624"
      > </a
      ><a name="17625" href="Stlc.html#16248" class="InductiveConstructor"
      >step</a
      ><a name="17629"
      > </a
      ><a name="17630" class="Symbol"
      >(</a
      ><a name="17631" href="Stlc.html#15746" class="InductiveConstructor"
      >app2</a
      ><a name="17635"
      > </a
      ><a name="17636" href="Stlc.html#9434" class="InductiveConstructor"
      >abs</a
      ><a name="17639"
      > </a
      ><a name="17640" class="Symbol"
      >(</a
      ><a name="17641" href="Stlc.html#15578" class="InductiveConstructor"
      >red</a
      ><a name="17644"
      > </a
      ><a name="17645" href="Stlc.html#9482" class="InductiveConstructor"
      >true</a
      ><a name="17649" class="Symbol"
      >))</a
      ><a name="17651"
      >
              </a
      ><a name="17666" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="17667"
      > </a
      ><a name="17668" href="Stlc.html#16248" class="InductiveConstructor"
      >step</a
      ><a name="17672"
      > </a
      ><a name="17673" class="Symbol"
      >(</a
      ><a name="17674" href="Stlc.html#15746" class="InductiveConstructor"
      >app2</a
      ><a name="17678"
      > </a
      ><a name="17679" href="Stlc.html#9434" class="InductiveConstructor"
      >abs</a
      ><a name="17682"
      > </a
      ><a name="17683" href="Stlc.html#15944" class="InductiveConstructor"
      >iftrue</a
      ><a name="17689" class="Symbol"
      >)</a
      ><a name="17690"
      >
              </a
      ><a name="17705" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="17706"
      > </a
      ><a name="17707" href="Stlc.html#16248" class="InductiveConstructor"
      >step</a
      ><a name="17711"
      > </a
      ><a name="17712" class="Symbol"
      >(</a
      ><a name="17713" href="Stlc.html#15578" class="InductiveConstructor"
      >red</a
      ><a name="17716"
      > </a
      ><a name="17717" href="Stlc.html#9503" class="InductiveConstructor"
      >false</a
      ><a name="17722" class="Symbol"
      >)</a
      ><a name="17723"
      >
              </a
      ><a name="17738" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="17739"
      > </a
      ><a name="17740" href="Stlc.html#16218" class="InductiveConstructor"
      >refl</a
      >
{% endraw %}</pre>

#### Exercise: 2 stars (step-example5)

<pre class="Agda">{% raw %}
<a name="17810" class="Keyword"
      >postulate</a
      ><a name="17819"
      >
  </a
      ><a name="17822" href="Stlc.html#17822" class="Postulate"
      >step-example5</a
      ><a name="17835"
      > </a
      ><a name="17836" class="Symbol"
      >:</a
      ><a name="17837"
      > </a
      ><a name="17838" class="Symbol"
      >(</a
      ><a name="17839" href="Stlc.html#6121" class="InductiveConstructor"
      >app</a
      ><a name="17842"
      > </a
      ><a name="17843" class="Symbol"
      >(</a
      ><a name="17844" href="Stlc.html#6121" class="InductiveConstructor"
      >app</a
      ><a name="17847"
      > </a
      ><a name="17848" href="Stlc.html#7172" class="Function"
      >idBBBB</a
      ><a name="17854"
      > </a
      ><a name="17855" href="Stlc.html#7018" class="Function"
      >idBB</a
      ><a name="17859" class="Symbol"
      >)</a
      ><a name="17860"
      > </a
      ><a name="17861" href="Stlc.html#6912" class="Function"
      >idB</a
      ><a name="17864" class="Symbol"
      >)</a
      ><a name="17865"
      > </a
      ><a name="17866" href="Stlc.html#16329" class="Function Operator"
      >==&gt;*</a
      ><a name="17870"
      > </a
      ><a name="17871" href="Stlc.html#6912" class="Function"
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
<a name="18591" href="Stlc.html#18591" class="Function"
      >Ctxt</a
      ><a name="18595"
      > </a
      ><a name="18596" class="Symbol"
      >:</a
      ><a name="18597"
      > </a
      ><a name="18598" class="PrimitiveType"
      >Set</a
      ><a name="18601"
      >
</a
      ><a name="18602" href="Stlc.html#18591" class="Function"
      >Ctxt</a
      ><a name="18606"
      > </a
      ><a name="18607" class="Symbol"
      >=</a
      ><a name="18608"
      > </a
      ><a name="18609" href="Stlc.html#5746" class="Datatype"
      >Id</a
      ><a name="18611"
      > </a
      ><a name="18612" class="Symbol"
      >&#8594;</a
      ><a name="18613"
      > </a
      ><a name="18614" href="https://agda.github.io/agda-stdlib/Data.Maybe.Base.html#335" class="Datatype"
      >Maybe</a
      ><a name="18619"
      > </a
      ><a name="18620" href="Stlc.html#5579" class="Datatype"
      >Type</a
      ><a name="18624"
      >

</a
      ><a name="18626" href="Stlc.html#18626" class="Function"
      >&#8709;</a
      ><a name="18627"
      > </a
      ><a name="18628" class="Symbol"
      >:</a
      ><a name="18629"
      > </a
      ><a name="18630" href="Stlc.html#18591" class="Function"
      >Ctxt</a
      ><a name="18634"
      >
</a
      ><a name="18635" href="Stlc.html#18626" class="Function"
      >&#8709;</a
      ><a name="18636"
      > </a
      ><a name="18637" class="Symbol"
      >=</a
      ><a name="18638"
      > </a
      ><a name="18639" class="Symbol"
      >&#955;</a
      ><a name="18640"
      > </a
      ><a name="18641" href="Stlc.html#18641" class="Bound"
      >_</a
      ><a name="18642"
      > </a
      ><a name="18643" class="Symbol"
      >&#8594;</a
      ><a name="18644"
      > </a
      ><a name="18645" href="https://agda.github.io/agda-stdlib/Data.Maybe.Base.html#403" class="InductiveConstructor"
      >nothing</a
      ><a name="18652"
      >

</a
      ><a name="18654" href="Stlc.html#18654" class="Function Operator"
      >_,_&#8758;_</a
      ><a name="18659"
      > </a
      ><a name="18660" class="Symbol"
      >:</a
      ><a name="18661"
      > </a
      ><a name="18662" href="Stlc.html#18591" class="Function"
      >Ctxt</a
      ><a name="18666"
      > </a
      ><a name="18667" class="Symbol"
      >-&gt;</a
      ><a name="18669"
      > </a
      ><a name="18670" href="Stlc.html#5746" class="Datatype"
      >Id</a
      ><a name="18672"
      > </a
      ><a name="18673" class="Symbol"
      >-&gt;</a
      ><a name="18675"
      > </a
      ><a name="18676" href="Stlc.html#5579" class="Datatype"
      >Type</a
      ><a name="18680"
      > </a
      ><a name="18681" class="Symbol"
      >-&gt;</a
      ><a name="18683"
      > </a
      ><a name="18684" href="Stlc.html#18591" class="Function"
      >Ctxt</a
      ><a name="18688"
      >
</a
      ><a name="18689" class="Symbol"
      >(</a
      ><a name="18690" href="Stlc.html#18690" class="Bound"
      >&#915;</a
      ><a name="18691"
      > </a
      ><a name="18692" href="Stlc.html#18654" class="Function Operator"
      >,</a
      ><a name="18693"
      > </a
      ><a name="18694" href="Stlc.html#18694" class="Bound"
      >x</a
      ><a name="18695"
      > </a
      ><a name="18696" href="Stlc.html#18654" class="Function Operator"
      >&#8758;</a
      ><a name="18697"
      > </a
      ><a name="18698" href="Stlc.html#18698" class="Bound"
      >A</a
      ><a name="18699" class="Symbol"
      >)</a
      ><a name="18700"
      > </a
      ><a name="18701" href="Stlc.html#18701" class="Bound"
      >y</a
      ><a name="18702"
      > </a
      ><a name="18703" class="Keyword"
      >with</a
      ><a name="18707"
      > </a
      ><a name="18708" href="Stlc.html#18694" class="Bound"
      >x</a
      ><a name="18709"
      > </a
      ><a name="18710" href="Stlc.html#5821" class="Function Operator"
      >&#8799;</a
      ><a name="18711"
      > </a
      ><a name="18712" href="Stlc.html#18701" class="Bound"
      >y</a
      ><a name="18713"
      >
</a
      ><a name="18714" class="Symbol"
      >...</a
      ><a name="18717"
      > </a
      ><a name="18718" class="Symbol"
      >|</a
      ><a name="18719"
      > </a
      ><a name="18720" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="18723"
      > </a
      ><a name="18724" href="Stlc.html#18724" class="Bound"
      >x=y</a
      ><a name="18727"
      > </a
      ><a name="18728" class="Symbol"
      >=</a
      ><a name="18729"
      > </a
      ><a name="18730" href="https://agda.github.io/agda-stdlib/Data.Maybe.Base.html#373" class="InductiveConstructor"
      >just</a
      ><a name="18734"
      > </a
      ><a name="18735" href="Stlc.html#18698" class="Bound"
      >A</a
      ><a name="18736"
      >
</a
      ><a name="18737" class="Symbol"
      >...</a
      ><a name="18740"
      > </a
      ><a name="18741" class="Symbol"
      >|</a
      ><a name="18742"
      > </a
      ><a name="18743" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="18745"
      >  </a
      ><a name="18747" href="Stlc.html#18747" class="Bound"
      >x&#8800;y</a
      ><a name="18750"
      > </a
      ><a name="18751" class="Symbol"
      >=</a
      ><a name="18752"
      > </a
      ><a name="18753" href="Stlc.html#18690" class="Bound"
      >&#915;</a
      ><a name="18754"
      > </a
      ><a name="18755" href="Stlc.html#18701" class="Bound"
      >y</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="18803" class="Keyword"
      >infixl</a
      ><a name="18809"
      > </a
      ><a name="18810" class="Number"
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
<a name="19592" class="Keyword"
      >data</a
      ><a name="19596"
      > </a
      ><a name="19597" href="Stlc.html#19597" class="Datatype Operator"
      >_&#8866;_&#8758;_</a
      ><a name="19602"
      > </a
      ><a name="19603" class="Symbol"
      >:</a
      ><a name="19604"
      > </a
      ><a name="19605" href="Stlc.html#18591" class="Function"
      >Ctxt</a
      ><a name="19609"
      > </a
      ><a name="19610" class="Symbol"
      >-&gt;</a
      ><a name="19612"
      > </a
      ><a name="19613" href="Stlc.html#6082" class="Datatype"
      >Term</a
      ><a name="19617"
      > </a
      ><a name="19618" class="Symbol"
      >-&gt;</a
      ><a name="19620"
      > </a
      ><a name="19621" href="Stlc.html#5579" class="Datatype"
      >Type</a
      ><a name="19625"
      > </a
      ><a name="19626" class="Symbol"
      >-&gt;</a
      ><a name="19628"
      > </a
      ><a name="19629" class="PrimitiveType"
      >Set</a
      ><a name="19632"
      > </a
      ><a name="19633" class="Keyword"
      >where</a
      ><a name="19638"
      >
  </a
      ><a name="19641" href="Stlc.html#19641" class="InductiveConstructor"
      >var</a
      ><a name="19644"
      >           </a
      ><a name="19655" class="Symbol"
      >:</a
      ><a name="19656"
      > </a
      ><a name="19657" class="Symbol"
      >&#8704;</a
      ><a name="19658"
      > </a
      ><a name="19659" class="Symbol"
      >{</a
      ><a name="19660" href="Stlc.html#19660" class="Bound"
      >&#915;</a
      ><a name="19661" class="Symbol"
      >}</a
      ><a name="19662"
      > </a
      ><a name="19663" href="Stlc.html#19663" class="Bound"
      >x</a
      ><a name="19664"
      > </a
      ><a name="19665" class="Symbol"
      >{</a
      ><a name="19666" href="Stlc.html#19666" class="Bound"
      >A</a
      ><a name="19667" class="Symbol"
      >}</a
      ><a name="19668"
      >
                </a
      ><a name="19685" class="Symbol"
      >&#8594;</a
      ><a name="19686"
      > </a
      ><a name="19687" href="Stlc.html#19660" class="Bound"
      >&#915;</a
      ><a name="19688"
      > </a
      ><a name="19689" href="Stlc.html#19663" class="Bound"
      >x</a
      ><a name="19690"
      > </a
      ><a name="19691" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="19692"
      > </a
      ><a name="19693" href="https://agda.github.io/agda-stdlib/Data.Maybe.Base.html#373" class="InductiveConstructor"
      >just</a
      ><a name="19697"
      > </a
      ><a name="19698" href="Stlc.html#19666" class="Bound"
      >A</a
      ><a name="19699"
      >
                </a
      ><a name="19716" class="Symbol"
      >&#8594;</a
      ><a name="19717"
      > </a
      ><a name="19718" href="Stlc.html#19660" class="Bound"
      >&#915;</a
      ><a name="19719"
      > </a
      ><a name="19720" href="Stlc.html#19597" class="Datatype Operator"
      >&#8866;</a
      ><a name="19721"
      > </a
      ><a name="19722" href="Stlc.html#6101" class="InductiveConstructor"
      >var</a
      ><a name="19725"
      > </a
      ><a name="19726" href="Stlc.html#19663" class="Bound"
      >x</a
      ><a name="19727"
      > </a
      ><a name="19728" href="Stlc.html#19597" class="Datatype Operator"
      >&#8758;</a
      ><a name="19729"
      > </a
      ><a name="19730" href="Stlc.html#19666" class="Bound"
      >A</a
      ><a name="19731"
      >
  </a
      ><a name="19734" href="Stlc.html#19734" class="InductiveConstructor"
      >abs</a
      ><a name="19737"
      >           </a
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
      >x</a
      ><a name="19758" class="Symbol"
      >}</a
      ><a name="19759"
      > </a
      ><a name="19760" class="Symbol"
      >{</a
      ><a name="19761" href="Stlc.html#19761" class="Bound"
      >A</a
      ><a name="19762" class="Symbol"
      >}</a
      ><a name="19763"
      > </a
      ><a name="19764" class="Symbol"
      >{</a
      ><a name="19765" href="Stlc.html#19765" class="Bound"
      >B</a
      ><a name="19766" class="Symbol"
      >}</a
      ><a name="19767"
      > </a
      ><a name="19768" class="Symbol"
      >{</a
      ><a name="19769" href="Stlc.html#19769" class="Bound"
      >s</a
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
      ><a name="19792" href="Stlc.html#18654" class="Function Operator"
      >,</a
      ><a name="19793"
      > </a
      ><a name="19794" href="Stlc.html#19757" class="Bound"
      >x</a
      ><a name="19795"
      > </a
      ><a name="19796" href="Stlc.html#18654" class="Function Operator"
      >&#8758;</a
      ><a name="19797"
      > </a
      ><a name="19798" href="Stlc.html#19761" class="Bound"
      >A</a
      ><a name="19799"
      > </a
      ><a name="19800" href="Stlc.html#19597" class="Datatype Operator"
      >&#8866;</a
      ><a name="19801"
      > </a
      ><a name="19802" href="Stlc.html#19769" class="Bound"
      >s</a
      ><a name="19803"
      > </a
      ><a name="19804" href="Stlc.html#19597" class="Datatype Operator"
      >&#8758;</a
      ><a name="19805"
      > </a
      ><a name="19806" href="Stlc.html#19765" class="Bound"
      >B</a
      ><a name="19807"
      >
                </a
      ><a name="19824" class="Symbol"
      >&#8594;</a
      ><a name="19825"
      > </a
      ><a name="19826" href="Stlc.html#19753" class="Bound"
      >&#915;</a
      ><a name="19827"
      > </a
      ><a name="19828" href="Stlc.html#19597" class="Datatype Operator"
      >&#8866;</a
      ><a name="19829"
      > </a
      ><a name="19830" href="Stlc.html#6150" class="InductiveConstructor"
      >abs</a
      ><a name="19833"
      > </a
      ><a name="19834" href="Stlc.html#19757" class="Bound"
      >x</a
      ><a name="19835"
      > </a
      ><a name="19836" href="Stlc.html#19761" class="Bound"
      >A</a
      ><a name="19837"
      > </a
      ><a name="19838" href="Stlc.html#19769" class="Bound"
      >s</a
      ><a name="19839"
      > </a
      ><a name="19840" href="Stlc.html#19597" class="Datatype Operator"
      >&#8758;</a
      ><a name="19841"
      > </a
      ><a name="19842" href="Stlc.html#19761" class="Bound"
      >A</a
      ><a name="19843"
      > </a
      ><a name="19844" href="Stlc.html#5612" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="19845"
      > </a
      ><a name="19846" href="Stlc.html#19765" class="Bound"
      >B</a
      ><a name="19847"
      >
  </a
      ><a name="19850" href="Stlc.html#19850" class="InductiveConstructor"
      >app</a
      ><a name="19853"
      >           </a
      ><a name="19864" class="Symbol"
      >:</a
      ><a name="19865"
      > </a
      ><a name="19866" class="Symbol"
      >&#8704;</a
      ><a name="19867"
      > </a
      ><a name="19868" class="Symbol"
      >{</a
      ><a name="19869" href="Stlc.html#19869" class="Bound"
      >&#915;</a
      ><a name="19870" class="Symbol"
      >}</a
      ><a name="19871"
      > </a
      ><a name="19872" class="Symbol"
      >{</a
      ><a name="19873" href="Stlc.html#19873" class="Bound"
      >A</a
      ><a name="19874" class="Symbol"
      >}</a
      ><a name="19875"
      > </a
      ><a name="19876" class="Symbol"
      >{</a
      ><a name="19877" href="Stlc.html#19877" class="Bound"
      >B</a
      ><a name="19878" class="Symbol"
      >}</a
      ><a name="19879"
      > </a
      ><a name="19880" class="Symbol"
      >{</a
      ><a name="19881" href="Stlc.html#19881" class="Bound"
      >s</a
      ><a name="19882" class="Symbol"
      >}</a
      ><a name="19883"
      > </a
      ><a name="19884" class="Symbol"
      >{</a
      ><a name="19885" href="Stlc.html#19885" class="Bound"
      >t</a
      ><a name="19886" class="Symbol"
      >}</a
      ><a name="19887"
      >
                </a
      ><a name="19904" class="Symbol"
      >&#8594;</a
      ><a name="19905"
      > </a
      ><a name="19906" href="Stlc.html#19869" class="Bound"
      >&#915;</a
      ><a name="19907"
      > </a
      ><a name="19908" href="Stlc.html#19597" class="Datatype Operator"
      >&#8866;</a
      ><a name="19909"
      > </a
      ><a name="19910" href="Stlc.html#19881" class="Bound"
      >s</a
      ><a name="19911"
      > </a
      ><a name="19912" href="Stlc.html#19597" class="Datatype Operator"
      >&#8758;</a
      ><a name="19913"
      > </a
      ><a name="19914" href="Stlc.html#19873" class="Bound"
      >A</a
      ><a name="19915"
      > </a
      ><a name="19916" href="Stlc.html#5612" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="19917"
      > </a
      ><a name="19918" href="Stlc.html#19877" class="Bound"
      >B</a
      ><a name="19919"
      >
                </a
      ><a name="19936" class="Symbol"
      >&#8594;</a
      ><a name="19937"
      > </a
      ><a name="19938" href="Stlc.html#19869" class="Bound"
      >&#915;</a
      ><a name="19939"
      > </a
      ><a name="19940" href="Stlc.html#19597" class="Datatype Operator"
      >&#8866;</a
      ><a name="19941"
      > </a
      ><a name="19942" href="Stlc.html#19885" class="Bound"
      >t</a
      ><a name="19943"
      > </a
      ><a name="19944" href="Stlc.html#19597" class="Datatype Operator"
      >&#8758;</a
      ><a name="19945"
      > </a
      ><a name="19946" href="Stlc.html#19873" class="Bound"
      >A</a
      ><a name="19947"
      >
                </a
      ><a name="19964" class="Symbol"
      >&#8594;</a
      ><a name="19965"
      > </a
      ><a name="19966" href="Stlc.html#19869" class="Bound"
      >&#915;</a
      ><a name="19967"
      > </a
      ><a name="19968" href="Stlc.html#19597" class="Datatype Operator"
      >&#8866;</a
      ><a name="19969"
      > </a
      ><a name="19970" href="Stlc.html#6121" class="InductiveConstructor"
      >app</a
      ><a name="19973"
      > </a
      ><a name="19974" href="Stlc.html#19881" class="Bound"
      >s</a
      ><a name="19975"
      > </a
      ><a name="19976" href="Stlc.html#19885" class="Bound"
      >t</a
      ><a name="19977"
      > </a
      ><a name="19978" href="Stlc.html#19597" class="Datatype Operator"
      >&#8758;</a
      ><a name="19979"
      > </a
      ><a name="19980" href="Stlc.html#19877" class="Bound"
      >B</a
      ><a name="19981"
      >
  </a
      ><a name="19984" href="Stlc.html#19984" class="InductiveConstructor"
      >true</a
      ><a name="19988"
      >          </a
      ><a name="19998" class="Symbol"
      >:</a
      ><a name="19999"
      > </a
      ><a name="20000" class="Symbol"
      >&#8704;</a
      ><a name="20001"
      > </a
      ><a name="20002" class="Symbol"
      >{</a
      ><a name="20003" href="Stlc.html#20003" class="Bound"
      >&#915;</a
      ><a name="20004" class="Symbol"
      >}</a
      ><a name="20005"
      >
                </a
      ><a name="20022" class="Symbol"
      >&#8594;</a
      ><a name="20023"
      > </a
      ><a name="20024" href="Stlc.html#20003" class="Bound"
      >&#915;</a
      ><a name="20025"
      > </a
      ><a name="20026" href="Stlc.html#19597" class="Datatype Operator"
      >&#8866;</a
      ><a name="20027"
      > </a
      ><a name="20028" href="Stlc.html#6184" class="InductiveConstructor"
      >true</a
      ><a name="20032"
      >  </a
      ><a name="20034" href="Stlc.html#19597" class="Datatype Operator"
      >&#8758;</a
      ><a name="20035"
      > </a
      ><a name="20036" href="Stlc.html#5598" class="InductiveConstructor"
      >bool</a
      ><a name="20040"
      >
  </a
      ><a name="20043" href="Stlc.html#20043" class="InductiveConstructor"
      >false</a
      ><a name="20048"
      >         </a
      ><a name="20057" class="Symbol"
      >:</a
      ><a name="20058"
      > </a
      ><a name="20059" class="Symbol"
      >&#8704;</a
      ><a name="20060"
      > </a
      ><a name="20061" class="Symbol"
      >{</a
      ><a name="20062" href="Stlc.html#20062" class="Bound"
      >&#915;</a
      ><a name="20063" class="Symbol"
      >}</a
      ><a name="20064"
      >
                </a
      ><a name="20081" class="Symbol"
      >&#8594;</a
      ><a name="20082"
      > </a
      ><a name="20083" href="Stlc.html#20062" class="Bound"
      >&#915;</a
      ><a name="20084"
      > </a
      ><a name="20085" href="Stlc.html#19597" class="Datatype Operator"
      >&#8866;</a
      ><a name="20086"
      > </a
      ><a name="20087" href="Stlc.html#6199" class="InductiveConstructor"
      >false</a
      ><a name="20092"
      > </a
      ><a name="20093" href="Stlc.html#19597" class="Datatype Operator"
      >&#8758;</a
      ><a name="20094"
      > </a
      ><a name="20095" href="Stlc.html#5598" class="InductiveConstructor"
      >bool</a
      ><a name="20099"
      >
  </a
      ><a name="20102" href="Stlc.html#20102" class="InductiveConstructor Operator"
      >if_then_else_</a
      ><a name="20115"
      > </a
      ><a name="20116" class="Symbol"
      >:</a
      ><a name="20117"
      > </a
      ><a name="20118" class="Symbol"
      >&#8704;</a
      ><a name="20119"
      > </a
      ><a name="20120" class="Symbol"
      >{</a
      ><a name="20121" href="Stlc.html#20121" class="Bound"
      >&#915;</a
      ><a name="20122" class="Symbol"
      >}</a
      ><a name="20123"
      > </a
      ><a name="20124" class="Symbol"
      >{</a
      ><a name="20125" href="Stlc.html#20125" class="Bound"
      >s</a
      ><a name="20126" class="Symbol"
      >}</a
      ><a name="20127"
      > </a
      ><a name="20128" class="Symbol"
      >{</a
      ><a name="20129" href="Stlc.html#20129" class="Bound"
      >t</a
      ><a name="20130" class="Symbol"
      >}</a
      ><a name="20131"
      > </a
      ><a name="20132" class="Symbol"
      >{</a
      ><a name="20133" href="Stlc.html#20133" class="Bound"
      >u</a
      ><a name="20134" class="Symbol"
      >}</a
      ><a name="20135"
      > </a
      ><a name="20136" class="Symbol"
      >{</a
      ><a name="20137" href="Stlc.html#20137" class="Bound"
      >A</a
      ><a name="20138" class="Symbol"
      >}</a
      ><a name="20139"
      >
                </a
      ><a name="20156" class="Symbol"
      >&#8594;</a
      ><a name="20157"
      > </a
      ><a name="20158" href="Stlc.html#20121" class="Bound"
      >&#915;</a
      ><a name="20159"
      > </a
      ><a name="20160" href="Stlc.html#19597" class="Datatype Operator"
      >&#8866;</a
      ><a name="20161"
      > </a
      ><a name="20162" href="Stlc.html#20125" class="Bound"
      >s</a
      ><a name="20163"
      > </a
      ><a name="20164" href="Stlc.html#19597" class="Datatype Operator"
      >&#8758;</a
      ><a name="20165"
      > </a
      ><a name="20166" href="Stlc.html#5598" class="InductiveConstructor"
      >bool</a
      ><a name="20170"
      >
                </a
      ><a name="20187" class="Symbol"
      >&#8594;</a
      ><a name="20188"
      > </a
      ><a name="20189" href="Stlc.html#20121" class="Bound"
      >&#915;</a
      ><a name="20190"
      > </a
      ><a name="20191" href="Stlc.html#19597" class="Datatype Operator"
      >&#8866;</a
      ><a name="20192"
      > </a
      ><a name="20193" href="Stlc.html#20129" class="Bound"
      >t</a
      ><a name="20194"
      > </a
      ><a name="20195" href="Stlc.html#19597" class="Datatype Operator"
      >&#8758;</a
      ><a name="20196"
      > </a
      ><a name="20197" href="Stlc.html#20137" class="Bound"
      >A</a
      ><a name="20198"
      >
                </a
      ><a name="20215" class="Symbol"
      >&#8594;</a
      ><a name="20216"
      > </a
      ><a name="20217" href="Stlc.html#20121" class="Bound"
      >&#915;</a
      ><a name="20218"
      > </a
      ><a name="20219" href="Stlc.html#19597" class="Datatype Operator"
      >&#8866;</a
      ><a name="20220"
      > </a
      ><a name="20221" href="Stlc.html#20133" class="Bound"
      >u</a
      ><a name="20222"
      > </a
      ><a name="20223" href="Stlc.html#19597" class="Datatype Operator"
      >&#8758;</a
      ><a name="20224"
      > </a
      ><a name="20225" href="Stlc.html#20137" class="Bound"
      >A</a
      ><a name="20226"
      >
                </a
      ><a name="20243" class="Symbol"
      >&#8594;</a
      ><a name="20244"
      > </a
      ><a name="20245" href="Stlc.html#20121" class="Bound"
      >&#915;</a
      ><a name="20246"
      > </a
      ><a name="20247" href="Stlc.html#19597" class="Datatype Operator"
      >&#8866;</a
      ><a name="20248"
      > </a
      ><a name="20249" href="Stlc.html#6214" class="InductiveConstructor Operator"
      >if</a
      ><a name="20251"
      > </a
      ><a name="20252" href="Stlc.html#20125" class="Bound"
      >s</a
      ><a name="20253"
      > </a
      ><a name="20254" href="Stlc.html#6214" class="InductiveConstructor Operator"
      >then</a
      ><a name="20258"
      > </a
      ><a name="20259" href="Stlc.html#20129" class="Bound"
      >t</a
      ><a name="20260"
      > </a
      ><a name="20261" href="Stlc.html#6214" class="InductiveConstructor Operator"
      >else</a
      ><a name="20265"
      > </a
      ><a name="20266" href="Stlc.html#20133" class="Bound"
      >u</a
      ><a name="20267"
      > </a
      ><a name="20268" href="Stlc.html#19597" class="Datatype Operator"
      >&#8758;</a
      ><a name="20269"
      > </a
      ><a name="20270" href="Stlc.html#20137" class="Bound"
      >A</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="20318" class="Keyword"
      >infix</a
      ><a name="20323"
      > </a
      ><a name="20324" class="Number"
      >1</a
      >
{% endraw %}</pre>
</div>


### Examples

<pre class="Agda">{% raw %}
<a name="20379" href="Stlc.html#20379" class="Function"
      >typing-example1</a
      ><a name="20394"
      > </a
      ><a name="20395" class="Symbol"
      >:</a
      ><a name="20396"
      > </a
      ><a name="20397" href="Stlc.html#18626" class="Function"
      >&#8709;</a
      ><a name="20398"
      > </a
      ><a name="20399" href="Stlc.html#19597" class="Datatype Operator"
      >&#8866;</a
      ><a name="20400"
      > </a
      ><a name="20401" href="Stlc.html#6912" class="Function"
      >idB</a
      ><a name="20404"
      > </a
      ><a name="20405" href="Stlc.html#19597" class="Datatype Operator"
      >&#8758;</a
      ><a name="20406"
      > </a
      ><a name="20407" href="Stlc.html#5598" class="InductiveConstructor"
      >bool</a
      ><a name="20411"
      > </a
      ><a name="20412" href="Stlc.html#5612" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="20413"
      > </a
      ><a name="20414" href="Stlc.html#5598" class="InductiveConstructor"
      >bool</a
      ><a name="20418"
      >
</a
      ><a name="20419" href="Stlc.html#20379" class="Function"
      >typing-example1</a
      ><a name="20434"
      > </a
      ><a name="20435" class="Symbol"
      >=</a
      ><a name="20436"
      > </a
      ><a name="20437" href="Stlc.html#19734" class="InductiveConstructor"
      >abs</a
      ><a name="20440"
      > </a
      ><a name="20441" class="Symbol"
      >(</a
      ><a name="20442" href="Stlc.html#19641" class="InductiveConstructor"
      >var</a
      ><a name="20445"
      > </a
      ><a name="20446" href="Stlc.html#6681" class="Function"
      >x</a
      ><a name="20447"
      > </a
      ><a name="20448" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="20452" class="Symbol"
      >)</a
      >
{% endraw %}</pre>

Another example:

$$\varnothing\vdash \lambda x:A. \lambda y:A\rightarrow A. y\;(y\;x) : A\rightarrow (A\rightarrow A)\rightarrow A$$.

<pre class="Agda">{% raw %}
<a name="20615" href="Stlc.html#20615" class="Function"
      >typing-example2</a
      ><a name="20630"
      > </a
      ><a name="20631" class="Symbol"
      >:</a
      ><a name="20632"
      > </a
      ><a name="20633" href="Stlc.html#18626" class="Function"
      >&#8709;</a
      ><a name="20634"
      > </a
      ><a name="20635" href="Stlc.html#19597" class="Datatype Operator"
      >&#8866;</a
      ><a name="20636"
      >
  </a
      ><a name="20639" class="Symbol"
      >(</a
      ><a name="20640" href="Stlc.html#6150" class="InductiveConstructor"
      >abs</a
      ><a name="20643"
      > </a
      ><a name="20644" href="Stlc.html#6681" class="Function"
      >x</a
      ><a name="20645"
      > </a
      ><a name="20646" href="Stlc.html#5598" class="InductiveConstructor"
      >bool</a
      ><a name="20650"
      >
    </a
      ><a name="20655" class="Symbol"
      >(</a
      ><a name="20656" href="Stlc.html#6150" class="InductiveConstructor"
      >abs</a
      ><a name="20659"
      > </a
      ><a name="20660" href="Stlc.html#6690" class="Function"
      >y</a
      ><a name="20661"
      > </a
      ><a name="20662" class="Symbol"
      >(</a
      ><a name="20663" href="Stlc.html#5598" class="InductiveConstructor"
      >bool</a
      ><a name="20667"
      > </a
      ><a name="20668" href="Stlc.html#5612" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="20669"
      > </a
      ><a name="20670" href="Stlc.html#5598" class="InductiveConstructor"
      >bool</a
      ><a name="20674" class="Symbol"
      >)</a
      ><a name="20675"
      >
      </a
      ><a name="20682" class="Symbol"
      >(</a
      ><a name="20683" href="Stlc.html#6121" class="InductiveConstructor"
      >app</a
      ><a name="20686"
      > </a
      ><a name="20687" class="Symbol"
      >(</a
      ><a name="20688" href="Stlc.html#6101" class="InductiveConstructor"
      >var</a
      ><a name="20691"
      > </a
      ><a name="20692" href="Stlc.html#6690" class="Function"
      >y</a
      ><a name="20693" class="Symbol"
      >)</a
      ><a name="20694"
      >
        </a
      ><a name="20703" class="Symbol"
      >(</a
      ><a name="20704" href="Stlc.html#6121" class="InductiveConstructor"
      >app</a
      ><a name="20707"
      > </a
      ><a name="20708" class="Symbol"
      >(</a
      ><a name="20709" href="Stlc.html#6101" class="InductiveConstructor"
      >var</a
      ><a name="20712"
      > </a
      ><a name="20713" href="Stlc.html#6690" class="Function"
      >y</a
      ><a name="20714" class="Symbol"
      >)</a
      ><a name="20715"
      > </a
      ><a name="20716" class="Symbol"
      >(</a
      ><a name="20717" href="Stlc.html#6101" class="InductiveConstructor"
      >var</a
      ><a name="20720"
      > </a
      ><a name="20721" href="Stlc.html#6681" class="Function"
      >x</a
      ><a name="20722" class="Symbol"
      >)))))</a
      ><a name="20727"
      > </a
      ><a name="20728" href="Stlc.html#19597" class="Datatype Operator"
      >&#8758;</a
      ><a name="20729"
      >
  </a
      ><a name="20732" class="Symbol"
      >(</a
      ><a name="20733" href="Stlc.html#5598" class="InductiveConstructor"
      >bool</a
      ><a name="20737"
      > </a
      ><a name="20738" href="Stlc.html#5612" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="20739"
      > </a
      ><a name="20740" class="Symbol"
      >(</a
      ><a name="20741" href="Stlc.html#5598" class="InductiveConstructor"
      >bool</a
      ><a name="20745"
      > </a
      ><a name="20746" href="Stlc.html#5612" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="20747"
      > </a
      ><a name="20748" href="Stlc.html#5598" class="InductiveConstructor"
      >bool</a
      ><a name="20752" class="Symbol"
      >)</a
      ><a name="20753"
      > </a
      ><a name="20754" href="Stlc.html#5612" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="20755"
      > </a
      ><a name="20756" href="Stlc.html#5598" class="InductiveConstructor"
      >bool</a
      ><a name="20760" class="Symbol"
      >)</a
      ><a name="20761"
      >
</a
      ><a name="20762" href="Stlc.html#20615" class="Function"
      >typing-example2</a
      ><a name="20777"
      > </a
      ><a name="20778" class="Symbol"
      >=</a
      ><a name="20779"
      >
  </a
      ><a name="20782" class="Symbol"
      >(</a
      ><a name="20783" href="Stlc.html#19734" class="InductiveConstructor"
      >abs</a
      ><a name="20786"
      >
    </a
      ><a name="20791" class="Symbol"
      >(</a
      ><a name="20792" href="Stlc.html#19734" class="InductiveConstructor"
      >abs</a
      ><a name="20795"
      >
      </a
      ><a name="20802" class="Symbol"
      >(</a
      ><a name="20803" href="Stlc.html#19850" class="InductiveConstructor"
      >app</a
      ><a name="20806"
      > </a
      ><a name="20807" class="Symbol"
      >(</a
      ><a name="20808" href="Stlc.html#19641" class="InductiveConstructor"
      >var</a
      ><a name="20811"
      > </a
      ><a name="20812" href="Stlc.html#6690" class="Function"
      >y</a
      ><a name="20813"
      > </a
      ><a name="20814" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="20818" class="Symbol"
      >)</a
      ><a name="20819"
      >
        </a
      ><a name="20828" class="Symbol"
      >(</a
      ><a name="20829" href="Stlc.html#19850" class="InductiveConstructor"
      >app</a
      ><a name="20832"
      > </a
      ><a name="20833" class="Symbol"
      >(</a
      ><a name="20834" href="Stlc.html#19641" class="InductiveConstructor"
      >var</a
      ><a name="20837"
      > </a
      ><a name="20838" href="Stlc.html#6690" class="Function"
      >y</a
      ><a name="20839"
      > </a
      ><a name="20840" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="20844" class="Symbol"
      >)</a
      ><a name="20845"
      > </a
      ><a name="20846" class="Symbol"
      >(</a
      ><a name="20847" href="Stlc.html#19641" class="InductiveConstructor"
      >var</a
      ><a name="20850"
      > </a
      ><a name="20851" href="Stlc.html#6681" class="Function"
      >x</a
      ><a name="20852"
      > </a
      ><a name="20853" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="20857" class="Symbol"
      >)</a
      ><a name="20858"
      > </a
      ><a name="20859" class="Symbol"
      >))))</a
      >
{% endraw %}</pre>

#### Exercise: 2 stars (typing-example3)
Formally prove the following typing derivation holds:

$$\exists A, \varnothing\vdash \lambda x:bool\rightarrow B. \lambda y:bool\rightarrow bool. \lambda z:bool. y\;(x\;z) : A$$.

<pre class="Agda">{% raw %}
<a name="21111" class="Keyword"
      >postulate</a
      ><a name="21120"
      >
  </a
      ><a name="21123" href="Stlc.html#21123" class="Postulate"
      >typing-example3</a
      ><a name="21138"
      > </a
      ><a name="21139" class="Symbol"
      >:</a
      ><a name="21140"
      > </a
      ><a name="21141" href="https://agda.github.io/agda-stdlib/Data.Product.html#823" class="Function"
      >&#8707;</a
      ><a name="21142"
      > </a
      ><a name="21143" class="Symbol"
      >&#955;</a
      ><a name="21144"
      > </a
      ><a name="21145" href="Stlc.html#21145" class="Bound"
      >A</a
      ><a name="21146"
      > </a
      ><a name="21147" class="Symbol"
      >&#8594;</a
      ><a name="21148"
      > </a
      ><a name="21149" href="Stlc.html#18626" class="Function"
      >&#8709;</a
      ><a name="21150"
      > </a
      ><a name="21151" href="Stlc.html#19597" class="Datatype Operator"
      >&#8866;</a
      ><a name="21152"
      >
    </a
      ><a name="21157" class="Symbol"
      >(</a
      ><a name="21158" href="Stlc.html#6150" class="InductiveConstructor"
      >abs</a
      ><a name="21161"
      > </a
      ><a name="21162" href="Stlc.html#6681" class="Function"
      >x</a
      ><a name="21163"
      > </a
      ><a name="21164" class="Symbol"
      >(</a
      ><a name="21165" href="Stlc.html#5598" class="InductiveConstructor"
      >bool</a
      ><a name="21169"
      > </a
      ><a name="21170" href="Stlc.html#5612" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="21171"
      > </a
      ><a name="21172" href="Stlc.html#5598" class="InductiveConstructor"
      >bool</a
      ><a name="21176" class="Symbol"
      >)</a
      ><a name="21177"
      >
      </a
      ><a name="21184" class="Symbol"
      >(</a
      ><a name="21185" href="Stlc.html#6150" class="InductiveConstructor"
      >abs</a
      ><a name="21188"
      > </a
      ><a name="21189" href="Stlc.html#6690" class="Function"
      >y</a
      ><a name="21190"
      > </a
      ><a name="21191" class="Symbol"
      >(</a
      ><a name="21192" href="Stlc.html#5598" class="InductiveConstructor"
      >bool</a
      ><a name="21196"
      > </a
      ><a name="21197" href="Stlc.html#5612" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="21198"
      > </a
      ><a name="21199" href="Stlc.html#5598" class="InductiveConstructor"
      >bool</a
      ><a name="21203" class="Symbol"
      >)</a
      ><a name="21204"
      >
        </a
      ><a name="21213" class="Symbol"
      >(</a
      ><a name="21214" href="Stlc.html#6150" class="InductiveConstructor"
      >abs</a
      ><a name="21217"
      > </a
      ><a name="21218" href="Stlc.html#6699" class="Function"
      >z</a
      ><a name="21219"
      > </a
      ><a name="21220" href="Stlc.html#5598" class="InductiveConstructor"
      >bool</a
      ><a name="21224"
      >
          </a
      ><a name="21235" class="Symbol"
      >(</a
      ><a name="21236" href="Stlc.html#6121" class="InductiveConstructor"
      >app</a
      ><a name="21239"
      > </a
      ><a name="21240" class="Symbol"
      >(</a
      ><a name="21241" href="Stlc.html#6101" class="InductiveConstructor"
      >var</a
      ><a name="21244"
      > </a
      ><a name="21245" href="Stlc.html#6690" class="Function"
      >y</a
      ><a name="21246" class="Symbol"
      >)</a
      ><a name="21247"
      > </a
      ><a name="21248" class="Symbol"
      >(</a
      ><a name="21249" href="Stlc.html#6121" class="InductiveConstructor"
      >app</a
      ><a name="21252"
      > </a
      ><a name="21253" class="Symbol"
      >(</a
      ><a name="21254" href="Stlc.html#6101" class="InductiveConstructor"
      >var</a
      ><a name="21257"
      > </a
      ><a name="21258" href="Stlc.html#6681" class="Function"
      >x</a
      ><a name="21259" class="Symbol"
      >)</a
      ><a name="21260"
      > </a
      ><a name="21261" class="Symbol"
      >(</a
      ><a name="21262" href="Stlc.html#6101" class="InductiveConstructor"
      >var</a
      ><a name="21265"
      > </a
      ><a name="21266" href="Stlc.html#6699" class="Function"
      >z</a
      ><a name="21267" class="Symbol"
      >))))))</a
      ><a name="21273"
      > </a
      ><a name="21274" href="Stlc.html#19597" class="Datatype Operator"
      >&#8758;</a
      ><a name="21275"
      > </a
      ><a name="21276" href="Stlc.html#21145" class="Bound"
      >A</a
      >
{% endraw %}</pre>

We can also show that terms are _not_ typable.  For example, let's
formally check that there is no typing derivation assigning a type
to the term $$\lambda x:bool. \lambda y:bool. x\;y$$---i.e.,


$$\nexists A, \varnothing\vdash \lambda x:bool. \lambda y:bool. x\;y : A$$.

<pre class="Agda">{% raw %}
<a name="21577" class="Keyword"
      >postulate</a
      ><a name="21586"
      >
  </a
      ><a name="21589" href="Stlc.html#21589" class="Postulate"
      >typing-nonexample1</a
      ><a name="21607"
      > </a
      ><a name="21608" class="Symbol"
      >:</a
      ><a name="21609"
      > </a
      ><a name="21610" href="https://agda.github.io/agda-stdlib/Data.Product.html#884" class="Function"
      >&#8708;</a
      ><a name="21611"
      > </a
      ><a name="21612" class="Symbol"
      >&#955;</a
      ><a name="21613"
      > </a
      ><a name="21614" href="Stlc.html#21614" class="Bound"
      >A</a
      ><a name="21615"
      > </a
      ><a name="21616" class="Symbol"
      >&#8594;</a
      ><a name="21617"
      > </a
      ><a name="21618" href="Stlc.html#18626" class="Function"
      >&#8709;</a
      ><a name="21619"
      > </a
      ><a name="21620" href="Stlc.html#19597" class="Datatype Operator"
      >&#8866;</a
      ><a name="21621"
      >
    </a
      ><a name="21626" class="Symbol"
      >(</a
      ><a name="21627" href="Stlc.html#6150" class="InductiveConstructor"
      >abs</a
      ><a name="21630"
      > </a
      ><a name="21631" href="Stlc.html#6681" class="Function"
      >x</a
      ><a name="21632"
      > </a
      ><a name="21633" href="Stlc.html#5598" class="InductiveConstructor"
      >bool</a
      ><a name="21637"
      >
      </a
      ><a name="21644" class="Symbol"
      >(</a
      ><a name="21645" href="Stlc.html#6150" class="InductiveConstructor"
      >abs</a
      ><a name="21648"
      > </a
      ><a name="21649" href="Stlc.html#6690" class="Function"
      >y</a
      ><a name="21650"
      > </a
      ><a name="21651" href="Stlc.html#5598" class="InductiveConstructor"
      >bool</a
      ><a name="21655"
      >
        </a
      ><a name="21664" class="Symbol"
      >(</a
      ><a name="21665" href="Stlc.html#6121" class="InductiveConstructor"
      >app</a
      ><a name="21668"
      > </a
      ><a name="21669" class="Symbol"
      >(</a
      ><a name="21670" href="Stlc.html#6101" class="InductiveConstructor"
      >var</a
      ><a name="21673"
      > </a
      ><a name="21674" href="Stlc.html#6681" class="Function"
      >x</a
      ><a name="21675" class="Symbol"
      >)</a
      ><a name="21676"
      > </a
      ><a name="21677" class="Symbol"
      >(</a
      ><a name="21678" href="Stlc.html#6101" class="InductiveConstructor"
      >var</a
      ><a name="21681"
      > </a
      ><a name="21682" href="Stlc.html#6690" class="Function"
      >y</a
      ><a name="21683" class="Symbol"
      >))))</a
      ><a name="21687"
      > </a
      ><a name="21688" href="Stlc.html#19597" class="Datatype Operator"
      >&#8758;</a
      ><a name="21689"
      > </a
      ><a name="21690" href="Stlc.html#21614" class="Bound"
      >A</a
      >
{% endraw %}</pre>

#### Exercise: 3 stars, optional (typing-nonexample2)
Another nonexample:

$$\nexists A, \exists B, \varnothing\vdash \lambda x:A. x\;x : B$$.

<pre class="Agda">{% raw %}
<a name="21861" class="Keyword"
      >postulate</a
      ><a name="21870"
      >
  </a
      ><a name="21873" href="Stlc.html#21873" class="Postulate"
      >typing-nonexample2</a
      ><a name="21891"
      > </a
      ><a name="21892" class="Symbol"
      >:</a
      ><a name="21893"
      > </a
      ><a name="21894" href="https://agda.github.io/agda-stdlib/Data.Product.html#884" class="Function"
      >&#8708;</a
      ><a name="21895"
      > </a
      ><a name="21896" class="Symbol"
      >&#955;</a
      ><a name="21897"
      > </a
      ><a name="21898" href="Stlc.html#21898" class="Bound"
      >A</a
      ><a name="21899"
      > </a
      ><a name="21900" class="Symbol"
      >&#8594;</a
      ><a name="21901"
      > </a
      ><a name="21902" href="https://agda.github.io/agda-stdlib/Data.Product.html#823" class="Function"
      >&#8707;</a
      ><a name="21903"
      > </a
      ><a name="21904" class="Symbol"
      >&#955;</a
      ><a name="21905"
      > </a
      ><a name="21906" href="Stlc.html#21906" class="Bound"
      >B</a
      ><a name="21907"
      > </a
      ><a name="21908" class="Symbol"
      >&#8594;</a
      ><a name="21909"
      > </a
      ><a name="21910" href="Stlc.html#18626" class="Function"
      >&#8709;</a
      ><a name="21911"
      > </a
      ><a name="21912" href="Stlc.html#19597" class="Datatype Operator"
      >&#8866;</a
      ><a name="21913"
      >
    </a
      ><a name="21918" class="Symbol"
      >(</a
      ><a name="21919" href="Stlc.html#6150" class="InductiveConstructor"
      >abs</a
      ><a name="21922"
      > </a
      ><a name="21923" href="Stlc.html#6681" class="Function"
      >x</a
      ><a name="21924"
      > </a
      ><a name="21925" href="Stlc.html#21906" class="Bound"
      >B</a
      ><a name="21926"
      > </a
      ><a name="21927" class="Symbol"
      >(</a
      ><a name="21928" href="Stlc.html#6121" class="InductiveConstructor"
      >app</a
      ><a name="21931"
      > </a
      ><a name="21932" class="Symbol"
      >(</a
      ><a name="21933" href="Stlc.html#6101" class="InductiveConstructor"
      >var</a
      ><a name="21936"
      > </a
      ><a name="21937" href="Stlc.html#6681" class="Function"
      >x</a
      ><a name="21938" class="Symbol"
      >)</a
      ><a name="21939"
      > </a
      ><a name="21940" class="Symbol"
      >(</a
      ><a name="21941" href="Stlc.html#6101" class="InductiveConstructor"
      >var</a
      ><a name="21944"
      > </a
      ><a name="21945" href="Stlc.html#6681" class="Function"
      >x</a
      ><a name="21946" class="Symbol"
      >)))</a
      ><a name="21949"
      > </a
      ><a name="21950" href="Stlc.html#19597" class="Datatype Operator"
      >&#8758;</a
      ><a name="21951"
      > </a
      ><a name="21952" href="Stlc.html#21898" class="Bound"
      >A</a
      >
{% endraw %}</pre>
