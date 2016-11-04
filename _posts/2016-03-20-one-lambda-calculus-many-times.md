---
title         : One λ-calculus, many times...
date          : 2016-03-20 12:00:00
categories    : [compsci]
tags          : [agda]
hide-implicit : true
extra-script : [agda-extra-script.html]
extra-style  : [agda-extra-style.html]
---

Previously, I mentioned that one of the most common posts on Agda blogs
is implementing the simply-typed λ-calculus. [Gergő Érdi][noshortcuts]
even goes as far as to call it the FizzBuzz of dependently-typed
programming, and rightfully so: If you do a quick search, you'll find
dozens of examples.

In *[Dependently-Typed Programming with Agda][agdatutorial]*, Ulf Norell
implements a type checker the simply-typed λ-calculus;
[Francesco Mazzoli][byexample] more or less follows Ulf, but extends
his λ-calculus with a primitive operator for addition; and,
[Gergő Érdi][noshortcuts] extends Ulf's approach with a checker for
scope and binding.

I figured it would be more fun if, instead of rewriting the type
checker example, I would do something a little bit different. So for
my λ-calculus post, I'll have a look at kinds of different ways of
implementing the simply-typed λ-calculus. Today, natural deduction and
the sequent calculus.

<div class="hidden">
<!--{% raw %}--><pre class="Agda">
<a name="1214" class="Keyword"
      >module</a
      ><a name="1220"
      > </a
      ><a name="1221" href="2016-03-20-one-lambda-calculus-many-times.html#1" class="Module"
      >2016-03-20-one-lambda-calculus-many-times</a
      ><a name="1262"
      > </a
      ><a name="1263" class="Keyword"
      >where</a
      >
</pre><!--{% endraw %}-->
</div>

### Natural Deduction and the λ-Calculus

We'll start our discussion with the syntax of types. Usually, types
are defined inductively over some set of atomic types. We don't really
care what these atomic types will be, so we might as well abstract
over them:

<!--{% raw %}--><pre class="Agda">
<a name="1561" class="Keyword"
      >module</a
      ><a name="1567"
      > </a
      ><a name="1568" href="2016-03-20-one-lambda-calculus-many-times.html#1568" class="Module"
      >Syntax</a
      ><a name="1574"
      > </a
      ><a name="1575" class="Symbol"
      >(</a
      ><a name="1576" href="2016-03-20-one-lambda-calculus-many-times.html#1576" class="Bound"
      >Atom</a
      ><a name="1580"
      > </a
      ><a name="1581" class="Symbol"
      >:</a
      ><a name="1582"
      > </a
      ><a name="1583" class="PrimitiveType"
      >Set</a
      ><a name="1586" class="Symbol"
      >)</a
      ><a name="1587"
      > </a
      ><a name="1588" class="Keyword"
      >where</a
      >
</pre><!--{% endraw %}-->

But, if it makes you feel better, we can pretend that they'll be some
like this:

<pre class="Agda Spec">  <a name="511" class="Keyword">data</a><a name="515"> </a><a name="516" href="#289" class="Module">Atom</a><a name="521"> </a><a name="522" class="Symbol">:</a><a name="523"> </a><a name="524" class="PrimitiveType">Set</a><a name="527"> </a><a name="528" class="Keyword">where</a><a name="533"><br />    </a><a name="538" href="#538" class="InductiveConstructor">Int</a><a name="542">    </a><a name="543" class="Symbol">:</a><a name="544"> </a><a name="545" href="#516" class="Datatype">Atom</a><a name="550"><br />    </a><a name="555" href="#555" class="InductiveConstructor">String</a><a name="562"> </a><a name="563" class="Symbol">:</a><a name="564"> </a><a name="565" href="#516" class="Datatype">Atom</a></pre>

Next, we defined our types. Since we're talking about minimal
propositional logic, a type is either atomic (marked by <a class="Agda
InductiveConstructor">El</a>) or an implication:

<!--{% raw %}--><pre class="Agda">
  <a name="2630" class="Keyword"
      >infixr</a
      ><a name="2636"
      > </a
      ><a name="2637" class="Number"
      >6</a
      ><a name="2638"
      > _&#8658;_

  </a
      ><a name="2646" class="Keyword"
      >data</a
      ><a name="2650"
      > </a
      ><a name="2651" href="2016-03-20-one-lambda-calculus-many-times.html#2651" class="Datatype"
      >Type</a
      ><a name="2655"
      > </a
      ><a name="2656" class="Symbol"
      >:</a
      ><a name="2657"
      > </a
      ><a name="2658" class="PrimitiveType"
      >Set</a
      ><a name="2661"
      > </a
      ><a name="2662" class="Keyword"
      >where</a
      ><a name="2667"
      >
    </a
      ><a name="2672" href="2016-03-20-one-lambda-calculus-many-times.html#2672" class="InductiveConstructor"
      >El</a
      ><a name="2674"
      >  </a
      ><a name="2676" class="Symbol"
      >:</a
      ><a name="2677"
      > </a
      ><a name="2678" href="2016-03-20-one-lambda-calculus-many-times.html#1576" class="Bound"
      >Atom</a
      ><a name="2682"
      > </a
      ><a name="2683" class="Symbol"
      >&#8594;</a
      ><a name="2684"
      > </a
      ><a name="2685" href="2016-03-20-one-lambda-calculus-many-times.html#2651" class="Datatype"
      >Type</a
      ><a name="2689"
      >
    </a
      ><a name="2694" href="2016-03-20-one-lambda-calculus-many-times.html#2694" class="InductiveConstructor Operator"
      >_&#8658;_</a
      ><a name="2697"
      > </a
      ><a name="2698" class="Symbol"
      >:</a
      ><a name="2699"
      > </a
      ><a name="2700" href="2016-03-20-one-lambda-calculus-many-times.html#2651" class="Datatype"
      >Type</a
      ><a name="2704"
      > </a
      ><a name="2705" class="Symbol"
      >&#8594;</a
      ><a name="2706"
      > </a
      ><a name="2707" href="2016-03-20-one-lambda-calculus-many-times.html#2651" class="Datatype"
      >Type</a
      ><a name="2711"
      > </a
      ><a name="2712" class="Symbol"
      >&#8594;</a
      ><a name="2713"
      > </a
      ><a name="2714" href="2016-03-20-one-lambda-calculus-many-times.html#2651" class="Datatype"
      >Type</a
      >
</pre><!--{% endraw %}-->

Now we'll define sequents. Even though this is just a tiny piece of
syntax, we should put some thought behind it...

Traditionally, the antecedent of some sequent would be a *set* of
formulas. However, we're looking at this from the perspective of
λ-calculus, and there may well be a difference between two terms of
the same type. This is usually solved by changing the antecedent to a
set of *type assignments*, which means $$x : A$$ and $$y : A$$ are now
distinct. From the logical perspective, this is the same as using a
*bag* or *multiset* antecedent. If we were doing mathematics, we'd be
done, but implementation-wise a bag is actually a rather complex
beast. For this reason, we'll use a *list*:[^imports]

<div class="hidden">
<!--{% raw %}--><pre class="Agda">
  <a name="3482" class="Keyword"
      >open</a
      ><a name="3486"
      > </a
      ><a name="3487" class="Keyword"
      >import</a
      ><a name="3493"
      > </a
      ><a name="3494" href="https://agda.github.io/agda-stdlib/Data.Nat.html#1" class="Module"
      >Data.Nat</a
      ><a name="3502"
      >             </a
      ><a name="3515" class="Keyword"
      >using</a
      ><a name="3520"
      > </a
      ><a name="3521" class="Symbol"
      >(</a
      ><a name="3522" href="Agda.Builtin.Nat.html#69" class="Datatype"
      >&#8469;</a
      ><a name="3523" class="Symbol"
      >;</a
      ><a name="3524"
      > </a
      ><a name="3525" href="Agda.Builtin.Nat.html#100" class="InductiveConstructor"
      >suc</a
      ><a name="3528" class="Symbol"
      >;</a
      ><a name="3529"
      > </a
      ><a name="3530" href="Agda.Builtin.Nat.html#87" class="InductiveConstructor"
      >zero</a
      ><a name="3534" class="Symbol"
      >)</a
      ><a name="3535"
      >
  </a
      ><a name="3538" class="Keyword"
      >open</a
      ><a name="3542"
      > </a
      ><a name="3543" class="Keyword"
      >import</a
      ><a name="3549"
      > </a
      ><a name="3550" href="https://agda.github.io/agda-stdlib/Data.Fin.html#1" class="Module"
      >Data.Fin</a
      ><a name="3558"
      >             </a
      ><a name="3571" class="Keyword"
      >using</a
      ><a name="3576"
      > </a
      ><a name="3577" class="Symbol"
      >(</a
      ><a name="3578" href="https://agda.github.io/agda-stdlib/Data.Fin.html#842" class="Datatype"
      >Fin</a
      ><a name="3581" class="Symbol"
      >;</a
      ><a name="3582"
      > </a
      ><a name="3583" href="https://agda.github.io/agda-stdlib/Data.Fin.html#895" class="InductiveConstructor"
      >suc</a
      ><a name="3586" class="Symbol"
      >;</a
      ><a name="3587"
      > </a
      ><a name="3588" href="https://agda.github.io/agda-stdlib/Data.Fin.html#864" class="InductiveConstructor"
      >zero</a
      ><a name="3592" class="Symbol"
      >)</a
      ><a name="3593"
      >
  </a
      ><a name="3596" class="Keyword"
      >open</a
      ><a name="3600"
      > </a
      ><a name="3601" class="Keyword"
      >import</a
      ><a name="3607"
      > </a
      ><a name="3608" href="https://agda.github.io/agda-stdlib/Data.List.html#1" class="Module"
      >Data.List</a
      ><a name="3617"
      >            </a
      ><a name="3629" class="Keyword"
      >using</a
      ><a name="3634"
      > </a
      ><a name="3635" class="Symbol"
      >(</a
      ><a name="3636" href="Agda.Builtin.List.html#52" class="Datatype"
      >List</a
      ><a name="3640" class="Symbol"
      >;</a
      ><a name="3641"
      > </a
      ><a name="3642" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >_&#8759;_</a
      ><a name="3645" class="Symbol"
      >;</a
      ><a name="3646"
      > </a
      ><a name="3647" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#5519" class="InductiveConstructor"
      >[]</a
      ><a name="3649" class="Symbol"
      >;</a
      ><a name="3650"
      > </a
      ><a name="3651" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >_++_</a
      ><a name="3655" class="Symbol"
      >)</a
      ><a name="3656"
      >
  </a
      ><a name="3659" class="Keyword"
      >open</a
      ><a name="3663"
      > </a
      ><a name="3664" class="Keyword"
      >import</a
      ><a name="3670"
      > </a
      ><a name="3671" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1" class="Module"
      >Data.List.Any</a
      ><a name="3684"
      >        </a
      ><a name="3692" class="Keyword"
      >using</a
      ><a name="3697"
      > </a
      ><a name="3698" class="Symbol"
      >(</a
      ><a name="3699" class="Keyword"
      >module</a
      ><a name="3705"
      > </a
      ><a name="3706" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#250" class="Module"
      >Membership</a
      ><a name="3716" class="Symbol"
      >;</a
      ><a name="3717"
      > </a
      ><a name="3718" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="3722" class="Symbol"
      >;</a
      ><a name="3723"
      > </a
      ><a name="3724" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="3729" class="Symbol"
      >)</a
      ><a name="3730"
      >
  </a
      ><a name="3733" class="Keyword"
      >open</a
      ><a name="3737"
      > </a
      ><a name="3738" class="Keyword"
      >import</a
      ><a name="3744"
      > </a
      ><a name="3745" href="https://agda.github.io/agda-stdlib/Function.Equivalence.html#1" class="Module"
      >Function.Equivalence</a
      ><a name="3765"
      > </a
      ><a name="3766" class="Keyword"
      >using</a
      ><a name="3771"
      > </a
      ><a name="3772" class="Symbol"
      >(</a
      ><a name="3773" href="https://agda.github.io/agda-stdlib/Function.Equivalence.html#711" class="Function Operator"
      >_&#8660;_</a
      ><a name="3776" class="Symbol"
      >;</a
      ><a name="3777"
      > </a
      ><a name="3778" href="https://agda.github.io/agda-stdlib/Function.Equivalence.html#2131" class="Function"
      >id</a
      ><a name="3780" class="Symbol"
      >;</a
      ><a name="3781"
      > </a
      ><a name="3782" href="https://agda.github.io/agda-stdlib/Function.Equivalence.html#1070" class="Function"
      >map</a
      ><a name="3785" class="Symbol"
      >;</a
      ><a name="3786"
      > </a
      ><a name="3787" href="https://agda.github.io/agda-stdlib/Function.Equivalence.html#804" class="Function"
      >equivalence</a
      ><a name="3798" class="Symbol"
      >)</a
      ><a name="3799"
      >
  </a
      ><a name="3802" class="Keyword"
      >open</a
      ><a name="3806"
      > </a
      ><a name="3807" class="Keyword"
      >import</a
      ><a name="3813"
      > </a
      ><a name="3814" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.html#1" class="Module"
      >Relation.Binary.PropositionalEquality</a
      ><a name="3851"
      >
  </a
      ><a name="3854" class="Keyword"
      >open</a
      ><a name="3858"
      > </a
      ><a name="3859" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#2298" class="Module"
      >Membership</a
      ><a name="3869"
      > </a
      ><a name="3870" class="Symbol"
      >(</a
      ><a name="3871" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.html#1526" class="Function"
      >setoid</a
      ><a name="3877"
      > </a
      ><a name="3878" href="2016-03-20-one-lambda-calculus-many-times.html#2651" class="Datatype"
      >Type</a
      ><a name="3882" class="Symbol"
      >)</a
      ><a name="3883"
      >    </a
      ><a name="3887" class="Keyword"
      >using</a
      ><a name="3892"
      > </a
      ><a name="3893" class="Symbol"
      >(</a
      ><a name="3894"
      >_&#8712;_</a
      ><a name="3897" class="Symbol"
      >;</a
      ><a name="3898"
      > _&#8838;_</a
      ><a name="3902" class="Symbol"
      >)</a
      >
</pre><!--{% endraw %}-->
</div>
<!--{% raw %}--><pre class="Agda">
  <a name="3937" class="Keyword"
      >infix</a
      ><a name="3942"
      > </a
      ><a name="3943" class="Number"
      >4</a
      ><a name="3944"
      > _&#8866;_

  </a
      ><a name="3952" class="Keyword"
      >data</a
      ><a name="3956"
      > </a
      ><a name="3957" href="2016-03-20-one-lambda-calculus-many-times.html#3957" class="Datatype"
      >Sequent</a
      ><a name="3964"
      > </a
      ><a name="3965" class="Symbol"
      >:</a
      ><a name="3966"
      > </a
      ><a name="3967" class="PrimitiveType"
      >Set</a
      ><a name="3970"
      > </a
      ><a name="3971" class="Keyword"
      >where</a
      ><a name="3976"
      >
    </a
      ><a name="3981" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >_&#8866;_</a
      ><a name="3984"
      > </a
      ><a name="3985" class="Symbol"
      >:</a
      ><a name="3986"
      > </a
      ><a name="3987" href="Agda.Builtin.List.html#52" class="Datatype"
      >List</a
      ><a name="3991"
      > </a
      ><a name="3992" href="2016-03-20-one-lambda-calculus-many-times.html#2651" class="Datatype"
      >Type</a
      ><a name="3996"
      > </a
      ><a name="3997" class="Symbol"
      >&#8594;</a
      ><a name="3998"
      > </a
      ><a name="3999" href="2016-03-20-one-lambda-calculus-many-times.html#2651" class="Datatype"
      >Type</a
      ><a name="4003"
      > </a
      ><a name="4004" class="Symbol"
      >&#8594;</a
      ><a name="4005"
      > </a
      ><a name="4006" href="2016-03-20-one-lambda-calculus-many-times.html#3957" class="Datatype"
      >Sequent</a
      >
</pre><!--{% endraw %}-->

So what does a *proof* of a sequent look like? The logical system that
is most familiar to a computer scientist is probably *natural
deduction*. The natural deduction system for minimal propositional
logic has *three* rules:

$$
    \frac{A \in \Gamma}{\Gamma \vdash A}{\small ax}
    \quad
    \frac{A , \Gamma \vdash B}{\Gamma \vdash A \Rightarrow B}{\small{\Rightarrow}\!i}
    \quad
    \frac{\Gamma \vdash A \Rightarrow B \quad \Gamma \vdash A}{\Gamma \vdash B}{\small{\Rightarrow}\!e}
$$

Recall that λ-terms are constructed in one of three ways: a λ-term is
either a *variable*, an *abstraction* or an *application*:

$$
    M, N ::= x \mid (\lambda x . M) \mid (M\;N)
$$

These correspond exactly to the rules of natural deduction. In fact,
in type systems they are usually presented together:

$$
    \frac{(x : A) \in \Gamma}{\Gamma \vdash x : A}
    \quad
    \frac{x : A , \Gamma \vdash M : B}{\Gamma \vdash (\lambda x. M) : A \Rightarrow B}
    \quad
    \frac{\Gamma \vdash M : A \Rightarrow B \quad \Gamma \vdash N : A}{\Gamma \vdash (M\;N) : B}
$$

However, I like the clean look of the logical notation, so in the
interest of keeping things simple I will use that.
We encode the natural deduction system as a datatype, with each rule
corresponding to a *constructor*, and each proof a *value*:

<!--{% raw %}--><pre class="Agda">
  <a name="5353" class="Keyword"
      >infix</a
      ><a name="5358"
      > </a
      ><a name="5359" class="Number"
      >3</a
      ><a name="5360"
      > ND_

  </a
      ><a name="5368" class="Keyword"
      >data</a
      ><a name="5372"
      > </a
      ><a name="5373" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND_</a
      ><a name="5376"
      > </a
      ><a name="5377" class="Symbol"
      >:</a
      ><a name="5378"
      > </a
      ><a name="5379" href="2016-03-20-one-lambda-calculus-many-times.html#3957" class="Datatype"
      >Sequent</a
      ><a name="5386"
      > </a
      ><a name="5387" class="Symbol"
      >&#8594;</a
      ><a name="5388"
      > </a
      ><a name="5389" class="PrimitiveType"
      >Set</a
      ><a name="5392"
      > </a
      ><a name="5393" class="Keyword"
      >where</a
      ><a name="5398"
      >
    </a
      ><a name="5403" href="2016-03-20-one-lambda-calculus-many-times.html#5403" class="InductiveConstructor"
      >ax</a
      ><a name="5405"
      > </a
      ><a name="5406" class="Symbol"
      >:</a
      ><a name="5407"
      > </a
      ><a name="5408" class="Symbol"
      >&#8704;</a
      ><a name="5409"
      > </a
      ><a name="5418" class="Symbol"
      >&#8594;</a
      ><a name="5419"
      > </a
      ><a name="5420" href="2016-03-20-one-lambda-calculus-many-times.html#5411" class="Bound"
      >A</a
      ><a name="5421"
      > </a
      ><a name="5422" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#2920" class="Function Operator"
      >&#8712;</a
      ><a name="5423"
      > </a
      ><a name="5424" href="2016-03-20-one-lambda-calculus-many-times.html#5415" class="Bound"
      >&#915;</a
      ><a name="5425"
      > </a
      ><a name="5426" class="Symbol"
      >&#8594;</a
      ><a name="5427"
      > </a
      ><a name="5428" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="5430"
      > </a
      ><a name="5431" href="2016-03-20-one-lambda-calculus-many-times.html#5415" class="Bound"
      >&#915;</a
      ><a name="5432"
      > </a
      ><a name="5433" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="5434"
      > </a
      ><a name="5435" href="2016-03-20-one-lambda-calculus-many-times.html#5411" class="Bound"
      >A</a
      ><a name="5436"
      >
    </a
      ><a name="5441" href="2016-03-20-one-lambda-calculus-many-times.html#5441" class="InductiveConstructor"
      >&#8658;i</a
      ><a name="5443"
      > </a
      ><a name="5444" class="Symbol"
      >:</a
      ><a name="5445"
      > </a
      ><a name="5446" class="Symbol"
      >&#8704;</a
      ><a name="5447"
      > </a
      ><a name="5456" class="Symbol"
      >&#8594;</a
      ><a name="5457"
      > </a
      ><a name="5458" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="5460"
      > </a
      ><a name="5461" href="2016-03-20-one-lambda-calculus-many-times.html#5449" class="Bound"
      >A</a
      ><a name="5462"
      > </a
      ><a name="5463" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="5464"
      > </a
      ><a name="5465" href="2016-03-20-one-lambda-calculus-many-times.html#5453" class="Bound"
      >&#915;</a
      ><a name="5466"
      > </a
      ><a name="5467" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="5468"
      > </a
      ><a name="5469" href="2016-03-20-one-lambda-calculus-many-times.html#5451" class="Bound"
      >B</a
      ><a name="5470"
      > </a
      ><a name="5471" class="Symbol"
      >&#8594;</a
      ><a name="5472"
      > </a
      ><a name="5473" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="5475"
      > </a
      ><a name="5476" href="2016-03-20-one-lambda-calculus-many-times.html#5453" class="Bound"
      >&#915;</a
      ><a name="5477"
      > </a
      ><a name="5478" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="5479"
      > </a
      ><a name="5480" href="2016-03-20-one-lambda-calculus-many-times.html#5449" class="Bound"
      >A</a
      ><a name="5481"
      > </a
      ><a name="5482" href="2016-03-20-one-lambda-calculus-many-times.html#2694" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="5483"
      > </a
      ><a name="5484" href="2016-03-20-one-lambda-calculus-many-times.html#5451" class="Bound"
      >B</a
      ><a name="5485"
      >
    </a
      ><a name="5490" href="2016-03-20-one-lambda-calculus-many-times.html#5490" class="InductiveConstructor"
      >&#8658;e</a
      ><a name="5492"
      > </a
      ><a name="5493" class="Symbol"
      >:</a
      ><a name="5494"
      > </a
      ><a name="5495" class="Symbol"
      >&#8704;</a
      ><a name="5496"
      > </a
      ><a name="5505" class="Symbol"
      >&#8594;</a
      ><a name="5506"
      > </a
      ><a name="5507" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="5509"
      > </a
      ><a name="5510" href="2016-03-20-one-lambda-calculus-many-times.html#5502" class="Bound"
      >&#915;</a
      ><a name="5511"
      > </a
      ><a name="5512" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="5513"
      > </a
      ><a name="5514" href="2016-03-20-one-lambda-calculus-many-times.html#5498" class="Bound"
      >A</a
      ><a name="5515"
      > </a
      ><a name="5516" href="2016-03-20-one-lambda-calculus-many-times.html#2694" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="5517"
      > </a
      ><a name="5518" href="2016-03-20-one-lambda-calculus-many-times.html#5500" class="Bound"
      >B</a
      ><a name="5519"
      > </a
      ><a name="5520" class="Symbol"
      >&#8594;</a
      ><a name="5521"
      > </a
      ><a name="5522" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="5524"
      > </a
      ><a name="5525" href="2016-03-20-one-lambda-calculus-many-times.html#5502" class="Bound"
      >&#915;</a
      ><a name="5526"
      > </a
      ><a name="5527" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="5528"
      > </a
      ><a name="5529" href="2016-03-20-one-lambda-calculus-many-times.html#5498" class="Bound"
      >A</a
      ><a name="5530"
      > </a
      ><a name="5531" class="Symbol"
      >&#8594;</a
      ><a name="5532"
      > </a
      ><a name="5533" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="5535"
      > </a
      ><a name="5536" href="2016-03-20-one-lambda-calculus-many-times.html#5502" class="Bound"
      >&#915;</a
      ><a name="5537"
      > </a
      ><a name="5538" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="5539"
      > </a
      ><a name="5540" href="2016-03-20-one-lambda-calculus-many-times.html#5500" class="Bound"
      >B</a
      >
</pre><!--{% endraw %}-->

Note: for the sake of brevity, I'm using an Agda notation in which
implicit arguments are hidden. That means that any unbound
variable---such as the As, Bs and Γs above---is implicitly universally
quantified.

I prefer to think of things of the type <a class="Agda Datatype
Operator">ND</a> as proofs made up of rules, but if you prefer to
think of them as programs made up of the constructors of lambda terms,
just use the following syntax:

<!--{% raw %}--><pre class="Agda">
  <a name="6012" class="Keyword"
      >pattern</a
      ><a name="6019"
      > </a
      ><a name="6020" href="2016-03-20-one-lambda-calculus-many-times.html#6020" class="InductiveConstructor"
      >var</a
      ><a name="6023"
      >   </a
      ><a name="6026" href="2016-03-20-one-lambda-calculus-many-times.html#6035" class="Bound"
      >x</a
      ><a name="6027"
      > </a
      ><a name="6028" class="Symbol"
      >=</a
      ><a name="6029"
      > </a
      ><a name="6030" href="2016-03-20-one-lambda-calculus-many-times.html#5403" class="InductiveConstructor"
      >ax</a
      ><a name="6032"
      >   </a
      ><a name="6035" href="2016-03-20-one-lambda-calculus-many-times.html#6035" class="Bound"
      >x</a
      ><a name="6036"
      >
  </a
      ><a name="6039" class="Keyword"
      >pattern</a
      ><a name="6046"
      > </a
      ><a name="6047" href="2016-03-20-one-lambda-calculus-many-times.html#6047" class="InductiveConstructor"
      >lam</a
      ><a name="6050"
      >   </a
      ><a name="6053" href="2016-03-20-one-lambda-calculus-many-times.html#6062" class="Bound"
      >x</a
      ><a name="6054"
      > </a
      ><a name="6055" class="Symbol"
      >=</a
      ><a name="6056"
      > </a
      ><a name="6057" href="2016-03-20-one-lambda-calculus-many-times.html#5441" class="InductiveConstructor"
      >&#8658;i</a
      ><a name="6059"
      >   </a
      ><a name="6062" href="2016-03-20-one-lambda-calculus-many-times.html#6062" class="Bound"
      >x</a
      ><a name="6063"
      >
  </a
      ><a name="6066" class="Keyword"
      >pattern</a
      ><a name="6073"
      > </a
      ><a name="6074" href="2016-03-20-one-lambda-calculus-many-times.html#6074" class="InductiveConstructor Operator"
      >_&#8729;_</a
      ><a name="6077"
      > </a
      ><a name="6078" href="2016-03-20-one-lambda-calculus-many-times.html#6087" class="Bound"
      >f</a
      ><a name="6079"
      > </a
      ><a name="6080" href="2016-03-20-one-lambda-calculus-many-times.html#6089" class="Bound"
      >x</a
      ><a name="6081"
      > </a
      ><a name="6082" class="Symbol"
      >=</a
      ><a name="6083"
      > </a
      ><a name="6084" href="2016-03-20-one-lambda-calculus-many-times.html#5490" class="InductiveConstructor"
      >&#8658;e</a
      ><a name="6086"
      > </a
      ><a name="6087" href="2016-03-20-one-lambda-calculus-many-times.html#6087" class="Bound"
      >f</a
      ><a name="6088"
      > </a
      ><a name="6089" href="2016-03-20-one-lambda-calculus-many-times.html#6089" class="Bound"
      >x</a
      >
</pre><!--{% endraw %}-->

Earlier, we made the conscious choice to use *lists* to represent the
antecedent. However, this introduced a minor problem: while two
programs of the same type may not do the same thing, they *should* be
equivalent, as far as the type system is concerned, and so it *should*
be possible to rewrite a program which needs *two* values of type
$$A$$ to a program which needs only *one*.

Similarily, by using lists, we have introduced a fixed order in our
antecedent which isn't exactly desirable. While they may be different
programs, we *should* be able to rewrite the program $$f : A\to B\to C$$
to receive its arguments in the different order, i.e. to a program
$$f\prime : B\to A\to C$$.

Collectively, such properties are known as *structural* properties,
and for this particular logic we can summarise them neatly as follows:

> If $$\Gamma \subseteq \Gamma\prime$$ and $$\Gamma \vdash A$$, then
> $$\Gamma\prime \vdash A$$.

We can give a proof of this theorem by induction on the structure of
natural deduction proofs. Note that we represent the subset relation
as a *function*, that is to say $$\Gamma \subseteq \Gamma\prime$$ is
the *function* $$A\in\Gamma\to A\in\Gamma\prime$$:

<!--{% raw %}--><pre class="Agda">
  <a name="7307" href="2016-03-20-one-lambda-calculus-many-times.html#7307" class="Function"
      >struct</a
      ><a name="7313"
      > </a
      ><a name="7314" class="Symbol"
      >:</a
      ><a name="7315"
      > </a
      ><a name="7316" class="Symbol"
      >&#8704;</a
      ><a name="7317"
      > </a
      ><a name="7327" class="Symbol"
      >&#8594;</a
      ><a name="7328"
      > </a
      ><a name="7329" href="2016-03-20-one-lambda-calculus-many-times.html#7321" class="Bound"
      >&#915;</a
      ><a name="7330"
      > </a
      ><a name="7331" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#3056" class="Function Operator"
      >&#8838;</a
      ><a name="7332"
      > </a
      ><a name="7333" href="2016-03-20-one-lambda-calculus-many-times.html#7323" class="Bound"
      >&#915;&#8242;</a
      ><a name="7335"
      > </a
      ><a name="7336" class="Symbol"
      >&#8594;</a
      ><a name="7337"
      > </a
      ><a name="7338" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="7340"
      > </a
      ><a name="7341" href="2016-03-20-one-lambda-calculus-many-times.html#7321" class="Bound"
      >&#915;</a
      ><a name="7342"
      > </a
      ><a name="7343" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="7344"
      > </a
      ><a name="7345" href="2016-03-20-one-lambda-calculus-many-times.html#7319" class="Bound"
      >A</a
      ><a name="7346"
      > </a
      ><a name="7347" class="Symbol"
      >&#8594;</a
      ><a name="7348"
      > </a
      ><a name="7349" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="7351"
      > </a
      ><a name="7352" href="2016-03-20-one-lambda-calculus-many-times.html#7323" class="Bound"
      >&#915;&#8242;</a
      ><a name="7354"
      > </a
      ><a name="7355" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="7356"
      > </a
      ><a name="7357" href="2016-03-20-one-lambda-calculus-many-times.html#7319" class="Bound"
      >A</a
      ><a name="7358"
      >
  </a
      ><a name="7361" href="2016-03-20-one-lambda-calculus-many-times.html#7307" class="Function"
      >struct</a
      ><a name="7367"
      > </a
      ><a name="7368" href="2016-03-20-one-lambda-calculus-many-times.html#7368" class="Bound"
      >&#915;&#8838;&#915;&#8242;</a
      ><a name="7372"
      > </a
      ><a name="7373" class="Symbol"
      >(</a
      ><a name="7374" href="2016-03-20-one-lambda-calculus-many-times.html#5403" class="InductiveConstructor"
      >ax</a
      ><a name="7376"
      > </a
      ><a name="7377" href="2016-03-20-one-lambda-calculus-many-times.html#7377" class="Bound"
      >x</a
      ><a name="7378" class="Symbol"
      >)</a
      ><a name="7379"
      >   </a
      ><a name="7382" class="Symbol"
      >=</a
      ><a name="7383"
      > </a
      ><a name="7384" href="2016-03-20-one-lambda-calculus-many-times.html#5403" class="InductiveConstructor"
      >ax</a
      ><a name="7386"
      > </a
      ><a name="7387" class="Symbol"
      >(</a
      ><a name="7388" href="2016-03-20-one-lambda-calculus-many-times.html#7368" class="Bound"
      >&#915;&#8838;&#915;&#8242;</a
      ><a name="7392"
      > </a
      ><a name="7393" href="2016-03-20-one-lambda-calculus-many-times.html#7377" class="Bound"
      >x</a
      ><a name="7394" class="Symbol"
      >)</a
      ><a name="7395"
      >
  </a
      ><a name="7398" href="2016-03-20-one-lambda-calculus-many-times.html#7307" class="Function"
      >struct</a
      ><a name="7404"
      > </a
      ><a name="7405" href="2016-03-20-one-lambda-calculus-many-times.html#7405" class="Bound"
      >&#915;&#8838;&#915;&#8242;</a
      ><a name="7409"
      > </a
      ><a name="7410" class="Symbol"
      >(</a
      ><a name="7411" href="2016-03-20-one-lambda-calculus-many-times.html#5441" class="InductiveConstructor"
      >&#8658;i</a
      ><a name="7413"
      > </a
      ><a name="7414" href="2016-03-20-one-lambda-calculus-many-times.html#7414" class="Bound"
      >f</a
      ><a name="7415" class="Symbol"
      >)</a
      ><a name="7416"
      >   </a
      ><a name="7419" class="Symbol"
      >=</a
      ><a name="7420"
      > </a
      ><a name="7421" href="2016-03-20-one-lambda-calculus-many-times.html#5441" class="InductiveConstructor"
      >&#8658;i</a
      ><a name="7423"
      > </a
      ><a name="7424" class="Symbol"
      >(</a
      ><a name="7425" href="2016-03-20-one-lambda-calculus-many-times.html#7307" class="Function"
      >struct</a
      ><a name="7431"
      > </a
      ><a name="7432" class="Symbol"
      >(</a
      ><a name="7433" href="2016-03-20-one-lambda-calculus-many-times.html#7468" class="Function"
      >&#8759;-resp-&#8838;</a
      ><a name="7441"
      > </a
      ><a name="7442" href="2016-03-20-one-lambda-calculus-many-times.html#7405" class="Bound"
      >&#915;&#8838;&#915;&#8242;</a
      ><a name="7446" class="Symbol"
      >)</a
      ><a name="7447"
      > </a
      ><a name="7448" href="2016-03-20-one-lambda-calculus-many-times.html#7414" class="Bound"
      >f</a
      ><a name="7449" class="Symbol"
      >)</a
      ><a name="7450"
      >
    </a
      ><a name="7455" class="Keyword"
      >where</a
      ><a name="7460"
      >

      </a
      ><a name="7468" href="2016-03-20-one-lambda-calculus-many-times.html#7468" class="Function"
      >&#8759;-resp-&#8838;</a
      ><a name="7476"
      > </a
      ><a name="7477" class="Symbol"
      >:</a
      ><a name="7478"
      > </a
      ><a name="7479" class="Symbol"
      >&#8704;</a
      ><a name="7480"
      > </a
      ><a name="7490" class="Symbol"
      >&#8594;</a
      ><a name="7491"
      > </a
      ><a name="7492" href="2016-03-20-one-lambda-calculus-many-times.html#7484" class="Bound"
      >&#915;</a
      ><a name="7493"
      > </a
      ><a name="7494" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#3056" class="Function Operator"
      >&#8838;</a
      ><a name="7495"
      > </a
      ><a name="7496" href="2016-03-20-one-lambda-calculus-many-times.html#7486" class="Bound"
      >&#915;&#8242;</a
      ><a name="7498"
      > </a
      ><a name="7499" class="Symbol"
      >&#8594;</a
      ><a name="7500"
      > </a
      ><a name="7501" href="2016-03-20-one-lambda-calculus-many-times.html#7482" class="Bound"
      >A</a
      ><a name="7502"
      > </a
      ><a name="7503" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="7504"
      > </a
      ><a name="7505" href="2016-03-20-one-lambda-calculus-many-times.html#7484" class="Bound"
      >&#915;</a
      ><a name="7506"
      > </a
      ><a name="7507" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#3056" class="Function Operator"
      >&#8838;</a
      ><a name="7508"
      > </a
      ><a name="7509" href="2016-03-20-one-lambda-calculus-many-times.html#7482" class="Bound"
      >A</a
      ><a name="7510"
      > </a
      ><a name="7511" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="7512"
      > </a
      ><a name="7513" href="2016-03-20-one-lambda-calculus-many-times.html#7486" class="Bound"
      >&#915;&#8242;</a
      ><a name="7515"
      >
      </a
      ><a name="7522" href="2016-03-20-one-lambda-calculus-many-times.html#7468" class="Function"
      >&#8759;-resp-&#8838;</a
      ><a name="7530"
      > </a
      ><a name="7531" href="2016-03-20-one-lambda-calculus-many-times.html#7531" class="Bound"
      >&#915;&#8838;&#915;&#8242;</a
      ><a name="7535"
      > </a
      ><a name="7536" class="Symbol"
      >(</a
      ><a name="7537" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="7541"
      >  </a
      ><a name="7543" href="2016-03-20-one-lambda-calculus-many-times.html#7543" class="Bound"
      >x</a
      ><a name="7544" class="Symbol"
      >)</a
      ><a name="7545"
      > </a
      ><a name="7546" class="Symbol"
      >=</a
      ><a name="7547"
      > </a
      ><a name="7548" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="7552"
      > </a
      ><a name="7553" href="2016-03-20-one-lambda-calculus-many-times.html#7543" class="Bound"
      >x</a
      ><a name="7554"
      >
      </a
      ><a name="7561" href="2016-03-20-one-lambda-calculus-many-times.html#7468" class="Function"
      >&#8759;-resp-&#8838;</a
      ><a name="7569"
      > </a
      ><a name="7570" href="2016-03-20-one-lambda-calculus-many-times.html#7570" class="Bound"
      >&#915;&#8838;&#915;&#8242;</a
      ><a name="7574"
      > </a
      ><a name="7575" class="Symbol"
      >(</a
      ><a name="7576" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="7581"
      > </a
      ><a name="7582" href="2016-03-20-one-lambda-calculus-many-times.html#7582" class="Bound"
      >x</a
      ><a name="7583" class="Symbol"
      >)</a
      ><a name="7584"
      > </a
      ><a name="7585" class="Symbol"
      >=</a
      ><a name="7586"
      > </a
      ><a name="7587" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="7592"
      > </a
      ><a name="7593" class="Symbol"
      >(</a
      ><a name="7594" href="2016-03-20-one-lambda-calculus-many-times.html#7570" class="Bound"
      >&#915;&#8838;&#915;&#8242;</a
      ><a name="7598"
      > </a
      ><a name="7599" href="2016-03-20-one-lambda-calculus-many-times.html#7582" class="Bound"
      >x</a
      ><a name="7600" class="Symbol"
      >)</a
      ><a name="7601"
      >

  </a
      ><a name="7605" href="2016-03-20-one-lambda-calculus-many-times.html#7307" class="Function"
      >struct</a
      ><a name="7611"
      > </a
      ><a name="7612" href="2016-03-20-one-lambda-calculus-many-times.html#7612" class="Bound"
      >&#915;&#8838;&#915;&#8242;</a
      ><a name="7616"
      > </a
      ><a name="7617" class="Symbol"
      >(</a
      ><a name="7618" href="2016-03-20-one-lambda-calculus-many-times.html#5490" class="InductiveConstructor"
      >&#8658;e</a
      ><a name="7620"
      > </a
      ><a name="7621" href="2016-03-20-one-lambda-calculus-many-times.html#7621" class="Bound"
      >f</a
      ><a name="7622"
      > </a
      ><a name="7623" href="2016-03-20-one-lambda-calculus-many-times.html#7623" class="Bound"
      >g</a
      ><a name="7624" class="Symbol"
      >)</a
      ><a name="7625"
      > </a
      ><a name="7626" class="Symbol"
      >=</a
      ><a name="7627"
      > </a
      ><a name="7628" href="2016-03-20-one-lambda-calculus-many-times.html#5490" class="InductiveConstructor"
      >&#8658;e</a
      ><a name="7630"
      > </a
      ><a name="7631" class="Symbol"
      >(</a
      ><a name="7632" href="2016-03-20-one-lambda-calculus-many-times.html#7307" class="Function"
      >struct</a
      ><a name="7638"
      > </a
      ><a name="7639" href="2016-03-20-one-lambda-calculus-many-times.html#7612" class="Bound"
      >&#915;&#8838;&#915;&#8242;</a
      ><a name="7643"
      > </a
      ><a name="7644" href="2016-03-20-one-lambda-calculus-many-times.html#7621" class="Bound"
      >f</a
      ><a name="7645" class="Symbol"
      >)</a
      ><a name="7646"
      > </a
      ><a name="7647" class="Symbol"
      >(</a
      ><a name="7648" href="2016-03-20-one-lambda-calculus-many-times.html#7307" class="Function"
      >struct</a
      ><a name="7654"
      > </a
      ><a name="7655" href="2016-03-20-one-lambda-calculus-many-times.html#7612" class="Bound"
      >&#915;&#8838;&#915;&#8242;</a
      ><a name="7659"
      > </a
      ><a name="7660" href="2016-03-20-one-lambda-calculus-many-times.html#7623" class="Bound"
      >g</a
      ><a name="7661" class="Symbol"
      >)</a
      >
</pre><!--{% endraw %}-->

Note that values of type $$A\in\Gamma$$ are constructed using <a
class="Agda InductiveConstructor" target="_blank"
href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174">here</a>
and <a class="Agda InductiveConstructor" target="_blank"
href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227">there</a>,
which makes them more or less just numbers, i.e. "first value",
"second value", etc...

I mentioned two uses of this structural rule: contracting two
different variables of the *same* type into one, and exchanging the
order of the types in the antecedent. There is one more canonical use:
*weakning*.
Weakening is so obvious to programmers that they don't really think of
it, but what it says is that if you can run a program in *some*
environment, then you should *certainly* be able to run that program
in that enviroment with some irrelevant stuff added to it. Formally,
we write it as:

<!--{% raw %}--><pre class="Agda">
  <a name="8605" href="2016-03-20-one-lambda-calculus-many-times.html#8605" class="Function"
      >w&#8242;</a
      ><a name="8607"
      > </a
      ><a name="8608" class="Symbol"
      >:</a
      ><a name="8609"
      > </a
      ><a name="8610" class="Symbol"
      >&#8704;</a
      ><a name="8611"
      > </a
      ><a name="8620" class="Symbol"
      >&#8594;</a
      ><a name="8621"
      > </a
      ><a name="8622" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="8624"
      > </a
      ><a name="8625" href="2016-03-20-one-lambda-calculus-many-times.html#8617" class="Bound"
      >&#915;</a
      ><a name="8626"
      > </a
      ><a name="8627" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="8628"
      > </a
      ><a name="8629" href="2016-03-20-one-lambda-calculus-many-times.html#8615" class="Bound"
      >B</a
      ><a name="8630"
      > </a
      ><a name="8631" class="Symbol"
      >&#8594;</a
      ><a name="8632"
      > </a
      ><a name="8633" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="8635"
      > </a
      ><a name="8636" href="2016-03-20-one-lambda-calculus-many-times.html#8613" class="Bound"
      >A</a
      ><a name="8637"
      > </a
      ><a name="8638" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="8639"
      > </a
      ><a name="8640" href="2016-03-20-one-lambda-calculus-many-times.html#8617" class="Bound"
      >&#915;</a
      ><a name="8641"
      > </a
      ><a name="8642" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="8643"
      > </a
      ><a name="8644" href="2016-03-20-one-lambda-calculus-many-times.html#8615" class="Bound"
      >B</a
      ><a name="8645"
      >
  </a
      ><a name="8648" href="2016-03-20-one-lambda-calculus-many-times.html#8605" class="Function"
      >w&#8242;</a
      ><a name="8650"
      > </a
      ><a name="8651" class="Symbol"
      >=</a
      ><a name="8652"
      > </a
      ><a name="8653" href="2016-03-20-one-lambda-calculus-many-times.html#7307" class="Function"
      >struct</a
      ><a name="8659"
      > </a
      ><a name="8660" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      >
</pre><!--{% endraw %}-->

Passing <a class="Agda InductiveConstructor" target="_blank"
href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227">there</a>
to <a href="#6956" class="Agda Function">struct</a> simply
moves every value by one: the first value becomes the second, the
second becomes the third, etc... In the new antecedent, the first
value will be our "irrelevant stuff".


### Sequent Calculus and Natural Deduction

We've got enough to start talking about the sequent calculus now. The
sequent calculus is a different way of writing down logical systems,
and it has some pros and cons when compared to natural deduction.
It's usual presentation is as follows:

$$
    \frac{A \in \Gamma}{\Gamma \vdash A}{\small ax}
    \quad
    \frac{\Gamma \vdash A \quad A , \Gamma \vdash B}{\Gamma \vdash B}{\small cut}
    \quad
    \frac{\Gamma \vdash A \quad B , \Gamma \vdash C}{A \Rightarrow  B , \Gamma \vdash C}{\small{\Rightarrow}\!l}
    \quad
    \frac{A , \Gamma \vdash B}{\Gamma \vdash A \Rightarrow B}{\small{\Rightarrow}\!r}
$$

We can encode these rules in Agda as follows:

<!--{% raw %}--><pre class="Agda">
  <a name="9767" class="Keyword"
      >infix</a
      ><a name="9772"
      > </a
      ><a name="9773" class="Number"
      >3</a
      ><a name="9774"
      > SC_

  </a
      ><a name="9782" class="Keyword"
      >data</a
      ><a name="9786"
      > </a
      ><a name="9787" href="2016-03-20-one-lambda-calculus-many-times.html#9787" class="Datatype Operator"
      >SC_</a
      ><a name="9790"
      > </a
      ><a name="9791" class="Symbol"
      >:</a
      ><a name="9792"
      > </a
      ><a name="9793" href="2016-03-20-one-lambda-calculus-many-times.html#3957" class="Datatype"
      >Sequent</a
      ><a name="9800"
      > </a
      ><a name="9801" class="Symbol"
      >&#8594;</a
      ><a name="9802"
      > </a
      ><a name="9803" class="PrimitiveType"
      >Set</a
      ><a name="9806"
      > </a
      ><a name="9807" class="Keyword"
      >where</a
      ><a name="9812"
      >
    </a
      ><a name="9817" href="2016-03-20-one-lambda-calculus-many-times.html#9817" class="InductiveConstructor"
      >ax</a
      ><a name="9819"
      >  </a
      ><a name="9821" class="Symbol"
      >:</a
      ><a name="9822"
      > </a
      ><a name="9823" class="Symbol"
      >&#8704;</a
      ><a name="9824"
      > </a
      ><a name="9835" class="Symbol"
      >&#8594;</a
      ><a name="9836"
      > </a
      ><a name="9837" href="2016-03-20-one-lambda-calculus-many-times.html#9826" class="Bound"
      >A</a
      ><a name="9838"
      > </a
      ><a name="9839" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#2920" class="Function Operator"
      >&#8712;</a
      ><a name="9840"
      > </a
      ><a name="9841" href="2016-03-20-one-lambda-calculus-many-times.html#9832" class="Bound"
      >&#915;</a
      ><a name="9842"
      > </a
      ><a name="9843" class="Symbol"
      >&#8594;</a
      ><a name="9844"
      > </a
      ><a name="9845" href="2016-03-20-one-lambda-calculus-many-times.html#9787" class="Datatype Operator"
      >SC</a
      ><a name="9847"
      > </a
      ><a name="9848" href="2016-03-20-one-lambda-calculus-many-times.html#9832" class="Bound"
      >&#915;</a
      ><a name="9849"
      > </a
      ><a name="9850" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="9851"
      > </a
      ><a name="9852" href="2016-03-20-one-lambda-calculus-many-times.html#9826" class="Bound"
      >A</a
      ><a name="9853"
      >
    </a
      ><a name="9858" href="2016-03-20-one-lambda-calculus-many-times.html#9858" class="InductiveConstructor"
      >cut</a
      ><a name="9861"
      > </a
      ><a name="9862" class="Symbol"
      >:</a
      ><a name="9863"
      > </a
      ><a name="9864" class="Symbol"
      >&#8704;</a
      ><a name="9865"
      > </a
      ><a name="9876" class="Symbol"
      >&#8594;</a
      ><a name="9877"
      > </a
      ><a name="9878" href="2016-03-20-one-lambda-calculus-many-times.html#9787" class="Datatype Operator"
      >SC</a
      ><a name="9880"
      > </a
      ><a name="9881" href="2016-03-20-one-lambda-calculus-many-times.html#9873" class="Bound"
      >&#915;</a
      ><a name="9882"
      > </a
      ><a name="9883" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="9884"
      > </a
      ><a name="9885" href="2016-03-20-one-lambda-calculus-many-times.html#9867" class="Bound"
      >A</a
      ><a name="9886"
      > </a
      ><a name="9887" class="Symbol"
      >&#8594;</a
      ><a name="9888"
      > </a
      ><a name="9889" href="2016-03-20-one-lambda-calculus-many-times.html#9787" class="Datatype Operator"
      >SC</a
      ><a name="9891"
      > </a
      ><a name="9892" href="2016-03-20-one-lambda-calculus-many-times.html#9867" class="Bound"
      >A</a
      ><a name="9893"
      > </a
      ><a name="9894" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="9895"
      > </a
      ><a name="9896" href="2016-03-20-one-lambda-calculus-many-times.html#9873" class="Bound"
      >&#915;</a
      ><a name="9897"
      > </a
      ><a name="9898" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="9899"
      > </a
      ><a name="9900" href="2016-03-20-one-lambda-calculus-many-times.html#9869" class="Bound"
      >B</a
      ><a name="9901"
      > </a
      ><a name="9902" class="Symbol"
      >&#8594;</a
      ><a name="9903"
      > </a
      ><a name="9904" href="2016-03-20-one-lambda-calculus-many-times.html#9787" class="Datatype Operator"
      >SC</a
      ><a name="9906"
      > </a
      ><a name="9907" href="2016-03-20-one-lambda-calculus-many-times.html#9873" class="Bound"
      >&#915;</a
      ><a name="9908"
      > </a
      ><a name="9909" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="9910"
      > </a
      ><a name="9911" href="2016-03-20-one-lambda-calculus-many-times.html#9869" class="Bound"
      >B</a
      ><a name="9912"
      >
    </a
      ><a name="9917" href="2016-03-20-one-lambda-calculus-many-times.html#9917" class="InductiveConstructor"
      >&#8658;l</a
      ><a name="9919"
      >  </a
      ><a name="9921" class="Symbol"
      >:</a
      ><a name="9922"
      > </a
      ><a name="9923" class="Symbol"
      >&#8704;</a
      ><a name="9924"
      > </a
      ><a name="9935" class="Symbol"
      >&#8594;</a
      ><a name="9936"
      > </a
      ><a name="9937" href="2016-03-20-one-lambda-calculus-many-times.html#9787" class="Datatype Operator"
      >SC</a
      ><a name="9939"
      > </a
      ><a name="9940" href="2016-03-20-one-lambda-calculus-many-times.html#9932" class="Bound"
      >&#915;</a
      ><a name="9941"
      > </a
      ><a name="9942" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="9943"
      > </a
      ><a name="9944" href="2016-03-20-one-lambda-calculus-many-times.html#9926" class="Bound"
      >A</a
      ><a name="9945"
      > </a
      ><a name="9946" class="Symbol"
      >&#8594;</a
      ><a name="9947"
      > </a
      ><a name="9948" href="2016-03-20-one-lambda-calculus-many-times.html#9787" class="Datatype Operator"
      >SC</a
      ><a name="9950"
      > </a
      ><a name="9951" href="2016-03-20-one-lambda-calculus-many-times.html#9928" class="Bound"
      >B</a
      ><a name="9952"
      > </a
      ><a name="9953" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="9954"
      > </a
      ><a name="9955" href="2016-03-20-one-lambda-calculus-many-times.html#9932" class="Bound"
      >&#915;</a
      ><a name="9956"
      > </a
      ><a name="9957" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="9958"
      > </a
      ><a name="9959" href="2016-03-20-one-lambda-calculus-many-times.html#9930" class="Bound"
      >C</a
      ><a name="9960"
      > </a
      ><a name="9961" class="Symbol"
      >&#8594;</a
      ><a name="9962"
      > </a
      ><a name="9963" href="2016-03-20-one-lambda-calculus-many-times.html#9787" class="Datatype Operator"
      >SC</a
      ><a name="9965"
      > </a
      ><a name="9966" href="2016-03-20-one-lambda-calculus-many-times.html#9926" class="Bound"
      >A</a
      ><a name="9967"
      > </a
      ><a name="9968" href="2016-03-20-one-lambda-calculus-many-times.html#2694" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="9969"
      > </a
      ><a name="9970" href="2016-03-20-one-lambda-calculus-many-times.html#9928" class="Bound"
      >B</a
      ><a name="9971"
      > </a
      ><a name="9972" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="9973"
      > </a
      ><a name="9974" href="2016-03-20-one-lambda-calculus-many-times.html#9932" class="Bound"
      >&#915;</a
      ><a name="9975"
      > </a
      ><a name="9976" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="9977"
      > </a
      ><a name="9978" href="2016-03-20-one-lambda-calculus-many-times.html#9930" class="Bound"
      >C</a
      ><a name="9979"
      >
    </a
      ><a name="9984" href="2016-03-20-one-lambda-calculus-many-times.html#9984" class="InductiveConstructor"
      >&#8658;r</a
      ><a name="9986"
      >  </a
      ><a name="9988" class="Symbol"
      >:</a
      ><a name="9989"
      > </a
      ><a name="9990" class="Symbol"
      >&#8704;</a
      ><a name="9991"
      > </a
      ><a name="10002" class="Symbol"
      >&#8594;</a
      ><a name="10003"
      > </a
      ><a name="10004" href="2016-03-20-one-lambda-calculus-many-times.html#9787" class="Datatype Operator"
      >SC</a
      ><a name="10006"
      > </a
      ><a name="10007" href="2016-03-20-one-lambda-calculus-many-times.html#9993" class="Bound"
      >A</a
      ><a name="10008"
      > </a
      ><a name="10009" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="10010"
      > </a
      ><a name="10011" href="2016-03-20-one-lambda-calculus-many-times.html#9999" class="Bound"
      >&#915;</a
      ><a name="10012"
      > </a
      ><a name="10013" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="10014"
      > </a
      ><a name="10015" href="2016-03-20-one-lambda-calculus-many-times.html#9995" class="Bound"
      >B</a
      ><a name="10016"
      > </a
      ><a name="10017" class="Symbol"
      >&#8594;</a
      ><a name="10018"
      > </a
      ><a name="10019" href="2016-03-20-one-lambda-calculus-many-times.html#9787" class="Datatype Operator"
      >SC</a
      ><a name="10021"
      > </a
      ><a name="10022" href="2016-03-20-one-lambda-calculus-many-times.html#9999" class="Bound"
      >&#915;</a
      ><a name="10023"
      > </a
      ><a name="10024" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="10025"
      > </a
      ><a name="10026" href="2016-03-20-one-lambda-calculus-many-times.html#9993" class="Bound"
      >A</a
      ><a name="10027"
      > </a
      ><a name="10028" href="2016-03-20-one-lambda-calculus-many-times.html#2694" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="10029"
      > </a
      ><a name="10030" href="2016-03-20-one-lambda-calculus-many-times.html#9995" class="Bound"
      >B</a
      >
</pre><!--{% endraw %}-->

We will define a few patterns that we'd otherwise have to write out,
over and over again. Namely, names for the first, second, and third
variable in a context:

<!--{% raw %}--><pre class="Agda">
  <a name="10220" class="Keyword"
      >pattern</a
      ><a name="10227"
      > </a
      ><a name="10228" href="2016-03-20-one-lambda-calculus-many-times.html#10228" class="InductiveConstructor"
      >ax&#8320;</a
      ><a name="10231"
      > </a
      ><a name="10232" class="Symbol"
      >=</a
      ><a name="10233"
      > </a
      ><a name="10234" class="InductiveConstructor"
      >ax</a
      ><a name="10236"
      > </a
      ><a name="10237" class="Symbol"
      >(</a
      ><a name="10238" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="10242"
      > </a
      ><a name="10243" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="10247" class="Symbol"
      >)</a
      ><a name="10248"
      >
  </a
      ><a name="10251" class="Keyword"
      >pattern</a
      ><a name="10258"
      > </a
      ><a name="10259" href="2016-03-20-one-lambda-calculus-many-times.html#10259" class="InductiveConstructor"
      >ax&#8321;</a
      ><a name="10262"
      > </a
      ><a name="10263" class="Symbol"
      >=</a
      ><a name="10264"
      > </a
      ><a name="10265" class="InductiveConstructor"
      >ax</a
      ><a name="10267"
      > </a
      ><a name="10268" class="Symbol"
      >(</a
      ><a name="10269" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="10274"
      > </a
      ><a name="10275" class="Symbol"
      >(</a
      ><a name="10276" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="10280"
      > </a
      ><a name="10281" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="10285" class="Symbol"
      >))</a
      ><a name="10287"
      >
  </a
      ><a name="10290" class="Keyword"
      >pattern</a
      ><a name="10297"
      > </a
      ><a name="10298" href="2016-03-20-one-lambda-calculus-many-times.html#10298" class="InductiveConstructor"
      >ax&#8322;</a
      ><a name="10301"
      > </a
      ><a name="10302" class="Symbol"
      >=</a
      ><a name="10303"
      > </a
      ><a name="10304" class="InductiveConstructor"
      >ax</a
      ><a name="10306"
      > </a
      ><a name="10307" class="Symbol"
      >(</a
      ><a name="10308" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="10313"
      > </a
      ><a name="10314" class="Symbol"
      >(</a
      ><a name="10315" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="10320"
      > </a
      ><a name="10321" class="Symbol"
      >(</a
      ><a name="10322" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="10326"
      > </a
      ><a name="10327" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="10331" class="Symbol"
      >)))</a
      >
</pre><!--{% endraw %}-->

It's a little bit of a puzzle, but given <a href="#8254" class="Agda
Function">w′</a> it becomes quite easy to show that the two logics
are in fact equivalent---that they derive the *same sequents*:

<!--{% raw %}--><pre class="Agda">
  <a name="10562" class="Keyword"
      >module</a
      ><a name="10568"
      > </a
      ><a name="10569" href="2016-03-20-one-lambda-calculus-many-times.html#10569" class="Module"
      >ND&#8660;SC</a
      ><a name="10574"
      > </a
      ><a name="10575" class="Keyword"
      >where</a
      ><a name="10580"
      >

    </a
      ><a name="10586" href="2016-03-20-one-lambda-calculus-many-times.html#10586" class="Function"
      >&#10233;</a
      ><a name="10587"
      > </a
      ><a name="10588" class="Symbol"
      >:</a
      ><a name="10589"
      > </a
      ><a name="10590" class="Symbol"
      >&#8704;</a
      ><a name="10591"
      > </a
      ><a name="10596" class="Symbol"
      >&#8594;</a
      ><a name="10597"
      > </a
      ><a name="10598" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="10600"
      > </a
      ><a name="10601" href="2016-03-20-one-lambda-calculus-many-times.html#10593" class="Bound"
      >S</a
      ><a name="10602"
      > </a
      ><a name="10603" class="Symbol"
      >&#8594;</a
      ><a name="10604"
      > </a
      ><a name="10605" href="2016-03-20-one-lambda-calculus-many-times.html#9787" class="Datatype Operator"
      >SC</a
      ><a name="10607"
      > </a
      ><a name="10608" href="2016-03-20-one-lambda-calculus-many-times.html#10593" class="Bound"
      >S</a
      ><a name="10609"
      >
    </a
      ><a name="10614" href="2016-03-20-one-lambda-calculus-many-times.html#10586" class="Function"
      >&#10233;</a
      ><a name="10615"
      > </a
      ><a name="10616" class="Symbol"
      >(</a
      ><a name="10617" href="2016-03-20-one-lambda-calculus-many-times.html#5403" class="InductiveConstructor"
      >ax</a
      ><a name="10619"
      >  </a
      ><a name="10621" href="2016-03-20-one-lambda-calculus-many-times.html#10621" class="Bound"
      >x</a
      ><a name="10622" class="Symbol"
      >)</a
      ><a name="10623"
      >   </a
      ><a name="10626" class="Symbol"
      >=</a
      ><a name="10627"
      > </a
      ><a name="10628" href="2016-03-20-one-lambda-calculus-many-times.html#9817" class="InductiveConstructor"
      >ax</a
      ><a name="10630"
      > </a
      ><a name="10631" href="2016-03-20-one-lambda-calculus-many-times.html#10621" class="Bound"
      >x</a
      ><a name="10632"
      >
    </a
      ><a name="10637" href="2016-03-20-one-lambda-calculus-many-times.html#10586" class="Function"
      >&#10233;</a
      ><a name="10638"
      > </a
      ><a name="10639" class="Symbol"
      >(</a
      ><a name="10640" href="2016-03-20-one-lambda-calculus-many-times.html#5441" class="InductiveConstructor"
      >&#8658;i</a
      ><a name="10642"
      >  </a
      ><a name="10644" href="2016-03-20-one-lambda-calculus-many-times.html#10644" class="Bound"
      >f</a
      ><a name="10645" class="Symbol"
      >)</a
      ><a name="10646"
      >   </a
      ><a name="10649" class="Symbol"
      >=</a
      ><a name="10650"
      > </a
      ><a name="10651" href="2016-03-20-one-lambda-calculus-many-times.html#9984" class="InductiveConstructor"
      >&#8658;r</a
      ><a name="10653"
      >  </a
      ><a name="10655" class="Symbol"
      >(</a
      ><a name="10656" href="2016-03-20-one-lambda-calculus-many-times.html#10586" class="Function"
      >&#10233;</a
      ><a name="10657"
      > </a
      ><a name="10658" href="2016-03-20-one-lambda-calculus-many-times.html#10644" class="Bound"
      >f</a
      ><a name="10659" class="Symbol"
      >)</a
      ><a name="10660"
      >
    </a
      ><a name="10665" href="2016-03-20-one-lambda-calculus-many-times.html#10586" class="Function"
      >&#10233;</a
      ><a name="10666"
      > </a
      ><a name="10667" class="Symbol"
      >(</a
      ><a name="10668" href="2016-03-20-one-lambda-calculus-many-times.html#5490" class="InductiveConstructor"
      >&#8658;e</a
      ><a name="10670"
      >  </a
      ><a name="10672" href="2016-03-20-one-lambda-calculus-many-times.html#10672" class="Bound"
      >f</a
      ><a name="10673"
      > </a
      ><a name="10674" href="2016-03-20-one-lambda-calculus-many-times.html#10674" class="Bound"
      >g</a
      ><a name="10675" class="Symbol"
      >)</a
      ><a name="10676"
      > </a
      ><a name="10677" class="Symbol"
      >=</a
      ><a name="10678"
      > </a
      ><a name="10679" href="2016-03-20-one-lambda-calculus-many-times.html#9858" class="InductiveConstructor"
      >cut</a
      ><a name="10682"
      > </a
      ><a name="10683" class="Symbol"
      >(</a
      ><a name="10684" href="2016-03-20-one-lambda-calculus-many-times.html#10586" class="Function"
      >&#10233;</a
      ><a name="10685"
      > </a
      ><a name="10686" href="2016-03-20-one-lambda-calculus-many-times.html#10672" class="Bound"
      >f</a
      ><a name="10687" class="Symbol"
      >)</a
      ><a name="10688"
      > </a
      ><a name="10689" class="Symbol"
      >(</a
      ><a name="10690" href="2016-03-20-one-lambda-calculus-many-times.html#9917" class="InductiveConstructor"
      >&#8658;l</a
      ><a name="10692"
      > </a
      ><a name="10693" class="Symbol"
      >(</a
      ><a name="10694" href="2016-03-20-one-lambda-calculus-many-times.html#10586" class="Function"
      >&#10233;</a
      ><a name="10695"
      > </a
      ><a name="10696" href="2016-03-20-one-lambda-calculus-many-times.html#10674" class="Bound"
      >g</a
      ><a name="10697" class="Symbol"
      >)</a
      ><a name="10698"
      > </a
      ><a name="10699" href="2016-03-20-one-lambda-calculus-many-times.html#10228" class="InductiveConstructor"
      >ax&#8320;</a
      ><a name="10702" class="Symbol"
      >)</a
      ><a name="10703"
      >

    </a
      ><a name="10709" href="2016-03-20-one-lambda-calculus-many-times.html#10709" class="Function"
      >&#10232;</a
      ><a name="10710"
      > </a
      ><a name="10711" class="Symbol"
      >:</a
      ><a name="10712"
      > </a
      ><a name="10713" class="Symbol"
      >&#8704;</a
      ><a name="10714"
      > </a
      ><a name="10719" class="Symbol"
      >&#8594;</a
      ><a name="10720"
      > </a
      ><a name="10721" href="2016-03-20-one-lambda-calculus-many-times.html#9787" class="Datatype Operator"
      >SC</a
      ><a name="10723"
      > </a
      ><a name="10724" href="2016-03-20-one-lambda-calculus-many-times.html#10716" class="Bound"
      >S</a
      ><a name="10725"
      > </a
      ><a name="10726" class="Symbol"
      >&#8594;</a
      ><a name="10727"
      > </a
      ><a name="10728" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="10730"
      > </a
      ><a name="10731" href="2016-03-20-one-lambda-calculus-many-times.html#10716" class="Bound"
      >S</a
      ><a name="10732"
      >
    </a
      ><a name="10737" href="2016-03-20-one-lambda-calculus-many-times.html#10709" class="Function"
      >&#10232;</a
      ><a name="10738"
      > </a
      ><a name="10739" class="Symbol"
      >(</a
      ><a name="10740" href="2016-03-20-one-lambda-calculus-many-times.html#9817" class="InductiveConstructor"
      >ax</a
      ><a name="10742"
      >  </a
      ><a name="10744" href="2016-03-20-one-lambda-calculus-many-times.html#10744" class="Bound"
      >p</a
      ><a name="10745" class="Symbol"
      >)</a
      ><a name="10746"
      >   </a
      ><a name="10749" class="Symbol"
      >=</a
      ><a name="10750"
      > </a
      ><a name="10751" href="2016-03-20-one-lambda-calculus-many-times.html#5403" class="InductiveConstructor"
      >ax</a
      ><a name="10753"
      > </a
      ><a name="10754" href="2016-03-20-one-lambda-calculus-many-times.html#10744" class="Bound"
      >p</a
      ><a name="10755"
      >
    </a
      ><a name="10760" href="2016-03-20-one-lambda-calculus-many-times.html#10709" class="Function"
      >&#10232;</a
      ><a name="10761"
      > </a
      ><a name="10762" class="Symbol"
      >(</a
      ><a name="10763" href="2016-03-20-one-lambda-calculus-many-times.html#9858" class="InductiveConstructor"
      >cut</a
      ><a name="10766"
      > </a
      ><a name="10767" href="2016-03-20-one-lambda-calculus-many-times.html#10767" class="Bound"
      >f</a
      ><a name="10768"
      > </a
      ><a name="10769" href="2016-03-20-one-lambda-calculus-many-times.html#10769" class="Bound"
      >g</a
      ><a name="10770" class="Symbol"
      >)</a
      ><a name="10771"
      > </a
      ><a name="10772" class="Symbol"
      >=</a
      ><a name="10773"
      > </a
      ><a name="10774" href="2016-03-20-one-lambda-calculus-many-times.html#5490" class="InductiveConstructor"
      >&#8658;e</a
      ><a name="10776"
      > </a
      ><a name="10777" class="Symbol"
      >(</a
      ><a name="10778" href="2016-03-20-one-lambda-calculus-many-times.html#5441" class="InductiveConstructor"
      >&#8658;i</a
      ><a name="10780"
      > </a
      ><a name="10781" class="Symbol"
      >(</a
      ><a name="10782" href="2016-03-20-one-lambda-calculus-many-times.html#10709" class="Function"
      >&#10232;</a
      ><a name="10783"
      > </a
      ><a name="10784" href="2016-03-20-one-lambda-calculus-many-times.html#10769" class="Bound"
      >g</a
      ><a name="10785" class="Symbol"
      >))</a
      ><a name="10787"
      > </a
      ><a name="10788" class="Symbol"
      >(</a
      ><a name="10789" href="2016-03-20-one-lambda-calculus-many-times.html#10709" class="Function"
      >&#10232;</a
      ><a name="10790"
      > </a
      ><a name="10791" href="2016-03-20-one-lambda-calculus-many-times.html#10767" class="Bound"
      >f</a
      ><a name="10792" class="Symbol"
      >)</a
      ><a name="10793"
      >
    </a
      ><a name="10798" href="2016-03-20-one-lambda-calculus-many-times.html#10709" class="Function"
      >&#10232;</a
      ><a name="10799"
      > </a
      ><a name="10800" class="Symbol"
      >(</a
      ><a name="10801" href="2016-03-20-one-lambda-calculus-many-times.html#9917" class="InductiveConstructor"
      >&#8658;l</a
      ><a name="10803"
      >  </a
      ><a name="10805" href="2016-03-20-one-lambda-calculus-many-times.html#10805" class="Bound"
      >f</a
      ><a name="10806"
      > </a
      ><a name="10807" href="2016-03-20-one-lambda-calculus-many-times.html#10807" class="Bound"
      >g</a
      ><a name="10808" class="Symbol"
      >)</a
      ><a name="10809"
      > </a
      ><a name="10810" class="Symbol"
      >=</a
      ><a name="10811"
      > </a
      ><a name="10812" href="2016-03-20-one-lambda-calculus-many-times.html#5490" class="InductiveConstructor"
      >&#8658;e</a
      ><a name="10814"
      > </a
      ><a name="10815" class="Symbol"
      >(</a
      ><a name="10816" href="2016-03-20-one-lambda-calculus-many-times.html#8605" class="Function"
      >w&#8242;</a
      ><a name="10818"
      > </a
      ><a name="10819" class="Symbol"
      >(</a
      ><a name="10820" href="2016-03-20-one-lambda-calculus-many-times.html#5441" class="InductiveConstructor"
      >&#8658;i</a
      ><a name="10822"
      > </a
      ><a name="10823" class="Symbol"
      >(</a
      ><a name="10824" href="2016-03-20-one-lambda-calculus-many-times.html#10709" class="Function"
      >&#10232;</a
      ><a name="10825"
      > </a
      ><a name="10826" href="2016-03-20-one-lambda-calculus-many-times.html#10807" class="Bound"
      >g</a
      ><a name="10827" class="Symbol"
      >)))</a
      ><a name="10830"
      > </a
      ><a name="10831" class="Symbol"
      >(</a
      ><a name="10832" href="2016-03-20-one-lambda-calculus-many-times.html#5490" class="InductiveConstructor"
      >&#8658;e</a
      ><a name="10834"
      > </a
      ><a name="10835" href="2016-03-20-one-lambda-calculus-many-times.html#10228" class="InductiveConstructor"
      >ax&#8320;</a
      ><a name="10838"
      > </a
      ><a name="10839" class="Symbol"
      >(</a
      ><a name="10840" href="2016-03-20-one-lambda-calculus-many-times.html#8605" class="Function"
      >w&#8242;</a
      ><a name="10842"
      > </a
      ><a name="10843" class="Symbol"
      >(</a
      ><a name="10844" href="2016-03-20-one-lambda-calculus-many-times.html#10709" class="Function"
      >&#10232;</a
      ><a name="10845"
      > </a
      ><a name="10846" href="2016-03-20-one-lambda-calculus-many-times.html#10805" class="Bound"
      >f</a
      ><a name="10847" class="Symbol"
      >)))</a
      ><a name="10850"
      >
    </a
      ><a name="10855" href="2016-03-20-one-lambda-calculus-many-times.html#10709" class="Function"
      >&#10232;</a
      ><a name="10856"
      > </a
      ><a name="10857" class="Symbol"
      >(</a
      ><a name="10858" href="2016-03-20-one-lambda-calculus-many-times.html#9984" class="InductiveConstructor"
      >&#8658;r</a
      ><a name="10860"
      >  </a
      ><a name="10862" href="2016-03-20-one-lambda-calculus-many-times.html#10862" class="Bound"
      >f</a
      ><a name="10863" class="Symbol"
      >)</a
      ><a name="10864"
      >   </a
      ><a name="10867" class="Symbol"
      >=</a
      ><a name="10868"
      > </a
      ><a name="10869" href="2016-03-20-one-lambda-calculus-many-times.html#5441" class="InductiveConstructor"
      >&#8658;i</a
      ><a name="10871"
      > </a
      ><a name="10872" class="Symbol"
      >(</a
      ><a name="10873" href="2016-03-20-one-lambda-calculus-many-times.html#10709" class="Function"
      >&#10232;</a
      ><a name="10874"
      > </a
      ><a name="10875" href="2016-03-20-one-lambda-calculus-many-times.html#10862" class="Bound"
      >f</a
      ><a name="10876" class="Symbol"
      >)</a
      >
</pre><!--{% endraw %}-->

The rules for sequent calculus obviously no longer correspond *directly*
to the λ-calculus. However, we've just shown that there is in fact
*some* correspondence between them.
In the λ-calculus, computation is represented by β-reduction, which is
the iterative removal of redexes

$$(\lambda x.M)\; N\mapsto M[x := N]$$

Likewise, sequent calculus comes equipped with its own notion of
computation: cut-elimination. And the beautiful thing about cut
elimination is that it has a *very* concrete normal form. Instead of
faffing about, claiming the structure is free of β-redexes, cut
elimination---as its name implies---allows you to remove the entire
structural rule of $$cut$$. It would be interesting to show exactly
what kind of relation cut elimination has to β-reduction...

*Alas*! It may be too much effort for a single post to implement both of
these logics *and* a procedure for cut elimination. However, there
*is* a much simpler thing we can do. Agda itself has a pretty
servicable implementation of β-reduction for Agda terms, and we can
quite easily piggyback on that mechanism. In fact, most of the
articles I linked to at the beginning do exactly this.


### Interpretations in Agda

As a first step, we write down what an interpretation is---and since
we want to use the intepretation brackets in as many places as
possible, we create a type class for it, and give <a href="#12173"
class="Agda Field Operator">⟦_⟧</a> the least restrictive type
possible:

<div class="hidden">
<!--{% raw %}--><pre class="Agda">
<a name="12396" class="Keyword"
      >open</a
      ><a name="12400"
      > </a
      ><a name="12401" class="Keyword"
      >import</a
      ><a name="12407"
      > </a
      ><a name="12408" href="https://agda.github.io/agda-stdlib/Level.html#1" class="Module"
      >Level</a
      ><a name="12413"
      > </a
      ><a name="12414" class="Keyword"
      >using</a
      ><a name="12419"
      > </a
      ><a name="12420" class="Symbol"
      >(</a
      ><a name="12421" href="Agda.Primitive.html#626" class="Primitive Operator"
      >_&#8852;_</a
      ><a name="12424" class="Symbol"
      >)</a
      >
</pre><!--{% endraw %}-->
</div>
<!--{% raw %}--><pre class="Agda">
<a name="12457" class="Keyword"
      >record</a
      ><a name="12463"
      > </a
      ><a name="12464" href="2016-03-20-one-lambda-calculus-many-times.html#12464" class="Record"
      >Interpret</a
      ><a name="12473"
      > </a
      ><a name="12482" class="Symbol"
      >(</a
      ><a name="12483" href="2016-03-20-one-lambda-calculus-many-times.html#12483" class="Bound"
      >A</a
      ><a name="12484"
      > </a
      ><a name="12485" class="Symbol"
      >:</a
      ><a name="12486"
      > </a
      ><a name="12487" class="PrimitiveType"
      >Set</a
      ><a name="12490"
      > </a
      ><a name="12491" href="2016-03-20-one-lambda-calculus-many-times.html#12475" class="Bound"
      >a</a
      ><a name="12492" class="Symbol"
      >)</a
      ><a name="12493"
      > </a
      ><a name="12494" class="Symbol"
      >(</a
      ><a name="12495" href="2016-03-20-one-lambda-calculus-many-times.html#12495" class="Bound"
      >B</a
      ><a name="12496"
      > </a
      ><a name="12497" class="Symbol"
      >:</a
      ><a name="12498"
      > </a
      ><a name="12499" class="PrimitiveType"
      >Set</a
      ><a name="12502"
      > </a
      ><a name="12503" href="2016-03-20-one-lambda-calculus-many-times.html#12479" class="Bound"
      >b</a
      ><a name="12504" class="Symbol"
      >)</a
      ><a name="12505"
      > </a
      ><a name="12506" class="Symbol"
      >:</a
      ><a name="12507"
      > </a
      ><a name="12508" class="PrimitiveType"
      >Set</a
      ><a name="12511"
      > </a
      ><a name="12512" class="Symbol"
      >(</a
      ><a name="12513" href="2016-03-20-one-lambda-calculus-many-times.html#12475" class="Bound"
      >a</a
      ><a name="12514"
      > </a
      ><a name="12515" href="Agda.Primitive.html#626" class="Primitive Operator"
      >&#8852;</a
      ><a name="12516"
      > </a
      ><a name="12517" href="2016-03-20-one-lambda-calculus-many-times.html#12479" class="Bound"
      >b</a
      ><a name="12518" class="Symbol"
      >)</a
      ><a name="12519"
      > </a
      ><a name="12520" class="Keyword"
      >where</a
      ><a name="12525"
      >
  </a
      ><a name="12528" class="Keyword"
      >field</a
      ><a name="12533"
      >
    </a
      ><a name="12538" href="2016-03-20-one-lambda-calculus-many-times.html#12538" class="Field Operator"
      >&#10214;_&#10215;</a
      ><a name="12541"
      > </a
      ><a name="12542" class="Symbol"
      >:</a
      ><a name="12543"
      > </a
      ><a name="12544" href="2016-03-20-one-lambda-calculus-many-times.html#12483" class="Bound"
      >A</a
      ><a name="12545"
      > </a
      ><a name="12546" class="Symbol"
      >&#8594;</a
      ><a name="12547"
      > </a
      ><a name="12548" href="2016-03-20-one-lambda-calculus-many-times.html#12495" class="Bound"
      >B</a
      ><a name="12549"
      >
</a
      ><a name="12550" class="Keyword"
      >open</a
      ><a name="12554"
      > </a
      ><a name="12555" href="2016-03-20-one-lambda-calculus-many-times.html#12464" class="Module"
      >Interpret</a
      ><a name="12564"
      > </a
      ><a name="12565" class="Symbol"
      >{{...}}</a
      >
</pre><!--{% endraw %}-->

Now, in order to interpret natural deduction proofs in Agda, we'll
need an interpretation for the atomic types. Below we say as much:

<!--{% raw %}--><pre class="Agda">
<a name="12733" class="Keyword"
      >module</a
      ><a name="12739"
      > </a
      ><a name="12740" href="2016-03-20-one-lambda-calculus-many-times.html#12740" class="Module"
      >Semantics</a
      ><a name="12749"
      > </a
      ><a name="12750" class="Symbol"
      >(</a
      ><a name="12751" href="2016-03-20-one-lambda-calculus-many-times.html#12751" class="Bound"
      >Atom</a
      ><a name="12755"
      > </a
      ><a name="12756" class="Symbol"
      >:</a
      ><a name="12757"
      > </a
      ><a name="12758" class="PrimitiveType"
      >Set</a
      ><a name="12761" class="Symbol"
      >)</a
      ><a name="12762"
      > </a
      ><a name="12763" class="Symbol"
      >{{</a
      ><a name="12765" href="2016-03-20-one-lambda-calculus-many-times.html#12765" class="Bound"
      >InterpretAtom</a
      ><a name="12778"
      > </a
      ><a name="12779" class="Symbol"
      >:</a
      ><a name="12780"
      > </a
      ><a name="12781" href="2016-03-20-one-lambda-calculus-many-times.html#12464" class="Record"
      >Interpret</a
      ><a name="12790"
      > </a
      ><a name="12791" href="2016-03-20-one-lambda-calculus-many-times.html#12751" class="Bound"
      >Atom</a
      ><a name="12795"
      > </a
      ><a name="12796" class="PrimitiveType"
      >Set</a
      ><a name="12799" class="Symbol"
      >}}</a
      ><a name="12801"
      > </a
      ><a name="12802" class="Keyword"
      >where</a
      >
</pre><!--{% endraw %}-->

<div class="hidden">
<!--{% raw %}--><pre class="Agda">
  <a name="12856" class="Keyword"
      >open</a
      ><a name="12860"
      > </a
      ><a name="12861" href="2016-03-20-one-lambda-calculus-many-times.html#1568" class="Module"
      >Syntax</a
      ><a name="12867"
      > </a
      ><a name="12868" href="2016-03-20-one-lambda-calculus-many-times.html#12751" class="Bound"
      >Atom</a
      ><a name="12872"
      >
  </a
      ><a name="12875" class="Keyword"
      >open</a
      ><a name="12879"
      > </a
      ><a name="12880" class="Keyword"
      >import</a
      ><a name="12886"
      > </a
      ><a name="12887" href="https://agda.github.io/agda-stdlib/Data.Empty.html#1" class="Module"
      >Data.Empty</a
      ><a name="12897"
      >           </a
      ><a name="12908" class="Keyword"
      >using</a
      ><a name="12913"
      > </a
      ><a name="12914" class="Symbol"
      >(</a
      ><a name="12915" href="https://agda.github.io/agda-stdlib/Data.Empty.html#348" class="Function"
      >&#8869;-elim</a
      ><a name="12921" class="Symbol"
      >)</a
      ><a name="12922"
      >
  </a
      ><a name="12925" class="Keyword"
      >open</a
      ><a name="12929"
      > </a
      ><a name="12930" class="Keyword"
      >import</a
      ><a name="12936"
      > </a
      ><a name="12937" href="https://agda.github.io/agda-stdlib/Data.List.html#1" class="Module"
      >Data.List</a
      ><a name="12946"
      >            </a
      ><a name="12958" class="Keyword"
      >using</a
      ><a name="12963"
      > </a
      ><a name="12964" class="Symbol"
      >(</a
      ><a name="12965" href="Agda.Builtin.List.html#52" class="Datatype"
      >List</a
      ><a name="12969" class="Symbol"
      >;</a
      ><a name="12970"
      > </a
      ><a name="12971" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >_&#8759;_</a
      ><a name="12974" class="Symbol"
      >;</a
      ><a name="12975"
      > </a
      ><a name="12976" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#5519" class="InductiveConstructor"
      >[]</a
      ><a name="12978" class="Symbol"
      >;</a
      ><a name="12979"
      > </a
      ><a name="12980" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#1207" class="Function"
      >map</a
      ><a name="12983" class="Symbol"
      >)</a
      ><a name="12984"
      >
  </a
      ><a name="12987" class="Keyword"
      >open</a
      ><a name="12991"
      > </a
      ><a name="12992" class="Keyword"
      >import</a
      ><a name="12998"
      > </a
      ><a name="12999" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1" class="Module"
      >Data.List.Any</a
      ><a name="13012"
      >        </a
      ><a name="13020" class="Keyword"
      >using</a
      ><a name="13025"
      > </a
      ><a name="13026" class="Symbol"
      >(</a
      ><a name="13027" class="Keyword"
      >module</a
      ><a name="13033"
      > </a
      ><a name="13034" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#250" class="Module"
      >Membership</a
      ><a name="13044" class="Symbol"
      >;</a
      ><a name="13045"
      > </a
      ><a name="13046" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="13050" class="Symbol"
      >;</a
      ><a name="13051"
      > </a
      ><a name="13052" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="13057" class="Symbol"
      >)</a
      ><a name="13058"
      >
  </a
      ><a name="13061" class="Keyword"
      >open</a
      ><a name="13065"
      > </a
      ><a name="13066" class="Keyword"
      >import</a
      ><a name="13072"
      > </a
      ><a name="13073" href="https://agda.github.io/agda-stdlib/Function.html#1" class="Module"
      >Function</a
      ><a name="13081"
      >             </a
      ><a name="13094" class="Keyword"
      >using</a
      ><a name="13099"
      > </a
      ><a name="13100" class="Symbol"
      >(</a
      ><a name="13101" href="https://agda.github.io/agda-stdlib/Function.html#713" class="Function Operator"
      >_&#8728;_</a
      ><a name="13104" class="Symbol"
      >)</a
      ><a name="13105"
      >
  </a
      ><a name="13108" class="Keyword"
      >open</a
      ><a name="13112"
      > </a
      ><a name="13113" class="Keyword"
      >import</a
      ><a name="13119"
      > </a
      ><a name="13120" href="https://agda.github.io/agda-stdlib/Function.Equality.html#1" class="Module"
      >Function.Equality</a
      ><a name="13137"
      >    </a
      ><a name="13141" class="Keyword"
      >using</a
      ><a name="13146"
      > </a
      ><a name="13147" class="Symbol"
      >(</a
      ><a name="13148" href="https://agda.github.io/agda-stdlib/Function.Equality.html#681" class="Field Operator"
      >_&#10216;$&#10217;_</a
      ><a name="13153" class="Symbol"
      >)</a
      ><a name="13154"
      >
  </a
      ><a name="13157" class="Keyword"
      >open</a
      ><a name="13161"
      > </a
      ><a name="13162" class="Keyword"
      >import</a
      ><a name="13168"
      > </a
      ><a name="13169" href="https://agda.github.io/agda-stdlib/Function.Equivalence.html#1" class="Module"
      >Function.Equivalence</a
      ><a name="13189"
      > </a
      ><a name="13190" class="Keyword"
      >using</a
      ><a name="13195"
      > </a
      ><a name="13196" class="Symbol"
      >(</a
      ><a name="13197" class="Keyword"
      >module</a
      ><a name="13203"
      > </a
      ><a name="13204" href="https://agda.github.io/agda-stdlib/Function.Equivalence.html#218" class="Module"
      >Equivalence</a
      ><a name="13215" class="Symbol"
      >)</a
      ><a name="13216"
      >
  </a
      ><a name="13219" class="Keyword"
      >open</a
      ><a name="13223"
      > </a
      ><a name="13224" class="Keyword"
      >import</a
      ><a name="13230"
      > </a
      ><a name="13231" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.html#1" class="Module"
      >Relation.Binary.PropositionalEquality</a
      ><a name="13268"
      >
  </a
      ><a name="13271" class="Keyword"
      >open</a
      ><a name="13275"
      > </a
      ><a name="13276" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#2298" class="Module"
      >Membership</a
      ><a name="13286"
      > </a
      ><a name="13287" class="Symbol"
      >(</a
      ><a name="13288" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.html#1526" class="Function"
      >setoid</a
      ><a name="13294"
      > </a
      ><a name="13295" href="2016-03-20-one-lambda-calculus-many-times.html#2651" class="Datatype"
      >Type</a
      ><a name="13299" class="Symbol"
      >)</a
      ><a name="13300"
      >    </a
      ><a name="13304" class="Keyword"
      >using</a
      ><a name="13309"
      > </a
      ><a name="13310" class="Symbol"
      >(</a
      ><a name="13311"
      >_&#8712;_</a
      ><a name="13314" class="Symbol"
      >;</a
      ><a name="13315"
      > _&#8838;_</a
      ><a name="13319" class="Symbol"
      >)</a
      ><a name="13320"
      >
  </a
      ><a name="13323" class="Keyword"
      >open</a
      ><a name="13327"
      > </a
      ><a name="13328" href="https://agda.github.io/agda-stdlib/Function.Equivalence.html#488" class="Module"
      >Equivalence</a
      ><a name="13339"
      >                 </a
      ><a name="13356" class="Keyword"
      >using</a
      ><a name="13361"
      > </a
      ><a name="13362" class="Symbol"
      >(</a
      ><a name="13363" href="https://agda.github.io/agda-stdlib/Function.Equivalence.html#638" class="Field"
      >to</a
      ><a name="13365" class="Symbol"
      >;</a
      ><a name="13366"
      > </a
      ><a name="13367" href="https://agda.github.io/agda-stdlib/Function.Equivalence.html#659" class="Field"
      >from</a
      ><a name="13371" class="Symbol"
      >)</a
      >
</pre><!--{% endraw %}-->
</div>

Unsurprisingly, we interpret the implication as Agda's function type:

<!--{% raw %}--><pre class="Agda">
  <a name="13478" class="Keyword"
      >instance</a
      ><a name="13486"
      >
    </a
      ><a name="13491" href="2016-03-20-one-lambda-calculus-many-times.html#13491" class="Function"
      >InterpretType</a
      ><a name="13504"
      > </a
      ><a name="13505" class="Symbol"
      >:</a
      ><a name="13506"
      > </a
      ><a name="13507" href="2016-03-20-one-lambda-calculus-many-times.html#12464" class="Record"
      >Interpret</a
      ><a name="13516"
      > </a
      ><a name="13517" href="2016-03-20-one-lambda-calculus-many-times.html#2651" class="Datatype"
      >Type</a
      ><a name="13521"
      > </a
      ><a name="13522" class="PrimitiveType"
      >Set</a
      ><a name="13525"
      >
    </a
      ><a name="13530" href="2016-03-20-one-lambda-calculus-many-times.html#13491" class="Function"
      >InterpretType</a
      ><a name="13543"
      > </a
      ><a name="13544" class="Symbol"
      >=</a
      ><a name="13545"
      > </a
      ><a name="13546" class="Keyword"
      >record</a
      ><a name="13552"
      > </a
      ><a name="13553" class="Symbol"
      >{</a
      ><a name="13554"
      > </a
      ><a name="13555" class="Field Operator"
      >&#10214;_&#10215;</a
      ><a name="13558"
      > </a
      ><a name="13559" class="Symbol"
      >=</a
      ><a name="13560"
      > </a
      ><a name="13561" href="2016-03-20-one-lambda-calculus-many-times.html#13588" class="Function Operator"
      >&#10214;_&#10215;&#8242;</a
      ><a name="13565"
      > </a
      ><a name="13566" class="Symbol"
      >}</a
      ><a name="13567"
      >
      </a
      ><a name="13574" class="Keyword"
      >where</a
      ><a name="13579"
      >
        </a
      ><a name="13588" href="2016-03-20-one-lambda-calculus-many-times.html#13588" class="Function Operator"
      >&#10214;_&#10215;&#8242;</a
      ><a name="13592"
      >  </a
      ><a name="13594" class="Symbol"
      >:</a
      ><a name="13595"
      > </a
      ><a name="13596" href="2016-03-20-one-lambda-calculus-many-times.html#2651" class="Datatype"
      >Type</a
      ><a name="13600"
      > </a
      ><a name="13601" class="Symbol"
      >&#8594;</a
      ><a name="13602"
      > </a
      ><a name="13603" class="PrimitiveType"
      >Set</a
      ><a name="13606"
      >
        </a
      ><a name="13615" href="2016-03-20-one-lambda-calculus-many-times.html#13588" class="Function Operator"
      >&#10214;</a
      ><a name="13616"
      > </a
      ><a name="13617" href="2016-03-20-one-lambda-calculus-many-times.html#2672" class="InductiveConstructor"
      >El</a
      ><a name="13619"
      >  </a
      ><a name="13621" href="2016-03-20-one-lambda-calculus-many-times.html#13621" class="Bound"
      >A</a
      ><a name="13622"
      > </a
      ><a name="13623" href="2016-03-20-one-lambda-calculus-many-times.html#13588" class="Function Operator"
      >&#10215;&#8242;</a
      ><a name="13625"
      > </a
      ><a name="13626" class="Symbol"
      >=</a
      ><a name="13627"
      > </a
      ><a name="13628" href="2016-03-20-one-lambda-calculus-many-times.html#12538" class="Field Operator"
      >&#10214;</a
      ><a name="13629"
      > </a
      ><a name="13630" href="2016-03-20-one-lambda-calculus-many-times.html#13621" class="Bound"
      >A</a
      ><a name="13631"
      > </a
      ><a name="13632" href="2016-03-20-one-lambda-calculus-many-times.html#12538" class="Field Operator"
      >&#10215;</a
      ><a name="13633"
      >
        </a
      ><a name="13642" href="2016-03-20-one-lambda-calculus-many-times.html#13588" class="Function Operator"
      >&#10214;</a
      ><a name="13643"
      > </a
      ><a name="13644" href="2016-03-20-one-lambda-calculus-many-times.html#13644" class="Bound"
      >A</a
      ><a name="13645"
      > </a
      ><a name="13646" href="2016-03-20-one-lambda-calculus-many-times.html#2694" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="13647"
      > </a
      ><a name="13648" href="2016-03-20-one-lambda-calculus-many-times.html#13648" class="Bound"
      >B</a
      ><a name="13649"
      > </a
      ><a name="13650" href="2016-03-20-one-lambda-calculus-many-times.html#13588" class="Function Operator"
      >&#10215;&#8242;</a
      ><a name="13652"
      > </a
      ><a name="13653" class="Symbol"
      >=</a
      ><a name="13654"
      > </a
      ><a name="13655" href="2016-03-20-one-lambda-calculus-many-times.html#13588" class="Function Operator"
      >&#10214;</a
      ><a name="13656"
      > </a
      ><a name="13657" href="2016-03-20-one-lambda-calculus-many-times.html#13644" class="Bound"
      >A</a
      ><a name="13658"
      > </a
      ><a name="13659" href="2016-03-20-one-lambda-calculus-many-times.html#13588" class="Function Operator"
      >&#10215;&#8242;</a
      ><a name="13661"
      > </a
      ><a name="13662" class="Symbol"
      >&#8594;</a
      ><a name="13663"
      > </a
      ><a name="13664" href="2016-03-20-one-lambda-calculus-many-times.html#13588" class="Function Operator"
      >&#10214;</a
      ><a name="13665"
      > </a
      ><a name="13666" href="2016-03-20-one-lambda-calculus-many-times.html#13648" class="Bound"
      >B</a
      ><a name="13667"
      > </a
      ><a name="13668" href="2016-03-20-one-lambda-calculus-many-times.html#13588" class="Function Operator"
      >&#10215;&#8242;</a
      >
</pre><!--{% endraw %}-->

In order to interpret sequents, we'll need an interpretation for the
antecedent. For this we'll create a type for *environments*, <a
class="Agda Datatype">Env</a>, which is indexed by a list of types, and
which stores values of the *interpretations* of those types:

<!--{% raw %}--><pre class="Agda">
  <a name="13965" class="Keyword"
      >infixr</a
      ><a name="13971"
      > </a
      ><a name="13972" class="Number"
      >5</a
      ><a name="13973"
      > _&#8759;_

  </a
      ><a name="13981" class="Keyword"
      >data</a
      ><a name="13985"
      > </a
      ><a name="13986" href="2016-03-20-one-lambda-calculus-many-times.html#13986" class="Datatype"
      >Env</a
      ><a name="13989"
      > </a
      ><a name="13990" class="Symbol"
      >:</a
      ><a name="13991"
      > </a
      ><a name="13992" href="Agda.Builtin.List.html#52" class="Datatype"
      >List</a
      ><a name="13996"
      > </a
      ><a name="13997" href="2016-03-20-one-lambda-calculus-many-times.html#2651" class="Datatype"
      >Type</a
      ><a name="14001"
      > </a
      ><a name="14002" class="Symbol"
      >&#8594;</a
      ><a name="14003"
      > </a
      ><a name="14004" class="PrimitiveType"
      >Set</a
      ><a name="14007"
      > </a
      ><a name="14008" class="Keyword"
      >where</a
      ><a name="14013"
      >
    </a
      ><a name="14018" href="2016-03-20-one-lambda-calculus-many-times.html#14018" class="InductiveConstructor"
      >[]</a
      ><a name="14020"
      >  </a
      ><a name="14022" class="Symbol"
      >:</a
      ><a name="14023"
      > </a
      ><a name="14024" href="2016-03-20-one-lambda-calculus-many-times.html#13986" class="Datatype"
      >Env</a
      ><a name="14027"
      > </a
      ><a name="14028" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="14030"
      >
    </a
      ><a name="14035" href="2016-03-20-one-lambda-calculus-many-times.html#14035" class="InductiveConstructor Operator"
      >_&#8759;_</a
      ><a name="14038"
      > </a
      ><a name="14039" class="Symbol"
      >:</a
      ><a name="14040"
      > </a
      ><a name="14068" class="Symbol"
      >&#8594;</a
      ><a name="14069"
      > </a
      ><a name="14070" href="2016-03-20-one-lambda-calculus-many-times.html#12538" class="Field Operator"
      >&#10214;</a
      ><a name="14071"
      > </a
      ><a name="14072" href="2016-03-20-one-lambda-calculus-many-times.html#14042" class="Bound"
      >A</a
      ><a name="14073"
      > </a
      ><a name="14074" href="2016-03-20-one-lambda-calculus-many-times.html#12538" class="Field Operator"
      >&#10215;</a
      ><a name="14075"
      > </a
      ><a name="14076" class="Symbol"
      >&#8594;</a
      ><a name="14077"
      > </a
      ><a name="14078" href="2016-03-20-one-lambda-calculus-many-times.html#13986" class="Datatype"
      >Env</a
      ><a name="14081"
      > </a
      ><a name="14082" href="2016-03-20-one-lambda-calculus-many-times.html#14053" class="Bound"
      >&#915;</a
      ><a name="14083"
      > </a
      ><a name="14084" class="Symbol"
      >&#8594;</a
      ><a name="14085"
      > </a
      ><a name="14086" href="2016-03-20-one-lambda-calculus-many-times.html#13986" class="Datatype"
      >Env</a
      ><a name="14089"
      > </a
      ><a name="14090" class="Symbol"
      >(</a
      ><a name="14091" href="2016-03-20-one-lambda-calculus-many-times.html#14042" class="Bound"
      >A</a
      ><a name="14092"
      > </a
      ><a name="14093" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="14094"
      > </a
      ><a name="14095" href="2016-03-20-one-lambda-calculus-many-times.html#14053" class="Bound"
      >&#915;</a
      ><a name="14096" class="Symbol"
      >)</a
      >
</pre><!--{% endraw %}-->

Using this, we can interpret sequents as functions from environments
to values:

<!--{% raw %}--><pre class="Agda">
  <a name="14206" class="Keyword"
      >instance</a
      ><a name="14214"
      >
    </a
      ><a name="14219" href="2016-03-20-one-lambda-calculus-many-times.html#14219" class="Function"
      >InterpretSequent</a
      ><a name="14235"
      > </a
      ><a name="14236" class="Symbol"
      >:</a
      ><a name="14237"
      > </a
      ><a name="14238" href="2016-03-20-one-lambda-calculus-many-times.html#12464" class="Record"
      >Interpret</a
      ><a name="14247"
      > </a
      ><a name="14248" href="2016-03-20-one-lambda-calculus-many-times.html#3957" class="Datatype"
      >Sequent</a
      ><a name="14255"
      > </a
      ><a name="14256" class="PrimitiveType"
      >Set</a
      ><a name="14259"
      >
    </a
      ><a name="14264" href="2016-03-20-one-lambda-calculus-many-times.html#14219" class="Function"
      >InterpretSequent</a
      ><a name="14280"
      > </a
      ><a name="14281" class="Symbol"
      >=</a
      ><a name="14282"
      > </a
      ><a name="14283" class="Keyword"
      >record</a
      ><a name="14289"
      > </a
      ><a name="14290" class="Symbol"
      >{</a
      ><a name="14291"
      > </a
      ><a name="14292" class="Field Operator"
      >&#10214;_&#10215;</a
      ><a name="14295"
      > </a
      ><a name="14296" class="Symbol"
      >=</a
      ><a name="14297"
      > </a
      ><a name="14298" href="2016-03-20-one-lambda-calculus-many-times.html#14325" class="Function Operator"
      >&#10214;_&#10215;&#8242;</a
      ><a name="14302"
      > </a
      ><a name="14303" class="Symbol"
      >}</a
      ><a name="14304"
      >
      </a
      ><a name="14311" class="Keyword"
      >where</a
      ><a name="14316"
      >
        </a
      ><a name="14325" href="2016-03-20-one-lambda-calculus-many-times.html#14325" class="Function Operator"
      >&#10214;_&#10215;&#8242;</a
      ><a name="14329"
      > </a
      ><a name="14330" class="Symbol"
      >:</a
      ><a name="14331"
      > </a
      ><a name="14332" href="2016-03-20-one-lambda-calculus-many-times.html#3957" class="Datatype"
      >Sequent</a
      ><a name="14339"
      > </a
      ><a name="14340" class="Symbol"
      >&#8594;</a
      ><a name="14341"
      > </a
      ><a name="14342" class="PrimitiveType"
      >Set</a
      ><a name="14345"
      >
        </a
      ><a name="14354" href="2016-03-20-one-lambda-calculus-many-times.html#14325" class="Function Operator"
      >&#10214;</a
      ><a name="14355"
      > </a
      ><a name="14356" href="2016-03-20-one-lambda-calculus-many-times.html#14356" class="Bound"
      >&#915;</a
      ><a name="14357"
      > </a
      ><a name="14358" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="14359"
      > </a
      ><a name="14360" href="2016-03-20-one-lambda-calculus-many-times.html#14360" class="Bound"
      >A</a
      ><a name="14361"
      > </a
      ><a name="14362" href="2016-03-20-one-lambda-calculus-many-times.html#14325" class="Function Operator"
      >&#10215;&#8242;</a
      ><a name="14364"
      > </a
      ><a name="14365" class="Symbol"
      >=</a
      ><a name="14366"
      > </a
      ><a name="14367" href="2016-03-20-one-lambda-calculus-many-times.html#13986" class="Datatype"
      >Env</a
      ><a name="14370"
      > </a
      ><a name="14371" href="2016-03-20-one-lambda-calculus-many-times.html#14356" class="Bound"
      >&#915;</a
      ><a name="14372"
      > </a
      ><a name="14373" class="Symbol"
      >&#8594;</a
      ><a name="14374"
      > </a
      ><a name="14375" href="2016-03-20-one-lambda-calculus-many-times.html#12538" class="Field Operator"
      >&#10214;</a
      ><a name="14376"
      > </a
      ><a name="14377" href="2016-03-20-one-lambda-calculus-many-times.html#14360" class="Bound"
      >A</a
      ><a name="14378"
      > </a
      ><a name="14379" href="2016-03-20-one-lambda-calculus-many-times.html#12538" class="Field Operator"
      >&#10215;</a
      >
</pre><!--{% endraw %}-->

Let's get to interpreting terms! First off, variables. We can
interpret variables simply by looking them up in the environment:

<!--{% raw %}--><pre class="Agda">
  <a name="14537" href="2016-03-20-one-lambda-calculus-many-times.html#14537" class="Function"
      >lookup</a
      ><a name="14543"
      > </a
      ><a name="14544" class="Symbol"
      >:</a
      ><a name="14545"
      > </a
      ><a name="14546" class="Symbol"
      >&#8704;</a
      ><a name="14547"
      > </a
      ><a name="14554" class="Symbol"
      >&#8594;</a
      ><a name="14555"
      > </a
      ><a name="14556" href="2016-03-20-one-lambda-calculus-many-times.html#14549" class="Bound"
      >A</a
      ><a name="14557"
      > </a
      ><a name="14558" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#2920" class="Function Operator"
      >&#8712;</a
      ><a name="14559"
      > </a
      ><a name="14560" href="2016-03-20-one-lambda-calculus-many-times.html#14551" class="Bound"
      >&#915;</a
      ><a name="14561"
      > </a
      ><a name="14562" class="Symbol"
      >&#8594;</a
      ><a name="14563"
      > </a
      ><a name="14564" href="2016-03-20-one-lambda-calculus-many-times.html#13986" class="Datatype"
      >Env</a
      ><a name="14567"
      > </a
      ><a name="14568" href="2016-03-20-one-lambda-calculus-many-times.html#14551" class="Bound"
      >&#915;</a
      ><a name="14569"
      > </a
      ><a name="14570" class="Symbol"
      >&#8594;</a
      ><a name="14571"
      > </a
      ><a name="14572" href="2016-03-20-one-lambda-calculus-many-times.html#12538" class="Field Operator"
      >&#10214;</a
      ><a name="14573"
      > </a
      ><a name="14574" href="2016-03-20-one-lambda-calculus-many-times.html#14549" class="Bound"
      >A</a
      ><a name="14575"
      > </a
      ><a name="14576" href="2016-03-20-one-lambda-calculus-many-times.html#12538" class="Field Operator"
      >&#10215;</a
      ><a name="14577"
      >
  </a
      ><a name="14580" href="2016-03-20-one-lambda-calculus-many-times.html#14537" class="Function"
      >lookup</a
      ><a name="14586"
      > </a
      ><a name="14587" class="Symbol"
      >(</a
      ><a name="14588" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="14592"
      >  </a
      ><a name="14594" href="2016-03-20-one-lambda-calculus-many-times.html#14594" class="Bound"
      >p</a
      ><a name="14595" class="Symbol"
      >)</a
      ><a name="14596"
      > </a
      ><a name="14597" class="Symbol"
      >(</a
      ><a name="14598" href="2016-03-20-one-lambda-calculus-many-times.html#14598" class="Bound"
      >x</a
      ><a name="14599"
      > </a
      ><a name="14600" href="2016-03-20-one-lambda-calculus-many-times.html#14035" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="14601"
      > </a
      ><a name="14602" class="Symbol"
      >_)</a
      ><a name="14604"
      > </a
      ><a name="14605" class="Keyword"
      >rewrite</a
      ><a name="14612"
      > </a
      ><a name="14613" href="2016-03-20-one-lambda-calculus-many-times.html#14594" class="Bound"
      >p</a
      ><a name="14614"
      > </a
      ><a name="14615" class="Symbol"
      >=</a
      ><a name="14616"
      > </a
      ><a name="14617" href="2016-03-20-one-lambda-calculus-many-times.html#14598" class="Bound"
      >x</a
      ><a name="14618"
      >
  </a
      ><a name="14621" href="2016-03-20-one-lambda-calculus-many-times.html#14537" class="Function"
      >lookup</a
      ><a name="14627"
      > </a
      ><a name="14628" class="Symbol"
      >(</a
      ><a name="14629" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="14634"
      > </a
      ><a name="14635" href="2016-03-20-one-lambda-calculus-many-times.html#14635" class="Bound"
      >p</a
      ><a name="14636" class="Symbol"
      >)</a
      ><a name="14637"
      > </a
      ><a name="14638" class="Symbol"
      >(_</a
      ><a name="14640"
      > </a
      ><a name="14641" href="2016-03-20-one-lambda-calculus-many-times.html#14035" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="14642"
      > </a
      ><a name="14643" href="2016-03-20-one-lambda-calculus-many-times.html#14643" class="Bound"
      >e</a
      ><a name="14644" class="Symbol"
      >)</a
      ><a name="14645"
      > </a
      ><a name="14646" class="Symbol"
      >=</a
      ><a name="14647"
      > </a
      ><a name="14648" href="2016-03-20-one-lambda-calculus-many-times.html#14537" class="Function"
      >lookup</a
      ><a name="14654"
      > </a
      ><a name="14655" href="2016-03-20-one-lambda-calculus-many-times.html#14635" class="Bound"
      >p</a
      ><a name="14656"
      > </a
      ><a name="14657" href="2016-03-20-one-lambda-calculus-many-times.html#14643" class="Bound"
      >e</a
      >
</pre><!--{% endraw %}-->


(If you're wondering what we're rewriting by: the <a class="Agda
InductiveConstructor" target="_blank"
href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174">here</a>
constructor carries a small proof that the element at the top of the
list is *really* the element you were looking for.)

The translation for natural deduction proofs is, of course, completely
routine---we translate variables withs lookups, introductions by
abstractions and eliminations by applications:

<!--{% raw %}--><pre class="Agda">
  <a name="15171" class="Keyword"
      >instance</a
      ><a name="15179"
      >
    </a
      ><a name="15184" href="2016-03-20-one-lambda-calculus-many-times.html#15184" class="Function"
      >InterpretND</a
      ><a name="15195"
      > </a
      ><a name="15196" class="Symbol"
      >:</a
      ><a name="15197"
      > </a
      ><a name="15198" class="Symbol"
      >&#8704;</a
      ><a name="15199"
      > </a
      ><a name="15204" class="Symbol"
      >&#8594;</a
      ><a name="15205"
      > </a
      ><a name="15206" href="2016-03-20-one-lambda-calculus-many-times.html#12464" class="Record"
      >Interpret</a
      ><a name="15215"
      > </a
      ><a name="15216" class="Symbol"
      >(</a
      ><a name="15217" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="15219"
      > </a
      ><a name="15220" href="2016-03-20-one-lambda-calculus-many-times.html#15201" class="Bound"
      >S</a
      ><a name="15221" class="Symbol"
      >)</a
      ><a name="15222"
      > </a
      ><a name="15223" href="2016-03-20-one-lambda-calculus-many-times.html#12538" class="Field Operator"
      >&#10214;</a
      ><a name="15224"
      > </a
      ><a name="15225" href="2016-03-20-one-lambda-calculus-many-times.html#15201" class="Bound"
      >S</a
      ><a name="15226"
      > </a
      ><a name="15227" href="2016-03-20-one-lambda-calculus-many-times.html#12538" class="Field Operator"
      >&#10215;</a
      ><a name="15228"
      >
    </a
      ><a name="15233" href="2016-03-20-one-lambda-calculus-many-times.html#15184" class="Function"
      >InterpretND</a
      ><a name="15244"
      > </a
      ><a name="15245" class="Symbol"
      >=</a
      ><a name="15246"
      > </a
      ><a name="15247" class="Keyword"
      >record</a
      ><a name="15253"
      > </a
      ><a name="15254" class="Symbol"
      >{</a
      ><a name="15255"
      > </a
      ><a name="15256" class="Field Operator"
      >&#10214;_&#10215;</a
      ><a name="15259"
      > </a
      ><a name="15260" class="Symbol"
      >=</a
      ><a name="15261"
      > </a
      ><a name="15262" href="2016-03-20-one-lambda-calculus-many-times.html#15289" class="Function Operator"
      >&#10214;_&#10215;&#8242;</a
      ><a name="15266"
      > </a
      ><a name="15267" class="Symbol"
      >}</a
      ><a name="15268"
      >
      </a
      ><a name="15275" class="Keyword"
      >where</a
      ><a name="15280"
      >
        </a
      ><a name="15289" href="2016-03-20-one-lambda-calculus-many-times.html#15289" class="Function Operator"
      >&#10214;_&#10215;&#8242;</a
      ><a name="15293"
      > </a
      ><a name="15294" class="Symbol"
      >:</a
      ><a name="15295"
      > </a
      ><a name="15296" class="Symbol"
      >&#8704;</a
      ><a name="15297"
      > </a
      ><a name="15302" class="Symbol"
      >&#8594;</a
      ><a name="15303"
      > </a
      ><a name="15304" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="15306"
      > </a
      ><a name="15307" href="2016-03-20-one-lambda-calculus-many-times.html#15299" class="Bound"
      >S</a
      ><a name="15308"
      > </a
      ><a name="15309" class="Symbol"
      >&#8594;</a
      ><a name="15310"
      > </a
      ><a name="15311" href="2016-03-20-one-lambda-calculus-many-times.html#12538" class="Field Operator"
      >&#10214;</a
      ><a name="15312"
      > </a
      ><a name="15313" href="2016-03-20-one-lambda-calculus-many-times.html#15299" class="Bound"
      >S</a
      ><a name="15314"
      > </a
      ><a name="15315" href="2016-03-20-one-lambda-calculus-many-times.html#12538" class="Field Operator"
      >&#10215;</a
      ><a name="15316"
      >
        </a
      ><a name="15325" href="2016-03-20-one-lambda-calculus-many-times.html#15289" class="Function Operator"
      >&#10214;</a
      ><a name="15326"
      > </a
      ><a name="15327" href="2016-03-20-one-lambda-calculus-many-times.html#5403" class="InductiveConstructor"
      >ax</a
      ><a name="15329"
      > </a
      ><a name="15330" href="2016-03-20-one-lambda-calculus-many-times.html#15330" class="Bound"
      >p</a
      ><a name="15331"
      >   </a
      ><a name="15334" href="2016-03-20-one-lambda-calculus-many-times.html#15289" class="Function Operator"
      >&#10215;&#8242;</a
      ><a name="15336"
      > </a
      ><a name="15337" href="2016-03-20-one-lambda-calculus-many-times.html#15337" class="Bound"
      >e</a
      ><a name="15338"
      > </a
      ><a name="15339" class="Symbol"
      >=</a
      ><a name="15340"
      > </a
      ><a name="15341" href="2016-03-20-one-lambda-calculus-many-times.html#14537" class="Function"
      >lookup</a
      ><a name="15347"
      > </a
      ><a name="15348" href="2016-03-20-one-lambda-calculus-many-times.html#15330" class="Bound"
      >p</a
      ><a name="15349"
      > </a
      ><a name="15350" href="2016-03-20-one-lambda-calculus-many-times.html#15337" class="Bound"
      >e</a
      ><a name="15351"
      >
        </a
      ><a name="15360" href="2016-03-20-one-lambda-calculus-many-times.html#15289" class="Function Operator"
      >&#10214;</a
      ><a name="15361"
      > </a
      ><a name="15362" href="2016-03-20-one-lambda-calculus-many-times.html#5441" class="InductiveConstructor"
      >&#8658;i</a
      ><a name="15364"
      > </a
      ><a name="15365" href="2016-03-20-one-lambda-calculus-many-times.html#15365" class="Bound"
      >f</a
      ><a name="15366"
      >   </a
      ><a name="15369" href="2016-03-20-one-lambda-calculus-many-times.html#15289" class="Function Operator"
      >&#10215;&#8242;</a
      ><a name="15371"
      > </a
      ><a name="15372" href="2016-03-20-one-lambda-calculus-many-times.html#15372" class="Bound"
      >e</a
      ><a name="15373"
      > </a
      ><a name="15374" class="Symbol"
      >=</a
      ><a name="15375"
      > </a
      ><a name="15376" class="Symbol"
      >&#955;</a
      ><a name="15377"
      > </a
      ><a name="15378" href="2016-03-20-one-lambda-calculus-many-times.html#15378" class="Bound"
      >x</a
      ><a name="15379"
      > </a
      ><a name="15380" class="Symbol"
      >&#8594;</a
      ><a name="15381"
      > </a
      ><a name="15382" href="2016-03-20-one-lambda-calculus-many-times.html#15289" class="Function Operator"
      >&#10214;</a
      ><a name="15383"
      > </a
      ><a name="15384" href="2016-03-20-one-lambda-calculus-many-times.html#15365" class="Bound"
      >f</a
      ><a name="15385"
      > </a
      ><a name="15386" href="2016-03-20-one-lambda-calculus-many-times.html#15289" class="Function Operator"
      >&#10215;&#8242;</a
      ><a name="15388"
      > </a
      ><a name="15389" class="Symbol"
      >(</a
      ><a name="15390" href="2016-03-20-one-lambda-calculus-many-times.html#15378" class="Bound"
      >x</a
      ><a name="15391"
      > </a
      ><a name="15392" href="2016-03-20-one-lambda-calculus-many-times.html#14035" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="15393"
      > </a
      ><a name="15394" href="2016-03-20-one-lambda-calculus-many-times.html#15372" class="Bound"
      >e</a
      ><a name="15395" class="Symbol"
      >)</a
      ><a name="15396"
      >
        </a
      ><a name="15405" href="2016-03-20-one-lambda-calculus-many-times.html#15289" class="Function Operator"
      >&#10214;</a
      ><a name="15406"
      > </a
      ><a name="15407" href="2016-03-20-one-lambda-calculus-many-times.html#5490" class="InductiveConstructor"
      >&#8658;e</a
      ><a name="15409"
      > </a
      ><a name="15410" href="2016-03-20-one-lambda-calculus-many-times.html#15410" class="Bound"
      >f</a
      ><a name="15411"
      > </a
      ><a name="15412" href="2016-03-20-one-lambda-calculus-many-times.html#15412" class="Bound"
      >g</a
      ><a name="15413"
      > </a
      ><a name="15414" href="2016-03-20-one-lambda-calculus-many-times.html#15289" class="Function Operator"
      >&#10215;&#8242;</a
      ><a name="15416"
      > </a
      ><a name="15417" href="2016-03-20-one-lambda-calculus-many-times.html#15417" class="Bound"
      >e</a
      ><a name="15418"
      > </a
      ><a name="15419" class="Symbol"
      >=</a
      ><a name="15420"
      > </a
      ><a name="15421" class="Symbol"
      >(</a
      ><a name="15422" href="2016-03-20-one-lambda-calculus-many-times.html#15289" class="Function Operator"
      >&#10214;</a
      ><a name="15423"
      > </a
      ><a name="15424" href="2016-03-20-one-lambda-calculus-many-times.html#15410" class="Bound"
      >f</a
      ><a name="15425"
      > </a
      ><a name="15426" href="2016-03-20-one-lambda-calculus-many-times.html#15289" class="Function Operator"
      >&#10215;&#8242;</a
      ><a name="15428"
      > </a
      ><a name="15429" href="2016-03-20-one-lambda-calculus-many-times.html#15417" class="Bound"
      >e</a
      ><a name="15430" class="Symbol"
      >)</a
      ><a name="15431"
      > </a
      ><a name="15432" class="Symbol"
      >(</a
      ><a name="15433" href="2016-03-20-one-lambda-calculus-many-times.html#15289" class="Function Operator"
      >&#10214;</a
      ><a name="15434"
      > </a
      ><a name="15435" href="2016-03-20-one-lambda-calculus-many-times.html#15412" class="Bound"
      >g</a
      ><a name="15436"
      > </a
      ><a name="15437" href="2016-03-20-one-lambda-calculus-many-times.html#15289" class="Function Operator"
      >&#10215;&#8242;</a
      ><a name="15439"
      > </a
      ><a name="15440" href="2016-03-20-one-lambda-calculus-many-times.html#15417" class="Bound"
      >e</a
      ><a name="15441" class="Symbol"
      >)</a
      >
</pre><!--{% endraw %}-->

Hooray! And even better,  as a corollary, we immediately obtain a
translation from sequent calculus into Agda:

<!--{% raw %}--><pre class="Agda">
  <a name="15582" class="Keyword"
      >instance</a
      ><a name="15590"
      >
    </a
      ><a name="15595" href="2016-03-20-one-lambda-calculus-many-times.html#15595" class="Function"
      >InterpretSC</a
      ><a name="15606"
      > </a
      ><a name="15607" class="Symbol"
      >:</a
      ><a name="15608"
      > </a
      ><a name="15609" class="Symbol"
      >&#8704;</a
      ><a name="15610"
      > </a
      ><a name="15615" class="Symbol"
      >&#8594;</a
      ><a name="15616"
      > </a
      ><a name="15617" href="2016-03-20-one-lambda-calculus-many-times.html#12464" class="Record"
      >Interpret</a
      ><a name="15626"
      > </a
      ><a name="15627" class="Symbol"
      >(</a
      ><a name="15628" href="2016-03-20-one-lambda-calculus-many-times.html#9787" class="Datatype Operator"
      >SC</a
      ><a name="15630"
      > </a
      ><a name="15631" href="2016-03-20-one-lambda-calculus-many-times.html#15612" class="Bound"
      >S</a
      ><a name="15632" class="Symbol"
      >)</a
      ><a name="15633"
      > </a
      ><a name="15634" href="2016-03-20-one-lambda-calculus-many-times.html#12538" class="Field Operator"
      >&#10214;</a
      ><a name="15635"
      > </a
      ><a name="15636" href="2016-03-20-one-lambda-calculus-many-times.html#15612" class="Bound"
      >S</a
      ><a name="15637"
      > </a
      ><a name="15638" href="2016-03-20-one-lambda-calculus-many-times.html#12538" class="Field Operator"
      >&#10215;</a
      ><a name="15639"
      >
    </a
      ><a name="15644" href="2016-03-20-one-lambda-calculus-many-times.html#15595" class="Function"
      >InterpretSC</a
      ><a name="15655"
      > </a
      ><a name="15656" class="Symbol"
      >=</a
      ><a name="15657"
      > </a
      ><a name="15658" class="Keyword"
      >record</a
      ><a name="15664"
      > </a
      ><a name="15665" class="Symbol"
      >{</a
      ><a name="15666"
      > </a
      ><a name="15667" class="Field Operator"
      >&#10214;_&#10215;</a
      ><a name="15670"
      > </a
      ><a name="15671" class="Symbol"
      >=</a
      ><a name="15672"
      > </a
      ><a name="15673" href="2016-03-20-one-lambda-calculus-many-times.html#12538" class="Field Operator"
      >&#10214;_&#10215;</a
      ><a name="15676"
      > </a
      ><a name="15677" href="https://agda.github.io/agda-stdlib/Function.html#713" class="Function Operator"
      >&#8728;</a
      ><a name="15678"
      > </a
      ><a name="15679" href="2016-03-20-one-lambda-calculus-many-times.html#10709" class="Function"
      >ND&#8660;SC.&#10232;</a
      ><a name="15686"
      > </a
      ><a name="15687" class="Symbol"
      >}</a
      >
</pre><!--{% endraw %}-->

Which means that we've now implemented the following functions:

$$
    \begin{array}{ccc}
    ND & \rightarrow & Agda \\
                            \\
    \updownarrow            \\
                            \\
    SC                      \\
    \end{array}
$$



If you are looking for more reading on this topic, I can recommend the
highly readible *[Lambda terms for natural deduction, sequent calculus
and cut elimination][barendregt]* by Henk Barendregt and Silvia Ghilezan.

Next time, I'll talk about Gentzen's LJ, which has explicit structural
rules, and variations which use other, non-list structures as the
antecedent.

---

[agdatutorial]: http://www.cse.chalmers.se/~ulfn/papers/afp08/tutorial.pdf
[noshortcuts]: https://gergo.erdi.hu/blog/2013-05-01-simply_typed_lambda_calculus_in_agda,_without_shortcuts/
[byexample]: http://mazzo.li/posts/Lambda.html
[barendregt]: http://journals.cambridge.org/action/displayAbstract?fromPage=online&aid=44279#

[^imports]: This is a good time to note that I'm not showing any of
    the import statements. If you wish to see them, they're there in
    the HTML source. However, it may be much easier to click the
    symbol that confuses you---that should take you directly to its
    definition in the standard library.
