---
title         : One λ-calculus, many times... (2)
date          : 2016-09-29 12:00:00
categories    : [compsci]
tags          : [agda]
hide-implicit : true
extra-script  : agda-extra-script.html
extra-style   : agda-extra-style.html
---

This post is a continuation of *[One λ-calculus, many times...]({% post_url 2016-03-20-one-lambda-calculus-many-times %})*, in which I explored the use of natural deduction and sequent calculus systems as type systems for the simply-typed lambda calculus.[^minproplog] In this post, I will have a look at the variants of these systems which have explicit structural rules: Gentzen's NJ and LJ.

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="672" class="Keyword"
      >import</a
      ><a name="678"
      > </a
      ><a name="679" href="2016-03-20-one-lambda-calculus-many-times.html#1" class="Module"
      >2016-03-20-one-lambda-calculus-many-times</a
      ><a name="720"
      > </a
      ><a name="721" class="Symbol"
      >as</a
      ><a name="723"
      > </a
      ><a name="724" class="Module"
      >Part1</a
      ><a name="729"
      >
</a
      ><a name="730" class="Keyword"
      >module</a
      ><a name="736"
      > </a
      ><a name="737" href="one-lambda-calculus-many-times-2.html#1" class="Module"
      >one-lambda-calculus-many-times-2</a
      ><a name="769"
      > </a
      ><a name="770" class="Keyword"
      >where</a
      >
{% endraw %}</pre>
</div>

The structure of this post will be similar to that of the previous installment---which means that we will start out by having a look at the syntax of NJ, then have a look at its semantics and relation to the system ND we discussed last time, and finally we will do the same for LJ. But first, the syntax:

<pre class="Agda">{% raw %}
<a name="1114" class="Keyword"
      >module</a
      ><a name="1120"
      > </a
      ><a name="1121" href="one-lambda-calculus-many-times-2.html#1121" class="Module"
      >Syntax</a
      ><a name="1127"
      > </a
      ><a name="1128" class="Symbol"
      >(</a
      ><a name="1129" href="one-lambda-calculus-many-times-2.html#1129" class="Bound"
      >Atom</a
      ><a name="1133"
      > </a
      ><a name="1134" class="Symbol"
      >:</a
      ><a name="1135"
      > </a
      ><a name="1136" class="PrimitiveType"
      >Set</a
      ><a name="1139" class="Symbol"
      >)</a
      ><a name="1140"
      > </a
      ><a name="1141" class="Keyword"
      >where</a
      >
{% endraw %}</pre>

We can reuse our notions of types and sequents from the previous post:

<div class="hidden">
<pre class="Agda">{% raw %}
  <a name="1267" class="Keyword"
      >open</a
      ><a name="1271"
      > </a
      ><a name="1272" href="2016-03-20-one-lambda-calculus-many-times.html#1219" class="Module"
      >Part1.</a
      ><a name="1278" href="2016-03-20-one-lambda-calculus-many-times.html#1566" class="Module"
      >Syntax</a
      ><a name="1284"
      > </a
      ><a name="1285" href="one-lambda-calculus-many-times-2.html#1129" class="Bound"
      >Atom</a
      ><a name="1289"
      > </a
      ><a name="1290" class="Keyword"
      >hiding</a
      ><a name="1296"
      > </a
      ><a name="1297" class="Symbol"
      >(</a
      ><a name="1298"
      >w&#8242;</a
      ><a name="1300" class="Symbol"
      >)</a
      ><a name="1301"
      >
  </a
      ><a name="1304" class="Keyword"
      >open</a
      ><a name="1308"
      > </a
      ><a name="1309" class="Keyword"
      >import</a
      ><a name="1315"
      > </a
      ><a name="1316" href="https://agda.github.io/agda-stdlib/Algebra.html#1" class="Module"
      >Algebra</a
      ><a name="1323"
      >                 </a
      ><a name="1340" class="Keyword"
      >using</a
      ><a name="1345"
      > </a
      ><a name="1346" class="Symbol"
      >(</a
      ><a name="1347" class="Keyword"
      >module</a
      ><a name="1353"
      > </a
      ><a name="1354" href="https://agda.github.io/agda-stdlib/Algebra.html#309" class="Module"
      >Monoid</a
      ><a name="1360" class="Symbol"
      >)</a
      ><a name="1361"
      >
  </a
      ><a name="1364" class="Keyword"
      >open</a
      ><a name="1368"
      > </a
      ><a name="1369" class="Keyword"
      >import</a
      ><a name="1375"
      > </a
      ><a name="1376" href="https://agda.github.io/agda-stdlib/Data.Nat.html#1" class="Module"
      >Data.Nat</a
      ><a name="1384"
      >                </a
      ><a name="1400" class="Keyword"
      >using</a
      ><a name="1405"
      > </a
      ><a name="1406" class="Symbol"
      >(</a
      ><a name="1407" href="Agda.Builtin.Nat.html#69" class="Datatype"
      >&#8469;</a
      ><a name="1408" class="Symbol"
      >;</a
      ><a name="1409"
      > </a
      ><a name="1410" href="Agda.Builtin.Nat.html#100" class="InductiveConstructor"
      >suc</a
      ><a name="1413" class="Symbol"
      >;</a
      ><a name="1414"
      > </a
      ><a name="1415" href="Agda.Builtin.Nat.html#87" class="InductiveConstructor"
      >zero</a
      ><a name="1419" class="Symbol"
      >)</a
      ><a name="1420"
      >
  </a
      ><a name="1423" class="Keyword"
      >open</a
      ><a name="1427"
      > </a
      ><a name="1428" class="Keyword"
      >import</a
      ><a name="1434"
      > </a
      ><a name="1435" href="https://agda.github.io/agda-stdlib/Data.Fin.html#1" class="Module"
      >Data.Fin</a
      ><a name="1443"
      >                </a
      ><a name="1459" class="Keyword"
      >using</a
      ><a name="1464"
      > </a
      ><a name="1465" class="Symbol"
      >(</a
      ><a name="1466" href="https://agda.github.io/agda-stdlib/Data.Fin.html#842" class="Datatype"
      >Fin</a
      ><a name="1469" class="Symbol"
      >;</a
      ><a name="1470"
      > </a
      ><a name="1471" href="https://agda.github.io/agda-stdlib/Data.Fin.html#895" class="InductiveConstructor"
      >suc</a
      ><a name="1474" class="Symbol"
      >;</a
      ><a name="1475"
      > </a
      ><a name="1476" href="https://agda.github.io/agda-stdlib/Data.Fin.html#864" class="InductiveConstructor"
      >zero</a
      ><a name="1480" class="Symbol"
      >)</a
      ><a name="1481"
      >
  </a
      ><a name="1484" class="Keyword"
      >open</a
      ><a name="1488"
      > </a
      ><a name="1489" class="Keyword"
      >import</a
      ><a name="1495"
      > </a
      ><a name="1496" href="https://agda.github.io/agda-stdlib/Data.List.html#1" class="Module"
      >Data.List</a
      ><a name="1505"
      >               </a
      ><a name="1520" class="Keyword"
      >using</a
      ><a name="1525"
      > </a
      ><a name="1526" class="Symbol"
      >(</a
      ><a name="1527" href="Agda.Builtin.List.html#52" class="Datatype"
      >List</a
      ><a name="1531" class="Symbol"
      >;</a
      ><a name="1532"
      > </a
      ><a name="1533" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >_&#8759;_</a
      ><a name="1536" class="Symbol"
      >;</a
      ><a name="1537"
      > </a
      ><a name="1538" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#5519" class="InductiveConstructor"
      >[]</a
      ><a name="1540" class="Symbol"
      >;</a
      ><a name="1541"
      > </a
      ><a name="1542" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >_++_</a
      ><a name="1546" class="Symbol"
      >)</a
      ><a name="1547"
      >
  </a
      ><a name="1550" class="Keyword"
      >open</a
      ><a name="1554"
      > </a
      ><a name="1555" class="Keyword"
      >import</a
      ><a name="1561"
      > </a
      ><a name="1562" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1" class="Module"
      >Data.List.Any</a
      ><a name="1575"
      >           </a
      ><a name="1586" class="Keyword"
      >using</a
      ><a name="1591"
      > </a
      ><a name="1592" class="Symbol"
      >(</a
      ><a name="1593" class="Keyword"
      >module</a
      ><a name="1599"
      > </a
      ><a name="1600" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#250" class="Module"
      >Membership</a
      ><a name="1610" class="Symbol"
      >;</a
      ><a name="1611"
      > </a
      ><a name="1612" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="1616" class="Symbol"
      >;</a
      ><a name="1617"
      > </a
      ><a name="1618" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="1623" class="Symbol"
      >)</a
      ><a name="1624"
      >
  </a
      ><a name="1627" class="Keyword"
      >open</a
      ><a name="1631"
      > </a
      ><a name="1632" class="Keyword"
      >import</a
      ><a name="1638"
      > </a
      ><a name="1639" href="https://agda.github.io/agda-stdlib/Data.Product.html#1" class="Module"
      >Data.Product</a
      ><a name="1651"
      >            </a
      ><a name="1663" class="Keyword"
      >using</a
      ><a name="1668"
      > </a
      ><a name="1669" class="Symbol"
      >(</a
      ><a name="1670" href="https://agda.github.io/agda-stdlib/Data.Product.html#525" class="Field"
      >proj&#8321;</a
      ><a name="1675" class="Symbol"
      >;</a
      ><a name="1676"
      > </a
      ><a name="1677" href="https://agda.github.io/agda-stdlib/Data.Product.html#539" class="Field"
      >proj&#8322;</a
      ><a name="1682" class="Symbol"
      >)</a
      ><a name="1683"
      >
  </a
      ><a name="1686" class="Keyword"
      >open</a
      ><a name="1690"
      > </a
      ><a name="1691" class="Keyword"
      >import</a
      ><a name="1697"
      > </a
      ><a name="1698" href="https://agda.github.io/agda-stdlib/Function.html#1" class="Module"
      >Function</a
      ><a name="1706"
      >                </a
      ><a name="1722" class="Keyword"
      >using</a
      ><a name="1727"
      > </a
      ><a name="1728" class="Symbol"
      >(</a
      ><a name="1729" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >_$_</a
      ><a name="1732" class="Symbol"
      >)</a
      ><a name="1733"
      >
  </a
      ><a name="1736" class="Keyword"
      >open</a
      ><a name="1740"
      > </a
      ><a name="1741" class="Keyword"
      >import</a
      ><a name="1747"
      > </a
      ><a name="1748" href="https://agda.github.io/agda-stdlib/Function.Equivalence.html#1" class="Module"
      >Function.Equivalence</a
      ><a name="1768"
      >    </a
      ><a name="1772" class="Keyword"
      >using</a
      ><a name="1777"
      > </a
      ><a name="1778" class="Symbol"
      >(</a
      ><a name="1779" href="https://agda.github.io/agda-stdlib/Function.Equivalence.html#711" class="Function Operator"
      >_&#8660;_</a
      ><a name="1782" class="Symbol"
      >;</a
      ><a name="1783"
      > </a
      ><a name="1784" href="https://agda.github.io/agda-stdlib/Function.Equivalence.html#2131" class="Function"
      >id</a
      ><a name="1786" class="Symbol"
      >;</a
      ><a name="1787"
      > </a
      ><a name="1788" href="https://agda.github.io/agda-stdlib/Function.Equivalence.html#1070" class="Function"
      >map</a
      ><a name="1791" class="Symbol"
      >;</a
      ><a name="1792"
      > </a
      ><a name="1793" href="https://agda.github.io/agda-stdlib/Function.Equivalence.html#804" class="Function"
      >equivalence</a
      ><a name="1804" class="Symbol"
      >)</a
      ><a name="1805"
      >
  </a
      ><a name="1808" class="Keyword"
      >open</a
      ><a name="1812"
      > </a
      ><a name="1813" class="Keyword"
      >import</a
      ><a name="1819"
      > </a
      ><a name="1820" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.html#1" class="Module"
      >Relation.Binary.PropositionalEquality</a
      ><a name="1857"
      >
  </a
      ><a name="1860" class="Keyword"
      >open</a
      ><a name="1864"
      > </a
      ><a name="1865" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#2298" class="Module"
      >Membership</a
      ><a name="1875"
      > </a
      ><a name="1876" class="Symbol"
      >(</a
      ><a name="1877" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.html#1526" class="Function"
      >setoid</a
      ><a name="1883"
      > </a
      ><a name="1884" href="2016-03-20-one-lambda-calculus-many-times.html#2649" class="Datatype"
      >Type</a
      ><a name="1888" class="Symbol"
      >)</a
      ><a name="1889"
      >       </a
      ><a name="1896" class="Keyword"
      >using</a
      ><a name="1901"
      > </a
      ><a name="1902" class="Symbol"
      >(</a
      ><a name="1903"
      >_&#8712;_</a
      ><a name="1906" class="Symbol"
      >;</a
      ><a name="1907"
      > _&#8838;_</a
      ><a name="1911" class="Symbol"
      >)</a
      ><a name="1912"
      >
  </a
      ><a name="1915" class="Keyword"
      >open</a
      ><a name="1919"
      > </a
      ><a name="1920" href="https://agda.github.io/agda-stdlib/Algebra.html#1154" class="Module"
      >Monoid</a
      ><a name="1926"
      > </a
      ><a name="1927" class="Symbol"
      >(</a
      ><a name="1928" href="https://agda.github.io/agda-stdlib/Data.List.html#846" class="Function"
      >Data.List.monoid</a
      ><a name="1944"
      > </a
      ><a name="1945" href="2016-03-20-one-lambda-calculus-many-times.html#2649" class="Datatype"
      >Type</a
      ><a name="1949" class="Symbol"
      >)</a
      ><a name="1950"
      > </a
      ><a name="1951" class="Keyword"
      >using</a
      ><a name="1956"
      > </a
      ><a name="1957" class="Symbol"
      >()</a
      ><a name="1959"
      > </a
      ><a name="1960" class="Keyword"
      >renaming</a
      ><a name="1968"
      > </a
      ><a name="1969" class="Symbol"
      >(</a
      ><a name="1970"
      >identity </a
      ><a name="1979" class="Symbol"
      >to</a
      ><a name="1981"
      > ++-identity</a
      ><a name="1993" class="Symbol"
      >;</a
      ><a name="1994"
      > assoc </a
      ><a name="2001" class="Symbol"
      >to</a
      ><a name="2003"
      > ++-assoc</a
      ><a name="2012" class="Symbol"
      >)</a
      ><a name="2013"
      >
  </a
      ><a name="2016" href="one-lambda-calculus-many-times-2.html#2016" class="Function"
      >++-identity&#691;</a
      ><a name="2028"
      > </a
      ><a name="2029" class="Symbol"
      >=</a
      ><a name="2030"
      > </a
      ><a name="2031" href="https://agda.github.io/agda-stdlib/Data.Product.html#539" class="Field"
      >proj&#8322;</a
      ><a name="2036"
      > </a
      ><a name="2037" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#1106" class="Function"
      >++-identity</a
      >
{% endraw %}</pre>
</div>
<pre class="Agda Spec">  <a name="2644" class="Keyword">data</a><a name="2648"> </a><a name="2649" href="/2016/one-lambda-calculus-many-times/#2649" class="Datatype">Type</a><a name="2653"> </a><a name="2654" class="Symbol">:</a><a name="2655"> </a><a name="2656" class="PrimitiveType">Set</a><a name="2659"> </a><a name="2660" class="Keyword">where</a><a name="2665">
    </a><a name="2670" href="/2016/one-lambda-calculus-many-times/#2670" class="InductiveConstructor">El</a><a name="2672">  </a><a name="2674" class="Symbol">:</a><a name="2675"> </a><a name="2676" href="/2016/one-lambda-calculus-many-times/#1574" class="Bound">Atom</a><a name="2680"> </a><a name="2681" class="Symbol">→</a><a name="2682"> </a><a name="2683" href="/2016/one-lambda-calculus-many-times/#2649" class="Datatype">Type</a><a name="2687">
    </a><a name="2692" href="/2016/one-lambda-calculus-many-times/#2692" class="InductiveConstructor Operator">_⇒_</a><a name="2695"> </a><a name="2696" class="Symbol">:</a><a name="2697"> </a><a name="2698" href="/2016/one-lambda-calculus-many-times/#2649" class="Datatype">Type</a><a name="2702"> </a><a name="2703" class="Symbol">→</a><a name="2704"> </a><a name="2705" href="/2016/one-lambda-calculus-many-times/#2649" class="Datatype">Type</a><a name="2709"> </a><a name="2710" class="Symbol">→</a><a name="2711"> </a><a name="2712" href="/2016/one-lambda-calculus-many-times/#2649" class="Datatype">Type</a>

  <a name="3950" class="Keyword">data</a><a name="3954"> </a><a name="3955" href="/2016/one-lambda-calculus-many-times/#3955" class="Datatype">Sequent</a><a name="3962"> </a><a name="3963" class="Symbol">:</a><a name="3964"> </a><a name="3965" class="PrimitiveType">Set</a><a name="3968"> </a><a name="3969" class="Keyword">where</a><a name="3974">
    </a><a name="3979" href="/2016/one-lambda-calculus-many-times/#3979" class="InductiveConstructor Operator">_⊢_</a><a name="3982"> </a><a name="3983" class="Symbol">:</a><a name="3984"> </a><a name="3985" href="https://agda.github.io/agda-stdlib/Agda.Builtin.List.html#52" class="Datatype" target="_blank">List</a><a name="3989"> </a><a name="3990" href="/2016/one-lambda-calculus-many-times/#2649" class="Datatype">Type</a><a name="3994"> </a><a name="3995" class="Symbol">→</a><a name="3996"> </a><a name="3997" href="/2016/one-lambda-calculus-many-times/#2649" class="Datatype">Type</a><a name="4001"> </a><a name="4002" class="Symbol">→</a><a name="4003"> </a><a name="4004" href="/2016/one-lambda-calculus-many-times/#3955" class="Datatype">Sequent</a></pre>

Now, the usual axiomatisation for NJ is as follows:

$$
  \begin{array}{c}
  \frac{}{A \vdash A}{\small ax}
  \quad
  \frac{A , \Gamma \vdash B}{\Gamma \vdash A \Rightarrow B}{\small{\Rightarrow}\!i}
  \quad
  \frac{\Gamma \vdash A \Rightarrow B \quad \Delta \vdash A}{\Gamma , \Delta \vdash B}{\small{\Rightarrow}\!e}
  \\
  \\
  \frac{\Gamma \vdash B}{A , \Gamma \vdash B}{\small w}
  \quad
  \frac{A , A , \Gamma \vdash B}{A , \Gamma \vdash B}{\small c}
  \quad
  \frac{\Gamma , A , B , \Delta \vdash C}{\Gamma , B , A , \Delta \vdash C}{\small p}
  \end{array}
$$

<br />
There are three notable changes when comparing this to the system SC:

  - **Weakening**. The axiom no longer allows for arbitrary contexts to be present, it *has* to be $$A \vdash A$$. An implication of this is that we no longer have the option to have *unused* formulas in our context. If we *do* want to have unused formulas, we can add these using the *weakening* rule (or $$w$$).

  - **Contraction**. When we apply a binary rule, we no longer pass the entire context to both sides---instead, we have to choose how to *split* the context. So what do we do if there is a formula which we want to use in *both* branches of the proof? We can use the *contraction* (or $$c$$) rule, which *copies* a formula, and then pass a copy to either branch.

  - **Permutation**. The third change lies in the structure of our contexts and with the $$ax$$ rule. In the previous system, we thought of our contexts as *sets*, even though we implemented them with lists. This showed itself in the definition of the $$ax$$ rule, which took an extra argument---a proof that the desired type $$A$$ was a member of the context $$\Gamma$$:

    $$
      \frac{A \in \Gamma}{\Gamma \vdash A}{\small ax}
    $$

    When we start thinking of the contexts as *lists*, we lose the ability to have variables point to arbitrary positions in the context---they can only point to the *first* element in the context. In other words, our system is *ordered*. To regain the freedom we've lost, we add a third new rule which allows us to swap elements in the context: permutation (or $$p$$).

Below, I've implemented the resulting system in Agda:

<pre class="Agda">{% raw %}
  <a name="6828" class="Keyword"
      >infix</a
      ><a name="6833"
      > </a
      ><a name="6834" class="Number"
      >3</a
      ><a name="6835"
      > NJ_

  </a
      ><a name="6843" class="Keyword"
      >data</a
      ><a name="6847"
      > </a
      ><a name="6848" href="one-lambda-calculus-many-times-2.html#6848" class="Datatype Operator"
      >NJ_</a
      ><a name="6851"
      > </a
      ><a name="6852" class="Symbol"
      >:</a
      ><a name="6853"
      > </a
      ><a name="6854" href="2016-03-20-one-lambda-calculus-many-times.html#3955" class="Datatype"
      >Sequent</a
      ><a name="6861"
      > </a
      ><a name="6862" class="Symbol"
      >&#8594;</a
      ><a name="6863"
      > </a
      ><a name="6864" class="PrimitiveType"
      >Set</a
      ><a name="6867"
      > </a
      ><a name="6868" class="Keyword"
      >where</a
      ><a name="6873"
      >
    </a
      ><a name="6878" href="one-lambda-calculus-many-times-2.html#6878" class="InductiveConstructor"
      >ax</a
      ><a name="6880"
      > </a
      ><a name="6881" class="Symbol"
      >:</a
      ><a name="6882"
      > </a
      ><a name="6883" class="Symbol"
      >&#8704;</a
      ><a name="6884"
      > </a
      ><a name="6897" class="Symbol"
      >&#8594;</a
      ><a name="6898"
      > </a
      ><a name="6899" href="one-lambda-calculus-many-times-2.html#6848" class="Datatype Operator"
      >NJ</a
      ><a name="6901"
      > </a
      ><a name="6902" href="one-lambda-calculus-many-times-2.html#6886" class="Bound"
      >A</a
      ><a name="6903"
      > </a
      ><a name="6904" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="6905"
      > </a
      ><a name="6906" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="6908"
      > </a
      ><a name="6909" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="6910"
      > </a
      ><a name="6911" href="one-lambda-calculus-many-times-2.html#6886" class="Bound"
      >A</a
      ><a name="6912"
      >
    </a
      ><a name="6917" href="one-lambda-calculus-many-times-2.html#6917" class="InductiveConstructor"
      >&#8658;i</a
      ><a name="6919"
      > </a
      ><a name="6920" class="Symbol"
      >:</a
      ><a name="6921"
      > </a
      ><a name="6922" class="Symbol"
      >&#8704;</a
      ><a name="6923"
      > </a
      ><a name="6936" class="Symbol"
      >&#8594;</a
      ><a name="6937"
      > </a
      ><a name="6938" href="one-lambda-calculus-many-times-2.html#6848" class="Datatype Operator"
      >NJ</a
      ><a name="6940"
      > </a
      ><a name="6941" href="one-lambda-calculus-many-times-2.html#6925" class="Bound"
      >A</a
      ><a name="6942"
      > </a
      ><a name="6943" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="6944"
      > </a
      ><a name="6945" href="one-lambda-calculus-many-times-2.html#6931" class="Bound"
      >&#915;</a
      ><a name="6946"
      > </a
      ><a name="6947" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="6948"
      > </a
      ><a name="6949" href="one-lambda-calculus-many-times-2.html#6927" class="Bound"
      >B</a
      ><a name="6950"
      > </a
      ><a name="6951" class="Symbol"
      >&#8594;</a
      ><a name="6952"
      > </a
      ><a name="6953" href="one-lambda-calculus-many-times-2.html#6848" class="Datatype Operator"
      >NJ</a
      ><a name="6955"
      > </a
      ><a name="6956" href="one-lambda-calculus-many-times-2.html#6931" class="Bound"
      >&#915;</a
      ><a name="6957"
      > </a
      ><a name="6958" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="6959"
      > </a
      ><a name="6960" href="one-lambda-calculus-many-times-2.html#6925" class="Bound"
      >A</a
      ><a name="6961"
      > </a
      ><a name="6962" href="2016-03-20-one-lambda-calculus-many-times.html#2692" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="6963"
      > </a
      ><a name="6964" href="one-lambda-calculus-many-times-2.html#6927" class="Bound"
      >B</a
      ><a name="6965"
      >
    </a
      ><a name="6970" href="one-lambda-calculus-many-times-2.html#6970" class="InductiveConstructor"
      >&#8658;e</a
      ><a name="6972"
      > </a
      ><a name="6973" class="Symbol"
      >:</a
      ><a name="6974"
      > </a
      ><a name="6975" class="Symbol"
      >&#8704;</a
      ><a name="6976"
      > </a
      ><a name="6989" class="Symbol"
      >&#8594;</a
      ><a name="6990"
      > </a
      ><a name="6991" href="one-lambda-calculus-many-times-2.html#6848" class="Datatype Operator"
      >NJ</a
      ><a name="6993"
      > </a
      ><a name="6994" href="one-lambda-calculus-many-times-2.html#6984" class="Bound"
      >&#915;</a
      ><a name="6995"
      > </a
      ><a name="6996" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="6997"
      > </a
      ><a name="6998" href="one-lambda-calculus-many-times-2.html#6978" class="Bound"
      >A</a
      ><a name="6999"
      > </a
      ><a name="7000" href="2016-03-20-one-lambda-calculus-many-times.html#2692" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="7001"
      > </a
      ><a name="7002" href="one-lambda-calculus-many-times-2.html#6980" class="Bound"
      >B</a
      ><a name="7003"
      > </a
      ><a name="7004" class="Symbol"
      >&#8594;</a
      ><a name="7005"
      > </a
      ><a name="7006" href="one-lambda-calculus-many-times-2.html#6848" class="Datatype Operator"
      >NJ</a
      ><a name="7008"
      > </a
      ><a name="7009" href="one-lambda-calculus-many-times-2.html#6986" class="Bound"
      >&#916;</a
      ><a name="7010"
      > </a
      ><a name="7011" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="7012"
      > </a
      ><a name="7013" href="one-lambda-calculus-many-times-2.html#6978" class="Bound"
      >A</a
      ><a name="7014"
      > </a
      ><a name="7015" class="Symbol"
      >&#8594;</a
      ><a name="7016"
      > </a
      ><a name="7017" href="one-lambda-calculus-many-times-2.html#6848" class="Datatype Operator"
      >NJ</a
      ><a name="7019"
      > </a
      ><a name="7020" href="one-lambda-calculus-many-times-2.html#6984" class="Bound"
      >&#915;</a
      ><a name="7021"
      > </a
      ><a name="7022" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="7024"
      > </a
      ><a name="7025" href="one-lambda-calculus-many-times-2.html#6986" class="Bound"
      >&#916;</a
      ><a name="7026"
      > </a
      ><a name="7027" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="7028"
      > </a
      ><a name="7029" href="one-lambda-calculus-many-times-2.html#6980" class="Bound"
      >B</a
      ><a name="7030"
      >
    </a
      ><a name="7035" href="one-lambda-calculus-many-times-2.html#7035" class="InductiveConstructor"
      >w</a
      ><a name="7036"
      >  </a
      ><a name="7038" class="Symbol"
      >:</a
      ><a name="7039"
      > </a
      ><a name="7040" class="Symbol"
      >&#8704;</a
      ><a name="7041"
      > </a
      ><a name="7054" class="Symbol"
      >&#8594;</a
      ><a name="7055"
      > </a
      ><a name="7056" href="one-lambda-calculus-many-times-2.html#6848" class="Datatype Operator"
      >NJ</a
      ><a name="7058"
      > </a
      ><a name="7059" href="one-lambda-calculus-many-times-2.html#7049" class="Bound"
      >&#915;</a
      ><a name="7060"
      > </a
      ><a name="7061" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="7062"
      > </a
      ><a name="7063" href="one-lambda-calculus-many-times-2.html#7045" class="Bound"
      >B</a
      ><a name="7064"
      > </a
      ><a name="7065" class="Symbol"
      >&#8594;</a
      ><a name="7066"
      > </a
      ><a name="7067" href="one-lambda-calculus-many-times-2.html#6848" class="Datatype Operator"
      >NJ</a
      ><a name="7069"
      > </a
      ><a name="7070" href="one-lambda-calculus-many-times-2.html#7043" class="Bound"
      >A</a
      ><a name="7071"
      > </a
      ><a name="7072" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="7073"
      > </a
      ><a name="7074" href="one-lambda-calculus-many-times-2.html#7049" class="Bound"
      >&#915;</a
      ><a name="7075"
      > </a
      ><a name="7076" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="7077"
      > </a
      ><a name="7078" href="one-lambda-calculus-many-times-2.html#7045" class="Bound"
      >B</a
      ><a name="7079"
      >
    </a
      ><a name="7084" href="one-lambda-calculus-many-times-2.html#7084" class="InductiveConstructor"
      >c</a
      ><a name="7085"
      >  </a
      ><a name="7087" class="Symbol"
      >:</a
      ><a name="7088"
      > </a
      ><a name="7089" class="Symbol"
      >&#8704;</a
      ><a name="7090"
      > </a
      ><a name="7103" class="Symbol"
      >&#8594;</a
      ><a name="7104"
      > </a
      ><a name="7105" href="one-lambda-calculus-many-times-2.html#6848" class="Datatype Operator"
      >NJ</a
      ><a name="7107"
      > </a
      ><a name="7108" href="one-lambda-calculus-many-times-2.html#7092" class="Bound"
      >A</a
      ><a name="7109"
      > </a
      ><a name="7110" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="7111"
      > </a
      ><a name="7112" href="one-lambda-calculus-many-times-2.html#7092" class="Bound"
      >A</a
      ><a name="7113"
      > </a
      ><a name="7114" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="7115"
      > </a
      ><a name="7116" href="one-lambda-calculus-many-times-2.html#7098" class="Bound"
      >&#915;</a
      ><a name="7117"
      > </a
      ><a name="7118" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="7119"
      > </a
      ><a name="7120" href="one-lambda-calculus-many-times-2.html#7094" class="Bound"
      >B</a
      ><a name="7121"
      > </a
      ><a name="7122" class="Symbol"
      >&#8594;</a
      ><a name="7123"
      > </a
      ><a name="7124" href="one-lambda-calculus-many-times-2.html#6848" class="Datatype Operator"
      >NJ</a
      ><a name="7126"
      > </a
      ><a name="7127" href="one-lambda-calculus-many-times-2.html#7092" class="Bound"
      >A</a
      ><a name="7128"
      > </a
      ><a name="7129" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="7130"
      > </a
      ><a name="7131" href="one-lambda-calculus-many-times-2.html#7098" class="Bound"
      >&#915;</a
      ><a name="7132"
      > </a
      ><a name="7133" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="7134"
      > </a
      ><a name="7135" href="one-lambda-calculus-many-times-2.html#7094" class="Bound"
      >B</a
      ><a name="7136"
      >
    </a
      ><a name="7141" href="one-lambda-calculus-many-times-2.html#7141" class="InductiveConstructor"
      >p</a
      ><a name="7142"
      >  </a
      ><a name="7144" class="Symbol"
      >:</a
      ><a name="7145"
      > </a
      ><a name="7146" class="Symbol"
      >&#8704;</a
      ><a name="7147"
      > </a
      ><a name="7156" class="Symbol"
      >&#8594;</a
      ><a name="7157"
      > </a
      ><a name="7158" class="Symbol"
      >&#8704;</a
      ><a name="7159"
      > </a
      ><a name="7160" href="one-lambda-calculus-many-times-2.html#7160" class="Bound"
      >&#915;</a
      ><a name="7161"
      > </a
      ><a name="7162" class="Symbol"
      >&#8594;</a
      ><a name="7163"
      > </a
      ><a name="7164" class="Symbol"
      >&#8704;</a
      ><a name="7165"
      > </a
      ><a name="7170" class="Symbol"
      >&#8594;</a
      ><a name="7171"
      > </a
      ><a name="7172" href="one-lambda-calculus-many-times-2.html#6848" class="Datatype Operator"
      >NJ</a
      ><a name="7174"
      > </a
      ><a name="7175" href="one-lambda-calculus-many-times-2.html#7160" class="Bound"
      >&#915;</a
      ><a name="7176"
      > </a
      ><a name="7177" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="7179"
      > </a
      ><a name="7180" href="one-lambda-calculus-many-times-2.html#7149" class="Bound"
      >A</a
      ><a name="7181"
      > </a
      ><a name="7182" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="7183"
      > </a
      ><a name="7184" href="one-lambda-calculus-many-times-2.html#7151" class="Bound"
      >B</a
      ><a name="7185"
      > </a
      ><a name="7186" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="7187"
      > </a
      ><a name="7188" href="one-lambda-calculus-many-times-2.html#7167" class="Bound"
      >&#916;</a
      ><a name="7189"
      > </a
      ><a name="7190" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="7191"
      > </a
      ><a name="7192" href="one-lambda-calculus-many-times-2.html#7153" class="Bound"
      >C</a
      ><a name="7193"
      > </a
      ><a name="7194" class="Symbol"
      >&#8594;</a
      ><a name="7195"
      > </a
      ><a name="7196" href="one-lambda-calculus-many-times-2.html#6848" class="Datatype Operator"
      >NJ</a
      ><a name="7198"
      > </a
      ><a name="7199" href="one-lambda-calculus-many-times-2.html#7160" class="Bound"
      >&#915;</a
      ><a name="7200"
      > </a
      ><a name="7201" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="7203"
      > </a
      ><a name="7204" href="one-lambda-calculus-many-times-2.html#7151" class="Bound"
      >B</a
      ><a name="7205"
      > </a
      ><a name="7206" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="7207"
      > </a
      ><a name="7208" href="one-lambda-calculus-many-times-2.html#7149" class="Bound"
      >A</a
      ><a name="7209"
      > </a
      ><a name="7210" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="7211"
      > </a
      ><a name="7212" href="one-lambda-calculus-many-times-2.html#7167" class="Bound"
      >&#916;</a
      ><a name="7213"
      > </a
      ><a name="7214" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="7215"
      > </a
      ><a name="7216" href="one-lambda-calculus-many-times-2.html#7153" class="Bound"
      >C</a
      >
{% endraw %}</pre>



### Admissible Structural Rules in ND

If we are to have any hope of proving the equivalence between the implicit and the explicit systems, we should be able to prove that the implicit systems admit[^admit] the same structural rules. In the previous post, we've already proven the following theorem for ND:

> If $$\Gamma \subseteq \Gamma\prime$$ and $$\Gamma \vdash A$$, then
> $$\Gamma\prime \vdash A$$.

<div class="hidden">
<pre class="Agda">{% raw %}
  <a name="7675" class="Keyword"
      >module</a
      ><a name="7681"
      > </a
      ><a name="7682" href="one-lambda-calculus-many-times-2.html#7682" class="Module"
      >ND</a
      ><a name="7684"
      > </a
      ><a name="7685" class="Keyword"
      >where</a
      ><a name="7690"
      >
    </a
      ><a name="7695" class="Keyword"
      >open</a
      ><a name="7699"
      > </a
      ><a name="7700" href="2016-03-20-one-lambda-calculus-many-times.html#1219" class="Module"
      >Part1.</a
      ><a name="7706" href="2016-03-20-one-lambda-calculus-many-times.html#1566" class="Module"
      >Syntax</a
      ><a name="7712"
      > </a
      ><a name="7713" href="one-lambda-calculus-many-times-2.html#1129" class="Bound"
      >Atom</a
      ><a name="7717"
      > </a
      ><a name="7718" class="Keyword"
      >public</a
      ><a name="7724"
      > </a
      ><a name="7725" class="Keyword"
      >using</a
      ><a name="7730"
      > </a
      ><a name="7731" class="Symbol"
      >(</a
      ><a name="7732"
      >w&#8242;</a
      ><a name="7734" class="Symbol"
      >)</a
      >
{% endraw %}</pre>
</div>

And we've also shown that we can very easily use this theorem to define weakening, because <a class="Agda InductiveConstructor Spec" target="_blank" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227">there</a> is a proof that "weakening", i.e. <span class="Agda Spec"><a class="Bound">Γ</a> <a href="https://agda.github.io/agda-stdlib/Data.List.Any.html#3056" class="Function Operator" target="_blank">⊆</a> <a class="Bound">A</a> <a href="https://agda.github.io/agda-stdlib/Agda.Builtin.List.html#104" class="InductiveConstructor Operator" target="_blank">∷</a> <a class="Bound">Γ</a></span>, holds for the subset relationship.

<pre class="Agda Spec">    <a href="/2016/one-lambda-calculus-many-times/#8603" class="Function">w′</a><a> </a><a class="Symbol">:</a><a> </a><a href="/2016/one-lambda-calculus-many-times/#5371" class="Datatype Operator">ND</a><a> </a><a class="Bound">Γ</a><a> </a><a href="/2016/one-lambda-calculus-many-times/#3979" class="InductiveConstructor Operator">⊢</a><a> </a><a class="Bound">B</a><a> </a><a class="Symbol">→</a><a> </a><a href="/2016/one-lambda-calculus-many-times/#5371" class="Datatype Operator">ND</a><a> </a><a class="Bound">A</a><a> </a><a href="https://agda.github.io/agda-stdlib/Agda.Builtin.List.html#104" class="InductiveConstructor Operator" target="_blank">∷</a><a> </a><a class="Bound">Γ</a><a> </a><a href="/2016/one-lambda-calculus-many-times/#3979" class="InductiveConstructor Operator">⊢</a><a> </a><a class="Bound">B</a><a>
    </a><a href="/2016/one-lambda-calculus-many-times/#8603" class="Function">w′</a><a> </a><a class="Symbol">=</a><a> </a><a href="/2016/one-lambda-calculus-many-times/#7305" class="Function">struct</a><a> </a><a href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor" target="_blank">there</a></pre>

Therefore, all we need to show to extend this to contraction and permutation is that their respective equations, <span class="Agda Spec"><a class="Bound">A</a> <a href="https://agda.github.io/agda-stdlib/Agda.Builtin.List.html#104" class="InductiveConstructor Operator" target="_blank">∷</a> <a class="Bound">A</a> <a href="https://agda.github.io/agda-stdlib/Agda.Builtin.List.html#104" class="InductiveConstructor Operator" target="_blank">∷</a> <a class="Bound">Γ</a> <a href="https://agda.github.io/agda-stdlib/Data.List.Any.html#3056" class="Function Operator" target="_blank">⊆</a> <a class="Bound">A</a> <a href="https://agda.github.io/agda-stdlib/Agda.Builtin.List.html#104" class="InductiveConstructor Operator" target="_blank">∷</a> <a class="Bound">Γ</a></span> and <span class="Agda Spec"><a class="Bound">Γ</a><a> </a><a href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator" target="_blank">++</a><a> </a><a class="Bound">A</a><a> </a><a href="https://agda.github.io/agda-stdlib/Agda.Builtin.List.html#104" class="InductiveConstructor Operator" target="_blank">∷</a><a> </a><a class="Bound">B</a><a> </a><a href="https://agda.github.io/agda-stdlib/Agda.Builtin.List.html#104" class="InductiveConstructor Operator" target="_blank">∷</a><a> </a><a class="Bound">Δ</a><a> </a><a href="https://agda.github.io/agda-stdlib/Data.List.Any.html#3056" class="Function Operator" target="_blank">⊆</a><a> </a><a class="Bound">Γ</a><a> </a><a href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator" target="_blank">++</a><a> </a><a class="Bound">B</a><a> </a><a href="https://agda.github.io/agda-stdlib/Agda.Builtin.List.html#104" class="InductiveConstructor Operator" target="_blank">∷</a><a> </a><a class="Bound">A</a><a> </a><a href="https://agda.github.io/agda-stdlib/Agda.Builtin.List.html#104" class="InductiveConstructor Operator" target="_blank">∷</a><a> </a><a class="Bound">Δ</a></span>, hold for the subset relation as well. This is simply a matter of reindexing. For contraction, if our "index" (made up of <a class="Agda Spec InductiveConstructor" target="_blank" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174">here</a> and <a class="Agda InductiveConstructor Spec" target="_blank" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227">there</a>) points to the first formula, we keep it the same. Otherwise, we subtract one. That way, the first two formulas are *contracted*, and the rest is adjusted accordingly.

<pre class="Agda">{% raw %}
    <a name="12143" href="one-lambda-calculus-many-times-2.html#12143" class="Function"
      >c&#8242;</a
      ><a name="12145"
      > </a
      ><a name="12146" class="Symbol"
      >:</a
      ><a name="12147"
      > </a
      ><a name="12148" class="Symbol"
      >&#8704;</a
      ><a name="12149"
      > </a
      ><a name="12158" class="Symbol"
      >&#8594;</a
      ><a name="12159"
      > </a
      ><a name="12160" href="2016-03-20-one-lambda-calculus-many-times.html#5371" class="Datatype Operator"
      >ND</a
      ><a name="12162"
      > </a
      ><a name="12163" href="one-lambda-calculus-many-times-2.html#12151" class="Bound"
      >A</a
      ><a name="12164"
      > </a
      ><a name="12165" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12166"
      > </a
      ><a name="12167" href="one-lambda-calculus-many-times-2.html#12151" class="Bound"
      >A</a
      ><a name="12168"
      > </a
      ><a name="12169" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12170"
      > </a
      ><a name="12171" href="one-lambda-calculus-many-times-2.html#12155" class="Bound"
      >&#915;</a
      ><a name="12172"
      > </a
      ><a name="12173" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="12174"
      > </a
      ><a name="12175" href="one-lambda-calculus-many-times-2.html#12153" class="Bound"
      >B</a
      ><a name="12176"
      > </a
      ><a name="12177" class="Symbol"
      >&#8594;</a
      ><a name="12178"
      > </a
      ><a name="12179" href="2016-03-20-one-lambda-calculus-many-times.html#5371" class="Datatype Operator"
      >ND</a
      ><a name="12181"
      > </a
      ><a name="12182" href="one-lambda-calculus-many-times-2.html#12151" class="Bound"
      >A</a
      ><a name="12183"
      > </a
      ><a name="12184" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12185"
      > </a
      ><a name="12186" href="one-lambda-calculus-many-times-2.html#12155" class="Bound"
      >&#915;</a
      ><a name="12187"
      > </a
      ><a name="12188" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="12189"
      > </a
      ><a name="12190" href="one-lambda-calculus-many-times-2.html#12153" class="Bound"
      >B</a
      ><a name="12191"
      >
    </a
      ><a name="12196" href="one-lambda-calculus-many-times-2.html#12143" class="Function"
      >c&#8242;</a
      ><a name="12198"
      > </a
      ><a name="12203" class="Symbol"
      >=</a
      ><a name="12204"
      > </a
      ><a name="12205" href="2016-03-20-one-lambda-calculus-many-times.html#7305" class="Function"
      >struct</a
      ><a name="12211"
      > </a
      ><a name="12212" href="one-lambda-calculus-many-times-2.html#12242" class="Function"
      >contract&#8242;</a
      ><a name="12221"
      >
      </a
      ><a name="12228" class="Keyword"
      >where</a
      ><a name="12233"
      >
        </a
      ><a name="12242" href="one-lambda-calculus-many-times-2.html#12242" class="Function"
      >contract&#8242;</a
      ><a name="12251"
      > </a
      ><a name="12252" class="Symbol"
      >:</a
      ><a name="12253"
      > </a
      ><a name="12254" class="Symbol"
      >&#8704;</a
      ><a name="12255"
      > </a
      ><a name="12262" class="Symbol"
      >&#8594;</a
      ><a name="12263"
      > </a
      ><a name="12264" href="one-lambda-calculus-many-times-2.html#12257" class="Bound"
      >A</a
      ><a name="12265"
      > </a
      ><a name="12266" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12267"
      > </a
      ><a name="12268" href="one-lambda-calculus-many-times-2.html#12257" class="Bound"
      >A</a
      ><a name="12269"
      > </a
      ><a name="12270" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12271"
      > </a
      ><a name="12272" href="one-lambda-calculus-many-times-2.html#12259" class="Bound"
      >&#915;</a
      ><a name="12273"
      > </a
      ><a name="12274" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#3056" class="Function Operator"
      >&#8838;</a
      ><a name="12275"
      > </a
      ><a name="12276" href="one-lambda-calculus-many-times-2.html#12257" class="Bound"
      >A</a
      ><a name="12277"
      > </a
      ><a name="12278" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12279"
      > </a
      ><a name="12280" href="one-lambda-calculus-many-times-2.html#12259" class="Bound"
      >&#915;</a
      ><a name="12281"
      >
        </a
      ><a name="12290" href="one-lambda-calculus-many-times-2.html#12242" class="Function"
      >contract&#8242;</a
      ><a name="12299"
      > </a
      ><a name="12300" class="Symbol"
      >(</a
      ><a name="12301" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="12305"
      > </a
      ><a name="12306" href="one-lambda-calculus-many-times-2.html#12306" class="Bound"
      >px</a
      ><a name="12308" class="Symbol"
      >)</a
      ><a name="12309"
      > </a
      ><a name="12310" class="Symbol"
      >=</a
      ><a name="12311"
      > </a
      ><a name="12312" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="12316"
      > </a
      ><a name="12317" href="one-lambda-calculus-many-times-2.html#12306" class="Bound"
      >px</a
      ><a name="12319"
      >
        </a
      ><a name="12328" href="one-lambda-calculus-many-times-2.html#12242" class="Function"
      >contract&#8242;</a
      ><a name="12337"
      > </a
      ><a name="12338" class="Symbol"
      >(</a
      ><a name="12339" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="12344"
      > </a
      ><a name="12345" href="one-lambda-calculus-many-times-2.html#12345" class="Bound"
      >i</a
      ><a name="12346" class="Symbol"
      >)</a
      ><a name="12347"
      > </a
      ><a name="12348" class="Symbol"
      >=</a
      ><a name="12349"
      > </a
      ><a name="12350" href="one-lambda-calculus-many-times-2.html#12345" class="Bound"
      >i</a
      >
{% endraw %}</pre>

And for permutation, we skip through our index until we've passed the $$\Gamma$$ portion of the context, and then we swap the first two formulas.

<pre class="Agda">{% raw %}
    <a name="12528" href="one-lambda-calculus-many-times-2.html#12528" class="Function"
      >p&#8242;</a
      ><a name="12530"
      > </a
      ><a name="12531" class="Symbol"
      >:</a
      ><a name="12532"
      > </a
      ><a name="12533" class="Symbol"
      >&#8704;</a
      ><a name="12534"
      > </a
      ><a name="12543" class="Symbol"
      >&#8594;</a
      ><a name="12544"
      > </a
      ><a name="12545" class="Symbol"
      >&#8704;</a
      ><a name="12546"
      > </a
      ><a name="12547" href="one-lambda-calculus-many-times-2.html#12547" class="Bound"
      >&#915;</a
      ><a name="12548"
      > </a
      ><a name="12549" class="Symbol"
      >&#8594;</a
      ><a name="12550"
      > </a
      ><a name="12551" class="Symbol"
      >&#8704;</a
      ><a name="12552"
      > </a
      ><a name="12557" class="Symbol"
      >&#8594;</a
      ><a name="12558"
      > </a
      ><a name="12559" href="2016-03-20-one-lambda-calculus-many-times.html#5371" class="Datatype Operator"
      >ND</a
      ><a name="12561"
      > </a
      ><a name="12562" href="one-lambda-calculus-many-times-2.html#12547" class="Bound"
      >&#915;</a
      ><a name="12563"
      > </a
      ><a name="12564" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="12566"
      > </a
      ><a name="12567" href="one-lambda-calculus-many-times-2.html#12536" class="Bound"
      >A</a
      ><a name="12568"
      > </a
      ><a name="12569" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12570"
      > </a
      ><a name="12571" href="one-lambda-calculus-many-times-2.html#12538" class="Bound"
      >B</a
      ><a name="12572"
      > </a
      ><a name="12573" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12574"
      > </a
      ><a name="12575" href="one-lambda-calculus-many-times-2.html#12554" class="Bound"
      >&#916;</a
      ><a name="12576"
      > </a
      ><a name="12577" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="12578"
      > </a
      ><a name="12579" href="one-lambda-calculus-many-times-2.html#12540" class="Bound"
      >C</a
      ><a name="12580"
      > </a
      ><a name="12581" class="Symbol"
      >&#8594;</a
      ><a name="12582"
      > </a
      ><a name="12583" href="2016-03-20-one-lambda-calculus-many-times.html#5371" class="Datatype Operator"
      >ND</a
      ><a name="12585"
      > </a
      ><a name="12586" href="one-lambda-calculus-many-times-2.html#12547" class="Bound"
      >&#915;</a
      ><a name="12587"
      > </a
      ><a name="12588" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="12590"
      > </a
      ><a name="12591" href="one-lambda-calculus-many-times-2.html#12538" class="Bound"
      >B</a
      ><a name="12592"
      > </a
      ><a name="12593" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12594"
      > </a
      ><a name="12595" href="one-lambda-calculus-many-times-2.html#12536" class="Bound"
      >A</a
      ><a name="12596"
      > </a
      ><a name="12597" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12598"
      > </a
      ><a name="12599" href="one-lambda-calculus-many-times-2.html#12554" class="Bound"
      >&#916;</a
      ><a name="12600"
      > </a
      ><a name="12601" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="12602"
      > </a
      ><a name="12603" href="one-lambda-calculus-many-times-2.html#12540" class="Bound"
      >C</a
      ><a name="12604"
      >
    </a
      ><a name="12609" href="one-lambda-calculus-many-times-2.html#12528" class="Function"
      >p&#8242;</a
      ><a name="12611"
      > </a
      ><a name="12612" href="one-lambda-calculus-many-times-2.html#12612" class="Bound"
      >&#915;</a
      ><a name="12613"
      > </a
      ><a name="12614" class="Symbol"
      >=</a
      ><a name="12615"
      > </a
      ><a name="12616" href="2016-03-20-one-lambda-calculus-many-times.html#7305" class="Function"
      >struct</a
      ><a name="12622"
      > </a
      ><a name="12623" class="Symbol"
      >(</a
      ><a name="12624" href="one-lambda-calculus-many-times-2.html#12656" class="Function"
      >permute&#8242;</a
      ><a name="12632"
      > </a
      ><a name="12633" href="one-lambda-calculus-many-times-2.html#12612" class="Bound"
      >&#915;</a
      ><a name="12634" class="Symbol"
      >)</a
      ><a name="12635"
      >
      </a
      ><a name="12642" class="Keyword"
      >where</a
      ><a name="12647"
      >
        </a
      ><a name="12656" href="one-lambda-calculus-many-times-2.html#12656" class="Function"
      >permute&#8242;</a
      ><a name="12664"
      > </a
      ><a name="12665" class="Symbol"
      >:</a
      ><a name="12666"
      > </a
      ><a name="12667" class="Symbol"
      >&#8704;</a
      ><a name="12668"
      > </a
      ><a name="12675" class="Symbol"
      >&#8594;</a
      ><a name="12676"
      > </a
      ><a name="12677" class="Symbol"
      >&#8704;</a
      ><a name="12678"
      > </a
      ><a name="12679" href="one-lambda-calculus-many-times-2.html#12679" class="Bound"
      >&#915;</a
      ><a name="12680"
      > </a
      ><a name="12681" class="Symbol"
      >&#8594;</a
      ><a name="12682"
      > </a
      ><a name="12683" class="Symbol"
      >&#8704;</a
      ><a name="12684"
      > </a
      ><a name="12689" class="Symbol"
      >&#8594;</a
      ><a name="12690"
      > </a
      ><a name="12691" href="one-lambda-calculus-many-times-2.html#12679" class="Bound"
      >&#915;</a
      ><a name="12692"
      > </a
      ><a name="12693" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="12695"
      > </a
      ><a name="12696" href="one-lambda-calculus-many-times-2.html#12670" class="Bound"
      >A</a
      ><a name="12697"
      > </a
      ><a name="12698" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12699"
      > </a
      ><a name="12700" href="one-lambda-calculus-many-times-2.html#12672" class="Bound"
      >B</a
      ><a name="12701"
      > </a
      ><a name="12702" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12703"
      > </a
      ><a name="12704" href="one-lambda-calculus-many-times-2.html#12686" class="Bound"
      >&#916;</a
      ><a name="12705"
      > </a
      ><a name="12706" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#3056" class="Function Operator"
      >&#8838;</a
      ><a name="12707"
      > </a
      ><a name="12708" href="one-lambda-calculus-many-times-2.html#12679" class="Bound"
      >&#915;</a
      ><a name="12709"
      > </a
      ><a name="12710" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="12712"
      > </a
      ><a name="12713" href="one-lambda-calculus-many-times-2.html#12672" class="Bound"
      >B</a
      ><a name="12714"
      > </a
      ><a name="12715" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12716"
      > </a
      ><a name="12717" href="one-lambda-calculus-many-times-2.html#12670" class="Bound"
      >A</a
      ><a name="12718"
      > </a
      ><a name="12719" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12720"
      > </a
      ><a name="12721" href="one-lambda-calculus-many-times-2.html#12686" class="Bound"
      >&#916;</a
      ><a name="12722"
      >
        </a
      ><a name="12731" href="one-lambda-calculus-many-times-2.html#12656" class="Function"
      >permute&#8242;</a
      ><a name="12739"
      > </a
      ><a name="12740" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="12742"
      >      </a
      ><a name="12748" class="Symbol"
      >(</a
      ><a name="12749" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="12753"
      > </a
      ><a name="12754" href="one-lambda-calculus-many-times-2.html#12754" class="Bound"
      >px</a
      ><a name="12756" class="Symbol"
      >)</a
      ><a name="12757"
      >         </a
      ><a name="12766" class="Symbol"
      >=</a
      ><a name="12767"
      > </a
      ><a name="12768" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="12773"
      > </a
      ><a name="12774" class="Symbol"
      >(</a
      ><a name="12775" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="12779"
      > </a
      ><a name="12780" href="one-lambda-calculus-many-times-2.html#12754" class="Bound"
      >px</a
      ><a name="12782" class="Symbol"
      >)</a
      ><a name="12783"
      >
        </a
      ><a name="12792" href="one-lambda-calculus-many-times-2.html#12656" class="Function"
      >permute&#8242;</a
      ><a name="12800"
      > </a
      ><a name="12801" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="12803"
      >      </a
      ><a name="12809" class="Symbol"
      >(</a
      ><a name="12810" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="12815"
      > </a
      ><a name="12816" class="Symbol"
      >(</a
      ><a name="12817" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="12821"
      > </a
      ><a name="12822" href="one-lambda-calculus-many-times-2.html#12822" class="Bound"
      >px</a
      ><a name="12824" class="Symbol"
      >))</a
      ><a name="12826"
      > </a
      ><a name="12827" class="Symbol"
      >=</a
      ><a name="12828"
      > </a
      ><a name="12829" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="12833"
      > </a
      ><a name="12834" href="one-lambda-calculus-many-times-2.html#12822" class="Bound"
      >px</a
      ><a name="12836"
      >
        </a
      ><a name="12845" href="one-lambda-calculus-many-times-2.html#12656" class="Function"
      >permute&#8242;</a
      ><a name="12853"
      > </a
      ><a name="12854" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="12856"
      >      </a
      ><a name="12862" class="Symbol"
      >(</a
      ><a name="12863" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="12868"
      > </a
      ><a name="12869" class="Symbol"
      >(</a
      ><a name="12870" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="12875"
      > </a
      ><a name="12876" href="one-lambda-calculus-many-times-2.html#12876" class="Bound"
      >i</a
      ><a name="12877" class="Symbol"
      >))</a
      ><a name="12879"
      > </a
      ><a name="12880" class="Symbol"
      >=</a
      ><a name="12881"
      > </a
      ><a name="12882" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="12887"
      > </a
      ><a name="12888" class="Symbol"
      >(</a
      ><a name="12889" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="12894"
      > </a
      ><a name="12895" href="one-lambda-calculus-many-times-2.html#12876" class="Bound"
      >i</a
      ><a name="12896" class="Symbol"
      >)</a
      ><a name="12897"
      >
        </a
      ><a name="12906" href="one-lambda-calculus-many-times-2.html#12656" class="Function"
      >permute&#8242;</a
      ><a name="12914"
      > </a
      ><a name="12915" class="Symbol"
      >(</a
      ><a name="12916" href="one-lambda-calculus-many-times-2.html#12916" class="Bound"
      >C</a
      ><a name="12917"
      > </a
      ><a name="12918" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12919"
      > </a
      ><a name="12920" href="one-lambda-calculus-many-times-2.html#12920" class="Bound"
      >&#915;</a
      ><a name="12921" class="Symbol"
      >)</a
      ><a name="12922"
      > </a
      ><a name="12923" class="Symbol"
      >(</a
      ><a name="12924" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="12928"
      > </a
      ><a name="12929" href="one-lambda-calculus-many-times-2.html#12929" class="Bound"
      >px</a
      ><a name="12931" class="Symbol"
      >)</a
      ><a name="12932"
      >         </a
      ><a name="12941" class="Symbol"
      >=</a
      ><a name="12942"
      > </a
      ><a name="12943" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="12947"
      > </a
      ><a name="12948" href="one-lambda-calculus-many-times-2.html#12929" class="Bound"
      >px</a
      ><a name="12950"
      >
        </a
      ><a name="12959" href="one-lambda-calculus-many-times-2.html#12656" class="Function"
      >permute&#8242;</a
      ><a name="12967"
      > </a
      ><a name="12968" class="Symbol"
      >(</a
      ><a name="12969" href="one-lambda-calculus-many-times-2.html#12969" class="Bound"
      >C</a
      ><a name="12970"
      > </a
      ><a name="12971" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12972"
      > </a
      ><a name="12973" href="one-lambda-calculus-many-times-2.html#12973" class="Bound"
      >&#915;</a
      ><a name="12974" class="Symbol"
      >)</a
      ><a name="12975"
      > </a
      ><a name="12976" class="Symbol"
      >(</a
      ><a name="12977" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="12982"
      > </a
      ><a name="12983" href="one-lambda-calculus-many-times-2.html#12983" class="Bound"
      >i</a
      ><a name="12984" class="Symbol"
      >)</a
      ><a name="12985"
      >         </a
      ><a name="12994" class="Symbol"
      >=</a
      ><a name="12995"
      > </a
      ><a name="12996" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="13001"
      > </a
      ><a name="13002" class="Symbol"
      >(</a
      ><a name="13003" href="one-lambda-calculus-many-times-2.html#12656" class="Function"
      >permute&#8242;</a
      ><a name="13011"
      > </a
      ><a name="13012" href="one-lambda-calculus-many-times-2.html#12973" class="Bound"
      >&#915;</a
      ><a name="13013"
      > </a
      ><a name="13014" href="one-lambda-calculus-many-times-2.html#12983" class="Bound"
      >i</a
      ><a name="13015" class="Symbol"
      >)</a
      >
{% endraw %}</pre>

So, do we have enough to prove equivalence between the two systems? No, sadly we do not. If we have a look at the two versions of $$\small{\Rightarrow}\!e$$, we see that they use contexts quite differently...

$$
  \frac{\Gamma \vdash A \Rightarrow B \quad \Gamma \vdash A}{\Gamma \vdash B}{\small{\Rightarrow}\!e}
  \quad
  \frac{\Gamma \vdash A \Rightarrow B \quad \Delta \vdash A}{\Gamma , \Delta \vdash B}{\small{\Rightarrow}\!e}
$$

If we were to try and use the second version to simulate the first, we'd find that we end up with *two* copies of the context $$\Gamma$$. We would need some souped up version of contraction to contract these two contexts back into one... If, on the other hand, we were to try and use the first version to simulate the second, we run into a different problem: the first version of $$\small{\Rightarrow}\!e$$ expects both premises to *share* a context, but the premises have contexts $$\Gamma$$ and $$\Delta$$, respectively. So we need two versions of weakening which can add an entire *context* to the right or left, respectively.

$$
  \frac{\Gamma , \Gamma \vdash B}{\Gamma \vdash B}{\small c^+}
  \quad
  \frac{\Gamma \vdash B}{\Gamma , \Delta \vdash B}{\small w^l}
  \quad
  \frac{\Delta \vdash B}{\Gamma , \Delta \vdash B}{\small w^r}
$$

At this point, it may be a better idea to just derive a new, more permissive set of structural rules. This is what we'll do in the next section.

### More Expressive Structural Rules

The usual structural rules for NJ are theoretically sufficient, but in practice they are rather limiting. Therefore, in this section, we will present more permissive variants, and show that they too are admissible in ND. Below you will see the more expressive variants of the structural rules. Instead of weakening, contracting or permuting formulas, these rules permute entire contexts.

I've added one new rule, $$\small f^+$$ or "forward". It's in parenthesis because it is an obvious instance of permutation. I've nontheless added it, because it is a useful lemma on the way to proving permutation.

$$
  \frac{\Delta \vdash B}{\Gamma , \Delta \vdash B}{\small w^+}
  \quad
  \left(
  \frac{\Gamma , \Sigma , A , \Delta \vdash C}{\Gamma , A , \Sigma , \Delta \vdash C}{\small f^+}
  \right)
  \quad
  \frac{\Gamma , \Sigma , \Pi , \Delta \vdash C}{\Gamma , \Pi , \Sigma , \Delta \vdash C}{\small p^+}
  \quad
  \frac{\Gamma , \Gamma , \Delta \vdash B}{\Gamma , \Delta \vdash B}{\small c^+}
$$


Since we already have a structural theorem (<a href="/2016/one-lambda-calculus-many-times/#7305" class="Agda Spec Function">struct</a>) for ND, we only have to show that these equations hold for the subset relationship.

$$
  \begin{array}{crcl}
  (w^{+}) & {\Delta} & \subseteq & {\Gamma , \Delta} \\
  (f^{+}) & {\Gamma , \Sigma , A , \Delta} & \subseteq & {\Gamma , A , \Sigma , \Delta} \\
  (p^{+}) & {\Gamma , \Sigma , \Pi , \Delta} & \subseteq & {\Gamma , \Pi , \Sigma , \Delta} \\
  (c^{+}) & {\Gamma , \Gamma , \Delta} & \subseteq & {\Gamma , \Delta}
  \end{array}
$$


Weakening is still quite trivial. Instead of applying <a class="Agda InductiveConstructor Spec" target="_blank" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227">there</a> once, we now apply it multiple times, until we've removed the entire context $$\Gamma$$.

<pre class="Agda">{% raw %}
    <a name="16366" href="one-lambda-calculus-many-times-2.html#16366" class="Function"
      >weaken</a
      ><a name="16372"
      > </a
      ><a name="16373" class="Symbol"
      >:</a
      ><a name="16374"
      > </a
      ><a name="16375" class="Symbol"
      >&#8704;</a
      ><a name="16376"
      > </a
      ><a name="16377" href="one-lambda-calculus-many-times-2.html#16377" class="Bound"
      >&#915;</a
      ><a name="16378"
      > </a
      ><a name="16379" class="Symbol"
      >&#8594;</a
      ><a name="16380"
      > </a
      ><a name="16381" class="Symbol"
      >&#8704;</a
      ><a name="16382"
      > </a
      ><a name="16387" class="Symbol"
      >&#8594;</a
      ><a name="16388"
      > </a
      ><a name="16389" href="one-lambda-calculus-many-times-2.html#16384" class="Bound"
      >&#916;</a
      ><a name="16390"
      > </a
      ><a name="16391" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#3056" class="Function Operator"
      >&#8838;</a
      ><a name="16392"
      > </a
      ><a name="16393" href="one-lambda-calculus-many-times-2.html#16377" class="Bound"
      >&#915;</a
      ><a name="16394"
      > </a
      ><a name="16395" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="16397"
      > </a
      ><a name="16398" href="one-lambda-calculus-many-times-2.html#16384" class="Bound"
      >&#916;</a
      ><a name="16399"
      >
    </a
      ><a name="16404" href="one-lambda-calculus-many-times-2.html#16366" class="Function"
      >weaken</a
      ><a name="16410"
      > </a
      ><a name="16411" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="16413"
      >      </a
      ><a name="16419" href="one-lambda-calculus-many-times-2.html#16419" class="Bound"
      >i</a
      ><a name="16420"
      > </a
      ><a name="16421" class="Symbol"
      >=</a
      ><a name="16422"
      > </a
      ><a name="16423" href="one-lambda-calculus-many-times-2.html#16419" class="Bound"
      >i</a
      ><a name="16424"
      >
    </a
      ><a name="16429" href="one-lambda-calculus-many-times-2.html#16366" class="Function"
      >weaken</a
      ><a name="16435"
      > </a
      ><a name="16436" class="Symbol"
      >(</a
      ><a name="16437" href="one-lambda-calculus-many-times-2.html#16437" class="Bound"
      >A</a
      ><a name="16438"
      > </a
      ><a name="16439" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="16440"
      > </a
      ><a name="16441" href="one-lambda-calculus-many-times-2.html#16441" class="Bound"
      >&#915;</a
      ><a name="16442" class="Symbol"
      >)</a
      ><a name="16443"
      > </a
      ><a name="16444" href="one-lambda-calculus-many-times-2.html#16444" class="Bound"
      >i</a
      ><a name="16445"
      > </a
      ><a name="16446" class="Symbol"
      >=</a
      ><a name="16447"
      > </a
      ><a name="16448" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="16453"
      > </a
      ><a name="16454" class="Symbol"
      >(</a
      ><a name="16455" href="one-lambda-calculus-many-times-2.html#16366" class="Function"
      >weaken</a
      ><a name="16461"
      > </a
      ><a name="16462" href="one-lambda-calculus-many-times-2.html#16441" class="Bound"
      >&#915;</a
      ><a name="16463"
      > </a
      ><a name="16464" href="one-lambda-calculus-many-times-2.html#16444" class="Bound"
      >i</a
      ><a name="16465" class="Symbol"
      >)</a
      >
{% endraw %}</pre>

Forwards movement, or $$\small f^+$$, is a little bit more involved: we move a formula $$A$$ past a context $$\Sigma$$. We do so without moving any formulas in the prefix $$\Gamma$$ or the suffix $$\Delta$$. The definition of forwards movement is split into two maps on indices: <a class="Agda Spec Function">forward</a> and <a class="Agda Spec Function">forward′</a>. In <a class="Agda Spec Function">forward</a>, we define the mapping for indices which point to some position in $$\Gamma$$; nothing changes. Once we have moved past $$\Gamma$$, we enter the nested function <a class="Agda Spec Function">forward′</a>, and $$\Sigma$$. Here, we start moving each index one position back, to make room for the formula $$A$$. Once we move past $$\Sigma$$, and find the index pointint to $$A$$, all we have to do is return <a class="Agda Spec InductiveConstructor" target="_blank" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174">here</a>. Nothing has to change for the indices pointing into $$\Delta$$.

<pre class="Agda">{% raw %}
    <a name="17514" href="one-lambda-calculus-many-times-2.html#17514" class="Function"
      >forward</a
      ><a name="17521"
      > </a
      ><a name="17522" class="Symbol"
      >:</a
      ><a name="17523"
      > </a
      ><a name="17524" class="Symbol"
      >&#8704;</a
      ><a name="17525"
      > </a
      ><a name="17530" class="Symbol"
      >&#8594;</a
      ><a name="17531"
      > </a
      ><a name="17532" class="Symbol"
      >&#8704;</a
      ><a name="17533"
      > </a
      ><a name="17534" href="one-lambda-calculus-many-times-2.html#17534" class="Bound"
      >&#915;</a
      ><a name="17535"
      > </a
      ><a name="17536" href="one-lambda-calculus-many-times-2.html#17536" class="Bound"
      >&#931;</a
      ><a name="17537"
      > </a
      ><a name="17538" class="Symbol"
      >&#8594;</a
      ><a name="17539"
      > </a
      ><a name="17540" class="Symbol"
      >&#8704;</a
      ><a name="17541"
      > </a
      ><a name="17546" class="Symbol"
      >&#8594;</a
      ><a name="17547"
      > </a
      ><a name="17548" class="Symbol"
      >(</a
      ><a name="17549" href="one-lambda-calculus-many-times-2.html#17534" class="Bound"
      >&#915;</a
      ><a name="17550"
      > </a
      ><a name="17551" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="17553"
      > </a
      ><a name="17554" href="one-lambda-calculus-many-times-2.html#17536" class="Bound"
      >&#931;</a
      ><a name="17555" class="Symbol"
      >)</a
      ><a name="17556"
      > </a
      ><a name="17557" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="17559"
      > </a
      ><a name="17560" href="one-lambda-calculus-many-times-2.html#17527" class="Bound"
      >A</a
      ><a name="17561"
      > </a
      ><a name="17562" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="17563"
      > </a
      ><a name="17564" href="one-lambda-calculus-many-times-2.html#17543" class="Bound"
      >&#916;</a
      ><a name="17565"
      > </a
      ><a name="17566" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#3056" class="Function Operator"
      >&#8838;</a
      ><a name="17567"
      > </a
      ><a name="17568" class="Symbol"
      >(</a
      ><a name="17569" href="one-lambda-calculus-many-times-2.html#17534" class="Bound"
      >&#915;</a
      ><a name="17570"
      > </a
      ><a name="17571" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="17573"
      > </a
      ><a name="17574" href="one-lambda-calculus-many-times-2.html#17527" class="Bound"
      >A</a
      ><a name="17575"
      > </a
      ><a name="17576" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="17577"
      > </a
      ><a name="17578" href="one-lambda-calculus-many-times-2.html#17536" class="Bound"
      >&#931;</a
      ><a name="17579" class="Symbol"
      >)</a
      ><a name="17580"
      > </a
      ><a name="17581" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="17583"
      > </a
      ><a name="17584" href="one-lambda-calculus-many-times-2.html#17543" class="Bound"
      >&#916;</a
      ><a name="17585"
      >
    </a
      ><a name="17590" href="one-lambda-calculus-many-times-2.html#17514" class="Function"
      >forward</a
      ><a name="17597"
      > </a
      ><a name="17598" class="Symbol"
      >(</a
      ><a name="17599" href="one-lambda-calculus-many-times-2.html#17599" class="Bound"
      >C</a
      ><a name="17600"
      > </a
      ><a name="17601" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="17602"
      > </a
      ><a name="17603" href="one-lambda-calculus-many-times-2.html#17603" class="Bound"
      >&#915;</a
      ><a name="17604" class="Symbol"
      >)</a
      ><a name="17605"
      > </a
      ><a name="17606" href="one-lambda-calculus-many-times-2.html#17606" class="Bound"
      >&#931;</a
      ><a name="17607"
      > </a
      ><a name="17608" class="Symbol"
      >(</a
      ><a name="17609" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="17613"
      > </a
      ><a name="17614" href="one-lambda-calculus-many-times-2.html#17614" class="Bound"
      >px</a
      ><a name="17616" class="Symbol"
      >)</a
      ><a name="17617"
      > </a
      ><a name="17618" class="Symbol"
      >=</a
      ><a name="17619"
      > </a
      ><a name="17620" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="17624"
      > </a
      ><a name="17625" href="one-lambda-calculus-many-times-2.html#17614" class="Bound"
      >px</a
      ><a name="17627"
      >
    </a
      ><a name="17632" href="one-lambda-calculus-many-times-2.html#17514" class="Function"
      >forward</a
      ><a name="17639"
      > </a
      ><a name="17640" class="Symbol"
      >(</a
      ><a name="17641" href="one-lambda-calculus-many-times-2.html#17641" class="Bound"
      >C</a
      ><a name="17642"
      > </a
      ><a name="17643" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="17644"
      > </a
      ><a name="17645" href="one-lambda-calculus-many-times-2.html#17645" class="Bound"
      >&#915;</a
      ><a name="17646" class="Symbol"
      >)</a
      ><a name="17647"
      > </a
      ><a name="17648" href="one-lambda-calculus-many-times-2.html#17648" class="Bound"
      >&#931;</a
      ><a name="17649"
      > </a
      ><a name="17650" class="Symbol"
      >(</a
      ><a name="17651" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="17656"
      > </a
      ><a name="17657" href="one-lambda-calculus-many-times-2.html#17657" class="Bound"
      >i</a
      ><a name="17658" class="Symbol"
      >)</a
      ><a name="17659"
      > </a
      ><a name="17660" class="Symbol"
      >=</a
      ><a name="17661"
      > </a
      ><a name="17662" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="17667"
      > </a
      ><a name="17668" class="Symbol"
      >(</a
      ><a name="17669" href="one-lambda-calculus-many-times-2.html#17514" class="Function"
      >forward</a
      ><a name="17676"
      > </a
      ><a name="17677" href="one-lambda-calculus-many-times-2.html#17645" class="Bound"
      >&#915;</a
      ><a name="17678"
      > </a
      ><a name="17679" href="one-lambda-calculus-many-times-2.html#17648" class="Bound"
      >&#931;</a
      ><a name="17680"
      > </a
      ><a name="17681" href="one-lambda-calculus-many-times-2.html#17657" class="Bound"
      >i</a
      ><a name="17682" class="Symbol"
      >)</a
      ><a name="17683"
      >
    </a
      ><a name="17688" href="one-lambda-calculus-many-times-2.html#17514" class="Function"
      >forward</a
      ><a name="17695"
      > </a
      ><a name="17696" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="17698"
      >      </a
      ><a name="17704" href="one-lambda-calculus-many-times-2.html#17704" class="Bound"
      >&#931;</a
      ><a name="17705"
      >        </a
      ><a name="17713" href="one-lambda-calculus-many-times-2.html#17713" class="Bound"
      >i</a
      ><a name="17714"
      >  </a
      ><a name="17716" class="Symbol"
      >=</a
      ><a name="17717"
      > </a
      ><a name="17718" href="one-lambda-calculus-many-times-2.html#17751" class="Function"
      >forward&#8242;</a
      ><a name="17726"
      > </a
      ><a name="17727" href="one-lambda-calculus-many-times-2.html#17704" class="Bound"
      >&#931;</a
      ><a name="17728"
      > </a
      ><a name="17729" href="one-lambda-calculus-many-times-2.html#17713" class="Bound"
      >i</a
      ><a name="17730"
      >
      </a
      ><a name="17737" class="Keyword"
      >where</a
      ><a name="17742"
      >
        </a
      ><a name="17751" href="one-lambda-calculus-many-times-2.html#17751" class="Function"
      >forward&#8242;</a
      ><a name="17759"
      > </a
      ><a name="17760" class="Symbol"
      >:</a
      ><a name="17761"
      > </a
      ><a name="17762" class="Symbol"
      >&#8704;</a
      ><a name="17763"
      > </a
      ><a name="17768" class="Symbol"
      >&#8594;</a
      ><a name="17769"
      > </a
      ><a name="17770" class="Symbol"
      >&#8704;</a
      ><a name="17771"
      > </a
      ><a name="17772" href="one-lambda-calculus-many-times-2.html#17772" class="Bound"
      >&#931;</a
      ><a name="17773"
      > </a
      ><a name="17774" class="Symbol"
      >&#8594;</a
      ><a name="17775"
      > </a
      ><a name="17776" class="Symbol"
      >&#8704;</a
      ><a name="17777"
      > </a
      ><a name="17782" class="Symbol"
      >&#8594;</a
      ><a name="17783"
      > </a
      ><a name="17784" href="one-lambda-calculus-many-times-2.html#17772" class="Bound"
      >&#931;</a
      ><a name="17785"
      > </a
      ><a name="17786" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="17788"
      > </a
      ><a name="17789" href="one-lambda-calculus-many-times-2.html#17765" class="Bound"
      >A</a
      ><a name="17790"
      > </a
      ><a name="17791" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="17792"
      > </a
      ><a name="17793" href="one-lambda-calculus-many-times-2.html#17779" class="Bound"
      >&#916;</a
      ><a name="17794"
      > </a
      ><a name="17795" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#3056" class="Function Operator"
      >&#8838;</a
      ><a name="17796"
      > </a
      ><a name="17797" href="one-lambda-calculus-many-times-2.html#17765" class="Bound"
      >A</a
      ><a name="17798"
      > </a
      ><a name="17799" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="17800"
      > </a
      ><a name="17801" href="one-lambda-calculus-many-times-2.html#17772" class="Bound"
      >&#931;</a
      ><a name="17802"
      > </a
      ><a name="17803" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="17805"
      > </a
      ><a name="17806" href="one-lambda-calculus-many-times-2.html#17779" class="Bound"
      >&#916;</a
      ><a name="17807"
      >
        </a
      ><a name="17816" href="one-lambda-calculus-many-times-2.html#17751" class="Function"
      >forward&#8242;</a
      ><a name="17824"
      >      </a
      ><a name="17830" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="17832"
      >        </a
      ><a name="17840" href="one-lambda-calculus-many-times-2.html#17840" class="Bound"
      >i</a
      ><a name="17841"
      >  </a
      ><a name="17843" class="Symbol"
      >=</a
      ><a name="17844"
      > </a
      ><a name="17845" href="one-lambda-calculus-many-times-2.html#17840" class="Bound"
      >i</a
      ><a name="17846"
      >
        </a
      ><a name="17855" href="one-lambda-calculus-many-times-2.html#17751" class="Function"
      >forward&#8242;</a
      ><a name="17863"
      > </a
      ><a name="17864" class="Symbol"
      >(</a
      ><a name="17865" href="one-lambda-calculus-many-times-2.html#17865" class="Bound"
      >C</a
      ><a name="17866"
      > </a
      ><a name="17867" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="17868"
      > </a
      ><a name="17869" href="one-lambda-calculus-many-times-2.html#17869" class="Bound"
      >&#931;</a
      ><a name="17870" class="Symbol"
      >)</a
      ><a name="17871"
      > </a
      ><a name="17872" class="Symbol"
      >(</a
      ><a name="17873" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="17877"
      > </a
      ><a name="17878" href="one-lambda-calculus-many-times-2.html#17878" class="Bound"
      >px</a
      ><a name="17880" class="Symbol"
      >)</a
      ><a name="17881"
      > </a
      ><a name="17882" class="Symbol"
      >=</a
      ><a name="17883"
      > </a
      ><a name="17884" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="17889"
      > </a
      ><a name="17890" class="Symbol"
      >(</a
      ><a name="17891" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="17895"
      > </a
      ><a name="17896" href="one-lambda-calculus-many-times-2.html#17878" class="Bound"
      >px</a
      ><a name="17898" class="Symbol"
      >)</a
      ><a name="17899"
      >
        </a
      ><a name="17908" href="one-lambda-calculus-many-times-2.html#17751" class="Function"
      >forward&#8242;</a
      ><a name="17916"
      > </a
      ><a name="17917" class="Symbol"
      >(</a
      ><a name="17918" href="one-lambda-calculus-many-times-2.html#17918" class="Bound"
      >C</a
      ><a name="17919"
      > </a
      ><a name="17920" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="17921"
      > </a
      ><a name="17922" href="one-lambda-calculus-many-times-2.html#17922" class="Bound"
      >&#931;</a
      ><a name="17923" class="Symbol"
      >)</a
      ><a name="17924"
      > </a
      ><a name="17925" class="Symbol"
      >(</a
      ><a name="17926" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="17931"
      > </a
      ><a name="17932" href="one-lambda-calculus-many-times-2.html#17932" class="Bound"
      >i</a
      ><a name="17933" class="Symbol"
      >)</a
      ><a name="17934"
      > </a
      ><a name="17935" class="Keyword"
      >with</a
      ><a name="17939"
      > </a
      ><a name="17940" href="one-lambda-calculus-many-times-2.html#17751" class="Function"
      >forward&#8242;</a
      ><a name="17948"
      > </a
      ><a name="17949" href="one-lambda-calculus-many-times-2.html#17922" class="Bound"
      >&#931;</a
      ><a name="17950"
      > </a
      ><a name="17951" href="one-lambda-calculus-many-times-2.html#17932" class="Bound"
      >i</a
      ><a name="17952"
      >
        </a
      ><a name="17961" href="one-lambda-calculus-many-times-2.html#17751" class="Function"
      >forward&#8242;</a
      ><a name="17969"
      > </a
      ><a name="17970" class="Symbol"
      >(</a
      ><a name="17971" href="one-lambda-calculus-many-times-2.html#17971" class="Bound"
      >C</a
      ><a name="17972"
      > </a
      ><a name="17973" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="17974"
      > </a
      ><a name="17975" href="one-lambda-calculus-many-times-2.html#17975" class="Bound"
      >&#931;</a
      ><a name="17976" class="Symbol"
      >)</a
      ><a name="17977"
      > </a
      ><a name="17978" class="Symbol"
      >(</a
      ><a name="17979" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="17984"
      > </a
      ><a name="17985" href="one-lambda-calculus-many-times-2.html#17985" class="Bound"
      >i</a
      ><a name="17986" class="Symbol"
      >)</a
      ><a name="17987"
      > </a
      ><a name="17988" class="Symbol"
      >|</a
      ><a name="17989"
      > </a
      ><a name="17990" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="17994"
      > </a
      ><a name="17995" href="one-lambda-calculus-many-times-2.html#17995" class="Bound"
      >px</a
      ><a name="17997"
      > </a
      ><a name="17998" class="Symbol"
      >=</a
      ><a name="17999"
      > </a
      ><a name="18000" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="18004"
      > </a
      ><a name="18005" href="one-lambda-calculus-many-times-2.html#17995" class="Bound"
      >px</a
      ><a name="18007"
      >
        </a
      ><a name="18016" href="one-lambda-calculus-many-times-2.html#17751" class="Function"
      >forward&#8242;</a
      ><a name="18024"
      > </a
      ><a name="18025" class="Symbol"
      >(</a
      ><a name="18026" href="one-lambda-calculus-many-times-2.html#18026" class="Bound"
      >C</a
      ><a name="18027"
      > </a
      ><a name="18028" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="18029"
      > </a
      ><a name="18030" href="one-lambda-calculus-many-times-2.html#18030" class="Bound"
      >&#931;</a
      ><a name="18031" class="Symbol"
      >)</a
      ><a name="18032"
      > </a
      ><a name="18033" class="Symbol"
      >(</a
      ><a name="18034" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="18039"
      > </a
      ><a name="18040" href="one-lambda-calculus-many-times-2.html#18040" class="Bound"
      >i</a
      ><a name="18041" class="Symbol"
      >)</a
      ><a name="18042"
      > </a
      ><a name="18043" class="Symbol"
      >|</a
      ><a name="18044"
      > </a
      ><a name="18045" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="18050"
      > </a
      ><a name="18051" href="one-lambda-calculus-many-times-2.html#18051" class="Bound"
      >j</a
      ><a name="18052"
      > </a
      ><a name="18053" class="Symbol"
      >=</a
      ><a name="18054"
      > </a
      ><a name="18055" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="18060"
      > </a
      ><a name="18061" class="Symbol"
      >(</a
      ><a name="18062" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="18067"
      > </a
      ><a name="18068" href="one-lambda-calculus-many-times-2.html#18051" class="Bound"
      >j</a
      ><a name="18069" class="Symbol"
      >)</a
      >
{% endraw %}</pre>

With a rule for forwards movement in hand, we can start to prove permutation. The proof itself is broken down in *two* cases: $$\Pi = \emptyset$$ and $$\Pi = A , \Pi'$$.

$$
    \frac
    {\Gamma , \Sigma , \emptyset , \Delta \vdash C}
    {\Gamma , \emptyset , \Sigma , \Delta \vdash C}
    \quad
    \frac
    {\Gamma , \Sigma , A , \Pi' , \Delta \vdash C}
    {\Gamma , A , \Pi' , \Sigma , \Delta \vdash C}
$$

The first case is trivial, and simply requires rewriting by proofs of right identity and associativity (as the actual sequent is $$((\Gamma,\Sigma), (\emptyset,\Delta))$$). For the second case, we prove the statement by moving the $$A$$ forwards across the $$\Sigma$$ (using $$\small f^+$$) and then permuting $$\Sigma$$ and $$\Pi'$$. The proof in Agda, however, is rather hard to read. This is because there is no pleasant way to intersperse code and rewrites (à la <a class="Agda Spec Keyword">rewrite</a>). To help you decipher the proof, I've inserted the intermediate terms as comments.

<pre class="Agda">{% raw %}
    <a name="19107" href="one-lambda-calculus-many-times-2.html#19107" class="Function"
      >permute</a
      ><a name="19114"
      > </a
      ><a name="19115" class="Symbol"
      >:</a
      ><a name="19116"
      > </a
      ><a name="19117" class="Symbol"
      >&#8704;</a
      ><a name="19118"
      > </a
      ><a name="19119" href="one-lambda-calculus-many-times-2.html#19119" class="Bound"
      >&#915;</a
      ><a name="19120"
      > </a
      ><a name="19121" href="one-lambda-calculus-many-times-2.html#19121" class="Bound"
      >&#931;</a
      ><a name="19122"
      > </a
      ><a name="19123" href="one-lambda-calculus-many-times-2.html#19123" class="Bound"
      >&#928;</a
      ><a name="19124"
      > </a
      ><a name="19125" class="Symbol"
      >&#8594;</a
      ><a name="19126"
      > </a
      ><a name="19127" class="Symbol"
      >&#8704;</a
      ><a name="19128"
      > </a
      ><a name="19133" class="Symbol"
      >&#8594;</a
      ><a name="19134"
      > </a
      ><a name="19135" class="Symbol"
      >(</a
      ><a name="19136" href="one-lambda-calculus-many-times-2.html#19119" class="Bound"
      >&#915;</a
      ><a name="19137"
      > </a
      ><a name="19138" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19140"
      > </a
      ><a name="19141" href="one-lambda-calculus-many-times-2.html#19121" class="Bound"
      >&#931;</a
      ><a name="19142" class="Symbol"
      >)</a
      ><a name="19143"
      > </a
      ><a name="19144" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19146"
      > </a
      ><a name="19147" class="Symbol"
      >(</a
      ><a name="19148" href="one-lambda-calculus-many-times-2.html#19123" class="Bound"
      >&#928;</a
      ><a name="19149"
      > </a
      ><a name="19150" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19152"
      > </a
      ><a name="19153" href="one-lambda-calculus-many-times-2.html#19130" class="Bound"
      >&#916;</a
      ><a name="19154" class="Symbol"
      >)</a
      ><a name="19155"
      > </a
      ><a name="19156" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#3056" class="Function Operator"
      >&#8838;</a
      ><a name="19157"
      > </a
      ><a name="19158" class="Symbol"
      >(</a
      ><a name="19159" href="one-lambda-calculus-many-times-2.html#19119" class="Bound"
      >&#915;</a
      ><a name="19160"
      > </a
      ><a name="19161" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19163"
      > </a
      ><a name="19164" href="one-lambda-calculus-many-times-2.html#19123" class="Bound"
      >&#928;</a
      ><a name="19165" class="Symbol"
      >)</a
      ><a name="19166"
      > </a
      ><a name="19167" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19169"
      > </a
      ><a name="19170" class="Symbol"
      >(</a
      ><a name="19171" href="one-lambda-calculus-many-times-2.html#19121" class="Bound"
      >&#931;</a
      ><a name="19172"
      > </a
      ><a name="19173" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19175"
      > </a
      ><a name="19176" href="one-lambda-calculus-many-times-2.html#19130" class="Bound"
      >&#916;</a
      ><a name="19177" class="Symbol"
      >)</a
      ><a name="19178"
      >
    </a
      ><a name="19183" href="one-lambda-calculus-many-times-2.html#19107" class="Function"
      >permute</a
      ><a name="19190"
      > </a
      ><a name="19191" href="one-lambda-calculus-many-times-2.html#19191" class="Bound"
      >&#915;</a
      ><a name="19192"
      > </a
      ><a name="19193" href="one-lambda-calculus-many-times-2.html#19193" class="Bound"
      >&#931;</a
      ><a name="19194"
      > </a
      ><a name="19195" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="19197"
      > </a
      ><a name="19202" href="one-lambda-calculus-many-times-2.html#19202" class="Bound"
      >i</a
      ><a name="19203"
      >
           </a
      ><a name="19215" class="Comment"
      >-- x &#8712; (&#915; ++ &#928;) ++ [] ++ &#916;</a
      ><a name="19241"
      >
      </a
      ><a name="19248" class="Keyword"
      >rewrite</a
      ><a name="19255"
      > </a
      ><a name="19256" href="one-lambda-calculus-many-times-2.html#2016" class="Function"
      >++-identity&#691;</a
      ><a name="19268"
      > </a
      ><a name="19269" href="one-lambda-calculus-many-times-2.html#19191" class="Bound"
      >&#915;</a
      ><a name="19270"
      >
           </a
      ><a name="19282" class="Comment"
      >-- x &#8712; (&#915; ++ &#928;) ++ &#916;</a
      ><a name="19302"
      >
            </a
      ><a name="19315" class="Symbol"
      >|</a
      ><a name="19316"
      > </a
      ><a name="19317" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#811" class="Function"
      >++-assoc</a
      ><a name="19325"
      > </a
      ><a name="19326" href="one-lambda-calculus-many-times-2.html#19191" class="Bound"
      >&#915;</a
      ><a name="19327"
      > </a
      ><a name="19328" href="one-lambda-calculus-many-times-2.html#19193" class="Bound"
      >&#931;</a
      ><a name="19329"
      > </a
      ><a name="19330" href="one-lambda-calculus-many-times-2.html#19199" class="Bound"
      >&#916;</a
      ><a name="19331"
      >
           </a
      ><a name="19343" class="Comment"
      >-- x &#8712; &#915; ++ &#928; ++ &#916;</a
      ><a name="19361"
      >
            </a
      ><a name="19374" class="Symbol"
      >=</a
      ><a name="19375"
      > </a
      ><a name="19376" href="one-lambda-calculus-many-times-2.html#19202" class="Bound"
      >i</a
      ><a name="19377"
      >

    </a
      ><a name="19383" href="one-lambda-calculus-many-times-2.html#19107" class="Function"
      >permute</a
      ><a name="19390"
      > </a
      ><a name="19391" href="one-lambda-calculus-many-times-2.html#19391" class="Bound"
      >&#915;</a
      ><a name="19392"
      > </a
      ><a name="19393" href="one-lambda-calculus-many-times-2.html#19393" class="Bound"
      >&#928;</a
      ><a name="19394"
      > </a
      ><a name="19395" class="Symbol"
      >(</a
      ><a name="19396" href="one-lambda-calculus-many-times-2.html#19396" class="Bound"
      >A</a
      ><a name="19397"
      > </a
      ><a name="19398" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="19399"
      > </a
      ><a name="19400" href="one-lambda-calculus-many-times-2.html#19400" class="Bound"
      >&#931;</a
      ><a name="19401" class="Symbol"
      >)</a
      ><a name="19402"
      > </a
      ><a name="19407" href="one-lambda-calculus-many-times-2.html#19407" class="Bound"
      >i</a
      ><a name="19408"
      >
           </a
      ><a name="19420" class="Comment"
      >-- x &#8712; (&#915; ++ A &#8759; &#931;) ++ &#928; ++ &#916;</a
      ><a name="19449"
      >
      </a
      ><a name="19456" class="Keyword"
      >rewrite</a
      ><a name="19463"
      > </a
      ><a name="19464" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#565" class="Function"
      >sym</a
      ><a name="19467"
      > </a
      ><a name="19468" class="Symbol"
      >(</a
      ><a name="19469" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#811" class="Function"
      >++-assoc</a
      ><a name="19477"
      > </a
      ><a name="19478" href="one-lambda-calculus-many-times-2.html#19391" class="Bound"
      >&#915;</a
      ><a name="19479"
      > </a
      ><a name="19480" class="Symbol"
      >(</a
      ><a name="19481" href="one-lambda-calculus-many-times-2.html#19396" class="Bound"
      >A</a
      ><a name="19482"
      > </a
      ><a name="19483" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="19484"
      > </a
      ><a name="19485" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="19487" class="Symbol"
      >)</a
      ><a name="19488"
      > </a
      ><a name="19489" href="one-lambda-calculus-many-times-2.html#19400" class="Bound"
      >&#931;</a
      ><a name="19490" class="Symbol"
      >)</a
      ><a name="19491"
      >
           </a
      ><a name="19503" class="Comment"
      >-- x &#8712; ((&#915; ++ A &#8759; []) ++ &#931;) ++ &#928; ++ &#916;</a
      ><a name="19540"
      >
            </a
      ><a name="19553" class="Symbol"
      >=</a
      ><a name="19554"
      > </a
      ><a name="19555" href="one-lambda-calculus-many-times-2.html#19107" class="Function"
      >permute</a
      ><a name="19562"
      > </a
      ><a name="19563" class="Symbol"
      >(</a
      ><a name="19564" href="one-lambda-calculus-many-times-2.html#19391" class="Bound"
      >&#915;</a
      ><a name="19565"
      > </a
      ><a name="19566" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19568"
      > </a
      ><a name="19569" href="one-lambda-calculus-many-times-2.html#19396" class="Bound"
      >A</a
      ><a name="19570"
      > </a
      ><a name="19571" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="19572"
      > </a
      ><a name="19573" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="19575" class="Symbol"
      >)</a
      ><a name="19576"
      > </a
      ><a name="19577" href="one-lambda-calculus-many-times-2.html#19393" class="Bound"
      >&#928;</a
      ><a name="19578"
      > </a
      ><a name="19579" href="one-lambda-calculus-many-times-2.html#19400" class="Bound"
      >&#931;</a
      ><a name="19580"
      > </a
      ><a name="19581" href="one-lambda-calculus-many-times-2.html#19607" class="Function"
      >j</a
      ><a name="19582"
      >
        </a
      ><a name="19591" class="Keyword"
      >where</a
      ><a name="19596"
      >
          </a
      ><a name="19607" href="one-lambda-calculus-many-times-2.html#19607" class="Function"
      >j</a
      ><a name="19608"
      > </a
      ><a name="19609" class="Symbol"
      >:</a
      ><a name="19610"
      > </a
      ><a name="19611" class="Symbol"
      >_</a
      ><a name="19612"
      > </a
      ><a name="19613" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#2920" class="Function Operator"
      >&#8712;</a
      ><a name="19614"
      > </a
      ><a name="19615" class="Symbol"
      >((</a
      ><a name="19617" href="one-lambda-calculus-many-times-2.html#19391" class="Bound"
      >&#915;</a
      ><a name="19618"
      > </a
      ><a name="19619" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19621"
      > </a
      ><a name="19622" href="one-lambda-calculus-many-times-2.html#19396" class="Bound"
      >A</a
      ><a name="19623"
      > </a
      ><a name="19624" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="19625"
      > </a
      ><a name="19626" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="19628" class="Symbol"
      >)</a
      ><a name="19629"
      > </a
      ><a name="19630" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19632"
      > </a
      ><a name="19633" href="one-lambda-calculus-many-times-2.html#19393" class="Bound"
      >&#928;</a
      ><a name="19634" class="Symbol"
      >)</a
      ><a name="19635"
      > </a
      ><a name="19636" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19638"
      > </a
      ><a name="19639" href="one-lambda-calculus-many-times-2.html#19400" class="Bound"
      >&#931;</a
      ><a name="19640"
      > </a
      ><a name="19641" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19643"
      > </a
      ><a name="19644" href="one-lambda-calculus-many-times-2.html#19404" class="Bound"
      >&#916;</a
      ><a name="19645"
      >
          </a
      ><a name="19656" href="one-lambda-calculus-many-times-2.html#19607" class="Function"
      >j</a
      ><a name="19657"
      > </a
      ><a name="19658" class="Keyword"
      >rewrite</a
      ><a name="19665"
      > </a
      ><a name="19666" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#811" class="Function"
      >++-assoc</a
      ><a name="19674"
      > </a
      ><a name="19675" href="one-lambda-calculus-many-times-2.html#19391" class="Bound"
      >&#915;</a
      ><a name="19676"
      > </a
      ><a name="19677" class="Symbol"
      >(</a
      ><a name="19678" href="one-lambda-calculus-many-times-2.html#19396" class="Bound"
      >A</a
      ><a name="19679"
      > </a
      ><a name="19680" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="19681"
      > </a
      ><a name="19682" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="19684" class="Symbol"
      >)</a
      ><a name="19685"
      > </a
      ><a name="19686" href="one-lambda-calculus-many-times-2.html#19393" class="Bound"
      >&#928;</a
      ><a name="19687"
      >
                 </a
      ><a name="19705" class="Comment"
      >-- x &#8712; (&#915; ++ A &#8759; &#928;) ++ &#931; ++ &#916;</a
      ><a name="19734"
      >
                  </a
      ><a name="19753" class="Symbol"
      >=</a
      ><a name="19754"
      > </a
      ><a name="19755" href="one-lambda-calculus-many-times-2.html#17514" class="Function"
      >forward</a
      ><a name="19762"
      > </a
      ><a name="19763" href="one-lambda-calculus-many-times-2.html#19391" class="Bound"
      >&#915;</a
      ><a name="19764"
      > </a
      ><a name="19765" href="one-lambda-calculus-many-times-2.html#19393" class="Bound"
      >&#928;</a
      ><a name="19766"
      > </a
      ><a name="19767" href="one-lambda-calculus-many-times-2.html#19407" class="Bound"
      >i</a
      >
{% endraw %}</pre>

In our previous version of contraction, all we had to do was merge any references to the first two formulas in our context.

<pre class="Agda">{% raw %}
    <a name="19923" href="one-lambda-calculus-many-times-2.html#19923" class="Function"
      >contract</a
      ><a name="19931"
      > </a
      ><a name="19932" class="Symbol"
      >:</a
      ><a name="19933"
      > </a
      ><a name="19934" class="Symbol"
      >&#8704;</a
      ><a name="19935"
      > </a
      ><a name="19936" href="one-lambda-calculus-many-times-2.html#19936" class="Bound"
      >&#915;</a
      ><a name="19937"
      > </a
      ><a name="19938" class="Symbol"
      >&#8594;</a
      ><a name="19939"
      > </a
      ><a name="19940" class="Symbol"
      >&#8704;</a
      ><a name="19941"
      > </a
      ><a name="19946" class="Symbol"
      >&#8594;</a
      ><a name="19947"
      > </a
      ><a name="19948" class="Symbol"
      >(</a
      ><a name="19949" href="one-lambda-calculus-many-times-2.html#19936" class="Bound"
      >&#915;</a
      ><a name="19950"
      > </a
      ><a name="19951" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19953"
      > </a
      ><a name="19954" href="one-lambda-calculus-many-times-2.html#19936" class="Bound"
      >&#915;</a
      ><a name="19955" class="Symbol"
      >)</a
      ><a name="19956"
      > </a
      ><a name="19957" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19959"
      > </a
      ><a name="19960" href="one-lambda-calculus-many-times-2.html#19943" class="Bound"
      >&#916;</a
      ><a name="19961"
      > </a
      ><a name="19962" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#3056" class="Function Operator"
      >&#8838;</a
      ><a name="19963"
      > </a
      ><a name="19964" href="one-lambda-calculus-many-times-2.html#19936" class="Bound"
      >&#915;</a
      ><a name="19965"
      > </a
      ><a name="19966" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19968"
      > </a
      ><a name="19969" href="one-lambda-calculus-many-times-2.html#19943" class="Bound"
      >&#916;</a
      ><a name="19970"
      >
    </a
      ><a name="19975" href="one-lambda-calculus-many-times-2.html#19923" class="Function"
      >contract</a
      ><a name="19983"
      > </a
      ><a name="19984" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="19986"
      >      </a
      ><a name="19996" href="one-lambda-calculus-many-times-2.html#19996" class="Bound"
      >i</a
      ><a name="19997"
      > </a
      ><a name="19998" class="Symbol"
      >=</a
      ><a name="19999"
      > </a
      ><a name="20000" href="one-lambda-calculus-many-times-2.html#19996" class="Bound"
      >i</a
      ><a name="20001"
      >
    </a
      ><a name="20006" href="one-lambda-calculus-many-times-2.html#19923" class="Function"
      >contract</a
      ><a name="20014"
      > </a
      ><a name="20015" class="Symbol"
      >(</a
      ><a name="20016" href="one-lambda-calculus-many-times-2.html#20016" class="Bound"
      >A</a
      ><a name="20017"
      > </a
      ><a name="20018" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="20019"
      > </a
      ><a name="20020" href="one-lambda-calculus-many-times-2.html#20020" class="Bound"
      >&#915;</a
      ><a name="20021" class="Symbol"
      >)</a
      ><a name="20022"
      > </a
      ><a name="20027" class="Symbol"
      >(</a
      ><a name="20028" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="20032"
      > </a
      ><a name="20033" href="one-lambda-calculus-many-times-2.html#20033" class="Bound"
      >px</a
      ><a name="20035" class="Symbol"
      >)</a
      ><a name="20036"
      > </a
      ><a name="20037" class="Symbol"
      >=</a
      ><a name="20038"
      > </a
      ><a name="20039" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="20043"
      > </a
      ><a name="20044" href="one-lambda-calculus-many-times-2.html#20033" class="Bound"
      >px</a
      ><a name="20046"
      >
    </a
      ><a name="20051" href="one-lambda-calculus-many-times-2.html#19923" class="Function"
      >contract</a
      ><a name="20059"
      > </a
      ><a name="20060" class="Symbol"
      >(</a
      ><a name="20061" href="one-lambda-calculus-many-times-2.html#20061" class="Bound"
      >A</a
      ><a name="20062"
      > </a
      ><a name="20063" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="20064"
      > </a
      ><a name="20065" href="one-lambda-calculus-many-times-2.html#20065" class="Bound"
      >&#915;</a
      ><a name="20066" class="Symbol"
      >)</a
      ><a name="20067"
      > </a
      ><a name="20072" class="Symbol"
      >(</a
      ><a name="20073" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="20078"
      > </a
      ><a name="20079" href="one-lambda-calculus-many-times-2.html#20079" class="Bound"
      >i</a
      ><a name="20080" class="Symbol"
      >)</a
      ><a name="20081"
      >
      </a
      ><a name="20088" class="Keyword"
      >rewrite</a
      ><a name="20095"
      > </a
      ><a name="20096" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#811" class="Function"
      >++-assoc</a
      ><a name="20104"
      > </a
      ><a name="20105" href="one-lambda-calculus-many-times-2.html#20065" class="Bound"
      >&#915;</a
      ><a name="20106"
      > </a
      ><a name="20107" class="Symbol"
      >(</a
      ><a name="20108" href="one-lambda-calculus-many-times-2.html#20061" class="Bound"
      >A</a
      ><a name="20109"
      > </a
      ><a name="20110" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="20111"
      > </a
      ><a name="20112" href="one-lambda-calculus-many-times-2.html#20065" class="Bound"
      >&#915;</a
      ><a name="20113" class="Symbol"
      >)</a
      ><a name="20114"
      > </a
      ><a name="20115" href="one-lambda-calculus-many-times-2.html#20069" class="Bound"
      >&#916;</a
      ><a name="20116"
      > </a
      ><a name="20117" class="Keyword"
      >with</a
      ><a name="20121"
      > </a
      ><a name="20122" href="one-lambda-calculus-many-times-2.html#17514" class="Function"
      >forward</a
      ><a name="20129"
      > </a
      ><a name="20130" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="20132"
      > </a
      ><a name="20133" href="one-lambda-calculus-many-times-2.html#20065" class="Bound"
      >&#915;</a
      ><a name="20134"
      > </a
      ><a name="20135" href="one-lambda-calculus-many-times-2.html#20079" class="Bound"
      >i</a
      ><a name="20136"
      >
    </a
      ><a name="20141" href="one-lambda-calculus-many-times-2.html#19923" class="Function"
      >contract</a
      ><a name="20149"
      > </a
      ><a name="20150" class="Symbol"
      >(</a
      ><a name="20151" href="one-lambda-calculus-many-times-2.html#20151" class="Bound"
      >A</a
      ><a name="20152"
      > </a
      ><a name="20153" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="20154"
      > </a
      ><a name="20155" href="one-lambda-calculus-many-times-2.html#20155" class="Bound"
      >&#915;</a
      ><a name="20156" class="Symbol"
      >)</a
      ><a name="20157"
      > </a
      ><a name="20162" class="Symbol"
      >(</a
      ><a name="20163" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="20168"
      > </a
      ><a name="20169" href="one-lambda-calculus-many-times-2.html#20169" class="Bound"
      >i</a
      ><a name="20170" class="Symbol"
      >)</a
      ><a name="20171"
      > </a
      ><a name="20172" class="Symbol"
      >|</a
      ><a name="20173"
      > </a
      ><a name="20174" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="20178"
      > </a
      ><a name="20179" href="one-lambda-calculus-many-times-2.html#20179" class="Bound"
      >px</a
      ><a name="20181"
      > </a
      ><a name="20182" class="Symbol"
      >=</a
      ><a name="20183"
      > </a
      ><a name="20184" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="20188"
      > </a
      ><a name="20189" href="one-lambda-calculus-many-times-2.html#20179" class="Bound"
      >px</a
      ><a name="20191"
      >
    </a
      ><a name="20196" href="one-lambda-calculus-many-times-2.html#19923" class="Function"
      >contract</a
      ><a name="20204"
      > </a
      ><a name="20205" class="Symbol"
      >(</a
      ><a name="20206" href="one-lambda-calculus-many-times-2.html#20206" class="Bound"
      >A</a
      ><a name="20207"
      > </a
      ><a name="20208" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="20209"
      > </a
      ><a name="20210" href="one-lambda-calculus-many-times-2.html#20210" class="Bound"
      >&#915;</a
      ><a name="20211" class="Symbol"
      >)</a
      ><a name="20212"
      > </a
      ><a name="20217" class="Symbol"
      >(</a
      ><a name="20218" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="20223"
      > </a
      ><a name="20224" href="one-lambda-calculus-many-times-2.html#20224" class="Bound"
      >i</a
      ><a name="20225" class="Symbol"
      >)</a
      ><a name="20226"
      > </a
      ><a name="20227" class="Symbol"
      >|</a
      ><a name="20228"
      > </a
      ><a name="20229" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="20234"
      > </a
      ><a name="20235" href="one-lambda-calculus-many-times-2.html#20235" class="Bound"
      >j</a
      ><a name="20236"
      >
      </a
      ><a name="20243" class="Keyword"
      >rewrite</a
      ><a name="20250"
      > </a
      ><a name="20251" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#565" class="Function"
      >sym</a
      ><a name="20254"
      > </a
      ><a name="20255" class="Symbol"
      >(</a
      ><a name="20256" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#811" class="Function"
      >++-assoc</a
      ><a name="20264"
      > </a
      ><a name="20265" href="one-lambda-calculus-many-times-2.html#20210" class="Bound"
      >&#915;</a
      ><a name="20266"
      > </a
      ><a name="20267" href="one-lambda-calculus-many-times-2.html#20210" class="Bound"
      >&#915;</a
      ><a name="20268"
      > </a
      ><a name="20269" href="one-lambda-calculus-many-times-2.html#20214" class="Bound"
      >&#916;</a
      ><a name="20270" class="Symbol"
      >)</a
      ><a name="20271"
      > </a
      ><a name="20272" class="Symbol"
      >=</a
      ><a name="20273"
      > </a
      ><a name="20274" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="20279"
      > </a
      ><a name="20280" class="Symbol"
      >(</a
      ><a name="20281" href="one-lambda-calculus-many-times-2.html#19923" class="Function"
      >contract</a
      ><a name="20289"
      > </a
      ><a name="20290" href="one-lambda-calculus-many-times-2.html#20210" class="Bound"
      >&#915;</a
      ><a name="20291"
      > </a
      ><a name="20292" href="one-lambda-calculus-many-times-2.html#20235" class="Bound"
      >j</a
      ><a name="20293" class="Symbol"
      >)</a
      >
{% endraw %}</pre>

Boop.

<pre class="Agda">{% raw %}
    <a name="20331" href="one-lambda-calculus-many-times-2.html#20331" class="Function"
      >w&#8314;&#8242;</a
      ><a name="20334"
      > </a
      ><a name="20335" class="Symbol"
      >:</a
      ><a name="20336"
      > </a
      ><a name="20337" class="Symbol"
      >&#8704;</a
      ><a name="20338"
      > </a
      ><a name="20343" class="Symbol"
      >&#8594;</a
      ><a name="20344"
      > </a
      ><a name="20345" class="Symbol"
      >&#8704;</a
      ><a name="20346"
      > </a
      ><a name="20347" href="one-lambda-calculus-many-times-2.html#20347" class="Bound"
      >&#915;</a
      ><a name="20348"
      > </a
      ><a name="20349" class="Symbol"
      >&#8594;</a
      ><a name="20350"
      > </a
      ><a name="20351" class="Symbol"
      >&#8704;</a
      ><a name="20352"
      > </a
      ><a name="20357" class="Symbol"
      >&#8594;</a
      ><a name="20358"
      > </a
      ><a name="20359" href="2016-03-20-one-lambda-calculus-many-times.html#5371" class="Datatype Operator"
      >ND</a
      ><a name="20361"
      > </a
      ><a name="20362" href="one-lambda-calculus-many-times-2.html#20354" class="Bound"
      >&#916;</a
      ><a name="20363"
      > </a
      ><a name="20364" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="20365"
      > </a
      ><a name="20366" href="one-lambda-calculus-many-times-2.html#20340" class="Bound"
      >A</a
      ><a name="20367"
      > </a
      ><a name="20368" class="Symbol"
      >&#8594;</a
      ><a name="20369"
      > </a
      ><a name="20370" href="2016-03-20-one-lambda-calculus-many-times.html#5371" class="Datatype Operator"
      >ND</a
      ><a name="20372"
      > </a
      ><a name="20373" href="one-lambda-calculus-many-times-2.html#20347" class="Bound"
      >&#915;</a
      ><a name="20374"
      > </a
      ><a name="20375" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20377"
      > </a
      ><a name="20378" href="one-lambda-calculus-many-times-2.html#20354" class="Bound"
      >&#916;</a
      ><a name="20379"
      > </a
      ><a name="20380" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="20381"
      > </a
      ><a name="20382" href="one-lambda-calculus-many-times-2.html#20340" class="Bound"
      >A</a
      ><a name="20383"
      >
    </a
      ><a name="20388" href="one-lambda-calculus-many-times-2.html#20331" class="Function"
      >w&#8314;&#8242;</a
      ><a name="20391"
      > </a
      ><a name="20392" href="one-lambda-calculus-many-times-2.html#20392" class="Bound"
      >&#915;</a
      ><a name="20393"
      > </a
      ><a name="20394" class="Symbol"
      >=</a
      ><a name="20395"
      > </a
      ><a name="20396" href="2016-03-20-one-lambda-calculus-many-times.html#7305" class="Function"
      >struct</a
      ><a name="20402"
      > </a
      ><a name="20403" class="Symbol"
      >(</a
      ><a name="20404" href="one-lambda-calculus-many-times-2.html#16366" class="Function"
      >weaken</a
      ><a name="20410"
      > </a
      ><a name="20411" href="one-lambda-calculus-many-times-2.html#20392" class="Bound"
      >&#915;</a
      ><a name="20412" class="Symbol"
      >)</a
      ><a name="20413"
      >

    </a
      ><a name="20419" href="one-lambda-calculus-many-times-2.html#20419" class="Function"
      >c&#8314;&#8242;</a
      ><a name="20422"
      > </a
      ><a name="20423" class="Symbol"
      >:</a
      ><a name="20424"
      > </a
      ><a name="20425" class="Symbol"
      >&#8704;</a
      ><a name="20426"
      > </a
      ><a name="20431" class="Symbol"
      >&#8594;</a
      ><a name="20432"
      > </a
      ><a name="20433" class="Symbol"
      >&#8704;</a
      ><a name="20434"
      > </a
      ><a name="20435" href="one-lambda-calculus-many-times-2.html#20435" class="Bound"
      >&#915;</a
      ><a name="20436"
      > </a
      ><a name="20437" class="Symbol"
      >&#8594;</a
      ><a name="20438"
      > </a
      ><a name="20439" class="Symbol"
      >&#8704;</a
      ><a name="20440"
      > </a
      ><a name="20445" class="Symbol"
      >&#8594;</a
      ><a name="20446"
      > </a
      ><a name="20447" href="2016-03-20-one-lambda-calculus-many-times.html#5371" class="Datatype Operator"
      >ND</a
      ><a name="20449"
      > </a
      ><a name="20450" class="Symbol"
      >(</a
      ><a name="20451" href="one-lambda-calculus-many-times-2.html#20435" class="Bound"
      >&#915;</a
      ><a name="20452"
      > </a
      ><a name="20453" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20455"
      > </a
      ><a name="20456" href="one-lambda-calculus-many-times-2.html#20435" class="Bound"
      >&#915;</a
      ><a name="20457" class="Symbol"
      >)</a
      ><a name="20458"
      > </a
      ><a name="20459" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20461"
      > </a
      ><a name="20462" href="one-lambda-calculus-many-times-2.html#20442" class="Bound"
      >&#916;</a
      ><a name="20463"
      > </a
      ><a name="20464" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="20465"
      > </a
      ><a name="20466" href="one-lambda-calculus-many-times-2.html#20428" class="Bound"
      >A</a
      ><a name="20467"
      > </a
      ><a name="20468" class="Symbol"
      >&#8594;</a
      ><a name="20469"
      > </a
      ><a name="20470" href="2016-03-20-one-lambda-calculus-many-times.html#5371" class="Datatype Operator"
      >ND</a
      ><a name="20472"
      > </a
      ><a name="20473" href="one-lambda-calculus-many-times-2.html#20435" class="Bound"
      >&#915;</a
      ><a name="20474"
      > </a
      ><a name="20475" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20477"
      > </a
      ><a name="20478" href="one-lambda-calculus-many-times-2.html#20442" class="Bound"
      >&#916;</a
      ><a name="20479"
      > </a
      ><a name="20480" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="20481"
      > </a
      ><a name="20482" href="one-lambda-calculus-many-times-2.html#20428" class="Bound"
      >A</a
      ><a name="20483"
      >
    </a
      ><a name="20488" href="one-lambda-calculus-many-times-2.html#20419" class="Function"
      >c&#8314;&#8242;</a
      ><a name="20491"
      > </a
      ><a name="20492" href="one-lambda-calculus-many-times-2.html#20492" class="Bound"
      >&#915;</a
      ><a name="20493"
      > </a
      ><a name="20494" class="Symbol"
      >=</a
      ><a name="20495"
      > </a
      ><a name="20496" href="2016-03-20-one-lambda-calculus-many-times.html#7305" class="Function"
      >struct</a
      ><a name="20502"
      > </a
      ><a name="20503" class="Symbol"
      >(</a
      ><a name="20504" href="one-lambda-calculus-many-times-2.html#19923" class="Function"
      >contract</a
      ><a name="20512"
      > </a
      ><a name="20513" href="one-lambda-calculus-many-times-2.html#20492" class="Bound"
      >&#915;</a
      ><a name="20514" class="Symbol"
      >)</a
      ><a name="20515"
      >

    </a
      ><a name="20521" href="one-lambda-calculus-many-times-2.html#20521" class="Function"
      >p&#8314;&#8242;</a
      ><a name="20524"
      > </a
      ><a name="20525" class="Symbol"
      >:</a
      ><a name="20526"
      > </a
      ><a name="20527" class="Symbol"
      >&#8704;</a
      ><a name="20528"
      > </a
      ><a name="20533" class="Symbol"
      >&#8594;</a
      ><a name="20534"
      > </a
      ><a name="20535" class="Symbol"
      >&#8704;</a
      ><a name="20536"
      > </a
      ><a name="20537" href="one-lambda-calculus-many-times-2.html#20537" class="Bound"
      >&#915;</a
      ><a name="20538"
      > </a
      ><a name="20539" href="one-lambda-calculus-many-times-2.html#20539" class="Bound"
      >&#931;</a
      ><a name="20540"
      > </a
      ><a name="20541" href="one-lambda-calculus-many-times-2.html#20541" class="Bound"
      >&#928;</a
      ><a name="20542"
      > </a
      ><a name="20543" class="Symbol"
      >&#8594;</a
      ><a name="20544"
      > </a
      ><a name="20545" class="Symbol"
      >&#8704;</a
      ><a name="20546"
      > </a
      ><a name="20551" class="Symbol"
      >&#8594;</a
      ><a name="20552"
      > </a
      ><a name="20553" href="2016-03-20-one-lambda-calculus-many-times.html#5371" class="Datatype Operator"
      >ND</a
      ><a name="20555"
      > </a
      ><a name="20556" class="Symbol"
      >(</a
      ><a name="20557" href="one-lambda-calculus-many-times-2.html#20537" class="Bound"
      >&#915;</a
      ><a name="20558"
      > </a
      ><a name="20559" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20561"
      > </a
      ><a name="20562" href="one-lambda-calculus-many-times-2.html#20539" class="Bound"
      >&#931;</a
      ><a name="20563" class="Symbol"
      >)</a
      ><a name="20564"
      > </a
      ><a name="20565" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20567"
      > </a
      ><a name="20568" class="Symbol"
      >(</a
      ><a name="20569" href="one-lambda-calculus-many-times-2.html#20541" class="Bound"
      >&#928;</a
      ><a name="20570"
      > </a
      ><a name="20571" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20573"
      > </a
      ><a name="20574" href="one-lambda-calculus-many-times-2.html#20548" class="Bound"
      >&#916;</a
      ><a name="20575" class="Symbol"
      >)</a
      ><a name="20576"
      > </a
      ><a name="20577" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="20578"
      > </a
      ><a name="20579" href="one-lambda-calculus-many-times-2.html#20530" class="Bound"
      >A</a
      ><a name="20580"
      >
                 </a
      ><a name="20598" class="Symbol"
      >&#8594;</a
      ><a name="20599"
      > </a
      ><a name="20600" href="2016-03-20-one-lambda-calculus-many-times.html#5371" class="Datatype Operator"
      >ND</a
      ><a name="20602"
      > </a
      ><a name="20603" class="Symbol"
      >(</a
      ><a name="20604" href="one-lambda-calculus-many-times-2.html#20537" class="Bound"
      >&#915;</a
      ><a name="20605"
      > </a
      ><a name="20606" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20608"
      > </a
      ><a name="20609" href="one-lambda-calculus-many-times-2.html#20541" class="Bound"
      >&#928;</a
      ><a name="20610" class="Symbol"
      >)</a
      ><a name="20611"
      > </a
      ><a name="20612" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20614"
      > </a
      ><a name="20615" class="Symbol"
      >(</a
      ><a name="20616" href="one-lambda-calculus-many-times-2.html#20539" class="Bound"
      >&#931;</a
      ><a name="20617"
      > </a
      ><a name="20618" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20620"
      > </a
      ><a name="20621" href="one-lambda-calculus-many-times-2.html#20548" class="Bound"
      >&#916;</a
      ><a name="20622" class="Symbol"
      >)</a
      ><a name="20623"
      > </a
      ><a name="20624" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="20625"
      > </a
      ><a name="20626" href="one-lambda-calculus-many-times-2.html#20530" class="Bound"
      >A</a
      ><a name="20627"
      >
    </a
      ><a name="20632" href="one-lambda-calculus-many-times-2.html#20521" class="Function"
      >p&#8314;&#8242;</a
      ><a name="20635"
      > </a
      ><a name="20636" href="one-lambda-calculus-many-times-2.html#20636" class="Bound"
      >&#915;</a
      ><a name="20637"
      > </a
      ><a name="20638" href="one-lambda-calculus-many-times-2.html#20638" class="Bound"
      >&#931;</a
      ><a name="20639"
      > </a
      ><a name="20640" href="one-lambda-calculus-many-times-2.html#20640" class="Bound"
      >&#928;</a
      ><a name="20641"
      > </a
      ><a name="20642" class="Symbol"
      >=</a
      ><a name="20643"
      > </a
      ><a name="20644" href="2016-03-20-one-lambda-calculus-many-times.html#7305" class="Function"
      >struct</a
      ><a name="20650"
      > </a
      ><a name="20651" class="Symbol"
      >(</a
      ><a name="20652" href="one-lambda-calculus-many-times-2.html#19107" class="Function"
      >permute</a
      ><a name="20659"
      > </a
      ><a name="20660" href="one-lambda-calculus-many-times-2.html#20636" class="Bound"
      >&#915;</a
      ><a name="20661"
      > </a
      ><a name="20662" href="one-lambda-calculus-many-times-2.html#20638" class="Bound"
      >&#931;</a
      ><a name="20663"
      > </a
      ><a name="20664" href="one-lambda-calculus-many-times-2.html#20640" class="Bound"
      >&#928;</a
      ><a name="20665" class="Symbol"
      >)</a
      >
{% endraw %}</pre>

Boop.

<div class="foldable">
<pre class="Agda">{% raw %}
    <a name="20726" href="one-lambda-calculus-many-times-2.html#20726" class="Function"
      >s&#8314;&#8242;</a
      ><a name="20729"
      > </a
      ><a name="20730" class="Symbol"
      >:</a
      ><a name="20731"
      > </a
      ><a name="20732" class="Symbol"
      >&#8704;</a
      ><a name="20733"
      > </a
      ><a name="20738" class="Symbol"
      >&#8594;</a
      ><a name="20739"
      > </a
      ><a name="20740" class="Symbol"
      >&#8704;</a
      ><a name="20741"
      > </a
      ><a name="20742" href="one-lambda-calculus-many-times-2.html#20742" class="Bound"
      >&#915;</a
      ><a name="20743"
      > </a
      ><a name="20744" href="one-lambda-calculus-many-times-2.html#20744" class="Bound"
      >&#931;</a
      ><a name="20745"
      > </a
      ><a name="20746" class="Symbol"
      >&#8594;</a
      ><a name="20747"
      > </a
      ><a name="20748" class="Symbol"
      >&#8704;</a
      ><a name="20749"
      > </a
      ><a name="20754" class="Symbol"
      >&#8594;</a
      ><a name="20755"
      > </a
      ><a name="20756" href="2016-03-20-one-lambda-calculus-many-times.html#5371" class="Datatype Operator"
      >ND</a
      ><a name="20758"
      > </a
      ><a name="20759" class="Symbol"
      >(</a
      ><a name="20760" href="one-lambda-calculus-many-times-2.html#20742" class="Bound"
      >&#915;</a
      ><a name="20761"
      > </a
      ><a name="20762" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20764"
      > </a
      ><a name="20765" href="one-lambda-calculus-many-times-2.html#20744" class="Bound"
      >&#931;</a
      ><a name="20766" class="Symbol"
      >)</a
      ><a name="20767"
      > </a
      ><a name="20768" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20770"
      > </a
      ><a name="20771" href="one-lambda-calculus-many-times-2.html#20751" class="Bound"
      >&#928;</a
      ><a name="20772"
      > </a
      ><a name="20773" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="20774"
      > </a
      ><a name="20775" href="one-lambda-calculus-many-times-2.html#20735" class="Bound"
      >A</a
      ><a name="20776"
      >
                </a
      ><a name="20793" class="Symbol"
      >&#8594;</a
      ><a name="20794"
      > </a
      ><a name="20795" href="2016-03-20-one-lambda-calculus-many-times.html#5371" class="Datatype Operator"
      >ND</a
      ><a name="20797"
      > </a
      ><a name="20798" class="Symbol"
      >(</a
      ><a name="20799" href="one-lambda-calculus-many-times-2.html#20742" class="Bound"
      >&#915;</a
      ><a name="20800"
      > </a
      ><a name="20801" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20803"
      > </a
      ><a name="20804" href="one-lambda-calculus-many-times-2.html#20751" class="Bound"
      >&#928;</a
      ><a name="20805" class="Symbol"
      >)</a
      ><a name="20806"
      > </a
      ><a name="20807" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20809"
      > </a
      ><a name="20810" href="one-lambda-calculus-many-times-2.html#20744" class="Bound"
      >&#931;</a
      ><a name="20811"
      > </a
      ><a name="20812" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="20813"
      > </a
      ><a name="20814" href="one-lambda-calculus-many-times-2.html#20735" class="Bound"
      >A</a
      ><a name="20815"
      >
    </a
      ><a name="20820" href="one-lambda-calculus-many-times-2.html#20726" class="Function"
      >s&#8314;&#8242;</a
      ><a name="20823"
      > </a
      ><a name="20828" href="one-lambda-calculus-many-times-2.html#20828" class="Bound"
      >&#915;</a
      ><a name="20829"
      > </a
      ><a name="20830" href="one-lambda-calculus-many-times-2.html#20830" class="Bound"
      >&#931;</a
      ><a name="20831"
      > </a
      ><a name="20836" href="one-lambda-calculus-many-times-2.html#20836" class="Bound"
      >f</a
      ><a name="20837"
      >
      </a
      ><a name="20844" class="Symbol"
      >=</a
      ><a name="20845"
      > </a
      ><a name="20846" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#705" class="Function"
      >subst</a
      ><a name="20851"
      > </a
      ><a name="20852" class="Symbol"
      >(&#955;</a
      ><a name="20854"
      > </a
      ><a name="20855" href="one-lambda-calculus-many-times-2.html#20855" class="Bound"
      >&#931;</a
      ><a name="20856"
      > </a
      ><a name="20857" class="Symbol"
      >&#8594;</a
      ><a name="20858"
      > </a
      ><a name="20859" href="2016-03-20-one-lambda-calculus-many-times.html#5371" class="Datatype Operator"
      >ND</a
      ><a name="20861"
      > </a
      ><a name="20862" class="Symbol"
      >(</a
      ><a name="20863" href="one-lambda-calculus-many-times-2.html#20828" class="Bound"
      >&#915;</a
      ><a name="20864"
      > </a
      ><a name="20865" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20867"
      > </a
      ><a name="20868" href="one-lambda-calculus-many-times-2.html#20833" class="Bound"
      >&#928;</a
      ><a name="20869" class="Symbol"
      >)</a
      ><a name="20870"
      > </a
      ><a name="20871" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20873"
      > </a
      ><a name="20874" href="one-lambda-calculus-many-times-2.html#20855" class="Bound"
      >&#931;</a
      ><a name="20875"
      > </a
      ><a name="20876" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="20877"
      > </a
      ><a name="20878" href="one-lambda-calculus-many-times-2.html#20825" class="Bound"
      >A</a
      ><a name="20879" class="Symbol"
      >)</a
      ><a name="20880"
      >      </a
      ><a name="20886" class="Symbol"
      >(</a
      ><a name="20887" href="one-lambda-calculus-many-times-2.html#2016" class="Function"
      >++-identity&#691;</a
      ><a name="20899"
      > </a
      ><a name="20900" href="one-lambda-calculus-many-times-2.html#20830" class="Bound"
      >&#931;</a
      ><a name="20901" class="Symbol"
      >)</a
      ><a name="20902"
      >
      </a
      ><a name="20909" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="20910"
      > </a
      ><a name="20911" href="one-lambda-calculus-many-times-2.html#20521" class="Function"
      >p&#8314;&#8242;</a
      ><a name="20914"
      > </a
      ><a name="20915" href="one-lambda-calculus-many-times-2.html#20828" class="Bound"
      >&#915;</a
      ><a name="20916"
      > </a
      ><a name="20917" href="one-lambda-calculus-many-times-2.html#20830" class="Bound"
      >&#931;</a
      ><a name="20918"
      > </a
      ><a name="20919" href="one-lambda-calculus-many-times-2.html#20833" class="Bound"
      >&#928;</a
      ><a name="20920"
      >
      </a
      ><a name="20927" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="20928"
      > </a
      ><a name="20929" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#705" class="Function"
      >subst</a
      ><a name="20934"
      > </a
      ><a name="20935" class="Symbol"
      >(&#955;</a
      ><a name="20937"
      > </a
      ><a name="20938" href="one-lambda-calculus-many-times-2.html#20938" class="Bound"
      >&#928;</a
      ><a name="20939"
      > </a
      ><a name="20940" class="Symbol"
      >&#8594;</a
      ><a name="20941"
      > </a
      ><a name="20942" href="2016-03-20-one-lambda-calculus-many-times.html#5371" class="Datatype Operator"
      >ND</a
      ><a name="20944"
      > </a
      ><a name="20945" class="Symbol"
      >(</a
      ><a name="20946" href="one-lambda-calculus-many-times-2.html#20828" class="Bound"
      >&#915;</a
      ><a name="20947"
      > </a
      ><a name="20948" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20950"
      > </a
      ><a name="20951" href="one-lambda-calculus-many-times-2.html#20830" class="Bound"
      >&#931;</a
      ><a name="20952" class="Symbol"
      >)</a
      ><a name="20953"
      > </a
      ><a name="20954" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20956"
      > </a
      ><a name="20957" href="one-lambda-calculus-many-times-2.html#20938" class="Bound"
      >&#928;</a
      ><a name="20958"
      > </a
      ><a name="20959" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="20960"
      > </a
      ><a name="20961" href="one-lambda-calculus-many-times-2.html#20825" class="Bound"
      >A</a
      ><a name="20962" class="Symbol"
      >)</a
      ><a name="20963"
      > </a
      ><a name="20964" class="Symbol"
      >(</a
      ><a name="20965" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#565" class="Function"
      >sym</a
      ><a name="20968"
      > </a
      ><a name="20969" class="Symbol"
      >(</a
      ><a name="20970" href="one-lambda-calculus-many-times-2.html#2016" class="Function"
      >++-identity&#691;</a
      ><a name="20982"
      > </a
      ><a name="20983" href="one-lambda-calculus-many-times-2.html#20833" class="Bound"
      >&#928;</a
      ><a name="20984" class="Symbol"
      >))</a
      ><a name="20986"
      >
      </a
      ><a name="20993" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="20994"
      > </a
      ><a name="20995" href="one-lambda-calculus-many-times-2.html#20836" class="Bound"
      >f</a
      >
{% endraw %}</pre>
</div>



### Deriving Structural Rules in NJ

<div class="hidden">
<pre class="Agda">{% raw %}
  <a name="21091" class="Keyword"
      >module</a
      ><a name="21097"
      > </a
      ><a name="21098" href="one-lambda-calculus-many-times-2.html#21098" class="Module"
      >NJ</a
      ><a name="21100"
      > </a
      ><a name="21101" class="Keyword"
      >where</a
      >
{% endraw %}</pre>
</div>

We can derive these same extended structural rules in NJ. For instance, below we derive the equivalent weakening rule:

<pre class="Agda">{% raw %}
    <a name="21263" href="one-lambda-calculus-many-times-2.html#21263" class="Function"
      >w&#8314;&#8242;</a
      ><a name="21266"
      > </a
      ><a name="21267" class="Symbol"
      >:</a
      ><a name="21268"
      > </a
      ><a name="21269" class="Symbol"
      >&#8704;</a
      ><a name="21270"
      > </a
      ><a name="21275" class="Symbol"
      >&#8594;</a
      ><a name="21276"
      > </a
      ><a name="21277" class="Symbol"
      >&#8704;</a
      ><a name="21278"
      > </a
      ><a name="21279" href="one-lambda-calculus-many-times-2.html#21279" class="Bound"
      >&#915;</a
      ><a name="21280"
      > </a
      ><a name="21281" class="Symbol"
      >&#8594;</a
      ><a name="21282"
      > </a
      ><a name="21283" class="Symbol"
      >&#8704;</a
      ><a name="21284"
      > </a
      ><a name="21289" class="Symbol"
      >&#8594;</a
      ><a name="21290"
      > </a
      ><a name="21291" href="one-lambda-calculus-many-times-2.html#6848" class="Datatype Operator"
      >NJ</a
      ><a name="21293"
      > </a
      ><a name="21294" href="one-lambda-calculus-many-times-2.html#21286" class="Bound"
      >&#916;</a
      ><a name="21295"
      > </a
      ><a name="21296" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="21297"
      > </a
      ><a name="21298" href="one-lambda-calculus-many-times-2.html#21272" class="Bound"
      >A</a
      ><a name="21299"
      > </a
      ><a name="21300" class="Symbol"
      >&#8594;</a
      ><a name="21301"
      > </a
      ><a name="21302" href="one-lambda-calculus-many-times-2.html#6848" class="Datatype Operator"
      >NJ</a
      ><a name="21304"
      > </a
      ><a name="21305" href="one-lambda-calculus-many-times-2.html#21279" class="Bound"
      >&#915;</a
      ><a name="21306"
      > </a
      ><a name="21307" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="21309"
      > </a
      ><a name="21310" href="one-lambda-calculus-many-times-2.html#21286" class="Bound"
      >&#916;</a
      ><a name="21311"
      > </a
      ><a name="21312" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="21313"
      > </a
      ><a name="21314" href="one-lambda-calculus-many-times-2.html#21272" class="Bound"
      >A</a
      ><a name="21315"
      >
    </a
      ><a name="21320" href="one-lambda-calculus-many-times-2.html#21263" class="Function"
      >w&#8314;&#8242;</a
      ><a name="21323"
      > </a
      ><a name="21324" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="21326"
      >      </a
      ><a name="21332" href="one-lambda-calculus-many-times-2.html#21332" class="Bound"
      >f</a
      ><a name="21333"
      > </a
      ><a name="21334" class="Symbol"
      >=</a
      ><a name="21335"
      > </a
      ><a name="21336" href="one-lambda-calculus-many-times-2.html#21332" class="Bound"
      >f</a
      ><a name="21337"
      >
    </a
      ><a name="21342" href="one-lambda-calculus-many-times-2.html#21263" class="Function"
      >w&#8314;&#8242;</a
      ><a name="21345"
      > </a
      ><a name="21346" class="Symbol"
      >(</a
      ><a name="21347" href="one-lambda-calculus-many-times-2.html#21347" class="Bound"
      >B</a
      ><a name="21348"
      > </a
      ><a name="21349" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="21350"
      > </a
      ><a name="21351" href="one-lambda-calculus-many-times-2.html#21351" class="Bound"
      >&#915;</a
      ><a name="21352" class="Symbol"
      >)</a
      ><a name="21353"
      > </a
      ><a name="21354" href="one-lambda-calculus-many-times-2.html#21354" class="Bound"
      >f</a
      ><a name="21355"
      > </a
      ><a name="21356" class="Symbol"
      >=</a
      ><a name="21357"
      > </a
      ><a name="21358" href="one-lambda-calculus-many-times-2.html#7035" class="InductiveConstructor"
      >w</a
      ><a name="21359"
      > </a
      ><a name="21360" class="Symbol"
      >(</a
      ><a name="21361" href="one-lambda-calculus-many-times-2.html#21263" class="Function"
      >w&#8314;&#8242;</a
      ><a name="21364"
      > </a
      ><a name="21365" href="one-lambda-calculus-many-times-2.html#21351" class="Bound"
      >&#915;</a
      ><a name="21366"
      > </a
      ><a name="21367" href="one-lambda-calculus-many-times-2.html#21354" class="Bound"
      >f</a
      ><a name="21368" class="Symbol"
      >)</a
      >
{% endraw %}</pre>

The remainder of the proofs are rather similar to those for ND,

<div class="foldable">
<pre class="Agda">{% raw %}
    <a name="21487" href="one-lambda-calculus-many-times-2.html#21487" class="Function"
      >f&#8314;&#8242;</a
      ><a name="21490"
      > </a
      ><a name="21491" class="Symbol"
      >:</a
      ><a name="21492"
      > </a
      ><a name="21493" class="Symbol"
      >&#8704;</a
      ><a name="21494"
      > </a
      ><a name="21501" class="Symbol"
      >&#8594;</a
      ><a name="21502"
      > </a
      ><a name="21503" class="Symbol"
      >&#8704;</a
      ><a name="21504"
      > </a
      ><a name="21505" href="one-lambda-calculus-many-times-2.html#21505" class="Bound"
      >&#915;</a
      ><a name="21506"
      > </a
      ><a name="21507" href="one-lambda-calculus-many-times-2.html#21507" class="Bound"
      >&#931;</a
      ><a name="21508"
      > </a
      ><a name="21509" class="Symbol"
      >&#8594;</a
      ><a name="21510"
      > </a
      ><a name="21511" class="Symbol"
      >&#8704;</a
      ><a name="21512"
      > </a
      ><a name="21517" class="Symbol"
      >&#8594;</a
      ><a name="21518"
      > </a
      ><a name="21519" href="one-lambda-calculus-many-times-2.html#6848" class="Datatype Operator"
      >NJ</a
      ><a name="21521"
      > </a
      ><a name="21522" class="Symbol"
      >(</a
      ><a name="21523" href="one-lambda-calculus-many-times-2.html#21505" class="Bound"
      >&#915;</a
      ><a name="21524"
      > </a
      ><a name="21525" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="21527"
      > </a
      ><a name="21528" href="one-lambda-calculus-many-times-2.html#21507" class="Bound"
      >&#931;</a
      ><a name="21529" class="Symbol"
      >)</a
      ><a name="21530"
      > </a
      ><a name="21531" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="21533"
      > </a
      ><a name="21534" class="Symbol"
      >(</a
      ><a name="21535" href="one-lambda-calculus-many-times-2.html#21496" class="Bound"
      >A</a
      ><a name="21536"
      > </a
      ><a name="21537" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="21538"
      > </a
      ><a name="21539" href="one-lambda-calculus-many-times-2.html#21514" class="Bound"
      >&#916;</a
      ><a name="21540" class="Symbol"
      >)</a
      ><a name="21541"
      > </a
      ><a name="21542" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="21543"
      > </a
      ><a name="21544" href="one-lambda-calculus-many-times-2.html#21498" class="Bound"
      >B</a
      ><a name="21545"
      >
                </a
      ><a name="21562" class="Symbol"
      >&#8594;</a
      ><a name="21563"
      > </a
      ><a name="21564" href="one-lambda-calculus-many-times-2.html#6848" class="Datatype Operator"
      >NJ</a
      ><a name="21566"
      > </a
      ><a name="21567" class="Symbol"
      >(</a
      ><a name="21568" href="one-lambda-calculus-many-times-2.html#21505" class="Bound"
      >&#915;</a
      ><a name="21569"
      > </a
      ><a name="21570" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="21572"
      > </a
      ><a name="21573" href="one-lambda-calculus-many-times-2.html#21496" class="Bound"
      >A</a
      ><a name="21574"
      > </a
      ><a name="21575" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="21576"
      > </a
      ><a name="21577" href="one-lambda-calculus-many-times-2.html#21507" class="Bound"
      >&#931;</a
      ><a name="21578" class="Symbol"
      >)</a
      ><a name="21579"
      > </a
      ><a name="21580" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="21582"
      > </a
      ><a name="21583" href="one-lambda-calculus-many-times-2.html#21514" class="Bound"
      >&#916;</a
      ><a name="21584"
      > </a
      ><a name="21585" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="21586"
      > </a
      ><a name="21587" href="one-lambda-calculus-many-times-2.html#21498" class="Bound"
      >B</a
      ><a name="21588"
      >
    </a
      ><a name="21593" href="one-lambda-calculus-many-times-2.html#21487" class="Function"
      >f&#8314;&#8242;</a
      ><a name="21596"
      > </a
      ><a name="21605" href="one-lambda-calculus-many-times-2.html#21605" class="Bound"
      >&#915;</a
      ><a name="21606"
      > </a
      ><a name="21607" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="21609"
      > </a
      ><a name="21614" href="one-lambda-calculus-many-times-2.html#21614" class="Bound"
      >f</a
      ><a name="21615"
      >
           </a
      ><a name="21627" class="Comment"
      >-- NJ (&#915; ++ A &#8759; []) ++ &#916; &#8866; .B</a
      ><a name="21656"
      >
      </a
      ><a name="21663" class="Keyword"
      >rewrite</a
      ><a name="21670"
      > </a
      ><a name="21671" href="one-lambda-calculus-many-times-2.html#2016" class="Function"
      >++-identity&#691;</a
      ><a name="21683"
      > </a
      ><a name="21684" href="one-lambda-calculus-many-times-2.html#21605" class="Bound"
      >&#915;</a
      ><a name="21685"
      >
           </a
      ><a name="21697" class="Comment"
      >-- NJ (&#915; ++ A &#8759; []) ++ &#916; &#8866; B</a
      ><a name="21725"
      >
            </a
      ><a name="21738" class="Symbol"
      >|</a
      ><a name="21739"
      > </a
      ><a name="21740" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#811" class="Function"
      >++-assoc</a
      ><a name="21748"
      > </a
      ><a name="21749" href="one-lambda-calculus-many-times-2.html#21605" class="Bound"
      >&#915;</a
      ><a name="21750"
      > </a
      ><a name="21751" class="Symbol"
      >(</a
      ><a name="21752" href="one-lambda-calculus-many-times-2.html#21598" class="Bound"
      >A</a
      ><a name="21753"
      > </a
      ><a name="21754" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="21755"
      > </a
      ><a name="21756" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="21758" class="Symbol"
      >)</a
      ><a name="21759"
      > </a
      ><a name="21760" href="one-lambda-calculus-many-times-2.html#21611" class="Bound"
      >&#916;</a
      ><a name="21761"
      >
           </a
      ><a name="21773" class="Comment"
      >-- NJ &#915; ++ A &#8759; &#916; &#8866; B</a
      ><a name="21793"
      >
            </a
      ><a name="21806" class="Symbol"
      >=</a
      ><a name="21807"
      > </a
      ><a name="21808" href="one-lambda-calculus-many-times-2.html#21614" class="Bound"
      >f</a
      ><a name="21809"
      >

    </a
      ><a name="21815" href="one-lambda-calculus-many-times-2.html#21487" class="Function"
      >f&#8314;&#8242;</a
      ><a name="21818"
      > </a
      ><a name="21827" href="one-lambda-calculus-many-times-2.html#21827" class="Bound"
      >&#915;</a
      ><a name="21828"
      > </a
      ><a name="21829" class="Symbol"
      >(</a
      ><a name="21830" href="one-lambda-calculus-many-times-2.html#21830" class="Bound"
      >C</a
      ><a name="21831"
      > </a
      ><a name="21832" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="21833"
      > </a
      ><a name="21834" href="one-lambda-calculus-many-times-2.html#21834" class="Bound"
      >&#931;</a
      ><a name="21835" class="Symbol"
      >)</a
      ><a name="21836"
      > </a
      ><a name="21841" href="one-lambda-calculus-many-times-2.html#21841" class="Bound"
      >f</a
      ><a name="21842"
      >
      </a
      ><a name="21849" class="Keyword"
      >rewrite</a
      ><a name="21856"
      > </a
      ><a name="21857" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#811" class="Function"
      >++-assoc</a
      ><a name="21865"
      > </a
      ><a name="21866" href="one-lambda-calculus-many-times-2.html#21827" class="Bound"
      >&#915;</a
      ><a name="21867"
      > </a
      ><a name="21868" class="Symbol"
      >(</a
      ><a name="21869" href="one-lambda-calculus-many-times-2.html#21820" class="Bound"
      >A</a
      ><a name="21870"
      > </a
      ><a name="21871" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="21872"
      > </a
      ><a name="21873" href="one-lambda-calculus-many-times-2.html#21830" class="Bound"
      >C</a
      ><a name="21874"
      > </a
      ><a name="21875" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="21876"
      > </a
      ><a name="21877" href="one-lambda-calculus-many-times-2.html#21834" class="Bound"
      >&#931;</a
      ><a name="21878" class="Symbol"
      >)</a
      ><a name="21879"
      > </a
      ><a name="21880" href="one-lambda-calculus-many-times-2.html#21838" class="Bound"
      >&#916;</a
      ><a name="21881"
      >
           </a
      ><a name="21893" class="Comment"
      >-- NJ &#915; ++ A &#8759; C &#8759; &#931; ++ &#916; &#8866; B</a
      ><a name="21922"
      >
            </a
      ><a name="21935" class="Symbol"
      >=</a
      ><a name="21936"
      > </a
      ><a name="21937" href="one-lambda-calculus-many-times-2.html#7141" class="InductiveConstructor"
      >p</a
      ><a name="21938"
      > </a
      ><a name="21939" href="one-lambda-calculus-many-times-2.html#21827" class="Bound"
      >&#915;</a
      ><a name="21940"
      > </a
      ><a name="21941" href="one-lambda-calculus-many-times-2.html#21967" class="Function"
      >g</a
      ><a name="21942"
      >
        </a
      ><a name="21951" class="Keyword"
      >where</a
      ><a name="21956"
      >
          </a
      ><a name="21967" href="one-lambda-calculus-many-times-2.html#21967" class="Function"
      >g</a
      ><a name="21968"
      > </a
      ><a name="21969" class="Symbol"
      >:</a
      ><a name="21970"
      > </a
      ><a name="21971" href="one-lambda-calculus-many-times-2.html#6848" class="Datatype Operator"
      >NJ</a
      ><a name="21973"
      > </a
      ><a name="21974" href="one-lambda-calculus-many-times-2.html#21827" class="Bound"
      >&#915;</a
      ><a name="21975"
      > </a
      ><a name="21976" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="21978"
      > </a
      ><a name="21979" href="one-lambda-calculus-many-times-2.html#21830" class="Bound"
      >C</a
      ><a name="21980"
      > </a
      ><a name="21981" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="21982"
      > </a
      ><a name="21983" href="one-lambda-calculus-many-times-2.html#21820" class="Bound"
      >A</a
      ><a name="21984"
      > </a
      ><a name="21985" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="21986"
      > </a
      ><a name="21987" href="one-lambda-calculus-many-times-2.html#21834" class="Bound"
      >&#931;</a
      ><a name="21988"
      > </a
      ><a name="21989" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="21991"
      > </a
      ><a name="21992" href="one-lambda-calculus-many-times-2.html#21838" class="Bound"
      >&#916;</a
      ><a name="21993"
      > </a
      ><a name="21994" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="21995"
      > </a
      ><a name="21996" href="one-lambda-calculus-many-times-2.html#21824" class="Bound"
      >B</a
      ><a name="21997"
      >
          </a
      ><a name="22008" href="one-lambda-calculus-many-times-2.html#21967" class="Function"
      >g</a
      ><a name="22009"
      > </a
      ><a name="22010" class="Keyword"
      >rewrite</a
      ><a name="22017"
      > </a
      ><a name="22018" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#565" class="Function"
      >sym</a
      ><a name="22021"
      > </a
      ><a name="22022" class="Symbol"
      >(</a
      ><a name="22023" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#811" class="Function"
      >++-assoc</a
      ><a name="22031"
      > </a
      ><a name="22032" href="one-lambda-calculus-many-times-2.html#21827" class="Bound"
      >&#915;</a
      ><a name="22033"
      > </a
      ><a name="22034" class="Symbol"
      >(</a
      ><a name="22035" href="one-lambda-calculus-many-times-2.html#21830" class="Bound"
      >C</a
      ><a name="22036"
      > </a
      ><a name="22037" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22038"
      > </a
      ><a name="22039" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="22041" class="Symbol"
      >)</a
      ><a name="22042"
      > </a
      ><a name="22043" class="Symbol"
      >(</a
      ><a name="22044" href="one-lambda-calculus-many-times-2.html#21820" class="Bound"
      >A</a
      ><a name="22045"
      > </a
      ><a name="22046" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22047"
      > </a
      ><a name="22048" href="one-lambda-calculus-many-times-2.html#21834" class="Bound"
      >&#931;</a
      ><a name="22049"
      > </a
      ><a name="22050" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22052"
      > </a
      ><a name="22053" href="one-lambda-calculus-many-times-2.html#21838" class="Bound"
      >&#916;</a
      ><a name="22054" class="Symbol"
      >))</a
      ><a name="22056"
      >
                 </a
      ><a name="22074" class="Comment"
      >-- NJ (&#915; ++ C &#8759; []) ++ A &#8759; &#931; ++ &#916; &#8866; B</a
      ><a name="22111"
      >
                  </a
      ><a name="22130" class="Symbol"
      >|</a
      ><a name="22131"
      > </a
      ><a name="22132" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#565" class="Function"
      >sym</a
      ><a name="22135"
      > </a
      ><a name="22136" class="Symbol"
      >(</a
      ><a name="22137" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#811" class="Function"
      >++-assoc</a
      ><a name="22145"
      > </a
      ><a name="22146" class="Symbol"
      >(</a
      ><a name="22147" href="one-lambda-calculus-many-times-2.html#21827" class="Bound"
      >&#915;</a
      ><a name="22148"
      > </a
      ><a name="22149" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22151"
      > </a
      ><a name="22152" href="one-lambda-calculus-many-times-2.html#21830" class="Bound"
      >C</a
      ><a name="22153"
      > </a
      ><a name="22154" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22155"
      > </a
      ><a name="22156" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="22158" class="Symbol"
      >)</a
      ><a name="22159"
      > </a
      ><a name="22160" class="Symbol"
      >(</a
      ><a name="22161" href="one-lambda-calculus-many-times-2.html#21820" class="Bound"
      >A</a
      ><a name="22162"
      > </a
      ><a name="22163" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22164"
      > </a
      ><a name="22165" href="one-lambda-calculus-many-times-2.html#21834" class="Bound"
      >&#931;</a
      ><a name="22166" class="Symbol"
      >)</a
      ><a name="22167"
      > </a
      ><a name="22168" href="one-lambda-calculus-many-times-2.html#21838" class="Bound"
      >&#916;</a
      ><a name="22169" class="Symbol"
      >)</a
      ><a name="22170"
      >
                 </a
      ><a name="22188" class="Comment"
      >-- NJ ((&#915; ++ C &#8759; []) ++ A &#8759; &#931;) ++ &#916; &#8866; B</a
      ><a name="22227"
      >
                 </a
      ><a name="22245" class="Symbol"
      >=</a
      ><a name="22246"
      > </a
      ><a name="22247" href="one-lambda-calculus-many-times-2.html#21487" class="Function"
      >f&#8314;&#8242;</a
      ><a name="22250"
      > </a
      ><a name="22251" class="Symbol"
      >(</a
      ><a name="22252" href="one-lambda-calculus-many-times-2.html#21827" class="Bound"
      >&#915;</a
      ><a name="22253"
      > </a
      ><a name="22254" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22256"
      > </a
      ><a name="22257" href="one-lambda-calculus-many-times-2.html#21830" class="Bound"
      >C</a
      ><a name="22258"
      > </a
      ><a name="22259" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22260"
      > </a
      ><a name="22261" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="22263" class="Symbol"
      >)</a
      ><a name="22264"
      > </a
      ><a name="22265" href="one-lambda-calculus-many-times-2.html#21834" class="Bound"
      >&#931;</a
      ><a name="22266"
      > </a
      ><a name="22271" href="one-lambda-calculus-many-times-2.html#22309" class="Function"
      >h</a
      ><a name="22272"
      >
              </a
      ><a name="22287" class="Keyword"
      >where</a
      ><a name="22292"
      >
                </a
      ><a name="22309" href="one-lambda-calculus-many-times-2.html#22309" class="Function"
      >h</a
      ><a name="22310"
      > </a
      ><a name="22311" class="Symbol"
      >:</a
      ><a name="22312"
      > </a
      ><a name="22313" href="one-lambda-calculus-many-times-2.html#6848" class="Datatype Operator"
      >NJ</a
      ><a name="22315"
      > </a
      ><a name="22316" class="Symbol"
      >((</a
      ><a name="22318" href="one-lambda-calculus-many-times-2.html#21827" class="Bound"
      >&#915;</a
      ><a name="22319"
      > </a
      ><a name="22320" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22322"
      > </a
      ><a name="22323" href="one-lambda-calculus-many-times-2.html#21830" class="Bound"
      >C</a
      ><a name="22324"
      > </a
      ><a name="22325" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22326"
      > </a
      ><a name="22327" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="22329" class="Symbol"
      >)</a
      ><a name="22330"
      > </a
      ><a name="22331" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22333"
      > </a
      ><a name="22334" href="one-lambda-calculus-many-times-2.html#21834" class="Bound"
      >&#931;</a
      ><a name="22335" class="Symbol"
      >)</a
      ><a name="22336"
      > </a
      ><a name="22337" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22339"
      > </a
      ><a name="22340" href="one-lambda-calculus-many-times-2.html#21820" class="Bound"
      >A</a
      ><a name="22341"
      > </a
      ><a name="22342" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22343"
      > </a
      ><a name="22344" href="one-lambda-calculus-many-times-2.html#21838" class="Bound"
      >&#916;</a
      ><a name="22345"
      > </a
      ><a name="22346" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="22347"
      > </a
      ><a name="22348" href="one-lambda-calculus-many-times-2.html#21824" class="Bound"
      >B</a
      ><a name="22349"
      >
                </a
      ><a name="22366" href="one-lambda-calculus-many-times-2.html#22309" class="Function"
      >h</a
      ><a name="22367"
      > </a
      ><a name="22368" class="Keyword"
      >rewrite</a
      ><a name="22375"
      > </a
      ><a name="22376" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#811" class="Function"
      >++-assoc</a
      ><a name="22384"
      > </a
      ><a name="22385" href="one-lambda-calculus-many-times-2.html#21827" class="Bound"
      >&#915;</a
      ><a name="22386"
      > </a
      ><a name="22387" class="Symbol"
      >(</a
      ><a name="22388" href="one-lambda-calculus-many-times-2.html#21830" class="Bound"
      >C</a
      ><a name="22389"
      > </a
      ><a name="22390" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22391"
      > </a
      ><a name="22392" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="22394" class="Symbol"
      >)</a
      ><a name="22395"
      > </a
      ><a name="22396" href="one-lambda-calculus-many-times-2.html#21834" class="Bound"
      >&#931;</a
      ><a name="22397"
      > </a
      ><a name="22398" class="Symbol"
      >=</a
      ><a name="22399"
      > </a
      ><a name="22400" href="one-lambda-calculus-many-times-2.html#21841" class="Bound"
      >f</a
      >
{% endraw %}</pre>
</div>
<div class="foldable">
<pre class="Agda">{% raw %}
    <a name="22460" href="one-lambda-calculus-many-times-2.html#22460" class="Function"
      >p&#8314;&#8242;</a
      ><a name="22463"
      > </a
      ><a name="22464" class="Symbol"
      >:</a
      ><a name="22465"
      > </a
      ><a name="22466" class="Symbol"
      >&#8704;</a
      ><a name="22467"
      > </a
      ><a name="22472" class="Symbol"
      >&#8594;</a
      ><a name="22473"
      > </a
      ><a name="22474" class="Symbol"
      >&#8704;</a
      ><a name="22475"
      > </a
      ><a name="22476" href="one-lambda-calculus-many-times-2.html#22476" class="Bound"
      >&#915;</a
      ><a name="22477"
      > </a
      ><a name="22478" href="one-lambda-calculus-many-times-2.html#22478" class="Bound"
      >&#931;</a
      ><a name="22479"
      > </a
      ><a name="22480" href="one-lambda-calculus-many-times-2.html#22480" class="Bound"
      >&#928;</a
      ><a name="22481"
      > </a
      ><a name="22482" class="Symbol"
      >&#8594;</a
      ><a name="22483"
      > </a
      ><a name="22484" class="Symbol"
      >&#8704;</a
      ><a name="22485"
      > </a
      ><a name="22490" class="Symbol"
      >&#8594;</a
      ><a name="22491"
      > </a
      ><a name="22492" href="one-lambda-calculus-many-times-2.html#6848" class="Datatype Operator"
      >NJ</a
      ><a name="22494"
      > </a
      ><a name="22495" class="Symbol"
      >(</a
      ><a name="22496" href="one-lambda-calculus-many-times-2.html#22476" class="Bound"
      >&#915;</a
      ><a name="22497"
      > </a
      ><a name="22498" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22500"
      > </a
      ><a name="22501" href="one-lambda-calculus-many-times-2.html#22478" class="Bound"
      >&#931;</a
      ><a name="22502" class="Symbol"
      >)</a
      ><a name="22503"
      > </a
      ><a name="22504" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22506"
      > </a
      ><a name="22507" class="Symbol"
      >(</a
      ><a name="22508" href="one-lambda-calculus-many-times-2.html#22480" class="Bound"
      >&#928;</a
      ><a name="22509"
      > </a
      ><a name="22510" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22512"
      > </a
      ><a name="22513" href="one-lambda-calculus-many-times-2.html#22487" class="Bound"
      >&#916;</a
      ><a name="22514" class="Symbol"
      >)</a
      ><a name="22515"
      > </a
      ><a name="22516" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="22517"
      > </a
      ><a name="22518" href="one-lambda-calculus-many-times-2.html#22469" class="Bound"
      >A</a
      ><a name="22519"
      >
                  </a
      ><a name="22538" class="Symbol"
      >&#8594;</a
      ><a name="22539"
      > </a
      ><a name="22540" href="one-lambda-calculus-many-times-2.html#6848" class="Datatype Operator"
      >NJ</a
      ><a name="22542"
      > </a
      ><a name="22543" class="Symbol"
      >(</a
      ><a name="22544" href="one-lambda-calculus-many-times-2.html#22476" class="Bound"
      >&#915;</a
      ><a name="22545"
      > </a
      ><a name="22546" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22548"
      > </a
      ><a name="22549" href="one-lambda-calculus-many-times-2.html#22480" class="Bound"
      >&#928;</a
      ><a name="22550" class="Symbol"
      >)</a
      ><a name="22551"
      > </a
      ><a name="22552" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22554"
      > </a
      ><a name="22555" class="Symbol"
      >(</a
      ><a name="22556" href="one-lambda-calculus-many-times-2.html#22478" class="Bound"
      >&#931;</a
      ><a name="22557"
      > </a
      ><a name="22558" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22560"
      > </a
      ><a name="22561" href="one-lambda-calculus-many-times-2.html#22487" class="Bound"
      >&#916;</a
      ><a name="22562" class="Symbol"
      >)</a
      ><a name="22563"
      > </a
      ><a name="22564" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="22565"
      > </a
      ><a name="22566" href="one-lambda-calculus-many-times-2.html#22469" class="Bound"
      >A</a
      ><a name="22567"
      >
    </a
      ><a name="22572" href="one-lambda-calculus-many-times-2.html#22460" class="Function"
      >p&#8314;&#8242;</a
      ><a name="22575"
      > </a
      ><a name="22580" href="one-lambda-calculus-many-times-2.html#22580" class="Bound"
      >&#915;</a
      ><a name="22581"
      > </a
      ><a name="22582" href="one-lambda-calculus-many-times-2.html#22582" class="Bound"
      >&#931;</a
      ><a name="22583"
      > </a
      ><a name="22584" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="22586"
      > </a
      ><a name="22591" href="one-lambda-calculus-many-times-2.html#22591" class="Bound"
      >f</a
      ><a name="22592"
      >
           </a
      ><a name="22604" class="Comment"
      >-- NJ (&#915; ++ []) ++ &#931; ++ &#916; &#8866; A</a
      ><a name="22633"
      >
      </a
      ><a name="22640" class="Keyword"
      >rewrite</a
      ><a name="22647"
      > </a
      ><a name="22648" href="one-lambda-calculus-many-times-2.html#2016" class="Function"
      >++-identity&#691;</a
      ><a name="22660"
      > </a
      ><a name="22661" href="one-lambda-calculus-many-times-2.html#22580" class="Bound"
      >&#915;</a
      ><a name="22662"
      >
           </a
      ><a name="22674" class="Comment"
      >-- NJ &#915; ++ &#931; ++ &#916; &#8866; A</a
      ><a name="22695"
      >
            </a
      ><a name="22708" class="Symbol"
      >|</a
      ><a name="22709"
      > </a
      ><a name="22710" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#565" class="Function"
      >sym</a
      ><a name="22713"
      > </a
      ><a name="22714" class="Symbol"
      >(</a
      ><a name="22715" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#811" class="Function"
      >++-assoc</a
      ><a name="22723"
      > </a
      ><a name="22724" href="one-lambda-calculus-many-times-2.html#22580" class="Bound"
      >&#915;</a
      ><a name="22725"
      > </a
      ><a name="22726" href="one-lambda-calculus-many-times-2.html#22582" class="Bound"
      >&#931;</a
      ><a name="22727"
      > </a
      ><a name="22728" href="one-lambda-calculus-many-times-2.html#22588" class="Bound"
      >&#916;</a
      ><a name="22729" class="Symbol"
      >)</a
      ><a name="22730"
      >
           </a
      ><a name="22742" class="Comment"
      >-- NJ (&#915; ++ &#931;) ++ &#916; &#8866; A</a
      ><a name="22765"
      >
            </a
      ><a name="22778" class="Symbol"
      >=</a
      ><a name="22779"
      > </a
      ><a name="22780" href="one-lambda-calculus-many-times-2.html#22591" class="Bound"
      >f</a
      ><a name="22781"
      >

    </a
      ><a name="22787" href="one-lambda-calculus-many-times-2.html#22460" class="Function"
      >p&#8314;&#8242;</a
      ><a name="22790"
      > </a
      ><a name="22795" href="one-lambda-calculus-many-times-2.html#22795" class="Bound"
      >&#915;</a
      ><a name="22796"
      > </a
      ><a name="22797" href="one-lambda-calculus-many-times-2.html#22797" class="Bound"
      >&#931;</a
      ><a name="22798"
      > </a
      ><a name="22799" class="Symbol"
      >(</a
      ><a name="22800" href="one-lambda-calculus-many-times-2.html#22800" class="Bound"
      >B</a
      ><a name="22801"
      > </a
      ><a name="22802" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22803"
      > </a
      ><a name="22804" href="one-lambda-calculus-many-times-2.html#22804" class="Bound"
      >&#928;</a
      ><a name="22805" class="Symbol"
      >)</a
      ><a name="22806"
      > </a
      ><a name="22811" href="one-lambda-calculus-many-times-2.html#22811" class="Bound"
      >f</a
      ><a name="22812"
      >
           </a
      ><a name="22824" class="Comment"
      >-- NJ (&#915; ++ B &#8759; &#928;) ++ &#931; ++ &#916; &#8866; A</a
      ><a name="22856"
      >
      </a
      ><a name="22863" class="Keyword"
      >rewrite</a
      ><a name="22870"
      > </a
      ><a name="22871" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#565" class="Function"
      >sym</a
      ><a name="22874"
      > </a
      ><a name="22875" class="Symbol"
      >(</a
      ><a name="22876" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#811" class="Function"
      >++-assoc</a
      ><a name="22884"
      > </a
      ><a name="22885" href="one-lambda-calculus-many-times-2.html#22795" class="Bound"
      >&#915;</a
      ><a name="22886"
      > </a
      ><a name="22887" class="Symbol"
      >(</a
      ><a name="22888" href="one-lambda-calculus-many-times-2.html#22800" class="Bound"
      >B</a
      ><a name="22889"
      > </a
      ><a name="22890" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22891"
      > </a
      ><a name="22892" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="22894" class="Symbol"
      >)</a
      ><a name="22895"
      > </a
      ><a name="22896" href="one-lambda-calculus-many-times-2.html#22804" class="Bound"
      >&#928;</a
      ><a name="22897" class="Symbol"
      >)</a
      ><a name="22898"
      >
           </a
      ><a name="22910" class="Comment"
      >-- NJ ((&#915; ++ B &#8759; []) ++ &#928;) ++ &#931; ++ &#916; &#8866; A</a
      ><a name="22950"
      >
            </a
      ><a name="22963" class="Symbol"
      >=</a
      ><a name="22964"
      > </a
      ><a name="22965" href="one-lambda-calculus-many-times-2.html#22460" class="Function"
      >p&#8314;&#8242;</a
      ><a name="22968"
      > </a
      ><a name="22969" class="Symbol"
      >(</a
      ><a name="22970" href="one-lambda-calculus-many-times-2.html#22795" class="Bound"
      >&#915;</a
      ><a name="22971"
      > </a
      ><a name="22972" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22974"
      > </a
      ><a name="22975" href="one-lambda-calculus-many-times-2.html#22800" class="Bound"
      >B</a
      ><a name="22976"
      > </a
      ><a name="22977" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22978"
      > </a
      ><a name="22979" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="22981" class="Symbol"
      >)</a
      ><a name="22982"
      > </a
      ><a name="22983" href="one-lambda-calculus-many-times-2.html#22797" class="Bound"
      >&#931;</a
      ><a name="22984"
      > </a
      ><a name="22985" href="one-lambda-calculus-many-times-2.html#22804" class="Bound"
      >&#928;</a
      ><a name="22986"
      > </a
      ><a name="22991" href="one-lambda-calculus-many-times-2.html#23017" class="Function"
      >g</a
      ><a name="22992"
      >
        </a
      ><a name="23001" class="Keyword"
      >where</a
      ><a name="23006"
      >
          </a
      ><a name="23017" href="one-lambda-calculus-many-times-2.html#23017" class="Function"
      >g</a
      ><a name="23018"
      > </a
      ><a name="23019" class="Symbol"
      >:</a
      ><a name="23020"
      > </a
      ><a name="23021" href="one-lambda-calculus-many-times-2.html#6848" class="Datatype Operator"
      >NJ</a
      ><a name="23023"
      > </a
      ><a name="23024" class="Symbol"
      >((</a
      ><a name="23026" href="one-lambda-calculus-many-times-2.html#22795" class="Bound"
      >&#915;</a
      ><a name="23027"
      > </a
      ><a name="23028" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23030"
      > </a
      ><a name="23031" href="one-lambda-calculus-many-times-2.html#22800" class="Bound"
      >B</a
      ><a name="23032"
      > </a
      ><a name="23033" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23034"
      > </a
      ><a name="23035" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="23037" class="Symbol"
      >)</a
      ><a name="23038"
      > </a
      ><a name="23039" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23041"
      > </a
      ><a name="23042" href="one-lambda-calculus-many-times-2.html#22797" class="Bound"
      >&#931;</a
      ><a name="23043" class="Symbol"
      >)</a
      ><a name="23044"
      > </a
      ><a name="23045" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23047"
      > </a
      ><a name="23048" href="one-lambda-calculus-many-times-2.html#22804" class="Bound"
      >&#928;</a
      ><a name="23049"
      > </a
      ><a name="23050" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23052"
      > </a
      ><a name="23053" href="one-lambda-calculus-many-times-2.html#22808" class="Bound"
      >&#916;</a
      ><a name="23054"
      > </a
      ><a name="23055" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="23056"
      > </a
      ><a name="23057" href="one-lambda-calculus-many-times-2.html#22792" class="Bound"
      >A</a
      ><a name="23058"
      >
          </a
      ><a name="23069" href="one-lambda-calculus-many-times-2.html#23017" class="Function"
      >g</a
      ><a name="23070"
      > </a
      ><a name="23071" class="Keyword"
      >rewrite</a
      ><a name="23078"
      > </a
      ><a name="23079" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#811" class="Function"
      >++-assoc</a
      ><a name="23087"
      > </a
      ><a name="23088" href="one-lambda-calculus-many-times-2.html#22795" class="Bound"
      >&#915;</a
      ><a name="23089"
      > </a
      ><a name="23090" class="Symbol"
      >(</a
      ><a name="23091" href="one-lambda-calculus-many-times-2.html#22800" class="Bound"
      >B</a
      ><a name="23092"
      > </a
      ><a name="23093" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23094"
      > </a
      ><a name="23095" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="23097" class="Symbol"
      >)</a
      ><a name="23098"
      > </a
      ><a name="23099" href="one-lambda-calculus-many-times-2.html#22797" class="Bound"
      >&#931;</a
      ><a name="23100"
      >
                 </a
      ><a name="23118" class="Comment"
      >-- NJ (&#915; ++ B &#8759; &#931;) ++ &#928; ++ &#916; &#8866; A</a
      ><a name="23150"
      >
                  </a
      ><a name="23169" class="Symbol"
      >=</a
      ><a name="23170"
      > </a
      ><a name="23171" href="one-lambda-calculus-many-times-2.html#21487" class="Function"
      >f&#8314;&#8242;</a
      ><a name="23174"
      > </a
      ><a name="23175" href="one-lambda-calculus-many-times-2.html#22795" class="Bound"
      >&#915;</a
      ><a name="23176"
      > </a
      ><a name="23177" href="one-lambda-calculus-many-times-2.html#22797" class="Bound"
      >&#931;</a
      ><a name="23178"
      > </a
      ><a name="23179" href="one-lambda-calculus-many-times-2.html#22811" class="Bound"
      >f</a
      >
{% endraw %}</pre>
</div>
<div class="foldable">
<pre class="Agda">{% raw %}
    <a name="23239" href="one-lambda-calculus-many-times-2.html#23239" class="Function"
      >c&#8314;&#8242;</a
      ><a name="23242"
      > </a
      ><a name="23243" class="Symbol"
      >:</a
      ><a name="23244"
      > </a
      ><a name="23245" class="Symbol"
      >&#8704;</a
      ><a name="23246"
      > </a
      ><a name="23251" class="Symbol"
      >&#8594;</a
      ><a name="23252"
      > </a
      ><a name="23253" class="Symbol"
      >&#8704;</a
      ><a name="23254"
      > </a
      ><a name="23255" href="one-lambda-calculus-many-times-2.html#23255" class="Bound"
      >&#915;</a
      ><a name="23256"
      > </a
      ><a name="23257" class="Symbol"
      >&#8594;</a
      ><a name="23258"
      > </a
      ><a name="23259" class="Symbol"
      >&#8704;</a
      ><a name="23260"
      > </a
      ><a name="23265" class="Symbol"
      >&#8594;</a
      ><a name="23266"
      > </a
      ><a name="23267" href="one-lambda-calculus-many-times-2.html#6848" class="Datatype Operator"
      >NJ</a
      ><a name="23269"
      > </a
      ><a name="23270" class="Symbol"
      >(</a
      ><a name="23271" href="one-lambda-calculus-many-times-2.html#23255" class="Bound"
      >&#915;</a
      ><a name="23272"
      > </a
      ><a name="23273" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23275"
      > </a
      ><a name="23276" href="one-lambda-calculus-many-times-2.html#23255" class="Bound"
      >&#915;</a
      ><a name="23277" class="Symbol"
      >)</a
      ><a name="23278"
      > </a
      ><a name="23279" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23281"
      > </a
      ><a name="23282" href="one-lambda-calculus-many-times-2.html#23262" class="Bound"
      >&#916;</a
      ><a name="23283"
      > </a
      ><a name="23284" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="23285"
      > </a
      ><a name="23286" href="one-lambda-calculus-many-times-2.html#23248" class="Bound"
      >A</a
      ><a name="23287"
      > </a
      ><a name="23288" class="Symbol"
      >&#8594;</a
      ><a name="23289"
      > </a
      ><a name="23290" href="one-lambda-calculus-many-times-2.html#6848" class="Datatype Operator"
      >NJ</a
      ><a name="23292"
      > </a
      ><a name="23293" href="one-lambda-calculus-many-times-2.html#23255" class="Bound"
      >&#915;</a
      ><a name="23294"
      > </a
      ><a name="23295" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23297"
      > </a
      ><a name="23298" href="one-lambda-calculus-many-times-2.html#23262" class="Bound"
      >&#916;</a
      ><a name="23299"
      > </a
      ><a name="23300" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="23301"
      > </a
      ><a name="23302" href="one-lambda-calculus-many-times-2.html#23248" class="Bound"
      >A</a
      ><a name="23303"
      >
    </a
      ><a name="23308" href="one-lambda-calculus-many-times-2.html#23239" class="Function"
      >c&#8314;&#8242;</a
      ><a name="23311"
      > </a
      ><a name="23316" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="23318"
      >      </a
      ><a name="23328" href="one-lambda-calculus-many-times-2.html#23328" class="Bound"
      >f</a
      ><a name="23329"
      > </a
      ><a name="23330" class="Symbol"
      >=</a
      ><a name="23331"
      > </a
      ><a name="23332" href="one-lambda-calculus-many-times-2.html#23328" class="Bound"
      >f</a
      ><a name="23333"
      >
    </a
      ><a name="23338" href="one-lambda-calculus-many-times-2.html#23239" class="Function"
      >c&#8314;&#8242;</a
      ><a name="23341"
      > </a
      ><a name="23346" class="Symbol"
      >(</a
      ><a name="23347" href="one-lambda-calculus-many-times-2.html#23347" class="Bound"
      >B</a
      ><a name="23348"
      > </a
      ><a name="23349" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23350"
      > </a
      ><a name="23351" href="one-lambda-calculus-many-times-2.html#23351" class="Bound"
      >&#915;</a
      ><a name="23352" class="Symbol"
      >)</a
      ><a name="23353"
      > </a
      ><a name="23358" href="one-lambda-calculus-many-times-2.html#23358" class="Bound"
      >f</a
      ><a name="23359"
      > </a
      ><a name="23360" class="Symbol"
      >=</a
      ><a name="23361"
      > </a
      ><a name="23362" href="one-lambda-calculus-many-times-2.html#7084" class="InductiveConstructor"
      >c</a
      ><a name="23363"
      > </a
      ><a name="23364" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="23365"
      > </a
      ><a name="23366" href="one-lambda-calculus-many-times-2.html#22460" class="Function"
      >p&#8314;&#8242;</a
      ><a name="23369"
      > </a
      ><a name="23370" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="23372"
      > </a
      ><a name="23373" href="one-lambda-calculus-many-times-2.html#23351" class="Bound"
      >&#915;</a
      ><a name="23374"
      > </a
      ><a name="23375" class="Symbol"
      >(</a
      ><a name="23376" href="one-lambda-calculus-many-times-2.html#23347" class="Bound"
      >B</a
      ><a name="23377"
      > </a
      ><a name="23378" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23379"
      > </a
      ><a name="23380" href="one-lambda-calculus-many-times-2.html#23347" class="Bound"
      >B</a
      ><a name="23381"
      > </a
      ><a name="23382" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23383"
      > </a
      ><a name="23384" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="23386" class="Symbol"
      >)</a
      ><a name="23387"
      >        </a
      ><a name="23395" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="23396"
      > </a
      ><a name="23397" href="one-lambda-calculus-many-times-2.html#23239" class="Function"
      >c&#8314;&#8242;</a
      ><a name="23400"
      > </a
      ><a name="23401" href="one-lambda-calculus-many-times-2.html#23351" class="Bound"
      >&#915;</a
      ><a name="23402"
      >
                      </a
      ><a name="23425" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="23426"
      > </a
      ><a name="23427" href="one-lambda-calculus-many-times-2.html#22460" class="Function"
      >p&#8314;&#8242;</a
      ><a name="23430"
      > </a
      ><a name="23431" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="23433"
      > </a
      ><a name="23434" class="Symbol"
      >(</a
      ><a name="23435" href="one-lambda-calculus-many-times-2.html#23347" class="Bound"
      >B</a
      ><a name="23436"
      > </a
      ><a name="23437" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23438"
      > </a
      ><a name="23439" href="one-lambda-calculus-many-times-2.html#23347" class="Bound"
      >B</a
      ><a name="23440"
      > </a
      ><a name="23441" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23442"
      > </a
      ><a name="23443" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="23445" class="Symbol"
      >)</a
      ><a name="23446"
      > </a
      ><a name="23447" class="Symbol"
      >(</a
      ><a name="23448" href="one-lambda-calculus-many-times-2.html#23351" class="Bound"
      >&#915;</a
      ><a name="23449"
      > </a
      ><a name="23450" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23452"
      > </a
      ><a name="23453" href="one-lambda-calculus-many-times-2.html#23351" class="Bound"
      >&#915;</a
      ><a name="23454" class="Symbol"
      >)</a
      ><a name="23455"
      > </a
      ><a name="23456" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="23457"
      > </a
      ><a name="23458" href="one-lambda-calculus-many-times-2.html#23480" class="Function"
      >g</a
      ><a name="23459"
      >
      </a
      ><a name="23466" class="Keyword"
      >where</a
      ><a name="23471"
      >
        </a
      ><a name="23480" href="one-lambda-calculus-many-times-2.html#23480" class="Function"
      >g</a
      ><a name="23481"
      > </a
      ><a name="23482" class="Symbol"
      >:</a
      ><a name="23483"
      > </a
      ><a name="23484" href="one-lambda-calculus-many-times-2.html#6848" class="Datatype Operator"
      >NJ</a
      ><a name="23486"
      > </a
      ><a name="23487" class="Symbol"
      >(</a
      ><a name="23488" href="one-lambda-calculus-many-times-2.html#23347" class="Bound"
      >B</a
      ><a name="23489"
      > </a
      ><a name="23490" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23491"
      > </a
      ><a name="23492" href="one-lambda-calculus-many-times-2.html#23347" class="Bound"
      >B</a
      ><a name="23493"
      > </a
      ><a name="23494" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23495"
      > </a
      ><a name="23496" href="one-lambda-calculus-many-times-2.html#23351" class="Bound"
      >&#915;</a
      ><a name="23497"
      > </a
      ><a name="23498" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23500"
      > </a
      ><a name="23501" href="one-lambda-calculus-many-times-2.html#23351" class="Bound"
      >&#915;</a
      ><a name="23502" class="Symbol"
      >)</a
      ><a name="23503"
      > </a
      ><a name="23504" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23506"
      > </a
      ><a name="23507" href="one-lambda-calculus-many-times-2.html#23355" class="Bound"
      >&#916;</a
      ><a name="23508"
      > </a
      ><a name="23509" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="23510"
      > </a
      ><a name="23511" href="one-lambda-calculus-many-times-2.html#23343" class="Bound"
      >A</a
      ><a name="23512"
      >
        </a
      ><a name="23521" href="one-lambda-calculus-many-times-2.html#23480" class="Function"
      >g</a
      ><a name="23522"
      > </a
      ><a name="23523" class="Keyword"
      >rewrite</a
      ><a name="23530"
      > </a
      ><a name="23531" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#811" class="Function"
      >++-assoc</a
      ><a name="23539"
      > </a
      ><a name="23540" class="Symbol"
      >(</a
      ><a name="23541" href="one-lambda-calculus-many-times-2.html#23347" class="Bound"
      >B</a
      ><a name="23542"
      > </a
      ><a name="23543" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23544"
      > </a
      ><a name="23545" href="one-lambda-calculus-many-times-2.html#23347" class="Bound"
      >B</a
      ><a name="23546"
      > </a
      ><a name="23547" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23548"
      > </a
      ><a name="23549" href="one-lambda-calculus-many-times-2.html#23351" class="Bound"
      >&#915;</a
      ><a name="23550" class="Symbol"
      >)</a
      ><a name="23551"
      > </a
      ><a name="23552" href="one-lambda-calculus-many-times-2.html#23351" class="Bound"
      >&#915;</a
      ><a name="23553"
      > </a
      ><a name="23554" href="one-lambda-calculus-many-times-2.html#23355" class="Bound"
      >&#916;</a
      ><a name="23555"
      >
                </a
      ><a name="23572" class="Symbol"
      >=</a
      ><a name="23573"
      > </a
      ><a name="23574" href="one-lambda-calculus-many-times-2.html#21487" class="Function"
      >f&#8314;&#8242;</a
      ><a name="23577"
      > </a
      ><a name="23578" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="23580"
      > </a
      ><a name="23581" class="Symbol"
      >(</a
      ><a name="23582" href="one-lambda-calculus-many-times-2.html#23347" class="Bound"
      >B</a
      ><a name="23583"
      > </a
      ><a name="23584" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23585"
      > </a
      ><a name="23586" href="one-lambda-calculus-many-times-2.html#23351" class="Bound"
      >&#915;</a
      ><a name="23587" class="Symbol"
      >)</a
      ><a name="23588"
      > </a
      ><a name="23589" href="one-lambda-calculus-many-times-2.html#23623" class="Function"
      >h</a
      ><a name="23590"
      >
            </a
      ><a name="23603" class="Keyword"
      >where</a
      ><a name="23608"
      >
              </a
      ><a name="23623" href="one-lambda-calculus-many-times-2.html#23623" class="Function"
      >h</a
      ><a name="23624"
      > </a
      ><a name="23625" class="Symbol"
      >:</a
      ><a name="23626"
      > </a
      ><a name="23627" href="one-lambda-calculus-many-times-2.html#6848" class="Datatype Operator"
      >NJ</a
      ><a name="23629"
      > </a
      ><a name="23630" href="one-lambda-calculus-many-times-2.html#23347" class="Bound"
      >B</a
      ><a name="23631"
      > </a
      ><a name="23632" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23633"
      > </a
      ><a name="23634" href="one-lambda-calculus-many-times-2.html#23351" class="Bound"
      >&#915;</a
      ><a name="23635"
      > </a
      ><a name="23636" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23638"
      > </a
      ><a name="23639" href="one-lambda-calculus-many-times-2.html#23347" class="Bound"
      >B</a
      ><a name="23640"
      > </a
      ><a name="23641" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23642"
      > </a
      ><a name="23643" href="one-lambda-calculus-many-times-2.html#23351" class="Bound"
      >&#915;</a
      ><a name="23644"
      > </a
      ><a name="23645" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23647"
      > </a
      ><a name="23648" href="one-lambda-calculus-many-times-2.html#23355" class="Bound"
      >&#916;</a
      ><a name="23649"
      > </a
      ><a name="23650" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="23651"
      > </a
      ><a name="23652" href="one-lambda-calculus-many-times-2.html#23343" class="Bound"
      >A</a
      ><a name="23653"
      >
              </a
      ><a name="23668" href="one-lambda-calculus-many-times-2.html#23623" class="Function"
      >h</a
      ><a name="23669"
      > </a
      ><a name="23670" class="Keyword"
      >rewrite</a
      ><a name="23677"
      > </a
      ><a name="23678" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#565" class="Function"
      >sym</a
      ><a name="23681"
      > </a
      ><a name="23682" class="Symbol"
      >(</a
      ><a name="23683" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#811" class="Function"
      >++-assoc</a
      ><a name="23691"
      > </a
      ><a name="23692" class="Symbol"
      >(</a
      ><a name="23693" href="one-lambda-calculus-many-times-2.html#23347" class="Bound"
      >B</a
      ><a name="23694"
      > </a
      ><a name="23695" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23696"
      > </a
      ><a name="23697" href="one-lambda-calculus-many-times-2.html#23351" class="Bound"
      >&#915;</a
      ><a name="23698" class="Symbol"
      >)</a
      ><a name="23699"
      > </a
      ><a name="23700" class="Symbol"
      >(</a
      ><a name="23701" href="one-lambda-calculus-many-times-2.html#23347" class="Bound"
      >B</a
      ><a name="23702"
      > </a
      ><a name="23703" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23704"
      > </a
      ><a name="23705" href="one-lambda-calculus-many-times-2.html#23351" class="Bound"
      >&#915;</a
      ><a name="23706" class="Symbol"
      >)</a
      ><a name="23707"
      > </a
      ><a name="23708" href="one-lambda-calculus-many-times-2.html#23355" class="Bound"
      >&#916;</a
      ><a name="23709" class="Symbol"
      >)</a
      ><a name="23710"
      >
                      </a
      ><a name="23733" class="Symbol"
      >=</a
      ><a name="23734"
      > </a
      ><a name="23735" href="one-lambda-calculus-many-times-2.html#23358" class="Bound"
      >f</a
      >
{% endraw %}</pre>
</div>
<div class="foldable">
<pre class="Agda">{% raw %}
    <a name="23795" href="one-lambda-calculus-many-times-2.html#23795" class="Function"
      >s&#8314;&#8242;</a
      ><a name="23798"
      > </a
      ><a name="23799" class="Symbol"
      >:</a
      ><a name="23800"
      > </a
      ><a name="23801" class="Symbol"
      >&#8704;</a
      ><a name="23802"
      > </a
      ><a name="23807" class="Symbol"
      >&#8594;</a
      ><a name="23808"
      > </a
      ><a name="23809" class="Symbol"
      >&#8704;</a
      ><a name="23810"
      > </a
      ><a name="23811" href="one-lambda-calculus-many-times-2.html#23811" class="Bound"
      >&#915;</a
      ><a name="23812"
      > </a
      ><a name="23813" href="one-lambda-calculus-many-times-2.html#23813" class="Bound"
      >&#931;</a
      ><a name="23814"
      > </a
      ><a name="23815" class="Symbol"
      >&#8594;</a
      ><a name="23816"
      > </a
      ><a name="23817" class="Symbol"
      >&#8704;</a
      ><a name="23818"
      > </a
      ><a name="23823" class="Symbol"
      >&#8594;</a
      ><a name="23824"
      > </a
      ><a name="23825" href="one-lambda-calculus-many-times-2.html#6848" class="Datatype Operator"
      >NJ</a
      ><a name="23827"
      > </a
      ><a name="23828" class="Symbol"
      >(</a
      ><a name="23829" href="one-lambda-calculus-many-times-2.html#23811" class="Bound"
      >&#915;</a
      ><a name="23830"
      > </a
      ><a name="23831" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23833"
      > </a
      ><a name="23834" href="one-lambda-calculus-many-times-2.html#23813" class="Bound"
      >&#931;</a
      ><a name="23835" class="Symbol"
      >)</a
      ><a name="23836"
      > </a
      ><a name="23837" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23839"
      > </a
      ><a name="23840" href="one-lambda-calculus-many-times-2.html#23820" class="Bound"
      >&#928;</a
      ><a name="23841"
      > </a
      ><a name="23842" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="23843"
      > </a
      ><a name="23844" href="one-lambda-calculus-many-times-2.html#23804" class="Bound"
      >A</a
      ><a name="23845"
      >
                </a
      ><a name="23862" class="Symbol"
      >&#8594;</a
      ><a name="23863"
      > </a
      ><a name="23864" href="one-lambda-calculus-many-times-2.html#6848" class="Datatype Operator"
      >NJ</a
      ><a name="23866"
      > </a
      ><a name="23867" class="Symbol"
      >(</a
      ><a name="23868" href="one-lambda-calculus-many-times-2.html#23811" class="Bound"
      >&#915;</a
      ><a name="23869"
      > </a
      ><a name="23870" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23872"
      > </a
      ><a name="23873" href="one-lambda-calculus-many-times-2.html#23820" class="Bound"
      >&#928;</a
      ><a name="23874" class="Symbol"
      >)</a
      ><a name="23875"
      > </a
      ><a name="23876" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23878"
      > </a
      ><a name="23879" href="one-lambda-calculus-many-times-2.html#23813" class="Bound"
      >&#931;</a
      ><a name="23880"
      > </a
      ><a name="23881" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="23882"
      > </a
      ><a name="23883" href="one-lambda-calculus-many-times-2.html#23804" class="Bound"
      >A</a
      ><a name="23884"
      >
    </a
      ><a name="23889" href="one-lambda-calculus-many-times-2.html#23795" class="Function"
      >s&#8314;&#8242;</a
      ><a name="23892"
      > </a
      ><a name="23897" href="one-lambda-calculus-many-times-2.html#23897" class="Bound"
      >&#915;</a
      ><a name="23898"
      > </a
      ><a name="23899" href="one-lambda-calculus-many-times-2.html#23899" class="Bound"
      >&#931;</a
      ><a name="23900"
      > </a
      ><a name="23905" href="one-lambda-calculus-many-times-2.html#23905" class="Bound"
      >f</a
      ><a name="23906"
      >
      </a
      ><a name="23913" class="Symbol"
      >=</a
      ><a name="23914"
      > </a
      ><a name="23915" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#705" class="Function"
      >subst</a
      ><a name="23920"
      > </a
      ><a name="23921" class="Symbol"
      >(&#955;</a
      ><a name="23923"
      > </a
      ><a name="23924" href="one-lambda-calculus-many-times-2.html#23924" class="Bound"
      >&#931;</a
      ><a name="23925"
      > </a
      ><a name="23926" class="Symbol"
      >&#8594;</a
      ><a name="23927"
      > </a
      ><a name="23928" href="one-lambda-calculus-many-times-2.html#6848" class="Datatype Operator"
      >NJ</a
      ><a name="23930"
      > </a
      ><a name="23931" class="Symbol"
      >(</a
      ><a name="23932" href="one-lambda-calculus-many-times-2.html#23897" class="Bound"
      >&#915;</a
      ><a name="23933"
      > </a
      ><a name="23934" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23936"
      > </a
      ><a name="23937" href="one-lambda-calculus-many-times-2.html#23902" class="Bound"
      >&#928;</a
      ><a name="23938" class="Symbol"
      >)</a
      ><a name="23939"
      > </a
      ><a name="23940" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23942"
      > </a
      ><a name="23943" href="one-lambda-calculus-many-times-2.html#23924" class="Bound"
      >&#931;</a
      ><a name="23944"
      > </a
      ><a name="23945" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="23946"
      > </a
      ><a name="23947" href="one-lambda-calculus-many-times-2.html#23894" class="Bound"
      >A</a
      ><a name="23948" class="Symbol"
      >)</a
      ><a name="23949"
      >      </a
      ><a name="23955" class="Symbol"
      >(</a
      ><a name="23956" href="one-lambda-calculus-many-times-2.html#2016" class="Function"
      >++-identity&#691;</a
      ><a name="23968"
      > </a
      ><a name="23969" href="one-lambda-calculus-many-times-2.html#23899" class="Bound"
      >&#931;</a
      ><a name="23970" class="Symbol"
      >)</a
      ><a name="23971"
      >
      </a
      ><a name="23978" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="23979"
      > </a
      ><a name="23980" href="one-lambda-calculus-many-times-2.html#22460" class="Function"
      >p&#8314;&#8242;</a
      ><a name="23983"
      > </a
      ><a name="23984" href="one-lambda-calculus-many-times-2.html#23897" class="Bound"
      >&#915;</a
      ><a name="23985"
      > </a
      ><a name="23986" href="one-lambda-calculus-many-times-2.html#23899" class="Bound"
      >&#931;</a
      ><a name="23987"
      > </a
      ><a name="23988" href="one-lambda-calculus-many-times-2.html#23902" class="Bound"
      >&#928;</a
      ><a name="23989"
      >
      </a
      ><a name="23996" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="23997"
      > </a
      ><a name="23998" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#705" class="Function"
      >subst</a
      ><a name="24003"
      > </a
      ><a name="24004" class="Symbol"
      >(&#955;</a
      ><a name="24006"
      > </a
      ><a name="24007" href="one-lambda-calculus-many-times-2.html#24007" class="Bound"
      >&#928;</a
      ><a name="24008"
      > </a
      ><a name="24009" class="Symbol"
      >&#8594;</a
      ><a name="24010"
      > </a
      ><a name="24011" href="one-lambda-calculus-many-times-2.html#6848" class="Datatype Operator"
      >NJ</a
      ><a name="24013"
      > </a
      ><a name="24014" class="Symbol"
      >(</a
      ><a name="24015" href="one-lambda-calculus-many-times-2.html#23897" class="Bound"
      >&#915;</a
      ><a name="24016"
      > </a
      ><a name="24017" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="24019"
      > </a
      ><a name="24020" href="one-lambda-calculus-many-times-2.html#23899" class="Bound"
      >&#931;</a
      ><a name="24021" class="Symbol"
      >)</a
      ><a name="24022"
      > </a
      ><a name="24023" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="24025"
      > </a
      ><a name="24026" href="one-lambda-calculus-many-times-2.html#24007" class="Bound"
      >&#928;</a
      ><a name="24027"
      > </a
      ><a name="24028" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="24029"
      > </a
      ><a name="24030" href="one-lambda-calculus-many-times-2.html#23894" class="Bound"
      >A</a
      ><a name="24031" class="Symbol"
      >)</a
      ><a name="24032"
      > </a
      ><a name="24033" class="Symbol"
      >(</a
      ><a name="24034" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#565" class="Function"
      >sym</a
      ><a name="24037"
      > </a
      ><a name="24038" class="Symbol"
      >(</a
      ><a name="24039" href="one-lambda-calculus-many-times-2.html#2016" class="Function"
      >++-identity&#691;</a
      ><a name="24051"
      > </a
      ><a name="24052" href="one-lambda-calculus-many-times-2.html#23902" class="Bound"
      >&#928;</a
      ><a name="24053" class="Symbol"
      >))</a
      ><a name="24055"
      >
      </a
      ><a name="24062" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="24063"
      > </a
      ><a name="24064" href="one-lambda-calculus-many-times-2.html#23905" class="Bound"
      >f</a
      >
{% endraw %}</pre>
</div>

<pre class="Agda">{% raw %}
    <a name="24102" href="one-lambda-calculus-many-times-2.html#24102" class="Function"
      >ax&#8242;</a
      ><a name="24105"
      > </a
      ><a name="24106" class="Symbol"
      >:</a
      ><a name="24107"
      > </a
      ><a name="24108" class="Symbol"
      >&#8704;</a
      ><a name="24109"
      > </a
      ><a name="24116" class="Symbol"
      >&#8594;</a
      ><a name="24117"
      > </a
      ><a name="24118" href="one-lambda-calculus-many-times-2.html#24111" class="Bound"
      >A</a
      ><a name="24119"
      > </a
      ><a name="24120" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#2920" class="Function Operator"
      >&#8712;</a
      ><a name="24121"
      > </a
      ><a name="24122" href="one-lambda-calculus-many-times-2.html#24113" class="Bound"
      >&#915;</a
      ><a name="24123"
      > </a
      ><a name="24124" class="Symbol"
      >&#8594;</a
      ><a name="24125"
      > </a
      ><a name="24126" href="one-lambda-calculus-many-times-2.html#6848" class="Datatype Operator"
      >NJ</a
      ><a name="24128"
      > </a
      ><a name="24129" href="one-lambda-calculus-many-times-2.html#24113" class="Bound"
      >&#915;</a
      ><a name="24130"
      > </a
      ><a name="24131" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="24132"
      > </a
      ><a name="24133" href="one-lambda-calculus-many-times-2.html#24111" class="Bound"
      >A</a
      ><a name="24134"
      >
    </a
      ><a name="24139" href="one-lambda-calculus-many-times-2.html#24102" class="Function"
      >ax&#8242;</a
      ><a name="24142"
      > </a
      ><a name="24155" class="Symbol"
      >(</a
      ><a name="24156" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="24160"
      > </a
      ><a name="24161" href="one-lambda-calculus-many-times-2.html#24161" class="Bound"
      >px</a
      ><a name="24163" class="Symbol"
      >)</a
      ><a name="24164"
      > </a
      ><a name="24165" class="Keyword"
      >rewrite</a
      ><a name="24172"
      > </a
      ><a name="24173" href="one-lambda-calculus-many-times-2.html#24161" class="Bound"
      >px</a
      ><a name="24175"
      > </a
      ><a name="24176" class="Symbol"
      >=</a
      ><a name="24177"
      > </a
      ><a name="24178" href="one-lambda-calculus-many-times-2.html#23795" class="Function"
      >s&#8314;&#8242;</a
      ><a name="24181"
      > </a
      ><a name="24182" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="24184"
      > </a
      ><a name="24185" href="one-lambda-calculus-many-times-2.html#24152" class="Bound"
      >&#915;</a
      ><a name="24186"
      > </a
      ><a name="24187" class="Symbol"
      >(</a
      ><a name="24188" href="one-lambda-calculus-many-times-2.html#21263" class="Function"
      >w&#8314;&#8242;</a
      ><a name="24191"
      > </a
      ><a name="24192" href="one-lambda-calculus-many-times-2.html#24152" class="Bound"
      >&#915;</a
      ><a name="24193"
      > </a
      ><a name="24194" href="one-lambda-calculus-many-times-2.html#6878" class="InductiveConstructor"
      >ax</a
      ><a name="24196" class="Symbol"
      >)</a
      ><a name="24197"
      >
    </a
      ><a name="24202" href="one-lambda-calculus-many-times-2.html#24102" class="Function"
      >ax&#8242;</a
      ><a name="24205"
      > </a
      ><a name="24218" class="Symbol"
      >(</a
      ><a name="24219" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="24224"
      > </a
      ><a name="24225" href="one-lambda-calculus-many-times-2.html#24225" class="Bound"
      >x</a
      ><a name="24226" class="Symbol"
      >)</a
      ><a name="24227"
      >            </a
      ><a name="24239" class="Symbol"
      >=</a
      ><a name="24240"
      > </a
      ><a name="24241" href="one-lambda-calculus-many-times-2.html#7035" class="InductiveConstructor"
      >w</a
      ><a name="24242"
      > </a
      ><a name="24243" class="Symbol"
      >(</a
      ><a name="24244" href="one-lambda-calculus-many-times-2.html#24102" class="Function"
      >ax&#8242;</a
      ><a name="24247"
      > </a
      ><a name="24248" href="one-lambda-calculus-many-times-2.html#24225" class="Bound"
      >x</a
      ><a name="24249" class="Symbol"
      >)</a
      >
{% endraw %}</pre>

It turns out to be very useful to define two helper functions which introduce and eliminate the empty context to the right. This is because <span class="Agda Spec"><a class="Bound">Γ</a> <a href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator" target="_blank">++</a> <a href="https://agda.github.io/agda-stdlib/Agda.Builtin.List.html#89" class="InductiveConstructor" target="_blank">[]</a></span> doesn't automatically reduce. Therefore, any proof in which the empty context occurs to the right would involve rewriting by <a class="Agda Spec Function">++&#8209;identityʳ</a>.

<pre class="Agda">{% raw %}
    <a name="24895" href="one-lambda-calculus-many-times-2.html#24895" class="Function"
      >&#8709;i</a
      ><a name="24897"
      > </a
      ><a name="24898" class="Symbol"
      >:</a
      ><a name="24899"
      > </a
      ><a name="24900" class="Symbol"
      >&#8704;</a
      ><a name="24901"
      > </a
      ><a name="24908" class="Symbol"
      >&#8594;</a
      ><a name="24909"
      > </a
      ><a name="24910" href="one-lambda-calculus-many-times-2.html#6848" class="Datatype Operator"
      >NJ</a
      ><a name="24912"
      > </a
      ><a name="24913" href="one-lambda-calculus-many-times-2.html#24905" class="Bound"
      >&#915;</a
      ><a name="24914"
      > </a
      ><a name="24915" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="24916"
      > </a
      ><a name="24917" href="one-lambda-calculus-many-times-2.html#24903" class="Bound"
      >A</a
      ><a name="24918"
      > </a
      ><a name="24919" class="Symbol"
      >&#8594;</a
      ><a name="24920"
      > </a
      ><a name="24921" href="one-lambda-calculus-many-times-2.html#6848" class="Datatype Operator"
      >NJ</a
      ><a name="24923"
      > </a
      ><a name="24924" href="one-lambda-calculus-many-times-2.html#24905" class="Bound"
      >&#915;</a
      ><a name="24925"
      > </a
      ><a name="24926" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="24928"
      > </a
      ><a name="24929" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="24931"
      > </a
      ><a name="24932" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="24933"
      > </a
      ><a name="24934" href="one-lambda-calculus-many-times-2.html#24903" class="Bound"
      >A</a
      ><a name="24935"
      >
    </a
      ><a name="24940" href="one-lambda-calculus-many-times-2.html#24895" class="Function"
      >&#8709;i</a
      ><a name="24942"
      > </a
      ><a name="24951" href="one-lambda-calculus-many-times-2.html#24951" class="Bound"
      >f</a
      ><a name="24952"
      > </a
      ><a name="24953" class="Keyword"
      >rewrite</a
      ><a name="24960"
      > </a
      ><a name="24961" href="one-lambda-calculus-many-times-2.html#2016" class="Function"
      >++-identity&#691;</a
      ><a name="24973"
      > </a
      ><a name="24974" href="one-lambda-calculus-many-times-2.html#24948" class="Bound"
      >&#915;</a
      ><a name="24975"
      > </a
      ><a name="24976" class="Symbol"
      >=</a
      ><a name="24977"
      > </a
      ><a name="24978" href="one-lambda-calculus-many-times-2.html#24951" class="Bound"
      >f</a
      ><a name="24979"
      >
    </a
      ><a name="24984" href="one-lambda-calculus-many-times-2.html#24984" class="Function"
      >&#8709;e</a
      ><a name="24986"
      > </a
      ><a name="24987" class="Symbol"
      >:</a
      ><a name="24988"
      > </a
      ><a name="24989" class="Symbol"
      >&#8704;</a
      ><a name="24990"
      > </a
      ><a name="24997" class="Symbol"
      >&#8594;</a
      ><a name="24998"
      > </a
      ><a name="24999" href="one-lambda-calculus-many-times-2.html#6848" class="Datatype Operator"
      >NJ</a
      ><a name="25001"
      > </a
      ><a name="25002" href="one-lambda-calculus-many-times-2.html#24994" class="Bound"
      >&#915;</a
      ><a name="25003"
      > </a
      ><a name="25004" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="25006"
      > </a
      ><a name="25007" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="25009"
      > </a
      ><a name="25010" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="25011"
      > </a
      ><a name="25012" href="one-lambda-calculus-many-times-2.html#24992" class="Bound"
      >A</a
      ><a name="25013"
      > </a
      ><a name="25014" class="Symbol"
      >&#8594;</a
      ><a name="25015"
      > </a
      ><a name="25016" href="one-lambda-calculus-many-times-2.html#6848" class="Datatype Operator"
      >NJ</a
      ><a name="25018"
      > </a
      ><a name="25019" href="one-lambda-calculus-many-times-2.html#24994" class="Bound"
      >&#915;</a
      ><a name="25020"
      > </a
      ><a name="25021" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="25022"
      > </a
      ><a name="25023" href="one-lambda-calculus-many-times-2.html#24992" class="Bound"
      >A</a
      ><a name="25024"
      >
    </a
      ><a name="25029" href="one-lambda-calculus-many-times-2.html#24984" class="Function"
      >&#8709;e</a
      ><a name="25031"
      > </a
      ><a name="25040" href="one-lambda-calculus-many-times-2.html#25040" class="Bound"
      >f</a
      ><a name="25041"
      > </a
      ><a name="25042" class="Keyword"
      >rewrite</a
      ><a name="25049"
      > </a
      ><a name="25050" href="one-lambda-calculus-many-times-2.html#2016" class="Function"
      >++-identity&#691;</a
      ><a name="25062"
      > </a
      ><a name="25063" href="one-lambda-calculus-many-times-2.html#25037" class="Bound"
      >&#915;</a
      ><a name="25064"
      > </a
      ><a name="25065" class="Symbol"
      >=</a
      ><a name="25066"
      > </a
      ><a name="25067" href="one-lambda-calculus-many-times-2.html#25040" class="Bound"
      >f</a
      >
{% endraw %}</pre>



### Implicit and Explicit Structural Rules

<pre class="Agda">{% raw %}
  <a name="25142" class="Keyword"
      >module</a
      ><a name="25148"
      > </a
      ><a name="25149" href="one-lambda-calculus-many-times-2.html#25149" class="Module"
      >NJ&#8660;ND</a
      ><a name="25154"
      > </a
      ><a name="25155" class="Keyword"
      >where</a
      ><a name="25160"
      >

    </a
      ><a name="25166" href="one-lambda-calculus-many-times-2.html#25166" class="Function"
      >&#10233;</a
      ><a name="25167"
      > </a
      ><a name="25168" class="Symbol"
      >:</a
      ><a name="25169"
      > </a
      ><a name="25170" class="Symbol"
      >&#8704;</a
      ><a name="25171"
      > </a
      ><a name="25176" class="Symbol"
      >&#8594;</a
      ><a name="25177"
      > </a
      ><a name="25178" href="one-lambda-calculus-many-times-2.html#6848" class="Datatype Operator"
      >NJ</a
      ><a name="25180"
      > </a
      ><a name="25181" href="one-lambda-calculus-many-times-2.html#25173" class="Bound"
      >S</a
      ><a name="25182"
      > </a
      ><a name="25183" class="Symbol"
      >&#8594;</a
      ><a name="25184"
      > </a
      ><a name="25185" href="2016-03-20-one-lambda-calculus-many-times.html#5371" class="Datatype Operator"
      >ND</a
      ><a name="25187"
      > </a
      ><a name="25188" href="one-lambda-calculus-many-times-2.html#25173" class="Bound"
      >S</a
      ><a name="25189"
      >
    </a
      ><a name="25194" href="one-lambda-calculus-many-times-2.html#25166" class="Function"
      >&#10233;</a
      ><a name="25195"
      >  </a
      ><a name="25197" href="one-lambda-calculus-many-times-2.html#6878" class="InductiveConstructor"
      >ax</a
      ><a name="25199"
      >         </a
      ><a name="25208" class="Symbol"
      >=</a
      ><a name="25209"
      > </a
      ><a name="25210" href="2016-03-20-one-lambda-calculus-many-times.html#10226" class="InductiveConstructor"
      >ax&#8320;</a
      ><a name="25213"
      >
    </a
      ><a name="25218" href="one-lambda-calculus-many-times-2.html#25166" class="Function"
      >&#10233;</a
      ><a name="25219"
      > </a
      ><a name="25220" class="Symbol"
      >(</a
      ><a name="25221" href="one-lambda-calculus-many-times-2.html#6917" class="InductiveConstructor"
      >&#8658;i</a
      ><a name="25223"
      > </a
      ><a name="25224" href="one-lambda-calculus-many-times-2.html#25224" class="Bound"
      >f</a
      ><a name="25225"
      >  </a
      ><a name="25227" class="Symbol"
      >)</a
      ><a name="25228"
      >    </a
      ><a name="25232" class="Symbol"
      >=</a
      ><a name="25233"
      > </a
      ><a name="25234" href="2016-03-20-one-lambda-calculus-many-times.html#5439" class="InductiveConstructor"
      >&#8658;i</a
      ><a name="25236"
      > </a
      ><a name="25237" class="Symbol"
      >(</a
      ><a name="25238" href="one-lambda-calculus-many-times-2.html#25166" class="Function"
      >&#10233;</a
      ><a name="25239"
      > </a
      ><a name="25240" href="one-lambda-calculus-many-times-2.html#25224" class="Bound"
      >f</a
      ><a name="25241" class="Symbol"
      >)</a
      ><a name="25242"
      >
    </a
      ><a name="25247" href="one-lambda-calculus-many-times-2.html#25166" class="Function"
      >&#10233;</a
      ><a name="25248"
      > </a
      ><a name="25249" class="Symbol"
      >(</a
      ><a name="25250" href="one-lambda-calculus-many-times-2.html#6970" class="InductiveConstructor"
      >&#8658;e</a
      ><a name="25252"
      > </a
      ><a name="25253" class="Symbol"
      >{</a
      ><a name="25254" class="Argument"
      >&#915;</a
      ><a name="25255"
      > </a
      ><a name="25256" class="Symbol"
      >=</a
      ><a name="25257"
      > </a
      ><a name="25258" href="one-lambda-calculus-many-times-2.html#25258" class="Bound"
      >&#915;</a
      ><a name="25259" class="Symbol"
      >}</a
      ><a name="25260"
      > </a
      ><a name="25261" href="one-lambda-calculus-many-times-2.html#25261" class="Bound"
      >f</a
      ><a name="25262"
      > </a
      ><a name="25263" href="one-lambda-calculus-many-times-2.html#25263" class="Bound"
      >g</a
      ><a name="25264" class="Symbol"
      >)</a
      ><a name="25265"
      >    </a
      ><a name="25269" class="Symbol"
      >=</a
      ><a name="25270"
      > </a
      ><a name="25271" href="2016-03-20-one-lambda-calculus-many-times.html#5488" class="InductiveConstructor"
      >&#8658;e</a
      ><a name="25273"
      > </a
      ><a name="25274" class="Symbol"
      >(</a
      ><a name="25275" href="one-lambda-calculus-many-times-2.html#25318" class="Function"
      >inl</a
      ><a name="25278"
      > </a
      ><a name="25279" class="Symbol"
      >(</a
      ><a name="25280" href="one-lambda-calculus-many-times-2.html#25166" class="Function"
      >&#10233;</a
      ><a name="25281"
      > </a
      ><a name="25282" href="one-lambda-calculus-many-times-2.html#25261" class="Bound"
      >f</a
      ><a name="25283" class="Symbol"
      >))</a
      ><a name="25285"
      > </a
      ><a name="25286" class="Symbol"
      >(</a
      ><a name="25287" href="one-lambda-calculus-many-times-2.html#25416" class="Function"
      >inr</a
      ><a name="25290"
      > </a
      ><a name="25291" class="Symbol"
      >(</a
      ><a name="25292" href="one-lambda-calculus-many-times-2.html#25166" class="Function"
      >&#10233;</a
      ><a name="25293"
      > </a
      ><a name="25294" href="one-lambda-calculus-many-times-2.html#25263" class="Bound"
      >g</a
      ><a name="25295" class="Symbol"
      >))</a
      ><a name="25297"
      >
      </a
      ><a name="25304" class="Keyword"
      >where</a
      ><a name="25309"
      >
        </a
      ><a name="25318" href="one-lambda-calculus-many-times-2.html#25318" class="Function"
      >inl</a
      ><a name="25321"
      > </a
      ><a name="25322" class="Symbol"
      >:</a
      ><a name="25323"
      > </a
      ><a name="25324" class="Symbol"
      >&#8704;</a
      ><a name="25325"
      > </a
      ><a name="25332" class="Symbol"
      >&#8594;</a
      ><a name="25333"
      > </a
      ><a name="25334" href="2016-03-20-one-lambda-calculus-many-times.html#5371" class="Datatype Operator"
      >ND</a
      ><a name="25336"
      > </a
      ><a name="25337" href="one-lambda-calculus-many-times-2.html#25258" class="Bound"
      >&#915;</a
      ><a name="25338"
      > </a
      ><a name="25339" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="25340"
      > </a
      ><a name="25341" href="one-lambda-calculus-many-times-2.html#25327" class="Bound"
      >A</a
      ><a name="25342"
      > </a
      ><a name="25343" class="Symbol"
      >&#8594;</a
      ><a name="25344"
      > </a
      ><a name="25345" href="2016-03-20-one-lambda-calculus-many-times.html#5371" class="Datatype Operator"
      >ND</a
      ><a name="25347"
      > </a
      ><a name="25348" href="one-lambda-calculus-many-times-2.html#25258" class="Bound"
      >&#915;</a
      ><a name="25349"
      > </a
      ><a name="25350" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="25352"
      > </a
      ><a name="25353" href="one-lambda-calculus-many-times-2.html#25329" class="Bound"
      >&#916;</a
      ><a name="25354"
      > </a
      ><a name="25355" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="25356"
      > </a
      ><a name="25357" href="one-lambda-calculus-many-times-2.html#25327" class="Bound"
      >A</a
      ><a name="25358"
      >
        </a
      ><a name="25367" href="one-lambda-calculus-many-times-2.html#25318" class="Function"
      >inl</a
      ><a name="25370"
      > </a
      ><a name="25371" class="Symbol"
      >{</a
      ><a name="25372" class="Argument"
      >&#916;</a
      ><a name="25373"
      > </a
      ><a name="25374" class="Symbol"
      >=</a
      ><a name="25375"
      > </a
      ><a name="25376" href="one-lambda-calculus-many-times-2.html#25376" class="Bound"
      >&#916;</a
      ><a name="25377" class="Symbol"
      >}</a
      ><a name="25378"
      > </a
      ><a name="25379" href="one-lambda-calculus-many-times-2.html#25379" class="Bound"
      >f</a
      ><a name="25380"
      > </a
      ><a name="25381" class="Symbol"
      >=</a
      ><a name="25382"
      > </a
      ><a name="25383" href="one-lambda-calculus-many-times-2.html#20726" class="Function"
      >ND.s&#8314;&#8242;</a
      ><a name="25389"
      > </a
      ><a name="25390" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="25392"
      > </a
      ><a name="25393" href="one-lambda-calculus-many-times-2.html#25376" class="Bound"
      >&#916;</a
      ><a name="25394"
      > </a
      ><a name="25395" class="Symbol"
      >(</a
      ><a name="25396" href="one-lambda-calculus-many-times-2.html#20331" class="Function"
      >ND.w&#8314;&#8242;</a
      ><a name="25402"
      > </a
      ><a name="25403" href="one-lambda-calculus-many-times-2.html#25376" class="Bound"
      >&#916;</a
      ><a name="25404"
      > </a
      ><a name="25405" href="one-lambda-calculus-many-times-2.html#25379" class="Bound"
      >f</a
      ><a name="25406" class="Symbol"
      >)</a
      ><a name="25407"
      >
        </a
      ><a name="25416" href="one-lambda-calculus-many-times-2.html#25416" class="Function"
      >inr</a
      ><a name="25419"
      > </a
      ><a name="25420" class="Symbol"
      >:</a
      ><a name="25421"
      > </a
      ><a name="25422" class="Symbol"
      >&#8704;</a
      ><a name="25423"
      > </a
      ><a name="25430" class="Symbol"
      >&#8594;</a
      ><a name="25431"
      > </a
      ><a name="25432" href="2016-03-20-one-lambda-calculus-many-times.html#5371" class="Datatype Operator"
      >ND</a
      ><a name="25434"
      > </a
      ><a name="25435" href="one-lambda-calculus-many-times-2.html#25427" class="Bound"
      >&#916;</a
      ><a name="25436"
      > </a
      ><a name="25437" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="25438"
      > </a
      ><a name="25439" href="one-lambda-calculus-many-times-2.html#25425" class="Bound"
      >A</a
      ><a name="25440"
      > </a
      ><a name="25441" class="Symbol"
      >&#8594;</a
      ><a name="25442"
      > </a
      ><a name="25443" href="2016-03-20-one-lambda-calculus-many-times.html#5371" class="Datatype Operator"
      >ND</a
      ><a name="25445"
      > </a
      ><a name="25446" href="one-lambda-calculus-many-times-2.html#25258" class="Bound"
      >&#915;</a
      ><a name="25447"
      > </a
      ><a name="25448" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="25450"
      > </a
      ><a name="25451" href="one-lambda-calculus-many-times-2.html#25427" class="Bound"
      >&#916;</a
      ><a name="25452"
      > </a
      ><a name="25453" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="25454"
      > </a
      ><a name="25455" href="one-lambda-calculus-many-times-2.html#25425" class="Bound"
      >A</a
      ><a name="25456"
      >
        </a
      ><a name="25465" href="one-lambda-calculus-many-times-2.html#25416" class="Function"
      >inr</a
      ><a name="25468"
      > </a
      ><a name="25469" href="one-lambda-calculus-many-times-2.html#25469" class="Bound"
      >f</a
      ><a name="25470"
      > </a
      ><a name="25471" class="Symbol"
      >=</a
      ><a name="25472"
      > </a
      ><a name="25473" href="one-lambda-calculus-many-times-2.html#20331" class="Function"
      >ND.w&#8314;&#8242;</a
      ><a name="25479"
      > </a
      ><a name="25480" href="one-lambda-calculus-many-times-2.html#25258" class="Bound"
      >&#915;</a
      ><a name="25481"
      > </a
      ><a name="25482" href="one-lambda-calculus-many-times-2.html#25469" class="Bound"
      >f</a
      ><a name="25483"
      >

    </a
      ><a name="25489" href="one-lambda-calculus-many-times-2.html#25166" class="Function"
      >&#10233;</a
      ><a name="25490"
      > </a
      ><a name="25491" class="Symbol"
      >(</a
      ><a name="25492" href="one-lambda-calculus-many-times-2.html#7035" class="InductiveConstructor"
      >w</a
      ><a name="25493"
      >    </a
      ><a name="25497" href="one-lambda-calculus-many-times-2.html#25497" class="Bound"
      >f</a
      ><a name="25498" class="Symbol"
      >)</a
      ><a name="25499"
      >    </a
      ><a name="25503" class="Symbol"
      >=</a
      ><a name="25504"
      > </a
      ><a name="25505" href="2016-03-20-one-lambda-calculus-many-times.html#8603" class="Function"
      >ND.w&#8242;</a
      ><a name="25510"
      >   </a
      ><a name="25513" class="Symbol"
      >(</a
      ><a name="25514" href="one-lambda-calculus-many-times-2.html#25166" class="Function"
      >&#10233;</a
      ><a name="25515"
      > </a
      ><a name="25516" href="one-lambda-calculus-many-times-2.html#25497" class="Bound"
      >f</a
      ><a name="25517" class="Symbol"
      >)</a
      ><a name="25518"
      >
    </a
      ><a name="25523" href="one-lambda-calculus-many-times-2.html#25166" class="Function"
      >&#10233;</a
      ><a name="25524"
      > </a
      ><a name="25525" class="Symbol"
      >(</a
      ><a name="25526" href="one-lambda-calculus-many-times-2.html#7084" class="InductiveConstructor"
      >c</a
      ><a name="25527"
      >    </a
      ><a name="25531" href="one-lambda-calculus-many-times-2.html#25531" class="Bound"
      >f</a
      ><a name="25532" class="Symbol"
      >)</a
      ><a name="25533"
      >    </a
      ><a name="25537" class="Symbol"
      >=</a
      ><a name="25538"
      > </a
      ><a name="25539" href="one-lambda-calculus-many-times-2.html#12143" class="Function"
      >ND.c&#8242;</a
      ><a name="25544"
      >   </a
      ><a name="25547" class="Symbol"
      >(</a
      ><a name="25548" href="one-lambda-calculus-many-times-2.html#25166" class="Function"
      >&#10233;</a
      ><a name="25549"
      > </a
      ><a name="25550" href="one-lambda-calculus-many-times-2.html#25531" class="Bound"
      >f</a
      ><a name="25551" class="Symbol"
      >)</a
      ><a name="25552"
      >
    </a
      ><a name="25557" href="one-lambda-calculus-many-times-2.html#25166" class="Function"
      >&#10233;</a
      ><a name="25558"
      > </a
      ><a name="25559" class="Symbol"
      >(</a
      ><a name="25560" href="one-lambda-calculus-many-times-2.html#7141" class="InductiveConstructor"
      >p</a
      ><a name="25561"
      >  </a
      ><a name="25563" href="one-lambda-calculus-many-times-2.html#25563" class="Bound"
      >&#915;</a
      ><a name="25564"
      > </a
      ><a name="25565" href="one-lambda-calculus-many-times-2.html#25565" class="Bound"
      >f</a
      ><a name="25566" class="Symbol"
      >)</a
      ><a name="25567"
      >    </a
      ><a name="25571" class="Symbol"
      >=</a
      ><a name="25572"
      > </a
      ><a name="25573" href="one-lambda-calculus-many-times-2.html#12528" class="Function"
      >ND.p&#8242;</a
      ><a name="25578"
      > </a
      ><a name="25579" href="one-lambda-calculus-many-times-2.html#25563" class="Bound"
      >&#915;</a
      ><a name="25580"
      > </a
      ><a name="25581" class="Symbol"
      >(</a
      ><a name="25582" href="one-lambda-calculus-many-times-2.html#25166" class="Function"
      >&#10233;</a
      ><a name="25583"
      > </a
      ><a name="25584" href="one-lambda-calculus-many-times-2.html#25565" class="Bound"
      >f</a
      ><a name="25585" class="Symbol"
      >)</a
      ><a name="25586"
      >

    </a
      ><a name="25592" href="one-lambda-calculus-many-times-2.html#25592" class="Function"
      >&#10232;</a
      ><a name="25593"
      > </a
      ><a name="25594" class="Symbol"
      >:</a
      ><a name="25595"
      > </a
      ><a name="25596" class="Symbol"
      >&#8704;</a
      ><a name="25597"
      > </a
      ><a name="25602" class="Symbol"
      >&#8594;</a
      ><a name="25603"
      > </a
      ><a name="25604" href="2016-03-20-one-lambda-calculus-many-times.html#5371" class="Datatype Operator"
      >ND</a
      ><a name="25606"
      > </a
      ><a name="25607" href="one-lambda-calculus-many-times-2.html#25599" class="Bound"
      >S</a
      ><a name="25608"
      > </a
      ><a name="25609" class="Symbol"
      >&#8594;</a
      ><a name="25610"
      > </a
      ><a name="25611" href="one-lambda-calculus-many-times-2.html#6848" class="Datatype Operator"
      >NJ</a
      ><a name="25613"
      > </a
      ><a name="25614" href="one-lambda-calculus-many-times-2.html#25599" class="Bound"
      >S</a
      ><a name="25615"
      >
    </a
      ><a name="25620" href="one-lambda-calculus-many-times-2.html#25592" class="Function"
      >&#10232;</a
      ><a name="25621"
      > </a
      ><a name="25622" class="Symbol"
      >(</a
      ><a name="25623" href="2016-03-20-one-lambda-calculus-many-times.html#5401" class="InductiveConstructor"
      >ax</a
      ><a name="25625"
      >  </a
      ><a name="25627" href="one-lambda-calculus-many-times-2.html#25627" class="Bound"
      >x</a
      ><a name="25628" class="Symbol"
      >)</a
      ><a name="25629"
      >     </a
      ><a name="25634" class="Symbol"
      >=</a
      ><a name="25635"
      > </a
      ><a name="25636" href="one-lambda-calculus-many-times-2.html#24102" class="Function"
      >NJ.ax&#8242;</a
      ><a name="25642"
      > </a
      ><a name="25643" href="one-lambda-calculus-many-times-2.html#25627" class="Bound"
      >x</a
      ><a name="25644"
      >
    </a
      ><a name="25649" href="one-lambda-calculus-many-times-2.html#25592" class="Function"
      >&#10232;</a
      ><a name="25650"
      > </a
      ><a name="25651" class="Symbol"
      >(</a
      ><a name="25652" href="2016-03-20-one-lambda-calculus-many-times.html#5439" class="InductiveConstructor"
      >&#8658;i</a
      ><a name="25654"
      >  </a
      ><a name="25656" href="one-lambda-calculus-many-times-2.html#25656" class="Bound"
      >f</a
      ><a name="25657" class="Symbol"
      >)</a
      ><a name="25658"
      >     </a
      ><a name="25663" class="Symbol"
      >=</a
      ><a name="25664"
      > </a
      ><a name="25665" href="one-lambda-calculus-many-times-2.html#6917" class="InductiveConstructor"
      >&#8658;i</a
      ><a name="25667"
      >  </a
      ><a name="25669" class="Symbol"
      >(</a
      ><a name="25670" href="one-lambda-calculus-many-times-2.html#25592" class="Function"
      >&#10232;</a
      ><a name="25671"
      > </a
      ><a name="25672" href="one-lambda-calculus-many-times-2.html#25656" class="Bound"
      >f</a
      ><a name="25673" class="Symbol"
      >)</a
      ><a name="25674"
      >
    </a
      ><a name="25679" href="one-lambda-calculus-many-times-2.html#25592" class="Function"
      >&#10232;</a
      ><a name="25680"
      > </a
      ><a name="25681" class="Symbol"
      >(</a
      ><a name="25682" href="2016-03-20-one-lambda-calculus-many-times.html#5488" class="InductiveConstructor"
      >&#8658;e</a
      ><a name="25684"
      >  </a
      ><a name="25686" class="Symbol"
      >{</a
      ><a name="25687" class="Argument"
      >&#915;</a
      ><a name="25688"
      > </a
      ><a name="25689" class="Symbol"
      >=</a
      ><a name="25690"
      > </a
      ><a name="25691" href="one-lambda-calculus-many-times-2.html#25691" class="Bound"
      >&#915;</a
      ><a name="25692" class="Symbol"
      >}</a
      ><a name="25693"
      > </a
      ><a name="25694" href="one-lambda-calculus-many-times-2.html#25694" class="Bound"
      >f</a
      ><a name="25695"
      > </a
      ><a name="25696" href="one-lambda-calculus-many-times-2.html#25696" class="Bound"
      >g</a
      ><a name="25697" class="Symbol"
      >)</a
      ><a name="25698"
      >   </a
      ><a name="25701" class="Symbol"
      >=</a
      ><a name="25702"
      > </a
      ><a name="25703" href="one-lambda-calculus-many-times-2.html#24984" class="Function"
      >NJ.&#8709;e</a
      ><a name="25708"
      > </a
      ><a name="25709" class="Symbol"
      >(</a
      ><a name="25710" href="one-lambda-calculus-many-times-2.html#23239" class="Function"
      >NJ.c&#8314;&#8242;</a
      ><a name="25716"
      > </a
      ><a name="25717" href="one-lambda-calculus-many-times-2.html#25691" class="Bound"
      >&#915;</a
      ><a name="25718"
      > </a
      ><a name="25719" class="Symbol"
      >(</a
      ><a name="25720" href="one-lambda-calculus-many-times-2.html#24895" class="Function"
      >NJ.&#8709;i</a
      ><a name="25725"
      > </a
      ><a name="25726" class="Symbol"
      >(</a
      ><a name="25727" href="one-lambda-calculus-many-times-2.html#6970" class="InductiveConstructor"
      >&#8658;e</a
      ><a name="25729"
      > </a
      ><a name="25730" class="Symbol"
      >(</a
      ><a name="25731" href="one-lambda-calculus-many-times-2.html#25592" class="Function"
      >&#10232;</a
      ><a name="25732"
      > </a
      ><a name="25733" href="one-lambda-calculus-many-times-2.html#25694" class="Bound"
      >f</a
      ><a name="25734" class="Symbol"
      >)</a
      ><a name="25735"
      > </a
      ><a name="25736" class="Symbol"
      >(</a
      ><a name="25737" href="one-lambda-calculus-many-times-2.html#25592" class="Function"
      >&#10232;</a
      ><a name="25738"
      > </a
      ><a name="25739" href="one-lambda-calculus-many-times-2.html#25696" class="Bound"
      >g</a
      ><a name="25740" class="Symbol"
      >))))</a
      >
{% endraw %}</pre>


### Sequent Calculus with Explicit Structural Rules

$$
  \begin{array}{c}
  \frac{}{A \vdash A}{\small ax}
  \quad
  \frac{\Gamma \vdash A \quad A , \Delta \vdash B}{\Gamma, \Delta \vdash B}{\small cut}
  \\
  \\
  \frac{\Gamma \vdash A \quad B , \Delta \vdash C}{A \Rightarrow  B , \Gamma, \Delta \vdash C}{\small{\Rightarrow}\!l}
  \quad
  \frac{A , \Gamma \vdash B}{\Gamma \vdash A \Rightarrow B}{\small{\Rightarrow}\!r}
  \\
  \\
  \frac{\Gamma \vdash B}{A , \Gamma \vdash B}{\small w}
  \quad
  \frac{A , A , \Gamma \vdash B}{A , \Gamma \vdash B}{\small c}
  \quad
  \frac{\Gamma , A , B , \Delta \vdash B}{\Gamma , B , A , \Delta \vdash B}{\small p}
  \end{array}
$$

<pre class="Agda">{% raw %}
  <a name="26448" class="Keyword"
      >infix</a
      ><a name="26453"
      > </a
      ><a name="26454" class="Number"
      >3</a
      ><a name="26455"
      > LJ_

  </a
      ><a name="26463" class="Keyword"
      >data</a
      ><a name="26467"
      > </a
      ><a name="26468" href="one-lambda-calculus-many-times-2.html#26468" class="Datatype Operator"
      >LJ_</a
      ><a name="26471"
      > </a
      ><a name="26472" class="Symbol"
      >:</a
      ><a name="26473"
      > </a
      ><a name="26474" href="2016-03-20-one-lambda-calculus-many-times.html#3955" class="Datatype"
      >Sequent</a
      ><a name="26481"
      > </a
      ><a name="26482" class="Symbol"
      >&#8594;</a
      ><a name="26483"
      > </a
      ><a name="26484" class="PrimitiveType"
      >Set</a
      ><a name="26487"
      > </a
      ><a name="26488" class="Keyword"
      >where</a
      ><a name="26493"
      >
    </a
      ><a name="26498" href="one-lambda-calculus-many-times-2.html#26498" class="InductiveConstructor"
      >ax</a
      ><a name="26500"
      >  </a
      ><a name="26502" class="Symbol"
      >:</a
      ><a name="26503"
      > </a
      ><a name="26504" class="Symbol"
      >&#8704;</a
      ><a name="26505"
      > </a
      ><a name="26518" class="Symbol"
      >&#8594;</a
      ><a name="26519"
      > </a
      ><a name="26520" href="one-lambda-calculus-many-times-2.html#26468" class="Datatype Operator"
      >LJ</a
      ><a name="26522"
      > </a
      ><a name="26523" href="one-lambda-calculus-many-times-2.html#26507" class="Bound"
      >A</a
      ><a name="26524"
      > </a
      ><a name="26525" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="26526"
      > </a
      ><a name="26527" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="26529"
      > </a
      ><a name="26530" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26531"
      > </a
      ><a name="26532" href="one-lambda-calculus-many-times-2.html#26507" class="Bound"
      >A</a
      ><a name="26533"
      >
    </a
      ><a name="26538" href="one-lambda-calculus-many-times-2.html#26538" class="InductiveConstructor"
      >cut</a
      ><a name="26541"
      > </a
      ><a name="26542" class="Symbol"
      >:</a
      ><a name="26543"
      > </a
      ><a name="26544" class="Symbol"
      >&#8704;</a
      ><a name="26545"
      > </a
      ><a name="26558" class="Symbol"
      >&#8594;</a
      ><a name="26559"
      > </a
      ><a name="26560" href="one-lambda-calculus-many-times-2.html#26468" class="Datatype Operator"
      >LJ</a
      ><a name="26562"
      > </a
      ><a name="26563" href="one-lambda-calculus-many-times-2.html#26553" class="Bound"
      >&#915;</a
      ><a name="26564"
      > </a
      ><a name="26565" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26566"
      > </a
      ><a name="26567" href="one-lambda-calculus-many-times-2.html#26547" class="Bound"
      >A</a
      ><a name="26568"
      > </a
      ><a name="26569" class="Symbol"
      >&#8594;</a
      ><a name="26570"
      > </a
      ><a name="26571" href="one-lambda-calculus-many-times-2.html#26468" class="Datatype Operator"
      >LJ</a
      ><a name="26573"
      > </a
      ><a name="26574" href="one-lambda-calculus-many-times-2.html#26547" class="Bound"
      >A</a
      ><a name="26575"
      > </a
      ><a name="26576" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="26577"
      > </a
      ><a name="26578" href="one-lambda-calculus-many-times-2.html#26555" class="Bound"
      >&#916;</a
      ><a name="26579"
      > </a
      ><a name="26580" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26581"
      > </a
      ><a name="26582" href="one-lambda-calculus-many-times-2.html#26549" class="Bound"
      >B</a
      ><a name="26583"
      > </a
      ><a name="26584" class="Symbol"
      >&#8594;</a
      ><a name="26585"
      > </a
      ><a name="26586" href="one-lambda-calculus-many-times-2.html#26468" class="Datatype Operator"
      >LJ</a
      ><a name="26588"
      > </a
      ><a name="26589" href="one-lambda-calculus-many-times-2.html#26553" class="Bound"
      >&#915;</a
      ><a name="26590"
      > </a
      ><a name="26591" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="26593"
      > </a
      ><a name="26594" href="one-lambda-calculus-many-times-2.html#26555" class="Bound"
      >&#916;</a
      ><a name="26595"
      > </a
      ><a name="26596" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26597"
      > </a
      ><a name="26598" href="one-lambda-calculus-many-times-2.html#26549" class="Bound"
      >B</a
      ><a name="26599"
      >
    </a
      ><a name="26604" href="one-lambda-calculus-many-times-2.html#26604" class="InductiveConstructor"
      >&#8658;l</a
      ><a name="26606"
      >  </a
      ><a name="26608" class="Symbol"
      >:</a
      ><a name="26609"
      > </a
      ><a name="26610" class="Symbol"
      >&#8704;</a
      ><a name="26611"
      > </a
      ><a name="26624" class="Symbol"
      >&#8594;</a
      ><a name="26625"
      > </a
      ><a name="26626" href="one-lambda-calculus-many-times-2.html#26468" class="Datatype Operator"
      >LJ</a
      ><a name="26628"
      > </a
      ><a name="26629" href="one-lambda-calculus-many-times-2.html#26619" class="Bound"
      >&#915;</a
      ><a name="26630"
      > </a
      ><a name="26631" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26632"
      > </a
      ><a name="26633" href="one-lambda-calculus-many-times-2.html#26613" class="Bound"
      >A</a
      ><a name="26634"
      > </a
      ><a name="26635" class="Symbol"
      >&#8594;</a
      ><a name="26636"
      > </a
      ><a name="26637" href="one-lambda-calculus-many-times-2.html#26468" class="Datatype Operator"
      >LJ</a
      ><a name="26639"
      > </a
      ><a name="26640" href="one-lambda-calculus-many-times-2.html#26615" class="Bound"
      >B</a
      ><a name="26641"
      > </a
      ><a name="26642" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="26643"
      > </a
      ><a name="26644" href="one-lambda-calculus-many-times-2.html#26621" class="Bound"
      >&#916;</a
      ><a name="26645"
      > </a
      ><a name="26646" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26647"
      > </a
      ><a name="26648" href="one-lambda-calculus-many-times-2.html#26617" class="Bound"
      >C</a
      ><a name="26649"
      > </a
      ><a name="26650" class="Symbol"
      >&#8594;</a
      ><a name="26651"
      > </a
      ><a name="26652" href="one-lambda-calculus-many-times-2.html#26468" class="Datatype Operator"
      >LJ</a
      ><a name="26654"
      > </a
      ><a name="26655" href="one-lambda-calculus-many-times-2.html#26613" class="Bound"
      >A</a
      ><a name="26656"
      > </a
      ><a name="26657" href="2016-03-20-one-lambda-calculus-many-times.html#2692" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="26658"
      > </a
      ><a name="26659" href="one-lambda-calculus-many-times-2.html#26615" class="Bound"
      >B</a
      ><a name="26660"
      > </a
      ><a name="26661" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="26662"
      > </a
      ><a name="26663" href="one-lambda-calculus-many-times-2.html#26619" class="Bound"
      >&#915;</a
      ><a name="26664"
      > </a
      ><a name="26665" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="26667"
      > </a
      ><a name="26668" href="one-lambda-calculus-many-times-2.html#26621" class="Bound"
      >&#916;</a
      ><a name="26669"
      > </a
      ><a name="26670" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26671"
      > </a
      ><a name="26672" href="one-lambda-calculus-many-times-2.html#26617" class="Bound"
      >C</a
      ><a name="26673"
      >
    </a
      ><a name="26678" href="one-lambda-calculus-many-times-2.html#26678" class="InductiveConstructor"
      >&#8658;r</a
      ><a name="26680"
      >  </a
      ><a name="26682" class="Symbol"
      >:</a
      ><a name="26683"
      > </a
      ><a name="26684" class="Symbol"
      >&#8704;</a
      ><a name="26685"
      > </a
      ><a name="26698" class="Symbol"
      >&#8594;</a
      ><a name="26699"
      > </a
      ><a name="26700" href="one-lambda-calculus-many-times-2.html#26468" class="Datatype Operator"
      >LJ</a
      ><a name="26702"
      > </a
      ><a name="26703" href="one-lambda-calculus-many-times-2.html#26687" class="Bound"
      >A</a
      ><a name="26704"
      > </a
      ><a name="26705" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="26706"
      > </a
      ><a name="26707" href="one-lambda-calculus-many-times-2.html#26693" class="Bound"
      >&#915;</a
      ><a name="26708"
      > </a
      ><a name="26709" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26710"
      > </a
      ><a name="26711" href="one-lambda-calculus-many-times-2.html#26689" class="Bound"
      >B</a
      ><a name="26712"
      > </a
      ><a name="26713" class="Symbol"
      >&#8594;</a
      ><a name="26714"
      > </a
      ><a name="26715" href="one-lambda-calculus-many-times-2.html#26468" class="Datatype Operator"
      >LJ</a
      ><a name="26717"
      > </a
      ><a name="26718" href="one-lambda-calculus-many-times-2.html#26693" class="Bound"
      >&#915;</a
      ><a name="26719"
      > </a
      ><a name="26720" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26721"
      > </a
      ><a name="26722" href="one-lambda-calculus-many-times-2.html#26687" class="Bound"
      >A</a
      ><a name="26723"
      > </a
      ><a name="26724" href="2016-03-20-one-lambda-calculus-many-times.html#2692" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="26725"
      > </a
      ><a name="26726" href="one-lambda-calculus-many-times-2.html#26689" class="Bound"
      >B</a
      ><a name="26727"
      >
    </a
      ><a name="26732" href="one-lambda-calculus-many-times-2.html#26732" class="InductiveConstructor"
      >w</a
      ><a name="26733"
      >   </a
      ><a name="26736" class="Symbol"
      >:</a
      ><a name="26737"
      > </a
      ><a name="26738" class="Symbol"
      >&#8704;</a
      ><a name="26739"
      > </a
      ><a name="26752" class="Symbol"
      >&#8594;</a
      ><a name="26753"
      > </a
      ><a name="26754" href="one-lambda-calculus-many-times-2.html#26468" class="Datatype Operator"
      >LJ</a
      ><a name="26756"
      > </a
      ><a name="26757" href="one-lambda-calculus-many-times-2.html#26747" class="Bound"
      >&#915;</a
      ><a name="26758"
      > </a
      ><a name="26759" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26760"
      > </a
      ><a name="26761" href="one-lambda-calculus-many-times-2.html#26743" class="Bound"
      >B</a
      ><a name="26762"
      > </a
      ><a name="26763" class="Symbol"
      >&#8594;</a
      ><a name="26764"
      > </a
      ><a name="26765" href="one-lambda-calculus-many-times-2.html#26468" class="Datatype Operator"
      >LJ</a
      ><a name="26767"
      > </a
      ><a name="26768" href="one-lambda-calculus-many-times-2.html#26741" class="Bound"
      >A</a
      ><a name="26769"
      > </a
      ><a name="26770" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="26771"
      > </a
      ><a name="26772" href="one-lambda-calculus-many-times-2.html#26747" class="Bound"
      >&#915;</a
      ><a name="26773"
      > </a
      ><a name="26774" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26775"
      > </a
      ><a name="26776" href="one-lambda-calculus-many-times-2.html#26743" class="Bound"
      >B</a
      ><a name="26777"
      >
    </a
      ><a name="26782" href="one-lambda-calculus-many-times-2.html#26782" class="InductiveConstructor"
      >c</a
      ><a name="26783"
      >   </a
      ><a name="26786" class="Symbol"
      >:</a
      ><a name="26787"
      > </a
      ><a name="26788" class="Symbol"
      >&#8704;</a
      ><a name="26789"
      > </a
      ><a name="26802" class="Symbol"
      >&#8594;</a
      ><a name="26803"
      > </a
      ><a name="26804" href="one-lambda-calculus-many-times-2.html#26468" class="Datatype Operator"
      >LJ</a
      ><a name="26806"
      > </a
      ><a name="26807" href="one-lambda-calculus-many-times-2.html#26791" class="Bound"
      >A</a
      ><a name="26808"
      > </a
      ><a name="26809" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="26810"
      > </a
      ><a name="26811" href="one-lambda-calculus-many-times-2.html#26791" class="Bound"
      >A</a
      ><a name="26812"
      > </a
      ><a name="26813" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="26814"
      > </a
      ><a name="26815" href="one-lambda-calculus-many-times-2.html#26797" class="Bound"
      >&#915;</a
      ><a name="26816"
      > </a
      ><a name="26817" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26818"
      > </a
      ><a name="26819" href="one-lambda-calculus-many-times-2.html#26793" class="Bound"
      >B</a
      ><a name="26820"
      > </a
      ><a name="26821" class="Symbol"
      >&#8594;</a
      ><a name="26822"
      > </a
      ><a name="26823" href="one-lambda-calculus-many-times-2.html#26468" class="Datatype Operator"
      >LJ</a
      ><a name="26825"
      > </a
      ><a name="26826" href="one-lambda-calculus-many-times-2.html#26791" class="Bound"
      >A</a
      ><a name="26827"
      > </a
      ><a name="26828" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="26829"
      > </a
      ><a name="26830" href="one-lambda-calculus-many-times-2.html#26797" class="Bound"
      >&#915;</a
      ><a name="26831"
      > </a
      ><a name="26832" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26833"
      > </a
      ><a name="26834" href="one-lambda-calculus-many-times-2.html#26793" class="Bound"
      >B</a
      ><a name="26835"
      >
    </a
      ><a name="26840" href="one-lambda-calculus-many-times-2.html#26840" class="InductiveConstructor"
      >p</a
      ><a name="26841"
      >   </a
      ><a name="26844" class="Symbol"
      >:</a
      ><a name="26845"
      > </a
      ><a name="26846" class="Symbol"
      >&#8704;</a
      ><a name="26847"
      > </a
      ><a name="26856" class="Symbol"
      >&#8594;</a
      ><a name="26857"
      > </a
      ><a name="26858" class="Symbol"
      >&#8704;</a
      ><a name="26859"
      > </a
      ><a name="26860" href="one-lambda-calculus-many-times-2.html#26860" class="Bound"
      >&#915;</a
      ><a name="26861"
      > </a
      ><a name="26862" class="Symbol"
      >&#8594;</a
      ><a name="26863"
      > </a
      ><a name="26864" class="Symbol"
      >&#8704;</a
      ><a name="26865"
      > </a
      ><a name="26870" class="Symbol"
      >&#8594;</a
      ><a name="26871"
      > </a
      ><a name="26872" href="one-lambda-calculus-many-times-2.html#26468" class="Datatype Operator"
      >LJ</a
      ><a name="26874"
      > </a
      ><a name="26875" href="one-lambda-calculus-many-times-2.html#26860" class="Bound"
      >&#915;</a
      ><a name="26876"
      > </a
      ><a name="26877" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="26879"
      > </a
      ><a name="26880" href="one-lambda-calculus-many-times-2.html#26849" class="Bound"
      >A</a
      ><a name="26881"
      > </a
      ><a name="26882" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="26883"
      > </a
      ><a name="26884" href="one-lambda-calculus-many-times-2.html#26851" class="Bound"
      >B</a
      ><a name="26885"
      > </a
      ><a name="26886" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="26887"
      > </a
      ><a name="26888" href="one-lambda-calculus-many-times-2.html#26867" class="Bound"
      >&#916;</a
      ><a name="26889"
      > </a
      ><a name="26890" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26891"
      > </a
      ><a name="26892" href="one-lambda-calculus-many-times-2.html#26853" class="Bound"
      >C</a
      ><a name="26893"
      > </a
      ><a name="26894" class="Symbol"
      >&#8594;</a
      ><a name="26895"
      > </a
      ><a name="26896" href="one-lambda-calculus-many-times-2.html#26468" class="Datatype Operator"
      >LJ</a
      ><a name="26898"
      > </a
      ><a name="26899" href="one-lambda-calculus-many-times-2.html#26860" class="Bound"
      >&#915;</a
      ><a name="26900"
      > </a
      ><a name="26901" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="26903"
      > </a
      ><a name="26904" href="one-lambda-calculus-many-times-2.html#26851" class="Bound"
      >B</a
      ><a name="26905"
      > </a
      ><a name="26906" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="26907"
      > </a
      ><a name="26908" href="one-lambda-calculus-many-times-2.html#26849" class="Bound"
      >A</a
      ><a name="26909"
      > </a
      ><a name="26910" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="26911"
      > </a
      ><a name="26912" href="one-lambda-calculus-many-times-2.html#26867" class="Bound"
      >&#916;</a
      ><a name="26913"
      > </a
      ><a name="26914" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26915"
      > </a
      ><a name="26916" href="one-lambda-calculus-many-times-2.html#26853" class="Bound"
      >C</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
  <a name="26966" class="Keyword"
      >module</a
      ><a name="26972"
      > </a
      ><a name="26973" href="one-lambda-calculus-many-times-2.html#26973" class="Module"
      >LJ</a
      ><a name="26975"
      > </a
      ><a name="26976" class="Keyword"
      >where</a
      >
{% endraw %}</pre>
</div>


<pre class="Agda">{% raw %}
    <a name="27019" href="one-lambda-calculus-many-times-2.html#27019" class="Function"
      >&#8709;i</a
      ><a name="27021"
      > </a
      ><a name="27022" class="Symbol"
      >:</a
      ><a name="27023"
      > </a
      ><a name="27024" class="Symbol"
      >&#8704;</a
      ><a name="27025"
      > </a
      ><a name="27032" class="Symbol"
      >&#8594;</a
      ><a name="27033"
      > </a
      ><a name="27034" href="one-lambda-calculus-many-times-2.html#26468" class="Datatype Operator"
      >LJ</a
      ><a name="27036"
      > </a
      ><a name="27037" href="one-lambda-calculus-many-times-2.html#27029" class="Bound"
      >&#915;</a
      ><a name="27038"
      > </a
      ><a name="27039" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="27040"
      > </a
      ><a name="27041" href="one-lambda-calculus-many-times-2.html#27027" class="Bound"
      >A</a
      ><a name="27042"
      > </a
      ><a name="27043" class="Symbol"
      >&#8594;</a
      ><a name="27044"
      > </a
      ><a name="27045" href="one-lambda-calculus-many-times-2.html#26468" class="Datatype Operator"
      >LJ</a
      ><a name="27047"
      > </a
      ><a name="27048" href="one-lambda-calculus-many-times-2.html#27029" class="Bound"
      >&#915;</a
      ><a name="27049"
      > </a
      ><a name="27050" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="27052"
      > </a
      ><a name="27053" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="27055"
      > </a
      ><a name="27056" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="27057"
      > </a
      ><a name="27058" href="one-lambda-calculus-many-times-2.html#27027" class="Bound"
      >A</a
      ><a name="27059"
      >
    </a
      ><a name="27064" href="one-lambda-calculus-many-times-2.html#27019" class="Function"
      >&#8709;i</a
      ><a name="27066"
      > </a
      ><a name="27075" href="one-lambda-calculus-many-times-2.html#27075" class="Bound"
      >f</a
      ><a name="27076"
      > </a
      ><a name="27077" class="Keyword"
      >rewrite</a
      ><a name="27084"
      > </a
      ><a name="27085" href="one-lambda-calculus-many-times-2.html#2016" class="Function"
      >++-identity&#691;</a
      ><a name="27097"
      > </a
      ><a name="27098" href="one-lambda-calculus-many-times-2.html#27072" class="Bound"
      >&#915;</a
      ><a name="27099"
      > </a
      ><a name="27100" class="Symbol"
      >=</a
      ><a name="27101"
      > </a
      ><a name="27102" href="one-lambda-calculus-many-times-2.html#27075" class="Bound"
      >f</a
      ><a name="27103"
      >
    </a
      ><a name="27108" href="one-lambda-calculus-many-times-2.html#27108" class="Function"
      >&#8709;e</a
      ><a name="27110"
      > </a
      ><a name="27111" class="Symbol"
      >:</a
      ><a name="27112"
      > </a
      ><a name="27113" class="Symbol"
      >&#8704;</a
      ><a name="27114"
      > </a
      ><a name="27121" class="Symbol"
      >&#8594;</a
      ><a name="27122"
      > </a
      ><a name="27123" href="one-lambda-calculus-many-times-2.html#26468" class="Datatype Operator"
      >LJ</a
      ><a name="27125"
      > </a
      ><a name="27126" href="one-lambda-calculus-many-times-2.html#27118" class="Bound"
      >&#915;</a
      ><a name="27127"
      > </a
      ><a name="27128" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="27130"
      > </a
      ><a name="27131" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="27133"
      > </a
      ><a name="27134" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="27135"
      > </a
      ><a name="27136" href="one-lambda-calculus-many-times-2.html#27116" class="Bound"
      >A</a
      ><a name="27137"
      > </a
      ><a name="27138" class="Symbol"
      >&#8594;</a
      ><a name="27139"
      > </a
      ><a name="27140" href="one-lambda-calculus-many-times-2.html#26468" class="Datatype Operator"
      >LJ</a
      ><a name="27142"
      > </a
      ><a name="27143" href="one-lambda-calculus-many-times-2.html#27118" class="Bound"
      >&#915;</a
      ><a name="27144"
      > </a
      ><a name="27145" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="27146"
      > </a
      ><a name="27147" href="one-lambda-calculus-many-times-2.html#27116" class="Bound"
      >A</a
      ><a name="27148"
      >
    </a
      ><a name="27153" href="one-lambda-calculus-many-times-2.html#27108" class="Function"
      >&#8709;e</a
      ><a name="27155"
      > </a
      ><a name="27164" href="one-lambda-calculus-many-times-2.html#27164" class="Bound"
      >f</a
      ><a name="27165"
      > </a
      ><a name="27166" class="Keyword"
      >rewrite</a
      ><a name="27173"
      > </a
      ><a name="27174" href="one-lambda-calculus-many-times-2.html#2016" class="Function"
      >++-identity&#691;</a
      ><a name="27186"
      > </a
      ><a name="27187" href="one-lambda-calculus-many-times-2.html#27161" class="Bound"
      >&#915;</a
      ><a name="27188"
      > </a
      ><a name="27189" class="Symbol"
      >=</a
      ><a name="27190"
      > </a
      ><a name="27191" href="one-lambda-calculus-many-times-2.html#27164" class="Bound"
      >f</a
      >
{% endraw %}</pre>

<pre class="Agda">{% raw %}
  <a name="27768" class="Keyword"
      >module</a
      ><a name="27774"
      > </a
      ><a name="27775" href="one-lambda-calculus-many-times-2.html#27775" class="Module"
      >LJ&#8660;SC</a
      ><a name="27780"
      > </a
      ><a name="27781" class="Keyword"
      >where</a
      ><a name="27786"
      >

    </a
      ><a name="27792" href="one-lambda-calculus-many-times-2.html#27792" class="Function"
      >&#10233;</a
      ><a name="27793"
      > </a
      ><a name="27794" class="Symbol"
      >:</a
      ><a name="27795"
      > </a
      ><a name="27796" class="Symbol"
      >&#8704;</a
      ><a name="27797"
      > </a
      ><a name="27802" class="Symbol"
      >&#8594;</a
      ><a name="27803"
      > </a
      ><a name="27804" href="one-lambda-calculus-many-times-2.html#26468" class="Datatype Operator"
      >LJ</a
      ><a name="27806"
      > </a
      ><a name="27807" href="one-lambda-calculus-many-times-2.html#27799" class="Bound"
      >S</a
      ><a name="27808"
      > </a
      ><a name="27809" class="Symbol"
      >&#8594;</a
      ><a name="27810"
      > </a
      ><a name="27811" href="2016-03-20-one-lambda-calculus-many-times.html#9785" class="Datatype Operator"
      >SC</a
      ><a name="27813"
      > </a
      ><a name="27814" href="one-lambda-calculus-many-times-2.html#27799" class="Bound"
      >S</a
      ><a name="27815"
      >
    </a
      ><a name="27820" href="one-lambda-calculus-many-times-2.html#27792" class="Function"
      >&#10233;</a
      ><a name="27821"
      > </a
      ><a name="27822" href="one-lambda-calculus-many-times-2.html#27822" class="Bound"
      >f</a
      ><a name="27823"
      > </a
      ><a name="27824" class="Symbol"
      >=</a
      ><a name="27825"
      > </a
      ><a name="27826" href="2016-03-20-one-lambda-calculus-many-times.html#10584" class="Function"
      >ND&#8660;SC.&#10233;</a
      ><a name="27833"
      > </a
      ><a name="27834" class="Symbol"
      >(</a
      ><a name="27835" href="one-lambda-calculus-many-times-2.html#25166" class="Function"
      >NJ&#8660;ND.&#10233;</a
      ><a name="27842"
      > </a
      ><a name="27843" class="Symbol"
      >(</a
      ><a name="27844" href="one-lambda-calculus-many-times-2.html#27244" class="Function"
      >LJ&#8660;NJ.&#10233;</a
      ><a name="27851"
      > </a
      ><a name="27852" href="one-lambda-calculus-many-times-2.html#27822" class="Bound"
      >f</a
      ><a name="27853" class="Symbol"
      >))</a
      ><a name="27855"
      >

    </a
      ><a name="27861" href="one-lambda-calculus-many-times-2.html#27861" class="Function"
      >&#10232;</a
      ><a name="27862"
      > </a
      ><a name="27863" class="Symbol"
      >:</a
      ><a name="27864"
      > </a
      ><a name="27865" class="Symbol"
      >&#8704;</a
      ><a name="27866"
      > </a
      ><a name="27871" class="Symbol"
      >&#8594;</a
      ><a name="27872"
      > </a
      ><a name="27873" href="2016-03-20-one-lambda-calculus-many-times.html#9785" class="Datatype Operator"
      >SC</a
      ><a name="27875"
      > </a
      ><a name="27876" href="one-lambda-calculus-many-times-2.html#27868" class="Bound"
      >S</a
      ><a name="27877"
      > </a
      ><a name="27878" class="Symbol"
      >&#8594;</a
      ><a name="27879"
      > </a
      ><a name="27880" href="one-lambda-calculus-many-times-2.html#26468" class="Datatype Operator"
      >LJ</a
      ><a name="27882"
      > </a
      ><a name="27883" href="one-lambda-calculus-many-times-2.html#27868" class="Bound"
      >S</a
      ><a name="27884"
      >
    </a
      ><a name="27889" href="one-lambda-calculus-many-times-2.html#27861" class="Function"
      >&#10232;</a
      ><a name="27890"
      > </a
      ><a name="27891" href="one-lambda-calculus-many-times-2.html#27891" class="Bound"
      >f</a
      ><a name="27892"
      > </a
      ><a name="27893" class="Symbol"
      >=</a
      ><a name="27894"
      > </a
      ><a name="27895" href="one-lambda-calculus-many-times-2.html#27534" class="Function"
      >LJ&#8660;NJ.&#10232;</a
      ><a name="27902"
      > </a
      ><a name="27903" class="Symbol"
      >(</a
      ><a name="27904" href="one-lambda-calculus-many-times-2.html#25592" class="Function"
      >NJ&#8660;ND.&#10232;</a
      ><a name="27911"
      > </a
      ><a name="27912" class="Symbol"
      >(</a
      ><a name="27913" href="2016-03-20-one-lambda-calculus-many-times.html#10707" class="Function"
      >ND&#8660;SC.&#10232;</a
      ><a name="27920"
      > </a
      ><a name="27921" href="one-lambda-calculus-many-times-2.html#27891" class="Bound"
      >f</a
      ><a name="27922" class="Symbol"
      >))</a
      >
{% endraw %}</pre>

<pre class="Agda">{% raw %}
<a name="28683" class="Comment"
      >-- -}</a
      ><a name="28688"
      >
</a
      ><a name="28689" class="Comment"
      >-- -}</a
      ><a name="28694"
      >
</a
      ><a name="28695" class="Comment"
      >-- -}</a
      ><a name="28700"
      >
</a
      ><a name="28701" class="Comment"
      >-- -}</a
      ><a name="28706"
      >
</a
      ><a name="28707" class="Comment"
      >-- -}</a
      >
{% endraw %}</pre>


$$
  \begin{array}{ccccc}
  NJ           & \leftrightarrow & ND           & \rightarrow & Agda \\
  \\
  \updownarrow &                 & \updownarrow &             &      \\
  \\
  LJ           & \leftrightarrow & SC           &             &
  \end{array}
$$

---

[^minproplog]: Or, alternatively, as axiomatisations of minimal propositional logic.

[^admit]: As used here, *admit* or *admissible* is a technical term, usually contrasted with *derivable*. Derivable rules are rules that we can construct directly, without inspecting the proofs that we're given as arguments. On the other hand, admissible means that we can define these rules, but that we have to inspect and rewrite the proofs we're given.

<div class="hidden">
</div>
