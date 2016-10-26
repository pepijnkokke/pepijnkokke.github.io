---
title         : "Stlc: The Simply Typed Lambda-Calculus"
layout        : default
hide-implicit : false
extra-script  : agda-extra-script.html
extra-style   : agda-extra-style.html
---

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="224" class="Keyword"
      >open</a
      ><a name="228"
      > </a
      ><a name="229" class="Keyword"
      >import</a
      ><a name="235"
      > </a
      ><a name="236" href="https://agda.github.io/agda-stdlib/Data.Empty.html#1" class="Module"
      >Data.Empty</a
      ><a name="246"
      > </a
      ><a name="247" class="Keyword"
      >using</a
      ><a name="252"
      > </a
      ><a name="253" class="Symbol"
      >(</a
      ><a name="254" href="https://agda.github.io/agda-stdlib/Data.Empty.html#243" class="Datatype"
      >&#8869;</a
      ><a name="255" class="Symbol"
      >;</a
      ><a name="256"
      > </a
      ><a name="257" href="https://agda.github.io/agda-stdlib/Data.Empty.html#348" class="Function"
      >&#8869;-elim</a
      ><a name="263" class="Symbol"
      >)</a
      ><a name="264"
      >
</a
      ><a name="265" class="Keyword"
      >open</a
      ><a name="269"
      > </a
      ><a name="270" class="Keyword"
      >import</a
      ><a name="276"
      > </a
      ><a name="277" href="https://agda.github.io/agda-stdlib/Data.Maybe.html#1" class="Module"
      >Data.Maybe</a
      ><a name="287"
      > </a
      ><a name="288" class="Keyword"
      >using</a
      ><a name="293"
      > </a
      ><a name="294" class="Symbol"
      >(</a
      ><a name="295" href="https://agda.github.io/agda-stdlib/Data.Maybe.Base.html#335" class="Datatype"
      >Maybe</a
      ><a name="300" class="Symbol"
      >;</a
      ><a name="301"
      > </a
      ><a name="302" href="https://agda.github.io/agda-stdlib/Data.Maybe.html#1527" class="InductiveConstructor"
      >just</a
      ><a name="306" class="Symbol"
      >;</a
      ><a name="307"
      > </a
      ><a name="308" href="https://agda.github.io/agda-stdlib/Data.Maybe.html#1588" class="InductiveConstructor"
      >nothing</a
      ><a name="315" class="Symbol"
      >)</a
      ><a name="316"
      >
</a
      ><a name="317" class="Keyword"
      >open</a
      ><a name="321"
      > </a
      ><a name="322" class="Keyword"
      >import</a
      ><a name="328"
      > </a
      ><a name="329" href="https://agda.github.io/agda-stdlib/Data.Nat.html#1" class="Module"
      >Data.Nat</a
      ><a name="337"
      > </a
      ><a name="338" class="Keyword"
      >using</a
      ><a name="343"
      > </a
      ><a name="344" class="Symbol"
      >(</a
      ><a name="345" href="Agda.Builtin.Nat.html#69" class="Datatype"
      >&#8469;</a
      ><a name="346" class="Symbol"
      >;</a
      ><a name="347"
      > </a
      ><a name="348" href="Agda.Builtin.Nat.html#100" class="InductiveConstructor"
      >suc</a
      ><a name="351" class="Symbol"
      >;</a
      ><a name="352"
      > </a
      ><a name="353" href="Agda.Builtin.Nat.html#87" class="InductiveConstructor"
      >zero</a
      ><a name="357" class="Symbol"
      >;</a
      ><a name="358"
      > </a
      ><a name="359" href="Agda.Builtin.Nat.html#202" class="Primitive Operator"
      >_+_</a
      ><a name="362" class="Symbol"
      >)</a
      ><a name="363"
      >
</a
      ><a name="364" class="Keyword"
      >open</a
      ><a name="368"
      > </a
      ><a name="369" class="Keyword"
      >import</a
      ><a name="375"
      > </a
      ><a name="376" href="https://agda.github.io/agda-stdlib/Data.Product.html#1" class="Module"
      >Data.Product</a
      ><a name="388"
      > </a
      ><a name="389" class="Keyword"
      >using</a
      ><a name="394"
      > </a
      ><a name="395" class="Symbol"
      >(</a
      ><a name="396" href="https://agda.github.io/agda-stdlib/Data.Product.html#823" class="Function"
      >&#8707;</a
      ><a name="397" class="Symbol"
      >;</a
      ><a name="398"
      > </a
      ><a name="399" href="https://agda.github.io/agda-stdlib/Data.Product.html#884" class="Function"
      >&#8708;</a
      ><a name="400" class="Symbol"
      >;</a
      ><a name="401"
      > </a
      ><a name="402" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >_,_</a
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
      ><a name="419" href="https://agda.github.io/agda-stdlib/Function.html#1" class="Module"
      >Function</a
      ><a name="427"
      > </a
      ><a name="428" class="Keyword"
      >using</a
      ><a name="433"
      > </a
      ><a name="434" class="Symbol"
      >(</a
      ><a name="435" href="https://agda.github.io/agda-stdlib/Function.html#713" class="Function Operator"
      >_&#8728;_</a
      ><a name="438" class="Symbol"
      >;</a
      ><a name="439"
      > </a
      ><a name="440" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >_$_</a
      ><a name="443" class="Symbol"
      >)</a
      ><a name="444"
      >
</a
      ><a name="445" class="Keyword"
      >open</a
      ><a name="449"
      > </a
      ><a name="450" class="Keyword"
      >import</a
      ><a name="456"
      > </a
      ><a name="457" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#1" class="Module"
      >Relation.Nullary</a
      ><a name="473"
      > </a
      ><a name="474" class="Keyword"
      >using</a
      ><a name="479"
      > </a
      ><a name="480" class="Symbol"
      >(</a
      ><a name="481" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#484" class="Datatype"
      >Dec</a
      ><a name="484" class="Symbol"
      >;</a
      ><a name="485"
      > </a
      ><a name="486" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="489" class="Symbol"
      >;</a
      ><a name="490"
      > </a
      ><a name="491" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="493" class="Symbol"
      >)</a
      ><a name="494"
      >
</a
      ><a name="495" class="Keyword"
      >open</a
      ><a name="499"
      > </a
      ><a name="500" class="Keyword"
      >import</a
      ><a name="506"
      > </a
      ><a name="507" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.html#1" class="Module"
      >Relation.Binary.PropositionalEquality</a
      ><a name="544"
      > </a
      ><a name="545" class="Keyword"
      >using</a
      ><a name="550"
      > </a
      ><a name="551" class="Symbol"
      >(</a
      ><a name="552" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >_&#8801;_</a
      ><a name="555" class="Symbol"
      >;</a
      ><a name="556"
      > </a
      ><a name="557" href="https://agda.github.io/agda-stdlib/Relation.Binary.Core.html#4493" class="Function Operator"
      >_&#8802;_</a
      ><a name="560" class="Symbol"
      >;</a
      ><a name="561"
      > </a
      ><a name="562" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="566" class="Symbol"
      >)</a
      >
{% endraw %}</pre>
</div>

<pre class="Agda">{% raw %}
<a name="600" class="Keyword"
      >module</a
      ><a name="606"
      > </a
      ><a name="607" href="Stlc.html#1" class="Module"
      >Stlc</a
      ><a name="611"
      > </a
      ><a name="612" class="Keyword"
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
doesn't matter much -- the construction of the language and its
theoretical properties work out the same no matter what we
choose -- so for the sake of brevity let's take just `bool` for
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
constructors (written out first in informal BNF notation -- we'll
formalize it below).

    t ::= x                       variable
        | λx:T1.t2                abstraction
        | t1 t2                   application
        | true                    constant true
        | false                   constant false
        | if t1 then t2 else t3   conditional


The `\` symbol in a function abstraction `λx:T1.t2` is generally
written as a Greek letter "lambda" (hence the name of the
calculus).  The variable `x` is called the _parameter_ to the
function; the term `t2` is its _body_.  The annotation `:T1`
specifies the type of arguments that the function can be applied
to.

Some examples:

  - `λx:bool. x`

    The identity function for booleans.
  - `(λx:bool. x) true`

    The identity function for booleans, applied to the boolean `true`.
  - `λx:bool. if x then false else true`

    The boolean "not" function.
  - `λx:bool. true`

    The constant function that takes every (boolean) argument to `true`.
  - `λx:bool. λy:bool. x`

    A two-argument function that takes two booleans and returns the
    first one.  (As in Agda, a two-argument function is really a
    one-argument function whose body is also a one-argument function.)
  - `(λx:bool. λy:bool. x) false true`

    A two-argument function that takes two booleans and returns the
    first one, applied to the booleans `false` and `true`.

    As in Agda, application associates to the left -- i.e., this
    expression is parsed as `((λx:bool. λy:bool. x) false) true`.
  - `\f:bool⇒bool. f (f true)`

    A higher-order function that takes a _function_ `f` (from booleans
    to booleans) as an argument, applies `f` to `true`, and applies
    `f` again to the result.
  - `(\f:bool⇒bool. f (f true)) (λx:bool. false)`

    The same higher-order function, applied to the constantly `false`
    function.

As the last several examples show, the STLC is a language of
_higher-order_ functions: we can write down functions that take
other functions as arguments and/or return other functions as
results.

The STLC doesn't provide any primitive syntax for defining _named_
functions -- all functions are "anonymous."  We'll see in chapter
`MoreStlc` that it is easy to add named functions to what we've
got -- indeed, the fundamental naming and binding mechanisms are
exactly the same.

The _types_ of the STLC include `bool`, which classifies the
boolean constants `true` and `false` as well as more complex
computations that yield booleans, plus _arrow types_ that classify
functions.


    T ::= bool
        | T1 → T2

For example:
  - `λx:bool. false` has type `bool⇒bool`
  - `λx:bool. x` has type `bool⇒bool`
  - `(λx:bool. x) true` has type `bool`
  - `λx:bool. λy:bool. x` has type `bool⇒bool⇒bool`
    (i.e., `bool⇒(bool⇒bool)`)
  - `(λx:bool. λy:bool. x) false` has type `bool⇒bool`
  - `(λx:bool. λy:bool. x) false true` has type `bool`

## Syntax

We begin by formalizing the syntax of the STLC.


### Types

<pre class="Agda">{% raw %}
<a name="4978" class="Keyword"
      >data</a
      ><a name="4982"
      > </a
      ><a name="4983" href="Stlc.html#4983" class="Datatype"
      >Type</a
      ><a name="4987"
      > </a
      ><a name="4988" class="Symbol"
      >:</a
      ><a name="4989"
      > </a
      ><a name="4990" class="PrimitiveType"
      >Set</a
      ><a name="4993"
      > </a
      ><a name="4994" class="Keyword"
      >where</a
      ><a name="4999"
      >
  </a
      ><a name="5002" href="Stlc.html#5002" class="InductiveConstructor"
      >bool</a
      ><a name="5006"
      > </a
      ><a name="5007" class="Symbol"
      >:</a
      ><a name="5008"
      > </a
      ><a name="5009" href="Stlc.html#4983" class="Datatype"
      >Type</a
      ><a name="5013"
      >
  </a
      ><a name="5016" href="Stlc.html#5016" class="InductiveConstructor Operator"
      >_&#8658;_</a
      ><a name="5019"
      > </a
      ><a name="5020" class="Symbol"
      >:</a
      ><a name="5021"
      > </a
      ><a name="5022" href="Stlc.html#4983" class="Datatype"
      >Type</a
      ><a name="5026"
      > </a
      ><a name="5027" class="Symbol"
      >&#8594;</a
      ><a name="5028"
      > </a
      ><a name="5029" href="Stlc.html#4983" class="Datatype"
      >Type</a
      ><a name="5033"
      > </a
      ><a name="5034" class="Symbol"
      >&#8594;</a
      ><a name="5035"
      > </a
      ><a name="5036" href="Stlc.html#4983" class="Datatype"
      >Type</a
      ><a name="5040"
      >

</a
      ><a name="5042" class="Keyword"
      >infixr</a
      ><a name="5048"
      > </a
      ><a name="5049" class="Number"
      >5</a
      >
{% endraw %}</pre>


### Terms

<pre class="Agda">{% raw %}
<a name="5092" class="Keyword"
      >data</a
      ><a name="5096"
      > </a
      ><a name="5097" href="Stlc.html#5097" class="Datatype"
      >Id</a
      ><a name="5099"
      > </a
      ><a name="5100" class="Symbol"
      >:</a
      ><a name="5101"
      > </a
      ><a name="5102" class="PrimitiveType"
      >Set</a
      ><a name="5105"
      > </a
      ><a name="5106" class="Keyword"
      >where</a
      ><a name="5111"
      >
  </a
      ><a name="5114" href="Stlc.html#5114" class="InductiveConstructor"
      >id</a
      ><a name="5116"
      > </a
      ><a name="5117" class="Symbol"
      >:</a
      ><a name="5118"
      > </a
      ><a name="5119" href="Agda.Builtin.Nat.html#69" class="Datatype"
      >&#8469;</a
      ><a name="5120"
      > </a
      ><a name="5121" class="Symbol"
      >&#8594;</a
      ><a name="5122"
      > </a
      ><a name="5123" href="Stlc.html#5097" class="Datatype"
      >Id</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="5172" href="Stlc.html#5172" class="Function"
      >id-inj</a
      ><a name="5178"
      > </a
      ><a name="5179" class="Symbol"
      >:</a
      ><a name="5180"
      > </a
      ><a name="5181" class="Symbol"
      >&#8704;</a
      ><a name="5182"
      > </a
      ><a name="5183" class="Symbol"
      >{</a
      ><a name="5184" href="Stlc.html#5184" class="Bound"
      >x</a
      ><a name="5185"
      > </a
      ><a name="5186" href="Stlc.html#5186" class="Bound"
      >y</a
      ><a name="5187" class="Symbol"
      >}</a
      ><a name="5188"
      > </a
      ><a name="5189" class="Symbol"
      >&#8594;</a
      ><a name="5190"
      > </a
      ><a name="5191" href="Stlc.html#5114" class="InductiveConstructor"
      >id</a
      ><a name="5193"
      > </a
      ><a name="5194" href="Stlc.html#5184" class="Bound"
      >x</a
      ><a name="5195"
      > </a
      ><a name="5196" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="5197"
      > </a
      ><a name="5198" href="Stlc.html#5114" class="InductiveConstructor"
      >id</a
      ><a name="5200"
      > </a
      ><a name="5201" href="Stlc.html#5186" class="Bound"
      >y</a
      ><a name="5202"
      > </a
      ><a name="5203" class="Symbol"
      >&#8594;</a
      ><a name="5204"
      > </a
      ><a name="5205" href="Stlc.html#5184" class="Bound"
      >x</a
      ><a name="5206"
      > </a
      ><a name="5207" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="5208"
      > </a
      ><a name="5209" href="Stlc.html#5186" class="Bound"
      >y</a
      ><a name="5210"
      >
</a
      ><a name="5211" href="Stlc.html#5172" class="Function"
      >id-inj</a
      ><a name="5217"
      > </a
      ><a name="5218" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="5222"
      > </a
      ><a name="5223" class="Symbol"
      >=</a
      ><a name="5224"
      > </a
      ><a name="5225" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="5229"
      >

</a
      ><a name="5231" href="Stlc.html#5231" class="Function Operator"
      >_&#8799;_</a
      ><a name="5234"
      > </a
      ><a name="5235" class="Symbol"
      >:</a
      ><a name="5236"
      > </a
      ><a name="5237" class="Symbol"
      >(</a
      ><a name="5238" href="Stlc.html#5238" class="Bound"
      >x</a
      ><a name="5239"
      > </a
      ><a name="5240" href="Stlc.html#5240" class="Bound"
      >y</a
      ><a name="5241"
      > </a
      ><a name="5242" class="Symbol"
      >:</a
      ><a name="5243"
      > </a
      ><a name="5244" href="Stlc.html#5097" class="Datatype"
      >Id</a
      ><a name="5246" class="Symbol"
      >)</a
      ><a name="5247"
      > </a
      ><a name="5248" class="Symbol"
      >&#8594;</a
      ><a name="5249"
      > </a
      ><a name="5250" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#484" class="Datatype"
      >Dec</a
      ><a name="5253"
      > </a
      ><a name="5254" class="Symbol"
      >(</a
      ><a name="5255" href="Stlc.html#5238" class="Bound"
      >x</a
      ><a name="5256"
      > </a
      ><a name="5257" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="5258"
      > </a
      ><a name="5259" href="Stlc.html#5240" class="Bound"
      >y</a
      ><a name="5260" class="Symbol"
      >)</a
      ><a name="5261"
      >
</a
      ><a name="5262" href="Stlc.html#5114" class="InductiveConstructor"
      >id</a
      ><a name="5264"
      > </a
      ><a name="5265" href="Stlc.html#5265" class="Bound"
      >x</a
      ><a name="5266"
      > </a
      ><a name="5267" href="Stlc.html#5231" class="Function Operator"
      >&#8799;</a
      ><a name="5268"
      > </a
      ><a name="5269" href="Stlc.html#5114" class="InductiveConstructor"
      >id</a
      ><a name="5271"
      > </a
      ><a name="5272" href="Stlc.html#5272" class="Bound"
      >y</a
      ><a name="5273"
      > </a
      ><a name="5274" class="Keyword"
      >with</a
      ><a name="5278"
      > </a
      ><a name="5279" href="Stlc.html#5265" class="Bound"
      >x</a
      ><a name="5280"
      > </a
      ><a name="5281" href="https://agda.github.io/agda-stdlib/Data.Nat.Base.html#3199" class="Function Operator"
      >Data.Nat.&#8799;</a
      ><a name="5291"
      > </a
      ><a name="5292" href="Stlc.html#5272" class="Bound"
      >y</a
      ><a name="5293"
      >
</a
      ><a name="5294" class="Symbol"
      >...</a
      ><a name="5297"
      > </a
      ><a name="5298" class="Symbol"
      >|</a
      ><a name="5299"
      > </a
      ><a name="5300" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="5303"
      > </a
      ><a name="5304" href="Stlc.html#5304" class="Bound"
      >x=y</a
      ><a name="5307"
      > </a
      ><a name="5308" class="Keyword"
      >rewrite</a
      ><a name="5315"
      > </a
      ><a name="5316" href="Stlc.html#5304" class="Bound"
      >x=y</a
      ><a name="5319"
      > </a
      ><a name="5320" class="Symbol"
      >=</a
      ><a name="5321"
      > </a
      ><a name="5322" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="5325"
      > </a
      ><a name="5326" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="5330"
      >
</a
      ><a name="5331" class="Symbol"
      >...</a
      ><a name="5334"
      > </a
      ><a name="5335" class="Symbol"
      >|</a
      ><a name="5336"
      > </a
      ><a name="5337" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="5339"
      >  </a
      ><a name="5341" href="Stlc.html#5341" class="Bound"
      >x&#8800;y</a
      ><a name="5344"
      > </a
      ><a name="5345" class="Symbol"
      >=</a
      ><a name="5346"
      > </a
      ><a name="5347" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="5349"
      > </a
      ><a name="5350" class="Symbol"
      >(</a
      ><a name="5351" href="Stlc.html#5341" class="Bound"
      >x&#8800;y</a
      ><a name="5354"
      > </a
      ><a name="5355" href="https://agda.github.io/agda-stdlib/Function.html#713" class="Function Operator"
      >&#8728;</a
      ><a name="5356"
      > </a
      ><a name="5357" href="Stlc.html#5172" class="Function"
      >id-inj</a
      ><a name="5363" class="Symbol"
      >)</a
      >
{% endraw %}</pre>
</div>

<pre class="Agda">{% raw %}
<a name="5397" class="Keyword"
      >data</a
      ><a name="5401"
      > </a
      ><a name="5402" href="Stlc.html#5402" class="Datatype"
      >Term</a
      ><a name="5406"
      > </a
      ><a name="5407" class="Symbol"
      >:</a
      ><a name="5408"
      > </a
      ><a name="5409" class="PrimitiveType"
      >Set</a
      ><a name="5412"
      > </a
      ><a name="5413" class="Keyword"
      >where</a
      ><a name="5418"
      >
  </a
      ><a name="5421" href="Stlc.html#5421" class="InductiveConstructor"
      >var</a
      ><a name="5424"
      >   </a
      ><a name="5427" class="Symbol"
      >:</a
      ><a name="5428"
      > </a
      ><a name="5429" href="Stlc.html#5097" class="Datatype"
      >Id</a
      ><a name="5431"
      > </a
      ><a name="5432" class="Symbol"
      >&#8594;</a
      ><a name="5433"
      > </a
      ><a name="5434" href="Stlc.html#5402" class="Datatype"
      >Term</a
      ><a name="5438"
      >
  </a
      ><a name="5441" href="Stlc.html#5441" class="InductiveConstructor"
      >app</a
      ><a name="5444"
      >   </a
      ><a name="5447" class="Symbol"
      >:</a
      ><a name="5448"
      > </a
      ><a name="5449" href="Stlc.html#5402" class="Datatype"
      >Term</a
      ><a name="5453"
      > </a
      ><a name="5454" class="Symbol"
      >&#8594;</a
      ><a name="5455"
      > </a
      ><a name="5456" href="Stlc.html#5402" class="Datatype"
      >Term</a
      ><a name="5460"
      > </a
      ><a name="5461" class="Symbol"
      >&#8594;</a
      ><a name="5462"
      > </a
      ><a name="5463" href="Stlc.html#5402" class="Datatype"
      >Term</a
      ><a name="5467"
      >
  </a
      ><a name="5470" href="Stlc.html#5470" class="InductiveConstructor"
      >abs</a
      ><a name="5473"
      >   </a
      ><a name="5476" class="Symbol"
      >:</a
      ><a name="5477"
      > </a
      ><a name="5478" href="Stlc.html#5097" class="Datatype"
      >Id</a
      ><a name="5480"
      > </a
      ><a name="5481" class="Symbol"
      >&#8594;</a
      ><a name="5482"
      > </a
      ><a name="5483" href="Stlc.html#4983" class="Datatype"
      >Type</a
      ><a name="5487"
      > </a
      ><a name="5488" class="Symbol"
      >&#8594;</a
      ><a name="5489"
      > </a
      ><a name="5490" href="Stlc.html#5402" class="Datatype"
      >Term</a
      ><a name="5494"
      > </a
      ><a name="5495" class="Symbol"
      >&#8594;</a
      ><a name="5496"
      > </a
      ><a name="5497" href="Stlc.html#5402" class="Datatype"
      >Term</a
      ><a name="5501"
      >
  </a
      ><a name="5504" href="Stlc.html#5504" class="InductiveConstructor"
      >true</a
      ><a name="5508"
      >  </a
      ><a name="5510" class="Symbol"
      >:</a
      ><a name="5511"
      > </a
      ><a name="5512" href="Stlc.html#5402" class="Datatype"
      >Term</a
      ><a name="5516"
      >
  </a
      ><a name="5519" href="Stlc.html#5519" class="InductiveConstructor"
      >false</a
      ><a name="5524"
      > </a
      ><a name="5525" class="Symbol"
      >:</a
      ><a name="5526"
      > </a
      ><a name="5527" href="Stlc.html#5402" class="Datatype"
      >Term</a
      ><a name="5531"
      >
  </a
      ><a name="5534" href="Stlc.html#5534" class="InductiveConstructor Operator"
      >if_then_else_</a
      ><a name="5547"
      > </a
      ><a name="5548" class="Symbol"
      >:</a
      ><a name="5549"
      > </a
      ><a name="5550" href="Stlc.html#5402" class="Datatype"
      >Term</a
      ><a name="5554"
      > </a
      ><a name="5555" class="Symbol"
      >&#8594;</a
      ><a name="5556"
      > </a
      ><a name="5557" href="Stlc.html#5402" class="Datatype"
      >Term</a
      ><a name="5561"
      > </a
      ><a name="5562" class="Symbol"
      >&#8594;</a
      ><a name="5563"
      > </a
      ><a name="5564" href="Stlc.html#5402" class="Datatype"
      >Term</a
      ><a name="5568"
      > </a
      ><a name="5569" class="Symbol"
      >&#8594;</a
      ><a name="5570"
      > </a
      ><a name="5571" href="Stlc.html#5402" class="Datatype"
      >Term</a
      ><a name="5575"
      >

</a
      ><a name="5577" class="Keyword"
      >infixr</a
      ><a name="5583"
      > </a
      ><a name="5584" class="Number"
      >8</a
      >
{% endraw %}</pre>

Note that an abstraction `λx:A.t` (formally, `abs x A t`) is
always annotated with the type `A` of its parameter, in contrast
to Agda (and other functional languages like ML, Haskell, etc.),
which use _type inference_ to fill in missing annotations.  We're
not considering type inference here.

Some examples...

<pre class="Agda">{% raw %}
<a name="5938" href="Stlc.html#5938" class="Function"
      >x</a
      ><a name="5939"
      > </a
      ><a name="5940" class="Symbol"
      >=</a
      ><a name="5941"
      > </a
      ><a name="5942" href="Stlc.html#5114" class="InductiveConstructor"
      >id</a
      ><a name="5944"
      > </a
      ><a name="5945" class="Number"
      >0</a
      ><a name="5946"
      >
</a
      ><a name="5947" href="Stlc.html#5947" class="Function"
      >y</a
      ><a name="5948"
      > </a
      ><a name="5949" class="Symbol"
      >=</a
      ><a name="5950"
      > </a
      ><a name="5951" href="Stlc.html#5114" class="InductiveConstructor"
      >id</a
      ><a name="5953"
      > </a
      ><a name="5954" class="Number"
      >1</a
      ><a name="5955"
      >
</a
      ><a name="5956" href="Stlc.html#5956" class="Function"
      >z</a
      ><a name="5957"
      > </a
      ><a name="5958" class="Symbol"
      >=</a
      ><a name="5959"
      > </a
      ><a name="5960" href="Stlc.html#5114" class="InductiveConstructor"
      >id</a
      ><a name="5962"
      > </a
      ><a name="5963" class="Number"
      >2</a
      >
{% endraw %}</pre>
<div class="hidden">
<pre class="Agda">{% raw %}
<a name="6010" class="Symbol"
      >{-#</a
      ><a name="6013"
      > </a
      ><a name="6014" class="Keyword"
      >DISPLAY</a
      ><a name="6021"
      > </a
      ><a name="6022" href="Agda.Builtin.Nat.html#87" class="InductiveConstructor"
      >zero</a
      ><a name="6026"
      > = </a
      ><a name="6029" href="Stlc.html#5938" class="Function"
      >x</a
      ><a name="6030"
      > </a
      ><a name="6031" class="Symbol"
      >#-}</a
      ><a name="6034"
      >
</a
      ><a name="6035" class="Symbol"
      >{-#</a
      ><a name="6038"
      > </a
      ><a name="6039" class="Keyword"
      >DISPLAY</a
      ><a name="6046"
      > </a
      ><a name="6047" href="Agda.Builtin.Nat.html#100" class="InductiveConstructor"
      >suc</a
      ><a name="6050"
      > </a
      ><a name="6051" href="Agda.Builtin.Nat.html#87" class="InductiveConstructor"
      >zero</a
      ><a name="6055"
      > = </a
      ><a name="6058" href="Stlc.html#5947" class="Function"
      >y</a
      ><a name="6059"
      > </a
      ><a name="6060" class="Symbol"
      >#-}</a
      ><a name="6063"
      >
</a
      ><a name="6064" class="Symbol"
      >{-#</a
      ><a name="6067"
      > </a
      ><a name="6068" class="Keyword"
      >DISPLAY</a
      ><a name="6075"
      > </a
      ><a name="6076" href="Agda.Builtin.Nat.html#100" class="InductiveConstructor"
      >suc</a
      ><a name="6079"
      > (</a
      ><a name="6081" href="Agda.Builtin.Nat.html#100" class="InductiveConstructor"
      >suc</a
      ><a name="6084"
      > </a
      ><a name="6085" href="Agda.Builtin.Nat.html#87" class="InductiveConstructor"
      >zero</a
      ><a name="6089"
      >) = </a
      ><a name="6093" href="Stlc.html#5956" class="Function"
      >z</a
      ><a name="6094"
      > </a
      ><a name="6095" class="Symbol"
      >#-}</a
      >
{% endraw %}</pre>
</div>

`idB = λx:bool. x`

<pre class="Agda">{% raw %}
<a name="6151" href="Stlc.html#6151" class="Function"
      >idB</a
      ><a name="6154"
      > </a
      ><a name="6155" class="Symbol"
      >=</a
      ><a name="6156"
      > </a
      ><a name="6157" class="Symbol"
      >(</a
      ><a name="6158" href="Stlc.html#5470" class="InductiveConstructor"
      >abs</a
      ><a name="6161"
      > </a
      ><a name="6162" href="Stlc.html#5938" class="Function"
      >x</a
      ><a name="6163"
      > </a
      ><a name="6164" href="Stlc.html#5002" class="InductiveConstructor"
      >bool</a
      ><a name="6168"
      > </a
      ><a name="6169" class="Symbol"
      >(</a
      ><a name="6170" href="Stlc.html#5421" class="InductiveConstructor"
      >var</a
      ><a name="6173"
      > </a
      ><a name="6174" href="Stlc.html#5938" class="Function"
      >x</a
      ><a name="6175" class="Symbol"
      >))</a
      >
{% endraw %}</pre>

`idBB = λx:bool⇒bool. x`

<pre class="Agda">{% raw %}
<a name="6229" href="Stlc.html#6229" class="Function"
      >idBB</a
      ><a name="6233"
      > </a
      ><a name="6234" class="Symbol"
      >=</a
      ><a name="6235"
      > </a
      ><a name="6236" class="Symbol"
      >(</a
      ><a name="6237" href="Stlc.html#5470" class="InductiveConstructor"
      >abs</a
      ><a name="6240"
      > </a
      ><a name="6241" href="Stlc.html#5938" class="Function"
      >x</a
      ><a name="6242"
      > </a
      ><a name="6243" class="Symbol"
      >(</a
      ><a name="6244" href="Stlc.html#5002" class="InductiveConstructor"
      >bool</a
      ><a name="6248"
      > </a
      ><a name="6249" href="Stlc.html#5016" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="6250"
      > </a
      ><a name="6251" href="Stlc.html#5002" class="InductiveConstructor"
      >bool</a
      ><a name="6255" class="Symbol"
      >)</a
      ><a name="6256"
      > </a
      ><a name="6257" class="Symbol"
      >(</a
      ><a name="6258" href="Stlc.html#5421" class="InductiveConstructor"
      >var</a
      ><a name="6261"
      > </a
      ><a name="6262" href="Stlc.html#5938" class="Function"
      >x</a
      ><a name="6263" class="Symbol"
      >))</a
      >
{% endraw %}</pre>

`idBBBB = λx:(bool⇒bool) → (bool⇒bool). x`

<pre class="Agda">{% raw %}
<a name="6335" href="Stlc.html#6335" class="Function"
      >idBBBB</a
      ><a name="6341"
      > </a
      ><a name="6342" class="Symbol"
      >=</a
      ><a name="6343"
      > </a
      ><a name="6344" class="Symbol"
      >(</a
      ><a name="6345" href="Stlc.html#5470" class="InductiveConstructor"
      >abs</a
      ><a name="6348"
      > </a
      ><a name="6349" href="Stlc.html#5938" class="Function"
      >x</a
      ><a name="6350"
      > </a
      ><a name="6351" class="Symbol"
      >((</a
      ><a name="6353" href="Stlc.html#5002" class="InductiveConstructor"
      >bool</a
      ><a name="6357"
      > </a
      ><a name="6358" href="Stlc.html#5016" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="6359"
      > </a
      ><a name="6360" href="Stlc.html#5002" class="InductiveConstructor"
      >bool</a
      ><a name="6364" class="Symbol"
      >)</a
      ><a name="6365"
      > </a
      ><a name="6366" href="Stlc.html#5016" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="6367"
      > </a
      ><a name="6368" class="Symbol"
      >(</a
      ><a name="6369" href="Stlc.html#5002" class="InductiveConstructor"
      >bool</a
      ><a name="6373"
      > </a
      ><a name="6374" href="Stlc.html#5016" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="6375"
      > </a
      ><a name="6376" href="Stlc.html#5002" class="InductiveConstructor"
      >bool</a
      ><a name="6380" class="Symbol"
      >))</a
      ><a name="6382"
      > </a
      ><a name="6383" class="Symbol"
      >(</a
      ><a name="6384" href="Stlc.html#5421" class="InductiveConstructor"
      >var</a
      ><a name="6387"
      > </a
      ><a name="6388" href="Stlc.html#5938" class="Function"
      >x</a
      ><a name="6389" class="Symbol"
      >))</a
      >
{% endraw %}</pre>

`k = λx:bool. λy:bool. x`

<pre class="Agda">{% raw %}
<a name="6444" href="Stlc.html#6444" class="Function"
      >k</a
      ><a name="6445"
      > </a
      ><a name="6446" class="Symbol"
      >=</a
      ><a name="6447"
      > </a
      ><a name="6448" class="Symbol"
      >(</a
      ><a name="6449" href="Stlc.html#5470" class="InductiveConstructor"
      >abs</a
      ><a name="6452"
      > </a
      ><a name="6453" href="Stlc.html#5938" class="Function"
      >x</a
      ><a name="6454"
      > </a
      ><a name="6455" href="Stlc.html#5002" class="InductiveConstructor"
      >bool</a
      ><a name="6459"
      > </a
      ><a name="6460" class="Symbol"
      >(</a
      ><a name="6461" href="Stlc.html#5470" class="InductiveConstructor"
      >abs</a
      ><a name="6464"
      > </a
      ><a name="6465" href="Stlc.html#5947" class="Function"
      >y</a
      ><a name="6466"
      > </a
      ><a name="6467" href="Stlc.html#5002" class="InductiveConstructor"
      >bool</a
      ><a name="6471"
      > </a
      ><a name="6472" class="Symbol"
      >(</a
      ><a name="6473" href="Stlc.html#5421" class="InductiveConstructor"
      >var</a
      ><a name="6476"
      > </a
      ><a name="6477" href="Stlc.html#5938" class="Function"
      >x</a
      ><a name="6478" class="Symbol"
      >)))</a
      >
{% endraw %}</pre>

`notB = λx:bool. if x then false else true`

<pre class="Agda">{% raw %}
<a name="6552" href="Stlc.html#6552" class="Function"
      >notB</a
      ><a name="6556"
      > </a
      ><a name="6557" class="Symbol"
      >=</a
      ><a name="6558"
      > </a
      ><a name="6559" class="Symbol"
      >(</a
      ><a name="6560" href="Stlc.html#5470" class="InductiveConstructor"
      >abs</a
      ><a name="6563"
      > </a
      ><a name="6564" href="Stlc.html#5938" class="Function"
      >x</a
      ><a name="6565"
      > </a
      ><a name="6566" href="Stlc.html#5002" class="InductiveConstructor"
      >bool</a
      ><a name="6570"
      > </a
      ><a name="6571" class="Symbol"
      >(</a
      ><a name="6572" href="Stlc.html#5534" class="InductiveConstructor Operator"
      >if</a
      ><a name="6574"
      > </a
      ><a name="6575" class="Symbol"
      >(</a
      ><a name="6576" href="Stlc.html#5421" class="InductiveConstructor"
      >var</a
      ><a name="6579"
      > </a
      ><a name="6580" href="Stlc.html#5938" class="Function"
      >x</a
      ><a name="6581" class="Symbol"
      >)</a
      ><a name="6582"
      > </a
      ><a name="6583" href="Stlc.html#5534" class="InductiveConstructor Operator"
      >then</a
      ><a name="6587"
      > </a
      ><a name="6588" href="Stlc.html#5519" class="InductiveConstructor"
      >false</a
      ><a name="6593"
      > </a
      ><a name="6594" href="Stlc.html#5534" class="InductiveConstructor Operator"
      >else</a
      ><a name="6598"
      > </a
      ><a name="6599" href="Stlc.html#5504" class="InductiveConstructor"
      >true</a
      ><a name="6603" class="Symbol"
      >))</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="6652" class="Symbol"
      >{-#</a
      ><a name="6655"
      > </a
      ><a name="6656" class="Keyword"
      >DISPLAY</a
      ><a name="6663"
      > </a
      ><a name="6664" href="Stlc.html#5470" class="InductiveConstructor"
      >abs</a
      ><a name="6667"
      > 0 </a
      ><a name="6670" href="Stlc.html#5002" class="InductiveConstructor"
      >bool</a
      ><a name="6674"
      > (</a
      ><a name="6676" href="Stlc.html#5421" class="InductiveConstructor"
      >var</a
      ><a name="6679"
      > 0) = </a
      ><a name="6685" href="Stlc.html#6151" class="Function"
      >idB</a
      ><a name="6688"
      > </a
      ><a name="6689" class="Symbol"
      >#-}</a
      ><a name="6692"
      >
</a
      ><a name="6693" class="Symbol"
      >{-#</a
      ><a name="6696"
      > </a
      ><a name="6697" class="Keyword"
      >DISPLAY</a
      ><a name="6704"
      > </a
      ><a name="6705" href="Stlc.html#5470" class="InductiveConstructor"
      >abs</a
      ><a name="6708"
      > 0 (</a
      ><a name="6712" href="Stlc.html#5002" class="InductiveConstructor"
      >bool</a
      ><a name="6716"
      > </a
      ><a name="6717" href="Stlc.html#5016" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="6718"
      > </a
      ><a name="6719" href="Stlc.html#5002" class="InductiveConstructor"
      >bool</a
      ><a name="6723"
      >) (</a
      ><a name="6726" href="Stlc.html#5421" class="InductiveConstructor"
      >var</a
      ><a name="6729"
      > 0) = </a
      ><a name="6735" href="Stlc.html#6229" class="Function"
      >idBB</a
      ><a name="6739"
      > </a
      ><a name="6740" class="Symbol"
      >#-}</a
      ><a name="6743"
      >
</a
      ><a name="6744" class="Symbol"
      >{-#</a
      ><a name="6747"
      > </a
      ><a name="6748" class="Keyword"
      >DISPLAY</a
      ><a name="6755"
      > </a
      ><a name="6756" href="Stlc.html#5470" class="InductiveConstructor"
      >abs</a
      ><a name="6759"
      > 0 ((</a
      ><a name="6764" href="Stlc.html#5002" class="InductiveConstructor"
      >bool</a
      ><a name="6768"
      > </a
      ><a name="6769" href="Stlc.html#5016" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="6770"
      > </a
      ><a name="6771" href="Stlc.html#5002" class="InductiveConstructor"
      >bool</a
      ><a name="6775"
      >) </a
      ><a name="6777" href="Stlc.html#5016" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="6778"
      > (</a
      ><a name="6780" href="Stlc.html#5002" class="InductiveConstructor"
      >bool</a
      ><a name="6784"
      > </a
      ><a name="6785" href="Stlc.html#5016" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="6786"
      > </a
      ><a name="6787" href="Stlc.html#5002" class="InductiveConstructor"
      >bool</a
      ><a name="6791"
      >)) (</a
      ><a name="6795" href="Stlc.html#5421" class="InductiveConstructor"
      >var</a
      ><a name="6798"
      > 0) = </a
      ><a name="6804" href="Stlc.html#6335" class="Function"
      >idBBBB</a
      ><a name="6810"
      > </a
      ><a name="6811" class="Symbol"
      >#-}</a
      ><a name="6814"
      >
</a
      ><a name="6815" class="Symbol"
      >{-#</a
      ><a name="6818"
      > </a
      ><a name="6819" class="Keyword"
      >DISPLAY</a
      ><a name="6826"
      > </a
      ><a name="6827" href="Stlc.html#5470" class="InductiveConstructor"
      >abs</a
      ><a name="6830"
      > 0 </a
      ><a name="6833" href="Stlc.html#5002" class="InductiveConstructor"
      >bool</a
      ><a name="6837"
      > (</a
      ><a name="6839" href="Stlc.html#5470" class="InductiveConstructor"
      >abs</a
      ><a name="6842"
      > </a
      ><a name="6843" href="Stlc.html#6843" class="Bound"
      >y</a
      ><a name="6844"
      > </a
      ><a name="6845" href="Stlc.html#5002" class="InductiveConstructor"
      >bool</a
      ><a name="6849"
      > (</a
      ><a name="6851" href="Stlc.html#5421" class="InductiveConstructor"
      >var</a
      ><a name="6854"
      > 0)) = </a
      ><a name="6861" href="Stlc.html#6444" class="Function"
      >k</a
      ><a name="6862"
      > </a
      ><a name="6863" class="Symbol"
      >#-}</a
      ><a name="6866"
      >
</a
      ><a name="6867" class="Symbol"
      >{-#</a
      ><a name="6870"
      > </a
      ><a name="6871" class="Keyword"
      >DISPLAY</a
      ><a name="6878"
      > </a
      ><a name="6879" href="Stlc.html#5470" class="InductiveConstructor"
      >abs</a
      ><a name="6882"
      > 0 </a
      ><a name="6885" href="Stlc.html#5002" class="InductiveConstructor"
      >bool</a
      ><a name="6889"
      > (</a
      ><a name="6891" href="Stlc.html#5534" class="InductiveConstructor Operator"
      >if</a
      ><a name="6893"
      > (</a
      ><a name="6895" href="Stlc.html#5421" class="InductiveConstructor"
      >var</a
      ><a name="6898"
      > 0) </a
      ><a name="6902" href="Stlc.html#5534" class="InductiveConstructor Operator"
      >then</a
      ><a name="6906"
      > </a
      ><a name="6907" href="Stlc.html#5519" class="InductiveConstructor"
      >false</a
      ><a name="6912"
      > </a
      ><a name="6913" href="Stlc.html#5534" class="InductiveConstructor Operator"
      >else</a
      ><a name="6917"
      > </a
      ><a name="6918" href="Stlc.html#5504" class="InductiveConstructor"
      >true</a
      ><a name="6922"
      >) = </a
      ><a name="6926" href="Stlc.html#6552" class="Function"
      >notB</a
      ><a name="6930"
      > </a
      ><a name="6931" class="Symbol"
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
clear: `true` and `false` are the only values.  An `if`
expression is never a value.

Second, an application is clearly not a value: It represents a
function being invoked on some argument, which clearly still has
work left to do.

Third, for abstractions, we have a choice:

  - We can say that `λx:T. t1` is a value only when `t1` is a
    value -- i.e., only if the function's body has been
    reduced (as much as it can be without knowing what argument it
    is going to be applied to).

  - Or we can say that `λx:T. t1` is always a value, no matter
    whether `t1` is one or not -- in other words, we can say that
    reduction stops at abstractions.

Agda makes the first choice -- for example,

<pre class="Agda">{% raw %}
<a name="8141" href="Stlc.html#8141" class="Function"
      >testNormalize</a
      ><a name="8154"
      > </a
      ><a name="8155" class="Symbol"
      >:</a
      ><a name="8156"
      > </a
      ><a name="8157" class="Symbol"
      >(&#955;</a
      ><a name="8159"
      > </a
      ><a name="8160" class="Symbol"
      >(</a
      ><a name="8161" href="Stlc.html#8161" class="Bound"
      >x</a
      ><a name="8162"
      > </a
      ><a name="8163" class="Symbol"
      >:</a
      ><a name="8164"
      > </a
      ><a name="8165" href="Agda.Builtin.Nat.html#69" class="Datatype"
      >&#8469;</a
      ><a name="8166" class="Symbol"
      >)</a
      ><a name="8167"
      > </a
      ><a name="8168" class="Symbol"
      >&#8594;</a
      ><a name="8169"
      > </a
      ><a name="8170" class="Number"
      >3</a
      ><a name="8171"
      > </a
      ><a name="8172" href="Agda.Builtin.Nat.html#202" class="Primitive Operator"
      >+</a
      ><a name="8173"
      > </a
      ><a name="8174" class="Number"
      >4</a
      ><a name="8175" class="Symbol"
      >)</a
      ><a name="8176"
      > </a
      ><a name="8177" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="8178"
      > </a
      ><a name="8179" class="Symbol"
      >(&#955;</a
      ><a name="8181"
      > </a
      ><a name="8182" class="Symbol"
      >(</a
      ><a name="8183" href="Stlc.html#8183" class="Bound"
      >x</a
      ><a name="8184"
      > </a
      ><a name="8185" class="Symbol"
      >:</a
      ><a name="8186"
      > </a
      ><a name="8187" href="Agda.Builtin.Nat.html#69" class="Datatype"
      >&#8469;</a
      ><a name="8188" class="Symbol"
      >)</a
      ><a name="8189"
      > </a
      ><a name="8190" class="Symbol"
      >&#8594;</a
      ><a name="8191"
      > </a
      ><a name="8192" class="Number"
      >7</a
      ><a name="8193" class="Symbol"
      >)</a
      ><a name="8194"
      >
</a
      ><a name="8195" href="Stlc.html#8141" class="Function"
      >testNormalize</a
      ><a name="8208"
      > </a
      ><a name="8209" class="Symbol"
      >=</a
      ><a name="8210"
      > </a
      ><a name="8211" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      >
{% endraw %}</pre>

Most real-world functional programming languages make the second
choice -- reduction of a function's body only begins when the
function is actually applied to an argument.  We also make the
second choice here.

<pre class="Agda">{% raw %}
<a name="8452" class="Keyword"
      >data</a
      ><a name="8456"
      > </a
      ><a name="8457" href="Stlc.html#8457" class="Datatype"
      >Value</a
      ><a name="8462"
      > </a
      ><a name="8463" class="Symbol"
      >:</a
      ><a name="8464"
      > </a
      ><a name="8465" href="Stlc.html#5402" class="Datatype"
      >Term</a
      ><a name="8469"
      > </a
      ><a name="8470" class="Symbol"
      >&#8594;</a
      ><a name="8471"
      > </a
      ><a name="8472" class="PrimitiveType"
      >Set</a
      ><a name="8475"
      > </a
      ><a name="8476" class="Keyword"
      >where</a
      ><a name="8481"
      >
  </a
      ><a name="8484" href="Stlc.html#8484" class="InductiveConstructor"
      >abs</a
      ><a name="8487"
      >   </a
      ><a name="8490" class="Symbol"
      >:</a
      ><a name="8491"
      > </a
      ><a name="8492" class="Symbol"
      >forall</a
      ><a name="8498"
      > </a
      ><a name="8499" class="Symbol"
      >{</a
      ><a name="8500" href="Stlc.html#8500" class="Bound"
      >x</a
      ><a name="8501"
      > </a
      ><a name="8502" href="Stlc.html#8502" class="Bound"
      >A</a
      ><a name="8503"
      > </a
      ><a name="8504" href="Stlc.html#8504" class="Bound"
      >t</a
      ><a name="8505" class="Symbol"
      >}</a
      ><a name="8506"
      >
        </a
      ><a name="8515" class="Symbol"
      >&#8594;</a
      ><a name="8516"
      > </a
      ><a name="8517" href="Stlc.html#8457" class="Datatype"
      >Value</a
      ><a name="8522"
      > </a
      ><a name="8523" class="Symbol"
      >(</a
      ><a name="8524" href="Stlc.html#5470" class="InductiveConstructor"
      >abs</a
      ><a name="8527"
      > </a
      ><a name="8528" href="Stlc.html#8500" class="Bound"
      >x</a
      ><a name="8529"
      > </a
      ><a name="8530" href="Stlc.html#8502" class="Bound"
      >A</a
      ><a name="8531"
      > </a
      ><a name="8532" href="Stlc.html#8504" class="Bound"
      >t</a
      ><a name="8533" class="Symbol"
      >)</a
      ><a name="8534"
      >
  </a
      ><a name="8537" href="Stlc.html#8537" class="InductiveConstructor"
      >true</a
      ><a name="8541"
      >  </a
      ><a name="8543" class="Symbol"
      >:</a
      ><a name="8544"
      > </a
      ><a name="8545" href="Stlc.html#8457" class="Datatype"
      >Value</a
      ><a name="8550"
      > </a
      ><a name="8551" href="Stlc.html#5504" class="InductiveConstructor"
      >true</a
      ><a name="8555"
      >
  </a
      ><a name="8558" href="Stlc.html#8558" class="InductiveConstructor"
      >false</a
      ><a name="8563"
      > </a
      ><a name="8564" class="Symbol"
      >:</a
      ><a name="8565"
      > </a
      ><a name="8566" href="Stlc.html#8457" class="Datatype"
      >Value</a
      ><a name="8571"
      > </a
      ><a name="8572" href="Stlc.html#5519" class="InductiveConstructor"
      >false</a
      >
{% endraw %}</pre>

Finally, we must consider what constitutes a _complete_ program.

Intuitively, a "complete program" must not refer to any undefined
variables.  We'll see shortly how to define the _free_ variables
in a STLC term.  A complete program is _closed_ -- that is, it
contains no free variables.

Having made the choice not to reduce under abstractions, we don't
need to worry about whether variables are values, since we'll
always be reducing programs "from the outside in," and that means
the `step` relation will always be working with closed terms.


### Substitution

Now we come to the heart of the STLC: the operation of
substituting one term for a variable in another term.  This
operation is used below to define the operational semantics of
function application, where we will need to substitute the
argument term for the function parameter in the function's body.
For example, we reduce

`(λx:bool. if x then true else x) false`

to

`if false then true else false`

by substituting `false` for the parameter `x` in the body of the
function.

In general, we need to be able to substitute some given term `s`
for occurrences of some variable `x` in another term `t`.  In
informal discussions, this is usually written `[x:=s]t` and
pronounced "substitute `x` with `s` in `t`."

Here are some examples:
  - `[x:=true](if x then x else false)`
     yields `if true then true else false`
  - `[x:=true]x`
    yields `true`
  - `[x:=true](if x then x else y)`
    yields `if true then true else y`
  - `[x:=true]y`
    yields `y`
  - `[x:=true]false`
    yields `false` (vacuous substitution)
  - `[x:=true](λy:bool. if y then x else false)`
    yields `λy:bool. if y then true else false`
  - `[x:=true](λy:bool. x)`
    yields `λy:bool. true`
  - `[x:=true](λy:bool. y)`
    yields `λy:bool. y`
  - `[x:=true](λx:bool. x)`
    yields `λx:bool. x`

The last example is very important: substituting `x` with `true` in
`λx:bool. x` does _not_ yield `λx:bool. true`!  The reason for
this is that the `x` in the body of `λx:bool. x` is _bound_ by the
abstraction: it is a new, local name that just happens to be
spelled the same as some global name `x`.

Here is the definition, informally...

    [x:=s]x         = s
    [x:=s]y         = y                  if x ≢ y
    [x:=s](λx:A. t) = λx:A. t
    [x:=s](λy:A. t) = λy:A. [x:=s]t      if x ≢ y
    [x:=s](t1 t2)   = ([x:=s]t1) ([x:=s]t2)
    [x:=s]true      = true
    [x:=s]false     = false
    [x:=s](if t1 then t2 else t3) =
      if [x:=s]t1 then [x:=s]t2 else [x:=s]t3


... and formally:

<pre class="Agda">{% raw %}
<a name="11147" href="Stlc.html#11147" class="Function Operator"
      >[_:=_]_</a
      ><a name="11154"
      > </a
      ><a name="11155" class="Symbol"
      >:</a
      ><a name="11156"
      > </a
      ><a name="11157" href="Stlc.html#5097" class="Datatype"
      >Id</a
      ><a name="11159"
      > </a
      ><a name="11160" class="Symbol"
      >-&gt;</a
      ><a name="11162"
      > </a
      ><a name="11163" href="Stlc.html#5402" class="Datatype"
      >Term</a
      ><a name="11167"
      > </a
      ><a name="11168" class="Symbol"
      >-&gt;</a
      ><a name="11170"
      > </a
      ><a name="11171" href="Stlc.html#5402" class="Datatype"
      >Term</a
      ><a name="11175"
      > </a
      ><a name="11176" class="Symbol"
      >-&gt;</a
      ><a name="11178"
      > </a
      ><a name="11179" href="Stlc.html#5402" class="Datatype"
      >Term</a
      ><a name="11183"
      >
</a
      ><a name="11184" href="Stlc.html#11147" class="Function Operator"
      >[</a
      ><a name="11185"
      > </a
      ><a name="11186" href="Stlc.html#11186" class="Bound"
      >x</a
      ><a name="11187"
      > </a
      ><a name="11188" href="Stlc.html#11147" class="Function Operator"
      >:=</a
      ><a name="11190"
      > </a
      ><a name="11191" href="Stlc.html#11191" class="Bound"
      >v</a
      ><a name="11192"
      > </a
      ><a name="11193" href="Stlc.html#11147" class="Function Operator"
      >]</a
      ><a name="11194"
      > </a
      ><a name="11195" class="Symbol"
      >(</a
      ><a name="11196" href="Stlc.html#5421" class="InductiveConstructor"
      >var</a
      ><a name="11199"
      > </a
      ><a name="11200" href="Stlc.html#11200" class="Bound"
      >y</a
      ><a name="11201" class="Symbol"
      >)</a
      ><a name="11202"
      > </a
      ><a name="11203" class="Keyword"
      >with</a
      ><a name="11207"
      > </a
      ><a name="11208" href="Stlc.html#11186" class="Bound"
      >x</a
      ><a name="11209"
      > </a
      ><a name="11210" href="Stlc.html#5231" class="Function Operator"
      >&#8799;</a
      ><a name="11211"
      > </a
      ><a name="11212" href="Stlc.html#11200" class="Bound"
      >y</a
      ><a name="11213"
      >
</a
      ><a name="11214" class="Symbol"
      >...</a
      ><a name="11217"
      > </a
      ><a name="11218" class="Symbol"
      >|</a
      ><a name="11219"
      > </a
      ><a name="11220" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="11223"
      > </a
      ><a name="11224" href="Stlc.html#11224" class="Bound"
      >x=y</a
      ><a name="11227"
      > </a
      ><a name="11228" class="Symbol"
      >=</a
      ><a name="11229"
      > </a
      ><a name="11230" href="Stlc.html#11191" class="Bound"
      >v</a
      ><a name="11231"
      >
</a
      ><a name="11232" class="Symbol"
      >...</a
      ><a name="11235"
      > </a
      ><a name="11236" class="Symbol"
      >|</a
      ><a name="11237"
      > </a
      ><a name="11238" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="11240"
      >  </a
      ><a name="11242" href="Stlc.html#11242" class="Bound"
      >x&#8800;y</a
      ><a name="11245"
      > </a
      ><a name="11246" class="Symbol"
      >=</a
      ><a name="11247"
      > </a
      ><a name="11248" href="Stlc.html#5421" class="InductiveConstructor"
      >var</a
      ><a name="11251"
      > </a
      ><a name="11252" href="Stlc.html#11200" class="Bound"
      >y</a
      ><a name="11253"
      >
</a
      ><a name="11254" href="Stlc.html#11147" class="Function Operator"
      >[</a
      ><a name="11255"
      > </a
      ><a name="11256" href="Stlc.html#11256" class="Bound"
      >x</a
      ><a name="11257"
      > </a
      ><a name="11258" href="Stlc.html#11147" class="Function Operator"
      >:=</a
      ><a name="11260"
      > </a
      ><a name="11261" href="Stlc.html#11261" class="Bound"
      >v</a
      ><a name="11262"
      > </a
      ><a name="11263" href="Stlc.html#11147" class="Function Operator"
      >]</a
      ><a name="11264"
      > </a
      ><a name="11265" class="Symbol"
      >(</a
      ><a name="11266" href="Stlc.html#5441" class="InductiveConstructor"
      >app</a
      ><a name="11269"
      > </a
      ><a name="11270" href="Stlc.html#11270" class="Bound"
      >s</a
      ><a name="11271"
      > </a
      ><a name="11272" href="Stlc.html#11272" class="Bound"
      >t</a
      ><a name="11273" class="Symbol"
      >)</a
      ><a name="11274"
      > </a
      ><a name="11275" class="Symbol"
      >=</a
      ><a name="11276"
      > </a
      ><a name="11277" href="Stlc.html#5441" class="InductiveConstructor"
      >app</a
      ><a name="11280"
      > </a
      ><a name="11281" class="Symbol"
      >(</a
      ><a name="11282" href="Stlc.html#11147" class="Function Operator"
      >[</a
      ><a name="11283"
      > </a
      ><a name="11284" href="Stlc.html#11256" class="Bound"
      >x</a
      ><a name="11285"
      > </a
      ><a name="11286" href="Stlc.html#11147" class="Function Operator"
      >:=</a
      ><a name="11288"
      > </a
      ><a name="11289" href="Stlc.html#11261" class="Bound"
      >v</a
      ><a name="11290"
      > </a
      ><a name="11291" href="Stlc.html#11147" class="Function Operator"
      >]</a
      ><a name="11292"
      > </a
      ><a name="11293" href="Stlc.html#11270" class="Bound"
      >s</a
      ><a name="11294" class="Symbol"
      >)</a
      ><a name="11295"
      > </a
      ><a name="11296" class="Symbol"
      >(</a
      ><a name="11297" href="Stlc.html#11147" class="Function Operator"
      >[</a
      ><a name="11298"
      > </a
      ><a name="11299" href="Stlc.html#11256" class="Bound"
      >x</a
      ><a name="11300"
      > </a
      ><a name="11301" href="Stlc.html#11147" class="Function Operator"
      >:=</a
      ><a name="11303"
      > </a
      ><a name="11304" href="Stlc.html#11261" class="Bound"
      >v</a
      ><a name="11305"
      > </a
      ><a name="11306" href="Stlc.html#11147" class="Function Operator"
      >]</a
      ><a name="11307"
      > </a
      ><a name="11308" href="Stlc.html#11272" class="Bound"
      >t</a
      ><a name="11309" class="Symbol"
      >)</a
      ><a name="11310"
      >
</a
      ><a name="11311" href="Stlc.html#11147" class="Function Operator"
      >[</a
      ><a name="11312"
      > </a
      ><a name="11313" href="Stlc.html#11313" class="Bound"
      >x</a
      ><a name="11314"
      > </a
      ><a name="11315" href="Stlc.html#11147" class="Function Operator"
      >:=</a
      ><a name="11317"
      > </a
      ><a name="11318" href="Stlc.html#11318" class="Bound"
      >v</a
      ><a name="11319"
      > </a
      ><a name="11320" href="Stlc.html#11147" class="Function Operator"
      >]</a
      ><a name="11321"
      > </a
      ><a name="11322" class="Symbol"
      >(</a
      ><a name="11323" href="Stlc.html#5470" class="InductiveConstructor"
      >abs</a
      ><a name="11326"
      > </a
      ><a name="11327" href="Stlc.html#11327" class="Bound"
      >y</a
      ><a name="11328"
      > </a
      ><a name="11329" href="Stlc.html#11329" class="Bound"
      >A</a
      ><a name="11330"
      > </a
      ><a name="11331" href="Stlc.html#11331" class="Bound"
      >t</a
      ><a name="11332" class="Symbol"
      >)</a
      ><a name="11333"
      > </a
      ><a name="11334" class="Keyword"
      >with</a
      ><a name="11338"
      > </a
      ><a name="11339" href="Stlc.html#11313" class="Bound"
      >x</a
      ><a name="11340"
      > </a
      ><a name="11341" href="Stlc.html#5231" class="Function Operator"
      >&#8799;</a
      ><a name="11342"
      > </a
      ><a name="11343" href="Stlc.html#11327" class="Bound"
      >y</a
      ><a name="11344"
      >
</a
      ><a name="11345" class="Symbol"
      >...</a
      ><a name="11348"
      > </a
      ><a name="11349" class="Symbol"
      >|</a
      ><a name="11350"
      > </a
      ><a name="11351" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="11354"
      > </a
      ><a name="11355" href="Stlc.html#11355" class="Bound"
      >x=y</a
      ><a name="11358"
      > </a
      ><a name="11359" class="Symbol"
      >=</a
      ><a name="11360"
      > </a
      ><a name="11361" href="Stlc.html#5470" class="InductiveConstructor"
      >abs</a
      ><a name="11364"
      > </a
      ><a name="11365" href="Stlc.html#11327" class="Bound"
      >y</a
      ><a name="11366"
      > </a
      ><a name="11367" href="Stlc.html#11329" class="Bound"
      >A</a
      ><a name="11368"
      > </a
      ><a name="11369" href="Stlc.html#11331" class="Bound"
      >t</a
      ><a name="11370"
      >
</a
      ><a name="11371" class="Symbol"
      >...</a
      ><a name="11374"
      > </a
      ><a name="11375" class="Symbol"
      >|</a
      ><a name="11376"
      > </a
      ><a name="11377" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="11379"
      >  </a
      ><a name="11381" href="Stlc.html#11381" class="Bound"
      >x&#8800;y</a
      ><a name="11384"
      > </a
      ><a name="11385" class="Symbol"
      >=</a
      ><a name="11386"
      > </a
      ><a name="11387" href="Stlc.html#5470" class="InductiveConstructor"
      >abs</a
      ><a name="11390"
      > </a
      ><a name="11391" href="Stlc.html#11327" class="Bound"
      >y</a
      ><a name="11392"
      > </a
      ><a name="11393" href="Stlc.html#11329" class="Bound"
      >A</a
      ><a name="11394"
      > </a
      ><a name="11395" class="Symbol"
      >(</a
      ><a name="11396" href="Stlc.html#11147" class="Function Operator"
      >[</a
      ><a name="11397"
      > </a
      ><a name="11398" href="Stlc.html#11313" class="Bound"
      >x</a
      ><a name="11399"
      > </a
      ><a name="11400" href="Stlc.html#11147" class="Function Operator"
      >:=</a
      ><a name="11402"
      > </a
      ><a name="11403" href="Stlc.html#11318" class="Bound"
      >v</a
      ><a name="11404"
      > </a
      ><a name="11405" href="Stlc.html#11147" class="Function Operator"
      >]</a
      ><a name="11406"
      > </a
      ><a name="11407" href="Stlc.html#11331" class="Bound"
      >t</a
      ><a name="11408" class="Symbol"
      >)</a
      ><a name="11409"
      >
</a
      ><a name="11410" href="Stlc.html#11147" class="Function Operator"
      >[</a
      ><a name="11411"
      > </a
      ><a name="11412" href="Stlc.html#11412" class="Bound"
      >x</a
      ><a name="11413"
      > </a
      ><a name="11414" href="Stlc.html#11147" class="Function Operator"
      >:=</a
      ><a name="11416"
      > </a
      ><a name="11417" href="Stlc.html#11417" class="Bound"
      >v</a
      ><a name="11418"
      > </a
      ><a name="11419" href="Stlc.html#11147" class="Function Operator"
      >]</a
      ><a name="11420"
      > </a
      ><a name="11421" href="Stlc.html#5504" class="InductiveConstructor"
      >true</a
      ><a name="11425"
      >  </a
      ><a name="11427" class="Symbol"
      >=</a
      ><a name="11428"
      > </a
      ><a name="11429" href="Stlc.html#5504" class="InductiveConstructor"
      >true</a
      ><a name="11433"
      >
</a
      ><a name="11434" href="Stlc.html#11147" class="Function Operator"
      >[</a
      ><a name="11435"
      > </a
      ><a name="11436" href="Stlc.html#11436" class="Bound"
      >x</a
      ><a name="11437"
      > </a
      ><a name="11438" href="Stlc.html#11147" class="Function Operator"
      >:=</a
      ><a name="11440"
      > </a
      ><a name="11441" href="Stlc.html#11441" class="Bound"
      >v</a
      ><a name="11442"
      > </a
      ><a name="11443" href="Stlc.html#11147" class="Function Operator"
      >]</a
      ><a name="11444"
      > </a
      ><a name="11445" href="Stlc.html#5519" class="InductiveConstructor"
      >false</a
      ><a name="11450"
      > </a
      ><a name="11451" class="Symbol"
      >=</a
      ><a name="11452"
      > </a
      ><a name="11453" href="Stlc.html#5519" class="InductiveConstructor"
      >false</a
      ><a name="11458"
      >
</a
      ><a name="11459" href="Stlc.html#11147" class="Function Operator"
      >[</a
      ><a name="11460"
      > </a
      ><a name="11461" href="Stlc.html#11461" class="Bound"
      >x</a
      ><a name="11462"
      > </a
      ><a name="11463" href="Stlc.html#11147" class="Function Operator"
      >:=</a
      ><a name="11465"
      > </a
      ><a name="11466" href="Stlc.html#11466" class="Bound"
      >v</a
      ><a name="11467"
      > </a
      ><a name="11468" href="Stlc.html#11147" class="Function Operator"
      >]</a
      ><a name="11469"
      > </a
      ><a name="11470" class="Symbol"
      >(</a
      ><a name="11471" href="Stlc.html#5534" class="InductiveConstructor Operator"
      >if</a
      ><a name="11473"
      > </a
      ><a name="11474" href="Stlc.html#11474" class="Bound"
      >s</a
      ><a name="11475"
      > </a
      ><a name="11476" href="Stlc.html#5534" class="InductiveConstructor Operator"
      >then</a
      ><a name="11480"
      > </a
      ><a name="11481" href="Stlc.html#11481" class="Bound"
      >t</a
      ><a name="11482"
      > </a
      ><a name="11483" href="Stlc.html#5534" class="InductiveConstructor Operator"
      >else</a
      ><a name="11487"
      > </a
      ><a name="11488" href="Stlc.html#11488" class="Bound"
      >u</a
      ><a name="11489" class="Symbol"
      >)</a
      ><a name="11490"
      > </a
      ><a name="11491" class="Symbol"
      >=</a
      ><a name="11492"
      >
  </a
      ><a name="11495" href="Stlc.html#5534" class="InductiveConstructor Operator"
      >if</a
      ><a name="11497"
      > </a
      ><a name="11498" href="Stlc.html#11147" class="Function Operator"
      >[</a
      ><a name="11499"
      > </a
      ><a name="11500" href="Stlc.html#11461" class="Bound"
      >x</a
      ><a name="11501"
      > </a
      ><a name="11502" href="Stlc.html#11147" class="Function Operator"
      >:=</a
      ><a name="11504"
      > </a
      ><a name="11505" href="Stlc.html#11466" class="Bound"
      >v</a
      ><a name="11506"
      > </a
      ><a name="11507" href="Stlc.html#11147" class="Function Operator"
      >]</a
      ><a name="11508"
      > </a
      ><a name="11509" href="Stlc.html#11474" class="Bound"
      >s</a
      ><a name="11510"
      > </a
      ><a name="11511" href="Stlc.html#5534" class="InductiveConstructor Operator"
      >then</a
      ><a name="11515"
      > </a
      ><a name="11516" href="Stlc.html#11147" class="Function Operator"
      >[</a
      ><a name="11517"
      > </a
      ><a name="11518" href="Stlc.html#11461" class="Bound"
      >x</a
      ><a name="11519"
      > </a
      ><a name="11520" href="Stlc.html#11147" class="Function Operator"
      >:=</a
      ><a name="11522"
      > </a
      ><a name="11523" href="Stlc.html#11466" class="Bound"
      >v</a
      ><a name="11524"
      > </a
      ><a name="11525" href="Stlc.html#11147" class="Function Operator"
      >]</a
      ><a name="11526"
      > </a
      ><a name="11527" href="Stlc.html#11481" class="Bound"
      >t</a
      ><a name="11528"
      > </a
      ><a name="11529" href="Stlc.html#5534" class="InductiveConstructor Operator"
      >else</a
      ><a name="11533"
      >  </a
      ><a name="11535" href="Stlc.html#11147" class="Function Operator"
      >[</a
      ><a name="11536"
      > </a
      ><a name="11537" href="Stlc.html#11461" class="Bound"
      >x</a
      ><a name="11538"
      > </a
      ><a name="11539" href="Stlc.html#11147" class="Function Operator"
      >:=</a
      ><a name="11541"
      > </a
      ><a name="11542" href="Stlc.html#11466" class="Bound"
      >v</a
      ><a name="11543"
      > </a
      ><a name="11544" href="Stlc.html#11147" class="Function Operator"
      >]</a
      ><a name="11545"
      > </a
      ><a name="11546" href="Stlc.html#11488" class="Bound"
      >u</a
      ><a name="11547"
      >

</a
      ><a name="11549" class="Keyword"
      >infix</a
      ><a name="11554"
      > </a
      ><a name="11555" class="Number"
      >9</a
      >
{% endraw %}</pre>

_Technical note_: Substitution becomes trickier to define if we
consider the case where `s`, the term being substituted for a
variable in some other term, may itself contain free variables.
Since we are only interested here in defining the `step` relation
on closed terms (i.e., terms like `λx:bool. x` that include
binders for all of the variables they mention), we can avoid this
extra complexity here, but it must be dealt with when formalizing
richer languages.


#### Exercise: 3 stars (substi)
The definition that we gave above defines substitution as a _function_.
Suppose, instead, we wanted to define substitution as an inductive _relation_.
We've begun the definition by providing the `data` header and
one of the constructors; your job is to fill in the rest of the
constructors and prove that the relation you\begin
              → [ x := s ] t ≡ t'
              → [ x := s ] t ==> t'
subst-correct s x t t' p = {!!} -- FILL IN HERE
\end{code}


### Reduction

The small-step reduction relation for STLC now follows the
same pattern as the ones we have seen before.  Intuitively, to
reduce a function application, we first reduce its left-hand
side (the function) until it becomes an abstraction; then we
reduce its right-hand side (the argument) until it is also a
value; and finally we substitute the argument for the bound
variable in the body of the abstraction.  This last rule, written
informally as

`(λx:T.t12) v2 ==> [x:=v2]t12`

is traditionally called "beta-reduction".

    value v2
    ----------------------------                         (red)
    (λx:T.t12) v2 ==> [x:=v2]t12

    t1 ==> t1'
    ----------------                                     (app1)
    t1 t2 ==> t1' t2

    value v1
    t2 ==> t2'
    ----------------                                     (app2)
    v1 t2 ==> v1 t2'

... plus the usual rules for booleans:

    --------------------------------                     (iftrue)
    (if true then t1 else t2) ==> t1

    ---------------------------------                    (iffalse)
    (if false then t1 else t2) ==> t2

    t1 ==> t1'
    ---------------------------------------------------- (if)
    (if t1 then t2 else t3) ==> (if t1' then t2 else t3)


Formally:

<pre class="Agda">{% raw %}
<a name="13807" class="Keyword"
      >data</a
      ><a name="13811"
      > </a
      ><a name="13812" href="Stlc.html#13812" class="Datatype Operator"
      >_==&gt;_</a
      ><a name="13817"
      > </a
      ><a name="13818" class="Symbol"
      >:</a
      ><a name="13819"
      > </a
      ><a name="13820" href="Stlc.html#5402" class="Datatype"
      >Term</a
      ><a name="13824"
      > </a
      ><a name="13825" class="Symbol"
      >&#8594;</a
      ><a name="13826"
      > </a
      ><a name="13827" href="Stlc.html#5402" class="Datatype"
      >Term</a
      ><a name="13831"
      > </a
      ><a name="13832" class="Symbol"
      >&#8594;</a
      ><a name="13833"
      > </a
      ><a name="13834" class="PrimitiveType"
      >Set</a
      ><a name="13837"
      > </a
      ><a name="13838" class="Keyword"
      >where</a
      ><a name="13843"
      >
  </a
      ><a name="13846" href="Stlc.html#13846" class="InductiveConstructor"
      >red</a
      ><a name="13849"
      >     </a
      ><a name="13854" class="Symbol"
      >:</a
      ><a name="13855"
      > </a
      ><a name="13856" class="Symbol"
      >forall</a
      ><a name="13862"
      > </a
      ><a name="13863" class="Symbol"
      >{</a
      ><a name="13864" href="Stlc.html#13864" class="Bound"
      >x</a
      ><a name="13865"
      > </a
      ><a name="13866" href="Stlc.html#13866" class="Bound"
      >A</a
      ><a name="13867"
      > </a
      ><a name="13868" href="Stlc.html#13868" class="Bound"
      >s</a
      ><a name="13869"
      > </a
      ><a name="13870" href="Stlc.html#13870" class="Bound"
      >t</a
      ><a name="13871" class="Symbol"
      >}</a
      ><a name="13872"
      >
          </a
      ><a name="13883" class="Symbol"
      >&#8594;</a
      ><a name="13884"
      > </a
      ><a name="13885" href="Stlc.html#8457" class="Datatype"
      >Value</a
      ><a name="13890"
      > </a
      ><a name="13891" href="Stlc.html#13870" class="Bound"
      >t</a
      ><a name="13892"
      >
          </a
      ><a name="13903" class="Symbol"
      >&#8594;</a
      ><a name="13904"
      > </a
      ><a name="13905" href="Stlc.html#5441" class="InductiveConstructor"
      >app</a
      ><a name="13908"
      > </a
      ><a name="13909" class="Symbol"
      >(</a
      ><a name="13910" href="Stlc.html#5470" class="InductiveConstructor"
      >abs</a
      ><a name="13913"
      > </a
      ><a name="13914" href="Stlc.html#13864" class="Bound"
      >x</a
      ><a name="13915"
      > </a
      ><a name="13916" href="Stlc.html#13866" class="Bound"
      >A</a
      ><a name="13917"
      > </a
      ><a name="13918" href="Stlc.html#13868" class="Bound"
      >s</a
      ><a name="13919" class="Symbol"
      >)</a
      ><a name="13920"
      > </a
      ><a name="13921" href="Stlc.html#13870" class="Bound"
      >t</a
      ><a name="13922"
      > </a
      ><a name="13923" href="Stlc.html#13812" class="Datatype Operator"
      >==&gt;</a
      ><a name="13926"
      > </a
      ><a name="13927" href="Stlc.html#11147" class="Function Operator"
      >[</a
      ><a name="13928"
      > </a
      ><a name="13929" href="Stlc.html#13864" class="Bound"
      >x</a
      ><a name="13930"
      > </a
      ><a name="13931" href="Stlc.html#11147" class="Function Operator"
      >:=</a
      ><a name="13933"
      > </a
      ><a name="13934" href="Stlc.html#13870" class="Bound"
      >t</a
      ><a name="13935"
      > </a
      ><a name="13936" href="Stlc.html#11147" class="Function Operator"
      >]</a
      ><a name="13937"
      > </a
      ><a name="13938" href="Stlc.html#13868" class="Bound"
      >s</a
      ><a name="13939"
      >
  </a
      ><a name="13942" href="Stlc.html#13942" class="InductiveConstructor"
      >app1</a
      ><a name="13946"
      >    </a
      ><a name="13950" class="Symbol"
      >:</a
      ><a name="13951"
      > </a
      ><a name="13952" class="Symbol"
      >forall</a
      ><a name="13958"
      > </a
      ><a name="13959" class="Symbol"
      >{</a
      ><a name="13960" href="Stlc.html#13960" class="Bound"
      >s</a
      ><a name="13961"
      > </a
      ><a name="13962" href="Stlc.html#13962" class="Bound"
      >s'</a
      ><a name="13964"
      > </a
      ><a name="13965" href="Stlc.html#13965" class="Bound"
      >t</a
      ><a name="13966" class="Symbol"
      >}</a
      ><a name="13967"
      >
          </a
      ><a name="13978" class="Symbol"
      >&#8594;</a
      ><a name="13979"
      > </a
      ><a name="13980" href="Stlc.html#13960" class="Bound"
      >s</a
      ><a name="13981"
      > </a
      ><a name="13982" href="Stlc.html#13812" class="Datatype Operator"
      >==&gt;</a
      ><a name="13985"
      > </a
      ><a name="13986" href="Stlc.html#13962" class="Bound"
      >s'</a
      ><a name="13988"
      >
          </a
      ><a name="13999" class="Symbol"
      >&#8594;</a
      ><a name="14000"
      > </a
      ><a name="14001" href="Stlc.html#5441" class="InductiveConstructor"
      >app</a
      ><a name="14004"
      > </a
      ><a name="14005" href="Stlc.html#13960" class="Bound"
      >s</a
      ><a name="14006"
      > </a
      ><a name="14007" href="Stlc.html#13965" class="Bound"
      >t</a
      ><a name="14008"
      > </a
      ><a name="14009" href="Stlc.html#13812" class="Datatype Operator"
      >==&gt;</a
      ><a name="14012"
      > </a
      ><a name="14013" href="Stlc.html#5441" class="InductiveConstructor"
      >app</a
      ><a name="14016"
      > </a
      ><a name="14017" href="Stlc.html#13962" class="Bound"
      >s'</a
      ><a name="14019"
      > </a
      ><a name="14020" href="Stlc.html#13965" class="Bound"
      >t</a
      ><a name="14021"
      >
  </a
      ><a name="14024" href="Stlc.html#14024" class="InductiveConstructor"
      >app2</a
      ><a name="14028"
      >    </a
      ><a name="14032" class="Symbol"
      >:</a
      ><a name="14033"
      > </a
      ><a name="14034" class="Symbol"
      >forall</a
      ><a name="14040"
      > </a
      ><a name="14041" class="Symbol"
      >{</a
      ><a name="14042" href="Stlc.html#14042" class="Bound"
      >s</a
      ><a name="14043"
      > </a
      ><a name="14044" href="Stlc.html#14044" class="Bound"
      >t</a
      ><a name="14045"
      > </a
      ><a name="14046" href="Stlc.html#14046" class="Bound"
      >t'</a
      ><a name="14048" class="Symbol"
      >}</a
      ><a name="14049"
      >
          </a
      ><a name="14060" class="Symbol"
      >&#8594;</a
      ><a name="14061"
      > </a
      ><a name="14062" href="Stlc.html#8457" class="Datatype"
      >Value</a
      ><a name="14067"
      > </a
      ><a name="14068" href="Stlc.html#14042" class="Bound"
      >s</a
      ><a name="14069"
      >
          </a
      ><a name="14080" class="Symbol"
      >&#8594;</a
      ><a name="14081"
      > </a
      ><a name="14082" href="Stlc.html#14044" class="Bound"
      >t</a
      ><a name="14083"
      > </a
      ><a name="14084" href="Stlc.html#13812" class="Datatype Operator"
      >==&gt;</a
      ><a name="14087"
      > </a
      ><a name="14088" href="Stlc.html#14046" class="Bound"
      >t'</a
      ><a name="14090"
      >
          </a
      ><a name="14101" class="Symbol"
      >&#8594;</a
      ><a name="14102"
      > </a
      ><a name="14103" href="Stlc.html#5441" class="InductiveConstructor"
      >app</a
      ><a name="14106"
      > </a
      ><a name="14107" href="Stlc.html#14042" class="Bound"
      >s</a
      ><a name="14108"
      > </a
      ><a name="14109" href="Stlc.html#14044" class="Bound"
      >t</a
      ><a name="14110"
      > </a
      ><a name="14111" href="Stlc.html#13812" class="Datatype Operator"
      >==&gt;</a
      ><a name="14114"
      > </a
      ><a name="14115" href="Stlc.html#5441" class="InductiveConstructor"
      >app</a
      ><a name="14118"
      > </a
      ><a name="14119" href="Stlc.html#14042" class="Bound"
      >s</a
      ><a name="14120"
      > </a
      ><a name="14121" href="Stlc.html#14046" class="Bound"
      >t'</a
      ><a name="14123"
      >
  </a
      ><a name="14126" href="Stlc.html#14126" class="InductiveConstructor"
      >if</a
      ><a name="14128"
      >      </a
      ><a name="14134" class="Symbol"
      >:</a
      ><a name="14135"
      > </a
      ><a name="14136" class="Symbol"
      >forall</a
      ><a name="14142"
      > </a
      ><a name="14143" class="Symbol"
      >{</a
      ><a name="14144" href="Stlc.html#14144" class="Bound"
      >s</a
      ><a name="14145"
      > </a
      ><a name="14146" href="Stlc.html#14146" class="Bound"
      >s'</a
      ><a name="14148"
      > </a
      ><a name="14149" href="Stlc.html#14149" class="Bound"
      >t</a
      ><a name="14150"
      > </a
      ><a name="14151" href="Stlc.html#14151" class="Bound"
      >u</a
      ><a name="14152" class="Symbol"
      >}</a
      ><a name="14153"
      >
          </a
      ><a name="14164" class="Symbol"
      >&#8594;</a
      ><a name="14165"
      > </a
      ><a name="14166" href="Stlc.html#14144" class="Bound"
      >s</a
      ><a name="14167"
      > </a
      ><a name="14168" href="Stlc.html#13812" class="Datatype Operator"
      >==&gt;</a
      ><a name="14171"
      > </a
      ><a name="14172" href="Stlc.html#14146" class="Bound"
      >s'</a
      ><a name="14174"
      >
          </a
      ><a name="14185" class="Symbol"
      >&#8594;</a
      ><a name="14186"
      > </a
      ><a name="14187" href="Stlc.html#5534" class="InductiveConstructor Operator"
      >if</a
      ><a name="14189"
      > </a
      ><a name="14190" href="Stlc.html#14144" class="Bound"
      >s</a
      ><a name="14191"
      > </a
      ><a name="14192" href="Stlc.html#5534" class="InductiveConstructor Operator"
      >then</a
      ><a name="14196"
      > </a
      ><a name="14197" href="Stlc.html#14149" class="Bound"
      >t</a
      ><a name="14198"
      > </a
      ><a name="14199" href="Stlc.html#5534" class="InductiveConstructor Operator"
      >else</a
      ><a name="14203"
      > </a
      ><a name="14204" href="Stlc.html#14151" class="Bound"
      >u</a
      ><a name="14205"
      > </a
      ><a name="14206" href="Stlc.html#13812" class="Datatype Operator"
      >==&gt;</a
      ><a name="14209"
      > </a
      ><a name="14210" href="Stlc.html#5534" class="InductiveConstructor Operator"
      >if</a
      ><a name="14212"
      > </a
      ><a name="14213" href="Stlc.html#14146" class="Bound"
      >s'</a
      ><a name="14215"
      > </a
      ><a name="14216" href="Stlc.html#5534" class="InductiveConstructor Operator"
      >then</a
      ><a name="14220"
      > </a
      ><a name="14221" href="Stlc.html#14149" class="Bound"
      >t</a
      ><a name="14222"
      > </a
      ><a name="14223" href="Stlc.html#5534" class="InductiveConstructor Operator"
      >else</a
      ><a name="14227"
      > </a
      ><a name="14228" href="Stlc.html#14151" class="Bound"
      >u</a
      ><a name="14229"
      >
  </a
      ><a name="14232" href="Stlc.html#14232" class="InductiveConstructor"
      >iftrue</a
      ><a name="14238"
      >  </a
      ><a name="14240" class="Symbol"
      >:</a
      ><a name="14241"
      > </a
      ><a name="14242" class="Symbol"
      >forall</a
      ><a name="14248"
      > </a
      ><a name="14249" class="Symbol"
      >{</a
      ><a name="14250" href="Stlc.html#14250" class="Bound"
      >s</a
      ><a name="14251"
      > </a
      ><a name="14252" href="Stlc.html#14252" class="Bound"
      >t</a
      ><a name="14253" class="Symbol"
      >}</a
      ><a name="14254"
      >
          </a
      ><a name="14265" class="Symbol"
      >&#8594;</a
      ><a name="14266"
      > </a
      ><a name="14267" href="Stlc.html#5534" class="InductiveConstructor Operator"
      >if</a
      ><a name="14269"
      > </a
      ><a name="14270" href="Stlc.html#5504" class="InductiveConstructor"
      >true</a
      ><a name="14274"
      > </a
      ><a name="14275" href="Stlc.html#5534" class="InductiveConstructor Operator"
      >then</a
      ><a name="14279"
      > </a
      ><a name="14280" href="Stlc.html#14250" class="Bound"
      >s</a
      ><a name="14281"
      > </a
      ><a name="14282" href="Stlc.html#5534" class="InductiveConstructor Operator"
      >else</a
      ><a name="14286"
      > </a
      ><a name="14287" href="Stlc.html#14252" class="Bound"
      >t</a
      ><a name="14288"
      > </a
      ><a name="14289" href="Stlc.html#13812" class="Datatype Operator"
      >==&gt;</a
      ><a name="14292"
      > </a
      ><a name="14293" href="Stlc.html#14250" class="Bound"
      >s</a
      ><a name="14294"
      >
  </a
      ><a name="14297" href="Stlc.html#14297" class="InductiveConstructor"
      >iffalse</a
      ><a name="14304"
      > </a
      ><a name="14305" class="Symbol"
      >:</a
      ><a name="14306"
      > </a
      ><a name="14307" class="Symbol"
      >forall</a
      ><a name="14313"
      > </a
      ><a name="14314" class="Symbol"
      >{</a
      ><a name="14315" href="Stlc.html#14315" class="Bound"
      >s</a
      ><a name="14316"
      > </a
      ><a name="14317" href="Stlc.html#14317" class="Bound"
      >t</a
      ><a name="14318" class="Symbol"
      >}</a
      ><a name="14319"
      >
          </a
      ><a name="14330" class="Symbol"
      >&#8594;</a
      ><a name="14331"
      > </a
      ><a name="14332" href="Stlc.html#5534" class="InductiveConstructor Operator"
      >if</a
      ><a name="14334"
      > </a
      ><a name="14335" href="Stlc.html#5519" class="InductiveConstructor"
      >false</a
      ><a name="14340"
      > </a
      ><a name="14341" href="Stlc.html#5534" class="InductiveConstructor Operator"
      >then</a
      ><a name="14345"
      > </a
      ><a name="14346" href="Stlc.html#14315" class="Bound"
      >s</a
      ><a name="14347"
      > </a
      ><a name="14348" href="Stlc.html#5534" class="InductiveConstructor Operator"
      >else</a
      ><a name="14352"
      > </a
      ><a name="14353" href="Stlc.html#14317" class="Bound"
      >t</a
      ><a name="14354"
      > </a
      ><a name="14355" href="Stlc.html#13812" class="Datatype Operator"
      >==&gt;</a
      ><a name="14358"
      > </a
      ><a name="14359" href="Stlc.html#14317" class="Bound"
      >t</a
      ><a name="14360"
      >

</a
      ><a name="14362" class="Keyword"
      >infix</a
      ><a name="14367"
      > </a
      ><a name="14368" class="Number"
      >1</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="14422" class="Keyword"
      >data</a
      ><a name="14426"
      > </a
      ><a name="14427" href="Stlc.html#14427" class="Datatype"
      >Multi</a
      ><a name="14432"
      > </a
      ><a name="14433" class="Symbol"
      >(</a
      ><a name="14434" href="Stlc.html#14434" class="Bound"
      >R</a
      ><a name="14435"
      > </a
      ><a name="14436" class="Symbol"
      >:</a
      ><a name="14437"
      > </a
      ><a name="14438" href="Stlc.html#5402" class="Datatype"
      >Term</a
      ><a name="14442"
      > </a
      ><a name="14443" class="Symbol"
      >&#8594;</a
      ><a name="14444"
      > </a
      ><a name="14445" href="Stlc.html#5402" class="Datatype"
      >Term</a
      ><a name="14449"
      > </a
      ><a name="14450" class="Symbol"
      >&#8594;</a
      ><a name="14451"
      > </a
      ><a name="14452" class="PrimitiveType"
      >Set</a
      ><a name="14455" class="Symbol"
      >)</a
      ><a name="14456"
      > </a
      ><a name="14457" class="Symbol"
      >:</a
      ><a name="14458"
      > </a
      ><a name="14459" href="Stlc.html#5402" class="Datatype"
      >Term</a
      ><a name="14463"
      > </a
      ><a name="14464" class="Symbol"
      >&#8594;</a
      ><a name="14465"
      > </a
      ><a name="14466" href="Stlc.html#5402" class="Datatype"
      >Term</a
      ><a name="14470"
      > </a
      ><a name="14471" class="Symbol"
      >&#8594;</a
      ><a name="14472"
      > </a
      ><a name="14473" class="PrimitiveType"
      >Set</a
      ><a name="14476"
      > </a
      ><a name="14477" class="Keyword"
      >where</a
      ><a name="14482"
      >
  </a
      ><a name="14485" href="Stlc.html#14485" class="InductiveConstructor"
      >refl</a
      ><a name="14489"
      > </a
      ><a name="14490" class="Symbol"
      >:</a
      ><a name="14491"
      > </a
      ><a name="14492" class="Symbol"
      >forall</a
      ><a name="14498"
      > </a
      ><a name="14499" class="Symbol"
      >{</a
      ><a name="14500" href="Stlc.html#14500" class="Bound"
      >x</a
      ><a name="14501" class="Symbol"
      >}</a
      ><a name="14502"
      > </a
      ><a name="14503" class="Symbol"
      >-&gt;</a
      ><a name="14505"
      > </a
      ><a name="14506" href="Stlc.html#14427" class="Datatype"
      >Multi</a
      ><a name="14511"
      > </a
      ><a name="14512" href="Stlc.html#14434" class="Bound"
      >R</a
      ><a name="14513"
      > </a
      ><a name="14514" href="Stlc.html#14500" class="Bound"
      >x</a
      ><a name="14515"
      > </a
      ><a name="14516" href="Stlc.html#14500" class="Bound"
      >x</a
      ><a name="14517"
      >
  </a
      ><a name="14520" href="Stlc.html#14520" class="InductiveConstructor"
      >step</a
      ><a name="14524"
      > </a
      ><a name="14525" class="Symbol"
      >:</a
      ><a name="14526"
      > </a
      ><a name="14527" class="Symbol"
      >forall</a
      ><a name="14533"
      > </a
      ><a name="14534" class="Symbol"
      >{</a
      ><a name="14535" href="Stlc.html#14535" class="Bound"
      >x</a
      ><a name="14536"
      > </a
      ><a name="14537" href="Stlc.html#14537" class="Bound"
      >y</a
      ><a name="14538"
      > </a
      ><a name="14539" href="Stlc.html#14539" class="Bound"
      >z</a
      ><a name="14540" class="Symbol"
      >}</a
      ><a name="14541"
      > </a
      ><a name="14542" class="Symbol"
      >-&gt;</a
      ><a name="14544"
      > </a
      ><a name="14545" href="Stlc.html#14434" class="Bound"
      >R</a
      ><a name="14546"
      > </a
      ><a name="14547" href="Stlc.html#14535" class="Bound"
      >x</a
      ><a name="14548"
      > </a
      ><a name="14549" href="Stlc.html#14537" class="Bound"
      >y</a
      ><a name="14550"
      > </a
      ><a name="14551" class="Symbol"
      >-&gt;</a
      ><a name="14553"
      > </a
      ><a name="14554" href="Stlc.html#14427" class="Datatype"
      >Multi</a
      ><a name="14559"
      > </a
      ><a name="14560" href="Stlc.html#14434" class="Bound"
      >R</a
      ><a name="14561"
      > </a
      ><a name="14562" href="Stlc.html#14537" class="Bound"
      >y</a
      ><a name="14563"
      > </a
      ><a name="14564" href="Stlc.html#14539" class="Bound"
      >z</a
      ><a name="14565"
      > </a
      ><a name="14566" class="Symbol"
      >-&gt;</a
      ><a name="14568"
      > </a
      ><a name="14569" href="Stlc.html#14427" class="Datatype"
      >Multi</a
      ><a name="14574"
      > </a
      ><a name="14575" href="Stlc.html#14434" class="Bound"
      >R</a
      ><a name="14576"
      > </a
      ><a name="14577" href="Stlc.html#14535" class="Bound"
      >x</a
      ><a name="14578"
      > </a
      ><a name="14579" href="Stlc.html#14539" class="Bound"
      >z</a
      >
{% endraw %}</pre>
</div>

<pre class="Agda">{% raw %}
<a name="14613" href="Stlc.html#14613" class="Function Operator"
      >_==&gt;*_</a
      ><a name="14619"
      > </a
      ><a name="14620" class="Symbol"
      >:</a
      ><a name="14621"
      > </a
      ><a name="14622" href="Stlc.html#5402" class="Datatype"
      >Term</a
      ><a name="14626"
      > </a
      ><a name="14627" class="Symbol"
      >&#8594;</a
      ><a name="14628"
      > </a
      ><a name="14629" href="Stlc.html#5402" class="Datatype"
      >Term</a
      ><a name="14633"
      > </a
      ><a name="14634" class="Symbol"
      >&#8594;</a
      ><a name="14635"
      > </a
      ><a name="14636" class="PrimitiveType"
      >Set</a
      ><a name="14639"
      >
</a
      ><a name="14640" href="Stlc.html#14613" class="Function Operator"
      >_==&gt;*_</a
      ><a name="14646"
      > </a
      ><a name="14647" class="Symbol"
      >=</a
      ><a name="14648"
      > </a
      ><a name="14649" href="Stlc.html#14427" class="Datatype"
      >Multi</a
      ><a name="14654"
      > </a
      ><a name="14655" href="Stlc.html#13812" class="Datatype Operator"
      >_==&gt;_</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="14707" class="Symbol"
      >{-#</a
      ><a name="14710"
      > </a
      ><a name="14711" class="Keyword"
      >DISPLAY</a
      ><a name="14718"
      > </a
      ><a name="14719" href="Stlc.html#14427" class="Datatype"
      >Multi</a
      ><a name="14724"
      > </a
      ><a name="14725" href="Stlc.html#14725" class="Bound Operator"
      >_==&gt;_</a
      ><a name="14730"
      > = </a
      ><a name="14733" href="Stlc.html#14613" class="Function Operator"
      >_==&gt;*_</a
      ><a name="14739"
      > </a
      ><a name="14740" class="Symbol"
      >#-}</a
      >
{% endraw %}</pre>
</div>

### Examples

Example:

    ((λx:bool⇒bool. x) (λx:bool. x)) ==>* (λx:bool. x)

<pre class="Agda">{% raw %}
<a name="14856" href="Stlc.html#14856" class="Function"
      >step-example1</a
      ><a name="14869"
      > </a
      ><a name="14870" class="Symbol"
      >:</a
      ><a name="14871"
      > </a
      ><a name="14872" class="Symbol"
      >(</a
      ><a name="14873" href="Stlc.html#5441" class="InductiveConstructor"
      >app</a
      ><a name="14876"
      > </a
      ><a name="14877" href="Stlc.html#6229" class="Function"
      >idBB</a
      ><a name="14881"
      > </a
      ><a name="14882" href="Stlc.html#6151" class="Function"
      >idB</a
      ><a name="14885" class="Symbol"
      >)</a
      ><a name="14886"
      > </a
      ><a name="14887" href="Stlc.html#14613" class="Function Operator"
      >==&gt;*</a
      ><a name="14891"
      > </a
      ><a name="14892" href="Stlc.html#6151" class="Function"
      >idB</a
      ><a name="14895"
      >
</a
      ><a name="14896" href="Stlc.html#14856" class="Function"
      >step-example1</a
      ><a name="14909"
      > </a
      ><a name="14910" class="Symbol"
      >=</a
      ><a name="14911"
      > </a
      ><a name="14912" href="Stlc.html#14520" class="InductiveConstructor"
      >step</a
      ><a name="14916"
      > </a
      ><a name="14917" class="Symbol"
      >(</a
      ><a name="14918" href="Stlc.html#13846" class="InductiveConstructor"
      >red</a
      ><a name="14921"
      > </a
      ><a name="14922" href="Stlc.html#8484" class="InductiveConstructor"
      >abs</a
      ><a name="14925" class="Symbol"
      >)</a
      ><a name="14926"
      >
              </a
      ><a name="14941" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="14942"
      > </a
      ><a name="14943" href="Stlc.html#14485" class="InductiveConstructor"
      >refl</a
      >
{% endraw %}</pre>

Example:

    ((λx:bool⇒bool. x) ((λx:bool⇒bool. x) (λx:bool. x)))
    ==>* (λx:bool. x)

<pre class="Agda">{% raw %}
<a name="15063" href="Stlc.html#15063" class="Function"
      >step-example2</a
      ><a name="15076"
      > </a
      ><a name="15077" class="Symbol"
      >:</a
      ><a name="15078"
      > </a
      ><a name="15079" class="Symbol"
      >(</a
      ><a name="15080" href="Stlc.html#5441" class="InductiveConstructor"
      >app</a
      ><a name="15083"
      > </a
      ><a name="15084" href="Stlc.html#6229" class="Function"
      >idBB</a
      ><a name="15088"
      > </a
      ><a name="15089" class="Symbol"
      >(</a
      ><a name="15090" href="Stlc.html#5441" class="InductiveConstructor"
      >app</a
      ><a name="15093"
      > </a
      ><a name="15094" href="Stlc.html#6229" class="Function"
      >idBB</a
      ><a name="15098"
      > </a
      ><a name="15099" href="Stlc.html#6151" class="Function"
      >idB</a
      ><a name="15102" class="Symbol"
      >))</a
      ><a name="15104"
      > </a
      ><a name="15105" href="Stlc.html#14613" class="Function Operator"
      >==&gt;*</a
      ><a name="15109"
      > </a
      ><a name="15110" href="Stlc.html#6151" class="Function"
      >idB</a
      ><a name="15113"
      >
</a
      ><a name="15114" href="Stlc.html#15063" class="Function"
      >step-example2</a
      ><a name="15127"
      > </a
      ><a name="15128" class="Symbol"
      >=</a
      ><a name="15129"
      > </a
      ><a name="15130" href="Stlc.html#14520" class="InductiveConstructor"
      >step</a
      ><a name="15134"
      > </a
      ><a name="15135" class="Symbol"
      >(</a
      ><a name="15136" href="Stlc.html#14024" class="InductiveConstructor"
      >app2</a
      ><a name="15140"
      > </a
      ><a name="15141" href="Stlc.html#8484" class="InductiveConstructor"
      >abs</a
      ><a name="15144"
      > </a
      ><a name="15145" class="Symbol"
      >(</a
      ><a name="15146" href="Stlc.html#13846" class="InductiveConstructor"
      >red</a
      ><a name="15149"
      > </a
      ><a name="15150" href="Stlc.html#8484" class="InductiveConstructor"
      >abs</a
      ><a name="15153" class="Symbol"
      >))</a
      ><a name="15155"
      >
              </a
      ><a name="15170" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="15171"
      > </a
      ><a name="15172" href="Stlc.html#14520" class="InductiveConstructor"
      >step</a
      ><a name="15176"
      > </a
      ><a name="15177" class="Symbol"
      >(</a
      ><a name="15178" href="Stlc.html#13846" class="InductiveConstructor"
      >red</a
      ><a name="15181"
      > </a
      ><a name="15182" href="Stlc.html#8484" class="InductiveConstructor"
      >abs</a
      ><a name="15185" class="Symbol"
      >)</a
      ><a name="15186"
      >
              </a
      ><a name="15201" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="15202"
      > </a
      ><a name="15203" href="Stlc.html#14485" class="InductiveConstructor"
      >refl</a
      >
{% endraw %}</pre>

Example:

    ((λx:bool⇒bool. x) (λx:bool. if x then false else true)) true)
    ==>* false

<pre class="Agda">{% raw %}
<a name="15326" href="Stlc.html#15326" class="Function"
      >step-example3</a
      ><a name="15339"
      > </a
      ><a name="15340" class="Symbol"
      >:</a
      ><a name="15341"
      > </a
      ><a name="15342" class="Symbol"
      >(</a
      ><a name="15343" href="Stlc.html#5441" class="InductiveConstructor"
      >app</a
      ><a name="15346"
      > </a
      ><a name="15347" class="Symbol"
      >(</a
      ><a name="15348" href="Stlc.html#5441" class="InductiveConstructor"
      >app</a
      ><a name="15351"
      > </a
      ><a name="15352" href="Stlc.html#6229" class="Function"
      >idBB</a
      ><a name="15356"
      > </a
      ><a name="15357" href="Stlc.html#6552" class="Function"
      >notB</a
      ><a name="15361" class="Symbol"
      >)</a
      ><a name="15362"
      > </a
      ><a name="15363" href="Stlc.html#5504" class="InductiveConstructor"
      >true</a
      ><a name="15367" class="Symbol"
      >)</a
      ><a name="15368"
      > </a
      ><a name="15369" href="Stlc.html#14613" class="Function Operator"
      >==&gt;*</a
      ><a name="15373"
      > </a
      ><a name="15374" href="Stlc.html#5519" class="InductiveConstructor"
      >false</a
      ><a name="15379"
      >
</a
      ><a name="15380" href="Stlc.html#15326" class="Function"
      >step-example3</a
      ><a name="15393"
      > </a
      ><a name="15394" class="Symbol"
      >=</a
      ><a name="15395"
      > </a
      ><a name="15396" href="Stlc.html#14520" class="InductiveConstructor"
      >step</a
      ><a name="15400"
      > </a
      ><a name="15401" class="Symbol"
      >(</a
      ><a name="15402" href="Stlc.html#13942" class="InductiveConstructor"
      >app1</a
      ><a name="15406"
      > </a
      ><a name="15407" class="Symbol"
      >(</a
      ><a name="15408" href="Stlc.html#13846" class="InductiveConstructor"
      >red</a
      ><a name="15411"
      > </a
      ><a name="15412" href="Stlc.html#8484" class="InductiveConstructor"
      >abs</a
      ><a name="15415" class="Symbol"
      >))</a
      ><a name="15417"
      >
              </a
      ><a name="15432" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="15433"
      > </a
      ><a name="15434" href="Stlc.html#14520" class="InductiveConstructor"
      >step</a
      ><a name="15438"
      > </a
      ><a name="15439" class="Symbol"
      >(</a
      ><a name="15440" href="Stlc.html#13846" class="InductiveConstructor"
      >red</a
      ><a name="15443"
      > </a
      ><a name="15444" href="Stlc.html#8537" class="InductiveConstructor"
      >true</a
      ><a name="15448" class="Symbol"
      >)</a
      ><a name="15449"
      >
              </a
      ><a name="15464" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="15465"
      > </a
      ><a name="15466" href="Stlc.html#14520" class="InductiveConstructor"
      >step</a
      ><a name="15470"
      > </a
      ><a name="15471" href="Stlc.html#14232" class="InductiveConstructor"
      >iftrue</a
      ><a name="15477"
      >
              </a
      ><a name="15492" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="15493"
      > </a
      ><a name="15494" href="Stlc.html#14485" class="InductiveConstructor"
      >refl</a
      >
{% endraw %}</pre>

Example:

    ((λx:bool → bool. x) ((λx:bool. if x then false else true) true))
    ==>* false

<pre class="Agda">{% raw %}
<a name="15620" href="Stlc.html#15620" class="Function"
      >step-example4</a
      ><a name="15633"
      > </a
      ><a name="15634" class="Symbol"
      >:</a
      ><a name="15635"
      > </a
      ><a name="15636" class="Symbol"
      >(</a
      ><a name="15637" href="Stlc.html#5441" class="InductiveConstructor"
      >app</a
      ><a name="15640"
      > </a
      ><a name="15641" href="Stlc.html#6229" class="Function"
      >idBB</a
      ><a name="15645"
      > </a
      ><a name="15646" class="Symbol"
      >(</a
      ><a name="15647" href="Stlc.html#5441" class="InductiveConstructor"
      >app</a
      ><a name="15650"
      > </a
      ><a name="15651" href="Stlc.html#6552" class="Function"
      >notB</a
      ><a name="15655"
      > </a
      ><a name="15656" href="Stlc.html#5504" class="InductiveConstructor"
      >true</a
      ><a name="15660" class="Symbol"
      >))</a
      ><a name="15662"
      > </a
      ><a name="15663" href="Stlc.html#14613" class="Function Operator"
      >==&gt;*</a
      ><a name="15667"
      > </a
      ><a name="15668" href="Stlc.html#5519" class="InductiveConstructor"
      >false</a
      ><a name="15673"
      >
</a
      ><a name="15674" href="Stlc.html#15620" class="Function"
      >step-example4</a
      ><a name="15687"
      > </a
      ><a name="15688" class="Symbol"
      >=</a
      ><a name="15689"
      > </a
      ><a name="15690" href="Stlc.html#14520" class="InductiveConstructor"
      >step</a
      ><a name="15694"
      > </a
      ><a name="15695" class="Symbol"
      >(</a
      ><a name="15696" href="Stlc.html#14024" class="InductiveConstructor"
      >app2</a
      ><a name="15700"
      > </a
      ><a name="15701" href="Stlc.html#8484" class="InductiveConstructor"
      >abs</a
      ><a name="15704"
      > </a
      ><a name="15705" class="Symbol"
      >(</a
      ><a name="15706" href="Stlc.html#13846" class="InductiveConstructor"
      >red</a
      ><a name="15709"
      > </a
      ><a name="15710" href="Stlc.html#8537" class="InductiveConstructor"
      >true</a
      ><a name="15714" class="Symbol"
      >))</a
      ><a name="15716"
      >
              </a
      ><a name="15731" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="15732"
      > </a
      ><a name="15733" href="Stlc.html#14520" class="InductiveConstructor"
      >step</a
      ><a name="15737"
      > </a
      ><a name="15738" class="Symbol"
      >(</a
      ><a name="15739" href="Stlc.html#14024" class="InductiveConstructor"
      >app2</a
      ><a name="15743"
      > </a
      ><a name="15744" href="Stlc.html#8484" class="InductiveConstructor"
      >abs</a
      ><a name="15747"
      > </a
      ><a name="15748" href="Stlc.html#14232" class="InductiveConstructor"
      >iftrue</a
      ><a name="15754" class="Symbol"
      >)</a
      ><a name="15755"
      >
              </a
      ><a name="15770" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="15771"
      > </a
      ><a name="15772" href="Stlc.html#14520" class="InductiveConstructor"
      >step</a
      ><a name="15776"
      > </a
      ><a name="15777" class="Symbol"
      >(</a
      ><a name="15778" href="Stlc.html#13846" class="InductiveConstructor"
      >red</a
      ><a name="15781"
      > </a
      ><a name="15782" href="Stlc.html#8558" class="InductiveConstructor"
      >false</a
      ><a name="15787" class="Symbol"
      >)</a
      ><a name="15788"
      >
              </a
      ><a name="15803" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="15804"
      > </a
      ><a name="15805" href="Stlc.html#14485" class="InductiveConstructor"
      >refl</a
      >
{% endraw %}</pre>

#### Exercise: 2 stars (step_example3)

<pre class="Agda">{% raw %}
<a name="15875" href="Stlc.html#15875" class="Function"
      >step-example5</a
      ><a name="15888"
      > </a
      ><a name="15889" class="Symbol"
      >:</a
      ><a name="15890"
      > </a
      ><a name="15891" class="Symbol"
      >(</a
      ><a name="15892" href="Stlc.html#5441" class="InductiveConstructor"
      >app</a
      ><a name="15895"
      > </a
      ><a name="15896" class="Symbol"
      >(</a
      ><a name="15897" href="Stlc.html#5441" class="InductiveConstructor"
      >app</a
      ><a name="15900"
      > </a
      ><a name="15901" href="Stlc.html#6335" class="Function"
      >idBBBB</a
      ><a name="15907"
      > </a
      ><a name="15908" href="Stlc.html#6229" class="Function"
      >idBB</a
      ><a name="15912" class="Symbol"
      >)</a
      ><a name="15913"
      > </a
      ><a name="15914" href="Stlc.html#6151" class="Function"
      >idB</a
      ><a name="15917" class="Symbol"
      >)</a
      ><a name="15918"
      > </a
      ><a name="15919" href="Stlc.html#14613" class="Function Operator"
      >==&gt;*</a
      ><a name="15923"
      > </a
      ><a name="15924" href="Stlc.html#6151" class="Function"
      >idB</a
      ><a name="15927"
      >
</a
      ><a name="15928" href="Stlc.html#15875" class="Function"
      >step-example5</a
      ><a name="15941"
      > </a
      ><a name="15942" class="Symbol"
      >=</a
      ><a name="15943"
      > </a
      ><a name="15944" class="Symbol"
      >{!!}</a
      ><a name="15948"
      > </a
      ><a name="15949" class="Comment"
      >-- FILL IN HERE</a
      >
{% endraw %}</pre>


## Typing

Next we consider the typing relation of the STLC.

### Contexts

_Question_: What is the type of the term "`x y`"?

_Answer_: It depends on the types of `x` and `y`!

I.e., in order to assign a type to a term, we need to know
what assumptions we should make about the types of its free
variables.

This leads us to a three-place _typing judgment_, informally
written `Γ ⊢ t ∶ T`, where `Γ` is a "typing context" -- a mapping from
-- variables to their types.

Informally, we'll write `Γ, x:A` for "extend the partial function `Γ`
to also map `x` to `A`."  Formally, we use the function `_,_∶_` (or
"update") to add a binding to a context.

<pre class="Agda">{% raw %}
<a name="16642" href="Stlc.html#16642" class="Function"
      >Ctxt</a
      ><a name="16646"
      > </a
      ><a name="16647" class="Symbol"
      >:</a
      ><a name="16648"
      > </a
      ><a name="16649" class="PrimitiveType"
      >Set</a
      ><a name="16652"
      >
</a
      ><a name="16653" href="Stlc.html#16642" class="Function"
      >Ctxt</a
      ><a name="16657"
      > </a
      ><a name="16658" class="Symbol"
      >=</a
      ><a name="16659"
      > </a
      ><a name="16660" href="Stlc.html#5097" class="Datatype"
      >Id</a
      ><a name="16662"
      > </a
      ><a name="16663" class="Symbol"
      >&#8594;</a
      ><a name="16664"
      > </a
      ><a name="16665" href="https://agda.github.io/agda-stdlib/Data.Maybe.Base.html#335" class="Datatype"
      >Maybe</a
      ><a name="16670"
      > </a
      ><a name="16671" href="Stlc.html#4983" class="Datatype"
      >Type</a
      ><a name="16675"
      >

</a
      ><a name="16677" href="Stlc.html#16677" class="Function"
      >&#8709;</a
      ><a name="16678"
      > </a
      ><a name="16679" class="Symbol"
      >:</a
      ><a name="16680"
      > </a
      ><a name="16681" href="Stlc.html#16642" class="Function"
      >Ctxt</a
      ><a name="16685"
      >
</a
      ><a name="16686" href="Stlc.html#16677" class="Function"
      >&#8709;</a
      ><a name="16687"
      > </a
      ><a name="16688" class="Symbol"
      >=</a
      ><a name="16689"
      > </a
      ><a name="16690" class="Symbol"
      >&#955;</a
      ><a name="16691"
      > </a
      ><a name="16692" href="Stlc.html#16692" class="Bound"
      >_</a
      ><a name="16693"
      > </a
      ><a name="16694" class="Symbol"
      >&#8594;</a
      ><a name="16695"
      > </a
      ><a name="16696" href="https://agda.github.io/agda-stdlib/Data.Maybe.Base.html#403" class="InductiveConstructor"
      >nothing</a
      ><a name="16703"
      >

</a
      ><a name="16705" href="Stlc.html#16705" class="Function Operator"
      >_,_&#8758;_</a
      ><a name="16710"
      > </a
      ><a name="16711" class="Symbol"
      >:</a
      ><a name="16712"
      > </a
      ><a name="16713" href="Stlc.html#16642" class="Function"
      >Ctxt</a
      ><a name="16717"
      > </a
      ><a name="16718" class="Symbol"
      >-&gt;</a
      ><a name="16720"
      > </a
      ><a name="16721" href="Stlc.html#5097" class="Datatype"
      >Id</a
      ><a name="16723"
      > </a
      ><a name="16724" class="Symbol"
      >-&gt;</a
      ><a name="16726"
      > </a
      ><a name="16727" href="Stlc.html#4983" class="Datatype"
      >Type</a
      ><a name="16731"
      > </a
      ><a name="16732" class="Symbol"
      >-&gt;</a
      ><a name="16734"
      > </a
      ><a name="16735" href="Stlc.html#16642" class="Function"
      >Ctxt</a
      ><a name="16739"
      >
</a
      ><a name="16740" class="Symbol"
      >(</a
      ><a name="16741" href="Stlc.html#16741" class="Bound"
      >&#915;</a
      ><a name="16742"
      > </a
      ><a name="16743" href="Stlc.html#16705" class="Function Operator"
      >,</a
      ><a name="16744"
      > </a
      ><a name="16745" href="Stlc.html#16745" class="Bound"
      >x</a
      ><a name="16746"
      > </a
      ><a name="16747" href="Stlc.html#16705" class="Function Operator"
      >&#8758;</a
      ><a name="16748"
      > </a
      ><a name="16749" href="Stlc.html#16749" class="Bound"
      >A</a
      ><a name="16750" class="Symbol"
      >)</a
      ><a name="16751"
      > </a
      ><a name="16752" href="Stlc.html#16752" class="Bound"
      >y</a
      ><a name="16753"
      > </a
      ><a name="16754" class="Keyword"
      >with</a
      ><a name="16758"
      > </a
      ><a name="16759" href="Stlc.html#16745" class="Bound"
      >x</a
      ><a name="16760"
      > </a
      ><a name="16761" href="Stlc.html#5231" class="Function Operator"
      >&#8799;</a
      ><a name="16762"
      > </a
      ><a name="16763" href="Stlc.html#16752" class="Bound"
      >y</a
      ><a name="16764"
      >
</a
      ><a name="16765" class="Symbol"
      >...</a
      ><a name="16768"
      > </a
      ><a name="16769" class="Symbol"
      >|</a
      ><a name="16770"
      > </a
      ><a name="16771" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="16774"
      > </a
      ><a name="16775" href="Stlc.html#16775" class="Bound"
      >x=y</a
      ><a name="16778"
      > </a
      ><a name="16779" class="Symbol"
      >=</a
      ><a name="16780"
      > </a
      ><a name="16781" href="https://agda.github.io/agda-stdlib/Data.Maybe.Base.html#373" class="InductiveConstructor"
      >just</a
      ><a name="16785"
      > </a
      ><a name="16786" href="Stlc.html#16749" class="Bound"
      >A</a
      ><a name="16787"
      >
</a
      ><a name="16788" class="Symbol"
      >...</a
      ><a name="16791"
      > </a
      ><a name="16792" class="Symbol"
      >|</a
      ><a name="16793"
      > </a
      ><a name="16794" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="16796"
      >  </a
      ><a name="16798" href="Stlc.html#16798" class="Bound"
      >x&#8800;y</a
      ><a name="16801"
      > </a
      ><a name="16802" class="Symbol"
      >=</a
      ><a name="16803"
      > </a
      ><a name="16804" href="Stlc.html#16741" class="Bound"
      >&#915;</a
      ><a name="16805"
      > </a
      ><a name="16806" href="Stlc.html#16752" class="Bound"
      >y</a
      ><a name="16807"
      >

</a
      ><a name="16809" class="Keyword"
      >infixl</a
      ><a name="16815"
      > </a
      ><a name="16816" class="Number"
      >3</a
      >
{% endraw %}</pre>


### Typing Relation

    Γ x = T
    ---------                                  (var)
    Γ ⊢ x ∶ T

    Γ , x:A ⊢ t12 ∶ B
    ------------------                         (abs)
    Γ ⊢ λx:A.t12 ∶ A⇒B

    Γ ⊢ t1 ∶ A⇒B
    Γ ⊢ t2 ∶ A
    -------------                              (app)
    Γ ⊢ t1 t2 ∶ B

    ---------------                            (true)
    Γ ⊢ true ∶ bool

    ----------------                           (false)
    Γ ⊢ false ∶ bool

    Γ ⊢ t1 ∶ bool    Γ ⊢ t2 ∶ T    Γ ⊢ t3 ∶ T
    -----------------------------------------  (if)
    Γ ⊢ if t1 then t2 else t3 ∶ T


We can read the three-place relation `Γ ⊢ t ∶ T` as:
"to the term `t` we can assign the type `T` using as types for
the free variables of `t` the ones specified in the context
`Γ`."

<pre class="Agda">{% raw %}
<a name="17623" class="Keyword"
      >data</a
      ><a name="17627"
      > </a
      ><a name="17628" href="Stlc.html#17628" class="Datatype Operator"
      >_&#8866;_&#8758;_</a
      ><a name="17633"
      > </a
      ><a name="17634" class="Symbol"
      >:</a
      ><a name="17635"
      > </a
      ><a name="17636" href="Stlc.html#16642" class="Function"
      >Ctxt</a
      ><a name="17640"
      > </a
      ><a name="17641" class="Symbol"
      >-&gt;</a
      ><a name="17643"
      > </a
      ><a name="17644" href="Stlc.html#5402" class="Datatype"
      >Term</a
      ><a name="17648"
      > </a
      ><a name="17649" class="Symbol"
      >-&gt;</a
      ><a name="17651"
      > </a
      ><a name="17652" href="Stlc.html#4983" class="Datatype"
      >Type</a
      ><a name="17656"
      > </a
      ><a name="17657" class="Symbol"
      >-&gt;</a
      ><a name="17659"
      > </a
      ><a name="17660" class="PrimitiveType"
      >Set</a
      ><a name="17663"
      > </a
      ><a name="17664" class="Keyword"
      >where</a
      ><a name="17669"
      >
  </a
      ><a name="17672" href="Stlc.html#17672" class="InductiveConstructor"
      >var</a
      ><a name="17675"
      >           </a
      ><a name="17686" class="Symbol"
      >:</a
      ><a name="17687"
      > </a
      ><a name="17688" class="Symbol"
      >forall</a
      ><a name="17694"
      > </a
      ><a name="17695" class="Symbol"
      >{</a
      ><a name="17696" href="Stlc.html#17696" class="Bound"
      >&#915;</a
      ><a name="17697" class="Symbol"
      >}</a
      ><a name="17698"
      > </a
      ><a name="17699" href="Stlc.html#17699" class="Bound"
      >x</a
      ><a name="17700"
      > </a
      ><a name="17701" class="Symbol"
      >{</a
      ><a name="17702" href="Stlc.html#17702" class="Bound"
      >A</a
      ><a name="17703" class="Symbol"
      >}</a
      ><a name="17704"
      >
                </a
      ><a name="17721" class="Symbol"
      >&#8594;</a
      ><a name="17722"
      > </a
      ><a name="17723" href="Stlc.html#17696" class="Bound"
      >&#915;</a
      ><a name="17724"
      > </a
      ><a name="17725" href="Stlc.html#17699" class="Bound"
      >x</a
      ><a name="17726"
      > </a
      ><a name="17727" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="17728"
      > </a
      ><a name="17729" href="https://agda.github.io/agda-stdlib/Data.Maybe.Base.html#373" class="InductiveConstructor"
      >just</a
      ><a name="17733"
      > </a
      ><a name="17734" href="Stlc.html#17702" class="Bound"
      >A</a
      ><a name="17735"
      >
                </a
      ><a name="17752" class="Symbol"
      >&#8594;</a
      ><a name="17753"
      > </a
      ><a name="17754" href="Stlc.html#17696" class="Bound"
      >&#915;</a
      ><a name="17755"
      > </a
      ><a name="17756" href="Stlc.html#17628" class="Datatype Operator"
      >&#8866;</a
      ><a name="17757"
      > </a
      ><a name="17758" href="Stlc.html#5421" class="InductiveConstructor"
      >var</a
      ><a name="17761"
      > </a
      ><a name="17762" href="Stlc.html#17699" class="Bound"
      >x</a
      ><a name="17763"
      > </a
      ><a name="17764" href="Stlc.html#17628" class="Datatype Operator"
      >&#8758;</a
      ><a name="17765"
      > </a
      ><a name="17766" href="Stlc.html#17702" class="Bound"
      >A</a
      ><a name="17767"
      >
  </a
      ><a name="17770" href="Stlc.html#17770" class="InductiveConstructor"
      >abs</a
      ><a name="17773"
      >           </a
      ><a name="17784" class="Symbol"
      >:</a
      ><a name="17785"
      > </a
      ><a name="17786" class="Symbol"
      >forall</a
      ><a name="17792"
      > </a
      ><a name="17793" class="Symbol"
      >{</a
      ><a name="17794" href="Stlc.html#17794" class="Bound"
      >&#915;</a
      ><a name="17795" class="Symbol"
      >}</a
      ><a name="17796"
      > </a
      ><a name="17797" class="Symbol"
      >{</a
      ><a name="17798" href="Stlc.html#17798" class="Bound"
      >x</a
      ><a name="17799" class="Symbol"
      >}</a
      ><a name="17800"
      > </a
      ><a name="17801" class="Symbol"
      >{</a
      ><a name="17802" href="Stlc.html#17802" class="Bound"
      >A</a
      ><a name="17803" class="Symbol"
      >}</a
      ><a name="17804"
      > </a
      ><a name="17805" class="Symbol"
      >{</a
      ><a name="17806" href="Stlc.html#17806" class="Bound"
      >B</a
      ><a name="17807" class="Symbol"
      >}</a
      ><a name="17808"
      > </a
      ><a name="17809" class="Symbol"
      >{</a
      ><a name="17810" href="Stlc.html#17810" class="Bound"
      >s</a
      ><a name="17811" class="Symbol"
      >}</a
      ><a name="17812"
      >
                </a
      ><a name="17829" class="Symbol"
      >&#8594;</a
      ><a name="17830"
      > </a
      ><a name="17831" href="Stlc.html#17794" class="Bound"
      >&#915;</a
      ><a name="17832"
      > </a
      ><a name="17833" href="Stlc.html#16705" class="Function Operator"
      >,</a
      ><a name="17834"
      > </a
      ><a name="17835" href="Stlc.html#17798" class="Bound"
      >x</a
      ><a name="17836"
      > </a
      ><a name="17837" href="Stlc.html#16705" class="Function Operator"
      >&#8758;</a
      ><a name="17838"
      > </a
      ><a name="17839" href="Stlc.html#17802" class="Bound"
      >A</a
      ><a name="17840"
      > </a
      ><a name="17841" href="Stlc.html#17628" class="Datatype Operator"
      >&#8866;</a
      ><a name="17842"
      > </a
      ><a name="17843" href="Stlc.html#17810" class="Bound"
      >s</a
      ><a name="17844"
      > </a
      ><a name="17845" href="Stlc.html#17628" class="Datatype Operator"
      >&#8758;</a
      ><a name="17846"
      > </a
      ><a name="17847" href="Stlc.html#17806" class="Bound"
      >B</a
      ><a name="17848"
      >
                </a
      ><a name="17865" class="Symbol"
      >&#8594;</a
      ><a name="17866"
      > </a
      ><a name="17867" href="Stlc.html#17794" class="Bound"
      >&#915;</a
      ><a name="17868"
      > </a
      ><a name="17869" href="Stlc.html#17628" class="Datatype Operator"
      >&#8866;</a
      ><a name="17870"
      > </a
      ><a name="17871" href="Stlc.html#5470" class="InductiveConstructor"
      >abs</a
      ><a name="17874"
      > </a
      ><a name="17875" href="Stlc.html#17798" class="Bound"
      >x</a
      ><a name="17876"
      > </a
      ><a name="17877" href="Stlc.html#17802" class="Bound"
      >A</a
      ><a name="17878"
      > </a
      ><a name="17879" href="Stlc.html#17810" class="Bound"
      >s</a
      ><a name="17880"
      > </a
      ><a name="17881" href="Stlc.html#17628" class="Datatype Operator"
      >&#8758;</a
      ><a name="17882"
      > </a
      ><a name="17883" href="Stlc.html#17802" class="Bound"
      >A</a
      ><a name="17884"
      > </a
      ><a name="17885" href="Stlc.html#5016" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="17886"
      > </a
      ><a name="17887" href="Stlc.html#17806" class="Bound"
      >B</a
      ><a name="17888"
      >
  </a
      ><a name="17891" href="Stlc.html#17891" class="InductiveConstructor"
      >app</a
      ><a name="17894"
      >           </a
      ><a name="17905" class="Symbol"
      >:</a
      ><a name="17906"
      > </a
      ><a name="17907" class="Symbol"
      >forall</a
      ><a name="17913"
      > </a
      ><a name="17914" class="Symbol"
      >{</a
      ><a name="17915" href="Stlc.html#17915" class="Bound"
      >&#915;</a
      ><a name="17916" class="Symbol"
      >}</a
      ><a name="17917"
      > </a
      ><a name="17918" class="Symbol"
      >{</a
      ><a name="17919" href="Stlc.html#17919" class="Bound"
      >A</a
      ><a name="17920" class="Symbol"
      >}</a
      ><a name="17921"
      > </a
      ><a name="17922" class="Symbol"
      >{</a
      ><a name="17923" href="Stlc.html#17923" class="Bound"
      >B</a
      ><a name="17924" class="Symbol"
      >}</a
      ><a name="17925"
      > </a
      ><a name="17926" class="Symbol"
      >{</a
      ><a name="17927" href="Stlc.html#17927" class="Bound"
      >s</a
      ><a name="17928" class="Symbol"
      >}</a
      ><a name="17929"
      > </a
      ><a name="17930" class="Symbol"
      >{</a
      ><a name="17931" href="Stlc.html#17931" class="Bound"
      >t</a
      ><a name="17932" class="Symbol"
      >}</a
      ><a name="17933"
      >
                </a
      ><a name="17950" class="Symbol"
      >&#8594;</a
      ><a name="17951"
      > </a
      ><a name="17952" href="Stlc.html#17915" class="Bound"
      >&#915;</a
      ><a name="17953"
      > </a
      ><a name="17954" href="Stlc.html#17628" class="Datatype Operator"
      >&#8866;</a
      ><a name="17955"
      > </a
      ><a name="17956" href="Stlc.html#17927" class="Bound"
      >s</a
      ><a name="17957"
      > </a
      ><a name="17958" href="Stlc.html#17628" class="Datatype Operator"
      >&#8758;</a
      ><a name="17959"
      > </a
      ><a name="17960" href="Stlc.html#17919" class="Bound"
      >A</a
      ><a name="17961"
      > </a
      ><a name="17962" href="Stlc.html#5016" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="17963"
      > </a
      ><a name="17964" href="Stlc.html#17923" class="Bound"
      >B</a
      ><a name="17965"
      >
                </a
      ><a name="17982" class="Symbol"
      >&#8594;</a
      ><a name="17983"
      > </a
      ><a name="17984" href="Stlc.html#17915" class="Bound"
      >&#915;</a
      ><a name="17985"
      > </a
      ><a name="17986" href="Stlc.html#17628" class="Datatype Operator"
      >&#8866;</a
      ><a name="17987"
      > </a
      ><a name="17988" href="Stlc.html#17931" class="Bound"
      >t</a
      ><a name="17989"
      > </a
      ><a name="17990" href="Stlc.html#17628" class="Datatype Operator"
      >&#8758;</a
      ><a name="17991"
      > </a
      ><a name="17992" href="Stlc.html#17919" class="Bound"
      >A</a
      ><a name="17993"
      >
                </a
      ><a name="18010" class="Symbol"
      >&#8594;</a
      ><a name="18011"
      > </a
      ><a name="18012" href="Stlc.html#17915" class="Bound"
      >&#915;</a
      ><a name="18013"
      > </a
      ><a name="18014" href="Stlc.html#17628" class="Datatype Operator"
      >&#8866;</a
      ><a name="18015"
      > </a
      ><a name="18016" href="Stlc.html#5441" class="InductiveConstructor"
      >app</a
      ><a name="18019"
      > </a
      ><a name="18020" href="Stlc.html#17927" class="Bound"
      >s</a
      ><a name="18021"
      > </a
      ><a name="18022" href="Stlc.html#17931" class="Bound"
      >t</a
      ><a name="18023"
      > </a
      ><a name="18024" href="Stlc.html#17628" class="Datatype Operator"
      >&#8758;</a
      ><a name="18025"
      > </a
      ><a name="18026" href="Stlc.html#17923" class="Bound"
      >B</a
      ><a name="18027"
      >
  </a
      ><a name="18030" href="Stlc.html#18030" class="InductiveConstructor"
      >true</a
      ><a name="18034"
      >          </a
      ><a name="18044" class="Symbol"
      >:</a
      ><a name="18045"
      > </a
      ><a name="18046" class="Symbol"
      >forall</a
      ><a name="18052"
      > </a
      ><a name="18053" class="Symbol"
      >{</a
      ><a name="18054" href="Stlc.html#18054" class="Bound"
      >&#915;</a
      ><a name="18055" class="Symbol"
      >}</a
      ><a name="18056"
      >
                </a
      ><a name="18073" class="Symbol"
      >&#8594;</a
      ><a name="18074"
      > </a
      ><a name="18075" href="Stlc.html#18054" class="Bound"
      >&#915;</a
      ><a name="18076"
      > </a
      ><a name="18077" href="Stlc.html#17628" class="Datatype Operator"
      >&#8866;</a
      ><a name="18078"
      > </a
      ><a name="18079" href="Stlc.html#5504" class="InductiveConstructor"
      >true</a
      ><a name="18083"
      >  </a
      ><a name="18085" href="Stlc.html#17628" class="Datatype Operator"
      >&#8758;</a
      ><a name="18086"
      > </a
      ><a name="18087" href="Stlc.html#5002" class="InductiveConstructor"
      >bool</a
      ><a name="18091"
      >
  </a
      ><a name="18094" href="Stlc.html#18094" class="InductiveConstructor"
      >false</a
      ><a name="18099"
      >         </a
      ><a name="18108" class="Symbol"
      >:</a
      ><a name="18109"
      > </a
      ><a name="18110" class="Symbol"
      >forall</a
      ><a name="18116"
      > </a
      ><a name="18117" class="Symbol"
      >{</a
      ><a name="18118" href="Stlc.html#18118" class="Bound"
      >&#915;</a
      ><a name="18119" class="Symbol"
      >}</a
      ><a name="18120"
      >
                </a
      ><a name="18137" class="Symbol"
      >&#8594;</a
      ><a name="18138"
      > </a
      ><a name="18139" href="Stlc.html#18118" class="Bound"
      >&#915;</a
      ><a name="18140"
      > </a
      ><a name="18141" href="Stlc.html#17628" class="Datatype Operator"
      >&#8866;</a
      ><a name="18142"
      > </a
      ><a name="18143" href="Stlc.html#5519" class="InductiveConstructor"
      >false</a
      ><a name="18148"
      > </a
      ><a name="18149" href="Stlc.html#17628" class="Datatype Operator"
      >&#8758;</a
      ><a name="18150"
      > </a
      ><a name="18151" href="Stlc.html#5002" class="InductiveConstructor"
      >bool</a
      ><a name="18155"
      >
  </a
      ><a name="18158" href="Stlc.html#18158" class="InductiveConstructor Operator"
      >if_then_else_</a
      ><a name="18171"
      > </a
      ><a name="18172" class="Symbol"
      >:</a
      ><a name="18173"
      > </a
      ><a name="18174" class="Symbol"
      >forall</a
      ><a name="18180"
      > </a
      ><a name="18181" class="Symbol"
      >{</a
      ><a name="18182" href="Stlc.html#18182" class="Bound"
      >&#915;</a
      ><a name="18183" class="Symbol"
      >}</a
      ><a name="18184"
      > </a
      ><a name="18185" class="Symbol"
      >{</a
      ><a name="18186" href="Stlc.html#18186" class="Bound"
      >s</a
      ><a name="18187" class="Symbol"
      >}</a
      ><a name="18188"
      > </a
      ><a name="18189" class="Symbol"
      >{</a
      ><a name="18190" href="Stlc.html#18190" class="Bound"
      >t</a
      ><a name="18191" class="Symbol"
      >}</a
      ><a name="18192"
      > </a
      ><a name="18193" class="Symbol"
      >{</a
      ><a name="18194" href="Stlc.html#18194" class="Bound"
      >u</a
      ><a name="18195" class="Symbol"
      >}</a
      ><a name="18196"
      > </a
      ><a name="18197" class="Symbol"
      >{</a
      ><a name="18198" href="Stlc.html#18198" class="Bound"
      >A</a
      ><a name="18199" class="Symbol"
      >}</a
      ><a name="18200"
      >
                </a
      ><a name="18217" class="Symbol"
      >&#8594;</a
      ><a name="18218"
      > </a
      ><a name="18219" href="Stlc.html#18182" class="Bound"
      >&#915;</a
      ><a name="18220"
      > </a
      ><a name="18221" href="Stlc.html#17628" class="Datatype Operator"
      >&#8866;</a
      ><a name="18222"
      > </a
      ><a name="18223" href="Stlc.html#18186" class="Bound"
      >s</a
      ><a name="18224"
      > </a
      ><a name="18225" href="Stlc.html#17628" class="Datatype Operator"
      >&#8758;</a
      ><a name="18226"
      > </a
      ><a name="18227" href="Stlc.html#5002" class="InductiveConstructor"
      >bool</a
      ><a name="18231"
      >
                </a
      ><a name="18248" class="Symbol"
      >&#8594;</a
      ><a name="18249"
      > </a
      ><a name="18250" href="Stlc.html#18182" class="Bound"
      >&#915;</a
      ><a name="18251"
      > </a
      ><a name="18252" href="Stlc.html#17628" class="Datatype Operator"
      >&#8866;</a
      ><a name="18253"
      > </a
      ><a name="18254" href="Stlc.html#18190" class="Bound"
      >t</a
      ><a name="18255"
      > </a
      ><a name="18256" href="Stlc.html#17628" class="Datatype Operator"
      >&#8758;</a
      ><a name="18257"
      > </a
      ><a name="18258" href="Stlc.html#18198" class="Bound"
      >A</a
      ><a name="18259"
      >
                </a
      ><a name="18276" class="Symbol"
      >&#8594;</a
      ><a name="18277"
      > </a
      ><a name="18278" href="Stlc.html#18182" class="Bound"
      >&#915;</a
      ><a name="18279"
      > </a
      ><a name="18280" href="Stlc.html#17628" class="Datatype Operator"
      >&#8866;</a
      ><a name="18281"
      > </a
      ><a name="18282" href="Stlc.html#18194" class="Bound"
      >u</a
      ><a name="18283"
      > </a
      ><a name="18284" href="Stlc.html#17628" class="Datatype Operator"
      >&#8758;</a
      ><a name="18285"
      > </a
      ><a name="18286" href="Stlc.html#18198" class="Bound"
      >A</a
      ><a name="18287"
      >
                </a
      ><a name="18304" class="Symbol"
      >&#8594;</a
      ><a name="18305"
      > </a
      ><a name="18306" href="Stlc.html#18182" class="Bound"
      >&#915;</a
      ><a name="18307"
      > </a
      ><a name="18308" href="Stlc.html#17628" class="Datatype Operator"
      >&#8866;</a
      ><a name="18309"
      > </a
      ><a name="18310" href="Stlc.html#5534" class="InductiveConstructor Operator"
      >if</a
      ><a name="18312"
      > </a
      ><a name="18313" href="Stlc.html#18186" class="Bound"
      >s</a
      ><a name="18314"
      > </a
      ><a name="18315" href="Stlc.html#5534" class="InductiveConstructor Operator"
      >then</a
      ><a name="18319"
      > </a
      ><a name="18320" href="Stlc.html#18190" class="Bound"
      >t</a
      ><a name="18321"
      > </a
      ><a name="18322" href="Stlc.html#5534" class="InductiveConstructor Operator"
      >else</a
      ><a name="18326"
      > </a
      ><a name="18327" href="Stlc.html#18194" class="Bound"
      >u</a
      ><a name="18328"
      > </a
      ><a name="18329" href="Stlc.html#17628" class="Datatype Operator"
      >&#8758;</a
      ><a name="18330"
      > </a
      ><a name="18331" href="Stlc.html#18198" class="Bound"
      >A</a
      ><a name="18332"
      >

</a
      ><a name="18334" class="Keyword"
      >infix</a
      ><a name="18339"
      > </a
      ><a name="18340" class="Number"
      >1</a
      >
{% endraw %}</pre>

### Examples

<pre class="Agda">{% raw %}
<a name="18387" href="Stlc.html#18387" class="Function"
      >typing-example1</a
      ><a name="18402"
      > </a
      ><a name="18403" class="Symbol"
      >:</a
      ><a name="18404"
      > </a
      ><a name="18405" href="Stlc.html#16677" class="Function"
      >&#8709;</a
      ><a name="18406"
      > </a
      ><a name="18407" href="Stlc.html#17628" class="Datatype Operator"
      >&#8866;</a
      ><a name="18408"
      > </a
      ><a name="18409" href="Stlc.html#6151" class="Function"
      >idB</a
      ><a name="18412"
      > </a
      ><a name="18413" href="Stlc.html#17628" class="Datatype Operator"
      >&#8758;</a
      ><a name="18414"
      > </a
      ><a name="18415" href="Stlc.html#5002" class="InductiveConstructor"
      >bool</a
      ><a name="18419"
      > </a
      ><a name="18420" href="Stlc.html#5016" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="18421"
      > </a
      ><a name="18422" href="Stlc.html#5002" class="InductiveConstructor"
      >bool</a
      ><a name="18426"
      >
</a
      ><a name="18427" href="Stlc.html#18387" class="Function"
      >typing-example1</a
      ><a name="18442"
      > </a
      ><a name="18443" class="Symbol"
      >=</a
      ><a name="18444"
      > </a
      ><a name="18445" href="Stlc.html#17770" class="InductiveConstructor"
      >abs</a
      ><a name="18448"
      > </a
      ><a name="18449" class="Symbol"
      >(</a
      ><a name="18450" href="Stlc.html#17672" class="InductiveConstructor"
      >var</a
      ><a name="18453"
      > </a
      ><a name="18454" href="Stlc.html#5938" class="Function"
      >x</a
      ><a name="18455"
      > </a
      ><a name="18456" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="18460" class="Symbol"
      >)</a
      >
{% endraw %}</pre>

Another example:

    empty ⊢ λx:A. λy:A⇒A. y (y x)) ∶ A⇒(A⇒A)⇒A

<pre class="Agda">{% raw %}
<a name="18553" href="Stlc.html#18553" class="Function"
      >typing-example2</a
      ><a name="18568"
      > </a
      ><a name="18569" class="Symbol"
      >:</a
      ><a name="18570"
      > </a
      ><a name="18571" href="Stlc.html#16677" class="Function"
      >&#8709;</a
      ><a name="18572"
      > </a
      ><a name="18573" href="Stlc.html#17628" class="Datatype Operator"
      >&#8866;</a
      ><a name="18574"
      >
  </a
      ><a name="18577" class="Symbol"
      >(</a
      ><a name="18578" href="Stlc.html#5470" class="InductiveConstructor"
      >abs</a
      ><a name="18581"
      > </a
      ><a name="18582" href="Stlc.html#5938" class="Function"
      >x</a
      ><a name="18583"
      > </a
      ><a name="18584" href="Stlc.html#5002" class="InductiveConstructor"
      >bool</a
      ><a name="18588"
      >
    </a
      ><a name="18593" class="Symbol"
      >(</a
      ><a name="18594" href="Stlc.html#5470" class="InductiveConstructor"
      >abs</a
      ><a name="18597"
      > </a
      ><a name="18598" href="Stlc.html#5947" class="Function"
      >y</a
      ><a name="18599"
      > </a
      ><a name="18600" class="Symbol"
      >(</a
      ><a name="18601" href="Stlc.html#5002" class="InductiveConstructor"
      >bool</a
      ><a name="18605"
      > </a
      ><a name="18606" href="Stlc.html#5016" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="18607"
      > </a
      ><a name="18608" href="Stlc.html#5002" class="InductiveConstructor"
      >bool</a
      ><a name="18612" class="Symbol"
      >)</a
      ><a name="18613"
      >
      </a
      ><a name="18620" class="Symbol"
      >(</a
      ><a name="18621" href="Stlc.html#5441" class="InductiveConstructor"
      >app</a
      ><a name="18624"
      > </a
      ><a name="18625" class="Symbol"
      >(</a
      ><a name="18626" href="Stlc.html#5421" class="InductiveConstructor"
      >var</a
      ><a name="18629"
      > </a
      ><a name="18630" href="Stlc.html#5947" class="Function"
      >y</a
      ><a name="18631" class="Symbol"
      >)</a
      ><a name="18632"
      >
        </a
      ><a name="18641" class="Symbol"
      >(</a
      ><a name="18642" href="Stlc.html#5441" class="InductiveConstructor"
      >app</a
      ><a name="18645"
      > </a
      ><a name="18646" class="Symbol"
      >(</a
      ><a name="18647" href="Stlc.html#5421" class="InductiveConstructor"
      >var</a
      ><a name="18650"
      > </a
      ><a name="18651" href="Stlc.html#5947" class="Function"
      >y</a
      ><a name="18652" class="Symbol"
      >)</a
      ><a name="18653"
      > </a
      ><a name="18654" class="Symbol"
      >(</a
      ><a name="18655" href="Stlc.html#5421" class="InductiveConstructor"
      >var</a
      ><a name="18658"
      > </a
      ><a name="18659" href="Stlc.html#5938" class="Function"
      >x</a
      ><a name="18660" class="Symbol"
      >)))))</a
      ><a name="18665"
      > </a
      ><a name="18666" href="Stlc.html#17628" class="Datatype Operator"
      >&#8758;</a
      ><a name="18667"
      >
  </a
      ><a name="18670" class="Symbol"
      >(</a
      ><a name="18671" href="Stlc.html#5002" class="InductiveConstructor"
      >bool</a
      ><a name="18675"
      > </a
      ><a name="18676" href="Stlc.html#5016" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="18677"
      > </a
      ><a name="18678" class="Symbol"
      >(</a
      ><a name="18679" href="Stlc.html#5002" class="InductiveConstructor"
      >bool</a
      ><a name="18683"
      > </a
      ><a name="18684" href="Stlc.html#5016" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="18685"
      > </a
      ><a name="18686" href="Stlc.html#5002" class="InductiveConstructor"
      >bool</a
      ><a name="18690" class="Symbol"
      >)</a
      ><a name="18691"
      > </a
      ><a name="18692" href="Stlc.html#5016" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="18693"
      > </a
      ><a name="18694" href="Stlc.html#5002" class="InductiveConstructor"
      >bool</a
      ><a name="18698" class="Symbol"
      >)</a
      ><a name="18699"
      >
</a
      ><a name="18700" href="Stlc.html#18553" class="Function"
      >typing-example2</a
      ><a name="18715"
      > </a
      ><a name="18716" class="Symbol"
      >=</a
      ><a name="18717"
      >
  </a
      ><a name="18720" class="Symbol"
      >(</a
      ><a name="18721" href="Stlc.html#17770" class="InductiveConstructor"
      >abs</a
      ><a name="18724"
      >
    </a
      ><a name="18729" class="Symbol"
      >(</a
      ><a name="18730" href="Stlc.html#17770" class="InductiveConstructor"
      >abs</a
      ><a name="18733"
      >
      </a
      ><a name="18740" class="Symbol"
      >(</a
      ><a name="18741" href="Stlc.html#17891" class="InductiveConstructor"
      >app</a
      ><a name="18744"
      > </a
      ><a name="18745" class="Symbol"
      >(</a
      ><a name="18746" href="Stlc.html#17672" class="InductiveConstructor"
      >var</a
      ><a name="18749"
      > </a
      ><a name="18750" href="Stlc.html#5947" class="Function"
      >y</a
      ><a name="18751"
      > </a
      ><a name="18752" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="18756" class="Symbol"
      >)</a
      ><a name="18757"
      >
        </a
      ><a name="18766" class="Symbol"
      >(</a
      ><a name="18767" href="Stlc.html#17891" class="InductiveConstructor"
      >app</a
      ><a name="18770"
      > </a
      ><a name="18771" class="Symbol"
      >(</a
      ><a name="18772" href="Stlc.html#17672" class="InductiveConstructor"
      >var</a
      ><a name="18775"
      > </a
      ><a name="18776" href="Stlc.html#5947" class="Function"
      >y</a
      ><a name="18777"
      > </a
      ><a name="18778" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="18782" class="Symbol"
      >)</a
      ><a name="18783"
      > </a
      ><a name="18784" class="Symbol"
      >(</a
      ><a name="18785" href="Stlc.html#17672" class="InductiveConstructor"
      >var</a
      ><a name="18788"
      > </a
      ><a name="18789" href="Stlc.html#5938" class="Function"
      >x</a
      ><a name="18790"
      > </a
      ><a name="18791" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="18795" class="Symbol"
      >)</a
      ><a name="18796"
      > </a
      ><a name="18797" class="Symbol"
      >))))</a
      >
{% endraw %}</pre>

#### Exercise: 2 stars (typing_example_3)
Formally prove the following typing derivation holds:

    empty ⊢ λx:bool⇒B. λy:bool⇒bool. \z:bool. y (x z) ∶ T.

<pre class="Agda">{% raw %}
<a name="18984" href="Stlc.html#18984" class="Function"
      >typing-example3</a
      ><a name="18999"
      > </a
      ><a name="19000" class="Symbol"
      >:</a
      ><a name="19001"
      > </a
      ><a name="19002" href="https://agda.github.io/agda-stdlib/Data.Product.html#823" class="Function"
      >&#8707;</a
      ><a name="19003"
      > </a
      ><a name="19004" class="Symbol"
      >&#955;</a
      ><a name="19005"
      > </a
      ><a name="19006" href="Stlc.html#19006" class="Bound"
      >A</a
      ><a name="19007"
      > </a
      ><a name="19008" class="Symbol"
      >&#8594;</a
      ><a name="19009"
      > </a
      ><a name="19010" href="Stlc.html#16677" class="Function"
      >&#8709;</a
      ><a name="19011"
      > </a
      ><a name="19012" href="Stlc.html#17628" class="Datatype Operator"
      >&#8866;</a
      ><a name="19013"
      >
  </a
      ><a name="19016" class="Symbol"
      >(</a
      ><a name="19017" href="Stlc.html#5470" class="InductiveConstructor"
      >abs</a
      ><a name="19020"
      > </a
      ><a name="19021" href="Stlc.html#5938" class="Function"
      >x</a
      ><a name="19022"
      > </a
      ><a name="19023" class="Symbol"
      >(</a
      ><a name="19024" href="Stlc.html#5002" class="InductiveConstructor"
      >bool</a
      ><a name="19028"
      > </a
      ><a name="19029" href="Stlc.html#5016" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="19030"
      > </a
      ><a name="19031" href="Stlc.html#5002" class="InductiveConstructor"
      >bool</a
      ><a name="19035" class="Symbol"
      >)</a
      ><a name="19036"
      >
    </a
      ><a name="19041" class="Symbol"
      >(</a
      ><a name="19042" href="Stlc.html#5470" class="InductiveConstructor"
      >abs</a
      ><a name="19045"
      > </a
      ><a name="19046" href="Stlc.html#5947" class="Function"
      >y</a
      ><a name="19047"
      > </a
      ><a name="19048" class="Symbol"
      >(</a
      ><a name="19049" href="Stlc.html#5002" class="InductiveConstructor"
      >bool</a
      ><a name="19053"
      > </a
      ><a name="19054" href="Stlc.html#5016" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="19055"
      > </a
      ><a name="19056" href="Stlc.html#5002" class="InductiveConstructor"
      >bool</a
      ><a name="19060" class="Symbol"
      >)</a
      ><a name="19061"
      >
      </a
      ><a name="19068" class="Symbol"
      >(</a
      ><a name="19069" href="Stlc.html#5470" class="InductiveConstructor"
      >abs</a
      ><a name="19072"
      > </a
      ><a name="19073" href="Stlc.html#5956" class="Function"
      >z</a
      ><a name="19074"
      > </a
      ><a name="19075" href="Stlc.html#5002" class="InductiveConstructor"
      >bool</a
      ><a name="19079"
      >
        </a
      ><a name="19088" class="Symbol"
      >(</a
      ><a name="19089" href="Stlc.html#5441" class="InductiveConstructor"
      >app</a
      ><a name="19092"
      > </a
      ><a name="19093" class="Symbol"
      >(</a
      ><a name="19094" href="Stlc.html#5421" class="InductiveConstructor"
      >var</a
      ><a name="19097"
      > </a
      ><a name="19098" href="Stlc.html#5947" class="Function"
      >y</a
      ><a name="19099" class="Symbol"
      >)</a
      ><a name="19100"
      > </a
      ><a name="19101" class="Symbol"
      >(</a
      ><a name="19102" href="Stlc.html#5441" class="InductiveConstructor"
      >app</a
      ><a name="19105"
      > </a
      ><a name="19106" class="Symbol"
      >(</a
      ><a name="19107" href="Stlc.html#5421" class="InductiveConstructor"
      >var</a
      ><a name="19110"
      > </a
      ><a name="19111" href="Stlc.html#5938" class="Function"
      >x</a
      ><a name="19112" class="Symbol"
      >)</a
      ><a name="19113"
      > </a
      ><a name="19114" class="Symbol"
      >(</a
      ><a name="19115" href="Stlc.html#5421" class="InductiveConstructor"
      >var</a
      ><a name="19118"
      > </a
      ><a name="19119" href="Stlc.html#5956" class="Function"
      >z</a
      ><a name="19120" class="Symbol"
      >))))))</a
      ><a name="19126"
      > </a
      ><a name="19127" href="Stlc.html#17628" class="Datatype Operator"
      >&#8758;</a
      ><a name="19128"
      > </a
      ><a name="19129" href="Stlc.html#19006" class="Bound"
      >A</a
      ><a name="19130"
      >
</a
      ><a name="19131" href="Stlc.html#18984" class="Function"
      >typing-example3</a
      ><a name="19146"
      > </a
      ><a name="19147" class="Symbol"
      >=</a
      ><a name="19148"
      > </a
      ><a name="19149" class="Symbol"
      >{!!}</a
      ><a name="19153"
      > </a
      ><a name="19154" class="Comment"
      >-- FILL IN HERE</a
      >
{% endraw %}</pre>

We can also show that terms are _not_ typable.  For example, let's
formally check that there is no typing derivation assigning a type
to the term `λx:bool. λy:bool, x y` -- i.e.,

    ~ exists T,
    empty ⊢ λx:bool. λy:bool, x y : T.

<pre class="Agda">{% raw %}
<a name="19431" href="Stlc.html#19431" class="Function"
      >typing-nonexample1</a
      ><a name="19449"
      > </a
      ><a name="19450" class="Symbol"
      >:</a
      ><a name="19451"
      > </a
      ><a name="19452" href="https://agda.github.io/agda-stdlib/Data.Product.html#884" class="Function"
      >&#8708;</a
      ><a name="19453"
      > </a
      ><a name="19454" class="Symbol"
      >&#955;</a
      ><a name="19455"
      > </a
      ><a name="19456" href="Stlc.html#19456" class="Bound"
      >A</a
      ><a name="19457"
      > </a
      ><a name="19458" class="Symbol"
      >&#8594;</a
      ><a name="19459"
      > </a
      ><a name="19460" href="Stlc.html#16677" class="Function"
      >&#8709;</a
      ><a name="19461"
      > </a
      ><a name="19462" href="Stlc.html#17628" class="Datatype Operator"
      >&#8866;</a
      ><a name="19463"
      >
  </a
      ><a name="19466" class="Symbol"
      >(</a
      ><a name="19467" href="Stlc.html#5470" class="InductiveConstructor"
      >abs</a
      ><a name="19470"
      > </a
      ><a name="19471" href="Stlc.html#5938" class="Function"
      >x</a
      ><a name="19472"
      > </a
      ><a name="19473" href="Stlc.html#5002" class="InductiveConstructor"
      >bool</a
      ><a name="19477"
      >
    </a
      ><a name="19482" class="Symbol"
      >(</a
      ><a name="19483" href="Stlc.html#5470" class="InductiveConstructor"
      >abs</a
      ><a name="19486"
      > </a
      ><a name="19487" href="Stlc.html#5947" class="Function"
      >y</a
      ><a name="19488"
      > </a
      ><a name="19489" href="Stlc.html#5002" class="InductiveConstructor"
      >bool</a
      ><a name="19493"
      >
      </a
      ><a name="19500" class="Symbol"
      >(</a
      ><a name="19501" href="Stlc.html#5441" class="InductiveConstructor"
      >app</a
      ><a name="19504"
      > </a
      ><a name="19505" class="Symbol"
      >(</a
      ><a name="19506" href="Stlc.html#5421" class="InductiveConstructor"
      >var</a
      ><a name="19509"
      > </a
      ><a name="19510" href="Stlc.html#5938" class="Function"
      >x</a
      ><a name="19511" class="Symbol"
      >)</a
      ><a name="19512"
      > </a
      ><a name="19513" class="Symbol"
      >(</a
      ><a name="19514" href="Stlc.html#5421" class="InductiveConstructor"
      >var</a
      ><a name="19517"
      > </a
      ><a name="19518" href="Stlc.html#5947" class="Function"
      >y</a
      ><a name="19519" class="Symbol"
      >))))</a
      ><a name="19523"
      > </a
      ><a name="19524" href="Stlc.html#17628" class="Datatype Operator"
      >&#8758;</a
      ><a name="19525"
      > </a
      ><a name="19526" href="Stlc.html#19456" class="Bound"
      >A</a
      ><a name="19527"
      >
</a
      ><a name="19528" href="Stlc.html#19431" class="Function"
      >typing-nonexample1</a
      ><a name="19546"
      > </a
      ><a name="19547" class="Symbol"
      >=</a
      ><a name="19548"
      > </a
      ><a name="19549" class="Symbol"
      >{!!}</a
      ><a name="19553"
      > </a
      ><a name="19554" class="Comment"
      >-- FILL IN HERE</a
      >
{% endraw %}</pre>

#### Exercise: 3 stars, optional (typing_nonexample_3)
Another nonexample:

    ~ (exists S, exists T,
    empty ⊢ λx:S. x x ∶ T).

<pre class="Agda">{% raw %}
<a name="19727" href="Stlc.html#19727" class="Function"
      >typing-nonexample2</a
      ><a name="19745"
      > </a
      ><a name="19746" class="Symbol"
      >:</a
      ><a name="19747"
      > </a
      ><a name="19748" href="https://agda.github.io/agda-stdlib/Data.Product.html#884" class="Function"
      >&#8708;</a
      ><a name="19749"
      > </a
      ><a name="19750" class="Symbol"
      >&#955;</a
      ><a name="19751"
      > </a
      ><a name="19752" href="Stlc.html#19752" class="Bound"
      >A</a
      ><a name="19753"
      > </a
      ><a name="19754" class="Symbol"
      >&#8594;</a
      ><a name="19755"
      > </a
      ><a name="19756" href="https://agda.github.io/agda-stdlib/Data.Product.html#823" class="Function"
      >&#8707;</a
      ><a name="19757"
      > </a
      ><a name="19758" class="Symbol"
      >&#955;</a
      ><a name="19759"
      > </a
      ><a name="19760" href="Stlc.html#19760" class="Bound"
      >B</a
      ><a name="19761"
      > </a
      ><a name="19762" class="Symbol"
      >&#8594;</a
      ><a name="19763"
      > </a
      ><a name="19764" href="Stlc.html#16677" class="Function"
      >&#8709;</a
      ><a name="19765"
      > </a
      ><a name="19766" href="Stlc.html#17628" class="Datatype Operator"
      >&#8866;</a
      ><a name="19767"
      >
  </a
      ><a name="19770" class="Symbol"
      >(</a
      ><a name="19771" href="Stlc.html#5470" class="InductiveConstructor"
      >abs</a
      ><a name="19774"
      > </a
      ><a name="19775" href="Stlc.html#5938" class="Function"
      >x</a
      ><a name="19776"
      > </a
      ><a name="19777" href="Stlc.html#19760" class="Bound"
      >B</a
      ><a name="19778"
      > </a
      ><a name="19779" class="Symbol"
      >(</a
      ><a name="19780" href="Stlc.html#5441" class="InductiveConstructor"
      >app</a
      ><a name="19783"
      > </a
      ><a name="19784" class="Symbol"
      >(</a
      ><a name="19785" href="Stlc.html#5421" class="InductiveConstructor"
      >var</a
      ><a name="19788"
      > </a
      ><a name="19789" href="Stlc.html#5938" class="Function"
      >x</a
      ><a name="19790" class="Symbol"
      >)</a
      ><a name="19791"
      > </a
      ><a name="19792" class="Symbol"
      >(</a
      ><a name="19793" href="Stlc.html#5421" class="InductiveConstructor"
      >var</a
      ><a name="19796"
      > </a
      ><a name="19797" href="Stlc.html#5938" class="Function"
      >x</a
      ><a name="19798" class="Symbol"
      >)))</a
      ><a name="19801"
      > </a
      ><a name="19802" href="Stlc.html#17628" class="Datatype Operator"
      >&#8758;</a
      ><a name="19803"
      > </a
      ><a name="19804" href="Stlc.html#19752" class="Bound"
      >A</a
      ><a name="19805"
      >
</a
      ><a name="19806" href="Stlc.html#19727" class="Function"
      >typing-nonexample2</a
      ><a name="19824"
      > </a
      ><a name="19825" class="Symbol"
      >=</a
      ><a name="19826"
      > </a
      ><a name="19827" class="Symbol"
      >{!!}</a
      ><a name="19831"
      > </a
      ><a name="19832" class="Comment"
      >-- FILL IN HERE</a
      >
{% endraw %}</pre>
