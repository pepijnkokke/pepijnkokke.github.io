---
title         : One λ-calculus, many times... (2)
date          : 2016-10-30 12:00:00
categories    : [compsci]
tags          : [draft, agda]
hide-implicit : true
extra-script  : agda-extra-script.html
extra-style   : agda-extra-style.html
---

This post is a continuation of *[One λ-calculus, many times...]({% post_url 2016-03-20-one-lambda-calculus-many-times %})*, in which I explored the use of natural deduction and sequent calculus systems as type systems for the simply-typed lambda calculus.[^minproplog] In this post, I will have a look at the variants of these systems which have explicit structural rules: Gentzen's NJ and LJ.

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="679" class="Keyword"
      >import</a
      ><a name="685"
      > </a
      ><a name="686" href="2016-03-20-one-lambda-calculus-many-times.html#1" class="Module"
      >2016-03-20-one-lambda-calculus-many-times</a
      ><a name="727"
      > </a
      ><a name="728" class="Symbol"
      >as</a
      ><a name="730"
      > </a
      ><a name="731" class="Module"
      >Part1</a
      ><a name="736"
      >
</a
      ><a name="737" class="Keyword"
      >module</a
      ><a name="743"
      > </a
      ><a name="744" href="2016-10-30-one-lambda-calculus-many-times-2.html#1" class="Module"
      >2016-10-30-one-lambda-calculus-many-times-2</a
      ><a name="787"
      > </a
      ><a name="788" class="Keyword"
      >where</a
      >
{% endraw %}</pre>
</div>

The structure of this post will be similar to that of the previous installment---which means that we will start out by having a look at the syntax of NJ, then have a look at its semantics and relation to the system ND we discussed last time, and finally we will do the same for LJ. But first, the syntax:

<pre class="Agda">{% raw %}
<a name="1132" class="Keyword"
      >module</a
      ><a name="1138"
      > </a
      ><a name="1139" href="2016-10-30-one-lambda-calculus-many-times-2.html#1139" class="Module"
      >Syntax</a
      ><a name="1145"
      > </a
      ><a name="1146" class="Symbol"
      >(</a
      ><a name="1147" href="2016-10-30-one-lambda-calculus-many-times-2.html#1147" class="Bound"
      >Atom</a
      ><a name="1151"
      > </a
      ><a name="1152" class="Symbol"
      >:</a
      ><a name="1153"
      > </a
      ><a name="1154" class="PrimitiveType"
      >Set</a
      ><a name="1157" class="Symbol"
      >)</a
      ><a name="1158"
      > </a
      ><a name="1159" class="Keyword"
      >where</a
      >
{% endraw %}</pre>

We can reuse our notions of types and sequents from the previous post:

<div class="hidden">
<pre class="Agda">{% raw %}
  <a name="1285" class="Keyword"
      >open</a
      ><a name="1289"
      > </a
      ><a name="1290" href="2016-03-20-one-lambda-calculus-many-times.html#1219" class="Module"
      >Part1.</a
      ><a name="1296" href="2016-03-20-one-lambda-calculus-many-times.html#1566" class="Module"
      >Syntax</a
      ><a name="1302"
      > </a
      ><a name="1303" href="2016-10-30-one-lambda-calculus-many-times-2.html#1147" class="Bound"
      >Atom</a
      ><a name="1307"
      > </a
      ><a name="1308" class="Keyword"
      >hiding</a
      ><a name="1314"
      > </a
      ><a name="1315" class="Symbol"
      >(</a
      ><a name="1316"
      >w&#8242;</a
      ><a name="1318" class="Symbol"
      >)</a
      ><a name="1319"
      >
  </a
      ><a name="1322" class="Keyword"
      >open</a
      ><a name="1326"
      > </a
      ><a name="1327" class="Keyword"
      >import</a
      ><a name="1333"
      > </a
      ><a name="1334" href="https://agda.github.io/agda-stdlib/Algebra.html#1" class="Module"
      >Algebra</a
      ><a name="1341"
      >                 </a
      ><a name="1358" class="Keyword"
      >using</a
      ><a name="1363"
      > </a
      ><a name="1364" class="Symbol"
      >(</a
      ><a name="1365" class="Keyword"
      >module</a
      ><a name="1371"
      > </a
      ><a name="1372" href="https://agda.github.io/agda-stdlib/Algebra.html#309" class="Module"
      >Monoid</a
      ><a name="1378" class="Symbol"
      >)</a
      ><a name="1379"
      >
  </a
      ><a name="1382" class="Keyword"
      >open</a
      ><a name="1386"
      > </a
      ><a name="1387" class="Keyword"
      >import</a
      ><a name="1393"
      > </a
      ><a name="1394" href="https://agda.github.io/agda-stdlib/Data.Nat.html#1" class="Module"
      >Data.Nat</a
      ><a name="1402"
      >                </a
      ><a name="1418" class="Keyword"
      >using</a
      ><a name="1423"
      > </a
      ><a name="1424" class="Symbol"
      >(</a
      ><a name="1425" href="Agda.Builtin.Nat.html#69" class="Datatype"
      >&#8469;</a
      ><a name="1426" class="Symbol"
      >;</a
      ><a name="1427"
      > </a
      ><a name="1428" href="Agda.Builtin.Nat.html#100" class="InductiveConstructor"
      >suc</a
      ><a name="1431" class="Symbol"
      >;</a
      ><a name="1432"
      > </a
      ><a name="1433" href="Agda.Builtin.Nat.html#87" class="InductiveConstructor"
      >zero</a
      ><a name="1437" class="Symbol"
      >)</a
      ><a name="1438"
      >
  </a
      ><a name="1441" class="Keyword"
      >open</a
      ><a name="1445"
      > </a
      ><a name="1446" class="Keyword"
      >import</a
      ><a name="1452"
      > </a
      ><a name="1453" href="https://agda.github.io/agda-stdlib/Data.Fin.html#1" class="Module"
      >Data.Fin</a
      ><a name="1461"
      >                </a
      ><a name="1477" class="Keyword"
      >using</a
      ><a name="1482"
      > </a
      ><a name="1483" class="Symbol"
      >(</a
      ><a name="1484" href="https://agda.github.io/agda-stdlib/Data.Fin.html#842" class="Datatype"
      >Fin</a
      ><a name="1487" class="Symbol"
      >;</a
      ><a name="1488"
      > </a
      ><a name="1489" href="https://agda.github.io/agda-stdlib/Data.Fin.html#895" class="InductiveConstructor"
      >suc</a
      ><a name="1492" class="Symbol"
      >;</a
      ><a name="1493"
      > </a
      ><a name="1494" href="https://agda.github.io/agda-stdlib/Data.Fin.html#864" class="InductiveConstructor"
      >zero</a
      ><a name="1498" class="Symbol"
      >)</a
      ><a name="1499"
      >
  </a
      ><a name="1502" class="Keyword"
      >open</a
      ><a name="1506"
      > </a
      ><a name="1507" class="Keyword"
      >import</a
      ><a name="1513"
      > </a
      ><a name="1514" href="https://agda.github.io/agda-stdlib/Data.List.html#1" class="Module"
      >Data.List</a
      ><a name="1523"
      >               </a
      ><a name="1538" class="Keyword"
      >using</a
      ><a name="1543"
      > </a
      ><a name="1544" class="Symbol"
      >(</a
      ><a name="1545" href="Agda.Builtin.List.html#52" class="Datatype"
      >List</a
      ><a name="1549" class="Symbol"
      >;</a
      ><a name="1550"
      > </a
      ><a name="1551" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >_&#8759;_</a
      ><a name="1554" class="Symbol"
      >;</a
      ><a name="1555"
      > </a
      ><a name="1556" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#5519" class="InductiveConstructor"
      >[]</a
      ><a name="1558" class="Symbol"
      >;</a
      ><a name="1559"
      > </a
      ><a name="1560" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >_++_</a
      ><a name="1564" class="Symbol"
      >)</a
      ><a name="1565"
      >
  </a
      ><a name="1568" class="Keyword"
      >open</a
      ><a name="1572"
      > </a
      ><a name="1573" class="Keyword"
      >import</a
      ><a name="1579"
      > </a
      ><a name="1580" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1" class="Module"
      >Data.List.Any</a
      ><a name="1593"
      >           </a
      ><a name="1604" class="Keyword"
      >using</a
      ><a name="1609"
      > </a
      ><a name="1610" class="Symbol"
      >(</a
      ><a name="1611" class="Keyword"
      >module</a
      ><a name="1617"
      > </a
      ><a name="1618" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#250" class="Module"
      >Membership</a
      ><a name="1628" class="Symbol"
      >;</a
      ><a name="1629"
      > </a
      ><a name="1630" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="1634" class="Symbol"
      >;</a
      ><a name="1635"
      > </a
      ><a name="1636" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="1641" class="Symbol"
      >)</a
      ><a name="1642"
      >
  </a
      ><a name="1645" class="Keyword"
      >open</a
      ><a name="1649"
      > </a
      ><a name="1650" class="Keyword"
      >import</a
      ><a name="1656"
      > </a
      ><a name="1657" href="https://agda.github.io/agda-stdlib/Data.Product.html#1" class="Module"
      >Data.Product</a
      ><a name="1669"
      >            </a
      ><a name="1681" class="Keyword"
      >using</a
      ><a name="1686"
      > </a
      ><a name="1687" class="Symbol"
      >(</a
      ><a name="1688" href="https://agda.github.io/agda-stdlib/Data.Product.html#525" class="Field"
      >proj&#8321;</a
      ><a name="1693" class="Symbol"
      >;</a
      ><a name="1694"
      > </a
      ><a name="1695" href="https://agda.github.io/agda-stdlib/Data.Product.html#539" class="Field"
      >proj&#8322;</a
      ><a name="1700" class="Symbol"
      >)</a
      ><a name="1701"
      >
  </a
      ><a name="1704" class="Keyword"
      >open</a
      ><a name="1708"
      > </a
      ><a name="1709" class="Keyword"
      >import</a
      ><a name="1715"
      > </a
      ><a name="1716" href="https://agda.github.io/agda-stdlib/Function.html#1" class="Module"
      >Function</a
      ><a name="1724"
      >                </a
      ><a name="1740" class="Keyword"
      >using</a
      ><a name="1745"
      > </a
      ><a name="1746" class="Symbol"
      >(</a
      ><a name="1747" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >_$_</a
      ><a name="1750" class="Symbol"
      >)</a
      ><a name="1751"
      >
  </a
      ><a name="1754" class="Keyword"
      >open</a
      ><a name="1758"
      > </a
      ><a name="1759" class="Keyword"
      >import</a
      ><a name="1765"
      > </a
      ><a name="1766" href="https://agda.github.io/agda-stdlib/Function.Equivalence.html#1" class="Module"
      >Function.Equivalence</a
      ><a name="1786"
      >    </a
      ><a name="1790" class="Keyword"
      >using</a
      ><a name="1795"
      > </a
      ><a name="1796" class="Symbol"
      >(</a
      ><a name="1797" href="https://agda.github.io/agda-stdlib/Function.Equivalence.html#711" class="Function Operator"
      >_&#8660;_</a
      ><a name="1800" class="Symbol"
      >;</a
      ><a name="1801"
      > </a
      ><a name="1802" href="https://agda.github.io/agda-stdlib/Function.Equivalence.html#2131" class="Function"
      >id</a
      ><a name="1804" class="Symbol"
      >;</a
      ><a name="1805"
      > </a
      ><a name="1806" href="https://agda.github.io/agda-stdlib/Function.Equivalence.html#1070" class="Function"
      >map</a
      ><a name="1809" class="Symbol"
      >;</a
      ><a name="1810"
      > </a
      ><a name="1811" href="https://agda.github.io/agda-stdlib/Function.Equivalence.html#804" class="Function"
      >equivalence</a
      ><a name="1822" class="Symbol"
      >)</a
      ><a name="1823"
      >
  </a
      ><a name="1826" class="Keyword"
      >open</a
      ><a name="1830"
      > </a
      ><a name="1831" class="Keyword"
      >import</a
      ><a name="1837"
      > </a
      ><a name="1838" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.html#1" class="Module"
      >Relation.Binary.PropositionalEquality</a
      ><a name="1875"
      >
  </a
      ><a name="1878" class="Keyword"
      >open</a
      ><a name="1882"
      > </a
      ><a name="1883" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#2298" class="Module"
      >Membership</a
      ><a name="1893"
      > </a
      ><a name="1894" class="Symbol"
      >(</a
      ><a name="1895" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.html#1526" class="Function"
      >setoid</a
      ><a name="1901"
      > </a
      ><a name="1902" href="2016-03-20-one-lambda-calculus-many-times.html#2649" class="Datatype"
      >Type</a
      ><a name="1906" class="Symbol"
      >)</a
      ><a name="1907"
      >       </a
      ><a name="1914" class="Keyword"
      >using</a
      ><a name="1919"
      > </a
      ><a name="1920" class="Symbol"
      >(</a
      ><a name="1921"
      >_&#8712;_</a
      ><a name="1924" class="Symbol"
      >;</a
      ><a name="1925"
      > _&#8838;_</a
      ><a name="1929" class="Symbol"
      >)</a
      ><a name="1930"
      >
  </a
      ><a name="1933" class="Keyword"
      >open</a
      ><a name="1937"
      > </a
      ><a name="1938" href="https://agda.github.io/agda-stdlib/Algebra.html#1154" class="Module"
      >Monoid</a
      ><a name="1944"
      > </a
      ><a name="1945" class="Symbol"
      >(</a
      ><a name="1946" href="https://agda.github.io/agda-stdlib/Data.List.html#846" class="Function"
      >Data.List.monoid</a
      ><a name="1962"
      > </a
      ><a name="1963" href="2016-03-20-one-lambda-calculus-many-times.html#2649" class="Datatype"
      >Type</a
      ><a name="1967" class="Symbol"
      >)</a
      ><a name="1968"
      > </a
      ><a name="1969" class="Keyword"
      >using</a
      ><a name="1974"
      > </a
      ><a name="1975" class="Symbol"
      >()</a
      ><a name="1977"
      > </a
      ><a name="1978" class="Keyword"
      >renaming</a
      ><a name="1986"
      > </a
      ><a name="1987" class="Symbol"
      >(</a
      ><a name="1988"
      >identity </a
      ><a name="1997" class="Symbol"
      >to</a
      ><a name="1999"
      > ++-identity</a
      ><a name="2011" class="Symbol"
      >;</a
      ><a name="2012"
      > assoc </a
      ><a name="2019" class="Symbol"
      >to</a
      ><a name="2021"
      > ++-assoc</a
      ><a name="2030" class="Symbol"
      >)</a
      ><a name="2031"
      >
  </a
      ><a name="2034" href="2016-10-30-one-lambda-calculus-many-times-2.html#2034" class="Function"
      >++-identity&#691;</a
      ><a name="2046"
      > </a
      ><a name="2047" class="Symbol"
      >=</a
      ><a name="2048"
      > </a
      ><a name="2049" href="https://agda.github.io/agda-stdlib/Data.Product.html#539" class="Field"
      >proj&#8322;</a
      ><a name="2054"
      > </a
      ><a name="2055" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#1106" class="Function"
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
  <a name="6846" class="Keyword"
      >infix</a
      ><a name="6851"
      > </a
      ><a name="6852" class="Number"
      >3</a
      ><a name="6853"
      > NJ_

  </a
      ><a name="6861" class="Keyword"
      >data</a
      ><a name="6865"
      > </a
      ><a name="6866" href="2016-10-30-one-lambda-calculus-many-times-2.html#6866" class="Datatype Operator"
      >NJ_</a
      ><a name="6869"
      > </a
      ><a name="6870" class="Symbol"
      >:</a
      ><a name="6871"
      > </a
      ><a name="6872" href="2016-03-20-one-lambda-calculus-many-times.html#3955" class="Datatype"
      >Sequent</a
      ><a name="6879"
      > </a
      ><a name="6880" class="Symbol"
      >&#8594;</a
      ><a name="6881"
      > </a
      ><a name="6882" class="PrimitiveType"
      >Set</a
      ><a name="6885"
      > </a
      ><a name="6886" class="Keyword"
      >where</a
      ><a name="6891"
      >
    </a
      ><a name="6896" href="2016-10-30-one-lambda-calculus-many-times-2.html#6896" class="InductiveConstructor"
      >ax</a
      ><a name="6898"
      > </a
      ><a name="6899" class="Symbol"
      >:</a
      ><a name="6900"
      > </a
      ><a name="6901" class="Symbol"
      >&#8704;</a
      ><a name="6902"
      > </a
      ><a name="6915" class="Symbol"
      >&#8594;</a
      ><a name="6916"
      > </a
      ><a name="6917" href="2016-10-30-one-lambda-calculus-many-times-2.html#6866" class="Datatype Operator"
      >NJ</a
      ><a name="6919"
      > </a
      ><a name="6920" href="2016-10-30-one-lambda-calculus-many-times-2.html#6904" class="Bound"
      >A</a
      ><a name="6921"
      > </a
      ><a name="6922" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="6923"
      > </a
      ><a name="6924" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="6926"
      > </a
      ><a name="6927" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="6928"
      > </a
      ><a name="6929" href="2016-10-30-one-lambda-calculus-many-times-2.html#6904" class="Bound"
      >A</a
      ><a name="6930"
      >
    </a
      ><a name="6935" href="2016-10-30-one-lambda-calculus-many-times-2.html#6935" class="InductiveConstructor"
      >&#8658;i</a
      ><a name="6937"
      > </a
      ><a name="6938" class="Symbol"
      >:</a
      ><a name="6939"
      > </a
      ><a name="6940" class="Symbol"
      >&#8704;</a
      ><a name="6941"
      > </a
      ><a name="6954" class="Symbol"
      >&#8594;</a
      ><a name="6955"
      > </a
      ><a name="6956" href="2016-10-30-one-lambda-calculus-many-times-2.html#6866" class="Datatype Operator"
      >NJ</a
      ><a name="6958"
      > </a
      ><a name="6959" href="2016-10-30-one-lambda-calculus-many-times-2.html#6943" class="Bound"
      >A</a
      ><a name="6960"
      > </a
      ><a name="6961" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="6962"
      > </a
      ><a name="6963" href="2016-10-30-one-lambda-calculus-many-times-2.html#6949" class="Bound"
      >&#915;</a
      ><a name="6964"
      > </a
      ><a name="6965" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="6966"
      > </a
      ><a name="6967" href="2016-10-30-one-lambda-calculus-many-times-2.html#6945" class="Bound"
      >B</a
      ><a name="6968"
      > </a
      ><a name="6969" class="Symbol"
      >&#8594;</a
      ><a name="6970"
      > </a
      ><a name="6971" href="2016-10-30-one-lambda-calculus-many-times-2.html#6866" class="Datatype Operator"
      >NJ</a
      ><a name="6973"
      > </a
      ><a name="6974" href="2016-10-30-one-lambda-calculus-many-times-2.html#6949" class="Bound"
      >&#915;</a
      ><a name="6975"
      > </a
      ><a name="6976" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="6977"
      > </a
      ><a name="6978" href="2016-10-30-one-lambda-calculus-many-times-2.html#6943" class="Bound"
      >A</a
      ><a name="6979"
      > </a
      ><a name="6980" href="2016-03-20-one-lambda-calculus-many-times.html#2692" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="6981"
      > </a
      ><a name="6982" href="2016-10-30-one-lambda-calculus-many-times-2.html#6945" class="Bound"
      >B</a
      ><a name="6983"
      >
    </a
      ><a name="6988" href="2016-10-30-one-lambda-calculus-many-times-2.html#6988" class="InductiveConstructor"
      >&#8658;e</a
      ><a name="6990"
      > </a
      ><a name="6991" class="Symbol"
      >:</a
      ><a name="6992"
      > </a
      ><a name="6993" class="Symbol"
      >&#8704;</a
      ><a name="6994"
      > </a
      ><a name="7007" class="Symbol"
      >&#8594;</a
      ><a name="7008"
      > </a
      ><a name="7009" href="2016-10-30-one-lambda-calculus-many-times-2.html#6866" class="Datatype Operator"
      >NJ</a
      ><a name="7011"
      > </a
      ><a name="7012" href="2016-10-30-one-lambda-calculus-many-times-2.html#7002" class="Bound"
      >&#915;</a
      ><a name="7013"
      > </a
      ><a name="7014" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="7015"
      > </a
      ><a name="7016" href="2016-10-30-one-lambda-calculus-many-times-2.html#6996" class="Bound"
      >A</a
      ><a name="7017"
      > </a
      ><a name="7018" href="2016-03-20-one-lambda-calculus-many-times.html#2692" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="7019"
      > </a
      ><a name="7020" href="2016-10-30-one-lambda-calculus-many-times-2.html#6998" class="Bound"
      >B</a
      ><a name="7021"
      > </a
      ><a name="7022" class="Symbol"
      >&#8594;</a
      ><a name="7023"
      > </a
      ><a name="7024" href="2016-10-30-one-lambda-calculus-many-times-2.html#6866" class="Datatype Operator"
      >NJ</a
      ><a name="7026"
      > </a
      ><a name="7027" href="2016-10-30-one-lambda-calculus-many-times-2.html#7004" class="Bound"
      >&#916;</a
      ><a name="7028"
      > </a
      ><a name="7029" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="7030"
      > </a
      ><a name="7031" href="2016-10-30-one-lambda-calculus-many-times-2.html#6996" class="Bound"
      >A</a
      ><a name="7032"
      > </a
      ><a name="7033" class="Symbol"
      >&#8594;</a
      ><a name="7034"
      > </a
      ><a name="7035" href="2016-10-30-one-lambda-calculus-many-times-2.html#6866" class="Datatype Operator"
      >NJ</a
      ><a name="7037"
      > </a
      ><a name="7038" href="2016-10-30-one-lambda-calculus-many-times-2.html#7002" class="Bound"
      >&#915;</a
      ><a name="7039"
      > </a
      ><a name="7040" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="7042"
      > </a
      ><a name="7043" href="2016-10-30-one-lambda-calculus-many-times-2.html#7004" class="Bound"
      >&#916;</a
      ><a name="7044"
      > </a
      ><a name="7045" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="7046"
      > </a
      ><a name="7047" href="2016-10-30-one-lambda-calculus-many-times-2.html#6998" class="Bound"
      >B</a
      ><a name="7048"
      >
    </a
      ><a name="7053" href="2016-10-30-one-lambda-calculus-many-times-2.html#7053" class="InductiveConstructor"
      >w</a
      ><a name="7054"
      >  </a
      ><a name="7056" class="Symbol"
      >:</a
      ><a name="7057"
      > </a
      ><a name="7058" class="Symbol"
      >&#8704;</a
      ><a name="7059"
      > </a
      ><a name="7072" class="Symbol"
      >&#8594;</a
      ><a name="7073"
      > </a
      ><a name="7074" href="2016-10-30-one-lambda-calculus-many-times-2.html#6866" class="Datatype Operator"
      >NJ</a
      ><a name="7076"
      > </a
      ><a name="7077" href="2016-10-30-one-lambda-calculus-many-times-2.html#7067" class="Bound"
      >&#915;</a
      ><a name="7078"
      > </a
      ><a name="7079" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="7080"
      > </a
      ><a name="7081" href="2016-10-30-one-lambda-calculus-many-times-2.html#7063" class="Bound"
      >B</a
      ><a name="7082"
      > </a
      ><a name="7083" class="Symbol"
      >&#8594;</a
      ><a name="7084"
      > </a
      ><a name="7085" href="2016-10-30-one-lambda-calculus-many-times-2.html#6866" class="Datatype Operator"
      >NJ</a
      ><a name="7087"
      > </a
      ><a name="7088" href="2016-10-30-one-lambda-calculus-many-times-2.html#7061" class="Bound"
      >A</a
      ><a name="7089"
      > </a
      ><a name="7090" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="7091"
      > </a
      ><a name="7092" href="2016-10-30-one-lambda-calculus-many-times-2.html#7067" class="Bound"
      >&#915;</a
      ><a name="7093"
      > </a
      ><a name="7094" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="7095"
      > </a
      ><a name="7096" href="2016-10-30-one-lambda-calculus-many-times-2.html#7063" class="Bound"
      >B</a
      ><a name="7097"
      >
    </a
      ><a name="7102" href="2016-10-30-one-lambda-calculus-many-times-2.html#7102" class="InductiveConstructor"
      >c</a
      ><a name="7103"
      >  </a
      ><a name="7105" class="Symbol"
      >:</a
      ><a name="7106"
      > </a
      ><a name="7107" class="Symbol"
      >&#8704;</a
      ><a name="7108"
      > </a
      ><a name="7121" class="Symbol"
      >&#8594;</a
      ><a name="7122"
      > </a
      ><a name="7123" href="2016-10-30-one-lambda-calculus-many-times-2.html#6866" class="Datatype Operator"
      >NJ</a
      ><a name="7125"
      > </a
      ><a name="7126" href="2016-10-30-one-lambda-calculus-many-times-2.html#7110" class="Bound"
      >A</a
      ><a name="7127"
      > </a
      ><a name="7128" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="7129"
      > </a
      ><a name="7130" href="2016-10-30-one-lambda-calculus-many-times-2.html#7110" class="Bound"
      >A</a
      ><a name="7131"
      > </a
      ><a name="7132" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="7133"
      > </a
      ><a name="7134" href="2016-10-30-one-lambda-calculus-many-times-2.html#7116" class="Bound"
      >&#915;</a
      ><a name="7135"
      > </a
      ><a name="7136" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="7137"
      > </a
      ><a name="7138" href="2016-10-30-one-lambda-calculus-many-times-2.html#7112" class="Bound"
      >B</a
      ><a name="7139"
      > </a
      ><a name="7140" class="Symbol"
      >&#8594;</a
      ><a name="7141"
      > </a
      ><a name="7142" href="2016-10-30-one-lambda-calculus-many-times-2.html#6866" class="Datatype Operator"
      >NJ</a
      ><a name="7144"
      > </a
      ><a name="7145" href="2016-10-30-one-lambda-calculus-many-times-2.html#7110" class="Bound"
      >A</a
      ><a name="7146"
      > </a
      ><a name="7147" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="7148"
      > </a
      ><a name="7149" href="2016-10-30-one-lambda-calculus-many-times-2.html#7116" class="Bound"
      >&#915;</a
      ><a name="7150"
      > </a
      ><a name="7151" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="7152"
      > </a
      ><a name="7153" href="2016-10-30-one-lambda-calculus-many-times-2.html#7112" class="Bound"
      >B</a
      ><a name="7154"
      >
    </a
      ><a name="7159" href="2016-10-30-one-lambda-calculus-many-times-2.html#7159" class="InductiveConstructor"
      >p</a
      ><a name="7160"
      >  </a
      ><a name="7162" class="Symbol"
      >:</a
      ><a name="7163"
      > </a
      ><a name="7164" class="Symbol"
      >&#8704;</a
      ><a name="7165"
      > </a
      ><a name="7174" class="Symbol"
      >&#8594;</a
      ><a name="7175"
      > </a
      ><a name="7176" class="Symbol"
      >&#8704;</a
      ><a name="7177"
      > </a
      ><a name="7178" href="2016-10-30-one-lambda-calculus-many-times-2.html#7178" class="Bound"
      >&#915;</a
      ><a name="7179"
      > </a
      ><a name="7180" class="Symbol"
      >&#8594;</a
      ><a name="7181"
      > </a
      ><a name="7182" class="Symbol"
      >&#8704;</a
      ><a name="7183"
      > </a
      ><a name="7188" class="Symbol"
      >&#8594;</a
      ><a name="7189"
      > </a
      ><a name="7190" href="2016-10-30-one-lambda-calculus-many-times-2.html#6866" class="Datatype Operator"
      >NJ</a
      ><a name="7192"
      > </a
      ><a name="7193" href="2016-10-30-one-lambda-calculus-many-times-2.html#7178" class="Bound"
      >&#915;</a
      ><a name="7194"
      > </a
      ><a name="7195" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="7197"
      > </a
      ><a name="7198" href="2016-10-30-one-lambda-calculus-many-times-2.html#7167" class="Bound"
      >A</a
      ><a name="7199"
      > </a
      ><a name="7200" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="7201"
      > </a
      ><a name="7202" href="2016-10-30-one-lambda-calculus-many-times-2.html#7169" class="Bound"
      >B</a
      ><a name="7203"
      > </a
      ><a name="7204" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="7205"
      > </a
      ><a name="7206" href="2016-10-30-one-lambda-calculus-many-times-2.html#7185" class="Bound"
      >&#916;</a
      ><a name="7207"
      > </a
      ><a name="7208" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="7209"
      > </a
      ><a name="7210" href="2016-10-30-one-lambda-calculus-many-times-2.html#7171" class="Bound"
      >C</a
      ><a name="7211"
      > </a
      ><a name="7212" class="Symbol"
      >&#8594;</a
      ><a name="7213"
      > </a
      ><a name="7214" href="2016-10-30-one-lambda-calculus-many-times-2.html#6866" class="Datatype Operator"
      >NJ</a
      ><a name="7216"
      > </a
      ><a name="7217" href="2016-10-30-one-lambda-calculus-many-times-2.html#7178" class="Bound"
      >&#915;</a
      ><a name="7218"
      > </a
      ><a name="7219" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="7221"
      > </a
      ><a name="7222" href="2016-10-30-one-lambda-calculus-many-times-2.html#7169" class="Bound"
      >B</a
      ><a name="7223"
      > </a
      ><a name="7224" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="7225"
      > </a
      ><a name="7226" href="2016-10-30-one-lambda-calculus-many-times-2.html#7167" class="Bound"
      >A</a
      ><a name="7227"
      > </a
      ><a name="7228" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="7229"
      > </a
      ><a name="7230" href="2016-10-30-one-lambda-calculus-many-times-2.html#7185" class="Bound"
      >&#916;</a
      ><a name="7231"
      > </a
      ><a name="7232" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="7233"
      > </a
      ><a name="7234" href="2016-10-30-one-lambda-calculus-many-times-2.html#7171" class="Bound"
      >C</a
      >
{% endraw %}</pre>



### Admissible Structural Rules in ND

If we are to have any hope of proving the equivalence between the implicit and the explicit systems, we should be able to prove that the implicit systems admit[^admit] the same structural rules. In the previous post, we've already proven the following theorem for ND:

> If $$\Gamma \subseteq \Gamma\prime$$ and $$\Gamma \vdash A$$, then
> $$\Gamma\prime \vdash A$$.

<div class="hidden">
<pre class="Agda">{% raw %}
  <a name="7693" class="Keyword"
      >module</a
      ><a name="7699"
      > </a
      ><a name="7700" href="2016-10-30-one-lambda-calculus-many-times-2.html#7700" class="Module"
      >ND</a
      ><a name="7702"
      > </a
      ><a name="7703" class="Keyword"
      >where</a
      ><a name="7708"
      >
    </a
      ><a name="7713" class="Keyword"
      >open</a
      ><a name="7717"
      > </a
      ><a name="7718" href="2016-03-20-one-lambda-calculus-many-times.html#1219" class="Module"
      >Part1.</a
      ><a name="7724" href="2016-03-20-one-lambda-calculus-many-times.html#1566" class="Module"
      >Syntax</a
      ><a name="7730"
      > </a
      ><a name="7731" href="2016-10-30-one-lambda-calculus-many-times-2.html#1147" class="Bound"
      >Atom</a
      ><a name="7735"
      > </a
      ><a name="7736" class="Keyword"
      >public</a
      ><a name="7742"
      > </a
      ><a name="7743" class="Keyword"
      >using</a
      ><a name="7748"
      > </a
      ><a name="7749" class="Symbol"
      >(</a
      ><a name="7750"
      >w&#8242;</a
      ><a name="7752" class="Symbol"
      >)</a
      >
{% endraw %}</pre>
</div>

And we've also shown that we can very easily use this theorem to define weakening, because <a class="Agda InductiveConstructor Spec" target="_blank" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227">there</a> is a proof that "weakening", i.e. <span class="Agda Spec"><a class="Bound">Γ</a> <a href="https://agda.github.io/agda-stdlib/Data.List.Any.html#3056" class="Function Operator" target="_blank">⊆</a> <a class="Bound">A</a> <a href="https://agda.github.io/agda-stdlib/Agda.Builtin.List.html#104" class="InductiveConstructor Operator" target="_blank">∷</a> <a class="Bound">Γ</a></span>, holds for the subset relationship.

<pre class="Agda Spec">    <a href="/2016/one-lambda-calculus-many-times/#8603" class="Function">w′</a><a> </a><a class="Symbol">:</a><a> </a><a href="/2016/one-lambda-calculus-many-times/#5371" class="Datatype Operator">ND</a><a> </a><a class="Bound">Γ</a><a> </a><a href="/2016/one-lambda-calculus-many-times/#3979" class="InductiveConstructor Operator">⊢</a><a> </a><a class="Bound">B</a><a> </a><a class="Symbol">→</a><a> </a><a href="/2016/one-lambda-calculus-many-times/#5371" class="Datatype Operator">ND</a><a> </a><a class="Bound">A</a><a> </a><a href="https://agda.github.io/agda-stdlib/Agda.Builtin.List.html#104" class="InductiveConstructor Operator" target="_blank">∷</a><a> </a><a class="Bound">Γ</a><a> </a><a href="/2016/one-lambda-calculus-many-times/#3979" class="InductiveConstructor Operator">⊢</a><a> </a><a class="Bound">B</a><a>
    </a><a href="/2016/one-lambda-calculus-many-times/#8603" class="Function">w′</a><a> </a><a class="Symbol">=</a><a> </a><a href="/2016/one-lambda-calculus-many-times/#7305" class="Function">struct</a><a> </a><a href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor" target="_blank">there</a></pre>

Therefore, all we need to show to extend this to contraction and permutation is that their respective equations, <span class="Agda Spec"><a class="Bound">A</a> <a href="https://agda.github.io/agda-stdlib/Agda.Builtin.List.html#104" class="InductiveConstructor Operator" target="_blank">∷</a> <a class="Bound">A</a> <a href="https://agda.github.io/agda-stdlib/Agda.Builtin.List.html#104" class="InductiveConstructor Operator" target="_blank">∷</a> <a class="Bound">Γ</a> <a href="https://agda.github.io/agda-stdlib/Data.List.Any.html#3056" class="Function Operator" target="_blank">⊆</a> <a class="Bound">A</a> <a href="https://agda.github.io/agda-stdlib/Agda.Builtin.List.html#104" class="InductiveConstructor Operator" target="_blank">∷</a> <a class="Bound">Γ</a></span> and <span class="Agda Spec"><a class="Bound">Γ</a><a> </a><a href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator" target="_blank">++</a><a> </a><a class="Bound">A</a><a> </a><a href="https://agda.github.io/agda-stdlib/Agda.Builtin.List.html#104" class="InductiveConstructor Operator" target="_blank">∷</a><a> </a><a class="Bound">B</a><a> </a><a href="https://agda.github.io/agda-stdlib/Agda.Builtin.List.html#104" class="InductiveConstructor Operator" target="_blank">∷</a><a> </a><a class="Bound">Δ</a><a> </a><a href="https://agda.github.io/agda-stdlib/Data.List.Any.html#3056" class="Function Operator" target="_blank">⊆</a><a> </a><a class="Bound">Γ</a><a> </a><a href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator" target="_blank">++</a><a> </a><a class="Bound">B</a><a> </a><a href="https://agda.github.io/agda-stdlib/Agda.Builtin.List.html#104" class="InductiveConstructor Operator" target="_blank">∷</a><a> </a><a class="Bound">A</a><a> </a><a href="https://agda.github.io/agda-stdlib/Agda.Builtin.List.html#104" class="InductiveConstructor Operator" target="_blank">∷</a><a> </a><a class="Bound">Δ</a></span>, hold for the subset relation as well. This is simply a matter of reindexing. For contraction, if our "index" (made up of <a class="Agda Spec InductiveConstructor" target="_blank" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174">here</a> and <a class="Agda InductiveConstructor Spec" target="_blank" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227">there</a>) points to the first formula, we keep it the same. Otherwise, we subtract one. That way, the first two formulas are *contracted*, and the rest is adjusted accordingly.

<pre class="Agda">{% raw %}
    <a name="12161" href="2016-10-30-one-lambda-calculus-many-times-2.html#12161" class="Function"
      >c&#8242;</a
      ><a name="12163"
      > </a
      ><a name="12164" class="Symbol"
      >:</a
      ><a name="12165"
      > </a
      ><a name="12166" class="Symbol"
      >&#8704;</a
      ><a name="12167"
      > </a
      ><a name="12176" class="Symbol"
      >&#8594;</a
      ><a name="12177"
      > </a
      ><a name="12178" href="2016-03-20-one-lambda-calculus-many-times.html#5371" class="Datatype Operator"
      >ND</a
      ><a name="12180"
      > </a
      ><a name="12181" href="2016-10-30-one-lambda-calculus-many-times-2.html#12169" class="Bound"
      >A</a
      ><a name="12182"
      > </a
      ><a name="12183" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12184"
      > </a
      ><a name="12185" href="2016-10-30-one-lambda-calculus-many-times-2.html#12169" class="Bound"
      >A</a
      ><a name="12186"
      > </a
      ><a name="12187" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12188"
      > </a
      ><a name="12189" href="2016-10-30-one-lambda-calculus-many-times-2.html#12173" class="Bound"
      >&#915;</a
      ><a name="12190"
      > </a
      ><a name="12191" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="12192"
      > </a
      ><a name="12193" href="2016-10-30-one-lambda-calculus-many-times-2.html#12171" class="Bound"
      >B</a
      ><a name="12194"
      > </a
      ><a name="12195" class="Symbol"
      >&#8594;</a
      ><a name="12196"
      > </a
      ><a name="12197" href="2016-03-20-one-lambda-calculus-many-times.html#5371" class="Datatype Operator"
      >ND</a
      ><a name="12199"
      > </a
      ><a name="12200" href="2016-10-30-one-lambda-calculus-many-times-2.html#12169" class="Bound"
      >A</a
      ><a name="12201"
      > </a
      ><a name="12202" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12203"
      > </a
      ><a name="12204" href="2016-10-30-one-lambda-calculus-many-times-2.html#12173" class="Bound"
      >&#915;</a
      ><a name="12205"
      > </a
      ><a name="12206" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="12207"
      > </a
      ><a name="12208" href="2016-10-30-one-lambda-calculus-many-times-2.html#12171" class="Bound"
      >B</a
      ><a name="12209"
      >
    </a
      ><a name="12214" href="2016-10-30-one-lambda-calculus-many-times-2.html#12161" class="Function"
      >c&#8242;</a
      ><a name="12216"
      > </a
      ><a name="12221" class="Symbol"
      >=</a
      ><a name="12222"
      > </a
      ><a name="12223" href="2016-03-20-one-lambda-calculus-many-times.html#7305" class="Function"
      >struct</a
      ><a name="12229"
      > </a
      ><a name="12230" href="2016-10-30-one-lambda-calculus-many-times-2.html#12260" class="Function"
      >contract&#8242;</a
      ><a name="12239"
      >
      </a
      ><a name="12246" class="Keyword"
      >where</a
      ><a name="12251"
      >
        </a
      ><a name="12260" href="2016-10-30-one-lambda-calculus-many-times-2.html#12260" class="Function"
      >contract&#8242;</a
      ><a name="12269"
      > </a
      ><a name="12270" class="Symbol"
      >:</a
      ><a name="12271"
      > </a
      ><a name="12272" class="Symbol"
      >&#8704;</a
      ><a name="12273"
      > </a
      ><a name="12280" class="Symbol"
      >&#8594;</a
      ><a name="12281"
      > </a
      ><a name="12282" href="2016-10-30-one-lambda-calculus-many-times-2.html#12275" class="Bound"
      >A</a
      ><a name="12283"
      > </a
      ><a name="12284" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12285"
      > </a
      ><a name="12286" href="2016-10-30-one-lambda-calculus-many-times-2.html#12275" class="Bound"
      >A</a
      ><a name="12287"
      > </a
      ><a name="12288" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12289"
      > </a
      ><a name="12290" href="2016-10-30-one-lambda-calculus-many-times-2.html#12277" class="Bound"
      >&#915;</a
      ><a name="12291"
      > </a
      ><a name="12292" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#3056" class="Function Operator"
      >&#8838;</a
      ><a name="12293"
      > </a
      ><a name="12294" href="2016-10-30-one-lambda-calculus-many-times-2.html#12275" class="Bound"
      >A</a
      ><a name="12295"
      > </a
      ><a name="12296" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12297"
      > </a
      ><a name="12298" href="2016-10-30-one-lambda-calculus-many-times-2.html#12277" class="Bound"
      >&#915;</a
      ><a name="12299"
      >
        </a
      ><a name="12308" href="2016-10-30-one-lambda-calculus-many-times-2.html#12260" class="Function"
      >contract&#8242;</a
      ><a name="12317"
      > </a
      ><a name="12318" class="Symbol"
      >(</a
      ><a name="12319" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="12323"
      > </a
      ><a name="12324" href="2016-10-30-one-lambda-calculus-many-times-2.html#12324" class="Bound"
      >px</a
      ><a name="12326" class="Symbol"
      >)</a
      ><a name="12327"
      > </a
      ><a name="12328" class="Symbol"
      >=</a
      ><a name="12329"
      > </a
      ><a name="12330" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="12334"
      > </a
      ><a name="12335" href="2016-10-30-one-lambda-calculus-many-times-2.html#12324" class="Bound"
      >px</a
      ><a name="12337"
      >
        </a
      ><a name="12346" href="2016-10-30-one-lambda-calculus-many-times-2.html#12260" class="Function"
      >contract&#8242;</a
      ><a name="12355"
      > </a
      ><a name="12356" class="Symbol"
      >(</a
      ><a name="12357" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="12362"
      > </a
      ><a name="12363" href="2016-10-30-one-lambda-calculus-many-times-2.html#12363" class="Bound"
      >i</a
      ><a name="12364" class="Symbol"
      >)</a
      ><a name="12365"
      > </a
      ><a name="12366" class="Symbol"
      >=</a
      ><a name="12367"
      > </a
      ><a name="12368" href="2016-10-30-one-lambda-calculus-many-times-2.html#12363" class="Bound"
      >i</a
      >
{% endraw %}</pre>

And for permutation, we skip through our index until we've passed the $$\Gamma$$ portion of the context, and then we swap the first two formulas.

<pre class="Agda">{% raw %}
    <a name="12546" href="2016-10-30-one-lambda-calculus-many-times-2.html#12546" class="Function"
      >p&#8242;</a
      ><a name="12548"
      > </a
      ><a name="12549" class="Symbol"
      >:</a
      ><a name="12550"
      > </a
      ><a name="12551" class="Symbol"
      >&#8704;</a
      ><a name="12552"
      > </a
      ><a name="12561" class="Symbol"
      >&#8594;</a
      ><a name="12562"
      > </a
      ><a name="12563" class="Symbol"
      >&#8704;</a
      ><a name="12564"
      > </a
      ><a name="12565" href="2016-10-30-one-lambda-calculus-many-times-2.html#12565" class="Bound"
      >&#915;</a
      ><a name="12566"
      > </a
      ><a name="12567" class="Symbol"
      >&#8594;</a
      ><a name="12568"
      > </a
      ><a name="12569" class="Symbol"
      >&#8704;</a
      ><a name="12570"
      > </a
      ><a name="12575" class="Symbol"
      >&#8594;</a
      ><a name="12576"
      > </a
      ><a name="12577" href="2016-03-20-one-lambda-calculus-many-times.html#5371" class="Datatype Operator"
      >ND</a
      ><a name="12579"
      > </a
      ><a name="12580" href="2016-10-30-one-lambda-calculus-many-times-2.html#12565" class="Bound"
      >&#915;</a
      ><a name="12581"
      > </a
      ><a name="12582" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="12584"
      > </a
      ><a name="12585" href="2016-10-30-one-lambda-calculus-many-times-2.html#12554" class="Bound"
      >A</a
      ><a name="12586"
      > </a
      ><a name="12587" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12588"
      > </a
      ><a name="12589" href="2016-10-30-one-lambda-calculus-many-times-2.html#12556" class="Bound"
      >B</a
      ><a name="12590"
      > </a
      ><a name="12591" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12592"
      > </a
      ><a name="12593" href="2016-10-30-one-lambda-calculus-many-times-2.html#12572" class="Bound"
      >&#916;</a
      ><a name="12594"
      > </a
      ><a name="12595" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="12596"
      > </a
      ><a name="12597" href="2016-10-30-one-lambda-calculus-many-times-2.html#12558" class="Bound"
      >C</a
      ><a name="12598"
      > </a
      ><a name="12599" class="Symbol"
      >&#8594;</a
      ><a name="12600"
      > </a
      ><a name="12601" href="2016-03-20-one-lambda-calculus-many-times.html#5371" class="Datatype Operator"
      >ND</a
      ><a name="12603"
      > </a
      ><a name="12604" href="2016-10-30-one-lambda-calculus-many-times-2.html#12565" class="Bound"
      >&#915;</a
      ><a name="12605"
      > </a
      ><a name="12606" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="12608"
      > </a
      ><a name="12609" href="2016-10-30-one-lambda-calculus-many-times-2.html#12556" class="Bound"
      >B</a
      ><a name="12610"
      > </a
      ><a name="12611" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12612"
      > </a
      ><a name="12613" href="2016-10-30-one-lambda-calculus-many-times-2.html#12554" class="Bound"
      >A</a
      ><a name="12614"
      > </a
      ><a name="12615" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12616"
      > </a
      ><a name="12617" href="2016-10-30-one-lambda-calculus-many-times-2.html#12572" class="Bound"
      >&#916;</a
      ><a name="12618"
      > </a
      ><a name="12619" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="12620"
      > </a
      ><a name="12621" href="2016-10-30-one-lambda-calculus-many-times-2.html#12558" class="Bound"
      >C</a
      ><a name="12622"
      >
    </a
      ><a name="12627" href="2016-10-30-one-lambda-calculus-many-times-2.html#12546" class="Function"
      >p&#8242;</a
      ><a name="12629"
      > </a
      ><a name="12630" href="2016-10-30-one-lambda-calculus-many-times-2.html#12630" class="Bound"
      >&#915;</a
      ><a name="12631"
      > </a
      ><a name="12632" class="Symbol"
      >=</a
      ><a name="12633"
      > </a
      ><a name="12634" href="2016-03-20-one-lambda-calculus-many-times.html#7305" class="Function"
      >struct</a
      ><a name="12640"
      > </a
      ><a name="12641" class="Symbol"
      >(</a
      ><a name="12642" href="2016-10-30-one-lambda-calculus-many-times-2.html#12674" class="Function"
      >permute&#8242;</a
      ><a name="12650"
      > </a
      ><a name="12651" href="2016-10-30-one-lambda-calculus-many-times-2.html#12630" class="Bound"
      >&#915;</a
      ><a name="12652" class="Symbol"
      >)</a
      ><a name="12653"
      >
      </a
      ><a name="12660" class="Keyword"
      >where</a
      ><a name="12665"
      >
        </a
      ><a name="12674" href="2016-10-30-one-lambda-calculus-many-times-2.html#12674" class="Function"
      >permute&#8242;</a
      ><a name="12682"
      > </a
      ><a name="12683" class="Symbol"
      >:</a
      ><a name="12684"
      > </a
      ><a name="12685" class="Symbol"
      >&#8704;</a
      ><a name="12686"
      > </a
      ><a name="12693" class="Symbol"
      >&#8594;</a
      ><a name="12694"
      > </a
      ><a name="12695" class="Symbol"
      >&#8704;</a
      ><a name="12696"
      > </a
      ><a name="12697" href="2016-10-30-one-lambda-calculus-many-times-2.html#12697" class="Bound"
      >&#915;</a
      ><a name="12698"
      > </a
      ><a name="12699" class="Symbol"
      >&#8594;</a
      ><a name="12700"
      > </a
      ><a name="12701" class="Symbol"
      >&#8704;</a
      ><a name="12702"
      > </a
      ><a name="12707" class="Symbol"
      >&#8594;</a
      ><a name="12708"
      > </a
      ><a name="12709" href="2016-10-30-one-lambda-calculus-many-times-2.html#12697" class="Bound"
      >&#915;</a
      ><a name="12710"
      > </a
      ><a name="12711" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="12713"
      > </a
      ><a name="12714" href="2016-10-30-one-lambda-calculus-many-times-2.html#12688" class="Bound"
      >A</a
      ><a name="12715"
      > </a
      ><a name="12716" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12717"
      > </a
      ><a name="12718" href="2016-10-30-one-lambda-calculus-many-times-2.html#12690" class="Bound"
      >B</a
      ><a name="12719"
      > </a
      ><a name="12720" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12721"
      > </a
      ><a name="12722" href="2016-10-30-one-lambda-calculus-many-times-2.html#12704" class="Bound"
      >&#916;</a
      ><a name="12723"
      > </a
      ><a name="12724" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#3056" class="Function Operator"
      >&#8838;</a
      ><a name="12725"
      > </a
      ><a name="12726" href="2016-10-30-one-lambda-calculus-many-times-2.html#12697" class="Bound"
      >&#915;</a
      ><a name="12727"
      > </a
      ><a name="12728" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="12730"
      > </a
      ><a name="12731" href="2016-10-30-one-lambda-calculus-many-times-2.html#12690" class="Bound"
      >B</a
      ><a name="12732"
      > </a
      ><a name="12733" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12734"
      > </a
      ><a name="12735" href="2016-10-30-one-lambda-calculus-many-times-2.html#12688" class="Bound"
      >A</a
      ><a name="12736"
      > </a
      ><a name="12737" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12738"
      > </a
      ><a name="12739" href="2016-10-30-one-lambda-calculus-many-times-2.html#12704" class="Bound"
      >&#916;</a
      ><a name="12740"
      >
        </a
      ><a name="12749" href="2016-10-30-one-lambda-calculus-many-times-2.html#12674" class="Function"
      >permute&#8242;</a
      ><a name="12757"
      > </a
      ><a name="12758" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="12760"
      >      </a
      ><a name="12766" class="Symbol"
      >(</a
      ><a name="12767" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="12771"
      > </a
      ><a name="12772" href="2016-10-30-one-lambda-calculus-many-times-2.html#12772" class="Bound"
      >px</a
      ><a name="12774" class="Symbol"
      >)</a
      ><a name="12775"
      >         </a
      ><a name="12784" class="Symbol"
      >=</a
      ><a name="12785"
      > </a
      ><a name="12786" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="12791"
      > </a
      ><a name="12792" class="Symbol"
      >(</a
      ><a name="12793" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="12797"
      > </a
      ><a name="12798" href="2016-10-30-one-lambda-calculus-many-times-2.html#12772" class="Bound"
      >px</a
      ><a name="12800" class="Symbol"
      >)</a
      ><a name="12801"
      >
        </a
      ><a name="12810" href="2016-10-30-one-lambda-calculus-many-times-2.html#12674" class="Function"
      >permute&#8242;</a
      ><a name="12818"
      > </a
      ><a name="12819" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="12821"
      >      </a
      ><a name="12827" class="Symbol"
      >(</a
      ><a name="12828" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="12833"
      > </a
      ><a name="12834" class="Symbol"
      >(</a
      ><a name="12835" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="12839"
      > </a
      ><a name="12840" href="2016-10-30-one-lambda-calculus-many-times-2.html#12840" class="Bound"
      >px</a
      ><a name="12842" class="Symbol"
      >))</a
      ><a name="12844"
      > </a
      ><a name="12845" class="Symbol"
      >=</a
      ><a name="12846"
      > </a
      ><a name="12847" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="12851"
      > </a
      ><a name="12852" href="2016-10-30-one-lambda-calculus-many-times-2.html#12840" class="Bound"
      >px</a
      ><a name="12854"
      >
        </a
      ><a name="12863" href="2016-10-30-one-lambda-calculus-many-times-2.html#12674" class="Function"
      >permute&#8242;</a
      ><a name="12871"
      > </a
      ><a name="12872" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="12874"
      >      </a
      ><a name="12880" class="Symbol"
      >(</a
      ><a name="12881" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="12886"
      > </a
      ><a name="12887" class="Symbol"
      >(</a
      ><a name="12888" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="12893"
      > </a
      ><a name="12894" href="2016-10-30-one-lambda-calculus-many-times-2.html#12894" class="Bound"
      >i</a
      ><a name="12895" class="Symbol"
      >))</a
      ><a name="12897"
      > </a
      ><a name="12898" class="Symbol"
      >=</a
      ><a name="12899"
      > </a
      ><a name="12900" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="12905"
      > </a
      ><a name="12906" class="Symbol"
      >(</a
      ><a name="12907" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="12912"
      > </a
      ><a name="12913" href="2016-10-30-one-lambda-calculus-many-times-2.html#12894" class="Bound"
      >i</a
      ><a name="12914" class="Symbol"
      >)</a
      ><a name="12915"
      >
        </a
      ><a name="12924" href="2016-10-30-one-lambda-calculus-many-times-2.html#12674" class="Function"
      >permute&#8242;</a
      ><a name="12932"
      > </a
      ><a name="12933" class="Symbol"
      >(</a
      ><a name="12934" href="2016-10-30-one-lambda-calculus-many-times-2.html#12934" class="Bound"
      >C</a
      ><a name="12935"
      > </a
      ><a name="12936" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12937"
      > </a
      ><a name="12938" href="2016-10-30-one-lambda-calculus-many-times-2.html#12938" class="Bound"
      >&#915;</a
      ><a name="12939" class="Symbol"
      >)</a
      ><a name="12940"
      > </a
      ><a name="12941" class="Symbol"
      >(</a
      ><a name="12942" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="12946"
      > </a
      ><a name="12947" href="2016-10-30-one-lambda-calculus-many-times-2.html#12947" class="Bound"
      >px</a
      ><a name="12949" class="Symbol"
      >)</a
      ><a name="12950"
      >         </a
      ><a name="12959" class="Symbol"
      >=</a
      ><a name="12960"
      > </a
      ><a name="12961" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="12965"
      > </a
      ><a name="12966" href="2016-10-30-one-lambda-calculus-many-times-2.html#12947" class="Bound"
      >px</a
      ><a name="12968"
      >
        </a
      ><a name="12977" href="2016-10-30-one-lambda-calculus-many-times-2.html#12674" class="Function"
      >permute&#8242;</a
      ><a name="12985"
      > </a
      ><a name="12986" class="Symbol"
      >(</a
      ><a name="12987" href="2016-10-30-one-lambda-calculus-many-times-2.html#12987" class="Bound"
      >C</a
      ><a name="12988"
      > </a
      ><a name="12989" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12990"
      > </a
      ><a name="12991" href="2016-10-30-one-lambda-calculus-many-times-2.html#12991" class="Bound"
      >&#915;</a
      ><a name="12992" class="Symbol"
      >)</a
      ><a name="12993"
      > </a
      ><a name="12994" class="Symbol"
      >(</a
      ><a name="12995" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="13000"
      > </a
      ><a name="13001" href="2016-10-30-one-lambda-calculus-many-times-2.html#13001" class="Bound"
      >i</a
      ><a name="13002" class="Symbol"
      >)</a
      ><a name="13003"
      >         </a
      ><a name="13012" class="Symbol"
      >=</a
      ><a name="13013"
      > </a
      ><a name="13014" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="13019"
      > </a
      ><a name="13020" class="Symbol"
      >(</a
      ><a name="13021" href="2016-10-30-one-lambda-calculus-many-times-2.html#12674" class="Function"
      >permute&#8242;</a
      ><a name="13029"
      > </a
      ><a name="13030" href="2016-10-30-one-lambda-calculus-many-times-2.html#12991" class="Bound"
      >&#915;</a
      ><a name="13031"
      > </a
      ><a name="13032" href="2016-10-30-one-lambda-calculus-many-times-2.html#13001" class="Bound"
      >i</a
      ><a name="13033" class="Symbol"
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
    <a name="16384" href="2016-10-30-one-lambda-calculus-many-times-2.html#16384" class="Function"
      >weaken</a
      ><a name="16390"
      > </a
      ><a name="16391" class="Symbol"
      >:</a
      ><a name="16392"
      > </a
      ><a name="16393" class="Symbol"
      >&#8704;</a
      ><a name="16394"
      > </a
      ><a name="16395" href="2016-10-30-one-lambda-calculus-many-times-2.html#16395" class="Bound"
      >&#915;</a
      ><a name="16396"
      > </a
      ><a name="16397" class="Symbol"
      >&#8594;</a
      ><a name="16398"
      > </a
      ><a name="16399" class="Symbol"
      >&#8704;</a
      ><a name="16400"
      > </a
      ><a name="16405" class="Symbol"
      >&#8594;</a
      ><a name="16406"
      > </a
      ><a name="16407" href="2016-10-30-one-lambda-calculus-many-times-2.html#16402" class="Bound"
      >&#916;</a
      ><a name="16408"
      > </a
      ><a name="16409" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#3056" class="Function Operator"
      >&#8838;</a
      ><a name="16410"
      > </a
      ><a name="16411" href="2016-10-30-one-lambda-calculus-many-times-2.html#16395" class="Bound"
      >&#915;</a
      ><a name="16412"
      > </a
      ><a name="16413" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="16415"
      > </a
      ><a name="16416" href="2016-10-30-one-lambda-calculus-many-times-2.html#16402" class="Bound"
      >&#916;</a
      ><a name="16417"
      >
    </a
      ><a name="16422" href="2016-10-30-one-lambda-calculus-many-times-2.html#16384" class="Function"
      >weaken</a
      ><a name="16428"
      > </a
      ><a name="16429" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="16431"
      >      </a
      ><a name="16437" href="2016-10-30-one-lambda-calculus-many-times-2.html#16437" class="Bound"
      >i</a
      ><a name="16438"
      > </a
      ><a name="16439" class="Symbol"
      >=</a
      ><a name="16440"
      > </a
      ><a name="16441" href="2016-10-30-one-lambda-calculus-many-times-2.html#16437" class="Bound"
      >i</a
      ><a name="16442"
      >
    </a
      ><a name="16447" href="2016-10-30-one-lambda-calculus-many-times-2.html#16384" class="Function"
      >weaken</a
      ><a name="16453"
      > </a
      ><a name="16454" class="Symbol"
      >(</a
      ><a name="16455" href="2016-10-30-one-lambda-calculus-many-times-2.html#16455" class="Bound"
      >A</a
      ><a name="16456"
      > </a
      ><a name="16457" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="16458"
      > </a
      ><a name="16459" href="2016-10-30-one-lambda-calculus-many-times-2.html#16459" class="Bound"
      >&#915;</a
      ><a name="16460" class="Symbol"
      >)</a
      ><a name="16461"
      > </a
      ><a name="16462" href="2016-10-30-one-lambda-calculus-many-times-2.html#16462" class="Bound"
      >i</a
      ><a name="16463"
      > </a
      ><a name="16464" class="Symbol"
      >=</a
      ><a name="16465"
      > </a
      ><a name="16466" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="16471"
      > </a
      ><a name="16472" class="Symbol"
      >(</a
      ><a name="16473" href="2016-10-30-one-lambda-calculus-many-times-2.html#16384" class="Function"
      >weaken</a
      ><a name="16479"
      > </a
      ><a name="16480" href="2016-10-30-one-lambda-calculus-many-times-2.html#16459" class="Bound"
      >&#915;</a
      ><a name="16481"
      > </a
      ><a name="16482" href="2016-10-30-one-lambda-calculus-many-times-2.html#16462" class="Bound"
      >i</a
      ><a name="16483" class="Symbol"
      >)</a
      >
{% endraw %}</pre>

Forwards movement, or $$\small f^+$$, is a little bit more involved: we move a formula $$A$$ past a context $$\Sigma$$. We do so without moving any formulas in the prefix $$\Gamma$$ or the suffix $$\Delta$$. The definition of forwards movement is split into two maps on indices: <a class="Agda Spec Function">forward</a> and <a class="Agda Spec Function">forward′</a>. In <a class="Agda Spec Function">forward</a>, we define the mapping for indices which point to some position in $$\Gamma$$; nothing changes. Once we have moved past $$\Gamma$$, we enter the nested function <a class="Agda Spec Function">forward′</a>, and $$\Sigma$$. Here, we start moving each index one position back, to make room for the formula $$A$$. Once we move past $$\Sigma$$, and find the index pointint to $$A$$, all we have to do is return <a class="Agda Spec InductiveConstructor" target="_blank" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174">here</a>. Nothing has to change for the indices pointing into $$\Delta$$.

<pre class="Agda">{% raw %}
    <a name="17532" href="2016-10-30-one-lambda-calculus-many-times-2.html#17532" class="Function"
      >forward</a
      ><a name="17539"
      > </a
      ><a name="17540" class="Symbol"
      >:</a
      ><a name="17541"
      > </a
      ><a name="17542" class="Symbol"
      >&#8704;</a
      ><a name="17543"
      > </a
      ><a name="17548" class="Symbol"
      >&#8594;</a
      ><a name="17549"
      > </a
      ><a name="17550" class="Symbol"
      >&#8704;</a
      ><a name="17551"
      > </a
      ><a name="17552" href="2016-10-30-one-lambda-calculus-many-times-2.html#17552" class="Bound"
      >&#915;</a
      ><a name="17553"
      > </a
      ><a name="17554" href="2016-10-30-one-lambda-calculus-many-times-2.html#17554" class="Bound"
      >&#931;</a
      ><a name="17555"
      > </a
      ><a name="17556" class="Symbol"
      >&#8594;</a
      ><a name="17557"
      > </a
      ><a name="17558" class="Symbol"
      >&#8704;</a
      ><a name="17559"
      > </a
      ><a name="17564" class="Symbol"
      >&#8594;</a
      ><a name="17565"
      > </a
      ><a name="17566" class="Symbol"
      >(</a
      ><a name="17567" href="2016-10-30-one-lambda-calculus-many-times-2.html#17552" class="Bound"
      >&#915;</a
      ><a name="17568"
      > </a
      ><a name="17569" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="17571"
      > </a
      ><a name="17572" href="2016-10-30-one-lambda-calculus-many-times-2.html#17554" class="Bound"
      >&#931;</a
      ><a name="17573" class="Symbol"
      >)</a
      ><a name="17574"
      > </a
      ><a name="17575" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="17577"
      > </a
      ><a name="17578" href="2016-10-30-one-lambda-calculus-many-times-2.html#17545" class="Bound"
      >A</a
      ><a name="17579"
      > </a
      ><a name="17580" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="17581"
      > </a
      ><a name="17582" href="2016-10-30-one-lambda-calculus-many-times-2.html#17561" class="Bound"
      >&#916;</a
      ><a name="17583"
      > </a
      ><a name="17584" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#3056" class="Function Operator"
      >&#8838;</a
      ><a name="17585"
      > </a
      ><a name="17586" class="Symbol"
      >(</a
      ><a name="17587" href="2016-10-30-one-lambda-calculus-many-times-2.html#17552" class="Bound"
      >&#915;</a
      ><a name="17588"
      > </a
      ><a name="17589" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="17591"
      > </a
      ><a name="17592" href="2016-10-30-one-lambda-calculus-many-times-2.html#17545" class="Bound"
      >A</a
      ><a name="17593"
      > </a
      ><a name="17594" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="17595"
      > </a
      ><a name="17596" href="2016-10-30-one-lambda-calculus-many-times-2.html#17554" class="Bound"
      >&#931;</a
      ><a name="17597" class="Symbol"
      >)</a
      ><a name="17598"
      > </a
      ><a name="17599" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="17601"
      > </a
      ><a name="17602" href="2016-10-30-one-lambda-calculus-many-times-2.html#17561" class="Bound"
      >&#916;</a
      ><a name="17603"
      >
    </a
      ><a name="17608" href="2016-10-30-one-lambda-calculus-many-times-2.html#17532" class="Function"
      >forward</a
      ><a name="17615"
      > </a
      ><a name="17616" class="Symbol"
      >(</a
      ><a name="17617" href="2016-10-30-one-lambda-calculus-many-times-2.html#17617" class="Bound"
      >C</a
      ><a name="17618"
      > </a
      ><a name="17619" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="17620"
      > </a
      ><a name="17621" href="2016-10-30-one-lambda-calculus-many-times-2.html#17621" class="Bound"
      >&#915;</a
      ><a name="17622" class="Symbol"
      >)</a
      ><a name="17623"
      > </a
      ><a name="17624" href="2016-10-30-one-lambda-calculus-many-times-2.html#17624" class="Bound"
      >&#931;</a
      ><a name="17625"
      > </a
      ><a name="17626" class="Symbol"
      >(</a
      ><a name="17627" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="17631"
      > </a
      ><a name="17632" href="2016-10-30-one-lambda-calculus-many-times-2.html#17632" class="Bound"
      >px</a
      ><a name="17634" class="Symbol"
      >)</a
      ><a name="17635"
      > </a
      ><a name="17636" class="Symbol"
      >=</a
      ><a name="17637"
      > </a
      ><a name="17638" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="17642"
      > </a
      ><a name="17643" href="2016-10-30-one-lambda-calculus-many-times-2.html#17632" class="Bound"
      >px</a
      ><a name="17645"
      >
    </a
      ><a name="17650" href="2016-10-30-one-lambda-calculus-many-times-2.html#17532" class="Function"
      >forward</a
      ><a name="17657"
      > </a
      ><a name="17658" class="Symbol"
      >(</a
      ><a name="17659" href="2016-10-30-one-lambda-calculus-many-times-2.html#17659" class="Bound"
      >C</a
      ><a name="17660"
      > </a
      ><a name="17661" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="17662"
      > </a
      ><a name="17663" href="2016-10-30-one-lambda-calculus-many-times-2.html#17663" class="Bound"
      >&#915;</a
      ><a name="17664" class="Symbol"
      >)</a
      ><a name="17665"
      > </a
      ><a name="17666" href="2016-10-30-one-lambda-calculus-many-times-2.html#17666" class="Bound"
      >&#931;</a
      ><a name="17667"
      > </a
      ><a name="17668" class="Symbol"
      >(</a
      ><a name="17669" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="17674"
      > </a
      ><a name="17675" href="2016-10-30-one-lambda-calculus-many-times-2.html#17675" class="Bound"
      >i</a
      ><a name="17676" class="Symbol"
      >)</a
      ><a name="17677"
      > </a
      ><a name="17678" class="Symbol"
      >=</a
      ><a name="17679"
      > </a
      ><a name="17680" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="17685"
      > </a
      ><a name="17686" class="Symbol"
      >(</a
      ><a name="17687" href="2016-10-30-one-lambda-calculus-many-times-2.html#17532" class="Function"
      >forward</a
      ><a name="17694"
      > </a
      ><a name="17695" href="2016-10-30-one-lambda-calculus-many-times-2.html#17663" class="Bound"
      >&#915;</a
      ><a name="17696"
      > </a
      ><a name="17697" href="2016-10-30-one-lambda-calculus-many-times-2.html#17666" class="Bound"
      >&#931;</a
      ><a name="17698"
      > </a
      ><a name="17699" href="2016-10-30-one-lambda-calculus-many-times-2.html#17675" class="Bound"
      >i</a
      ><a name="17700" class="Symbol"
      >)</a
      ><a name="17701"
      >
    </a
      ><a name="17706" href="2016-10-30-one-lambda-calculus-many-times-2.html#17532" class="Function"
      >forward</a
      ><a name="17713"
      > </a
      ><a name="17714" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="17716"
      >      </a
      ><a name="17722" href="2016-10-30-one-lambda-calculus-many-times-2.html#17722" class="Bound"
      >&#931;</a
      ><a name="17723"
      >        </a
      ><a name="17731" href="2016-10-30-one-lambda-calculus-many-times-2.html#17731" class="Bound"
      >i</a
      ><a name="17732"
      >  </a
      ><a name="17734" class="Symbol"
      >=</a
      ><a name="17735"
      > </a
      ><a name="17736" href="2016-10-30-one-lambda-calculus-many-times-2.html#17769" class="Function"
      >forward&#8242;</a
      ><a name="17744"
      > </a
      ><a name="17745" href="2016-10-30-one-lambda-calculus-many-times-2.html#17722" class="Bound"
      >&#931;</a
      ><a name="17746"
      > </a
      ><a name="17747" href="2016-10-30-one-lambda-calculus-many-times-2.html#17731" class="Bound"
      >i</a
      ><a name="17748"
      >
      </a
      ><a name="17755" class="Keyword"
      >where</a
      ><a name="17760"
      >
        </a
      ><a name="17769" href="2016-10-30-one-lambda-calculus-many-times-2.html#17769" class="Function"
      >forward&#8242;</a
      ><a name="17777"
      > </a
      ><a name="17778" class="Symbol"
      >:</a
      ><a name="17779"
      > </a
      ><a name="17780" class="Symbol"
      >&#8704;</a
      ><a name="17781"
      > </a
      ><a name="17786" class="Symbol"
      >&#8594;</a
      ><a name="17787"
      > </a
      ><a name="17788" class="Symbol"
      >&#8704;</a
      ><a name="17789"
      > </a
      ><a name="17790" href="2016-10-30-one-lambda-calculus-many-times-2.html#17790" class="Bound"
      >&#931;</a
      ><a name="17791"
      > </a
      ><a name="17792" class="Symbol"
      >&#8594;</a
      ><a name="17793"
      > </a
      ><a name="17794" class="Symbol"
      >&#8704;</a
      ><a name="17795"
      > </a
      ><a name="17800" class="Symbol"
      >&#8594;</a
      ><a name="17801"
      > </a
      ><a name="17802" href="2016-10-30-one-lambda-calculus-many-times-2.html#17790" class="Bound"
      >&#931;</a
      ><a name="17803"
      > </a
      ><a name="17804" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="17806"
      > </a
      ><a name="17807" href="2016-10-30-one-lambda-calculus-many-times-2.html#17783" class="Bound"
      >A</a
      ><a name="17808"
      > </a
      ><a name="17809" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="17810"
      > </a
      ><a name="17811" href="2016-10-30-one-lambda-calculus-many-times-2.html#17797" class="Bound"
      >&#916;</a
      ><a name="17812"
      > </a
      ><a name="17813" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#3056" class="Function Operator"
      >&#8838;</a
      ><a name="17814"
      > </a
      ><a name="17815" href="2016-10-30-one-lambda-calculus-many-times-2.html#17783" class="Bound"
      >A</a
      ><a name="17816"
      > </a
      ><a name="17817" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="17818"
      > </a
      ><a name="17819" href="2016-10-30-one-lambda-calculus-many-times-2.html#17790" class="Bound"
      >&#931;</a
      ><a name="17820"
      > </a
      ><a name="17821" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="17823"
      > </a
      ><a name="17824" href="2016-10-30-one-lambda-calculus-many-times-2.html#17797" class="Bound"
      >&#916;</a
      ><a name="17825"
      >
        </a
      ><a name="17834" href="2016-10-30-one-lambda-calculus-many-times-2.html#17769" class="Function"
      >forward&#8242;</a
      ><a name="17842"
      >      </a
      ><a name="17848" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="17850"
      >        </a
      ><a name="17858" href="2016-10-30-one-lambda-calculus-many-times-2.html#17858" class="Bound"
      >i</a
      ><a name="17859"
      >  </a
      ><a name="17861" class="Symbol"
      >=</a
      ><a name="17862"
      > </a
      ><a name="17863" href="2016-10-30-one-lambda-calculus-many-times-2.html#17858" class="Bound"
      >i</a
      ><a name="17864"
      >
        </a
      ><a name="17873" href="2016-10-30-one-lambda-calculus-many-times-2.html#17769" class="Function"
      >forward&#8242;</a
      ><a name="17881"
      > </a
      ><a name="17882" class="Symbol"
      >(</a
      ><a name="17883" href="2016-10-30-one-lambda-calculus-many-times-2.html#17883" class="Bound"
      >C</a
      ><a name="17884"
      > </a
      ><a name="17885" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="17886"
      > </a
      ><a name="17887" href="2016-10-30-one-lambda-calculus-many-times-2.html#17887" class="Bound"
      >&#931;</a
      ><a name="17888" class="Symbol"
      >)</a
      ><a name="17889"
      > </a
      ><a name="17890" class="Symbol"
      >(</a
      ><a name="17891" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="17895"
      > </a
      ><a name="17896" href="2016-10-30-one-lambda-calculus-many-times-2.html#17896" class="Bound"
      >px</a
      ><a name="17898" class="Symbol"
      >)</a
      ><a name="17899"
      > </a
      ><a name="17900" class="Symbol"
      >=</a
      ><a name="17901"
      > </a
      ><a name="17902" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="17907"
      > </a
      ><a name="17908" class="Symbol"
      >(</a
      ><a name="17909" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="17913"
      > </a
      ><a name="17914" href="2016-10-30-one-lambda-calculus-many-times-2.html#17896" class="Bound"
      >px</a
      ><a name="17916" class="Symbol"
      >)</a
      ><a name="17917"
      >
        </a
      ><a name="17926" href="2016-10-30-one-lambda-calculus-many-times-2.html#17769" class="Function"
      >forward&#8242;</a
      ><a name="17934"
      > </a
      ><a name="17935" class="Symbol"
      >(</a
      ><a name="17936" href="2016-10-30-one-lambda-calculus-many-times-2.html#17936" class="Bound"
      >C</a
      ><a name="17937"
      > </a
      ><a name="17938" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="17939"
      > </a
      ><a name="17940" href="2016-10-30-one-lambda-calculus-many-times-2.html#17940" class="Bound"
      >&#931;</a
      ><a name="17941" class="Symbol"
      >)</a
      ><a name="17942"
      > </a
      ><a name="17943" class="Symbol"
      >(</a
      ><a name="17944" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="17949"
      > </a
      ><a name="17950" href="2016-10-30-one-lambda-calculus-many-times-2.html#17950" class="Bound"
      >i</a
      ><a name="17951" class="Symbol"
      >)</a
      ><a name="17952"
      > </a
      ><a name="17953" class="Keyword"
      >with</a
      ><a name="17957"
      > </a
      ><a name="17958" href="2016-10-30-one-lambda-calculus-many-times-2.html#17769" class="Function"
      >forward&#8242;</a
      ><a name="17966"
      > </a
      ><a name="17967" href="2016-10-30-one-lambda-calculus-many-times-2.html#17940" class="Bound"
      >&#931;</a
      ><a name="17968"
      > </a
      ><a name="17969" href="2016-10-30-one-lambda-calculus-many-times-2.html#17950" class="Bound"
      >i</a
      ><a name="17970"
      >
        </a
      ><a name="17979" href="2016-10-30-one-lambda-calculus-many-times-2.html#17769" class="Function"
      >forward&#8242;</a
      ><a name="17987"
      > </a
      ><a name="17988" class="Symbol"
      >(</a
      ><a name="17989" href="2016-10-30-one-lambda-calculus-many-times-2.html#17989" class="Bound"
      >C</a
      ><a name="17990"
      > </a
      ><a name="17991" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="17992"
      > </a
      ><a name="17993" href="2016-10-30-one-lambda-calculus-many-times-2.html#17993" class="Bound"
      >&#931;</a
      ><a name="17994" class="Symbol"
      >)</a
      ><a name="17995"
      > </a
      ><a name="17996" class="Symbol"
      >(</a
      ><a name="17997" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="18002"
      > </a
      ><a name="18003" href="2016-10-30-one-lambda-calculus-many-times-2.html#18003" class="Bound"
      >i</a
      ><a name="18004" class="Symbol"
      >)</a
      ><a name="18005"
      > </a
      ><a name="18006" class="Symbol"
      >|</a
      ><a name="18007"
      > </a
      ><a name="18008" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="18012"
      > </a
      ><a name="18013" href="2016-10-30-one-lambda-calculus-many-times-2.html#18013" class="Bound"
      >px</a
      ><a name="18015"
      > </a
      ><a name="18016" class="Symbol"
      >=</a
      ><a name="18017"
      > </a
      ><a name="18018" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="18022"
      > </a
      ><a name="18023" href="2016-10-30-one-lambda-calculus-many-times-2.html#18013" class="Bound"
      >px</a
      ><a name="18025"
      >
        </a
      ><a name="18034" href="2016-10-30-one-lambda-calculus-many-times-2.html#17769" class="Function"
      >forward&#8242;</a
      ><a name="18042"
      > </a
      ><a name="18043" class="Symbol"
      >(</a
      ><a name="18044" href="2016-10-30-one-lambda-calculus-many-times-2.html#18044" class="Bound"
      >C</a
      ><a name="18045"
      > </a
      ><a name="18046" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="18047"
      > </a
      ><a name="18048" href="2016-10-30-one-lambda-calculus-many-times-2.html#18048" class="Bound"
      >&#931;</a
      ><a name="18049" class="Symbol"
      >)</a
      ><a name="18050"
      > </a
      ><a name="18051" class="Symbol"
      >(</a
      ><a name="18052" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="18057"
      > </a
      ><a name="18058" href="2016-10-30-one-lambda-calculus-many-times-2.html#18058" class="Bound"
      >i</a
      ><a name="18059" class="Symbol"
      >)</a
      ><a name="18060"
      > </a
      ><a name="18061" class="Symbol"
      >|</a
      ><a name="18062"
      > </a
      ><a name="18063" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="18068"
      > </a
      ><a name="18069" href="2016-10-30-one-lambda-calculus-many-times-2.html#18069" class="Bound"
      >j</a
      ><a name="18070"
      > </a
      ><a name="18071" class="Symbol"
      >=</a
      ><a name="18072"
      > </a
      ><a name="18073" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="18078"
      > </a
      ><a name="18079" class="Symbol"
      >(</a
      ><a name="18080" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="18085"
      > </a
      ><a name="18086" href="2016-10-30-one-lambda-calculus-many-times-2.html#18069" class="Bound"
      >j</a
      ><a name="18087" class="Symbol"
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
    <a name="19125" href="2016-10-30-one-lambda-calculus-many-times-2.html#19125" class="Function"
      >permute</a
      ><a name="19132"
      > </a
      ><a name="19133" class="Symbol"
      >:</a
      ><a name="19134"
      > </a
      ><a name="19135" class="Symbol"
      >&#8704;</a
      ><a name="19136"
      > </a
      ><a name="19137" href="2016-10-30-one-lambda-calculus-many-times-2.html#19137" class="Bound"
      >&#915;</a
      ><a name="19138"
      > </a
      ><a name="19139" href="2016-10-30-one-lambda-calculus-many-times-2.html#19139" class="Bound"
      >&#931;</a
      ><a name="19140"
      > </a
      ><a name="19141" href="2016-10-30-one-lambda-calculus-many-times-2.html#19141" class="Bound"
      >&#928;</a
      ><a name="19142"
      > </a
      ><a name="19143" class="Symbol"
      >&#8594;</a
      ><a name="19144"
      > </a
      ><a name="19145" class="Symbol"
      >&#8704;</a
      ><a name="19146"
      > </a
      ><a name="19151" class="Symbol"
      >&#8594;</a
      ><a name="19152"
      > </a
      ><a name="19153" class="Symbol"
      >(</a
      ><a name="19154" href="2016-10-30-one-lambda-calculus-many-times-2.html#19137" class="Bound"
      >&#915;</a
      ><a name="19155"
      > </a
      ><a name="19156" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19158"
      > </a
      ><a name="19159" href="2016-10-30-one-lambda-calculus-many-times-2.html#19139" class="Bound"
      >&#931;</a
      ><a name="19160" class="Symbol"
      >)</a
      ><a name="19161"
      > </a
      ><a name="19162" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19164"
      > </a
      ><a name="19165" class="Symbol"
      >(</a
      ><a name="19166" href="2016-10-30-one-lambda-calculus-many-times-2.html#19141" class="Bound"
      >&#928;</a
      ><a name="19167"
      > </a
      ><a name="19168" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19170"
      > </a
      ><a name="19171" href="2016-10-30-one-lambda-calculus-many-times-2.html#19148" class="Bound"
      >&#916;</a
      ><a name="19172" class="Symbol"
      >)</a
      ><a name="19173"
      > </a
      ><a name="19174" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#3056" class="Function Operator"
      >&#8838;</a
      ><a name="19175"
      > </a
      ><a name="19176" class="Symbol"
      >(</a
      ><a name="19177" href="2016-10-30-one-lambda-calculus-many-times-2.html#19137" class="Bound"
      >&#915;</a
      ><a name="19178"
      > </a
      ><a name="19179" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19181"
      > </a
      ><a name="19182" href="2016-10-30-one-lambda-calculus-many-times-2.html#19141" class="Bound"
      >&#928;</a
      ><a name="19183" class="Symbol"
      >)</a
      ><a name="19184"
      > </a
      ><a name="19185" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19187"
      > </a
      ><a name="19188" class="Symbol"
      >(</a
      ><a name="19189" href="2016-10-30-one-lambda-calculus-many-times-2.html#19139" class="Bound"
      >&#931;</a
      ><a name="19190"
      > </a
      ><a name="19191" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19193"
      > </a
      ><a name="19194" href="2016-10-30-one-lambda-calculus-many-times-2.html#19148" class="Bound"
      >&#916;</a
      ><a name="19195" class="Symbol"
      >)</a
      ><a name="19196"
      >
    </a
      ><a name="19201" href="2016-10-30-one-lambda-calculus-many-times-2.html#19125" class="Function"
      >permute</a
      ><a name="19208"
      > </a
      ><a name="19209" href="2016-10-30-one-lambda-calculus-many-times-2.html#19209" class="Bound"
      >&#915;</a
      ><a name="19210"
      > </a
      ><a name="19211" href="2016-10-30-one-lambda-calculus-many-times-2.html#19211" class="Bound"
      >&#931;</a
      ><a name="19212"
      > </a
      ><a name="19213" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="19215"
      > </a
      ><a name="19220" href="2016-10-30-one-lambda-calculus-many-times-2.html#19220" class="Bound"
      >i</a
      ><a name="19221"
      >
           </a
      ><a name="19233" class="Comment"
      >-- x &#8712; (&#915; ++ &#928;) ++ [] ++ &#916;</a
      ><a name="19259"
      >
      </a
      ><a name="19266" class="Keyword"
      >rewrite</a
      ><a name="19273"
      > </a
      ><a name="19274" href="2016-10-30-one-lambda-calculus-many-times-2.html#2034" class="Function"
      >++-identity&#691;</a
      ><a name="19286"
      > </a
      ><a name="19287" href="2016-10-30-one-lambda-calculus-many-times-2.html#19209" class="Bound"
      >&#915;</a
      ><a name="19288"
      >
           </a
      ><a name="19300" class="Comment"
      >-- x &#8712; (&#915; ++ &#928;) ++ &#916;</a
      ><a name="19320"
      >
            </a
      ><a name="19333" class="Symbol"
      >|</a
      ><a name="19334"
      > </a
      ><a name="19335" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#811" class="Function"
      >++-assoc</a
      ><a name="19343"
      > </a
      ><a name="19344" href="2016-10-30-one-lambda-calculus-many-times-2.html#19209" class="Bound"
      >&#915;</a
      ><a name="19345"
      > </a
      ><a name="19346" href="2016-10-30-one-lambda-calculus-many-times-2.html#19211" class="Bound"
      >&#931;</a
      ><a name="19347"
      > </a
      ><a name="19348" href="2016-10-30-one-lambda-calculus-many-times-2.html#19217" class="Bound"
      >&#916;</a
      ><a name="19349"
      >
           </a
      ><a name="19361" class="Comment"
      >-- x &#8712; &#915; ++ &#928; ++ &#916;</a
      ><a name="19379"
      >
            </a
      ><a name="19392" class="Symbol"
      >=</a
      ><a name="19393"
      > </a
      ><a name="19394" href="2016-10-30-one-lambda-calculus-many-times-2.html#19220" class="Bound"
      >i</a
      ><a name="19395"
      >

    </a
      ><a name="19401" href="2016-10-30-one-lambda-calculus-many-times-2.html#19125" class="Function"
      >permute</a
      ><a name="19408"
      > </a
      ><a name="19409" href="2016-10-30-one-lambda-calculus-many-times-2.html#19409" class="Bound"
      >&#915;</a
      ><a name="19410"
      > </a
      ><a name="19411" href="2016-10-30-one-lambda-calculus-many-times-2.html#19411" class="Bound"
      >&#928;</a
      ><a name="19412"
      > </a
      ><a name="19413" class="Symbol"
      >(</a
      ><a name="19414" href="2016-10-30-one-lambda-calculus-many-times-2.html#19414" class="Bound"
      >A</a
      ><a name="19415"
      > </a
      ><a name="19416" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="19417"
      > </a
      ><a name="19418" href="2016-10-30-one-lambda-calculus-many-times-2.html#19418" class="Bound"
      >&#931;</a
      ><a name="19419" class="Symbol"
      >)</a
      ><a name="19420"
      > </a
      ><a name="19425" href="2016-10-30-one-lambda-calculus-many-times-2.html#19425" class="Bound"
      >i</a
      ><a name="19426"
      >
           </a
      ><a name="19438" class="Comment"
      >-- x &#8712; (&#915; ++ A &#8759; &#931;) ++ &#928; ++ &#916;</a
      ><a name="19467"
      >
      </a
      ><a name="19474" class="Keyword"
      >rewrite</a
      ><a name="19481"
      > </a
      ><a name="19482" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#565" class="Function"
      >sym</a
      ><a name="19485"
      > </a
      ><a name="19486" class="Symbol"
      >(</a
      ><a name="19487" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#811" class="Function"
      >++-assoc</a
      ><a name="19495"
      > </a
      ><a name="19496" href="2016-10-30-one-lambda-calculus-many-times-2.html#19409" class="Bound"
      >&#915;</a
      ><a name="19497"
      > </a
      ><a name="19498" class="Symbol"
      >(</a
      ><a name="19499" href="2016-10-30-one-lambda-calculus-many-times-2.html#19414" class="Bound"
      >A</a
      ><a name="19500"
      > </a
      ><a name="19501" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="19502"
      > </a
      ><a name="19503" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="19505" class="Symbol"
      >)</a
      ><a name="19506"
      > </a
      ><a name="19507" href="2016-10-30-one-lambda-calculus-many-times-2.html#19418" class="Bound"
      >&#931;</a
      ><a name="19508" class="Symbol"
      >)</a
      ><a name="19509"
      >
           </a
      ><a name="19521" class="Comment"
      >-- x &#8712; ((&#915; ++ A &#8759; []) ++ &#931;) ++ &#928; ++ &#916;</a
      ><a name="19558"
      >
            </a
      ><a name="19571" class="Symbol"
      >=</a
      ><a name="19572"
      > </a
      ><a name="19573" href="2016-10-30-one-lambda-calculus-many-times-2.html#19125" class="Function"
      >permute</a
      ><a name="19580"
      > </a
      ><a name="19581" class="Symbol"
      >(</a
      ><a name="19582" href="2016-10-30-one-lambda-calculus-many-times-2.html#19409" class="Bound"
      >&#915;</a
      ><a name="19583"
      > </a
      ><a name="19584" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19586"
      > </a
      ><a name="19587" href="2016-10-30-one-lambda-calculus-many-times-2.html#19414" class="Bound"
      >A</a
      ><a name="19588"
      > </a
      ><a name="19589" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="19590"
      > </a
      ><a name="19591" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="19593" class="Symbol"
      >)</a
      ><a name="19594"
      > </a
      ><a name="19595" href="2016-10-30-one-lambda-calculus-many-times-2.html#19411" class="Bound"
      >&#928;</a
      ><a name="19596"
      > </a
      ><a name="19597" href="2016-10-30-one-lambda-calculus-many-times-2.html#19418" class="Bound"
      >&#931;</a
      ><a name="19598"
      > </a
      ><a name="19599" href="2016-10-30-one-lambda-calculus-many-times-2.html#19625" class="Function"
      >j</a
      ><a name="19600"
      >
        </a
      ><a name="19609" class="Keyword"
      >where</a
      ><a name="19614"
      >
          </a
      ><a name="19625" href="2016-10-30-one-lambda-calculus-many-times-2.html#19625" class="Function"
      >j</a
      ><a name="19626"
      > </a
      ><a name="19627" class="Symbol"
      >:</a
      ><a name="19628"
      > </a
      ><a name="19629" class="Symbol"
      >_</a
      ><a name="19630"
      > </a
      ><a name="19631" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#2920" class="Function Operator"
      >&#8712;</a
      ><a name="19632"
      > </a
      ><a name="19633" class="Symbol"
      >((</a
      ><a name="19635" href="2016-10-30-one-lambda-calculus-many-times-2.html#19409" class="Bound"
      >&#915;</a
      ><a name="19636"
      > </a
      ><a name="19637" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19639"
      > </a
      ><a name="19640" href="2016-10-30-one-lambda-calculus-many-times-2.html#19414" class="Bound"
      >A</a
      ><a name="19641"
      > </a
      ><a name="19642" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="19643"
      > </a
      ><a name="19644" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="19646" class="Symbol"
      >)</a
      ><a name="19647"
      > </a
      ><a name="19648" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19650"
      > </a
      ><a name="19651" href="2016-10-30-one-lambda-calculus-many-times-2.html#19411" class="Bound"
      >&#928;</a
      ><a name="19652" class="Symbol"
      >)</a
      ><a name="19653"
      > </a
      ><a name="19654" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19656"
      > </a
      ><a name="19657" href="2016-10-30-one-lambda-calculus-many-times-2.html#19418" class="Bound"
      >&#931;</a
      ><a name="19658"
      > </a
      ><a name="19659" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19661"
      > </a
      ><a name="19662" href="2016-10-30-one-lambda-calculus-many-times-2.html#19422" class="Bound"
      >&#916;</a
      ><a name="19663"
      >
          </a
      ><a name="19674" href="2016-10-30-one-lambda-calculus-many-times-2.html#19625" class="Function"
      >j</a
      ><a name="19675"
      > </a
      ><a name="19676" class="Keyword"
      >rewrite</a
      ><a name="19683"
      > </a
      ><a name="19684" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#811" class="Function"
      >++-assoc</a
      ><a name="19692"
      > </a
      ><a name="19693" href="2016-10-30-one-lambda-calculus-many-times-2.html#19409" class="Bound"
      >&#915;</a
      ><a name="19694"
      > </a
      ><a name="19695" class="Symbol"
      >(</a
      ><a name="19696" href="2016-10-30-one-lambda-calculus-many-times-2.html#19414" class="Bound"
      >A</a
      ><a name="19697"
      > </a
      ><a name="19698" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="19699"
      > </a
      ><a name="19700" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="19702" class="Symbol"
      >)</a
      ><a name="19703"
      > </a
      ><a name="19704" href="2016-10-30-one-lambda-calculus-many-times-2.html#19411" class="Bound"
      >&#928;</a
      ><a name="19705"
      >
                 </a
      ><a name="19723" class="Comment"
      >-- x &#8712; (&#915; ++ A &#8759; &#928;) ++ &#931; ++ &#916;</a
      ><a name="19752"
      >
                  </a
      ><a name="19771" class="Symbol"
      >=</a
      ><a name="19772"
      > </a
      ><a name="19773" href="2016-10-30-one-lambda-calculus-many-times-2.html#17532" class="Function"
      >forward</a
      ><a name="19780"
      > </a
      ><a name="19781" href="2016-10-30-one-lambda-calculus-many-times-2.html#19409" class="Bound"
      >&#915;</a
      ><a name="19782"
      > </a
      ><a name="19783" href="2016-10-30-one-lambda-calculus-many-times-2.html#19411" class="Bound"
      >&#928;</a
      ><a name="19784"
      > </a
      ><a name="19785" href="2016-10-30-one-lambda-calculus-many-times-2.html#19425" class="Bound"
      >i</a
      >
{% endraw %}</pre>

In our previous version of contraction, all we had to do was merge any references to the first two formulas in our context.

<pre class="Agda">{% raw %}
    <a name="19941" href="2016-10-30-one-lambda-calculus-many-times-2.html#19941" class="Function"
      >contract</a
      ><a name="19949"
      > </a
      ><a name="19950" class="Symbol"
      >:</a
      ><a name="19951"
      > </a
      ><a name="19952" class="Symbol"
      >&#8704;</a
      ><a name="19953"
      > </a
      ><a name="19954" href="2016-10-30-one-lambda-calculus-many-times-2.html#19954" class="Bound"
      >&#915;</a
      ><a name="19955"
      > </a
      ><a name="19956" class="Symbol"
      >&#8594;</a
      ><a name="19957"
      > </a
      ><a name="19958" class="Symbol"
      >&#8704;</a
      ><a name="19959"
      > </a
      ><a name="19964" class="Symbol"
      >&#8594;</a
      ><a name="19965"
      > </a
      ><a name="19966" class="Symbol"
      >(</a
      ><a name="19967" href="2016-10-30-one-lambda-calculus-many-times-2.html#19954" class="Bound"
      >&#915;</a
      ><a name="19968"
      > </a
      ><a name="19969" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19971"
      > </a
      ><a name="19972" href="2016-10-30-one-lambda-calculus-many-times-2.html#19954" class="Bound"
      >&#915;</a
      ><a name="19973" class="Symbol"
      >)</a
      ><a name="19974"
      > </a
      ><a name="19975" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19977"
      > </a
      ><a name="19978" href="2016-10-30-one-lambda-calculus-many-times-2.html#19961" class="Bound"
      >&#916;</a
      ><a name="19979"
      > </a
      ><a name="19980" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#3056" class="Function Operator"
      >&#8838;</a
      ><a name="19981"
      > </a
      ><a name="19982" href="2016-10-30-one-lambda-calculus-many-times-2.html#19954" class="Bound"
      >&#915;</a
      ><a name="19983"
      > </a
      ><a name="19984" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19986"
      > </a
      ><a name="19987" href="2016-10-30-one-lambda-calculus-many-times-2.html#19961" class="Bound"
      >&#916;</a
      ><a name="19988"
      >
    </a
      ><a name="19993" href="2016-10-30-one-lambda-calculus-many-times-2.html#19941" class="Function"
      >contract</a
      ><a name="20001"
      > </a
      ><a name="20002" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="20004"
      >      </a
      ><a name="20014" href="2016-10-30-one-lambda-calculus-many-times-2.html#20014" class="Bound"
      >i</a
      ><a name="20015"
      > </a
      ><a name="20016" class="Symbol"
      >=</a
      ><a name="20017"
      > </a
      ><a name="20018" href="2016-10-30-one-lambda-calculus-many-times-2.html#20014" class="Bound"
      >i</a
      ><a name="20019"
      >
    </a
      ><a name="20024" href="2016-10-30-one-lambda-calculus-many-times-2.html#19941" class="Function"
      >contract</a
      ><a name="20032"
      > </a
      ><a name="20033" class="Symbol"
      >(</a
      ><a name="20034" href="2016-10-30-one-lambda-calculus-many-times-2.html#20034" class="Bound"
      >A</a
      ><a name="20035"
      > </a
      ><a name="20036" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="20037"
      > </a
      ><a name="20038" href="2016-10-30-one-lambda-calculus-many-times-2.html#20038" class="Bound"
      >&#915;</a
      ><a name="20039" class="Symbol"
      >)</a
      ><a name="20040"
      > </a
      ><a name="20045" class="Symbol"
      >(</a
      ><a name="20046" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="20050"
      > </a
      ><a name="20051" href="2016-10-30-one-lambda-calculus-many-times-2.html#20051" class="Bound"
      >px</a
      ><a name="20053" class="Symbol"
      >)</a
      ><a name="20054"
      > </a
      ><a name="20055" class="Symbol"
      >=</a
      ><a name="20056"
      > </a
      ><a name="20057" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="20061"
      > </a
      ><a name="20062" href="2016-10-30-one-lambda-calculus-many-times-2.html#20051" class="Bound"
      >px</a
      ><a name="20064"
      >
    </a
      ><a name="20069" href="2016-10-30-one-lambda-calculus-many-times-2.html#19941" class="Function"
      >contract</a
      ><a name="20077"
      > </a
      ><a name="20078" class="Symbol"
      >(</a
      ><a name="20079" href="2016-10-30-one-lambda-calculus-many-times-2.html#20079" class="Bound"
      >A</a
      ><a name="20080"
      > </a
      ><a name="20081" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="20082"
      > </a
      ><a name="20083" href="2016-10-30-one-lambda-calculus-many-times-2.html#20083" class="Bound"
      >&#915;</a
      ><a name="20084" class="Symbol"
      >)</a
      ><a name="20085"
      > </a
      ><a name="20090" class="Symbol"
      >(</a
      ><a name="20091" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="20096"
      > </a
      ><a name="20097" href="2016-10-30-one-lambda-calculus-many-times-2.html#20097" class="Bound"
      >i</a
      ><a name="20098" class="Symbol"
      >)</a
      ><a name="20099"
      >
      </a
      ><a name="20106" class="Keyword"
      >rewrite</a
      ><a name="20113"
      > </a
      ><a name="20114" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#811" class="Function"
      >++-assoc</a
      ><a name="20122"
      > </a
      ><a name="20123" href="2016-10-30-one-lambda-calculus-many-times-2.html#20083" class="Bound"
      >&#915;</a
      ><a name="20124"
      > </a
      ><a name="20125" class="Symbol"
      >(</a
      ><a name="20126" href="2016-10-30-one-lambda-calculus-many-times-2.html#20079" class="Bound"
      >A</a
      ><a name="20127"
      > </a
      ><a name="20128" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="20129"
      > </a
      ><a name="20130" href="2016-10-30-one-lambda-calculus-many-times-2.html#20083" class="Bound"
      >&#915;</a
      ><a name="20131" class="Symbol"
      >)</a
      ><a name="20132"
      > </a
      ><a name="20133" href="2016-10-30-one-lambda-calculus-many-times-2.html#20087" class="Bound"
      >&#916;</a
      ><a name="20134"
      > </a
      ><a name="20135" class="Keyword"
      >with</a
      ><a name="20139"
      > </a
      ><a name="20140" href="2016-10-30-one-lambda-calculus-many-times-2.html#17532" class="Function"
      >forward</a
      ><a name="20147"
      > </a
      ><a name="20148" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="20150"
      > </a
      ><a name="20151" href="2016-10-30-one-lambda-calculus-many-times-2.html#20083" class="Bound"
      >&#915;</a
      ><a name="20152"
      > </a
      ><a name="20153" href="2016-10-30-one-lambda-calculus-many-times-2.html#20097" class="Bound"
      >i</a
      ><a name="20154"
      >
    </a
      ><a name="20159" href="2016-10-30-one-lambda-calculus-many-times-2.html#19941" class="Function"
      >contract</a
      ><a name="20167"
      > </a
      ><a name="20168" class="Symbol"
      >(</a
      ><a name="20169" href="2016-10-30-one-lambda-calculus-many-times-2.html#20169" class="Bound"
      >A</a
      ><a name="20170"
      > </a
      ><a name="20171" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="20172"
      > </a
      ><a name="20173" href="2016-10-30-one-lambda-calculus-many-times-2.html#20173" class="Bound"
      >&#915;</a
      ><a name="20174" class="Symbol"
      >)</a
      ><a name="20175"
      > </a
      ><a name="20180" class="Symbol"
      >(</a
      ><a name="20181" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="20186"
      > </a
      ><a name="20187" href="2016-10-30-one-lambda-calculus-many-times-2.html#20187" class="Bound"
      >i</a
      ><a name="20188" class="Symbol"
      >)</a
      ><a name="20189"
      > </a
      ><a name="20190" class="Symbol"
      >|</a
      ><a name="20191"
      > </a
      ><a name="20192" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="20196"
      > </a
      ><a name="20197" href="2016-10-30-one-lambda-calculus-many-times-2.html#20197" class="Bound"
      >px</a
      ><a name="20199"
      > </a
      ><a name="20200" class="Symbol"
      >=</a
      ><a name="20201"
      > </a
      ><a name="20202" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="20206"
      > </a
      ><a name="20207" href="2016-10-30-one-lambda-calculus-many-times-2.html#20197" class="Bound"
      >px</a
      ><a name="20209"
      >
    </a
      ><a name="20214" href="2016-10-30-one-lambda-calculus-many-times-2.html#19941" class="Function"
      >contract</a
      ><a name="20222"
      > </a
      ><a name="20223" class="Symbol"
      >(</a
      ><a name="20224" href="2016-10-30-one-lambda-calculus-many-times-2.html#20224" class="Bound"
      >A</a
      ><a name="20225"
      > </a
      ><a name="20226" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="20227"
      > </a
      ><a name="20228" href="2016-10-30-one-lambda-calculus-many-times-2.html#20228" class="Bound"
      >&#915;</a
      ><a name="20229" class="Symbol"
      >)</a
      ><a name="20230"
      > </a
      ><a name="20235" class="Symbol"
      >(</a
      ><a name="20236" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="20241"
      > </a
      ><a name="20242" href="2016-10-30-one-lambda-calculus-many-times-2.html#20242" class="Bound"
      >i</a
      ><a name="20243" class="Symbol"
      >)</a
      ><a name="20244"
      > </a
      ><a name="20245" class="Symbol"
      >|</a
      ><a name="20246"
      > </a
      ><a name="20247" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="20252"
      > </a
      ><a name="20253" href="2016-10-30-one-lambda-calculus-many-times-2.html#20253" class="Bound"
      >j</a
      ><a name="20254"
      >
      </a
      ><a name="20261" class="Keyword"
      >rewrite</a
      ><a name="20268"
      > </a
      ><a name="20269" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#565" class="Function"
      >sym</a
      ><a name="20272"
      > </a
      ><a name="20273" class="Symbol"
      >(</a
      ><a name="20274" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#811" class="Function"
      >++-assoc</a
      ><a name="20282"
      > </a
      ><a name="20283" href="2016-10-30-one-lambda-calculus-many-times-2.html#20228" class="Bound"
      >&#915;</a
      ><a name="20284"
      > </a
      ><a name="20285" href="2016-10-30-one-lambda-calculus-many-times-2.html#20228" class="Bound"
      >&#915;</a
      ><a name="20286"
      > </a
      ><a name="20287" href="2016-10-30-one-lambda-calculus-many-times-2.html#20232" class="Bound"
      >&#916;</a
      ><a name="20288" class="Symbol"
      >)</a
      ><a name="20289"
      > </a
      ><a name="20290" class="Symbol"
      >=</a
      ><a name="20291"
      > </a
      ><a name="20292" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="20297"
      > </a
      ><a name="20298" class="Symbol"
      >(</a
      ><a name="20299" href="2016-10-30-one-lambda-calculus-many-times-2.html#19941" class="Function"
      >contract</a
      ><a name="20307"
      > </a
      ><a name="20308" href="2016-10-30-one-lambda-calculus-many-times-2.html#20228" class="Bound"
      >&#915;</a
      ><a name="20309"
      > </a
      ><a name="20310" href="2016-10-30-one-lambda-calculus-many-times-2.html#20253" class="Bound"
      >j</a
      ><a name="20311" class="Symbol"
      >)</a
      >
{% endraw %}</pre>

Boop.

<pre class="Agda">{% raw %}
    <a name="20349" href="2016-10-30-one-lambda-calculus-many-times-2.html#20349" class="Function"
      >w&#8314;&#8242;</a
      ><a name="20352"
      > </a
      ><a name="20353" class="Symbol"
      >:</a
      ><a name="20354"
      > </a
      ><a name="20355" class="Symbol"
      >&#8704;</a
      ><a name="20356"
      > </a
      ><a name="20361" class="Symbol"
      >&#8594;</a
      ><a name="20362"
      > </a
      ><a name="20363" class="Symbol"
      >&#8704;</a
      ><a name="20364"
      > </a
      ><a name="20365" href="2016-10-30-one-lambda-calculus-many-times-2.html#20365" class="Bound"
      >&#915;</a
      ><a name="20366"
      > </a
      ><a name="20367" class="Symbol"
      >&#8594;</a
      ><a name="20368"
      > </a
      ><a name="20369" class="Symbol"
      >&#8704;</a
      ><a name="20370"
      > </a
      ><a name="20375" class="Symbol"
      >&#8594;</a
      ><a name="20376"
      > </a
      ><a name="20377" href="2016-03-20-one-lambda-calculus-many-times.html#5371" class="Datatype Operator"
      >ND</a
      ><a name="20379"
      > </a
      ><a name="20380" href="2016-10-30-one-lambda-calculus-many-times-2.html#20372" class="Bound"
      >&#916;</a
      ><a name="20381"
      > </a
      ><a name="20382" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="20383"
      > </a
      ><a name="20384" href="2016-10-30-one-lambda-calculus-many-times-2.html#20358" class="Bound"
      >A</a
      ><a name="20385"
      > </a
      ><a name="20386" class="Symbol"
      >&#8594;</a
      ><a name="20387"
      > </a
      ><a name="20388" href="2016-03-20-one-lambda-calculus-many-times.html#5371" class="Datatype Operator"
      >ND</a
      ><a name="20390"
      > </a
      ><a name="20391" href="2016-10-30-one-lambda-calculus-many-times-2.html#20365" class="Bound"
      >&#915;</a
      ><a name="20392"
      > </a
      ><a name="20393" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20395"
      > </a
      ><a name="20396" href="2016-10-30-one-lambda-calculus-many-times-2.html#20372" class="Bound"
      >&#916;</a
      ><a name="20397"
      > </a
      ><a name="20398" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="20399"
      > </a
      ><a name="20400" href="2016-10-30-one-lambda-calculus-many-times-2.html#20358" class="Bound"
      >A</a
      ><a name="20401"
      >
    </a
      ><a name="20406" href="2016-10-30-one-lambda-calculus-many-times-2.html#20349" class="Function"
      >w&#8314;&#8242;</a
      ><a name="20409"
      > </a
      ><a name="20410" href="2016-10-30-one-lambda-calculus-many-times-2.html#20410" class="Bound"
      >&#915;</a
      ><a name="20411"
      > </a
      ><a name="20412" class="Symbol"
      >=</a
      ><a name="20413"
      > </a
      ><a name="20414" href="2016-03-20-one-lambda-calculus-many-times.html#7305" class="Function"
      >struct</a
      ><a name="20420"
      > </a
      ><a name="20421" class="Symbol"
      >(</a
      ><a name="20422" href="2016-10-30-one-lambda-calculus-many-times-2.html#16384" class="Function"
      >weaken</a
      ><a name="20428"
      > </a
      ><a name="20429" href="2016-10-30-one-lambda-calculus-many-times-2.html#20410" class="Bound"
      >&#915;</a
      ><a name="20430" class="Symbol"
      >)</a
      ><a name="20431"
      >

    </a
      ><a name="20437" href="2016-10-30-one-lambda-calculus-many-times-2.html#20437" class="Function"
      >c&#8314;&#8242;</a
      ><a name="20440"
      > </a
      ><a name="20441" class="Symbol"
      >:</a
      ><a name="20442"
      > </a
      ><a name="20443" class="Symbol"
      >&#8704;</a
      ><a name="20444"
      > </a
      ><a name="20449" class="Symbol"
      >&#8594;</a
      ><a name="20450"
      > </a
      ><a name="20451" class="Symbol"
      >&#8704;</a
      ><a name="20452"
      > </a
      ><a name="20453" href="2016-10-30-one-lambda-calculus-many-times-2.html#20453" class="Bound"
      >&#915;</a
      ><a name="20454"
      > </a
      ><a name="20455" class="Symbol"
      >&#8594;</a
      ><a name="20456"
      > </a
      ><a name="20457" class="Symbol"
      >&#8704;</a
      ><a name="20458"
      > </a
      ><a name="20463" class="Symbol"
      >&#8594;</a
      ><a name="20464"
      > </a
      ><a name="20465" href="2016-03-20-one-lambda-calculus-many-times.html#5371" class="Datatype Operator"
      >ND</a
      ><a name="20467"
      > </a
      ><a name="20468" class="Symbol"
      >(</a
      ><a name="20469" href="2016-10-30-one-lambda-calculus-many-times-2.html#20453" class="Bound"
      >&#915;</a
      ><a name="20470"
      > </a
      ><a name="20471" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20473"
      > </a
      ><a name="20474" href="2016-10-30-one-lambda-calculus-many-times-2.html#20453" class="Bound"
      >&#915;</a
      ><a name="20475" class="Symbol"
      >)</a
      ><a name="20476"
      > </a
      ><a name="20477" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20479"
      > </a
      ><a name="20480" href="2016-10-30-one-lambda-calculus-many-times-2.html#20460" class="Bound"
      >&#916;</a
      ><a name="20481"
      > </a
      ><a name="20482" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="20483"
      > </a
      ><a name="20484" href="2016-10-30-one-lambda-calculus-many-times-2.html#20446" class="Bound"
      >A</a
      ><a name="20485"
      > </a
      ><a name="20486" class="Symbol"
      >&#8594;</a
      ><a name="20487"
      > </a
      ><a name="20488" href="2016-03-20-one-lambda-calculus-many-times.html#5371" class="Datatype Operator"
      >ND</a
      ><a name="20490"
      > </a
      ><a name="20491" href="2016-10-30-one-lambda-calculus-many-times-2.html#20453" class="Bound"
      >&#915;</a
      ><a name="20492"
      > </a
      ><a name="20493" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20495"
      > </a
      ><a name="20496" href="2016-10-30-one-lambda-calculus-many-times-2.html#20460" class="Bound"
      >&#916;</a
      ><a name="20497"
      > </a
      ><a name="20498" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="20499"
      > </a
      ><a name="20500" href="2016-10-30-one-lambda-calculus-many-times-2.html#20446" class="Bound"
      >A</a
      ><a name="20501"
      >
    </a
      ><a name="20506" href="2016-10-30-one-lambda-calculus-many-times-2.html#20437" class="Function"
      >c&#8314;&#8242;</a
      ><a name="20509"
      > </a
      ><a name="20510" href="2016-10-30-one-lambda-calculus-many-times-2.html#20510" class="Bound"
      >&#915;</a
      ><a name="20511"
      > </a
      ><a name="20512" class="Symbol"
      >=</a
      ><a name="20513"
      > </a
      ><a name="20514" href="2016-03-20-one-lambda-calculus-many-times.html#7305" class="Function"
      >struct</a
      ><a name="20520"
      > </a
      ><a name="20521" class="Symbol"
      >(</a
      ><a name="20522" href="2016-10-30-one-lambda-calculus-many-times-2.html#19941" class="Function"
      >contract</a
      ><a name="20530"
      > </a
      ><a name="20531" href="2016-10-30-one-lambda-calculus-many-times-2.html#20510" class="Bound"
      >&#915;</a
      ><a name="20532" class="Symbol"
      >)</a
      ><a name="20533"
      >

    </a
      ><a name="20539" href="2016-10-30-one-lambda-calculus-many-times-2.html#20539" class="Function"
      >p&#8314;&#8242;</a
      ><a name="20542"
      > </a
      ><a name="20543" class="Symbol"
      >:</a
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
      ><a name="20553" class="Symbol"
      >&#8704;</a
      ><a name="20554"
      > </a
      ><a name="20555" href="2016-10-30-one-lambda-calculus-many-times-2.html#20555" class="Bound"
      >&#915;</a
      ><a name="20556"
      > </a
      ><a name="20557" href="2016-10-30-one-lambda-calculus-many-times-2.html#20557" class="Bound"
      >&#931;</a
      ><a name="20558"
      > </a
      ><a name="20559" href="2016-10-30-one-lambda-calculus-many-times-2.html#20559" class="Bound"
      >&#928;</a
      ><a name="20560"
      > </a
      ><a name="20561" class="Symbol"
      >&#8594;</a
      ><a name="20562"
      > </a
      ><a name="20563" class="Symbol"
      >&#8704;</a
      ><a name="20564"
      > </a
      ><a name="20569" class="Symbol"
      >&#8594;</a
      ><a name="20570"
      > </a
      ><a name="20571" href="2016-03-20-one-lambda-calculus-many-times.html#5371" class="Datatype Operator"
      >ND</a
      ><a name="20573"
      > </a
      ><a name="20574" class="Symbol"
      >(</a
      ><a name="20575" href="2016-10-30-one-lambda-calculus-many-times-2.html#20555" class="Bound"
      >&#915;</a
      ><a name="20576"
      > </a
      ><a name="20577" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20579"
      > </a
      ><a name="20580" href="2016-10-30-one-lambda-calculus-many-times-2.html#20557" class="Bound"
      >&#931;</a
      ><a name="20581" class="Symbol"
      >)</a
      ><a name="20582"
      > </a
      ><a name="20583" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20585"
      > </a
      ><a name="20586" class="Symbol"
      >(</a
      ><a name="20587" href="2016-10-30-one-lambda-calculus-many-times-2.html#20559" class="Bound"
      >&#928;</a
      ><a name="20588"
      > </a
      ><a name="20589" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20591"
      > </a
      ><a name="20592" href="2016-10-30-one-lambda-calculus-many-times-2.html#20566" class="Bound"
      >&#916;</a
      ><a name="20593" class="Symbol"
      >)</a
      ><a name="20594"
      > </a
      ><a name="20595" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="20596"
      > </a
      ><a name="20597" href="2016-10-30-one-lambda-calculus-many-times-2.html#20548" class="Bound"
      >A</a
      ><a name="20598"
      >
                 </a
      ><a name="20616" class="Symbol"
      >&#8594;</a
      ><a name="20617"
      > </a
      ><a name="20618" href="2016-03-20-one-lambda-calculus-many-times.html#5371" class="Datatype Operator"
      >ND</a
      ><a name="20620"
      > </a
      ><a name="20621" class="Symbol"
      >(</a
      ><a name="20622" href="2016-10-30-one-lambda-calculus-many-times-2.html#20555" class="Bound"
      >&#915;</a
      ><a name="20623"
      > </a
      ><a name="20624" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20626"
      > </a
      ><a name="20627" href="2016-10-30-one-lambda-calculus-many-times-2.html#20559" class="Bound"
      >&#928;</a
      ><a name="20628" class="Symbol"
      >)</a
      ><a name="20629"
      > </a
      ><a name="20630" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20632"
      > </a
      ><a name="20633" class="Symbol"
      >(</a
      ><a name="20634" href="2016-10-30-one-lambda-calculus-many-times-2.html#20557" class="Bound"
      >&#931;</a
      ><a name="20635"
      > </a
      ><a name="20636" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20638"
      > </a
      ><a name="20639" href="2016-10-30-one-lambda-calculus-many-times-2.html#20566" class="Bound"
      >&#916;</a
      ><a name="20640" class="Symbol"
      >)</a
      ><a name="20641"
      > </a
      ><a name="20642" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="20643"
      > </a
      ><a name="20644" href="2016-10-30-one-lambda-calculus-many-times-2.html#20548" class="Bound"
      >A</a
      ><a name="20645"
      >
    </a
      ><a name="20650" href="2016-10-30-one-lambda-calculus-many-times-2.html#20539" class="Function"
      >p&#8314;&#8242;</a
      ><a name="20653"
      > </a
      ><a name="20654" href="2016-10-30-one-lambda-calculus-many-times-2.html#20654" class="Bound"
      >&#915;</a
      ><a name="20655"
      > </a
      ><a name="20656" href="2016-10-30-one-lambda-calculus-many-times-2.html#20656" class="Bound"
      >&#931;</a
      ><a name="20657"
      > </a
      ><a name="20658" href="2016-10-30-one-lambda-calculus-many-times-2.html#20658" class="Bound"
      >&#928;</a
      ><a name="20659"
      > </a
      ><a name="20660" class="Symbol"
      >=</a
      ><a name="20661"
      > </a
      ><a name="20662" href="2016-03-20-one-lambda-calculus-many-times.html#7305" class="Function"
      >struct</a
      ><a name="20668"
      > </a
      ><a name="20669" class="Symbol"
      >(</a
      ><a name="20670" href="2016-10-30-one-lambda-calculus-many-times-2.html#19125" class="Function"
      >permute</a
      ><a name="20677"
      > </a
      ><a name="20678" href="2016-10-30-one-lambda-calculus-many-times-2.html#20654" class="Bound"
      >&#915;</a
      ><a name="20679"
      > </a
      ><a name="20680" href="2016-10-30-one-lambda-calculus-many-times-2.html#20656" class="Bound"
      >&#931;</a
      ><a name="20681"
      > </a
      ><a name="20682" href="2016-10-30-one-lambda-calculus-many-times-2.html#20658" class="Bound"
      >&#928;</a
      ><a name="20683" class="Symbol"
      >)</a
      >
{% endraw %}</pre>

Boop.

<div class="foldable">
<pre class="Agda">{% raw %}
    <a name="20744" href="2016-10-30-one-lambda-calculus-many-times-2.html#20744" class="Function"
      >s&#8314;&#8242;</a
      ><a name="20747"
      > </a
      ><a name="20748" class="Symbol"
      >:</a
      ><a name="20749"
      > </a
      ><a name="20750" class="Symbol"
      >&#8704;</a
      ><a name="20751"
      > </a
      ><a name="20756" class="Symbol"
      >&#8594;</a
      ><a name="20757"
      > </a
      ><a name="20758" class="Symbol"
      >&#8704;</a
      ><a name="20759"
      > </a
      ><a name="20760" href="2016-10-30-one-lambda-calculus-many-times-2.html#20760" class="Bound"
      >&#915;</a
      ><a name="20761"
      > </a
      ><a name="20762" href="2016-10-30-one-lambda-calculus-many-times-2.html#20762" class="Bound"
      >&#931;</a
      ><a name="20763"
      > </a
      ><a name="20764" class="Symbol"
      >&#8594;</a
      ><a name="20765"
      > </a
      ><a name="20766" class="Symbol"
      >&#8704;</a
      ><a name="20767"
      > </a
      ><a name="20772" class="Symbol"
      >&#8594;</a
      ><a name="20773"
      > </a
      ><a name="20774" href="2016-03-20-one-lambda-calculus-many-times.html#5371" class="Datatype Operator"
      >ND</a
      ><a name="20776"
      > </a
      ><a name="20777" class="Symbol"
      >(</a
      ><a name="20778" href="2016-10-30-one-lambda-calculus-many-times-2.html#20760" class="Bound"
      >&#915;</a
      ><a name="20779"
      > </a
      ><a name="20780" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20782"
      > </a
      ><a name="20783" href="2016-10-30-one-lambda-calculus-many-times-2.html#20762" class="Bound"
      >&#931;</a
      ><a name="20784" class="Symbol"
      >)</a
      ><a name="20785"
      > </a
      ><a name="20786" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20788"
      > </a
      ><a name="20789" href="2016-10-30-one-lambda-calculus-many-times-2.html#20769" class="Bound"
      >&#928;</a
      ><a name="20790"
      > </a
      ><a name="20791" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="20792"
      > </a
      ><a name="20793" href="2016-10-30-one-lambda-calculus-many-times-2.html#20753" class="Bound"
      >A</a
      ><a name="20794"
      >
                </a
      ><a name="20811" class="Symbol"
      >&#8594;</a
      ><a name="20812"
      > </a
      ><a name="20813" href="2016-03-20-one-lambda-calculus-many-times.html#5371" class="Datatype Operator"
      >ND</a
      ><a name="20815"
      > </a
      ><a name="20816" class="Symbol"
      >(</a
      ><a name="20817" href="2016-10-30-one-lambda-calculus-many-times-2.html#20760" class="Bound"
      >&#915;</a
      ><a name="20818"
      > </a
      ><a name="20819" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20821"
      > </a
      ><a name="20822" href="2016-10-30-one-lambda-calculus-many-times-2.html#20769" class="Bound"
      >&#928;</a
      ><a name="20823" class="Symbol"
      >)</a
      ><a name="20824"
      > </a
      ><a name="20825" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20827"
      > </a
      ><a name="20828" href="2016-10-30-one-lambda-calculus-many-times-2.html#20762" class="Bound"
      >&#931;</a
      ><a name="20829"
      > </a
      ><a name="20830" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="20831"
      > </a
      ><a name="20832" href="2016-10-30-one-lambda-calculus-many-times-2.html#20753" class="Bound"
      >A</a
      ><a name="20833"
      >
    </a
      ><a name="20838" href="2016-10-30-one-lambda-calculus-many-times-2.html#20744" class="Function"
      >s&#8314;&#8242;</a
      ><a name="20841"
      > </a
      ><a name="20846" href="2016-10-30-one-lambda-calculus-many-times-2.html#20846" class="Bound"
      >&#915;</a
      ><a name="20847"
      > </a
      ><a name="20848" href="2016-10-30-one-lambda-calculus-many-times-2.html#20848" class="Bound"
      >&#931;</a
      ><a name="20849"
      > </a
      ><a name="20854" href="2016-10-30-one-lambda-calculus-many-times-2.html#20854" class="Bound"
      >f</a
      ><a name="20855"
      >
      </a
      ><a name="20862" class="Symbol"
      >=</a
      ><a name="20863"
      > </a
      ><a name="20864" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#705" class="Function"
      >subst</a
      ><a name="20869"
      > </a
      ><a name="20870" class="Symbol"
      >(&#955;</a
      ><a name="20872"
      > </a
      ><a name="20873" href="2016-10-30-one-lambda-calculus-many-times-2.html#20873" class="Bound"
      >&#931;</a
      ><a name="20874"
      > </a
      ><a name="20875" class="Symbol"
      >&#8594;</a
      ><a name="20876"
      > </a
      ><a name="20877" href="2016-03-20-one-lambda-calculus-many-times.html#5371" class="Datatype Operator"
      >ND</a
      ><a name="20879"
      > </a
      ><a name="20880" class="Symbol"
      >(</a
      ><a name="20881" href="2016-10-30-one-lambda-calculus-many-times-2.html#20846" class="Bound"
      >&#915;</a
      ><a name="20882"
      > </a
      ><a name="20883" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20885"
      > </a
      ><a name="20886" href="2016-10-30-one-lambda-calculus-many-times-2.html#20851" class="Bound"
      >&#928;</a
      ><a name="20887" class="Symbol"
      >)</a
      ><a name="20888"
      > </a
      ><a name="20889" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20891"
      > </a
      ><a name="20892" href="2016-10-30-one-lambda-calculus-many-times-2.html#20873" class="Bound"
      >&#931;</a
      ><a name="20893"
      > </a
      ><a name="20894" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="20895"
      > </a
      ><a name="20896" href="2016-10-30-one-lambda-calculus-many-times-2.html#20843" class="Bound"
      >A</a
      ><a name="20897" class="Symbol"
      >)</a
      ><a name="20898"
      >      </a
      ><a name="20904" class="Symbol"
      >(</a
      ><a name="20905" href="2016-10-30-one-lambda-calculus-many-times-2.html#2034" class="Function"
      >++-identity&#691;</a
      ><a name="20917"
      > </a
      ><a name="20918" href="2016-10-30-one-lambda-calculus-many-times-2.html#20848" class="Bound"
      >&#931;</a
      ><a name="20919" class="Symbol"
      >)</a
      ><a name="20920"
      >
      </a
      ><a name="20927" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="20928"
      > </a
      ><a name="20929" href="2016-10-30-one-lambda-calculus-many-times-2.html#20539" class="Function"
      >p&#8314;&#8242;</a
      ><a name="20932"
      > </a
      ><a name="20933" href="2016-10-30-one-lambda-calculus-many-times-2.html#20846" class="Bound"
      >&#915;</a
      ><a name="20934"
      > </a
      ><a name="20935" href="2016-10-30-one-lambda-calculus-many-times-2.html#20848" class="Bound"
      >&#931;</a
      ><a name="20936"
      > </a
      ><a name="20937" href="2016-10-30-one-lambda-calculus-many-times-2.html#20851" class="Bound"
      >&#928;</a
      ><a name="20938"
      >
      </a
      ><a name="20945" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="20946"
      > </a
      ><a name="20947" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#705" class="Function"
      >subst</a
      ><a name="20952"
      > </a
      ><a name="20953" class="Symbol"
      >(&#955;</a
      ><a name="20955"
      > </a
      ><a name="20956" href="2016-10-30-one-lambda-calculus-many-times-2.html#20956" class="Bound"
      >&#928;</a
      ><a name="20957"
      > </a
      ><a name="20958" class="Symbol"
      >&#8594;</a
      ><a name="20959"
      > </a
      ><a name="20960" href="2016-03-20-one-lambda-calculus-many-times.html#5371" class="Datatype Operator"
      >ND</a
      ><a name="20962"
      > </a
      ><a name="20963" class="Symbol"
      >(</a
      ><a name="20964" href="2016-10-30-one-lambda-calculus-many-times-2.html#20846" class="Bound"
      >&#915;</a
      ><a name="20965"
      > </a
      ><a name="20966" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20968"
      > </a
      ><a name="20969" href="2016-10-30-one-lambda-calculus-many-times-2.html#20848" class="Bound"
      >&#931;</a
      ><a name="20970" class="Symbol"
      >)</a
      ><a name="20971"
      > </a
      ><a name="20972" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20974"
      > </a
      ><a name="20975" href="2016-10-30-one-lambda-calculus-many-times-2.html#20956" class="Bound"
      >&#928;</a
      ><a name="20976"
      > </a
      ><a name="20977" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="20978"
      > </a
      ><a name="20979" href="2016-10-30-one-lambda-calculus-many-times-2.html#20843" class="Bound"
      >A</a
      ><a name="20980" class="Symbol"
      >)</a
      ><a name="20981"
      > </a
      ><a name="20982" class="Symbol"
      >(</a
      ><a name="20983" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#565" class="Function"
      >sym</a
      ><a name="20986"
      > </a
      ><a name="20987" class="Symbol"
      >(</a
      ><a name="20988" href="2016-10-30-one-lambda-calculus-many-times-2.html#2034" class="Function"
      >++-identity&#691;</a
      ><a name="21000"
      > </a
      ><a name="21001" href="2016-10-30-one-lambda-calculus-many-times-2.html#20851" class="Bound"
      >&#928;</a
      ><a name="21002" class="Symbol"
      >))</a
      ><a name="21004"
      >
      </a
      ><a name="21011" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="21012"
      > </a
      ><a name="21013" href="2016-10-30-one-lambda-calculus-many-times-2.html#20854" class="Bound"
      >f</a
      >
{% endraw %}</pre>
</div>



### Deriving Structural Rules in NJ

<div class="hidden">
<pre class="Agda">{% raw %}
  <a name="21109" class="Keyword"
      >module</a
      ><a name="21115"
      > </a
      ><a name="21116" href="2016-10-30-one-lambda-calculus-many-times-2.html#21116" class="Module"
      >NJ</a
      ><a name="21118"
      > </a
      ><a name="21119" class="Keyword"
      >where</a
      >
{% endraw %}</pre>
</div>

We can derive these same extended structural rules in NJ. For instance, below we derive the equivalent weakening rule:

<pre class="Agda">{% raw %}
    <a name="21281" href="2016-10-30-one-lambda-calculus-many-times-2.html#21281" class="Function"
      >w&#8314;&#8242;</a
      ><a name="21284"
      > </a
      ><a name="21285" class="Symbol"
      >:</a
      ><a name="21286"
      > </a
      ><a name="21287" class="Symbol"
      >&#8704;</a
      ><a name="21288"
      > </a
      ><a name="21293" class="Symbol"
      >&#8594;</a
      ><a name="21294"
      > </a
      ><a name="21295" class="Symbol"
      >&#8704;</a
      ><a name="21296"
      > </a
      ><a name="21297" href="2016-10-30-one-lambda-calculus-many-times-2.html#21297" class="Bound"
      >&#915;</a
      ><a name="21298"
      > </a
      ><a name="21299" class="Symbol"
      >&#8594;</a
      ><a name="21300"
      > </a
      ><a name="21301" class="Symbol"
      >&#8704;</a
      ><a name="21302"
      > </a
      ><a name="21307" class="Symbol"
      >&#8594;</a
      ><a name="21308"
      > </a
      ><a name="21309" href="2016-10-30-one-lambda-calculus-many-times-2.html#6866" class="Datatype Operator"
      >NJ</a
      ><a name="21311"
      > </a
      ><a name="21312" href="2016-10-30-one-lambda-calculus-many-times-2.html#21304" class="Bound"
      >&#916;</a
      ><a name="21313"
      > </a
      ><a name="21314" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="21315"
      > </a
      ><a name="21316" href="2016-10-30-one-lambda-calculus-many-times-2.html#21290" class="Bound"
      >A</a
      ><a name="21317"
      > </a
      ><a name="21318" class="Symbol"
      >&#8594;</a
      ><a name="21319"
      > </a
      ><a name="21320" href="2016-10-30-one-lambda-calculus-many-times-2.html#6866" class="Datatype Operator"
      >NJ</a
      ><a name="21322"
      > </a
      ><a name="21323" href="2016-10-30-one-lambda-calculus-many-times-2.html#21297" class="Bound"
      >&#915;</a
      ><a name="21324"
      > </a
      ><a name="21325" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="21327"
      > </a
      ><a name="21328" href="2016-10-30-one-lambda-calculus-many-times-2.html#21304" class="Bound"
      >&#916;</a
      ><a name="21329"
      > </a
      ><a name="21330" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="21331"
      > </a
      ><a name="21332" href="2016-10-30-one-lambda-calculus-many-times-2.html#21290" class="Bound"
      >A</a
      ><a name="21333"
      >
    </a
      ><a name="21338" href="2016-10-30-one-lambda-calculus-many-times-2.html#21281" class="Function"
      >w&#8314;&#8242;</a
      ><a name="21341"
      > </a
      ><a name="21342" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="21344"
      >      </a
      ><a name="21350" href="2016-10-30-one-lambda-calculus-many-times-2.html#21350" class="Bound"
      >f</a
      ><a name="21351"
      > </a
      ><a name="21352" class="Symbol"
      >=</a
      ><a name="21353"
      > </a
      ><a name="21354" href="2016-10-30-one-lambda-calculus-many-times-2.html#21350" class="Bound"
      >f</a
      ><a name="21355"
      >
    </a
      ><a name="21360" href="2016-10-30-one-lambda-calculus-many-times-2.html#21281" class="Function"
      >w&#8314;&#8242;</a
      ><a name="21363"
      > </a
      ><a name="21364" class="Symbol"
      >(</a
      ><a name="21365" href="2016-10-30-one-lambda-calculus-many-times-2.html#21365" class="Bound"
      >B</a
      ><a name="21366"
      > </a
      ><a name="21367" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="21368"
      > </a
      ><a name="21369" href="2016-10-30-one-lambda-calculus-many-times-2.html#21369" class="Bound"
      >&#915;</a
      ><a name="21370" class="Symbol"
      >)</a
      ><a name="21371"
      > </a
      ><a name="21372" href="2016-10-30-one-lambda-calculus-many-times-2.html#21372" class="Bound"
      >f</a
      ><a name="21373"
      > </a
      ><a name="21374" class="Symbol"
      >=</a
      ><a name="21375"
      > </a
      ><a name="21376" href="2016-10-30-one-lambda-calculus-many-times-2.html#7053" class="InductiveConstructor"
      >w</a
      ><a name="21377"
      > </a
      ><a name="21378" class="Symbol"
      >(</a
      ><a name="21379" href="2016-10-30-one-lambda-calculus-many-times-2.html#21281" class="Function"
      >w&#8314;&#8242;</a
      ><a name="21382"
      > </a
      ><a name="21383" href="2016-10-30-one-lambda-calculus-many-times-2.html#21369" class="Bound"
      >&#915;</a
      ><a name="21384"
      > </a
      ><a name="21385" href="2016-10-30-one-lambda-calculus-many-times-2.html#21372" class="Bound"
      >f</a
      ><a name="21386" class="Symbol"
      >)</a
      >
{% endraw %}</pre>

The remainder of the proofs are rather similar to those for ND,

<div class="foldable">
<pre class="Agda">{% raw %}
    <a name="21505" href="2016-10-30-one-lambda-calculus-many-times-2.html#21505" class="Function"
      >f&#8314;&#8242;</a
      ><a name="21508"
      > </a
      ><a name="21509" class="Symbol"
      >:</a
      ><a name="21510"
      > </a
      ><a name="21511" class="Symbol"
      >&#8704;</a
      ><a name="21512"
      > </a
      ><a name="21519" class="Symbol"
      >&#8594;</a
      ><a name="21520"
      > </a
      ><a name="21521" class="Symbol"
      >&#8704;</a
      ><a name="21522"
      > </a
      ><a name="21523" href="2016-10-30-one-lambda-calculus-many-times-2.html#21523" class="Bound"
      >&#915;</a
      ><a name="21524"
      > </a
      ><a name="21525" href="2016-10-30-one-lambda-calculus-many-times-2.html#21525" class="Bound"
      >&#931;</a
      ><a name="21526"
      > </a
      ><a name="21527" class="Symbol"
      >&#8594;</a
      ><a name="21528"
      > </a
      ><a name="21529" class="Symbol"
      >&#8704;</a
      ><a name="21530"
      > </a
      ><a name="21535" class="Symbol"
      >&#8594;</a
      ><a name="21536"
      > </a
      ><a name="21537" href="2016-10-30-one-lambda-calculus-many-times-2.html#6866" class="Datatype Operator"
      >NJ</a
      ><a name="21539"
      > </a
      ><a name="21540" class="Symbol"
      >(</a
      ><a name="21541" href="2016-10-30-one-lambda-calculus-many-times-2.html#21523" class="Bound"
      >&#915;</a
      ><a name="21542"
      > </a
      ><a name="21543" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="21545"
      > </a
      ><a name="21546" href="2016-10-30-one-lambda-calculus-many-times-2.html#21525" class="Bound"
      >&#931;</a
      ><a name="21547" class="Symbol"
      >)</a
      ><a name="21548"
      > </a
      ><a name="21549" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="21551"
      > </a
      ><a name="21552" class="Symbol"
      >(</a
      ><a name="21553" href="2016-10-30-one-lambda-calculus-many-times-2.html#21514" class="Bound"
      >A</a
      ><a name="21554"
      > </a
      ><a name="21555" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="21556"
      > </a
      ><a name="21557" href="2016-10-30-one-lambda-calculus-many-times-2.html#21532" class="Bound"
      >&#916;</a
      ><a name="21558" class="Symbol"
      >)</a
      ><a name="21559"
      > </a
      ><a name="21560" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="21561"
      > </a
      ><a name="21562" href="2016-10-30-one-lambda-calculus-many-times-2.html#21516" class="Bound"
      >B</a
      ><a name="21563"
      >
                </a
      ><a name="21580" class="Symbol"
      >&#8594;</a
      ><a name="21581"
      > </a
      ><a name="21582" href="2016-10-30-one-lambda-calculus-many-times-2.html#6866" class="Datatype Operator"
      >NJ</a
      ><a name="21584"
      > </a
      ><a name="21585" class="Symbol"
      >(</a
      ><a name="21586" href="2016-10-30-one-lambda-calculus-many-times-2.html#21523" class="Bound"
      >&#915;</a
      ><a name="21587"
      > </a
      ><a name="21588" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="21590"
      > </a
      ><a name="21591" href="2016-10-30-one-lambda-calculus-many-times-2.html#21514" class="Bound"
      >A</a
      ><a name="21592"
      > </a
      ><a name="21593" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="21594"
      > </a
      ><a name="21595" href="2016-10-30-one-lambda-calculus-many-times-2.html#21525" class="Bound"
      >&#931;</a
      ><a name="21596" class="Symbol"
      >)</a
      ><a name="21597"
      > </a
      ><a name="21598" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="21600"
      > </a
      ><a name="21601" href="2016-10-30-one-lambda-calculus-many-times-2.html#21532" class="Bound"
      >&#916;</a
      ><a name="21602"
      > </a
      ><a name="21603" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="21604"
      > </a
      ><a name="21605" href="2016-10-30-one-lambda-calculus-many-times-2.html#21516" class="Bound"
      >B</a
      ><a name="21606"
      >
    </a
      ><a name="21611" href="2016-10-30-one-lambda-calculus-many-times-2.html#21505" class="Function"
      >f&#8314;&#8242;</a
      ><a name="21614"
      > </a
      ><a name="21623" href="2016-10-30-one-lambda-calculus-many-times-2.html#21623" class="Bound"
      >&#915;</a
      ><a name="21624"
      > </a
      ><a name="21625" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="21627"
      > </a
      ><a name="21632" href="2016-10-30-one-lambda-calculus-many-times-2.html#21632" class="Bound"
      >f</a
      ><a name="21633"
      >
           </a
      ><a name="21645" class="Comment"
      >-- NJ (&#915; ++ A &#8759; []) ++ &#916; &#8866; .B</a
      ><a name="21674"
      >
      </a
      ><a name="21681" class="Keyword"
      >rewrite</a
      ><a name="21688"
      > </a
      ><a name="21689" href="2016-10-30-one-lambda-calculus-many-times-2.html#2034" class="Function"
      >++-identity&#691;</a
      ><a name="21701"
      > </a
      ><a name="21702" href="2016-10-30-one-lambda-calculus-many-times-2.html#21623" class="Bound"
      >&#915;</a
      ><a name="21703"
      >
           </a
      ><a name="21715" class="Comment"
      >-- NJ (&#915; ++ A &#8759; []) ++ &#916; &#8866; B</a
      ><a name="21743"
      >
            </a
      ><a name="21756" class="Symbol"
      >|</a
      ><a name="21757"
      > </a
      ><a name="21758" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#811" class="Function"
      >++-assoc</a
      ><a name="21766"
      > </a
      ><a name="21767" href="2016-10-30-one-lambda-calculus-many-times-2.html#21623" class="Bound"
      >&#915;</a
      ><a name="21768"
      > </a
      ><a name="21769" class="Symbol"
      >(</a
      ><a name="21770" href="2016-10-30-one-lambda-calculus-many-times-2.html#21616" class="Bound"
      >A</a
      ><a name="21771"
      > </a
      ><a name="21772" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="21773"
      > </a
      ><a name="21774" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="21776" class="Symbol"
      >)</a
      ><a name="21777"
      > </a
      ><a name="21778" href="2016-10-30-one-lambda-calculus-many-times-2.html#21629" class="Bound"
      >&#916;</a
      ><a name="21779"
      >
           </a
      ><a name="21791" class="Comment"
      >-- NJ &#915; ++ A &#8759; &#916; &#8866; B</a
      ><a name="21811"
      >
            </a
      ><a name="21824" class="Symbol"
      >=</a
      ><a name="21825"
      > </a
      ><a name="21826" href="2016-10-30-one-lambda-calculus-many-times-2.html#21632" class="Bound"
      >f</a
      ><a name="21827"
      >

    </a
      ><a name="21833" href="2016-10-30-one-lambda-calculus-many-times-2.html#21505" class="Function"
      >f&#8314;&#8242;</a
      ><a name="21836"
      > </a
      ><a name="21845" href="2016-10-30-one-lambda-calculus-many-times-2.html#21845" class="Bound"
      >&#915;</a
      ><a name="21846"
      > </a
      ><a name="21847" class="Symbol"
      >(</a
      ><a name="21848" href="2016-10-30-one-lambda-calculus-many-times-2.html#21848" class="Bound"
      >C</a
      ><a name="21849"
      > </a
      ><a name="21850" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="21851"
      > </a
      ><a name="21852" href="2016-10-30-one-lambda-calculus-many-times-2.html#21852" class="Bound"
      >&#931;</a
      ><a name="21853" class="Symbol"
      >)</a
      ><a name="21854"
      > </a
      ><a name="21859" href="2016-10-30-one-lambda-calculus-many-times-2.html#21859" class="Bound"
      >f</a
      ><a name="21860"
      >
      </a
      ><a name="21867" class="Keyword"
      >rewrite</a
      ><a name="21874"
      > </a
      ><a name="21875" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#811" class="Function"
      >++-assoc</a
      ><a name="21883"
      > </a
      ><a name="21884" href="2016-10-30-one-lambda-calculus-many-times-2.html#21845" class="Bound"
      >&#915;</a
      ><a name="21885"
      > </a
      ><a name="21886" class="Symbol"
      >(</a
      ><a name="21887" href="2016-10-30-one-lambda-calculus-many-times-2.html#21838" class="Bound"
      >A</a
      ><a name="21888"
      > </a
      ><a name="21889" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="21890"
      > </a
      ><a name="21891" href="2016-10-30-one-lambda-calculus-many-times-2.html#21848" class="Bound"
      >C</a
      ><a name="21892"
      > </a
      ><a name="21893" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="21894"
      > </a
      ><a name="21895" href="2016-10-30-one-lambda-calculus-many-times-2.html#21852" class="Bound"
      >&#931;</a
      ><a name="21896" class="Symbol"
      >)</a
      ><a name="21897"
      > </a
      ><a name="21898" href="2016-10-30-one-lambda-calculus-many-times-2.html#21856" class="Bound"
      >&#916;</a
      ><a name="21899"
      >
           </a
      ><a name="21911" class="Comment"
      >-- NJ &#915; ++ A &#8759; C &#8759; &#931; ++ &#916; &#8866; B</a
      ><a name="21940"
      >
            </a
      ><a name="21953" class="Symbol"
      >=</a
      ><a name="21954"
      > </a
      ><a name="21955" href="2016-10-30-one-lambda-calculus-many-times-2.html#7159" class="InductiveConstructor"
      >p</a
      ><a name="21956"
      > </a
      ><a name="21957" href="2016-10-30-one-lambda-calculus-many-times-2.html#21845" class="Bound"
      >&#915;</a
      ><a name="21958"
      > </a
      ><a name="21959" href="2016-10-30-one-lambda-calculus-many-times-2.html#21985" class="Function"
      >g</a
      ><a name="21960"
      >
        </a
      ><a name="21969" class="Keyword"
      >where</a
      ><a name="21974"
      >
          </a
      ><a name="21985" href="2016-10-30-one-lambda-calculus-many-times-2.html#21985" class="Function"
      >g</a
      ><a name="21986"
      > </a
      ><a name="21987" class="Symbol"
      >:</a
      ><a name="21988"
      > </a
      ><a name="21989" href="2016-10-30-one-lambda-calculus-many-times-2.html#6866" class="Datatype Operator"
      >NJ</a
      ><a name="21991"
      > </a
      ><a name="21992" href="2016-10-30-one-lambda-calculus-many-times-2.html#21845" class="Bound"
      >&#915;</a
      ><a name="21993"
      > </a
      ><a name="21994" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="21996"
      > </a
      ><a name="21997" href="2016-10-30-one-lambda-calculus-many-times-2.html#21848" class="Bound"
      >C</a
      ><a name="21998"
      > </a
      ><a name="21999" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22000"
      > </a
      ><a name="22001" href="2016-10-30-one-lambda-calculus-many-times-2.html#21838" class="Bound"
      >A</a
      ><a name="22002"
      > </a
      ><a name="22003" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22004"
      > </a
      ><a name="22005" href="2016-10-30-one-lambda-calculus-many-times-2.html#21852" class="Bound"
      >&#931;</a
      ><a name="22006"
      > </a
      ><a name="22007" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22009"
      > </a
      ><a name="22010" href="2016-10-30-one-lambda-calculus-many-times-2.html#21856" class="Bound"
      >&#916;</a
      ><a name="22011"
      > </a
      ><a name="22012" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="22013"
      > </a
      ><a name="22014" href="2016-10-30-one-lambda-calculus-many-times-2.html#21842" class="Bound"
      >B</a
      ><a name="22015"
      >
          </a
      ><a name="22026" href="2016-10-30-one-lambda-calculus-many-times-2.html#21985" class="Function"
      >g</a
      ><a name="22027"
      > </a
      ><a name="22028" class="Keyword"
      >rewrite</a
      ><a name="22035"
      > </a
      ><a name="22036" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#565" class="Function"
      >sym</a
      ><a name="22039"
      > </a
      ><a name="22040" class="Symbol"
      >(</a
      ><a name="22041" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#811" class="Function"
      >++-assoc</a
      ><a name="22049"
      > </a
      ><a name="22050" href="2016-10-30-one-lambda-calculus-many-times-2.html#21845" class="Bound"
      >&#915;</a
      ><a name="22051"
      > </a
      ><a name="22052" class="Symbol"
      >(</a
      ><a name="22053" href="2016-10-30-one-lambda-calculus-many-times-2.html#21848" class="Bound"
      >C</a
      ><a name="22054"
      > </a
      ><a name="22055" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22056"
      > </a
      ><a name="22057" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="22059" class="Symbol"
      >)</a
      ><a name="22060"
      > </a
      ><a name="22061" class="Symbol"
      >(</a
      ><a name="22062" href="2016-10-30-one-lambda-calculus-many-times-2.html#21838" class="Bound"
      >A</a
      ><a name="22063"
      > </a
      ><a name="22064" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22065"
      > </a
      ><a name="22066" href="2016-10-30-one-lambda-calculus-many-times-2.html#21852" class="Bound"
      >&#931;</a
      ><a name="22067"
      > </a
      ><a name="22068" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22070"
      > </a
      ><a name="22071" href="2016-10-30-one-lambda-calculus-many-times-2.html#21856" class="Bound"
      >&#916;</a
      ><a name="22072" class="Symbol"
      >))</a
      ><a name="22074"
      >
                 </a
      ><a name="22092" class="Comment"
      >-- NJ (&#915; ++ C &#8759; []) ++ A &#8759; &#931; ++ &#916; &#8866; B</a
      ><a name="22129"
      >
                  </a
      ><a name="22148" class="Symbol"
      >|</a
      ><a name="22149"
      > </a
      ><a name="22150" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#565" class="Function"
      >sym</a
      ><a name="22153"
      > </a
      ><a name="22154" class="Symbol"
      >(</a
      ><a name="22155" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#811" class="Function"
      >++-assoc</a
      ><a name="22163"
      > </a
      ><a name="22164" class="Symbol"
      >(</a
      ><a name="22165" href="2016-10-30-one-lambda-calculus-many-times-2.html#21845" class="Bound"
      >&#915;</a
      ><a name="22166"
      > </a
      ><a name="22167" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22169"
      > </a
      ><a name="22170" href="2016-10-30-one-lambda-calculus-many-times-2.html#21848" class="Bound"
      >C</a
      ><a name="22171"
      > </a
      ><a name="22172" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22173"
      > </a
      ><a name="22174" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="22176" class="Symbol"
      >)</a
      ><a name="22177"
      > </a
      ><a name="22178" class="Symbol"
      >(</a
      ><a name="22179" href="2016-10-30-one-lambda-calculus-many-times-2.html#21838" class="Bound"
      >A</a
      ><a name="22180"
      > </a
      ><a name="22181" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22182"
      > </a
      ><a name="22183" href="2016-10-30-one-lambda-calculus-many-times-2.html#21852" class="Bound"
      >&#931;</a
      ><a name="22184" class="Symbol"
      >)</a
      ><a name="22185"
      > </a
      ><a name="22186" href="2016-10-30-one-lambda-calculus-many-times-2.html#21856" class="Bound"
      >&#916;</a
      ><a name="22187" class="Symbol"
      >)</a
      ><a name="22188"
      >
                 </a
      ><a name="22206" class="Comment"
      >-- NJ ((&#915; ++ C &#8759; []) ++ A &#8759; &#931;) ++ &#916; &#8866; B</a
      ><a name="22245"
      >
                 </a
      ><a name="22263" class="Symbol"
      >=</a
      ><a name="22264"
      > </a
      ><a name="22265" href="2016-10-30-one-lambda-calculus-many-times-2.html#21505" class="Function"
      >f&#8314;&#8242;</a
      ><a name="22268"
      > </a
      ><a name="22269" class="Symbol"
      >(</a
      ><a name="22270" href="2016-10-30-one-lambda-calculus-many-times-2.html#21845" class="Bound"
      >&#915;</a
      ><a name="22271"
      > </a
      ><a name="22272" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22274"
      > </a
      ><a name="22275" href="2016-10-30-one-lambda-calculus-many-times-2.html#21848" class="Bound"
      >C</a
      ><a name="22276"
      > </a
      ><a name="22277" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22278"
      > </a
      ><a name="22279" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="22281" class="Symbol"
      >)</a
      ><a name="22282"
      > </a
      ><a name="22283" href="2016-10-30-one-lambda-calculus-many-times-2.html#21852" class="Bound"
      >&#931;</a
      ><a name="22284"
      > </a
      ><a name="22289" href="2016-10-30-one-lambda-calculus-many-times-2.html#22327" class="Function"
      >h</a
      ><a name="22290"
      >
              </a
      ><a name="22305" class="Keyword"
      >where</a
      ><a name="22310"
      >
                </a
      ><a name="22327" href="2016-10-30-one-lambda-calculus-many-times-2.html#22327" class="Function"
      >h</a
      ><a name="22328"
      > </a
      ><a name="22329" class="Symbol"
      >:</a
      ><a name="22330"
      > </a
      ><a name="22331" href="2016-10-30-one-lambda-calculus-many-times-2.html#6866" class="Datatype Operator"
      >NJ</a
      ><a name="22333"
      > </a
      ><a name="22334" class="Symbol"
      >((</a
      ><a name="22336" href="2016-10-30-one-lambda-calculus-many-times-2.html#21845" class="Bound"
      >&#915;</a
      ><a name="22337"
      > </a
      ><a name="22338" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22340"
      > </a
      ><a name="22341" href="2016-10-30-one-lambda-calculus-many-times-2.html#21848" class="Bound"
      >C</a
      ><a name="22342"
      > </a
      ><a name="22343" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22344"
      > </a
      ><a name="22345" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="22347" class="Symbol"
      >)</a
      ><a name="22348"
      > </a
      ><a name="22349" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22351"
      > </a
      ><a name="22352" href="2016-10-30-one-lambda-calculus-many-times-2.html#21852" class="Bound"
      >&#931;</a
      ><a name="22353" class="Symbol"
      >)</a
      ><a name="22354"
      > </a
      ><a name="22355" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22357"
      > </a
      ><a name="22358" href="2016-10-30-one-lambda-calculus-many-times-2.html#21838" class="Bound"
      >A</a
      ><a name="22359"
      > </a
      ><a name="22360" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22361"
      > </a
      ><a name="22362" href="2016-10-30-one-lambda-calculus-many-times-2.html#21856" class="Bound"
      >&#916;</a
      ><a name="22363"
      > </a
      ><a name="22364" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="22365"
      > </a
      ><a name="22366" href="2016-10-30-one-lambda-calculus-many-times-2.html#21842" class="Bound"
      >B</a
      ><a name="22367"
      >
                </a
      ><a name="22384" href="2016-10-30-one-lambda-calculus-many-times-2.html#22327" class="Function"
      >h</a
      ><a name="22385"
      > </a
      ><a name="22386" class="Keyword"
      >rewrite</a
      ><a name="22393"
      > </a
      ><a name="22394" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#811" class="Function"
      >++-assoc</a
      ><a name="22402"
      > </a
      ><a name="22403" href="2016-10-30-one-lambda-calculus-many-times-2.html#21845" class="Bound"
      >&#915;</a
      ><a name="22404"
      > </a
      ><a name="22405" class="Symbol"
      >(</a
      ><a name="22406" href="2016-10-30-one-lambda-calculus-many-times-2.html#21848" class="Bound"
      >C</a
      ><a name="22407"
      > </a
      ><a name="22408" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22409"
      > </a
      ><a name="22410" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="22412" class="Symbol"
      >)</a
      ><a name="22413"
      > </a
      ><a name="22414" href="2016-10-30-one-lambda-calculus-many-times-2.html#21852" class="Bound"
      >&#931;</a
      ><a name="22415"
      > </a
      ><a name="22416" class="Symbol"
      >=</a
      ><a name="22417"
      > </a
      ><a name="22418" href="2016-10-30-one-lambda-calculus-many-times-2.html#21859" class="Bound"
      >f</a
      >
{% endraw %}</pre>
</div>
<div class="foldable">
<pre class="Agda">{% raw %}
    <a name="22478" href="2016-10-30-one-lambda-calculus-many-times-2.html#22478" class="Function"
      >p&#8314;&#8242;</a
      ><a name="22481"
      > </a
      ><a name="22482" class="Symbol"
      >:</a
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
      ><a name="22492" class="Symbol"
      >&#8704;</a
      ><a name="22493"
      > </a
      ><a name="22494" href="2016-10-30-one-lambda-calculus-many-times-2.html#22494" class="Bound"
      >&#915;</a
      ><a name="22495"
      > </a
      ><a name="22496" href="2016-10-30-one-lambda-calculus-many-times-2.html#22496" class="Bound"
      >&#931;</a
      ><a name="22497"
      > </a
      ><a name="22498" href="2016-10-30-one-lambda-calculus-many-times-2.html#22498" class="Bound"
      >&#928;</a
      ><a name="22499"
      > </a
      ><a name="22500" class="Symbol"
      >&#8594;</a
      ><a name="22501"
      > </a
      ><a name="22502" class="Symbol"
      >&#8704;</a
      ><a name="22503"
      > </a
      ><a name="22508" class="Symbol"
      >&#8594;</a
      ><a name="22509"
      > </a
      ><a name="22510" href="2016-10-30-one-lambda-calculus-many-times-2.html#6866" class="Datatype Operator"
      >NJ</a
      ><a name="22512"
      > </a
      ><a name="22513" class="Symbol"
      >(</a
      ><a name="22514" href="2016-10-30-one-lambda-calculus-many-times-2.html#22494" class="Bound"
      >&#915;</a
      ><a name="22515"
      > </a
      ><a name="22516" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22518"
      > </a
      ><a name="22519" href="2016-10-30-one-lambda-calculus-many-times-2.html#22496" class="Bound"
      >&#931;</a
      ><a name="22520" class="Symbol"
      >)</a
      ><a name="22521"
      > </a
      ><a name="22522" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22524"
      > </a
      ><a name="22525" class="Symbol"
      >(</a
      ><a name="22526" href="2016-10-30-one-lambda-calculus-many-times-2.html#22498" class="Bound"
      >&#928;</a
      ><a name="22527"
      > </a
      ><a name="22528" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22530"
      > </a
      ><a name="22531" href="2016-10-30-one-lambda-calculus-many-times-2.html#22505" class="Bound"
      >&#916;</a
      ><a name="22532" class="Symbol"
      >)</a
      ><a name="22533"
      > </a
      ><a name="22534" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="22535"
      > </a
      ><a name="22536" href="2016-10-30-one-lambda-calculus-many-times-2.html#22487" class="Bound"
      >A</a
      ><a name="22537"
      >
                  </a
      ><a name="22556" class="Symbol"
      >&#8594;</a
      ><a name="22557"
      > </a
      ><a name="22558" href="2016-10-30-one-lambda-calculus-many-times-2.html#6866" class="Datatype Operator"
      >NJ</a
      ><a name="22560"
      > </a
      ><a name="22561" class="Symbol"
      >(</a
      ><a name="22562" href="2016-10-30-one-lambda-calculus-many-times-2.html#22494" class="Bound"
      >&#915;</a
      ><a name="22563"
      > </a
      ><a name="22564" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22566"
      > </a
      ><a name="22567" href="2016-10-30-one-lambda-calculus-many-times-2.html#22498" class="Bound"
      >&#928;</a
      ><a name="22568" class="Symbol"
      >)</a
      ><a name="22569"
      > </a
      ><a name="22570" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22572"
      > </a
      ><a name="22573" class="Symbol"
      >(</a
      ><a name="22574" href="2016-10-30-one-lambda-calculus-many-times-2.html#22496" class="Bound"
      >&#931;</a
      ><a name="22575"
      > </a
      ><a name="22576" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22578"
      > </a
      ><a name="22579" href="2016-10-30-one-lambda-calculus-many-times-2.html#22505" class="Bound"
      >&#916;</a
      ><a name="22580" class="Symbol"
      >)</a
      ><a name="22581"
      > </a
      ><a name="22582" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="22583"
      > </a
      ><a name="22584" href="2016-10-30-one-lambda-calculus-many-times-2.html#22487" class="Bound"
      >A</a
      ><a name="22585"
      >
    </a
      ><a name="22590" href="2016-10-30-one-lambda-calculus-many-times-2.html#22478" class="Function"
      >p&#8314;&#8242;</a
      ><a name="22593"
      > </a
      ><a name="22598" href="2016-10-30-one-lambda-calculus-many-times-2.html#22598" class="Bound"
      >&#915;</a
      ><a name="22599"
      > </a
      ><a name="22600" href="2016-10-30-one-lambda-calculus-many-times-2.html#22600" class="Bound"
      >&#931;</a
      ><a name="22601"
      > </a
      ><a name="22602" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="22604"
      > </a
      ><a name="22609" href="2016-10-30-one-lambda-calculus-many-times-2.html#22609" class="Bound"
      >f</a
      ><a name="22610"
      >
           </a
      ><a name="22622" class="Comment"
      >-- NJ (&#915; ++ []) ++ &#931; ++ &#916; &#8866; A</a
      ><a name="22651"
      >
      </a
      ><a name="22658" class="Keyword"
      >rewrite</a
      ><a name="22665"
      > </a
      ><a name="22666" href="2016-10-30-one-lambda-calculus-many-times-2.html#2034" class="Function"
      >++-identity&#691;</a
      ><a name="22678"
      > </a
      ><a name="22679" href="2016-10-30-one-lambda-calculus-many-times-2.html#22598" class="Bound"
      >&#915;</a
      ><a name="22680"
      >
           </a
      ><a name="22692" class="Comment"
      >-- NJ &#915; ++ &#931; ++ &#916; &#8866; A</a
      ><a name="22713"
      >
            </a
      ><a name="22726" class="Symbol"
      >|</a
      ><a name="22727"
      > </a
      ><a name="22728" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#565" class="Function"
      >sym</a
      ><a name="22731"
      > </a
      ><a name="22732" class="Symbol"
      >(</a
      ><a name="22733" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#811" class="Function"
      >++-assoc</a
      ><a name="22741"
      > </a
      ><a name="22742" href="2016-10-30-one-lambda-calculus-many-times-2.html#22598" class="Bound"
      >&#915;</a
      ><a name="22743"
      > </a
      ><a name="22744" href="2016-10-30-one-lambda-calculus-many-times-2.html#22600" class="Bound"
      >&#931;</a
      ><a name="22745"
      > </a
      ><a name="22746" href="2016-10-30-one-lambda-calculus-many-times-2.html#22606" class="Bound"
      >&#916;</a
      ><a name="22747" class="Symbol"
      >)</a
      ><a name="22748"
      >
           </a
      ><a name="22760" class="Comment"
      >-- NJ (&#915; ++ &#931;) ++ &#916; &#8866; A</a
      ><a name="22783"
      >
            </a
      ><a name="22796" class="Symbol"
      >=</a
      ><a name="22797"
      > </a
      ><a name="22798" href="2016-10-30-one-lambda-calculus-many-times-2.html#22609" class="Bound"
      >f</a
      ><a name="22799"
      >

    </a
      ><a name="22805" href="2016-10-30-one-lambda-calculus-many-times-2.html#22478" class="Function"
      >p&#8314;&#8242;</a
      ><a name="22808"
      > </a
      ><a name="22813" href="2016-10-30-one-lambda-calculus-many-times-2.html#22813" class="Bound"
      >&#915;</a
      ><a name="22814"
      > </a
      ><a name="22815" href="2016-10-30-one-lambda-calculus-many-times-2.html#22815" class="Bound"
      >&#931;</a
      ><a name="22816"
      > </a
      ><a name="22817" class="Symbol"
      >(</a
      ><a name="22818" href="2016-10-30-one-lambda-calculus-many-times-2.html#22818" class="Bound"
      >B</a
      ><a name="22819"
      > </a
      ><a name="22820" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22821"
      > </a
      ><a name="22822" href="2016-10-30-one-lambda-calculus-many-times-2.html#22822" class="Bound"
      >&#928;</a
      ><a name="22823" class="Symbol"
      >)</a
      ><a name="22824"
      > </a
      ><a name="22829" href="2016-10-30-one-lambda-calculus-many-times-2.html#22829" class="Bound"
      >f</a
      ><a name="22830"
      >
           </a
      ><a name="22842" class="Comment"
      >-- NJ (&#915; ++ B &#8759; &#928;) ++ &#931; ++ &#916; &#8866; A</a
      ><a name="22874"
      >
      </a
      ><a name="22881" class="Keyword"
      >rewrite</a
      ><a name="22888"
      > </a
      ><a name="22889" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#565" class="Function"
      >sym</a
      ><a name="22892"
      > </a
      ><a name="22893" class="Symbol"
      >(</a
      ><a name="22894" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#811" class="Function"
      >++-assoc</a
      ><a name="22902"
      > </a
      ><a name="22903" href="2016-10-30-one-lambda-calculus-many-times-2.html#22813" class="Bound"
      >&#915;</a
      ><a name="22904"
      > </a
      ><a name="22905" class="Symbol"
      >(</a
      ><a name="22906" href="2016-10-30-one-lambda-calculus-many-times-2.html#22818" class="Bound"
      >B</a
      ><a name="22907"
      > </a
      ><a name="22908" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22909"
      > </a
      ><a name="22910" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="22912" class="Symbol"
      >)</a
      ><a name="22913"
      > </a
      ><a name="22914" href="2016-10-30-one-lambda-calculus-many-times-2.html#22822" class="Bound"
      >&#928;</a
      ><a name="22915" class="Symbol"
      >)</a
      ><a name="22916"
      >
           </a
      ><a name="22928" class="Comment"
      >-- NJ ((&#915; ++ B &#8759; []) ++ &#928;) ++ &#931; ++ &#916; &#8866; A</a
      ><a name="22968"
      >
            </a
      ><a name="22981" class="Symbol"
      >=</a
      ><a name="22982"
      > </a
      ><a name="22983" href="2016-10-30-one-lambda-calculus-many-times-2.html#22478" class="Function"
      >p&#8314;&#8242;</a
      ><a name="22986"
      > </a
      ><a name="22987" class="Symbol"
      >(</a
      ><a name="22988" href="2016-10-30-one-lambda-calculus-many-times-2.html#22813" class="Bound"
      >&#915;</a
      ><a name="22989"
      > </a
      ><a name="22990" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22992"
      > </a
      ><a name="22993" href="2016-10-30-one-lambda-calculus-many-times-2.html#22818" class="Bound"
      >B</a
      ><a name="22994"
      > </a
      ><a name="22995" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22996"
      > </a
      ><a name="22997" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="22999" class="Symbol"
      >)</a
      ><a name="23000"
      > </a
      ><a name="23001" href="2016-10-30-one-lambda-calculus-many-times-2.html#22815" class="Bound"
      >&#931;</a
      ><a name="23002"
      > </a
      ><a name="23003" href="2016-10-30-one-lambda-calculus-many-times-2.html#22822" class="Bound"
      >&#928;</a
      ><a name="23004"
      > </a
      ><a name="23009" href="2016-10-30-one-lambda-calculus-many-times-2.html#23035" class="Function"
      >g</a
      ><a name="23010"
      >
        </a
      ><a name="23019" class="Keyword"
      >where</a
      ><a name="23024"
      >
          </a
      ><a name="23035" href="2016-10-30-one-lambda-calculus-many-times-2.html#23035" class="Function"
      >g</a
      ><a name="23036"
      > </a
      ><a name="23037" class="Symbol"
      >:</a
      ><a name="23038"
      > </a
      ><a name="23039" href="2016-10-30-one-lambda-calculus-many-times-2.html#6866" class="Datatype Operator"
      >NJ</a
      ><a name="23041"
      > </a
      ><a name="23042" class="Symbol"
      >((</a
      ><a name="23044" href="2016-10-30-one-lambda-calculus-many-times-2.html#22813" class="Bound"
      >&#915;</a
      ><a name="23045"
      > </a
      ><a name="23046" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23048"
      > </a
      ><a name="23049" href="2016-10-30-one-lambda-calculus-many-times-2.html#22818" class="Bound"
      >B</a
      ><a name="23050"
      > </a
      ><a name="23051" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23052"
      > </a
      ><a name="23053" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="23055" class="Symbol"
      >)</a
      ><a name="23056"
      > </a
      ><a name="23057" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23059"
      > </a
      ><a name="23060" href="2016-10-30-one-lambda-calculus-many-times-2.html#22815" class="Bound"
      >&#931;</a
      ><a name="23061" class="Symbol"
      >)</a
      ><a name="23062"
      > </a
      ><a name="23063" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23065"
      > </a
      ><a name="23066" href="2016-10-30-one-lambda-calculus-many-times-2.html#22822" class="Bound"
      >&#928;</a
      ><a name="23067"
      > </a
      ><a name="23068" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23070"
      > </a
      ><a name="23071" href="2016-10-30-one-lambda-calculus-many-times-2.html#22826" class="Bound"
      >&#916;</a
      ><a name="23072"
      > </a
      ><a name="23073" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="23074"
      > </a
      ><a name="23075" href="2016-10-30-one-lambda-calculus-many-times-2.html#22810" class="Bound"
      >A</a
      ><a name="23076"
      >
          </a
      ><a name="23087" href="2016-10-30-one-lambda-calculus-many-times-2.html#23035" class="Function"
      >g</a
      ><a name="23088"
      > </a
      ><a name="23089" class="Keyword"
      >rewrite</a
      ><a name="23096"
      > </a
      ><a name="23097" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#811" class="Function"
      >++-assoc</a
      ><a name="23105"
      > </a
      ><a name="23106" href="2016-10-30-one-lambda-calculus-many-times-2.html#22813" class="Bound"
      >&#915;</a
      ><a name="23107"
      > </a
      ><a name="23108" class="Symbol"
      >(</a
      ><a name="23109" href="2016-10-30-one-lambda-calculus-many-times-2.html#22818" class="Bound"
      >B</a
      ><a name="23110"
      > </a
      ><a name="23111" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23112"
      > </a
      ><a name="23113" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="23115" class="Symbol"
      >)</a
      ><a name="23116"
      > </a
      ><a name="23117" href="2016-10-30-one-lambda-calculus-many-times-2.html#22815" class="Bound"
      >&#931;</a
      ><a name="23118"
      >
                 </a
      ><a name="23136" class="Comment"
      >-- NJ (&#915; ++ B &#8759; &#931;) ++ &#928; ++ &#916; &#8866; A</a
      ><a name="23168"
      >
                  </a
      ><a name="23187" class="Symbol"
      >=</a
      ><a name="23188"
      > </a
      ><a name="23189" href="2016-10-30-one-lambda-calculus-many-times-2.html#21505" class="Function"
      >f&#8314;&#8242;</a
      ><a name="23192"
      > </a
      ><a name="23193" href="2016-10-30-one-lambda-calculus-many-times-2.html#22813" class="Bound"
      >&#915;</a
      ><a name="23194"
      > </a
      ><a name="23195" href="2016-10-30-one-lambda-calculus-many-times-2.html#22815" class="Bound"
      >&#931;</a
      ><a name="23196"
      > </a
      ><a name="23197" href="2016-10-30-one-lambda-calculus-many-times-2.html#22829" class="Bound"
      >f</a
      >
{% endraw %}</pre>
</div>
<div class="foldable">
<pre class="Agda">{% raw %}
    <a name="23257" href="2016-10-30-one-lambda-calculus-many-times-2.html#23257" class="Function"
      >c&#8314;&#8242;</a
      ><a name="23260"
      > </a
      ><a name="23261" class="Symbol"
      >:</a
      ><a name="23262"
      > </a
      ><a name="23263" class="Symbol"
      >&#8704;</a
      ><a name="23264"
      > </a
      ><a name="23269" class="Symbol"
      >&#8594;</a
      ><a name="23270"
      > </a
      ><a name="23271" class="Symbol"
      >&#8704;</a
      ><a name="23272"
      > </a
      ><a name="23273" href="2016-10-30-one-lambda-calculus-many-times-2.html#23273" class="Bound"
      >&#915;</a
      ><a name="23274"
      > </a
      ><a name="23275" class="Symbol"
      >&#8594;</a
      ><a name="23276"
      > </a
      ><a name="23277" class="Symbol"
      >&#8704;</a
      ><a name="23278"
      > </a
      ><a name="23283" class="Symbol"
      >&#8594;</a
      ><a name="23284"
      > </a
      ><a name="23285" href="2016-10-30-one-lambda-calculus-many-times-2.html#6866" class="Datatype Operator"
      >NJ</a
      ><a name="23287"
      > </a
      ><a name="23288" class="Symbol"
      >(</a
      ><a name="23289" href="2016-10-30-one-lambda-calculus-many-times-2.html#23273" class="Bound"
      >&#915;</a
      ><a name="23290"
      > </a
      ><a name="23291" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23293"
      > </a
      ><a name="23294" href="2016-10-30-one-lambda-calculus-many-times-2.html#23273" class="Bound"
      >&#915;</a
      ><a name="23295" class="Symbol"
      >)</a
      ><a name="23296"
      > </a
      ><a name="23297" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23299"
      > </a
      ><a name="23300" href="2016-10-30-one-lambda-calculus-many-times-2.html#23280" class="Bound"
      >&#916;</a
      ><a name="23301"
      > </a
      ><a name="23302" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="23303"
      > </a
      ><a name="23304" href="2016-10-30-one-lambda-calculus-many-times-2.html#23266" class="Bound"
      >A</a
      ><a name="23305"
      > </a
      ><a name="23306" class="Symbol"
      >&#8594;</a
      ><a name="23307"
      > </a
      ><a name="23308" href="2016-10-30-one-lambda-calculus-many-times-2.html#6866" class="Datatype Operator"
      >NJ</a
      ><a name="23310"
      > </a
      ><a name="23311" href="2016-10-30-one-lambda-calculus-many-times-2.html#23273" class="Bound"
      >&#915;</a
      ><a name="23312"
      > </a
      ><a name="23313" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23315"
      > </a
      ><a name="23316" href="2016-10-30-one-lambda-calculus-many-times-2.html#23280" class="Bound"
      >&#916;</a
      ><a name="23317"
      > </a
      ><a name="23318" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="23319"
      > </a
      ><a name="23320" href="2016-10-30-one-lambda-calculus-many-times-2.html#23266" class="Bound"
      >A</a
      ><a name="23321"
      >
    </a
      ><a name="23326" href="2016-10-30-one-lambda-calculus-many-times-2.html#23257" class="Function"
      >c&#8314;&#8242;</a
      ><a name="23329"
      > </a
      ><a name="23334" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="23336"
      >      </a
      ><a name="23346" href="2016-10-30-one-lambda-calculus-many-times-2.html#23346" class="Bound"
      >f</a
      ><a name="23347"
      > </a
      ><a name="23348" class="Symbol"
      >=</a
      ><a name="23349"
      > </a
      ><a name="23350" href="2016-10-30-one-lambda-calculus-many-times-2.html#23346" class="Bound"
      >f</a
      ><a name="23351"
      >
    </a
      ><a name="23356" href="2016-10-30-one-lambda-calculus-many-times-2.html#23257" class="Function"
      >c&#8314;&#8242;</a
      ><a name="23359"
      > </a
      ><a name="23364" class="Symbol"
      >(</a
      ><a name="23365" href="2016-10-30-one-lambda-calculus-many-times-2.html#23365" class="Bound"
      >B</a
      ><a name="23366"
      > </a
      ><a name="23367" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23368"
      > </a
      ><a name="23369" href="2016-10-30-one-lambda-calculus-many-times-2.html#23369" class="Bound"
      >&#915;</a
      ><a name="23370" class="Symbol"
      >)</a
      ><a name="23371"
      > </a
      ><a name="23376" href="2016-10-30-one-lambda-calculus-many-times-2.html#23376" class="Bound"
      >f</a
      ><a name="23377"
      > </a
      ><a name="23378" class="Symbol"
      >=</a
      ><a name="23379"
      > </a
      ><a name="23380" href="2016-10-30-one-lambda-calculus-many-times-2.html#7102" class="InductiveConstructor"
      >c</a
      ><a name="23381"
      > </a
      ><a name="23382" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="23383"
      > </a
      ><a name="23384" href="2016-10-30-one-lambda-calculus-many-times-2.html#22478" class="Function"
      >p&#8314;&#8242;</a
      ><a name="23387"
      > </a
      ><a name="23388" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="23390"
      > </a
      ><a name="23391" href="2016-10-30-one-lambda-calculus-many-times-2.html#23369" class="Bound"
      >&#915;</a
      ><a name="23392"
      > </a
      ><a name="23393" class="Symbol"
      >(</a
      ><a name="23394" href="2016-10-30-one-lambda-calculus-many-times-2.html#23365" class="Bound"
      >B</a
      ><a name="23395"
      > </a
      ><a name="23396" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23397"
      > </a
      ><a name="23398" href="2016-10-30-one-lambda-calculus-many-times-2.html#23365" class="Bound"
      >B</a
      ><a name="23399"
      > </a
      ><a name="23400" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23401"
      > </a
      ><a name="23402" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="23404" class="Symbol"
      >)</a
      ><a name="23405"
      >        </a
      ><a name="23413" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="23414"
      > </a
      ><a name="23415" href="2016-10-30-one-lambda-calculus-many-times-2.html#23257" class="Function"
      >c&#8314;&#8242;</a
      ><a name="23418"
      > </a
      ><a name="23419" href="2016-10-30-one-lambda-calculus-many-times-2.html#23369" class="Bound"
      >&#915;</a
      ><a name="23420"
      >
                      </a
      ><a name="23443" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="23444"
      > </a
      ><a name="23445" href="2016-10-30-one-lambda-calculus-many-times-2.html#22478" class="Function"
      >p&#8314;&#8242;</a
      ><a name="23448"
      > </a
      ><a name="23449" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="23451"
      > </a
      ><a name="23452" class="Symbol"
      >(</a
      ><a name="23453" href="2016-10-30-one-lambda-calculus-many-times-2.html#23365" class="Bound"
      >B</a
      ><a name="23454"
      > </a
      ><a name="23455" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23456"
      > </a
      ><a name="23457" href="2016-10-30-one-lambda-calculus-many-times-2.html#23365" class="Bound"
      >B</a
      ><a name="23458"
      > </a
      ><a name="23459" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23460"
      > </a
      ><a name="23461" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="23463" class="Symbol"
      >)</a
      ><a name="23464"
      > </a
      ><a name="23465" class="Symbol"
      >(</a
      ><a name="23466" href="2016-10-30-one-lambda-calculus-many-times-2.html#23369" class="Bound"
      >&#915;</a
      ><a name="23467"
      > </a
      ><a name="23468" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23470"
      > </a
      ><a name="23471" href="2016-10-30-one-lambda-calculus-many-times-2.html#23369" class="Bound"
      >&#915;</a
      ><a name="23472" class="Symbol"
      >)</a
      ><a name="23473"
      > </a
      ><a name="23474" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="23475"
      > </a
      ><a name="23476" href="2016-10-30-one-lambda-calculus-many-times-2.html#23498" class="Function"
      >g</a
      ><a name="23477"
      >
      </a
      ><a name="23484" class="Keyword"
      >where</a
      ><a name="23489"
      >
        </a
      ><a name="23498" href="2016-10-30-one-lambda-calculus-many-times-2.html#23498" class="Function"
      >g</a
      ><a name="23499"
      > </a
      ><a name="23500" class="Symbol"
      >:</a
      ><a name="23501"
      > </a
      ><a name="23502" href="2016-10-30-one-lambda-calculus-many-times-2.html#6866" class="Datatype Operator"
      >NJ</a
      ><a name="23504"
      > </a
      ><a name="23505" class="Symbol"
      >(</a
      ><a name="23506" href="2016-10-30-one-lambda-calculus-many-times-2.html#23365" class="Bound"
      >B</a
      ><a name="23507"
      > </a
      ><a name="23508" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23509"
      > </a
      ><a name="23510" href="2016-10-30-one-lambda-calculus-many-times-2.html#23365" class="Bound"
      >B</a
      ><a name="23511"
      > </a
      ><a name="23512" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23513"
      > </a
      ><a name="23514" href="2016-10-30-one-lambda-calculus-many-times-2.html#23369" class="Bound"
      >&#915;</a
      ><a name="23515"
      > </a
      ><a name="23516" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23518"
      > </a
      ><a name="23519" href="2016-10-30-one-lambda-calculus-many-times-2.html#23369" class="Bound"
      >&#915;</a
      ><a name="23520" class="Symbol"
      >)</a
      ><a name="23521"
      > </a
      ><a name="23522" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23524"
      > </a
      ><a name="23525" href="2016-10-30-one-lambda-calculus-many-times-2.html#23373" class="Bound"
      >&#916;</a
      ><a name="23526"
      > </a
      ><a name="23527" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="23528"
      > </a
      ><a name="23529" href="2016-10-30-one-lambda-calculus-many-times-2.html#23361" class="Bound"
      >A</a
      ><a name="23530"
      >
        </a
      ><a name="23539" href="2016-10-30-one-lambda-calculus-many-times-2.html#23498" class="Function"
      >g</a
      ><a name="23540"
      > </a
      ><a name="23541" class="Keyword"
      >rewrite</a
      ><a name="23548"
      > </a
      ><a name="23549" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#811" class="Function"
      >++-assoc</a
      ><a name="23557"
      > </a
      ><a name="23558" class="Symbol"
      >(</a
      ><a name="23559" href="2016-10-30-one-lambda-calculus-many-times-2.html#23365" class="Bound"
      >B</a
      ><a name="23560"
      > </a
      ><a name="23561" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23562"
      > </a
      ><a name="23563" href="2016-10-30-one-lambda-calculus-many-times-2.html#23365" class="Bound"
      >B</a
      ><a name="23564"
      > </a
      ><a name="23565" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23566"
      > </a
      ><a name="23567" href="2016-10-30-one-lambda-calculus-many-times-2.html#23369" class="Bound"
      >&#915;</a
      ><a name="23568" class="Symbol"
      >)</a
      ><a name="23569"
      > </a
      ><a name="23570" href="2016-10-30-one-lambda-calculus-many-times-2.html#23369" class="Bound"
      >&#915;</a
      ><a name="23571"
      > </a
      ><a name="23572" href="2016-10-30-one-lambda-calculus-many-times-2.html#23373" class="Bound"
      >&#916;</a
      ><a name="23573"
      >
                </a
      ><a name="23590" class="Symbol"
      >=</a
      ><a name="23591"
      > </a
      ><a name="23592" href="2016-10-30-one-lambda-calculus-many-times-2.html#21505" class="Function"
      >f&#8314;&#8242;</a
      ><a name="23595"
      > </a
      ><a name="23596" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="23598"
      > </a
      ><a name="23599" class="Symbol"
      >(</a
      ><a name="23600" href="2016-10-30-one-lambda-calculus-many-times-2.html#23365" class="Bound"
      >B</a
      ><a name="23601"
      > </a
      ><a name="23602" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23603"
      > </a
      ><a name="23604" href="2016-10-30-one-lambda-calculus-many-times-2.html#23369" class="Bound"
      >&#915;</a
      ><a name="23605" class="Symbol"
      >)</a
      ><a name="23606"
      > </a
      ><a name="23607" href="2016-10-30-one-lambda-calculus-many-times-2.html#23641" class="Function"
      >h</a
      ><a name="23608"
      >
            </a
      ><a name="23621" class="Keyword"
      >where</a
      ><a name="23626"
      >
              </a
      ><a name="23641" href="2016-10-30-one-lambda-calculus-many-times-2.html#23641" class="Function"
      >h</a
      ><a name="23642"
      > </a
      ><a name="23643" class="Symbol"
      >:</a
      ><a name="23644"
      > </a
      ><a name="23645" href="2016-10-30-one-lambda-calculus-many-times-2.html#6866" class="Datatype Operator"
      >NJ</a
      ><a name="23647"
      > </a
      ><a name="23648" href="2016-10-30-one-lambda-calculus-many-times-2.html#23365" class="Bound"
      >B</a
      ><a name="23649"
      > </a
      ><a name="23650" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23651"
      > </a
      ><a name="23652" href="2016-10-30-one-lambda-calculus-many-times-2.html#23369" class="Bound"
      >&#915;</a
      ><a name="23653"
      > </a
      ><a name="23654" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23656"
      > </a
      ><a name="23657" href="2016-10-30-one-lambda-calculus-many-times-2.html#23365" class="Bound"
      >B</a
      ><a name="23658"
      > </a
      ><a name="23659" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23660"
      > </a
      ><a name="23661" href="2016-10-30-one-lambda-calculus-many-times-2.html#23369" class="Bound"
      >&#915;</a
      ><a name="23662"
      > </a
      ><a name="23663" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23665"
      > </a
      ><a name="23666" href="2016-10-30-one-lambda-calculus-many-times-2.html#23373" class="Bound"
      >&#916;</a
      ><a name="23667"
      > </a
      ><a name="23668" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="23669"
      > </a
      ><a name="23670" href="2016-10-30-one-lambda-calculus-many-times-2.html#23361" class="Bound"
      >A</a
      ><a name="23671"
      >
              </a
      ><a name="23686" href="2016-10-30-one-lambda-calculus-many-times-2.html#23641" class="Function"
      >h</a
      ><a name="23687"
      > </a
      ><a name="23688" class="Keyword"
      >rewrite</a
      ><a name="23695"
      > </a
      ><a name="23696" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#565" class="Function"
      >sym</a
      ><a name="23699"
      > </a
      ><a name="23700" class="Symbol"
      >(</a
      ><a name="23701" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#811" class="Function"
      >++-assoc</a
      ><a name="23709"
      > </a
      ><a name="23710" class="Symbol"
      >(</a
      ><a name="23711" href="2016-10-30-one-lambda-calculus-many-times-2.html#23365" class="Bound"
      >B</a
      ><a name="23712"
      > </a
      ><a name="23713" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23714"
      > </a
      ><a name="23715" href="2016-10-30-one-lambda-calculus-many-times-2.html#23369" class="Bound"
      >&#915;</a
      ><a name="23716" class="Symbol"
      >)</a
      ><a name="23717"
      > </a
      ><a name="23718" class="Symbol"
      >(</a
      ><a name="23719" href="2016-10-30-one-lambda-calculus-many-times-2.html#23365" class="Bound"
      >B</a
      ><a name="23720"
      > </a
      ><a name="23721" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23722"
      > </a
      ><a name="23723" href="2016-10-30-one-lambda-calculus-many-times-2.html#23369" class="Bound"
      >&#915;</a
      ><a name="23724" class="Symbol"
      >)</a
      ><a name="23725"
      > </a
      ><a name="23726" href="2016-10-30-one-lambda-calculus-many-times-2.html#23373" class="Bound"
      >&#916;</a
      ><a name="23727" class="Symbol"
      >)</a
      ><a name="23728"
      >
                      </a
      ><a name="23751" class="Symbol"
      >=</a
      ><a name="23752"
      > </a
      ><a name="23753" href="2016-10-30-one-lambda-calculus-many-times-2.html#23376" class="Bound"
      >f</a
      >
{% endraw %}</pre>
</div>
<div class="foldable">
<pre class="Agda">{% raw %}
    <a name="23813" href="2016-10-30-one-lambda-calculus-many-times-2.html#23813" class="Function"
      >s&#8314;&#8242;</a
      ><a name="23816"
      > </a
      ><a name="23817" class="Symbol"
      >:</a
      ><a name="23818"
      > </a
      ><a name="23819" class="Symbol"
      >&#8704;</a
      ><a name="23820"
      > </a
      ><a name="23825" class="Symbol"
      >&#8594;</a
      ><a name="23826"
      > </a
      ><a name="23827" class="Symbol"
      >&#8704;</a
      ><a name="23828"
      > </a
      ><a name="23829" href="2016-10-30-one-lambda-calculus-many-times-2.html#23829" class="Bound"
      >&#915;</a
      ><a name="23830"
      > </a
      ><a name="23831" href="2016-10-30-one-lambda-calculus-many-times-2.html#23831" class="Bound"
      >&#931;</a
      ><a name="23832"
      > </a
      ><a name="23833" class="Symbol"
      >&#8594;</a
      ><a name="23834"
      > </a
      ><a name="23835" class="Symbol"
      >&#8704;</a
      ><a name="23836"
      > </a
      ><a name="23841" class="Symbol"
      >&#8594;</a
      ><a name="23842"
      > </a
      ><a name="23843" href="2016-10-30-one-lambda-calculus-many-times-2.html#6866" class="Datatype Operator"
      >NJ</a
      ><a name="23845"
      > </a
      ><a name="23846" class="Symbol"
      >(</a
      ><a name="23847" href="2016-10-30-one-lambda-calculus-many-times-2.html#23829" class="Bound"
      >&#915;</a
      ><a name="23848"
      > </a
      ><a name="23849" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23851"
      > </a
      ><a name="23852" href="2016-10-30-one-lambda-calculus-many-times-2.html#23831" class="Bound"
      >&#931;</a
      ><a name="23853" class="Symbol"
      >)</a
      ><a name="23854"
      > </a
      ><a name="23855" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23857"
      > </a
      ><a name="23858" href="2016-10-30-one-lambda-calculus-many-times-2.html#23838" class="Bound"
      >&#928;</a
      ><a name="23859"
      > </a
      ><a name="23860" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="23861"
      > </a
      ><a name="23862" href="2016-10-30-one-lambda-calculus-many-times-2.html#23822" class="Bound"
      >A</a
      ><a name="23863"
      >
                </a
      ><a name="23880" class="Symbol"
      >&#8594;</a
      ><a name="23881"
      > </a
      ><a name="23882" href="2016-10-30-one-lambda-calculus-many-times-2.html#6866" class="Datatype Operator"
      >NJ</a
      ><a name="23884"
      > </a
      ><a name="23885" class="Symbol"
      >(</a
      ><a name="23886" href="2016-10-30-one-lambda-calculus-many-times-2.html#23829" class="Bound"
      >&#915;</a
      ><a name="23887"
      > </a
      ><a name="23888" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23890"
      > </a
      ><a name="23891" href="2016-10-30-one-lambda-calculus-many-times-2.html#23838" class="Bound"
      >&#928;</a
      ><a name="23892" class="Symbol"
      >)</a
      ><a name="23893"
      > </a
      ><a name="23894" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23896"
      > </a
      ><a name="23897" href="2016-10-30-one-lambda-calculus-many-times-2.html#23831" class="Bound"
      >&#931;</a
      ><a name="23898"
      > </a
      ><a name="23899" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="23900"
      > </a
      ><a name="23901" href="2016-10-30-one-lambda-calculus-many-times-2.html#23822" class="Bound"
      >A</a
      ><a name="23902"
      >
    </a
      ><a name="23907" href="2016-10-30-one-lambda-calculus-many-times-2.html#23813" class="Function"
      >s&#8314;&#8242;</a
      ><a name="23910"
      > </a
      ><a name="23915" href="2016-10-30-one-lambda-calculus-many-times-2.html#23915" class="Bound"
      >&#915;</a
      ><a name="23916"
      > </a
      ><a name="23917" href="2016-10-30-one-lambda-calculus-many-times-2.html#23917" class="Bound"
      >&#931;</a
      ><a name="23918"
      > </a
      ><a name="23923" href="2016-10-30-one-lambda-calculus-many-times-2.html#23923" class="Bound"
      >f</a
      ><a name="23924"
      >
      </a
      ><a name="23931" class="Symbol"
      >=</a
      ><a name="23932"
      > </a
      ><a name="23933" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#705" class="Function"
      >subst</a
      ><a name="23938"
      > </a
      ><a name="23939" class="Symbol"
      >(&#955;</a
      ><a name="23941"
      > </a
      ><a name="23942" href="2016-10-30-one-lambda-calculus-many-times-2.html#23942" class="Bound"
      >&#931;</a
      ><a name="23943"
      > </a
      ><a name="23944" class="Symbol"
      >&#8594;</a
      ><a name="23945"
      > </a
      ><a name="23946" href="2016-10-30-one-lambda-calculus-many-times-2.html#6866" class="Datatype Operator"
      >NJ</a
      ><a name="23948"
      > </a
      ><a name="23949" class="Symbol"
      >(</a
      ><a name="23950" href="2016-10-30-one-lambda-calculus-many-times-2.html#23915" class="Bound"
      >&#915;</a
      ><a name="23951"
      > </a
      ><a name="23952" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23954"
      > </a
      ><a name="23955" href="2016-10-30-one-lambda-calculus-many-times-2.html#23920" class="Bound"
      >&#928;</a
      ><a name="23956" class="Symbol"
      >)</a
      ><a name="23957"
      > </a
      ><a name="23958" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23960"
      > </a
      ><a name="23961" href="2016-10-30-one-lambda-calculus-many-times-2.html#23942" class="Bound"
      >&#931;</a
      ><a name="23962"
      > </a
      ><a name="23963" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="23964"
      > </a
      ><a name="23965" href="2016-10-30-one-lambda-calculus-many-times-2.html#23912" class="Bound"
      >A</a
      ><a name="23966" class="Symbol"
      >)</a
      ><a name="23967"
      >      </a
      ><a name="23973" class="Symbol"
      >(</a
      ><a name="23974" href="2016-10-30-one-lambda-calculus-many-times-2.html#2034" class="Function"
      >++-identity&#691;</a
      ><a name="23986"
      > </a
      ><a name="23987" href="2016-10-30-one-lambda-calculus-many-times-2.html#23917" class="Bound"
      >&#931;</a
      ><a name="23988" class="Symbol"
      >)</a
      ><a name="23989"
      >
      </a
      ><a name="23996" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="23997"
      > </a
      ><a name="23998" href="2016-10-30-one-lambda-calculus-many-times-2.html#22478" class="Function"
      >p&#8314;&#8242;</a
      ><a name="24001"
      > </a
      ><a name="24002" href="2016-10-30-one-lambda-calculus-many-times-2.html#23915" class="Bound"
      >&#915;</a
      ><a name="24003"
      > </a
      ><a name="24004" href="2016-10-30-one-lambda-calculus-many-times-2.html#23917" class="Bound"
      >&#931;</a
      ><a name="24005"
      > </a
      ><a name="24006" href="2016-10-30-one-lambda-calculus-many-times-2.html#23920" class="Bound"
      >&#928;</a
      ><a name="24007"
      >
      </a
      ><a name="24014" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="24015"
      > </a
      ><a name="24016" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#705" class="Function"
      >subst</a
      ><a name="24021"
      > </a
      ><a name="24022" class="Symbol"
      >(&#955;</a
      ><a name="24024"
      > </a
      ><a name="24025" href="2016-10-30-one-lambda-calculus-many-times-2.html#24025" class="Bound"
      >&#928;</a
      ><a name="24026"
      > </a
      ><a name="24027" class="Symbol"
      >&#8594;</a
      ><a name="24028"
      > </a
      ><a name="24029" href="2016-10-30-one-lambda-calculus-many-times-2.html#6866" class="Datatype Operator"
      >NJ</a
      ><a name="24031"
      > </a
      ><a name="24032" class="Symbol"
      >(</a
      ><a name="24033" href="2016-10-30-one-lambda-calculus-many-times-2.html#23915" class="Bound"
      >&#915;</a
      ><a name="24034"
      > </a
      ><a name="24035" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="24037"
      > </a
      ><a name="24038" href="2016-10-30-one-lambda-calculus-many-times-2.html#23917" class="Bound"
      >&#931;</a
      ><a name="24039" class="Symbol"
      >)</a
      ><a name="24040"
      > </a
      ><a name="24041" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="24043"
      > </a
      ><a name="24044" href="2016-10-30-one-lambda-calculus-many-times-2.html#24025" class="Bound"
      >&#928;</a
      ><a name="24045"
      > </a
      ><a name="24046" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="24047"
      > </a
      ><a name="24048" href="2016-10-30-one-lambda-calculus-many-times-2.html#23912" class="Bound"
      >A</a
      ><a name="24049" class="Symbol"
      >)</a
      ><a name="24050"
      > </a
      ><a name="24051" class="Symbol"
      >(</a
      ><a name="24052" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#565" class="Function"
      >sym</a
      ><a name="24055"
      > </a
      ><a name="24056" class="Symbol"
      >(</a
      ><a name="24057" href="2016-10-30-one-lambda-calculus-many-times-2.html#2034" class="Function"
      >++-identity&#691;</a
      ><a name="24069"
      > </a
      ><a name="24070" href="2016-10-30-one-lambda-calculus-many-times-2.html#23920" class="Bound"
      >&#928;</a
      ><a name="24071" class="Symbol"
      >))</a
      ><a name="24073"
      >
      </a
      ><a name="24080" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="24081"
      > </a
      ><a name="24082" href="2016-10-30-one-lambda-calculus-many-times-2.html#23923" class="Bound"
      >f</a
      >
{% endraw %}</pre>
</div>

<pre class="Agda">{% raw %}
    <a name="24120" href="2016-10-30-one-lambda-calculus-many-times-2.html#24120" class="Function"
      >ax&#8242;</a
      ><a name="24123"
      > </a
      ><a name="24124" class="Symbol"
      >:</a
      ><a name="24125"
      > </a
      ><a name="24126" class="Symbol"
      >&#8704;</a
      ><a name="24127"
      > </a
      ><a name="24134" class="Symbol"
      >&#8594;</a
      ><a name="24135"
      > </a
      ><a name="24136" href="2016-10-30-one-lambda-calculus-many-times-2.html#24129" class="Bound"
      >A</a
      ><a name="24137"
      > </a
      ><a name="24138" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#2920" class="Function Operator"
      >&#8712;</a
      ><a name="24139"
      > </a
      ><a name="24140" href="2016-10-30-one-lambda-calculus-many-times-2.html#24131" class="Bound"
      >&#915;</a
      ><a name="24141"
      > </a
      ><a name="24142" class="Symbol"
      >&#8594;</a
      ><a name="24143"
      > </a
      ><a name="24144" href="2016-10-30-one-lambda-calculus-many-times-2.html#6866" class="Datatype Operator"
      >NJ</a
      ><a name="24146"
      > </a
      ><a name="24147" href="2016-10-30-one-lambda-calculus-many-times-2.html#24131" class="Bound"
      >&#915;</a
      ><a name="24148"
      > </a
      ><a name="24149" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="24150"
      > </a
      ><a name="24151" href="2016-10-30-one-lambda-calculus-many-times-2.html#24129" class="Bound"
      >A</a
      ><a name="24152"
      >
    </a
      ><a name="24157" href="2016-10-30-one-lambda-calculus-many-times-2.html#24120" class="Function"
      >ax&#8242;</a
      ><a name="24160"
      > </a
      ><a name="24173" class="Symbol"
      >(</a
      ><a name="24174" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="24178"
      > </a
      ><a name="24179" href="2016-10-30-one-lambda-calculus-many-times-2.html#24179" class="Bound"
      >px</a
      ><a name="24181" class="Symbol"
      >)</a
      ><a name="24182"
      > </a
      ><a name="24183" class="Keyword"
      >rewrite</a
      ><a name="24190"
      > </a
      ><a name="24191" href="2016-10-30-one-lambda-calculus-many-times-2.html#24179" class="Bound"
      >px</a
      ><a name="24193"
      > </a
      ><a name="24194" class="Symbol"
      >=</a
      ><a name="24195"
      > </a
      ><a name="24196" href="2016-10-30-one-lambda-calculus-many-times-2.html#23813" class="Function"
      >s&#8314;&#8242;</a
      ><a name="24199"
      > </a
      ><a name="24200" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="24202"
      > </a
      ><a name="24203" href="2016-10-30-one-lambda-calculus-many-times-2.html#24170" class="Bound"
      >&#915;</a
      ><a name="24204"
      > </a
      ><a name="24205" class="Symbol"
      >(</a
      ><a name="24206" href="2016-10-30-one-lambda-calculus-many-times-2.html#21281" class="Function"
      >w&#8314;&#8242;</a
      ><a name="24209"
      > </a
      ><a name="24210" href="2016-10-30-one-lambda-calculus-many-times-2.html#24170" class="Bound"
      >&#915;</a
      ><a name="24211"
      > </a
      ><a name="24212" href="2016-10-30-one-lambda-calculus-many-times-2.html#6896" class="InductiveConstructor"
      >ax</a
      ><a name="24214" class="Symbol"
      >)</a
      ><a name="24215"
      >
    </a
      ><a name="24220" href="2016-10-30-one-lambda-calculus-many-times-2.html#24120" class="Function"
      >ax&#8242;</a
      ><a name="24223"
      > </a
      ><a name="24236" class="Symbol"
      >(</a
      ><a name="24237" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="24242"
      > </a
      ><a name="24243" href="2016-10-30-one-lambda-calculus-many-times-2.html#24243" class="Bound"
      >x</a
      ><a name="24244" class="Symbol"
      >)</a
      ><a name="24245"
      >            </a
      ><a name="24257" class="Symbol"
      >=</a
      ><a name="24258"
      > </a
      ><a name="24259" href="2016-10-30-one-lambda-calculus-many-times-2.html#7053" class="InductiveConstructor"
      >w</a
      ><a name="24260"
      > </a
      ><a name="24261" class="Symbol"
      >(</a
      ><a name="24262" href="2016-10-30-one-lambda-calculus-many-times-2.html#24120" class="Function"
      >ax&#8242;</a
      ><a name="24265"
      > </a
      ><a name="24266" href="2016-10-30-one-lambda-calculus-many-times-2.html#24243" class="Bound"
      >x</a
      ><a name="24267" class="Symbol"
      >)</a
      >
{% endraw %}</pre>

It turns out to be very useful to define two helper functions which introduce and eliminate the empty context to the right. This is because <span class="Agda Spec"><a class="Bound">Γ</a> <a href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator" target="_blank">++</a> <a href="https://agda.github.io/agda-stdlib/Agda.Builtin.List.html#89" class="InductiveConstructor" target="_blank">[]</a></span> doesn't automatically reduce. Therefore, any proof in which the empty context occurs to the right would involve rewriting by <a class="Agda Spec Function">++&#8209;identityʳ</a>.

<pre class="Agda">{% raw %}
    <a name="24913" href="2016-10-30-one-lambda-calculus-many-times-2.html#24913" class="Function"
      >&#8709;i</a
      ><a name="24915"
      > </a
      ><a name="24916" class="Symbol"
      >:</a
      ><a name="24917"
      > </a
      ><a name="24918" class="Symbol"
      >&#8704;</a
      ><a name="24919"
      > </a
      ><a name="24926" class="Symbol"
      >&#8594;</a
      ><a name="24927"
      > </a
      ><a name="24928" href="2016-10-30-one-lambda-calculus-many-times-2.html#6866" class="Datatype Operator"
      >NJ</a
      ><a name="24930"
      > </a
      ><a name="24931" href="2016-10-30-one-lambda-calculus-many-times-2.html#24923" class="Bound"
      >&#915;</a
      ><a name="24932"
      > </a
      ><a name="24933" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="24934"
      > </a
      ><a name="24935" href="2016-10-30-one-lambda-calculus-many-times-2.html#24921" class="Bound"
      >A</a
      ><a name="24936"
      > </a
      ><a name="24937" class="Symbol"
      >&#8594;</a
      ><a name="24938"
      > </a
      ><a name="24939" href="2016-10-30-one-lambda-calculus-many-times-2.html#6866" class="Datatype Operator"
      >NJ</a
      ><a name="24941"
      > </a
      ><a name="24942" href="2016-10-30-one-lambda-calculus-many-times-2.html#24923" class="Bound"
      >&#915;</a
      ><a name="24943"
      > </a
      ><a name="24944" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="24946"
      > </a
      ><a name="24947" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="24949"
      > </a
      ><a name="24950" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="24951"
      > </a
      ><a name="24952" href="2016-10-30-one-lambda-calculus-many-times-2.html#24921" class="Bound"
      >A</a
      ><a name="24953"
      >
    </a
      ><a name="24958" href="2016-10-30-one-lambda-calculus-many-times-2.html#24913" class="Function"
      >&#8709;i</a
      ><a name="24960"
      > </a
      ><a name="24969" href="2016-10-30-one-lambda-calculus-many-times-2.html#24969" class="Bound"
      >f</a
      ><a name="24970"
      > </a
      ><a name="24971" class="Keyword"
      >rewrite</a
      ><a name="24978"
      > </a
      ><a name="24979" href="2016-10-30-one-lambda-calculus-many-times-2.html#2034" class="Function"
      >++-identity&#691;</a
      ><a name="24991"
      > </a
      ><a name="24992" href="2016-10-30-one-lambda-calculus-many-times-2.html#24966" class="Bound"
      >&#915;</a
      ><a name="24993"
      > </a
      ><a name="24994" class="Symbol"
      >=</a
      ><a name="24995"
      > </a
      ><a name="24996" href="2016-10-30-one-lambda-calculus-many-times-2.html#24969" class="Bound"
      >f</a
      ><a name="24997"
      >
    </a
      ><a name="25002" href="2016-10-30-one-lambda-calculus-many-times-2.html#25002" class="Function"
      >&#8709;e</a
      ><a name="25004"
      > </a
      ><a name="25005" class="Symbol"
      >:</a
      ><a name="25006"
      > </a
      ><a name="25007" class="Symbol"
      >&#8704;</a
      ><a name="25008"
      > </a
      ><a name="25015" class="Symbol"
      >&#8594;</a
      ><a name="25016"
      > </a
      ><a name="25017" href="2016-10-30-one-lambda-calculus-many-times-2.html#6866" class="Datatype Operator"
      >NJ</a
      ><a name="25019"
      > </a
      ><a name="25020" href="2016-10-30-one-lambda-calculus-many-times-2.html#25012" class="Bound"
      >&#915;</a
      ><a name="25021"
      > </a
      ><a name="25022" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="25024"
      > </a
      ><a name="25025" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="25027"
      > </a
      ><a name="25028" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="25029"
      > </a
      ><a name="25030" href="2016-10-30-one-lambda-calculus-many-times-2.html#25010" class="Bound"
      >A</a
      ><a name="25031"
      > </a
      ><a name="25032" class="Symbol"
      >&#8594;</a
      ><a name="25033"
      > </a
      ><a name="25034" href="2016-10-30-one-lambda-calculus-many-times-2.html#6866" class="Datatype Operator"
      >NJ</a
      ><a name="25036"
      > </a
      ><a name="25037" href="2016-10-30-one-lambda-calculus-many-times-2.html#25012" class="Bound"
      >&#915;</a
      ><a name="25038"
      > </a
      ><a name="25039" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="25040"
      > </a
      ><a name="25041" href="2016-10-30-one-lambda-calculus-many-times-2.html#25010" class="Bound"
      >A</a
      ><a name="25042"
      >
    </a
      ><a name="25047" href="2016-10-30-one-lambda-calculus-many-times-2.html#25002" class="Function"
      >&#8709;e</a
      ><a name="25049"
      > </a
      ><a name="25058" href="2016-10-30-one-lambda-calculus-many-times-2.html#25058" class="Bound"
      >f</a
      ><a name="25059"
      > </a
      ><a name="25060" class="Keyword"
      >rewrite</a
      ><a name="25067"
      > </a
      ><a name="25068" href="2016-10-30-one-lambda-calculus-many-times-2.html#2034" class="Function"
      >++-identity&#691;</a
      ><a name="25080"
      > </a
      ><a name="25081" href="2016-10-30-one-lambda-calculus-many-times-2.html#25055" class="Bound"
      >&#915;</a
      ><a name="25082"
      > </a
      ><a name="25083" class="Symbol"
      >=</a
      ><a name="25084"
      > </a
      ><a name="25085" href="2016-10-30-one-lambda-calculus-many-times-2.html#25058" class="Bound"
      >f</a
      >
{% endraw %}</pre>



### Implicit and Explicit Structural Rules

<pre class="Agda">{% raw %}
  <a name="25160" class="Keyword"
      >module</a
      ><a name="25166"
      > </a
      ><a name="25167" href="2016-10-30-one-lambda-calculus-many-times-2.html#25167" class="Module"
      >NJ&#8660;ND</a
      ><a name="25172"
      > </a
      ><a name="25173" class="Keyword"
      >where</a
      ><a name="25178"
      >

    </a
      ><a name="25184" href="2016-10-30-one-lambda-calculus-many-times-2.html#25184" class="Function"
      >&#10233;</a
      ><a name="25185"
      > </a
      ><a name="25186" class="Symbol"
      >:</a
      ><a name="25187"
      > </a
      ><a name="25188" class="Symbol"
      >&#8704;</a
      ><a name="25189"
      > </a
      ><a name="25194" class="Symbol"
      >&#8594;</a
      ><a name="25195"
      > </a
      ><a name="25196" href="2016-10-30-one-lambda-calculus-many-times-2.html#6866" class="Datatype Operator"
      >NJ</a
      ><a name="25198"
      > </a
      ><a name="25199" href="2016-10-30-one-lambda-calculus-many-times-2.html#25191" class="Bound"
      >S</a
      ><a name="25200"
      > </a
      ><a name="25201" class="Symbol"
      >&#8594;</a
      ><a name="25202"
      > </a
      ><a name="25203" href="2016-03-20-one-lambda-calculus-many-times.html#5371" class="Datatype Operator"
      >ND</a
      ><a name="25205"
      > </a
      ><a name="25206" href="2016-10-30-one-lambda-calculus-many-times-2.html#25191" class="Bound"
      >S</a
      ><a name="25207"
      >
    </a
      ><a name="25212" href="2016-10-30-one-lambda-calculus-many-times-2.html#25184" class="Function"
      >&#10233;</a
      ><a name="25213"
      >  </a
      ><a name="25215" href="2016-10-30-one-lambda-calculus-many-times-2.html#6896" class="InductiveConstructor"
      >ax</a
      ><a name="25217"
      >         </a
      ><a name="25226" class="Symbol"
      >=</a
      ><a name="25227"
      > </a
      ><a name="25228" href="2016-03-20-one-lambda-calculus-many-times.html#10226" class="InductiveConstructor"
      >ax&#8320;</a
      ><a name="25231"
      >
    </a
      ><a name="25236" href="2016-10-30-one-lambda-calculus-many-times-2.html#25184" class="Function"
      >&#10233;</a
      ><a name="25237"
      > </a
      ><a name="25238" class="Symbol"
      >(</a
      ><a name="25239" href="2016-10-30-one-lambda-calculus-many-times-2.html#6935" class="InductiveConstructor"
      >&#8658;i</a
      ><a name="25241"
      > </a
      ><a name="25242" href="2016-10-30-one-lambda-calculus-many-times-2.html#25242" class="Bound"
      >f</a
      ><a name="25243"
      >  </a
      ><a name="25245" class="Symbol"
      >)</a
      ><a name="25246"
      >    </a
      ><a name="25250" class="Symbol"
      >=</a
      ><a name="25251"
      > </a
      ><a name="25252" href="2016-03-20-one-lambda-calculus-many-times.html#5439" class="InductiveConstructor"
      >&#8658;i</a
      ><a name="25254"
      > </a
      ><a name="25255" class="Symbol"
      >(</a
      ><a name="25256" href="2016-10-30-one-lambda-calculus-many-times-2.html#25184" class="Function"
      >&#10233;</a
      ><a name="25257"
      > </a
      ><a name="25258" href="2016-10-30-one-lambda-calculus-many-times-2.html#25242" class="Bound"
      >f</a
      ><a name="25259" class="Symbol"
      >)</a
      ><a name="25260"
      >
    </a
      ><a name="25265" href="2016-10-30-one-lambda-calculus-many-times-2.html#25184" class="Function"
      >&#10233;</a
      ><a name="25266"
      > </a
      ><a name="25267" class="Symbol"
      >(</a
      ><a name="25268" href="2016-10-30-one-lambda-calculus-many-times-2.html#6988" class="InductiveConstructor"
      >&#8658;e</a
      ><a name="25270"
      > </a
      ><a name="25271" class="Symbol"
      >{</a
      ><a name="25272" class="Argument"
      >&#915;</a
      ><a name="25273"
      > </a
      ><a name="25274" class="Symbol"
      >=</a
      ><a name="25275"
      > </a
      ><a name="25276" href="2016-10-30-one-lambda-calculus-many-times-2.html#25276" class="Bound"
      >&#915;</a
      ><a name="25277" class="Symbol"
      >}</a
      ><a name="25278"
      > </a
      ><a name="25279" href="2016-10-30-one-lambda-calculus-many-times-2.html#25279" class="Bound"
      >f</a
      ><a name="25280"
      > </a
      ><a name="25281" href="2016-10-30-one-lambda-calculus-many-times-2.html#25281" class="Bound"
      >g</a
      ><a name="25282" class="Symbol"
      >)</a
      ><a name="25283"
      >    </a
      ><a name="25287" class="Symbol"
      >=</a
      ><a name="25288"
      > </a
      ><a name="25289" href="2016-03-20-one-lambda-calculus-many-times.html#5488" class="InductiveConstructor"
      >&#8658;e</a
      ><a name="25291"
      > </a
      ><a name="25292" class="Symbol"
      >(</a
      ><a name="25293" href="2016-10-30-one-lambda-calculus-many-times-2.html#25336" class="Function"
      >inl</a
      ><a name="25296"
      > </a
      ><a name="25297" class="Symbol"
      >(</a
      ><a name="25298" href="2016-10-30-one-lambda-calculus-many-times-2.html#25184" class="Function"
      >&#10233;</a
      ><a name="25299"
      > </a
      ><a name="25300" href="2016-10-30-one-lambda-calculus-many-times-2.html#25279" class="Bound"
      >f</a
      ><a name="25301" class="Symbol"
      >))</a
      ><a name="25303"
      > </a
      ><a name="25304" class="Symbol"
      >(</a
      ><a name="25305" href="2016-10-30-one-lambda-calculus-many-times-2.html#25434" class="Function"
      >inr</a
      ><a name="25308"
      > </a
      ><a name="25309" class="Symbol"
      >(</a
      ><a name="25310" href="2016-10-30-one-lambda-calculus-many-times-2.html#25184" class="Function"
      >&#10233;</a
      ><a name="25311"
      > </a
      ><a name="25312" href="2016-10-30-one-lambda-calculus-many-times-2.html#25281" class="Bound"
      >g</a
      ><a name="25313" class="Symbol"
      >))</a
      ><a name="25315"
      >
      </a
      ><a name="25322" class="Keyword"
      >where</a
      ><a name="25327"
      >
        </a
      ><a name="25336" href="2016-10-30-one-lambda-calculus-many-times-2.html#25336" class="Function"
      >inl</a
      ><a name="25339"
      > </a
      ><a name="25340" class="Symbol"
      >:</a
      ><a name="25341"
      > </a
      ><a name="25342" class="Symbol"
      >&#8704;</a
      ><a name="25343"
      > </a
      ><a name="25350" class="Symbol"
      >&#8594;</a
      ><a name="25351"
      > </a
      ><a name="25352" href="2016-03-20-one-lambda-calculus-many-times.html#5371" class="Datatype Operator"
      >ND</a
      ><a name="25354"
      > </a
      ><a name="25355" href="2016-10-30-one-lambda-calculus-many-times-2.html#25276" class="Bound"
      >&#915;</a
      ><a name="25356"
      > </a
      ><a name="25357" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="25358"
      > </a
      ><a name="25359" href="2016-10-30-one-lambda-calculus-many-times-2.html#25345" class="Bound"
      >A</a
      ><a name="25360"
      > </a
      ><a name="25361" class="Symbol"
      >&#8594;</a
      ><a name="25362"
      > </a
      ><a name="25363" href="2016-03-20-one-lambda-calculus-many-times.html#5371" class="Datatype Operator"
      >ND</a
      ><a name="25365"
      > </a
      ><a name="25366" href="2016-10-30-one-lambda-calculus-many-times-2.html#25276" class="Bound"
      >&#915;</a
      ><a name="25367"
      > </a
      ><a name="25368" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="25370"
      > </a
      ><a name="25371" href="2016-10-30-one-lambda-calculus-many-times-2.html#25347" class="Bound"
      >&#916;</a
      ><a name="25372"
      > </a
      ><a name="25373" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="25374"
      > </a
      ><a name="25375" href="2016-10-30-one-lambda-calculus-many-times-2.html#25345" class="Bound"
      >A</a
      ><a name="25376"
      >
        </a
      ><a name="25385" href="2016-10-30-one-lambda-calculus-many-times-2.html#25336" class="Function"
      >inl</a
      ><a name="25388"
      > </a
      ><a name="25389" class="Symbol"
      >{</a
      ><a name="25390" class="Argument"
      >&#916;</a
      ><a name="25391"
      > </a
      ><a name="25392" class="Symbol"
      >=</a
      ><a name="25393"
      > </a
      ><a name="25394" href="2016-10-30-one-lambda-calculus-many-times-2.html#25394" class="Bound"
      >&#916;</a
      ><a name="25395" class="Symbol"
      >}</a
      ><a name="25396"
      > </a
      ><a name="25397" href="2016-10-30-one-lambda-calculus-many-times-2.html#25397" class="Bound"
      >f</a
      ><a name="25398"
      > </a
      ><a name="25399" class="Symbol"
      >=</a
      ><a name="25400"
      > </a
      ><a name="25401" href="2016-10-30-one-lambda-calculus-many-times-2.html#20744" class="Function"
      >ND.s&#8314;&#8242;</a
      ><a name="25407"
      > </a
      ><a name="25408" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="25410"
      > </a
      ><a name="25411" href="2016-10-30-one-lambda-calculus-many-times-2.html#25394" class="Bound"
      >&#916;</a
      ><a name="25412"
      > </a
      ><a name="25413" class="Symbol"
      >(</a
      ><a name="25414" href="2016-10-30-one-lambda-calculus-many-times-2.html#20349" class="Function"
      >ND.w&#8314;&#8242;</a
      ><a name="25420"
      > </a
      ><a name="25421" href="2016-10-30-one-lambda-calculus-many-times-2.html#25394" class="Bound"
      >&#916;</a
      ><a name="25422"
      > </a
      ><a name="25423" href="2016-10-30-one-lambda-calculus-many-times-2.html#25397" class="Bound"
      >f</a
      ><a name="25424" class="Symbol"
      >)</a
      ><a name="25425"
      >
        </a
      ><a name="25434" href="2016-10-30-one-lambda-calculus-many-times-2.html#25434" class="Function"
      >inr</a
      ><a name="25437"
      > </a
      ><a name="25438" class="Symbol"
      >:</a
      ><a name="25439"
      > </a
      ><a name="25440" class="Symbol"
      >&#8704;</a
      ><a name="25441"
      > </a
      ><a name="25448" class="Symbol"
      >&#8594;</a
      ><a name="25449"
      > </a
      ><a name="25450" href="2016-03-20-one-lambda-calculus-many-times.html#5371" class="Datatype Operator"
      >ND</a
      ><a name="25452"
      > </a
      ><a name="25453" href="2016-10-30-one-lambda-calculus-many-times-2.html#25445" class="Bound"
      >&#916;</a
      ><a name="25454"
      > </a
      ><a name="25455" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="25456"
      > </a
      ><a name="25457" href="2016-10-30-one-lambda-calculus-many-times-2.html#25443" class="Bound"
      >A</a
      ><a name="25458"
      > </a
      ><a name="25459" class="Symbol"
      >&#8594;</a
      ><a name="25460"
      > </a
      ><a name="25461" href="2016-03-20-one-lambda-calculus-many-times.html#5371" class="Datatype Operator"
      >ND</a
      ><a name="25463"
      > </a
      ><a name="25464" href="2016-10-30-one-lambda-calculus-many-times-2.html#25276" class="Bound"
      >&#915;</a
      ><a name="25465"
      > </a
      ><a name="25466" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="25468"
      > </a
      ><a name="25469" href="2016-10-30-one-lambda-calculus-many-times-2.html#25445" class="Bound"
      >&#916;</a
      ><a name="25470"
      > </a
      ><a name="25471" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="25472"
      > </a
      ><a name="25473" href="2016-10-30-one-lambda-calculus-many-times-2.html#25443" class="Bound"
      >A</a
      ><a name="25474"
      >
        </a
      ><a name="25483" href="2016-10-30-one-lambda-calculus-many-times-2.html#25434" class="Function"
      >inr</a
      ><a name="25486"
      > </a
      ><a name="25487" href="2016-10-30-one-lambda-calculus-many-times-2.html#25487" class="Bound"
      >f</a
      ><a name="25488"
      > </a
      ><a name="25489" class="Symbol"
      >=</a
      ><a name="25490"
      > </a
      ><a name="25491" href="2016-10-30-one-lambda-calculus-many-times-2.html#20349" class="Function"
      >ND.w&#8314;&#8242;</a
      ><a name="25497"
      > </a
      ><a name="25498" href="2016-10-30-one-lambda-calculus-many-times-2.html#25276" class="Bound"
      >&#915;</a
      ><a name="25499"
      > </a
      ><a name="25500" href="2016-10-30-one-lambda-calculus-many-times-2.html#25487" class="Bound"
      >f</a
      ><a name="25501"
      >

    </a
      ><a name="25507" href="2016-10-30-one-lambda-calculus-many-times-2.html#25184" class="Function"
      >&#10233;</a
      ><a name="25508"
      > </a
      ><a name="25509" class="Symbol"
      >(</a
      ><a name="25510" href="2016-10-30-one-lambda-calculus-many-times-2.html#7053" class="InductiveConstructor"
      >w</a
      ><a name="25511"
      >    </a
      ><a name="25515" href="2016-10-30-one-lambda-calculus-many-times-2.html#25515" class="Bound"
      >f</a
      ><a name="25516" class="Symbol"
      >)</a
      ><a name="25517"
      >    </a
      ><a name="25521" class="Symbol"
      >=</a
      ><a name="25522"
      > </a
      ><a name="25523" href="2016-03-20-one-lambda-calculus-many-times.html#8603" class="Function"
      >ND.w&#8242;</a
      ><a name="25528"
      >   </a
      ><a name="25531" class="Symbol"
      >(</a
      ><a name="25532" href="2016-10-30-one-lambda-calculus-many-times-2.html#25184" class="Function"
      >&#10233;</a
      ><a name="25533"
      > </a
      ><a name="25534" href="2016-10-30-one-lambda-calculus-many-times-2.html#25515" class="Bound"
      >f</a
      ><a name="25535" class="Symbol"
      >)</a
      ><a name="25536"
      >
    </a
      ><a name="25541" href="2016-10-30-one-lambda-calculus-many-times-2.html#25184" class="Function"
      >&#10233;</a
      ><a name="25542"
      > </a
      ><a name="25543" class="Symbol"
      >(</a
      ><a name="25544" href="2016-10-30-one-lambda-calculus-many-times-2.html#7102" class="InductiveConstructor"
      >c</a
      ><a name="25545"
      >    </a
      ><a name="25549" href="2016-10-30-one-lambda-calculus-many-times-2.html#25549" class="Bound"
      >f</a
      ><a name="25550" class="Symbol"
      >)</a
      ><a name="25551"
      >    </a
      ><a name="25555" class="Symbol"
      >=</a
      ><a name="25556"
      > </a
      ><a name="25557" href="2016-10-30-one-lambda-calculus-many-times-2.html#12161" class="Function"
      >ND.c&#8242;</a
      ><a name="25562"
      >   </a
      ><a name="25565" class="Symbol"
      >(</a
      ><a name="25566" href="2016-10-30-one-lambda-calculus-many-times-2.html#25184" class="Function"
      >&#10233;</a
      ><a name="25567"
      > </a
      ><a name="25568" href="2016-10-30-one-lambda-calculus-many-times-2.html#25549" class="Bound"
      >f</a
      ><a name="25569" class="Symbol"
      >)</a
      ><a name="25570"
      >
    </a
      ><a name="25575" href="2016-10-30-one-lambda-calculus-many-times-2.html#25184" class="Function"
      >&#10233;</a
      ><a name="25576"
      > </a
      ><a name="25577" class="Symbol"
      >(</a
      ><a name="25578" href="2016-10-30-one-lambda-calculus-many-times-2.html#7159" class="InductiveConstructor"
      >p</a
      ><a name="25579"
      >  </a
      ><a name="25581" href="2016-10-30-one-lambda-calculus-many-times-2.html#25581" class="Bound"
      >&#915;</a
      ><a name="25582"
      > </a
      ><a name="25583" href="2016-10-30-one-lambda-calculus-many-times-2.html#25583" class="Bound"
      >f</a
      ><a name="25584" class="Symbol"
      >)</a
      ><a name="25585"
      >    </a
      ><a name="25589" class="Symbol"
      >=</a
      ><a name="25590"
      > </a
      ><a name="25591" href="2016-10-30-one-lambda-calculus-many-times-2.html#12546" class="Function"
      >ND.p&#8242;</a
      ><a name="25596"
      > </a
      ><a name="25597" href="2016-10-30-one-lambda-calculus-many-times-2.html#25581" class="Bound"
      >&#915;</a
      ><a name="25598"
      > </a
      ><a name="25599" class="Symbol"
      >(</a
      ><a name="25600" href="2016-10-30-one-lambda-calculus-many-times-2.html#25184" class="Function"
      >&#10233;</a
      ><a name="25601"
      > </a
      ><a name="25602" href="2016-10-30-one-lambda-calculus-many-times-2.html#25583" class="Bound"
      >f</a
      ><a name="25603" class="Symbol"
      >)</a
      ><a name="25604"
      >

    </a
      ><a name="25610" href="2016-10-30-one-lambda-calculus-many-times-2.html#25610" class="Function"
      >&#10232;</a
      ><a name="25611"
      > </a
      ><a name="25612" class="Symbol"
      >:</a
      ><a name="25613"
      > </a
      ><a name="25614" class="Symbol"
      >&#8704;</a
      ><a name="25615"
      > </a
      ><a name="25620" class="Symbol"
      >&#8594;</a
      ><a name="25621"
      > </a
      ><a name="25622" href="2016-03-20-one-lambda-calculus-many-times.html#5371" class="Datatype Operator"
      >ND</a
      ><a name="25624"
      > </a
      ><a name="25625" href="2016-10-30-one-lambda-calculus-many-times-2.html#25617" class="Bound"
      >S</a
      ><a name="25626"
      > </a
      ><a name="25627" class="Symbol"
      >&#8594;</a
      ><a name="25628"
      > </a
      ><a name="25629" href="2016-10-30-one-lambda-calculus-many-times-2.html#6866" class="Datatype Operator"
      >NJ</a
      ><a name="25631"
      > </a
      ><a name="25632" href="2016-10-30-one-lambda-calculus-many-times-2.html#25617" class="Bound"
      >S</a
      ><a name="25633"
      >
    </a
      ><a name="25638" href="2016-10-30-one-lambda-calculus-many-times-2.html#25610" class="Function"
      >&#10232;</a
      ><a name="25639"
      > </a
      ><a name="25640" class="Symbol"
      >(</a
      ><a name="25641" href="2016-03-20-one-lambda-calculus-many-times.html#5401" class="InductiveConstructor"
      >ax</a
      ><a name="25643"
      >  </a
      ><a name="25645" href="2016-10-30-one-lambda-calculus-many-times-2.html#25645" class="Bound"
      >x</a
      ><a name="25646" class="Symbol"
      >)</a
      ><a name="25647"
      >     </a
      ><a name="25652" class="Symbol"
      >=</a
      ><a name="25653"
      > </a
      ><a name="25654" href="2016-10-30-one-lambda-calculus-many-times-2.html#24120" class="Function"
      >NJ.ax&#8242;</a
      ><a name="25660"
      > </a
      ><a name="25661" href="2016-10-30-one-lambda-calculus-many-times-2.html#25645" class="Bound"
      >x</a
      ><a name="25662"
      >
    </a
      ><a name="25667" href="2016-10-30-one-lambda-calculus-many-times-2.html#25610" class="Function"
      >&#10232;</a
      ><a name="25668"
      > </a
      ><a name="25669" class="Symbol"
      >(</a
      ><a name="25670" href="2016-03-20-one-lambda-calculus-many-times.html#5439" class="InductiveConstructor"
      >&#8658;i</a
      ><a name="25672"
      >  </a
      ><a name="25674" href="2016-10-30-one-lambda-calculus-many-times-2.html#25674" class="Bound"
      >f</a
      ><a name="25675" class="Symbol"
      >)</a
      ><a name="25676"
      >     </a
      ><a name="25681" class="Symbol"
      >=</a
      ><a name="25682"
      > </a
      ><a name="25683" href="2016-10-30-one-lambda-calculus-many-times-2.html#6935" class="InductiveConstructor"
      >&#8658;i</a
      ><a name="25685"
      >  </a
      ><a name="25687" class="Symbol"
      >(</a
      ><a name="25688" href="2016-10-30-one-lambda-calculus-many-times-2.html#25610" class="Function"
      >&#10232;</a
      ><a name="25689"
      > </a
      ><a name="25690" href="2016-10-30-one-lambda-calculus-many-times-2.html#25674" class="Bound"
      >f</a
      ><a name="25691" class="Symbol"
      >)</a
      ><a name="25692"
      >
    </a
      ><a name="25697" href="2016-10-30-one-lambda-calculus-many-times-2.html#25610" class="Function"
      >&#10232;</a
      ><a name="25698"
      > </a
      ><a name="25699" class="Symbol"
      >(</a
      ><a name="25700" href="2016-03-20-one-lambda-calculus-many-times.html#5488" class="InductiveConstructor"
      >&#8658;e</a
      ><a name="25702"
      >  </a
      ><a name="25704" class="Symbol"
      >{</a
      ><a name="25705" class="Argument"
      >&#915;</a
      ><a name="25706"
      > </a
      ><a name="25707" class="Symbol"
      >=</a
      ><a name="25708"
      > </a
      ><a name="25709" href="2016-10-30-one-lambda-calculus-many-times-2.html#25709" class="Bound"
      >&#915;</a
      ><a name="25710" class="Symbol"
      >}</a
      ><a name="25711"
      > </a
      ><a name="25712" href="2016-10-30-one-lambda-calculus-many-times-2.html#25712" class="Bound"
      >f</a
      ><a name="25713"
      > </a
      ><a name="25714" href="2016-10-30-one-lambda-calculus-many-times-2.html#25714" class="Bound"
      >g</a
      ><a name="25715" class="Symbol"
      >)</a
      ><a name="25716"
      >   </a
      ><a name="25719" class="Symbol"
      >=</a
      ><a name="25720"
      > </a
      ><a name="25721" href="2016-10-30-one-lambda-calculus-many-times-2.html#25002" class="Function"
      >NJ.&#8709;e</a
      ><a name="25726"
      > </a
      ><a name="25727" class="Symbol"
      >(</a
      ><a name="25728" href="2016-10-30-one-lambda-calculus-many-times-2.html#23257" class="Function"
      >NJ.c&#8314;&#8242;</a
      ><a name="25734"
      > </a
      ><a name="25735" href="2016-10-30-one-lambda-calculus-many-times-2.html#25709" class="Bound"
      >&#915;</a
      ><a name="25736"
      > </a
      ><a name="25737" class="Symbol"
      >(</a
      ><a name="25738" href="2016-10-30-one-lambda-calculus-many-times-2.html#24913" class="Function"
      >NJ.&#8709;i</a
      ><a name="25743"
      > </a
      ><a name="25744" class="Symbol"
      >(</a
      ><a name="25745" href="2016-10-30-one-lambda-calculus-many-times-2.html#6988" class="InductiveConstructor"
      >&#8658;e</a
      ><a name="25747"
      > </a
      ><a name="25748" class="Symbol"
      >(</a
      ><a name="25749" href="2016-10-30-one-lambda-calculus-many-times-2.html#25610" class="Function"
      >&#10232;</a
      ><a name="25750"
      > </a
      ><a name="25751" href="2016-10-30-one-lambda-calculus-many-times-2.html#25712" class="Bound"
      >f</a
      ><a name="25752" class="Symbol"
      >)</a
      ><a name="25753"
      > </a
      ><a name="25754" class="Symbol"
      >(</a
      ><a name="25755" href="2016-10-30-one-lambda-calculus-many-times-2.html#25610" class="Function"
      >&#10232;</a
      ><a name="25756"
      > </a
      ><a name="25757" href="2016-10-30-one-lambda-calculus-many-times-2.html#25714" class="Bound"
      >g</a
      ><a name="25758" class="Symbol"
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
  <a name="26466" class="Keyword"
      >infix</a
      ><a name="26471"
      > </a
      ><a name="26472" class="Number"
      >3</a
      ><a name="26473"
      > LJ_

  </a
      ><a name="26481" class="Keyword"
      >data</a
      ><a name="26485"
      > </a
      ><a name="26486" href="2016-10-30-one-lambda-calculus-many-times-2.html#26486" class="Datatype Operator"
      >LJ_</a
      ><a name="26489"
      > </a
      ><a name="26490" class="Symbol"
      >:</a
      ><a name="26491"
      > </a
      ><a name="26492" href="2016-03-20-one-lambda-calculus-many-times.html#3955" class="Datatype"
      >Sequent</a
      ><a name="26499"
      > </a
      ><a name="26500" class="Symbol"
      >&#8594;</a
      ><a name="26501"
      > </a
      ><a name="26502" class="PrimitiveType"
      >Set</a
      ><a name="26505"
      > </a
      ><a name="26506" class="Keyword"
      >where</a
      ><a name="26511"
      >
    </a
      ><a name="26516" href="2016-10-30-one-lambda-calculus-many-times-2.html#26516" class="InductiveConstructor"
      >ax</a
      ><a name="26518"
      >  </a
      ><a name="26520" class="Symbol"
      >:</a
      ><a name="26521"
      > </a
      ><a name="26522" class="Symbol"
      >&#8704;</a
      ><a name="26523"
      > </a
      ><a name="26536" class="Symbol"
      >&#8594;</a
      ><a name="26537"
      > </a
      ><a name="26538" href="2016-10-30-one-lambda-calculus-many-times-2.html#26486" class="Datatype Operator"
      >LJ</a
      ><a name="26540"
      > </a
      ><a name="26541" href="2016-10-30-one-lambda-calculus-many-times-2.html#26525" class="Bound"
      >A</a
      ><a name="26542"
      > </a
      ><a name="26543" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="26544"
      > </a
      ><a name="26545" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="26547"
      > </a
      ><a name="26548" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26549"
      > </a
      ><a name="26550" href="2016-10-30-one-lambda-calculus-many-times-2.html#26525" class="Bound"
      >A</a
      ><a name="26551"
      >
    </a
      ><a name="26556" href="2016-10-30-one-lambda-calculus-many-times-2.html#26556" class="InductiveConstructor"
      >cut</a
      ><a name="26559"
      > </a
      ><a name="26560" class="Symbol"
      >:</a
      ><a name="26561"
      > </a
      ><a name="26562" class="Symbol"
      >&#8704;</a
      ><a name="26563"
      > </a
      ><a name="26576" class="Symbol"
      >&#8594;</a
      ><a name="26577"
      > </a
      ><a name="26578" href="2016-10-30-one-lambda-calculus-many-times-2.html#26486" class="Datatype Operator"
      >LJ</a
      ><a name="26580"
      > </a
      ><a name="26581" href="2016-10-30-one-lambda-calculus-many-times-2.html#26571" class="Bound"
      >&#915;</a
      ><a name="26582"
      > </a
      ><a name="26583" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26584"
      > </a
      ><a name="26585" href="2016-10-30-one-lambda-calculus-many-times-2.html#26565" class="Bound"
      >A</a
      ><a name="26586"
      > </a
      ><a name="26587" class="Symbol"
      >&#8594;</a
      ><a name="26588"
      > </a
      ><a name="26589" href="2016-10-30-one-lambda-calculus-many-times-2.html#26486" class="Datatype Operator"
      >LJ</a
      ><a name="26591"
      > </a
      ><a name="26592" href="2016-10-30-one-lambda-calculus-many-times-2.html#26565" class="Bound"
      >A</a
      ><a name="26593"
      > </a
      ><a name="26594" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="26595"
      > </a
      ><a name="26596" href="2016-10-30-one-lambda-calculus-many-times-2.html#26573" class="Bound"
      >&#916;</a
      ><a name="26597"
      > </a
      ><a name="26598" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26599"
      > </a
      ><a name="26600" href="2016-10-30-one-lambda-calculus-many-times-2.html#26567" class="Bound"
      >B</a
      ><a name="26601"
      > </a
      ><a name="26602" class="Symbol"
      >&#8594;</a
      ><a name="26603"
      > </a
      ><a name="26604" href="2016-10-30-one-lambda-calculus-many-times-2.html#26486" class="Datatype Operator"
      >LJ</a
      ><a name="26606"
      > </a
      ><a name="26607" href="2016-10-30-one-lambda-calculus-many-times-2.html#26571" class="Bound"
      >&#915;</a
      ><a name="26608"
      > </a
      ><a name="26609" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="26611"
      > </a
      ><a name="26612" href="2016-10-30-one-lambda-calculus-many-times-2.html#26573" class="Bound"
      >&#916;</a
      ><a name="26613"
      > </a
      ><a name="26614" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26615"
      > </a
      ><a name="26616" href="2016-10-30-one-lambda-calculus-many-times-2.html#26567" class="Bound"
      >B</a
      ><a name="26617"
      >
    </a
      ><a name="26622" href="2016-10-30-one-lambda-calculus-many-times-2.html#26622" class="InductiveConstructor"
      >&#8658;l</a
      ><a name="26624"
      >  </a
      ><a name="26626" class="Symbol"
      >:</a
      ><a name="26627"
      > </a
      ><a name="26628" class="Symbol"
      >&#8704;</a
      ><a name="26629"
      > </a
      ><a name="26642" class="Symbol"
      >&#8594;</a
      ><a name="26643"
      > </a
      ><a name="26644" href="2016-10-30-one-lambda-calculus-many-times-2.html#26486" class="Datatype Operator"
      >LJ</a
      ><a name="26646"
      > </a
      ><a name="26647" href="2016-10-30-one-lambda-calculus-many-times-2.html#26637" class="Bound"
      >&#915;</a
      ><a name="26648"
      > </a
      ><a name="26649" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26650"
      > </a
      ><a name="26651" href="2016-10-30-one-lambda-calculus-many-times-2.html#26631" class="Bound"
      >A</a
      ><a name="26652"
      > </a
      ><a name="26653" class="Symbol"
      >&#8594;</a
      ><a name="26654"
      > </a
      ><a name="26655" href="2016-10-30-one-lambda-calculus-many-times-2.html#26486" class="Datatype Operator"
      >LJ</a
      ><a name="26657"
      > </a
      ><a name="26658" href="2016-10-30-one-lambda-calculus-many-times-2.html#26633" class="Bound"
      >B</a
      ><a name="26659"
      > </a
      ><a name="26660" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="26661"
      > </a
      ><a name="26662" href="2016-10-30-one-lambda-calculus-many-times-2.html#26639" class="Bound"
      >&#916;</a
      ><a name="26663"
      > </a
      ><a name="26664" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26665"
      > </a
      ><a name="26666" href="2016-10-30-one-lambda-calculus-many-times-2.html#26635" class="Bound"
      >C</a
      ><a name="26667"
      > </a
      ><a name="26668" class="Symbol"
      >&#8594;</a
      ><a name="26669"
      > </a
      ><a name="26670" href="2016-10-30-one-lambda-calculus-many-times-2.html#26486" class="Datatype Operator"
      >LJ</a
      ><a name="26672"
      > </a
      ><a name="26673" href="2016-10-30-one-lambda-calculus-many-times-2.html#26631" class="Bound"
      >A</a
      ><a name="26674"
      > </a
      ><a name="26675" href="2016-03-20-one-lambda-calculus-many-times.html#2692" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="26676"
      > </a
      ><a name="26677" href="2016-10-30-one-lambda-calculus-many-times-2.html#26633" class="Bound"
      >B</a
      ><a name="26678"
      > </a
      ><a name="26679" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="26680"
      > </a
      ><a name="26681" href="2016-10-30-one-lambda-calculus-many-times-2.html#26637" class="Bound"
      >&#915;</a
      ><a name="26682"
      > </a
      ><a name="26683" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="26685"
      > </a
      ><a name="26686" href="2016-10-30-one-lambda-calculus-many-times-2.html#26639" class="Bound"
      >&#916;</a
      ><a name="26687"
      > </a
      ><a name="26688" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26689"
      > </a
      ><a name="26690" href="2016-10-30-one-lambda-calculus-many-times-2.html#26635" class="Bound"
      >C</a
      ><a name="26691"
      >
    </a
      ><a name="26696" href="2016-10-30-one-lambda-calculus-many-times-2.html#26696" class="InductiveConstructor"
      >&#8658;r</a
      ><a name="26698"
      >  </a
      ><a name="26700" class="Symbol"
      >:</a
      ><a name="26701"
      > </a
      ><a name="26702" class="Symbol"
      >&#8704;</a
      ><a name="26703"
      > </a
      ><a name="26716" class="Symbol"
      >&#8594;</a
      ><a name="26717"
      > </a
      ><a name="26718" href="2016-10-30-one-lambda-calculus-many-times-2.html#26486" class="Datatype Operator"
      >LJ</a
      ><a name="26720"
      > </a
      ><a name="26721" href="2016-10-30-one-lambda-calculus-many-times-2.html#26705" class="Bound"
      >A</a
      ><a name="26722"
      > </a
      ><a name="26723" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="26724"
      > </a
      ><a name="26725" href="2016-10-30-one-lambda-calculus-many-times-2.html#26711" class="Bound"
      >&#915;</a
      ><a name="26726"
      > </a
      ><a name="26727" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26728"
      > </a
      ><a name="26729" href="2016-10-30-one-lambda-calculus-many-times-2.html#26707" class="Bound"
      >B</a
      ><a name="26730"
      > </a
      ><a name="26731" class="Symbol"
      >&#8594;</a
      ><a name="26732"
      > </a
      ><a name="26733" href="2016-10-30-one-lambda-calculus-many-times-2.html#26486" class="Datatype Operator"
      >LJ</a
      ><a name="26735"
      > </a
      ><a name="26736" href="2016-10-30-one-lambda-calculus-many-times-2.html#26711" class="Bound"
      >&#915;</a
      ><a name="26737"
      > </a
      ><a name="26738" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26739"
      > </a
      ><a name="26740" href="2016-10-30-one-lambda-calculus-many-times-2.html#26705" class="Bound"
      >A</a
      ><a name="26741"
      > </a
      ><a name="26742" href="2016-03-20-one-lambda-calculus-many-times.html#2692" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="26743"
      > </a
      ><a name="26744" href="2016-10-30-one-lambda-calculus-many-times-2.html#26707" class="Bound"
      >B</a
      ><a name="26745"
      >
    </a
      ><a name="26750" href="2016-10-30-one-lambda-calculus-many-times-2.html#26750" class="InductiveConstructor"
      >w</a
      ><a name="26751"
      >   </a
      ><a name="26754" class="Symbol"
      >:</a
      ><a name="26755"
      > </a
      ><a name="26756" class="Symbol"
      >&#8704;</a
      ><a name="26757"
      > </a
      ><a name="26770" class="Symbol"
      >&#8594;</a
      ><a name="26771"
      > </a
      ><a name="26772" href="2016-10-30-one-lambda-calculus-many-times-2.html#26486" class="Datatype Operator"
      >LJ</a
      ><a name="26774"
      > </a
      ><a name="26775" href="2016-10-30-one-lambda-calculus-many-times-2.html#26765" class="Bound"
      >&#915;</a
      ><a name="26776"
      > </a
      ><a name="26777" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26778"
      > </a
      ><a name="26779" href="2016-10-30-one-lambda-calculus-many-times-2.html#26761" class="Bound"
      >B</a
      ><a name="26780"
      > </a
      ><a name="26781" class="Symbol"
      >&#8594;</a
      ><a name="26782"
      > </a
      ><a name="26783" href="2016-10-30-one-lambda-calculus-many-times-2.html#26486" class="Datatype Operator"
      >LJ</a
      ><a name="26785"
      > </a
      ><a name="26786" href="2016-10-30-one-lambda-calculus-many-times-2.html#26759" class="Bound"
      >A</a
      ><a name="26787"
      > </a
      ><a name="26788" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="26789"
      > </a
      ><a name="26790" href="2016-10-30-one-lambda-calculus-many-times-2.html#26765" class="Bound"
      >&#915;</a
      ><a name="26791"
      > </a
      ><a name="26792" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26793"
      > </a
      ><a name="26794" href="2016-10-30-one-lambda-calculus-many-times-2.html#26761" class="Bound"
      >B</a
      ><a name="26795"
      >
    </a
      ><a name="26800" href="2016-10-30-one-lambda-calculus-many-times-2.html#26800" class="InductiveConstructor"
      >c</a
      ><a name="26801"
      >   </a
      ><a name="26804" class="Symbol"
      >:</a
      ><a name="26805"
      > </a
      ><a name="26806" class="Symbol"
      >&#8704;</a
      ><a name="26807"
      > </a
      ><a name="26820" class="Symbol"
      >&#8594;</a
      ><a name="26821"
      > </a
      ><a name="26822" href="2016-10-30-one-lambda-calculus-many-times-2.html#26486" class="Datatype Operator"
      >LJ</a
      ><a name="26824"
      > </a
      ><a name="26825" href="2016-10-30-one-lambda-calculus-many-times-2.html#26809" class="Bound"
      >A</a
      ><a name="26826"
      > </a
      ><a name="26827" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="26828"
      > </a
      ><a name="26829" href="2016-10-30-one-lambda-calculus-many-times-2.html#26809" class="Bound"
      >A</a
      ><a name="26830"
      > </a
      ><a name="26831" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="26832"
      > </a
      ><a name="26833" href="2016-10-30-one-lambda-calculus-many-times-2.html#26815" class="Bound"
      >&#915;</a
      ><a name="26834"
      > </a
      ><a name="26835" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26836"
      > </a
      ><a name="26837" href="2016-10-30-one-lambda-calculus-many-times-2.html#26811" class="Bound"
      >B</a
      ><a name="26838"
      > </a
      ><a name="26839" class="Symbol"
      >&#8594;</a
      ><a name="26840"
      > </a
      ><a name="26841" href="2016-10-30-one-lambda-calculus-many-times-2.html#26486" class="Datatype Operator"
      >LJ</a
      ><a name="26843"
      > </a
      ><a name="26844" href="2016-10-30-one-lambda-calculus-many-times-2.html#26809" class="Bound"
      >A</a
      ><a name="26845"
      > </a
      ><a name="26846" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="26847"
      > </a
      ><a name="26848" href="2016-10-30-one-lambda-calculus-many-times-2.html#26815" class="Bound"
      >&#915;</a
      ><a name="26849"
      > </a
      ><a name="26850" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26851"
      > </a
      ><a name="26852" href="2016-10-30-one-lambda-calculus-many-times-2.html#26811" class="Bound"
      >B</a
      ><a name="26853"
      >
    </a
      ><a name="26858" href="2016-10-30-one-lambda-calculus-many-times-2.html#26858" class="InductiveConstructor"
      >p</a
      ><a name="26859"
      >   </a
      ><a name="26862" class="Symbol"
      >:</a
      ><a name="26863"
      > </a
      ><a name="26864" class="Symbol"
      >&#8704;</a
      ><a name="26865"
      > </a
      ><a name="26874" class="Symbol"
      >&#8594;</a
      ><a name="26875"
      > </a
      ><a name="26876" class="Symbol"
      >&#8704;</a
      ><a name="26877"
      > </a
      ><a name="26878" href="2016-10-30-one-lambda-calculus-many-times-2.html#26878" class="Bound"
      >&#915;</a
      ><a name="26879"
      > </a
      ><a name="26880" class="Symbol"
      >&#8594;</a
      ><a name="26881"
      > </a
      ><a name="26882" class="Symbol"
      >&#8704;</a
      ><a name="26883"
      > </a
      ><a name="26888" class="Symbol"
      >&#8594;</a
      ><a name="26889"
      > </a
      ><a name="26890" href="2016-10-30-one-lambda-calculus-many-times-2.html#26486" class="Datatype Operator"
      >LJ</a
      ><a name="26892"
      > </a
      ><a name="26893" href="2016-10-30-one-lambda-calculus-many-times-2.html#26878" class="Bound"
      >&#915;</a
      ><a name="26894"
      > </a
      ><a name="26895" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="26897"
      > </a
      ><a name="26898" href="2016-10-30-one-lambda-calculus-many-times-2.html#26867" class="Bound"
      >A</a
      ><a name="26899"
      > </a
      ><a name="26900" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="26901"
      > </a
      ><a name="26902" href="2016-10-30-one-lambda-calculus-many-times-2.html#26869" class="Bound"
      >B</a
      ><a name="26903"
      > </a
      ><a name="26904" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="26905"
      > </a
      ><a name="26906" href="2016-10-30-one-lambda-calculus-many-times-2.html#26885" class="Bound"
      >&#916;</a
      ><a name="26907"
      > </a
      ><a name="26908" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26909"
      > </a
      ><a name="26910" href="2016-10-30-one-lambda-calculus-many-times-2.html#26871" class="Bound"
      >C</a
      ><a name="26911"
      > </a
      ><a name="26912" class="Symbol"
      >&#8594;</a
      ><a name="26913"
      > </a
      ><a name="26914" href="2016-10-30-one-lambda-calculus-many-times-2.html#26486" class="Datatype Operator"
      >LJ</a
      ><a name="26916"
      > </a
      ><a name="26917" href="2016-10-30-one-lambda-calculus-many-times-2.html#26878" class="Bound"
      >&#915;</a
      ><a name="26918"
      > </a
      ><a name="26919" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="26921"
      > </a
      ><a name="26922" href="2016-10-30-one-lambda-calculus-many-times-2.html#26869" class="Bound"
      >B</a
      ><a name="26923"
      > </a
      ><a name="26924" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="26925"
      > </a
      ><a name="26926" href="2016-10-30-one-lambda-calculus-many-times-2.html#26867" class="Bound"
      >A</a
      ><a name="26927"
      > </a
      ><a name="26928" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="26929"
      > </a
      ><a name="26930" href="2016-10-30-one-lambda-calculus-many-times-2.html#26885" class="Bound"
      >&#916;</a
      ><a name="26931"
      > </a
      ><a name="26932" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26933"
      > </a
      ><a name="26934" href="2016-10-30-one-lambda-calculus-many-times-2.html#26871" class="Bound"
      >C</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
  <a name="26984" class="Keyword"
      >module</a
      ><a name="26990"
      > </a
      ><a name="26991" href="2016-10-30-one-lambda-calculus-many-times-2.html#26991" class="Module"
      >LJ</a
      ><a name="26993"
      > </a
      ><a name="26994" class="Keyword"
      >where</a
      >
{% endraw %}</pre>
</div>


<pre class="Agda">{% raw %}
    <a name="27037" href="2016-10-30-one-lambda-calculus-many-times-2.html#27037" class="Function"
      >&#8709;i</a
      ><a name="27039"
      > </a
      ><a name="27040" class="Symbol"
      >:</a
      ><a name="27041"
      > </a
      ><a name="27042" class="Symbol"
      >&#8704;</a
      ><a name="27043"
      > </a
      ><a name="27050" class="Symbol"
      >&#8594;</a
      ><a name="27051"
      > </a
      ><a name="27052" href="2016-10-30-one-lambda-calculus-many-times-2.html#26486" class="Datatype Operator"
      >LJ</a
      ><a name="27054"
      > </a
      ><a name="27055" href="2016-10-30-one-lambda-calculus-many-times-2.html#27047" class="Bound"
      >&#915;</a
      ><a name="27056"
      > </a
      ><a name="27057" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="27058"
      > </a
      ><a name="27059" href="2016-10-30-one-lambda-calculus-many-times-2.html#27045" class="Bound"
      >A</a
      ><a name="27060"
      > </a
      ><a name="27061" class="Symbol"
      >&#8594;</a
      ><a name="27062"
      > </a
      ><a name="27063" href="2016-10-30-one-lambda-calculus-many-times-2.html#26486" class="Datatype Operator"
      >LJ</a
      ><a name="27065"
      > </a
      ><a name="27066" href="2016-10-30-one-lambda-calculus-many-times-2.html#27047" class="Bound"
      >&#915;</a
      ><a name="27067"
      > </a
      ><a name="27068" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="27070"
      > </a
      ><a name="27071" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="27073"
      > </a
      ><a name="27074" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="27075"
      > </a
      ><a name="27076" href="2016-10-30-one-lambda-calculus-many-times-2.html#27045" class="Bound"
      >A</a
      ><a name="27077"
      >
    </a
      ><a name="27082" href="2016-10-30-one-lambda-calculus-many-times-2.html#27037" class="Function"
      >&#8709;i</a
      ><a name="27084"
      > </a
      ><a name="27093" href="2016-10-30-one-lambda-calculus-many-times-2.html#27093" class="Bound"
      >f</a
      ><a name="27094"
      > </a
      ><a name="27095" class="Keyword"
      >rewrite</a
      ><a name="27102"
      > </a
      ><a name="27103" href="2016-10-30-one-lambda-calculus-many-times-2.html#2034" class="Function"
      >++-identity&#691;</a
      ><a name="27115"
      > </a
      ><a name="27116" href="2016-10-30-one-lambda-calculus-many-times-2.html#27090" class="Bound"
      >&#915;</a
      ><a name="27117"
      > </a
      ><a name="27118" class="Symbol"
      >=</a
      ><a name="27119"
      > </a
      ><a name="27120" href="2016-10-30-one-lambda-calculus-many-times-2.html#27093" class="Bound"
      >f</a
      ><a name="27121"
      >
    </a
      ><a name="27126" href="2016-10-30-one-lambda-calculus-many-times-2.html#27126" class="Function"
      >&#8709;e</a
      ><a name="27128"
      > </a
      ><a name="27129" class="Symbol"
      >:</a
      ><a name="27130"
      > </a
      ><a name="27131" class="Symbol"
      >&#8704;</a
      ><a name="27132"
      > </a
      ><a name="27139" class="Symbol"
      >&#8594;</a
      ><a name="27140"
      > </a
      ><a name="27141" href="2016-10-30-one-lambda-calculus-many-times-2.html#26486" class="Datatype Operator"
      >LJ</a
      ><a name="27143"
      > </a
      ><a name="27144" href="2016-10-30-one-lambda-calculus-many-times-2.html#27136" class="Bound"
      >&#915;</a
      ><a name="27145"
      > </a
      ><a name="27146" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="27148"
      > </a
      ><a name="27149" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="27151"
      > </a
      ><a name="27152" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="27153"
      > </a
      ><a name="27154" href="2016-10-30-one-lambda-calculus-many-times-2.html#27134" class="Bound"
      >A</a
      ><a name="27155"
      > </a
      ><a name="27156" class="Symbol"
      >&#8594;</a
      ><a name="27157"
      > </a
      ><a name="27158" href="2016-10-30-one-lambda-calculus-many-times-2.html#26486" class="Datatype Operator"
      >LJ</a
      ><a name="27160"
      > </a
      ><a name="27161" href="2016-10-30-one-lambda-calculus-many-times-2.html#27136" class="Bound"
      >&#915;</a
      ><a name="27162"
      > </a
      ><a name="27163" href="2016-03-20-one-lambda-calculus-many-times.html#3979" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="27164"
      > </a
      ><a name="27165" href="2016-10-30-one-lambda-calculus-many-times-2.html#27134" class="Bound"
      >A</a
      ><a name="27166"
      >
    </a
      ><a name="27171" href="2016-10-30-one-lambda-calculus-many-times-2.html#27126" class="Function"
      >&#8709;e</a
      ><a name="27173"
      > </a
      ><a name="27182" href="2016-10-30-one-lambda-calculus-many-times-2.html#27182" class="Bound"
      >f</a
      ><a name="27183"
      > </a
      ><a name="27184" class="Keyword"
      >rewrite</a
      ><a name="27191"
      > </a
      ><a name="27192" href="2016-10-30-one-lambda-calculus-many-times-2.html#2034" class="Function"
      >++-identity&#691;</a
      ><a name="27204"
      > </a
      ><a name="27205" href="2016-10-30-one-lambda-calculus-many-times-2.html#27179" class="Bound"
      >&#915;</a
      ><a name="27206"
      > </a
      ><a name="27207" class="Symbol"
      >=</a
      ><a name="27208"
      > </a
      ><a name="27209" href="2016-10-30-one-lambda-calculus-many-times-2.html#27182" class="Bound"
      >f</a
      >
{% endraw %}</pre>

<pre class="Agda">{% raw %}
<a name="27238" class="Keyword"
      >module</a
      ><a name="27244"
      > </a
      ><a name="27245" href="2016-10-30-one-lambda-calculus-many-times-2.html#27245" class="Module"
      >LJ&#8660;NJ</a
      ><a name="27250"
      > </a
      ><a name="27251" class="Keyword"
      >where</a
      ><a name="27256"
      >

    </a
      ><a name="27262" href="2016-10-30-one-lambda-calculus-many-times-2.html#27262" class="Function"
      >&#10233;</a
      ><a name="27263"
      > </a
      ><a name="27264" class="Symbol"
      >:</a
      ><a name="27265"
      > </a
      ><a name="27266" class="Symbol"
      >&#8704;</a
      ><a name="27267"
      > </a
      ><a name="27272" class="Symbol"
      >&#8594;</a
      ><a name="27273"
      > </a
      ><a name="27274" href="2016-10-30-one-lambda-calculus-many-times-2.html#26486" class="Datatype Operator"
      >LJ</a
      ><a name="27276"
      > </a
      ><a name="27277" href="2016-10-30-one-lambda-calculus-many-times-2.html#27269" class="Bound"
      >S</a
      ><a name="27278"
      > </a
      ><a name="27279" class="Symbol"
      >&#8594;</a
      ><a name="27280"
      > </a
      ><a name="27281" href="2016-10-30-one-lambda-calculus-many-times-2.html#6866" class="Datatype Operator"
      >NJ</a
      ><a name="27283"
      > </a
      ><a name="27284" href="2016-10-30-one-lambda-calculus-many-times-2.html#27269" class="Bound"
      >S</a
      ><a name="27285"
      >
    </a
      ><a name="27290" href="2016-10-30-one-lambda-calculus-many-times-2.html#27262" class="Function"
      >&#10233;</a
      ><a name="27291"
      >  </a
      ><a name="27293" href="2016-10-30-one-lambda-calculus-many-times-2.html#26516" class="InductiveConstructor"
      >ax</a
      ><a name="27295"
      >       </a
      ><a name="27302" class="Symbol"
      >=</a
      ><a name="27303"
      > </a
      ><a name="27304" href="2016-10-30-one-lambda-calculus-many-times-2.html#6896" class="InductiveConstructor"
      >ax</a
      ><a name="27306"
      >
    </a
      ><a name="27311" href="2016-10-30-one-lambda-calculus-many-times-2.html#27262" class="Function"
      >&#10233;</a
      ><a name="27312"
      > </a
      ><a name="27313" class="Symbol"
      >(</a
      ><a name="27314" href="2016-10-30-one-lambda-calculus-many-times-2.html#26556" class="InductiveConstructor"
      >cut</a
      ><a name="27317"
      > </a
      ><a name="27318" class="Symbol"
      >{</a
      ><a name="27319" class="Argument"
      >&#916;</a
      ><a name="27320"
      > </a
      ><a name="27321" class="Symbol"
      >=</a
      ><a name="27322"
      > </a
      ><a name="27323" href="2016-10-30-one-lambda-calculus-many-times-2.html#27323" class="Bound"
      >&#916;</a
      ><a name="27324" class="Symbol"
      >}</a
      ><a name="27325"
      > </a
      ><a name="27326" href="2016-10-30-one-lambda-calculus-many-times-2.html#27326" class="Bound"
      >f</a
      ><a name="27327"
      > </a
      ><a name="27328" href="2016-10-30-one-lambda-calculus-many-times-2.html#27328" class="Bound"
      >g</a
      ><a name="27329" class="Symbol"
      >)</a
      ><a name="27330"
      > </a
      ><a name="27331" class="Symbol"
      >=</a
      ><a name="27332"
      > </a
      ><a name="27333" href="2016-10-30-one-lambda-calculus-many-times-2.html#23813" class="Function"
      >NJ.s&#8314;&#8242;</a
      ><a name="27339"
      > </a
      ><a name="27340" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="27342"
      > </a
      ><a name="27343" href="2016-10-30-one-lambda-calculus-many-times-2.html#27323" class="Bound"
      >&#916;</a
      ><a name="27344"
      > </a
      ><a name="27345" class="Symbol"
      >(</a
      ><a name="27346" href="2016-10-30-one-lambda-calculus-many-times-2.html#6988" class="InductiveConstructor"
      >&#8658;e</a
      ><a name="27348"
      > </a
      ><a name="27349" class="Symbol"
      >(</a
      ><a name="27350" href="2016-10-30-one-lambda-calculus-many-times-2.html#6935" class="InductiveConstructor"
      >&#8658;i</a
      ><a name="27352"
      > </a
      ><a name="27353" class="Symbol"
      >(</a
      ><a name="27354" href="2016-10-30-one-lambda-calculus-many-times-2.html#27262" class="Function"
      >&#10233;</a
      ><a name="27355"
      > </a
      ><a name="27356" href="2016-10-30-one-lambda-calculus-many-times-2.html#27328" class="Bound"
      >g</a
      ><a name="27357" class="Symbol"
      >))</a
      ><a name="27359"
      > </a
      ><a name="27360" class="Symbol"
      >(</a
      ><a name="27361" href="2016-10-30-one-lambda-calculus-many-times-2.html#27262" class="Function"
      >&#10233;</a
      ><a name="27362"
      > </a
      ><a name="27363" href="2016-10-30-one-lambda-calculus-many-times-2.html#27326" class="Bound"
      >f</a
      ><a name="27364" class="Symbol"
      >))</a
      ><a name="27366"
      >
    </a
      ><a name="27371" href="2016-10-30-one-lambda-calculus-many-times-2.html#27262" class="Function"
      >&#10233;</a
      ><a name="27372"
      > </a
      ><a name="27373" class="Symbol"
      >(</a
      ><a name="27374" href="2016-10-30-one-lambda-calculus-many-times-2.html#26622" class="InductiveConstructor"
      >&#8658;l</a
      ><a name="27376"
      >  </a
      ><a name="27378" class="Symbol"
      >{</a
      ><a name="27379" class="Argument"
      >&#916;</a
      ><a name="27380"
      > </a
      ><a name="27381" class="Symbol"
      >=</a
      ><a name="27382"
      > </a
      ><a name="27383" href="2016-10-30-one-lambda-calculus-many-times-2.html#27383" class="Bound"
      >&#916;</a
      ><a name="27384" class="Symbol"
      >}</a
      ><a name="27385"
      > </a
      ><a name="27386" href="2016-10-30-one-lambda-calculus-many-times-2.html#27386" class="Bound"
      >f</a
      ><a name="27387"
      > </a
      ><a name="27388" href="2016-10-30-one-lambda-calculus-many-times-2.html#27388" class="Bound"
      >g</a
      ><a name="27389" class="Symbol"
      >)</a
      ><a name="27390"
      > </a
      ><a name="27391" class="Symbol"
      >=</a
      ><a name="27392"
      > </a
      ><a name="27393" href="2016-10-30-one-lambda-calculus-many-times-2.html#23813" class="Function"
      >NJ.s&#8314;&#8242;</a
      ><a name="27399"
      > </a
      ><a name="27400" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="27402"
      > </a
      ><a name="27403" href="2016-10-30-one-lambda-calculus-many-times-2.html#27383" class="Bound"
      >&#916;</a
      ><a name="27404"
      > </a
      ><a name="27405" class="Symbol"
      >(</a
      ><a name="27406" href="2016-10-30-one-lambda-calculus-many-times-2.html#6988" class="InductiveConstructor"
      >&#8658;e</a
      ><a name="27408"
      > </a
      ><a name="27409" class="Symbol"
      >(</a
      ><a name="27410" href="2016-10-30-one-lambda-calculus-many-times-2.html#6935" class="InductiveConstructor"
      >&#8658;i</a
      ><a name="27412"
      > </a
      ><a name="27413" class="Symbol"
      >(</a
      ><a name="27414" href="2016-10-30-one-lambda-calculus-many-times-2.html#27262" class="Function"
      >&#10233;</a
      ><a name="27415"
      > </a
      ><a name="27416" href="2016-10-30-one-lambda-calculus-many-times-2.html#27388" class="Bound"
      >g</a
      ><a name="27417" class="Symbol"
      >))</a
      ><a name="27419"
      > </a
      ><a name="27420" class="Symbol"
      >(</a
      ><a name="27421" href="2016-10-30-one-lambda-calculus-many-times-2.html#6988" class="InductiveConstructor"
      >&#8658;e</a
      ><a name="27423"
      > </a
      ><a name="27424" href="2016-10-30-one-lambda-calculus-many-times-2.html#6896" class="InductiveConstructor"
      >ax</a
      ><a name="27426"
      > </a
      ><a name="27427" class="Symbol"
      >(</a
      ><a name="27428" href="2016-10-30-one-lambda-calculus-many-times-2.html#27262" class="Function"
      >&#10233;</a
      ><a name="27429"
      > </a
      ><a name="27430" href="2016-10-30-one-lambda-calculus-many-times-2.html#27386" class="Bound"
      >f</a
      ><a name="27431" class="Symbol"
      >)))</a
      ><a name="27434"
      >
    </a
      ><a name="27439" href="2016-10-30-one-lambda-calculus-many-times-2.html#27262" class="Function"
      >&#10233;</a
      ><a name="27440"
      > </a
      ><a name="27441" class="Symbol"
      >(</a
      ><a name="27442" href="2016-10-30-one-lambda-calculus-many-times-2.html#26696" class="InductiveConstructor"
      >&#8658;r</a
      ><a name="27444"
      >  </a
      ><a name="27446" href="2016-10-30-one-lambda-calculus-many-times-2.html#27446" class="Bound"
      >f</a
      ><a name="27447" class="Symbol"
      >)</a
      ><a name="27448"
      >   </a
      ><a name="27451" class="Symbol"
      >=</a
      ><a name="27452"
      > </a
      ><a name="27453" href="2016-10-30-one-lambda-calculus-many-times-2.html#6935" class="InductiveConstructor"
      >&#8658;i</a
      ><a name="27455"
      >  </a
      ><a name="27457" class="Symbol"
      >(</a
      ><a name="27458" href="2016-10-30-one-lambda-calculus-many-times-2.html#27262" class="Function"
      >&#10233;</a
      ><a name="27459"
      > </a
      ><a name="27460" href="2016-10-30-one-lambda-calculus-many-times-2.html#27446" class="Bound"
      >f</a
      ><a name="27461" class="Symbol"
      >)</a
      ><a name="27462"
      >
    </a
      ><a name="27467" href="2016-10-30-one-lambda-calculus-many-times-2.html#27262" class="Function"
      >&#10233;</a
      ><a name="27468"
      > </a
      ><a name="27469" class="Symbol"
      >(</a
      ><a name="27470" href="2016-10-30-one-lambda-calculus-many-times-2.html#26750" class="InductiveConstructor"
      >w</a
      ><a name="27471"
      >   </a
      ><a name="27474" href="2016-10-30-one-lambda-calculus-many-times-2.html#27474" class="Bound"
      >f</a
      ><a name="27475" class="Symbol"
      >)</a
      ><a name="27476"
      >   </a
      ><a name="27479" class="Symbol"
      >=</a
      ><a name="27480"
      > </a
      ><a name="27481" href="2016-10-30-one-lambda-calculus-many-times-2.html#7053" class="InductiveConstructor"
      >w</a
      ><a name="27482"
      >   </a
      ><a name="27485" class="Symbol"
      >(</a
      ><a name="27486" href="2016-10-30-one-lambda-calculus-many-times-2.html#27262" class="Function"
      >&#10233;</a
      ><a name="27487"
      > </a
      ><a name="27488" href="2016-10-30-one-lambda-calculus-many-times-2.html#27474" class="Bound"
      >f</a
      ><a name="27489" class="Symbol"
      >)</a
      ><a name="27490"
      >
    </a
      ><a name="27495" href="2016-10-30-one-lambda-calculus-many-times-2.html#27262" class="Function"
      >&#10233;</a
      ><a name="27496"
      > </a
      ><a name="27497" class="Symbol"
      >(</a
      ><a name="27498" href="2016-10-30-one-lambda-calculus-many-times-2.html#26800" class="InductiveConstructor"
      >c</a
      ><a name="27499"
      >   </a
      ><a name="27502" href="2016-10-30-one-lambda-calculus-many-times-2.html#27502" class="Bound"
      >f</a
      ><a name="27503" class="Symbol"
      >)</a
      ><a name="27504"
      >   </a
      ><a name="27507" class="Symbol"
      >=</a
      ><a name="27508"
      > </a
      ><a name="27509" href="2016-10-30-one-lambda-calculus-many-times-2.html#7102" class="InductiveConstructor"
      >c</a
      ><a name="27510"
      >   </a
      ><a name="27513" class="Symbol"
      >(</a
      ><a name="27514" href="2016-10-30-one-lambda-calculus-many-times-2.html#27262" class="Function"
      >&#10233;</a
      ><a name="27515"
      > </a
      ><a name="27516" href="2016-10-30-one-lambda-calculus-many-times-2.html#27502" class="Bound"
      >f</a
      ><a name="27517" class="Symbol"
      >)</a
      ><a name="27518"
      >
    </a
      ><a name="27523" href="2016-10-30-one-lambda-calculus-many-times-2.html#27262" class="Function"
      >&#10233;</a
      ><a name="27524"
      > </a
      ><a name="27525" class="Symbol"
      >(</a
      ><a name="27526" href="2016-10-30-one-lambda-calculus-many-times-2.html#26858" class="InductiveConstructor"
      >p</a
      ><a name="27527"
      > </a
      ><a name="27528" href="2016-10-30-one-lambda-calculus-many-times-2.html#27528" class="Bound"
      >&#915;</a
      ><a name="27529"
      > </a
      ><a name="27530" href="2016-10-30-one-lambda-calculus-many-times-2.html#27530" class="Bound"
      >f</a
      ><a name="27531" class="Symbol"
      >)</a
      ><a name="27532"
      >   </a
      ><a name="27535" class="Symbol"
      >=</a
      ><a name="27536"
      > </a
      ><a name="27537" href="2016-10-30-one-lambda-calculus-many-times-2.html#7159" class="InductiveConstructor"
      >p</a
      ><a name="27538"
      > </a
      ><a name="27539" href="2016-10-30-one-lambda-calculus-many-times-2.html#27528" class="Bound"
      >&#915;</a
      ><a name="27540"
      > </a
      ><a name="27541" class="Symbol"
      >(</a
      ><a name="27542" href="2016-10-30-one-lambda-calculus-many-times-2.html#27262" class="Function"
      >&#10233;</a
      ><a name="27543"
      > </a
      ><a name="27544" href="2016-10-30-one-lambda-calculus-many-times-2.html#27530" class="Bound"
      >f</a
      ><a name="27545" class="Symbol"
      >)</a
      ><a name="27546"
      >

    </a
      ><a name="27552" href="2016-10-30-one-lambda-calculus-many-times-2.html#27552" class="Function"
      >&#10232;</a
      ><a name="27553"
      > </a
      ><a name="27554" class="Symbol"
      >:</a
      ><a name="27555"
      > </a
      ><a name="27556" class="Symbol"
      >&#8704;</a
      ><a name="27557"
      > </a
      ><a name="27562" class="Symbol"
      >&#8594;</a
      ><a name="27563"
      > </a
      ><a name="27564" href="2016-10-30-one-lambda-calculus-many-times-2.html#6866" class="Datatype Operator"
      >NJ</a
      ><a name="27566"
      > </a
      ><a name="27567" href="2016-10-30-one-lambda-calculus-many-times-2.html#27559" class="Bound"
      >S</a
      ><a name="27568"
      > </a
      ><a name="27569" class="Symbol"
      >&#8594;</a
      ><a name="27570"
      > </a
      ><a name="27571" href="2016-10-30-one-lambda-calculus-many-times-2.html#26486" class="Datatype Operator"
      >LJ</a
      ><a name="27573"
      > </a
      ><a name="27574" href="2016-10-30-one-lambda-calculus-many-times-2.html#27559" class="Bound"
      >S</a
      ><a name="27575"
      >
    </a
      ><a name="27580" href="2016-10-30-one-lambda-calculus-many-times-2.html#27552" class="Function"
      >&#10232;</a
      ><a name="27581"
      >  </a
      ><a name="27583" href="2016-10-30-one-lambda-calculus-many-times-2.html#6896" class="InductiveConstructor"
      >ax</a
      ><a name="27585"
      >       </a
      ><a name="27592" class="Symbol"
      >=</a
      ><a name="27593"
      > </a
      ><a name="27594" href="2016-10-30-one-lambda-calculus-many-times-2.html#26516" class="InductiveConstructor"
      >ax</a
      ><a name="27596"
      >
    </a
      ><a name="27601" href="2016-10-30-one-lambda-calculus-many-times-2.html#27552" class="Function"
      >&#10232;</a
      ><a name="27602"
      > </a
      ><a name="27603" class="Symbol"
      >(</a
      ><a name="27604" href="2016-10-30-one-lambda-calculus-many-times-2.html#6935" class="InductiveConstructor"
      >&#8658;i</a
      ><a name="27606"
      >  </a
      ><a name="27608" href="2016-10-30-one-lambda-calculus-many-times-2.html#27608" class="Bound"
      >f</a
      ><a name="27609" class="Symbol"
      >)</a
      ><a name="27610"
      >   </a
      ><a name="27613" class="Symbol"
      >=</a
      ><a name="27614"
      > </a
      ><a name="27615" href="2016-10-30-one-lambda-calculus-many-times-2.html#26696" class="InductiveConstructor"
      >&#8658;r</a
      ><a name="27617"
      >  </a
      ><a name="27619" class="Symbol"
      >(</a
      ><a name="27620" href="2016-10-30-one-lambda-calculus-many-times-2.html#27552" class="Function"
      >&#10232;</a
      ><a name="27621"
      > </a
      ><a name="27622" href="2016-10-30-one-lambda-calculus-many-times-2.html#27608" class="Bound"
      >f</a
      ><a name="27623" class="Symbol"
      >)</a
      ><a name="27624"
      >
    </a
      ><a name="27629" href="2016-10-30-one-lambda-calculus-many-times-2.html#27552" class="Function"
      >&#10232;</a
      ><a name="27630"
      > </a
      ><a name="27631" class="Symbol"
      >(</a
      ><a name="27632" href="2016-10-30-one-lambda-calculus-many-times-2.html#6988" class="InductiveConstructor"
      >&#8658;e</a
      ><a name="27634"
      >  </a
      ><a name="27636" href="2016-10-30-one-lambda-calculus-many-times-2.html#27636" class="Bound"
      >f</a
      ><a name="27637"
      > </a
      ><a name="27638" href="2016-10-30-one-lambda-calculus-many-times-2.html#27638" class="Bound"
      >g</a
      ><a name="27639" class="Symbol"
      >)</a
      ><a name="27640"
      > </a
      ><a name="27641" class="Symbol"
      >=</a
      ><a name="27642"
      > </a
      ><a name="27643" href="2016-10-30-one-lambda-calculus-many-times-2.html#26556" class="InductiveConstructor"
      >cut</a
      ><a name="27646"
      > </a
      ><a name="27647" class="Symbol"
      >(</a
      ><a name="27648" href="2016-10-30-one-lambda-calculus-many-times-2.html#27552" class="Function"
      >&#10232;</a
      ><a name="27649"
      > </a
      ><a name="27650" href="2016-10-30-one-lambda-calculus-many-times-2.html#27636" class="Bound"
      >f</a
      ><a name="27651" class="Symbol"
      >)</a
      ><a name="27652"
      > </a
      ><a name="27653" class="Symbol"
      >(</a
      ><a name="27654" href="2016-10-30-one-lambda-calculus-many-times-2.html#27126" class="Function"
      >LJ.&#8709;e</a
      ><a name="27659"
      > </a
      ><a name="27660" class="Symbol"
      >(</a
      ><a name="27661" href="2016-10-30-one-lambda-calculus-many-times-2.html#26622" class="InductiveConstructor"
      >&#8658;l</a
      ><a name="27663"
      > </a
      ><a name="27664" class="Symbol"
      >(</a
      ><a name="27665" href="2016-10-30-one-lambda-calculus-many-times-2.html#27552" class="Function"
      >&#10232;</a
      ><a name="27666"
      > </a
      ><a name="27667" href="2016-10-30-one-lambda-calculus-many-times-2.html#27638" class="Bound"
      >g</a
      ><a name="27668" class="Symbol"
      >)</a
      ><a name="27669"
      > </a
      ><a name="27670" href="2016-10-30-one-lambda-calculus-many-times-2.html#26516" class="InductiveConstructor"
      >ax</a
      ><a name="27672" class="Symbol"
      >))</a
      ><a name="27674"
      >
    </a
      ><a name="27679" href="2016-10-30-one-lambda-calculus-many-times-2.html#27552" class="Function"
      >&#10232;</a
      ><a name="27680"
      > </a
      ><a name="27681" class="Symbol"
      >(</a
      ><a name="27682" href="2016-10-30-one-lambda-calculus-many-times-2.html#7053" class="InductiveConstructor"
      >w</a
      ><a name="27683"
      >   </a
      ><a name="27686" href="2016-10-30-one-lambda-calculus-many-times-2.html#27686" class="Bound"
      >f</a
      ><a name="27687" class="Symbol"
      >)</a
      ><a name="27688"
      >   </a
      ><a name="27691" class="Symbol"
      >=</a
      ><a name="27692"
      > </a
      ><a name="27693" href="2016-10-30-one-lambda-calculus-many-times-2.html#26750" class="InductiveConstructor"
      >w</a
      ><a name="27694"
      >   </a
      ><a name="27697" class="Symbol"
      >(</a
      ><a name="27698" href="2016-10-30-one-lambda-calculus-many-times-2.html#27552" class="Function"
      >&#10232;</a
      ><a name="27699"
      > </a
      ><a name="27700" href="2016-10-30-one-lambda-calculus-many-times-2.html#27686" class="Bound"
      >f</a
      ><a name="27701" class="Symbol"
      >)</a
      ><a name="27702"
      >
    </a
      ><a name="27707" href="2016-10-30-one-lambda-calculus-many-times-2.html#27552" class="Function"
      >&#10232;</a
      ><a name="27708"
      > </a
      ><a name="27709" class="Symbol"
      >(</a
      ><a name="27710" href="2016-10-30-one-lambda-calculus-many-times-2.html#7102" class="InductiveConstructor"
      >c</a
      ><a name="27711"
      >   </a
      ><a name="27714" href="2016-10-30-one-lambda-calculus-many-times-2.html#27714" class="Bound"
      >f</a
      ><a name="27715" class="Symbol"
      >)</a
      ><a name="27716"
      >   </a
      ><a name="27719" class="Symbol"
      >=</a
      ><a name="27720"
      > </a
      ><a name="27721" href="2016-10-30-one-lambda-calculus-many-times-2.html#26800" class="InductiveConstructor"
      >c</a
      ><a name="27722"
      >   </a
      ><a name="27725" class="Symbol"
      >(</a
      ><a name="27726" href="2016-10-30-one-lambda-calculus-many-times-2.html#27552" class="Function"
      >&#10232;</a
      ><a name="27727"
      > </a
      ><a name="27728" href="2016-10-30-one-lambda-calculus-many-times-2.html#27714" class="Bound"
      >f</a
      ><a name="27729" class="Symbol"
      >)</a
      ><a name="27730"
      >
    </a
      ><a name="27735" href="2016-10-30-one-lambda-calculus-many-times-2.html#27552" class="Function"
      >&#10232;</a
      ><a name="27736"
      > </a
      ><a name="27737" class="Symbol"
      >(</a
      ><a name="27738" href="2016-10-30-one-lambda-calculus-many-times-2.html#7159" class="InductiveConstructor"
      >p</a
      ><a name="27739"
      > </a
      ><a name="27740" href="2016-10-30-one-lambda-calculus-many-times-2.html#27740" class="Bound"
      >&#915;</a
      ><a name="27741"
      > </a
      ><a name="27742" href="2016-10-30-one-lambda-calculus-many-times-2.html#27742" class="Bound"
      >f</a
      ><a name="27743" class="Symbol"
      >)</a
      ><a name="27744"
      >   </a
      ><a name="27747" class="Symbol"
      >=</a
      ><a name="27748"
      > </a
      ><a name="27749" href="2016-10-30-one-lambda-calculus-many-times-2.html#26858" class="InductiveConstructor"
      >p</a
      ><a name="27750"
      > </a
      ><a name="27751" href="2016-10-30-one-lambda-calculus-many-times-2.html#27740" class="Bound"
      >&#915;</a
      ><a name="27752"
      > </a
      ><a name="27753" class="Symbol"
      >(</a
      ><a name="27754" href="2016-10-30-one-lambda-calculus-many-times-2.html#27552" class="Function"
      >&#10232;</a
      ><a name="27755"
      > </a
      ><a name="27756" href="2016-10-30-one-lambda-calculus-many-times-2.html#27742" class="Bound"
      >f</a
      ><a name="27757" class="Symbol"
      >)</a
      >
{% endraw %}</pre>

<pre class="Agda">{% raw %}
<a name="27786" class="Keyword"
      >module</a
      ><a name="27792"
      > </a
      ><a name="27793" href="2016-10-30-one-lambda-calculus-many-times-2.html#27793" class="Module"
      >LJ&#8660;SC</a
      ><a name="27798"
      > </a
      ><a name="27799" class="Keyword"
      >where</a
      ><a name="27804"
      >

    </a
      ><a name="27810" href="2016-10-30-one-lambda-calculus-many-times-2.html#27810" class="Function"
      >&#10233;</a
      ><a name="27811"
      > </a
      ><a name="27812" class="Symbol"
      >:</a
      ><a name="27813"
      > </a
      ><a name="27814" class="Symbol"
      >&#8704;</a
      ><a name="27815"
      > </a
      ><a name="27820" class="Symbol"
      >&#8594;</a
      ><a name="27821"
      > </a
      ><a name="27822" href="2016-10-30-one-lambda-calculus-many-times-2.html#26486" class="Datatype Operator"
      >LJ</a
      ><a name="27824"
      > </a
      ><a name="27825" href="2016-10-30-one-lambda-calculus-many-times-2.html#27817" class="Bound"
      >S</a
      ><a name="27826"
      > </a
      ><a name="27827" class="Symbol"
      >&#8594;</a
      ><a name="27828"
      > </a
      ><a name="27829" href="2016-03-20-one-lambda-calculus-many-times.html#9785" class="Datatype Operator"
      >SC</a
      ><a name="27831"
      > </a
      ><a name="27832" href="2016-10-30-one-lambda-calculus-many-times-2.html#27817" class="Bound"
      >S</a
      ><a name="27833"
      >
    </a
      ><a name="27838" href="2016-10-30-one-lambda-calculus-many-times-2.html#27810" class="Function"
      >&#10233;</a
      ><a name="27839"
      > </a
      ><a name="27840" href="2016-10-30-one-lambda-calculus-many-times-2.html#27840" class="Bound"
      >f</a
      ><a name="27841"
      > </a
      ><a name="27842" class="Symbol"
      >=</a
      ><a name="27843"
      > </a
      ><a name="27844" href="2016-03-20-one-lambda-calculus-many-times.html#10584" class="Function"
      >ND&#8660;SC.&#10233;</a
      ><a name="27851"
      > </a
      ><a name="27852" class="Symbol"
      >(</a
      ><a name="27853" href="2016-10-30-one-lambda-calculus-many-times-2.html#25184" class="Function"
      >NJ&#8660;ND.&#10233;</a
      ><a name="27860"
      > </a
      ><a name="27861" class="Symbol"
      >(</a
      ><a name="27862" href="2016-10-30-one-lambda-calculus-many-times-2.html#27262" class="Function"
      >LJ&#8660;NJ.&#10233;</a
      ><a name="27869"
      > </a
      ><a name="27870" href="2016-10-30-one-lambda-calculus-many-times-2.html#27840" class="Bound"
      >f</a
      ><a name="27871" class="Symbol"
      >))</a
      ><a name="27873"
      >

    </a
      ><a name="27879" href="2016-10-30-one-lambda-calculus-many-times-2.html#27879" class="Function"
      >&#10232;</a
      ><a name="27880"
      > </a
      ><a name="27881" class="Symbol"
      >:</a
      ><a name="27882"
      > </a
      ><a name="27883" class="Symbol"
      >&#8704;</a
      ><a name="27884"
      > </a
      ><a name="27889" class="Symbol"
      >&#8594;</a
      ><a name="27890"
      > </a
      ><a name="27891" href="2016-03-20-one-lambda-calculus-many-times.html#9785" class="Datatype Operator"
      >SC</a
      ><a name="27893"
      > </a
      ><a name="27894" href="2016-10-30-one-lambda-calculus-many-times-2.html#27886" class="Bound"
      >S</a
      ><a name="27895"
      > </a
      ><a name="27896" class="Symbol"
      >&#8594;</a
      ><a name="27897"
      > </a
      ><a name="27898" href="2016-10-30-one-lambda-calculus-many-times-2.html#26486" class="Datatype Operator"
      >LJ</a
      ><a name="27900"
      > </a
      ><a name="27901" href="2016-10-30-one-lambda-calculus-many-times-2.html#27886" class="Bound"
      >S</a
      ><a name="27902"
      >
    </a
      ><a name="27907" href="2016-10-30-one-lambda-calculus-many-times-2.html#27879" class="Function"
      >&#10232;</a
      ><a name="27908"
      > </a
      ><a name="27909" href="2016-10-30-one-lambda-calculus-many-times-2.html#27909" class="Bound"
      >f</a
      ><a name="27910"
      > </a
      ><a name="27911" class="Symbol"
      >=</a
      ><a name="27912"
      > </a
      ><a name="27913" href="2016-10-30-one-lambda-calculus-many-times-2.html#27552" class="Function"
      >LJ&#8660;NJ.&#10232;</a
      ><a name="27920"
      > </a
      ><a name="27921" class="Symbol"
      >(</a
      ><a name="27922" href="2016-10-30-one-lambda-calculus-many-times-2.html#25610" class="Function"
      >NJ&#8660;ND.&#10232;</a
      ><a name="27929"
      > </a
      ><a name="27930" class="Symbol"
      >(</a
      ><a name="27931" href="2016-03-20-one-lambda-calculus-many-times.html#10707" class="Function"
      >ND&#8660;SC.&#10232;</a
      ><a name="27938"
      > </a
      ><a name="27939" href="2016-10-30-one-lambda-calculus-many-times-2.html#27909" class="Bound"
      >f</a
      ><a name="27940" class="Symbol"
      >))</a
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
<pre class="Agda">{% raw %}
<a name="28701" class="Comment"
      >-- -}</a
      ><a name="28706"
      >
</a
      ><a name="28707" class="Comment"
      >-- -}</a
      ><a name="28712"
      >
</a
      ><a name="28713" class="Comment"
      >-- -}</a
      ><a name="28718"
      >
</a
      ><a name="28719" class="Comment"
      >-- -}</a
      ><a name="28724"
      >
</a
      ><a name="28725" class="Comment"
      >-- -}</a
      >
{% endraw %}</pre>
</div>
