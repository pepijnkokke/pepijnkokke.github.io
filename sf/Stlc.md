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
<a name="4980" class="Keyword"
      >data</a
      ><a name="4984"
      > </a
      ><a name="4985" href="Stlc.html#4985" class="Datatype"
      >Type</a
      ><a name="4989"
      > </a
      ><a name="4990" class="Symbol"
      >:</a
      ><a name="4991"
      > </a
      ><a name="4992" class="PrimitiveType"
      >Set</a
      ><a name="4995"
      > </a
      ><a name="4996" class="Keyword"
      >where</a
      ><a name="5001"
      >
  </a
      ><a name="5004" href="Stlc.html#5004" class="InductiveConstructor"
      >bool</a
      ><a name="5008"
      > </a
      ><a name="5009" class="Symbol"
      >:</a
      ><a name="5010"
      > </a
      ><a name="5011" href="Stlc.html#4985" class="Datatype"
      >Type</a
      ><a name="5015"
      >
  </a
      ><a name="5018" href="Stlc.html#5018" class="InductiveConstructor Operator"
      >_&#8658;_</a
      ><a name="5021"
      > </a
      ><a name="5022" class="Symbol"
      >:</a
      ><a name="5023"
      > </a
      ><a name="5024" href="Stlc.html#4985" class="Datatype"
      >Type</a
      ><a name="5028"
      > </a
      ><a name="5029" class="Symbol"
      >&#8594;</a
      ><a name="5030"
      > </a
      ><a name="5031" href="Stlc.html#4985" class="Datatype"
      >Type</a
      ><a name="5035"
      > </a
      ><a name="5036" class="Symbol"
      >&#8594;</a
      ><a name="5037"
      > </a
      ><a name="5038" href="Stlc.html#4985" class="Datatype"
      >Type</a
      ><a name="5042"
      >

</a
      ><a name="5044" class="Keyword"
      >infixr</a
      ><a name="5050"
      > </a
      ><a name="5051" class="Number"
      >5</a
      >
{% endraw %}</pre>


### Terms

<pre class="Agda">{% raw %}
<a name="5094" class="Keyword"
      >data</a
      ><a name="5098"
      > </a
      ><a name="5099" href="Stlc.html#5099" class="Datatype"
      >Id</a
      ><a name="5101"
      > </a
      ><a name="5102" class="Symbol"
      >:</a
      ><a name="5103"
      > </a
      ><a name="5104" class="PrimitiveType"
      >Set</a
      ><a name="5107"
      > </a
      ><a name="5108" class="Keyword"
      >where</a
      ><a name="5113"
      >
  </a
      ><a name="5116" href="Stlc.html#5116" class="InductiveConstructor"
      >id</a
      ><a name="5118"
      > </a
      ><a name="5119" class="Symbol"
      >:</a
      ><a name="5120"
      > </a
      ><a name="5121" href="Agda.Builtin.Nat.html#69" class="Datatype"
      >&#8469;</a
      ><a name="5122"
      > </a
      ><a name="5123" class="Symbol"
      >&#8594;</a
      ><a name="5124"
      > </a
      ><a name="5125" href="Stlc.html#5099" class="Datatype"
      >Id</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="5174" href="Stlc.html#5174" class="Function"
      >id-inj</a
      ><a name="5180"
      > </a
      ><a name="5181" class="Symbol"
      >:</a
      ><a name="5182"
      > </a
      ><a name="5183" class="Symbol"
      >&#8704;</a
      ><a name="5184"
      > </a
      ><a name="5185" class="Symbol"
      >{</a
      ><a name="5186" href="Stlc.html#5186" class="Bound"
      >x</a
      ><a name="5187"
      > </a
      ><a name="5188" href="Stlc.html#5188" class="Bound"
      >y</a
      ><a name="5189" class="Symbol"
      >}</a
      ><a name="5190"
      > </a
      ><a name="5191" class="Symbol"
      >&#8594;</a
      ><a name="5192"
      > </a
      ><a name="5193" href="Stlc.html#5116" class="InductiveConstructor"
      >id</a
      ><a name="5195"
      > </a
      ><a name="5196" href="Stlc.html#5186" class="Bound"
      >x</a
      ><a name="5197"
      > </a
      ><a name="5198" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="5199"
      > </a
      ><a name="5200" href="Stlc.html#5116" class="InductiveConstructor"
      >id</a
      ><a name="5202"
      > </a
      ><a name="5203" href="Stlc.html#5188" class="Bound"
      >y</a
      ><a name="5204"
      > </a
      ><a name="5205" class="Symbol"
      >&#8594;</a
      ><a name="5206"
      > </a
      ><a name="5207" href="Stlc.html#5186" class="Bound"
      >x</a
      ><a name="5208"
      > </a
      ><a name="5209" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="5210"
      > </a
      ><a name="5211" href="Stlc.html#5188" class="Bound"
      >y</a
      ><a name="5212"
      >
</a
      ><a name="5213" href="Stlc.html#5174" class="Function"
      >id-inj</a
      ><a name="5219"
      > </a
      ><a name="5220" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="5224"
      > </a
      ><a name="5225" class="Symbol"
      >=</a
      ><a name="5226"
      > </a
      ><a name="5227" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="5231"
      >

</a
      ><a name="5233" href="Stlc.html#5233" class="Function Operator"
      >_&#8799;_</a
      ><a name="5236"
      > </a
      ><a name="5237" class="Symbol"
      >:</a
      ><a name="5238"
      > </a
      ><a name="5239" class="Symbol"
      >(</a
      ><a name="5240" href="Stlc.html#5240" class="Bound"
      >x</a
      ><a name="5241"
      > </a
      ><a name="5242" href="Stlc.html#5242" class="Bound"
      >y</a
      ><a name="5243"
      > </a
      ><a name="5244" class="Symbol"
      >:</a
      ><a name="5245"
      > </a
      ><a name="5246" href="Stlc.html#5099" class="Datatype"
      >Id</a
      ><a name="5248" class="Symbol"
      >)</a
      ><a name="5249"
      > </a
      ><a name="5250" class="Symbol"
      >&#8594;</a
      ><a name="5251"
      > </a
      ><a name="5252" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#484" class="Datatype"
      >Dec</a
      ><a name="5255"
      > </a
      ><a name="5256" class="Symbol"
      >(</a
      ><a name="5257" href="Stlc.html#5240" class="Bound"
      >x</a
      ><a name="5258"
      > </a
      ><a name="5259" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="5260"
      > </a
      ><a name="5261" href="Stlc.html#5242" class="Bound"
      >y</a
      ><a name="5262" class="Symbol"
      >)</a
      ><a name="5263"
      >
</a
      ><a name="5264" href="Stlc.html#5116" class="InductiveConstructor"
      >id</a
      ><a name="5266"
      > </a
      ><a name="5267" href="Stlc.html#5267" class="Bound"
      >x</a
      ><a name="5268"
      > </a
      ><a name="5269" href="Stlc.html#5233" class="Function Operator"
      >&#8799;</a
      ><a name="5270"
      > </a
      ><a name="5271" href="Stlc.html#5116" class="InductiveConstructor"
      >id</a
      ><a name="5273"
      > </a
      ><a name="5274" href="Stlc.html#5274" class="Bound"
      >y</a
      ><a name="5275"
      > </a
      ><a name="5276" class="Keyword"
      >with</a
      ><a name="5280"
      > </a
      ><a name="5281" href="Stlc.html#5267" class="Bound"
      >x</a
      ><a name="5282"
      > </a
      ><a name="5283" href="https://agda.github.io/agda-stdlib/Data.Nat.Base.html#3199" class="Function Operator"
      >Data.Nat.&#8799;</a
      ><a name="5293"
      > </a
      ><a name="5294" href="Stlc.html#5274" class="Bound"
      >y</a
      ><a name="5295"
      >
</a
      ><a name="5296" class="Symbol"
      >...</a
      ><a name="5299"
      > </a
      ><a name="5300" class="Symbol"
      >|</a
      ><a name="5301"
      > </a
      ><a name="5302" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="5305"
      > </a
      ><a name="5306" href="Stlc.html#5306" class="Bound"
      >x=y</a
      ><a name="5309"
      > </a
      ><a name="5310" class="Keyword"
      >rewrite</a
      ><a name="5317"
      > </a
      ><a name="5318" href="Stlc.html#5306" class="Bound"
      >x=y</a
      ><a name="5321"
      > </a
      ><a name="5322" class="Symbol"
      >=</a
      ><a name="5323"
      > </a
      ><a name="5324" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="5327"
      > </a
      ><a name="5328" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="5332"
      >
</a
      ><a name="5333" class="Symbol"
      >...</a
      ><a name="5336"
      > </a
      ><a name="5337" class="Symbol"
      >|</a
      ><a name="5338"
      > </a
      ><a name="5339" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="5341"
      >  </a
      ><a name="5343" href="Stlc.html#5343" class="Bound"
      >x&#8800;y</a
      ><a name="5346"
      > </a
      ><a name="5347" class="Symbol"
      >=</a
      ><a name="5348"
      > </a
      ><a name="5349" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="5351"
      > </a
      ><a name="5352" class="Symbol"
      >(</a
      ><a name="5353" href="Stlc.html#5343" class="Bound"
      >x&#8800;y</a
      ><a name="5356"
      > </a
      ><a name="5357" href="https://agda.github.io/agda-stdlib/Function.html#713" class="Function Operator"
      >&#8728;</a
      ><a name="5358"
      > </a
      ><a name="5359" href="Stlc.html#5174" class="Function"
      >id-inj</a
      ><a name="5365" class="Symbol"
      >)</a
      >
{% endraw %}</pre>
</div>

<pre class="Agda">{% raw %}
<a name="5399" class="Keyword"
      >data</a
      ><a name="5403"
      > </a
      ><a name="5404" href="Stlc.html#5404" class="Datatype"
      >Term</a
      ><a name="5408"
      > </a
      ><a name="5409" class="Symbol"
      >:</a
      ><a name="5410"
      > </a
      ><a name="5411" class="PrimitiveType"
      >Set</a
      ><a name="5414"
      > </a
      ><a name="5415" class="Keyword"
      >where</a
      ><a name="5420"
      >
  </a
      ><a name="5423" href="Stlc.html#5423" class="InductiveConstructor"
      >var</a
      ><a name="5426"
      >   </a
      ><a name="5429" class="Symbol"
      >:</a
      ><a name="5430"
      > </a
      ><a name="5431" href="Stlc.html#5099" class="Datatype"
      >Id</a
      ><a name="5433"
      > </a
      ><a name="5434" class="Symbol"
      >&#8594;</a
      ><a name="5435"
      > </a
      ><a name="5436" href="Stlc.html#5404" class="Datatype"
      >Term</a
      ><a name="5440"
      >
  </a
      ><a name="5443" href="Stlc.html#5443" class="InductiveConstructor"
      >app</a
      ><a name="5446"
      >   </a
      ><a name="5449" class="Symbol"
      >:</a
      ><a name="5450"
      > </a
      ><a name="5451" href="Stlc.html#5404" class="Datatype"
      >Term</a
      ><a name="5455"
      > </a
      ><a name="5456" class="Symbol"
      >&#8594;</a
      ><a name="5457"
      > </a
      ><a name="5458" href="Stlc.html#5404" class="Datatype"
      >Term</a
      ><a name="5462"
      > </a
      ><a name="5463" class="Symbol"
      >&#8594;</a
      ><a name="5464"
      > </a
      ><a name="5465" href="Stlc.html#5404" class="Datatype"
      >Term</a
      ><a name="5469"
      >
  </a
      ><a name="5472" href="Stlc.html#5472" class="InductiveConstructor"
      >abs</a
      ><a name="5475"
      >   </a
      ><a name="5478" class="Symbol"
      >:</a
      ><a name="5479"
      > </a
      ><a name="5480" href="Stlc.html#5099" class="Datatype"
      >Id</a
      ><a name="5482"
      > </a
      ><a name="5483" class="Symbol"
      >&#8594;</a
      ><a name="5484"
      > </a
      ><a name="5485" href="Stlc.html#4985" class="Datatype"
      >Type</a
      ><a name="5489"
      > </a
      ><a name="5490" class="Symbol"
      >&#8594;</a
      ><a name="5491"
      > </a
      ><a name="5492" href="Stlc.html#5404" class="Datatype"
      >Term</a
      ><a name="5496"
      > </a
      ><a name="5497" class="Symbol"
      >&#8594;</a
      ><a name="5498"
      > </a
      ><a name="5499" href="Stlc.html#5404" class="Datatype"
      >Term</a
      ><a name="5503"
      >
  </a
      ><a name="5506" href="Stlc.html#5506" class="InductiveConstructor"
      >true</a
      ><a name="5510"
      >  </a
      ><a name="5512" class="Symbol"
      >:</a
      ><a name="5513"
      > </a
      ><a name="5514" href="Stlc.html#5404" class="Datatype"
      >Term</a
      ><a name="5518"
      >
  </a
      ><a name="5521" href="Stlc.html#5521" class="InductiveConstructor"
      >false</a
      ><a name="5526"
      > </a
      ><a name="5527" class="Symbol"
      >:</a
      ><a name="5528"
      > </a
      ><a name="5529" href="Stlc.html#5404" class="Datatype"
      >Term</a
      ><a name="5533"
      >
  </a
      ><a name="5536" href="Stlc.html#5536" class="InductiveConstructor Operator"
      >if_then_else_</a
      ><a name="5549"
      > </a
      ><a name="5550" class="Symbol"
      >:</a
      ><a name="5551"
      > </a
      ><a name="5552" href="Stlc.html#5404" class="Datatype"
      >Term</a
      ><a name="5556"
      > </a
      ><a name="5557" class="Symbol"
      >&#8594;</a
      ><a name="5558"
      > </a
      ><a name="5559" href="Stlc.html#5404" class="Datatype"
      >Term</a
      ><a name="5563"
      > </a
      ><a name="5564" class="Symbol"
      >&#8594;</a
      ><a name="5565"
      > </a
      ><a name="5566" href="Stlc.html#5404" class="Datatype"
      >Term</a
      ><a name="5570"
      > </a
      ><a name="5571" class="Symbol"
      >&#8594;</a
      ><a name="5572"
      > </a
      ><a name="5573" href="Stlc.html#5404" class="Datatype"
      >Term</a
      ><a name="5577"
      >

</a
      ><a name="5579" class="Keyword"
      >infixr</a
      ><a name="5585"
      > </a
      ><a name="5586" class="Number"
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
<a name="5940" href="Stlc.html#5940" class="Function"
      >x</a
      ><a name="5941"
      > </a
      ><a name="5942" class="Symbol"
      >=</a
      ><a name="5943"
      > </a
      ><a name="5944" href="Stlc.html#5116" class="InductiveConstructor"
      >id</a
      ><a name="5946"
      > </a
      ><a name="5947" class="Number"
      >0</a
      ><a name="5948"
      >
</a
      ><a name="5949" href="Stlc.html#5949" class="Function"
      >y</a
      ><a name="5950"
      > </a
      ><a name="5951" class="Symbol"
      >=</a
      ><a name="5952"
      > </a
      ><a name="5953" href="Stlc.html#5116" class="InductiveConstructor"
      >id</a
      ><a name="5955"
      > </a
      ><a name="5956" class="Number"
      >1</a
      ><a name="5957"
      >
</a
      ><a name="5958" href="Stlc.html#5958" class="Function"
      >z</a
      ><a name="5959"
      > </a
      ><a name="5960" class="Symbol"
      >=</a
      ><a name="5961"
      > </a
      ><a name="5962" href="Stlc.html#5116" class="InductiveConstructor"
      >id</a
      ><a name="5964"
      > </a
      ><a name="5965" class="Number"
      >2</a
      >
{% endraw %}</pre>
<div class="hidden">
<pre class="Agda">{% raw %}
<a name="6012" class="Symbol"
      >{-#</a
      ><a name="6015"
      > </a
      ><a name="6016" class="Keyword"
      >DISPLAY</a
      ><a name="6023"
      > </a
      ><a name="6024" href="Agda.Builtin.Nat.html#87" class="InductiveConstructor"
      >zero</a
      ><a name="6028"
      > = </a
      ><a name="6031" href="Stlc.html#5940" class="Function"
      >x</a
      ><a name="6032"
      > </a
      ><a name="6033" class="Symbol"
      >#-}</a
      ><a name="6036"
      >
</a
      ><a name="6037" class="Symbol"
      >{-#</a
      ><a name="6040"
      > </a
      ><a name="6041" class="Keyword"
      >DISPLAY</a
      ><a name="6048"
      > </a
      ><a name="6049" href="Agda.Builtin.Nat.html#100" class="InductiveConstructor"
      >suc</a
      ><a name="6052"
      > </a
      ><a name="6053" href="Agda.Builtin.Nat.html#87" class="InductiveConstructor"
      >zero</a
      ><a name="6057"
      > = </a
      ><a name="6060" href="Stlc.html#5949" class="Function"
      >y</a
      ><a name="6061"
      > </a
      ><a name="6062" class="Symbol"
      >#-}</a
      ><a name="6065"
      >
</a
      ><a name="6066" class="Symbol"
      >{-#</a
      ><a name="6069"
      > </a
      ><a name="6070" class="Keyword"
      >DISPLAY</a
      ><a name="6077"
      > </a
      ><a name="6078" href="Agda.Builtin.Nat.html#100" class="InductiveConstructor"
      >suc</a
      ><a name="6081"
      > (</a
      ><a name="6083" href="Agda.Builtin.Nat.html#100" class="InductiveConstructor"
      >suc</a
      ><a name="6086"
      > </a
      ><a name="6087" href="Agda.Builtin.Nat.html#87" class="InductiveConstructor"
      >zero</a
      ><a name="6091"
      >) = </a
      ><a name="6095" href="Stlc.html#5958" class="Function"
      >z</a
      ><a name="6096"
      > </a
      ><a name="6097" class="Symbol"
      >#-}</a
      >
{% endraw %}</pre>
</div>

`idB = λx:bool. x`

<pre class="Agda">{% raw %}
<a name="6153" href="Stlc.html#6153" class="Function"
      >idB</a
      ><a name="6156"
      > </a
      ><a name="6157" class="Symbol"
      >=</a
      ><a name="6158"
      > </a
      ><a name="6159" class="Symbol"
      >(</a
      ><a name="6160" href="Stlc.html#5472" class="InductiveConstructor"
      >abs</a
      ><a name="6163"
      > </a
      ><a name="6164" href="Stlc.html#5940" class="Function"
      >x</a
      ><a name="6165"
      > </a
      ><a name="6166" href="Stlc.html#5004" class="InductiveConstructor"
      >bool</a
      ><a name="6170"
      > </a
      ><a name="6171" class="Symbol"
      >(</a
      ><a name="6172" href="Stlc.html#5423" class="InductiveConstructor"
      >var</a
      ><a name="6175"
      > </a
      ><a name="6176" href="Stlc.html#5940" class="Function"
      >x</a
      ><a name="6177" class="Symbol"
      >))</a
      >
{% endraw %}</pre>

`idBB = λx:bool⇒bool. x`

<pre class="Agda">{% raw %}
<a name="6231" href="Stlc.html#6231" class="Function"
      >idBB</a
      ><a name="6235"
      > </a
      ><a name="6236" class="Symbol"
      >=</a
      ><a name="6237"
      > </a
      ><a name="6238" class="Symbol"
      >(</a
      ><a name="6239" href="Stlc.html#5472" class="InductiveConstructor"
      >abs</a
      ><a name="6242"
      > </a
      ><a name="6243" href="Stlc.html#5940" class="Function"
      >x</a
      ><a name="6244"
      > </a
      ><a name="6245" class="Symbol"
      >(</a
      ><a name="6246" href="Stlc.html#5004" class="InductiveConstructor"
      >bool</a
      ><a name="6250"
      > </a
      ><a name="6251" href="Stlc.html#5018" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="6252"
      > </a
      ><a name="6253" href="Stlc.html#5004" class="InductiveConstructor"
      >bool</a
      ><a name="6257" class="Symbol"
      >)</a
      ><a name="6258"
      > </a
      ><a name="6259" class="Symbol"
      >(</a
      ><a name="6260" href="Stlc.html#5423" class="InductiveConstructor"
      >var</a
      ><a name="6263"
      > </a
      ><a name="6264" href="Stlc.html#5940" class="Function"
      >x</a
      ><a name="6265" class="Symbol"
      >))</a
      >
{% endraw %}</pre>

`idBBBB = λx:(bool⇒bool) → (bool⇒bool). x`

<pre class="Agda">{% raw %}
<a name="6337" href="Stlc.html#6337" class="Function"
      >idBBBB</a
      ><a name="6343"
      > </a
      ><a name="6344" class="Symbol"
      >=</a
      ><a name="6345"
      > </a
      ><a name="6346" class="Symbol"
      >(</a
      ><a name="6347" href="Stlc.html#5472" class="InductiveConstructor"
      >abs</a
      ><a name="6350"
      > </a
      ><a name="6351" href="Stlc.html#5940" class="Function"
      >x</a
      ><a name="6352"
      > </a
      ><a name="6353" class="Symbol"
      >((</a
      ><a name="6355" href="Stlc.html#5004" class="InductiveConstructor"
      >bool</a
      ><a name="6359"
      > </a
      ><a name="6360" href="Stlc.html#5018" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="6361"
      > </a
      ><a name="6362" href="Stlc.html#5004" class="InductiveConstructor"
      >bool</a
      ><a name="6366" class="Symbol"
      >)</a
      ><a name="6367"
      > </a
      ><a name="6368" href="Stlc.html#5018" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="6369"
      > </a
      ><a name="6370" class="Symbol"
      >(</a
      ><a name="6371" href="Stlc.html#5004" class="InductiveConstructor"
      >bool</a
      ><a name="6375"
      > </a
      ><a name="6376" href="Stlc.html#5018" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="6377"
      > </a
      ><a name="6378" href="Stlc.html#5004" class="InductiveConstructor"
      >bool</a
      ><a name="6382" class="Symbol"
      >))</a
      ><a name="6384"
      > </a
      ><a name="6385" class="Symbol"
      >(</a
      ><a name="6386" href="Stlc.html#5423" class="InductiveConstructor"
      >var</a
      ><a name="6389"
      > </a
      ><a name="6390" href="Stlc.html#5940" class="Function"
      >x</a
      ><a name="6391" class="Symbol"
      >))</a
      >
{% endraw %}</pre>

`k = λx:bool. λy:bool. x`

<pre class="Agda">{% raw %}
<a name="6446" href="Stlc.html#6446" class="Function"
      >k</a
      ><a name="6447"
      > </a
      ><a name="6448" class="Symbol"
      >=</a
      ><a name="6449"
      > </a
      ><a name="6450" class="Symbol"
      >(</a
      ><a name="6451" href="Stlc.html#5472" class="InductiveConstructor"
      >abs</a
      ><a name="6454"
      > </a
      ><a name="6455" href="Stlc.html#5940" class="Function"
      >x</a
      ><a name="6456"
      > </a
      ><a name="6457" href="Stlc.html#5004" class="InductiveConstructor"
      >bool</a
      ><a name="6461"
      > </a
      ><a name="6462" class="Symbol"
      >(</a
      ><a name="6463" href="Stlc.html#5472" class="InductiveConstructor"
      >abs</a
      ><a name="6466"
      > </a
      ><a name="6467" href="Stlc.html#5949" class="Function"
      >y</a
      ><a name="6468"
      > </a
      ><a name="6469" href="Stlc.html#5004" class="InductiveConstructor"
      >bool</a
      ><a name="6473"
      > </a
      ><a name="6474" class="Symbol"
      >(</a
      ><a name="6475" href="Stlc.html#5423" class="InductiveConstructor"
      >var</a
      ><a name="6478"
      > </a
      ><a name="6479" href="Stlc.html#5940" class="Function"
      >x</a
      ><a name="6480" class="Symbol"
      >)))</a
      >
{% endraw %}</pre>

`notB = λx:bool. if x then false else true`

<pre class="Agda">{% raw %}
<a name="6554" href="Stlc.html#6554" class="Function"
      >notB</a
      ><a name="6558"
      > </a
      ><a name="6559" class="Symbol"
      >=</a
      ><a name="6560"
      > </a
      ><a name="6561" class="Symbol"
      >(</a
      ><a name="6562" href="Stlc.html#5472" class="InductiveConstructor"
      >abs</a
      ><a name="6565"
      > </a
      ><a name="6566" href="Stlc.html#5940" class="Function"
      >x</a
      ><a name="6567"
      > </a
      ><a name="6568" href="Stlc.html#5004" class="InductiveConstructor"
      >bool</a
      ><a name="6572"
      > </a
      ><a name="6573" class="Symbol"
      >(</a
      ><a name="6574" href="Stlc.html#5536" class="InductiveConstructor Operator"
      >if</a
      ><a name="6576"
      > </a
      ><a name="6577" class="Symbol"
      >(</a
      ><a name="6578" href="Stlc.html#5423" class="InductiveConstructor"
      >var</a
      ><a name="6581"
      > </a
      ><a name="6582" href="Stlc.html#5940" class="Function"
      >x</a
      ><a name="6583" class="Symbol"
      >)</a
      ><a name="6584"
      > </a
      ><a name="6585" href="Stlc.html#5536" class="InductiveConstructor Operator"
      >then</a
      ><a name="6589"
      > </a
      ><a name="6590" href="Stlc.html#5521" class="InductiveConstructor"
      >false</a
      ><a name="6595"
      > </a
      ><a name="6596" href="Stlc.html#5536" class="InductiveConstructor Operator"
      >else</a
      ><a name="6600"
      > </a
      ><a name="6601" href="Stlc.html#5506" class="InductiveConstructor"
      >true</a
      ><a name="6605" class="Symbol"
      >))</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="6654" class="Symbol"
      >{-#</a
      ><a name="6657"
      > </a
      ><a name="6658" class="Keyword"
      >DISPLAY</a
      ><a name="6665"
      > </a
      ><a name="6666" href="Stlc.html#5472" class="InductiveConstructor"
      >abs</a
      ><a name="6669"
      > 0 </a
      ><a name="6672" href="Stlc.html#5004" class="InductiveConstructor"
      >bool</a
      ><a name="6676"
      > (</a
      ><a name="6678" href="Stlc.html#5423" class="InductiveConstructor"
      >var</a
      ><a name="6681"
      > 0) = </a
      ><a name="6687" href="Stlc.html#6153" class="Function"
      >idB</a
      ><a name="6690"
      > </a
      ><a name="6691" class="Symbol"
      >#-}</a
      ><a name="6694"
      >
</a
      ><a name="6695" class="Symbol"
      >{-#</a
      ><a name="6698"
      > </a
      ><a name="6699" class="Keyword"
      >DISPLAY</a
      ><a name="6706"
      > </a
      ><a name="6707" href="Stlc.html#5472" class="InductiveConstructor"
      >abs</a
      ><a name="6710"
      > 0 (</a
      ><a name="6714" href="Stlc.html#5004" class="InductiveConstructor"
      >bool</a
      ><a name="6718"
      > </a
      ><a name="6719" href="Stlc.html#5018" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="6720"
      > </a
      ><a name="6721" href="Stlc.html#5004" class="InductiveConstructor"
      >bool</a
      ><a name="6725"
      >) (</a
      ><a name="6728" href="Stlc.html#5423" class="InductiveConstructor"
      >var</a
      ><a name="6731"
      > 0) = </a
      ><a name="6737" href="Stlc.html#6231" class="Function"
      >idBB</a
      ><a name="6741"
      > </a
      ><a name="6742" class="Symbol"
      >#-}</a
      ><a name="6745"
      >
</a
      ><a name="6746" class="Symbol"
      >{-#</a
      ><a name="6749"
      > </a
      ><a name="6750" class="Keyword"
      >DISPLAY</a
      ><a name="6757"
      > </a
      ><a name="6758" href="Stlc.html#5472" class="InductiveConstructor"
      >abs</a
      ><a name="6761"
      > 0 ((</a
      ><a name="6766" href="Stlc.html#5004" class="InductiveConstructor"
      >bool</a
      ><a name="6770"
      > </a
      ><a name="6771" href="Stlc.html#5018" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="6772"
      > </a
      ><a name="6773" href="Stlc.html#5004" class="InductiveConstructor"
      >bool</a
      ><a name="6777"
      >) </a
      ><a name="6779" href="Stlc.html#5018" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="6780"
      > (</a
      ><a name="6782" href="Stlc.html#5004" class="InductiveConstructor"
      >bool</a
      ><a name="6786"
      > </a
      ><a name="6787" href="Stlc.html#5018" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="6788"
      > </a
      ><a name="6789" href="Stlc.html#5004" class="InductiveConstructor"
      >bool</a
      ><a name="6793"
      >)) (</a
      ><a name="6797" href="Stlc.html#5423" class="InductiveConstructor"
      >var</a
      ><a name="6800"
      > 0) = </a
      ><a name="6806" href="Stlc.html#6337" class="Function"
      >idBBBB</a
      ><a name="6812"
      > </a
      ><a name="6813" class="Symbol"
      >#-}</a
      ><a name="6816"
      >
</a
      ><a name="6817" class="Symbol"
      >{-#</a
      ><a name="6820"
      > </a
      ><a name="6821" class="Keyword"
      >DISPLAY</a
      ><a name="6828"
      > </a
      ><a name="6829" href="Stlc.html#5472" class="InductiveConstructor"
      >abs</a
      ><a name="6832"
      > 0 </a
      ><a name="6835" href="Stlc.html#5004" class="InductiveConstructor"
      >bool</a
      ><a name="6839"
      > (</a
      ><a name="6841" href="Stlc.html#5472" class="InductiveConstructor"
      >abs</a
      ><a name="6844"
      > </a
      ><a name="6845" href="Stlc.html#6845" class="Bound"
      >y</a
      ><a name="6846"
      > </a
      ><a name="6847" href="Stlc.html#5004" class="InductiveConstructor"
      >bool</a
      ><a name="6851"
      > (</a
      ><a name="6853" href="Stlc.html#5423" class="InductiveConstructor"
      >var</a
      ><a name="6856"
      > 0)) = </a
      ><a name="6863" href="Stlc.html#6446" class="Function"
      >k</a
      ><a name="6864"
      > </a
      ><a name="6865" class="Symbol"
      >#-}</a
      ><a name="6868"
      >
</a
      ><a name="6869" class="Symbol"
      >{-#</a
      ><a name="6872"
      > </a
      ><a name="6873" class="Keyword"
      >DISPLAY</a
      ><a name="6880"
      > </a
      ><a name="6881" href="Stlc.html#5472" class="InductiveConstructor"
      >abs</a
      ><a name="6884"
      > 0 </a
      ><a name="6887" href="Stlc.html#5004" class="InductiveConstructor"
      >bool</a
      ><a name="6891"
      > (</a
      ><a name="6893" href="Stlc.html#5536" class="InductiveConstructor Operator"
      >if</a
      ><a name="6895"
      > (</a
      ><a name="6897" href="Stlc.html#5423" class="InductiveConstructor"
      >var</a
      ><a name="6900"
      > 0) </a
      ><a name="6904" href="Stlc.html#5536" class="InductiveConstructor Operator"
      >then</a
      ><a name="6908"
      > </a
      ><a name="6909" href="Stlc.html#5521" class="InductiveConstructor"
      >false</a
      ><a name="6914"
      > </a
      ><a name="6915" href="Stlc.html#5536" class="InductiveConstructor Operator"
      >else</a
      ><a name="6919"
      > </a
      ><a name="6920" href="Stlc.html#5506" class="InductiveConstructor"
      >true</a
      ><a name="6924"
      >) = </a
      ><a name="6928" href="Stlc.html#6554" class="Function"
      >notB</a
      ><a name="6932"
      > </a
      ><a name="6933" class="Symbol"
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
<a name="8143" href="Stlc.html#8143" class="Function"
      >testNormalize</a
      ><a name="8156"
      > </a
      ><a name="8157" class="Symbol"
      >:</a
      ><a name="8158"
      > </a
      ><a name="8159" class="Symbol"
      >(&#955;</a
      ><a name="8161"
      > </a
      ><a name="8162" class="Symbol"
      >(</a
      ><a name="8163" href="Stlc.html#8163" class="Bound"
      >x</a
      ><a name="8164"
      > </a
      ><a name="8165" class="Symbol"
      >:</a
      ><a name="8166"
      > </a
      ><a name="8167" href="Agda.Builtin.Nat.html#69" class="Datatype"
      >&#8469;</a
      ><a name="8168" class="Symbol"
      >)</a
      ><a name="8169"
      > </a
      ><a name="8170" class="Symbol"
      >&#8594;</a
      ><a name="8171"
      > </a
      ><a name="8172" class="Number"
      >3</a
      ><a name="8173"
      > </a
      ><a name="8174" href="Agda.Builtin.Nat.html#202" class="Primitive Operator"
      >+</a
      ><a name="8175"
      > </a
      ><a name="8176" class="Number"
      >4</a
      ><a name="8177" class="Symbol"
      >)</a
      ><a name="8178"
      > </a
      ><a name="8179" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="8180"
      > </a
      ><a name="8181" class="Symbol"
      >(&#955;</a
      ><a name="8183"
      > </a
      ><a name="8184" class="Symbol"
      >(</a
      ><a name="8185" href="Stlc.html#8185" class="Bound"
      >x</a
      ><a name="8186"
      > </a
      ><a name="8187" class="Symbol"
      >:</a
      ><a name="8188"
      > </a
      ><a name="8189" href="Agda.Builtin.Nat.html#69" class="Datatype"
      >&#8469;</a
      ><a name="8190" class="Symbol"
      >)</a
      ><a name="8191"
      > </a
      ><a name="8192" class="Symbol"
      >&#8594;</a
      ><a name="8193"
      > </a
      ><a name="8194" class="Number"
      >7</a
      ><a name="8195" class="Symbol"
      >)</a
      ><a name="8196"
      >
</a
      ><a name="8197" href="Stlc.html#8143" class="Function"
      >testNormalize</a
      ><a name="8210"
      > </a
      ><a name="8211" class="Symbol"
      >=</a
      ><a name="8212"
      > </a
      ><a name="8213" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      >
{% endraw %}</pre>

Most real-world functional programming languages make the second
choice -- reduction of a function's body only begins when the
function is actually applied to an argument.  We also make the
second choice here.

<pre class="Agda">{% raw %}
<a name="8454" class="Keyword"
      >data</a
      ><a name="8458"
      > </a
      ><a name="8459" href="Stlc.html#8459" class="Datatype"
      >Value</a
      ><a name="8464"
      > </a
      ><a name="8465" class="Symbol"
      >:</a
      ><a name="8466"
      > </a
      ><a name="8467" href="Stlc.html#5404" class="Datatype"
      >Term</a
      ><a name="8471"
      > </a
      ><a name="8472" class="Symbol"
      >&#8594;</a
      ><a name="8473"
      > </a
      ><a name="8474" class="PrimitiveType"
      >Set</a
      ><a name="8477"
      > </a
      ><a name="8478" class="Keyword"
      >where</a
      ><a name="8483"
      >
  </a
      ><a name="8486" href="Stlc.html#8486" class="InductiveConstructor"
      >abs</a
      ><a name="8489"
      >   </a
      ><a name="8492" class="Symbol"
      >:</a
      ><a name="8493"
      > </a
      ><a name="8494" class="Symbol"
      >forall</a
      ><a name="8500"
      > </a
      ><a name="8501" class="Symbol"
      >{</a
      ><a name="8502" href="Stlc.html#8502" class="Bound"
      >x</a
      ><a name="8503"
      > </a
      ><a name="8504" href="Stlc.html#8504" class="Bound"
      >A</a
      ><a name="8505"
      > </a
      ><a name="8506" href="Stlc.html#8506" class="Bound"
      >t</a
      ><a name="8507" class="Symbol"
      >}</a
      ><a name="8508"
      >
        </a
      ><a name="8517" class="Symbol"
      >&#8594;</a
      ><a name="8518"
      > </a
      ><a name="8519" href="Stlc.html#8459" class="Datatype"
      >Value</a
      ><a name="8524"
      > </a
      ><a name="8525" class="Symbol"
      >(</a
      ><a name="8526" href="Stlc.html#5472" class="InductiveConstructor"
      >abs</a
      ><a name="8529"
      > </a
      ><a name="8530" href="Stlc.html#8502" class="Bound"
      >x</a
      ><a name="8531"
      > </a
      ><a name="8532" href="Stlc.html#8504" class="Bound"
      >A</a
      ><a name="8533"
      > </a
      ><a name="8534" href="Stlc.html#8506" class="Bound"
      >t</a
      ><a name="8535" class="Symbol"
      >)</a
      ><a name="8536"
      >
  </a
      ><a name="8539" href="Stlc.html#8539" class="InductiveConstructor"
      >true</a
      ><a name="8543"
      >  </a
      ><a name="8545" class="Symbol"
      >:</a
      ><a name="8546"
      > </a
      ><a name="8547" href="Stlc.html#8459" class="Datatype"
      >Value</a
      ><a name="8552"
      > </a
      ><a name="8553" href="Stlc.html#5506" class="InductiveConstructor"
      >true</a
      ><a name="8557"
      >
  </a
      ><a name="8560" href="Stlc.html#8560" class="InductiveConstructor"
      >false</a
      ><a name="8565"
      > </a
      ><a name="8566" class="Symbol"
      >:</a
      ><a name="8567"
      > </a
      ><a name="8568" href="Stlc.html#8459" class="Datatype"
      >Value</a
      ><a name="8573"
      > </a
      ><a name="8574" href="Stlc.html#5521" class="InductiveConstructor"
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
<a name="11149" href="Stlc.html#11149" class="Function Operator"
      >[_:=_]_</a
      ><a name="11156"
      > </a
      ><a name="11157" class="Symbol"
      >:</a
      ><a name="11158"
      > </a
      ><a name="11159" href="Stlc.html#5099" class="Datatype"
      >Id</a
      ><a name="11161"
      > </a
      ><a name="11162" class="Symbol"
      >-&gt;</a
      ><a name="11164"
      > </a
      ><a name="11165" href="Stlc.html#5404" class="Datatype"
      >Term</a
      ><a name="11169"
      > </a
      ><a name="11170" class="Symbol"
      >-&gt;</a
      ><a name="11172"
      > </a
      ><a name="11173" href="Stlc.html#5404" class="Datatype"
      >Term</a
      ><a name="11177"
      > </a
      ><a name="11178" class="Symbol"
      >-&gt;</a
      ><a name="11180"
      > </a
      ><a name="11181" href="Stlc.html#5404" class="Datatype"
      >Term</a
      ><a name="11185"
      >
</a
      ><a name="11186" href="Stlc.html#11149" class="Function Operator"
      >[</a
      ><a name="11187"
      > </a
      ><a name="11188" href="Stlc.html#11188" class="Bound"
      >x</a
      ><a name="11189"
      > </a
      ><a name="11190" href="Stlc.html#11149" class="Function Operator"
      >:=</a
      ><a name="11192"
      > </a
      ><a name="11193" href="Stlc.html#11193" class="Bound"
      >v</a
      ><a name="11194"
      > </a
      ><a name="11195" href="Stlc.html#11149" class="Function Operator"
      >]</a
      ><a name="11196"
      > </a
      ><a name="11197" class="Symbol"
      >(</a
      ><a name="11198" href="Stlc.html#5423" class="InductiveConstructor"
      >var</a
      ><a name="11201"
      > </a
      ><a name="11202" href="Stlc.html#11202" class="Bound"
      >y</a
      ><a name="11203" class="Symbol"
      >)</a
      ><a name="11204"
      > </a
      ><a name="11205" class="Keyword"
      >with</a
      ><a name="11209"
      > </a
      ><a name="11210" href="Stlc.html#11188" class="Bound"
      >x</a
      ><a name="11211"
      > </a
      ><a name="11212" href="Stlc.html#5233" class="Function Operator"
      >&#8799;</a
      ><a name="11213"
      > </a
      ><a name="11214" href="Stlc.html#11202" class="Bound"
      >y</a
      ><a name="11215"
      >
</a
      ><a name="11216" class="Symbol"
      >...</a
      ><a name="11219"
      > </a
      ><a name="11220" class="Symbol"
      >|</a
      ><a name="11221"
      > </a
      ><a name="11222" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="11225"
      > </a
      ><a name="11226" href="Stlc.html#11226" class="Bound"
      >x=y</a
      ><a name="11229"
      > </a
      ><a name="11230" class="Symbol"
      >=</a
      ><a name="11231"
      > </a
      ><a name="11232" href="Stlc.html#11193" class="Bound"
      >v</a
      ><a name="11233"
      >
</a
      ><a name="11234" class="Symbol"
      >...</a
      ><a name="11237"
      > </a
      ><a name="11238" class="Symbol"
      >|</a
      ><a name="11239"
      > </a
      ><a name="11240" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="11242"
      >  </a
      ><a name="11244" href="Stlc.html#11244" class="Bound"
      >x&#8800;y</a
      ><a name="11247"
      > </a
      ><a name="11248" class="Symbol"
      >=</a
      ><a name="11249"
      > </a
      ><a name="11250" href="Stlc.html#5423" class="InductiveConstructor"
      >var</a
      ><a name="11253"
      > </a
      ><a name="11254" href="Stlc.html#11202" class="Bound"
      >y</a
      ><a name="11255"
      >
</a
      ><a name="11256" href="Stlc.html#11149" class="Function Operator"
      >[</a
      ><a name="11257"
      > </a
      ><a name="11258" href="Stlc.html#11258" class="Bound"
      >x</a
      ><a name="11259"
      > </a
      ><a name="11260" href="Stlc.html#11149" class="Function Operator"
      >:=</a
      ><a name="11262"
      > </a
      ><a name="11263" href="Stlc.html#11263" class="Bound"
      >v</a
      ><a name="11264"
      > </a
      ><a name="11265" href="Stlc.html#11149" class="Function Operator"
      >]</a
      ><a name="11266"
      > </a
      ><a name="11267" class="Symbol"
      >(</a
      ><a name="11268" href="Stlc.html#5443" class="InductiveConstructor"
      >app</a
      ><a name="11271"
      > </a
      ><a name="11272" href="Stlc.html#11272" class="Bound"
      >s</a
      ><a name="11273"
      > </a
      ><a name="11274" href="Stlc.html#11274" class="Bound"
      >t</a
      ><a name="11275" class="Symbol"
      >)</a
      ><a name="11276"
      > </a
      ><a name="11277" class="Symbol"
      >=</a
      ><a name="11278"
      > </a
      ><a name="11279" href="Stlc.html#5443" class="InductiveConstructor"
      >app</a
      ><a name="11282"
      > </a
      ><a name="11283" class="Symbol"
      >(</a
      ><a name="11284" href="Stlc.html#11149" class="Function Operator"
      >[</a
      ><a name="11285"
      > </a
      ><a name="11286" href="Stlc.html#11258" class="Bound"
      >x</a
      ><a name="11287"
      > </a
      ><a name="11288" href="Stlc.html#11149" class="Function Operator"
      >:=</a
      ><a name="11290"
      > </a
      ><a name="11291" href="Stlc.html#11263" class="Bound"
      >v</a
      ><a name="11292"
      > </a
      ><a name="11293" href="Stlc.html#11149" class="Function Operator"
      >]</a
      ><a name="11294"
      > </a
      ><a name="11295" href="Stlc.html#11272" class="Bound"
      >s</a
      ><a name="11296" class="Symbol"
      >)</a
      ><a name="11297"
      > </a
      ><a name="11298" class="Symbol"
      >(</a
      ><a name="11299" href="Stlc.html#11149" class="Function Operator"
      >[</a
      ><a name="11300"
      > </a
      ><a name="11301" href="Stlc.html#11258" class="Bound"
      >x</a
      ><a name="11302"
      > </a
      ><a name="11303" href="Stlc.html#11149" class="Function Operator"
      >:=</a
      ><a name="11305"
      > </a
      ><a name="11306" href="Stlc.html#11263" class="Bound"
      >v</a
      ><a name="11307"
      > </a
      ><a name="11308" href="Stlc.html#11149" class="Function Operator"
      >]</a
      ><a name="11309"
      > </a
      ><a name="11310" href="Stlc.html#11274" class="Bound"
      >t</a
      ><a name="11311" class="Symbol"
      >)</a
      ><a name="11312"
      >
</a
      ><a name="11313" href="Stlc.html#11149" class="Function Operator"
      >[</a
      ><a name="11314"
      > </a
      ><a name="11315" href="Stlc.html#11315" class="Bound"
      >x</a
      ><a name="11316"
      > </a
      ><a name="11317" href="Stlc.html#11149" class="Function Operator"
      >:=</a
      ><a name="11319"
      > </a
      ><a name="11320" href="Stlc.html#11320" class="Bound"
      >v</a
      ><a name="11321"
      > </a
      ><a name="11322" href="Stlc.html#11149" class="Function Operator"
      >]</a
      ><a name="11323"
      > </a
      ><a name="11324" class="Symbol"
      >(</a
      ><a name="11325" href="Stlc.html#5472" class="InductiveConstructor"
      >abs</a
      ><a name="11328"
      > </a
      ><a name="11329" href="Stlc.html#11329" class="Bound"
      >y</a
      ><a name="11330"
      > </a
      ><a name="11331" href="Stlc.html#11331" class="Bound"
      >A</a
      ><a name="11332"
      > </a
      ><a name="11333" href="Stlc.html#11333" class="Bound"
      >t</a
      ><a name="11334" class="Symbol"
      >)</a
      ><a name="11335"
      > </a
      ><a name="11336" class="Keyword"
      >with</a
      ><a name="11340"
      > </a
      ><a name="11341" href="Stlc.html#11315" class="Bound"
      >x</a
      ><a name="11342"
      > </a
      ><a name="11343" href="Stlc.html#5233" class="Function Operator"
      >&#8799;</a
      ><a name="11344"
      > </a
      ><a name="11345" href="Stlc.html#11329" class="Bound"
      >y</a
      ><a name="11346"
      >
</a
      ><a name="11347" class="Symbol"
      >...</a
      ><a name="11350"
      > </a
      ><a name="11351" class="Symbol"
      >|</a
      ><a name="11352"
      > </a
      ><a name="11353" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="11356"
      > </a
      ><a name="11357" href="Stlc.html#11357" class="Bound"
      >x=y</a
      ><a name="11360"
      > </a
      ><a name="11361" class="Symbol"
      >=</a
      ><a name="11362"
      > </a
      ><a name="11363" href="Stlc.html#5472" class="InductiveConstructor"
      >abs</a
      ><a name="11366"
      > </a
      ><a name="11367" href="Stlc.html#11329" class="Bound"
      >y</a
      ><a name="11368"
      > </a
      ><a name="11369" href="Stlc.html#11331" class="Bound"
      >A</a
      ><a name="11370"
      > </a
      ><a name="11371" href="Stlc.html#11333" class="Bound"
      >t</a
      ><a name="11372"
      >
</a
      ><a name="11373" class="Symbol"
      >...</a
      ><a name="11376"
      > </a
      ><a name="11377" class="Symbol"
      >|</a
      ><a name="11378"
      > </a
      ><a name="11379" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="11381"
      >  </a
      ><a name="11383" href="Stlc.html#11383" class="Bound"
      >x&#8800;y</a
      ><a name="11386"
      > </a
      ><a name="11387" class="Symbol"
      >=</a
      ><a name="11388"
      > </a
      ><a name="11389" href="Stlc.html#5472" class="InductiveConstructor"
      >abs</a
      ><a name="11392"
      > </a
      ><a name="11393" href="Stlc.html#11329" class="Bound"
      >y</a
      ><a name="11394"
      > </a
      ><a name="11395" href="Stlc.html#11331" class="Bound"
      >A</a
      ><a name="11396"
      > </a
      ><a name="11397" class="Symbol"
      >(</a
      ><a name="11398" href="Stlc.html#11149" class="Function Operator"
      >[</a
      ><a name="11399"
      > </a
      ><a name="11400" href="Stlc.html#11315" class="Bound"
      >x</a
      ><a name="11401"
      > </a
      ><a name="11402" href="Stlc.html#11149" class="Function Operator"
      >:=</a
      ><a name="11404"
      > </a
      ><a name="11405" href="Stlc.html#11320" class="Bound"
      >v</a
      ><a name="11406"
      > </a
      ><a name="11407" href="Stlc.html#11149" class="Function Operator"
      >]</a
      ><a name="11408"
      > </a
      ><a name="11409" href="Stlc.html#11333" class="Bound"
      >t</a
      ><a name="11410" class="Symbol"
      >)</a
      ><a name="11411"
      >
</a
      ><a name="11412" href="Stlc.html#11149" class="Function Operator"
      >[</a
      ><a name="11413"
      > </a
      ><a name="11414" href="Stlc.html#11414" class="Bound"
      >x</a
      ><a name="11415"
      > </a
      ><a name="11416" href="Stlc.html#11149" class="Function Operator"
      >:=</a
      ><a name="11418"
      > </a
      ><a name="11419" href="Stlc.html#11419" class="Bound"
      >v</a
      ><a name="11420"
      > </a
      ><a name="11421" href="Stlc.html#11149" class="Function Operator"
      >]</a
      ><a name="11422"
      > </a
      ><a name="11423" href="Stlc.html#5506" class="InductiveConstructor"
      >true</a
      ><a name="11427"
      >  </a
      ><a name="11429" class="Symbol"
      >=</a
      ><a name="11430"
      > </a
      ><a name="11431" href="Stlc.html#5506" class="InductiveConstructor"
      >true</a
      ><a name="11435"
      >
</a
      ><a name="11436" href="Stlc.html#11149" class="Function Operator"
      >[</a
      ><a name="11437"
      > </a
      ><a name="11438" href="Stlc.html#11438" class="Bound"
      >x</a
      ><a name="11439"
      > </a
      ><a name="11440" href="Stlc.html#11149" class="Function Operator"
      >:=</a
      ><a name="11442"
      > </a
      ><a name="11443" href="Stlc.html#11443" class="Bound"
      >v</a
      ><a name="11444"
      > </a
      ><a name="11445" href="Stlc.html#11149" class="Function Operator"
      >]</a
      ><a name="11446"
      > </a
      ><a name="11447" href="Stlc.html#5521" class="InductiveConstructor"
      >false</a
      ><a name="11452"
      > </a
      ><a name="11453" class="Symbol"
      >=</a
      ><a name="11454"
      > </a
      ><a name="11455" href="Stlc.html#5521" class="InductiveConstructor"
      >false</a
      ><a name="11460"
      >
</a
      ><a name="11461" href="Stlc.html#11149" class="Function Operator"
      >[</a
      ><a name="11462"
      > </a
      ><a name="11463" href="Stlc.html#11463" class="Bound"
      >x</a
      ><a name="11464"
      > </a
      ><a name="11465" href="Stlc.html#11149" class="Function Operator"
      >:=</a
      ><a name="11467"
      > </a
      ><a name="11468" href="Stlc.html#11468" class="Bound"
      >v</a
      ><a name="11469"
      > </a
      ><a name="11470" href="Stlc.html#11149" class="Function Operator"
      >]</a
      ><a name="11471"
      > </a
      ><a name="11472" class="Symbol"
      >(</a
      ><a name="11473" href="Stlc.html#5536" class="InductiveConstructor Operator"
      >if</a
      ><a name="11475"
      > </a
      ><a name="11476" href="Stlc.html#11476" class="Bound"
      >s</a
      ><a name="11477"
      > </a
      ><a name="11478" href="Stlc.html#5536" class="InductiveConstructor Operator"
      >then</a
      ><a name="11482"
      > </a
      ><a name="11483" href="Stlc.html#11483" class="Bound"
      >t</a
      ><a name="11484"
      > </a
      ><a name="11485" href="Stlc.html#5536" class="InductiveConstructor Operator"
      >else</a
      ><a name="11489"
      > </a
      ><a name="11490" href="Stlc.html#11490" class="Bound"
      >u</a
      ><a name="11491" class="Symbol"
      >)</a
      ><a name="11492"
      > </a
      ><a name="11493" class="Symbol"
      >=</a
      ><a name="11494"
      >
  </a
      ><a name="11497" href="Stlc.html#5536" class="InductiveConstructor Operator"
      >if</a
      ><a name="11499"
      > </a
      ><a name="11500" href="Stlc.html#11149" class="Function Operator"
      >[</a
      ><a name="11501"
      > </a
      ><a name="11502" href="Stlc.html#11463" class="Bound"
      >x</a
      ><a name="11503"
      > </a
      ><a name="11504" href="Stlc.html#11149" class="Function Operator"
      >:=</a
      ><a name="11506"
      > </a
      ><a name="11507" href="Stlc.html#11468" class="Bound"
      >v</a
      ><a name="11508"
      > </a
      ><a name="11509" href="Stlc.html#11149" class="Function Operator"
      >]</a
      ><a name="11510"
      > </a
      ><a name="11511" href="Stlc.html#11476" class="Bound"
      >s</a
      ><a name="11512"
      > </a
      ><a name="11513" href="Stlc.html#5536" class="InductiveConstructor Operator"
      >then</a
      ><a name="11517"
      > </a
      ><a name="11518" href="Stlc.html#11149" class="Function Operator"
      >[</a
      ><a name="11519"
      > </a
      ><a name="11520" href="Stlc.html#11463" class="Bound"
      >x</a
      ><a name="11521"
      > </a
      ><a name="11522" href="Stlc.html#11149" class="Function Operator"
      >:=</a
      ><a name="11524"
      > </a
      ><a name="11525" href="Stlc.html#11468" class="Bound"
      >v</a
      ><a name="11526"
      > </a
      ><a name="11527" href="Stlc.html#11149" class="Function Operator"
      >]</a
      ><a name="11528"
      > </a
      ><a name="11529" href="Stlc.html#11483" class="Bound"
      >t</a
      ><a name="11530"
      > </a
      ><a name="11531" href="Stlc.html#5536" class="InductiveConstructor Operator"
      >else</a
      ><a name="11535"
      >  </a
      ><a name="11537" href="Stlc.html#11149" class="Function Operator"
      >[</a
      ><a name="11538"
      > </a
      ><a name="11539" href="Stlc.html#11463" class="Bound"
      >x</a
      ><a name="11540"
      > </a
      ><a name="11541" href="Stlc.html#11149" class="Function Operator"
      >:=</a
      ><a name="11543"
      > </a
      ><a name="11544" href="Stlc.html#11468" class="Bound"
      >v</a
      ><a name="11545"
      > </a
      ><a name="11546" href="Stlc.html#11149" class="Function Operator"
      >]</a
      ><a name="11547"
      > </a
      ><a name="11548" href="Stlc.html#11490" class="Bound"
      >u</a
      ><a name="11549"
      >

</a
      ><a name="11551" class="Keyword"
      >infix</a
      ><a name="11556"
      > </a
      ><a name="11557" class="Number"
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
<a name="13809" class="Keyword"
      >data</a
      ><a name="13813"
      > </a
      ><a name="13814" href="Stlc.html#13814" class="Datatype Operator"
      >_==&gt;_</a
      ><a name="13819"
      > </a
      ><a name="13820" class="Symbol"
      >:</a
      ><a name="13821"
      > </a
      ><a name="13822" href="Stlc.html#5404" class="Datatype"
      >Term</a
      ><a name="13826"
      > </a
      ><a name="13827" class="Symbol"
      >&#8594;</a
      ><a name="13828"
      > </a
      ><a name="13829" href="Stlc.html#5404" class="Datatype"
      >Term</a
      ><a name="13833"
      > </a
      ><a name="13834" class="Symbol"
      >&#8594;</a
      ><a name="13835"
      > </a
      ><a name="13836" class="PrimitiveType"
      >Set</a
      ><a name="13839"
      > </a
      ><a name="13840" class="Keyword"
      >where</a
      ><a name="13845"
      >
  </a
      ><a name="13848" href="Stlc.html#13848" class="InductiveConstructor"
      >red</a
      ><a name="13851"
      >     </a
      ><a name="13856" class="Symbol"
      >:</a
      ><a name="13857"
      > </a
      ><a name="13858" class="Symbol"
      >forall</a
      ><a name="13864"
      > </a
      ><a name="13865" class="Symbol"
      >{</a
      ><a name="13866" href="Stlc.html#13866" class="Bound"
      >x</a
      ><a name="13867"
      > </a
      ><a name="13868" href="Stlc.html#13868" class="Bound"
      >A</a
      ><a name="13869"
      > </a
      ><a name="13870" href="Stlc.html#13870" class="Bound"
      >s</a
      ><a name="13871"
      > </a
      ><a name="13872" href="Stlc.html#13872" class="Bound"
      >t</a
      ><a name="13873" class="Symbol"
      >}</a
      ><a name="13874"
      >
          </a
      ><a name="13885" class="Symbol"
      >&#8594;</a
      ><a name="13886"
      > </a
      ><a name="13887" href="Stlc.html#8459" class="Datatype"
      >Value</a
      ><a name="13892"
      > </a
      ><a name="13893" href="Stlc.html#13872" class="Bound"
      >t</a
      ><a name="13894"
      >
          </a
      ><a name="13905" class="Symbol"
      >&#8594;</a
      ><a name="13906"
      > </a
      ><a name="13907" href="Stlc.html#5443" class="InductiveConstructor"
      >app</a
      ><a name="13910"
      > </a
      ><a name="13911" class="Symbol"
      >(</a
      ><a name="13912" href="Stlc.html#5472" class="InductiveConstructor"
      >abs</a
      ><a name="13915"
      > </a
      ><a name="13916" href="Stlc.html#13866" class="Bound"
      >x</a
      ><a name="13917"
      > </a
      ><a name="13918" href="Stlc.html#13868" class="Bound"
      >A</a
      ><a name="13919"
      > </a
      ><a name="13920" href="Stlc.html#13870" class="Bound"
      >s</a
      ><a name="13921" class="Symbol"
      >)</a
      ><a name="13922"
      > </a
      ><a name="13923" href="Stlc.html#13872" class="Bound"
      >t</a
      ><a name="13924"
      > </a
      ><a name="13925" href="Stlc.html#13814" class="Datatype Operator"
      >==&gt;</a
      ><a name="13928"
      > </a
      ><a name="13929" href="Stlc.html#11149" class="Function Operator"
      >[</a
      ><a name="13930"
      > </a
      ><a name="13931" href="Stlc.html#13866" class="Bound"
      >x</a
      ><a name="13932"
      > </a
      ><a name="13933" href="Stlc.html#11149" class="Function Operator"
      >:=</a
      ><a name="13935"
      > </a
      ><a name="13936" href="Stlc.html#13872" class="Bound"
      >t</a
      ><a name="13937"
      > </a
      ><a name="13938" href="Stlc.html#11149" class="Function Operator"
      >]</a
      ><a name="13939"
      > </a
      ><a name="13940" href="Stlc.html#13870" class="Bound"
      >s</a
      ><a name="13941"
      >
  </a
      ><a name="13944" href="Stlc.html#13944" class="InductiveConstructor"
      >app1</a
      ><a name="13948"
      >    </a
      ><a name="13952" class="Symbol"
      >:</a
      ><a name="13953"
      > </a
      ><a name="13954" class="Symbol"
      >forall</a
      ><a name="13960"
      > </a
      ><a name="13961" class="Symbol"
      >{</a
      ><a name="13962" href="Stlc.html#13962" class="Bound"
      >s</a
      ><a name="13963"
      > </a
      ><a name="13964" href="Stlc.html#13964" class="Bound"
      >s'</a
      ><a name="13966"
      > </a
      ><a name="13967" href="Stlc.html#13967" class="Bound"
      >t</a
      ><a name="13968" class="Symbol"
      >}</a
      ><a name="13969"
      >
          </a
      ><a name="13980" class="Symbol"
      >&#8594;</a
      ><a name="13981"
      > </a
      ><a name="13982" href="Stlc.html#13962" class="Bound"
      >s</a
      ><a name="13983"
      > </a
      ><a name="13984" href="Stlc.html#13814" class="Datatype Operator"
      >==&gt;</a
      ><a name="13987"
      > </a
      ><a name="13988" href="Stlc.html#13964" class="Bound"
      >s'</a
      ><a name="13990"
      >
          </a
      ><a name="14001" class="Symbol"
      >&#8594;</a
      ><a name="14002"
      > </a
      ><a name="14003" href="Stlc.html#5443" class="InductiveConstructor"
      >app</a
      ><a name="14006"
      > </a
      ><a name="14007" href="Stlc.html#13962" class="Bound"
      >s</a
      ><a name="14008"
      > </a
      ><a name="14009" href="Stlc.html#13967" class="Bound"
      >t</a
      ><a name="14010"
      > </a
      ><a name="14011" href="Stlc.html#13814" class="Datatype Operator"
      >==&gt;</a
      ><a name="14014"
      > </a
      ><a name="14015" href="Stlc.html#5443" class="InductiveConstructor"
      >app</a
      ><a name="14018"
      > </a
      ><a name="14019" href="Stlc.html#13964" class="Bound"
      >s'</a
      ><a name="14021"
      > </a
      ><a name="14022" href="Stlc.html#13967" class="Bound"
      >t</a
      ><a name="14023"
      >
  </a
      ><a name="14026" href="Stlc.html#14026" class="InductiveConstructor"
      >app2</a
      ><a name="14030"
      >    </a
      ><a name="14034" class="Symbol"
      >:</a
      ><a name="14035"
      > </a
      ><a name="14036" class="Symbol"
      >forall</a
      ><a name="14042"
      > </a
      ><a name="14043" class="Symbol"
      >{</a
      ><a name="14044" href="Stlc.html#14044" class="Bound"
      >s</a
      ><a name="14045"
      > </a
      ><a name="14046" href="Stlc.html#14046" class="Bound"
      >t</a
      ><a name="14047"
      > </a
      ><a name="14048" href="Stlc.html#14048" class="Bound"
      >t'</a
      ><a name="14050" class="Symbol"
      >}</a
      ><a name="14051"
      >
          </a
      ><a name="14062" class="Symbol"
      >&#8594;</a
      ><a name="14063"
      > </a
      ><a name="14064" href="Stlc.html#8459" class="Datatype"
      >Value</a
      ><a name="14069"
      > </a
      ><a name="14070" href="Stlc.html#14044" class="Bound"
      >s</a
      ><a name="14071"
      >
          </a
      ><a name="14082" class="Symbol"
      >&#8594;</a
      ><a name="14083"
      > </a
      ><a name="14084" href="Stlc.html#14046" class="Bound"
      >t</a
      ><a name="14085"
      > </a
      ><a name="14086" href="Stlc.html#13814" class="Datatype Operator"
      >==&gt;</a
      ><a name="14089"
      > </a
      ><a name="14090" href="Stlc.html#14048" class="Bound"
      >t'</a
      ><a name="14092"
      >
          </a
      ><a name="14103" class="Symbol"
      >&#8594;</a
      ><a name="14104"
      > </a
      ><a name="14105" href="Stlc.html#5443" class="InductiveConstructor"
      >app</a
      ><a name="14108"
      > </a
      ><a name="14109" href="Stlc.html#14044" class="Bound"
      >s</a
      ><a name="14110"
      > </a
      ><a name="14111" href="Stlc.html#14046" class="Bound"
      >t</a
      ><a name="14112"
      > </a
      ><a name="14113" href="Stlc.html#13814" class="Datatype Operator"
      >==&gt;</a
      ><a name="14116"
      > </a
      ><a name="14117" href="Stlc.html#5443" class="InductiveConstructor"
      >app</a
      ><a name="14120"
      > </a
      ><a name="14121" href="Stlc.html#14044" class="Bound"
      >s</a
      ><a name="14122"
      > </a
      ><a name="14123" href="Stlc.html#14048" class="Bound"
      >t'</a
      ><a name="14125"
      >
  </a
      ><a name="14128" href="Stlc.html#14128" class="InductiveConstructor"
      >if</a
      ><a name="14130"
      >      </a
      ><a name="14136" class="Symbol"
      >:</a
      ><a name="14137"
      > </a
      ><a name="14138" class="Symbol"
      >forall</a
      ><a name="14144"
      > </a
      ><a name="14145" class="Symbol"
      >{</a
      ><a name="14146" href="Stlc.html#14146" class="Bound"
      >s</a
      ><a name="14147"
      > </a
      ><a name="14148" href="Stlc.html#14148" class="Bound"
      >s'</a
      ><a name="14150"
      > </a
      ><a name="14151" href="Stlc.html#14151" class="Bound"
      >t</a
      ><a name="14152"
      > </a
      ><a name="14153" href="Stlc.html#14153" class="Bound"
      >u</a
      ><a name="14154" class="Symbol"
      >}</a
      ><a name="14155"
      >
          </a
      ><a name="14166" class="Symbol"
      >&#8594;</a
      ><a name="14167"
      > </a
      ><a name="14168" href="Stlc.html#14146" class="Bound"
      >s</a
      ><a name="14169"
      > </a
      ><a name="14170" href="Stlc.html#13814" class="Datatype Operator"
      >==&gt;</a
      ><a name="14173"
      > </a
      ><a name="14174" href="Stlc.html#14148" class="Bound"
      >s'</a
      ><a name="14176"
      >
          </a
      ><a name="14187" class="Symbol"
      >&#8594;</a
      ><a name="14188"
      > </a
      ><a name="14189" href="Stlc.html#5536" class="InductiveConstructor Operator"
      >if</a
      ><a name="14191"
      > </a
      ><a name="14192" href="Stlc.html#14146" class="Bound"
      >s</a
      ><a name="14193"
      > </a
      ><a name="14194" href="Stlc.html#5536" class="InductiveConstructor Operator"
      >then</a
      ><a name="14198"
      > </a
      ><a name="14199" href="Stlc.html#14151" class="Bound"
      >t</a
      ><a name="14200"
      > </a
      ><a name="14201" href="Stlc.html#5536" class="InductiveConstructor Operator"
      >else</a
      ><a name="14205"
      > </a
      ><a name="14206" href="Stlc.html#14153" class="Bound"
      >u</a
      ><a name="14207"
      > </a
      ><a name="14208" href="Stlc.html#13814" class="Datatype Operator"
      >==&gt;</a
      ><a name="14211"
      > </a
      ><a name="14212" href="Stlc.html#5536" class="InductiveConstructor Operator"
      >if</a
      ><a name="14214"
      > </a
      ><a name="14215" href="Stlc.html#14148" class="Bound"
      >s'</a
      ><a name="14217"
      > </a
      ><a name="14218" href="Stlc.html#5536" class="InductiveConstructor Operator"
      >then</a
      ><a name="14222"
      > </a
      ><a name="14223" href="Stlc.html#14151" class="Bound"
      >t</a
      ><a name="14224"
      > </a
      ><a name="14225" href="Stlc.html#5536" class="InductiveConstructor Operator"
      >else</a
      ><a name="14229"
      > </a
      ><a name="14230" href="Stlc.html#14153" class="Bound"
      >u</a
      ><a name="14231"
      >
  </a
      ><a name="14234" href="Stlc.html#14234" class="InductiveConstructor"
      >iftrue</a
      ><a name="14240"
      >  </a
      ><a name="14242" class="Symbol"
      >:</a
      ><a name="14243"
      > </a
      ><a name="14244" class="Symbol"
      >forall</a
      ><a name="14250"
      > </a
      ><a name="14251" class="Symbol"
      >{</a
      ><a name="14252" href="Stlc.html#14252" class="Bound"
      >s</a
      ><a name="14253"
      > </a
      ><a name="14254" href="Stlc.html#14254" class="Bound"
      >t</a
      ><a name="14255" class="Symbol"
      >}</a
      ><a name="14256"
      >
          </a
      ><a name="14267" class="Symbol"
      >&#8594;</a
      ><a name="14268"
      > </a
      ><a name="14269" href="Stlc.html#5536" class="InductiveConstructor Operator"
      >if</a
      ><a name="14271"
      > </a
      ><a name="14272" href="Stlc.html#5506" class="InductiveConstructor"
      >true</a
      ><a name="14276"
      > </a
      ><a name="14277" href="Stlc.html#5536" class="InductiveConstructor Operator"
      >then</a
      ><a name="14281"
      > </a
      ><a name="14282" href="Stlc.html#14252" class="Bound"
      >s</a
      ><a name="14283"
      > </a
      ><a name="14284" href="Stlc.html#5536" class="InductiveConstructor Operator"
      >else</a
      ><a name="14288"
      > </a
      ><a name="14289" href="Stlc.html#14254" class="Bound"
      >t</a
      ><a name="14290"
      > </a
      ><a name="14291" href="Stlc.html#13814" class="Datatype Operator"
      >==&gt;</a
      ><a name="14294"
      > </a
      ><a name="14295" href="Stlc.html#14252" class="Bound"
      >s</a
      ><a name="14296"
      >
  </a
      ><a name="14299" href="Stlc.html#14299" class="InductiveConstructor"
      >iffalse</a
      ><a name="14306"
      > </a
      ><a name="14307" class="Symbol"
      >:</a
      ><a name="14308"
      > </a
      ><a name="14309" class="Symbol"
      >forall</a
      ><a name="14315"
      > </a
      ><a name="14316" class="Symbol"
      >{</a
      ><a name="14317" href="Stlc.html#14317" class="Bound"
      >s</a
      ><a name="14318"
      > </a
      ><a name="14319" href="Stlc.html#14319" class="Bound"
      >t</a
      ><a name="14320" class="Symbol"
      >}</a
      ><a name="14321"
      >
          </a
      ><a name="14332" class="Symbol"
      >&#8594;</a
      ><a name="14333"
      > </a
      ><a name="14334" href="Stlc.html#5536" class="InductiveConstructor Operator"
      >if</a
      ><a name="14336"
      > </a
      ><a name="14337" href="Stlc.html#5521" class="InductiveConstructor"
      >false</a
      ><a name="14342"
      > </a
      ><a name="14343" href="Stlc.html#5536" class="InductiveConstructor Operator"
      >then</a
      ><a name="14347"
      > </a
      ><a name="14348" href="Stlc.html#14317" class="Bound"
      >s</a
      ><a name="14349"
      > </a
      ><a name="14350" href="Stlc.html#5536" class="InductiveConstructor Operator"
      >else</a
      ><a name="14354"
      > </a
      ><a name="14355" href="Stlc.html#14319" class="Bound"
      >t</a
      ><a name="14356"
      > </a
      ><a name="14357" href="Stlc.html#13814" class="Datatype Operator"
      >==&gt;</a
      ><a name="14360"
      > </a
      ><a name="14361" href="Stlc.html#14319" class="Bound"
      >t</a
      ><a name="14362"
      >

</a
      ><a name="14364" class="Keyword"
      >infix</a
      ><a name="14369"
      > </a
      ><a name="14370" class="Number"
      >1</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="14424" class="Keyword"
      >data</a
      ><a name="14428"
      > </a
      ><a name="14429" href="Stlc.html#14429" class="Datatype"
      >Multi</a
      ><a name="14434"
      > </a
      ><a name="14435" class="Symbol"
      >(</a
      ><a name="14436" href="Stlc.html#14436" class="Bound"
      >R</a
      ><a name="14437"
      > </a
      ><a name="14438" class="Symbol"
      >:</a
      ><a name="14439"
      > </a
      ><a name="14440" href="Stlc.html#5404" class="Datatype"
      >Term</a
      ><a name="14444"
      > </a
      ><a name="14445" class="Symbol"
      >&#8594;</a
      ><a name="14446"
      > </a
      ><a name="14447" href="Stlc.html#5404" class="Datatype"
      >Term</a
      ><a name="14451"
      > </a
      ><a name="14452" class="Symbol"
      >&#8594;</a
      ><a name="14453"
      > </a
      ><a name="14454" class="PrimitiveType"
      >Set</a
      ><a name="14457" class="Symbol"
      >)</a
      ><a name="14458"
      > </a
      ><a name="14459" class="Symbol"
      >:</a
      ><a name="14460"
      > </a
      ><a name="14461" href="Stlc.html#5404" class="Datatype"
      >Term</a
      ><a name="14465"
      > </a
      ><a name="14466" class="Symbol"
      >&#8594;</a
      ><a name="14467"
      > </a
      ><a name="14468" href="Stlc.html#5404" class="Datatype"
      >Term</a
      ><a name="14472"
      > </a
      ><a name="14473" class="Symbol"
      >&#8594;</a
      ><a name="14474"
      > </a
      ><a name="14475" class="PrimitiveType"
      >Set</a
      ><a name="14478"
      > </a
      ><a name="14479" class="Keyword"
      >where</a
      ><a name="14484"
      >
  </a
      ><a name="14487" href="Stlc.html#14487" class="InductiveConstructor"
      >refl</a
      ><a name="14491"
      > </a
      ><a name="14492" class="Symbol"
      >:</a
      ><a name="14493"
      > </a
      ><a name="14494" class="Symbol"
      >forall</a
      ><a name="14500"
      > </a
      ><a name="14501" class="Symbol"
      >{</a
      ><a name="14502" href="Stlc.html#14502" class="Bound"
      >x</a
      ><a name="14503" class="Symbol"
      >}</a
      ><a name="14504"
      > </a
      ><a name="14505" class="Symbol"
      >-&gt;</a
      ><a name="14507"
      > </a
      ><a name="14508" href="Stlc.html#14429" class="Datatype"
      >Multi</a
      ><a name="14513"
      > </a
      ><a name="14514" href="Stlc.html#14436" class="Bound"
      >R</a
      ><a name="14515"
      > </a
      ><a name="14516" href="Stlc.html#14502" class="Bound"
      >x</a
      ><a name="14517"
      > </a
      ><a name="14518" href="Stlc.html#14502" class="Bound"
      >x</a
      ><a name="14519"
      >
  </a
      ><a name="14522" href="Stlc.html#14522" class="InductiveConstructor"
      >step</a
      ><a name="14526"
      > </a
      ><a name="14527" class="Symbol"
      >:</a
      ><a name="14528"
      > </a
      ><a name="14529" class="Symbol"
      >forall</a
      ><a name="14535"
      > </a
      ><a name="14536" class="Symbol"
      >{</a
      ><a name="14537" href="Stlc.html#14537" class="Bound"
      >x</a
      ><a name="14538"
      > </a
      ><a name="14539" href="Stlc.html#14539" class="Bound"
      >y</a
      ><a name="14540"
      > </a
      ><a name="14541" href="Stlc.html#14541" class="Bound"
      >z</a
      ><a name="14542" class="Symbol"
      >}</a
      ><a name="14543"
      > </a
      ><a name="14544" class="Symbol"
      >-&gt;</a
      ><a name="14546"
      > </a
      ><a name="14547" href="Stlc.html#14436" class="Bound"
      >R</a
      ><a name="14548"
      > </a
      ><a name="14549" href="Stlc.html#14537" class="Bound"
      >x</a
      ><a name="14550"
      > </a
      ><a name="14551" href="Stlc.html#14539" class="Bound"
      >y</a
      ><a name="14552"
      > </a
      ><a name="14553" class="Symbol"
      >-&gt;</a
      ><a name="14555"
      > </a
      ><a name="14556" href="Stlc.html#14429" class="Datatype"
      >Multi</a
      ><a name="14561"
      > </a
      ><a name="14562" href="Stlc.html#14436" class="Bound"
      >R</a
      ><a name="14563"
      > </a
      ><a name="14564" href="Stlc.html#14539" class="Bound"
      >y</a
      ><a name="14565"
      > </a
      ><a name="14566" href="Stlc.html#14541" class="Bound"
      >z</a
      ><a name="14567"
      > </a
      ><a name="14568" class="Symbol"
      >-&gt;</a
      ><a name="14570"
      > </a
      ><a name="14571" href="Stlc.html#14429" class="Datatype"
      >Multi</a
      ><a name="14576"
      > </a
      ><a name="14577" href="Stlc.html#14436" class="Bound"
      >R</a
      ><a name="14578"
      > </a
      ><a name="14579" href="Stlc.html#14537" class="Bound"
      >x</a
      ><a name="14580"
      > </a
      ><a name="14581" href="Stlc.html#14541" class="Bound"
      >z</a
      >
{% endraw %}</pre>
</div>

<pre class="Agda">{% raw %}
<a name="14615" href="Stlc.html#14615" class="Function Operator"
      >_==&gt;*_</a
      ><a name="14621"
      > </a
      ><a name="14622" class="Symbol"
      >:</a
      ><a name="14623"
      > </a
      ><a name="14624" href="Stlc.html#5404" class="Datatype"
      >Term</a
      ><a name="14628"
      > </a
      ><a name="14629" class="Symbol"
      >&#8594;</a
      ><a name="14630"
      > </a
      ><a name="14631" href="Stlc.html#5404" class="Datatype"
      >Term</a
      ><a name="14635"
      > </a
      ><a name="14636" class="Symbol"
      >&#8594;</a
      ><a name="14637"
      > </a
      ><a name="14638" class="PrimitiveType"
      >Set</a
      ><a name="14641"
      >
</a
      ><a name="14642" href="Stlc.html#14615" class="Function Operator"
      >_==&gt;*_</a
      ><a name="14648"
      > </a
      ><a name="14649" class="Symbol"
      >=</a
      ><a name="14650"
      > </a
      ><a name="14651" href="Stlc.html#14429" class="Datatype"
      >Multi</a
      ><a name="14656"
      > </a
      ><a name="14657" href="Stlc.html#13814" class="Datatype Operator"
      >_==&gt;_</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="14709" class="Symbol"
      >{-#</a
      ><a name="14712"
      > </a
      ><a name="14713" class="Keyword"
      >DISPLAY</a
      ><a name="14720"
      > </a
      ><a name="14721" href="Stlc.html#14429" class="Datatype"
      >Multi</a
      ><a name="14726"
      > </a
      ><a name="14727" href="Stlc.html#14727" class="Bound Operator"
      >_==&gt;_</a
      ><a name="14732"
      > = </a
      ><a name="14735" href="Stlc.html#14615" class="Function Operator"
      >_==&gt;*_</a
      ><a name="14741"
      > </a
      ><a name="14742" class="Symbol"
      >#-}</a
      >
{% endraw %}</pre>
</div>

### Examples

Example:

    ((λx:bool⇒bool. x) (λx:bool. x)) ==>* (λx:bool. x)

<pre class="Agda">{% raw %}
<a name="14858" href="Stlc.html#14858" class="Function"
      >step-example1</a
      ><a name="14871"
      > </a
      ><a name="14872" class="Symbol"
      >:</a
      ><a name="14873"
      > </a
      ><a name="14874" class="Symbol"
      >(</a
      ><a name="14875" href="Stlc.html#5443" class="InductiveConstructor"
      >app</a
      ><a name="14878"
      > </a
      ><a name="14879" href="Stlc.html#6231" class="Function"
      >idBB</a
      ><a name="14883"
      > </a
      ><a name="14884" href="Stlc.html#6153" class="Function"
      >idB</a
      ><a name="14887" class="Symbol"
      >)</a
      ><a name="14888"
      > </a
      ><a name="14889" href="Stlc.html#14615" class="Function Operator"
      >==&gt;*</a
      ><a name="14893"
      > </a
      ><a name="14894" href="Stlc.html#6153" class="Function"
      >idB</a
      ><a name="14897"
      >
</a
      ><a name="14898" href="Stlc.html#14858" class="Function"
      >step-example1</a
      ><a name="14911"
      > </a
      ><a name="14912" class="Symbol"
      >=</a
      ><a name="14913"
      > </a
      ><a name="14914" href="Stlc.html#14522" class="InductiveConstructor"
      >step</a
      ><a name="14918"
      > </a
      ><a name="14919" class="Symbol"
      >(</a
      ><a name="14920" href="Stlc.html#13848" class="InductiveConstructor"
      >red</a
      ><a name="14923"
      > </a
      ><a name="14924" href="Stlc.html#8486" class="InductiveConstructor"
      >abs</a
      ><a name="14927" class="Symbol"
      >)</a
      ><a name="14928"
      >
              </a
      ><a name="14943" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="14944"
      > </a
      ><a name="14945" href="Stlc.html#14487" class="InductiveConstructor"
      >refl</a
      >
{% endraw %}</pre>

Example:

    ((λx:bool⇒bool. x) ((λx:bool⇒bool. x) (λx:bool. x)))
    ==>* (λx:bool. x)

<pre class="Agda">{% raw %}
<a name="15065" href="Stlc.html#15065" class="Function"
      >step-example2</a
      ><a name="15078"
      > </a
      ><a name="15079" class="Symbol"
      >:</a
      ><a name="15080"
      > </a
      ><a name="15081" class="Symbol"
      >(</a
      ><a name="15082" href="Stlc.html#5443" class="InductiveConstructor"
      >app</a
      ><a name="15085"
      > </a
      ><a name="15086" href="Stlc.html#6231" class="Function"
      >idBB</a
      ><a name="15090"
      > </a
      ><a name="15091" class="Symbol"
      >(</a
      ><a name="15092" href="Stlc.html#5443" class="InductiveConstructor"
      >app</a
      ><a name="15095"
      > </a
      ><a name="15096" href="Stlc.html#6231" class="Function"
      >idBB</a
      ><a name="15100"
      > </a
      ><a name="15101" href="Stlc.html#6153" class="Function"
      >idB</a
      ><a name="15104" class="Symbol"
      >))</a
      ><a name="15106"
      > </a
      ><a name="15107" href="Stlc.html#14615" class="Function Operator"
      >==&gt;*</a
      ><a name="15111"
      > </a
      ><a name="15112" href="Stlc.html#6153" class="Function"
      >idB</a
      ><a name="15115"
      >
</a
      ><a name="15116" href="Stlc.html#15065" class="Function"
      >step-example2</a
      ><a name="15129"
      > </a
      ><a name="15130" class="Symbol"
      >=</a
      ><a name="15131"
      > </a
      ><a name="15132" href="Stlc.html#14522" class="InductiveConstructor"
      >step</a
      ><a name="15136"
      > </a
      ><a name="15137" class="Symbol"
      >(</a
      ><a name="15138" href="Stlc.html#14026" class="InductiveConstructor"
      >app2</a
      ><a name="15142"
      > </a
      ><a name="15143" href="Stlc.html#8486" class="InductiveConstructor"
      >abs</a
      ><a name="15146"
      > </a
      ><a name="15147" class="Symbol"
      >(</a
      ><a name="15148" href="Stlc.html#13848" class="InductiveConstructor"
      >red</a
      ><a name="15151"
      > </a
      ><a name="15152" href="Stlc.html#8486" class="InductiveConstructor"
      >abs</a
      ><a name="15155" class="Symbol"
      >))</a
      ><a name="15157"
      >
              </a
      ><a name="15172" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="15173"
      > </a
      ><a name="15174" href="Stlc.html#14522" class="InductiveConstructor"
      >step</a
      ><a name="15178"
      > </a
      ><a name="15179" class="Symbol"
      >(</a
      ><a name="15180" href="Stlc.html#13848" class="InductiveConstructor"
      >red</a
      ><a name="15183"
      > </a
      ><a name="15184" href="Stlc.html#8486" class="InductiveConstructor"
      >abs</a
      ><a name="15187" class="Symbol"
      >)</a
      ><a name="15188"
      >
              </a
      ><a name="15203" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="15204"
      > </a
      ><a name="15205" href="Stlc.html#14487" class="InductiveConstructor"
      >refl</a
      >
{% endraw %}</pre>

Example:

    ((λx:bool⇒bool. x) (λx:bool. if x then false else true)) true)
    ==>* false

<pre class="Agda">{% raw %}
<a name="15328" href="Stlc.html#15328" class="Function"
      >step-example3</a
      ><a name="15341"
      > </a
      ><a name="15342" class="Symbol"
      >:</a
      ><a name="15343"
      > </a
      ><a name="15344" class="Symbol"
      >(</a
      ><a name="15345" href="Stlc.html#5443" class="InductiveConstructor"
      >app</a
      ><a name="15348"
      > </a
      ><a name="15349" class="Symbol"
      >(</a
      ><a name="15350" href="Stlc.html#5443" class="InductiveConstructor"
      >app</a
      ><a name="15353"
      > </a
      ><a name="15354" href="Stlc.html#6231" class="Function"
      >idBB</a
      ><a name="15358"
      > </a
      ><a name="15359" href="Stlc.html#6554" class="Function"
      >notB</a
      ><a name="15363" class="Symbol"
      >)</a
      ><a name="15364"
      > </a
      ><a name="15365" href="Stlc.html#5506" class="InductiveConstructor"
      >true</a
      ><a name="15369" class="Symbol"
      >)</a
      ><a name="15370"
      > </a
      ><a name="15371" href="Stlc.html#14615" class="Function Operator"
      >==&gt;*</a
      ><a name="15375"
      > </a
      ><a name="15376" href="Stlc.html#5521" class="InductiveConstructor"
      >false</a
      ><a name="15381"
      >
</a
      ><a name="15382" href="Stlc.html#15328" class="Function"
      >step-example3</a
      ><a name="15395"
      > </a
      ><a name="15396" class="Symbol"
      >=</a
      ><a name="15397"
      > </a
      ><a name="15398" href="Stlc.html#14522" class="InductiveConstructor"
      >step</a
      ><a name="15402"
      > </a
      ><a name="15403" class="Symbol"
      >(</a
      ><a name="15404" href="Stlc.html#13944" class="InductiveConstructor"
      >app1</a
      ><a name="15408"
      > </a
      ><a name="15409" class="Symbol"
      >(</a
      ><a name="15410" href="Stlc.html#13848" class="InductiveConstructor"
      >red</a
      ><a name="15413"
      > </a
      ><a name="15414" href="Stlc.html#8486" class="InductiveConstructor"
      >abs</a
      ><a name="15417" class="Symbol"
      >))</a
      ><a name="15419"
      >
              </a
      ><a name="15434" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="15435"
      > </a
      ><a name="15436" href="Stlc.html#14522" class="InductiveConstructor"
      >step</a
      ><a name="15440"
      > </a
      ><a name="15441" class="Symbol"
      >(</a
      ><a name="15442" href="Stlc.html#13848" class="InductiveConstructor"
      >red</a
      ><a name="15445"
      > </a
      ><a name="15446" href="Stlc.html#8539" class="InductiveConstructor"
      >true</a
      ><a name="15450" class="Symbol"
      >)</a
      ><a name="15451"
      >
              </a
      ><a name="15466" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="15467"
      > </a
      ><a name="15468" href="Stlc.html#14522" class="InductiveConstructor"
      >step</a
      ><a name="15472"
      > </a
      ><a name="15473" href="Stlc.html#14234" class="InductiveConstructor"
      >iftrue</a
      ><a name="15479"
      >
              </a
      ><a name="15494" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="15495"
      > </a
      ><a name="15496" href="Stlc.html#14487" class="InductiveConstructor"
      >refl</a
      >
{% endraw %}</pre>

Example:

    ((λx:bool → bool. x) ((λx:bool. if x then false else true) true))
    ==>* false

<pre class="Agda">{% raw %}
<a name="15622" href="Stlc.html#15622" class="Function"
      >step-example4</a
      ><a name="15635"
      > </a
      ><a name="15636" class="Symbol"
      >:</a
      ><a name="15637"
      > </a
      ><a name="15638" class="Symbol"
      >(</a
      ><a name="15639" href="Stlc.html#5443" class="InductiveConstructor"
      >app</a
      ><a name="15642"
      > </a
      ><a name="15643" href="Stlc.html#6231" class="Function"
      >idBB</a
      ><a name="15647"
      > </a
      ><a name="15648" class="Symbol"
      >(</a
      ><a name="15649" href="Stlc.html#5443" class="InductiveConstructor"
      >app</a
      ><a name="15652"
      > </a
      ><a name="15653" href="Stlc.html#6554" class="Function"
      >notB</a
      ><a name="15657"
      > </a
      ><a name="15658" href="Stlc.html#5506" class="InductiveConstructor"
      >true</a
      ><a name="15662" class="Symbol"
      >))</a
      ><a name="15664"
      > </a
      ><a name="15665" href="Stlc.html#14615" class="Function Operator"
      >==&gt;*</a
      ><a name="15669"
      > </a
      ><a name="15670" href="Stlc.html#5521" class="InductiveConstructor"
      >false</a
      ><a name="15675"
      >
</a
      ><a name="15676" href="Stlc.html#15622" class="Function"
      >step-example4</a
      ><a name="15689"
      > </a
      ><a name="15690" class="Symbol"
      >=</a
      ><a name="15691"
      > </a
      ><a name="15692" href="Stlc.html#14522" class="InductiveConstructor"
      >step</a
      ><a name="15696"
      > </a
      ><a name="15697" class="Symbol"
      >(</a
      ><a name="15698" href="Stlc.html#14026" class="InductiveConstructor"
      >app2</a
      ><a name="15702"
      > </a
      ><a name="15703" href="Stlc.html#8486" class="InductiveConstructor"
      >abs</a
      ><a name="15706"
      > </a
      ><a name="15707" class="Symbol"
      >(</a
      ><a name="15708" href="Stlc.html#13848" class="InductiveConstructor"
      >red</a
      ><a name="15711"
      > </a
      ><a name="15712" href="Stlc.html#8539" class="InductiveConstructor"
      >true</a
      ><a name="15716" class="Symbol"
      >))</a
      ><a name="15718"
      >
              </a
      ><a name="15733" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="15734"
      > </a
      ><a name="15735" href="Stlc.html#14522" class="InductiveConstructor"
      >step</a
      ><a name="15739"
      > </a
      ><a name="15740" class="Symbol"
      >(</a
      ><a name="15741" href="Stlc.html#14026" class="InductiveConstructor"
      >app2</a
      ><a name="15745"
      > </a
      ><a name="15746" href="Stlc.html#8486" class="InductiveConstructor"
      >abs</a
      ><a name="15749"
      > </a
      ><a name="15750" href="Stlc.html#14234" class="InductiveConstructor"
      >iftrue</a
      ><a name="15756" class="Symbol"
      >)</a
      ><a name="15757"
      >
              </a
      ><a name="15772" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="15773"
      > </a
      ><a name="15774" href="Stlc.html#14522" class="InductiveConstructor"
      >step</a
      ><a name="15778"
      > </a
      ><a name="15779" class="Symbol"
      >(</a
      ><a name="15780" href="Stlc.html#13848" class="InductiveConstructor"
      >red</a
      ><a name="15783"
      > </a
      ><a name="15784" href="Stlc.html#8560" class="InductiveConstructor"
      >false</a
      ><a name="15789" class="Symbol"
      >)</a
      ><a name="15790"
      >
              </a
      ><a name="15805" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="15806"
      > </a
      ><a name="15807" href="Stlc.html#14487" class="InductiveConstructor"
      >refl</a
      >
{% endraw %}</pre>

#### Exercise: 2 stars (step_example3)

<pre class="Agda">{% raw %}
<a name="15877" href="Stlc.html#15877" class="Function"
      >step-example5</a
      ><a name="15890"
      > </a
      ><a name="15891" class="Symbol"
      >:</a
      ><a name="15892"
      > </a
      ><a name="15893" class="Symbol"
      >(</a
      ><a name="15894" href="Stlc.html#5443" class="InductiveConstructor"
      >app</a
      ><a name="15897"
      > </a
      ><a name="15898" class="Symbol"
      >(</a
      ><a name="15899" href="Stlc.html#5443" class="InductiveConstructor"
      >app</a
      ><a name="15902"
      > </a
      ><a name="15903" href="Stlc.html#6337" class="Function"
      >idBBBB</a
      ><a name="15909"
      > </a
      ><a name="15910" href="Stlc.html#6231" class="Function"
      >idBB</a
      ><a name="15914" class="Symbol"
      >)</a
      ><a name="15915"
      > </a
      ><a name="15916" href="Stlc.html#6153" class="Function"
      >idB</a
      ><a name="15919" class="Symbol"
      >)</a
      ><a name="15920"
      > </a
      ><a name="15921" href="Stlc.html#14615" class="Function Operator"
      >==&gt;*</a
      ><a name="15925"
      > </a
      ><a name="15926" href="Stlc.html#6153" class="Function"
      >idB</a
      ><a name="15929"
      >
</a
      ><a name="15930" href="Stlc.html#15877" class="Function"
      >step-example5</a
      ><a name="15943"
      > </a
      ><a name="15944" class="Symbol"
      >=</a
      ><a name="15945"
      > </a
      ><a name="15946" class="Symbol"
      >{!!}</a
      ><a name="15950"
      > </a
      ><a name="15951" class="Comment"
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
<a name="16644" href="Stlc.html#16644" class="Function"
      >Ctxt</a
      ><a name="16648"
      > </a
      ><a name="16649" class="Symbol"
      >:</a
      ><a name="16650"
      > </a
      ><a name="16651" class="PrimitiveType"
      >Set</a
      ><a name="16654"
      >
</a
      ><a name="16655" href="Stlc.html#16644" class="Function"
      >Ctxt</a
      ><a name="16659"
      > </a
      ><a name="16660" class="Symbol"
      >=</a
      ><a name="16661"
      > </a
      ><a name="16662" href="Stlc.html#5099" class="Datatype"
      >Id</a
      ><a name="16664"
      > </a
      ><a name="16665" class="Symbol"
      >&#8594;</a
      ><a name="16666"
      > </a
      ><a name="16667" href="https://agda.github.io/agda-stdlib/Data.Maybe.Base.html#335" class="Datatype"
      >Maybe</a
      ><a name="16672"
      > </a
      ><a name="16673" href="Stlc.html#4985" class="Datatype"
      >Type</a
      ><a name="16677"
      >

</a
      ><a name="16679" href="Stlc.html#16679" class="Function"
      >&#8709;</a
      ><a name="16680"
      > </a
      ><a name="16681" class="Symbol"
      >:</a
      ><a name="16682"
      > </a
      ><a name="16683" href="Stlc.html#16644" class="Function"
      >Ctxt</a
      ><a name="16687"
      >
</a
      ><a name="16688" href="Stlc.html#16679" class="Function"
      >&#8709;</a
      ><a name="16689"
      > </a
      ><a name="16690" class="Symbol"
      >=</a
      ><a name="16691"
      > </a
      ><a name="16692" class="Symbol"
      >&#955;</a
      ><a name="16693"
      > </a
      ><a name="16694" href="Stlc.html#16694" class="Bound"
      >_</a
      ><a name="16695"
      > </a
      ><a name="16696" class="Symbol"
      >&#8594;</a
      ><a name="16697"
      > </a
      ><a name="16698" href="https://agda.github.io/agda-stdlib/Data.Maybe.Base.html#403" class="InductiveConstructor"
      >nothing</a
      ><a name="16705"
      >

</a
      ><a name="16707" href="Stlc.html#16707" class="Function Operator"
      >_,_&#8758;_</a
      ><a name="16712"
      > </a
      ><a name="16713" class="Symbol"
      >:</a
      ><a name="16714"
      > </a
      ><a name="16715" href="Stlc.html#16644" class="Function"
      >Ctxt</a
      ><a name="16719"
      > </a
      ><a name="16720" class="Symbol"
      >-&gt;</a
      ><a name="16722"
      > </a
      ><a name="16723" href="Stlc.html#5099" class="Datatype"
      >Id</a
      ><a name="16725"
      > </a
      ><a name="16726" class="Symbol"
      >-&gt;</a
      ><a name="16728"
      > </a
      ><a name="16729" href="Stlc.html#4985" class="Datatype"
      >Type</a
      ><a name="16733"
      > </a
      ><a name="16734" class="Symbol"
      >-&gt;</a
      ><a name="16736"
      > </a
      ><a name="16737" href="Stlc.html#16644" class="Function"
      >Ctxt</a
      ><a name="16741"
      >
</a
      ><a name="16742" class="Symbol"
      >(</a
      ><a name="16743" href="Stlc.html#16743" class="Bound"
      >&#915;</a
      ><a name="16744"
      > </a
      ><a name="16745" href="Stlc.html#16707" class="Function Operator"
      >,</a
      ><a name="16746"
      > </a
      ><a name="16747" href="Stlc.html#16747" class="Bound"
      >x</a
      ><a name="16748"
      > </a
      ><a name="16749" href="Stlc.html#16707" class="Function Operator"
      >&#8758;</a
      ><a name="16750"
      > </a
      ><a name="16751" href="Stlc.html#16751" class="Bound"
      >A</a
      ><a name="16752" class="Symbol"
      >)</a
      ><a name="16753"
      > </a
      ><a name="16754" href="Stlc.html#16754" class="Bound"
      >y</a
      ><a name="16755"
      > </a
      ><a name="16756" class="Keyword"
      >with</a
      ><a name="16760"
      > </a
      ><a name="16761" href="Stlc.html#16747" class="Bound"
      >x</a
      ><a name="16762"
      > </a
      ><a name="16763" href="Stlc.html#5233" class="Function Operator"
      >&#8799;</a
      ><a name="16764"
      > </a
      ><a name="16765" href="Stlc.html#16754" class="Bound"
      >y</a
      ><a name="16766"
      >
</a
      ><a name="16767" class="Symbol"
      >...</a
      ><a name="16770"
      > </a
      ><a name="16771" class="Symbol"
      >|</a
      ><a name="16772"
      > </a
      ><a name="16773" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="16776"
      > </a
      ><a name="16777" href="Stlc.html#16777" class="Bound"
      >x=y</a
      ><a name="16780"
      > </a
      ><a name="16781" class="Symbol"
      >=</a
      ><a name="16782"
      > </a
      ><a name="16783" href="https://agda.github.io/agda-stdlib/Data.Maybe.Base.html#373" class="InductiveConstructor"
      >just</a
      ><a name="16787"
      > </a
      ><a name="16788" href="Stlc.html#16751" class="Bound"
      >A</a
      ><a name="16789"
      >
</a
      ><a name="16790" class="Symbol"
      >...</a
      ><a name="16793"
      > </a
      ><a name="16794" class="Symbol"
      >|</a
      ><a name="16795"
      > </a
      ><a name="16796" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="16798"
      >  </a
      ><a name="16800" href="Stlc.html#16800" class="Bound"
      >x&#8800;y</a
      ><a name="16803"
      > </a
      ><a name="16804" class="Symbol"
      >=</a
      ><a name="16805"
      > </a
      ><a name="16806" href="Stlc.html#16743" class="Bound"
      >&#915;</a
      ><a name="16807"
      > </a
      ><a name="16808" href="Stlc.html#16754" class="Bound"
      >y</a
      ><a name="16809"
      >

</a
      ><a name="16811" class="Keyword"
      >infixl</a
      ><a name="16817"
      > </a
      ><a name="16818" class="Number"
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
<a name="17625" class="Keyword"
      >data</a
      ><a name="17629"
      > </a
      ><a name="17630" href="Stlc.html#17630" class="Datatype Operator"
      >_&#8866;_&#8758;_</a
      ><a name="17635"
      > </a
      ><a name="17636" class="Symbol"
      >:</a
      ><a name="17637"
      > </a
      ><a name="17638" href="Stlc.html#16644" class="Function"
      >Ctxt</a
      ><a name="17642"
      > </a
      ><a name="17643" class="Symbol"
      >-&gt;</a
      ><a name="17645"
      > </a
      ><a name="17646" href="Stlc.html#5404" class="Datatype"
      >Term</a
      ><a name="17650"
      > </a
      ><a name="17651" class="Symbol"
      >-&gt;</a
      ><a name="17653"
      > </a
      ><a name="17654" href="Stlc.html#4985" class="Datatype"
      >Type</a
      ><a name="17658"
      > </a
      ><a name="17659" class="Symbol"
      >-&gt;</a
      ><a name="17661"
      > </a
      ><a name="17662" class="PrimitiveType"
      >Set</a
      ><a name="17665"
      > </a
      ><a name="17666" class="Keyword"
      >where</a
      ><a name="17671"
      >
  </a
      ><a name="17674" href="Stlc.html#17674" class="InductiveConstructor"
      >var</a
      ><a name="17677"
      >           </a
      ><a name="17688" class="Symbol"
      >:</a
      ><a name="17689"
      > </a
      ><a name="17690" class="Symbol"
      >forall</a
      ><a name="17696"
      > </a
      ><a name="17697" class="Symbol"
      >{</a
      ><a name="17698" href="Stlc.html#17698" class="Bound"
      >&#915;</a
      ><a name="17699" class="Symbol"
      >}</a
      ><a name="17700"
      > </a
      ><a name="17701" href="Stlc.html#17701" class="Bound"
      >x</a
      ><a name="17702"
      > </a
      ><a name="17703" class="Symbol"
      >{</a
      ><a name="17704" href="Stlc.html#17704" class="Bound"
      >A</a
      ><a name="17705" class="Symbol"
      >}</a
      ><a name="17706"
      >
                </a
      ><a name="17723" class="Symbol"
      >&#8594;</a
      ><a name="17724"
      > </a
      ><a name="17725" href="Stlc.html#17698" class="Bound"
      >&#915;</a
      ><a name="17726"
      > </a
      ><a name="17727" href="Stlc.html#17701" class="Bound"
      >x</a
      ><a name="17728"
      > </a
      ><a name="17729" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="17730"
      > </a
      ><a name="17731" href="https://agda.github.io/agda-stdlib/Data.Maybe.Base.html#373" class="InductiveConstructor"
      >just</a
      ><a name="17735"
      > </a
      ><a name="17736" href="Stlc.html#17704" class="Bound"
      >A</a
      ><a name="17737"
      >
                </a
      ><a name="17754" class="Symbol"
      >&#8594;</a
      ><a name="17755"
      > </a
      ><a name="17756" href="Stlc.html#17698" class="Bound"
      >&#915;</a
      ><a name="17757"
      > </a
      ><a name="17758" href="Stlc.html#17630" class="Datatype Operator"
      >&#8866;</a
      ><a name="17759"
      > </a
      ><a name="17760" href="Stlc.html#5423" class="InductiveConstructor"
      >var</a
      ><a name="17763"
      > </a
      ><a name="17764" href="Stlc.html#17701" class="Bound"
      >x</a
      ><a name="17765"
      > </a
      ><a name="17766" href="Stlc.html#17630" class="Datatype Operator"
      >&#8758;</a
      ><a name="17767"
      > </a
      ><a name="17768" href="Stlc.html#17704" class="Bound"
      >A</a
      ><a name="17769"
      >
  </a
      ><a name="17772" href="Stlc.html#17772" class="InductiveConstructor"
      >abs</a
      ><a name="17775"
      >           </a
      ><a name="17786" class="Symbol"
      >:</a
      ><a name="17787"
      > </a
      ><a name="17788" class="Symbol"
      >forall</a
      ><a name="17794"
      > </a
      ><a name="17795" class="Symbol"
      >{</a
      ><a name="17796" href="Stlc.html#17796" class="Bound"
      >&#915;</a
      ><a name="17797" class="Symbol"
      >}</a
      ><a name="17798"
      > </a
      ><a name="17799" class="Symbol"
      >{</a
      ><a name="17800" href="Stlc.html#17800" class="Bound"
      >x</a
      ><a name="17801" class="Symbol"
      >}</a
      ><a name="17802"
      > </a
      ><a name="17803" class="Symbol"
      >{</a
      ><a name="17804" href="Stlc.html#17804" class="Bound"
      >A</a
      ><a name="17805" class="Symbol"
      >}</a
      ><a name="17806"
      > </a
      ><a name="17807" class="Symbol"
      >{</a
      ><a name="17808" href="Stlc.html#17808" class="Bound"
      >B</a
      ><a name="17809" class="Symbol"
      >}</a
      ><a name="17810"
      > </a
      ><a name="17811" class="Symbol"
      >{</a
      ><a name="17812" href="Stlc.html#17812" class="Bound"
      >s</a
      ><a name="17813" class="Symbol"
      >}</a
      ><a name="17814"
      >
                </a
      ><a name="17831" class="Symbol"
      >&#8594;</a
      ><a name="17832"
      > </a
      ><a name="17833" href="Stlc.html#17796" class="Bound"
      >&#915;</a
      ><a name="17834"
      > </a
      ><a name="17835" href="Stlc.html#16707" class="Function Operator"
      >,</a
      ><a name="17836"
      > </a
      ><a name="17837" href="Stlc.html#17800" class="Bound"
      >x</a
      ><a name="17838"
      > </a
      ><a name="17839" href="Stlc.html#16707" class="Function Operator"
      >&#8758;</a
      ><a name="17840"
      > </a
      ><a name="17841" href="Stlc.html#17804" class="Bound"
      >A</a
      ><a name="17842"
      > </a
      ><a name="17843" href="Stlc.html#17630" class="Datatype Operator"
      >&#8866;</a
      ><a name="17844"
      > </a
      ><a name="17845" href="Stlc.html#17812" class="Bound"
      >s</a
      ><a name="17846"
      > </a
      ><a name="17847" href="Stlc.html#17630" class="Datatype Operator"
      >&#8758;</a
      ><a name="17848"
      > </a
      ><a name="17849" href="Stlc.html#17808" class="Bound"
      >B</a
      ><a name="17850"
      >
                </a
      ><a name="17867" class="Symbol"
      >&#8594;</a
      ><a name="17868"
      > </a
      ><a name="17869" href="Stlc.html#17796" class="Bound"
      >&#915;</a
      ><a name="17870"
      > </a
      ><a name="17871" href="Stlc.html#17630" class="Datatype Operator"
      >&#8866;</a
      ><a name="17872"
      > </a
      ><a name="17873" href="Stlc.html#5472" class="InductiveConstructor"
      >abs</a
      ><a name="17876"
      > </a
      ><a name="17877" href="Stlc.html#17800" class="Bound"
      >x</a
      ><a name="17878"
      > </a
      ><a name="17879" href="Stlc.html#17804" class="Bound"
      >A</a
      ><a name="17880"
      > </a
      ><a name="17881" href="Stlc.html#17812" class="Bound"
      >s</a
      ><a name="17882"
      > </a
      ><a name="17883" href="Stlc.html#17630" class="Datatype Operator"
      >&#8758;</a
      ><a name="17884"
      > </a
      ><a name="17885" href="Stlc.html#17804" class="Bound"
      >A</a
      ><a name="17886"
      > </a
      ><a name="17887" href="Stlc.html#5018" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="17888"
      > </a
      ><a name="17889" href="Stlc.html#17808" class="Bound"
      >B</a
      ><a name="17890"
      >
  </a
      ><a name="17893" href="Stlc.html#17893" class="InductiveConstructor"
      >app</a
      ><a name="17896"
      >           </a
      ><a name="17907" class="Symbol"
      >:</a
      ><a name="17908"
      > </a
      ><a name="17909" class="Symbol"
      >forall</a
      ><a name="17915"
      > </a
      ><a name="17916" class="Symbol"
      >{</a
      ><a name="17917" href="Stlc.html#17917" class="Bound"
      >&#915;</a
      ><a name="17918" class="Symbol"
      >}</a
      ><a name="17919"
      > </a
      ><a name="17920" class="Symbol"
      >{</a
      ><a name="17921" href="Stlc.html#17921" class="Bound"
      >A</a
      ><a name="17922" class="Symbol"
      >}</a
      ><a name="17923"
      > </a
      ><a name="17924" class="Symbol"
      >{</a
      ><a name="17925" href="Stlc.html#17925" class="Bound"
      >B</a
      ><a name="17926" class="Symbol"
      >}</a
      ><a name="17927"
      > </a
      ><a name="17928" class="Symbol"
      >{</a
      ><a name="17929" href="Stlc.html#17929" class="Bound"
      >s</a
      ><a name="17930" class="Symbol"
      >}</a
      ><a name="17931"
      > </a
      ><a name="17932" class="Symbol"
      >{</a
      ><a name="17933" href="Stlc.html#17933" class="Bound"
      >t</a
      ><a name="17934" class="Symbol"
      >}</a
      ><a name="17935"
      >
                </a
      ><a name="17952" class="Symbol"
      >&#8594;</a
      ><a name="17953"
      > </a
      ><a name="17954" href="Stlc.html#17917" class="Bound"
      >&#915;</a
      ><a name="17955"
      > </a
      ><a name="17956" href="Stlc.html#17630" class="Datatype Operator"
      >&#8866;</a
      ><a name="17957"
      > </a
      ><a name="17958" href="Stlc.html#17929" class="Bound"
      >s</a
      ><a name="17959"
      > </a
      ><a name="17960" href="Stlc.html#17630" class="Datatype Operator"
      >&#8758;</a
      ><a name="17961"
      > </a
      ><a name="17962" href="Stlc.html#17921" class="Bound"
      >A</a
      ><a name="17963"
      > </a
      ><a name="17964" href="Stlc.html#5018" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="17965"
      > </a
      ><a name="17966" href="Stlc.html#17925" class="Bound"
      >B</a
      ><a name="17967"
      >
                </a
      ><a name="17984" class="Symbol"
      >&#8594;</a
      ><a name="17985"
      > </a
      ><a name="17986" href="Stlc.html#17917" class="Bound"
      >&#915;</a
      ><a name="17987"
      > </a
      ><a name="17988" href="Stlc.html#17630" class="Datatype Operator"
      >&#8866;</a
      ><a name="17989"
      > </a
      ><a name="17990" href="Stlc.html#17933" class="Bound"
      >t</a
      ><a name="17991"
      > </a
      ><a name="17992" href="Stlc.html#17630" class="Datatype Operator"
      >&#8758;</a
      ><a name="17993"
      > </a
      ><a name="17994" href="Stlc.html#17921" class="Bound"
      >A</a
      ><a name="17995"
      >
                </a
      ><a name="18012" class="Symbol"
      >&#8594;</a
      ><a name="18013"
      > </a
      ><a name="18014" href="Stlc.html#17917" class="Bound"
      >&#915;</a
      ><a name="18015"
      > </a
      ><a name="18016" href="Stlc.html#17630" class="Datatype Operator"
      >&#8866;</a
      ><a name="18017"
      > </a
      ><a name="18018" href="Stlc.html#5443" class="InductiveConstructor"
      >app</a
      ><a name="18021"
      > </a
      ><a name="18022" href="Stlc.html#17929" class="Bound"
      >s</a
      ><a name="18023"
      > </a
      ><a name="18024" href="Stlc.html#17933" class="Bound"
      >t</a
      ><a name="18025"
      > </a
      ><a name="18026" href="Stlc.html#17630" class="Datatype Operator"
      >&#8758;</a
      ><a name="18027"
      > </a
      ><a name="18028" href="Stlc.html#17925" class="Bound"
      >B</a
      ><a name="18029"
      >
  </a
      ><a name="18032" href="Stlc.html#18032" class="InductiveConstructor"
      >true</a
      ><a name="18036"
      >          </a
      ><a name="18046" class="Symbol"
      >:</a
      ><a name="18047"
      > </a
      ><a name="18048" class="Symbol"
      >forall</a
      ><a name="18054"
      > </a
      ><a name="18055" class="Symbol"
      >{</a
      ><a name="18056" href="Stlc.html#18056" class="Bound"
      >&#915;</a
      ><a name="18057" class="Symbol"
      >}</a
      ><a name="18058"
      >
                </a
      ><a name="18075" class="Symbol"
      >&#8594;</a
      ><a name="18076"
      > </a
      ><a name="18077" href="Stlc.html#18056" class="Bound"
      >&#915;</a
      ><a name="18078"
      > </a
      ><a name="18079" href="Stlc.html#17630" class="Datatype Operator"
      >&#8866;</a
      ><a name="18080"
      > </a
      ><a name="18081" href="Stlc.html#5506" class="InductiveConstructor"
      >true</a
      ><a name="18085"
      >  </a
      ><a name="18087" href="Stlc.html#17630" class="Datatype Operator"
      >&#8758;</a
      ><a name="18088"
      > </a
      ><a name="18089" href="Stlc.html#5004" class="InductiveConstructor"
      >bool</a
      ><a name="18093"
      >
  </a
      ><a name="18096" href="Stlc.html#18096" class="InductiveConstructor"
      >false</a
      ><a name="18101"
      >         </a
      ><a name="18110" class="Symbol"
      >:</a
      ><a name="18111"
      > </a
      ><a name="18112" class="Symbol"
      >forall</a
      ><a name="18118"
      > </a
      ><a name="18119" class="Symbol"
      >{</a
      ><a name="18120" href="Stlc.html#18120" class="Bound"
      >&#915;</a
      ><a name="18121" class="Symbol"
      >}</a
      ><a name="18122"
      >
                </a
      ><a name="18139" class="Symbol"
      >&#8594;</a
      ><a name="18140"
      > </a
      ><a name="18141" href="Stlc.html#18120" class="Bound"
      >&#915;</a
      ><a name="18142"
      > </a
      ><a name="18143" href="Stlc.html#17630" class="Datatype Operator"
      >&#8866;</a
      ><a name="18144"
      > </a
      ><a name="18145" href="Stlc.html#5521" class="InductiveConstructor"
      >false</a
      ><a name="18150"
      > </a
      ><a name="18151" href="Stlc.html#17630" class="Datatype Operator"
      >&#8758;</a
      ><a name="18152"
      > </a
      ><a name="18153" href="Stlc.html#5004" class="InductiveConstructor"
      >bool</a
      ><a name="18157"
      >
  </a
      ><a name="18160" href="Stlc.html#18160" class="InductiveConstructor Operator"
      >if_then_else_</a
      ><a name="18173"
      > </a
      ><a name="18174" class="Symbol"
      >:</a
      ><a name="18175"
      > </a
      ><a name="18176" class="Symbol"
      >forall</a
      ><a name="18182"
      > </a
      ><a name="18183" class="Symbol"
      >{</a
      ><a name="18184" href="Stlc.html#18184" class="Bound"
      >&#915;</a
      ><a name="18185" class="Symbol"
      >}</a
      ><a name="18186"
      > </a
      ><a name="18187" class="Symbol"
      >{</a
      ><a name="18188" href="Stlc.html#18188" class="Bound"
      >s</a
      ><a name="18189" class="Symbol"
      >}</a
      ><a name="18190"
      > </a
      ><a name="18191" class="Symbol"
      >{</a
      ><a name="18192" href="Stlc.html#18192" class="Bound"
      >t</a
      ><a name="18193" class="Symbol"
      >}</a
      ><a name="18194"
      > </a
      ><a name="18195" class="Symbol"
      >{</a
      ><a name="18196" href="Stlc.html#18196" class="Bound"
      >u</a
      ><a name="18197" class="Symbol"
      >}</a
      ><a name="18198"
      > </a
      ><a name="18199" class="Symbol"
      >{</a
      ><a name="18200" href="Stlc.html#18200" class="Bound"
      >A</a
      ><a name="18201" class="Symbol"
      >}</a
      ><a name="18202"
      >
                </a
      ><a name="18219" class="Symbol"
      >&#8594;</a
      ><a name="18220"
      > </a
      ><a name="18221" href="Stlc.html#18184" class="Bound"
      >&#915;</a
      ><a name="18222"
      > </a
      ><a name="18223" href="Stlc.html#17630" class="Datatype Operator"
      >&#8866;</a
      ><a name="18224"
      > </a
      ><a name="18225" href="Stlc.html#18188" class="Bound"
      >s</a
      ><a name="18226"
      > </a
      ><a name="18227" href="Stlc.html#17630" class="Datatype Operator"
      >&#8758;</a
      ><a name="18228"
      > </a
      ><a name="18229" href="Stlc.html#5004" class="InductiveConstructor"
      >bool</a
      ><a name="18233"
      >
                </a
      ><a name="18250" class="Symbol"
      >&#8594;</a
      ><a name="18251"
      > </a
      ><a name="18252" href="Stlc.html#18184" class="Bound"
      >&#915;</a
      ><a name="18253"
      > </a
      ><a name="18254" href="Stlc.html#17630" class="Datatype Operator"
      >&#8866;</a
      ><a name="18255"
      > </a
      ><a name="18256" href="Stlc.html#18192" class="Bound"
      >t</a
      ><a name="18257"
      > </a
      ><a name="18258" href="Stlc.html#17630" class="Datatype Operator"
      >&#8758;</a
      ><a name="18259"
      > </a
      ><a name="18260" href="Stlc.html#18200" class="Bound"
      >A</a
      ><a name="18261"
      >
                </a
      ><a name="18278" class="Symbol"
      >&#8594;</a
      ><a name="18279"
      > </a
      ><a name="18280" href="Stlc.html#18184" class="Bound"
      >&#915;</a
      ><a name="18281"
      > </a
      ><a name="18282" href="Stlc.html#17630" class="Datatype Operator"
      >&#8866;</a
      ><a name="18283"
      > </a
      ><a name="18284" href="Stlc.html#18196" class="Bound"
      >u</a
      ><a name="18285"
      > </a
      ><a name="18286" href="Stlc.html#17630" class="Datatype Operator"
      >&#8758;</a
      ><a name="18287"
      > </a
      ><a name="18288" href="Stlc.html#18200" class="Bound"
      >A</a
      ><a name="18289"
      >
                </a
      ><a name="18306" class="Symbol"
      >&#8594;</a
      ><a name="18307"
      > </a
      ><a name="18308" href="Stlc.html#18184" class="Bound"
      >&#915;</a
      ><a name="18309"
      > </a
      ><a name="18310" href="Stlc.html#17630" class="Datatype Operator"
      >&#8866;</a
      ><a name="18311"
      > </a
      ><a name="18312" href="Stlc.html#5536" class="InductiveConstructor Operator"
      >if</a
      ><a name="18314"
      > </a
      ><a name="18315" href="Stlc.html#18188" class="Bound"
      >s</a
      ><a name="18316"
      > </a
      ><a name="18317" href="Stlc.html#5536" class="InductiveConstructor Operator"
      >then</a
      ><a name="18321"
      > </a
      ><a name="18322" href="Stlc.html#18192" class="Bound"
      >t</a
      ><a name="18323"
      > </a
      ><a name="18324" href="Stlc.html#5536" class="InductiveConstructor Operator"
      >else</a
      ><a name="18328"
      > </a
      ><a name="18329" href="Stlc.html#18196" class="Bound"
      >u</a
      ><a name="18330"
      > </a
      ><a name="18331" href="Stlc.html#17630" class="Datatype Operator"
      >&#8758;</a
      ><a name="18332"
      > </a
      ><a name="18333" href="Stlc.html#18200" class="Bound"
      >A</a
      ><a name="18334"
      >

</a
      ><a name="18336" class="Keyword"
      >infix</a
      ><a name="18341"
      > </a
      ><a name="18342" class="Number"
      >1</a
      >
{% endraw %}</pre>

### Examples

<pre class="Agda">{% raw %}
<a name="18389" href="Stlc.html#18389" class="Function"
      >typing-example1</a
      ><a name="18404"
      > </a
      ><a name="18405" class="Symbol"
      >:</a
      ><a name="18406"
      > </a
      ><a name="18407" href="Stlc.html#16679" class="Function"
      >&#8709;</a
      ><a name="18408"
      > </a
      ><a name="18409" href="Stlc.html#17630" class="Datatype Operator"
      >&#8866;</a
      ><a name="18410"
      > </a
      ><a name="18411" href="Stlc.html#6153" class="Function"
      >idB</a
      ><a name="18414"
      > </a
      ><a name="18415" href="Stlc.html#17630" class="Datatype Operator"
      >&#8758;</a
      ><a name="18416"
      > </a
      ><a name="18417" href="Stlc.html#5004" class="InductiveConstructor"
      >bool</a
      ><a name="18421"
      > </a
      ><a name="18422" href="Stlc.html#5018" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="18423"
      > </a
      ><a name="18424" href="Stlc.html#5004" class="InductiveConstructor"
      >bool</a
      ><a name="18428"
      >
</a
      ><a name="18429" href="Stlc.html#18389" class="Function"
      >typing-example1</a
      ><a name="18444"
      > </a
      ><a name="18445" class="Symbol"
      >=</a
      ><a name="18446"
      > </a
      ><a name="18447" href="Stlc.html#17772" class="InductiveConstructor"
      >abs</a
      ><a name="18450"
      > </a
      ><a name="18451" class="Symbol"
      >(</a
      ><a name="18452" href="Stlc.html#17674" class="InductiveConstructor"
      >var</a
      ><a name="18455"
      > </a
      ><a name="18456" href="Stlc.html#5940" class="Function"
      >x</a
      ><a name="18457"
      > </a
      ><a name="18458" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="18462" class="Symbol"
      >)</a
      >
{% endraw %}</pre>

Another example:

    empty ⊢ λx:A. λy:A⇒A. y (y x)) ∶ A⇒(A⇒A)⇒A

<pre class="Agda">{% raw %}
<a name="18555" href="Stlc.html#18555" class="Function"
      >typing-example2</a
      ><a name="18570"
      > </a
      ><a name="18571" class="Symbol"
      >:</a
      ><a name="18572"
      > </a
      ><a name="18573" href="Stlc.html#16679" class="Function"
      >&#8709;</a
      ><a name="18574"
      > </a
      ><a name="18575" href="Stlc.html#17630" class="Datatype Operator"
      >&#8866;</a
      ><a name="18576"
      >
  </a
      ><a name="18579" class="Symbol"
      >(</a
      ><a name="18580" href="Stlc.html#5472" class="InductiveConstructor"
      >abs</a
      ><a name="18583"
      > </a
      ><a name="18584" href="Stlc.html#5940" class="Function"
      >x</a
      ><a name="18585"
      > </a
      ><a name="18586" href="Stlc.html#5004" class="InductiveConstructor"
      >bool</a
      ><a name="18590"
      >
    </a
      ><a name="18595" class="Symbol"
      >(</a
      ><a name="18596" href="Stlc.html#5472" class="InductiveConstructor"
      >abs</a
      ><a name="18599"
      > </a
      ><a name="18600" href="Stlc.html#5949" class="Function"
      >y</a
      ><a name="18601"
      > </a
      ><a name="18602" class="Symbol"
      >(</a
      ><a name="18603" href="Stlc.html#5004" class="InductiveConstructor"
      >bool</a
      ><a name="18607"
      > </a
      ><a name="18608" href="Stlc.html#5018" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="18609"
      > </a
      ><a name="18610" href="Stlc.html#5004" class="InductiveConstructor"
      >bool</a
      ><a name="18614" class="Symbol"
      >)</a
      ><a name="18615"
      >
      </a
      ><a name="18622" class="Symbol"
      >(</a
      ><a name="18623" href="Stlc.html#5443" class="InductiveConstructor"
      >app</a
      ><a name="18626"
      > </a
      ><a name="18627" class="Symbol"
      >(</a
      ><a name="18628" href="Stlc.html#5423" class="InductiveConstructor"
      >var</a
      ><a name="18631"
      > </a
      ><a name="18632" href="Stlc.html#5949" class="Function"
      >y</a
      ><a name="18633" class="Symbol"
      >)</a
      ><a name="18634"
      >
        </a
      ><a name="18643" class="Symbol"
      >(</a
      ><a name="18644" href="Stlc.html#5443" class="InductiveConstructor"
      >app</a
      ><a name="18647"
      > </a
      ><a name="18648" class="Symbol"
      >(</a
      ><a name="18649" href="Stlc.html#5423" class="InductiveConstructor"
      >var</a
      ><a name="18652"
      > </a
      ><a name="18653" href="Stlc.html#5949" class="Function"
      >y</a
      ><a name="18654" class="Symbol"
      >)</a
      ><a name="18655"
      > </a
      ><a name="18656" class="Symbol"
      >(</a
      ><a name="18657" href="Stlc.html#5423" class="InductiveConstructor"
      >var</a
      ><a name="18660"
      > </a
      ><a name="18661" href="Stlc.html#5940" class="Function"
      >x</a
      ><a name="18662" class="Symbol"
      >)))))</a
      ><a name="18667"
      > </a
      ><a name="18668" href="Stlc.html#17630" class="Datatype Operator"
      >&#8758;</a
      ><a name="18669"
      >
  </a
      ><a name="18672" class="Symbol"
      >(</a
      ><a name="18673" href="Stlc.html#5004" class="InductiveConstructor"
      >bool</a
      ><a name="18677"
      > </a
      ><a name="18678" href="Stlc.html#5018" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="18679"
      > </a
      ><a name="18680" class="Symbol"
      >(</a
      ><a name="18681" href="Stlc.html#5004" class="InductiveConstructor"
      >bool</a
      ><a name="18685"
      > </a
      ><a name="18686" href="Stlc.html#5018" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="18687"
      > </a
      ><a name="18688" href="Stlc.html#5004" class="InductiveConstructor"
      >bool</a
      ><a name="18692" class="Symbol"
      >)</a
      ><a name="18693"
      > </a
      ><a name="18694" href="Stlc.html#5018" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="18695"
      > </a
      ><a name="18696" href="Stlc.html#5004" class="InductiveConstructor"
      >bool</a
      ><a name="18700" class="Symbol"
      >)</a
      ><a name="18701"
      >
</a
      ><a name="18702" href="Stlc.html#18555" class="Function"
      >typing-example2</a
      ><a name="18717"
      > </a
      ><a name="18718" class="Symbol"
      >=</a
      ><a name="18719"
      >
  </a
      ><a name="18722" class="Symbol"
      >(</a
      ><a name="18723" href="Stlc.html#17772" class="InductiveConstructor"
      >abs</a
      ><a name="18726"
      >
    </a
      ><a name="18731" class="Symbol"
      >(</a
      ><a name="18732" href="Stlc.html#17772" class="InductiveConstructor"
      >abs</a
      ><a name="18735"
      >
      </a
      ><a name="18742" class="Symbol"
      >(</a
      ><a name="18743" href="Stlc.html#17893" class="InductiveConstructor"
      >app</a
      ><a name="18746"
      > </a
      ><a name="18747" class="Symbol"
      >(</a
      ><a name="18748" href="Stlc.html#17674" class="InductiveConstructor"
      >var</a
      ><a name="18751"
      > </a
      ><a name="18752" href="Stlc.html#5949" class="Function"
      >y</a
      ><a name="18753"
      > </a
      ><a name="18754" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="18758" class="Symbol"
      >)</a
      ><a name="18759"
      >
        </a
      ><a name="18768" class="Symbol"
      >(</a
      ><a name="18769" href="Stlc.html#17893" class="InductiveConstructor"
      >app</a
      ><a name="18772"
      > </a
      ><a name="18773" class="Symbol"
      >(</a
      ><a name="18774" href="Stlc.html#17674" class="InductiveConstructor"
      >var</a
      ><a name="18777"
      > </a
      ><a name="18778" href="Stlc.html#5949" class="Function"
      >y</a
      ><a name="18779"
      > </a
      ><a name="18780" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="18784" class="Symbol"
      >)</a
      ><a name="18785"
      > </a
      ><a name="18786" class="Symbol"
      >(</a
      ><a name="18787" href="Stlc.html#17674" class="InductiveConstructor"
      >var</a
      ><a name="18790"
      > </a
      ><a name="18791" href="Stlc.html#5940" class="Function"
      >x</a
      ><a name="18792"
      > </a
      ><a name="18793" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="18797" class="Symbol"
      >)</a
      ><a name="18798"
      > </a
      ><a name="18799" class="Symbol"
      >))))</a
      >
{% endraw %}</pre>

#### Exercise: 2 stars (typing_example_3)
Formally prove the following typing derivation holds:

    empty ⊢ λx:bool⇒B. λy:bool⇒bool. \z:bool. y (x z) ∶ T.

<pre class="Agda">{% raw %}
<a name="18986" href="Stlc.html#18986" class="Function"
      >typing-example3</a
      ><a name="19001"
      > </a
      ><a name="19002" class="Symbol"
      >:</a
      ><a name="19003"
      > </a
      ><a name="19004" href="https://agda.github.io/agda-stdlib/Data.Product.html#823" class="Function"
      >&#8707;</a
      ><a name="19005"
      > </a
      ><a name="19006" class="Symbol"
      >&#955;</a
      ><a name="19007"
      > </a
      ><a name="19008" href="Stlc.html#19008" class="Bound"
      >A</a
      ><a name="19009"
      > </a
      ><a name="19010" class="Symbol"
      >&#8594;</a
      ><a name="19011"
      > </a
      ><a name="19012" href="Stlc.html#16679" class="Function"
      >&#8709;</a
      ><a name="19013"
      > </a
      ><a name="19014" href="Stlc.html#17630" class="Datatype Operator"
      >&#8866;</a
      ><a name="19015"
      >
  </a
      ><a name="19018" class="Symbol"
      >(</a
      ><a name="19019" href="Stlc.html#5472" class="InductiveConstructor"
      >abs</a
      ><a name="19022"
      > </a
      ><a name="19023" href="Stlc.html#5940" class="Function"
      >x</a
      ><a name="19024"
      > </a
      ><a name="19025" class="Symbol"
      >(</a
      ><a name="19026" href="Stlc.html#5004" class="InductiveConstructor"
      >bool</a
      ><a name="19030"
      > </a
      ><a name="19031" href="Stlc.html#5018" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="19032"
      > </a
      ><a name="19033" href="Stlc.html#5004" class="InductiveConstructor"
      >bool</a
      ><a name="19037" class="Symbol"
      >)</a
      ><a name="19038"
      >
    </a
      ><a name="19043" class="Symbol"
      >(</a
      ><a name="19044" href="Stlc.html#5472" class="InductiveConstructor"
      >abs</a
      ><a name="19047"
      > </a
      ><a name="19048" href="Stlc.html#5949" class="Function"
      >y</a
      ><a name="19049"
      > </a
      ><a name="19050" class="Symbol"
      >(</a
      ><a name="19051" href="Stlc.html#5004" class="InductiveConstructor"
      >bool</a
      ><a name="19055"
      > </a
      ><a name="19056" href="Stlc.html#5018" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="19057"
      > </a
      ><a name="19058" href="Stlc.html#5004" class="InductiveConstructor"
      >bool</a
      ><a name="19062" class="Symbol"
      >)</a
      ><a name="19063"
      >
      </a
      ><a name="19070" class="Symbol"
      >(</a
      ><a name="19071" href="Stlc.html#5472" class="InductiveConstructor"
      >abs</a
      ><a name="19074"
      > </a
      ><a name="19075" href="Stlc.html#5958" class="Function"
      >z</a
      ><a name="19076"
      > </a
      ><a name="19077" href="Stlc.html#5004" class="InductiveConstructor"
      >bool</a
      ><a name="19081"
      >
        </a
      ><a name="19090" class="Symbol"
      >(</a
      ><a name="19091" href="Stlc.html#5443" class="InductiveConstructor"
      >app</a
      ><a name="19094"
      > </a
      ><a name="19095" class="Symbol"
      >(</a
      ><a name="19096" href="Stlc.html#5423" class="InductiveConstructor"
      >var</a
      ><a name="19099"
      > </a
      ><a name="19100" href="Stlc.html#5949" class="Function"
      >y</a
      ><a name="19101" class="Symbol"
      >)</a
      ><a name="19102"
      > </a
      ><a name="19103" class="Symbol"
      >(</a
      ><a name="19104" href="Stlc.html#5443" class="InductiveConstructor"
      >app</a
      ><a name="19107"
      > </a
      ><a name="19108" class="Symbol"
      >(</a
      ><a name="19109" href="Stlc.html#5423" class="InductiveConstructor"
      >var</a
      ><a name="19112"
      > </a
      ><a name="19113" href="Stlc.html#5940" class="Function"
      >x</a
      ><a name="19114" class="Symbol"
      >)</a
      ><a name="19115"
      > </a
      ><a name="19116" class="Symbol"
      >(</a
      ><a name="19117" href="Stlc.html#5423" class="InductiveConstructor"
      >var</a
      ><a name="19120"
      > </a
      ><a name="19121" href="Stlc.html#5958" class="Function"
      >z</a
      ><a name="19122" class="Symbol"
      >))))))</a
      ><a name="19128"
      > </a
      ><a name="19129" href="Stlc.html#17630" class="Datatype Operator"
      >&#8758;</a
      ><a name="19130"
      > </a
      ><a name="19131" href="Stlc.html#19008" class="Bound"
      >A</a
      ><a name="19132"
      >
</a
      ><a name="19133" href="Stlc.html#18986" class="Function"
      >typing-example3</a
      ><a name="19148"
      > </a
      ><a name="19149" class="Symbol"
      >=</a
      ><a name="19150"
      > </a
      ><a name="19151" class="Symbol"
      >{!!}</a
      ><a name="19155"
      > </a
      ><a name="19156" class="Comment"
      >-- FILL IN HERE</a
      >
{% endraw %}</pre>

We can also show that terms are _not_ typable.  For example, let's
formally check that there is no typing derivation assigning a type
to the term `λx:bool. λy:bool, x y` -- i.e.,

    ~ exists T,
    empty ⊢ λx:bool. λy:bool, x y : T.

<pre class="Agda">{% raw %}
<a name="19433" href="Stlc.html#19433" class="Function"
      >typing-nonexample1</a
      ><a name="19451"
      > </a
      ><a name="19452" class="Symbol"
      >:</a
      ><a name="19453"
      > </a
      ><a name="19454" href="https://agda.github.io/agda-stdlib/Data.Product.html#884" class="Function"
      >&#8708;</a
      ><a name="19455"
      > </a
      ><a name="19456" class="Symbol"
      >&#955;</a
      ><a name="19457"
      > </a
      ><a name="19458" href="Stlc.html#19458" class="Bound"
      >A</a
      ><a name="19459"
      > </a
      ><a name="19460" class="Symbol"
      >&#8594;</a
      ><a name="19461"
      > </a
      ><a name="19462" href="Stlc.html#16679" class="Function"
      >&#8709;</a
      ><a name="19463"
      > </a
      ><a name="19464" href="Stlc.html#17630" class="Datatype Operator"
      >&#8866;</a
      ><a name="19465"
      >
  </a
      ><a name="19468" class="Symbol"
      >(</a
      ><a name="19469" href="Stlc.html#5472" class="InductiveConstructor"
      >abs</a
      ><a name="19472"
      > </a
      ><a name="19473" href="Stlc.html#5940" class="Function"
      >x</a
      ><a name="19474"
      > </a
      ><a name="19475" href="Stlc.html#5004" class="InductiveConstructor"
      >bool</a
      ><a name="19479"
      >
    </a
      ><a name="19484" class="Symbol"
      >(</a
      ><a name="19485" href="Stlc.html#5472" class="InductiveConstructor"
      >abs</a
      ><a name="19488"
      > </a
      ><a name="19489" href="Stlc.html#5949" class="Function"
      >y</a
      ><a name="19490"
      > </a
      ><a name="19491" href="Stlc.html#5004" class="InductiveConstructor"
      >bool</a
      ><a name="19495"
      >
      </a
      ><a name="19502" class="Symbol"
      >(</a
      ><a name="19503" href="Stlc.html#5443" class="InductiveConstructor"
      >app</a
      ><a name="19506"
      > </a
      ><a name="19507" class="Symbol"
      >(</a
      ><a name="19508" href="Stlc.html#5423" class="InductiveConstructor"
      >var</a
      ><a name="19511"
      > </a
      ><a name="19512" href="Stlc.html#5940" class="Function"
      >x</a
      ><a name="19513" class="Symbol"
      >)</a
      ><a name="19514"
      > </a
      ><a name="19515" class="Symbol"
      >(</a
      ><a name="19516" href="Stlc.html#5423" class="InductiveConstructor"
      >var</a
      ><a name="19519"
      > </a
      ><a name="19520" href="Stlc.html#5949" class="Function"
      >y</a
      ><a name="19521" class="Symbol"
      >))))</a
      ><a name="19525"
      > </a
      ><a name="19526" href="Stlc.html#17630" class="Datatype Operator"
      >&#8758;</a
      ><a name="19527"
      > </a
      ><a name="19528" href="Stlc.html#19458" class="Bound"
      >A</a
      ><a name="19529"
      >
</a
      ><a name="19530" href="Stlc.html#19433" class="Function"
      >typing-nonexample1</a
      ><a name="19548"
      > </a
      ><a name="19549" class="Symbol"
      >=</a
      ><a name="19550"
      > </a
      ><a name="19551" class="Symbol"
      >{!!}</a
      ><a name="19555"
      > </a
      ><a name="19556" class="Comment"
      >-- FILL IN HERE</a
      >
{% endraw %}</pre>

#### Exercise: 3 stars, optional (typing_nonexample_3)
Another nonexample:

    ~ (exists S, exists T,
    empty ⊢ λx:S. x x ∶ T).

<pre class="Agda">{% raw %}
<a name="19729" href="Stlc.html#19729" class="Function"
      >typing-nonexample2</a
      ><a name="19747"
      > </a
      ><a name="19748" class="Symbol"
      >:</a
      ><a name="19749"
      > </a
      ><a name="19750" href="https://agda.github.io/agda-stdlib/Data.Product.html#884" class="Function"
      >&#8708;</a
      ><a name="19751"
      > </a
      ><a name="19752" class="Symbol"
      >&#955;</a
      ><a name="19753"
      > </a
      ><a name="19754" href="Stlc.html#19754" class="Bound"
      >A</a
      ><a name="19755"
      > </a
      ><a name="19756" class="Symbol"
      >&#8594;</a
      ><a name="19757"
      > </a
      ><a name="19758" href="https://agda.github.io/agda-stdlib/Data.Product.html#823" class="Function"
      >&#8707;</a
      ><a name="19759"
      > </a
      ><a name="19760" class="Symbol"
      >&#955;</a
      ><a name="19761"
      > </a
      ><a name="19762" href="Stlc.html#19762" class="Bound"
      >B</a
      ><a name="19763"
      > </a
      ><a name="19764" class="Symbol"
      >&#8594;</a
      ><a name="19765"
      > </a
      ><a name="19766" href="Stlc.html#16679" class="Function"
      >&#8709;</a
      ><a name="19767"
      > </a
      ><a name="19768" href="Stlc.html#17630" class="Datatype Operator"
      >&#8866;</a
      ><a name="19769"
      >
  </a
      ><a name="19772" class="Symbol"
      >(</a
      ><a name="19773" href="Stlc.html#5472" class="InductiveConstructor"
      >abs</a
      ><a name="19776"
      > </a
      ><a name="19777" href="Stlc.html#5940" class="Function"
      >x</a
      ><a name="19778"
      > </a
      ><a name="19779" href="Stlc.html#19762" class="Bound"
      >B</a
      ><a name="19780"
      > </a
      ><a name="19781" class="Symbol"
      >(</a
      ><a name="19782" href="Stlc.html#5443" class="InductiveConstructor"
      >app</a
      ><a name="19785"
      > </a
      ><a name="19786" class="Symbol"
      >(</a
      ><a name="19787" href="Stlc.html#5423" class="InductiveConstructor"
      >var</a
      ><a name="19790"
      > </a
      ><a name="19791" href="Stlc.html#5940" class="Function"
      >x</a
      ><a name="19792" class="Symbol"
      >)</a
      ><a name="19793"
      > </a
      ><a name="19794" class="Symbol"
      >(</a
      ><a name="19795" href="Stlc.html#5423" class="InductiveConstructor"
      >var</a
      ><a name="19798"
      > </a
      ><a name="19799" href="Stlc.html#5940" class="Function"
      >x</a
      ><a name="19800" class="Symbol"
      >)))</a
      ><a name="19803"
      > </a
      ><a name="19804" href="Stlc.html#17630" class="Datatype Operator"
      >&#8758;</a
      ><a name="19805"
      > </a
      ><a name="19806" href="Stlc.html#19754" class="Bound"
      >A</a
      ><a name="19807"
      >
</a
      ><a name="19808" href="Stlc.html#19729" class="Function"
      >typing-nonexample2</a
      ><a name="19826"
      > </a
      ><a name="19827" class="Symbol"
      >=</a
      ><a name="19828"
      > </a
      ><a name="19829" class="Symbol"
      >{!!}</a
      ><a name="19833"
      > </a
      ><a name="19834" class="Comment"
      >-- FILL IN HERE</a
      >
{% endraw %}</pre>
