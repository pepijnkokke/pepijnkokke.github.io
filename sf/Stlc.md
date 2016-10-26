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
<a name="5012" class="Keyword"
      >data</a
      ><a name="5016"
      > </a
      ><a name="5017" href="Stlc.html#5017" class="Datatype"
      >Type</a
      ><a name="5021"
      > </a
      ><a name="5022" class="Symbol"
      >:</a
      ><a name="5023"
      > </a
      ><a name="5024" class="PrimitiveType"
      >Set</a
      ><a name="5027"
      > </a
      ><a name="5028" class="Keyword"
      >where</a
      ><a name="5033"
      >
  </a
      ><a name="5036" href="Stlc.html#5036" class="InductiveConstructor"
      >bool</a
      ><a name="5040"
      > </a
      ><a name="5041" class="Symbol"
      >:</a
      ><a name="5042"
      > </a
      ><a name="5043" href="Stlc.html#5017" class="Datatype"
      >Type</a
      ><a name="5047"
      >
  </a
      ><a name="5050" href="Stlc.html#5050" class="InductiveConstructor Operator"
      >_&#8658;_</a
      ><a name="5053"
      > </a
      ><a name="5054" class="Symbol"
      >:</a
      ><a name="5055"
      > </a
      ><a name="5056" href="Stlc.html#5017" class="Datatype"
      >Type</a
      ><a name="5060"
      > </a
      ><a name="5061" class="Symbol"
      >&#8594;</a
      ><a name="5062"
      > </a
      ><a name="5063" href="Stlc.html#5017" class="Datatype"
      >Type</a
      ><a name="5067"
      > </a
      ><a name="5068" class="Symbol"
      >&#8594;</a
      ><a name="5069"
      > </a
      ><a name="5070" href="Stlc.html#5017" class="Datatype"
      >Type</a
      ><a name="5074"
      >

</a
      ><a name="5076" class="Keyword"
      >infixr</a
      ><a name="5082"
      > </a
      ><a name="5083" class="Number"
      >5</a
      >
{% endraw %}</pre>


### Terms

<pre class="Agda">{% raw %}
<a name="5126" class="Keyword"
      >data</a
      ><a name="5130"
      > </a
      ><a name="5131" href="Stlc.html#5131" class="Datatype"
      >Id</a
      ><a name="5133"
      > </a
      ><a name="5134" class="Symbol"
      >:</a
      ><a name="5135"
      > </a
      ><a name="5136" class="PrimitiveType"
      >Set</a
      ><a name="5139"
      > </a
      ><a name="5140" class="Keyword"
      >where</a
      ><a name="5145"
      >
  </a
      ><a name="5148" href="Stlc.html#5148" class="InductiveConstructor"
      >id</a
      ><a name="5150"
      > </a
      ><a name="5151" class="Symbol"
      >:</a
      ><a name="5152"
      > </a
      ><a name="5153" href="Agda.Builtin.Nat.html#69" class="Datatype"
      >&#8469;</a
      ><a name="5154"
      > </a
      ><a name="5155" class="Symbol"
      >&#8594;</a
      ><a name="5156"
      > </a
      ><a name="5157" href="Stlc.html#5131" class="Datatype"
      >Id</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="5206" href="Stlc.html#5206" class="Function"
      >id-inj</a
      ><a name="5212"
      > </a
      ><a name="5213" class="Symbol"
      >:</a
      ><a name="5214"
      > </a
      ><a name="5215" class="Symbol"
      >&#8704;</a
      ><a name="5216"
      > </a
      ><a name="5217" class="Symbol"
      >{</a
      ><a name="5218" href="Stlc.html#5218" class="Bound"
      >x</a
      ><a name="5219"
      > </a
      ><a name="5220" href="Stlc.html#5220" class="Bound"
      >y</a
      ><a name="5221" class="Symbol"
      >}</a
      ><a name="5222"
      > </a
      ><a name="5223" class="Symbol"
      >&#8594;</a
      ><a name="5224"
      > </a
      ><a name="5225" href="Stlc.html#5148" class="InductiveConstructor"
      >id</a
      ><a name="5227"
      > </a
      ><a name="5228" href="Stlc.html#5218" class="Bound"
      >x</a
      ><a name="5229"
      > </a
      ><a name="5230" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="5231"
      > </a
      ><a name="5232" href="Stlc.html#5148" class="InductiveConstructor"
      >id</a
      ><a name="5234"
      > </a
      ><a name="5235" href="Stlc.html#5220" class="Bound"
      >y</a
      ><a name="5236"
      > </a
      ><a name="5237" class="Symbol"
      >&#8594;</a
      ><a name="5238"
      > </a
      ><a name="5239" href="Stlc.html#5218" class="Bound"
      >x</a
      ><a name="5240"
      > </a
      ><a name="5241" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="5242"
      > </a
      ><a name="5243" href="Stlc.html#5220" class="Bound"
      >y</a
      ><a name="5244"
      >
</a
      ><a name="5245" href="Stlc.html#5206" class="Function"
      >id-inj</a
      ><a name="5251"
      > </a
      ><a name="5252" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="5256"
      > </a
      ><a name="5257" class="Symbol"
      >=</a
      ><a name="5258"
      > </a
      ><a name="5259" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="5263"
      >

</a
      ><a name="5265" href="Stlc.html#5265" class="Function Operator"
      >_&#8799;_</a
      ><a name="5268"
      > </a
      ><a name="5269" class="Symbol"
      >:</a
      ><a name="5270"
      > </a
      ><a name="5271" class="Symbol"
      >(</a
      ><a name="5272" href="Stlc.html#5272" class="Bound"
      >x</a
      ><a name="5273"
      > </a
      ><a name="5274" href="Stlc.html#5274" class="Bound"
      >y</a
      ><a name="5275"
      > </a
      ><a name="5276" class="Symbol"
      >:</a
      ><a name="5277"
      > </a
      ><a name="5278" href="Stlc.html#5131" class="Datatype"
      >Id</a
      ><a name="5280" class="Symbol"
      >)</a
      ><a name="5281"
      > </a
      ><a name="5282" class="Symbol"
      >&#8594;</a
      ><a name="5283"
      > </a
      ><a name="5284" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#484" class="Datatype"
      >Dec</a
      ><a name="5287"
      > </a
      ><a name="5288" class="Symbol"
      >(</a
      ><a name="5289" href="Stlc.html#5272" class="Bound"
      >x</a
      ><a name="5290"
      > </a
      ><a name="5291" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="5292"
      > </a
      ><a name="5293" href="Stlc.html#5274" class="Bound"
      >y</a
      ><a name="5294" class="Symbol"
      >)</a
      ><a name="5295"
      >
</a
      ><a name="5296" href="Stlc.html#5148" class="InductiveConstructor"
      >id</a
      ><a name="5298"
      > </a
      ><a name="5299" href="Stlc.html#5299" class="Bound"
      >x</a
      ><a name="5300"
      > </a
      ><a name="5301" href="Stlc.html#5265" class="Function Operator"
      >&#8799;</a
      ><a name="5302"
      > </a
      ><a name="5303" href="Stlc.html#5148" class="InductiveConstructor"
      >id</a
      ><a name="5305"
      > </a
      ><a name="5306" href="Stlc.html#5306" class="Bound"
      >y</a
      ><a name="5307"
      > </a
      ><a name="5308" class="Keyword"
      >with</a
      ><a name="5312"
      > </a
      ><a name="5313" href="Stlc.html#5299" class="Bound"
      >x</a
      ><a name="5314"
      > </a
      ><a name="5315" href="https://agda.github.io/agda-stdlib/Data.Nat.Base.html#3199" class="Function Operator"
      >Data.Nat.&#8799;</a
      ><a name="5325"
      > </a
      ><a name="5326" href="Stlc.html#5306" class="Bound"
      >y</a
      ><a name="5327"
      >
</a
      ><a name="5328" class="Symbol"
      >...</a
      ><a name="5331"
      > </a
      ><a name="5332" class="Symbol"
      >|</a
      ><a name="5333"
      > </a
      ><a name="5334" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="5337"
      > </a
      ><a name="5338" href="Stlc.html#5338" class="Bound"
      >x=y</a
      ><a name="5341"
      > </a
      ><a name="5342" class="Keyword"
      >rewrite</a
      ><a name="5349"
      > </a
      ><a name="5350" href="Stlc.html#5338" class="Bound"
      >x=y</a
      ><a name="5353"
      > </a
      ><a name="5354" class="Symbol"
      >=</a
      ><a name="5355"
      > </a
      ><a name="5356" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="5359"
      > </a
      ><a name="5360" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="5364"
      >
</a
      ><a name="5365" class="Symbol"
      >...</a
      ><a name="5368"
      > </a
      ><a name="5369" class="Symbol"
      >|</a
      ><a name="5370"
      > </a
      ><a name="5371" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="5373"
      >  </a
      ><a name="5375" href="Stlc.html#5375" class="Bound"
      >x&#8800;y</a
      ><a name="5378"
      > </a
      ><a name="5379" class="Symbol"
      >=</a
      ><a name="5380"
      > </a
      ><a name="5381" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="5383"
      > </a
      ><a name="5384" class="Symbol"
      >(</a
      ><a name="5385" href="Stlc.html#5375" class="Bound"
      >x&#8800;y</a
      ><a name="5388"
      > </a
      ><a name="5389" href="https://agda.github.io/agda-stdlib/Function.html#713" class="Function Operator"
      >&#8728;</a
      ><a name="5390"
      > </a
      ><a name="5391" href="Stlc.html#5206" class="Function"
      >id-inj</a
      ><a name="5397" class="Symbol"
      >)</a
      >
{% endraw %}</pre>
</div>

<pre class="Agda">{% raw %}
<a name="5431" class="Keyword"
      >data</a
      ><a name="5435"
      > </a
      ><a name="5436" href="Stlc.html#5436" class="Datatype"
      >Term</a
      ><a name="5440"
      > </a
      ><a name="5441" class="Symbol"
      >:</a
      ><a name="5442"
      > </a
      ><a name="5443" class="PrimitiveType"
      >Set</a
      ><a name="5446"
      > </a
      ><a name="5447" class="Keyword"
      >where</a
      ><a name="5452"
      >
  </a
      ><a name="5455" href="Stlc.html#5455" class="InductiveConstructor"
      >var</a
      ><a name="5458"
      >   </a
      ><a name="5461" class="Symbol"
      >:</a
      ><a name="5462"
      > </a
      ><a name="5463" href="Stlc.html#5131" class="Datatype"
      >Id</a
      ><a name="5465"
      > </a
      ><a name="5466" class="Symbol"
      >&#8594;</a
      ><a name="5467"
      > </a
      ><a name="5468" href="Stlc.html#5436" class="Datatype"
      >Term</a
      ><a name="5472"
      >
  </a
      ><a name="5475" href="Stlc.html#5475" class="InductiveConstructor"
      >app</a
      ><a name="5478"
      >   </a
      ><a name="5481" class="Symbol"
      >:</a
      ><a name="5482"
      > </a
      ><a name="5483" href="Stlc.html#5436" class="Datatype"
      >Term</a
      ><a name="5487"
      > </a
      ><a name="5488" class="Symbol"
      >&#8594;</a
      ><a name="5489"
      > </a
      ><a name="5490" href="Stlc.html#5436" class="Datatype"
      >Term</a
      ><a name="5494"
      > </a
      ><a name="5495" class="Symbol"
      >&#8594;</a
      ><a name="5496"
      > </a
      ><a name="5497" href="Stlc.html#5436" class="Datatype"
      >Term</a
      ><a name="5501"
      >
  </a
      ><a name="5504" href="Stlc.html#5504" class="InductiveConstructor"
      >abs</a
      ><a name="5507"
      >   </a
      ><a name="5510" class="Symbol"
      >:</a
      ><a name="5511"
      > </a
      ><a name="5512" href="Stlc.html#5131" class="Datatype"
      >Id</a
      ><a name="5514"
      > </a
      ><a name="5515" class="Symbol"
      >&#8594;</a
      ><a name="5516"
      > </a
      ><a name="5517" href="Stlc.html#5017" class="Datatype"
      >Type</a
      ><a name="5521"
      > </a
      ><a name="5522" class="Symbol"
      >&#8594;</a
      ><a name="5523"
      > </a
      ><a name="5524" href="Stlc.html#5436" class="Datatype"
      >Term</a
      ><a name="5528"
      > </a
      ><a name="5529" class="Symbol"
      >&#8594;</a
      ><a name="5530"
      > </a
      ><a name="5531" href="Stlc.html#5436" class="Datatype"
      >Term</a
      ><a name="5535"
      >
  </a
      ><a name="5538" href="Stlc.html#5538" class="InductiveConstructor"
      >true</a
      ><a name="5542"
      >  </a
      ><a name="5544" class="Symbol"
      >:</a
      ><a name="5545"
      > </a
      ><a name="5546" href="Stlc.html#5436" class="Datatype"
      >Term</a
      ><a name="5550"
      >
  </a
      ><a name="5553" href="Stlc.html#5553" class="InductiveConstructor"
      >false</a
      ><a name="5558"
      > </a
      ><a name="5559" class="Symbol"
      >:</a
      ><a name="5560"
      > </a
      ><a name="5561" href="Stlc.html#5436" class="Datatype"
      >Term</a
      ><a name="5565"
      >
  </a
      ><a name="5568" href="Stlc.html#5568" class="InductiveConstructor Operator"
      >if_then_else_</a
      ><a name="5581"
      > </a
      ><a name="5582" class="Symbol"
      >:</a
      ><a name="5583"
      > </a
      ><a name="5584" href="Stlc.html#5436" class="Datatype"
      >Term</a
      ><a name="5588"
      > </a
      ><a name="5589" class="Symbol"
      >&#8594;</a
      ><a name="5590"
      > </a
      ><a name="5591" href="Stlc.html#5436" class="Datatype"
      >Term</a
      ><a name="5595"
      > </a
      ><a name="5596" class="Symbol"
      >&#8594;</a
      ><a name="5597"
      > </a
      ><a name="5598" href="Stlc.html#5436" class="Datatype"
      >Term</a
      ><a name="5602"
      > </a
      ><a name="5603" class="Symbol"
      >&#8594;</a
      ><a name="5604"
      > </a
      ><a name="5605" href="Stlc.html#5436" class="Datatype"
      >Term</a
      ><a name="5609"
      >

</a
      ><a name="5611" class="Keyword"
      >infixr</a
      ><a name="5617"
      > </a
      ><a name="5618" class="Number"
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
<a name="5972" href="Stlc.html#5972" class="Function"
      >x</a
      ><a name="5973"
      > </a
      ><a name="5974" class="Symbol"
      >=</a
      ><a name="5975"
      > </a
      ><a name="5976" href="Stlc.html#5148" class="InductiveConstructor"
      >id</a
      ><a name="5978"
      > </a
      ><a name="5979" class="Number"
      >0</a
      ><a name="5980"
      >
</a
      ><a name="5981" href="Stlc.html#5981" class="Function"
      >y</a
      ><a name="5982"
      > </a
      ><a name="5983" class="Symbol"
      >=</a
      ><a name="5984"
      > </a
      ><a name="5985" href="Stlc.html#5148" class="InductiveConstructor"
      >id</a
      ><a name="5987"
      > </a
      ><a name="5988" class="Number"
      >1</a
      ><a name="5989"
      >
</a
      ><a name="5990" href="Stlc.html#5990" class="Function"
      >z</a
      ><a name="5991"
      > </a
      ><a name="5992" class="Symbol"
      >=</a
      ><a name="5993"
      > </a
      ><a name="5994" href="Stlc.html#5148" class="InductiveConstructor"
      >id</a
      ><a name="5996"
      > </a
      ><a name="5997" class="Number"
      >2</a
      >
{% endraw %}</pre>
<div class="hidden">
<pre class="Agda">{% raw %}
<a name="6044" class="Symbol"
      >{-#</a
      ><a name="6047"
      > </a
      ><a name="6048" class="Keyword"
      >DISPLAY</a
      ><a name="6055"
      > </a
      ><a name="6056" href="Agda.Builtin.Nat.html#87" class="InductiveConstructor"
      >zero</a
      ><a name="6060"
      > = </a
      ><a name="6063" href="Stlc.html#5972" class="Function"
      >x</a
      ><a name="6064"
      > </a
      ><a name="6065" class="Symbol"
      >#-}</a
      ><a name="6068"
      >
</a
      ><a name="6069" class="Symbol"
      >{-#</a
      ><a name="6072"
      > </a
      ><a name="6073" class="Keyword"
      >DISPLAY</a
      ><a name="6080"
      > </a
      ><a name="6081" href="Agda.Builtin.Nat.html#100" class="InductiveConstructor"
      >suc</a
      ><a name="6084"
      > </a
      ><a name="6085" href="Agda.Builtin.Nat.html#87" class="InductiveConstructor"
      >zero</a
      ><a name="6089"
      > = </a
      ><a name="6092" href="Stlc.html#5981" class="Function"
      >y</a
      ><a name="6093"
      > </a
      ><a name="6094" class="Symbol"
      >#-}</a
      ><a name="6097"
      >
</a
      ><a name="6098" class="Symbol"
      >{-#</a
      ><a name="6101"
      > </a
      ><a name="6102" class="Keyword"
      >DISPLAY</a
      ><a name="6109"
      > </a
      ><a name="6110" href="Agda.Builtin.Nat.html#100" class="InductiveConstructor"
      >suc</a
      ><a name="6113"
      > (</a
      ><a name="6115" href="Agda.Builtin.Nat.html#100" class="InductiveConstructor"
      >suc</a
      ><a name="6118"
      > </a
      ><a name="6119" href="Agda.Builtin.Nat.html#87" class="InductiveConstructor"
      >zero</a
      ><a name="6123"
      >) = </a
      ><a name="6127" href="Stlc.html#5990" class="Function"
      >z</a
      ><a name="6128"
      > </a
      ><a name="6129" class="Symbol"
      >#-}</a
      >
{% endraw %}</pre>
</div>

`idB = λx:bool. x`

<pre class="Agda">{% raw %}
<a name="6185" href="Stlc.html#6185" class="Function"
      >idB</a
      ><a name="6188"
      > </a
      ><a name="6189" class="Symbol"
      >=</a
      ><a name="6190"
      > </a
      ><a name="6191" class="Symbol"
      >(</a
      ><a name="6192" href="Stlc.html#5504" class="InductiveConstructor"
      >abs</a
      ><a name="6195"
      > </a
      ><a name="6196" href="Stlc.html#5972" class="Function"
      >x</a
      ><a name="6197"
      > </a
      ><a name="6198" href="Stlc.html#5036" class="InductiveConstructor"
      >bool</a
      ><a name="6202"
      > </a
      ><a name="6203" class="Symbol"
      >(</a
      ><a name="6204" href="Stlc.html#5455" class="InductiveConstructor"
      >var</a
      ><a name="6207"
      > </a
      ><a name="6208" href="Stlc.html#5972" class="Function"
      >x</a
      ><a name="6209" class="Symbol"
      >))</a
      >
{% endraw %}</pre>

`idBB = λx:bool⇒bool. x`

<pre class="Agda">{% raw %}
<a name="6263" href="Stlc.html#6263" class="Function"
      >idBB</a
      ><a name="6267"
      > </a
      ><a name="6268" class="Symbol"
      >=</a
      ><a name="6269"
      > </a
      ><a name="6270" class="Symbol"
      >(</a
      ><a name="6271" href="Stlc.html#5504" class="InductiveConstructor"
      >abs</a
      ><a name="6274"
      > </a
      ><a name="6275" href="Stlc.html#5972" class="Function"
      >x</a
      ><a name="6276"
      > </a
      ><a name="6277" class="Symbol"
      >(</a
      ><a name="6278" href="Stlc.html#5036" class="InductiveConstructor"
      >bool</a
      ><a name="6282"
      > </a
      ><a name="6283" href="Stlc.html#5050" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="6284"
      > </a
      ><a name="6285" href="Stlc.html#5036" class="InductiveConstructor"
      >bool</a
      ><a name="6289" class="Symbol"
      >)</a
      ><a name="6290"
      > </a
      ><a name="6291" class="Symbol"
      >(</a
      ><a name="6292" href="Stlc.html#5455" class="InductiveConstructor"
      >var</a
      ><a name="6295"
      > </a
      ><a name="6296" href="Stlc.html#5972" class="Function"
      >x</a
      ><a name="6297" class="Symbol"
      >))</a
      >
{% endraw %}</pre>

`idBBBB = λx:(bool⇒bool) → (bool⇒bool). x`

<pre class="Agda">{% raw %}
<a name="6369" href="Stlc.html#6369" class="Function"
      >idBBBB</a
      ><a name="6375"
      > </a
      ><a name="6376" class="Symbol"
      >=</a
      ><a name="6377"
      > </a
      ><a name="6378" class="Symbol"
      >(</a
      ><a name="6379" href="Stlc.html#5504" class="InductiveConstructor"
      >abs</a
      ><a name="6382"
      > </a
      ><a name="6383" href="Stlc.html#5972" class="Function"
      >x</a
      ><a name="6384"
      > </a
      ><a name="6385" class="Symbol"
      >((</a
      ><a name="6387" href="Stlc.html#5036" class="InductiveConstructor"
      >bool</a
      ><a name="6391"
      > </a
      ><a name="6392" href="Stlc.html#5050" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="6393"
      > </a
      ><a name="6394" href="Stlc.html#5036" class="InductiveConstructor"
      >bool</a
      ><a name="6398" class="Symbol"
      >)</a
      ><a name="6399"
      > </a
      ><a name="6400" href="Stlc.html#5050" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="6401"
      > </a
      ><a name="6402" class="Symbol"
      >(</a
      ><a name="6403" href="Stlc.html#5036" class="InductiveConstructor"
      >bool</a
      ><a name="6407"
      > </a
      ><a name="6408" href="Stlc.html#5050" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="6409"
      > </a
      ><a name="6410" href="Stlc.html#5036" class="InductiveConstructor"
      >bool</a
      ><a name="6414" class="Symbol"
      >))</a
      ><a name="6416"
      > </a
      ><a name="6417" class="Symbol"
      >(</a
      ><a name="6418" href="Stlc.html#5455" class="InductiveConstructor"
      >var</a
      ><a name="6421"
      > </a
      ><a name="6422" href="Stlc.html#5972" class="Function"
      >x</a
      ><a name="6423" class="Symbol"
      >))</a
      >
{% endraw %}</pre>

`k = λx:bool. λy:bool. x`

<pre class="Agda">{% raw %}
<a name="6478" href="Stlc.html#6478" class="Function"
      >k</a
      ><a name="6479"
      > </a
      ><a name="6480" class="Symbol"
      >=</a
      ><a name="6481"
      > </a
      ><a name="6482" class="Symbol"
      >(</a
      ><a name="6483" href="Stlc.html#5504" class="InductiveConstructor"
      >abs</a
      ><a name="6486"
      > </a
      ><a name="6487" href="Stlc.html#5972" class="Function"
      >x</a
      ><a name="6488"
      > </a
      ><a name="6489" href="Stlc.html#5036" class="InductiveConstructor"
      >bool</a
      ><a name="6493"
      > </a
      ><a name="6494" class="Symbol"
      >(</a
      ><a name="6495" href="Stlc.html#5504" class="InductiveConstructor"
      >abs</a
      ><a name="6498"
      > </a
      ><a name="6499" href="Stlc.html#5981" class="Function"
      >y</a
      ><a name="6500"
      > </a
      ><a name="6501" href="Stlc.html#5036" class="InductiveConstructor"
      >bool</a
      ><a name="6505"
      > </a
      ><a name="6506" class="Symbol"
      >(</a
      ><a name="6507" href="Stlc.html#5455" class="InductiveConstructor"
      >var</a
      ><a name="6510"
      > </a
      ><a name="6511" href="Stlc.html#5972" class="Function"
      >x</a
      ><a name="6512" class="Symbol"
      >)))</a
      >
{% endraw %}</pre>

`notB = λx:bool. if x then false else true`

<pre class="Agda">{% raw %}
<a name="6586" href="Stlc.html#6586" class="Function"
      >notB</a
      ><a name="6590"
      > </a
      ><a name="6591" class="Symbol"
      >=</a
      ><a name="6592"
      > </a
      ><a name="6593" class="Symbol"
      >(</a
      ><a name="6594" href="Stlc.html#5504" class="InductiveConstructor"
      >abs</a
      ><a name="6597"
      > </a
      ><a name="6598" href="Stlc.html#5972" class="Function"
      >x</a
      ><a name="6599"
      > </a
      ><a name="6600" href="Stlc.html#5036" class="InductiveConstructor"
      >bool</a
      ><a name="6604"
      > </a
      ><a name="6605" class="Symbol"
      >(</a
      ><a name="6606" href="Stlc.html#5568" class="InductiveConstructor Operator"
      >if</a
      ><a name="6608"
      > </a
      ><a name="6609" class="Symbol"
      >(</a
      ><a name="6610" href="Stlc.html#5455" class="InductiveConstructor"
      >var</a
      ><a name="6613"
      > </a
      ><a name="6614" href="Stlc.html#5972" class="Function"
      >x</a
      ><a name="6615" class="Symbol"
      >)</a
      ><a name="6616"
      > </a
      ><a name="6617" href="Stlc.html#5568" class="InductiveConstructor Operator"
      >then</a
      ><a name="6621"
      > </a
      ><a name="6622" href="Stlc.html#5553" class="InductiveConstructor"
      >false</a
      ><a name="6627"
      > </a
      ><a name="6628" href="Stlc.html#5568" class="InductiveConstructor Operator"
      >else</a
      ><a name="6632"
      > </a
      ><a name="6633" href="Stlc.html#5538" class="InductiveConstructor"
      >true</a
      ><a name="6637" class="Symbol"
      >))</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="6686" class="Symbol"
      >{-#</a
      ><a name="6689"
      > </a
      ><a name="6690" class="Keyword"
      >DISPLAY</a
      ><a name="6697"
      > </a
      ><a name="6698" href="Stlc.html#5504" class="InductiveConstructor"
      >abs</a
      ><a name="6701"
      > 0 </a
      ><a name="6704" href="Stlc.html#5036" class="InductiveConstructor"
      >bool</a
      ><a name="6708"
      > (</a
      ><a name="6710" href="Stlc.html#5455" class="InductiveConstructor"
      >var</a
      ><a name="6713"
      > 0) = </a
      ><a name="6719" href="Stlc.html#6185" class="Function"
      >idB</a
      ><a name="6722"
      > </a
      ><a name="6723" class="Symbol"
      >#-}</a
      ><a name="6726"
      >
</a
      ><a name="6727" class="Symbol"
      >{-#</a
      ><a name="6730"
      > </a
      ><a name="6731" class="Keyword"
      >DISPLAY</a
      ><a name="6738"
      > </a
      ><a name="6739" href="Stlc.html#5504" class="InductiveConstructor"
      >abs</a
      ><a name="6742"
      > 0 (</a
      ><a name="6746" href="Stlc.html#5036" class="InductiveConstructor"
      >bool</a
      ><a name="6750"
      > </a
      ><a name="6751" href="Stlc.html#5050" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="6752"
      > </a
      ><a name="6753" href="Stlc.html#5036" class="InductiveConstructor"
      >bool</a
      ><a name="6757"
      >) (</a
      ><a name="6760" href="Stlc.html#5455" class="InductiveConstructor"
      >var</a
      ><a name="6763"
      > 0) = </a
      ><a name="6769" href="Stlc.html#6263" class="Function"
      >idBB</a
      ><a name="6773"
      > </a
      ><a name="6774" class="Symbol"
      >#-}</a
      ><a name="6777"
      >
</a
      ><a name="6778" class="Symbol"
      >{-#</a
      ><a name="6781"
      > </a
      ><a name="6782" class="Keyword"
      >DISPLAY</a
      ><a name="6789"
      > </a
      ><a name="6790" href="Stlc.html#5504" class="InductiveConstructor"
      >abs</a
      ><a name="6793"
      > 0 ((</a
      ><a name="6798" href="Stlc.html#5036" class="InductiveConstructor"
      >bool</a
      ><a name="6802"
      > </a
      ><a name="6803" href="Stlc.html#5050" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="6804"
      > </a
      ><a name="6805" href="Stlc.html#5036" class="InductiveConstructor"
      >bool</a
      ><a name="6809"
      >) </a
      ><a name="6811" href="Stlc.html#5050" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="6812"
      > (</a
      ><a name="6814" href="Stlc.html#5036" class="InductiveConstructor"
      >bool</a
      ><a name="6818"
      > </a
      ><a name="6819" href="Stlc.html#5050" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="6820"
      > </a
      ><a name="6821" href="Stlc.html#5036" class="InductiveConstructor"
      >bool</a
      ><a name="6825"
      >)) (</a
      ><a name="6829" href="Stlc.html#5455" class="InductiveConstructor"
      >var</a
      ><a name="6832"
      > 0) = </a
      ><a name="6838" href="Stlc.html#6369" class="Function"
      >idBBBB</a
      ><a name="6844"
      > </a
      ><a name="6845" class="Symbol"
      >#-}</a
      ><a name="6848"
      >
</a
      ><a name="6849" class="Symbol"
      >{-#</a
      ><a name="6852"
      > </a
      ><a name="6853" class="Keyword"
      >DISPLAY</a
      ><a name="6860"
      > </a
      ><a name="6861" href="Stlc.html#5504" class="InductiveConstructor"
      >abs</a
      ><a name="6864"
      > 0 </a
      ><a name="6867" href="Stlc.html#5036" class="InductiveConstructor"
      >bool</a
      ><a name="6871"
      > (</a
      ><a name="6873" href="Stlc.html#5504" class="InductiveConstructor"
      >abs</a
      ><a name="6876"
      > </a
      ><a name="6877" href="Stlc.html#6877" class="Bound"
      >y</a
      ><a name="6878"
      > </a
      ><a name="6879" href="Stlc.html#5036" class="InductiveConstructor"
      >bool</a
      ><a name="6883"
      > (</a
      ><a name="6885" href="Stlc.html#5455" class="InductiveConstructor"
      >var</a
      ><a name="6888"
      > 0)) = </a
      ><a name="6895" href="Stlc.html#6478" class="Function"
      >k</a
      ><a name="6896"
      > </a
      ><a name="6897" class="Symbol"
      >#-}</a
      ><a name="6900"
      >
</a
      ><a name="6901" class="Symbol"
      >{-#</a
      ><a name="6904"
      > </a
      ><a name="6905" class="Keyword"
      >DISPLAY</a
      ><a name="6912"
      > </a
      ><a name="6913" href="Stlc.html#5504" class="InductiveConstructor"
      >abs</a
      ><a name="6916"
      > 0 </a
      ><a name="6919" href="Stlc.html#5036" class="InductiveConstructor"
      >bool</a
      ><a name="6923"
      > (</a
      ><a name="6925" href="Stlc.html#5568" class="InductiveConstructor Operator"
      >if</a
      ><a name="6927"
      > (</a
      ><a name="6929" href="Stlc.html#5455" class="InductiveConstructor"
      >var</a
      ><a name="6932"
      > 0) </a
      ><a name="6936" href="Stlc.html#5568" class="InductiveConstructor Operator"
      >then</a
      ><a name="6940"
      > </a
      ><a name="6941" href="Stlc.html#5553" class="InductiveConstructor"
      >false</a
      ><a name="6946"
      > </a
      ><a name="6947" href="Stlc.html#5568" class="InductiveConstructor Operator"
      >else</a
      ><a name="6951"
      > </a
      ><a name="6952" href="Stlc.html#5538" class="InductiveConstructor"
      >true</a
      ><a name="6956"
      >) = </a
      ><a name="6960" href="Stlc.html#6586" class="Function"
      >notB</a
      ><a name="6964"
      > </a
      ><a name="6965" class="Symbol"
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
<a name="8175" href="Stlc.html#8175" class="Function"
      >testNormalize</a
      ><a name="8188"
      > </a
      ><a name="8189" class="Symbol"
      >:</a
      ><a name="8190"
      > </a
      ><a name="8191" class="Symbol"
      >(&#955;</a
      ><a name="8193"
      > </a
      ><a name="8194" class="Symbol"
      >(</a
      ><a name="8195" href="Stlc.html#8195" class="Bound"
      >x</a
      ><a name="8196"
      > </a
      ><a name="8197" class="Symbol"
      >:</a
      ><a name="8198"
      > </a
      ><a name="8199" href="Agda.Builtin.Nat.html#69" class="Datatype"
      >&#8469;</a
      ><a name="8200" class="Symbol"
      >)</a
      ><a name="8201"
      > </a
      ><a name="8202" class="Symbol"
      >&#8594;</a
      ><a name="8203"
      > </a
      ><a name="8204" class="Number"
      >3</a
      ><a name="8205"
      > </a
      ><a name="8206" href="Agda.Builtin.Nat.html#202" class="Primitive Operator"
      >+</a
      ><a name="8207"
      > </a
      ><a name="8208" class="Number"
      >4</a
      ><a name="8209" class="Symbol"
      >)</a
      ><a name="8210"
      > </a
      ><a name="8211" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="8212"
      > </a
      ><a name="8213" class="Symbol"
      >(&#955;</a
      ><a name="8215"
      > </a
      ><a name="8216" class="Symbol"
      >(</a
      ><a name="8217" href="Stlc.html#8217" class="Bound"
      >x</a
      ><a name="8218"
      > </a
      ><a name="8219" class="Symbol"
      >:</a
      ><a name="8220"
      > </a
      ><a name="8221" href="Agda.Builtin.Nat.html#69" class="Datatype"
      >&#8469;</a
      ><a name="8222" class="Symbol"
      >)</a
      ><a name="8223"
      > </a
      ><a name="8224" class="Symbol"
      >&#8594;</a
      ><a name="8225"
      > </a
      ><a name="8226" class="Number"
      >7</a
      ><a name="8227" class="Symbol"
      >)</a
      ><a name="8228"
      >
</a
      ><a name="8229" href="Stlc.html#8175" class="Function"
      >testNormalize</a
      ><a name="8242"
      > </a
      ><a name="8243" class="Symbol"
      >=</a
      ><a name="8244"
      > </a
      ><a name="8245" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      >
{% endraw %}</pre>

Most real-world functional programming languages make the second
choice -- reduction of a function's body only begins when the
function is actually applied to an argument.  We also make the
second choice here.

<pre class="Agda">{% raw %}
<a name="8486" class="Keyword"
      >data</a
      ><a name="8490"
      > </a
      ><a name="8491" href="Stlc.html#8491" class="Datatype"
      >Value</a
      ><a name="8496"
      > </a
      ><a name="8497" class="Symbol"
      >:</a
      ><a name="8498"
      > </a
      ><a name="8499" href="Stlc.html#5436" class="Datatype"
      >Term</a
      ><a name="8503"
      > </a
      ><a name="8504" class="Symbol"
      >&#8594;</a
      ><a name="8505"
      > </a
      ><a name="8506" class="PrimitiveType"
      >Set</a
      ><a name="8509"
      > </a
      ><a name="8510" class="Keyword"
      >where</a
      ><a name="8515"
      >
  </a
      ><a name="8518" href="Stlc.html#8518" class="InductiveConstructor"
      >abs</a
      ><a name="8521"
      >   </a
      ><a name="8524" class="Symbol"
      >:</a
      ><a name="8525"
      > </a
      ><a name="8526" class="Symbol"
      >forall</a
      ><a name="8532"
      > </a
      ><a name="8533" class="Symbol"
      >{</a
      ><a name="8534" href="Stlc.html#8534" class="Bound"
      >x</a
      ><a name="8535"
      > </a
      ><a name="8536" href="Stlc.html#8536" class="Bound"
      >A</a
      ><a name="8537"
      > </a
      ><a name="8538" href="Stlc.html#8538" class="Bound"
      >t</a
      ><a name="8539" class="Symbol"
      >}</a
      ><a name="8540"
      >
        </a
      ><a name="8549" class="Symbol"
      >&#8594;</a
      ><a name="8550"
      > </a
      ><a name="8551" href="Stlc.html#8491" class="Datatype"
      >Value</a
      ><a name="8556"
      > </a
      ><a name="8557" class="Symbol"
      >(</a
      ><a name="8558" href="Stlc.html#5504" class="InductiveConstructor"
      >abs</a
      ><a name="8561"
      > </a
      ><a name="8562" href="Stlc.html#8534" class="Bound"
      >x</a
      ><a name="8563"
      > </a
      ><a name="8564" href="Stlc.html#8536" class="Bound"
      >A</a
      ><a name="8565"
      > </a
      ><a name="8566" href="Stlc.html#8538" class="Bound"
      >t</a
      ><a name="8567" class="Symbol"
      >)</a
      ><a name="8568"
      >
  </a
      ><a name="8571" href="Stlc.html#8571" class="InductiveConstructor"
      >true</a
      ><a name="8575"
      >  </a
      ><a name="8577" class="Symbol"
      >:</a
      ><a name="8578"
      > </a
      ><a name="8579" href="Stlc.html#8491" class="Datatype"
      >Value</a
      ><a name="8584"
      > </a
      ><a name="8585" href="Stlc.html#5538" class="InductiveConstructor"
      >true</a
      ><a name="8589"
      >
  </a
      ><a name="8592" href="Stlc.html#8592" class="InductiveConstructor"
      >false</a
      ><a name="8597"
      > </a
      ><a name="8598" class="Symbol"
      >:</a
      ><a name="8599"
      > </a
      ><a name="8600" href="Stlc.html#8491" class="Datatype"
      >Value</a
      ><a name="8605"
      > </a
      ><a name="8606" href="Stlc.html#5553" class="InductiveConstructor"
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
<a name="11181" href="Stlc.html#11181" class="Function Operator"
      >[_:=_]_</a
      ><a name="11188"
      > </a
      ><a name="11189" class="Symbol"
      >:</a
      ><a name="11190"
      > </a
      ><a name="11191" href="Stlc.html#5131" class="Datatype"
      >Id</a
      ><a name="11193"
      > </a
      ><a name="11194" class="Symbol"
      >-&gt;</a
      ><a name="11196"
      > </a
      ><a name="11197" href="Stlc.html#5436" class="Datatype"
      >Term</a
      ><a name="11201"
      > </a
      ><a name="11202" class="Symbol"
      >-&gt;</a
      ><a name="11204"
      > </a
      ><a name="11205" href="Stlc.html#5436" class="Datatype"
      >Term</a
      ><a name="11209"
      > </a
      ><a name="11210" class="Symbol"
      >-&gt;</a
      ><a name="11212"
      > </a
      ><a name="11213" href="Stlc.html#5436" class="Datatype"
      >Term</a
      ><a name="11217"
      >
</a
      ><a name="11218" href="Stlc.html#11181" class="Function Operator"
      >[</a
      ><a name="11219"
      > </a
      ><a name="11220" href="Stlc.html#11220" class="Bound"
      >x</a
      ><a name="11221"
      > </a
      ><a name="11222" href="Stlc.html#11181" class="Function Operator"
      >:=</a
      ><a name="11224"
      > </a
      ><a name="11225" href="Stlc.html#11225" class="Bound"
      >v</a
      ><a name="11226"
      > </a
      ><a name="11227" href="Stlc.html#11181" class="Function Operator"
      >]</a
      ><a name="11228"
      > </a
      ><a name="11229" class="Symbol"
      >(</a
      ><a name="11230" href="Stlc.html#5455" class="InductiveConstructor"
      >var</a
      ><a name="11233"
      > </a
      ><a name="11234" href="Stlc.html#11234" class="Bound"
      >y</a
      ><a name="11235" class="Symbol"
      >)</a
      ><a name="11236"
      > </a
      ><a name="11237" class="Keyword"
      >with</a
      ><a name="11241"
      > </a
      ><a name="11242" href="Stlc.html#11220" class="Bound"
      >x</a
      ><a name="11243"
      > </a
      ><a name="11244" href="Stlc.html#5265" class="Function Operator"
      >&#8799;</a
      ><a name="11245"
      > </a
      ><a name="11246" href="Stlc.html#11234" class="Bound"
      >y</a
      ><a name="11247"
      >
</a
      ><a name="11248" class="Symbol"
      >...</a
      ><a name="11251"
      > </a
      ><a name="11252" class="Symbol"
      >|</a
      ><a name="11253"
      > </a
      ><a name="11254" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="11257"
      > </a
      ><a name="11258" href="Stlc.html#11258" class="Bound"
      >x=y</a
      ><a name="11261"
      > </a
      ><a name="11262" class="Symbol"
      >=</a
      ><a name="11263"
      > </a
      ><a name="11264" href="Stlc.html#11225" class="Bound"
      >v</a
      ><a name="11265"
      >
</a
      ><a name="11266" class="Symbol"
      >...</a
      ><a name="11269"
      > </a
      ><a name="11270" class="Symbol"
      >|</a
      ><a name="11271"
      > </a
      ><a name="11272" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="11274"
      >  </a
      ><a name="11276" href="Stlc.html#11276" class="Bound"
      >x&#8800;y</a
      ><a name="11279"
      > </a
      ><a name="11280" class="Symbol"
      >=</a
      ><a name="11281"
      > </a
      ><a name="11282" href="Stlc.html#5455" class="InductiveConstructor"
      >var</a
      ><a name="11285"
      > </a
      ><a name="11286" href="Stlc.html#11234" class="Bound"
      >y</a
      ><a name="11287"
      >
</a
      ><a name="11288" href="Stlc.html#11181" class="Function Operator"
      >[</a
      ><a name="11289"
      > </a
      ><a name="11290" href="Stlc.html#11290" class="Bound"
      >x</a
      ><a name="11291"
      > </a
      ><a name="11292" href="Stlc.html#11181" class="Function Operator"
      >:=</a
      ><a name="11294"
      > </a
      ><a name="11295" href="Stlc.html#11295" class="Bound"
      >v</a
      ><a name="11296"
      > </a
      ><a name="11297" href="Stlc.html#11181" class="Function Operator"
      >]</a
      ><a name="11298"
      > </a
      ><a name="11299" class="Symbol"
      >(</a
      ><a name="11300" href="Stlc.html#5475" class="InductiveConstructor"
      >app</a
      ><a name="11303"
      > </a
      ><a name="11304" href="Stlc.html#11304" class="Bound"
      >s</a
      ><a name="11305"
      > </a
      ><a name="11306" href="Stlc.html#11306" class="Bound"
      >t</a
      ><a name="11307" class="Symbol"
      >)</a
      ><a name="11308"
      > </a
      ><a name="11309" class="Symbol"
      >=</a
      ><a name="11310"
      > </a
      ><a name="11311" href="Stlc.html#5475" class="InductiveConstructor"
      >app</a
      ><a name="11314"
      > </a
      ><a name="11315" class="Symbol"
      >(</a
      ><a name="11316" href="Stlc.html#11181" class="Function Operator"
      >[</a
      ><a name="11317"
      > </a
      ><a name="11318" href="Stlc.html#11290" class="Bound"
      >x</a
      ><a name="11319"
      > </a
      ><a name="11320" href="Stlc.html#11181" class="Function Operator"
      >:=</a
      ><a name="11322"
      > </a
      ><a name="11323" href="Stlc.html#11295" class="Bound"
      >v</a
      ><a name="11324"
      > </a
      ><a name="11325" href="Stlc.html#11181" class="Function Operator"
      >]</a
      ><a name="11326"
      > </a
      ><a name="11327" href="Stlc.html#11304" class="Bound"
      >s</a
      ><a name="11328" class="Symbol"
      >)</a
      ><a name="11329"
      > </a
      ><a name="11330" class="Symbol"
      >(</a
      ><a name="11331" href="Stlc.html#11181" class="Function Operator"
      >[</a
      ><a name="11332"
      > </a
      ><a name="11333" href="Stlc.html#11290" class="Bound"
      >x</a
      ><a name="11334"
      > </a
      ><a name="11335" href="Stlc.html#11181" class="Function Operator"
      >:=</a
      ><a name="11337"
      > </a
      ><a name="11338" href="Stlc.html#11295" class="Bound"
      >v</a
      ><a name="11339"
      > </a
      ><a name="11340" href="Stlc.html#11181" class="Function Operator"
      >]</a
      ><a name="11341"
      > </a
      ><a name="11342" href="Stlc.html#11306" class="Bound"
      >t</a
      ><a name="11343" class="Symbol"
      >)</a
      ><a name="11344"
      >
</a
      ><a name="11345" href="Stlc.html#11181" class="Function Operator"
      >[</a
      ><a name="11346"
      > </a
      ><a name="11347" href="Stlc.html#11347" class="Bound"
      >x</a
      ><a name="11348"
      > </a
      ><a name="11349" href="Stlc.html#11181" class="Function Operator"
      >:=</a
      ><a name="11351"
      > </a
      ><a name="11352" href="Stlc.html#11352" class="Bound"
      >v</a
      ><a name="11353"
      > </a
      ><a name="11354" href="Stlc.html#11181" class="Function Operator"
      >]</a
      ><a name="11355"
      > </a
      ><a name="11356" class="Symbol"
      >(</a
      ><a name="11357" href="Stlc.html#5504" class="InductiveConstructor"
      >abs</a
      ><a name="11360"
      > </a
      ><a name="11361" href="Stlc.html#11361" class="Bound"
      >y</a
      ><a name="11362"
      > </a
      ><a name="11363" href="Stlc.html#11363" class="Bound"
      >A</a
      ><a name="11364"
      > </a
      ><a name="11365" href="Stlc.html#11365" class="Bound"
      >t</a
      ><a name="11366" class="Symbol"
      >)</a
      ><a name="11367"
      > </a
      ><a name="11368" class="Keyword"
      >with</a
      ><a name="11372"
      > </a
      ><a name="11373" href="Stlc.html#11347" class="Bound"
      >x</a
      ><a name="11374"
      > </a
      ><a name="11375" href="Stlc.html#5265" class="Function Operator"
      >&#8799;</a
      ><a name="11376"
      > </a
      ><a name="11377" href="Stlc.html#11361" class="Bound"
      >y</a
      ><a name="11378"
      >
</a
      ><a name="11379" class="Symbol"
      >...</a
      ><a name="11382"
      > </a
      ><a name="11383" class="Symbol"
      >|</a
      ><a name="11384"
      > </a
      ><a name="11385" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="11388"
      > </a
      ><a name="11389" href="Stlc.html#11389" class="Bound"
      >x=y</a
      ><a name="11392"
      > </a
      ><a name="11393" class="Symbol"
      >=</a
      ><a name="11394"
      > </a
      ><a name="11395" href="Stlc.html#5504" class="InductiveConstructor"
      >abs</a
      ><a name="11398"
      > </a
      ><a name="11399" href="Stlc.html#11361" class="Bound"
      >y</a
      ><a name="11400"
      > </a
      ><a name="11401" href="Stlc.html#11363" class="Bound"
      >A</a
      ><a name="11402"
      > </a
      ><a name="11403" href="Stlc.html#11365" class="Bound"
      >t</a
      ><a name="11404"
      >
</a
      ><a name="11405" class="Symbol"
      >...</a
      ><a name="11408"
      > </a
      ><a name="11409" class="Symbol"
      >|</a
      ><a name="11410"
      > </a
      ><a name="11411" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="11413"
      >  </a
      ><a name="11415" href="Stlc.html#11415" class="Bound"
      >x&#8800;y</a
      ><a name="11418"
      > </a
      ><a name="11419" class="Symbol"
      >=</a
      ><a name="11420"
      > </a
      ><a name="11421" href="Stlc.html#5504" class="InductiveConstructor"
      >abs</a
      ><a name="11424"
      > </a
      ><a name="11425" href="Stlc.html#11361" class="Bound"
      >y</a
      ><a name="11426"
      > </a
      ><a name="11427" href="Stlc.html#11363" class="Bound"
      >A</a
      ><a name="11428"
      > </a
      ><a name="11429" class="Symbol"
      >(</a
      ><a name="11430" href="Stlc.html#11181" class="Function Operator"
      >[</a
      ><a name="11431"
      > </a
      ><a name="11432" href="Stlc.html#11347" class="Bound"
      >x</a
      ><a name="11433"
      > </a
      ><a name="11434" href="Stlc.html#11181" class="Function Operator"
      >:=</a
      ><a name="11436"
      > </a
      ><a name="11437" href="Stlc.html#11352" class="Bound"
      >v</a
      ><a name="11438"
      > </a
      ><a name="11439" href="Stlc.html#11181" class="Function Operator"
      >]</a
      ><a name="11440"
      > </a
      ><a name="11441" href="Stlc.html#11365" class="Bound"
      >t</a
      ><a name="11442" class="Symbol"
      >)</a
      ><a name="11443"
      >
</a
      ><a name="11444" href="Stlc.html#11181" class="Function Operator"
      >[</a
      ><a name="11445"
      > </a
      ><a name="11446" href="Stlc.html#11446" class="Bound"
      >x</a
      ><a name="11447"
      > </a
      ><a name="11448" href="Stlc.html#11181" class="Function Operator"
      >:=</a
      ><a name="11450"
      > </a
      ><a name="11451" href="Stlc.html#11451" class="Bound"
      >v</a
      ><a name="11452"
      > </a
      ><a name="11453" href="Stlc.html#11181" class="Function Operator"
      >]</a
      ><a name="11454"
      > </a
      ><a name="11455" href="Stlc.html#5538" class="InductiveConstructor"
      >true</a
      ><a name="11459"
      >  </a
      ><a name="11461" class="Symbol"
      >=</a
      ><a name="11462"
      > </a
      ><a name="11463" href="Stlc.html#5538" class="InductiveConstructor"
      >true</a
      ><a name="11467"
      >
</a
      ><a name="11468" href="Stlc.html#11181" class="Function Operator"
      >[</a
      ><a name="11469"
      > </a
      ><a name="11470" href="Stlc.html#11470" class="Bound"
      >x</a
      ><a name="11471"
      > </a
      ><a name="11472" href="Stlc.html#11181" class="Function Operator"
      >:=</a
      ><a name="11474"
      > </a
      ><a name="11475" href="Stlc.html#11475" class="Bound"
      >v</a
      ><a name="11476"
      > </a
      ><a name="11477" href="Stlc.html#11181" class="Function Operator"
      >]</a
      ><a name="11478"
      > </a
      ><a name="11479" href="Stlc.html#5553" class="InductiveConstructor"
      >false</a
      ><a name="11484"
      > </a
      ><a name="11485" class="Symbol"
      >=</a
      ><a name="11486"
      > </a
      ><a name="11487" href="Stlc.html#5553" class="InductiveConstructor"
      >false</a
      ><a name="11492"
      >
</a
      ><a name="11493" href="Stlc.html#11181" class="Function Operator"
      >[</a
      ><a name="11494"
      > </a
      ><a name="11495" href="Stlc.html#11495" class="Bound"
      >x</a
      ><a name="11496"
      > </a
      ><a name="11497" href="Stlc.html#11181" class="Function Operator"
      >:=</a
      ><a name="11499"
      > </a
      ><a name="11500" href="Stlc.html#11500" class="Bound"
      >v</a
      ><a name="11501"
      > </a
      ><a name="11502" href="Stlc.html#11181" class="Function Operator"
      >]</a
      ><a name="11503"
      > </a
      ><a name="11504" class="Symbol"
      >(</a
      ><a name="11505" href="Stlc.html#5568" class="InductiveConstructor Operator"
      >if</a
      ><a name="11507"
      > </a
      ><a name="11508" href="Stlc.html#11508" class="Bound"
      >s</a
      ><a name="11509"
      > </a
      ><a name="11510" href="Stlc.html#5568" class="InductiveConstructor Operator"
      >then</a
      ><a name="11514"
      > </a
      ><a name="11515" href="Stlc.html#11515" class="Bound"
      >t</a
      ><a name="11516"
      > </a
      ><a name="11517" href="Stlc.html#5568" class="InductiveConstructor Operator"
      >else</a
      ><a name="11521"
      > </a
      ><a name="11522" href="Stlc.html#11522" class="Bound"
      >u</a
      ><a name="11523" class="Symbol"
      >)</a
      ><a name="11524"
      > </a
      ><a name="11525" class="Symbol"
      >=</a
      ><a name="11526"
      >
  </a
      ><a name="11529" href="Stlc.html#5568" class="InductiveConstructor Operator"
      >if</a
      ><a name="11531"
      > </a
      ><a name="11532" href="Stlc.html#11181" class="Function Operator"
      >[</a
      ><a name="11533"
      > </a
      ><a name="11534" href="Stlc.html#11495" class="Bound"
      >x</a
      ><a name="11535"
      > </a
      ><a name="11536" href="Stlc.html#11181" class="Function Operator"
      >:=</a
      ><a name="11538"
      > </a
      ><a name="11539" href="Stlc.html#11500" class="Bound"
      >v</a
      ><a name="11540"
      > </a
      ><a name="11541" href="Stlc.html#11181" class="Function Operator"
      >]</a
      ><a name="11542"
      > </a
      ><a name="11543" href="Stlc.html#11508" class="Bound"
      >s</a
      ><a name="11544"
      > </a
      ><a name="11545" href="Stlc.html#5568" class="InductiveConstructor Operator"
      >then</a
      ><a name="11549"
      > </a
      ><a name="11550" href="Stlc.html#11181" class="Function Operator"
      >[</a
      ><a name="11551"
      > </a
      ><a name="11552" href="Stlc.html#11495" class="Bound"
      >x</a
      ><a name="11553"
      > </a
      ><a name="11554" href="Stlc.html#11181" class="Function Operator"
      >:=</a
      ><a name="11556"
      > </a
      ><a name="11557" href="Stlc.html#11500" class="Bound"
      >v</a
      ><a name="11558"
      > </a
      ><a name="11559" href="Stlc.html#11181" class="Function Operator"
      >]</a
      ><a name="11560"
      > </a
      ><a name="11561" href="Stlc.html#11515" class="Bound"
      >t</a
      ><a name="11562"
      > </a
      ><a name="11563" href="Stlc.html#5568" class="InductiveConstructor Operator"
      >else</a
      ><a name="11567"
      >  </a
      ><a name="11569" href="Stlc.html#11181" class="Function Operator"
      >[</a
      ><a name="11570"
      > </a
      ><a name="11571" href="Stlc.html#11495" class="Bound"
      >x</a
      ><a name="11572"
      > </a
      ><a name="11573" href="Stlc.html#11181" class="Function Operator"
      >:=</a
      ><a name="11575"
      > </a
      ><a name="11576" href="Stlc.html#11500" class="Bound"
      >v</a
      ><a name="11577"
      > </a
      ><a name="11578" href="Stlc.html#11181" class="Function Operator"
      >]</a
      ><a name="11579"
      > </a
      ><a name="11580" href="Stlc.html#11522" class="Bound"
      >u</a
      ><a name="11581"
      >

</a
      ><a name="11583" class="Keyword"
      >infix</a
      ><a name="11588"
      > </a
      ><a name="11589" class="Number"
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
<a name="13841" class="Keyword"
      >data</a
      ><a name="13845"
      > </a
      ><a name="13846" href="Stlc.html#13846" class="Datatype Operator"
      >_==&gt;_</a
      ><a name="13851"
      > </a
      ><a name="13852" class="Symbol"
      >:</a
      ><a name="13853"
      > </a
      ><a name="13854" href="Stlc.html#5436" class="Datatype"
      >Term</a
      ><a name="13858"
      > </a
      ><a name="13859" class="Symbol"
      >&#8594;</a
      ><a name="13860"
      > </a
      ><a name="13861" href="Stlc.html#5436" class="Datatype"
      >Term</a
      ><a name="13865"
      > </a
      ><a name="13866" class="Symbol"
      >&#8594;</a
      ><a name="13867"
      > </a
      ><a name="13868" class="PrimitiveType"
      >Set</a
      ><a name="13871"
      > </a
      ><a name="13872" class="Keyword"
      >where</a
      ><a name="13877"
      >
  </a
      ><a name="13880" href="Stlc.html#13880" class="InductiveConstructor"
      >red</a
      ><a name="13883"
      >     </a
      ><a name="13888" class="Symbol"
      >:</a
      ><a name="13889"
      > </a
      ><a name="13890" class="Symbol"
      >forall</a
      ><a name="13896"
      > </a
      ><a name="13897" class="Symbol"
      >{</a
      ><a name="13898" href="Stlc.html#13898" class="Bound"
      >x</a
      ><a name="13899"
      > </a
      ><a name="13900" href="Stlc.html#13900" class="Bound"
      >A</a
      ><a name="13901"
      > </a
      ><a name="13902" href="Stlc.html#13902" class="Bound"
      >s</a
      ><a name="13903"
      > </a
      ><a name="13904" href="Stlc.html#13904" class="Bound"
      >t</a
      ><a name="13905" class="Symbol"
      >}</a
      ><a name="13906"
      >
          </a
      ><a name="13917" class="Symbol"
      >&#8594;</a
      ><a name="13918"
      > </a
      ><a name="13919" href="Stlc.html#8491" class="Datatype"
      >Value</a
      ><a name="13924"
      > </a
      ><a name="13925" href="Stlc.html#13904" class="Bound"
      >t</a
      ><a name="13926"
      >
          </a
      ><a name="13937" class="Symbol"
      >&#8594;</a
      ><a name="13938"
      > </a
      ><a name="13939" href="Stlc.html#5475" class="InductiveConstructor"
      >app</a
      ><a name="13942"
      > </a
      ><a name="13943" class="Symbol"
      >(</a
      ><a name="13944" href="Stlc.html#5504" class="InductiveConstructor"
      >abs</a
      ><a name="13947"
      > </a
      ><a name="13948" href="Stlc.html#13898" class="Bound"
      >x</a
      ><a name="13949"
      > </a
      ><a name="13950" href="Stlc.html#13900" class="Bound"
      >A</a
      ><a name="13951"
      > </a
      ><a name="13952" href="Stlc.html#13902" class="Bound"
      >s</a
      ><a name="13953" class="Symbol"
      >)</a
      ><a name="13954"
      > </a
      ><a name="13955" href="Stlc.html#13904" class="Bound"
      >t</a
      ><a name="13956"
      > </a
      ><a name="13957" href="Stlc.html#13846" class="Datatype Operator"
      >==&gt;</a
      ><a name="13960"
      > </a
      ><a name="13961" href="Stlc.html#11181" class="Function Operator"
      >[</a
      ><a name="13962"
      > </a
      ><a name="13963" href="Stlc.html#13898" class="Bound"
      >x</a
      ><a name="13964"
      > </a
      ><a name="13965" href="Stlc.html#11181" class="Function Operator"
      >:=</a
      ><a name="13967"
      > </a
      ><a name="13968" href="Stlc.html#13904" class="Bound"
      >t</a
      ><a name="13969"
      > </a
      ><a name="13970" href="Stlc.html#11181" class="Function Operator"
      >]</a
      ><a name="13971"
      > </a
      ><a name="13972" href="Stlc.html#13902" class="Bound"
      >s</a
      ><a name="13973"
      >
  </a
      ><a name="13976" href="Stlc.html#13976" class="InductiveConstructor"
      >app1</a
      ><a name="13980"
      >    </a
      ><a name="13984" class="Symbol"
      >:</a
      ><a name="13985"
      > </a
      ><a name="13986" class="Symbol"
      >forall</a
      ><a name="13992"
      > </a
      ><a name="13993" class="Symbol"
      >{</a
      ><a name="13994" href="Stlc.html#13994" class="Bound"
      >s</a
      ><a name="13995"
      > </a
      ><a name="13996" href="Stlc.html#13996" class="Bound"
      >s'</a
      ><a name="13998"
      > </a
      ><a name="13999" href="Stlc.html#13999" class="Bound"
      >t</a
      ><a name="14000" class="Symbol"
      >}</a
      ><a name="14001"
      >
          </a
      ><a name="14012" class="Symbol"
      >&#8594;</a
      ><a name="14013"
      > </a
      ><a name="14014" href="Stlc.html#13994" class="Bound"
      >s</a
      ><a name="14015"
      > </a
      ><a name="14016" href="Stlc.html#13846" class="Datatype Operator"
      >==&gt;</a
      ><a name="14019"
      > </a
      ><a name="14020" href="Stlc.html#13996" class="Bound"
      >s'</a
      ><a name="14022"
      >
          </a
      ><a name="14033" class="Symbol"
      >&#8594;</a
      ><a name="14034"
      > </a
      ><a name="14035" href="Stlc.html#5475" class="InductiveConstructor"
      >app</a
      ><a name="14038"
      > </a
      ><a name="14039" href="Stlc.html#13994" class="Bound"
      >s</a
      ><a name="14040"
      > </a
      ><a name="14041" href="Stlc.html#13999" class="Bound"
      >t</a
      ><a name="14042"
      > </a
      ><a name="14043" href="Stlc.html#13846" class="Datatype Operator"
      >==&gt;</a
      ><a name="14046"
      > </a
      ><a name="14047" href="Stlc.html#5475" class="InductiveConstructor"
      >app</a
      ><a name="14050"
      > </a
      ><a name="14051" href="Stlc.html#13996" class="Bound"
      >s'</a
      ><a name="14053"
      > </a
      ><a name="14054" href="Stlc.html#13999" class="Bound"
      >t</a
      ><a name="14055"
      >
  </a
      ><a name="14058" href="Stlc.html#14058" class="InductiveConstructor"
      >app2</a
      ><a name="14062"
      >    </a
      ><a name="14066" class="Symbol"
      >:</a
      ><a name="14067"
      > </a
      ><a name="14068" class="Symbol"
      >forall</a
      ><a name="14074"
      > </a
      ><a name="14075" class="Symbol"
      >{</a
      ><a name="14076" href="Stlc.html#14076" class="Bound"
      >s</a
      ><a name="14077"
      > </a
      ><a name="14078" href="Stlc.html#14078" class="Bound"
      >t</a
      ><a name="14079"
      > </a
      ><a name="14080" href="Stlc.html#14080" class="Bound"
      >t'</a
      ><a name="14082" class="Symbol"
      >}</a
      ><a name="14083"
      >
          </a
      ><a name="14094" class="Symbol"
      >&#8594;</a
      ><a name="14095"
      > </a
      ><a name="14096" href="Stlc.html#8491" class="Datatype"
      >Value</a
      ><a name="14101"
      > </a
      ><a name="14102" href="Stlc.html#14076" class="Bound"
      >s</a
      ><a name="14103"
      >
          </a
      ><a name="14114" class="Symbol"
      >&#8594;</a
      ><a name="14115"
      > </a
      ><a name="14116" href="Stlc.html#14078" class="Bound"
      >t</a
      ><a name="14117"
      > </a
      ><a name="14118" href="Stlc.html#13846" class="Datatype Operator"
      >==&gt;</a
      ><a name="14121"
      > </a
      ><a name="14122" href="Stlc.html#14080" class="Bound"
      >t'</a
      ><a name="14124"
      >
          </a
      ><a name="14135" class="Symbol"
      >&#8594;</a
      ><a name="14136"
      > </a
      ><a name="14137" href="Stlc.html#5475" class="InductiveConstructor"
      >app</a
      ><a name="14140"
      > </a
      ><a name="14141" href="Stlc.html#14076" class="Bound"
      >s</a
      ><a name="14142"
      > </a
      ><a name="14143" href="Stlc.html#14078" class="Bound"
      >t</a
      ><a name="14144"
      > </a
      ><a name="14145" href="Stlc.html#13846" class="Datatype Operator"
      >==&gt;</a
      ><a name="14148"
      > </a
      ><a name="14149" href="Stlc.html#5475" class="InductiveConstructor"
      >app</a
      ><a name="14152"
      > </a
      ><a name="14153" href="Stlc.html#14076" class="Bound"
      >s</a
      ><a name="14154"
      > </a
      ><a name="14155" href="Stlc.html#14080" class="Bound"
      >t'</a
      ><a name="14157"
      >
  </a
      ><a name="14160" href="Stlc.html#14160" class="InductiveConstructor"
      >if</a
      ><a name="14162"
      >      </a
      ><a name="14168" class="Symbol"
      >:</a
      ><a name="14169"
      > </a
      ><a name="14170" class="Symbol"
      >forall</a
      ><a name="14176"
      > </a
      ><a name="14177" class="Symbol"
      >{</a
      ><a name="14178" href="Stlc.html#14178" class="Bound"
      >s</a
      ><a name="14179"
      > </a
      ><a name="14180" href="Stlc.html#14180" class="Bound"
      >s'</a
      ><a name="14182"
      > </a
      ><a name="14183" href="Stlc.html#14183" class="Bound"
      >t</a
      ><a name="14184"
      > </a
      ><a name="14185" href="Stlc.html#14185" class="Bound"
      >u</a
      ><a name="14186" class="Symbol"
      >}</a
      ><a name="14187"
      >
          </a
      ><a name="14198" class="Symbol"
      >&#8594;</a
      ><a name="14199"
      > </a
      ><a name="14200" href="Stlc.html#14178" class="Bound"
      >s</a
      ><a name="14201"
      > </a
      ><a name="14202" href="Stlc.html#13846" class="Datatype Operator"
      >==&gt;</a
      ><a name="14205"
      > </a
      ><a name="14206" href="Stlc.html#14180" class="Bound"
      >s'</a
      ><a name="14208"
      >
          </a
      ><a name="14219" class="Symbol"
      >&#8594;</a
      ><a name="14220"
      > </a
      ><a name="14221" href="Stlc.html#5568" class="InductiveConstructor Operator"
      >if</a
      ><a name="14223"
      > </a
      ><a name="14224" href="Stlc.html#14178" class="Bound"
      >s</a
      ><a name="14225"
      > </a
      ><a name="14226" href="Stlc.html#5568" class="InductiveConstructor Operator"
      >then</a
      ><a name="14230"
      > </a
      ><a name="14231" href="Stlc.html#14183" class="Bound"
      >t</a
      ><a name="14232"
      > </a
      ><a name="14233" href="Stlc.html#5568" class="InductiveConstructor Operator"
      >else</a
      ><a name="14237"
      > </a
      ><a name="14238" href="Stlc.html#14185" class="Bound"
      >u</a
      ><a name="14239"
      > </a
      ><a name="14240" href="Stlc.html#13846" class="Datatype Operator"
      >==&gt;</a
      ><a name="14243"
      > </a
      ><a name="14244" href="Stlc.html#5568" class="InductiveConstructor Operator"
      >if</a
      ><a name="14246"
      > </a
      ><a name="14247" href="Stlc.html#14180" class="Bound"
      >s'</a
      ><a name="14249"
      > </a
      ><a name="14250" href="Stlc.html#5568" class="InductiveConstructor Operator"
      >then</a
      ><a name="14254"
      > </a
      ><a name="14255" href="Stlc.html#14183" class="Bound"
      >t</a
      ><a name="14256"
      > </a
      ><a name="14257" href="Stlc.html#5568" class="InductiveConstructor Operator"
      >else</a
      ><a name="14261"
      > </a
      ><a name="14262" href="Stlc.html#14185" class="Bound"
      >u</a
      ><a name="14263"
      >
  </a
      ><a name="14266" href="Stlc.html#14266" class="InductiveConstructor"
      >iftrue</a
      ><a name="14272"
      >  </a
      ><a name="14274" class="Symbol"
      >:</a
      ><a name="14275"
      > </a
      ><a name="14276" class="Symbol"
      >forall</a
      ><a name="14282"
      > </a
      ><a name="14283" class="Symbol"
      >{</a
      ><a name="14284" href="Stlc.html#14284" class="Bound"
      >s</a
      ><a name="14285"
      > </a
      ><a name="14286" href="Stlc.html#14286" class="Bound"
      >t</a
      ><a name="14287" class="Symbol"
      >}</a
      ><a name="14288"
      >
          </a
      ><a name="14299" class="Symbol"
      >&#8594;</a
      ><a name="14300"
      > </a
      ><a name="14301" href="Stlc.html#5568" class="InductiveConstructor Operator"
      >if</a
      ><a name="14303"
      > </a
      ><a name="14304" href="Stlc.html#5538" class="InductiveConstructor"
      >true</a
      ><a name="14308"
      > </a
      ><a name="14309" href="Stlc.html#5568" class="InductiveConstructor Operator"
      >then</a
      ><a name="14313"
      > </a
      ><a name="14314" href="Stlc.html#14284" class="Bound"
      >s</a
      ><a name="14315"
      > </a
      ><a name="14316" href="Stlc.html#5568" class="InductiveConstructor Operator"
      >else</a
      ><a name="14320"
      > </a
      ><a name="14321" href="Stlc.html#14286" class="Bound"
      >t</a
      ><a name="14322"
      > </a
      ><a name="14323" href="Stlc.html#13846" class="Datatype Operator"
      >==&gt;</a
      ><a name="14326"
      > </a
      ><a name="14327" href="Stlc.html#14284" class="Bound"
      >s</a
      ><a name="14328"
      >
  </a
      ><a name="14331" href="Stlc.html#14331" class="InductiveConstructor"
      >iffalse</a
      ><a name="14338"
      > </a
      ><a name="14339" class="Symbol"
      >:</a
      ><a name="14340"
      > </a
      ><a name="14341" class="Symbol"
      >forall</a
      ><a name="14347"
      > </a
      ><a name="14348" class="Symbol"
      >{</a
      ><a name="14349" href="Stlc.html#14349" class="Bound"
      >s</a
      ><a name="14350"
      > </a
      ><a name="14351" href="Stlc.html#14351" class="Bound"
      >t</a
      ><a name="14352" class="Symbol"
      >}</a
      ><a name="14353"
      >
          </a
      ><a name="14364" class="Symbol"
      >&#8594;</a
      ><a name="14365"
      > </a
      ><a name="14366" href="Stlc.html#5568" class="InductiveConstructor Operator"
      >if</a
      ><a name="14368"
      > </a
      ><a name="14369" href="Stlc.html#5553" class="InductiveConstructor"
      >false</a
      ><a name="14374"
      > </a
      ><a name="14375" href="Stlc.html#5568" class="InductiveConstructor Operator"
      >then</a
      ><a name="14379"
      > </a
      ><a name="14380" href="Stlc.html#14349" class="Bound"
      >s</a
      ><a name="14381"
      > </a
      ><a name="14382" href="Stlc.html#5568" class="InductiveConstructor Operator"
      >else</a
      ><a name="14386"
      > </a
      ><a name="14387" href="Stlc.html#14351" class="Bound"
      >t</a
      ><a name="14388"
      > </a
      ><a name="14389" href="Stlc.html#13846" class="Datatype Operator"
      >==&gt;</a
      ><a name="14392"
      > </a
      ><a name="14393" href="Stlc.html#14351" class="Bound"
      >t</a
      ><a name="14394"
      >

</a
      ><a name="14396" class="Keyword"
      >infix</a
      ><a name="14401"
      > </a
      ><a name="14402" class="Number"
      >1</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="14456" class="Keyword"
      >data</a
      ><a name="14460"
      > </a
      ><a name="14461" href="Stlc.html#14461" class="Datatype"
      >Multi</a
      ><a name="14466"
      > </a
      ><a name="14467" class="Symbol"
      >(</a
      ><a name="14468" href="Stlc.html#14468" class="Bound"
      >R</a
      ><a name="14469"
      > </a
      ><a name="14470" class="Symbol"
      >:</a
      ><a name="14471"
      > </a
      ><a name="14472" href="Stlc.html#5436" class="Datatype"
      >Term</a
      ><a name="14476"
      > </a
      ><a name="14477" class="Symbol"
      >&#8594;</a
      ><a name="14478"
      > </a
      ><a name="14479" href="Stlc.html#5436" class="Datatype"
      >Term</a
      ><a name="14483"
      > </a
      ><a name="14484" class="Symbol"
      >&#8594;</a
      ><a name="14485"
      > </a
      ><a name="14486" class="PrimitiveType"
      >Set</a
      ><a name="14489" class="Symbol"
      >)</a
      ><a name="14490"
      > </a
      ><a name="14491" class="Symbol"
      >:</a
      ><a name="14492"
      > </a
      ><a name="14493" href="Stlc.html#5436" class="Datatype"
      >Term</a
      ><a name="14497"
      > </a
      ><a name="14498" class="Symbol"
      >&#8594;</a
      ><a name="14499"
      > </a
      ><a name="14500" href="Stlc.html#5436" class="Datatype"
      >Term</a
      ><a name="14504"
      > </a
      ><a name="14505" class="Symbol"
      >&#8594;</a
      ><a name="14506"
      > </a
      ><a name="14507" class="PrimitiveType"
      >Set</a
      ><a name="14510"
      > </a
      ><a name="14511" class="Keyword"
      >where</a
      ><a name="14516"
      >
  </a
      ><a name="14519" href="Stlc.html#14519" class="InductiveConstructor"
      >refl</a
      ><a name="14523"
      > </a
      ><a name="14524" class="Symbol"
      >:</a
      ><a name="14525"
      > </a
      ><a name="14526" class="Symbol"
      >forall</a
      ><a name="14532"
      > </a
      ><a name="14533" class="Symbol"
      >{</a
      ><a name="14534" href="Stlc.html#14534" class="Bound"
      >x</a
      ><a name="14535" class="Symbol"
      >}</a
      ><a name="14536"
      > </a
      ><a name="14537" class="Symbol"
      >-&gt;</a
      ><a name="14539"
      > </a
      ><a name="14540" href="Stlc.html#14461" class="Datatype"
      >Multi</a
      ><a name="14545"
      > </a
      ><a name="14546" href="Stlc.html#14468" class="Bound"
      >R</a
      ><a name="14547"
      > </a
      ><a name="14548" href="Stlc.html#14534" class="Bound"
      >x</a
      ><a name="14549"
      > </a
      ><a name="14550" href="Stlc.html#14534" class="Bound"
      >x</a
      ><a name="14551"
      >
  </a
      ><a name="14554" href="Stlc.html#14554" class="InductiveConstructor"
      >step</a
      ><a name="14558"
      > </a
      ><a name="14559" class="Symbol"
      >:</a
      ><a name="14560"
      > </a
      ><a name="14561" class="Symbol"
      >forall</a
      ><a name="14567"
      > </a
      ><a name="14568" class="Symbol"
      >{</a
      ><a name="14569" href="Stlc.html#14569" class="Bound"
      >x</a
      ><a name="14570"
      > </a
      ><a name="14571" href="Stlc.html#14571" class="Bound"
      >y</a
      ><a name="14572"
      > </a
      ><a name="14573" href="Stlc.html#14573" class="Bound"
      >z</a
      ><a name="14574" class="Symbol"
      >}</a
      ><a name="14575"
      > </a
      ><a name="14576" class="Symbol"
      >-&gt;</a
      ><a name="14578"
      > </a
      ><a name="14579" href="Stlc.html#14468" class="Bound"
      >R</a
      ><a name="14580"
      > </a
      ><a name="14581" href="Stlc.html#14569" class="Bound"
      >x</a
      ><a name="14582"
      > </a
      ><a name="14583" href="Stlc.html#14571" class="Bound"
      >y</a
      ><a name="14584"
      > </a
      ><a name="14585" class="Symbol"
      >-&gt;</a
      ><a name="14587"
      > </a
      ><a name="14588" href="Stlc.html#14461" class="Datatype"
      >Multi</a
      ><a name="14593"
      > </a
      ><a name="14594" href="Stlc.html#14468" class="Bound"
      >R</a
      ><a name="14595"
      > </a
      ><a name="14596" href="Stlc.html#14571" class="Bound"
      >y</a
      ><a name="14597"
      > </a
      ><a name="14598" href="Stlc.html#14573" class="Bound"
      >z</a
      ><a name="14599"
      > </a
      ><a name="14600" class="Symbol"
      >-&gt;</a
      ><a name="14602"
      > </a
      ><a name="14603" href="Stlc.html#14461" class="Datatype"
      >Multi</a
      ><a name="14608"
      > </a
      ><a name="14609" href="Stlc.html#14468" class="Bound"
      >R</a
      ><a name="14610"
      > </a
      ><a name="14611" href="Stlc.html#14569" class="Bound"
      >x</a
      ><a name="14612"
      > </a
      ><a name="14613" href="Stlc.html#14573" class="Bound"
      >z</a
      >
{% endraw %}</pre>
</div>

<pre class="Agda">{% raw %}
<a name="14647" href="Stlc.html#14647" class="Function Operator"
      >_==&gt;*_</a
      ><a name="14653"
      > </a
      ><a name="14654" class="Symbol"
      >:</a
      ><a name="14655"
      > </a
      ><a name="14656" href="Stlc.html#5436" class="Datatype"
      >Term</a
      ><a name="14660"
      > </a
      ><a name="14661" class="Symbol"
      >&#8594;</a
      ><a name="14662"
      > </a
      ><a name="14663" href="Stlc.html#5436" class="Datatype"
      >Term</a
      ><a name="14667"
      > </a
      ><a name="14668" class="Symbol"
      >&#8594;</a
      ><a name="14669"
      > </a
      ><a name="14670" class="PrimitiveType"
      >Set</a
      ><a name="14673"
      >
</a
      ><a name="14674" href="Stlc.html#14647" class="Function Operator"
      >_==&gt;*_</a
      ><a name="14680"
      > </a
      ><a name="14681" class="Symbol"
      >=</a
      ><a name="14682"
      > </a
      ><a name="14683" href="Stlc.html#14461" class="Datatype"
      >Multi</a
      ><a name="14688"
      > </a
      ><a name="14689" href="Stlc.html#13846" class="Datatype Operator"
      >_==&gt;_</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="14741" class="Symbol"
      >{-#</a
      ><a name="14744"
      > </a
      ><a name="14745" class="Keyword"
      >DISPLAY</a
      ><a name="14752"
      > </a
      ><a name="14753" href="Stlc.html#14461" class="Datatype"
      >Multi</a
      ><a name="14758"
      > </a
      ><a name="14759" href="Stlc.html#14759" class="Bound Operator"
      >_==&gt;_</a
      ><a name="14764"
      > = </a
      ><a name="14767" href="Stlc.html#14647" class="Function Operator"
      >_==&gt;*_</a
      ><a name="14773"
      > </a
      ><a name="14774" class="Symbol"
      >#-}</a
      >
{% endraw %}</pre>
</div>

### Examples

Example:

    ((λx:bool⇒bool. x) (λx:bool. x)) ==>* (λx:bool. x)

<pre class="Agda">{% raw %}
<a name="14890" href="Stlc.html#14890" class="Function"
      >step-example1</a
      ><a name="14903"
      > </a
      ><a name="14904" class="Symbol"
      >:</a
      ><a name="14905"
      > </a
      ><a name="14906" class="Symbol"
      >(</a
      ><a name="14907" href="Stlc.html#5475" class="InductiveConstructor"
      >app</a
      ><a name="14910"
      > </a
      ><a name="14911" href="Stlc.html#6263" class="Function"
      >idBB</a
      ><a name="14915"
      > </a
      ><a name="14916" href="Stlc.html#6185" class="Function"
      >idB</a
      ><a name="14919" class="Symbol"
      >)</a
      ><a name="14920"
      > </a
      ><a name="14921" href="Stlc.html#14647" class="Function Operator"
      >==&gt;*</a
      ><a name="14925"
      > </a
      ><a name="14926" href="Stlc.html#6185" class="Function"
      >idB</a
      ><a name="14929"
      >
</a
      ><a name="14930" href="Stlc.html#14890" class="Function"
      >step-example1</a
      ><a name="14943"
      > </a
      ><a name="14944" class="Symbol"
      >=</a
      ><a name="14945"
      > </a
      ><a name="14946" href="Stlc.html#14554" class="InductiveConstructor"
      >step</a
      ><a name="14950"
      > </a
      ><a name="14951" class="Symbol"
      >(</a
      ><a name="14952" href="Stlc.html#13880" class="InductiveConstructor"
      >red</a
      ><a name="14955"
      > </a
      ><a name="14956" href="Stlc.html#8518" class="InductiveConstructor"
      >abs</a
      ><a name="14959" class="Symbol"
      >)</a
      ><a name="14960"
      >
              </a
      ><a name="14975" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="14976"
      > </a
      ><a name="14977" href="Stlc.html#14519" class="InductiveConstructor"
      >refl</a
      >
{% endraw %}</pre>

Example:

    ((λx:bool⇒bool. x) ((λx:bool⇒bool. x) (λx:bool. x)))
    ==>* (λx:bool. x)

<pre class="Agda">{% raw %}
<a name="15097" href="Stlc.html#15097" class="Function"
      >step-example2</a
      ><a name="15110"
      > </a
      ><a name="15111" class="Symbol"
      >:</a
      ><a name="15112"
      > </a
      ><a name="15113" class="Symbol"
      >(</a
      ><a name="15114" href="Stlc.html#5475" class="InductiveConstructor"
      >app</a
      ><a name="15117"
      > </a
      ><a name="15118" href="Stlc.html#6263" class="Function"
      >idBB</a
      ><a name="15122"
      > </a
      ><a name="15123" class="Symbol"
      >(</a
      ><a name="15124" href="Stlc.html#5475" class="InductiveConstructor"
      >app</a
      ><a name="15127"
      > </a
      ><a name="15128" href="Stlc.html#6263" class="Function"
      >idBB</a
      ><a name="15132"
      > </a
      ><a name="15133" href="Stlc.html#6185" class="Function"
      >idB</a
      ><a name="15136" class="Symbol"
      >))</a
      ><a name="15138"
      > </a
      ><a name="15139" href="Stlc.html#14647" class="Function Operator"
      >==&gt;*</a
      ><a name="15143"
      > </a
      ><a name="15144" href="Stlc.html#6185" class="Function"
      >idB</a
      ><a name="15147"
      >
</a
      ><a name="15148" href="Stlc.html#15097" class="Function"
      >step-example2</a
      ><a name="15161"
      > </a
      ><a name="15162" class="Symbol"
      >=</a
      ><a name="15163"
      > </a
      ><a name="15164" href="Stlc.html#14554" class="InductiveConstructor"
      >step</a
      ><a name="15168"
      > </a
      ><a name="15169" class="Symbol"
      >(</a
      ><a name="15170" href="Stlc.html#14058" class="InductiveConstructor"
      >app2</a
      ><a name="15174"
      > </a
      ><a name="15175" href="Stlc.html#8518" class="InductiveConstructor"
      >abs</a
      ><a name="15178"
      > </a
      ><a name="15179" class="Symbol"
      >(</a
      ><a name="15180" href="Stlc.html#13880" class="InductiveConstructor"
      >red</a
      ><a name="15183"
      > </a
      ><a name="15184" href="Stlc.html#8518" class="InductiveConstructor"
      >abs</a
      ><a name="15187" class="Symbol"
      >))</a
      ><a name="15189"
      >
              </a
      ><a name="15204" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="15205"
      > </a
      ><a name="15206" href="Stlc.html#14554" class="InductiveConstructor"
      >step</a
      ><a name="15210"
      > </a
      ><a name="15211" class="Symbol"
      >(</a
      ><a name="15212" href="Stlc.html#13880" class="InductiveConstructor"
      >red</a
      ><a name="15215"
      > </a
      ><a name="15216" href="Stlc.html#8518" class="InductiveConstructor"
      >abs</a
      ><a name="15219" class="Symbol"
      >)</a
      ><a name="15220"
      >
              </a
      ><a name="15235" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="15236"
      > </a
      ><a name="15237" href="Stlc.html#14519" class="InductiveConstructor"
      >refl</a
      >
{% endraw %}</pre>

Example:

    ((λx:bool⇒bool. x) (λx:bool. if x then false else true)) true)
    ==>* false

<pre class="Agda">{% raw %}
<a name="15360" href="Stlc.html#15360" class="Function"
      >step-example3</a
      ><a name="15373"
      > </a
      ><a name="15374" class="Symbol"
      >:</a
      ><a name="15375"
      > </a
      ><a name="15376" class="Symbol"
      >(</a
      ><a name="15377" href="Stlc.html#5475" class="InductiveConstructor"
      >app</a
      ><a name="15380"
      > </a
      ><a name="15381" class="Symbol"
      >(</a
      ><a name="15382" href="Stlc.html#5475" class="InductiveConstructor"
      >app</a
      ><a name="15385"
      > </a
      ><a name="15386" href="Stlc.html#6263" class="Function"
      >idBB</a
      ><a name="15390"
      > </a
      ><a name="15391" href="Stlc.html#6586" class="Function"
      >notB</a
      ><a name="15395" class="Symbol"
      >)</a
      ><a name="15396"
      > </a
      ><a name="15397" href="Stlc.html#5538" class="InductiveConstructor"
      >true</a
      ><a name="15401" class="Symbol"
      >)</a
      ><a name="15402"
      > </a
      ><a name="15403" href="Stlc.html#14647" class="Function Operator"
      >==&gt;*</a
      ><a name="15407"
      > </a
      ><a name="15408" href="Stlc.html#5553" class="InductiveConstructor"
      >false</a
      ><a name="15413"
      >
</a
      ><a name="15414" href="Stlc.html#15360" class="Function"
      >step-example3</a
      ><a name="15427"
      > </a
      ><a name="15428" class="Symbol"
      >=</a
      ><a name="15429"
      > </a
      ><a name="15430" href="Stlc.html#14554" class="InductiveConstructor"
      >step</a
      ><a name="15434"
      > </a
      ><a name="15435" class="Symbol"
      >(</a
      ><a name="15436" href="Stlc.html#13976" class="InductiveConstructor"
      >app1</a
      ><a name="15440"
      > </a
      ><a name="15441" class="Symbol"
      >(</a
      ><a name="15442" href="Stlc.html#13880" class="InductiveConstructor"
      >red</a
      ><a name="15445"
      > </a
      ><a name="15446" href="Stlc.html#8518" class="InductiveConstructor"
      >abs</a
      ><a name="15449" class="Symbol"
      >))</a
      ><a name="15451"
      >
              </a
      ><a name="15466" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="15467"
      > </a
      ><a name="15468" href="Stlc.html#14554" class="InductiveConstructor"
      >step</a
      ><a name="15472"
      > </a
      ><a name="15473" class="Symbol"
      >(</a
      ><a name="15474" href="Stlc.html#13880" class="InductiveConstructor"
      >red</a
      ><a name="15477"
      > </a
      ><a name="15478" href="Stlc.html#8571" class="InductiveConstructor"
      >true</a
      ><a name="15482" class="Symbol"
      >)</a
      ><a name="15483"
      >
              </a
      ><a name="15498" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="15499"
      > </a
      ><a name="15500" href="Stlc.html#14554" class="InductiveConstructor"
      >step</a
      ><a name="15504"
      > </a
      ><a name="15505" href="Stlc.html#14266" class="InductiveConstructor"
      >iftrue</a
      ><a name="15511"
      >
              </a
      ><a name="15526" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="15527"
      > </a
      ><a name="15528" href="Stlc.html#14519" class="InductiveConstructor"
      >refl</a
      >
{% endraw %}</pre>

Example:

    ((λx:bool → bool. x) ((λx:bool. if x then false else true) true))
    ==>* false

<pre class="Agda">{% raw %}
<a name="15654" href="Stlc.html#15654" class="Function"
      >step-example4</a
      ><a name="15667"
      > </a
      ><a name="15668" class="Symbol"
      >:</a
      ><a name="15669"
      > </a
      ><a name="15670" class="Symbol"
      >(</a
      ><a name="15671" href="Stlc.html#5475" class="InductiveConstructor"
      >app</a
      ><a name="15674"
      > </a
      ><a name="15675" href="Stlc.html#6263" class="Function"
      >idBB</a
      ><a name="15679"
      > </a
      ><a name="15680" class="Symbol"
      >(</a
      ><a name="15681" href="Stlc.html#5475" class="InductiveConstructor"
      >app</a
      ><a name="15684"
      > </a
      ><a name="15685" href="Stlc.html#6586" class="Function"
      >notB</a
      ><a name="15689"
      > </a
      ><a name="15690" href="Stlc.html#5538" class="InductiveConstructor"
      >true</a
      ><a name="15694" class="Symbol"
      >))</a
      ><a name="15696"
      > </a
      ><a name="15697" href="Stlc.html#14647" class="Function Operator"
      >==&gt;*</a
      ><a name="15701"
      > </a
      ><a name="15702" href="Stlc.html#5553" class="InductiveConstructor"
      >false</a
      ><a name="15707"
      >
</a
      ><a name="15708" href="Stlc.html#15654" class="Function"
      >step-example4</a
      ><a name="15721"
      > </a
      ><a name="15722" class="Symbol"
      >=</a
      ><a name="15723"
      > </a
      ><a name="15724" href="Stlc.html#14554" class="InductiveConstructor"
      >step</a
      ><a name="15728"
      > </a
      ><a name="15729" class="Symbol"
      >(</a
      ><a name="15730" href="Stlc.html#14058" class="InductiveConstructor"
      >app2</a
      ><a name="15734"
      > </a
      ><a name="15735" href="Stlc.html#8518" class="InductiveConstructor"
      >abs</a
      ><a name="15738"
      > </a
      ><a name="15739" class="Symbol"
      >(</a
      ><a name="15740" href="Stlc.html#13880" class="InductiveConstructor"
      >red</a
      ><a name="15743"
      > </a
      ><a name="15744" href="Stlc.html#8571" class="InductiveConstructor"
      >true</a
      ><a name="15748" class="Symbol"
      >))</a
      ><a name="15750"
      >
              </a
      ><a name="15765" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="15766"
      > </a
      ><a name="15767" href="Stlc.html#14554" class="InductiveConstructor"
      >step</a
      ><a name="15771"
      > </a
      ><a name="15772" class="Symbol"
      >(</a
      ><a name="15773" href="Stlc.html#14058" class="InductiveConstructor"
      >app2</a
      ><a name="15777"
      > </a
      ><a name="15778" href="Stlc.html#8518" class="InductiveConstructor"
      >abs</a
      ><a name="15781"
      > </a
      ><a name="15782" href="Stlc.html#14266" class="InductiveConstructor"
      >iftrue</a
      ><a name="15788" class="Symbol"
      >)</a
      ><a name="15789"
      >
              </a
      ><a name="15804" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="15805"
      > </a
      ><a name="15806" href="Stlc.html#14554" class="InductiveConstructor"
      >step</a
      ><a name="15810"
      > </a
      ><a name="15811" class="Symbol"
      >(</a
      ><a name="15812" href="Stlc.html#13880" class="InductiveConstructor"
      >red</a
      ><a name="15815"
      > </a
      ><a name="15816" href="Stlc.html#8592" class="InductiveConstructor"
      >false</a
      ><a name="15821" class="Symbol"
      >)</a
      ><a name="15822"
      >
              </a
      ><a name="15837" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="15838"
      > </a
      ><a name="15839" href="Stlc.html#14519" class="InductiveConstructor"
      >refl</a
      >
{% endraw %}</pre>

#### Exercise: 2 stars (step_example3)

<pre class="Agda">{% raw %}
<a name="15909" href="Stlc.html#15909" class="Function"
      >step-example5</a
      ><a name="15922"
      > </a
      ><a name="15923" class="Symbol"
      >:</a
      ><a name="15924"
      > </a
      ><a name="15925" class="Symbol"
      >(</a
      ><a name="15926" href="Stlc.html#5475" class="InductiveConstructor"
      >app</a
      ><a name="15929"
      > </a
      ><a name="15930" class="Symbol"
      >(</a
      ><a name="15931" href="Stlc.html#5475" class="InductiveConstructor"
      >app</a
      ><a name="15934"
      > </a
      ><a name="15935" href="Stlc.html#6369" class="Function"
      >idBBBB</a
      ><a name="15941"
      > </a
      ><a name="15942" href="Stlc.html#6263" class="Function"
      >idBB</a
      ><a name="15946" class="Symbol"
      >)</a
      ><a name="15947"
      > </a
      ><a name="15948" href="Stlc.html#6185" class="Function"
      >idB</a
      ><a name="15951" class="Symbol"
      >)</a
      ><a name="15952"
      > </a
      ><a name="15953" href="Stlc.html#14647" class="Function Operator"
      >==&gt;*</a
      ><a name="15957"
      > </a
      ><a name="15958" href="Stlc.html#6185" class="Function"
      >idB</a
      ><a name="15961"
      >
</a
      ><a name="15962" href="Stlc.html#15909" class="Function"
      >step-example5</a
      ><a name="15975"
      > </a
      ><a name="15976" class="Symbol"
      >=</a
      ><a name="15977"
      > </a
      ><a name="15978" class="Symbol"
      >{!!}</a
      ><a name="15982"
      > </a
      ><a name="15983" class="Comment"
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
<a name="16676" href="Stlc.html#16676" class="Function"
      >Ctxt</a
      ><a name="16680"
      > </a
      ><a name="16681" class="Symbol"
      >:</a
      ><a name="16682"
      > </a
      ><a name="16683" class="PrimitiveType"
      >Set</a
      ><a name="16686"
      >
</a
      ><a name="16687" href="Stlc.html#16676" class="Function"
      >Ctxt</a
      ><a name="16691"
      > </a
      ><a name="16692" class="Symbol"
      >=</a
      ><a name="16693"
      > </a
      ><a name="16694" href="Stlc.html#5131" class="Datatype"
      >Id</a
      ><a name="16696"
      > </a
      ><a name="16697" class="Symbol"
      >&#8594;</a
      ><a name="16698"
      > </a
      ><a name="16699" href="https://agda.github.io/agda-stdlib/Data.Maybe.Base.html#335" class="Datatype"
      >Maybe</a
      ><a name="16704"
      > </a
      ><a name="16705" href="Stlc.html#5017" class="Datatype"
      >Type</a
      ><a name="16709"
      >

</a
      ><a name="16711" href="Stlc.html#16711" class="Function"
      >&#8709;</a
      ><a name="16712"
      > </a
      ><a name="16713" class="Symbol"
      >:</a
      ><a name="16714"
      > </a
      ><a name="16715" href="Stlc.html#16676" class="Function"
      >Ctxt</a
      ><a name="16719"
      >
</a
      ><a name="16720" href="Stlc.html#16711" class="Function"
      >&#8709;</a
      ><a name="16721"
      > </a
      ><a name="16722" class="Symbol"
      >=</a
      ><a name="16723"
      > </a
      ><a name="16724" class="Symbol"
      >&#955;</a
      ><a name="16725"
      > </a
      ><a name="16726" href="Stlc.html#16726" class="Bound"
      >_</a
      ><a name="16727"
      > </a
      ><a name="16728" class="Symbol"
      >&#8594;</a
      ><a name="16729"
      > </a
      ><a name="16730" href="https://agda.github.io/agda-stdlib/Data.Maybe.Base.html#403" class="InductiveConstructor"
      >nothing</a
      ><a name="16737"
      >

</a
      ><a name="16739" href="Stlc.html#16739" class="Function Operator"
      >_,_&#8758;_</a
      ><a name="16744"
      > </a
      ><a name="16745" class="Symbol"
      >:</a
      ><a name="16746"
      > </a
      ><a name="16747" href="Stlc.html#16676" class="Function"
      >Ctxt</a
      ><a name="16751"
      > </a
      ><a name="16752" class="Symbol"
      >-&gt;</a
      ><a name="16754"
      > </a
      ><a name="16755" href="Stlc.html#5131" class="Datatype"
      >Id</a
      ><a name="16757"
      > </a
      ><a name="16758" class="Symbol"
      >-&gt;</a
      ><a name="16760"
      > </a
      ><a name="16761" href="Stlc.html#5017" class="Datatype"
      >Type</a
      ><a name="16765"
      > </a
      ><a name="16766" class="Symbol"
      >-&gt;</a
      ><a name="16768"
      > </a
      ><a name="16769" href="Stlc.html#16676" class="Function"
      >Ctxt</a
      ><a name="16773"
      >
</a
      ><a name="16774" class="Symbol"
      >(</a
      ><a name="16775" href="Stlc.html#16775" class="Bound"
      >&#915;</a
      ><a name="16776"
      > </a
      ><a name="16777" href="Stlc.html#16739" class="Function Operator"
      >,</a
      ><a name="16778"
      > </a
      ><a name="16779" href="Stlc.html#16779" class="Bound"
      >x</a
      ><a name="16780"
      > </a
      ><a name="16781" href="Stlc.html#16739" class="Function Operator"
      >&#8758;</a
      ><a name="16782"
      > </a
      ><a name="16783" href="Stlc.html#16783" class="Bound"
      >A</a
      ><a name="16784" class="Symbol"
      >)</a
      ><a name="16785"
      > </a
      ><a name="16786" href="Stlc.html#16786" class="Bound"
      >y</a
      ><a name="16787"
      > </a
      ><a name="16788" class="Keyword"
      >with</a
      ><a name="16792"
      > </a
      ><a name="16793" href="Stlc.html#16779" class="Bound"
      >x</a
      ><a name="16794"
      > </a
      ><a name="16795" href="Stlc.html#5265" class="Function Operator"
      >&#8799;</a
      ><a name="16796"
      > </a
      ><a name="16797" href="Stlc.html#16786" class="Bound"
      >y</a
      ><a name="16798"
      >
</a
      ><a name="16799" class="Symbol"
      >...</a
      ><a name="16802"
      > </a
      ><a name="16803" class="Symbol"
      >|</a
      ><a name="16804"
      > </a
      ><a name="16805" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="16808"
      > </a
      ><a name="16809" href="Stlc.html#16809" class="Bound"
      >x=y</a
      ><a name="16812"
      > </a
      ><a name="16813" class="Symbol"
      >=</a
      ><a name="16814"
      > </a
      ><a name="16815" href="https://agda.github.io/agda-stdlib/Data.Maybe.Base.html#373" class="InductiveConstructor"
      >just</a
      ><a name="16819"
      > </a
      ><a name="16820" href="Stlc.html#16783" class="Bound"
      >A</a
      ><a name="16821"
      >
</a
      ><a name="16822" class="Symbol"
      >...</a
      ><a name="16825"
      > </a
      ><a name="16826" class="Symbol"
      >|</a
      ><a name="16827"
      > </a
      ><a name="16828" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="16830"
      >  </a
      ><a name="16832" href="Stlc.html#16832" class="Bound"
      >x&#8800;y</a
      ><a name="16835"
      > </a
      ><a name="16836" class="Symbol"
      >=</a
      ><a name="16837"
      > </a
      ><a name="16838" href="Stlc.html#16775" class="Bound"
      >&#915;</a
      ><a name="16839"
      > </a
      ><a name="16840" href="Stlc.html#16786" class="Bound"
      >y</a
      ><a name="16841"
      >

</a
      ><a name="16843" class="Keyword"
      >infixl</a
      ><a name="16849"
      > </a
      ><a name="16850" class="Number"
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
<a name="17657" class="Keyword"
      >data</a
      ><a name="17661"
      > </a
      ><a name="17662" href="Stlc.html#17662" class="Datatype Operator"
      >_&#8866;_&#8758;_</a
      ><a name="17667"
      > </a
      ><a name="17668" class="Symbol"
      >:</a
      ><a name="17669"
      > </a
      ><a name="17670" href="Stlc.html#16676" class="Function"
      >Ctxt</a
      ><a name="17674"
      > </a
      ><a name="17675" class="Symbol"
      >-&gt;</a
      ><a name="17677"
      > </a
      ><a name="17678" href="Stlc.html#5436" class="Datatype"
      >Term</a
      ><a name="17682"
      > </a
      ><a name="17683" class="Symbol"
      >-&gt;</a
      ><a name="17685"
      > </a
      ><a name="17686" href="Stlc.html#5017" class="Datatype"
      >Type</a
      ><a name="17690"
      > </a
      ><a name="17691" class="Symbol"
      >-&gt;</a
      ><a name="17693"
      > </a
      ><a name="17694" class="PrimitiveType"
      >Set</a
      ><a name="17697"
      > </a
      ><a name="17698" class="Keyword"
      >where</a
      ><a name="17703"
      >
  </a
      ><a name="17706" href="Stlc.html#17706" class="InductiveConstructor"
      >var</a
      ><a name="17709"
      >           </a
      ><a name="17720" class="Symbol"
      >:</a
      ><a name="17721"
      > </a
      ><a name="17722" class="Symbol"
      >forall</a
      ><a name="17728"
      > </a
      ><a name="17729" class="Symbol"
      >{</a
      ><a name="17730" href="Stlc.html#17730" class="Bound"
      >&#915;</a
      ><a name="17731" class="Symbol"
      >}</a
      ><a name="17732"
      > </a
      ><a name="17733" href="Stlc.html#17733" class="Bound"
      >x</a
      ><a name="17734"
      > </a
      ><a name="17735" class="Symbol"
      >{</a
      ><a name="17736" href="Stlc.html#17736" class="Bound"
      >A</a
      ><a name="17737" class="Symbol"
      >}</a
      ><a name="17738"
      >
                </a
      ><a name="17755" class="Symbol"
      >&#8594;</a
      ><a name="17756"
      > </a
      ><a name="17757" href="Stlc.html#17730" class="Bound"
      >&#915;</a
      ><a name="17758"
      > </a
      ><a name="17759" href="Stlc.html#17733" class="Bound"
      >x</a
      ><a name="17760"
      > </a
      ><a name="17761" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="17762"
      > </a
      ><a name="17763" href="https://agda.github.io/agda-stdlib/Data.Maybe.Base.html#373" class="InductiveConstructor"
      >just</a
      ><a name="17767"
      > </a
      ><a name="17768" href="Stlc.html#17736" class="Bound"
      >A</a
      ><a name="17769"
      >
                </a
      ><a name="17786" class="Symbol"
      >&#8594;</a
      ><a name="17787"
      > </a
      ><a name="17788" href="Stlc.html#17730" class="Bound"
      >&#915;</a
      ><a name="17789"
      > </a
      ><a name="17790" href="Stlc.html#17662" class="Datatype Operator"
      >&#8866;</a
      ><a name="17791"
      > </a
      ><a name="17792" href="Stlc.html#5455" class="InductiveConstructor"
      >var</a
      ><a name="17795"
      > </a
      ><a name="17796" href="Stlc.html#17733" class="Bound"
      >x</a
      ><a name="17797"
      > </a
      ><a name="17798" href="Stlc.html#17662" class="Datatype Operator"
      >&#8758;</a
      ><a name="17799"
      > </a
      ><a name="17800" href="Stlc.html#17736" class="Bound"
      >A</a
      ><a name="17801"
      >
  </a
      ><a name="17804" href="Stlc.html#17804" class="InductiveConstructor"
      >abs</a
      ><a name="17807"
      >           </a
      ><a name="17818" class="Symbol"
      >:</a
      ><a name="17819"
      > </a
      ><a name="17820" class="Symbol"
      >forall</a
      ><a name="17826"
      > </a
      ><a name="17827" class="Symbol"
      >{</a
      ><a name="17828" href="Stlc.html#17828" class="Bound"
      >&#915;</a
      ><a name="17829" class="Symbol"
      >}</a
      ><a name="17830"
      > </a
      ><a name="17831" class="Symbol"
      >{</a
      ><a name="17832" href="Stlc.html#17832" class="Bound"
      >x</a
      ><a name="17833" class="Symbol"
      >}</a
      ><a name="17834"
      > </a
      ><a name="17835" class="Symbol"
      >{</a
      ><a name="17836" href="Stlc.html#17836" class="Bound"
      >A</a
      ><a name="17837" class="Symbol"
      >}</a
      ><a name="17838"
      > </a
      ><a name="17839" class="Symbol"
      >{</a
      ><a name="17840" href="Stlc.html#17840" class="Bound"
      >B</a
      ><a name="17841" class="Symbol"
      >}</a
      ><a name="17842"
      > </a
      ><a name="17843" class="Symbol"
      >{</a
      ><a name="17844" href="Stlc.html#17844" class="Bound"
      >s</a
      ><a name="17845" class="Symbol"
      >}</a
      ><a name="17846"
      >
                </a
      ><a name="17863" class="Symbol"
      >&#8594;</a
      ><a name="17864"
      > </a
      ><a name="17865" href="Stlc.html#17828" class="Bound"
      >&#915;</a
      ><a name="17866"
      > </a
      ><a name="17867" href="Stlc.html#16739" class="Function Operator"
      >,</a
      ><a name="17868"
      > </a
      ><a name="17869" href="Stlc.html#17832" class="Bound"
      >x</a
      ><a name="17870"
      > </a
      ><a name="17871" href="Stlc.html#16739" class="Function Operator"
      >&#8758;</a
      ><a name="17872"
      > </a
      ><a name="17873" href="Stlc.html#17836" class="Bound"
      >A</a
      ><a name="17874"
      > </a
      ><a name="17875" href="Stlc.html#17662" class="Datatype Operator"
      >&#8866;</a
      ><a name="17876"
      > </a
      ><a name="17877" href="Stlc.html#17844" class="Bound"
      >s</a
      ><a name="17878"
      > </a
      ><a name="17879" href="Stlc.html#17662" class="Datatype Operator"
      >&#8758;</a
      ><a name="17880"
      > </a
      ><a name="17881" href="Stlc.html#17840" class="Bound"
      >B</a
      ><a name="17882"
      >
                </a
      ><a name="17899" class="Symbol"
      >&#8594;</a
      ><a name="17900"
      > </a
      ><a name="17901" href="Stlc.html#17828" class="Bound"
      >&#915;</a
      ><a name="17902"
      > </a
      ><a name="17903" href="Stlc.html#17662" class="Datatype Operator"
      >&#8866;</a
      ><a name="17904"
      > </a
      ><a name="17905" href="Stlc.html#5504" class="InductiveConstructor"
      >abs</a
      ><a name="17908"
      > </a
      ><a name="17909" href="Stlc.html#17832" class="Bound"
      >x</a
      ><a name="17910"
      > </a
      ><a name="17911" href="Stlc.html#17836" class="Bound"
      >A</a
      ><a name="17912"
      > </a
      ><a name="17913" href="Stlc.html#17844" class="Bound"
      >s</a
      ><a name="17914"
      > </a
      ><a name="17915" href="Stlc.html#17662" class="Datatype Operator"
      >&#8758;</a
      ><a name="17916"
      > </a
      ><a name="17917" href="Stlc.html#17836" class="Bound"
      >A</a
      ><a name="17918"
      > </a
      ><a name="17919" href="Stlc.html#5050" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="17920"
      > </a
      ><a name="17921" href="Stlc.html#17840" class="Bound"
      >B</a
      ><a name="17922"
      >
  </a
      ><a name="17925" href="Stlc.html#17925" class="InductiveConstructor"
      >app</a
      ><a name="17928"
      >           </a
      ><a name="17939" class="Symbol"
      >:</a
      ><a name="17940"
      > </a
      ><a name="17941" class="Symbol"
      >forall</a
      ><a name="17947"
      > </a
      ><a name="17948" class="Symbol"
      >{</a
      ><a name="17949" href="Stlc.html#17949" class="Bound"
      >&#915;</a
      ><a name="17950" class="Symbol"
      >}</a
      ><a name="17951"
      > </a
      ><a name="17952" class="Symbol"
      >{</a
      ><a name="17953" href="Stlc.html#17953" class="Bound"
      >A</a
      ><a name="17954" class="Symbol"
      >}</a
      ><a name="17955"
      > </a
      ><a name="17956" class="Symbol"
      >{</a
      ><a name="17957" href="Stlc.html#17957" class="Bound"
      >B</a
      ><a name="17958" class="Symbol"
      >}</a
      ><a name="17959"
      > </a
      ><a name="17960" class="Symbol"
      >{</a
      ><a name="17961" href="Stlc.html#17961" class="Bound"
      >s</a
      ><a name="17962" class="Symbol"
      >}</a
      ><a name="17963"
      > </a
      ><a name="17964" class="Symbol"
      >{</a
      ><a name="17965" href="Stlc.html#17965" class="Bound"
      >t</a
      ><a name="17966" class="Symbol"
      >}</a
      ><a name="17967"
      >
                </a
      ><a name="17984" class="Symbol"
      >&#8594;</a
      ><a name="17985"
      > </a
      ><a name="17986" href="Stlc.html#17949" class="Bound"
      >&#915;</a
      ><a name="17987"
      > </a
      ><a name="17988" href="Stlc.html#17662" class="Datatype Operator"
      >&#8866;</a
      ><a name="17989"
      > </a
      ><a name="17990" href="Stlc.html#17961" class="Bound"
      >s</a
      ><a name="17991"
      > </a
      ><a name="17992" href="Stlc.html#17662" class="Datatype Operator"
      >&#8758;</a
      ><a name="17993"
      > </a
      ><a name="17994" href="Stlc.html#17953" class="Bound"
      >A</a
      ><a name="17995"
      > </a
      ><a name="17996" href="Stlc.html#5050" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="17997"
      > </a
      ><a name="17998" href="Stlc.html#17957" class="Bound"
      >B</a
      ><a name="17999"
      >
                </a
      ><a name="18016" class="Symbol"
      >&#8594;</a
      ><a name="18017"
      > </a
      ><a name="18018" href="Stlc.html#17949" class="Bound"
      >&#915;</a
      ><a name="18019"
      > </a
      ><a name="18020" href="Stlc.html#17662" class="Datatype Operator"
      >&#8866;</a
      ><a name="18021"
      > </a
      ><a name="18022" href="Stlc.html#17965" class="Bound"
      >t</a
      ><a name="18023"
      > </a
      ><a name="18024" href="Stlc.html#17662" class="Datatype Operator"
      >&#8758;</a
      ><a name="18025"
      > </a
      ><a name="18026" href="Stlc.html#17953" class="Bound"
      >A</a
      ><a name="18027"
      >
                </a
      ><a name="18044" class="Symbol"
      >&#8594;</a
      ><a name="18045"
      > </a
      ><a name="18046" href="Stlc.html#17949" class="Bound"
      >&#915;</a
      ><a name="18047"
      > </a
      ><a name="18048" href="Stlc.html#17662" class="Datatype Operator"
      >&#8866;</a
      ><a name="18049"
      > </a
      ><a name="18050" href="Stlc.html#5475" class="InductiveConstructor"
      >app</a
      ><a name="18053"
      > </a
      ><a name="18054" href="Stlc.html#17961" class="Bound"
      >s</a
      ><a name="18055"
      > </a
      ><a name="18056" href="Stlc.html#17965" class="Bound"
      >t</a
      ><a name="18057"
      > </a
      ><a name="18058" href="Stlc.html#17662" class="Datatype Operator"
      >&#8758;</a
      ><a name="18059"
      > </a
      ><a name="18060" href="Stlc.html#17957" class="Bound"
      >B</a
      ><a name="18061"
      >
  </a
      ><a name="18064" href="Stlc.html#18064" class="InductiveConstructor"
      >true</a
      ><a name="18068"
      >          </a
      ><a name="18078" class="Symbol"
      >:</a
      ><a name="18079"
      > </a
      ><a name="18080" class="Symbol"
      >forall</a
      ><a name="18086"
      > </a
      ><a name="18087" class="Symbol"
      >{</a
      ><a name="18088" href="Stlc.html#18088" class="Bound"
      >&#915;</a
      ><a name="18089" class="Symbol"
      >}</a
      ><a name="18090"
      >
                </a
      ><a name="18107" class="Symbol"
      >&#8594;</a
      ><a name="18108"
      > </a
      ><a name="18109" href="Stlc.html#18088" class="Bound"
      >&#915;</a
      ><a name="18110"
      > </a
      ><a name="18111" href="Stlc.html#17662" class="Datatype Operator"
      >&#8866;</a
      ><a name="18112"
      > </a
      ><a name="18113" href="Stlc.html#5538" class="InductiveConstructor"
      >true</a
      ><a name="18117"
      >  </a
      ><a name="18119" href="Stlc.html#17662" class="Datatype Operator"
      >&#8758;</a
      ><a name="18120"
      > </a
      ><a name="18121" href="Stlc.html#5036" class="InductiveConstructor"
      >bool</a
      ><a name="18125"
      >
  </a
      ><a name="18128" href="Stlc.html#18128" class="InductiveConstructor"
      >false</a
      ><a name="18133"
      >         </a
      ><a name="18142" class="Symbol"
      >:</a
      ><a name="18143"
      > </a
      ><a name="18144" class="Symbol"
      >forall</a
      ><a name="18150"
      > </a
      ><a name="18151" class="Symbol"
      >{</a
      ><a name="18152" href="Stlc.html#18152" class="Bound"
      >&#915;</a
      ><a name="18153" class="Symbol"
      >}</a
      ><a name="18154"
      >
                </a
      ><a name="18171" class="Symbol"
      >&#8594;</a
      ><a name="18172"
      > </a
      ><a name="18173" href="Stlc.html#18152" class="Bound"
      >&#915;</a
      ><a name="18174"
      > </a
      ><a name="18175" href="Stlc.html#17662" class="Datatype Operator"
      >&#8866;</a
      ><a name="18176"
      > </a
      ><a name="18177" href="Stlc.html#5553" class="InductiveConstructor"
      >false</a
      ><a name="18182"
      > </a
      ><a name="18183" href="Stlc.html#17662" class="Datatype Operator"
      >&#8758;</a
      ><a name="18184"
      > </a
      ><a name="18185" href="Stlc.html#5036" class="InductiveConstructor"
      >bool</a
      ><a name="18189"
      >
  </a
      ><a name="18192" href="Stlc.html#18192" class="InductiveConstructor Operator"
      >if_then_else_</a
      ><a name="18205"
      > </a
      ><a name="18206" class="Symbol"
      >:</a
      ><a name="18207"
      > </a
      ><a name="18208" class="Symbol"
      >forall</a
      ><a name="18214"
      > </a
      ><a name="18215" class="Symbol"
      >{</a
      ><a name="18216" href="Stlc.html#18216" class="Bound"
      >&#915;</a
      ><a name="18217" class="Symbol"
      >}</a
      ><a name="18218"
      > </a
      ><a name="18219" class="Symbol"
      >{</a
      ><a name="18220" href="Stlc.html#18220" class="Bound"
      >s</a
      ><a name="18221" class="Symbol"
      >}</a
      ><a name="18222"
      > </a
      ><a name="18223" class="Symbol"
      >{</a
      ><a name="18224" href="Stlc.html#18224" class="Bound"
      >t</a
      ><a name="18225" class="Symbol"
      >}</a
      ><a name="18226"
      > </a
      ><a name="18227" class="Symbol"
      >{</a
      ><a name="18228" href="Stlc.html#18228" class="Bound"
      >u</a
      ><a name="18229" class="Symbol"
      >}</a
      ><a name="18230"
      > </a
      ><a name="18231" class="Symbol"
      >{</a
      ><a name="18232" href="Stlc.html#18232" class="Bound"
      >A</a
      ><a name="18233" class="Symbol"
      >}</a
      ><a name="18234"
      >
                </a
      ><a name="18251" class="Symbol"
      >&#8594;</a
      ><a name="18252"
      > </a
      ><a name="18253" href="Stlc.html#18216" class="Bound"
      >&#915;</a
      ><a name="18254"
      > </a
      ><a name="18255" href="Stlc.html#17662" class="Datatype Operator"
      >&#8866;</a
      ><a name="18256"
      > </a
      ><a name="18257" href="Stlc.html#18220" class="Bound"
      >s</a
      ><a name="18258"
      > </a
      ><a name="18259" href="Stlc.html#17662" class="Datatype Operator"
      >&#8758;</a
      ><a name="18260"
      > </a
      ><a name="18261" href="Stlc.html#5036" class="InductiveConstructor"
      >bool</a
      ><a name="18265"
      >
                </a
      ><a name="18282" class="Symbol"
      >&#8594;</a
      ><a name="18283"
      > </a
      ><a name="18284" href="Stlc.html#18216" class="Bound"
      >&#915;</a
      ><a name="18285"
      > </a
      ><a name="18286" href="Stlc.html#17662" class="Datatype Operator"
      >&#8866;</a
      ><a name="18287"
      > </a
      ><a name="18288" href="Stlc.html#18224" class="Bound"
      >t</a
      ><a name="18289"
      > </a
      ><a name="18290" href="Stlc.html#17662" class="Datatype Operator"
      >&#8758;</a
      ><a name="18291"
      > </a
      ><a name="18292" href="Stlc.html#18232" class="Bound"
      >A</a
      ><a name="18293"
      >
                </a
      ><a name="18310" class="Symbol"
      >&#8594;</a
      ><a name="18311"
      > </a
      ><a name="18312" href="Stlc.html#18216" class="Bound"
      >&#915;</a
      ><a name="18313"
      > </a
      ><a name="18314" href="Stlc.html#17662" class="Datatype Operator"
      >&#8866;</a
      ><a name="18315"
      > </a
      ><a name="18316" href="Stlc.html#18228" class="Bound"
      >u</a
      ><a name="18317"
      > </a
      ><a name="18318" href="Stlc.html#17662" class="Datatype Operator"
      >&#8758;</a
      ><a name="18319"
      > </a
      ><a name="18320" href="Stlc.html#18232" class="Bound"
      >A</a
      ><a name="18321"
      >
                </a
      ><a name="18338" class="Symbol"
      >&#8594;</a
      ><a name="18339"
      > </a
      ><a name="18340" href="Stlc.html#18216" class="Bound"
      >&#915;</a
      ><a name="18341"
      > </a
      ><a name="18342" href="Stlc.html#17662" class="Datatype Operator"
      >&#8866;</a
      ><a name="18343"
      > </a
      ><a name="18344" href="Stlc.html#5568" class="InductiveConstructor Operator"
      >if</a
      ><a name="18346"
      > </a
      ><a name="18347" href="Stlc.html#18220" class="Bound"
      >s</a
      ><a name="18348"
      > </a
      ><a name="18349" href="Stlc.html#5568" class="InductiveConstructor Operator"
      >then</a
      ><a name="18353"
      > </a
      ><a name="18354" href="Stlc.html#18224" class="Bound"
      >t</a
      ><a name="18355"
      > </a
      ><a name="18356" href="Stlc.html#5568" class="InductiveConstructor Operator"
      >else</a
      ><a name="18360"
      > </a
      ><a name="18361" href="Stlc.html#18228" class="Bound"
      >u</a
      ><a name="18362"
      > </a
      ><a name="18363" href="Stlc.html#17662" class="Datatype Operator"
      >&#8758;</a
      ><a name="18364"
      > </a
      ><a name="18365" href="Stlc.html#18232" class="Bound"
      >A</a
      ><a name="18366"
      >

</a
      ><a name="18368" class="Keyword"
      >infix</a
      ><a name="18373"
      > </a
      ><a name="18374" class="Number"
      >1</a
      >
{% endraw %}</pre>

### Examples

<pre class="Agda">{% raw %}
<a name="18421" href="Stlc.html#18421" class="Function"
      >typing-example1</a
      ><a name="18436"
      > </a
      ><a name="18437" class="Symbol"
      >:</a
      ><a name="18438"
      > </a
      ><a name="18439" href="Stlc.html#16711" class="Function"
      >&#8709;</a
      ><a name="18440"
      > </a
      ><a name="18441" href="Stlc.html#17662" class="Datatype Operator"
      >&#8866;</a
      ><a name="18442"
      > </a
      ><a name="18443" href="Stlc.html#6185" class="Function"
      >idB</a
      ><a name="18446"
      > </a
      ><a name="18447" href="Stlc.html#17662" class="Datatype Operator"
      >&#8758;</a
      ><a name="18448"
      > </a
      ><a name="18449" href="Stlc.html#5036" class="InductiveConstructor"
      >bool</a
      ><a name="18453"
      > </a
      ><a name="18454" href="Stlc.html#5050" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="18455"
      > </a
      ><a name="18456" href="Stlc.html#5036" class="InductiveConstructor"
      >bool</a
      ><a name="18460"
      >
</a
      ><a name="18461" href="Stlc.html#18421" class="Function"
      >typing-example1</a
      ><a name="18476"
      > </a
      ><a name="18477" class="Symbol"
      >=</a
      ><a name="18478"
      > </a
      ><a name="18479" href="Stlc.html#17804" class="InductiveConstructor"
      >abs</a
      ><a name="18482"
      > </a
      ><a name="18483" class="Symbol"
      >(</a
      ><a name="18484" href="Stlc.html#17706" class="InductiveConstructor"
      >var</a
      ><a name="18487"
      > </a
      ><a name="18488" href="Stlc.html#5972" class="Function"
      >x</a
      ><a name="18489"
      > </a
      ><a name="18490" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="18494" class="Symbol"
      >)</a
      >
{% endraw %}</pre>

Another example:

    empty ⊢ λx:A. λy:A⇒A. y (y x)) ∶ A⇒(A⇒A)⇒A

<pre class="Agda">{% raw %}
<a name="18587" href="Stlc.html#18587" class="Function"
      >typing-example2</a
      ><a name="18602"
      > </a
      ><a name="18603" class="Symbol"
      >:</a
      ><a name="18604"
      > </a
      ><a name="18605" href="Stlc.html#16711" class="Function"
      >&#8709;</a
      ><a name="18606"
      > </a
      ><a name="18607" href="Stlc.html#17662" class="Datatype Operator"
      >&#8866;</a
      ><a name="18608"
      >
  </a
      ><a name="18611" class="Symbol"
      >(</a
      ><a name="18612" href="Stlc.html#5504" class="InductiveConstructor"
      >abs</a
      ><a name="18615"
      > </a
      ><a name="18616" href="Stlc.html#5972" class="Function"
      >x</a
      ><a name="18617"
      > </a
      ><a name="18618" href="Stlc.html#5036" class="InductiveConstructor"
      >bool</a
      ><a name="18622"
      >
    </a
      ><a name="18627" class="Symbol"
      >(</a
      ><a name="18628" href="Stlc.html#5504" class="InductiveConstructor"
      >abs</a
      ><a name="18631"
      > </a
      ><a name="18632" href="Stlc.html#5981" class="Function"
      >y</a
      ><a name="18633"
      > </a
      ><a name="18634" class="Symbol"
      >(</a
      ><a name="18635" href="Stlc.html#5036" class="InductiveConstructor"
      >bool</a
      ><a name="18639"
      > </a
      ><a name="18640" href="Stlc.html#5050" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="18641"
      > </a
      ><a name="18642" href="Stlc.html#5036" class="InductiveConstructor"
      >bool</a
      ><a name="18646" class="Symbol"
      >)</a
      ><a name="18647"
      >
      </a
      ><a name="18654" class="Symbol"
      >(</a
      ><a name="18655" href="Stlc.html#5475" class="InductiveConstructor"
      >app</a
      ><a name="18658"
      > </a
      ><a name="18659" class="Symbol"
      >(</a
      ><a name="18660" href="Stlc.html#5455" class="InductiveConstructor"
      >var</a
      ><a name="18663"
      > </a
      ><a name="18664" href="Stlc.html#5981" class="Function"
      >y</a
      ><a name="18665" class="Symbol"
      >)</a
      ><a name="18666"
      >
        </a
      ><a name="18675" class="Symbol"
      >(</a
      ><a name="18676" href="Stlc.html#5475" class="InductiveConstructor"
      >app</a
      ><a name="18679"
      > </a
      ><a name="18680" class="Symbol"
      >(</a
      ><a name="18681" href="Stlc.html#5455" class="InductiveConstructor"
      >var</a
      ><a name="18684"
      > </a
      ><a name="18685" href="Stlc.html#5981" class="Function"
      >y</a
      ><a name="18686" class="Symbol"
      >)</a
      ><a name="18687"
      > </a
      ><a name="18688" class="Symbol"
      >(</a
      ><a name="18689" href="Stlc.html#5455" class="InductiveConstructor"
      >var</a
      ><a name="18692"
      > </a
      ><a name="18693" href="Stlc.html#5972" class="Function"
      >x</a
      ><a name="18694" class="Symbol"
      >)))))</a
      ><a name="18699"
      > </a
      ><a name="18700" href="Stlc.html#17662" class="Datatype Operator"
      >&#8758;</a
      ><a name="18701"
      >
  </a
      ><a name="18704" class="Symbol"
      >(</a
      ><a name="18705" href="Stlc.html#5036" class="InductiveConstructor"
      >bool</a
      ><a name="18709"
      > </a
      ><a name="18710" href="Stlc.html#5050" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="18711"
      > </a
      ><a name="18712" class="Symbol"
      >(</a
      ><a name="18713" href="Stlc.html#5036" class="InductiveConstructor"
      >bool</a
      ><a name="18717"
      > </a
      ><a name="18718" href="Stlc.html#5050" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="18719"
      > </a
      ><a name="18720" href="Stlc.html#5036" class="InductiveConstructor"
      >bool</a
      ><a name="18724" class="Symbol"
      >)</a
      ><a name="18725"
      > </a
      ><a name="18726" href="Stlc.html#5050" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="18727"
      > </a
      ><a name="18728" href="Stlc.html#5036" class="InductiveConstructor"
      >bool</a
      ><a name="18732" class="Symbol"
      >)</a
      ><a name="18733"
      >
</a
      ><a name="18734" href="Stlc.html#18587" class="Function"
      >typing-example2</a
      ><a name="18749"
      > </a
      ><a name="18750" class="Symbol"
      >=</a
      ><a name="18751"
      >
  </a
      ><a name="18754" class="Symbol"
      >(</a
      ><a name="18755" href="Stlc.html#17804" class="InductiveConstructor"
      >abs</a
      ><a name="18758"
      >
    </a
      ><a name="18763" class="Symbol"
      >(</a
      ><a name="18764" href="Stlc.html#17804" class="InductiveConstructor"
      >abs</a
      ><a name="18767"
      >
      </a
      ><a name="18774" class="Symbol"
      >(</a
      ><a name="18775" href="Stlc.html#17925" class="InductiveConstructor"
      >app</a
      ><a name="18778"
      > </a
      ><a name="18779" class="Symbol"
      >(</a
      ><a name="18780" href="Stlc.html#17706" class="InductiveConstructor"
      >var</a
      ><a name="18783"
      > </a
      ><a name="18784" href="Stlc.html#5981" class="Function"
      >y</a
      ><a name="18785"
      > </a
      ><a name="18786" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="18790" class="Symbol"
      >)</a
      ><a name="18791"
      >
        </a
      ><a name="18800" class="Symbol"
      >(</a
      ><a name="18801" href="Stlc.html#17925" class="InductiveConstructor"
      >app</a
      ><a name="18804"
      > </a
      ><a name="18805" class="Symbol"
      >(</a
      ><a name="18806" href="Stlc.html#17706" class="InductiveConstructor"
      >var</a
      ><a name="18809"
      > </a
      ><a name="18810" href="Stlc.html#5981" class="Function"
      >y</a
      ><a name="18811"
      > </a
      ><a name="18812" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="18816" class="Symbol"
      >)</a
      ><a name="18817"
      > </a
      ><a name="18818" class="Symbol"
      >(</a
      ><a name="18819" href="Stlc.html#17706" class="InductiveConstructor"
      >var</a
      ><a name="18822"
      > </a
      ><a name="18823" href="Stlc.html#5972" class="Function"
      >x</a
      ><a name="18824"
      > </a
      ><a name="18825" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="18829" class="Symbol"
      >)</a
      ><a name="18830"
      > </a
      ><a name="18831" class="Symbol"
      >))))</a
      >
{% endraw %}</pre>

#### Exercise: 2 stars (typing_example_3)
Formally prove the following typing derivation holds:

    empty ⊢ λx:bool⇒B. λy:bool⇒bool. \z:bool. y (x z) ∶ T.

<pre class="Agda">{% raw %}
<a name="19018" href="Stlc.html#19018" class="Function"
      >typing-example3</a
      ><a name="19033"
      > </a
      ><a name="19034" class="Symbol"
      >:</a
      ><a name="19035"
      > </a
      ><a name="19036" href="https://agda.github.io/agda-stdlib/Data.Product.html#823" class="Function"
      >&#8707;</a
      ><a name="19037"
      > </a
      ><a name="19038" class="Symbol"
      >&#955;</a
      ><a name="19039"
      > </a
      ><a name="19040" href="Stlc.html#19040" class="Bound"
      >A</a
      ><a name="19041"
      > </a
      ><a name="19042" class="Symbol"
      >&#8594;</a
      ><a name="19043"
      > </a
      ><a name="19044" href="Stlc.html#16711" class="Function"
      >&#8709;</a
      ><a name="19045"
      > </a
      ><a name="19046" href="Stlc.html#17662" class="Datatype Operator"
      >&#8866;</a
      ><a name="19047"
      >
  </a
      ><a name="19050" class="Symbol"
      >(</a
      ><a name="19051" href="Stlc.html#5504" class="InductiveConstructor"
      >abs</a
      ><a name="19054"
      > </a
      ><a name="19055" href="Stlc.html#5972" class="Function"
      >x</a
      ><a name="19056"
      > </a
      ><a name="19057" class="Symbol"
      >(</a
      ><a name="19058" href="Stlc.html#5036" class="InductiveConstructor"
      >bool</a
      ><a name="19062"
      > </a
      ><a name="19063" href="Stlc.html#5050" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="19064"
      > </a
      ><a name="19065" href="Stlc.html#5036" class="InductiveConstructor"
      >bool</a
      ><a name="19069" class="Symbol"
      >)</a
      ><a name="19070"
      >
    </a
      ><a name="19075" class="Symbol"
      >(</a
      ><a name="19076" href="Stlc.html#5504" class="InductiveConstructor"
      >abs</a
      ><a name="19079"
      > </a
      ><a name="19080" href="Stlc.html#5981" class="Function"
      >y</a
      ><a name="19081"
      > </a
      ><a name="19082" class="Symbol"
      >(</a
      ><a name="19083" href="Stlc.html#5036" class="InductiveConstructor"
      >bool</a
      ><a name="19087"
      > </a
      ><a name="19088" href="Stlc.html#5050" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="19089"
      > </a
      ><a name="19090" href="Stlc.html#5036" class="InductiveConstructor"
      >bool</a
      ><a name="19094" class="Symbol"
      >)</a
      ><a name="19095"
      >
      </a
      ><a name="19102" class="Symbol"
      >(</a
      ><a name="19103" href="Stlc.html#5504" class="InductiveConstructor"
      >abs</a
      ><a name="19106"
      > </a
      ><a name="19107" href="Stlc.html#5990" class="Function"
      >z</a
      ><a name="19108"
      > </a
      ><a name="19109" href="Stlc.html#5036" class="InductiveConstructor"
      >bool</a
      ><a name="19113"
      >
        </a
      ><a name="19122" class="Symbol"
      >(</a
      ><a name="19123" href="Stlc.html#5475" class="InductiveConstructor"
      >app</a
      ><a name="19126"
      > </a
      ><a name="19127" class="Symbol"
      >(</a
      ><a name="19128" href="Stlc.html#5455" class="InductiveConstructor"
      >var</a
      ><a name="19131"
      > </a
      ><a name="19132" href="Stlc.html#5981" class="Function"
      >y</a
      ><a name="19133" class="Symbol"
      >)</a
      ><a name="19134"
      > </a
      ><a name="19135" class="Symbol"
      >(</a
      ><a name="19136" href="Stlc.html#5475" class="InductiveConstructor"
      >app</a
      ><a name="19139"
      > </a
      ><a name="19140" class="Symbol"
      >(</a
      ><a name="19141" href="Stlc.html#5455" class="InductiveConstructor"
      >var</a
      ><a name="19144"
      > </a
      ><a name="19145" href="Stlc.html#5972" class="Function"
      >x</a
      ><a name="19146" class="Symbol"
      >)</a
      ><a name="19147"
      > </a
      ><a name="19148" class="Symbol"
      >(</a
      ><a name="19149" href="Stlc.html#5455" class="InductiveConstructor"
      >var</a
      ><a name="19152"
      > </a
      ><a name="19153" href="Stlc.html#5990" class="Function"
      >z</a
      ><a name="19154" class="Symbol"
      >))))))</a
      ><a name="19160"
      > </a
      ><a name="19161" href="Stlc.html#17662" class="Datatype Operator"
      >&#8758;</a
      ><a name="19162"
      > </a
      ><a name="19163" href="Stlc.html#19040" class="Bound"
      >A</a
      ><a name="19164"
      >
</a
      ><a name="19165" href="Stlc.html#19018" class="Function"
      >typing-example3</a
      ><a name="19180"
      > </a
      ><a name="19181" class="Symbol"
      >=</a
      ><a name="19182"
      > </a
      ><a name="19183" class="Symbol"
      >{!!}</a
      ><a name="19187"
      > </a
      ><a name="19188" class="Comment"
      >-- FILL IN HERE</a
      >
{% endraw %}</pre>

We can also show that terms are _not_ typable.  For example, let's
formally check that there is no typing derivation assigning a type
to the term `λx:bool. λy:bool, x y` -- i.e.,

    ~ exists T,
    empty ⊢ λx:bool. λy:bool, x y : T.

<pre class="Agda">{% raw %}
<a name="19465" href="Stlc.html#19465" class="Function"
      >typing-nonexample1</a
      ><a name="19483"
      > </a
      ><a name="19484" class="Symbol"
      >:</a
      ><a name="19485"
      > </a
      ><a name="19486" href="https://agda.github.io/agda-stdlib/Data.Product.html#884" class="Function"
      >&#8708;</a
      ><a name="19487"
      > </a
      ><a name="19488" class="Symbol"
      >&#955;</a
      ><a name="19489"
      > </a
      ><a name="19490" href="Stlc.html#19490" class="Bound"
      >A</a
      ><a name="19491"
      > </a
      ><a name="19492" class="Symbol"
      >&#8594;</a
      ><a name="19493"
      > </a
      ><a name="19494" href="Stlc.html#16711" class="Function"
      >&#8709;</a
      ><a name="19495"
      > </a
      ><a name="19496" href="Stlc.html#17662" class="Datatype Operator"
      >&#8866;</a
      ><a name="19497"
      >
  </a
      ><a name="19500" class="Symbol"
      >(</a
      ><a name="19501" href="Stlc.html#5504" class="InductiveConstructor"
      >abs</a
      ><a name="19504"
      > </a
      ><a name="19505" href="Stlc.html#5972" class="Function"
      >x</a
      ><a name="19506"
      > </a
      ><a name="19507" href="Stlc.html#5036" class="InductiveConstructor"
      >bool</a
      ><a name="19511"
      >
    </a
      ><a name="19516" class="Symbol"
      >(</a
      ><a name="19517" href="Stlc.html#5504" class="InductiveConstructor"
      >abs</a
      ><a name="19520"
      > </a
      ><a name="19521" href="Stlc.html#5981" class="Function"
      >y</a
      ><a name="19522"
      > </a
      ><a name="19523" href="Stlc.html#5036" class="InductiveConstructor"
      >bool</a
      ><a name="19527"
      >
      </a
      ><a name="19534" class="Symbol"
      >(</a
      ><a name="19535" href="Stlc.html#5475" class="InductiveConstructor"
      >app</a
      ><a name="19538"
      > </a
      ><a name="19539" class="Symbol"
      >(</a
      ><a name="19540" href="Stlc.html#5455" class="InductiveConstructor"
      >var</a
      ><a name="19543"
      > </a
      ><a name="19544" href="Stlc.html#5972" class="Function"
      >x</a
      ><a name="19545" class="Symbol"
      >)</a
      ><a name="19546"
      > </a
      ><a name="19547" class="Symbol"
      >(</a
      ><a name="19548" href="Stlc.html#5455" class="InductiveConstructor"
      >var</a
      ><a name="19551"
      > </a
      ><a name="19552" href="Stlc.html#5981" class="Function"
      >y</a
      ><a name="19553" class="Symbol"
      >))))</a
      ><a name="19557"
      > </a
      ><a name="19558" href="Stlc.html#17662" class="Datatype Operator"
      >&#8758;</a
      ><a name="19559"
      > </a
      ><a name="19560" href="Stlc.html#19490" class="Bound"
      >A</a
      ><a name="19561"
      >
</a
      ><a name="19562" href="Stlc.html#19465" class="Function"
      >typing-nonexample1</a
      ><a name="19580"
      > </a
      ><a name="19581" class="Symbol"
      >=</a
      ><a name="19582"
      > </a
      ><a name="19583" class="Symbol"
      >{!!}</a
      ><a name="19587"
      > </a
      ><a name="19588" class="Comment"
      >-- FILL IN HERE</a
      >
{% endraw %}</pre>

#### Exercise: 3 stars, optional (typing_nonexample_3)
Another nonexample:

    ~ (exists S, exists T,
    empty ⊢ λx:S. x x ∶ T).

<pre class="Agda">{% raw %}
<a name="19761" href="Stlc.html#19761" class="Function"
      >typing-nonexample2</a
      ><a name="19779"
      > </a
      ><a name="19780" class="Symbol"
      >:</a
      ><a name="19781"
      > </a
      ><a name="19782" href="https://agda.github.io/agda-stdlib/Data.Product.html#884" class="Function"
      >&#8708;</a
      ><a name="19783"
      > </a
      ><a name="19784" class="Symbol"
      >&#955;</a
      ><a name="19785"
      > </a
      ><a name="19786" href="Stlc.html#19786" class="Bound"
      >A</a
      ><a name="19787"
      > </a
      ><a name="19788" class="Symbol"
      >&#8594;</a
      ><a name="19789"
      > </a
      ><a name="19790" href="https://agda.github.io/agda-stdlib/Data.Product.html#823" class="Function"
      >&#8707;</a
      ><a name="19791"
      > </a
      ><a name="19792" class="Symbol"
      >&#955;</a
      ><a name="19793"
      > </a
      ><a name="19794" href="Stlc.html#19794" class="Bound"
      >B</a
      ><a name="19795"
      > </a
      ><a name="19796" class="Symbol"
      >&#8594;</a
      ><a name="19797"
      > </a
      ><a name="19798" href="Stlc.html#16711" class="Function"
      >&#8709;</a
      ><a name="19799"
      > </a
      ><a name="19800" href="Stlc.html#17662" class="Datatype Operator"
      >&#8866;</a
      ><a name="19801"
      >
  </a
      ><a name="19804" class="Symbol"
      >(</a
      ><a name="19805" href="Stlc.html#5504" class="InductiveConstructor"
      >abs</a
      ><a name="19808"
      > </a
      ><a name="19809" href="Stlc.html#5972" class="Function"
      >x</a
      ><a name="19810"
      > </a
      ><a name="19811" href="Stlc.html#19794" class="Bound"
      >B</a
      ><a name="19812"
      > </a
      ><a name="19813" class="Symbol"
      >(</a
      ><a name="19814" href="Stlc.html#5475" class="InductiveConstructor"
      >app</a
      ><a name="19817"
      > </a
      ><a name="19818" class="Symbol"
      >(</a
      ><a name="19819" href="Stlc.html#5455" class="InductiveConstructor"
      >var</a
      ><a name="19822"
      > </a
      ><a name="19823" href="Stlc.html#5972" class="Function"
      >x</a
      ><a name="19824" class="Symbol"
      >)</a
      ><a name="19825"
      > </a
      ><a name="19826" class="Symbol"
      >(</a
      ><a name="19827" href="Stlc.html#5455" class="InductiveConstructor"
      >var</a
      ><a name="19830"
      > </a
      ><a name="19831" href="Stlc.html#5972" class="Function"
      >x</a
      ><a name="19832" class="Symbol"
      >)))</a
      ><a name="19835"
      > </a
      ><a name="19836" href="Stlc.html#17662" class="Datatype Operator"
      >&#8758;</a
      ><a name="19837"
      > </a
      ><a name="19838" href="Stlc.html#19786" class="Bound"
      >A</a
      ><a name="19839"
      >
</a
      ><a name="19840" href="Stlc.html#19761" class="Function"
      >typing-nonexample2</a
      ><a name="19858"
      > </a
      ><a name="19859" class="Symbol"
      >=</a
      ><a name="19860"
      > </a
      ><a name="19861" class="Symbol"
      >{!!}</a
      ><a name="19865"
      > </a
      ><a name="19866" class="Comment"
      >-- FILL IN HERE</a
      >
{% endraw %}</pre>
