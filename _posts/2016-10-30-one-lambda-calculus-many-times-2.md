---
title         : One λ-calculus, many times... (2)
date          : 2016-10-30 12:00:00
categories    : [compsci]
tags          : [draft, agda]
hide-implicit : true
extra-script : [agda-extra-script.html]
extra-style  : [agda-extra-style.html]
---

This post is a continuation of *[One λ-calculus, many times...]({% post_url 2016-03-20-one-lambda-calculus-many-times %})*, in which I explored the use of natural deduction and sequent calculus systems as type systems for the simply-typed lambda calculus.[^minproplog] In this post, I will have a look at the variants of these systems which have explicit structural rules: Gentzen's NJ and LJ.

<div class="hidden">
<!--{% raw %}--><pre class="Agda">
<a name="681" class="Keyword"
      >import</a
      ><a name="687"
      > </a
      ><a name="688" href="2016-03-20-one-lambda-calculus-many-times.html#1" class="Module"
      >2016-03-20-one-lambda-calculus-many-times</a
      ><a name="729"
      > </a
      ><a name="730" class="Symbol"
      >as</a
      ><a name="732"
      > </a
      ><a name="733" class="Module"
      >Part1</a
      ><a name="738"
      >
</a
      ><a name="739" class="Keyword"
      >module</a
      ><a name="745"
      > </a
      ><a name="746" href="2016-10-30-one-lambda-calculus-many-times-2.html#1" class="Module"
      >2016-10-30-one-lambda-calculus-many-times-2</a
      ><a name="789"
      > </a
      ><a name="790" class="Keyword"
      >where</a
      >
</pre><!--{% endraw %}-->
</div>

The structure of this post will be similar to that of the previous installment---which means that we will start out by having a look at the syntax of NJ, then have a look at its semantics and relation to the system ND we discussed last time, and finally we will do the same for LJ. But first, the syntax:

<!--{% raw %}--><pre class="Agda">
<a name="1134" class="Keyword"
      >module</a
      ><a name="1140"
      > </a
      ><a name="1141" href="2016-10-30-one-lambda-calculus-many-times-2.html#1141" class="Module"
      >Syntax</a
      ><a name="1147"
      > </a
      ><a name="1148" class="Symbol"
      >(</a
      ><a name="1149" href="2016-10-30-one-lambda-calculus-many-times-2.html#1149" class="Bound"
      >Atom</a
      ><a name="1153"
      > </a
      ><a name="1154" class="Symbol"
      >:</a
      ><a name="1155"
      > </a
      ><a name="1156" class="PrimitiveType"
      >Set</a
      ><a name="1159" class="Symbol"
      >)</a
      ><a name="1160"
      > </a
      ><a name="1161" class="Keyword"
      >where</a
      >
</pre><!--{% endraw %}-->

We can reuse our notions of types and sequents from the previous post:

<div class="hidden">
<!--{% raw %}--><pre class="Agda">
  <a name="1287" class="Keyword"
      >open</a
      ><a name="1291"
      > </a
      ><a name="1292" href="2016-03-20-one-lambda-calculus-many-times.html#1221" class="Module"
      >Part1.</a
      ><a name="1298" href="2016-03-20-one-lambda-calculus-many-times.html#1568" class="Module"
      >Syntax</a
      ><a name="1304"
      > </a
      ><a name="1305" href="2016-10-30-one-lambda-calculus-many-times-2.html#1149" class="Bound"
      >Atom</a
      ><a name="1309"
      > </a
      ><a name="1310" class="Keyword"
      >hiding</a
      ><a name="1316"
      > </a
      ><a name="1317" class="Symbol"
      >(</a
      ><a name="1318"
      >w&#8242;</a
      ><a name="1320" class="Symbol"
      >)</a
      ><a name="1321"
      >
  </a
      ><a name="1324" class="Keyword"
      >open</a
      ><a name="1328"
      > </a
      ><a name="1329" class="Keyword"
      >import</a
      ><a name="1335"
      > </a
      ><a name="1336" href="https://agda.github.io/agda-stdlib/Algebra.html#1" class="Module"
      >Algebra</a
      ><a name="1343"
      >                 </a
      ><a name="1360" class="Keyword"
      >using</a
      ><a name="1365"
      > </a
      ><a name="1366" class="Symbol"
      >(</a
      ><a name="1367" class="Keyword"
      >module</a
      ><a name="1373"
      > </a
      ><a name="1374" href="https://agda.github.io/agda-stdlib/Algebra.html#309" class="Module"
      >Monoid</a
      ><a name="1380" class="Symbol"
      >)</a
      ><a name="1381"
      >
  </a
      ><a name="1384" class="Keyword"
      >open</a
      ><a name="1388"
      > </a
      ><a name="1389" class="Keyword"
      >import</a
      ><a name="1395"
      > </a
      ><a name="1396" href="https://agda.github.io/agda-stdlib/Data.Nat.html#1" class="Module"
      >Data.Nat</a
      ><a name="1404"
      >                </a
      ><a name="1420" class="Keyword"
      >using</a
      ><a name="1425"
      > </a
      ><a name="1426" class="Symbol"
      >(</a
      ><a name="1427" href="Agda.Builtin.Nat.html#69" class="Datatype"
      >&#8469;</a
      ><a name="1428" class="Symbol"
      >;</a
      ><a name="1429"
      > </a
      ><a name="1430" href="Agda.Builtin.Nat.html#100" class="InductiveConstructor"
      >suc</a
      ><a name="1433" class="Symbol"
      >;</a
      ><a name="1434"
      > </a
      ><a name="1435" href="Agda.Builtin.Nat.html#87" class="InductiveConstructor"
      >zero</a
      ><a name="1439" class="Symbol"
      >)</a
      ><a name="1440"
      >
  </a
      ><a name="1443" class="Keyword"
      >open</a
      ><a name="1447"
      > </a
      ><a name="1448" class="Keyword"
      >import</a
      ><a name="1454"
      > </a
      ><a name="1455" href="https://agda.github.io/agda-stdlib/Data.Fin.html#1" class="Module"
      >Data.Fin</a
      ><a name="1463"
      >                </a
      ><a name="1479" class="Keyword"
      >using</a
      ><a name="1484"
      > </a
      ><a name="1485" class="Symbol"
      >(</a
      ><a name="1486" href="https://agda.github.io/agda-stdlib/Data.Fin.html#842" class="Datatype"
      >Fin</a
      ><a name="1489" class="Symbol"
      >;</a
      ><a name="1490"
      > </a
      ><a name="1491" href="https://agda.github.io/agda-stdlib/Data.Fin.html#895" class="InductiveConstructor"
      >suc</a
      ><a name="1494" class="Symbol"
      >;</a
      ><a name="1495"
      > </a
      ><a name="1496" href="https://agda.github.io/agda-stdlib/Data.Fin.html#864" class="InductiveConstructor"
      >zero</a
      ><a name="1500" class="Symbol"
      >)</a
      ><a name="1501"
      >
  </a
      ><a name="1504" class="Keyword"
      >open</a
      ><a name="1508"
      > </a
      ><a name="1509" class="Keyword"
      >import</a
      ><a name="1515"
      > </a
      ><a name="1516" href="https://agda.github.io/agda-stdlib/Data.List.html#1" class="Module"
      >Data.List</a
      ><a name="1525"
      >               </a
      ><a name="1540" class="Keyword"
      >using</a
      ><a name="1545"
      > </a
      ><a name="1546" class="Symbol"
      >(</a
      ><a name="1547" href="Agda.Builtin.List.html#52" class="Datatype"
      >List</a
      ><a name="1551" class="Symbol"
      >;</a
      ><a name="1552"
      > </a
      ><a name="1553" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >_&#8759;_</a
      ><a name="1556" class="Symbol"
      >;</a
      ><a name="1557"
      > </a
      ><a name="1558" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#5519" class="InductiveConstructor"
      >[]</a
      ><a name="1560" class="Symbol"
      >;</a
      ><a name="1561"
      > </a
      ><a name="1562" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >_++_</a
      ><a name="1566" class="Symbol"
      >)</a
      ><a name="1567"
      >
  </a
      ><a name="1570" class="Keyword"
      >open</a
      ><a name="1574"
      > </a
      ><a name="1575" class="Keyword"
      >import</a
      ><a name="1581"
      > </a
      ><a name="1582" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1" class="Module"
      >Data.List.Any</a
      ><a name="1595"
      >           </a
      ><a name="1606" class="Keyword"
      >using</a
      ><a name="1611"
      > </a
      ><a name="1612" class="Symbol"
      >(</a
      ><a name="1613" class="Keyword"
      >module</a
      ><a name="1619"
      > </a
      ><a name="1620" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#250" class="Module"
      >Membership</a
      ><a name="1630" class="Symbol"
      >;</a
      ><a name="1631"
      > </a
      ><a name="1632" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="1636" class="Symbol"
      >;</a
      ><a name="1637"
      > </a
      ><a name="1638" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="1643" class="Symbol"
      >)</a
      ><a name="1644"
      >
  </a
      ><a name="1647" class="Keyword"
      >open</a
      ><a name="1651"
      > </a
      ><a name="1652" class="Keyword"
      >import</a
      ><a name="1658"
      > </a
      ><a name="1659" href="https://agda.github.io/agda-stdlib/Data.Product.html#1" class="Module"
      >Data.Product</a
      ><a name="1671"
      >            </a
      ><a name="1683" class="Keyword"
      >using</a
      ><a name="1688"
      > </a
      ><a name="1689" class="Symbol"
      >(</a
      ><a name="1690" href="https://agda.github.io/agda-stdlib/Data.Product.html#525" class="Field"
      >proj&#8321;</a
      ><a name="1695" class="Symbol"
      >;</a
      ><a name="1696"
      > </a
      ><a name="1697" href="https://agda.github.io/agda-stdlib/Data.Product.html#539" class="Field"
      >proj&#8322;</a
      ><a name="1702" class="Symbol"
      >)</a
      ><a name="1703"
      >
  </a
      ><a name="1706" class="Keyword"
      >open</a
      ><a name="1710"
      > </a
      ><a name="1711" class="Keyword"
      >import</a
      ><a name="1717"
      > </a
      ><a name="1718" href="https://agda.github.io/agda-stdlib/Function.html#1" class="Module"
      >Function</a
      ><a name="1726"
      >                </a
      ><a name="1742" class="Keyword"
      >using</a
      ><a name="1747"
      > </a
      ><a name="1748" class="Symbol"
      >(</a
      ><a name="1749" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >_$_</a
      ><a name="1752" class="Symbol"
      >)</a
      ><a name="1753"
      >
  </a
      ><a name="1756" class="Keyword"
      >open</a
      ><a name="1760"
      > </a
      ><a name="1761" class="Keyword"
      >import</a
      ><a name="1767"
      > </a
      ><a name="1768" href="https://agda.github.io/agda-stdlib/Function.Equivalence.html#1" class="Module"
      >Function.Equivalence</a
      ><a name="1788"
      >    </a
      ><a name="1792" class="Keyword"
      >using</a
      ><a name="1797"
      > </a
      ><a name="1798" class="Symbol"
      >(</a
      ><a name="1799" href="https://agda.github.io/agda-stdlib/Function.Equivalence.html#711" class="Function Operator"
      >_&#8660;_</a
      ><a name="1802" class="Symbol"
      >;</a
      ><a name="1803"
      > </a
      ><a name="1804" href="https://agda.github.io/agda-stdlib/Function.Equivalence.html#2131" class="Function"
      >id</a
      ><a name="1806" class="Symbol"
      >;</a
      ><a name="1807"
      > </a
      ><a name="1808" href="https://agda.github.io/agda-stdlib/Function.Equivalence.html#1070" class="Function"
      >map</a
      ><a name="1811" class="Symbol"
      >;</a
      ><a name="1812"
      > </a
      ><a name="1813" href="https://agda.github.io/agda-stdlib/Function.Equivalence.html#804" class="Function"
      >equivalence</a
      ><a name="1824" class="Symbol"
      >)</a
      ><a name="1825"
      >
  </a
      ><a name="1828" class="Keyword"
      >open</a
      ><a name="1832"
      > </a
      ><a name="1833" class="Keyword"
      >import</a
      ><a name="1839"
      > </a
      ><a name="1840" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.html#1" class="Module"
      >Relation.Binary.PropositionalEquality</a
      ><a name="1877"
      >
  </a
      ><a name="1880" class="Keyword"
      >open</a
      ><a name="1884"
      > </a
      ><a name="1885" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#2298" class="Module"
      >Membership</a
      ><a name="1895"
      > </a
      ><a name="1896" class="Symbol"
      >(</a
      ><a name="1897" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.html#1526" class="Function"
      >setoid</a
      ><a name="1903"
      > </a
      ><a name="1904" href="2016-03-20-one-lambda-calculus-many-times.html#2651" class="Datatype"
      >Type</a
      ><a name="1908" class="Symbol"
      >)</a
      ><a name="1909"
      >       </a
      ><a name="1916" class="Keyword"
      >using</a
      ><a name="1921"
      > </a
      ><a name="1922" class="Symbol"
      >(</a
      ><a name="1923"
      >_&#8712;_</a
      ><a name="1926" class="Symbol"
      >;</a
      ><a name="1927"
      > _&#8838;_</a
      ><a name="1931" class="Symbol"
      >)</a
      ><a name="1932"
      >
  </a
      ><a name="1935" class="Keyword"
      >open</a
      ><a name="1939"
      > </a
      ><a name="1940" href="https://agda.github.io/agda-stdlib/Algebra.html#1154" class="Module"
      >Monoid</a
      ><a name="1946"
      > </a
      ><a name="1947" class="Symbol"
      >(</a
      ><a name="1948" href="https://agda.github.io/agda-stdlib/Data.List.html#846" class="Function"
      >Data.List.monoid</a
      ><a name="1964"
      > </a
      ><a name="1965" href="2016-03-20-one-lambda-calculus-many-times.html#2651" class="Datatype"
      >Type</a
      ><a name="1969" class="Symbol"
      >)</a
      ><a name="1970"
      > </a
      ><a name="1971" class="Keyword"
      >using</a
      ><a name="1976"
      > </a
      ><a name="1977" class="Symbol"
      >()</a
      ><a name="1979"
      > </a
      ><a name="1980" class="Keyword"
      >renaming</a
      ><a name="1988"
      > </a
      ><a name="1989" class="Symbol"
      >(</a
      ><a name="1990"
      >identity </a
      ><a name="1999" class="Symbol"
      >to</a
      ><a name="2001"
      > ++-identity</a
      ><a name="2013" class="Symbol"
      >;</a
      ><a name="2014"
      > assoc </a
      ><a name="2021" class="Symbol"
      >to</a
      ><a name="2023"
      > ++-assoc</a
      ><a name="2032" class="Symbol"
      >)</a
      ><a name="2033"
      >
  </a
      ><a name="2036" href="2016-10-30-one-lambda-calculus-many-times-2.html#2036" class="Function"
      >++-identity&#691;</a
      ><a name="2048"
      > </a
      ><a name="2049" class="Symbol"
      >=</a
      ><a name="2050"
      > </a
      ><a name="2051" href="https://agda.github.io/agda-stdlib/Data.Product.html#539" class="Field"
      >proj&#8322;</a
      ><a name="2056"
      > </a
      ><a name="2057" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#1106" class="Function"
      >++-identity</a
      >
</pre><!--{% endraw %}-->
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

<!--{% raw %}--><pre class="Agda">
  <a name="6848" class="Keyword"
      >infix</a
      ><a name="6853"
      > </a
      ><a name="6854" class="Number"
      >3</a
      ><a name="6855"
      > NJ_

  </a
      ><a name="6863" class="Keyword"
      >data</a
      ><a name="6867"
      > </a
      ><a name="6868" href="2016-10-30-one-lambda-calculus-many-times-2.html#6868" class="Datatype Operator"
      >NJ_</a
      ><a name="6871"
      > </a
      ><a name="6872" class="Symbol"
      >:</a
      ><a name="6873"
      > </a
      ><a name="6874" href="2016-03-20-one-lambda-calculus-many-times.html#3957" class="Datatype"
      >Sequent</a
      ><a name="6881"
      > </a
      ><a name="6882" class="Symbol"
      >&#8594;</a
      ><a name="6883"
      > </a
      ><a name="6884" class="PrimitiveType"
      >Set</a
      ><a name="6887"
      > </a
      ><a name="6888" class="Keyword"
      >where</a
      ><a name="6893"
      >
    </a
      ><a name="6898" href="2016-10-30-one-lambda-calculus-many-times-2.html#6898" class="InductiveConstructor"
      >ax</a
      ><a name="6900"
      > </a
      ><a name="6901" class="Symbol"
      >:</a
      ><a name="6902"
      > </a
      ><a name="6903" class="Symbol"
      >&#8704;</a
      ><a name="6904"
      > </a
      ><a name="6917" class="Symbol"
      >&#8594;</a
      ><a name="6918"
      > </a
      ><a name="6919" href="2016-10-30-one-lambda-calculus-many-times-2.html#6868" class="Datatype Operator"
      >NJ</a
      ><a name="6921"
      > </a
      ><a name="6922" href="2016-10-30-one-lambda-calculus-many-times-2.html#6906" class="Bound"
      >A</a
      ><a name="6923"
      > </a
      ><a name="6924" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="6925"
      > </a
      ><a name="6926" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="6928"
      > </a
      ><a name="6929" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="6930"
      > </a
      ><a name="6931" href="2016-10-30-one-lambda-calculus-many-times-2.html#6906" class="Bound"
      >A</a
      ><a name="6932"
      >
    </a
      ><a name="6937" href="2016-10-30-one-lambda-calculus-many-times-2.html#6937" class="InductiveConstructor"
      >&#8658;i</a
      ><a name="6939"
      > </a
      ><a name="6940" class="Symbol"
      >:</a
      ><a name="6941"
      > </a
      ><a name="6942" class="Symbol"
      >&#8704;</a
      ><a name="6943"
      > </a
      ><a name="6956" class="Symbol"
      >&#8594;</a
      ><a name="6957"
      > </a
      ><a name="6958" href="2016-10-30-one-lambda-calculus-many-times-2.html#6868" class="Datatype Operator"
      >NJ</a
      ><a name="6960"
      > </a
      ><a name="6961" href="2016-10-30-one-lambda-calculus-many-times-2.html#6945" class="Bound"
      >A</a
      ><a name="6962"
      > </a
      ><a name="6963" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="6964"
      > </a
      ><a name="6965" href="2016-10-30-one-lambda-calculus-many-times-2.html#6951" class="Bound"
      >&#915;</a
      ><a name="6966"
      > </a
      ><a name="6967" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="6968"
      > </a
      ><a name="6969" href="2016-10-30-one-lambda-calculus-many-times-2.html#6947" class="Bound"
      >B</a
      ><a name="6970"
      > </a
      ><a name="6971" class="Symbol"
      >&#8594;</a
      ><a name="6972"
      > </a
      ><a name="6973" href="2016-10-30-one-lambda-calculus-many-times-2.html#6868" class="Datatype Operator"
      >NJ</a
      ><a name="6975"
      > </a
      ><a name="6976" href="2016-10-30-one-lambda-calculus-many-times-2.html#6951" class="Bound"
      >&#915;</a
      ><a name="6977"
      > </a
      ><a name="6978" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="6979"
      > </a
      ><a name="6980" href="2016-10-30-one-lambda-calculus-many-times-2.html#6945" class="Bound"
      >A</a
      ><a name="6981"
      > </a
      ><a name="6982" href="2016-03-20-one-lambda-calculus-many-times.html#2694" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="6983"
      > </a
      ><a name="6984" href="2016-10-30-one-lambda-calculus-many-times-2.html#6947" class="Bound"
      >B</a
      ><a name="6985"
      >
    </a
      ><a name="6990" href="2016-10-30-one-lambda-calculus-many-times-2.html#6990" class="InductiveConstructor"
      >&#8658;e</a
      ><a name="6992"
      > </a
      ><a name="6993" class="Symbol"
      >:</a
      ><a name="6994"
      > </a
      ><a name="6995" class="Symbol"
      >&#8704;</a
      ><a name="6996"
      > </a
      ><a name="7009" class="Symbol"
      >&#8594;</a
      ><a name="7010"
      > </a
      ><a name="7011" href="2016-10-30-one-lambda-calculus-many-times-2.html#6868" class="Datatype Operator"
      >NJ</a
      ><a name="7013"
      > </a
      ><a name="7014" href="2016-10-30-one-lambda-calculus-many-times-2.html#7004" class="Bound"
      >&#915;</a
      ><a name="7015"
      > </a
      ><a name="7016" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="7017"
      > </a
      ><a name="7018" href="2016-10-30-one-lambda-calculus-many-times-2.html#6998" class="Bound"
      >A</a
      ><a name="7019"
      > </a
      ><a name="7020" href="2016-03-20-one-lambda-calculus-many-times.html#2694" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="7021"
      > </a
      ><a name="7022" href="2016-10-30-one-lambda-calculus-many-times-2.html#7000" class="Bound"
      >B</a
      ><a name="7023"
      > </a
      ><a name="7024" class="Symbol"
      >&#8594;</a
      ><a name="7025"
      > </a
      ><a name="7026" href="2016-10-30-one-lambda-calculus-many-times-2.html#6868" class="Datatype Operator"
      >NJ</a
      ><a name="7028"
      > </a
      ><a name="7029" href="2016-10-30-one-lambda-calculus-many-times-2.html#7006" class="Bound"
      >&#916;</a
      ><a name="7030"
      > </a
      ><a name="7031" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="7032"
      > </a
      ><a name="7033" href="2016-10-30-one-lambda-calculus-many-times-2.html#6998" class="Bound"
      >A</a
      ><a name="7034"
      > </a
      ><a name="7035" class="Symbol"
      >&#8594;</a
      ><a name="7036"
      > </a
      ><a name="7037" href="2016-10-30-one-lambda-calculus-many-times-2.html#6868" class="Datatype Operator"
      >NJ</a
      ><a name="7039"
      > </a
      ><a name="7040" href="2016-10-30-one-lambda-calculus-many-times-2.html#7004" class="Bound"
      >&#915;</a
      ><a name="7041"
      > </a
      ><a name="7042" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="7044"
      > </a
      ><a name="7045" href="2016-10-30-one-lambda-calculus-many-times-2.html#7006" class="Bound"
      >&#916;</a
      ><a name="7046"
      > </a
      ><a name="7047" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="7048"
      > </a
      ><a name="7049" href="2016-10-30-one-lambda-calculus-many-times-2.html#7000" class="Bound"
      >B</a
      ><a name="7050"
      >
    </a
      ><a name="7055" href="2016-10-30-one-lambda-calculus-many-times-2.html#7055" class="InductiveConstructor"
      >w</a
      ><a name="7056"
      >  </a
      ><a name="7058" class="Symbol"
      >:</a
      ><a name="7059"
      > </a
      ><a name="7060" class="Symbol"
      >&#8704;</a
      ><a name="7061"
      > </a
      ><a name="7074" class="Symbol"
      >&#8594;</a
      ><a name="7075"
      > </a
      ><a name="7076" href="2016-10-30-one-lambda-calculus-many-times-2.html#6868" class="Datatype Operator"
      >NJ</a
      ><a name="7078"
      > </a
      ><a name="7079" href="2016-10-30-one-lambda-calculus-many-times-2.html#7069" class="Bound"
      >&#915;</a
      ><a name="7080"
      > </a
      ><a name="7081" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="7082"
      > </a
      ><a name="7083" href="2016-10-30-one-lambda-calculus-many-times-2.html#7065" class="Bound"
      >B</a
      ><a name="7084"
      > </a
      ><a name="7085" class="Symbol"
      >&#8594;</a
      ><a name="7086"
      > </a
      ><a name="7087" href="2016-10-30-one-lambda-calculus-many-times-2.html#6868" class="Datatype Operator"
      >NJ</a
      ><a name="7089"
      > </a
      ><a name="7090" href="2016-10-30-one-lambda-calculus-many-times-2.html#7063" class="Bound"
      >A</a
      ><a name="7091"
      > </a
      ><a name="7092" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="7093"
      > </a
      ><a name="7094" href="2016-10-30-one-lambda-calculus-many-times-2.html#7069" class="Bound"
      >&#915;</a
      ><a name="7095"
      > </a
      ><a name="7096" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="7097"
      > </a
      ><a name="7098" href="2016-10-30-one-lambda-calculus-many-times-2.html#7065" class="Bound"
      >B</a
      ><a name="7099"
      >
    </a
      ><a name="7104" href="2016-10-30-one-lambda-calculus-many-times-2.html#7104" class="InductiveConstructor"
      >c</a
      ><a name="7105"
      >  </a
      ><a name="7107" class="Symbol"
      >:</a
      ><a name="7108"
      > </a
      ><a name="7109" class="Symbol"
      >&#8704;</a
      ><a name="7110"
      > </a
      ><a name="7123" class="Symbol"
      >&#8594;</a
      ><a name="7124"
      > </a
      ><a name="7125" href="2016-10-30-one-lambda-calculus-many-times-2.html#6868" class="Datatype Operator"
      >NJ</a
      ><a name="7127"
      > </a
      ><a name="7128" href="2016-10-30-one-lambda-calculus-many-times-2.html#7112" class="Bound"
      >A</a
      ><a name="7129"
      > </a
      ><a name="7130" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="7131"
      > </a
      ><a name="7132" href="2016-10-30-one-lambda-calculus-many-times-2.html#7112" class="Bound"
      >A</a
      ><a name="7133"
      > </a
      ><a name="7134" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="7135"
      > </a
      ><a name="7136" href="2016-10-30-one-lambda-calculus-many-times-2.html#7118" class="Bound"
      >&#915;</a
      ><a name="7137"
      > </a
      ><a name="7138" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="7139"
      > </a
      ><a name="7140" href="2016-10-30-one-lambda-calculus-many-times-2.html#7114" class="Bound"
      >B</a
      ><a name="7141"
      > </a
      ><a name="7142" class="Symbol"
      >&#8594;</a
      ><a name="7143"
      > </a
      ><a name="7144" href="2016-10-30-one-lambda-calculus-many-times-2.html#6868" class="Datatype Operator"
      >NJ</a
      ><a name="7146"
      > </a
      ><a name="7147" href="2016-10-30-one-lambda-calculus-many-times-2.html#7112" class="Bound"
      >A</a
      ><a name="7148"
      > </a
      ><a name="7149" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="7150"
      > </a
      ><a name="7151" href="2016-10-30-one-lambda-calculus-many-times-2.html#7118" class="Bound"
      >&#915;</a
      ><a name="7152"
      > </a
      ><a name="7153" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="7154"
      > </a
      ><a name="7155" href="2016-10-30-one-lambda-calculus-many-times-2.html#7114" class="Bound"
      >B</a
      ><a name="7156"
      >
    </a
      ><a name="7161" href="2016-10-30-one-lambda-calculus-many-times-2.html#7161" class="InductiveConstructor"
      >p</a
      ><a name="7162"
      >  </a
      ><a name="7164" class="Symbol"
      >:</a
      ><a name="7165"
      > </a
      ><a name="7166" class="Symbol"
      >&#8704;</a
      ><a name="7167"
      > </a
      ><a name="7176" class="Symbol"
      >&#8594;</a
      ><a name="7177"
      > </a
      ><a name="7178" class="Symbol"
      >&#8704;</a
      ><a name="7179"
      > </a
      ><a name="7180" href="2016-10-30-one-lambda-calculus-many-times-2.html#7180" class="Bound"
      >&#915;</a
      ><a name="7181"
      > </a
      ><a name="7182" class="Symbol"
      >&#8594;</a
      ><a name="7183"
      > </a
      ><a name="7184" class="Symbol"
      >&#8704;</a
      ><a name="7185"
      > </a
      ><a name="7190" class="Symbol"
      >&#8594;</a
      ><a name="7191"
      > </a
      ><a name="7192" href="2016-10-30-one-lambda-calculus-many-times-2.html#6868" class="Datatype Operator"
      >NJ</a
      ><a name="7194"
      > </a
      ><a name="7195" href="2016-10-30-one-lambda-calculus-many-times-2.html#7180" class="Bound"
      >&#915;</a
      ><a name="7196"
      > </a
      ><a name="7197" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="7199"
      > </a
      ><a name="7200" href="2016-10-30-one-lambda-calculus-many-times-2.html#7169" class="Bound"
      >A</a
      ><a name="7201"
      > </a
      ><a name="7202" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="7203"
      > </a
      ><a name="7204" href="2016-10-30-one-lambda-calculus-many-times-2.html#7171" class="Bound"
      >B</a
      ><a name="7205"
      > </a
      ><a name="7206" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="7207"
      > </a
      ><a name="7208" href="2016-10-30-one-lambda-calculus-many-times-2.html#7187" class="Bound"
      >&#916;</a
      ><a name="7209"
      > </a
      ><a name="7210" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="7211"
      > </a
      ><a name="7212" href="2016-10-30-one-lambda-calculus-many-times-2.html#7173" class="Bound"
      >C</a
      ><a name="7213"
      > </a
      ><a name="7214" class="Symbol"
      >&#8594;</a
      ><a name="7215"
      > </a
      ><a name="7216" href="2016-10-30-one-lambda-calculus-many-times-2.html#6868" class="Datatype Operator"
      >NJ</a
      ><a name="7218"
      > </a
      ><a name="7219" href="2016-10-30-one-lambda-calculus-many-times-2.html#7180" class="Bound"
      >&#915;</a
      ><a name="7220"
      > </a
      ><a name="7221" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="7223"
      > </a
      ><a name="7224" href="2016-10-30-one-lambda-calculus-many-times-2.html#7171" class="Bound"
      >B</a
      ><a name="7225"
      > </a
      ><a name="7226" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="7227"
      > </a
      ><a name="7228" href="2016-10-30-one-lambda-calculus-many-times-2.html#7169" class="Bound"
      >A</a
      ><a name="7229"
      > </a
      ><a name="7230" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="7231"
      > </a
      ><a name="7232" href="2016-10-30-one-lambda-calculus-many-times-2.html#7187" class="Bound"
      >&#916;</a
      ><a name="7233"
      > </a
      ><a name="7234" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="7235"
      > </a
      ><a name="7236" href="2016-10-30-one-lambda-calculus-many-times-2.html#7173" class="Bound"
      >C</a
      >
</pre><!--{% endraw %}-->



### Admissible Structural Rules in ND

If we are to have any hope of proving the equivalence between the implicit and the explicit systems, we should be able to prove that the implicit systems admit[^admit] the same structural rules. In the previous post, we've already proven the following theorem for ND:

> If $$\Gamma \subseteq \Gamma\prime$$ and $$\Gamma \vdash A$$, then
> $$\Gamma\prime \vdash A$$.

<div class="hidden">
<!--{% raw %}--><pre class="Agda">
  <a name="7695" class="Keyword"
      >module</a
      ><a name="7701"
      > </a
      ><a name="7702" href="2016-10-30-one-lambda-calculus-many-times-2.html#7702" class="Module"
      >ND</a
      ><a name="7704"
      > </a
      ><a name="7705" class="Keyword"
      >where</a
      ><a name="7710"
      >
    </a
      ><a name="7715" class="Keyword"
      >open</a
      ><a name="7719"
      > </a
      ><a name="7720" href="2016-03-20-one-lambda-calculus-many-times.html#1221" class="Module"
      >Part1.</a
      ><a name="7726" href="2016-03-20-one-lambda-calculus-many-times.html#1568" class="Module"
      >Syntax</a
      ><a name="7732"
      > </a
      ><a name="7733" href="2016-10-30-one-lambda-calculus-many-times-2.html#1149" class="Bound"
      >Atom</a
      ><a name="7737"
      > </a
      ><a name="7738" class="Keyword"
      >public</a
      ><a name="7744"
      > </a
      ><a name="7745" class="Keyword"
      >using</a
      ><a name="7750"
      > </a
      ><a name="7751" class="Symbol"
      >(</a
      ><a name="7752"
      >w&#8242;</a
      ><a name="7754" class="Symbol"
      >)</a
      >
</pre><!--{% endraw %}-->
</div>

And we've also shown that we can very easily use this theorem to define weakening, because <a class="Agda InductiveConstructor Spec" target="_blank" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227">there</a> is a proof that "weakening", i.e. <span class="Agda Spec"><a class="Bound">Γ</a> <a href="https://agda.github.io/agda-stdlib/Data.List.Any.html#3056" class="Function Operator" target="_blank">⊆</a> <a class="Bound">A</a> <a href="https://agda.github.io/agda-stdlib/Agda.Builtin.List.html#104" class="InductiveConstructor Operator" target="_blank">∷</a> <a class="Bound">Γ</a></span>, holds for the subset relationship.

<pre class="Agda Spec">    <a href="/2016/one-lambda-calculus-many-times/#8603" class="Function">w′</a><a> </a><a class="Symbol">:</a><a> </a><a href="/2016/one-lambda-calculus-many-times/#5371" class="Datatype Operator">ND</a><a> </a><a class="Bound">Γ</a><a> </a><a href="/2016/one-lambda-calculus-many-times/#3979" class="InductiveConstructor Operator">⊢</a><a> </a><a class="Bound">B</a><a> </a><a class="Symbol">→</a><a> </a><a href="/2016/one-lambda-calculus-many-times/#5371" class="Datatype Operator">ND</a><a> </a><a class="Bound">A</a><a> </a><a href="https://agda.github.io/agda-stdlib/Agda.Builtin.List.html#104" class="InductiveConstructor Operator" target="_blank">∷</a><a> </a><a class="Bound">Γ</a><a> </a><a href="/2016/one-lambda-calculus-many-times/#3979" class="InductiveConstructor Operator">⊢</a><a> </a><a class="Bound">B</a><a>
    </a><a href="/2016/one-lambda-calculus-many-times/#8603" class="Function">w′</a><a> </a><a class="Symbol">=</a><a> </a><a href="/2016/one-lambda-calculus-many-times/#7305" class="Function">struct</a><a> </a><a href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor" target="_blank">there</a></pre>

Therefore, all we need to show to extend this to contraction and permutation is that their respective equations, <span class="Agda Spec"><a class="Bound">A</a> <a href="https://agda.github.io/agda-stdlib/Agda.Builtin.List.html#104" class="InductiveConstructor Operator" target="_blank">∷</a> <a class="Bound">A</a> <a href="https://agda.github.io/agda-stdlib/Agda.Builtin.List.html#104" class="InductiveConstructor Operator" target="_blank">∷</a> <a class="Bound">Γ</a> <a href="https://agda.github.io/agda-stdlib/Data.List.Any.html#3056" class="Function Operator" target="_blank">⊆</a> <a class="Bound">A</a> <a href="https://agda.github.io/agda-stdlib/Agda.Builtin.List.html#104" class="InductiveConstructor Operator" target="_blank">∷</a> <a class="Bound">Γ</a></span> and <span class="Agda Spec"><a class="Bound">Γ</a><a> </a><a href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator" target="_blank">++</a><a> </a><a class="Bound">A</a><a> </a><a href="https://agda.github.io/agda-stdlib/Agda.Builtin.List.html#104" class="InductiveConstructor Operator" target="_blank">∷</a><a> </a><a class="Bound">B</a><a> </a><a href="https://agda.github.io/agda-stdlib/Agda.Builtin.List.html#104" class="InductiveConstructor Operator" target="_blank">∷</a><a> </a><a class="Bound">Δ</a><a> </a><a href="https://agda.github.io/agda-stdlib/Data.List.Any.html#3056" class="Function Operator" target="_blank">⊆</a><a> </a><a class="Bound">Γ</a><a> </a><a href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator" target="_blank">++</a><a> </a><a class="Bound">B</a><a> </a><a href="https://agda.github.io/agda-stdlib/Agda.Builtin.List.html#104" class="InductiveConstructor Operator" target="_blank">∷</a><a> </a><a class="Bound">A</a><a> </a><a href="https://agda.github.io/agda-stdlib/Agda.Builtin.List.html#104" class="InductiveConstructor Operator" target="_blank">∷</a><a> </a><a class="Bound">Δ</a></span>, hold for the subset relation as well. This is simply a matter of reindexing. For contraction, if our "index" (made up of <a class="Agda Spec InductiveConstructor" target="_blank" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174">here</a> and <a class="Agda InductiveConstructor Spec" target="_blank" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227">there</a>) points to the first formula, we keep it the same. Otherwise, we subtract one. That way, the first two formulas are *contracted*, and the rest is adjusted accordingly.

<!--{% raw %}--><pre class="Agda">
    <a name="12163" href="2016-10-30-one-lambda-calculus-many-times-2.html#12163" class="Function"
      >c&#8242;</a
      ><a name="12165"
      > </a
      ><a name="12166" class="Symbol"
      >:</a
      ><a name="12167"
      > </a
      ><a name="12168" class="Symbol"
      >&#8704;</a
      ><a name="12169"
      > </a
      ><a name="12178" class="Symbol"
      >&#8594;</a
      ><a name="12179"
      > </a
      ><a name="12180" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="12182"
      > </a
      ><a name="12183" href="2016-10-30-one-lambda-calculus-many-times-2.html#12171" class="Bound"
      >A</a
      ><a name="12184"
      > </a
      ><a name="12185" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12186"
      > </a
      ><a name="12187" href="2016-10-30-one-lambda-calculus-many-times-2.html#12171" class="Bound"
      >A</a
      ><a name="12188"
      > </a
      ><a name="12189" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12190"
      > </a
      ><a name="12191" href="2016-10-30-one-lambda-calculus-many-times-2.html#12175" class="Bound"
      >&#915;</a
      ><a name="12192"
      > </a
      ><a name="12193" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="12194"
      > </a
      ><a name="12195" href="2016-10-30-one-lambda-calculus-many-times-2.html#12173" class="Bound"
      >B</a
      ><a name="12196"
      > </a
      ><a name="12197" class="Symbol"
      >&#8594;</a
      ><a name="12198"
      > </a
      ><a name="12199" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="12201"
      > </a
      ><a name="12202" href="2016-10-30-one-lambda-calculus-many-times-2.html#12171" class="Bound"
      >A</a
      ><a name="12203"
      > </a
      ><a name="12204" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12205"
      > </a
      ><a name="12206" href="2016-10-30-one-lambda-calculus-many-times-2.html#12175" class="Bound"
      >&#915;</a
      ><a name="12207"
      > </a
      ><a name="12208" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="12209"
      > </a
      ><a name="12210" href="2016-10-30-one-lambda-calculus-many-times-2.html#12173" class="Bound"
      >B</a
      ><a name="12211"
      >
    </a
      ><a name="12216" href="2016-10-30-one-lambda-calculus-many-times-2.html#12163" class="Function"
      >c&#8242;</a
      ><a name="12218"
      > </a
      ><a name="12223" class="Symbol"
      >=</a
      ><a name="12224"
      > </a
      ><a name="12225" href="2016-03-20-one-lambda-calculus-many-times.html#7307" class="Function"
      >struct</a
      ><a name="12231"
      > </a
      ><a name="12232" href="2016-10-30-one-lambda-calculus-many-times-2.html#12262" class="Function"
      >contract&#8242;</a
      ><a name="12241"
      >
      </a
      ><a name="12248" class="Keyword"
      >where</a
      ><a name="12253"
      >
        </a
      ><a name="12262" href="2016-10-30-one-lambda-calculus-many-times-2.html#12262" class="Function"
      >contract&#8242;</a
      ><a name="12271"
      > </a
      ><a name="12272" class="Symbol"
      >:</a
      ><a name="12273"
      > </a
      ><a name="12274" class="Symbol"
      >&#8704;</a
      ><a name="12275"
      > </a
      ><a name="12282" class="Symbol"
      >&#8594;</a
      ><a name="12283"
      > </a
      ><a name="12284" href="2016-10-30-one-lambda-calculus-many-times-2.html#12277" class="Bound"
      >A</a
      ><a name="12285"
      > </a
      ><a name="12286" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12287"
      > </a
      ><a name="12288" href="2016-10-30-one-lambda-calculus-many-times-2.html#12277" class="Bound"
      >A</a
      ><a name="12289"
      > </a
      ><a name="12290" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12291"
      > </a
      ><a name="12292" href="2016-10-30-one-lambda-calculus-many-times-2.html#12279" class="Bound"
      >&#915;</a
      ><a name="12293"
      > </a
      ><a name="12294" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#3056" class="Function Operator"
      >&#8838;</a
      ><a name="12295"
      > </a
      ><a name="12296" href="2016-10-30-one-lambda-calculus-many-times-2.html#12277" class="Bound"
      >A</a
      ><a name="12297"
      > </a
      ><a name="12298" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12299"
      > </a
      ><a name="12300" href="2016-10-30-one-lambda-calculus-many-times-2.html#12279" class="Bound"
      >&#915;</a
      ><a name="12301"
      >
        </a
      ><a name="12310" href="2016-10-30-one-lambda-calculus-many-times-2.html#12262" class="Function"
      >contract&#8242;</a
      ><a name="12319"
      > </a
      ><a name="12320" class="Symbol"
      >(</a
      ><a name="12321" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="12325"
      > </a
      ><a name="12326" href="2016-10-30-one-lambda-calculus-many-times-2.html#12326" class="Bound"
      >px</a
      ><a name="12328" class="Symbol"
      >)</a
      ><a name="12329"
      > </a
      ><a name="12330" class="Symbol"
      >=</a
      ><a name="12331"
      > </a
      ><a name="12332" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="12336"
      > </a
      ><a name="12337" href="2016-10-30-one-lambda-calculus-many-times-2.html#12326" class="Bound"
      >px</a
      ><a name="12339"
      >
        </a
      ><a name="12348" href="2016-10-30-one-lambda-calculus-many-times-2.html#12262" class="Function"
      >contract&#8242;</a
      ><a name="12357"
      > </a
      ><a name="12358" class="Symbol"
      >(</a
      ><a name="12359" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="12364"
      > </a
      ><a name="12365" href="2016-10-30-one-lambda-calculus-many-times-2.html#12365" class="Bound"
      >i</a
      ><a name="12366" class="Symbol"
      >)</a
      ><a name="12367"
      > </a
      ><a name="12368" class="Symbol"
      >=</a
      ><a name="12369"
      > </a
      ><a name="12370" href="2016-10-30-one-lambda-calculus-many-times-2.html#12365" class="Bound"
      >i</a
      >
</pre><!--{% endraw %}-->

And for permutation, we skip through our index until we've passed the $$\Gamma$$ portion of the context, and then we swap the first two formulas.

<!--{% raw %}--><pre class="Agda">
    <a name="12548" href="2016-10-30-one-lambda-calculus-many-times-2.html#12548" class="Function"
      >p&#8242;</a
      ><a name="12550"
      > </a
      ><a name="12551" class="Symbol"
      >:</a
      ><a name="12552"
      > </a
      ><a name="12553" class="Symbol"
      >&#8704;</a
      ><a name="12554"
      > </a
      ><a name="12563" class="Symbol"
      >&#8594;</a
      ><a name="12564"
      > </a
      ><a name="12565" class="Symbol"
      >&#8704;</a
      ><a name="12566"
      > </a
      ><a name="12567" href="2016-10-30-one-lambda-calculus-many-times-2.html#12567" class="Bound"
      >&#915;</a
      ><a name="12568"
      > </a
      ><a name="12569" class="Symbol"
      >&#8594;</a
      ><a name="12570"
      > </a
      ><a name="12571" class="Symbol"
      >&#8704;</a
      ><a name="12572"
      > </a
      ><a name="12577" class="Symbol"
      >&#8594;</a
      ><a name="12578"
      > </a
      ><a name="12579" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="12581"
      > </a
      ><a name="12582" href="2016-10-30-one-lambda-calculus-many-times-2.html#12567" class="Bound"
      >&#915;</a
      ><a name="12583"
      > </a
      ><a name="12584" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="12586"
      > </a
      ><a name="12587" href="2016-10-30-one-lambda-calculus-many-times-2.html#12556" class="Bound"
      >A</a
      ><a name="12588"
      > </a
      ><a name="12589" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12590"
      > </a
      ><a name="12591" href="2016-10-30-one-lambda-calculus-many-times-2.html#12558" class="Bound"
      >B</a
      ><a name="12592"
      > </a
      ><a name="12593" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12594"
      > </a
      ><a name="12595" href="2016-10-30-one-lambda-calculus-many-times-2.html#12574" class="Bound"
      >&#916;</a
      ><a name="12596"
      > </a
      ><a name="12597" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="12598"
      > </a
      ><a name="12599" href="2016-10-30-one-lambda-calculus-many-times-2.html#12560" class="Bound"
      >C</a
      ><a name="12600"
      > </a
      ><a name="12601" class="Symbol"
      >&#8594;</a
      ><a name="12602"
      > </a
      ><a name="12603" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="12605"
      > </a
      ><a name="12606" href="2016-10-30-one-lambda-calculus-many-times-2.html#12567" class="Bound"
      >&#915;</a
      ><a name="12607"
      > </a
      ><a name="12608" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="12610"
      > </a
      ><a name="12611" href="2016-10-30-one-lambda-calculus-many-times-2.html#12558" class="Bound"
      >B</a
      ><a name="12612"
      > </a
      ><a name="12613" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12614"
      > </a
      ><a name="12615" href="2016-10-30-one-lambda-calculus-many-times-2.html#12556" class="Bound"
      >A</a
      ><a name="12616"
      > </a
      ><a name="12617" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12618"
      > </a
      ><a name="12619" href="2016-10-30-one-lambda-calculus-many-times-2.html#12574" class="Bound"
      >&#916;</a
      ><a name="12620"
      > </a
      ><a name="12621" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="12622"
      > </a
      ><a name="12623" href="2016-10-30-one-lambda-calculus-many-times-2.html#12560" class="Bound"
      >C</a
      ><a name="12624"
      >
    </a
      ><a name="12629" href="2016-10-30-one-lambda-calculus-many-times-2.html#12548" class="Function"
      >p&#8242;</a
      ><a name="12631"
      > </a
      ><a name="12632" href="2016-10-30-one-lambda-calculus-many-times-2.html#12632" class="Bound"
      >&#915;</a
      ><a name="12633"
      > </a
      ><a name="12634" class="Symbol"
      >=</a
      ><a name="12635"
      > </a
      ><a name="12636" href="2016-03-20-one-lambda-calculus-many-times.html#7307" class="Function"
      >struct</a
      ><a name="12642"
      > </a
      ><a name="12643" class="Symbol"
      >(</a
      ><a name="12644" href="2016-10-30-one-lambda-calculus-many-times-2.html#12676" class="Function"
      >permute&#8242;</a
      ><a name="12652"
      > </a
      ><a name="12653" href="2016-10-30-one-lambda-calculus-many-times-2.html#12632" class="Bound"
      >&#915;</a
      ><a name="12654" class="Symbol"
      >)</a
      ><a name="12655"
      >
      </a
      ><a name="12662" class="Keyword"
      >where</a
      ><a name="12667"
      >
        </a
      ><a name="12676" href="2016-10-30-one-lambda-calculus-many-times-2.html#12676" class="Function"
      >permute&#8242;</a
      ><a name="12684"
      > </a
      ><a name="12685" class="Symbol"
      >:</a
      ><a name="12686"
      > </a
      ><a name="12687" class="Symbol"
      >&#8704;</a
      ><a name="12688"
      > </a
      ><a name="12695" class="Symbol"
      >&#8594;</a
      ><a name="12696"
      > </a
      ><a name="12697" class="Symbol"
      >&#8704;</a
      ><a name="12698"
      > </a
      ><a name="12699" href="2016-10-30-one-lambda-calculus-many-times-2.html#12699" class="Bound"
      >&#915;</a
      ><a name="12700"
      > </a
      ><a name="12701" class="Symbol"
      >&#8594;</a
      ><a name="12702"
      > </a
      ><a name="12703" class="Symbol"
      >&#8704;</a
      ><a name="12704"
      > </a
      ><a name="12709" class="Symbol"
      >&#8594;</a
      ><a name="12710"
      > </a
      ><a name="12711" href="2016-10-30-one-lambda-calculus-many-times-2.html#12699" class="Bound"
      >&#915;</a
      ><a name="12712"
      > </a
      ><a name="12713" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="12715"
      > </a
      ><a name="12716" href="2016-10-30-one-lambda-calculus-many-times-2.html#12690" class="Bound"
      >A</a
      ><a name="12717"
      > </a
      ><a name="12718" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12719"
      > </a
      ><a name="12720" href="2016-10-30-one-lambda-calculus-many-times-2.html#12692" class="Bound"
      >B</a
      ><a name="12721"
      > </a
      ><a name="12722" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12723"
      > </a
      ><a name="12724" href="2016-10-30-one-lambda-calculus-many-times-2.html#12706" class="Bound"
      >&#916;</a
      ><a name="12725"
      > </a
      ><a name="12726" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#3056" class="Function Operator"
      >&#8838;</a
      ><a name="12727"
      > </a
      ><a name="12728" href="2016-10-30-one-lambda-calculus-many-times-2.html#12699" class="Bound"
      >&#915;</a
      ><a name="12729"
      > </a
      ><a name="12730" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="12732"
      > </a
      ><a name="12733" href="2016-10-30-one-lambda-calculus-many-times-2.html#12692" class="Bound"
      >B</a
      ><a name="12734"
      > </a
      ><a name="12735" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12736"
      > </a
      ><a name="12737" href="2016-10-30-one-lambda-calculus-many-times-2.html#12690" class="Bound"
      >A</a
      ><a name="12738"
      > </a
      ><a name="12739" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12740"
      > </a
      ><a name="12741" href="2016-10-30-one-lambda-calculus-many-times-2.html#12706" class="Bound"
      >&#916;</a
      ><a name="12742"
      >
        </a
      ><a name="12751" href="2016-10-30-one-lambda-calculus-many-times-2.html#12676" class="Function"
      >permute&#8242;</a
      ><a name="12759"
      > </a
      ><a name="12760" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="12762"
      >      </a
      ><a name="12768" class="Symbol"
      >(</a
      ><a name="12769" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="12773"
      > </a
      ><a name="12774" href="2016-10-30-one-lambda-calculus-many-times-2.html#12774" class="Bound"
      >px</a
      ><a name="12776" class="Symbol"
      >)</a
      ><a name="12777"
      >         </a
      ><a name="12786" class="Symbol"
      >=</a
      ><a name="12787"
      > </a
      ><a name="12788" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="12793"
      > </a
      ><a name="12794" class="Symbol"
      >(</a
      ><a name="12795" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="12799"
      > </a
      ><a name="12800" href="2016-10-30-one-lambda-calculus-many-times-2.html#12774" class="Bound"
      >px</a
      ><a name="12802" class="Symbol"
      >)</a
      ><a name="12803"
      >
        </a
      ><a name="12812" href="2016-10-30-one-lambda-calculus-many-times-2.html#12676" class="Function"
      >permute&#8242;</a
      ><a name="12820"
      > </a
      ><a name="12821" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="12823"
      >      </a
      ><a name="12829" class="Symbol"
      >(</a
      ><a name="12830" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="12835"
      > </a
      ><a name="12836" class="Symbol"
      >(</a
      ><a name="12837" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="12841"
      > </a
      ><a name="12842" href="2016-10-30-one-lambda-calculus-many-times-2.html#12842" class="Bound"
      >px</a
      ><a name="12844" class="Symbol"
      >))</a
      ><a name="12846"
      > </a
      ><a name="12847" class="Symbol"
      >=</a
      ><a name="12848"
      > </a
      ><a name="12849" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="12853"
      > </a
      ><a name="12854" href="2016-10-30-one-lambda-calculus-many-times-2.html#12842" class="Bound"
      >px</a
      ><a name="12856"
      >
        </a
      ><a name="12865" href="2016-10-30-one-lambda-calculus-many-times-2.html#12676" class="Function"
      >permute&#8242;</a
      ><a name="12873"
      > </a
      ><a name="12874" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="12876"
      >      </a
      ><a name="12882" class="Symbol"
      >(</a
      ><a name="12883" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="12888"
      > </a
      ><a name="12889" class="Symbol"
      >(</a
      ><a name="12890" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="12895"
      > </a
      ><a name="12896" href="2016-10-30-one-lambda-calculus-many-times-2.html#12896" class="Bound"
      >i</a
      ><a name="12897" class="Symbol"
      >))</a
      ><a name="12899"
      > </a
      ><a name="12900" class="Symbol"
      >=</a
      ><a name="12901"
      > </a
      ><a name="12902" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="12907"
      > </a
      ><a name="12908" class="Symbol"
      >(</a
      ><a name="12909" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="12914"
      > </a
      ><a name="12915" href="2016-10-30-one-lambda-calculus-many-times-2.html#12896" class="Bound"
      >i</a
      ><a name="12916" class="Symbol"
      >)</a
      ><a name="12917"
      >
        </a
      ><a name="12926" href="2016-10-30-one-lambda-calculus-many-times-2.html#12676" class="Function"
      >permute&#8242;</a
      ><a name="12934"
      > </a
      ><a name="12935" class="Symbol"
      >(</a
      ><a name="12936" href="2016-10-30-one-lambda-calculus-many-times-2.html#12936" class="Bound"
      >C</a
      ><a name="12937"
      > </a
      ><a name="12938" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12939"
      > </a
      ><a name="12940" href="2016-10-30-one-lambda-calculus-many-times-2.html#12940" class="Bound"
      >&#915;</a
      ><a name="12941" class="Symbol"
      >)</a
      ><a name="12942"
      > </a
      ><a name="12943" class="Symbol"
      >(</a
      ><a name="12944" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="12948"
      > </a
      ><a name="12949" href="2016-10-30-one-lambda-calculus-many-times-2.html#12949" class="Bound"
      >px</a
      ><a name="12951" class="Symbol"
      >)</a
      ><a name="12952"
      >         </a
      ><a name="12961" class="Symbol"
      >=</a
      ><a name="12962"
      > </a
      ><a name="12963" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="12967"
      > </a
      ><a name="12968" href="2016-10-30-one-lambda-calculus-many-times-2.html#12949" class="Bound"
      >px</a
      ><a name="12970"
      >
        </a
      ><a name="12979" href="2016-10-30-one-lambda-calculus-many-times-2.html#12676" class="Function"
      >permute&#8242;</a
      ><a name="12987"
      > </a
      ><a name="12988" class="Symbol"
      >(</a
      ><a name="12989" href="2016-10-30-one-lambda-calculus-many-times-2.html#12989" class="Bound"
      >C</a
      ><a name="12990"
      > </a
      ><a name="12991" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12992"
      > </a
      ><a name="12993" href="2016-10-30-one-lambda-calculus-many-times-2.html#12993" class="Bound"
      >&#915;</a
      ><a name="12994" class="Symbol"
      >)</a
      ><a name="12995"
      > </a
      ><a name="12996" class="Symbol"
      >(</a
      ><a name="12997" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="13002"
      > </a
      ><a name="13003" href="2016-10-30-one-lambda-calculus-many-times-2.html#13003" class="Bound"
      >i</a
      ><a name="13004" class="Symbol"
      >)</a
      ><a name="13005"
      >         </a
      ><a name="13014" class="Symbol"
      >=</a
      ><a name="13015"
      > </a
      ><a name="13016" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="13021"
      > </a
      ><a name="13022" class="Symbol"
      >(</a
      ><a name="13023" href="2016-10-30-one-lambda-calculus-many-times-2.html#12676" class="Function"
      >permute&#8242;</a
      ><a name="13031"
      > </a
      ><a name="13032" href="2016-10-30-one-lambda-calculus-many-times-2.html#12993" class="Bound"
      >&#915;</a
      ><a name="13033"
      > </a
      ><a name="13034" href="2016-10-30-one-lambda-calculus-many-times-2.html#13003" class="Bound"
      >i</a
      ><a name="13035" class="Symbol"
      >)</a
      >
</pre><!--{% endraw %}-->

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

<!--{% raw %}--><pre class="Agda">
    <a name="16386" href="2016-10-30-one-lambda-calculus-many-times-2.html#16386" class="Function"
      >weaken</a
      ><a name="16392"
      > </a
      ><a name="16393" class="Symbol"
      >:</a
      ><a name="16394"
      > </a
      ><a name="16395" class="Symbol"
      >&#8704;</a
      ><a name="16396"
      > </a
      ><a name="16397" href="2016-10-30-one-lambda-calculus-many-times-2.html#16397" class="Bound"
      >&#915;</a
      ><a name="16398"
      > </a
      ><a name="16399" class="Symbol"
      >&#8594;</a
      ><a name="16400"
      > </a
      ><a name="16401" class="Symbol"
      >&#8704;</a
      ><a name="16402"
      > </a
      ><a name="16407" class="Symbol"
      >&#8594;</a
      ><a name="16408"
      > </a
      ><a name="16409" href="2016-10-30-one-lambda-calculus-many-times-2.html#16404" class="Bound"
      >&#916;</a
      ><a name="16410"
      > </a
      ><a name="16411" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#3056" class="Function Operator"
      >&#8838;</a
      ><a name="16412"
      > </a
      ><a name="16413" href="2016-10-30-one-lambda-calculus-many-times-2.html#16397" class="Bound"
      >&#915;</a
      ><a name="16414"
      > </a
      ><a name="16415" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="16417"
      > </a
      ><a name="16418" href="2016-10-30-one-lambda-calculus-many-times-2.html#16404" class="Bound"
      >&#916;</a
      ><a name="16419"
      >
    </a
      ><a name="16424" href="2016-10-30-one-lambda-calculus-many-times-2.html#16386" class="Function"
      >weaken</a
      ><a name="16430"
      > </a
      ><a name="16431" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="16433"
      >      </a
      ><a name="16439" href="2016-10-30-one-lambda-calculus-many-times-2.html#16439" class="Bound"
      >i</a
      ><a name="16440"
      > </a
      ><a name="16441" class="Symbol"
      >=</a
      ><a name="16442"
      > </a
      ><a name="16443" href="2016-10-30-one-lambda-calculus-many-times-2.html#16439" class="Bound"
      >i</a
      ><a name="16444"
      >
    </a
      ><a name="16449" href="2016-10-30-one-lambda-calculus-many-times-2.html#16386" class="Function"
      >weaken</a
      ><a name="16455"
      > </a
      ><a name="16456" class="Symbol"
      >(</a
      ><a name="16457" href="2016-10-30-one-lambda-calculus-many-times-2.html#16457" class="Bound"
      >A</a
      ><a name="16458"
      > </a
      ><a name="16459" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="16460"
      > </a
      ><a name="16461" href="2016-10-30-one-lambda-calculus-many-times-2.html#16461" class="Bound"
      >&#915;</a
      ><a name="16462" class="Symbol"
      >)</a
      ><a name="16463"
      > </a
      ><a name="16464" href="2016-10-30-one-lambda-calculus-many-times-2.html#16464" class="Bound"
      >i</a
      ><a name="16465"
      > </a
      ><a name="16466" class="Symbol"
      >=</a
      ><a name="16467"
      > </a
      ><a name="16468" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="16473"
      > </a
      ><a name="16474" class="Symbol"
      >(</a
      ><a name="16475" href="2016-10-30-one-lambda-calculus-many-times-2.html#16386" class="Function"
      >weaken</a
      ><a name="16481"
      > </a
      ><a name="16482" href="2016-10-30-one-lambda-calculus-many-times-2.html#16461" class="Bound"
      >&#915;</a
      ><a name="16483"
      > </a
      ><a name="16484" href="2016-10-30-one-lambda-calculus-many-times-2.html#16464" class="Bound"
      >i</a
      ><a name="16485" class="Symbol"
      >)</a
      >
</pre><!--{% endraw %}-->

Forwards movement, or $$\small f^+$$, is a little bit more involved: we move a formula $$A$$ past a context $$\Sigma$$. We do so without moving any formulas in the prefix $$\Gamma$$ or the suffix $$\Delta$$. The definition of forwards movement is split into two maps on indices: <a class="Agda Spec Function">forward</a> and <a class="Agda Spec Function">forward′</a>. In <a class="Agda Spec Function">forward</a>, we define the mapping for indices which point to some position in $$\Gamma$$; nothing changes. Once we have moved past $$\Gamma$$, we enter the nested function <a class="Agda Spec Function">forward′</a>, and $$\Sigma$$. Here, we start moving each index one position back, to make room for the formula $$A$$. Once we move past $$\Sigma$$, and find the index pointint to $$A$$, all we have to do is return <a class="Agda Spec InductiveConstructor" target="_blank" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174">here</a>. Nothing has to change for the indices pointing into $$\Delta$$.

<!--{% raw %}--><pre class="Agda">
    <a name="17534" href="2016-10-30-one-lambda-calculus-many-times-2.html#17534" class="Function"
      >forward</a
      ><a name="17541"
      > </a
      ><a name="17542" class="Symbol"
      >:</a
      ><a name="17543"
      > </a
      ><a name="17544" class="Symbol"
      >&#8704;</a
      ><a name="17545"
      > </a
      ><a name="17550" class="Symbol"
      >&#8594;</a
      ><a name="17551"
      > </a
      ><a name="17552" class="Symbol"
      >&#8704;</a
      ><a name="17553"
      > </a
      ><a name="17554" href="2016-10-30-one-lambda-calculus-many-times-2.html#17554" class="Bound"
      >&#915;</a
      ><a name="17555"
      > </a
      ><a name="17556" href="2016-10-30-one-lambda-calculus-many-times-2.html#17556" class="Bound"
      >&#931;</a
      ><a name="17557"
      > </a
      ><a name="17558" class="Symbol"
      >&#8594;</a
      ><a name="17559"
      > </a
      ><a name="17560" class="Symbol"
      >&#8704;</a
      ><a name="17561"
      > </a
      ><a name="17566" class="Symbol"
      >&#8594;</a
      ><a name="17567"
      > </a
      ><a name="17568" class="Symbol"
      >(</a
      ><a name="17569" href="2016-10-30-one-lambda-calculus-many-times-2.html#17554" class="Bound"
      >&#915;</a
      ><a name="17570"
      > </a
      ><a name="17571" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="17573"
      > </a
      ><a name="17574" href="2016-10-30-one-lambda-calculus-many-times-2.html#17556" class="Bound"
      >&#931;</a
      ><a name="17575" class="Symbol"
      >)</a
      ><a name="17576"
      > </a
      ><a name="17577" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="17579"
      > </a
      ><a name="17580" href="2016-10-30-one-lambda-calculus-many-times-2.html#17547" class="Bound"
      >A</a
      ><a name="17581"
      > </a
      ><a name="17582" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="17583"
      > </a
      ><a name="17584" href="2016-10-30-one-lambda-calculus-many-times-2.html#17563" class="Bound"
      >&#916;</a
      ><a name="17585"
      > </a
      ><a name="17586" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#3056" class="Function Operator"
      >&#8838;</a
      ><a name="17587"
      > </a
      ><a name="17588" class="Symbol"
      >(</a
      ><a name="17589" href="2016-10-30-one-lambda-calculus-many-times-2.html#17554" class="Bound"
      >&#915;</a
      ><a name="17590"
      > </a
      ><a name="17591" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="17593"
      > </a
      ><a name="17594" href="2016-10-30-one-lambda-calculus-many-times-2.html#17547" class="Bound"
      >A</a
      ><a name="17595"
      > </a
      ><a name="17596" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="17597"
      > </a
      ><a name="17598" href="2016-10-30-one-lambda-calculus-many-times-2.html#17556" class="Bound"
      >&#931;</a
      ><a name="17599" class="Symbol"
      >)</a
      ><a name="17600"
      > </a
      ><a name="17601" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="17603"
      > </a
      ><a name="17604" href="2016-10-30-one-lambda-calculus-many-times-2.html#17563" class="Bound"
      >&#916;</a
      ><a name="17605"
      >
    </a
      ><a name="17610" href="2016-10-30-one-lambda-calculus-many-times-2.html#17534" class="Function"
      >forward</a
      ><a name="17617"
      > </a
      ><a name="17618" class="Symbol"
      >(</a
      ><a name="17619" href="2016-10-30-one-lambda-calculus-many-times-2.html#17619" class="Bound"
      >C</a
      ><a name="17620"
      > </a
      ><a name="17621" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="17622"
      > </a
      ><a name="17623" href="2016-10-30-one-lambda-calculus-many-times-2.html#17623" class="Bound"
      >&#915;</a
      ><a name="17624" class="Symbol"
      >)</a
      ><a name="17625"
      > </a
      ><a name="17626" href="2016-10-30-one-lambda-calculus-many-times-2.html#17626" class="Bound"
      >&#931;</a
      ><a name="17627"
      > </a
      ><a name="17628" class="Symbol"
      >(</a
      ><a name="17629" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="17633"
      > </a
      ><a name="17634" href="2016-10-30-one-lambda-calculus-many-times-2.html#17634" class="Bound"
      >px</a
      ><a name="17636" class="Symbol"
      >)</a
      ><a name="17637"
      > </a
      ><a name="17638" class="Symbol"
      >=</a
      ><a name="17639"
      > </a
      ><a name="17640" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="17644"
      > </a
      ><a name="17645" href="2016-10-30-one-lambda-calculus-many-times-2.html#17634" class="Bound"
      >px</a
      ><a name="17647"
      >
    </a
      ><a name="17652" href="2016-10-30-one-lambda-calculus-many-times-2.html#17534" class="Function"
      >forward</a
      ><a name="17659"
      > </a
      ><a name="17660" class="Symbol"
      >(</a
      ><a name="17661" href="2016-10-30-one-lambda-calculus-many-times-2.html#17661" class="Bound"
      >C</a
      ><a name="17662"
      > </a
      ><a name="17663" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="17664"
      > </a
      ><a name="17665" href="2016-10-30-one-lambda-calculus-many-times-2.html#17665" class="Bound"
      >&#915;</a
      ><a name="17666" class="Symbol"
      >)</a
      ><a name="17667"
      > </a
      ><a name="17668" href="2016-10-30-one-lambda-calculus-many-times-2.html#17668" class="Bound"
      >&#931;</a
      ><a name="17669"
      > </a
      ><a name="17670" class="Symbol"
      >(</a
      ><a name="17671" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="17676"
      > </a
      ><a name="17677" href="2016-10-30-one-lambda-calculus-many-times-2.html#17677" class="Bound"
      >i</a
      ><a name="17678" class="Symbol"
      >)</a
      ><a name="17679"
      > </a
      ><a name="17680" class="Symbol"
      >=</a
      ><a name="17681"
      > </a
      ><a name="17682" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="17687"
      > </a
      ><a name="17688" class="Symbol"
      >(</a
      ><a name="17689" href="2016-10-30-one-lambda-calculus-many-times-2.html#17534" class="Function"
      >forward</a
      ><a name="17696"
      > </a
      ><a name="17697" href="2016-10-30-one-lambda-calculus-many-times-2.html#17665" class="Bound"
      >&#915;</a
      ><a name="17698"
      > </a
      ><a name="17699" href="2016-10-30-one-lambda-calculus-many-times-2.html#17668" class="Bound"
      >&#931;</a
      ><a name="17700"
      > </a
      ><a name="17701" href="2016-10-30-one-lambda-calculus-many-times-2.html#17677" class="Bound"
      >i</a
      ><a name="17702" class="Symbol"
      >)</a
      ><a name="17703"
      >
    </a
      ><a name="17708" href="2016-10-30-one-lambda-calculus-many-times-2.html#17534" class="Function"
      >forward</a
      ><a name="17715"
      > </a
      ><a name="17716" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="17718"
      >      </a
      ><a name="17724" href="2016-10-30-one-lambda-calculus-many-times-2.html#17724" class="Bound"
      >&#931;</a
      ><a name="17725"
      >        </a
      ><a name="17733" href="2016-10-30-one-lambda-calculus-many-times-2.html#17733" class="Bound"
      >i</a
      ><a name="17734"
      >  </a
      ><a name="17736" class="Symbol"
      >=</a
      ><a name="17737"
      > </a
      ><a name="17738" href="2016-10-30-one-lambda-calculus-many-times-2.html#17771" class="Function"
      >forward&#8242;</a
      ><a name="17746"
      > </a
      ><a name="17747" href="2016-10-30-one-lambda-calculus-many-times-2.html#17724" class="Bound"
      >&#931;</a
      ><a name="17748"
      > </a
      ><a name="17749" href="2016-10-30-one-lambda-calculus-many-times-2.html#17733" class="Bound"
      >i</a
      ><a name="17750"
      >
      </a
      ><a name="17757" class="Keyword"
      >where</a
      ><a name="17762"
      >
        </a
      ><a name="17771" href="2016-10-30-one-lambda-calculus-many-times-2.html#17771" class="Function"
      >forward&#8242;</a
      ><a name="17779"
      > </a
      ><a name="17780" class="Symbol"
      >:</a
      ><a name="17781"
      > </a
      ><a name="17782" class="Symbol"
      >&#8704;</a
      ><a name="17783"
      > </a
      ><a name="17788" class="Symbol"
      >&#8594;</a
      ><a name="17789"
      > </a
      ><a name="17790" class="Symbol"
      >&#8704;</a
      ><a name="17791"
      > </a
      ><a name="17792" href="2016-10-30-one-lambda-calculus-many-times-2.html#17792" class="Bound"
      >&#931;</a
      ><a name="17793"
      > </a
      ><a name="17794" class="Symbol"
      >&#8594;</a
      ><a name="17795"
      > </a
      ><a name="17796" class="Symbol"
      >&#8704;</a
      ><a name="17797"
      > </a
      ><a name="17802" class="Symbol"
      >&#8594;</a
      ><a name="17803"
      > </a
      ><a name="17804" href="2016-10-30-one-lambda-calculus-many-times-2.html#17792" class="Bound"
      >&#931;</a
      ><a name="17805"
      > </a
      ><a name="17806" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="17808"
      > </a
      ><a name="17809" href="2016-10-30-one-lambda-calculus-many-times-2.html#17785" class="Bound"
      >A</a
      ><a name="17810"
      > </a
      ><a name="17811" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="17812"
      > </a
      ><a name="17813" href="2016-10-30-one-lambda-calculus-many-times-2.html#17799" class="Bound"
      >&#916;</a
      ><a name="17814"
      > </a
      ><a name="17815" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#3056" class="Function Operator"
      >&#8838;</a
      ><a name="17816"
      > </a
      ><a name="17817" href="2016-10-30-one-lambda-calculus-many-times-2.html#17785" class="Bound"
      >A</a
      ><a name="17818"
      > </a
      ><a name="17819" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="17820"
      > </a
      ><a name="17821" href="2016-10-30-one-lambda-calculus-many-times-2.html#17792" class="Bound"
      >&#931;</a
      ><a name="17822"
      > </a
      ><a name="17823" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="17825"
      > </a
      ><a name="17826" href="2016-10-30-one-lambda-calculus-many-times-2.html#17799" class="Bound"
      >&#916;</a
      ><a name="17827"
      >
        </a
      ><a name="17836" href="2016-10-30-one-lambda-calculus-many-times-2.html#17771" class="Function"
      >forward&#8242;</a
      ><a name="17844"
      >      </a
      ><a name="17850" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="17852"
      >        </a
      ><a name="17860" href="2016-10-30-one-lambda-calculus-many-times-2.html#17860" class="Bound"
      >i</a
      ><a name="17861"
      >  </a
      ><a name="17863" class="Symbol"
      >=</a
      ><a name="17864"
      > </a
      ><a name="17865" href="2016-10-30-one-lambda-calculus-many-times-2.html#17860" class="Bound"
      >i</a
      ><a name="17866"
      >
        </a
      ><a name="17875" href="2016-10-30-one-lambda-calculus-many-times-2.html#17771" class="Function"
      >forward&#8242;</a
      ><a name="17883"
      > </a
      ><a name="17884" class="Symbol"
      >(</a
      ><a name="17885" href="2016-10-30-one-lambda-calculus-many-times-2.html#17885" class="Bound"
      >C</a
      ><a name="17886"
      > </a
      ><a name="17887" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="17888"
      > </a
      ><a name="17889" href="2016-10-30-one-lambda-calculus-many-times-2.html#17889" class="Bound"
      >&#931;</a
      ><a name="17890" class="Symbol"
      >)</a
      ><a name="17891"
      > </a
      ><a name="17892" class="Symbol"
      >(</a
      ><a name="17893" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="17897"
      > </a
      ><a name="17898" href="2016-10-30-one-lambda-calculus-many-times-2.html#17898" class="Bound"
      >px</a
      ><a name="17900" class="Symbol"
      >)</a
      ><a name="17901"
      > </a
      ><a name="17902" class="Symbol"
      >=</a
      ><a name="17903"
      > </a
      ><a name="17904" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="17909"
      > </a
      ><a name="17910" class="Symbol"
      >(</a
      ><a name="17911" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="17915"
      > </a
      ><a name="17916" href="2016-10-30-one-lambda-calculus-many-times-2.html#17898" class="Bound"
      >px</a
      ><a name="17918" class="Symbol"
      >)</a
      ><a name="17919"
      >
        </a
      ><a name="17928" href="2016-10-30-one-lambda-calculus-many-times-2.html#17771" class="Function"
      >forward&#8242;</a
      ><a name="17936"
      > </a
      ><a name="17937" class="Symbol"
      >(</a
      ><a name="17938" href="2016-10-30-one-lambda-calculus-many-times-2.html#17938" class="Bound"
      >C</a
      ><a name="17939"
      > </a
      ><a name="17940" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="17941"
      > </a
      ><a name="17942" href="2016-10-30-one-lambda-calculus-many-times-2.html#17942" class="Bound"
      >&#931;</a
      ><a name="17943" class="Symbol"
      >)</a
      ><a name="17944"
      > </a
      ><a name="17945" class="Symbol"
      >(</a
      ><a name="17946" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="17951"
      > </a
      ><a name="17952" href="2016-10-30-one-lambda-calculus-many-times-2.html#17952" class="Bound"
      >i</a
      ><a name="17953" class="Symbol"
      >)</a
      ><a name="17954"
      > </a
      ><a name="17955" class="Keyword"
      >with</a
      ><a name="17959"
      > </a
      ><a name="17960" href="2016-10-30-one-lambda-calculus-many-times-2.html#17771" class="Function"
      >forward&#8242;</a
      ><a name="17968"
      > </a
      ><a name="17969" href="2016-10-30-one-lambda-calculus-many-times-2.html#17942" class="Bound"
      >&#931;</a
      ><a name="17970"
      > </a
      ><a name="17971" href="2016-10-30-one-lambda-calculus-many-times-2.html#17952" class="Bound"
      >i</a
      ><a name="17972"
      >
        </a
      ><a name="17981" href="2016-10-30-one-lambda-calculus-many-times-2.html#17771" class="Function"
      >forward&#8242;</a
      ><a name="17989"
      > </a
      ><a name="17990" class="Symbol"
      >(</a
      ><a name="17991" href="2016-10-30-one-lambda-calculus-many-times-2.html#17991" class="Bound"
      >C</a
      ><a name="17992"
      > </a
      ><a name="17993" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="17994"
      > </a
      ><a name="17995" href="2016-10-30-one-lambda-calculus-many-times-2.html#17995" class="Bound"
      >&#931;</a
      ><a name="17996" class="Symbol"
      >)</a
      ><a name="17997"
      > </a
      ><a name="17998" class="Symbol"
      >(</a
      ><a name="17999" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="18004"
      > </a
      ><a name="18005" href="2016-10-30-one-lambda-calculus-many-times-2.html#18005" class="Bound"
      >i</a
      ><a name="18006" class="Symbol"
      >)</a
      ><a name="18007"
      > </a
      ><a name="18008" class="Symbol"
      >|</a
      ><a name="18009"
      > </a
      ><a name="18010" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="18014"
      > </a
      ><a name="18015" href="2016-10-30-one-lambda-calculus-many-times-2.html#18015" class="Bound"
      >px</a
      ><a name="18017"
      > </a
      ><a name="18018" class="Symbol"
      >=</a
      ><a name="18019"
      > </a
      ><a name="18020" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="18024"
      > </a
      ><a name="18025" href="2016-10-30-one-lambda-calculus-many-times-2.html#18015" class="Bound"
      >px</a
      ><a name="18027"
      >
        </a
      ><a name="18036" href="2016-10-30-one-lambda-calculus-many-times-2.html#17771" class="Function"
      >forward&#8242;</a
      ><a name="18044"
      > </a
      ><a name="18045" class="Symbol"
      >(</a
      ><a name="18046" href="2016-10-30-one-lambda-calculus-many-times-2.html#18046" class="Bound"
      >C</a
      ><a name="18047"
      > </a
      ><a name="18048" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="18049"
      > </a
      ><a name="18050" href="2016-10-30-one-lambda-calculus-many-times-2.html#18050" class="Bound"
      >&#931;</a
      ><a name="18051" class="Symbol"
      >)</a
      ><a name="18052"
      > </a
      ><a name="18053" class="Symbol"
      >(</a
      ><a name="18054" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="18059"
      > </a
      ><a name="18060" href="2016-10-30-one-lambda-calculus-many-times-2.html#18060" class="Bound"
      >i</a
      ><a name="18061" class="Symbol"
      >)</a
      ><a name="18062"
      > </a
      ><a name="18063" class="Symbol"
      >|</a
      ><a name="18064"
      > </a
      ><a name="18065" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="18070"
      > </a
      ><a name="18071" href="2016-10-30-one-lambda-calculus-many-times-2.html#18071" class="Bound"
      >j</a
      ><a name="18072"
      > </a
      ><a name="18073" class="Symbol"
      >=</a
      ><a name="18074"
      > </a
      ><a name="18075" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="18080"
      > </a
      ><a name="18081" class="Symbol"
      >(</a
      ><a name="18082" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="18087"
      > </a
      ><a name="18088" href="2016-10-30-one-lambda-calculus-many-times-2.html#18071" class="Bound"
      >j</a
      ><a name="18089" class="Symbol"
      >)</a
      >
</pre><!--{% endraw %}-->

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

<!--{% raw %}--><pre class="Agda">
    <a name="19127" href="2016-10-30-one-lambda-calculus-many-times-2.html#19127" class="Function"
      >permute</a
      ><a name="19134"
      > </a
      ><a name="19135" class="Symbol"
      >:</a
      ><a name="19136"
      > </a
      ><a name="19137" class="Symbol"
      >&#8704;</a
      ><a name="19138"
      > </a
      ><a name="19139" href="2016-10-30-one-lambda-calculus-many-times-2.html#19139" class="Bound"
      >&#915;</a
      ><a name="19140"
      > </a
      ><a name="19141" href="2016-10-30-one-lambda-calculus-many-times-2.html#19141" class="Bound"
      >&#931;</a
      ><a name="19142"
      > </a
      ><a name="19143" href="2016-10-30-one-lambda-calculus-many-times-2.html#19143" class="Bound"
      >&#928;</a
      ><a name="19144"
      > </a
      ><a name="19145" class="Symbol"
      >&#8594;</a
      ><a name="19146"
      > </a
      ><a name="19147" class="Symbol"
      >&#8704;</a
      ><a name="19148"
      > </a
      ><a name="19153" class="Symbol"
      >&#8594;</a
      ><a name="19154"
      > </a
      ><a name="19155" class="Symbol"
      >(</a
      ><a name="19156" href="2016-10-30-one-lambda-calculus-many-times-2.html#19139" class="Bound"
      >&#915;</a
      ><a name="19157"
      > </a
      ><a name="19158" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19160"
      > </a
      ><a name="19161" href="2016-10-30-one-lambda-calculus-many-times-2.html#19141" class="Bound"
      >&#931;</a
      ><a name="19162" class="Symbol"
      >)</a
      ><a name="19163"
      > </a
      ><a name="19164" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19166"
      > </a
      ><a name="19167" class="Symbol"
      >(</a
      ><a name="19168" href="2016-10-30-one-lambda-calculus-many-times-2.html#19143" class="Bound"
      >&#928;</a
      ><a name="19169"
      > </a
      ><a name="19170" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19172"
      > </a
      ><a name="19173" href="2016-10-30-one-lambda-calculus-many-times-2.html#19150" class="Bound"
      >&#916;</a
      ><a name="19174" class="Symbol"
      >)</a
      ><a name="19175"
      > </a
      ><a name="19176" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#3056" class="Function Operator"
      >&#8838;</a
      ><a name="19177"
      > </a
      ><a name="19178" class="Symbol"
      >(</a
      ><a name="19179" href="2016-10-30-one-lambda-calculus-many-times-2.html#19139" class="Bound"
      >&#915;</a
      ><a name="19180"
      > </a
      ><a name="19181" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19183"
      > </a
      ><a name="19184" href="2016-10-30-one-lambda-calculus-many-times-2.html#19143" class="Bound"
      >&#928;</a
      ><a name="19185" class="Symbol"
      >)</a
      ><a name="19186"
      > </a
      ><a name="19187" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19189"
      > </a
      ><a name="19190" class="Symbol"
      >(</a
      ><a name="19191" href="2016-10-30-one-lambda-calculus-many-times-2.html#19141" class="Bound"
      >&#931;</a
      ><a name="19192"
      > </a
      ><a name="19193" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19195"
      > </a
      ><a name="19196" href="2016-10-30-one-lambda-calculus-many-times-2.html#19150" class="Bound"
      >&#916;</a
      ><a name="19197" class="Symbol"
      >)</a
      ><a name="19198"
      >
    </a
      ><a name="19203" href="2016-10-30-one-lambda-calculus-many-times-2.html#19127" class="Function"
      >permute</a
      ><a name="19210"
      > </a
      ><a name="19211" href="2016-10-30-one-lambda-calculus-many-times-2.html#19211" class="Bound"
      >&#915;</a
      ><a name="19212"
      > </a
      ><a name="19213" href="2016-10-30-one-lambda-calculus-many-times-2.html#19213" class="Bound"
      >&#931;</a
      ><a name="19214"
      > </a
      ><a name="19215" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="19217"
      > </a
      ><a name="19222" href="2016-10-30-one-lambda-calculus-many-times-2.html#19222" class="Bound"
      >i</a
      ><a name="19223"
      >
           </a
      ><a name="19235" class="Comment"
      >-- x &#8712; (&#915; ++ &#928;) ++ [] ++ &#916;</a
      ><a name="19261"
      >
      </a
      ><a name="19268" class="Keyword"
      >rewrite</a
      ><a name="19275"
      > </a
      ><a name="19276" href="2016-10-30-one-lambda-calculus-many-times-2.html#2036" class="Function"
      >++-identity&#691;</a
      ><a name="19288"
      > </a
      ><a name="19289" href="2016-10-30-one-lambda-calculus-many-times-2.html#19211" class="Bound"
      >&#915;</a
      ><a name="19290"
      >
           </a
      ><a name="19302" class="Comment"
      >-- x &#8712; (&#915; ++ &#928;) ++ &#916;</a
      ><a name="19322"
      >
            </a
      ><a name="19335" class="Symbol"
      >|</a
      ><a name="19336"
      > </a
      ><a name="19337" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#811" class="Function"
      >++-assoc</a
      ><a name="19345"
      > </a
      ><a name="19346" href="2016-10-30-one-lambda-calculus-many-times-2.html#19211" class="Bound"
      >&#915;</a
      ><a name="19347"
      > </a
      ><a name="19348" href="2016-10-30-one-lambda-calculus-many-times-2.html#19213" class="Bound"
      >&#931;</a
      ><a name="19349"
      > </a
      ><a name="19350" href="2016-10-30-one-lambda-calculus-many-times-2.html#19219" class="Bound"
      >&#916;</a
      ><a name="19351"
      >
           </a
      ><a name="19363" class="Comment"
      >-- x &#8712; &#915; ++ &#928; ++ &#916;</a
      ><a name="19381"
      >
            </a
      ><a name="19394" class="Symbol"
      >=</a
      ><a name="19395"
      > </a
      ><a name="19396" href="2016-10-30-one-lambda-calculus-many-times-2.html#19222" class="Bound"
      >i</a
      ><a name="19397"
      >

    </a
      ><a name="19403" href="2016-10-30-one-lambda-calculus-many-times-2.html#19127" class="Function"
      >permute</a
      ><a name="19410"
      > </a
      ><a name="19411" href="2016-10-30-one-lambda-calculus-many-times-2.html#19411" class="Bound"
      >&#915;</a
      ><a name="19412"
      > </a
      ><a name="19413" href="2016-10-30-one-lambda-calculus-many-times-2.html#19413" class="Bound"
      >&#928;</a
      ><a name="19414"
      > </a
      ><a name="19415" class="Symbol"
      >(</a
      ><a name="19416" href="2016-10-30-one-lambda-calculus-many-times-2.html#19416" class="Bound"
      >A</a
      ><a name="19417"
      > </a
      ><a name="19418" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="19419"
      > </a
      ><a name="19420" href="2016-10-30-one-lambda-calculus-many-times-2.html#19420" class="Bound"
      >&#931;</a
      ><a name="19421" class="Symbol"
      >)</a
      ><a name="19422"
      > </a
      ><a name="19427" href="2016-10-30-one-lambda-calculus-many-times-2.html#19427" class="Bound"
      >i</a
      ><a name="19428"
      >
           </a
      ><a name="19440" class="Comment"
      >-- x &#8712; (&#915; ++ A &#8759; &#931;) ++ &#928; ++ &#916;</a
      ><a name="19469"
      >
      </a
      ><a name="19476" class="Keyword"
      >rewrite</a
      ><a name="19483"
      > </a
      ><a name="19484" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#565" class="Function"
      >sym</a
      ><a name="19487"
      > </a
      ><a name="19488" class="Symbol"
      >(</a
      ><a name="19489" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#811" class="Function"
      >++-assoc</a
      ><a name="19497"
      > </a
      ><a name="19498" href="2016-10-30-one-lambda-calculus-many-times-2.html#19411" class="Bound"
      >&#915;</a
      ><a name="19499"
      > </a
      ><a name="19500" class="Symbol"
      >(</a
      ><a name="19501" href="2016-10-30-one-lambda-calculus-many-times-2.html#19416" class="Bound"
      >A</a
      ><a name="19502"
      > </a
      ><a name="19503" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="19504"
      > </a
      ><a name="19505" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="19507" class="Symbol"
      >)</a
      ><a name="19508"
      > </a
      ><a name="19509" href="2016-10-30-one-lambda-calculus-many-times-2.html#19420" class="Bound"
      >&#931;</a
      ><a name="19510" class="Symbol"
      >)</a
      ><a name="19511"
      >
           </a
      ><a name="19523" class="Comment"
      >-- x &#8712; ((&#915; ++ A &#8759; []) ++ &#931;) ++ &#928; ++ &#916;</a
      ><a name="19560"
      >
            </a
      ><a name="19573" class="Symbol"
      >=</a
      ><a name="19574"
      > </a
      ><a name="19575" href="2016-10-30-one-lambda-calculus-many-times-2.html#19127" class="Function"
      >permute</a
      ><a name="19582"
      > </a
      ><a name="19583" class="Symbol"
      >(</a
      ><a name="19584" href="2016-10-30-one-lambda-calculus-many-times-2.html#19411" class="Bound"
      >&#915;</a
      ><a name="19585"
      > </a
      ><a name="19586" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19588"
      > </a
      ><a name="19589" href="2016-10-30-one-lambda-calculus-many-times-2.html#19416" class="Bound"
      >A</a
      ><a name="19590"
      > </a
      ><a name="19591" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="19592"
      > </a
      ><a name="19593" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="19595" class="Symbol"
      >)</a
      ><a name="19596"
      > </a
      ><a name="19597" href="2016-10-30-one-lambda-calculus-many-times-2.html#19413" class="Bound"
      >&#928;</a
      ><a name="19598"
      > </a
      ><a name="19599" href="2016-10-30-one-lambda-calculus-many-times-2.html#19420" class="Bound"
      >&#931;</a
      ><a name="19600"
      > </a
      ><a name="19601" href="2016-10-30-one-lambda-calculus-many-times-2.html#19627" class="Function"
      >j</a
      ><a name="19602"
      >
        </a
      ><a name="19611" class="Keyword"
      >where</a
      ><a name="19616"
      >
          </a
      ><a name="19627" href="2016-10-30-one-lambda-calculus-many-times-2.html#19627" class="Function"
      >j</a
      ><a name="19628"
      > </a
      ><a name="19629" class="Symbol"
      >:</a
      ><a name="19630"
      > </a
      ><a name="19631" class="Symbol"
      >_</a
      ><a name="19632"
      > </a
      ><a name="19633" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#2920" class="Function Operator"
      >&#8712;</a
      ><a name="19634"
      > </a
      ><a name="19635" class="Symbol"
      >((</a
      ><a name="19637" href="2016-10-30-one-lambda-calculus-many-times-2.html#19411" class="Bound"
      >&#915;</a
      ><a name="19638"
      > </a
      ><a name="19639" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19641"
      > </a
      ><a name="19642" href="2016-10-30-one-lambda-calculus-many-times-2.html#19416" class="Bound"
      >A</a
      ><a name="19643"
      > </a
      ><a name="19644" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="19645"
      > </a
      ><a name="19646" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="19648" class="Symbol"
      >)</a
      ><a name="19649"
      > </a
      ><a name="19650" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19652"
      > </a
      ><a name="19653" href="2016-10-30-one-lambda-calculus-many-times-2.html#19413" class="Bound"
      >&#928;</a
      ><a name="19654" class="Symbol"
      >)</a
      ><a name="19655"
      > </a
      ><a name="19656" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19658"
      > </a
      ><a name="19659" href="2016-10-30-one-lambda-calculus-many-times-2.html#19420" class="Bound"
      >&#931;</a
      ><a name="19660"
      > </a
      ><a name="19661" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19663"
      > </a
      ><a name="19664" href="2016-10-30-one-lambda-calculus-many-times-2.html#19424" class="Bound"
      >&#916;</a
      ><a name="19665"
      >
          </a
      ><a name="19676" href="2016-10-30-one-lambda-calculus-many-times-2.html#19627" class="Function"
      >j</a
      ><a name="19677"
      > </a
      ><a name="19678" class="Keyword"
      >rewrite</a
      ><a name="19685"
      > </a
      ><a name="19686" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#811" class="Function"
      >++-assoc</a
      ><a name="19694"
      > </a
      ><a name="19695" href="2016-10-30-one-lambda-calculus-many-times-2.html#19411" class="Bound"
      >&#915;</a
      ><a name="19696"
      > </a
      ><a name="19697" class="Symbol"
      >(</a
      ><a name="19698" href="2016-10-30-one-lambda-calculus-many-times-2.html#19416" class="Bound"
      >A</a
      ><a name="19699"
      > </a
      ><a name="19700" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="19701"
      > </a
      ><a name="19702" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="19704" class="Symbol"
      >)</a
      ><a name="19705"
      > </a
      ><a name="19706" href="2016-10-30-one-lambda-calculus-many-times-2.html#19413" class="Bound"
      >&#928;</a
      ><a name="19707"
      >
                 </a
      ><a name="19725" class="Comment"
      >-- x &#8712; (&#915; ++ A &#8759; &#928;) ++ &#931; ++ &#916;</a
      ><a name="19754"
      >
                  </a
      ><a name="19773" class="Symbol"
      >=</a
      ><a name="19774"
      > </a
      ><a name="19775" href="2016-10-30-one-lambda-calculus-many-times-2.html#17534" class="Function"
      >forward</a
      ><a name="19782"
      > </a
      ><a name="19783" href="2016-10-30-one-lambda-calculus-many-times-2.html#19411" class="Bound"
      >&#915;</a
      ><a name="19784"
      > </a
      ><a name="19785" href="2016-10-30-one-lambda-calculus-many-times-2.html#19413" class="Bound"
      >&#928;</a
      ><a name="19786"
      > </a
      ><a name="19787" href="2016-10-30-one-lambda-calculus-many-times-2.html#19427" class="Bound"
      >i</a
      >
</pre><!--{% endraw %}-->

In our previous version of contraction, all we had to do was merge any references to the first two formulas in our context.

<!--{% raw %}--><pre class="Agda">
    <a name="19943" href="2016-10-30-one-lambda-calculus-many-times-2.html#19943" class="Function"
      >contract</a
      ><a name="19951"
      > </a
      ><a name="19952" class="Symbol"
      >:</a
      ><a name="19953"
      > </a
      ><a name="19954" class="Symbol"
      >&#8704;</a
      ><a name="19955"
      > </a
      ><a name="19956" href="2016-10-30-one-lambda-calculus-many-times-2.html#19956" class="Bound"
      >&#915;</a
      ><a name="19957"
      > </a
      ><a name="19958" class="Symbol"
      >&#8594;</a
      ><a name="19959"
      > </a
      ><a name="19960" class="Symbol"
      >&#8704;</a
      ><a name="19961"
      > </a
      ><a name="19966" class="Symbol"
      >&#8594;</a
      ><a name="19967"
      > </a
      ><a name="19968" class="Symbol"
      >(</a
      ><a name="19969" href="2016-10-30-one-lambda-calculus-many-times-2.html#19956" class="Bound"
      >&#915;</a
      ><a name="19970"
      > </a
      ><a name="19971" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19973"
      > </a
      ><a name="19974" href="2016-10-30-one-lambda-calculus-many-times-2.html#19956" class="Bound"
      >&#915;</a
      ><a name="19975" class="Symbol"
      >)</a
      ><a name="19976"
      > </a
      ><a name="19977" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19979"
      > </a
      ><a name="19980" href="2016-10-30-one-lambda-calculus-many-times-2.html#19963" class="Bound"
      >&#916;</a
      ><a name="19981"
      > </a
      ><a name="19982" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#3056" class="Function Operator"
      >&#8838;</a
      ><a name="19983"
      > </a
      ><a name="19984" href="2016-10-30-one-lambda-calculus-many-times-2.html#19956" class="Bound"
      >&#915;</a
      ><a name="19985"
      > </a
      ><a name="19986" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19988"
      > </a
      ><a name="19989" href="2016-10-30-one-lambda-calculus-many-times-2.html#19963" class="Bound"
      >&#916;</a
      ><a name="19990"
      >
    </a
      ><a name="19995" href="2016-10-30-one-lambda-calculus-many-times-2.html#19943" class="Function"
      >contract</a
      ><a name="20003"
      > </a
      ><a name="20004" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="20006"
      >      </a
      ><a name="20016" href="2016-10-30-one-lambda-calculus-many-times-2.html#20016" class="Bound"
      >i</a
      ><a name="20017"
      > </a
      ><a name="20018" class="Symbol"
      >=</a
      ><a name="20019"
      > </a
      ><a name="20020" href="2016-10-30-one-lambda-calculus-many-times-2.html#20016" class="Bound"
      >i</a
      ><a name="20021"
      >
    </a
      ><a name="20026" href="2016-10-30-one-lambda-calculus-many-times-2.html#19943" class="Function"
      >contract</a
      ><a name="20034"
      > </a
      ><a name="20035" class="Symbol"
      >(</a
      ><a name="20036" href="2016-10-30-one-lambda-calculus-many-times-2.html#20036" class="Bound"
      >A</a
      ><a name="20037"
      > </a
      ><a name="20038" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="20039"
      > </a
      ><a name="20040" href="2016-10-30-one-lambda-calculus-many-times-2.html#20040" class="Bound"
      >&#915;</a
      ><a name="20041" class="Symbol"
      >)</a
      ><a name="20042"
      > </a
      ><a name="20047" class="Symbol"
      >(</a
      ><a name="20048" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="20052"
      > </a
      ><a name="20053" href="2016-10-30-one-lambda-calculus-many-times-2.html#20053" class="Bound"
      >px</a
      ><a name="20055" class="Symbol"
      >)</a
      ><a name="20056"
      > </a
      ><a name="20057" class="Symbol"
      >=</a
      ><a name="20058"
      > </a
      ><a name="20059" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="20063"
      > </a
      ><a name="20064" href="2016-10-30-one-lambda-calculus-many-times-2.html#20053" class="Bound"
      >px</a
      ><a name="20066"
      >
    </a
      ><a name="20071" href="2016-10-30-one-lambda-calculus-many-times-2.html#19943" class="Function"
      >contract</a
      ><a name="20079"
      > </a
      ><a name="20080" class="Symbol"
      >(</a
      ><a name="20081" href="2016-10-30-one-lambda-calculus-many-times-2.html#20081" class="Bound"
      >A</a
      ><a name="20082"
      > </a
      ><a name="20083" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="20084"
      > </a
      ><a name="20085" href="2016-10-30-one-lambda-calculus-many-times-2.html#20085" class="Bound"
      >&#915;</a
      ><a name="20086" class="Symbol"
      >)</a
      ><a name="20087"
      > </a
      ><a name="20092" class="Symbol"
      >(</a
      ><a name="20093" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="20098"
      > </a
      ><a name="20099" href="2016-10-30-one-lambda-calculus-many-times-2.html#20099" class="Bound"
      >i</a
      ><a name="20100" class="Symbol"
      >)</a
      ><a name="20101"
      >
      </a
      ><a name="20108" class="Keyword"
      >rewrite</a
      ><a name="20115"
      > </a
      ><a name="20116" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#811" class="Function"
      >++-assoc</a
      ><a name="20124"
      > </a
      ><a name="20125" href="2016-10-30-one-lambda-calculus-many-times-2.html#20085" class="Bound"
      >&#915;</a
      ><a name="20126"
      > </a
      ><a name="20127" class="Symbol"
      >(</a
      ><a name="20128" href="2016-10-30-one-lambda-calculus-many-times-2.html#20081" class="Bound"
      >A</a
      ><a name="20129"
      > </a
      ><a name="20130" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="20131"
      > </a
      ><a name="20132" href="2016-10-30-one-lambda-calculus-many-times-2.html#20085" class="Bound"
      >&#915;</a
      ><a name="20133" class="Symbol"
      >)</a
      ><a name="20134"
      > </a
      ><a name="20135" href="2016-10-30-one-lambda-calculus-many-times-2.html#20089" class="Bound"
      >&#916;</a
      ><a name="20136"
      > </a
      ><a name="20137" class="Keyword"
      >with</a
      ><a name="20141"
      > </a
      ><a name="20142" href="2016-10-30-one-lambda-calculus-many-times-2.html#17534" class="Function"
      >forward</a
      ><a name="20149"
      > </a
      ><a name="20150" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="20152"
      > </a
      ><a name="20153" href="2016-10-30-one-lambda-calculus-many-times-2.html#20085" class="Bound"
      >&#915;</a
      ><a name="20154"
      > </a
      ><a name="20155" href="2016-10-30-one-lambda-calculus-many-times-2.html#20099" class="Bound"
      >i</a
      ><a name="20156"
      >
    </a
      ><a name="20161" href="2016-10-30-one-lambda-calculus-many-times-2.html#19943" class="Function"
      >contract</a
      ><a name="20169"
      > </a
      ><a name="20170" class="Symbol"
      >(</a
      ><a name="20171" href="2016-10-30-one-lambda-calculus-many-times-2.html#20171" class="Bound"
      >A</a
      ><a name="20172"
      > </a
      ><a name="20173" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="20174"
      > </a
      ><a name="20175" href="2016-10-30-one-lambda-calculus-many-times-2.html#20175" class="Bound"
      >&#915;</a
      ><a name="20176" class="Symbol"
      >)</a
      ><a name="20177"
      > </a
      ><a name="20182" class="Symbol"
      >(</a
      ><a name="20183" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="20188"
      > </a
      ><a name="20189" href="2016-10-30-one-lambda-calculus-many-times-2.html#20189" class="Bound"
      >i</a
      ><a name="20190" class="Symbol"
      >)</a
      ><a name="20191"
      > </a
      ><a name="20192" class="Symbol"
      >|</a
      ><a name="20193"
      > </a
      ><a name="20194" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="20198"
      > </a
      ><a name="20199" href="2016-10-30-one-lambda-calculus-many-times-2.html#20199" class="Bound"
      >px</a
      ><a name="20201"
      > </a
      ><a name="20202" class="Symbol"
      >=</a
      ><a name="20203"
      > </a
      ><a name="20204" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="20208"
      > </a
      ><a name="20209" href="2016-10-30-one-lambda-calculus-many-times-2.html#20199" class="Bound"
      >px</a
      ><a name="20211"
      >
    </a
      ><a name="20216" href="2016-10-30-one-lambda-calculus-many-times-2.html#19943" class="Function"
      >contract</a
      ><a name="20224"
      > </a
      ><a name="20225" class="Symbol"
      >(</a
      ><a name="20226" href="2016-10-30-one-lambda-calculus-many-times-2.html#20226" class="Bound"
      >A</a
      ><a name="20227"
      > </a
      ><a name="20228" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="20229"
      > </a
      ><a name="20230" href="2016-10-30-one-lambda-calculus-many-times-2.html#20230" class="Bound"
      >&#915;</a
      ><a name="20231" class="Symbol"
      >)</a
      ><a name="20232"
      > </a
      ><a name="20237" class="Symbol"
      >(</a
      ><a name="20238" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="20243"
      > </a
      ><a name="20244" href="2016-10-30-one-lambda-calculus-many-times-2.html#20244" class="Bound"
      >i</a
      ><a name="20245" class="Symbol"
      >)</a
      ><a name="20246"
      > </a
      ><a name="20247" class="Symbol"
      >|</a
      ><a name="20248"
      > </a
      ><a name="20249" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="20254"
      > </a
      ><a name="20255" href="2016-10-30-one-lambda-calculus-many-times-2.html#20255" class="Bound"
      >j</a
      ><a name="20256"
      >
      </a
      ><a name="20263" class="Keyword"
      >rewrite</a
      ><a name="20270"
      > </a
      ><a name="20271" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#565" class="Function"
      >sym</a
      ><a name="20274"
      > </a
      ><a name="20275" class="Symbol"
      >(</a
      ><a name="20276" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#811" class="Function"
      >++-assoc</a
      ><a name="20284"
      > </a
      ><a name="20285" href="2016-10-30-one-lambda-calculus-many-times-2.html#20230" class="Bound"
      >&#915;</a
      ><a name="20286"
      > </a
      ><a name="20287" href="2016-10-30-one-lambda-calculus-many-times-2.html#20230" class="Bound"
      >&#915;</a
      ><a name="20288"
      > </a
      ><a name="20289" href="2016-10-30-one-lambda-calculus-many-times-2.html#20234" class="Bound"
      >&#916;</a
      ><a name="20290" class="Symbol"
      >)</a
      ><a name="20291"
      > </a
      ><a name="20292" class="Symbol"
      >=</a
      ><a name="20293"
      > </a
      ><a name="20294" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="20299"
      > </a
      ><a name="20300" class="Symbol"
      >(</a
      ><a name="20301" href="2016-10-30-one-lambda-calculus-many-times-2.html#19943" class="Function"
      >contract</a
      ><a name="20309"
      > </a
      ><a name="20310" href="2016-10-30-one-lambda-calculus-many-times-2.html#20230" class="Bound"
      >&#915;</a
      ><a name="20311"
      > </a
      ><a name="20312" href="2016-10-30-one-lambda-calculus-many-times-2.html#20255" class="Bound"
      >j</a
      ><a name="20313" class="Symbol"
      >)</a
      >
</pre><!--{% endraw %}-->

Boop.

<!--{% raw %}--><pre class="Agda">
    <a name="20351" href="2016-10-30-one-lambda-calculus-many-times-2.html#20351" class="Function"
      >w&#8314;&#8242;</a
      ><a name="20354"
      > </a
      ><a name="20355" class="Symbol"
      >:</a
      ><a name="20356"
      > </a
      ><a name="20357" class="Symbol"
      >&#8704;</a
      ><a name="20358"
      > </a
      ><a name="20363" class="Symbol"
      >&#8594;</a
      ><a name="20364"
      > </a
      ><a name="20365" class="Symbol"
      >&#8704;</a
      ><a name="20366"
      > </a
      ><a name="20367" href="2016-10-30-one-lambda-calculus-many-times-2.html#20367" class="Bound"
      >&#915;</a
      ><a name="20368"
      > </a
      ><a name="20369" class="Symbol"
      >&#8594;</a
      ><a name="20370"
      > </a
      ><a name="20371" class="Symbol"
      >&#8704;</a
      ><a name="20372"
      > </a
      ><a name="20377" class="Symbol"
      >&#8594;</a
      ><a name="20378"
      > </a
      ><a name="20379" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="20381"
      > </a
      ><a name="20382" href="2016-10-30-one-lambda-calculus-many-times-2.html#20374" class="Bound"
      >&#916;</a
      ><a name="20383"
      > </a
      ><a name="20384" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="20385"
      > </a
      ><a name="20386" href="2016-10-30-one-lambda-calculus-many-times-2.html#20360" class="Bound"
      >A</a
      ><a name="20387"
      > </a
      ><a name="20388" class="Symbol"
      >&#8594;</a
      ><a name="20389"
      > </a
      ><a name="20390" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="20392"
      > </a
      ><a name="20393" href="2016-10-30-one-lambda-calculus-many-times-2.html#20367" class="Bound"
      >&#915;</a
      ><a name="20394"
      > </a
      ><a name="20395" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20397"
      > </a
      ><a name="20398" href="2016-10-30-one-lambda-calculus-many-times-2.html#20374" class="Bound"
      >&#916;</a
      ><a name="20399"
      > </a
      ><a name="20400" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="20401"
      > </a
      ><a name="20402" href="2016-10-30-one-lambda-calculus-many-times-2.html#20360" class="Bound"
      >A</a
      ><a name="20403"
      >
    </a
      ><a name="20408" href="2016-10-30-one-lambda-calculus-many-times-2.html#20351" class="Function"
      >w&#8314;&#8242;</a
      ><a name="20411"
      > </a
      ><a name="20412" href="2016-10-30-one-lambda-calculus-many-times-2.html#20412" class="Bound"
      >&#915;</a
      ><a name="20413"
      > </a
      ><a name="20414" class="Symbol"
      >=</a
      ><a name="20415"
      > </a
      ><a name="20416" href="2016-03-20-one-lambda-calculus-many-times.html#7307" class="Function"
      >struct</a
      ><a name="20422"
      > </a
      ><a name="20423" class="Symbol"
      >(</a
      ><a name="20424" href="2016-10-30-one-lambda-calculus-many-times-2.html#16386" class="Function"
      >weaken</a
      ><a name="20430"
      > </a
      ><a name="20431" href="2016-10-30-one-lambda-calculus-many-times-2.html#20412" class="Bound"
      >&#915;</a
      ><a name="20432" class="Symbol"
      >)</a
      ><a name="20433"
      >

    </a
      ><a name="20439" href="2016-10-30-one-lambda-calculus-many-times-2.html#20439" class="Function"
      >c&#8314;&#8242;</a
      ><a name="20442"
      > </a
      ><a name="20443" class="Symbol"
      >:</a
      ><a name="20444"
      > </a
      ><a name="20445" class="Symbol"
      >&#8704;</a
      ><a name="20446"
      > </a
      ><a name="20451" class="Symbol"
      >&#8594;</a
      ><a name="20452"
      > </a
      ><a name="20453" class="Symbol"
      >&#8704;</a
      ><a name="20454"
      > </a
      ><a name="20455" href="2016-10-30-one-lambda-calculus-many-times-2.html#20455" class="Bound"
      >&#915;</a
      ><a name="20456"
      > </a
      ><a name="20457" class="Symbol"
      >&#8594;</a
      ><a name="20458"
      > </a
      ><a name="20459" class="Symbol"
      >&#8704;</a
      ><a name="20460"
      > </a
      ><a name="20465" class="Symbol"
      >&#8594;</a
      ><a name="20466"
      > </a
      ><a name="20467" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="20469"
      > </a
      ><a name="20470" class="Symbol"
      >(</a
      ><a name="20471" href="2016-10-30-one-lambda-calculus-many-times-2.html#20455" class="Bound"
      >&#915;</a
      ><a name="20472"
      > </a
      ><a name="20473" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20475"
      > </a
      ><a name="20476" href="2016-10-30-one-lambda-calculus-many-times-2.html#20455" class="Bound"
      >&#915;</a
      ><a name="20477" class="Symbol"
      >)</a
      ><a name="20478"
      > </a
      ><a name="20479" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20481"
      > </a
      ><a name="20482" href="2016-10-30-one-lambda-calculus-many-times-2.html#20462" class="Bound"
      >&#916;</a
      ><a name="20483"
      > </a
      ><a name="20484" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="20485"
      > </a
      ><a name="20486" href="2016-10-30-one-lambda-calculus-many-times-2.html#20448" class="Bound"
      >A</a
      ><a name="20487"
      > </a
      ><a name="20488" class="Symbol"
      >&#8594;</a
      ><a name="20489"
      > </a
      ><a name="20490" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="20492"
      > </a
      ><a name="20493" href="2016-10-30-one-lambda-calculus-many-times-2.html#20455" class="Bound"
      >&#915;</a
      ><a name="20494"
      > </a
      ><a name="20495" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20497"
      > </a
      ><a name="20498" href="2016-10-30-one-lambda-calculus-many-times-2.html#20462" class="Bound"
      >&#916;</a
      ><a name="20499"
      > </a
      ><a name="20500" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="20501"
      > </a
      ><a name="20502" href="2016-10-30-one-lambda-calculus-many-times-2.html#20448" class="Bound"
      >A</a
      ><a name="20503"
      >
    </a
      ><a name="20508" href="2016-10-30-one-lambda-calculus-many-times-2.html#20439" class="Function"
      >c&#8314;&#8242;</a
      ><a name="20511"
      > </a
      ><a name="20512" href="2016-10-30-one-lambda-calculus-many-times-2.html#20512" class="Bound"
      >&#915;</a
      ><a name="20513"
      > </a
      ><a name="20514" class="Symbol"
      >=</a
      ><a name="20515"
      > </a
      ><a name="20516" href="2016-03-20-one-lambda-calculus-many-times.html#7307" class="Function"
      >struct</a
      ><a name="20522"
      > </a
      ><a name="20523" class="Symbol"
      >(</a
      ><a name="20524" href="2016-10-30-one-lambda-calculus-many-times-2.html#19943" class="Function"
      >contract</a
      ><a name="20532"
      > </a
      ><a name="20533" href="2016-10-30-one-lambda-calculus-many-times-2.html#20512" class="Bound"
      >&#915;</a
      ><a name="20534" class="Symbol"
      >)</a
      ><a name="20535"
      >

    </a
      ><a name="20541" href="2016-10-30-one-lambda-calculus-many-times-2.html#20541" class="Function"
      >p&#8314;&#8242;</a
      ><a name="20544"
      > </a
      ><a name="20545" class="Symbol"
      >:</a
      ><a name="20546"
      > </a
      ><a name="20547" class="Symbol"
      >&#8704;</a
      ><a name="20548"
      > </a
      ><a name="20553" class="Symbol"
      >&#8594;</a
      ><a name="20554"
      > </a
      ><a name="20555" class="Symbol"
      >&#8704;</a
      ><a name="20556"
      > </a
      ><a name="20557" href="2016-10-30-one-lambda-calculus-many-times-2.html#20557" class="Bound"
      >&#915;</a
      ><a name="20558"
      > </a
      ><a name="20559" href="2016-10-30-one-lambda-calculus-many-times-2.html#20559" class="Bound"
      >&#931;</a
      ><a name="20560"
      > </a
      ><a name="20561" href="2016-10-30-one-lambda-calculus-many-times-2.html#20561" class="Bound"
      >&#928;</a
      ><a name="20562"
      > </a
      ><a name="20563" class="Symbol"
      >&#8594;</a
      ><a name="20564"
      > </a
      ><a name="20565" class="Symbol"
      >&#8704;</a
      ><a name="20566"
      > </a
      ><a name="20571" class="Symbol"
      >&#8594;</a
      ><a name="20572"
      > </a
      ><a name="20573" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="20575"
      > </a
      ><a name="20576" class="Symbol"
      >(</a
      ><a name="20577" href="2016-10-30-one-lambda-calculus-many-times-2.html#20557" class="Bound"
      >&#915;</a
      ><a name="20578"
      > </a
      ><a name="20579" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20581"
      > </a
      ><a name="20582" href="2016-10-30-one-lambda-calculus-many-times-2.html#20559" class="Bound"
      >&#931;</a
      ><a name="20583" class="Symbol"
      >)</a
      ><a name="20584"
      > </a
      ><a name="20585" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20587"
      > </a
      ><a name="20588" class="Symbol"
      >(</a
      ><a name="20589" href="2016-10-30-one-lambda-calculus-many-times-2.html#20561" class="Bound"
      >&#928;</a
      ><a name="20590"
      > </a
      ><a name="20591" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20593"
      > </a
      ><a name="20594" href="2016-10-30-one-lambda-calculus-many-times-2.html#20568" class="Bound"
      >&#916;</a
      ><a name="20595" class="Symbol"
      >)</a
      ><a name="20596"
      > </a
      ><a name="20597" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="20598"
      > </a
      ><a name="20599" href="2016-10-30-one-lambda-calculus-many-times-2.html#20550" class="Bound"
      >A</a
      ><a name="20600"
      >
                 </a
      ><a name="20618" class="Symbol"
      >&#8594;</a
      ><a name="20619"
      > </a
      ><a name="20620" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="20622"
      > </a
      ><a name="20623" class="Symbol"
      >(</a
      ><a name="20624" href="2016-10-30-one-lambda-calculus-many-times-2.html#20557" class="Bound"
      >&#915;</a
      ><a name="20625"
      > </a
      ><a name="20626" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20628"
      > </a
      ><a name="20629" href="2016-10-30-one-lambda-calculus-many-times-2.html#20561" class="Bound"
      >&#928;</a
      ><a name="20630" class="Symbol"
      >)</a
      ><a name="20631"
      > </a
      ><a name="20632" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20634"
      > </a
      ><a name="20635" class="Symbol"
      >(</a
      ><a name="20636" href="2016-10-30-one-lambda-calculus-many-times-2.html#20559" class="Bound"
      >&#931;</a
      ><a name="20637"
      > </a
      ><a name="20638" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20640"
      > </a
      ><a name="20641" href="2016-10-30-one-lambda-calculus-many-times-2.html#20568" class="Bound"
      >&#916;</a
      ><a name="20642" class="Symbol"
      >)</a
      ><a name="20643"
      > </a
      ><a name="20644" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="20645"
      > </a
      ><a name="20646" href="2016-10-30-one-lambda-calculus-many-times-2.html#20550" class="Bound"
      >A</a
      ><a name="20647"
      >
    </a
      ><a name="20652" href="2016-10-30-one-lambda-calculus-many-times-2.html#20541" class="Function"
      >p&#8314;&#8242;</a
      ><a name="20655"
      > </a
      ><a name="20656" href="2016-10-30-one-lambda-calculus-many-times-2.html#20656" class="Bound"
      >&#915;</a
      ><a name="20657"
      > </a
      ><a name="20658" href="2016-10-30-one-lambda-calculus-many-times-2.html#20658" class="Bound"
      >&#931;</a
      ><a name="20659"
      > </a
      ><a name="20660" href="2016-10-30-one-lambda-calculus-many-times-2.html#20660" class="Bound"
      >&#928;</a
      ><a name="20661"
      > </a
      ><a name="20662" class="Symbol"
      >=</a
      ><a name="20663"
      > </a
      ><a name="20664" href="2016-03-20-one-lambda-calculus-many-times.html#7307" class="Function"
      >struct</a
      ><a name="20670"
      > </a
      ><a name="20671" class="Symbol"
      >(</a
      ><a name="20672" href="2016-10-30-one-lambda-calculus-many-times-2.html#19127" class="Function"
      >permute</a
      ><a name="20679"
      > </a
      ><a name="20680" href="2016-10-30-one-lambda-calculus-many-times-2.html#20656" class="Bound"
      >&#915;</a
      ><a name="20681"
      > </a
      ><a name="20682" href="2016-10-30-one-lambda-calculus-many-times-2.html#20658" class="Bound"
      >&#931;</a
      ><a name="20683"
      > </a
      ><a name="20684" href="2016-10-30-one-lambda-calculus-many-times-2.html#20660" class="Bound"
      >&#928;</a
      ><a name="20685" class="Symbol"
      >)</a
      >
</pre><!--{% endraw %}-->

Boop.

<div class="foldable">
<!--{% raw %}--><pre class="Agda">
    <a name="20746" href="2016-10-30-one-lambda-calculus-many-times-2.html#20746" class="Function"
      >s&#8314;&#8242;</a
      ><a name="20749"
      > </a
      ><a name="20750" class="Symbol"
      >:</a
      ><a name="20751"
      > </a
      ><a name="20752" class="Symbol"
      >&#8704;</a
      ><a name="20753"
      > </a
      ><a name="20758" class="Symbol"
      >&#8594;</a
      ><a name="20759"
      > </a
      ><a name="20760" class="Symbol"
      >&#8704;</a
      ><a name="20761"
      > </a
      ><a name="20762" href="2016-10-30-one-lambda-calculus-many-times-2.html#20762" class="Bound"
      >&#915;</a
      ><a name="20763"
      > </a
      ><a name="20764" href="2016-10-30-one-lambda-calculus-many-times-2.html#20764" class="Bound"
      >&#931;</a
      ><a name="20765"
      > </a
      ><a name="20766" class="Symbol"
      >&#8594;</a
      ><a name="20767"
      > </a
      ><a name="20768" class="Symbol"
      >&#8704;</a
      ><a name="20769"
      > </a
      ><a name="20774" class="Symbol"
      >&#8594;</a
      ><a name="20775"
      > </a
      ><a name="20776" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="20778"
      > </a
      ><a name="20779" class="Symbol"
      >(</a
      ><a name="20780" href="2016-10-30-one-lambda-calculus-many-times-2.html#20762" class="Bound"
      >&#915;</a
      ><a name="20781"
      > </a
      ><a name="20782" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20784"
      > </a
      ><a name="20785" href="2016-10-30-one-lambda-calculus-many-times-2.html#20764" class="Bound"
      >&#931;</a
      ><a name="20786" class="Symbol"
      >)</a
      ><a name="20787"
      > </a
      ><a name="20788" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20790"
      > </a
      ><a name="20791" href="2016-10-30-one-lambda-calculus-many-times-2.html#20771" class="Bound"
      >&#928;</a
      ><a name="20792"
      > </a
      ><a name="20793" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="20794"
      > </a
      ><a name="20795" href="2016-10-30-one-lambda-calculus-many-times-2.html#20755" class="Bound"
      >A</a
      ><a name="20796"
      >
                </a
      ><a name="20813" class="Symbol"
      >&#8594;</a
      ><a name="20814"
      > </a
      ><a name="20815" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="20817"
      > </a
      ><a name="20818" class="Symbol"
      >(</a
      ><a name="20819" href="2016-10-30-one-lambda-calculus-many-times-2.html#20762" class="Bound"
      >&#915;</a
      ><a name="20820"
      > </a
      ><a name="20821" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20823"
      > </a
      ><a name="20824" href="2016-10-30-one-lambda-calculus-many-times-2.html#20771" class="Bound"
      >&#928;</a
      ><a name="20825" class="Symbol"
      >)</a
      ><a name="20826"
      > </a
      ><a name="20827" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20829"
      > </a
      ><a name="20830" href="2016-10-30-one-lambda-calculus-many-times-2.html#20764" class="Bound"
      >&#931;</a
      ><a name="20831"
      > </a
      ><a name="20832" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="20833"
      > </a
      ><a name="20834" href="2016-10-30-one-lambda-calculus-many-times-2.html#20755" class="Bound"
      >A</a
      ><a name="20835"
      >
    </a
      ><a name="20840" href="2016-10-30-one-lambda-calculus-many-times-2.html#20746" class="Function"
      >s&#8314;&#8242;</a
      ><a name="20843"
      > </a
      ><a name="20848" href="2016-10-30-one-lambda-calculus-many-times-2.html#20848" class="Bound"
      >&#915;</a
      ><a name="20849"
      > </a
      ><a name="20850" href="2016-10-30-one-lambda-calculus-many-times-2.html#20850" class="Bound"
      >&#931;</a
      ><a name="20851"
      > </a
      ><a name="20856" href="2016-10-30-one-lambda-calculus-many-times-2.html#20856" class="Bound"
      >f</a
      ><a name="20857"
      >
      </a
      ><a name="20864" class="Symbol"
      >=</a
      ><a name="20865"
      > </a
      ><a name="20866" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#705" class="Function"
      >subst</a
      ><a name="20871"
      > </a
      ><a name="20872" class="Symbol"
      >(&#955;</a
      ><a name="20874"
      > </a
      ><a name="20875" href="2016-10-30-one-lambda-calculus-many-times-2.html#20875" class="Bound"
      >&#931;</a
      ><a name="20876"
      > </a
      ><a name="20877" class="Symbol"
      >&#8594;</a
      ><a name="20878"
      > </a
      ><a name="20879" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="20881"
      > </a
      ><a name="20882" class="Symbol"
      >(</a
      ><a name="20883" href="2016-10-30-one-lambda-calculus-many-times-2.html#20848" class="Bound"
      >&#915;</a
      ><a name="20884"
      > </a
      ><a name="20885" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20887"
      > </a
      ><a name="20888" href="2016-10-30-one-lambda-calculus-many-times-2.html#20853" class="Bound"
      >&#928;</a
      ><a name="20889" class="Symbol"
      >)</a
      ><a name="20890"
      > </a
      ><a name="20891" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20893"
      > </a
      ><a name="20894" href="2016-10-30-one-lambda-calculus-many-times-2.html#20875" class="Bound"
      >&#931;</a
      ><a name="20895"
      > </a
      ><a name="20896" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="20897"
      > </a
      ><a name="20898" href="2016-10-30-one-lambda-calculus-many-times-2.html#20845" class="Bound"
      >A</a
      ><a name="20899" class="Symbol"
      >)</a
      ><a name="20900"
      >      </a
      ><a name="20906" class="Symbol"
      >(</a
      ><a name="20907" href="2016-10-30-one-lambda-calculus-many-times-2.html#2036" class="Function"
      >++-identity&#691;</a
      ><a name="20919"
      > </a
      ><a name="20920" href="2016-10-30-one-lambda-calculus-many-times-2.html#20850" class="Bound"
      >&#931;</a
      ><a name="20921" class="Symbol"
      >)</a
      ><a name="20922"
      >
      </a
      ><a name="20929" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="20930"
      > </a
      ><a name="20931" href="2016-10-30-one-lambda-calculus-many-times-2.html#20541" class="Function"
      >p&#8314;&#8242;</a
      ><a name="20934"
      > </a
      ><a name="20935" href="2016-10-30-one-lambda-calculus-many-times-2.html#20848" class="Bound"
      >&#915;</a
      ><a name="20936"
      > </a
      ><a name="20937" href="2016-10-30-one-lambda-calculus-many-times-2.html#20850" class="Bound"
      >&#931;</a
      ><a name="20938"
      > </a
      ><a name="20939" href="2016-10-30-one-lambda-calculus-many-times-2.html#20853" class="Bound"
      >&#928;</a
      ><a name="20940"
      >
      </a
      ><a name="20947" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="20948"
      > </a
      ><a name="20949" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#705" class="Function"
      >subst</a
      ><a name="20954"
      > </a
      ><a name="20955" class="Symbol"
      >(&#955;</a
      ><a name="20957"
      > </a
      ><a name="20958" href="2016-10-30-one-lambda-calculus-many-times-2.html#20958" class="Bound"
      >&#928;</a
      ><a name="20959"
      > </a
      ><a name="20960" class="Symbol"
      >&#8594;</a
      ><a name="20961"
      > </a
      ><a name="20962" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="20964"
      > </a
      ><a name="20965" class="Symbol"
      >(</a
      ><a name="20966" href="2016-10-30-one-lambda-calculus-many-times-2.html#20848" class="Bound"
      >&#915;</a
      ><a name="20967"
      > </a
      ><a name="20968" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20970"
      > </a
      ><a name="20971" href="2016-10-30-one-lambda-calculus-many-times-2.html#20850" class="Bound"
      >&#931;</a
      ><a name="20972" class="Symbol"
      >)</a
      ><a name="20973"
      > </a
      ><a name="20974" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20976"
      > </a
      ><a name="20977" href="2016-10-30-one-lambda-calculus-many-times-2.html#20958" class="Bound"
      >&#928;</a
      ><a name="20978"
      > </a
      ><a name="20979" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="20980"
      > </a
      ><a name="20981" href="2016-10-30-one-lambda-calculus-many-times-2.html#20845" class="Bound"
      >A</a
      ><a name="20982" class="Symbol"
      >)</a
      ><a name="20983"
      > </a
      ><a name="20984" class="Symbol"
      >(</a
      ><a name="20985" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#565" class="Function"
      >sym</a
      ><a name="20988"
      > </a
      ><a name="20989" class="Symbol"
      >(</a
      ><a name="20990" href="2016-10-30-one-lambda-calculus-many-times-2.html#2036" class="Function"
      >++-identity&#691;</a
      ><a name="21002"
      > </a
      ><a name="21003" href="2016-10-30-one-lambda-calculus-many-times-2.html#20853" class="Bound"
      >&#928;</a
      ><a name="21004" class="Symbol"
      >))</a
      ><a name="21006"
      >
      </a
      ><a name="21013" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="21014"
      > </a
      ><a name="21015" href="2016-10-30-one-lambda-calculus-many-times-2.html#20856" class="Bound"
      >f</a
      >
</pre><!--{% endraw %}-->
</div>



### Deriving Structural Rules in NJ

<div class="hidden">
<!--{% raw %}--><pre class="Agda">
  <a name="21111" class="Keyword"
      >module</a
      ><a name="21117"
      > </a
      ><a name="21118" href="2016-10-30-one-lambda-calculus-many-times-2.html#21118" class="Module"
      >NJ</a
      ><a name="21120"
      > </a
      ><a name="21121" class="Keyword"
      >where</a
      >
</pre><!--{% endraw %}-->
</div>

We can derive these same extended structural rules in NJ. For instance, below we derive the equivalent weakening rule:

<!--{% raw %}--><pre class="Agda">
    <a name="21283" href="2016-10-30-one-lambda-calculus-many-times-2.html#21283" class="Function"
      >w&#8314;&#8242;</a
      ><a name="21286"
      > </a
      ><a name="21287" class="Symbol"
      >:</a
      ><a name="21288"
      > </a
      ><a name="21289" class="Symbol"
      >&#8704;</a
      ><a name="21290"
      > </a
      ><a name="21295" class="Symbol"
      >&#8594;</a
      ><a name="21296"
      > </a
      ><a name="21297" class="Symbol"
      >&#8704;</a
      ><a name="21298"
      > </a
      ><a name="21299" href="2016-10-30-one-lambda-calculus-many-times-2.html#21299" class="Bound"
      >&#915;</a
      ><a name="21300"
      > </a
      ><a name="21301" class="Symbol"
      >&#8594;</a
      ><a name="21302"
      > </a
      ><a name="21303" class="Symbol"
      >&#8704;</a
      ><a name="21304"
      > </a
      ><a name="21309" class="Symbol"
      >&#8594;</a
      ><a name="21310"
      > </a
      ><a name="21311" href="2016-10-30-one-lambda-calculus-many-times-2.html#6868" class="Datatype Operator"
      >NJ</a
      ><a name="21313"
      > </a
      ><a name="21314" href="2016-10-30-one-lambda-calculus-many-times-2.html#21306" class="Bound"
      >&#916;</a
      ><a name="21315"
      > </a
      ><a name="21316" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="21317"
      > </a
      ><a name="21318" href="2016-10-30-one-lambda-calculus-many-times-2.html#21292" class="Bound"
      >A</a
      ><a name="21319"
      > </a
      ><a name="21320" class="Symbol"
      >&#8594;</a
      ><a name="21321"
      > </a
      ><a name="21322" href="2016-10-30-one-lambda-calculus-many-times-2.html#6868" class="Datatype Operator"
      >NJ</a
      ><a name="21324"
      > </a
      ><a name="21325" href="2016-10-30-one-lambda-calculus-many-times-2.html#21299" class="Bound"
      >&#915;</a
      ><a name="21326"
      > </a
      ><a name="21327" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="21329"
      > </a
      ><a name="21330" href="2016-10-30-one-lambda-calculus-many-times-2.html#21306" class="Bound"
      >&#916;</a
      ><a name="21331"
      > </a
      ><a name="21332" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="21333"
      > </a
      ><a name="21334" href="2016-10-30-one-lambda-calculus-many-times-2.html#21292" class="Bound"
      >A</a
      ><a name="21335"
      >
    </a
      ><a name="21340" href="2016-10-30-one-lambda-calculus-many-times-2.html#21283" class="Function"
      >w&#8314;&#8242;</a
      ><a name="21343"
      > </a
      ><a name="21344" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="21346"
      >      </a
      ><a name="21352" href="2016-10-30-one-lambda-calculus-many-times-2.html#21352" class="Bound"
      >f</a
      ><a name="21353"
      > </a
      ><a name="21354" class="Symbol"
      >=</a
      ><a name="21355"
      > </a
      ><a name="21356" href="2016-10-30-one-lambda-calculus-many-times-2.html#21352" class="Bound"
      >f</a
      ><a name="21357"
      >
    </a
      ><a name="21362" href="2016-10-30-one-lambda-calculus-many-times-2.html#21283" class="Function"
      >w&#8314;&#8242;</a
      ><a name="21365"
      > </a
      ><a name="21366" class="Symbol"
      >(</a
      ><a name="21367" href="2016-10-30-one-lambda-calculus-many-times-2.html#21367" class="Bound"
      >B</a
      ><a name="21368"
      > </a
      ><a name="21369" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="21370"
      > </a
      ><a name="21371" href="2016-10-30-one-lambda-calculus-many-times-2.html#21371" class="Bound"
      >&#915;</a
      ><a name="21372" class="Symbol"
      >)</a
      ><a name="21373"
      > </a
      ><a name="21374" href="2016-10-30-one-lambda-calculus-many-times-2.html#21374" class="Bound"
      >f</a
      ><a name="21375"
      > </a
      ><a name="21376" class="Symbol"
      >=</a
      ><a name="21377"
      > </a
      ><a name="21378" href="2016-10-30-one-lambda-calculus-many-times-2.html#7055" class="InductiveConstructor"
      >w</a
      ><a name="21379"
      > </a
      ><a name="21380" class="Symbol"
      >(</a
      ><a name="21381" href="2016-10-30-one-lambda-calculus-many-times-2.html#21283" class="Function"
      >w&#8314;&#8242;</a
      ><a name="21384"
      > </a
      ><a name="21385" href="2016-10-30-one-lambda-calculus-many-times-2.html#21371" class="Bound"
      >&#915;</a
      ><a name="21386"
      > </a
      ><a name="21387" href="2016-10-30-one-lambda-calculus-many-times-2.html#21374" class="Bound"
      >f</a
      ><a name="21388" class="Symbol"
      >)</a
      >
</pre><!--{% endraw %}-->

The remainder of the proofs are rather similar to those for ND,

<div class="foldable">
<!--{% raw %}--><pre class="Agda">
    <a name="21507" href="2016-10-30-one-lambda-calculus-many-times-2.html#21507" class="Function"
      >f&#8314;&#8242;</a
      ><a name="21510"
      > </a
      ><a name="21511" class="Symbol"
      >:</a
      ><a name="21512"
      > </a
      ><a name="21513" class="Symbol"
      >&#8704;</a
      ><a name="21514"
      > </a
      ><a name="21521" class="Symbol"
      >&#8594;</a
      ><a name="21522"
      > </a
      ><a name="21523" class="Symbol"
      >&#8704;</a
      ><a name="21524"
      > </a
      ><a name="21525" href="2016-10-30-one-lambda-calculus-many-times-2.html#21525" class="Bound"
      >&#915;</a
      ><a name="21526"
      > </a
      ><a name="21527" href="2016-10-30-one-lambda-calculus-many-times-2.html#21527" class="Bound"
      >&#931;</a
      ><a name="21528"
      > </a
      ><a name="21529" class="Symbol"
      >&#8594;</a
      ><a name="21530"
      > </a
      ><a name="21531" class="Symbol"
      >&#8704;</a
      ><a name="21532"
      > </a
      ><a name="21537" class="Symbol"
      >&#8594;</a
      ><a name="21538"
      > </a
      ><a name="21539" href="2016-10-30-one-lambda-calculus-many-times-2.html#6868" class="Datatype Operator"
      >NJ</a
      ><a name="21541"
      > </a
      ><a name="21542" class="Symbol"
      >(</a
      ><a name="21543" href="2016-10-30-one-lambda-calculus-many-times-2.html#21525" class="Bound"
      >&#915;</a
      ><a name="21544"
      > </a
      ><a name="21545" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="21547"
      > </a
      ><a name="21548" href="2016-10-30-one-lambda-calculus-many-times-2.html#21527" class="Bound"
      >&#931;</a
      ><a name="21549" class="Symbol"
      >)</a
      ><a name="21550"
      > </a
      ><a name="21551" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="21553"
      > </a
      ><a name="21554" class="Symbol"
      >(</a
      ><a name="21555" href="2016-10-30-one-lambda-calculus-many-times-2.html#21516" class="Bound"
      >A</a
      ><a name="21556"
      > </a
      ><a name="21557" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="21558"
      > </a
      ><a name="21559" href="2016-10-30-one-lambda-calculus-many-times-2.html#21534" class="Bound"
      >&#916;</a
      ><a name="21560" class="Symbol"
      >)</a
      ><a name="21561"
      > </a
      ><a name="21562" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="21563"
      > </a
      ><a name="21564" href="2016-10-30-one-lambda-calculus-many-times-2.html#21518" class="Bound"
      >B</a
      ><a name="21565"
      >
                </a
      ><a name="21582" class="Symbol"
      >&#8594;</a
      ><a name="21583"
      > </a
      ><a name="21584" href="2016-10-30-one-lambda-calculus-many-times-2.html#6868" class="Datatype Operator"
      >NJ</a
      ><a name="21586"
      > </a
      ><a name="21587" class="Symbol"
      >(</a
      ><a name="21588" href="2016-10-30-one-lambda-calculus-many-times-2.html#21525" class="Bound"
      >&#915;</a
      ><a name="21589"
      > </a
      ><a name="21590" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="21592"
      > </a
      ><a name="21593" href="2016-10-30-one-lambda-calculus-many-times-2.html#21516" class="Bound"
      >A</a
      ><a name="21594"
      > </a
      ><a name="21595" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="21596"
      > </a
      ><a name="21597" href="2016-10-30-one-lambda-calculus-many-times-2.html#21527" class="Bound"
      >&#931;</a
      ><a name="21598" class="Symbol"
      >)</a
      ><a name="21599"
      > </a
      ><a name="21600" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="21602"
      > </a
      ><a name="21603" href="2016-10-30-one-lambda-calculus-many-times-2.html#21534" class="Bound"
      >&#916;</a
      ><a name="21604"
      > </a
      ><a name="21605" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="21606"
      > </a
      ><a name="21607" href="2016-10-30-one-lambda-calculus-many-times-2.html#21518" class="Bound"
      >B</a
      ><a name="21608"
      >
    </a
      ><a name="21613" href="2016-10-30-one-lambda-calculus-many-times-2.html#21507" class="Function"
      >f&#8314;&#8242;</a
      ><a name="21616"
      > </a
      ><a name="21625" href="2016-10-30-one-lambda-calculus-many-times-2.html#21625" class="Bound"
      >&#915;</a
      ><a name="21626"
      > </a
      ><a name="21627" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="21629"
      > </a
      ><a name="21634" href="2016-10-30-one-lambda-calculus-many-times-2.html#21634" class="Bound"
      >f</a
      ><a name="21635"
      >
           </a
      ><a name="21647" class="Comment"
      >-- NJ (&#915; ++ A &#8759; []) ++ &#916; &#8866; .B</a
      ><a name="21676"
      >
      </a
      ><a name="21683" class="Keyword"
      >rewrite</a
      ><a name="21690"
      > </a
      ><a name="21691" href="2016-10-30-one-lambda-calculus-many-times-2.html#2036" class="Function"
      >++-identity&#691;</a
      ><a name="21703"
      > </a
      ><a name="21704" href="2016-10-30-one-lambda-calculus-many-times-2.html#21625" class="Bound"
      >&#915;</a
      ><a name="21705"
      >
           </a
      ><a name="21717" class="Comment"
      >-- NJ (&#915; ++ A &#8759; []) ++ &#916; &#8866; B</a
      ><a name="21745"
      >
            </a
      ><a name="21758" class="Symbol"
      >|</a
      ><a name="21759"
      > </a
      ><a name="21760" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#811" class="Function"
      >++-assoc</a
      ><a name="21768"
      > </a
      ><a name="21769" href="2016-10-30-one-lambda-calculus-many-times-2.html#21625" class="Bound"
      >&#915;</a
      ><a name="21770"
      > </a
      ><a name="21771" class="Symbol"
      >(</a
      ><a name="21772" href="2016-10-30-one-lambda-calculus-many-times-2.html#21618" class="Bound"
      >A</a
      ><a name="21773"
      > </a
      ><a name="21774" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="21775"
      > </a
      ><a name="21776" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="21778" class="Symbol"
      >)</a
      ><a name="21779"
      > </a
      ><a name="21780" href="2016-10-30-one-lambda-calculus-many-times-2.html#21631" class="Bound"
      >&#916;</a
      ><a name="21781"
      >
           </a
      ><a name="21793" class="Comment"
      >-- NJ &#915; ++ A &#8759; &#916; &#8866; B</a
      ><a name="21813"
      >
            </a
      ><a name="21826" class="Symbol"
      >=</a
      ><a name="21827"
      > </a
      ><a name="21828" href="2016-10-30-one-lambda-calculus-many-times-2.html#21634" class="Bound"
      >f</a
      ><a name="21829"
      >

    </a
      ><a name="21835" href="2016-10-30-one-lambda-calculus-many-times-2.html#21507" class="Function"
      >f&#8314;&#8242;</a
      ><a name="21838"
      > </a
      ><a name="21847" href="2016-10-30-one-lambda-calculus-many-times-2.html#21847" class="Bound"
      >&#915;</a
      ><a name="21848"
      > </a
      ><a name="21849" class="Symbol"
      >(</a
      ><a name="21850" href="2016-10-30-one-lambda-calculus-many-times-2.html#21850" class="Bound"
      >C</a
      ><a name="21851"
      > </a
      ><a name="21852" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="21853"
      > </a
      ><a name="21854" href="2016-10-30-one-lambda-calculus-many-times-2.html#21854" class="Bound"
      >&#931;</a
      ><a name="21855" class="Symbol"
      >)</a
      ><a name="21856"
      > </a
      ><a name="21861" href="2016-10-30-one-lambda-calculus-many-times-2.html#21861" class="Bound"
      >f</a
      ><a name="21862"
      >
      </a
      ><a name="21869" class="Keyword"
      >rewrite</a
      ><a name="21876"
      > </a
      ><a name="21877" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#811" class="Function"
      >++-assoc</a
      ><a name="21885"
      > </a
      ><a name="21886" href="2016-10-30-one-lambda-calculus-many-times-2.html#21847" class="Bound"
      >&#915;</a
      ><a name="21887"
      > </a
      ><a name="21888" class="Symbol"
      >(</a
      ><a name="21889" href="2016-10-30-one-lambda-calculus-many-times-2.html#21840" class="Bound"
      >A</a
      ><a name="21890"
      > </a
      ><a name="21891" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="21892"
      > </a
      ><a name="21893" href="2016-10-30-one-lambda-calculus-many-times-2.html#21850" class="Bound"
      >C</a
      ><a name="21894"
      > </a
      ><a name="21895" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="21896"
      > </a
      ><a name="21897" href="2016-10-30-one-lambda-calculus-many-times-2.html#21854" class="Bound"
      >&#931;</a
      ><a name="21898" class="Symbol"
      >)</a
      ><a name="21899"
      > </a
      ><a name="21900" href="2016-10-30-one-lambda-calculus-many-times-2.html#21858" class="Bound"
      >&#916;</a
      ><a name="21901"
      >
           </a
      ><a name="21913" class="Comment"
      >-- NJ &#915; ++ A &#8759; C &#8759; &#931; ++ &#916; &#8866; B</a
      ><a name="21942"
      >
            </a
      ><a name="21955" class="Symbol"
      >=</a
      ><a name="21956"
      > </a
      ><a name="21957" href="2016-10-30-one-lambda-calculus-many-times-2.html#7161" class="InductiveConstructor"
      >p</a
      ><a name="21958"
      > </a
      ><a name="21959" href="2016-10-30-one-lambda-calculus-many-times-2.html#21847" class="Bound"
      >&#915;</a
      ><a name="21960"
      > </a
      ><a name="21961" href="2016-10-30-one-lambda-calculus-many-times-2.html#21987" class="Function"
      >g</a
      ><a name="21962"
      >
        </a
      ><a name="21971" class="Keyword"
      >where</a
      ><a name="21976"
      >
          </a
      ><a name="21987" href="2016-10-30-one-lambda-calculus-many-times-2.html#21987" class="Function"
      >g</a
      ><a name="21988"
      > </a
      ><a name="21989" class="Symbol"
      >:</a
      ><a name="21990"
      > </a
      ><a name="21991" href="2016-10-30-one-lambda-calculus-many-times-2.html#6868" class="Datatype Operator"
      >NJ</a
      ><a name="21993"
      > </a
      ><a name="21994" href="2016-10-30-one-lambda-calculus-many-times-2.html#21847" class="Bound"
      >&#915;</a
      ><a name="21995"
      > </a
      ><a name="21996" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="21998"
      > </a
      ><a name="21999" href="2016-10-30-one-lambda-calculus-many-times-2.html#21850" class="Bound"
      >C</a
      ><a name="22000"
      > </a
      ><a name="22001" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22002"
      > </a
      ><a name="22003" href="2016-10-30-one-lambda-calculus-many-times-2.html#21840" class="Bound"
      >A</a
      ><a name="22004"
      > </a
      ><a name="22005" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22006"
      > </a
      ><a name="22007" href="2016-10-30-one-lambda-calculus-many-times-2.html#21854" class="Bound"
      >&#931;</a
      ><a name="22008"
      > </a
      ><a name="22009" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22011"
      > </a
      ><a name="22012" href="2016-10-30-one-lambda-calculus-many-times-2.html#21858" class="Bound"
      >&#916;</a
      ><a name="22013"
      > </a
      ><a name="22014" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="22015"
      > </a
      ><a name="22016" href="2016-10-30-one-lambda-calculus-many-times-2.html#21844" class="Bound"
      >B</a
      ><a name="22017"
      >
          </a
      ><a name="22028" href="2016-10-30-one-lambda-calculus-many-times-2.html#21987" class="Function"
      >g</a
      ><a name="22029"
      > </a
      ><a name="22030" class="Keyword"
      >rewrite</a
      ><a name="22037"
      > </a
      ><a name="22038" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#565" class="Function"
      >sym</a
      ><a name="22041"
      > </a
      ><a name="22042" class="Symbol"
      >(</a
      ><a name="22043" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#811" class="Function"
      >++-assoc</a
      ><a name="22051"
      > </a
      ><a name="22052" href="2016-10-30-one-lambda-calculus-many-times-2.html#21847" class="Bound"
      >&#915;</a
      ><a name="22053"
      > </a
      ><a name="22054" class="Symbol"
      >(</a
      ><a name="22055" href="2016-10-30-one-lambda-calculus-many-times-2.html#21850" class="Bound"
      >C</a
      ><a name="22056"
      > </a
      ><a name="22057" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22058"
      > </a
      ><a name="22059" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="22061" class="Symbol"
      >)</a
      ><a name="22062"
      > </a
      ><a name="22063" class="Symbol"
      >(</a
      ><a name="22064" href="2016-10-30-one-lambda-calculus-many-times-2.html#21840" class="Bound"
      >A</a
      ><a name="22065"
      > </a
      ><a name="22066" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22067"
      > </a
      ><a name="22068" href="2016-10-30-one-lambda-calculus-many-times-2.html#21854" class="Bound"
      >&#931;</a
      ><a name="22069"
      > </a
      ><a name="22070" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22072"
      > </a
      ><a name="22073" href="2016-10-30-one-lambda-calculus-many-times-2.html#21858" class="Bound"
      >&#916;</a
      ><a name="22074" class="Symbol"
      >))</a
      ><a name="22076"
      >
                 </a
      ><a name="22094" class="Comment"
      >-- NJ (&#915; ++ C &#8759; []) ++ A &#8759; &#931; ++ &#916; &#8866; B</a
      ><a name="22131"
      >
                  </a
      ><a name="22150" class="Symbol"
      >|</a
      ><a name="22151"
      > </a
      ><a name="22152" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#565" class="Function"
      >sym</a
      ><a name="22155"
      > </a
      ><a name="22156" class="Symbol"
      >(</a
      ><a name="22157" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#811" class="Function"
      >++-assoc</a
      ><a name="22165"
      > </a
      ><a name="22166" class="Symbol"
      >(</a
      ><a name="22167" href="2016-10-30-one-lambda-calculus-many-times-2.html#21847" class="Bound"
      >&#915;</a
      ><a name="22168"
      > </a
      ><a name="22169" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22171"
      > </a
      ><a name="22172" href="2016-10-30-one-lambda-calculus-many-times-2.html#21850" class="Bound"
      >C</a
      ><a name="22173"
      > </a
      ><a name="22174" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22175"
      > </a
      ><a name="22176" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="22178" class="Symbol"
      >)</a
      ><a name="22179"
      > </a
      ><a name="22180" class="Symbol"
      >(</a
      ><a name="22181" href="2016-10-30-one-lambda-calculus-many-times-2.html#21840" class="Bound"
      >A</a
      ><a name="22182"
      > </a
      ><a name="22183" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22184"
      > </a
      ><a name="22185" href="2016-10-30-one-lambda-calculus-many-times-2.html#21854" class="Bound"
      >&#931;</a
      ><a name="22186" class="Symbol"
      >)</a
      ><a name="22187"
      > </a
      ><a name="22188" href="2016-10-30-one-lambda-calculus-many-times-2.html#21858" class="Bound"
      >&#916;</a
      ><a name="22189" class="Symbol"
      >)</a
      ><a name="22190"
      >
                 </a
      ><a name="22208" class="Comment"
      >-- NJ ((&#915; ++ C &#8759; []) ++ A &#8759; &#931;) ++ &#916; &#8866; B</a
      ><a name="22247"
      >
                 </a
      ><a name="22265" class="Symbol"
      >=</a
      ><a name="22266"
      > </a
      ><a name="22267" href="2016-10-30-one-lambda-calculus-many-times-2.html#21507" class="Function"
      >f&#8314;&#8242;</a
      ><a name="22270"
      > </a
      ><a name="22271" class="Symbol"
      >(</a
      ><a name="22272" href="2016-10-30-one-lambda-calculus-many-times-2.html#21847" class="Bound"
      >&#915;</a
      ><a name="22273"
      > </a
      ><a name="22274" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22276"
      > </a
      ><a name="22277" href="2016-10-30-one-lambda-calculus-many-times-2.html#21850" class="Bound"
      >C</a
      ><a name="22278"
      > </a
      ><a name="22279" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22280"
      > </a
      ><a name="22281" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="22283" class="Symbol"
      >)</a
      ><a name="22284"
      > </a
      ><a name="22285" href="2016-10-30-one-lambda-calculus-many-times-2.html#21854" class="Bound"
      >&#931;</a
      ><a name="22286"
      > </a
      ><a name="22291" href="2016-10-30-one-lambda-calculus-many-times-2.html#22329" class="Function"
      >h</a
      ><a name="22292"
      >
              </a
      ><a name="22307" class="Keyword"
      >where</a
      ><a name="22312"
      >
                </a
      ><a name="22329" href="2016-10-30-one-lambda-calculus-many-times-2.html#22329" class="Function"
      >h</a
      ><a name="22330"
      > </a
      ><a name="22331" class="Symbol"
      >:</a
      ><a name="22332"
      > </a
      ><a name="22333" href="2016-10-30-one-lambda-calculus-many-times-2.html#6868" class="Datatype Operator"
      >NJ</a
      ><a name="22335"
      > </a
      ><a name="22336" class="Symbol"
      >((</a
      ><a name="22338" href="2016-10-30-one-lambda-calculus-many-times-2.html#21847" class="Bound"
      >&#915;</a
      ><a name="22339"
      > </a
      ><a name="22340" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22342"
      > </a
      ><a name="22343" href="2016-10-30-one-lambda-calculus-many-times-2.html#21850" class="Bound"
      >C</a
      ><a name="22344"
      > </a
      ><a name="22345" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22346"
      > </a
      ><a name="22347" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="22349" class="Symbol"
      >)</a
      ><a name="22350"
      > </a
      ><a name="22351" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22353"
      > </a
      ><a name="22354" href="2016-10-30-one-lambda-calculus-many-times-2.html#21854" class="Bound"
      >&#931;</a
      ><a name="22355" class="Symbol"
      >)</a
      ><a name="22356"
      > </a
      ><a name="22357" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22359"
      > </a
      ><a name="22360" href="2016-10-30-one-lambda-calculus-many-times-2.html#21840" class="Bound"
      >A</a
      ><a name="22361"
      > </a
      ><a name="22362" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22363"
      > </a
      ><a name="22364" href="2016-10-30-one-lambda-calculus-many-times-2.html#21858" class="Bound"
      >&#916;</a
      ><a name="22365"
      > </a
      ><a name="22366" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="22367"
      > </a
      ><a name="22368" href="2016-10-30-one-lambda-calculus-many-times-2.html#21844" class="Bound"
      >B</a
      ><a name="22369"
      >
                </a
      ><a name="22386" href="2016-10-30-one-lambda-calculus-many-times-2.html#22329" class="Function"
      >h</a
      ><a name="22387"
      > </a
      ><a name="22388" class="Keyword"
      >rewrite</a
      ><a name="22395"
      > </a
      ><a name="22396" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#811" class="Function"
      >++-assoc</a
      ><a name="22404"
      > </a
      ><a name="22405" href="2016-10-30-one-lambda-calculus-many-times-2.html#21847" class="Bound"
      >&#915;</a
      ><a name="22406"
      > </a
      ><a name="22407" class="Symbol"
      >(</a
      ><a name="22408" href="2016-10-30-one-lambda-calculus-many-times-2.html#21850" class="Bound"
      >C</a
      ><a name="22409"
      > </a
      ><a name="22410" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22411"
      > </a
      ><a name="22412" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="22414" class="Symbol"
      >)</a
      ><a name="22415"
      > </a
      ><a name="22416" href="2016-10-30-one-lambda-calculus-many-times-2.html#21854" class="Bound"
      >&#931;</a
      ><a name="22417"
      > </a
      ><a name="22418" class="Symbol"
      >=</a
      ><a name="22419"
      > </a
      ><a name="22420" href="2016-10-30-one-lambda-calculus-many-times-2.html#21861" class="Bound"
      >f</a
      >
</pre><!--{% endraw %}-->
</div>
<div class="foldable">
<!--{% raw %}--><pre class="Agda">
    <a name="22480" href="2016-10-30-one-lambda-calculus-many-times-2.html#22480" class="Function"
      >p&#8314;&#8242;</a
      ><a name="22483"
      > </a
      ><a name="22484" class="Symbol"
      >:</a
      ><a name="22485"
      > </a
      ><a name="22486" class="Symbol"
      >&#8704;</a
      ><a name="22487"
      > </a
      ><a name="22492" class="Symbol"
      >&#8594;</a
      ><a name="22493"
      > </a
      ><a name="22494" class="Symbol"
      >&#8704;</a
      ><a name="22495"
      > </a
      ><a name="22496" href="2016-10-30-one-lambda-calculus-many-times-2.html#22496" class="Bound"
      >&#915;</a
      ><a name="22497"
      > </a
      ><a name="22498" href="2016-10-30-one-lambda-calculus-many-times-2.html#22498" class="Bound"
      >&#931;</a
      ><a name="22499"
      > </a
      ><a name="22500" href="2016-10-30-one-lambda-calculus-many-times-2.html#22500" class="Bound"
      >&#928;</a
      ><a name="22501"
      > </a
      ><a name="22502" class="Symbol"
      >&#8594;</a
      ><a name="22503"
      > </a
      ><a name="22504" class="Symbol"
      >&#8704;</a
      ><a name="22505"
      > </a
      ><a name="22510" class="Symbol"
      >&#8594;</a
      ><a name="22511"
      > </a
      ><a name="22512" href="2016-10-30-one-lambda-calculus-many-times-2.html#6868" class="Datatype Operator"
      >NJ</a
      ><a name="22514"
      > </a
      ><a name="22515" class="Symbol"
      >(</a
      ><a name="22516" href="2016-10-30-one-lambda-calculus-many-times-2.html#22496" class="Bound"
      >&#915;</a
      ><a name="22517"
      > </a
      ><a name="22518" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22520"
      > </a
      ><a name="22521" href="2016-10-30-one-lambda-calculus-many-times-2.html#22498" class="Bound"
      >&#931;</a
      ><a name="22522" class="Symbol"
      >)</a
      ><a name="22523"
      > </a
      ><a name="22524" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22526"
      > </a
      ><a name="22527" class="Symbol"
      >(</a
      ><a name="22528" href="2016-10-30-one-lambda-calculus-many-times-2.html#22500" class="Bound"
      >&#928;</a
      ><a name="22529"
      > </a
      ><a name="22530" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22532"
      > </a
      ><a name="22533" href="2016-10-30-one-lambda-calculus-many-times-2.html#22507" class="Bound"
      >&#916;</a
      ><a name="22534" class="Symbol"
      >)</a
      ><a name="22535"
      > </a
      ><a name="22536" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="22537"
      > </a
      ><a name="22538" href="2016-10-30-one-lambda-calculus-many-times-2.html#22489" class="Bound"
      >A</a
      ><a name="22539"
      >
                  </a
      ><a name="22558" class="Symbol"
      >&#8594;</a
      ><a name="22559"
      > </a
      ><a name="22560" href="2016-10-30-one-lambda-calculus-many-times-2.html#6868" class="Datatype Operator"
      >NJ</a
      ><a name="22562"
      > </a
      ><a name="22563" class="Symbol"
      >(</a
      ><a name="22564" href="2016-10-30-one-lambda-calculus-many-times-2.html#22496" class="Bound"
      >&#915;</a
      ><a name="22565"
      > </a
      ><a name="22566" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22568"
      > </a
      ><a name="22569" href="2016-10-30-one-lambda-calculus-many-times-2.html#22500" class="Bound"
      >&#928;</a
      ><a name="22570" class="Symbol"
      >)</a
      ><a name="22571"
      > </a
      ><a name="22572" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22574"
      > </a
      ><a name="22575" class="Symbol"
      >(</a
      ><a name="22576" href="2016-10-30-one-lambda-calculus-many-times-2.html#22498" class="Bound"
      >&#931;</a
      ><a name="22577"
      > </a
      ><a name="22578" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22580"
      > </a
      ><a name="22581" href="2016-10-30-one-lambda-calculus-many-times-2.html#22507" class="Bound"
      >&#916;</a
      ><a name="22582" class="Symbol"
      >)</a
      ><a name="22583"
      > </a
      ><a name="22584" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="22585"
      > </a
      ><a name="22586" href="2016-10-30-one-lambda-calculus-many-times-2.html#22489" class="Bound"
      >A</a
      ><a name="22587"
      >
    </a
      ><a name="22592" href="2016-10-30-one-lambda-calculus-many-times-2.html#22480" class="Function"
      >p&#8314;&#8242;</a
      ><a name="22595"
      > </a
      ><a name="22600" href="2016-10-30-one-lambda-calculus-many-times-2.html#22600" class="Bound"
      >&#915;</a
      ><a name="22601"
      > </a
      ><a name="22602" href="2016-10-30-one-lambda-calculus-many-times-2.html#22602" class="Bound"
      >&#931;</a
      ><a name="22603"
      > </a
      ><a name="22604" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="22606"
      > </a
      ><a name="22611" href="2016-10-30-one-lambda-calculus-many-times-2.html#22611" class="Bound"
      >f</a
      ><a name="22612"
      >
           </a
      ><a name="22624" class="Comment"
      >-- NJ (&#915; ++ []) ++ &#931; ++ &#916; &#8866; A</a
      ><a name="22653"
      >
      </a
      ><a name="22660" class="Keyword"
      >rewrite</a
      ><a name="22667"
      > </a
      ><a name="22668" href="2016-10-30-one-lambda-calculus-many-times-2.html#2036" class="Function"
      >++-identity&#691;</a
      ><a name="22680"
      > </a
      ><a name="22681" href="2016-10-30-one-lambda-calculus-many-times-2.html#22600" class="Bound"
      >&#915;</a
      ><a name="22682"
      >
           </a
      ><a name="22694" class="Comment"
      >-- NJ &#915; ++ &#931; ++ &#916; &#8866; A</a
      ><a name="22715"
      >
            </a
      ><a name="22728" class="Symbol"
      >|</a
      ><a name="22729"
      > </a
      ><a name="22730" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#565" class="Function"
      >sym</a
      ><a name="22733"
      > </a
      ><a name="22734" class="Symbol"
      >(</a
      ><a name="22735" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#811" class="Function"
      >++-assoc</a
      ><a name="22743"
      > </a
      ><a name="22744" href="2016-10-30-one-lambda-calculus-many-times-2.html#22600" class="Bound"
      >&#915;</a
      ><a name="22745"
      > </a
      ><a name="22746" href="2016-10-30-one-lambda-calculus-many-times-2.html#22602" class="Bound"
      >&#931;</a
      ><a name="22747"
      > </a
      ><a name="22748" href="2016-10-30-one-lambda-calculus-many-times-2.html#22608" class="Bound"
      >&#916;</a
      ><a name="22749" class="Symbol"
      >)</a
      ><a name="22750"
      >
           </a
      ><a name="22762" class="Comment"
      >-- NJ (&#915; ++ &#931;) ++ &#916; &#8866; A</a
      ><a name="22785"
      >
            </a
      ><a name="22798" class="Symbol"
      >=</a
      ><a name="22799"
      > </a
      ><a name="22800" href="2016-10-30-one-lambda-calculus-many-times-2.html#22611" class="Bound"
      >f</a
      ><a name="22801"
      >

    </a
      ><a name="22807" href="2016-10-30-one-lambda-calculus-many-times-2.html#22480" class="Function"
      >p&#8314;&#8242;</a
      ><a name="22810"
      > </a
      ><a name="22815" href="2016-10-30-one-lambda-calculus-many-times-2.html#22815" class="Bound"
      >&#915;</a
      ><a name="22816"
      > </a
      ><a name="22817" href="2016-10-30-one-lambda-calculus-many-times-2.html#22817" class="Bound"
      >&#931;</a
      ><a name="22818"
      > </a
      ><a name="22819" class="Symbol"
      >(</a
      ><a name="22820" href="2016-10-30-one-lambda-calculus-many-times-2.html#22820" class="Bound"
      >B</a
      ><a name="22821"
      > </a
      ><a name="22822" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22823"
      > </a
      ><a name="22824" href="2016-10-30-one-lambda-calculus-many-times-2.html#22824" class="Bound"
      >&#928;</a
      ><a name="22825" class="Symbol"
      >)</a
      ><a name="22826"
      > </a
      ><a name="22831" href="2016-10-30-one-lambda-calculus-many-times-2.html#22831" class="Bound"
      >f</a
      ><a name="22832"
      >
           </a
      ><a name="22844" class="Comment"
      >-- NJ (&#915; ++ B &#8759; &#928;) ++ &#931; ++ &#916; &#8866; A</a
      ><a name="22876"
      >
      </a
      ><a name="22883" class="Keyword"
      >rewrite</a
      ><a name="22890"
      > </a
      ><a name="22891" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#565" class="Function"
      >sym</a
      ><a name="22894"
      > </a
      ><a name="22895" class="Symbol"
      >(</a
      ><a name="22896" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#811" class="Function"
      >++-assoc</a
      ><a name="22904"
      > </a
      ><a name="22905" href="2016-10-30-one-lambda-calculus-many-times-2.html#22815" class="Bound"
      >&#915;</a
      ><a name="22906"
      > </a
      ><a name="22907" class="Symbol"
      >(</a
      ><a name="22908" href="2016-10-30-one-lambda-calculus-many-times-2.html#22820" class="Bound"
      >B</a
      ><a name="22909"
      > </a
      ><a name="22910" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22911"
      > </a
      ><a name="22912" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="22914" class="Symbol"
      >)</a
      ><a name="22915"
      > </a
      ><a name="22916" href="2016-10-30-one-lambda-calculus-many-times-2.html#22824" class="Bound"
      >&#928;</a
      ><a name="22917" class="Symbol"
      >)</a
      ><a name="22918"
      >
           </a
      ><a name="22930" class="Comment"
      >-- NJ ((&#915; ++ B &#8759; []) ++ &#928;) ++ &#931; ++ &#916; &#8866; A</a
      ><a name="22970"
      >
            </a
      ><a name="22983" class="Symbol"
      >=</a
      ><a name="22984"
      > </a
      ><a name="22985" href="2016-10-30-one-lambda-calculus-many-times-2.html#22480" class="Function"
      >p&#8314;&#8242;</a
      ><a name="22988"
      > </a
      ><a name="22989" class="Symbol"
      >(</a
      ><a name="22990" href="2016-10-30-one-lambda-calculus-many-times-2.html#22815" class="Bound"
      >&#915;</a
      ><a name="22991"
      > </a
      ><a name="22992" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22994"
      > </a
      ><a name="22995" href="2016-10-30-one-lambda-calculus-many-times-2.html#22820" class="Bound"
      >B</a
      ><a name="22996"
      > </a
      ><a name="22997" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22998"
      > </a
      ><a name="22999" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="23001" class="Symbol"
      >)</a
      ><a name="23002"
      > </a
      ><a name="23003" href="2016-10-30-one-lambda-calculus-many-times-2.html#22817" class="Bound"
      >&#931;</a
      ><a name="23004"
      > </a
      ><a name="23005" href="2016-10-30-one-lambda-calculus-many-times-2.html#22824" class="Bound"
      >&#928;</a
      ><a name="23006"
      > </a
      ><a name="23011" href="2016-10-30-one-lambda-calculus-many-times-2.html#23037" class="Function"
      >g</a
      ><a name="23012"
      >
        </a
      ><a name="23021" class="Keyword"
      >where</a
      ><a name="23026"
      >
          </a
      ><a name="23037" href="2016-10-30-one-lambda-calculus-many-times-2.html#23037" class="Function"
      >g</a
      ><a name="23038"
      > </a
      ><a name="23039" class="Symbol"
      >:</a
      ><a name="23040"
      > </a
      ><a name="23041" href="2016-10-30-one-lambda-calculus-many-times-2.html#6868" class="Datatype Operator"
      >NJ</a
      ><a name="23043"
      > </a
      ><a name="23044" class="Symbol"
      >((</a
      ><a name="23046" href="2016-10-30-one-lambda-calculus-many-times-2.html#22815" class="Bound"
      >&#915;</a
      ><a name="23047"
      > </a
      ><a name="23048" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23050"
      > </a
      ><a name="23051" href="2016-10-30-one-lambda-calculus-many-times-2.html#22820" class="Bound"
      >B</a
      ><a name="23052"
      > </a
      ><a name="23053" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23054"
      > </a
      ><a name="23055" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="23057" class="Symbol"
      >)</a
      ><a name="23058"
      > </a
      ><a name="23059" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23061"
      > </a
      ><a name="23062" href="2016-10-30-one-lambda-calculus-many-times-2.html#22817" class="Bound"
      >&#931;</a
      ><a name="23063" class="Symbol"
      >)</a
      ><a name="23064"
      > </a
      ><a name="23065" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23067"
      > </a
      ><a name="23068" href="2016-10-30-one-lambda-calculus-many-times-2.html#22824" class="Bound"
      >&#928;</a
      ><a name="23069"
      > </a
      ><a name="23070" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23072"
      > </a
      ><a name="23073" href="2016-10-30-one-lambda-calculus-many-times-2.html#22828" class="Bound"
      >&#916;</a
      ><a name="23074"
      > </a
      ><a name="23075" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="23076"
      > </a
      ><a name="23077" href="2016-10-30-one-lambda-calculus-many-times-2.html#22812" class="Bound"
      >A</a
      ><a name="23078"
      >
          </a
      ><a name="23089" href="2016-10-30-one-lambda-calculus-many-times-2.html#23037" class="Function"
      >g</a
      ><a name="23090"
      > </a
      ><a name="23091" class="Keyword"
      >rewrite</a
      ><a name="23098"
      > </a
      ><a name="23099" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#811" class="Function"
      >++-assoc</a
      ><a name="23107"
      > </a
      ><a name="23108" href="2016-10-30-one-lambda-calculus-many-times-2.html#22815" class="Bound"
      >&#915;</a
      ><a name="23109"
      > </a
      ><a name="23110" class="Symbol"
      >(</a
      ><a name="23111" href="2016-10-30-one-lambda-calculus-many-times-2.html#22820" class="Bound"
      >B</a
      ><a name="23112"
      > </a
      ><a name="23113" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23114"
      > </a
      ><a name="23115" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="23117" class="Symbol"
      >)</a
      ><a name="23118"
      > </a
      ><a name="23119" href="2016-10-30-one-lambda-calculus-many-times-2.html#22817" class="Bound"
      >&#931;</a
      ><a name="23120"
      >
                 </a
      ><a name="23138" class="Comment"
      >-- NJ (&#915; ++ B &#8759; &#931;) ++ &#928; ++ &#916; &#8866; A</a
      ><a name="23170"
      >
                  </a
      ><a name="23189" class="Symbol"
      >=</a
      ><a name="23190"
      > </a
      ><a name="23191" href="2016-10-30-one-lambda-calculus-many-times-2.html#21507" class="Function"
      >f&#8314;&#8242;</a
      ><a name="23194"
      > </a
      ><a name="23195" href="2016-10-30-one-lambda-calculus-many-times-2.html#22815" class="Bound"
      >&#915;</a
      ><a name="23196"
      > </a
      ><a name="23197" href="2016-10-30-one-lambda-calculus-many-times-2.html#22817" class="Bound"
      >&#931;</a
      ><a name="23198"
      > </a
      ><a name="23199" href="2016-10-30-one-lambda-calculus-many-times-2.html#22831" class="Bound"
      >f</a
      >
</pre><!--{% endraw %}-->
</div>
<div class="foldable">
<!--{% raw %}--><pre class="Agda">
    <a name="23259" href="2016-10-30-one-lambda-calculus-many-times-2.html#23259" class="Function"
      >c&#8314;&#8242;</a
      ><a name="23262"
      > </a
      ><a name="23263" class="Symbol"
      >:</a
      ><a name="23264"
      > </a
      ><a name="23265" class="Symbol"
      >&#8704;</a
      ><a name="23266"
      > </a
      ><a name="23271" class="Symbol"
      >&#8594;</a
      ><a name="23272"
      > </a
      ><a name="23273" class="Symbol"
      >&#8704;</a
      ><a name="23274"
      > </a
      ><a name="23275" href="2016-10-30-one-lambda-calculus-many-times-2.html#23275" class="Bound"
      >&#915;</a
      ><a name="23276"
      > </a
      ><a name="23277" class="Symbol"
      >&#8594;</a
      ><a name="23278"
      > </a
      ><a name="23279" class="Symbol"
      >&#8704;</a
      ><a name="23280"
      > </a
      ><a name="23285" class="Symbol"
      >&#8594;</a
      ><a name="23286"
      > </a
      ><a name="23287" href="2016-10-30-one-lambda-calculus-many-times-2.html#6868" class="Datatype Operator"
      >NJ</a
      ><a name="23289"
      > </a
      ><a name="23290" class="Symbol"
      >(</a
      ><a name="23291" href="2016-10-30-one-lambda-calculus-many-times-2.html#23275" class="Bound"
      >&#915;</a
      ><a name="23292"
      > </a
      ><a name="23293" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23295"
      > </a
      ><a name="23296" href="2016-10-30-one-lambda-calculus-many-times-2.html#23275" class="Bound"
      >&#915;</a
      ><a name="23297" class="Symbol"
      >)</a
      ><a name="23298"
      > </a
      ><a name="23299" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23301"
      > </a
      ><a name="23302" href="2016-10-30-one-lambda-calculus-many-times-2.html#23282" class="Bound"
      >&#916;</a
      ><a name="23303"
      > </a
      ><a name="23304" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="23305"
      > </a
      ><a name="23306" href="2016-10-30-one-lambda-calculus-many-times-2.html#23268" class="Bound"
      >A</a
      ><a name="23307"
      > </a
      ><a name="23308" class="Symbol"
      >&#8594;</a
      ><a name="23309"
      > </a
      ><a name="23310" href="2016-10-30-one-lambda-calculus-many-times-2.html#6868" class="Datatype Operator"
      >NJ</a
      ><a name="23312"
      > </a
      ><a name="23313" href="2016-10-30-one-lambda-calculus-many-times-2.html#23275" class="Bound"
      >&#915;</a
      ><a name="23314"
      > </a
      ><a name="23315" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23317"
      > </a
      ><a name="23318" href="2016-10-30-one-lambda-calculus-many-times-2.html#23282" class="Bound"
      >&#916;</a
      ><a name="23319"
      > </a
      ><a name="23320" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="23321"
      > </a
      ><a name="23322" href="2016-10-30-one-lambda-calculus-many-times-2.html#23268" class="Bound"
      >A</a
      ><a name="23323"
      >
    </a
      ><a name="23328" href="2016-10-30-one-lambda-calculus-many-times-2.html#23259" class="Function"
      >c&#8314;&#8242;</a
      ><a name="23331"
      > </a
      ><a name="23336" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="23338"
      >      </a
      ><a name="23348" href="2016-10-30-one-lambda-calculus-many-times-2.html#23348" class="Bound"
      >f</a
      ><a name="23349"
      > </a
      ><a name="23350" class="Symbol"
      >=</a
      ><a name="23351"
      > </a
      ><a name="23352" href="2016-10-30-one-lambda-calculus-many-times-2.html#23348" class="Bound"
      >f</a
      ><a name="23353"
      >
    </a
      ><a name="23358" href="2016-10-30-one-lambda-calculus-many-times-2.html#23259" class="Function"
      >c&#8314;&#8242;</a
      ><a name="23361"
      > </a
      ><a name="23366" class="Symbol"
      >(</a
      ><a name="23367" href="2016-10-30-one-lambda-calculus-many-times-2.html#23367" class="Bound"
      >B</a
      ><a name="23368"
      > </a
      ><a name="23369" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23370"
      > </a
      ><a name="23371" href="2016-10-30-one-lambda-calculus-many-times-2.html#23371" class="Bound"
      >&#915;</a
      ><a name="23372" class="Symbol"
      >)</a
      ><a name="23373"
      > </a
      ><a name="23378" href="2016-10-30-one-lambda-calculus-many-times-2.html#23378" class="Bound"
      >f</a
      ><a name="23379"
      > </a
      ><a name="23380" class="Symbol"
      >=</a
      ><a name="23381"
      > </a
      ><a name="23382" href="2016-10-30-one-lambda-calculus-many-times-2.html#7104" class="InductiveConstructor"
      >c</a
      ><a name="23383"
      > </a
      ><a name="23384" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="23385"
      > </a
      ><a name="23386" href="2016-10-30-one-lambda-calculus-many-times-2.html#22480" class="Function"
      >p&#8314;&#8242;</a
      ><a name="23389"
      > </a
      ><a name="23390" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="23392"
      > </a
      ><a name="23393" href="2016-10-30-one-lambda-calculus-many-times-2.html#23371" class="Bound"
      >&#915;</a
      ><a name="23394"
      > </a
      ><a name="23395" class="Symbol"
      >(</a
      ><a name="23396" href="2016-10-30-one-lambda-calculus-many-times-2.html#23367" class="Bound"
      >B</a
      ><a name="23397"
      > </a
      ><a name="23398" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23399"
      > </a
      ><a name="23400" href="2016-10-30-one-lambda-calculus-many-times-2.html#23367" class="Bound"
      >B</a
      ><a name="23401"
      > </a
      ><a name="23402" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23403"
      > </a
      ><a name="23404" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="23406" class="Symbol"
      >)</a
      ><a name="23407"
      >        </a
      ><a name="23415" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="23416"
      > </a
      ><a name="23417" href="2016-10-30-one-lambda-calculus-many-times-2.html#23259" class="Function"
      >c&#8314;&#8242;</a
      ><a name="23420"
      > </a
      ><a name="23421" href="2016-10-30-one-lambda-calculus-many-times-2.html#23371" class="Bound"
      >&#915;</a
      ><a name="23422"
      >
                      </a
      ><a name="23445" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="23446"
      > </a
      ><a name="23447" href="2016-10-30-one-lambda-calculus-many-times-2.html#22480" class="Function"
      >p&#8314;&#8242;</a
      ><a name="23450"
      > </a
      ><a name="23451" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="23453"
      > </a
      ><a name="23454" class="Symbol"
      >(</a
      ><a name="23455" href="2016-10-30-one-lambda-calculus-many-times-2.html#23367" class="Bound"
      >B</a
      ><a name="23456"
      > </a
      ><a name="23457" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23458"
      > </a
      ><a name="23459" href="2016-10-30-one-lambda-calculus-many-times-2.html#23367" class="Bound"
      >B</a
      ><a name="23460"
      > </a
      ><a name="23461" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23462"
      > </a
      ><a name="23463" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="23465" class="Symbol"
      >)</a
      ><a name="23466"
      > </a
      ><a name="23467" class="Symbol"
      >(</a
      ><a name="23468" href="2016-10-30-one-lambda-calculus-many-times-2.html#23371" class="Bound"
      >&#915;</a
      ><a name="23469"
      > </a
      ><a name="23470" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23472"
      > </a
      ><a name="23473" href="2016-10-30-one-lambda-calculus-many-times-2.html#23371" class="Bound"
      >&#915;</a
      ><a name="23474" class="Symbol"
      >)</a
      ><a name="23475"
      > </a
      ><a name="23476" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="23477"
      > </a
      ><a name="23478" href="2016-10-30-one-lambda-calculus-many-times-2.html#23500" class="Function"
      >g</a
      ><a name="23479"
      >
      </a
      ><a name="23486" class="Keyword"
      >where</a
      ><a name="23491"
      >
        </a
      ><a name="23500" href="2016-10-30-one-lambda-calculus-many-times-2.html#23500" class="Function"
      >g</a
      ><a name="23501"
      > </a
      ><a name="23502" class="Symbol"
      >:</a
      ><a name="23503"
      > </a
      ><a name="23504" href="2016-10-30-one-lambda-calculus-many-times-2.html#6868" class="Datatype Operator"
      >NJ</a
      ><a name="23506"
      > </a
      ><a name="23507" class="Symbol"
      >(</a
      ><a name="23508" href="2016-10-30-one-lambda-calculus-many-times-2.html#23367" class="Bound"
      >B</a
      ><a name="23509"
      > </a
      ><a name="23510" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23511"
      > </a
      ><a name="23512" href="2016-10-30-one-lambda-calculus-many-times-2.html#23367" class="Bound"
      >B</a
      ><a name="23513"
      > </a
      ><a name="23514" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23515"
      > </a
      ><a name="23516" href="2016-10-30-one-lambda-calculus-many-times-2.html#23371" class="Bound"
      >&#915;</a
      ><a name="23517"
      > </a
      ><a name="23518" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23520"
      > </a
      ><a name="23521" href="2016-10-30-one-lambda-calculus-many-times-2.html#23371" class="Bound"
      >&#915;</a
      ><a name="23522" class="Symbol"
      >)</a
      ><a name="23523"
      > </a
      ><a name="23524" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23526"
      > </a
      ><a name="23527" href="2016-10-30-one-lambda-calculus-many-times-2.html#23375" class="Bound"
      >&#916;</a
      ><a name="23528"
      > </a
      ><a name="23529" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="23530"
      > </a
      ><a name="23531" href="2016-10-30-one-lambda-calculus-many-times-2.html#23363" class="Bound"
      >A</a
      ><a name="23532"
      >
        </a
      ><a name="23541" href="2016-10-30-one-lambda-calculus-many-times-2.html#23500" class="Function"
      >g</a
      ><a name="23542"
      > </a
      ><a name="23543" class="Keyword"
      >rewrite</a
      ><a name="23550"
      > </a
      ><a name="23551" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#811" class="Function"
      >++-assoc</a
      ><a name="23559"
      > </a
      ><a name="23560" class="Symbol"
      >(</a
      ><a name="23561" href="2016-10-30-one-lambda-calculus-many-times-2.html#23367" class="Bound"
      >B</a
      ><a name="23562"
      > </a
      ><a name="23563" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23564"
      > </a
      ><a name="23565" href="2016-10-30-one-lambda-calculus-many-times-2.html#23367" class="Bound"
      >B</a
      ><a name="23566"
      > </a
      ><a name="23567" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23568"
      > </a
      ><a name="23569" href="2016-10-30-one-lambda-calculus-many-times-2.html#23371" class="Bound"
      >&#915;</a
      ><a name="23570" class="Symbol"
      >)</a
      ><a name="23571"
      > </a
      ><a name="23572" href="2016-10-30-one-lambda-calculus-many-times-2.html#23371" class="Bound"
      >&#915;</a
      ><a name="23573"
      > </a
      ><a name="23574" href="2016-10-30-one-lambda-calculus-many-times-2.html#23375" class="Bound"
      >&#916;</a
      ><a name="23575"
      >
                </a
      ><a name="23592" class="Symbol"
      >=</a
      ><a name="23593"
      > </a
      ><a name="23594" href="2016-10-30-one-lambda-calculus-many-times-2.html#21507" class="Function"
      >f&#8314;&#8242;</a
      ><a name="23597"
      > </a
      ><a name="23598" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="23600"
      > </a
      ><a name="23601" class="Symbol"
      >(</a
      ><a name="23602" href="2016-10-30-one-lambda-calculus-many-times-2.html#23367" class="Bound"
      >B</a
      ><a name="23603"
      > </a
      ><a name="23604" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23605"
      > </a
      ><a name="23606" href="2016-10-30-one-lambda-calculus-many-times-2.html#23371" class="Bound"
      >&#915;</a
      ><a name="23607" class="Symbol"
      >)</a
      ><a name="23608"
      > </a
      ><a name="23609" href="2016-10-30-one-lambda-calculus-many-times-2.html#23643" class="Function"
      >h</a
      ><a name="23610"
      >
            </a
      ><a name="23623" class="Keyword"
      >where</a
      ><a name="23628"
      >
              </a
      ><a name="23643" href="2016-10-30-one-lambda-calculus-many-times-2.html#23643" class="Function"
      >h</a
      ><a name="23644"
      > </a
      ><a name="23645" class="Symbol"
      >:</a
      ><a name="23646"
      > </a
      ><a name="23647" href="2016-10-30-one-lambda-calculus-many-times-2.html#6868" class="Datatype Operator"
      >NJ</a
      ><a name="23649"
      > </a
      ><a name="23650" href="2016-10-30-one-lambda-calculus-many-times-2.html#23367" class="Bound"
      >B</a
      ><a name="23651"
      > </a
      ><a name="23652" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23653"
      > </a
      ><a name="23654" href="2016-10-30-one-lambda-calculus-many-times-2.html#23371" class="Bound"
      >&#915;</a
      ><a name="23655"
      > </a
      ><a name="23656" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23658"
      > </a
      ><a name="23659" href="2016-10-30-one-lambda-calculus-many-times-2.html#23367" class="Bound"
      >B</a
      ><a name="23660"
      > </a
      ><a name="23661" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23662"
      > </a
      ><a name="23663" href="2016-10-30-one-lambda-calculus-many-times-2.html#23371" class="Bound"
      >&#915;</a
      ><a name="23664"
      > </a
      ><a name="23665" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23667"
      > </a
      ><a name="23668" href="2016-10-30-one-lambda-calculus-many-times-2.html#23375" class="Bound"
      >&#916;</a
      ><a name="23669"
      > </a
      ><a name="23670" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="23671"
      > </a
      ><a name="23672" href="2016-10-30-one-lambda-calculus-many-times-2.html#23363" class="Bound"
      >A</a
      ><a name="23673"
      >
              </a
      ><a name="23688" href="2016-10-30-one-lambda-calculus-many-times-2.html#23643" class="Function"
      >h</a
      ><a name="23689"
      > </a
      ><a name="23690" class="Keyword"
      >rewrite</a
      ><a name="23697"
      > </a
      ><a name="23698" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#565" class="Function"
      >sym</a
      ><a name="23701"
      > </a
      ><a name="23702" class="Symbol"
      >(</a
      ><a name="23703" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#811" class="Function"
      >++-assoc</a
      ><a name="23711"
      > </a
      ><a name="23712" class="Symbol"
      >(</a
      ><a name="23713" href="2016-10-30-one-lambda-calculus-many-times-2.html#23367" class="Bound"
      >B</a
      ><a name="23714"
      > </a
      ><a name="23715" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23716"
      > </a
      ><a name="23717" href="2016-10-30-one-lambda-calculus-many-times-2.html#23371" class="Bound"
      >&#915;</a
      ><a name="23718" class="Symbol"
      >)</a
      ><a name="23719"
      > </a
      ><a name="23720" class="Symbol"
      >(</a
      ><a name="23721" href="2016-10-30-one-lambda-calculus-many-times-2.html#23367" class="Bound"
      >B</a
      ><a name="23722"
      > </a
      ><a name="23723" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23724"
      > </a
      ><a name="23725" href="2016-10-30-one-lambda-calculus-many-times-2.html#23371" class="Bound"
      >&#915;</a
      ><a name="23726" class="Symbol"
      >)</a
      ><a name="23727"
      > </a
      ><a name="23728" href="2016-10-30-one-lambda-calculus-many-times-2.html#23375" class="Bound"
      >&#916;</a
      ><a name="23729" class="Symbol"
      >)</a
      ><a name="23730"
      >
                      </a
      ><a name="23753" class="Symbol"
      >=</a
      ><a name="23754"
      > </a
      ><a name="23755" href="2016-10-30-one-lambda-calculus-many-times-2.html#23378" class="Bound"
      >f</a
      >
</pre><!--{% endraw %}-->
</div>
<div class="foldable">
<!--{% raw %}--><pre class="Agda">
    <a name="23815" href="2016-10-30-one-lambda-calculus-many-times-2.html#23815" class="Function"
      >s&#8314;&#8242;</a
      ><a name="23818"
      > </a
      ><a name="23819" class="Symbol"
      >:</a
      ><a name="23820"
      > </a
      ><a name="23821" class="Symbol"
      >&#8704;</a
      ><a name="23822"
      > </a
      ><a name="23827" class="Symbol"
      >&#8594;</a
      ><a name="23828"
      > </a
      ><a name="23829" class="Symbol"
      >&#8704;</a
      ><a name="23830"
      > </a
      ><a name="23831" href="2016-10-30-one-lambda-calculus-many-times-2.html#23831" class="Bound"
      >&#915;</a
      ><a name="23832"
      > </a
      ><a name="23833" href="2016-10-30-one-lambda-calculus-many-times-2.html#23833" class="Bound"
      >&#931;</a
      ><a name="23834"
      > </a
      ><a name="23835" class="Symbol"
      >&#8594;</a
      ><a name="23836"
      > </a
      ><a name="23837" class="Symbol"
      >&#8704;</a
      ><a name="23838"
      > </a
      ><a name="23843" class="Symbol"
      >&#8594;</a
      ><a name="23844"
      > </a
      ><a name="23845" href="2016-10-30-one-lambda-calculus-many-times-2.html#6868" class="Datatype Operator"
      >NJ</a
      ><a name="23847"
      > </a
      ><a name="23848" class="Symbol"
      >(</a
      ><a name="23849" href="2016-10-30-one-lambda-calculus-many-times-2.html#23831" class="Bound"
      >&#915;</a
      ><a name="23850"
      > </a
      ><a name="23851" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23853"
      > </a
      ><a name="23854" href="2016-10-30-one-lambda-calculus-many-times-2.html#23833" class="Bound"
      >&#931;</a
      ><a name="23855" class="Symbol"
      >)</a
      ><a name="23856"
      > </a
      ><a name="23857" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23859"
      > </a
      ><a name="23860" href="2016-10-30-one-lambda-calculus-many-times-2.html#23840" class="Bound"
      >&#928;</a
      ><a name="23861"
      > </a
      ><a name="23862" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="23863"
      > </a
      ><a name="23864" href="2016-10-30-one-lambda-calculus-many-times-2.html#23824" class="Bound"
      >A</a
      ><a name="23865"
      >
                </a
      ><a name="23882" class="Symbol"
      >&#8594;</a
      ><a name="23883"
      > </a
      ><a name="23884" href="2016-10-30-one-lambda-calculus-many-times-2.html#6868" class="Datatype Operator"
      >NJ</a
      ><a name="23886"
      > </a
      ><a name="23887" class="Symbol"
      >(</a
      ><a name="23888" href="2016-10-30-one-lambda-calculus-many-times-2.html#23831" class="Bound"
      >&#915;</a
      ><a name="23889"
      > </a
      ><a name="23890" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23892"
      > </a
      ><a name="23893" href="2016-10-30-one-lambda-calculus-many-times-2.html#23840" class="Bound"
      >&#928;</a
      ><a name="23894" class="Symbol"
      >)</a
      ><a name="23895"
      > </a
      ><a name="23896" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23898"
      > </a
      ><a name="23899" href="2016-10-30-one-lambda-calculus-many-times-2.html#23833" class="Bound"
      >&#931;</a
      ><a name="23900"
      > </a
      ><a name="23901" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="23902"
      > </a
      ><a name="23903" href="2016-10-30-one-lambda-calculus-many-times-2.html#23824" class="Bound"
      >A</a
      ><a name="23904"
      >
    </a
      ><a name="23909" href="2016-10-30-one-lambda-calculus-many-times-2.html#23815" class="Function"
      >s&#8314;&#8242;</a
      ><a name="23912"
      > </a
      ><a name="23917" href="2016-10-30-one-lambda-calculus-many-times-2.html#23917" class="Bound"
      >&#915;</a
      ><a name="23918"
      > </a
      ><a name="23919" href="2016-10-30-one-lambda-calculus-many-times-2.html#23919" class="Bound"
      >&#931;</a
      ><a name="23920"
      > </a
      ><a name="23925" href="2016-10-30-one-lambda-calculus-many-times-2.html#23925" class="Bound"
      >f</a
      ><a name="23926"
      >
      </a
      ><a name="23933" class="Symbol"
      >=</a
      ><a name="23934"
      > </a
      ><a name="23935" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#705" class="Function"
      >subst</a
      ><a name="23940"
      > </a
      ><a name="23941" class="Symbol"
      >(&#955;</a
      ><a name="23943"
      > </a
      ><a name="23944" href="2016-10-30-one-lambda-calculus-many-times-2.html#23944" class="Bound"
      >&#931;</a
      ><a name="23945"
      > </a
      ><a name="23946" class="Symbol"
      >&#8594;</a
      ><a name="23947"
      > </a
      ><a name="23948" href="2016-10-30-one-lambda-calculus-many-times-2.html#6868" class="Datatype Operator"
      >NJ</a
      ><a name="23950"
      > </a
      ><a name="23951" class="Symbol"
      >(</a
      ><a name="23952" href="2016-10-30-one-lambda-calculus-many-times-2.html#23917" class="Bound"
      >&#915;</a
      ><a name="23953"
      > </a
      ><a name="23954" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23956"
      > </a
      ><a name="23957" href="2016-10-30-one-lambda-calculus-many-times-2.html#23922" class="Bound"
      >&#928;</a
      ><a name="23958" class="Symbol"
      >)</a
      ><a name="23959"
      > </a
      ><a name="23960" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23962"
      > </a
      ><a name="23963" href="2016-10-30-one-lambda-calculus-many-times-2.html#23944" class="Bound"
      >&#931;</a
      ><a name="23964"
      > </a
      ><a name="23965" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="23966"
      > </a
      ><a name="23967" href="2016-10-30-one-lambda-calculus-many-times-2.html#23914" class="Bound"
      >A</a
      ><a name="23968" class="Symbol"
      >)</a
      ><a name="23969"
      >      </a
      ><a name="23975" class="Symbol"
      >(</a
      ><a name="23976" href="2016-10-30-one-lambda-calculus-many-times-2.html#2036" class="Function"
      >++-identity&#691;</a
      ><a name="23988"
      > </a
      ><a name="23989" href="2016-10-30-one-lambda-calculus-many-times-2.html#23919" class="Bound"
      >&#931;</a
      ><a name="23990" class="Symbol"
      >)</a
      ><a name="23991"
      >
      </a
      ><a name="23998" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="23999"
      > </a
      ><a name="24000" href="2016-10-30-one-lambda-calculus-many-times-2.html#22480" class="Function"
      >p&#8314;&#8242;</a
      ><a name="24003"
      > </a
      ><a name="24004" href="2016-10-30-one-lambda-calculus-many-times-2.html#23917" class="Bound"
      >&#915;</a
      ><a name="24005"
      > </a
      ><a name="24006" href="2016-10-30-one-lambda-calculus-many-times-2.html#23919" class="Bound"
      >&#931;</a
      ><a name="24007"
      > </a
      ><a name="24008" href="2016-10-30-one-lambda-calculus-many-times-2.html#23922" class="Bound"
      >&#928;</a
      ><a name="24009"
      >
      </a
      ><a name="24016" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="24017"
      > </a
      ><a name="24018" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#705" class="Function"
      >subst</a
      ><a name="24023"
      > </a
      ><a name="24024" class="Symbol"
      >(&#955;</a
      ><a name="24026"
      > </a
      ><a name="24027" href="2016-10-30-one-lambda-calculus-many-times-2.html#24027" class="Bound"
      >&#928;</a
      ><a name="24028"
      > </a
      ><a name="24029" class="Symbol"
      >&#8594;</a
      ><a name="24030"
      > </a
      ><a name="24031" href="2016-10-30-one-lambda-calculus-many-times-2.html#6868" class="Datatype Operator"
      >NJ</a
      ><a name="24033"
      > </a
      ><a name="24034" class="Symbol"
      >(</a
      ><a name="24035" href="2016-10-30-one-lambda-calculus-many-times-2.html#23917" class="Bound"
      >&#915;</a
      ><a name="24036"
      > </a
      ><a name="24037" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="24039"
      > </a
      ><a name="24040" href="2016-10-30-one-lambda-calculus-many-times-2.html#23919" class="Bound"
      >&#931;</a
      ><a name="24041" class="Symbol"
      >)</a
      ><a name="24042"
      > </a
      ><a name="24043" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="24045"
      > </a
      ><a name="24046" href="2016-10-30-one-lambda-calculus-many-times-2.html#24027" class="Bound"
      >&#928;</a
      ><a name="24047"
      > </a
      ><a name="24048" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="24049"
      > </a
      ><a name="24050" href="2016-10-30-one-lambda-calculus-many-times-2.html#23914" class="Bound"
      >A</a
      ><a name="24051" class="Symbol"
      >)</a
      ><a name="24052"
      > </a
      ><a name="24053" class="Symbol"
      >(</a
      ><a name="24054" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#565" class="Function"
      >sym</a
      ><a name="24057"
      > </a
      ><a name="24058" class="Symbol"
      >(</a
      ><a name="24059" href="2016-10-30-one-lambda-calculus-many-times-2.html#2036" class="Function"
      >++-identity&#691;</a
      ><a name="24071"
      > </a
      ><a name="24072" href="2016-10-30-one-lambda-calculus-many-times-2.html#23922" class="Bound"
      >&#928;</a
      ><a name="24073" class="Symbol"
      >))</a
      ><a name="24075"
      >
      </a
      ><a name="24082" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="24083"
      > </a
      ><a name="24084" href="2016-10-30-one-lambda-calculus-many-times-2.html#23925" class="Bound"
      >f</a
      >
</pre><!--{% endraw %}-->
</div>

<!--{% raw %}--><pre class="Agda">
    <a name="24122" href="2016-10-30-one-lambda-calculus-many-times-2.html#24122" class="Function"
      >ax&#8242;</a
      ><a name="24125"
      > </a
      ><a name="24126" class="Symbol"
      >:</a
      ><a name="24127"
      > </a
      ><a name="24128" class="Symbol"
      >&#8704;</a
      ><a name="24129"
      > </a
      ><a name="24136" class="Symbol"
      >&#8594;</a
      ><a name="24137"
      > </a
      ><a name="24138" href="2016-10-30-one-lambda-calculus-many-times-2.html#24131" class="Bound"
      >A</a
      ><a name="24139"
      > </a
      ><a name="24140" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#2920" class="Function Operator"
      >&#8712;</a
      ><a name="24141"
      > </a
      ><a name="24142" href="2016-10-30-one-lambda-calculus-many-times-2.html#24133" class="Bound"
      >&#915;</a
      ><a name="24143"
      > </a
      ><a name="24144" class="Symbol"
      >&#8594;</a
      ><a name="24145"
      > </a
      ><a name="24146" href="2016-10-30-one-lambda-calculus-many-times-2.html#6868" class="Datatype Operator"
      >NJ</a
      ><a name="24148"
      > </a
      ><a name="24149" href="2016-10-30-one-lambda-calculus-many-times-2.html#24133" class="Bound"
      >&#915;</a
      ><a name="24150"
      > </a
      ><a name="24151" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="24152"
      > </a
      ><a name="24153" href="2016-10-30-one-lambda-calculus-many-times-2.html#24131" class="Bound"
      >A</a
      ><a name="24154"
      >
    </a
      ><a name="24159" href="2016-10-30-one-lambda-calculus-many-times-2.html#24122" class="Function"
      >ax&#8242;</a
      ><a name="24162"
      > </a
      ><a name="24175" class="Symbol"
      >(</a
      ><a name="24176" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="24180"
      > </a
      ><a name="24181" href="2016-10-30-one-lambda-calculus-many-times-2.html#24181" class="Bound"
      >px</a
      ><a name="24183" class="Symbol"
      >)</a
      ><a name="24184"
      > </a
      ><a name="24185" class="Keyword"
      >rewrite</a
      ><a name="24192"
      > </a
      ><a name="24193" href="2016-10-30-one-lambda-calculus-many-times-2.html#24181" class="Bound"
      >px</a
      ><a name="24195"
      > </a
      ><a name="24196" class="Symbol"
      >=</a
      ><a name="24197"
      > </a
      ><a name="24198" href="2016-10-30-one-lambda-calculus-many-times-2.html#23815" class="Function"
      >s&#8314;&#8242;</a
      ><a name="24201"
      > </a
      ><a name="24202" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="24204"
      > </a
      ><a name="24205" href="2016-10-30-one-lambda-calculus-many-times-2.html#24172" class="Bound"
      >&#915;</a
      ><a name="24206"
      > </a
      ><a name="24207" class="Symbol"
      >(</a
      ><a name="24208" href="2016-10-30-one-lambda-calculus-many-times-2.html#21283" class="Function"
      >w&#8314;&#8242;</a
      ><a name="24211"
      > </a
      ><a name="24212" href="2016-10-30-one-lambda-calculus-many-times-2.html#24172" class="Bound"
      >&#915;</a
      ><a name="24213"
      > </a
      ><a name="24214" href="2016-10-30-one-lambda-calculus-many-times-2.html#6898" class="InductiveConstructor"
      >ax</a
      ><a name="24216" class="Symbol"
      >)</a
      ><a name="24217"
      >
    </a
      ><a name="24222" href="2016-10-30-one-lambda-calculus-many-times-2.html#24122" class="Function"
      >ax&#8242;</a
      ><a name="24225"
      > </a
      ><a name="24238" class="Symbol"
      >(</a
      ><a name="24239" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="24244"
      > </a
      ><a name="24245" href="2016-10-30-one-lambda-calculus-many-times-2.html#24245" class="Bound"
      >x</a
      ><a name="24246" class="Symbol"
      >)</a
      ><a name="24247"
      >            </a
      ><a name="24259" class="Symbol"
      >=</a
      ><a name="24260"
      > </a
      ><a name="24261" href="2016-10-30-one-lambda-calculus-many-times-2.html#7055" class="InductiveConstructor"
      >w</a
      ><a name="24262"
      > </a
      ><a name="24263" class="Symbol"
      >(</a
      ><a name="24264" href="2016-10-30-one-lambda-calculus-many-times-2.html#24122" class="Function"
      >ax&#8242;</a
      ><a name="24267"
      > </a
      ><a name="24268" href="2016-10-30-one-lambda-calculus-many-times-2.html#24245" class="Bound"
      >x</a
      ><a name="24269" class="Symbol"
      >)</a
      >
</pre><!--{% endraw %}-->

It turns out to be very useful to define two helper functions which introduce and eliminate the empty context to the right. This is because <span class="Agda Spec"><a class="Bound">Γ</a> <a href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator" target="_blank">++</a> <a href="https://agda.github.io/agda-stdlib/Agda.Builtin.List.html#89" class="InductiveConstructor" target="_blank">[]</a></span> doesn't automatically reduce. Therefore, any proof in which the empty context occurs to the right would involve rewriting by <a class="Agda Spec Function">++&#8209;identityʳ</a>.

<!--{% raw %}--><pre class="Agda">
    <a name="24915" href="2016-10-30-one-lambda-calculus-many-times-2.html#24915" class="Function"
      >&#8709;i</a
      ><a name="24917"
      > </a
      ><a name="24918" class="Symbol"
      >:</a
      ><a name="24919"
      > </a
      ><a name="24920" class="Symbol"
      >&#8704;</a
      ><a name="24921"
      > </a
      ><a name="24928" class="Symbol"
      >&#8594;</a
      ><a name="24929"
      > </a
      ><a name="24930" href="2016-10-30-one-lambda-calculus-many-times-2.html#6868" class="Datatype Operator"
      >NJ</a
      ><a name="24932"
      > </a
      ><a name="24933" href="2016-10-30-one-lambda-calculus-many-times-2.html#24925" class="Bound"
      >&#915;</a
      ><a name="24934"
      > </a
      ><a name="24935" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="24936"
      > </a
      ><a name="24937" href="2016-10-30-one-lambda-calculus-many-times-2.html#24923" class="Bound"
      >A</a
      ><a name="24938"
      > </a
      ><a name="24939" class="Symbol"
      >&#8594;</a
      ><a name="24940"
      > </a
      ><a name="24941" href="2016-10-30-one-lambda-calculus-many-times-2.html#6868" class="Datatype Operator"
      >NJ</a
      ><a name="24943"
      > </a
      ><a name="24944" href="2016-10-30-one-lambda-calculus-many-times-2.html#24925" class="Bound"
      >&#915;</a
      ><a name="24945"
      > </a
      ><a name="24946" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="24948"
      > </a
      ><a name="24949" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="24951"
      > </a
      ><a name="24952" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="24953"
      > </a
      ><a name="24954" href="2016-10-30-one-lambda-calculus-many-times-2.html#24923" class="Bound"
      >A</a
      ><a name="24955"
      >
    </a
      ><a name="24960" href="2016-10-30-one-lambda-calculus-many-times-2.html#24915" class="Function"
      >&#8709;i</a
      ><a name="24962"
      > </a
      ><a name="24971" href="2016-10-30-one-lambda-calculus-many-times-2.html#24971" class="Bound"
      >f</a
      ><a name="24972"
      > </a
      ><a name="24973" class="Keyword"
      >rewrite</a
      ><a name="24980"
      > </a
      ><a name="24981" href="2016-10-30-one-lambda-calculus-many-times-2.html#2036" class="Function"
      >++-identity&#691;</a
      ><a name="24993"
      > </a
      ><a name="24994" href="2016-10-30-one-lambda-calculus-many-times-2.html#24968" class="Bound"
      >&#915;</a
      ><a name="24995"
      > </a
      ><a name="24996" class="Symbol"
      >=</a
      ><a name="24997"
      > </a
      ><a name="24998" href="2016-10-30-one-lambda-calculus-many-times-2.html#24971" class="Bound"
      >f</a
      ><a name="24999"
      >
    </a
      ><a name="25004" href="2016-10-30-one-lambda-calculus-many-times-2.html#25004" class="Function"
      >&#8709;e</a
      ><a name="25006"
      > </a
      ><a name="25007" class="Symbol"
      >:</a
      ><a name="25008"
      > </a
      ><a name="25009" class="Symbol"
      >&#8704;</a
      ><a name="25010"
      > </a
      ><a name="25017" class="Symbol"
      >&#8594;</a
      ><a name="25018"
      > </a
      ><a name="25019" href="2016-10-30-one-lambda-calculus-many-times-2.html#6868" class="Datatype Operator"
      >NJ</a
      ><a name="25021"
      > </a
      ><a name="25022" href="2016-10-30-one-lambda-calculus-many-times-2.html#25014" class="Bound"
      >&#915;</a
      ><a name="25023"
      > </a
      ><a name="25024" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="25026"
      > </a
      ><a name="25027" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="25029"
      > </a
      ><a name="25030" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="25031"
      > </a
      ><a name="25032" href="2016-10-30-one-lambda-calculus-many-times-2.html#25012" class="Bound"
      >A</a
      ><a name="25033"
      > </a
      ><a name="25034" class="Symbol"
      >&#8594;</a
      ><a name="25035"
      > </a
      ><a name="25036" href="2016-10-30-one-lambda-calculus-many-times-2.html#6868" class="Datatype Operator"
      >NJ</a
      ><a name="25038"
      > </a
      ><a name="25039" href="2016-10-30-one-lambda-calculus-many-times-2.html#25014" class="Bound"
      >&#915;</a
      ><a name="25040"
      > </a
      ><a name="25041" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="25042"
      > </a
      ><a name="25043" href="2016-10-30-one-lambda-calculus-many-times-2.html#25012" class="Bound"
      >A</a
      ><a name="25044"
      >
    </a
      ><a name="25049" href="2016-10-30-one-lambda-calculus-many-times-2.html#25004" class="Function"
      >&#8709;e</a
      ><a name="25051"
      > </a
      ><a name="25060" href="2016-10-30-one-lambda-calculus-many-times-2.html#25060" class="Bound"
      >f</a
      ><a name="25061"
      > </a
      ><a name="25062" class="Keyword"
      >rewrite</a
      ><a name="25069"
      > </a
      ><a name="25070" href="2016-10-30-one-lambda-calculus-many-times-2.html#2036" class="Function"
      >++-identity&#691;</a
      ><a name="25082"
      > </a
      ><a name="25083" href="2016-10-30-one-lambda-calculus-many-times-2.html#25057" class="Bound"
      >&#915;</a
      ><a name="25084"
      > </a
      ><a name="25085" class="Symbol"
      >=</a
      ><a name="25086"
      > </a
      ><a name="25087" href="2016-10-30-one-lambda-calculus-many-times-2.html#25060" class="Bound"
      >f</a
      >
</pre><!--{% endraw %}-->



### Implicit and Explicit Structural Rules

<!--{% raw %}--><pre class="Agda">
  <a name="25162" class="Keyword"
      >module</a
      ><a name="25168"
      > </a
      ><a name="25169" href="2016-10-30-one-lambda-calculus-many-times-2.html#25169" class="Module"
      >NJ&#8660;ND</a
      ><a name="25174"
      > </a
      ><a name="25175" class="Keyword"
      >where</a
      ><a name="25180"
      >

    </a
      ><a name="25186" href="2016-10-30-one-lambda-calculus-many-times-2.html#25186" class="Function"
      >&#10233;</a
      ><a name="25187"
      > </a
      ><a name="25188" class="Symbol"
      >:</a
      ><a name="25189"
      > </a
      ><a name="25190" class="Symbol"
      >&#8704;</a
      ><a name="25191"
      > </a
      ><a name="25196" class="Symbol"
      >&#8594;</a
      ><a name="25197"
      > </a
      ><a name="25198" href="2016-10-30-one-lambda-calculus-many-times-2.html#6868" class="Datatype Operator"
      >NJ</a
      ><a name="25200"
      > </a
      ><a name="25201" href="2016-10-30-one-lambda-calculus-many-times-2.html#25193" class="Bound"
      >S</a
      ><a name="25202"
      > </a
      ><a name="25203" class="Symbol"
      >&#8594;</a
      ><a name="25204"
      > </a
      ><a name="25205" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="25207"
      > </a
      ><a name="25208" href="2016-10-30-one-lambda-calculus-many-times-2.html#25193" class="Bound"
      >S</a
      ><a name="25209"
      >
    </a
      ><a name="25214" href="2016-10-30-one-lambda-calculus-many-times-2.html#25186" class="Function"
      >&#10233;</a
      ><a name="25215"
      >  </a
      ><a name="25217" href="2016-10-30-one-lambda-calculus-many-times-2.html#6898" class="InductiveConstructor"
      >ax</a
      ><a name="25219"
      >         </a
      ><a name="25228" class="Symbol"
      >=</a
      ><a name="25229"
      > </a
      ><a name="25230" href="2016-03-20-one-lambda-calculus-many-times.html#10228" class="InductiveConstructor"
      >ax&#8320;</a
      ><a name="25233"
      >
    </a
      ><a name="25238" href="2016-10-30-one-lambda-calculus-many-times-2.html#25186" class="Function"
      >&#10233;</a
      ><a name="25239"
      > </a
      ><a name="25240" class="Symbol"
      >(</a
      ><a name="25241" href="2016-10-30-one-lambda-calculus-many-times-2.html#6937" class="InductiveConstructor"
      >&#8658;i</a
      ><a name="25243"
      > </a
      ><a name="25244" href="2016-10-30-one-lambda-calculus-many-times-2.html#25244" class="Bound"
      >f</a
      ><a name="25245"
      >  </a
      ><a name="25247" class="Symbol"
      >)</a
      ><a name="25248"
      >    </a
      ><a name="25252" class="Symbol"
      >=</a
      ><a name="25253"
      > </a
      ><a name="25254" href="2016-03-20-one-lambda-calculus-many-times.html#5441" class="InductiveConstructor"
      >&#8658;i</a
      ><a name="25256"
      > </a
      ><a name="25257" class="Symbol"
      >(</a
      ><a name="25258" href="2016-10-30-one-lambda-calculus-many-times-2.html#25186" class="Function"
      >&#10233;</a
      ><a name="25259"
      > </a
      ><a name="25260" href="2016-10-30-one-lambda-calculus-many-times-2.html#25244" class="Bound"
      >f</a
      ><a name="25261" class="Symbol"
      >)</a
      ><a name="25262"
      >
    </a
      ><a name="25267" href="2016-10-30-one-lambda-calculus-many-times-2.html#25186" class="Function"
      >&#10233;</a
      ><a name="25268"
      > </a
      ><a name="25269" class="Symbol"
      >(</a
      ><a name="25270" href="2016-10-30-one-lambda-calculus-many-times-2.html#6990" class="InductiveConstructor"
      >&#8658;e</a
      ><a name="25272"
      > </a
      ><a name="25273" class="Symbol"
      >{</a
      ><a name="25274" class="Argument"
      >&#915;</a
      ><a name="25275"
      > </a
      ><a name="25276" class="Symbol"
      >=</a
      ><a name="25277"
      > </a
      ><a name="25278" href="2016-10-30-one-lambda-calculus-many-times-2.html#25278" class="Bound"
      >&#915;</a
      ><a name="25279" class="Symbol"
      >}</a
      ><a name="25280"
      > </a
      ><a name="25281" href="2016-10-30-one-lambda-calculus-many-times-2.html#25281" class="Bound"
      >f</a
      ><a name="25282"
      > </a
      ><a name="25283" href="2016-10-30-one-lambda-calculus-many-times-2.html#25283" class="Bound"
      >g</a
      ><a name="25284" class="Symbol"
      >)</a
      ><a name="25285"
      >    </a
      ><a name="25289" class="Symbol"
      >=</a
      ><a name="25290"
      > </a
      ><a name="25291" href="2016-03-20-one-lambda-calculus-many-times.html#5490" class="InductiveConstructor"
      >&#8658;e</a
      ><a name="25293"
      > </a
      ><a name="25294" class="Symbol"
      >(</a
      ><a name="25295" href="2016-10-30-one-lambda-calculus-many-times-2.html#25338" class="Function"
      >inl</a
      ><a name="25298"
      > </a
      ><a name="25299" class="Symbol"
      >(</a
      ><a name="25300" href="2016-10-30-one-lambda-calculus-many-times-2.html#25186" class="Function"
      >&#10233;</a
      ><a name="25301"
      > </a
      ><a name="25302" href="2016-10-30-one-lambda-calculus-many-times-2.html#25281" class="Bound"
      >f</a
      ><a name="25303" class="Symbol"
      >))</a
      ><a name="25305"
      > </a
      ><a name="25306" class="Symbol"
      >(</a
      ><a name="25307" href="2016-10-30-one-lambda-calculus-many-times-2.html#25436" class="Function"
      >inr</a
      ><a name="25310"
      > </a
      ><a name="25311" class="Symbol"
      >(</a
      ><a name="25312" href="2016-10-30-one-lambda-calculus-many-times-2.html#25186" class="Function"
      >&#10233;</a
      ><a name="25313"
      > </a
      ><a name="25314" href="2016-10-30-one-lambda-calculus-many-times-2.html#25283" class="Bound"
      >g</a
      ><a name="25315" class="Symbol"
      >))</a
      ><a name="25317"
      >
      </a
      ><a name="25324" class="Keyword"
      >where</a
      ><a name="25329"
      >
        </a
      ><a name="25338" href="2016-10-30-one-lambda-calculus-many-times-2.html#25338" class="Function"
      >inl</a
      ><a name="25341"
      > </a
      ><a name="25342" class="Symbol"
      >:</a
      ><a name="25343"
      > </a
      ><a name="25344" class="Symbol"
      >&#8704;</a
      ><a name="25345"
      > </a
      ><a name="25352" class="Symbol"
      >&#8594;</a
      ><a name="25353"
      > </a
      ><a name="25354" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="25356"
      > </a
      ><a name="25357" href="2016-10-30-one-lambda-calculus-many-times-2.html#25278" class="Bound"
      >&#915;</a
      ><a name="25358"
      > </a
      ><a name="25359" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="25360"
      > </a
      ><a name="25361" href="2016-10-30-one-lambda-calculus-many-times-2.html#25347" class="Bound"
      >A</a
      ><a name="25362"
      > </a
      ><a name="25363" class="Symbol"
      >&#8594;</a
      ><a name="25364"
      > </a
      ><a name="25365" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="25367"
      > </a
      ><a name="25368" href="2016-10-30-one-lambda-calculus-many-times-2.html#25278" class="Bound"
      >&#915;</a
      ><a name="25369"
      > </a
      ><a name="25370" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="25372"
      > </a
      ><a name="25373" href="2016-10-30-one-lambda-calculus-many-times-2.html#25349" class="Bound"
      >&#916;</a
      ><a name="25374"
      > </a
      ><a name="25375" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="25376"
      > </a
      ><a name="25377" href="2016-10-30-one-lambda-calculus-many-times-2.html#25347" class="Bound"
      >A</a
      ><a name="25378"
      >
        </a
      ><a name="25387" href="2016-10-30-one-lambda-calculus-many-times-2.html#25338" class="Function"
      >inl</a
      ><a name="25390"
      > </a
      ><a name="25391" class="Symbol"
      >{</a
      ><a name="25392" class="Argument"
      >&#916;</a
      ><a name="25393"
      > </a
      ><a name="25394" class="Symbol"
      >=</a
      ><a name="25395"
      > </a
      ><a name="25396" href="2016-10-30-one-lambda-calculus-many-times-2.html#25396" class="Bound"
      >&#916;</a
      ><a name="25397" class="Symbol"
      >}</a
      ><a name="25398"
      > </a
      ><a name="25399" href="2016-10-30-one-lambda-calculus-many-times-2.html#25399" class="Bound"
      >f</a
      ><a name="25400"
      > </a
      ><a name="25401" class="Symbol"
      >=</a
      ><a name="25402"
      > </a
      ><a name="25403" href="2016-10-30-one-lambda-calculus-many-times-2.html#20746" class="Function"
      >ND.s&#8314;&#8242;</a
      ><a name="25409"
      > </a
      ><a name="25410" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="25412"
      > </a
      ><a name="25413" href="2016-10-30-one-lambda-calculus-many-times-2.html#25396" class="Bound"
      >&#916;</a
      ><a name="25414"
      > </a
      ><a name="25415" class="Symbol"
      >(</a
      ><a name="25416" href="2016-10-30-one-lambda-calculus-many-times-2.html#20351" class="Function"
      >ND.w&#8314;&#8242;</a
      ><a name="25422"
      > </a
      ><a name="25423" href="2016-10-30-one-lambda-calculus-many-times-2.html#25396" class="Bound"
      >&#916;</a
      ><a name="25424"
      > </a
      ><a name="25425" href="2016-10-30-one-lambda-calculus-many-times-2.html#25399" class="Bound"
      >f</a
      ><a name="25426" class="Symbol"
      >)</a
      ><a name="25427"
      >
        </a
      ><a name="25436" href="2016-10-30-one-lambda-calculus-many-times-2.html#25436" class="Function"
      >inr</a
      ><a name="25439"
      > </a
      ><a name="25440" class="Symbol"
      >:</a
      ><a name="25441"
      > </a
      ><a name="25442" class="Symbol"
      >&#8704;</a
      ><a name="25443"
      > </a
      ><a name="25450" class="Symbol"
      >&#8594;</a
      ><a name="25451"
      > </a
      ><a name="25452" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="25454"
      > </a
      ><a name="25455" href="2016-10-30-one-lambda-calculus-many-times-2.html#25447" class="Bound"
      >&#916;</a
      ><a name="25456"
      > </a
      ><a name="25457" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="25458"
      > </a
      ><a name="25459" href="2016-10-30-one-lambda-calculus-many-times-2.html#25445" class="Bound"
      >A</a
      ><a name="25460"
      > </a
      ><a name="25461" class="Symbol"
      >&#8594;</a
      ><a name="25462"
      > </a
      ><a name="25463" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="25465"
      > </a
      ><a name="25466" href="2016-10-30-one-lambda-calculus-many-times-2.html#25278" class="Bound"
      >&#915;</a
      ><a name="25467"
      > </a
      ><a name="25468" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="25470"
      > </a
      ><a name="25471" href="2016-10-30-one-lambda-calculus-many-times-2.html#25447" class="Bound"
      >&#916;</a
      ><a name="25472"
      > </a
      ><a name="25473" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="25474"
      > </a
      ><a name="25475" href="2016-10-30-one-lambda-calculus-many-times-2.html#25445" class="Bound"
      >A</a
      ><a name="25476"
      >
        </a
      ><a name="25485" href="2016-10-30-one-lambda-calculus-many-times-2.html#25436" class="Function"
      >inr</a
      ><a name="25488"
      > </a
      ><a name="25489" href="2016-10-30-one-lambda-calculus-many-times-2.html#25489" class="Bound"
      >f</a
      ><a name="25490"
      > </a
      ><a name="25491" class="Symbol"
      >=</a
      ><a name="25492"
      > </a
      ><a name="25493" href="2016-10-30-one-lambda-calculus-many-times-2.html#20351" class="Function"
      >ND.w&#8314;&#8242;</a
      ><a name="25499"
      > </a
      ><a name="25500" href="2016-10-30-one-lambda-calculus-many-times-2.html#25278" class="Bound"
      >&#915;</a
      ><a name="25501"
      > </a
      ><a name="25502" href="2016-10-30-one-lambda-calculus-many-times-2.html#25489" class="Bound"
      >f</a
      ><a name="25503"
      >

    </a
      ><a name="25509" href="2016-10-30-one-lambda-calculus-many-times-2.html#25186" class="Function"
      >&#10233;</a
      ><a name="25510"
      > </a
      ><a name="25511" class="Symbol"
      >(</a
      ><a name="25512" href="2016-10-30-one-lambda-calculus-many-times-2.html#7055" class="InductiveConstructor"
      >w</a
      ><a name="25513"
      >    </a
      ><a name="25517" href="2016-10-30-one-lambda-calculus-many-times-2.html#25517" class="Bound"
      >f</a
      ><a name="25518" class="Symbol"
      >)</a
      ><a name="25519"
      >    </a
      ><a name="25523" class="Symbol"
      >=</a
      ><a name="25524"
      > </a
      ><a name="25525" href="2016-03-20-one-lambda-calculus-many-times.html#8605" class="Function"
      >ND.w&#8242;</a
      ><a name="25530"
      >   </a
      ><a name="25533" class="Symbol"
      >(</a
      ><a name="25534" href="2016-10-30-one-lambda-calculus-many-times-2.html#25186" class="Function"
      >&#10233;</a
      ><a name="25535"
      > </a
      ><a name="25536" href="2016-10-30-one-lambda-calculus-many-times-2.html#25517" class="Bound"
      >f</a
      ><a name="25537" class="Symbol"
      >)</a
      ><a name="25538"
      >
    </a
      ><a name="25543" href="2016-10-30-one-lambda-calculus-many-times-2.html#25186" class="Function"
      >&#10233;</a
      ><a name="25544"
      > </a
      ><a name="25545" class="Symbol"
      >(</a
      ><a name="25546" href="2016-10-30-one-lambda-calculus-many-times-2.html#7104" class="InductiveConstructor"
      >c</a
      ><a name="25547"
      >    </a
      ><a name="25551" href="2016-10-30-one-lambda-calculus-many-times-2.html#25551" class="Bound"
      >f</a
      ><a name="25552" class="Symbol"
      >)</a
      ><a name="25553"
      >    </a
      ><a name="25557" class="Symbol"
      >=</a
      ><a name="25558"
      > </a
      ><a name="25559" href="2016-10-30-one-lambda-calculus-many-times-2.html#12163" class="Function"
      >ND.c&#8242;</a
      ><a name="25564"
      >   </a
      ><a name="25567" class="Symbol"
      >(</a
      ><a name="25568" href="2016-10-30-one-lambda-calculus-many-times-2.html#25186" class="Function"
      >&#10233;</a
      ><a name="25569"
      > </a
      ><a name="25570" href="2016-10-30-one-lambda-calculus-many-times-2.html#25551" class="Bound"
      >f</a
      ><a name="25571" class="Symbol"
      >)</a
      ><a name="25572"
      >
    </a
      ><a name="25577" href="2016-10-30-one-lambda-calculus-many-times-2.html#25186" class="Function"
      >&#10233;</a
      ><a name="25578"
      > </a
      ><a name="25579" class="Symbol"
      >(</a
      ><a name="25580" href="2016-10-30-one-lambda-calculus-many-times-2.html#7161" class="InductiveConstructor"
      >p</a
      ><a name="25581"
      >  </a
      ><a name="25583" href="2016-10-30-one-lambda-calculus-many-times-2.html#25583" class="Bound"
      >&#915;</a
      ><a name="25584"
      > </a
      ><a name="25585" href="2016-10-30-one-lambda-calculus-many-times-2.html#25585" class="Bound"
      >f</a
      ><a name="25586" class="Symbol"
      >)</a
      ><a name="25587"
      >    </a
      ><a name="25591" class="Symbol"
      >=</a
      ><a name="25592"
      > </a
      ><a name="25593" href="2016-10-30-one-lambda-calculus-many-times-2.html#12548" class="Function"
      >ND.p&#8242;</a
      ><a name="25598"
      > </a
      ><a name="25599" href="2016-10-30-one-lambda-calculus-many-times-2.html#25583" class="Bound"
      >&#915;</a
      ><a name="25600"
      > </a
      ><a name="25601" class="Symbol"
      >(</a
      ><a name="25602" href="2016-10-30-one-lambda-calculus-many-times-2.html#25186" class="Function"
      >&#10233;</a
      ><a name="25603"
      > </a
      ><a name="25604" href="2016-10-30-one-lambda-calculus-many-times-2.html#25585" class="Bound"
      >f</a
      ><a name="25605" class="Symbol"
      >)</a
      ><a name="25606"
      >

    </a
      ><a name="25612" href="2016-10-30-one-lambda-calculus-many-times-2.html#25612" class="Function"
      >&#10232;</a
      ><a name="25613"
      > </a
      ><a name="25614" class="Symbol"
      >:</a
      ><a name="25615"
      > </a
      ><a name="25616" class="Symbol"
      >&#8704;</a
      ><a name="25617"
      > </a
      ><a name="25622" class="Symbol"
      >&#8594;</a
      ><a name="25623"
      > </a
      ><a name="25624" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="25626"
      > </a
      ><a name="25627" href="2016-10-30-one-lambda-calculus-many-times-2.html#25619" class="Bound"
      >S</a
      ><a name="25628"
      > </a
      ><a name="25629" class="Symbol"
      >&#8594;</a
      ><a name="25630"
      > </a
      ><a name="25631" href="2016-10-30-one-lambda-calculus-many-times-2.html#6868" class="Datatype Operator"
      >NJ</a
      ><a name="25633"
      > </a
      ><a name="25634" href="2016-10-30-one-lambda-calculus-many-times-2.html#25619" class="Bound"
      >S</a
      ><a name="25635"
      >
    </a
      ><a name="25640" href="2016-10-30-one-lambda-calculus-many-times-2.html#25612" class="Function"
      >&#10232;</a
      ><a name="25641"
      > </a
      ><a name="25642" class="Symbol"
      >(</a
      ><a name="25643" href="2016-03-20-one-lambda-calculus-many-times.html#5403" class="InductiveConstructor"
      >ax</a
      ><a name="25645"
      >  </a
      ><a name="25647" href="2016-10-30-one-lambda-calculus-many-times-2.html#25647" class="Bound"
      >x</a
      ><a name="25648" class="Symbol"
      >)</a
      ><a name="25649"
      >     </a
      ><a name="25654" class="Symbol"
      >=</a
      ><a name="25655"
      > </a
      ><a name="25656" href="2016-10-30-one-lambda-calculus-many-times-2.html#24122" class="Function"
      >NJ.ax&#8242;</a
      ><a name="25662"
      > </a
      ><a name="25663" href="2016-10-30-one-lambda-calculus-many-times-2.html#25647" class="Bound"
      >x</a
      ><a name="25664"
      >
    </a
      ><a name="25669" href="2016-10-30-one-lambda-calculus-many-times-2.html#25612" class="Function"
      >&#10232;</a
      ><a name="25670"
      > </a
      ><a name="25671" class="Symbol"
      >(</a
      ><a name="25672" href="2016-03-20-one-lambda-calculus-many-times.html#5441" class="InductiveConstructor"
      >&#8658;i</a
      ><a name="25674"
      >  </a
      ><a name="25676" href="2016-10-30-one-lambda-calculus-many-times-2.html#25676" class="Bound"
      >f</a
      ><a name="25677" class="Symbol"
      >)</a
      ><a name="25678"
      >     </a
      ><a name="25683" class="Symbol"
      >=</a
      ><a name="25684"
      > </a
      ><a name="25685" href="2016-10-30-one-lambda-calculus-many-times-2.html#6937" class="InductiveConstructor"
      >&#8658;i</a
      ><a name="25687"
      >  </a
      ><a name="25689" class="Symbol"
      >(</a
      ><a name="25690" href="2016-10-30-one-lambda-calculus-many-times-2.html#25612" class="Function"
      >&#10232;</a
      ><a name="25691"
      > </a
      ><a name="25692" href="2016-10-30-one-lambda-calculus-many-times-2.html#25676" class="Bound"
      >f</a
      ><a name="25693" class="Symbol"
      >)</a
      ><a name="25694"
      >
    </a
      ><a name="25699" href="2016-10-30-one-lambda-calculus-many-times-2.html#25612" class="Function"
      >&#10232;</a
      ><a name="25700"
      > </a
      ><a name="25701" class="Symbol"
      >(</a
      ><a name="25702" href="2016-03-20-one-lambda-calculus-many-times.html#5490" class="InductiveConstructor"
      >&#8658;e</a
      ><a name="25704"
      >  </a
      ><a name="25706" class="Symbol"
      >{</a
      ><a name="25707" class="Argument"
      >&#915;</a
      ><a name="25708"
      > </a
      ><a name="25709" class="Symbol"
      >=</a
      ><a name="25710"
      > </a
      ><a name="25711" href="2016-10-30-one-lambda-calculus-many-times-2.html#25711" class="Bound"
      >&#915;</a
      ><a name="25712" class="Symbol"
      >}</a
      ><a name="25713"
      > </a
      ><a name="25714" href="2016-10-30-one-lambda-calculus-many-times-2.html#25714" class="Bound"
      >f</a
      ><a name="25715"
      > </a
      ><a name="25716" href="2016-10-30-one-lambda-calculus-many-times-2.html#25716" class="Bound"
      >g</a
      ><a name="25717" class="Symbol"
      >)</a
      ><a name="25718"
      >   </a
      ><a name="25721" class="Symbol"
      >=</a
      ><a name="25722"
      > </a
      ><a name="25723" href="2016-10-30-one-lambda-calculus-many-times-2.html#25004" class="Function"
      >NJ.&#8709;e</a
      ><a name="25728"
      > </a
      ><a name="25729" class="Symbol"
      >(</a
      ><a name="25730" href="2016-10-30-one-lambda-calculus-many-times-2.html#23259" class="Function"
      >NJ.c&#8314;&#8242;</a
      ><a name="25736"
      > </a
      ><a name="25737" href="2016-10-30-one-lambda-calculus-many-times-2.html#25711" class="Bound"
      >&#915;</a
      ><a name="25738"
      > </a
      ><a name="25739" class="Symbol"
      >(</a
      ><a name="25740" href="2016-10-30-one-lambda-calculus-many-times-2.html#24915" class="Function"
      >NJ.&#8709;i</a
      ><a name="25745"
      > </a
      ><a name="25746" class="Symbol"
      >(</a
      ><a name="25747" href="2016-10-30-one-lambda-calculus-many-times-2.html#6990" class="InductiveConstructor"
      >&#8658;e</a
      ><a name="25749"
      > </a
      ><a name="25750" class="Symbol"
      >(</a
      ><a name="25751" href="2016-10-30-one-lambda-calculus-many-times-2.html#25612" class="Function"
      >&#10232;</a
      ><a name="25752"
      > </a
      ><a name="25753" href="2016-10-30-one-lambda-calculus-many-times-2.html#25714" class="Bound"
      >f</a
      ><a name="25754" class="Symbol"
      >)</a
      ><a name="25755"
      > </a
      ><a name="25756" class="Symbol"
      >(</a
      ><a name="25757" href="2016-10-30-one-lambda-calculus-many-times-2.html#25612" class="Function"
      >&#10232;</a
      ><a name="25758"
      > </a
      ><a name="25759" href="2016-10-30-one-lambda-calculus-many-times-2.html#25716" class="Bound"
      >g</a
      ><a name="25760" class="Symbol"
      >))))</a
      >
</pre><!--{% endraw %}-->


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

<!--{% raw %}--><pre class="Agda">
  <a name="26468" class="Keyword"
      >infix</a
      ><a name="26473"
      > </a
      ><a name="26474" class="Number"
      >3</a
      ><a name="26475"
      > LJ_

  </a
      ><a name="26483" class="Keyword"
      >data</a
      ><a name="26487"
      > </a
      ><a name="26488" href="2016-10-30-one-lambda-calculus-many-times-2.html#26488" class="Datatype Operator"
      >LJ_</a
      ><a name="26491"
      > </a
      ><a name="26492" class="Symbol"
      >:</a
      ><a name="26493"
      > </a
      ><a name="26494" href="2016-03-20-one-lambda-calculus-many-times.html#3957" class="Datatype"
      >Sequent</a
      ><a name="26501"
      > </a
      ><a name="26502" class="Symbol"
      >&#8594;</a
      ><a name="26503"
      > </a
      ><a name="26504" class="PrimitiveType"
      >Set</a
      ><a name="26507"
      > </a
      ><a name="26508" class="Keyword"
      >where</a
      ><a name="26513"
      >
    </a
      ><a name="26518" href="2016-10-30-one-lambda-calculus-many-times-2.html#26518" class="InductiveConstructor"
      >ax</a
      ><a name="26520"
      >  </a
      ><a name="26522" class="Symbol"
      >:</a
      ><a name="26523"
      > </a
      ><a name="26524" class="Symbol"
      >&#8704;</a
      ><a name="26525"
      > </a
      ><a name="26538" class="Symbol"
      >&#8594;</a
      ><a name="26539"
      > </a
      ><a name="26540" href="2016-10-30-one-lambda-calculus-many-times-2.html#26488" class="Datatype Operator"
      >LJ</a
      ><a name="26542"
      > </a
      ><a name="26543" href="2016-10-30-one-lambda-calculus-many-times-2.html#26527" class="Bound"
      >A</a
      ><a name="26544"
      > </a
      ><a name="26545" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="26546"
      > </a
      ><a name="26547" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="26549"
      > </a
      ><a name="26550" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26551"
      > </a
      ><a name="26552" href="2016-10-30-one-lambda-calculus-many-times-2.html#26527" class="Bound"
      >A</a
      ><a name="26553"
      >
    </a
      ><a name="26558" href="2016-10-30-one-lambda-calculus-many-times-2.html#26558" class="InductiveConstructor"
      >cut</a
      ><a name="26561"
      > </a
      ><a name="26562" class="Symbol"
      >:</a
      ><a name="26563"
      > </a
      ><a name="26564" class="Symbol"
      >&#8704;</a
      ><a name="26565"
      > </a
      ><a name="26578" class="Symbol"
      >&#8594;</a
      ><a name="26579"
      > </a
      ><a name="26580" href="2016-10-30-one-lambda-calculus-many-times-2.html#26488" class="Datatype Operator"
      >LJ</a
      ><a name="26582"
      > </a
      ><a name="26583" href="2016-10-30-one-lambda-calculus-many-times-2.html#26573" class="Bound"
      >&#915;</a
      ><a name="26584"
      > </a
      ><a name="26585" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26586"
      > </a
      ><a name="26587" href="2016-10-30-one-lambda-calculus-many-times-2.html#26567" class="Bound"
      >A</a
      ><a name="26588"
      > </a
      ><a name="26589" class="Symbol"
      >&#8594;</a
      ><a name="26590"
      > </a
      ><a name="26591" href="2016-10-30-one-lambda-calculus-many-times-2.html#26488" class="Datatype Operator"
      >LJ</a
      ><a name="26593"
      > </a
      ><a name="26594" href="2016-10-30-one-lambda-calculus-many-times-2.html#26567" class="Bound"
      >A</a
      ><a name="26595"
      > </a
      ><a name="26596" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="26597"
      > </a
      ><a name="26598" href="2016-10-30-one-lambda-calculus-many-times-2.html#26575" class="Bound"
      >&#916;</a
      ><a name="26599"
      > </a
      ><a name="26600" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26601"
      > </a
      ><a name="26602" href="2016-10-30-one-lambda-calculus-many-times-2.html#26569" class="Bound"
      >B</a
      ><a name="26603"
      > </a
      ><a name="26604" class="Symbol"
      >&#8594;</a
      ><a name="26605"
      > </a
      ><a name="26606" href="2016-10-30-one-lambda-calculus-many-times-2.html#26488" class="Datatype Operator"
      >LJ</a
      ><a name="26608"
      > </a
      ><a name="26609" href="2016-10-30-one-lambda-calculus-many-times-2.html#26573" class="Bound"
      >&#915;</a
      ><a name="26610"
      > </a
      ><a name="26611" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="26613"
      > </a
      ><a name="26614" href="2016-10-30-one-lambda-calculus-many-times-2.html#26575" class="Bound"
      >&#916;</a
      ><a name="26615"
      > </a
      ><a name="26616" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26617"
      > </a
      ><a name="26618" href="2016-10-30-one-lambda-calculus-many-times-2.html#26569" class="Bound"
      >B</a
      ><a name="26619"
      >
    </a
      ><a name="26624" href="2016-10-30-one-lambda-calculus-many-times-2.html#26624" class="InductiveConstructor"
      >&#8658;l</a
      ><a name="26626"
      >  </a
      ><a name="26628" class="Symbol"
      >:</a
      ><a name="26629"
      > </a
      ><a name="26630" class="Symbol"
      >&#8704;</a
      ><a name="26631"
      > </a
      ><a name="26644" class="Symbol"
      >&#8594;</a
      ><a name="26645"
      > </a
      ><a name="26646" href="2016-10-30-one-lambda-calculus-many-times-2.html#26488" class="Datatype Operator"
      >LJ</a
      ><a name="26648"
      > </a
      ><a name="26649" href="2016-10-30-one-lambda-calculus-many-times-2.html#26639" class="Bound"
      >&#915;</a
      ><a name="26650"
      > </a
      ><a name="26651" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26652"
      > </a
      ><a name="26653" href="2016-10-30-one-lambda-calculus-many-times-2.html#26633" class="Bound"
      >A</a
      ><a name="26654"
      > </a
      ><a name="26655" class="Symbol"
      >&#8594;</a
      ><a name="26656"
      > </a
      ><a name="26657" href="2016-10-30-one-lambda-calculus-many-times-2.html#26488" class="Datatype Operator"
      >LJ</a
      ><a name="26659"
      > </a
      ><a name="26660" href="2016-10-30-one-lambda-calculus-many-times-2.html#26635" class="Bound"
      >B</a
      ><a name="26661"
      > </a
      ><a name="26662" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="26663"
      > </a
      ><a name="26664" href="2016-10-30-one-lambda-calculus-many-times-2.html#26641" class="Bound"
      >&#916;</a
      ><a name="26665"
      > </a
      ><a name="26666" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26667"
      > </a
      ><a name="26668" href="2016-10-30-one-lambda-calculus-many-times-2.html#26637" class="Bound"
      >C</a
      ><a name="26669"
      > </a
      ><a name="26670" class="Symbol"
      >&#8594;</a
      ><a name="26671"
      > </a
      ><a name="26672" href="2016-10-30-one-lambda-calculus-many-times-2.html#26488" class="Datatype Operator"
      >LJ</a
      ><a name="26674"
      > </a
      ><a name="26675" href="2016-10-30-one-lambda-calculus-many-times-2.html#26633" class="Bound"
      >A</a
      ><a name="26676"
      > </a
      ><a name="26677" href="2016-03-20-one-lambda-calculus-many-times.html#2694" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="26678"
      > </a
      ><a name="26679" href="2016-10-30-one-lambda-calculus-many-times-2.html#26635" class="Bound"
      >B</a
      ><a name="26680"
      > </a
      ><a name="26681" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="26682"
      > </a
      ><a name="26683" href="2016-10-30-one-lambda-calculus-many-times-2.html#26639" class="Bound"
      >&#915;</a
      ><a name="26684"
      > </a
      ><a name="26685" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="26687"
      > </a
      ><a name="26688" href="2016-10-30-one-lambda-calculus-many-times-2.html#26641" class="Bound"
      >&#916;</a
      ><a name="26689"
      > </a
      ><a name="26690" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26691"
      > </a
      ><a name="26692" href="2016-10-30-one-lambda-calculus-many-times-2.html#26637" class="Bound"
      >C</a
      ><a name="26693"
      >
    </a
      ><a name="26698" href="2016-10-30-one-lambda-calculus-many-times-2.html#26698" class="InductiveConstructor"
      >&#8658;r</a
      ><a name="26700"
      >  </a
      ><a name="26702" class="Symbol"
      >:</a
      ><a name="26703"
      > </a
      ><a name="26704" class="Symbol"
      >&#8704;</a
      ><a name="26705"
      > </a
      ><a name="26718" class="Symbol"
      >&#8594;</a
      ><a name="26719"
      > </a
      ><a name="26720" href="2016-10-30-one-lambda-calculus-many-times-2.html#26488" class="Datatype Operator"
      >LJ</a
      ><a name="26722"
      > </a
      ><a name="26723" href="2016-10-30-one-lambda-calculus-many-times-2.html#26707" class="Bound"
      >A</a
      ><a name="26724"
      > </a
      ><a name="26725" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="26726"
      > </a
      ><a name="26727" href="2016-10-30-one-lambda-calculus-many-times-2.html#26713" class="Bound"
      >&#915;</a
      ><a name="26728"
      > </a
      ><a name="26729" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26730"
      > </a
      ><a name="26731" href="2016-10-30-one-lambda-calculus-many-times-2.html#26709" class="Bound"
      >B</a
      ><a name="26732"
      > </a
      ><a name="26733" class="Symbol"
      >&#8594;</a
      ><a name="26734"
      > </a
      ><a name="26735" href="2016-10-30-one-lambda-calculus-many-times-2.html#26488" class="Datatype Operator"
      >LJ</a
      ><a name="26737"
      > </a
      ><a name="26738" href="2016-10-30-one-lambda-calculus-many-times-2.html#26713" class="Bound"
      >&#915;</a
      ><a name="26739"
      > </a
      ><a name="26740" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26741"
      > </a
      ><a name="26742" href="2016-10-30-one-lambda-calculus-many-times-2.html#26707" class="Bound"
      >A</a
      ><a name="26743"
      > </a
      ><a name="26744" href="2016-03-20-one-lambda-calculus-many-times.html#2694" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="26745"
      > </a
      ><a name="26746" href="2016-10-30-one-lambda-calculus-many-times-2.html#26709" class="Bound"
      >B</a
      ><a name="26747"
      >
    </a
      ><a name="26752" href="2016-10-30-one-lambda-calculus-many-times-2.html#26752" class="InductiveConstructor"
      >w</a
      ><a name="26753"
      >   </a
      ><a name="26756" class="Symbol"
      >:</a
      ><a name="26757"
      > </a
      ><a name="26758" class="Symbol"
      >&#8704;</a
      ><a name="26759"
      > </a
      ><a name="26772" class="Symbol"
      >&#8594;</a
      ><a name="26773"
      > </a
      ><a name="26774" href="2016-10-30-one-lambda-calculus-many-times-2.html#26488" class="Datatype Operator"
      >LJ</a
      ><a name="26776"
      > </a
      ><a name="26777" href="2016-10-30-one-lambda-calculus-many-times-2.html#26767" class="Bound"
      >&#915;</a
      ><a name="26778"
      > </a
      ><a name="26779" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26780"
      > </a
      ><a name="26781" href="2016-10-30-one-lambda-calculus-many-times-2.html#26763" class="Bound"
      >B</a
      ><a name="26782"
      > </a
      ><a name="26783" class="Symbol"
      >&#8594;</a
      ><a name="26784"
      > </a
      ><a name="26785" href="2016-10-30-one-lambda-calculus-many-times-2.html#26488" class="Datatype Operator"
      >LJ</a
      ><a name="26787"
      > </a
      ><a name="26788" href="2016-10-30-one-lambda-calculus-many-times-2.html#26761" class="Bound"
      >A</a
      ><a name="26789"
      > </a
      ><a name="26790" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="26791"
      > </a
      ><a name="26792" href="2016-10-30-one-lambda-calculus-many-times-2.html#26767" class="Bound"
      >&#915;</a
      ><a name="26793"
      > </a
      ><a name="26794" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26795"
      > </a
      ><a name="26796" href="2016-10-30-one-lambda-calculus-many-times-2.html#26763" class="Bound"
      >B</a
      ><a name="26797"
      >
    </a
      ><a name="26802" href="2016-10-30-one-lambda-calculus-many-times-2.html#26802" class="InductiveConstructor"
      >c</a
      ><a name="26803"
      >   </a
      ><a name="26806" class="Symbol"
      >:</a
      ><a name="26807"
      > </a
      ><a name="26808" class="Symbol"
      >&#8704;</a
      ><a name="26809"
      > </a
      ><a name="26822" class="Symbol"
      >&#8594;</a
      ><a name="26823"
      > </a
      ><a name="26824" href="2016-10-30-one-lambda-calculus-many-times-2.html#26488" class="Datatype Operator"
      >LJ</a
      ><a name="26826"
      > </a
      ><a name="26827" href="2016-10-30-one-lambda-calculus-many-times-2.html#26811" class="Bound"
      >A</a
      ><a name="26828"
      > </a
      ><a name="26829" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="26830"
      > </a
      ><a name="26831" href="2016-10-30-one-lambda-calculus-many-times-2.html#26811" class="Bound"
      >A</a
      ><a name="26832"
      > </a
      ><a name="26833" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="26834"
      > </a
      ><a name="26835" href="2016-10-30-one-lambda-calculus-many-times-2.html#26817" class="Bound"
      >&#915;</a
      ><a name="26836"
      > </a
      ><a name="26837" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26838"
      > </a
      ><a name="26839" href="2016-10-30-one-lambda-calculus-many-times-2.html#26813" class="Bound"
      >B</a
      ><a name="26840"
      > </a
      ><a name="26841" class="Symbol"
      >&#8594;</a
      ><a name="26842"
      > </a
      ><a name="26843" href="2016-10-30-one-lambda-calculus-many-times-2.html#26488" class="Datatype Operator"
      >LJ</a
      ><a name="26845"
      > </a
      ><a name="26846" href="2016-10-30-one-lambda-calculus-many-times-2.html#26811" class="Bound"
      >A</a
      ><a name="26847"
      > </a
      ><a name="26848" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="26849"
      > </a
      ><a name="26850" href="2016-10-30-one-lambda-calculus-many-times-2.html#26817" class="Bound"
      >&#915;</a
      ><a name="26851"
      > </a
      ><a name="26852" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26853"
      > </a
      ><a name="26854" href="2016-10-30-one-lambda-calculus-many-times-2.html#26813" class="Bound"
      >B</a
      ><a name="26855"
      >
    </a
      ><a name="26860" href="2016-10-30-one-lambda-calculus-many-times-2.html#26860" class="InductiveConstructor"
      >p</a
      ><a name="26861"
      >   </a
      ><a name="26864" class="Symbol"
      >:</a
      ><a name="26865"
      > </a
      ><a name="26866" class="Symbol"
      >&#8704;</a
      ><a name="26867"
      > </a
      ><a name="26876" class="Symbol"
      >&#8594;</a
      ><a name="26877"
      > </a
      ><a name="26878" class="Symbol"
      >&#8704;</a
      ><a name="26879"
      > </a
      ><a name="26880" href="2016-10-30-one-lambda-calculus-many-times-2.html#26880" class="Bound"
      >&#915;</a
      ><a name="26881"
      > </a
      ><a name="26882" class="Symbol"
      >&#8594;</a
      ><a name="26883"
      > </a
      ><a name="26884" class="Symbol"
      >&#8704;</a
      ><a name="26885"
      > </a
      ><a name="26890" class="Symbol"
      >&#8594;</a
      ><a name="26891"
      > </a
      ><a name="26892" href="2016-10-30-one-lambda-calculus-many-times-2.html#26488" class="Datatype Operator"
      >LJ</a
      ><a name="26894"
      > </a
      ><a name="26895" href="2016-10-30-one-lambda-calculus-many-times-2.html#26880" class="Bound"
      >&#915;</a
      ><a name="26896"
      > </a
      ><a name="26897" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="26899"
      > </a
      ><a name="26900" href="2016-10-30-one-lambda-calculus-many-times-2.html#26869" class="Bound"
      >A</a
      ><a name="26901"
      > </a
      ><a name="26902" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="26903"
      > </a
      ><a name="26904" href="2016-10-30-one-lambda-calculus-many-times-2.html#26871" class="Bound"
      >B</a
      ><a name="26905"
      > </a
      ><a name="26906" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="26907"
      > </a
      ><a name="26908" href="2016-10-30-one-lambda-calculus-many-times-2.html#26887" class="Bound"
      >&#916;</a
      ><a name="26909"
      > </a
      ><a name="26910" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26911"
      > </a
      ><a name="26912" href="2016-10-30-one-lambda-calculus-many-times-2.html#26873" class="Bound"
      >C</a
      ><a name="26913"
      > </a
      ><a name="26914" class="Symbol"
      >&#8594;</a
      ><a name="26915"
      > </a
      ><a name="26916" href="2016-10-30-one-lambda-calculus-many-times-2.html#26488" class="Datatype Operator"
      >LJ</a
      ><a name="26918"
      > </a
      ><a name="26919" href="2016-10-30-one-lambda-calculus-many-times-2.html#26880" class="Bound"
      >&#915;</a
      ><a name="26920"
      > </a
      ><a name="26921" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="26923"
      > </a
      ><a name="26924" href="2016-10-30-one-lambda-calculus-many-times-2.html#26871" class="Bound"
      >B</a
      ><a name="26925"
      > </a
      ><a name="26926" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="26927"
      > </a
      ><a name="26928" href="2016-10-30-one-lambda-calculus-many-times-2.html#26869" class="Bound"
      >A</a
      ><a name="26929"
      > </a
      ><a name="26930" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="26931"
      > </a
      ><a name="26932" href="2016-10-30-one-lambda-calculus-many-times-2.html#26887" class="Bound"
      >&#916;</a
      ><a name="26933"
      > </a
      ><a name="26934" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26935"
      > </a
      ><a name="26936" href="2016-10-30-one-lambda-calculus-many-times-2.html#26873" class="Bound"
      >C</a
      >
</pre><!--{% endraw %}-->

<div class="hidden">
<!--{% raw %}--><pre class="Agda">
  <a name="26986" class="Keyword"
      >module</a
      ><a name="26992"
      > </a
      ><a name="26993" href="2016-10-30-one-lambda-calculus-many-times-2.html#26993" class="Module"
      >LJ</a
      ><a name="26995"
      > </a
      ><a name="26996" class="Keyword"
      >where</a
      >
</pre><!--{% endraw %}-->
</div>


<!--{% raw %}--><pre class="Agda">
    <a name="27039" href="2016-10-30-one-lambda-calculus-many-times-2.html#27039" class="Function"
      >&#8709;i</a
      ><a name="27041"
      > </a
      ><a name="27042" class="Symbol"
      >:</a
      ><a name="27043"
      > </a
      ><a name="27044" class="Symbol"
      >&#8704;</a
      ><a name="27045"
      > </a
      ><a name="27052" class="Symbol"
      >&#8594;</a
      ><a name="27053"
      > </a
      ><a name="27054" href="2016-10-30-one-lambda-calculus-many-times-2.html#26488" class="Datatype Operator"
      >LJ</a
      ><a name="27056"
      > </a
      ><a name="27057" href="2016-10-30-one-lambda-calculus-many-times-2.html#27049" class="Bound"
      >&#915;</a
      ><a name="27058"
      > </a
      ><a name="27059" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="27060"
      > </a
      ><a name="27061" href="2016-10-30-one-lambda-calculus-many-times-2.html#27047" class="Bound"
      >A</a
      ><a name="27062"
      > </a
      ><a name="27063" class="Symbol"
      >&#8594;</a
      ><a name="27064"
      > </a
      ><a name="27065" href="2016-10-30-one-lambda-calculus-many-times-2.html#26488" class="Datatype Operator"
      >LJ</a
      ><a name="27067"
      > </a
      ><a name="27068" href="2016-10-30-one-lambda-calculus-many-times-2.html#27049" class="Bound"
      >&#915;</a
      ><a name="27069"
      > </a
      ><a name="27070" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="27072"
      > </a
      ><a name="27073" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="27075"
      > </a
      ><a name="27076" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="27077"
      > </a
      ><a name="27078" href="2016-10-30-one-lambda-calculus-many-times-2.html#27047" class="Bound"
      >A</a
      ><a name="27079"
      >
    </a
      ><a name="27084" href="2016-10-30-one-lambda-calculus-many-times-2.html#27039" class="Function"
      >&#8709;i</a
      ><a name="27086"
      > </a
      ><a name="27095" href="2016-10-30-one-lambda-calculus-many-times-2.html#27095" class="Bound"
      >f</a
      ><a name="27096"
      > </a
      ><a name="27097" class="Keyword"
      >rewrite</a
      ><a name="27104"
      > </a
      ><a name="27105" href="2016-10-30-one-lambda-calculus-many-times-2.html#2036" class="Function"
      >++-identity&#691;</a
      ><a name="27117"
      > </a
      ><a name="27118" href="2016-10-30-one-lambda-calculus-many-times-2.html#27092" class="Bound"
      >&#915;</a
      ><a name="27119"
      > </a
      ><a name="27120" class="Symbol"
      >=</a
      ><a name="27121"
      > </a
      ><a name="27122" href="2016-10-30-one-lambda-calculus-many-times-2.html#27095" class="Bound"
      >f</a
      ><a name="27123"
      >
    </a
      ><a name="27128" href="2016-10-30-one-lambda-calculus-many-times-2.html#27128" class="Function"
      >&#8709;e</a
      ><a name="27130"
      > </a
      ><a name="27131" class="Symbol"
      >:</a
      ><a name="27132"
      > </a
      ><a name="27133" class="Symbol"
      >&#8704;</a
      ><a name="27134"
      > </a
      ><a name="27141" class="Symbol"
      >&#8594;</a
      ><a name="27142"
      > </a
      ><a name="27143" href="2016-10-30-one-lambda-calculus-many-times-2.html#26488" class="Datatype Operator"
      >LJ</a
      ><a name="27145"
      > </a
      ><a name="27146" href="2016-10-30-one-lambda-calculus-many-times-2.html#27138" class="Bound"
      >&#915;</a
      ><a name="27147"
      > </a
      ><a name="27148" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="27150"
      > </a
      ><a name="27151" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="27153"
      > </a
      ><a name="27154" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="27155"
      > </a
      ><a name="27156" href="2016-10-30-one-lambda-calculus-many-times-2.html#27136" class="Bound"
      >A</a
      ><a name="27157"
      > </a
      ><a name="27158" class="Symbol"
      >&#8594;</a
      ><a name="27159"
      > </a
      ><a name="27160" href="2016-10-30-one-lambda-calculus-many-times-2.html#26488" class="Datatype Operator"
      >LJ</a
      ><a name="27162"
      > </a
      ><a name="27163" href="2016-10-30-one-lambda-calculus-many-times-2.html#27138" class="Bound"
      >&#915;</a
      ><a name="27164"
      > </a
      ><a name="27165" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="27166"
      > </a
      ><a name="27167" href="2016-10-30-one-lambda-calculus-many-times-2.html#27136" class="Bound"
      >A</a
      ><a name="27168"
      >
    </a
      ><a name="27173" href="2016-10-30-one-lambda-calculus-many-times-2.html#27128" class="Function"
      >&#8709;e</a
      ><a name="27175"
      > </a
      ><a name="27184" href="2016-10-30-one-lambda-calculus-many-times-2.html#27184" class="Bound"
      >f</a
      ><a name="27185"
      > </a
      ><a name="27186" class="Keyword"
      >rewrite</a
      ><a name="27193"
      > </a
      ><a name="27194" href="2016-10-30-one-lambda-calculus-many-times-2.html#2036" class="Function"
      >++-identity&#691;</a
      ><a name="27206"
      > </a
      ><a name="27207" href="2016-10-30-one-lambda-calculus-many-times-2.html#27181" class="Bound"
      >&#915;</a
      ><a name="27208"
      > </a
      ><a name="27209" class="Symbol"
      >=</a
      ><a name="27210"
      > </a
      ><a name="27211" href="2016-10-30-one-lambda-calculus-many-times-2.html#27184" class="Bound"
      >f</a
      >
</pre><!--{% endraw %}-->

<!--{% raw %}--><pre class="Agda">
  <a name="27240" class="Keyword"
      >module</a
      ><a name="27246"
      > </a
      ><a name="27247" href="2016-10-30-one-lambda-calculus-many-times-2.html#27247" class="Module"
      >LJ&#8660;NJ</a
      ><a name="27252"
      > </a
      ><a name="27253" class="Keyword"
      >where</a
      ><a name="27258"
      >

    </a
      ><a name="27264" href="2016-10-30-one-lambda-calculus-many-times-2.html#27264" class="Function"
      >&#10233;</a
      ><a name="27265"
      > </a
      ><a name="27266" class="Symbol"
      >:</a
      ><a name="27267"
      > </a
      ><a name="27268" class="Symbol"
      >&#8704;</a
      ><a name="27269"
      > </a
      ><a name="27274" class="Symbol"
      >&#8594;</a
      ><a name="27275"
      > </a
      ><a name="27276" href="2016-10-30-one-lambda-calculus-many-times-2.html#26488" class="Datatype Operator"
      >LJ</a
      ><a name="27278"
      > </a
      ><a name="27279" href="2016-10-30-one-lambda-calculus-many-times-2.html#27271" class="Bound"
      >S</a
      ><a name="27280"
      > </a
      ><a name="27281" class="Symbol"
      >&#8594;</a
      ><a name="27282"
      > </a
      ><a name="27283" href="2016-10-30-one-lambda-calculus-many-times-2.html#6868" class="Datatype Operator"
      >NJ</a
      ><a name="27285"
      > </a
      ><a name="27286" href="2016-10-30-one-lambda-calculus-many-times-2.html#27271" class="Bound"
      >S</a
      ><a name="27287"
      >
    </a
      ><a name="27292" href="2016-10-30-one-lambda-calculus-many-times-2.html#27264" class="Function"
      >&#10233;</a
      ><a name="27293"
      >  </a
      ><a name="27295" href="2016-10-30-one-lambda-calculus-many-times-2.html#26518" class="InductiveConstructor"
      >ax</a
      ><a name="27297"
      >       </a
      ><a name="27304" class="Symbol"
      >=</a
      ><a name="27305"
      > </a
      ><a name="27306" href="2016-10-30-one-lambda-calculus-many-times-2.html#6898" class="InductiveConstructor"
      >ax</a
      ><a name="27308"
      >
    </a
      ><a name="27313" href="2016-10-30-one-lambda-calculus-many-times-2.html#27264" class="Function"
      >&#10233;</a
      ><a name="27314"
      > </a
      ><a name="27315" class="Symbol"
      >(</a
      ><a name="27316" href="2016-10-30-one-lambda-calculus-many-times-2.html#26558" class="InductiveConstructor"
      >cut</a
      ><a name="27319"
      > </a
      ><a name="27320" class="Symbol"
      >{</a
      ><a name="27321" class="Argument"
      >&#916;</a
      ><a name="27322"
      > </a
      ><a name="27323" class="Symbol"
      >=</a
      ><a name="27324"
      > </a
      ><a name="27325" href="2016-10-30-one-lambda-calculus-many-times-2.html#27325" class="Bound"
      >&#916;</a
      ><a name="27326" class="Symbol"
      >}</a
      ><a name="27327"
      > </a
      ><a name="27328" href="2016-10-30-one-lambda-calculus-many-times-2.html#27328" class="Bound"
      >f</a
      ><a name="27329"
      > </a
      ><a name="27330" href="2016-10-30-one-lambda-calculus-many-times-2.html#27330" class="Bound"
      >g</a
      ><a name="27331" class="Symbol"
      >)</a
      ><a name="27332"
      > </a
      ><a name="27333" class="Symbol"
      >=</a
      ><a name="27334"
      > </a
      ><a name="27335" href="2016-10-30-one-lambda-calculus-many-times-2.html#23815" class="Function"
      >NJ.s&#8314;&#8242;</a
      ><a name="27341"
      > </a
      ><a name="27342" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="27344"
      > </a
      ><a name="27345" href="2016-10-30-one-lambda-calculus-many-times-2.html#27325" class="Bound"
      >&#916;</a
      ><a name="27346"
      > </a
      ><a name="27347" class="Symbol"
      >(</a
      ><a name="27348" href="2016-10-30-one-lambda-calculus-many-times-2.html#6990" class="InductiveConstructor"
      >&#8658;e</a
      ><a name="27350"
      > </a
      ><a name="27351" class="Symbol"
      >(</a
      ><a name="27352" href="2016-10-30-one-lambda-calculus-many-times-2.html#6937" class="InductiveConstructor"
      >&#8658;i</a
      ><a name="27354"
      > </a
      ><a name="27355" class="Symbol"
      >(</a
      ><a name="27356" href="2016-10-30-one-lambda-calculus-many-times-2.html#27264" class="Function"
      >&#10233;</a
      ><a name="27357"
      > </a
      ><a name="27358" href="2016-10-30-one-lambda-calculus-many-times-2.html#27330" class="Bound"
      >g</a
      ><a name="27359" class="Symbol"
      >))</a
      ><a name="27361"
      > </a
      ><a name="27362" class="Symbol"
      >(</a
      ><a name="27363" href="2016-10-30-one-lambda-calculus-many-times-2.html#27264" class="Function"
      >&#10233;</a
      ><a name="27364"
      > </a
      ><a name="27365" href="2016-10-30-one-lambda-calculus-many-times-2.html#27328" class="Bound"
      >f</a
      ><a name="27366" class="Symbol"
      >))</a
      ><a name="27368"
      >
    </a
      ><a name="27373" href="2016-10-30-one-lambda-calculus-many-times-2.html#27264" class="Function"
      >&#10233;</a
      ><a name="27374"
      > </a
      ><a name="27375" class="Symbol"
      >(</a
      ><a name="27376" href="2016-10-30-one-lambda-calculus-many-times-2.html#26624" class="InductiveConstructor"
      >&#8658;l</a
      ><a name="27378"
      >  </a
      ><a name="27380" class="Symbol"
      >{</a
      ><a name="27381" class="Argument"
      >&#916;</a
      ><a name="27382"
      > </a
      ><a name="27383" class="Symbol"
      >=</a
      ><a name="27384"
      > </a
      ><a name="27385" href="2016-10-30-one-lambda-calculus-many-times-2.html#27385" class="Bound"
      >&#916;</a
      ><a name="27386" class="Symbol"
      >}</a
      ><a name="27387"
      > </a
      ><a name="27388" href="2016-10-30-one-lambda-calculus-many-times-2.html#27388" class="Bound"
      >f</a
      ><a name="27389"
      > </a
      ><a name="27390" href="2016-10-30-one-lambda-calculus-many-times-2.html#27390" class="Bound"
      >g</a
      ><a name="27391" class="Symbol"
      >)</a
      ><a name="27392"
      > </a
      ><a name="27393" class="Symbol"
      >=</a
      ><a name="27394"
      > </a
      ><a name="27395" href="2016-10-30-one-lambda-calculus-many-times-2.html#23815" class="Function"
      >NJ.s&#8314;&#8242;</a
      ><a name="27401"
      > </a
      ><a name="27402" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="27404"
      > </a
      ><a name="27405" href="2016-10-30-one-lambda-calculus-many-times-2.html#27385" class="Bound"
      >&#916;</a
      ><a name="27406"
      > </a
      ><a name="27407" class="Symbol"
      >(</a
      ><a name="27408" href="2016-10-30-one-lambda-calculus-many-times-2.html#6990" class="InductiveConstructor"
      >&#8658;e</a
      ><a name="27410"
      > </a
      ><a name="27411" class="Symbol"
      >(</a
      ><a name="27412" href="2016-10-30-one-lambda-calculus-many-times-2.html#6937" class="InductiveConstructor"
      >&#8658;i</a
      ><a name="27414"
      > </a
      ><a name="27415" class="Symbol"
      >(</a
      ><a name="27416" href="2016-10-30-one-lambda-calculus-many-times-2.html#27264" class="Function"
      >&#10233;</a
      ><a name="27417"
      > </a
      ><a name="27418" href="2016-10-30-one-lambda-calculus-many-times-2.html#27390" class="Bound"
      >g</a
      ><a name="27419" class="Symbol"
      >))</a
      ><a name="27421"
      > </a
      ><a name="27422" class="Symbol"
      >(</a
      ><a name="27423" href="2016-10-30-one-lambda-calculus-many-times-2.html#6990" class="InductiveConstructor"
      >&#8658;e</a
      ><a name="27425"
      > </a
      ><a name="27426" href="2016-10-30-one-lambda-calculus-many-times-2.html#6898" class="InductiveConstructor"
      >ax</a
      ><a name="27428"
      > </a
      ><a name="27429" class="Symbol"
      >(</a
      ><a name="27430" href="2016-10-30-one-lambda-calculus-many-times-2.html#27264" class="Function"
      >&#10233;</a
      ><a name="27431"
      > </a
      ><a name="27432" href="2016-10-30-one-lambda-calculus-many-times-2.html#27388" class="Bound"
      >f</a
      ><a name="27433" class="Symbol"
      >)))</a
      ><a name="27436"
      >
    </a
      ><a name="27441" href="2016-10-30-one-lambda-calculus-many-times-2.html#27264" class="Function"
      >&#10233;</a
      ><a name="27442"
      > </a
      ><a name="27443" class="Symbol"
      >(</a
      ><a name="27444" href="2016-10-30-one-lambda-calculus-many-times-2.html#26698" class="InductiveConstructor"
      >&#8658;r</a
      ><a name="27446"
      >  </a
      ><a name="27448" href="2016-10-30-one-lambda-calculus-many-times-2.html#27448" class="Bound"
      >f</a
      ><a name="27449" class="Symbol"
      >)</a
      ><a name="27450"
      >   </a
      ><a name="27453" class="Symbol"
      >=</a
      ><a name="27454"
      > </a
      ><a name="27455" href="2016-10-30-one-lambda-calculus-many-times-2.html#6937" class="InductiveConstructor"
      >&#8658;i</a
      ><a name="27457"
      >  </a
      ><a name="27459" class="Symbol"
      >(</a
      ><a name="27460" href="2016-10-30-one-lambda-calculus-many-times-2.html#27264" class="Function"
      >&#10233;</a
      ><a name="27461"
      > </a
      ><a name="27462" href="2016-10-30-one-lambda-calculus-many-times-2.html#27448" class="Bound"
      >f</a
      ><a name="27463" class="Symbol"
      >)</a
      ><a name="27464"
      >
    </a
      ><a name="27469" href="2016-10-30-one-lambda-calculus-many-times-2.html#27264" class="Function"
      >&#10233;</a
      ><a name="27470"
      > </a
      ><a name="27471" class="Symbol"
      >(</a
      ><a name="27472" href="2016-10-30-one-lambda-calculus-many-times-2.html#26752" class="InductiveConstructor"
      >w</a
      ><a name="27473"
      >   </a
      ><a name="27476" href="2016-10-30-one-lambda-calculus-many-times-2.html#27476" class="Bound"
      >f</a
      ><a name="27477" class="Symbol"
      >)</a
      ><a name="27478"
      >   </a
      ><a name="27481" class="Symbol"
      >=</a
      ><a name="27482"
      > </a
      ><a name="27483" href="2016-10-30-one-lambda-calculus-many-times-2.html#7055" class="InductiveConstructor"
      >w</a
      ><a name="27484"
      >   </a
      ><a name="27487" class="Symbol"
      >(</a
      ><a name="27488" href="2016-10-30-one-lambda-calculus-many-times-2.html#27264" class="Function"
      >&#10233;</a
      ><a name="27489"
      > </a
      ><a name="27490" href="2016-10-30-one-lambda-calculus-many-times-2.html#27476" class="Bound"
      >f</a
      ><a name="27491" class="Symbol"
      >)</a
      ><a name="27492"
      >
    </a
      ><a name="27497" href="2016-10-30-one-lambda-calculus-many-times-2.html#27264" class="Function"
      >&#10233;</a
      ><a name="27498"
      > </a
      ><a name="27499" class="Symbol"
      >(</a
      ><a name="27500" href="2016-10-30-one-lambda-calculus-many-times-2.html#26802" class="InductiveConstructor"
      >c</a
      ><a name="27501"
      >   </a
      ><a name="27504" href="2016-10-30-one-lambda-calculus-many-times-2.html#27504" class="Bound"
      >f</a
      ><a name="27505" class="Symbol"
      >)</a
      ><a name="27506"
      >   </a
      ><a name="27509" class="Symbol"
      >=</a
      ><a name="27510"
      > </a
      ><a name="27511" href="2016-10-30-one-lambda-calculus-many-times-2.html#7104" class="InductiveConstructor"
      >c</a
      ><a name="27512"
      >   </a
      ><a name="27515" class="Symbol"
      >(</a
      ><a name="27516" href="2016-10-30-one-lambda-calculus-many-times-2.html#27264" class="Function"
      >&#10233;</a
      ><a name="27517"
      > </a
      ><a name="27518" href="2016-10-30-one-lambda-calculus-many-times-2.html#27504" class="Bound"
      >f</a
      ><a name="27519" class="Symbol"
      >)</a
      ><a name="27520"
      >
    </a
      ><a name="27525" href="2016-10-30-one-lambda-calculus-many-times-2.html#27264" class="Function"
      >&#10233;</a
      ><a name="27526"
      > </a
      ><a name="27527" class="Symbol"
      >(</a
      ><a name="27528" href="2016-10-30-one-lambda-calculus-many-times-2.html#26860" class="InductiveConstructor"
      >p</a
      ><a name="27529"
      > </a
      ><a name="27530" href="2016-10-30-one-lambda-calculus-many-times-2.html#27530" class="Bound"
      >&#915;</a
      ><a name="27531"
      > </a
      ><a name="27532" href="2016-10-30-one-lambda-calculus-many-times-2.html#27532" class="Bound"
      >f</a
      ><a name="27533" class="Symbol"
      >)</a
      ><a name="27534"
      >   </a
      ><a name="27537" class="Symbol"
      >=</a
      ><a name="27538"
      > </a
      ><a name="27539" href="2016-10-30-one-lambda-calculus-many-times-2.html#7161" class="InductiveConstructor"
      >p</a
      ><a name="27540"
      > </a
      ><a name="27541" href="2016-10-30-one-lambda-calculus-many-times-2.html#27530" class="Bound"
      >&#915;</a
      ><a name="27542"
      > </a
      ><a name="27543" class="Symbol"
      >(</a
      ><a name="27544" href="2016-10-30-one-lambda-calculus-many-times-2.html#27264" class="Function"
      >&#10233;</a
      ><a name="27545"
      > </a
      ><a name="27546" href="2016-10-30-one-lambda-calculus-many-times-2.html#27532" class="Bound"
      >f</a
      ><a name="27547" class="Symbol"
      >)</a
      ><a name="27548"
      >

    </a
      ><a name="27554" href="2016-10-30-one-lambda-calculus-many-times-2.html#27554" class="Function"
      >&#10232;</a
      ><a name="27555"
      > </a
      ><a name="27556" class="Symbol"
      >:</a
      ><a name="27557"
      > </a
      ><a name="27558" class="Symbol"
      >&#8704;</a
      ><a name="27559"
      > </a
      ><a name="27564" class="Symbol"
      >&#8594;</a
      ><a name="27565"
      > </a
      ><a name="27566" href="2016-10-30-one-lambda-calculus-many-times-2.html#6868" class="Datatype Operator"
      >NJ</a
      ><a name="27568"
      > </a
      ><a name="27569" href="2016-10-30-one-lambda-calculus-many-times-2.html#27561" class="Bound"
      >S</a
      ><a name="27570"
      > </a
      ><a name="27571" class="Symbol"
      >&#8594;</a
      ><a name="27572"
      > </a
      ><a name="27573" href="2016-10-30-one-lambda-calculus-many-times-2.html#26488" class="Datatype Operator"
      >LJ</a
      ><a name="27575"
      > </a
      ><a name="27576" href="2016-10-30-one-lambda-calculus-many-times-2.html#27561" class="Bound"
      >S</a
      ><a name="27577"
      >
    </a
      ><a name="27582" href="2016-10-30-one-lambda-calculus-many-times-2.html#27554" class="Function"
      >&#10232;</a
      ><a name="27583"
      >  </a
      ><a name="27585" href="2016-10-30-one-lambda-calculus-many-times-2.html#6898" class="InductiveConstructor"
      >ax</a
      ><a name="27587"
      >       </a
      ><a name="27594" class="Symbol"
      >=</a
      ><a name="27595"
      > </a
      ><a name="27596" href="2016-10-30-one-lambda-calculus-many-times-2.html#26518" class="InductiveConstructor"
      >ax</a
      ><a name="27598"
      >
    </a
      ><a name="27603" href="2016-10-30-one-lambda-calculus-many-times-2.html#27554" class="Function"
      >&#10232;</a
      ><a name="27604"
      > </a
      ><a name="27605" class="Symbol"
      >(</a
      ><a name="27606" href="2016-10-30-one-lambda-calculus-many-times-2.html#6937" class="InductiveConstructor"
      >&#8658;i</a
      ><a name="27608"
      >  </a
      ><a name="27610" href="2016-10-30-one-lambda-calculus-many-times-2.html#27610" class="Bound"
      >f</a
      ><a name="27611" class="Symbol"
      >)</a
      ><a name="27612"
      >   </a
      ><a name="27615" class="Symbol"
      >=</a
      ><a name="27616"
      > </a
      ><a name="27617" href="2016-10-30-one-lambda-calculus-many-times-2.html#26698" class="InductiveConstructor"
      >&#8658;r</a
      ><a name="27619"
      >  </a
      ><a name="27621" class="Symbol"
      >(</a
      ><a name="27622" href="2016-10-30-one-lambda-calculus-many-times-2.html#27554" class="Function"
      >&#10232;</a
      ><a name="27623"
      > </a
      ><a name="27624" href="2016-10-30-one-lambda-calculus-many-times-2.html#27610" class="Bound"
      >f</a
      ><a name="27625" class="Symbol"
      >)</a
      ><a name="27626"
      >
    </a
      ><a name="27631" href="2016-10-30-one-lambda-calculus-many-times-2.html#27554" class="Function"
      >&#10232;</a
      ><a name="27632"
      > </a
      ><a name="27633" class="Symbol"
      >(</a
      ><a name="27634" href="2016-10-30-one-lambda-calculus-many-times-2.html#6990" class="InductiveConstructor"
      >&#8658;e</a
      ><a name="27636"
      >  </a
      ><a name="27638" href="2016-10-30-one-lambda-calculus-many-times-2.html#27638" class="Bound"
      >f</a
      ><a name="27639"
      > </a
      ><a name="27640" href="2016-10-30-one-lambda-calculus-many-times-2.html#27640" class="Bound"
      >g</a
      ><a name="27641" class="Symbol"
      >)</a
      ><a name="27642"
      > </a
      ><a name="27643" class="Symbol"
      >=</a
      ><a name="27644"
      > </a
      ><a name="27645" href="2016-10-30-one-lambda-calculus-many-times-2.html#26558" class="InductiveConstructor"
      >cut</a
      ><a name="27648"
      > </a
      ><a name="27649" class="Symbol"
      >(</a
      ><a name="27650" href="2016-10-30-one-lambda-calculus-many-times-2.html#27554" class="Function"
      >&#10232;</a
      ><a name="27651"
      > </a
      ><a name="27652" href="2016-10-30-one-lambda-calculus-many-times-2.html#27638" class="Bound"
      >f</a
      ><a name="27653" class="Symbol"
      >)</a
      ><a name="27654"
      > </a
      ><a name="27655" class="Symbol"
      >(</a
      ><a name="27656" href="2016-10-30-one-lambda-calculus-many-times-2.html#27128" class="Function"
      >LJ.&#8709;e</a
      ><a name="27661"
      > </a
      ><a name="27662" class="Symbol"
      >(</a
      ><a name="27663" href="2016-10-30-one-lambda-calculus-many-times-2.html#26624" class="InductiveConstructor"
      >&#8658;l</a
      ><a name="27665"
      > </a
      ><a name="27666" class="Symbol"
      >(</a
      ><a name="27667" href="2016-10-30-one-lambda-calculus-many-times-2.html#27554" class="Function"
      >&#10232;</a
      ><a name="27668"
      > </a
      ><a name="27669" href="2016-10-30-one-lambda-calculus-many-times-2.html#27640" class="Bound"
      >g</a
      ><a name="27670" class="Symbol"
      >)</a
      ><a name="27671"
      > </a
      ><a name="27672" href="2016-10-30-one-lambda-calculus-many-times-2.html#26518" class="InductiveConstructor"
      >ax</a
      ><a name="27674" class="Symbol"
      >))</a
      ><a name="27676"
      >
    </a
      ><a name="27681" href="2016-10-30-one-lambda-calculus-many-times-2.html#27554" class="Function"
      >&#10232;</a
      ><a name="27682"
      > </a
      ><a name="27683" class="Symbol"
      >(</a
      ><a name="27684" href="2016-10-30-one-lambda-calculus-many-times-2.html#7055" class="InductiveConstructor"
      >w</a
      ><a name="27685"
      >   </a
      ><a name="27688" href="2016-10-30-one-lambda-calculus-many-times-2.html#27688" class="Bound"
      >f</a
      ><a name="27689" class="Symbol"
      >)</a
      ><a name="27690"
      >   </a
      ><a name="27693" class="Symbol"
      >=</a
      ><a name="27694"
      > </a
      ><a name="27695" href="2016-10-30-one-lambda-calculus-many-times-2.html#26752" class="InductiveConstructor"
      >w</a
      ><a name="27696"
      >   </a
      ><a name="27699" class="Symbol"
      >(</a
      ><a name="27700" href="2016-10-30-one-lambda-calculus-many-times-2.html#27554" class="Function"
      >&#10232;</a
      ><a name="27701"
      > </a
      ><a name="27702" href="2016-10-30-one-lambda-calculus-many-times-2.html#27688" class="Bound"
      >f</a
      ><a name="27703" class="Symbol"
      >)</a
      ><a name="27704"
      >
    </a
      ><a name="27709" href="2016-10-30-one-lambda-calculus-many-times-2.html#27554" class="Function"
      >&#10232;</a
      ><a name="27710"
      > </a
      ><a name="27711" class="Symbol"
      >(</a
      ><a name="27712" href="2016-10-30-one-lambda-calculus-many-times-2.html#7104" class="InductiveConstructor"
      >c</a
      ><a name="27713"
      >   </a
      ><a name="27716" href="2016-10-30-one-lambda-calculus-many-times-2.html#27716" class="Bound"
      >f</a
      ><a name="27717" class="Symbol"
      >)</a
      ><a name="27718"
      >   </a
      ><a name="27721" class="Symbol"
      >=</a
      ><a name="27722"
      > </a
      ><a name="27723" href="2016-10-30-one-lambda-calculus-many-times-2.html#26802" class="InductiveConstructor"
      >c</a
      ><a name="27724"
      >   </a
      ><a name="27727" class="Symbol"
      >(</a
      ><a name="27728" href="2016-10-30-one-lambda-calculus-many-times-2.html#27554" class="Function"
      >&#10232;</a
      ><a name="27729"
      > </a
      ><a name="27730" href="2016-10-30-one-lambda-calculus-many-times-2.html#27716" class="Bound"
      >f</a
      ><a name="27731" class="Symbol"
      >)</a
      ><a name="27732"
      >
    </a
      ><a name="27737" href="2016-10-30-one-lambda-calculus-many-times-2.html#27554" class="Function"
      >&#10232;</a
      ><a name="27738"
      > </a
      ><a name="27739" class="Symbol"
      >(</a
      ><a name="27740" href="2016-10-30-one-lambda-calculus-many-times-2.html#7161" class="InductiveConstructor"
      >p</a
      ><a name="27741"
      > </a
      ><a name="27742" href="2016-10-30-one-lambda-calculus-many-times-2.html#27742" class="Bound"
      >&#915;</a
      ><a name="27743"
      > </a
      ><a name="27744" href="2016-10-30-one-lambda-calculus-many-times-2.html#27744" class="Bound"
      >f</a
      ><a name="27745" class="Symbol"
      >)</a
      ><a name="27746"
      >   </a
      ><a name="27749" class="Symbol"
      >=</a
      ><a name="27750"
      > </a
      ><a name="27751" href="2016-10-30-one-lambda-calculus-many-times-2.html#26860" class="InductiveConstructor"
      >p</a
      ><a name="27752"
      > </a
      ><a name="27753" href="2016-10-30-one-lambda-calculus-many-times-2.html#27742" class="Bound"
      >&#915;</a
      ><a name="27754"
      > </a
      ><a name="27755" class="Symbol"
      >(</a
      ><a name="27756" href="2016-10-30-one-lambda-calculus-many-times-2.html#27554" class="Function"
      >&#10232;</a
      ><a name="27757"
      > </a
      ><a name="27758" href="2016-10-30-one-lambda-calculus-many-times-2.html#27744" class="Bound"
      >f</a
      ><a name="27759" class="Symbol"
      >)</a
      >
</pre><!--{% endraw %}-->

<!--{% raw %}--><pre class="Agda">
  <a name="27788" class="Keyword"
      >module</a
      ><a name="27794"
      > </a
      ><a name="27795" href="2016-10-30-one-lambda-calculus-many-times-2.html#27795" class="Module"
      >LJ&#8660;SC</a
      ><a name="27800"
      > </a
      ><a name="27801" class="Keyword"
      >where</a
      ><a name="27806"
      >

    </a
      ><a name="27812" href="2016-10-30-one-lambda-calculus-many-times-2.html#27812" class="Function"
      >&#10233;</a
      ><a name="27813"
      > </a
      ><a name="27814" class="Symbol"
      >:</a
      ><a name="27815"
      > </a
      ><a name="27816" class="Symbol"
      >&#8704;</a
      ><a name="27817"
      > </a
      ><a name="27822" class="Symbol"
      >&#8594;</a
      ><a name="27823"
      > </a
      ><a name="27824" href="2016-10-30-one-lambda-calculus-many-times-2.html#26488" class="Datatype Operator"
      >LJ</a
      ><a name="27826"
      > </a
      ><a name="27827" href="2016-10-30-one-lambda-calculus-many-times-2.html#27819" class="Bound"
      >S</a
      ><a name="27828"
      > </a
      ><a name="27829" class="Symbol"
      >&#8594;</a
      ><a name="27830"
      > </a
      ><a name="27831" href="2016-03-20-one-lambda-calculus-many-times.html#9787" class="Datatype Operator"
      >SC</a
      ><a name="27833"
      > </a
      ><a name="27834" href="2016-10-30-one-lambda-calculus-many-times-2.html#27819" class="Bound"
      >S</a
      ><a name="27835"
      >
    </a
      ><a name="27840" href="2016-10-30-one-lambda-calculus-many-times-2.html#27812" class="Function"
      >&#10233;</a
      ><a name="27841"
      > </a
      ><a name="27842" href="2016-10-30-one-lambda-calculus-many-times-2.html#27842" class="Bound"
      >f</a
      ><a name="27843"
      > </a
      ><a name="27844" class="Symbol"
      >=</a
      ><a name="27845"
      > </a
      ><a name="27846" href="2016-03-20-one-lambda-calculus-many-times.html#10586" class="Function"
      >ND&#8660;SC.&#10233;</a
      ><a name="27853"
      > </a
      ><a name="27854" class="Symbol"
      >(</a
      ><a name="27855" href="2016-10-30-one-lambda-calculus-many-times-2.html#25186" class="Function"
      >NJ&#8660;ND.&#10233;</a
      ><a name="27862"
      > </a
      ><a name="27863" class="Symbol"
      >(</a
      ><a name="27864" href="2016-10-30-one-lambda-calculus-many-times-2.html#27264" class="Function"
      >LJ&#8660;NJ.&#10233;</a
      ><a name="27871"
      > </a
      ><a name="27872" href="2016-10-30-one-lambda-calculus-many-times-2.html#27842" class="Bound"
      >f</a
      ><a name="27873" class="Symbol"
      >))</a
      ><a name="27875"
      >

    </a
      ><a name="27881" href="2016-10-30-one-lambda-calculus-many-times-2.html#27881" class="Function"
      >&#10232;</a
      ><a name="27882"
      > </a
      ><a name="27883" class="Symbol"
      >:</a
      ><a name="27884"
      > </a
      ><a name="27885" class="Symbol"
      >&#8704;</a
      ><a name="27886"
      > </a
      ><a name="27891" class="Symbol"
      >&#8594;</a
      ><a name="27892"
      > </a
      ><a name="27893" href="2016-03-20-one-lambda-calculus-many-times.html#9787" class="Datatype Operator"
      >SC</a
      ><a name="27895"
      > </a
      ><a name="27896" href="2016-10-30-one-lambda-calculus-many-times-2.html#27888" class="Bound"
      >S</a
      ><a name="27897"
      > </a
      ><a name="27898" class="Symbol"
      >&#8594;</a
      ><a name="27899"
      > </a
      ><a name="27900" href="2016-10-30-one-lambda-calculus-many-times-2.html#26488" class="Datatype Operator"
      >LJ</a
      ><a name="27902"
      > </a
      ><a name="27903" href="2016-10-30-one-lambda-calculus-many-times-2.html#27888" class="Bound"
      >S</a
      ><a name="27904"
      >
    </a
      ><a name="27909" href="2016-10-30-one-lambda-calculus-many-times-2.html#27881" class="Function"
      >&#10232;</a
      ><a name="27910"
      > </a
      ><a name="27911" href="2016-10-30-one-lambda-calculus-many-times-2.html#27911" class="Bound"
      >f</a
      ><a name="27912"
      > </a
      ><a name="27913" class="Symbol"
      >=</a
      ><a name="27914"
      > </a
      ><a name="27915" href="2016-10-30-one-lambda-calculus-many-times-2.html#27554" class="Function"
      >LJ&#8660;NJ.&#10232;</a
      ><a name="27922"
      > </a
      ><a name="27923" class="Symbol"
      >(</a
      ><a name="27924" href="2016-10-30-one-lambda-calculus-many-times-2.html#25612" class="Function"
      >NJ&#8660;ND.&#10232;</a
      ><a name="27931"
      > </a
      ><a name="27932" class="Symbol"
      >(</a
      ><a name="27933" href="2016-03-20-one-lambda-calculus-many-times.html#10709" class="Function"
      >ND&#8660;SC.&#10232;</a
      ><a name="27940"
      > </a
      ><a name="27941" href="2016-10-30-one-lambda-calculus-many-times-2.html#27911" class="Bound"
      >f</a
      ><a name="27942" class="Symbol"
      >))</a
      >
</pre><!--{% endraw %}-->


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
<!--{% raw %}--><pre class="Agda">
<a name="28703" class="Comment"
      >-- -}</a
      ><a name="28708"
      >
</a
      ><a name="28709" class="Comment"
      >-- -}</a
      ><a name="28714"
      >
</a
      ><a name="28715" class="Comment"
      >-- -}</a
      ><a name="28720"
      >
</a
      ><a name="28721" class="Comment"
      >-- -}</a
      ><a name="28726"
      >
</a
      ><a name="28727" class="Comment"
      >-- -}</a
      >
</pre><!--{% endraw %}-->
</div>
