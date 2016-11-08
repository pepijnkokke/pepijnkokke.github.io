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
<!--{% raw %}-->
<pre class="Agda">
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
</pre>
<!--{% endraw %}-->
</div>

The structure of this post will be similar to that of the previous installment---which means that we will start out by having a look at the syntax of NJ, then have a look at its semantics and relation to the system ND we discussed last time, and finally we will do the same for LJ. But first, the syntax:

<!--{% raw %}-->
<pre class="Agda">
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
</pre>
<!--{% endraw %}-->

We can reuse our notions of types and sequents from the previous post:

<div class="hidden">
<!--{% raw %}-->
<pre class="Agda">
  <a name="1287" class="Keyword"
      >import</a
      ><a name="1293"
      > </a
      ><a name="1294" href="https://agda.github.io/agda-stdlib/Algebra.html#1" class="Module"
      >Algebra</a
      ><a name="1301"
      >
  </a
      ><a name="1304" class="Keyword"
      >import</a
      ><a name="1310"
      > </a
      ><a name="1311" href="https://agda.github.io/agda-stdlib/Relation.Binary.html#1" class="Module"
      >Relation.Binary</a
      ><a name="1326"
      > </a
      ><a name="1327" class="Symbol"
      >as</a
      ><a name="1329"
      > </a
      ><a name="1330" class="Module"
      >RB</a
      ><a name="1332"
      >
  </a
      ><a name="1335" class="Keyword"
      >import</a
      ><a name="1341"
      > </a
      ><a name="1342" href="https://agda.github.io/agda-stdlib/Relation.Binary.List.Pointwise.html#1" class="Module"
      >Relation.Binary.List.Pointwise</a
      ><a name="1372"
      > </a
      ><a name="1373" class="Symbol"
      >as</a
      ><a name="1375"
      > </a
      ><a name="1376" class="Module"
      >RBLP</a
      ><a name="1380"
      >

  </a
      ><a name="1384" class="Keyword"
      >open</a
      ><a name="1388"
      > </a
      ><a name="1389" href="2016-03-20-one-lambda-calculus-many-times.html#1221" class="Module"
      >Part1.</a
      ><a name="1395" href="2016-03-20-one-lambda-calculus-many-times.html#1568" class="Module"
      >Syntax</a
      ><a name="1401"
      > </a
      ><a name="1402" href="2016-10-30-one-lambda-calculus-many-times-2.html#1149" class="Bound"
      >Atom</a
      ><a name="1406"
      > </a
      ><a name="1407" class="Keyword"
      >hiding</a
      ><a name="1413"
      > </a
      ><a name="1414" class="Symbol"
      >(</a
      ><a name="1415"
      >w&#8242;</a
      ><a name="1417" class="Symbol"
      >)</a
      ><a name="1418"
      >
  </a
      ><a name="1421" class="Keyword"
      >open</a
      ><a name="1425"
      > </a
      ><a name="1426" class="Keyword"
      >import</a
      ><a name="1432"
      > </a
      ><a name="1433" href="https://agda.github.io/agda-stdlib/Data.Nat.html#1" class="Module"
      >Data.Nat</a
      ><a name="1441"
      >                </a
      ><a name="1457" class="Keyword"
      >using</a
      ><a name="1462"
      > </a
      ><a name="1463" class="Symbol"
      >(</a
      ><a name="1464" href="Agda.Builtin.Nat.html#69" class="Datatype"
      >&#8469;</a
      ><a name="1465" class="Symbol"
      >;</a
      ><a name="1466"
      > </a
      ><a name="1467" href="Agda.Builtin.Nat.html#100" class="InductiveConstructor"
      >suc</a
      ><a name="1470" class="Symbol"
      >;</a
      ><a name="1471"
      > </a
      ><a name="1472" href="Agda.Builtin.Nat.html#87" class="InductiveConstructor"
      >zero</a
      ><a name="1476" class="Symbol"
      >)</a
      ><a name="1477"
      >
  </a
      ><a name="1480" class="Keyword"
      >open</a
      ><a name="1484"
      > </a
      ><a name="1485" class="Keyword"
      >import</a
      ><a name="1491"
      > </a
      ><a name="1492" href="https://agda.github.io/agda-stdlib/Data.Fin.html#1" class="Module"
      >Data.Fin</a
      ><a name="1500"
      >                </a
      ><a name="1516" class="Keyword"
      >using</a
      ><a name="1521"
      > </a
      ><a name="1522" class="Symbol"
      >(</a
      ><a name="1523" href="https://agda.github.io/agda-stdlib/Data.Fin.html#842" class="Datatype"
      >Fin</a
      ><a name="1526" class="Symbol"
      >;</a
      ><a name="1527"
      > </a
      ><a name="1528" href="https://agda.github.io/agda-stdlib/Data.Fin.html#895" class="InductiveConstructor"
      >suc</a
      ><a name="1531" class="Symbol"
      >;</a
      ><a name="1532"
      > </a
      ><a name="1533" href="https://agda.github.io/agda-stdlib/Data.Fin.html#864" class="InductiveConstructor"
      >zero</a
      ><a name="1537" class="Symbol"
      >)</a
      ><a name="1538"
      >
  </a
      ><a name="1541" class="Keyword"
      >open</a
      ><a name="1545"
      > </a
      ><a name="1546" class="Keyword"
      >import</a
      ><a name="1552"
      > </a
      ><a name="1553" href="https://agda.github.io/agda-stdlib/Data.List.html#1" class="Module"
      >Data.List</a
      ><a name="1562"
      >               </a
      ><a name="1577" class="Keyword"
      >using</a
      ><a name="1582"
      > </a
      ><a name="1583" class="Symbol"
      >(</a
      ><a name="1584" href="Agda.Builtin.List.html#52" class="Datatype"
      >List</a
      ><a name="1588" class="Symbol"
      >;</a
      ><a name="1589"
      > </a
      ><a name="1590" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >_&#8759;_</a
      ><a name="1593" class="Symbol"
      >;</a
      ><a name="1594"
      > </a
      ><a name="1595" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#5519" class="InductiveConstructor"
      >[]</a
      ><a name="1597" class="Symbol"
      >;</a
      ><a name="1598"
      > </a
      ><a name="1599" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >_++_</a
      ><a name="1603" class="Symbol"
      >)</a
      ><a name="1604"
      >
  </a
      ><a name="1607" class="Keyword"
      >open</a
      ><a name="1611"
      > </a
      ><a name="1612" class="Keyword"
      >import</a
      ><a name="1618"
      > </a
      ><a name="1619" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1" class="Module"
      >Data.List.Any</a
      ><a name="1632"
      >           </a
      ><a name="1643" class="Keyword"
      >using</a
      ><a name="1648"
      > </a
      ><a name="1649" class="Symbol"
      >(</a
      ><a name="1650" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="1654" class="Symbol"
      >;</a
      ><a name="1655"
      > </a
      ><a name="1656" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="1661" class="Symbol"
      >)</a
      ><a name="1662"
      >
  </a
      ><a name="1665" class="Keyword"
      >open</a
      ><a name="1669"
      > </a
      ><a name="1670" class="Keyword"
      >import</a
      ><a name="1676"
      > </a
      ><a name="1677" href="https://agda.github.io/agda-stdlib/Data.Product.html#1" class="Module"
      >Data.Product</a
      ><a name="1689"
      >            </a
      ><a name="1701" class="Keyword"
      >using</a
      ><a name="1706"
      > </a
      ><a name="1707" class="Symbol"
      >(</a
      ><a name="1708" href="https://agda.github.io/agda-stdlib/Data.Product.html#525" class="Field"
      >proj&#8321;</a
      ><a name="1713" class="Symbol"
      >;</a
      ><a name="1714"
      > </a
      ><a name="1715" href="https://agda.github.io/agda-stdlib/Data.Product.html#539" class="Field"
      >proj&#8322;</a
      ><a name="1720" class="Symbol"
      >)</a
      ><a name="1721"
      >
  </a
      ><a name="1724" class="Keyword"
      >open</a
      ><a name="1728"
      > </a
      ><a name="1729" class="Keyword"
      >import</a
      ><a name="1735"
      > </a
      ><a name="1736" href="https://agda.github.io/agda-stdlib/Function.html#1" class="Module"
      >Function</a
      ><a name="1744"
      >                </a
      ><a name="1760" class="Keyword"
      >using</a
      ><a name="1765"
      > </a
      ><a name="1766" class="Symbol"
      >(</a
      ><a name="1767" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >_$_</a
      ><a name="1770" class="Symbol"
      >)</a
      ><a name="1771"
      >
  </a
      ><a name="1774" class="Keyword"
      >open</a
      ><a name="1778"
      > </a
      ><a name="1779" class="Keyword"
      >import</a
      ><a name="1785"
      > </a
      ><a name="1786" href="https://agda.github.io/agda-stdlib/Function.Equivalence.html#1" class="Module"
      >Function.Equivalence</a
      ><a name="1806"
      >    </a
      ><a name="1810" class="Keyword"
      >using</a
      ><a name="1815"
      > </a
      ><a name="1816" class="Symbol"
      >(</a
      ><a name="1817" href="https://agda.github.io/agda-stdlib/Function.Equivalence.html#711" class="Function Operator"
      >_&#8660;_</a
      ><a name="1820" class="Symbol"
      >;</a
      ><a name="1821"
      > </a
      ><a name="1822" href="https://agda.github.io/agda-stdlib/Function.Equivalence.html#2131" class="Function"
      >id</a
      ><a name="1824" class="Symbol"
      >;</a
      ><a name="1825"
      > </a
      ><a name="1826" href="https://agda.github.io/agda-stdlib/Function.Equivalence.html#1070" class="Function"
      >map</a
      ><a name="1829" class="Symbol"
      >;</a
      ><a name="1830"
      > </a
      ><a name="1831" href="https://agda.github.io/agda-stdlib/Function.Equivalence.html#804" class="Function"
      >equivalence</a
      ><a name="1842" class="Symbol"
      >)</a
      ><a name="1843"
      >
  </a
      ><a name="1846" class="Keyword"
      >open</a
      ><a name="1850"
      > </a
      ><a name="1851" class="Keyword"
      >import</a
      ><a name="1857"
      > </a
      ><a name="1858" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.html#1" class="Module"
      >Relation.Binary.PropositionalEquality</a
      ><a name="1895"
      >
  </a
      ><a name="1898" class="Keyword"
      >open</a
      ><a name="1902"
      > </a
      ><a name="1903" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#250" class="Module"
      >Data.</a
      ><a name="1908" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#255" class="Module"
      >List.</a
      ><a name="1913" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#260" class="Module"
      >Any.</a
      ><a name="1917" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#2298" class="Module"
      >Membership</a
      ><a name="1927"
      > </a
      ><a name="1928" class="Symbol"
      >(</a
      ><a name="1929" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.html#1526" class="Function"
      >setoid</a
      ><a name="1935"
      > </a
      ><a name="1936" href="2016-03-20-one-lambda-calculus-many-times.html#2651" class="Datatype"
      >Type</a
      ><a name="1940" class="Symbol"
      >)</a
      ><a name="1941"
      > </a
      ><a name="1942" class="Keyword"
      >using</a
      ><a name="1947"
      > </a
      ><a name="1948" class="Symbol"
      >(</a
      ><a name="1949"
      >_&#8712;_</a
      ><a name="1952" class="Symbol"
      >;</a
      ><a name="1953"
      > _&#8838;_</a
      ><a name="1957" class="Symbol"
      >;</a
      ><a name="1958"
      > </a
      ><a name="1959" class="Keyword"
      >module</a
      ><a name="1965"
      > &#8838;-Reasoning</a
      ><a name="1977" class="Symbol"
      >)</a
      ><a name="1978"
      >
  </a
      ><a name="1981" class="Keyword"
      >private</a
      ><a name="1988"
      >
    </a
      ><a name="1993" class="Keyword"
      >open</a
      ><a name="1997"
      > </a
      ><a name="1998" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#3587" class="Module"
      >&#8838;-Reasoning</a
      ><a name="2009"
      > </a
      ><a name="2010" class="Keyword"
      >hiding</a
      ><a name="2016"
      > </a
      ><a name="2017" class="Symbol"
      >(</a
      ><a name="2018" href="https://agda.github.io/agda-stdlib/Relation.Binary.PreorderReasoning.html#1329" class="Function Operator"
      >_&#8776;&#10216;_&#10217;_</a
      ><a name="2024" class="Symbol"
      >)</a
      ><a name="2025"
      >
    </a
      ><a name="2030" class="Keyword"
      >module</a
      ><a name="2036"
      > </a
      ><a name="2037" href="2016-10-30-one-lambda-calculus-many-times-2.html#2037" class="Module"
      >M</a
      ><a name="2038"
      > </a
      ><a name="2039" class="Symbol"
      >=</a
      ><a name="2040"
      > </a
      ><a name="2041" href="https://agda.github.io/agda-stdlib/Algebra.html#309" class="Module"
      >Algebra.</a
      ><a name="2049" href="https://agda.github.io/agda-stdlib/Algebra.html#1154" class="Module"
      >Monoid</a
      ><a name="2055"
      > </a
      ><a name="2056" class="Symbol"
      >(</a
      ><a name="2057" href="https://agda.github.io/agda-stdlib/Data.List.html#846" class="Function"
      >Data.List.monoid</a
      ><a name="2073"
      > </a
      ><a name="2074" href="2016-03-20-one-lambda-calculus-many-times.html#2651" class="Datatype"
      >Type</a
      ><a name="2078" class="Symbol"
      >)</a
      ><a name="2079"
      >
    </a
      ><a name="2084" href="2016-10-30-one-lambda-calculus-many-times-2.html#2084" class="Function"
      >++-identity&#691;</a
      ><a name="2096"
      > </a
      ><a name="2097" class="Symbol"
      >=</a
      ><a name="2098"
      > </a
      ><a name="2099" href="https://agda.github.io/agda-stdlib/Data.Product.html#539" class="Field"
      >proj&#8322;</a
      ><a name="2104"
      > </a
      ><a name="2105" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#1106" class="Function"
      >M.identity</a
      ><a name="2115"
      >
    </a
      ><a name="2120" href="2016-10-30-one-lambda-calculus-many-times-2.html#2120" class="Function"
      >++-assoc</a
      ><a name="2128"
      >     </a
      ><a name="2133" class="Symbol"
      >=</a
      ><a name="2134"
      > </a
      ><a name="2135" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#811" class="Function"
      >M.assoc</a
      ><a name="2142"
      >

    </a
      ><a name="2148" class="Keyword"
      >infixr</a
      ><a name="2154"
      > </a
      ><a name="2155" class="Number"
      >2</a
      ><a name="2156"
      > _&#8801;&#10216;_&#10217;_
    </a
      ><a name="2168" href="2016-10-30-one-lambda-calculus-many-times-2.html#2168" class="Function Operator"
      >_&#8801;&#10216;_&#10217;_</a
      ><a name="2174"
      > </a
      ><a name="2175" class="Symbol"
      >:</a
      ><a name="2176"
      > </a
      ><a name="2177" class="Symbol"
      >&#8704;</a
      ><a name="2178"
      > </a
      ><a name="2179" href="2016-10-30-one-lambda-calculus-many-times-2.html#2179" class="Bound"
      >x</a
      ><a name="2180"
      > </a
      ><a name="2189" href="2016-10-30-one-lambda-calculus-many-times-2.html#2179" class="Bound"
      >x</a
      ><a name="2190"
      > </a
      ><a name="2191" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="2192"
      > </a
      ><a name="2193" href="2016-10-30-one-lambda-calculus-many-times-2.html#2182" class="Bound"
      >y</a
      ><a name="2194"
      > </a
      ><a name="2195" class="Symbol"
      >&#8594;</a
      ><a name="2196"
      > </a
      ><a name="2197" href="2016-10-30-one-lambda-calculus-many-times-2.html#2182" class="Bound"
      >y</a
      ><a name="2198"
      > </a
      ><a name="2199" href="https://agda.github.io/agda-stdlib/Relation.Binary.PreorderReasoning.html#1066" class="Datatype Operator"
      >IsRelatedTo</a
      ><a name="2210"
      > </a
      ><a name="2211" href="2016-10-30-one-lambda-calculus-many-times-2.html#2184" class="Bound"
      >z</a
      ><a name="2212"
      > </a
      ><a name="2213" class="Symbol"
      >&#8594;</a
      ><a name="2214"
      > </a
      ><a name="2215" href="2016-10-30-one-lambda-calculus-many-times-2.html#2179" class="Bound"
      >x</a
      ><a name="2216"
      > </a
      ><a name="2217" href="https://agda.github.io/agda-stdlib/Relation.Binary.PreorderReasoning.html#1066" class="Datatype Operator"
      >IsRelatedTo</a
      ><a name="2228"
      > </a
      ><a name="2229" href="2016-10-30-one-lambda-calculus-many-times-2.html#2184" class="Bound"
      >z</a
      ><a name="2230"
      >
    </a
      ><a name="2235" class="Symbol"
      >_</a
      ><a name="2236"
      > </a
      ><a name="2237" href="2016-10-30-one-lambda-calculus-many-times-2.html#2168" class="Function Operator"
      >&#8801;&#10216;</a
      ><a name="2239"
      > </a
      ><a name="2240" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="2244"
      > </a
      ><a name="2245" href="2016-10-30-one-lambda-calculus-many-times-2.html#2168" class="Function Operator"
      >&#10217;</a
      ><a name="2246"
      > </a
      ><a name="2247" href="2016-10-30-one-lambda-calculus-many-times-2.html#2247" class="Bound"
      >y~z</a
      ><a name="2250"
      > </a
      ><a name="2251" class="Symbol"
      >=</a
      ><a name="2252"
      > </a
      ><a name="2253" href="2016-10-30-one-lambda-calculus-many-times-2.html#2247" class="Bound"
      >y~z</a
      >
</pre>
<!--{% endraw %}-->
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

<!--{% raw %}-->
<pre class="Agda">
  <a name="7036" class="Keyword"
      >infix</a
      ><a name="7041"
      > </a
      ><a name="7042" class="Number"
      >3</a
      ><a name="7043"
      > NJ_

  </a
      ><a name="7051" class="Keyword"
      >data</a
      ><a name="7055"
      > </a
      ><a name="7056" href="2016-10-30-one-lambda-calculus-many-times-2.html#7056" class="Datatype Operator"
      >NJ_</a
      ><a name="7059"
      > </a
      ><a name="7060" class="Symbol"
      >:</a
      ><a name="7061"
      > </a
      ><a name="7062" href="2016-03-20-one-lambda-calculus-many-times.html#3957" class="Datatype"
      >Sequent</a
      ><a name="7069"
      > </a
      ><a name="7070" class="Symbol"
      >&#8594;</a
      ><a name="7071"
      > </a
      ><a name="7072" class="PrimitiveType"
      >Set</a
      ><a name="7075"
      > </a
      ><a name="7076" class="Keyword"
      >where</a
      ><a name="7081"
      >
    </a
      ><a name="7086" href="2016-10-30-one-lambda-calculus-many-times-2.html#7086" class="InductiveConstructor"
      >ax</a
      ><a name="7088"
      > </a
      ><a name="7089" class="Symbol"
      >:</a
      ><a name="7090"
      > </a
      ><a name="7107" href="2016-10-30-one-lambda-calculus-many-times-2.html#7056" class="Datatype Operator"
      >NJ</a
      ><a name="7109"
      > </a
      ><a name="7110" href="2016-10-30-one-lambda-calculus-many-times-2.html#7094" class="Bound"
      >A</a
      ><a name="7111"
      > </a
      ><a name="7112" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="7113"
      > </a
      ><a name="7114" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="7116"
      > </a
      ><a name="7117" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="7118"
      > </a
      ><a name="7119" href="2016-10-30-one-lambda-calculus-many-times-2.html#7094" class="Bound"
      >A</a
      ><a name="7120"
      >
    </a
      ><a name="7125" href="2016-10-30-one-lambda-calculus-many-times-2.html#7125" class="InductiveConstructor"
      >&#8658;i</a
      ><a name="7127"
      > </a
      ><a name="7128" class="Symbol"
      >:</a
      ><a name="7129"
      > </a
      ><a name="7146" href="2016-10-30-one-lambda-calculus-many-times-2.html#7056" class="Datatype Operator"
      >NJ</a
      ><a name="7148"
      > </a
      ><a name="7149" href="2016-10-30-one-lambda-calculus-many-times-2.html#7133" class="Bound"
      >A</a
      ><a name="7150"
      > </a
      ><a name="7151" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="7152"
      > </a
      ><a name="7153" href="2016-10-30-one-lambda-calculus-many-times-2.html#7139" class="Bound"
      >&#915;</a
      ><a name="7154"
      > </a
      ><a name="7155" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="7156"
      > </a
      ><a name="7157" href="2016-10-30-one-lambda-calculus-many-times-2.html#7135" class="Bound"
      >B</a
      ><a name="7158"
      > </a
      ><a name="7159" class="Symbol"
      >&#8594;</a
      ><a name="7160"
      > </a
      ><a name="7161" href="2016-10-30-one-lambda-calculus-many-times-2.html#7056" class="Datatype Operator"
      >NJ</a
      ><a name="7163"
      > </a
      ><a name="7164" href="2016-10-30-one-lambda-calculus-many-times-2.html#7139" class="Bound"
      >&#915;</a
      ><a name="7165"
      > </a
      ><a name="7166" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="7167"
      > </a
      ><a name="7168" href="2016-10-30-one-lambda-calculus-many-times-2.html#7133" class="Bound"
      >A</a
      ><a name="7169"
      > </a
      ><a name="7170" href="2016-03-20-one-lambda-calculus-many-times.html#2694" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="7171"
      > </a
      ><a name="7172" href="2016-10-30-one-lambda-calculus-many-times-2.html#7135" class="Bound"
      >B</a
      ><a name="7173"
      >
    </a
      ><a name="7178" href="2016-10-30-one-lambda-calculus-many-times-2.html#7178" class="InductiveConstructor"
      >&#8658;e</a
      ><a name="7180"
      > </a
      ><a name="7181" class="Symbol"
      >:</a
      ><a name="7182"
      > </a
      ><a name="7199" href="2016-10-30-one-lambda-calculus-many-times-2.html#7056" class="Datatype Operator"
      >NJ</a
      ><a name="7201"
      > </a
      ><a name="7202" href="2016-10-30-one-lambda-calculus-many-times-2.html#7192" class="Bound"
      >&#915;</a
      ><a name="7203"
      > </a
      ><a name="7204" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="7205"
      > </a
      ><a name="7206" href="2016-10-30-one-lambda-calculus-many-times-2.html#7186" class="Bound"
      >A</a
      ><a name="7207"
      > </a
      ><a name="7208" href="2016-03-20-one-lambda-calculus-many-times.html#2694" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="7209"
      > </a
      ><a name="7210" href="2016-10-30-one-lambda-calculus-many-times-2.html#7188" class="Bound"
      >B</a
      ><a name="7211"
      > </a
      ><a name="7212" class="Symbol"
      >&#8594;</a
      ><a name="7213"
      > </a
      ><a name="7214" href="2016-10-30-one-lambda-calculus-many-times-2.html#7056" class="Datatype Operator"
      >NJ</a
      ><a name="7216"
      > </a
      ><a name="7217" href="2016-10-30-one-lambda-calculus-many-times-2.html#7194" class="Bound"
      >&#916;</a
      ><a name="7218"
      > </a
      ><a name="7219" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="7220"
      > </a
      ><a name="7221" href="2016-10-30-one-lambda-calculus-many-times-2.html#7186" class="Bound"
      >A</a
      ><a name="7222"
      > </a
      ><a name="7223" class="Symbol"
      >&#8594;</a
      ><a name="7224"
      > </a
      ><a name="7225" href="2016-10-30-one-lambda-calculus-many-times-2.html#7056" class="Datatype Operator"
      >NJ</a
      ><a name="7227"
      > </a
      ><a name="7228" href="2016-10-30-one-lambda-calculus-many-times-2.html#7192" class="Bound"
      >&#915;</a
      ><a name="7229"
      > </a
      ><a name="7230" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="7232"
      > </a
      ><a name="7233" href="2016-10-30-one-lambda-calculus-many-times-2.html#7194" class="Bound"
      >&#916;</a
      ><a name="7234"
      > </a
      ><a name="7235" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="7236"
      > </a
      ><a name="7237" href="2016-10-30-one-lambda-calculus-many-times-2.html#7188" class="Bound"
      >B</a
      ><a name="7238"
      >
    </a
      ><a name="7243" href="2016-10-30-one-lambda-calculus-many-times-2.html#7243" class="InductiveConstructor"
      >w</a
      ><a name="7244"
      >  </a
      ><a name="7246" class="Symbol"
      >:</a
      ><a name="7247"
      > </a
      ><a name="7264" href="2016-10-30-one-lambda-calculus-many-times-2.html#7056" class="Datatype Operator"
      >NJ</a
      ><a name="7266"
      > </a
      ><a name="7267" href="2016-10-30-one-lambda-calculus-many-times-2.html#7257" class="Bound"
      >&#915;</a
      ><a name="7268"
      > </a
      ><a name="7269" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="7270"
      > </a
      ><a name="7271" href="2016-10-30-one-lambda-calculus-many-times-2.html#7253" class="Bound"
      >B</a
      ><a name="7272"
      > </a
      ><a name="7273" class="Symbol"
      >&#8594;</a
      ><a name="7274"
      > </a
      ><a name="7275" href="2016-10-30-one-lambda-calculus-many-times-2.html#7056" class="Datatype Operator"
      >NJ</a
      ><a name="7277"
      > </a
      ><a name="7278" href="2016-10-30-one-lambda-calculus-many-times-2.html#7251" class="Bound"
      >A</a
      ><a name="7279"
      > </a
      ><a name="7280" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="7281"
      > </a
      ><a name="7282" href="2016-10-30-one-lambda-calculus-many-times-2.html#7257" class="Bound"
      >&#915;</a
      ><a name="7283"
      > </a
      ><a name="7284" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="7285"
      > </a
      ><a name="7286" href="2016-10-30-one-lambda-calculus-many-times-2.html#7253" class="Bound"
      >B</a
      ><a name="7287"
      >
    </a
      ><a name="7292" href="2016-10-30-one-lambda-calculus-many-times-2.html#7292" class="InductiveConstructor"
      >c</a
      ><a name="7293"
      >  </a
      ><a name="7295" class="Symbol"
      >:</a
      ><a name="7296"
      > </a
      ><a name="7313" href="2016-10-30-one-lambda-calculus-many-times-2.html#7056" class="Datatype Operator"
      >NJ</a
      ><a name="7315"
      > </a
      ><a name="7316" href="2016-10-30-one-lambda-calculus-many-times-2.html#7300" class="Bound"
      >A</a
      ><a name="7317"
      > </a
      ><a name="7318" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="7319"
      > </a
      ><a name="7320" href="2016-10-30-one-lambda-calculus-many-times-2.html#7300" class="Bound"
      >A</a
      ><a name="7321"
      > </a
      ><a name="7322" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="7323"
      > </a
      ><a name="7324" href="2016-10-30-one-lambda-calculus-many-times-2.html#7306" class="Bound"
      >&#915;</a
      ><a name="7325"
      > </a
      ><a name="7326" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="7327"
      > </a
      ><a name="7328" href="2016-10-30-one-lambda-calculus-many-times-2.html#7302" class="Bound"
      >B</a
      ><a name="7329"
      > </a
      ><a name="7330" class="Symbol"
      >&#8594;</a
      ><a name="7331"
      > </a
      ><a name="7332" href="2016-10-30-one-lambda-calculus-many-times-2.html#7056" class="Datatype Operator"
      >NJ</a
      ><a name="7334"
      > </a
      ><a name="7335" href="2016-10-30-one-lambda-calculus-many-times-2.html#7300" class="Bound"
      >A</a
      ><a name="7336"
      > </a
      ><a name="7337" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="7338"
      > </a
      ><a name="7339" href="2016-10-30-one-lambda-calculus-many-times-2.html#7306" class="Bound"
      >&#915;</a
      ><a name="7340"
      > </a
      ><a name="7341" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="7342"
      > </a
      ><a name="7343" href="2016-10-30-one-lambda-calculus-many-times-2.html#7302" class="Bound"
      >B</a
      ><a name="7344"
      >
    </a
      ><a name="7349" href="2016-10-30-one-lambda-calculus-many-times-2.html#7349" class="InductiveConstructor"
      >p</a
      ><a name="7350"
      >  </a
      ><a name="7352" class="Symbol"
      >:</a
      ><a name="7353"
      > </a
      ><a name="7366" class="Symbol"
      >&#8704;</a
      ><a name="7367"
      > </a
      ><a name="7368" href="2016-10-30-one-lambda-calculus-many-times-2.html#7368" class="Bound"
      >&#915;</a
      ><a name="7369"
      > </a
      ><a name="7370" class="Symbol"
      >&#8594;</a
      ><a name="7371"
      > </a
      ><a name="7380" href="2016-10-30-one-lambda-calculus-many-times-2.html#7056" class="Datatype Operator"
      >NJ</a
      ><a name="7382"
      > </a
      ><a name="7383" href="2016-10-30-one-lambda-calculus-many-times-2.html#7368" class="Bound"
      >&#915;</a
      ><a name="7384"
      > </a
      ><a name="7385" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="7387"
      > </a
      ><a name="7388" href="2016-10-30-one-lambda-calculus-many-times-2.html#7357" class="Bound"
      >A</a
      ><a name="7389"
      > </a
      ><a name="7390" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="7391"
      > </a
      ><a name="7392" href="2016-10-30-one-lambda-calculus-many-times-2.html#7359" class="Bound"
      >B</a
      ><a name="7393"
      > </a
      ><a name="7394" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="7395"
      > </a
      ><a name="7396" href="2016-10-30-one-lambda-calculus-many-times-2.html#7375" class="Bound"
      >&#916;</a
      ><a name="7397"
      > </a
      ><a name="7398" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="7399"
      > </a
      ><a name="7400" href="2016-10-30-one-lambda-calculus-many-times-2.html#7361" class="Bound"
      >C</a
      ><a name="7401"
      > </a
      ><a name="7402" class="Symbol"
      >&#8594;</a
      ><a name="7403"
      > </a
      ><a name="7404" href="2016-10-30-one-lambda-calculus-many-times-2.html#7056" class="Datatype Operator"
      >NJ</a
      ><a name="7406"
      > </a
      ><a name="7407" href="2016-10-30-one-lambda-calculus-many-times-2.html#7368" class="Bound"
      >&#915;</a
      ><a name="7408"
      > </a
      ><a name="7409" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="7411"
      > </a
      ><a name="7412" href="2016-10-30-one-lambda-calculus-many-times-2.html#7359" class="Bound"
      >B</a
      ><a name="7413"
      > </a
      ><a name="7414" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="7415"
      > </a
      ><a name="7416" href="2016-10-30-one-lambda-calculus-many-times-2.html#7357" class="Bound"
      >A</a
      ><a name="7417"
      > </a
      ><a name="7418" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="7419"
      > </a
      ><a name="7420" href="2016-10-30-one-lambda-calculus-many-times-2.html#7375" class="Bound"
      >&#916;</a
      ><a name="7421"
      > </a
      ><a name="7422" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="7423"
      > </a
      ><a name="7424" href="2016-10-30-one-lambda-calculus-many-times-2.html#7361" class="Bound"
      >C</a
      >
</pre>
<!--{% endraw %}-->



### Admissible Structural Rules in ND

If we are to have any hope of proving the equivalence between the implicit and the explicit systems, we should be able to prove that the implicit systems admit[^admit] the same structural rules. In the previous post, we've already proven the following theorem for ND:

> If $$\Gamma \subseteq \Gamma\prime$$ and $$\Gamma \vdash A$$, then
> $$\Gamma\prime \vdash A$$.

<div class="hidden">
<!--{% raw %}-->
<pre class="Agda">
  <a name="7883" class="Keyword"
      >module</a
      ><a name="7889"
      > </a
      ><a name="7890" href="2016-10-30-one-lambda-calculus-many-times-2.html#7890" class="Module"
      >ND</a
      ><a name="7892"
      > </a
      ><a name="7893" class="Keyword"
      >where</a
      ><a name="7898"
      >
    </a
      ><a name="7903" class="Keyword"
      >open</a
      ><a name="7907"
      > </a
      ><a name="7908" href="2016-03-20-one-lambda-calculus-many-times.html#1221" class="Module"
      >Part1.</a
      ><a name="7914" href="2016-03-20-one-lambda-calculus-many-times.html#1568" class="Module"
      >Syntax</a
      ><a name="7920"
      > </a
      ><a name="7921" href="2016-10-30-one-lambda-calculus-many-times-2.html#1149" class="Bound"
      >Atom</a
      ><a name="7925"
      > </a
      ><a name="7926" class="Keyword"
      >public</a
      ><a name="7932"
      > </a
      ><a name="7933" class="Keyword"
      >using</a
      ><a name="7938"
      > </a
      ><a name="7939" class="Symbol"
      >(</a
      ><a name="7940"
      >w&#8242;</a
      ><a name="7942" class="Symbol"
      >)</a
      >
</pre>
<!--{% endraw %}-->
</div>

And we've also shown that we can very easily use this theorem to define weakening, because <a class="Agda InductiveConstructor Spec" target="_blank" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227">there</a> is a proof that "weakening", i.e. <span class="Agda Spec"><a class="Bound">Γ</a> <a href="https://agda.github.io/agda-stdlib/Data.List.Any.html#3056" class="Function Operator" target="_blank">⊆</a> <a class="Bound">A</a> <a href="https://agda.github.io/agda-stdlib/Agda.Builtin.List.html#104" class="InductiveConstructor Operator" target="_blank">∷</a> <a class="Bound">Γ</a></span>, holds for the subset relationship.

<pre class="Agda Spec">    <a href="/2016/one-lambda-calculus-many-times/#8603" class="Function">w′</a><a> </a><a class="Symbol">:</a><a> </a><a href="/2016/one-lambda-calculus-many-times/#5371" class="Datatype Operator">ND</a><a> </a><a class="Bound">Γ</a><a> </a><a href="/2016/one-lambda-calculus-many-times/#3979" class="InductiveConstructor Operator">⊢</a><a> </a><a class="Bound">B</a><a> </a><a class="Symbol">→</a><a> </a><a href="/2016/one-lambda-calculus-many-times/#5371" class="Datatype Operator">ND</a><a> </a><a class="Bound">A</a><a> </a><a href="https://agda.github.io/agda-stdlib/Agda.Builtin.List.html#104" class="InductiveConstructor Operator" target="_blank">∷</a><a> </a><a class="Bound">Γ</a><a> </a><a href="/2016/one-lambda-calculus-many-times/#3979" class="InductiveConstructor Operator">⊢</a><a> </a><a class="Bound">B</a><a>
    </a><a href="/2016/one-lambda-calculus-many-times/#8603" class="Function">w′</a><a> </a><a class="Symbol">=</a><a> </a><a href="/2016/one-lambda-calculus-many-times/#7305" class="Function">struct</a><a> </a><a href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor" target="_blank">there</a></pre>

Therefore, all we need to show to extend this to contraction and permutation is that their respective equations, <span class="Agda Spec"><a class="Bound">A</a> <a href="https://agda.github.io/agda-stdlib/Agda.Builtin.List.html#104" class="InductiveConstructor Operator" target="_blank">∷</a> <a class="Bound">A</a> <a href="https://agda.github.io/agda-stdlib/Agda.Builtin.List.html#104" class="InductiveConstructor Operator" target="_blank">∷</a> <a class="Bound">Γ</a> <a href="https://agda.github.io/agda-stdlib/Data.List.Any.html#3056" class="Function Operator" target="_blank">⊆</a> <a class="Bound">A</a> <a href="https://agda.github.io/agda-stdlib/Agda.Builtin.List.html#104" class="InductiveConstructor Operator" target="_blank">∷</a> <a class="Bound">Γ</a></span> and <span class="Agda Spec"><a class="Bound">Γ</a><a> </a><a href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator" target="_blank">++</a><a> </a><a class="Bound">A</a><a> </a><a href="https://agda.github.io/agda-stdlib/Agda.Builtin.List.html#104" class="InductiveConstructor Operator" target="_blank">∷</a><a> </a><a class="Bound">B</a><a> </a><a href="https://agda.github.io/agda-stdlib/Agda.Builtin.List.html#104" class="InductiveConstructor Operator" target="_blank">∷</a><a> </a><a class="Bound">Δ</a><a> </a><a href="https://agda.github.io/agda-stdlib/Data.List.Any.html#3056" class="Function Operator" target="_blank">⊆</a><a> </a><a class="Bound">Γ</a><a> </a><a href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator" target="_blank">++</a><a> </a><a class="Bound">B</a><a> </a><a href="https://agda.github.io/agda-stdlib/Agda.Builtin.List.html#104" class="InductiveConstructor Operator" target="_blank">∷</a><a> </a><a class="Bound">A</a><a> </a><a href="https://agda.github.io/agda-stdlib/Agda.Builtin.List.html#104" class="InductiveConstructor Operator" target="_blank">∷</a><a> </a><a class="Bound">Δ</a></span>, hold for the subset relation as well. This is simply a matter of reindexing. For contraction, if our "index" (made up of <a class="Agda Spec InductiveConstructor" target="_blank" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174">here</a> and <a class="Agda InductiveConstructor Spec" target="_blank" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227">there</a>) points to the first formula, we keep it the same. Otherwise, we subtract one. That way, the first two formulas are *contracted*, and the rest is adjusted accordingly.

<!--{% raw %}-->
<pre class="Agda">
    <a name="12351" href="2016-10-30-one-lambda-calculus-many-times-2.html#12351" class="Function"
      >c&#8242;</a
      ><a name="12353"
      > </a
      ><a name="12354" class="Symbol"
      >:</a
      ><a name="12355"
      > </a
      ><a name="12368" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="12370"
      > </a
      ><a name="12371" href="2016-10-30-one-lambda-calculus-many-times-2.html#12359" class="Bound"
      >A</a
      ><a name="12372"
      > </a
      ><a name="12373" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12374"
      > </a
      ><a name="12375" href="2016-10-30-one-lambda-calculus-many-times-2.html#12359" class="Bound"
      >A</a
      ><a name="12376"
      > </a
      ><a name="12377" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12378"
      > </a
      ><a name="12379" href="2016-10-30-one-lambda-calculus-many-times-2.html#12363" class="Bound"
      >&#915;</a
      ><a name="12380"
      > </a
      ><a name="12381" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="12382"
      > </a
      ><a name="12383" href="2016-10-30-one-lambda-calculus-many-times-2.html#12361" class="Bound"
      >B</a
      ><a name="12384"
      > </a
      ><a name="12385" class="Symbol"
      >&#8594;</a
      ><a name="12386"
      > </a
      ><a name="12387" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="12389"
      > </a
      ><a name="12390" href="2016-10-30-one-lambda-calculus-many-times-2.html#12359" class="Bound"
      >A</a
      ><a name="12391"
      > </a
      ><a name="12392" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12393"
      > </a
      ><a name="12394" href="2016-10-30-one-lambda-calculus-many-times-2.html#12363" class="Bound"
      >&#915;</a
      ><a name="12395"
      > </a
      ><a name="12396" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="12397"
      > </a
      ><a name="12398" href="2016-10-30-one-lambda-calculus-many-times-2.html#12361" class="Bound"
      >B</a
      ><a name="12399"
      >
    </a
      ><a name="12404" href="2016-10-30-one-lambda-calculus-many-times-2.html#12351" class="Function"
      >c&#8242;</a
      ><a name="12406"
      > </a
      ><a name="12411" class="Symbol"
      >=</a
      ><a name="12412"
      > </a
      ><a name="12413" href="2016-03-20-one-lambda-calculus-many-times.html#7307" class="Function"
      >struct</a
      ><a name="12419"
      > </a
      ><a name="12420" href="2016-10-30-one-lambda-calculus-many-times-2.html#12450" class="Function"
      >contract&#8242;</a
      ><a name="12429"
      >
      </a
      ><a name="12436" class="Keyword"
      >where</a
      ><a name="12441"
      >
        </a
      ><a name="12450" href="2016-10-30-one-lambda-calculus-many-times-2.html#12450" class="Function"
      >contract&#8242;</a
      ><a name="12459"
      > </a
      ><a name="12460" class="Symbol"
      >:</a
      ><a name="12461"
      > </a
      ><a name="12472" href="2016-10-30-one-lambda-calculus-many-times-2.html#12465" class="Bound"
      >A</a
      ><a name="12473"
      > </a
      ><a name="12474" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12475"
      > </a
      ><a name="12476" href="2016-10-30-one-lambda-calculus-many-times-2.html#12465" class="Bound"
      >A</a
      ><a name="12477"
      > </a
      ><a name="12478" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12479"
      > </a
      ><a name="12480" href="2016-10-30-one-lambda-calculus-many-times-2.html#12467" class="Bound"
      >&#915;</a
      ><a name="12481"
      > </a
      ><a name="12482" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#3056" class="Function Operator"
      >&#8838;</a
      ><a name="12483"
      > </a
      ><a name="12484" href="2016-10-30-one-lambda-calculus-many-times-2.html#12465" class="Bound"
      >A</a
      ><a name="12485"
      > </a
      ><a name="12486" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12487"
      > </a
      ><a name="12488" href="2016-10-30-one-lambda-calculus-many-times-2.html#12467" class="Bound"
      >&#915;</a
      ><a name="12489"
      >
        </a
      ><a name="12498" href="2016-10-30-one-lambda-calculus-many-times-2.html#12450" class="Function"
      >contract&#8242;</a
      ><a name="12507"
      > </a
      ><a name="12508" class="Symbol"
      >(</a
      ><a name="12509" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="12513"
      > </a
      ><a name="12514" href="2016-10-30-one-lambda-calculus-many-times-2.html#12514" class="Bound"
      >px</a
      ><a name="12516" class="Symbol"
      >)</a
      ><a name="12517"
      > </a
      ><a name="12518" class="Symbol"
      >=</a
      ><a name="12519"
      > </a
      ><a name="12520" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="12524"
      > </a
      ><a name="12525" href="2016-10-30-one-lambda-calculus-many-times-2.html#12514" class="Bound"
      >px</a
      ><a name="12527"
      >
        </a
      ><a name="12536" href="2016-10-30-one-lambda-calculus-many-times-2.html#12450" class="Function"
      >contract&#8242;</a
      ><a name="12545"
      > </a
      ><a name="12546" class="Symbol"
      >(</a
      ><a name="12547" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="12552"
      > </a
      ><a name="12553" href="2016-10-30-one-lambda-calculus-many-times-2.html#12553" class="Bound"
      >i</a
      ><a name="12554" class="Symbol"
      >)</a
      ><a name="12555"
      > </a
      ><a name="12556" class="Symbol"
      >=</a
      ><a name="12557"
      > </a
      ><a name="12558" href="2016-10-30-one-lambda-calculus-many-times-2.html#12553" class="Bound"
      >i</a
      >
</pre>
<!--{% endraw %}-->

And for permutation, we skip through our index until we've passed the $$\Gamma$$ portion of the context, and then we swap the first two formulas.

<!--{% raw %}-->
<pre class="Agda">
    <a name="12736" href="2016-10-30-one-lambda-calculus-many-times-2.html#12736" class="Function"
      >p&#8242;</a
      ><a name="12738"
      > </a
      ><a name="12739" class="Symbol"
      >:</a
      ><a name="12740"
      > </a
      ><a name="12753" class="Symbol"
      >&#8704;</a
      ><a name="12754"
      > </a
      ><a name="12755" href="2016-10-30-one-lambda-calculus-many-times-2.html#12755" class="Bound"
      >&#915;</a
      ><a name="12756"
      > </a
      ><a name="12757" class="Symbol"
      >&#8594;</a
      ><a name="12758"
      > </a
      ><a name="12767" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="12769"
      > </a
      ><a name="12770" href="2016-10-30-one-lambda-calculus-many-times-2.html#12755" class="Bound"
      >&#915;</a
      ><a name="12771"
      > </a
      ><a name="12772" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="12774"
      > </a
      ><a name="12775" href="2016-10-30-one-lambda-calculus-many-times-2.html#12744" class="Bound"
      >A</a
      ><a name="12776"
      > </a
      ><a name="12777" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12778"
      > </a
      ><a name="12779" href="2016-10-30-one-lambda-calculus-many-times-2.html#12746" class="Bound"
      >B</a
      ><a name="12780"
      > </a
      ><a name="12781" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12782"
      > </a
      ><a name="12783" href="2016-10-30-one-lambda-calculus-many-times-2.html#12762" class="Bound"
      >&#916;</a
      ><a name="12784"
      > </a
      ><a name="12785" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="12786"
      > </a
      ><a name="12787" href="2016-10-30-one-lambda-calculus-many-times-2.html#12748" class="Bound"
      >C</a
      ><a name="12788"
      > </a
      ><a name="12789" class="Symbol"
      >&#8594;</a
      ><a name="12790"
      > </a
      ><a name="12791" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="12793"
      > </a
      ><a name="12794" href="2016-10-30-one-lambda-calculus-many-times-2.html#12755" class="Bound"
      >&#915;</a
      ><a name="12795"
      > </a
      ><a name="12796" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="12798"
      > </a
      ><a name="12799" href="2016-10-30-one-lambda-calculus-many-times-2.html#12746" class="Bound"
      >B</a
      ><a name="12800"
      > </a
      ><a name="12801" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12802"
      > </a
      ><a name="12803" href="2016-10-30-one-lambda-calculus-many-times-2.html#12744" class="Bound"
      >A</a
      ><a name="12804"
      > </a
      ><a name="12805" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12806"
      > </a
      ><a name="12807" href="2016-10-30-one-lambda-calculus-many-times-2.html#12762" class="Bound"
      >&#916;</a
      ><a name="12808"
      > </a
      ><a name="12809" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="12810"
      > </a
      ><a name="12811" href="2016-10-30-one-lambda-calculus-many-times-2.html#12748" class="Bound"
      >C</a
      ><a name="12812"
      >
    </a
      ><a name="12817" href="2016-10-30-one-lambda-calculus-many-times-2.html#12736" class="Function"
      >p&#8242;</a
      ><a name="12819"
      > </a
      ><a name="12820" href="2016-10-30-one-lambda-calculus-many-times-2.html#12820" class="Bound"
      >&#915;</a
      ><a name="12821"
      > </a
      ><a name="12822" class="Symbol"
      >=</a
      ><a name="12823"
      > </a
      ><a name="12824" href="2016-03-20-one-lambda-calculus-many-times.html#7307" class="Function"
      >struct</a
      ><a name="12830"
      > </a
      ><a name="12831" class="Symbol"
      >(</a
      ><a name="12832" href="2016-10-30-one-lambda-calculus-many-times-2.html#12864" class="Function"
      >permute&#8242;</a
      ><a name="12840"
      > </a
      ><a name="12841" href="2016-10-30-one-lambda-calculus-many-times-2.html#12820" class="Bound"
      >&#915;</a
      ><a name="12842" class="Symbol"
      >)</a
      ><a name="12843"
      >
      </a
      ><a name="12850" class="Keyword"
      >where</a
      ><a name="12855"
      >
        </a
      ><a name="12864" href="2016-10-30-one-lambda-calculus-many-times-2.html#12864" class="Function"
      >permute&#8242;</a
      ><a name="12872"
      > </a
      ><a name="12873" class="Symbol"
      >:</a
      ><a name="12874"
      > </a
      ><a name="12885" class="Symbol"
      >&#8704;</a
      ><a name="12886"
      > </a
      ><a name="12887" href="2016-10-30-one-lambda-calculus-many-times-2.html#12887" class="Bound"
      >&#915;</a
      ><a name="12888"
      > </a
      ><a name="12889" class="Symbol"
      >&#8594;</a
      ><a name="12890"
      > </a
      ><a name="12899" href="2016-10-30-one-lambda-calculus-many-times-2.html#12887" class="Bound"
      >&#915;</a
      ><a name="12900"
      > </a
      ><a name="12901" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="12903"
      > </a
      ><a name="12904" href="2016-10-30-one-lambda-calculus-many-times-2.html#12878" class="Bound"
      >A</a
      ><a name="12905"
      > </a
      ><a name="12906" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12907"
      > </a
      ><a name="12908" href="2016-10-30-one-lambda-calculus-many-times-2.html#12880" class="Bound"
      >B</a
      ><a name="12909"
      > </a
      ><a name="12910" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12911"
      > </a
      ><a name="12912" href="2016-10-30-one-lambda-calculus-many-times-2.html#12894" class="Bound"
      >&#916;</a
      ><a name="12913"
      > </a
      ><a name="12914" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#3056" class="Function Operator"
      >&#8838;</a
      ><a name="12915"
      > </a
      ><a name="12916" href="2016-10-30-one-lambda-calculus-many-times-2.html#12887" class="Bound"
      >&#915;</a
      ><a name="12917"
      > </a
      ><a name="12918" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="12920"
      > </a
      ><a name="12921" href="2016-10-30-one-lambda-calculus-many-times-2.html#12880" class="Bound"
      >B</a
      ><a name="12922"
      > </a
      ><a name="12923" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12924"
      > </a
      ><a name="12925" href="2016-10-30-one-lambda-calculus-many-times-2.html#12878" class="Bound"
      >A</a
      ><a name="12926"
      > </a
      ><a name="12927" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12928"
      > </a
      ><a name="12929" href="2016-10-30-one-lambda-calculus-many-times-2.html#12894" class="Bound"
      >&#916;</a
      ><a name="12930"
      >
        </a
      ><a name="12939" href="2016-10-30-one-lambda-calculus-many-times-2.html#12864" class="Function"
      >permute&#8242;</a
      ><a name="12947"
      > </a
      ><a name="12948" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="12950"
      >      </a
      ><a name="12956" class="Symbol"
      >(</a
      ><a name="12957" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="12961"
      > </a
      ><a name="12962" href="2016-10-30-one-lambda-calculus-many-times-2.html#12962" class="Bound"
      >px</a
      ><a name="12964" class="Symbol"
      >)</a
      ><a name="12965"
      >         </a
      ><a name="12974" class="Symbol"
      >=</a
      ><a name="12975"
      > </a
      ><a name="12976" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="12981"
      > </a
      ><a name="12982" class="Symbol"
      >(</a
      ><a name="12983" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="12987"
      > </a
      ><a name="12988" href="2016-10-30-one-lambda-calculus-many-times-2.html#12962" class="Bound"
      >px</a
      ><a name="12990" class="Symbol"
      >)</a
      ><a name="12991"
      >
        </a
      ><a name="13000" href="2016-10-30-one-lambda-calculus-many-times-2.html#12864" class="Function"
      >permute&#8242;</a
      ><a name="13008"
      > </a
      ><a name="13009" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="13011"
      >      </a
      ><a name="13017" class="Symbol"
      >(</a
      ><a name="13018" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="13023"
      > </a
      ><a name="13024" class="Symbol"
      >(</a
      ><a name="13025" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="13029"
      > </a
      ><a name="13030" href="2016-10-30-one-lambda-calculus-many-times-2.html#13030" class="Bound"
      >px</a
      ><a name="13032" class="Symbol"
      >))</a
      ><a name="13034"
      > </a
      ><a name="13035" class="Symbol"
      >=</a
      ><a name="13036"
      > </a
      ><a name="13037" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="13041"
      > </a
      ><a name="13042" href="2016-10-30-one-lambda-calculus-many-times-2.html#13030" class="Bound"
      >px</a
      ><a name="13044"
      >
        </a
      ><a name="13053" href="2016-10-30-one-lambda-calculus-many-times-2.html#12864" class="Function"
      >permute&#8242;</a
      ><a name="13061"
      > </a
      ><a name="13062" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="13064"
      >      </a
      ><a name="13070" class="Symbol"
      >(</a
      ><a name="13071" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="13076"
      > </a
      ><a name="13077" class="Symbol"
      >(</a
      ><a name="13078" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="13083"
      > </a
      ><a name="13084" href="2016-10-30-one-lambda-calculus-many-times-2.html#13084" class="Bound"
      >i</a
      ><a name="13085" class="Symbol"
      >))</a
      ><a name="13087"
      > </a
      ><a name="13088" class="Symbol"
      >=</a
      ><a name="13089"
      > </a
      ><a name="13090" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="13095"
      > </a
      ><a name="13096" class="Symbol"
      >(</a
      ><a name="13097" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="13102"
      > </a
      ><a name="13103" href="2016-10-30-one-lambda-calculus-many-times-2.html#13084" class="Bound"
      >i</a
      ><a name="13104" class="Symbol"
      >)</a
      ><a name="13105"
      >
        </a
      ><a name="13114" href="2016-10-30-one-lambda-calculus-many-times-2.html#12864" class="Function"
      >permute&#8242;</a
      ><a name="13122"
      > </a
      ><a name="13123" class="Symbol"
      >(</a
      ><a name="13124" href="2016-10-30-one-lambda-calculus-many-times-2.html#13124" class="Bound"
      >C</a
      ><a name="13125"
      > </a
      ><a name="13126" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="13127"
      > </a
      ><a name="13128" href="2016-10-30-one-lambda-calculus-many-times-2.html#13128" class="Bound"
      >&#915;</a
      ><a name="13129" class="Symbol"
      >)</a
      ><a name="13130"
      > </a
      ><a name="13131" class="Symbol"
      >(</a
      ><a name="13132" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="13136"
      > </a
      ><a name="13137" href="2016-10-30-one-lambda-calculus-many-times-2.html#13137" class="Bound"
      >px</a
      ><a name="13139" class="Symbol"
      >)</a
      ><a name="13140"
      >         </a
      ><a name="13149" class="Symbol"
      >=</a
      ><a name="13150"
      > </a
      ><a name="13151" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="13155"
      > </a
      ><a name="13156" href="2016-10-30-one-lambda-calculus-many-times-2.html#13137" class="Bound"
      >px</a
      ><a name="13158"
      >
        </a
      ><a name="13167" href="2016-10-30-one-lambda-calculus-many-times-2.html#12864" class="Function"
      >permute&#8242;</a
      ><a name="13175"
      > </a
      ><a name="13176" class="Symbol"
      >(</a
      ><a name="13177" href="2016-10-30-one-lambda-calculus-many-times-2.html#13177" class="Bound"
      >C</a
      ><a name="13178"
      > </a
      ><a name="13179" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="13180"
      > </a
      ><a name="13181" href="2016-10-30-one-lambda-calculus-many-times-2.html#13181" class="Bound"
      >&#915;</a
      ><a name="13182" class="Symbol"
      >)</a
      ><a name="13183"
      > </a
      ><a name="13184" class="Symbol"
      >(</a
      ><a name="13185" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="13190"
      > </a
      ><a name="13191" href="2016-10-30-one-lambda-calculus-many-times-2.html#13191" class="Bound"
      >i</a
      ><a name="13192" class="Symbol"
      >)</a
      ><a name="13193"
      >         </a
      ><a name="13202" class="Symbol"
      >=</a
      ><a name="13203"
      > </a
      ><a name="13204" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="13209"
      > </a
      ><a name="13210" class="Symbol"
      >(</a
      ><a name="13211" href="2016-10-30-one-lambda-calculus-many-times-2.html#12864" class="Function"
      >permute&#8242;</a
      ><a name="13219"
      > </a
      ><a name="13220" href="2016-10-30-one-lambda-calculus-many-times-2.html#13181" class="Bound"
      >&#915;</a
      ><a name="13221"
      > </a
      ><a name="13222" href="2016-10-30-one-lambda-calculus-many-times-2.html#13191" class="Bound"
      >i</a
      ><a name="13223" class="Symbol"
      >)</a
      >
</pre>
<!--{% endraw %}-->

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

<!--{% raw %}-->
<pre class="Agda">
    <a name="16574" href="2016-10-30-one-lambda-calculus-many-times-2.html#16574" class="Function"
      >weaken</a
      ><a name="16580"
      > </a
      ><a name="16581" class="Symbol"
      >:</a
      ><a name="16582"
      > </a
      ><a name="16583" class="Symbol"
      >&#8704;</a
      ><a name="16584"
      > </a
      ><a name="16585" href="2016-10-30-one-lambda-calculus-many-times-2.html#16585" class="Bound"
      >&#915;</a
      ><a name="16586"
      > </a
      ><a name="16587" class="Symbol"
      >&#8594;</a
      ><a name="16588"
      > </a
      ><a name="16597" href="2016-10-30-one-lambda-calculus-many-times-2.html#16592" class="Bound"
      >&#916;</a
      ><a name="16598"
      > </a
      ><a name="16599" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#3056" class="Function Operator"
      >&#8838;</a
      ><a name="16600"
      > </a
      ><a name="16601" href="2016-10-30-one-lambda-calculus-many-times-2.html#16585" class="Bound"
      >&#915;</a
      ><a name="16602"
      > </a
      ><a name="16603" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="16605"
      > </a
      ><a name="16606" href="2016-10-30-one-lambda-calculus-many-times-2.html#16592" class="Bound"
      >&#916;</a
      ><a name="16607"
      >
    </a
      ><a name="16612" href="2016-10-30-one-lambda-calculus-many-times-2.html#16574" class="Function"
      >weaken</a
      ><a name="16618"
      > </a
      ><a name="16619" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="16621"
      >      </a
      ><a name="16627" href="2016-10-30-one-lambda-calculus-many-times-2.html#16627" class="Bound"
      >i</a
      ><a name="16628"
      > </a
      ><a name="16629" class="Symbol"
      >=</a
      ><a name="16630"
      > </a
      ><a name="16631" href="2016-10-30-one-lambda-calculus-many-times-2.html#16627" class="Bound"
      >i</a
      ><a name="16632"
      >
    </a
      ><a name="16637" href="2016-10-30-one-lambda-calculus-many-times-2.html#16574" class="Function"
      >weaken</a
      ><a name="16643"
      > </a
      ><a name="16644" class="Symbol"
      >(</a
      ><a name="16645" href="2016-10-30-one-lambda-calculus-many-times-2.html#16645" class="Bound"
      >A</a
      ><a name="16646"
      > </a
      ><a name="16647" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="16648"
      > </a
      ><a name="16649" href="2016-10-30-one-lambda-calculus-many-times-2.html#16649" class="Bound"
      >&#915;</a
      ><a name="16650" class="Symbol"
      >)</a
      ><a name="16651"
      > </a
      ><a name="16652" href="2016-10-30-one-lambda-calculus-many-times-2.html#16652" class="Bound"
      >i</a
      ><a name="16653"
      > </a
      ><a name="16654" class="Symbol"
      >=</a
      ><a name="16655"
      > </a
      ><a name="16656" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="16661"
      > </a
      ><a name="16662" class="Symbol"
      >(</a
      ><a name="16663" href="2016-10-30-one-lambda-calculus-many-times-2.html#16574" class="Function"
      >weaken</a
      ><a name="16669"
      > </a
      ><a name="16670" href="2016-10-30-one-lambda-calculus-many-times-2.html#16649" class="Bound"
      >&#915;</a
      ><a name="16671"
      > </a
      ><a name="16672" href="2016-10-30-one-lambda-calculus-many-times-2.html#16652" class="Bound"
      >i</a
      ><a name="16673" class="Symbol"
      >)</a
      >
</pre>
<!--{% endraw %}-->

Forwards movement, or $$\small f^+$$, is a little bit more involved: we move a formula $$A$$ past a context $$\Sigma$$. We do so without moving any formulas in the prefix $$\Gamma$$ or the suffix $$\Delta$$. The definition of forwards movement is split into two maps on indices: <a class="Agda Spec Function">forward</a> and <a class="Agda Spec Function">forward′</a>. In <a class="Agda Spec Function">forward</a>, we define the mapping for indices which point to some position in $$\Gamma$$; nothing changes. Once we have moved past $$\Gamma$$, we enter the nested function <a class="Agda Spec Function">forward′</a>, and $$\Sigma$$. Here, we start moving each index one position back, to make room for the formula $$A$$. Once we move past $$\Sigma$$, and find the index pointint to $$A$$, all we have to do is return <a class="Agda Spec InductiveConstructor" target="_blank" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174">here</a>. Nothing has to change for the indices pointing into $$\Delta$$.

<!--{% raw %}-->
<pre class="Agda">
    <a name="17722" href="2016-10-30-one-lambda-calculus-many-times-2.html#17722" class="Function"
      >forward</a
      ><a name="17729"
      > </a
      ><a name="17730" class="Symbol"
      >:</a
      ><a name="17731"
      > </a
      ><a name="17740" class="Symbol"
      >&#8704;</a
      ><a name="17741"
      > </a
      ><a name="17742" href="2016-10-30-one-lambda-calculus-many-times-2.html#17742" class="Bound"
      >&#915;</a
      ><a name="17743"
      > </a
      ><a name="17744" href="2016-10-30-one-lambda-calculus-many-times-2.html#17744" class="Bound"
      >&#931;</a
      ><a name="17745"
      > </a
      ><a name="17746" class="Symbol"
      >&#8594;</a
      ><a name="17747"
      > </a
      ><a name="17756" class="Symbol"
      >(</a
      ><a name="17757" href="2016-10-30-one-lambda-calculus-many-times-2.html#17742" class="Bound"
      >&#915;</a
      ><a name="17758"
      > </a
      ><a name="17759" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="17761"
      > </a
      ><a name="17762" href="2016-10-30-one-lambda-calculus-many-times-2.html#17744" class="Bound"
      >&#931;</a
      ><a name="17763" class="Symbol"
      >)</a
      ><a name="17764"
      > </a
      ><a name="17765" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="17767"
      > </a
      ><a name="17768" href="2016-10-30-one-lambda-calculus-many-times-2.html#17735" class="Bound"
      >A</a
      ><a name="17769"
      > </a
      ><a name="17770" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="17771"
      > </a
      ><a name="17772" href="2016-10-30-one-lambda-calculus-many-times-2.html#17751" class="Bound"
      >&#916;</a
      ><a name="17773"
      > </a
      ><a name="17774" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#3056" class="Function Operator"
      >&#8838;</a
      ><a name="17775"
      > </a
      ><a name="17776" class="Symbol"
      >(</a
      ><a name="17777" href="2016-10-30-one-lambda-calculus-many-times-2.html#17742" class="Bound"
      >&#915;</a
      ><a name="17778"
      > </a
      ><a name="17779" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="17781"
      > </a
      ><a name="17782" href="2016-10-30-one-lambda-calculus-many-times-2.html#17735" class="Bound"
      >A</a
      ><a name="17783"
      > </a
      ><a name="17784" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="17785"
      > </a
      ><a name="17786" href="2016-10-30-one-lambda-calculus-many-times-2.html#17744" class="Bound"
      >&#931;</a
      ><a name="17787" class="Symbol"
      >)</a
      ><a name="17788"
      > </a
      ><a name="17789" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="17791"
      > </a
      ><a name="17792" href="2016-10-30-one-lambda-calculus-many-times-2.html#17751" class="Bound"
      >&#916;</a
      ><a name="17793"
      >
    </a
      ><a name="17798" href="2016-10-30-one-lambda-calculus-many-times-2.html#17722" class="Function"
      >forward</a
      ><a name="17805"
      > </a
      ><a name="17806" class="Symbol"
      >(</a
      ><a name="17807" href="2016-10-30-one-lambda-calculus-many-times-2.html#17807" class="Bound"
      >C</a
      ><a name="17808"
      > </a
      ><a name="17809" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="17810"
      > </a
      ><a name="17811" href="2016-10-30-one-lambda-calculus-many-times-2.html#17811" class="Bound"
      >&#915;</a
      ><a name="17812" class="Symbol"
      >)</a
      ><a name="17813"
      > </a
      ><a name="17814" href="2016-10-30-one-lambda-calculus-many-times-2.html#17814" class="Bound"
      >&#931;</a
      ><a name="17815"
      > </a
      ><a name="17816" class="Symbol"
      >(</a
      ><a name="17817" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="17821"
      > </a
      ><a name="17822" href="2016-10-30-one-lambda-calculus-many-times-2.html#17822" class="Bound"
      >px</a
      ><a name="17824" class="Symbol"
      >)</a
      ><a name="17825"
      > </a
      ><a name="17826" class="Symbol"
      >=</a
      ><a name="17827"
      > </a
      ><a name="17828" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="17832"
      > </a
      ><a name="17833" href="2016-10-30-one-lambda-calculus-many-times-2.html#17822" class="Bound"
      >px</a
      ><a name="17835"
      >
    </a
      ><a name="17840" href="2016-10-30-one-lambda-calculus-many-times-2.html#17722" class="Function"
      >forward</a
      ><a name="17847"
      > </a
      ><a name="17848" class="Symbol"
      >(</a
      ><a name="17849" href="2016-10-30-one-lambda-calculus-many-times-2.html#17849" class="Bound"
      >C</a
      ><a name="17850"
      > </a
      ><a name="17851" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="17852"
      > </a
      ><a name="17853" href="2016-10-30-one-lambda-calculus-many-times-2.html#17853" class="Bound"
      >&#915;</a
      ><a name="17854" class="Symbol"
      >)</a
      ><a name="17855"
      > </a
      ><a name="17856" href="2016-10-30-one-lambda-calculus-many-times-2.html#17856" class="Bound"
      >&#931;</a
      ><a name="17857"
      > </a
      ><a name="17858" class="Symbol"
      >(</a
      ><a name="17859" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="17864"
      > </a
      ><a name="17865" href="2016-10-30-one-lambda-calculus-many-times-2.html#17865" class="Bound"
      >i</a
      ><a name="17866" class="Symbol"
      >)</a
      ><a name="17867"
      > </a
      ><a name="17868" class="Symbol"
      >=</a
      ><a name="17869"
      > </a
      ><a name="17870" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="17875"
      > </a
      ><a name="17876" class="Symbol"
      >(</a
      ><a name="17877" href="2016-10-30-one-lambda-calculus-many-times-2.html#17722" class="Function"
      >forward</a
      ><a name="17884"
      > </a
      ><a name="17885" href="2016-10-30-one-lambda-calculus-many-times-2.html#17853" class="Bound"
      >&#915;</a
      ><a name="17886"
      > </a
      ><a name="17887" href="2016-10-30-one-lambda-calculus-many-times-2.html#17856" class="Bound"
      >&#931;</a
      ><a name="17888"
      > </a
      ><a name="17889" href="2016-10-30-one-lambda-calculus-many-times-2.html#17865" class="Bound"
      >i</a
      ><a name="17890" class="Symbol"
      >)</a
      ><a name="17891"
      >
    </a
      ><a name="17896" href="2016-10-30-one-lambda-calculus-many-times-2.html#17722" class="Function"
      >forward</a
      ><a name="17903"
      > </a
      ><a name="17904" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="17906"
      >      </a
      ><a name="17912" href="2016-10-30-one-lambda-calculus-many-times-2.html#17912" class="Bound"
      >&#931;</a
      ><a name="17913"
      >        </a
      ><a name="17921" href="2016-10-30-one-lambda-calculus-many-times-2.html#17921" class="Bound"
      >i</a
      ><a name="17922"
      >  </a
      ><a name="17924" class="Symbol"
      >=</a
      ><a name="17925"
      > </a
      ><a name="17926" href="2016-10-30-one-lambda-calculus-many-times-2.html#17959" class="Function"
      >forward&#8242;</a
      ><a name="17934"
      > </a
      ><a name="17935" href="2016-10-30-one-lambda-calculus-many-times-2.html#17912" class="Bound"
      >&#931;</a
      ><a name="17936"
      > </a
      ><a name="17937" href="2016-10-30-one-lambda-calculus-many-times-2.html#17921" class="Bound"
      >i</a
      ><a name="17938"
      >
      </a
      ><a name="17945" class="Keyword"
      >where</a
      ><a name="17950"
      >
        </a
      ><a name="17959" href="2016-10-30-one-lambda-calculus-many-times-2.html#17959" class="Function"
      >forward&#8242;</a
      ><a name="17967"
      > </a
      ><a name="17968" class="Symbol"
      >:</a
      ><a name="17969"
      > </a
      ><a name="17978" class="Symbol"
      >&#8704;</a
      ><a name="17979"
      > </a
      ><a name="17980" href="2016-10-30-one-lambda-calculus-many-times-2.html#17980" class="Bound"
      >&#931;</a
      ><a name="17981"
      > </a
      ><a name="17982" class="Symbol"
      >&#8594;</a
      ><a name="17983"
      > </a
      ><a name="17992" href="2016-10-30-one-lambda-calculus-many-times-2.html#17980" class="Bound"
      >&#931;</a
      ><a name="17993"
      > </a
      ><a name="17994" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="17996"
      > </a
      ><a name="17997" href="2016-10-30-one-lambda-calculus-many-times-2.html#17973" class="Bound"
      >A</a
      ><a name="17998"
      > </a
      ><a name="17999" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="18000"
      > </a
      ><a name="18001" href="2016-10-30-one-lambda-calculus-many-times-2.html#17987" class="Bound"
      >&#916;</a
      ><a name="18002"
      > </a
      ><a name="18003" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#3056" class="Function Operator"
      >&#8838;</a
      ><a name="18004"
      > </a
      ><a name="18005" href="2016-10-30-one-lambda-calculus-many-times-2.html#17973" class="Bound"
      >A</a
      ><a name="18006"
      > </a
      ><a name="18007" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="18008"
      > </a
      ><a name="18009" href="2016-10-30-one-lambda-calculus-many-times-2.html#17980" class="Bound"
      >&#931;</a
      ><a name="18010"
      > </a
      ><a name="18011" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="18013"
      > </a
      ><a name="18014" href="2016-10-30-one-lambda-calculus-many-times-2.html#17987" class="Bound"
      >&#916;</a
      ><a name="18015"
      >
        </a
      ><a name="18024" href="2016-10-30-one-lambda-calculus-many-times-2.html#17959" class="Function"
      >forward&#8242;</a
      ><a name="18032"
      >      </a
      ><a name="18038" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="18040"
      >        </a
      ><a name="18048" href="2016-10-30-one-lambda-calculus-many-times-2.html#18048" class="Bound"
      >i</a
      ><a name="18049"
      >  </a
      ><a name="18051" class="Symbol"
      >=</a
      ><a name="18052"
      > </a
      ><a name="18053" href="2016-10-30-one-lambda-calculus-many-times-2.html#18048" class="Bound"
      >i</a
      ><a name="18054"
      >
        </a
      ><a name="18063" href="2016-10-30-one-lambda-calculus-many-times-2.html#17959" class="Function"
      >forward&#8242;</a
      ><a name="18071"
      > </a
      ><a name="18072" class="Symbol"
      >(</a
      ><a name="18073" href="2016-10-30-one-lambda-calculus-many-times-2.html#18073" class="Bound"
      >C</a
      ><a name="18074"
      > </a
      ><a name="18075" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="18076"
      > </a
      ><a name="18077" href="2016-10-30-one-lambda-calculus-many-times-2.html#18077" class="Bound"
      >&#931;</a
      ><a name="18078" class="Symbol"
      >)</a
      ><a name="18079"
      > </a
      ><a name="18080" class="Symbol"
      >(</a
      ><a name="18081" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="18085"
      > </a
      ><a name="18086" href="2016-10-30-one-lambda-calculus-many-times-2.html#18086" class="Bound"
      >px</a
      ><a name="18088" class="Symbol"
      >)</a
      ><a name="18089"
      > </a
      ><a name="18090" class="Symbol"
      >=</a
      ><a name="18091"
      > </a
      ><a name="18092" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="18097"
      > </a
      ><a name="18098" class="Symbol"
      >(</a
      ><a name="18099" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="18103"
      > </a
      ><a name="18104" href="2016-10-30-one-lambda-calculus-many-times-2.html#18086" class="Bound"
      >px</a
      ><a name="18106" class="Symbol"
      >)</a
      ><a name="18107"
      >
        </a
      ><a name="18116" href="2016-10-30-one-lambda-calculus-many-times-2.html#17959" class="Function"
      >forward&#8242;</a
      ><a name="18124"
      > </a
      ><a name="18125" class="Symbol"
      >(</a
      ><a name="18126" href="2016-10-30-one-lambda-calculus-many-times-2.html#18126" class="Bound"
      >C</a
      ><a name="18127"
      > </a
      ><a name="18128" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="18129"
      > </a
      ><a name="18130" href="2016-10-30-one-lambda-calculus-many-times-2.html#18130" class="Bound"
      >&#931;</a
      ><a name="18131" class="Symbol"
      >)</a
      ><a name="18132"
      > </a
      ><a name="18133" class="Symbol"
      >(</a
      ><a name="18134" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="18139"
      > </a
      ><a name="18140" href="2016-10-30-one-lambda-calculus-many-times-2.html#18140" class="Bound"
      >i</a
      ><a name="18141" class="Symbol"
      >)</a
      ><a name="18142"
      > </a
      ><a name="18143" class="Keyword"
      >with</a
      ><a name="18147"
      > </a
      ><a name="18148" href="2016-10-30-one-lambda-calculus-many-times-2.html#17959" class="Function"
      >forward&#8242;</a
      ><a name="18156"
      > </a
      ><a name="18157" href="2016-10-30-one-lambda-calculus-many-times-2.html#18130" class="Bound"
      >&#931;</a
      ><a name="18158"
      > </a
      ><a name="18159" href="2016-10-30-one-lambda-calculus-many-times-2.html#18140" class="Bound"
      >i</a
      ><a name="18160"
      >
        </a
      ><a name="18169" href="2016-10-30-one-lambda-calculus-many-times-2.html#17959" class="Function"
      >forward&#8242;</a
      ><a name="18177"
      > </a
      ><a name="18178" class="Symbol"
      >(</a
      ><a name="18179" href="2016-10-30-one-lambda-calculus-many-times-2.html#18179" class="Bound"
      >C</a
      ><a name="18180"
      > </a
      ><a name="18181" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="18182"
      > </a
      ><a name="18183" href="2016-10-30-one-lambda-calculus-many-times-2.html#18183" class="Bound"
      >&#931;</a
      ><a name="18184" class="Symbol"
      >)</a
      ><a name="18185"
      > </a
      ><a name="18186" class="Symbol"
      >(</a
      ><a name="18187" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="18192"
      > </a
      ><a name="18193" href="2016-10-30-one-lambda-calculus-many-times-2.html#18193" class="Bound"
      >i</a
      ><a name="18194" class="Symbol"
      >)</a
      ><a name="18195"
      > </a
      ><a name="18196" class="Symbol"
      >|</a
      ><a name="18197"
      > </a
      ><a name="18198" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="18202"
      > </a
      ><a name="18203" href="2016-10-30-one-lambda-calculus-many-times-2.html#18203" class="Bound"
      >px</a
      ><a name="18205"
      > </a
      ><a name="18206" class="Symbol"
      >=</a
      ><a name="18207"
      > </a
      ><a name="18208" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="18212"
      > </a
      ><a name="18213" href="2016-10-30-one-lambda-calculus-many-times-2.html#18203" class="Bound"
      >px</a
      ><a name="18215"
      >
        </a
      ><a name="18224" href="2016-10-30-one-lambda-calculus-many-times-2.html#17959" class="Function"
      >forward&#8242;</a
      ><a name="18232"
      > </a
      ><a name="18233" class="Symbol"
      >(</a
      ><a name="18234" href="2016-10-30-one-lambda-calculus-many-times-2.html#18234" class="Bound"
      >C</a
      ><a name="18235"
      > </a
      ><a name="18236" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="18237"
      > </a
      ><a name="18238" href="2016-10-30-one-lambda-calculus-many-times-2.html#18238" class="Bound"
      >&#931;</a
      ><a name="18239" class="Symbol"
      >)</a
      ><a name="18240"
      > </a
      ><a name="18241" class="Symbol"
      >(</a
      ><a name="18242" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="18247"
      > </a
      ><a name="18248" href="2016-10-30-one-lambda-calculus-many-times-2.html#18248" class="Bound"
      >i</a
      ><a name="18249" class="Symbol"
      >)</a
      ><a name="18250"
      > </a
      ><a name="18251" class="Symbol"
      >|</a
      ><a name="18252"
      > </a
      ><a name="18253" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="18258"
      > </a
      ><a name="18259" href="2016-10-30-one-lambda-calculus-many-times-2.html#18259" class="Bound"
      >j</a
      ><a name="18260"
      > </a
      ><a name="18261" class="Symbol"
      >=</a
      ><a name="18262"
      > </a
      ><a name="18263" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="18268"
      > </a
      ><a name="18269" class="Symbol"
      >(</a
      ><a name="18270" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="18275"
      > </a
      ><a name="18276" href="2016-10-30-one-lambda-calculus-many-times-2.html#18259" class="Bound"
      >j</a
      ><a name="18277" class="Symbol"
      >)</a
      >
</pre>
<!--{% endraw %}-->

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

<!--{% raw %}-->
<pre class="Agda">
    <a name="19315" href="2016-10-30-one-lambda-calculus-many-times-2.html#19315" class="Function"
      >permute</a
      ><a name="19322"
      > </a
      ><a name="19323" class="Symbol"
      >:</a
      ><a name="19324"
      > </a
      ><a name="19325" class="Symbol"
      >&#8704;</a
      ><a name="19326"
      > </a
      ><a name="19327" href="2016-10-30-one-lambda-calculus-many-times-2.html#19327" class="Bound"
      >&#915;</a
      ><a name="19328"
      > </a
      ><a name="19329" href="2016-10-30-one-lambda-calculus-many-times-2.html#19329" class="Bound"
      >&#931;</a
      ><a name="19330"
      > </a
      ><a name="19331" href="2016-10-30-one-lambda-calculus-many-times-2.html#19331" class="Bound"
      >&#928;</a
      ><a name="19332"
      > </a
      ><a name="19333" class="Symbol"
      >&#8594;</a
      ><a name="19334"
      > </a
      ><a name="19343" class="Symbol"
      >(</a
      ><a name="19344" href="2016-10-30-one-lambda-calculus-many-times-2.html#19327" class="Bound"
      >&#915;</a
      ><a name="19345"
      > </a
      ><a name="19346" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19348"
      > </a
      ><a name="19349" href="2016-10-30-one-lambda-calculus-many-times-2.html#19329" class="Bound"
      >&#931;</a
      ><a name="19350" class="Symbol"
      >)</a
      ><a name="19351"
      > </a
      ><a name="19352" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19354"
      > </a
      ><a name="19355" class="Symbol"
      >(</a
      ><a name="19356" href="2016-10-30-one-lambda-calculus-many-times-2.html#19331" class="Bound"
      >&#928;</a
      ><a name="19357"
      > </a
      ><a name="19358" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19360"
      > </a
      ><a name="19361" href="2016-10-30-one-lambda-calculus-many-times-2.html#19338" class="Bound"
      >&#916;</a
      ><a name="19362" class="Symbol"
      >)</a
      ><a name="19363"
      > </a
      ><a name="19364" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#3056" class="Function Operator"
      >&#8838;</a
      ><a name="19365"
      > </a
      ><a name="19366" class="Symbol"
      >(</a
      ><a name="19367" href="2016-10-30-one-lambda-calculus-many-times-2.html#19327" class="Bound"
      >&#915;</a
      ><a name="19368"
      > </a
      ><a name="19369" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19371"
      > </a
      ><a name="19372" href="2016-10-30-one-lambda-calculus-many-times-2.html#19331" class="Bound"
      >&#928;</a
      ><a name="19373" class="Symbol"
      >)</a
      ><a name="19374"
      > </a
      ><a name="19375" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19377"
      > </a
      ><a name="19378" class="Symbol"
      >(</a
      ><a name="19379" href="2016-10-30-one-lambda-calculus-many-times-2.html#19329" class="Bound"
      >&#931;</a
      ><a name="19380"
      > </a
      ><a name="19381" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19383"
      > </a
      ><a name="19384" href="2016-10-30-one-lambda-calculus-many-times-2.html#19338" class="Bound"
      >&#916;</a
      ><a name="19385" class="Symbol"
      >)</a
      ><a name="19386"
      >
    </a
      ><a name="19391" href="2016-10-30-one-lambda-calculus-many-times-2.html#19315" class="Function"
      >permute</a
      ><a name="19398"
      > </a
      ><a name="19399" href="2016-10-30-one-lambda-calculus-many-times-2.html#19399" class="Bound"
      >&#915;</a
      ><a name="19400"
      > </a
      ><a name="19401" href="2016-10-30-one-lambda-calculus-many-times-2.html#19401" class="Bound"
      >&#931;</a
      ><a name="19402"
      > </a
      ><a name="19403" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="19405"
      > </a
      ><a name="19410" class="Symbol"
      >=</a
      ><a name="19411"
      >
      </a
      ><a name="19418" href="https://agda.github.io/agda-stdlib/Relation.Binary.PreorderReasoning.html#1154" class="Function Operator"
      >begin</a
      ><a name="19423"
      >
        </a
      ><a name="19432" class="Symbol"
      >(</a
      ><a name="19433" href="2016-10-30-one-lambda-calculus-many-times-2.html#19399" class="Bound"
      >&#915;</a
      ><a name="19434"
      > </a
      ><a name="19435" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19437"
      > </a
      ><a name="19438" href="2016-10-30-one-lambda-calculus-many-times-2.html#19401" class="Bound"
      >&#931;</a
      ><a name="19439" class="Symbol"
      >)</a
      ><a name="19440"
      > </a
      ><a name="19441" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19443"
      > </a
      ><a name="19444" href="2016-10-30-one-lambda-calculus-many-times-2.html#19407" class="Bound"
      >&#916;</a
      ><a name="19445"
      >
          </a
      ><a name="19456" href="2016-10-30-one-lambda-calculus-many-times-2.html#2168" class="Function Operator"
      >&#8801;&#10216;</a
      ><a name="19458"
      > </a
      ><a name="19459" href="2016-10-30-one-lambda-calculus-many-times-2.html#2120" class="Function"
      >++-assoc</a
      ><a name="19467"
      > </a
      ><a name="19468" href="2016-10-30-one-lambda-calculus-many-times-2.html#19399" class="Bound"
      >&#915;</a
      ><a name="19469"
      > </a
      ><a name="19470" href="2016-10-30-one-lambda-calculus-many-times-2.html#19401" class="Bound"
      >&#931;</a
      ><a name="19471"
      > </a
      ><a name="19472" href="2016-10-30-one-lambda-calculus-many-times-2.html#19407" class="Bound"
      >&#916;</a
      ><a name="19473"
      > </a
      ><a name="19474" href="2016-10-30-one-lambda-calculus-many-times-2.html#2168" class="Function Operator"
      >&#10217;</a
      ><a name="19475"
      >
        </a
      ><a name="19484" href="2016-10-30-one-lambda-calculus-many-times-2.html#19399" class="Bound"
      >&#915;</a
      ><a name="19485"
      > </a
      ><a name="19486" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19488"
      > </a
      ><a name="19489" class="Symbol"
      >(</a
      ><a name="19490" href="2016-10-30-one-lambda-calculus-many-times-2.html#19401" class="Bound"
      >&#931;</a
      ><a name="19491"
      > </a
      ><a name="19492" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19494"
      > </a
      ><a name="19495" href="2016-10-30-one-lambda-calculus-many-times-2.html#19407" class="Bound"
      >&#916;</a
      ><a name="19496" class="Symbol"
      >)</a
      ><a name="19497"
      >
          </a
      ><a name="19508" href="2016-10-30-one-lambda-calculus-many-times-2.html#2168" class="Function Operator"
      >&#8801;&#10216;</a
      ><a name="19510"
      > </a
      ><a name="19511" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.html#1036" class="Function"
      >cong</a
      ><a name="19515"
      > </a
      ><a name="19516" class="Symbol"
      >(</a
      ><a name="19517" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >_++</a
      ><a name="19520"
      > </a
      ><a name="19521" class="Symbol"
      >(</a
      ><a name="19522" href="2016-10-30-one-lambda-calculus-many-times-2.html#19401" class="Bound"
      >&#931;</a
      ><a name="19523"
      > </a
      ><a name="19524" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19526"
      > </a
      ><a name="19527" href="2016-10-30-one-lambda-calculus-many-times-2.html#19407" class="Bound"
      >&#916;</a
      ><a name="19528" class="Symbol"
      >))</a
      ><a name="19530"
      > </a
      ><a name="19531" class="Symbol"
      >(</a
      ><a name="19532" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#565" class="Function"
      >sym</a
      ><a name="19535"
      > </a
      ><a name="19536" class="Symbol"
      >(</a
      ><a name="19537" href="2016-10-30-one-lambda-calculus-many-times-2.html#2084" class="Function"
      >++-identity&#691;</a
      ><a name="19549"
      > </a
      ><a name="19550" href="2016-10-30-one-lambda-calculus-many-times-2.html#19399" class="Bound"
      >&#915;</a
      ><a name="19551" class="Symbol"
      >))</a
      ><a name="19553"
      > </a
      ><a name="19554" href="2016-10-30-one-lambda-calculus-many-times-2.html#2168" class="Function Operator"
      >&#10217;</a
      ><a name="19555"
      >
        </a
      ><a name="19564" class="Symbol"
      >(</a
      ><a name="19565" href="2016-10-30-one-lambda-calculus-many-times-2.html#19399" class="Bound"
      >&#915;</a
      ><a name="19566"
      > </a
      ><a name="19567" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19569"
      > </a
      ><a name="19570" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="19572" class="Symbol"
      >)</a
      ><a name="19573"
      > </a
      ><a name="19574" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19576"
      > </a
      ><a name="19577" class="Symbol"
      >(</a
      ><a name="19578" href="2016-10-30-one-lambda-calculus-many-times-2.html#19401" class="Bound"
      >&#931;</a
      ><a name="19579"
      > </a
      ><a name="19580" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19582"
      > </a
      ><a name="19583" href="2016-10-30-one-lambda-calculus-many-times-2.html#19407" class="Bound"
      >&#916;</a
      ><a name="19584" class="Symbol"
      >)</a
      ><a name="19585"
      >
      </a
      ><a name="19592" href="https://agda.github.io/agda-stdlib/Relation.Binary.PreorderReasoning.html#1519" class="Function Operator"
      >&#8718;</a
      ><a name="19593"
      >
    </a
      ><a name="19598" href="2016-10-30-one-lambda-calculus-many-times-2.html#19315" class="Function"
      >permute</a
      ><a name="19605"
      > </a
      ><a name="19606" href="2016-10-30-one-lambda-calculus-many-times-2.html#19606" class="Bound"
      >&#915;</a
      ><a name="19607"
      > </a
      ><a name="19608" href="2016-10-30-one-lambda-calculus-many-times-2.html#19608" class="Bound"
      >&#928;</a
      ><a name="19609"
      > </a
      ><a name="19610" class="Symbol"
      >(</a
      ><a name="19611" href="2016-10-30-one-lambda-calculus-many-times-2.html#19611" class="Bound"
      >A</a
      ><a name="19612"
      > </a
      ><a name="19613" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="19614"
      > </a
      ><a name="19615" href="2016-10-30-one-lambda-calculus-many-times-2.html#19615" class="Bound"
      >&#931;</a
      ><a name="19616" class="Symbol"
      >)</a
      ><a name="19617"
      > </a
      ><a name="19622" class="Symbol"
      >=</a
      ><a name="19623"
      >
      </a
      ><a name="19630" href="https://agda.github.io/agda-stdlib/Relation.Binary.PreorderReasoning.html#1154" class="Function Operator"
      >begin</a
      ><a name="19635"
      >
        </a
      ><a name="19644" class="Symbol"
      >(</a
      ><a name="19645" href="2016-10-30-one-lambda-calculus-many-times-2.html#19606" class="Bound"
      >&#915;</a
      ><a name="19646"
      > </a
      ><a name="19647" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19649"
      > </a
      ><a name="19650" href="2016-10-30-one-lambda-calculus-many-times-2.html#19608" class="Bound"
      >&#928;</a
      ><a name="19651" class="Symbol"
      >)</a
      ><a name="19652"
      > </a
      ><a name="19653" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19655"
      > </a
      ><a name="19656" class="Symbol"
      >(</a
      ><a name="19657" href="2016-10-30-one-lambda-calculus-many-times-2.html#19611" class="Bound"
      >A</a
      ><a name="19658"
      > </a
      ><a name="19659" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="19660"
      > </a
      ><a name="19661" href="2016-10-30-one-lambda-calculus-many-times-2.html#19615" class="Bound"
      >&#931;</a
      ><a name="19662"
      > </a
      ><a name="19663" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19665"
      > </a
      ><a name="19666" href="2016-10-30-one-lambda-calculus-many-times-2.html#19619" class="Bound"
      >&#916;</a
      ><a name="19667" class="Symbol"
      >)</a
      ><a name="19668"
      >
          </a
      ><a name="19679" href="https://agda.github.io/agda-stdlib/Relation.Binary.PreorderReasoning.html#1220" class="Function Operator"
      >&#8838;&#10216;</a
      ><a name="19681"
      > </a
      ><a name="19682" href="2016-10-30-one-lambda-calculus-many-times-2.html#17722" class="Function"
      >forward</a
      ><a name="19689"
      > </a
      ><a name="19690" href="2016-10-30-one-lambda-calculus-many-times-2.html#19606" class="Bound"
      >&#915;</a
      ><a name="19691"
      > </a
      ><a name="19692" href="2016-10-30-one-lambda-calculus-many-times-2.html#19608" class="Bound"
      >&#928;</a
      ><a name="19693"
      > </a
      ><a name="19694" href="https://agda.github.io/agda-stdlib/Relation.Binary.PreorderReasoning.html#1220" class="Function Operator"
      >&#10217;</a
      ><a name="19695"
      >
        </a
      ><a name="19704" class="Symbol"
      >(</a
      ><a name="19705" href="2016-10-30-one-lambda-calculus-many-times-2.html#19606" class="Bound"
      >&#915;</a
      ><a name="19706"
      > </a
      ><a name="19707" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19709"
      > </a
      ><a name="19710" href="2016-10-30-one-lambda-calculus-many-times-2.html#19611" class="Bound"
      >A</a
      ><a name="19711"
      > </a
      ><a name="19712" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="19713"
      > </a
      ><a name="19714" href="2016-10-30-one-lambda-calculus-many-times-2.html#19608" class="Bound"
      >&#928;</a
      ><a name="19715" class="Symbol"
      >)</a
      ><a name="19716"
      > </a
      ><a name="19717" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19719"
      > </a
      ><a name="19720" class="Symbol"
      >(</a
      ><a name="19721" href="2016-10-30-one-lambda-calculus-many-times-2.html#19615" class="Bound"
      >&#931;</a
      ><a name="19722"
      > </a
      ><a name="19723" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19725"
      > </a
      ><a name="19726" href="2016-10-30-one-lambda-calculus-many-times-2.html#19619" class="Bound"
      >&#916;</a
      ><a name="19727" class="Symbol"
      >)</a
      ><a name="19728"
      >
          </a
      ><a name="19739" href="2016-10-30-one-lambda-calculus-many-times-2.html#2168" class="Function Operator"
      >&#8801;&#10216;</a
      ><a name="19741"
      > </a
      ><a name="19742" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.html#1036" class="Function"
      >cong</a
      ><a name="19746"
      > </a
      ><a name="19747" class="Symbol"
      >(</a
      ><a name="19748" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >_++</a
      ><a name="19751"
      > </a
      ><a name="19752" class="Symbol"
      >(</a
      ><a name="19753" href="2016-10-30-one-lambda-calculus-many-times-2.html#19615" class="Bound"
      >&#931;</a
      ><a name="19754"
      > </a
      ><a name="19755" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19757"
      > </a
      ><a name="19758" href="2016-10-30-one-lambda-calculus-many-times-2.html#19619" class="Bound"
      >&#916;</a
      ><a name="19759" class="Symbol"
      >))</a
      ><a name="19761"
      > </a
      ><a name="19762" class="Symbol"
      >(</a
      ><a name="19763" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#565" class="Function"
      >sym</a
      ><a name="19766"
      > </a
      ><a name="19767" class="Symbol"
      >(</a
      ><a name="19768" href="2016-10-30-one-lambda-calculus-many-times-2.html#2120" class="Function"
      >++-assoc</a
      ><a name="19776"
      > </a
      ><a name="19777" href="2016-10-30-one-lambda-calculus-many-times-2.html#19606" class="Bound"
      >&#915;</a
      ><a name="19778"
      > </a
      ><a name="19779" class="Symbol"
      >(</a
      ><a name="19780" href="2016-10-30-one-lambda-calculus-many-times-2.html#19611" class="Bound"
      >A</a
      ><a name="19781"
      > </a
      ><a name="19782" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="19783"
      > </a
      ><a name="19784" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="19786" class="Symbol"
      >)</a
      ><a name="19787"
      > </a
      ><a name="19788" href="2016-10-30-one-lambda-calculus-many-times-2.html#19608" class="Bound"
      >&#928;</a
      ><a name="19789" class="Symbol"
      >))</a
      ><a name="19791"
      > </a
      ><a name="19792" href="2016-10-30-one-lambda-calculus-many-times-2.html#2168" class="Function Operator"
      >&#10217;</a
      ><a name="19793"
      >
        </a
      ><a name="19802" class="Symbol"
      >((</a
      ><a name="19804" href="2016-10-30-one-lambda-calculus-many-times-2.html#19606" class="Bound"
      >&#915;</a
      ><a name="19805"
      > </a
      ><a name="19806" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19808"
      > </a
      ><a name="19809" class="Symbol"
      >(</a
      ><a name="19810" href="2016-10-30-one-lambda-calculus-many-times-2.html#19611" class="Bound"
      >A</a
      ><a name="19811"
      > </a
      ><a name="19812" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="19813"
      > </a
      ><a name="19814" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="19816" class="Symbol"
      >))</a
      ><a name="19818"
      > </a
      ><a name="19819" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19821"
      > </a
      ><a name="19822" href="2016-10-30-one-lambda-calculus-many-times-2.html#19608" class="Bound"
      >&#928;</a
      ><a name="19823" class="Symbol"
      >)</a
      ><a name="19824"
      > </a
      ><a name="19825" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19827"
      > </a
      ><a name="19828" class="Symbol"
      >(</a
      ><a name="19829" href="2016-10-30-one-lambda-calculus-many-times-2.html#19615" class="Bound"
      >&#931;</a
      ><a name="19830"
      > </a
      ><a name="19831" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19833"
      > </a
      ><a name="19834" href="2016-10-30-one-lambda-calculus-many-times-2.html#19619" class="Bound"
      >&#916;</a
      ><a name="19835" class="Symbol"
      >)</a
      ><a name="19836"
      >
          </a
      ><a name="19847" href="https://agda.github.io/agda-stdlib/Relation.Binary.PreorderReasoning.html#1220" class="Function Operator"
      >&#8838;&#10216;</a
      ><a name="19849"
      > </a
      ><a name="19850" href="2016-10-30-one-lambda-calculus-many-times-2.html#19315" class="Function"
      >permute</a
      ><a name="19857"
      > </a
      ><a name="19858" class="Symbol"
      >(</a
      ><a name="19859" href="2016-10-30-one-lambda-calculus-many-times-2.html#19606" class="Bound"
      >&#915;</a
      ><a name="19860"
      > </a
      ><a name="19861" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19863"
      > </a
      ><a name="19864" href="2016-10-30-one-lambda-calculus-many-times-2.html#19611" class="Bound"
      >A</a
      ><a name="19865"
      > </a
      ><a name="19866" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="19867"
      > </a
      ><a name="19868" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="19870" class="Symbol"
      >)</a
      ><a name="19871"
      > </a
      ><a name="19872" href="2016-10-30-one-lambda-calculus-many-times-2.html#19608" class="Bound"
      >&#928;</a
      ><a name="19873"
      > </a
      ><a name="19874" href="2016-10-30-one-lambda-calculus-many-times-2.html#19615" class="Bound"
      >&#931;</a
      ><a name="19875"
      > </a
      ><a name="19876" href="https://agda.github.io/agda-stdlib/Relation.Binary.PreorderReasoning.html#1220" class="Function Operator"
      >&#10217;</a
      ><a name="19877"
      >
        </a
      ><a name="19886" class="Symbol"
      >((</a
      ><a name="19888" href="2016-10-30-one-lambda-calculus-many-times-2.html#19606" class="Bound"
      >&#915;</a
      ><a name="19889"
      > </a
      ><a name="19890" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19892"
      > </a
      ><a name="19893" class="Symbol"
      >(</a
      ><a name="19894" href="2016-10-30-one-lambda-calculus-many-times-2.html#19611" class="Bound"
      >A</a
      ><a name="19895"
      > </a
      ><a name="19896" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="19897"
      > </a
      ><a name="19898" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="19900" class="Symbol"
      >))</a
      ><a name="19902"
      > </a
      ><a name="19903" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19905"
      > </a
      ><a name="19906" href="2016-10-30-one-lambda-calculus-many-times-2.html#19615" class="Bound"
      >&#931;</a
      ><a name="19907" class="Symbol"
      >)</a
      ><a name="19908"
      > </a
      ><a name="19909" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19911"
      > </a
      ><a name="19912" class="Symbol"
      >(</a
      ><a name="19913" href="2016-10-30-one-lambda-calculus-many-times-2.html#19608" class="Bound"
      >&#928;</a
      ><a name="19914"
      > </a
      ><a name="19915" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19917"
      > </a
      ><a name="19918" href="2016-10-30-one-lambda-calculus-many-times-2.html#19619" class="Bound"
      >&#916;</a
      ><a name="19919" class="Symbol"
      >)</a
      ><a name="19920"
      >
          </a
      ><a name="19931" href="2016-10-30-one-lambda-calculus-many-times-2.html#2168" class="Function Operator"
      >&#8801;&#10216;</a
      ><a name="19933"
      > </a
      ><a name="19934" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.html#1036" class="Function"
      >cong</a
      ><a name="19938"
      > </a
      ><a name="19939" class="Symbol"
      >(</a
      ><a name="19940" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >_++</a
      ><a name="19943"
      > </a
      ><a name="19944" class="Symbol"
      >(</a
      ><a name="19945" href="2016-10-30-one-lambda-calculus-many-times-2.html#19608" class="Bound"
      >&#928;</a
      ><a name="19946"
      > </a
      ><a name="19947" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19949"
      > </a
      ><a name="19950" href="2016-10-30-one-lambda-calculus-many-times-2.html#19619" class="Bound"
      >&#916;</a
      ><a name="19951" class="Symbol"
      >))</a
      ><a name="19953"
      > </a
      ><a name="19954" class="Symbol"
      >(</a
      ><a name="19955" href="2016-10-30-one-lambda-calculus-many-times-2.html#2120" class="Function"
      >++-assoc</a
      ><a name="19963"
      > </a
      ><a name="19964" href="2016-10-30-one-lambda-calculus-many-times-2.html#19606" class="Bound"
      >&#915;</a
      ><a name="19965"
      > </a
      ><a name="19966" class="Symbol"
      >(</a
      ><a name="19967" href="2016-10-30-one-lambda-calculus-many-times-2.html#19611" class="Bound"
      >A</a
      ><a name="19968"
      > </a
      ><a name="19969" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="19970"
      > </a
      ><a name="19971" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="19973" class="Symbol"
      >)</a
      ><a name="19974"
      > </a
      ><a name="19975" href="2016-10-30-one-lambda-calculus-many-times-2.html#19615" class="Bound"
      >&#931;</a
      ><a name="19976" class="Symbol"
      >)</a
      ><a name="19977"
      > </a
      ><a name="19978" href="2016-10-30-one-lambda-calculus-many-times-2.html#2168" class="Function Operator"
      >&#10217;</a
      ><a name="19979"
      >
        </a
      ><a name="19988" class="Symbol"
      >(</a
      ><a name="19989" href="2016-10-30-one-lambda-calculus-many-times-2.html#19606" class="Bound"
      >&#915;</a
      ><a name="19990"
      > </a
      ><a name="19991" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="19993"
      > </a
      ><a name="19994" href="2016-10-30-one-lambda-calculus-many-times-2.html#19611" class="Bound"
      >A</a
      ><a name="19995"
      > </a
      ><a name="19996" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="19997"
      > </a
      ><a name="19998" href="2016-10-30-one-lambda-calculus-many-times-2.html#19615" class="Bound"
      >&#931;</a
      ><a name="19999" class="Symbol"
      >)</a
      ><a name="20000"
      > </a
      ><a name="20001" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20003"
      > </a
      ><a name="20004" class="Symbol"
      >(</a
      ><a name="20005" href="2016-10-30-one-lambda-calculus-many-times-2.html#19608" class="Bound"
      >&#928;</a
      ><a name="20006"
      > </a
      ><a name="20007" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20009"
      > </a
      ><a name="20010" href="2016-10-30-one-lambda-calculus-many-times-2.html#19619" class="Bound"
      >&#916;</a
      ><a name="20011" class="Symbol"
      >)</a
      ><a name="20012"
      >
      </a
      ><a name="20019" href="https://agda.github.io/agda-stdlib/Relation.Binary.PreorderReasoning.html#1519" class="Function Operator"
      >&#8718;</a
      >
</pre>
<!--{% endraw %}-->

In our previous version of contraction, all we had to do was merge any references to the first two formulas in our context.

<!--{% raw %}-->
<pre class="Agda">
    <a name="20175" href="2016-10-30-one-lambda-calculus-many-times-2.html#20175" class="Function"
      >contract</a
      ><a name="20183"
      > </a
      ><a name="20184" class="Symbol"
      >:</a
      ><a name="20185"
      > </a
      ><a name="20186" class="Symbol"
      >&#8704;</a
      ><a name="20187"
      > </a
      ><a name="20188" href="2016-10-30-one-lambda-calculus-many-times-2.html#20188" class="Bound"
      >&#915;</a
      ><a name="20189"
      > </a
      ><a name="20190" class="Symbol"
      >&#8594;</a
      ><a name="20191"
      > </a
      ><a name="20200" class="Symbol"
      >(</a
      ><a name="20201" href="2016-10-30-one-lambda-calculus-many-times-2.html#20188" class="Bound"
      >&#915;</a
      ><a name="20202"
      > </a
      ><a name="20203" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20205"
      > </a
      ><a name="20206" href="2016-10-30-one-lambda-calculus-many-times-2.html#20188" class="Bound"
      >&#915;</a
      ><a name="20207" class="Symbol"
      >)</a
      ><a name="20208"
      > </a
      ><a name="20209" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20211"
      > </a
      ><a name="20212" href="2016-10-30-one-lambda-calculus-many-times-2.html#20195" class="Bound"
      >&#916;</a
      ><a name="20213"
      > </a
      ><a name="20214" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#3056" class="Function Operator"
      >&#8838;</a
      ><a name="20215"
      > </a
      ><a name="20216" href="2016-10-30-one-lambda-calculus-many-times-2.html#20188" class="Bound"
      >&#915;</a
      ><a name="20217"
      > </a
      ><a name="20218" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20220"
      > </a
      ><a name="20221" href="2016-10-30-one-lambda-calculus-many-times-2.html#20195" class="Bound"
      >&#916;</a
      ><a name="20222"
      >
    </a
      ><a name="20227" href="2016-10-30-one-lambda-calculus-many-times-2.html#20175" class="Function"
      >contract</a
      ><a name="20235"
      > </a
      ><a name="20236" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="20238"
      >      </a
      ><a name="20248" href="2016-10-30-one-lambda-calculus-many-times-2.html#20248" class="Bound"
      >i</a
      ><a name="20249"
      > </a
      ><a name="20250" class="Symbol"
      >=</a
      ><a name="20251"
      > </a
      ><a name="20252" href="2016-10-30-one-lambda-calculus-many-times-2.html#20248" class="Bound"
      >i</a
      ><a name="20253"
      >
    </a
      ><a name="20258" href="2016-10-30-one-lambda-calculus-many-times-2.html#20175" class="Function"
      >contract</a
      ><a name="20266"
      > </a
      ><a name="20267" class="Symbol"
      >(</a
      ><a name="20268" href="2016-10-30-one-lambda-calculus-many-times-2.html#20268" class="Bound"
      >A</a
      ><a name="20269"
      > </a
      ><a name="20270" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="20271"
      > </a
      ><a name="20272" href="2016-10-30-one-lambda-calculus-many-times-2.html#20272" class="Bound"
      >&#915;</a
      ><a name="20273" class="Symbol"
      >)</a
      ><a name="20274"
      > </a
      ><a name="20279" class="Symbol"
      >(</a
      ><a name="20280" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="20284"
      > </a
      ><a name="20285" href="2016-10-30-one-lambda-calculus-many-times-2.html#20285" class="Bound"
      >px</a
      ><a name="20287" class="Symbol"
      >)</a
      ><a name="20288"
      > </a
      ><a name="20289" class="Symbol"
      >=</a
      ><a name="20290"
      > </a
      ><a name="20291" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="20295"
      > </a
      ><a name="20296" href="2016-10-30-one-lambda-calculus-many-times-2.html#20285" class="Bound"
      >px</a
      ><a name="20298"
      >
    </a
      ><a name="20303" href="2016-10-30-one-lambda-calculus-many-times-2.html#20175" class="Function"
      >contract</a
      ><a name="20311"
      > </a
      ><a name="20312" class="Symbol"
      >(</a
      ><a name="20313" href="2016-10-30-one-lambda-calculus-many-times-2.html#20313" class="Bound"
      >A</a
      ><a name="20314"
      > </a
      ><a name="20315" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="20316"
      > </a
      ><a name="20317" href="2016-10-30-one-lambda-calculus-many-times-2.html#20317" class="Bound"
      >&#915;</a
      ><a name="20318" class="Symbol"
      >)</a
      ><a name="20319"
      > </a
      ><a name="20324" class="Symbol"
      >(</a
      ><a name="20325" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="20330"
      > </a
      ><a name="20331" href="2016-10-30-one-lambda-calculus-many-times-2.html#20331" class="Bound"
      >i</a
      ><a name="20332" class="Symbol"
      >)</a
      ><a name="20333"
      >
      </a
      ><a name="20340" class="Keyword"
      >rewrite</a
      ><a name="20347"
      > </a
      ><a name="20348" href="2016-10-30-one-lambda-calculus-many-times-2.html#2120" class="Function"
      >++-assoc</a
      ><a name="20356"
      > </a
      ><a name="20357" href="2016-10-30-one-lambda-calculus-many-times-2.html#20317" class="Bound"
      >&#915;</a
      ><a name="20358"
      > </a
      ><a name="20359" class="Symbol"
      >(</a
      ><a name="20360" href="2016-10-30-one-lambda-calculus-many-times-2.html#20313" class="Bound"
      >A</a
      ><a name="20361"
      > </a
      ><a name="20362" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="20363"
      > </a
      ><a name="20364" href="2016-10-30-one-lambda-calculus-many-times-2.html#20317" class="Bound"
      >&#915;</a
      ><a name="20365" class="Symbol"
      >)</a
      ><a name="20366"
      > </a
      ><a name="20367" href="2016-10-30-one-lambda-calculus-many-times-2.html#20321" class="Bound"
      >&#916;</a
      ><a name="20368"
      > </a
      ><a name="20369" class="Keyword"
      >with</a
      ><a name="20373"
      > </a
      ><a name="20374" href="2016-10-30-one-lambda-calculus-many-times-2.html#17722" class="Function"
      >forward</a
      ><a name="20381"
      > </a
      ><a name="20382" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="20384"
      > </a
      ><a name="20385" href="2016-10-30-one-lambda-calculus-many-times-2.html#20317" class="Bound"
      >&#915;</a
      ><a name="20386"
      > </a
      ><a name="20387" href="2016-10-30-one-lambda-calculus-many-times-2.html#20331" class="Bound"
      >i</a
      ><a name="20388"
      >
    </a
      ><a name="20393" href="2016-10-30-one-lambda-calculus-many-times-2.html#20175" class="Function"
      >contract</a
      ><a name="20401"
      > </a
      ><a name="20402" class="Symbol"
      >(</a
      ><a name="20403" href="2016-10-30-one-lambda-calculus-many-times-2.html#20403" class="Bound"
      >A</a
      ><a name="20404"
      > </a
      ><a name="20405" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="20406"
      > </a
      ><a name="20407" href="2016-10-30-one-lambda-calculus-many-times-2.html#20407" class="Bound"
      >&#915;</a
      ><a name="20408" class="Symbol"
      >)</a
      ><a name="20409"
      > </a
      ><a name="20414" class="Symbol"
      >(</a
      ><a name="20415" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="20420"
      > </a
      ><a name="20421" href="2016-10-30-one-lambda-calculus-many-times-2.html#20421" class="Bound"
      >i</a
      ><a name="20422" class="Symbol"
      >)</a
      ><a name="20423"
      > </a
      ><a name="20424" class="Symbol"
      >|</a
      ><a name="20425"
      > </a
      ><a name="20426" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="20430"
      > </a
      ><a name="20431" href="2016-10-30-one-lambda-calculus-many-times-2.html#20431" class="Bound"
      >px</a
      ><a name="20433"
      > </a
      ><a name="20434" class="Symbol"
      >=</a
      ><a name="20435"
      > </a
      ><a name="20436" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="20440"
      > </a
      ><a name="20441" href="2016-10-30-one-lambda-calculus-many-times-2.html#20431" class="Bound"
      >px</a
      ><a name="20443"
      >
    </a
      ><a name="20448" href="2016-10-30-one-lambda-calculus-many-times-2.html#20175" class="Function"
      >contract</a
      ><a name="20456"
      > </a
      ><a name="20457" class="Symbol"
      >(</a
      ><a name="20458" href="2016-10-30-one-lambda-calculus-many-times-2.html#20458" class="Bound"
      >A</a
      ><a name="20459"
      > </a
      ><a name="20460" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="20461"
      > </a
      ><a name="20462" href="2016-10-30-one-lambda-calculus-many-times-2.html#20462" class="Bound"
      >&#915;</a
      ><a name="20463" class="Symbol"
      >)</a
      ><a name="20464"
      > </a
      ><a name="20469" class="Symbol"
      >(</a
      ><a name="20470" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="20475"
      > </a
      ><a name="20476" href="2016-10-30-one-lambda-calculus-many-times-2.html#20476" class="Bound"
      >i</a
      ><a name="20477" class="Symbol"
      >)</a
      ><a name="20478"
      > </a
      ><a name="20479" class="Symbol"
      >|</a
      ><a name="20480"
      > </a
      ><a name="20481" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="20486"
      > </a
      ><a name="20487" href="2016-10-30-one-lambda-calculus-many-times-2.html#20487" class="Bound"
      >j</a
      ><a name="20488"
      >
      </a
      ><a name="20495" class="Keyword"
      >rewrite</a
      ><a name="20502"
      > </a
      ><a name="20503" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#565" class="Function"
      >sym</a
      ><a name="20506"
      > </a
      ><a name="20507" class="Symbol"
      >(</a
      ><a name="20508" href="2016-10-30-one-lambda-calculus-many-times-2.html#2120" class="Function"
      >++-assoc</a
      ><a name="20516"
      > </a
      ><a name="20517" href="2016-10-30-one-lambda-calculus-many-times-2.html#20462" class="Bound"
      >&#915;</a
      ><a name="20518"
      > </a
      ><a name="20519" href="2016-10-30-one-lambda-calculus-many-times-2.html#20462" class="Bound"
      >&#915;</a
      ><a name="20520"
      > </a
      ><a name="20521" href="2016-10-30-one-lambda-calculus-many-times-2.html#20466" class="Bound"
      >&#916;</a
      ><a name="20522" class="Symbol"
      >)</a
      ><a name="20523"
      > </a
      ><a name="20524" class="Symbol"
      >=</a
      ><a name="20525"
      > </a
      ><a name="20526" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="20531"
      > </a
      ><a name="20532" class="Symbol"
      >(</a
      ><a name="20533" href="2016-10-30-one-lambda-calculus-many-times-2.html#20175" class="Function"
      >contract</a
      ><a name="20541"
      > </a
      ><a name="20542" href="2016-10-30-one-lambda-calculus-many-times-2.html#20462" class="Bound"
      >&#915;</a
      ><a name="20543"
      > </a
      ><a name="20544" href="2016-10-30-one-lambda-calculus-many-times-2.html#20487" class="Bound"
      >j</a
      ><a name="20545" class="Symbol"
      >)</a
      >
</pre>
<!--{% endraw %}-->

Boop.

<!--{% raw %}-->
<pre class="Agda">
    <a name="20583" href="2016-10-30-one-lambda-calculus-many-times-2.html#20583" class="Function"
      >w&#8314;&#8242;</a
      ><a name="20586"
      > </a
      ><a name="20587" class="Symbol"
      >:</a
      ><a name="20588"
      > </a
      ><a name="20597" class="Symbol"
      >&#8704;</a
      ><a name="20598"
      > </a
      ><a name="20599" href="2016-10-30-one-lambda-calculus-many-times-2.html#20599" class="Bound"
      >&#915;</a
      ><a name="20600"
      > </a
      ><a name="20601" class="Symbol"
      >&#8594;</a
      ><a name="20602"
      > </a
      ><a name="20611" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="20613"
      > </a
      ><a name="20614" href="2016-10-30-one-lambda-calculus-many-times-2.html#20606" class="Bound"
      >&#916;</a
      ><a name="20615"
      > </a
      ><a name="20616" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="20617"
      > </a
      ><a name="20618" href="2016-10-30-one-lambda-calculus-many-times-2.html#20592" class="Bound"
      >A</a
      ><a name="20619"
      > </a
      ><a name="20620" class="Symbol"
      >&#8594;</a
      ><a name="20621"
      > </a
      ><a name="20622" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="20624"
      > </a
      ><a name="20625" href="2016-10-30-one-lambda-calculus-many-times-2.html#20599" class="Bound"
      >&#915;</a
      ><a name="20626"
      > </a
      ><a name="20627" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20629"
      > </a
      ><a name="20630" href="2016-10-30-one-lambda-calculus-many-times-2.html#20606" class="Bound"
      >&#916;</a
      ><a name="20631"
      > </a
      ><a name="20632" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="20633"
      > </a
      ><a name="20634" href="2016-10-30-one-lambda-calculus-many-times-2.html#20592" class="Bound"
      >A</a
      ><a name="20635"
      >
    </a
      ><a name="20640" href="2016-10-30-one-lambda-calculus-many-times-2.html#20583" class="Function"
      >w&#8314;&#8242;</a
      ><a name="20643"
      > </a
      ><a name="20644" href="2016-10-30-one-lambda-calculus-many-times-2.html#20644" class="Bound"
      >&#915;</a
      ><a name="20645"
      > </a
      ><a name="20646" class="Symbol"
      >=</a
      ><a name="20647"
      > </a
      ><a name="20648" href="2016-03-20-one-lambda-calculus-many-times.html#7307" class="Function"
      >struct</a
      ><a name="20654"
      > </a
      ><a name="20655" class="Symbol"
      >(</a
      ><a name="20656" href="2016-10-30-one-lambda-calculus-many-times-2.html#16574" class="Function"
      >weaken</a
      ><a name="20662"
      > </a
      ><a name="20663" href="2016-10-30-one-lambda-calculus-many-times-2.html#20644" class="Bound"
      >&#915;</a
      ><a name="20664" class="Symbol"
      >)</a
      ><a name="20665"
      >

    </a
      ><a name="20671" href="2016-10-30-one-lambda-calculus-many-times-2.html#20671" class="Function"
      >c&#8314;&#8242;</a
      ><a name="20674"
      > </a
      ><a name="20675" class="Symbol"
      >:</a
      ><a name="20676"
      > </a
      ><a name="20685" class="Symbol"
      >&#8704;</a
      ><a name="20686"
      > </a
      ><a name="20687" href="2016-10-30-one-lambda-calculus-many-times-2.html#20687" class="Bound"
      >&#915;</a
      ><a name="20688"
      > </a
      ><a name="20689" class="Symbol"
      >&#8594;</a
      ><a name="20690"
      > </a
      ><a name="20699" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="20701"
      > </a
      ><a name="20702" class="Symbol"
      >(</a
      ><a name="20703" href="2016-10-30-one-lambda-calculus-many-times-2.html#20687" class="Bound"
      >&#915;</a
      ><a name="20704"
      > </a
      ><a name="20705" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20707"
      > </a
      ><a name="20708" href="2016-10-30-one-lambda-calculus-many-times-2.html#20687" class="Bound"
      >&#915;</a
      ><a name="20709" class="Symbol"
      >)</a
      ><a name="20710"
      > </a
      ><a name="20711" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20713"
      > </a
      ><a name="20714" href="2016-10-30-one-lambda-calculus-many-times-2.html#20694" class="Bound"
      >&#916;</a
      ><a name="20715"
      > </a
      ><a name="20716" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="20717"
      > </a
      ><a name="20718" href="2016-10-30-one-lambda-calculus-many-times-2.html#20680" class="Bound"
      >A</a
      ><a name="20719"
      > </a
      ><a name="20720" class="Symbol"
      >&#8594;</a
      ><a name="20721"
      > </a
      ><a name="20722" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="20724"
      > </a
      ><a name="20725" href="2016-10-30-one-lambda-calculus-many-times-2.html#20687" class="Bound"
      >&#915;</a
      ><a name="20726"
      > </a
      ><a name="20727" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20729"
      > </a
      ><a name="20730" href="2016-10-30-one-lambda-calculus-many-times-2.html#20694" class="Bound"
      >&#916;</a
      ><a name="20731"
      > </a
      ><a name="20732" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="20733"
      > </a
      ><a name="20734" href="2016-10-30-one-lambda-calculus-many-times-2.html#20680" class="Bound"
      >A</a
      ><a name="20735"
      >
    </a
      ><a name="20740" href="2016-10-30-one-lambda-calculus-many-times-2.html#20671" class="Function"
      >c&#8314;&#8242;</a
      ><a name="20743"
      > </a
      ><a name="20744" href="2016-10-30-one-lambda-calculus-many-times-2.html#20744" class="Bound"
      >&#915;</a
      ><a name="20745"
      > </a
      ><a name="20746" class="Symbol"
      >=</a
      ><a name="20747"
      > </a
      ><a name="20748" href="2016-03-20-one-lambda-calculus-many-times.html#7307" class="Function"
      >struct</a
      ><a name="20754"
      > </a
      ><a name="20755" class="Symbol"
      >(</a
      ><a name="20756" href="2016-10-30-one-lambda-calculus-many-times-2.html#20175" class="Function"
      >contract</a
      ><a name="20764"
      > </a
      ><a name="20765" href="2016-10-30-one-lambda-calculus-many-times-2.html#20744" class="Bound"
      >&#915;</a
      ><a name="20766" class="Symbol"
      >)</a
      ><a name="20767"
      >

    </a
      ><a name="20773" href="2016-10-30-one-lambda-calculus-many-times-2.html#20773" class="Function"
      >p&#8314;&#8242;</a
      ><a name="20776"
      > </a
      ><a name="20777" class="Symbol"
      >:</a
      ><a name="20778"
      > </a
      ><a name="20787" class="Symbol"
      >&#8704;</a
      ><a name="20788"
      > </a
      ><a name="20789" href="2016-10-30-one-lambda-calculus-many-times-2.html#20789" class="Bound"
      >&#915;</a
      ><a name="20790"
      > </a
      ><a name="20791" href="2016-10-30-one-lambda-calculus-many-times-2.html#20791" class="Bound"
      >&#931;</a
      ><a name="20792"
      > </a
      ><a name="20793" href="2016-10-30-one-lambda-calculus-many-times-2.html#20793" class="Bound"
      >&#928;</a
      ><a name="20794"
      > </a
      ><a name="20795" class="Symbol"
      >&#8594;</a
      ><a name="20796"
      > </a
      ><a name="20805" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="20807"
      > </a
      ><a name="20808" class="Symbol"
      >(</a
      ><a name="20809" href="2016-10-30-one-lambda-calculus-many-times-2.html#20789" class="Bound"
      >&#915;</a
      ><a name="20810"
      > </a
      ><a name="20811" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20813"
      > </a
      ><a name="20814" href="2016-10-30-one-lambda-calculus-many-times-2.html#20791" class="Bound"
      >&#931;</a
      ><a name="20815" class="Symbol"
      >)</a
      ><a name="20816"
      > </a
      ><a name="20817" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20819"
      > </a
      ><a name="20820" class="Symbol"
      >(</a
      ><a name="20821" href="2016-10-30-one-lambda-calculus-many-times-2.html#20793" class="Bound"
      >&#928;</a
      ><a name="20822"
      > </a
      ><a name="20823" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20825"
      > </a
      ><a name="20826" href="2016-10-30-one-lambda-calculus-many-times-2.html#20800" class="Bound"
      >&#916;</a
      ><a name="20827" class="Symbol"
      >)</a
      ><a name="20828"
      > </a
      ><a name="20829" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="20830"
      > </a
      ><a name="20831" href="2016-10-30-one-lambda-calculus-many-times-2.html#20782" class="Bound"
      >A</a
      ><a name="20832"
      >
                 </a
      ><a name="20850" class="Symbol"
      >&#8594;</a
      ><a name="20851"
      > </a
      ><a name="20852" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="20854"
      > </a
      ><a name="20855" class="Symbol"
      >(</a
      ><a name="20856" href="2016-10-30-one-lambda-calculus-many-times-2.html#20789" class="Bound"
      >&#915;</a
      ><a name="20857"
      > </a
      ><a name="20858" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20860"
      > </a
      ><a name="20861" href="2016-10-30-one-lambda-calculus-many-times-2.html#20793" class="Bound"
      >&#928;</a
      ><a name="20862" class="Symbol"
      >)</a
      ><a name="20863"
      > </a
      ><a name="20864" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20866"
      > </a
      ><a name="20867" class="Symbol"
      >(</a
      ><a name="20868" href="2016-10-30-one-lambda-calculus-many-times-2.html#20791" class="Bound"
      >&#931;</a
      ><a name="20869"
      > </a
      ><a name="20870" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="20872"
      > </a
      ><a name="20873" href="2016-10-30-one-lambda-calculus-many-times-2.html#20800" class="Bound"
      >&#916;</a
      ><a name="20874" class="Symbol"
      >)</a
      ><a name="20875"
      > </a
      ><a name="20876" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="20877"
      > </a
      ><a name="20878" href="2016-10-30-one-lambda-calculus-many-times-2.html#20782" class="Bound"
      >A</a
      ><a name="20879"
      >
    </a
      ><a name="20884" href="2016-10-30-one-lambda-calculus-many-times-2.html#20773" class="Function"
      >p&#8314;&#8242;</a
      ><a name="20887"
      > </a
      ><a name="20888" href="2016-10-30-one-lambda-calculus-many-times-2.html#20888" class="Bound"
      >&#915;</a
      ><a name="20889"
      > </a
      ><a name="20890" href="2016-10-30-one-lambda-calculus-many-times-2.html#20890" class="Bound"
      >&#931;</a
      ><a name="20891"
      > </a
      ><a name="20892" href="2016-10-30-one-lambda-calculus-many-times-2.html#20892" class="Bound"
      >&#928;</a
      ><a name="20893"
      > </a
      ><a name="20894" class="Symbol"
      >=</a
      ><a name="20895"
      > </a
      ><a name="20896" href="2016-03-20-one-lambda-calculus-many-times.html#7307" class="Function"
      >struct</a
      ><a name="20902"
      > </a
      ><a name="20903" class="Symbol"
      >(</a
      ><a name="20904" href="2016-10-30-one-lambda-calculus-many-times-2.html#19315" class="Function"
      >permute</a
      ><a name="20911"
      > </a
      ><a name="20912" href="2016-10-30-one-lambda-calculus-many-times-2.html#20888" class="Bound"
      >&#915;</a
      ><a name="20913"
      > </a
      ><a name="20914" href="2016-10-30-one-lambda-calculus-many-times-2.html#20890" class="Bound"
      >&#931;</a
      ><a name="20915"
      > </a
      ><a name="20916" href="2016-10-30-one-lambda-calculus-many-times-2.html#20892" class="Bound"
      >&#928;</a
      ><a name="20917" class="Symbol"
      >)</a
      >
</pre>
<!--{% endraw %}-->

Boop.

<div class="foldable">
<!--{% raw %}-->
<pre class="Agda">
    <a name="20978" href="2016-10-30-one-lambda-calculus-many-times-2.html#20978" class="Function"
      >s&#8314;&#8242;</a
      ><a name="20981"
      > </a
      ><a name="20982" class="Symbol"
      >:</a
      ><a name="20983"
      > </a
      ><a name="20992" class="Symbol"
      >&#8704;</a
      ><a name="20993"
      > </a
      ><a name="20994" href="2016-10-30-one-lambda-calculus-many-times-2.html#20994" class="Bound"
      >&#915;</a
      ><a name="20995"
      > </a
      ><a name="20996" href="2016-10-30-one-lambda-calculus-many-times-2.html#20996" class="Bound"
      >&#931;</a
      ><a name="20997"
      > </a
      ><a name="20998" class="Symbol"
      >&#8594;</a
      ><a name="20999"
      > </a
      ><a name="21008" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="21010"
      > </a
      ><a name="21011" class="Symbol"
      >(</a
      ><a name="21012" href="2016-10-30-one-lambda-calculus-many-times-2.html#20994" class="Bound"
      >&#915;</a
      ><a name="21013"
      > </a
      ><a name="21014" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="21016"
      > </a
      ><a name="21017" href="2016-10-30-one-lambda-calculus-many-times-2.html#20996" class="Bound"
      >&#931;</a
      ><a name="21018" class="Symbol"
      >)</a
      ><a name="21019"
      > </a
      ><a name="21020" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="21022"
      > </a
      ><a name="21023" href="2016-10-30-one-lambda-calculus-many-times-2.html#21003" class="Bound"
      >&#928;</a
      ><a name="21024"
      > </a
      ><a name="21025" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="21026"
      > </a
      ><a name="21027" href="2016-10-30-one-lambda-calculus-many-times-2.html#20987" class="Bound"
      >A</a
      ><a name="21028"
      >
                </a
      ><a name="21045" class="Symbol"
      >&#8594;</a
      ><a name="21046"
      > </a
      ><a name="21047" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="21049"
      > </a
      ><a name="21050" class="Symbol"
      >(</a
      ><a name="21051" href="2016-10-30-one-lambda-calculus-many-times-2.html#20994" class="Bound"
      >&#915;</a
      ><a name="21052"
      > </a
      ><a name="21053" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="21055"
      > </a
      ><a name="21056" href="2016-10-30-one-lambda-calculus-many-times-2.html#21003" class="Bound"
      >&#928;</a
      ><a name="21057" class="Symbol"
      >)</a
      ><a name="21058"
      > </a
      ><a name="21059" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="21061"
      > </a
      ><a name="21062" href="2016-10-30-one-lambda-calculus-many-times-2.html#20996" class="Bound"
      >&#931;</a
      ><a name="21063"
      > </a
      ><a name="21064" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="21065"
      > </a
      ><a name="21066" href="2016-10-30-one-lambda-calculus-many-times-2.html#20987" class="Bound"
      >A</a
      ><a name="21067"
      >
    </a
      ><a name="21072" href="2016-10-30-one-lambda-calculus-many-times-2.html#20978" class="Function"
      >s&#8314;&#8242;</a
      ><a name="21075"
      > </a
      ><a name="21080" href="2016-10-30-one-lambda-calculus-many-times-2.html#21080" class="Bound"
      >&#915;</a
      ><a name="21081"
      > </a
      ><a name="21082" href="2016-10-30-one-lambda-calculus-many-times-2.html#21082" class="Bound"
      >&#931;</a
      ><a name="21083"
      > </a
      ><a name="21088" href="2016-10-30-one-lambda-calculus-many-times-2.html#21088" class="Bound"
      >f</a
      ><a name="21089"
      >
      </a
      ><a name="21096" class="Symbol"
      >=</a
      ><a name="21097"
      > </a
      ><a name="21098" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#705" class="Function"
      >subst</a
      ><a name="21103"
      > </a
      ><a name="21104" class="Symbol"
      >(&#955;</a
      ><a name="21106"
      > </a
      ><a name="21107" href="2016-10-30-one-lambda-calculus-many-times-2.html#21107" class="Bound"
      >&#931;</a
      ><a name="21108"
      > </a
      ><a name="21109" class="Symbol"
      >&#8594;</a
      ><a name="21110"
      > </a
      ><a name="21111" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="21113"
      > </a
      ><a name="21114" class="Symbol"
      >(</a
      ><a name="21115" href="2016-10-30-one-lambda-calculus-many-times-2.html#21080" class="Bound"
      >&#915;</a
      ><a name="21116"
      > </a
      ><a name="21117" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="21119"
      > </a
      ><a name="21120" href="2016-10-30-one-lambda-calculus-many-times-2.html#21085" class="Bound"
      >&#928;</a
      ><a name="21121" class="Symbol"
      >)</a
      ><a name="21122"
      > </a
      ><a name="21123" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="21125"
      > </a
      ><a name="21126" href="2016-10-30-one-lambda-calculus-many-times-2.html#21107" class="Bound"
      >&#931;</a
      ><a name="21127"
      > </a
      ><a name="21128" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="21129"
      > </a
      ><a name="21130" href="2016-10-30-one-lambda-calculus-many-times-2.html#21077" class="Bound"
      >A</a
      ><a name="21131" class="Symbol"
      >)</a
      ><a name="21132"
      >      </a
      ><a name="21138" class="Symbol"
      >(</a
      ><a name="21139" href="2016-10-30-one-lambda-calculus-many-times-2.html#2084" class="Function"
      >++-identity&#691;</a
      ><a name="21151"
      > </a
      ><a name="21152" href="2016-10-30-one-lambda-calculus-many-times-2.html#21082" class="Bound"
      >&#931;</a
      ><a name="21153" class="Symbol"
      >)</a
      ><a name="21154"
      >
      </a
      ><a name="21161" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="21162"
      > </a
      ><a name="21163" href="2016-10-30-one-lambda-calculus-many-times-2.html#20773" class="Function"
      >p&#8314;&#8242;</a
      ><a name="21166"
      > </a
      ><a name="21167" href="2016-10-30-one-lambda-calculus-many-times-2.html#21080" class="Bound"
      >&#915;</a
      ><a name="21168"
      > </a
      ><a name="21169" href="2016-10-30-one-lambda-calculus-many-times-2.html#21082" class="Bound"
      >&#931;</a
      ><a name="21170"
      > </a
      ><a name="21171" href="2016-10-30-one-lambda-calculus-many-times-2.html#21085" class="Bound"
      >&#928;</a
      ><a name="21172"
      >
      </a
      ><a name="21179" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="21180"
      > </a
      ><a name="21181" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#705" class="Function"
      >subst</a
      ><a name="21186"
      > </a
      ><a name="21187" class="Symbol"
      >(&#955;</a
      ><a name="21189"
      > </a
      ><a name="21190" href="2016-10-30-one-lambda-calculus-many-times-2.html#21190" class="Bound"
      >&#928;</a
      ><a name="21191"
      > </a
      ><a name="21192" class="Symbol"
      >&#8594;</a
      ><a name="21193"
      > </a
      ><a name="21194" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="21196"
      > </a
      ><a name="21197" class="Symbol"
      >(</a
      ><a name="21198" href="2016-10-30-one-lambda-calculus-many-times-2.html#21080" class="Bound"
      >&#915;</a
      ><a name="21199"
      > </a
      ><a name="21200" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="21202"
      > </a
      ><a name="21203" href="2016-10-30-one-lambda-calculus-many-times-2.html#21082" class="Bound"
      >&#931;</a
      ><a name="21204" class="Symbol"
      >)</a
      ><a name="21205"
      > </a
      ><a name="21206" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="21208"
      > </a
      ><a name="21209" href="2016-10-30-one-lambda-calculus-many-times-2.html#21190" class="Bound"
      >&#928;</a
      ><a name="21210"
      > </a
      ><a name="21211" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="21212"
      > </a
      ><a name="21213" href="2016-10-30-one-lambda-calculus-many-times-2.html#21077" class="Bound"
      >A</a
      ><a name="21214" class="Symbol"
      >)</a
      ><a name="21215"
      > </a
      ><a name="21216" class="Symbol"
      >(</a
      ><a name="21217" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#565" class="Function"
      >sym</a
      ><a name="21220"
      > </a
      ><a name="21221" class="Symbol"
      >(</a
      ><a name="21222" href="2016-10-30-one-lambda-calculus-many-times-2.html#2084" class="Function"
      >++-identity&#691;</a
      ><a name="21234"
      > </a
      ><a name="21235" href="2016-10-30-one-lambda-calculus-many-times-2.html#21085" class="Bound"
      >&#928;</a
      ><a name="21236" class="Symbol"
      >))</a
      ><a name="21238"
      >
      </a
      ><a name="21245" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="21246"
      > </a
      ><a name="21247" href="2016-10-30-one-lambda-calculus-many-times-2.html#21088" class="Bound"
      >f</a
      >
</pre>
<!--{% endraw %}-->
</div>



### Deriving Structural Rules in NJ

<div class="hidden">
<!--{% raw %}-->
<pre class="Agda">
  <a name="21343" class="Keyword"
      >module</a
      ><a name="21349"
      > </a
      ><a name="21350" href="2016-10-30-one-lambda-calculus-many-times-2.html#21350" class="Module"
      >NJ</a
      ><a name="21352"
      > </a
      ><a name="21353" class="Keyword"
      >where</a
      >
</pre>
<!--{% endraw %}-->
</div>

We can derive these same extended structural rules in NJ. For instance, below we derive the equivalent weakening rule:

<!--{% raw %}-->
<pre class="Agda">
    <a name="21515" href="2016-10-30-one-lambda-calculus-many-times-2.html#21515" class="Function"
      >w&#8314;&#8242;</a
      ><a name="21518"
      > </a
      ><a name="21519" class="Symbol"
      >:</a
      ><a name="21520"
      > </a
      ><a name="21529" class="Symbol"
      >&#8704;</a
      ><a name="21530"
      > </a
      ><a name="21531" href="2016-10-30-one-lambda-calculus-many-times-2.html#21531" class="Bound"
      >&#915;</a
      ><a name="21532"
      > </a
      ><a name="21533" class="Symbol"
      >&#8594;</a
      ><a name="21534"
      > </a
      ><a name="21543" href="2016-10-30-one-lambda-calculus-many-times-2.html#7056" class="Datatype Operator"
      >NJ</a
      ><a name="21545"
      > </a
      ><a name="21546" href="2016-10-30-one-lambda-calculus-many-times-2.html#21538" class="Bound"
      >&#916;</a
      ><a name="21547"
      > </a
      ><a name="21548" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="21549"
      > </a
      ><a name="21550" href="2016-10-30-one-lambda-calculus-many-times-2.html#21524" class="Bound"
      >A</a
      ><a name="21551"
      > </a
      ><a name="21552" class="Symbol"
      >&#8594;</a
      ><a name="21553"
      > </a
      ><a name="21554" href="2016-10-30-one-lambda-calculus-many-times-2.html#7056" class="Datatype Operator"
      >NJ</a
      ><a name="21556"
      > </a
      ><a name="21557" href="2016-10-30-one-lambda-calculus-many-times-2.html#21531" class="Bound"
      >&#915;</a
      ><a name="21558"
      > </a
      ><a name="21559" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="21561"
      > </a
      ><a name="21562" href="2016-10-30-one-lambda-calculus-many-times-2.html#21538" class="Bound"
      >&#916;</a
      ><a name="21563"
      > </a
      ><a name="21564" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="21565"
      > </a
      ><a name="21566" href="2016-10-30-one-lambda-calculus-many-times-2.html#21524" class="Bound"
      >A</a
      ><a name="21567"
      >
    </a
      ><a name="21572" href="2016-10-30-one-lambda-calculus-many-times-2.html#21515" class="Function"
      >w&#8314;&#8242;</a
      ><a name="21575"
      > </a
      ><a name="21576" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="21578"
      >      </a
      ><a name="21584" href="2016-10-30-one-lambda-calculus-many-times-2.html#21584" class="Bound"
      >f</a
      ><a name="21585"
      > </a
      ><a name="21586" class="Symbol"
      >=</a
      ><a name="21587"
      > </a
      ><a name="21588" href="2016-10-30-one-lambda-calculus-many-times-2.html#21584" class="Bound"
      >f</a
      ><a name="21589"
      >
    </a
      ><a name="21594" href="2016-10-30-one-lambda-calculus-many-times-2.html#21515" class="Function"
      >w&#8314;&#8242;</a
      ><a name="21597"
      > </a
      ><a name="21598" class="Symbol"
      >(</a
      ><a name="21599" href="2016-10-30-one-lambda-calculus-many-times-2.html#21599" class="Bound"
      >B</a
      ><a name="21600"
      > </a
      ><a name="21601" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="21602"
      > </a
      ><a name="21603" href="2016-10-30-one-lambda-calculus-many-times-2.html#21603" class="Bound"
      >&#915;</a
      ><a name="21604" class="Symbol"
      >)</a
      ><a name="21605"
      > </a
      ><a name="21606" href="2016-10-30-one-lambda-calculus-many-times-2.html#21606" class="Bound"
      >f</a
      ><a name="21607"
      > </a
      ><a name="21608" class="Symbol"
      >=</a
      ><a name="21609"
      > </a
      ><a name="21610" href="2016-10-30-one-lambda-calculus-many-times-2.html#7243" class="InductiveConstructor"
      >w</a
      ><a name="21611"
      > </a
      ><a name="21612" class="Symbol"
      >(</a
      ><a name="21613" href="2016-10-30-one-lambda-calculus-many-times-2.html#21515" class="Function"
      >w&#8314;&#8242;</a
      ><a name="21616"
      > </a
      ><a name="21617" href="2016-10-30-one-lambda-calculus-many-times-2.html#21603" class="Bound"
      >&#915;</a
      ><a name="21618"
      > </a
      ><a name="21619" href="2016-10-30-one-lambda-calculus-many-times-2.html#21606" class="Bound"
      >f</a
      ><a name="21620" class="Symbol"
      >)</a
      >
</pre>
<!--{% endraw %}-->

The remainder of the proofs are rather similar to those for ND,

<div class="foldable">
<!--{% raw %}-->
<pre class="Agda">
    <a name="21739" href="2016-10-30-one-lambda-calculus-many-times-2.html#21739" class="Function"
      >f&#8314;&#8242;</a
      ><a name="21742"
      > </a
      ><a name="21743" class="Symbol"
      >:</a
      ><a name="21744"
      > </a
      ><a name="21755" class="Symbol"
      >&#8704;</a
      ><a name="21756"
      > </a
      ><a name="21757" href="2016-10-30-one-lambda-calculus-many-times-2.html#21757" class="Bound"
      >&#915;</a
      ><a name="21758"
      > </a
      ><a name="21759" href="2016-10-30-one-lambda-calculus-many-times-2.html#21759" class="Bound"
      >&#931;</a
      ><a name="21760"
      > </a
      ><a name="21761" class="Symbol"
      >&#8594;</a
      ><a name="21762"
      > </a
      ><a name="21771" href="2016-10-30-one-lambda-calculus-many-times-2.html#7056" class="Datatype Operator"
      >NJ</a
      ><a name="21773"
      > </a
      ><a name="21774" class="Symbol"
      >(</a
      ><a name="21775" href="2016-10-30-one-lambda-calculus-many-times-2.html#21757" class="Bound"
      >&#915;</a
      ><a name="21776"
      > </a
      ><a name="21777" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="21779"
      > </a
      ><a name="21780" href="2016-10-30-one-lambda-calculus-many-times-2.html#21759" class="Bound"
      >&#931;</a
      ><a name="21781" class="Symbol"
      >)</a
      ><a name="21782"
      > </a
      ><a name="21783" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="21785"
      > </a
      ><a name="21786" class="Symbol"
      >(</a
      ><a name="21787" href="2016-10-30-one-lambda-calculus-many-times-2.html#21748" class="Bound"
      >A</a
      ><a name="21788"
      > </a
      ><a name="21789" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="21790"
      > </a
      ><a name="21791" href="2016-10-30-one-lambda-calculus-many-times-2.html#21766" class="Bound"
      >&#916;</a
      ><a name="21792" class="Symbol"
      >)</a
      ><a name="21793"
      > </a
      ><a name="21794" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="21795"
      > </a
      ><a name="21796" href="2016-10-30-one-lambda-calculus-many-times-2.html#21750" class="Bound"
      >B</a
      ><a name="21797"
      >
                </a
      ><a name="21814" class="Symbol"
      >&#8594;</a
      ><a name="21815"
      > </a
      ><a name="21816" href="2016-10-30-one-lambda-calculus-many-times-2.html#7056" class="Datatype Operator"
      >NJ</a
      ><a name="21818"
      > </a
      ><a name="21819" class="Symbol"
      >(</a
      ><a name="21820" href="2016-10-30-one-lambda-calculus-many-times-2.html#21757" class="Bound"
      >&#915;</a
      ><a name="21821"
      > </a
      ><a name="21822" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="21824"
      > </a
      ><a name="21825" href="2016-10-30-one-lambda-calculus-many-times-2.html#21748" class="Bound"
      >A</a
      ><a name="21826"
      > </a
      ><a name="21827" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="21828"
      > </a
      ><a name="21829" href="2016-10-30-one-lambda-calculus-many-times-2.html#21759" class="Bound"
      >&#931;</a
      ><a name="21830" class="Symbol"
      >)</a
      ><a name="21831"
      > </a
      ><a name="21832" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="21834"
      > </a
      ><a name="21835" href="2016-10-30-one-lambda-calculus-many-times-2.html#21766" class="Bound"
      >&#916;</a
      ><a name="21836"
      > </a
      ><a name="21837" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="21838"
      > </a
      ><a name="21839" href="2016-10-30-one-lambda-calculus-many-times-2.html#21750" class="Bound"
      >B</a
      ><a name="21840"
      >
    </a
      ><a name="21845" href="2016-10-30-one-lambda-calculus-many-times-2.html#21739" class="Function"
      >f&#8314;&#8242;</a
      ><a name="21848"
      > </a
      ><a name="21857" href="2016-10-30-one-lambda-calculus-many-times-2.html#21857" class="Bound"
      >&#915;</a
      ><a name="21858"
      > </a
      ><a name="21859" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="21861"
      > </a
      ><a name="21866" href="2016-10-30-one-lambda-calculus-many-times-2.html#21866" class="Bound"
      >f</a
      ><a name="21867"
      >
           </a
      ><a name="21879" class="Comment"
      >-- NJ (&#915; ++ A &#8759; []) ++ &#916; &#8866; .B</a
      ><a name="21908"
      >
      </a
      ><a name="21915" class="Keyword"
      >rewrite</a
      ><a name="21922"
      > </a
      ><a name="21923" href="2016-10-30-one-lambda-calculus-many-times-2.html#2084" class="Function"
      >++-identity&#691;</a
      ><a name="21935"
      > </a
      ><a name="21936" href="2016-10-30-one-lambda-calculus-many-times-2.html#21857" class="Bound"
      >&#915;</a
      ><a name="21937"
      >
           </a
      ><a name="21949" class="Comment"
      >-- NJ (&#915; ++ A &#8759; []) ++ &#916; &#8866; B</a
      ><a name="21977"
      >
            </a
      ><a name="21990" class="Symbol"
      >|</a
      ><a name="21991"
      > </a
      ><a name="21992" href="2016-10-30-one-lambda-calculus-many-times-2.html#2120" class="Function"
      >++-assoc</a
      ><a name="22000"
      > </a
      ><a name="22001" href="2016-10-30-one-lambda-calculus-many-times-2.html#21857" class="Bound"
      >&#915;</a
      ><a name="22002"
      > </a
      ><a name="22003" class="Symbol"
      >(</a
      ><a name="22004" href="2016-10-30-one-lambda-calculus-many-times-2.html#21850" class="Bound"
      >A</a
      ><a name="22005"
      > </a
      ><a name="22006" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22007"
      > </a
      ><a name="22008" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="22010" class="Symbol"
      >)</a
      ><a name="22011"
      > </a
      ><a name="22012" href="2016-10-30-one-lambda-calculus-many-times-2.html#21863" class="Bound"
      >&#916;</a
      ><a name="22013"
      >
           </a
      ><a name="22025" class="Comment"
      >-- NJ &#915; ++ A &#8759; &#916; &#8866; B</a
      ><a name="22045"
      >
            </a
      ><a name="22058" class="Symbol"
      >=</a
      ><a name="22059"
      > </a
      ><a name="22060" href="2016-10-30-one-lambda-calculus-many-times-2.html#21866" class="Bound"
      >f</a
      ><a name="22061"
      >

    </a
      ><a name="22067" href="2016-10-30-one-lambda-calculus-many-times-2.html#21739" class="Function"
      >f&#8314;&#8242;</a
      ><a name="22070"
      > </a
      ><a name="22079" href="2016-10-30-one-lambda-calculus-many-times-2.html#22079" class="Bound"
      >&#915;</a
      ><a name="22080"
      > </a
      ><a name="22081" class="Symbol"
      >(</a
      ><a name="22082" href="2016-10-30-one-lambda-calculus-many-times-2.html#22082" class="Bound"
      >C</a
      ><a name="22083"
      > </a
      ><a name="22084" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22085"
      > </a
      ><a name="22086" href="2016-10-30-one-lambda-calculus-many-times-2.html#22086" class="Bound"
      >&#931;</a
      ><a name="22087" class="Symbol"
      >)</a
      ><a name="22088"
      > </a
      ><a name="22093" href="2016-10-30-one-lambda-calculus-many-times-2.html#22093" class="Bound"
      >f</a
      ><a name="22094"
      >
      </a
      ><a name="22101" class="Keyword"
      >rewrite</a
      ><a name="22108"
      > </a
      ><a name="22109" href="2016-10-30-one-lambda-calculus-many-times-2.html#2120" class="Function"
      >++-assoc</a
      ><a name="22117"
      > </a
      ><a name="22118" href="2016-10-30-one-lambda-calculus-many-times-2.html#22079" class="Bound"
      >&#915;</a
      ><a name="22119"
      > </a
      ><a name="22120" class="Symbol"
      >(</a
      ><a name="22121" href="2016-10-30-one-lambda-calculus-many-times-2.html#22072" class="Bound"
      >A</a
      ><a name="22122"
      > </a
      ><a name="22123" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22124"
      > </a
      ><a name="22125" href="2016-10-30-one-lambda-calculus-many-times-2.html#22082" class="Bound"
      >C</a
      ><a name="22126"
      > </a
      ><a name="22127" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22128"
      > </a
      ><a name="22129" href="2016-10-30-one-lambda-calculus-many-times-2.html#22086" class="Bound"
      >&#931;</a
      ><a name="22130" class="Symbol"
      >)</a
      ><a name="22131"
      > </a
      ><a name="22132" href="2016-10-30-one-lambda-calculus-many-times-2.html#22090" class="Bound"
      >&#916;</a
      ><a name="22133"
      >
           </a
      ><a name="22145" class="Comment"
      >-- NJ &#915; ++ A &#8759; C &#8759; &#931; ++ &#916; &#8866; B</a
      ><a name="22174"
      >
            </a
      ><a name="22187" class="Symbol"
      >=</a
      ><a name="22188"
      > </a
      ><a name="22189" href="2016-10-30-one-lambda-calculus-many-times-2.html#7349" class="InductiveConstructor"
      >p</a
      ><a name="22190"
      > </a
      ><a name="22191" href="2016-10-30-one-lambda-calculus-many-times-2.html#22079" class="Bound"
      >&#915;</a
      ><a name="22192"
      > </a
      ><a name="22193" href="2016-10-30-one-lambda-calculus-many-times-2.html#22219" class="Function"
      >g</a
      ><a name="22194"
      >
        </a
      ><a name="22203" class="Keyword"
      >where</a
      ><a name="22208"
      >
          </a
      ><a name="22219" href="2016-10-30-one-lambda-calculus-many-times-2.html#22219" class="Function"
      >g</a
      ><a name="22220"
      > </a
      ><a name="22221" class="Symbol"
      >:</a
      ><a name="22222"
      > </a
      ><a name="22223" href="2016-10-30-one-lambda-calculus-many-times-2.html#7056" class="Datatype Operator"
      >NJ</a
      ><a name="22225"
      > </a
      ><a name="22226" href="2016-10-30-one-lambda-calculus-many-times-2.html#22079" class="Bound"
      >&#915;</a
      ><a name="22227"
      > </a
      ><a name="22228" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22230"
      > </a
      ><a name="22231" href="2016-10-30-one-lambda-calculus-many-times-2.html#22082" class="Bound"
      >C</a
      ><a name="22232"
      > </a
      ><a name="22233" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22234"
      > </a
      ><a name="22235" href="2016-10-30-one-lambda-calculus-many-times-2.html#22072" class="Bound"
      >A</a
      ><a name="22236"
      > </a
      ><a name="22237" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22238"
      > </a
      ><a name="22239" href="2016-10-30-one-lambda-calculus-many-times-2.html#22086" class="Bound"
      >&#931;</a
      ><a name="22240"
      > </a
      ><a name="22241" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22243"
      > </a
      ><a name="22244" href="2016-10-30-one-lambda-calculus-many-times-2.html#22090" class="Bound"
      >&#916;</a
      ><a name="22245"
      > </a
      ><a name="22246" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="22247"
      > </a
      ><a name="22248" href="2016-10-30-one-lambda-calculus-many-times-2.html#22076" class="Bound"
      >B</a
      ><a name="22249"
      >
          </a
      ><a name="22260" href="2016-10-30-one-lambda-calculus-many-times-2.html#22219" class="Function"
      >g</a
      ><a name="22261"
      > </a
      ><a name="22262" class="Keyword"
      >rewrite</a
      ><a name="22269"
      > </a
      ><a name="22270" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#565" class="Function"
      >sym</a
      ><a name="22273"
      > </a
      ><a name="22274" class="Symbol"
      >(</a
      ><a name="22275" href="2016-10-30-one-lambda-calculus-many-times-2.html#2120" class="Function"
      >++-assoc</a
      ><a name="22283"
      > </a
      ><a name="22284" href="2016-10-30-one-lambda-calculus-many-times-2.html#22079" class="Bound"
      >&#915;</a
      ><a name="22285"
      > </a
      ><a name="22286" class="Symbol"
      >(</a
      ><a name="22287" href="2016-10-30-one-lambda-calculus-many-times-2.html#22082" class="Bound"
      >C</a
      ><a name="22288"
      > </a
      ><a name="22289" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22290"
      > </a
      ><a name="22291" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="22293" class="Symbol"
      >)</a
      ><a name="22294"
      > </a
      ><a name="22295" class="Symbol"
      >(</a
      ><a name="22296" href="2016-10-30-one-lambda-calculus-many-times-2.html#22072" class="Bound"
      >A</a
      ><a name="22297"
      > </a
      ><a name="22298" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22299"
      > </a
      ><a name="22300" href="2016-10-30-one-lambda-calculus-many-times-2.html#22086" class="Bound"
      >&#931;</a
      ><a name="22301"
      > </a
      ><a name="22302" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22304"
      > </a
      ><a name="22305" href="2016-10-30-one-lambda-calculus-many-times-2.html#22090" class="Bound"
      >&#916;</a
      ><a name="22306" class="Symbol"
      >))</a
      ><a name="22308"
      >
                 </a
      ><a name="22326" class="Comment"
      >-- NJ (&#915; ++ C &#8759; []) ++ A &#8759; &#931; ++ &#916; &#8866; B</a
      ><a name="22363"
      >
                  </a
      ><a name="22382" class="Symbol"
      >|</a
      ><a name="22383"
      > </a
      ><a name="22384" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#565" class="Function"
      >sym</a
      ><a name="22387"
      > </a
      ><a name="22388" class="Symbol"
      >(</a
      ><a name="22389" href="2016-10-30-one-lambda-calculus-many-times-2.html#2120" class="Function"
      >++-assoc</a
      ><a name="22397"
      > </a
      ><a name="22398" class="Symbol"
      >(</a
      ><a name="22399" href="2016-10-30-one-lambda-calculus-many-times-2.html#22079" class="Bound"
      >&#915;</a
      ><a name="22400"
      > </a
      ><a name="22401" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22403"
      > </a
      ><a name="22404" href="2016-10-30-one-lambda-calculus-many-times-2.html#22082" class="Bound"
      >C</a
      ><a name="22405"
      > </a
      ><a name="22406" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22407"
      > </a
      ><a name="22408" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="22410" class="Symbol"
      >)</a
      ><a name="22411"
      > </a
      ><a name="22412" class="Symbol"
      >(</a
      ><a name="22413" href="2016-10-30-one-lambda-calculus-many-times-2.html#22072" class="Bound"
      >A</a
      ><a name="22414"
      > </a
      ><a name="22415" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22416"
      > </a
      ><a name="22417" href="2016-10-30-one-lambda-calculus-many-times-2.html#22086" class="Bound"
      >&#931;</a
      ><a name="22418" class="Symbol"
      >)</a
      ><a name="22419"
      > </a
      ><a name="22420" href="2016-10-30-one-lambda-calculus-many-times-2.html#22090" class="Bound"
      >&#916;</a
      ><a name="22421" class="Symbol"
      >)</a
      ><a name="22422"
      >
                 </a
      ><a name="22440" class="Comment"
      >-- NJ ((&#915; ++ C &#8759; []) ++ A &#8759; &#931;) ++ &#916; &#8866; B</a
      ><a name="22479"
      >
                 </a
      ><a name="22497" class="Symbol"
      >=</a
      ><a name="22498"
      > </a
      ><a name="22499" href="2016-10-30-one-lambda-calculus-many-times-2.html#21739" class="Function"
      >f&#8314;&#8242;</a
      ><a name="22502"
      > </a
      ><a name="22503" class="Symbol"
      >(</a
      ><a name="22504" href="2016-10-30-one-lambda-calculus-many-times-2.html#22079" class="Bound"
      >&#915;</a
      ><a name="22505"
      > </a
      ><a name="22506" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22508"
      > </a
      ><a name="22509" href="2016-10-30-one-lambda-calculus-many-times-2.html#22082" class="Bound"
      >C</a
      ><a name="22510"
      > </a
      ><a name="22511" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22512"
      > </a
      ><a name="22513" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="22515" class="Symbol"
      >)</a
      ><a name="22516"
      > </a
      ><a name="22517" href="2016-10-30-one-lambda-calculus-many-times-2.html#22086" class="Bound"
      >&#931;</a
      ><a name="22518"
      > </a
      ><a name="22523" href="2016-10-30-one-lambda-calculus-many-times-2.html#22561" class="Function"
      >h</a
      ><a name="22524"
      >
              </a
      ><a name="22539" class="Keyword"
      >where</a
      ><a name="22544"
      >
                </a
      ><a name="22561" href="2016-10-30-one-lambda-calculus-many-times-2.html#22561" class="Function"
      >h</a
      ><a name="22562"
      > </a
      ><a name="22563" class="Symbol"
      >:</a
      ><a name="22564"
      > </a
      ><a name="22565" href="2016-10-30-one-lambda-calculus-many-times-2.html#7056" class="Datatype Operator"
      >NJ</a
      ><a name="22567"
      > </a
      ><a name="22568" class="Symbol"
      >((</a
      ><a name="22570" href="2016-10-30-one-lambda-calculus-many-times-2.html#22079" class="Bound"
      >&#915;</a
      ><a name="22571"
      > </a
      ><a name="22572" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22574"
      > </a
      ><a name="22575" href="2016-10-30-one-lambda-calculus-many-times-2.html#22082" class="Bound"
      >C</a
      ><a name="22576"
      > </a
      ><a name="22577" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22578"
      > </a
      ><a name="22579" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="22581" class="Symbol"
      >)</a
      ><a name="22582"
      > </a
      ><a name="22583" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22585"
      > </a
      ><a name="22586" href="2016-10-30-one-lambda-calculus-many-times-2.html#22086" class="Bound"
      >&#931;</a
      ><a name="22587" class="Symbol"
      >)</a
      ><a name="22588"
      > </a
      ><a name="22589" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22591"
      > </a
      ><a name="22592" href="2016-10-30-one-lambda-calculus-many-times-2.html#22072" class="Bound"
      >A</a
      ><a name="22593"
      > </a
      ><a name="22594" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22595"
      > </a
      ><a name="22596" href="2016-10-30-one-lambda-calculus-many-times-2.html#22090" class="Bound"
      >&#916;</a
      ><a name="22597"
      > </a
      ><a name="22598" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="22599"
      > </a
      ><a name="22600" href="2016-10-30-one-lambda-calculus-many-times-2.html#22076" class="Bound"
      >B</a
      ><a name="22601"
      >
                </a
      ><a name="22618" href="2016-10-30-one-lambda-calculus-many-times-2.html#22561" class="Function"
      >h</a
      ><a name="22619"
      > </a
      ><a name="22620" class="Keyword"
      >rewrite</a
      ><a name="22627"
      > </a
      ><a name="22628" href="2016-10-30-one-lambda-calculus-many-times-2.html#2120" class="Function"
      >++-assoc</a
      ><a name="22636"
      > </a
      ><a name="22637" href="2016-10-30-one-lambda-calculus-many-times-2.html#22079" class="Bound"
      >&#915;</a
      ><a name="22638"
      > </a
      ><a name="22639" class="Symbol"
      >(</a
      ><a name="22640" href="2016-10-30-one-lambda-calculus-many-times-2.html#22082" class="Bound"
      >C</a
      ><a name="22641"
      > </a
      ><a name="22642" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="22643"
      > </a
      ><a name="22644" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="22646" class="Symbol"
      >)</a
      ><a name="22647"
      > </a
      ><a name="22648" href="2016-10-30-one-lambda-calculus-many-times-2.html#22086" class="Bound"
      >&#931;</a
      ><a name="22649"
      > </a
      ><a name="22650" class="Symbol"
      >=</a
      ><a name="22651"
      > </a
      ><a name="22652" href="2016-10-30-one-lambda-calculus-many-times-2.html#22093" class="Bound"
      >f</a
      >
</pre>
<!--{% endraw %}-->
</div>
<div class="foldable">
<!--{% raw %}-->
<pre class="Agda">
    <a name="22712" href="2016-10-30-one-lambda-calculus-many-times-2.html#22712" class="Function"
      >p&#8314;&#8242;</a
      ><a name="22715"
      > </a
      ><a name="22716" class="Symbol"
      >:</a
      ><a name="22717"
      > </a
      ><a name="22726" class="Symbol"
      >&#8704;</a
      ><a name="22727"
      > </a
      ><a name="22728" href="2016-10-30-one-lambda-calculus-many-times-2.html#22728" class="Bound"
      >&#915;</a
      ><a name="22729"
      > </a
      ><a name="22730" href="2016-10-30-one-lambda-calculus-many-times-2.html#22730" class="Bound"
      >&#931;</a
      ><a name="22731"
      > </a
      ><a name="22732" href="2016-10-30-one-lambda-calculus-many-times-2.html#22732" class="Bound"
      >&#928;</a
      ><a name="22733"
      > </a
      ><a name="22734" class="Symbol"
      >&#8594;</a
      ><a name="22735"
      > </a
      ><a name="22744" href="2016-10-30-one-lambda-calculus-many-times-2.html#7056" class="Datatype Operator"
      >NJ</a
      ><a name="22746"
      > </a
      ><a name="22747" class="Symbol"
      >(</a
      ><a name="22748" href="2016-10-30-one-lambda-calculus-many-times-2.html#22728" class="Bound"
      >&#915;</a
      ><a name="22749"
      > </a
      ><a name="22750" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22752"
      > </a
      ><a name="22753" href="2016-10-30-one-lambda-calculus-many-times-2.html#22730" class="Bound"
      >&#931;</a
      ><a name="22754" class="Symbol"
      >)</a
      ><a name="22755"
      > </a
      ><a name="22756" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22758"
      > </a
      ><a name="22759" class="Symbol"
      >(</a
      ><a name="22760" href="2016-10-30-one-lambda-calculus-many-times-2.html#22732" class="Bound"
      >&#928;</a
      ><a name="22761"
      > </a
      ><a name="22762" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22764"
      > </a
      ><a name="22765" href="2016-10-30-one-lambda-calculus-many-times-2.html#22739" class="Bound"
      >&#916;</a
      ><a name="22766" class="Symbol"
      >)</a
      ><a name="22767"
      > </a
      ><a name="22768" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="22769"
      > </a
      ><a name="22770" href="2016-10-30-one-lambda-calculus-many-times-2.html#22721" class="Bound"
      >A</a
      ><a name="22771"
      >
                  </a
      ><a name="22790" class="Symbol"
      >&#8594;</a
      ><a name="22791"
      > </a
      ><a name="22792" href="2016-10-30-one-lambda-calculus-many-times-2.html#7056" class="Datatype Operator"
      >NJ</a
      ><a name="22794"
      > </a
      ><a name="22795" class="Symbol"
      >(</a
      ><a name="22796" href="2016-10-30-one-lambda-calculus-many-times-2.html#22728" class="Bound"
      >&#915;</a
      ><a name="22797"
      > </a
      ><a name="22798" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22800"
      > </a
      ><a name="22801" href="2016-10-30-one-lambda-calculus-many-times-2.html#22732" class="Bound"
      >&#928;</a
      ><a name="22802" class="Symbol"
      >)</a
      ><a name="22803"
      > </a
      ><a name="22804" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22806"
      > </a
      ><a name="22807" class="Symbol"
      >(</a
      ><a name="22808" href="2016-10-30-one-lambda-calculus-many-times-2.html#22730" class="Bound"
      >&#931;</a
      ><a name="22809"
      > </a
      ><a name="22810" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="22812"
      > </a
      ><a name="22813" href="2016-10-30-one-lambda-calculus-many-times-2.html#22739" class="Bound"
      >&#916;</a
      ><a name="22814" class="Symbol"
      >)</a
      ><a name="22815"
      > </a
      ><a name="22816" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="22817"
      > </a
      ><a name="22818" href="2016-10-30-one-lambda-calculus-many-times-2.html#22721" class="Bound"
      >A</a
      ><a name="22819"
      >
    </a
      ><a name="22824" href="2016-10-30-one-lambda-calculus-many-times-2.html#22712" class="Function"
      >p&#8314;&#8242;</a
      ><a name="22827"
      > </a
      ><a name="22832" href="2016-10-30-one-lambda-calculus-many-times-2.html#22832" class="Bound"
      >&#915;</a
      ><a name="22833"
      > </a
      ><a name="22834" href="2016-10-30-one-lambda-calculus-many-times-2.html#22834" class="Bound"
      >&#931;</a
      ><a name="22835"
      > </a
      ><a name="22836" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="22838"
      > </a
      ><a name="22843" href="2016-10-30-one-lambda-calculus-many-times-2.html#22843" class="Bound"
      >f</a
      ><a name="22844"
      >
           </a
      ><a name="22856" class="Comment"
      >-- NJ (&#915; ++ []) ++ &#931; ++ &#916; &#8866; A</a
      ><a name="22885"
      >
      </a
      ><a name="22892" class="Keyword"
      >rewrite</a
      ><a name="22899"
      > </a
      ><a name="22900" href="2016-10-30-one-lambda-calculus-many-times-2.html#2084" class="Function"
      >++-identity&#691;</a
      ><a name="22912"
      > </a
      ><a name="22913" href="2016-10-30-one-lambda-calculus-many-times-2.html#22832" class="Bound"
      >&#915;</a
      ><a name="22914"
      >
           </a
      ><a name="22926" class="Comment"
      >-- NJ &#915; ++ &#931; ++ &#916; &#8866; A</a
      ><a name="22947"
      >
            </a
      ><a name="22960" class="Symbol"
      >|</a
      ><a name="22961"
      > </a
      ><a name="22962" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#565" class="Function"
      >sym</a
      ><a name="22965"
      > </a
      ><a name="22966" class="Symbol"
      >(</a
      ><a name="22967" href="2016-10-30-one-lambda-calculus-many-times-2.html#2120" class="Function"
      >++-assoc</a
      ><a name="22975"
      > </a
      ><a name="22976" href="2016-10-30-one-lambda-calculus-many-times-2.html#22832" class="Bound"
      >&#915;</a
      ><a name="22977"
      > </a
      ><a name="22978" href="2016-10-30-one-lambda-calculus-many-times-2.html#22834" class="Bound"
      >&#931;</a
      ><a name="22979"
      > </a
      ><a name="22980" href="2016-10-30-one-lambda-calculus-many-times-2.html#22840" class="Bound"
      >&#916;</a
      ><a name="22981" class="Symbol"
      >)</a
      ><a name="22982"
      >
           </a
      ><a name="22994" class="Comment"
      >-- NJ (&#915; ++ &#931;) ++ &#916; &#8866; A</a
      ><a name="23017"
      >
            </a
      ><a name="23030" class="Symbol"
      >=</a
      ><a name="23031"
      > </a
      ><a name="23032" href="2016-10-30-one-lambda-calculus-many-times-2.html#22843" class="Bound"
      >f</a
      ><a name="23033"
      >

    </a
      ><a name="23039" href="2016-10-30-one-lambda-calculus-many-times-2.html#22712" class="Function"
      >p&#8314;&#8242;</a
      ><a name="23042"
      > </a
      ><a name="23047" href="2016-10-30-one-lambda-calculus-many-times-2.html#23047" class="Bound"
      >&#915;</a
      ><a name="23048"
      > </a
      ><a name="23049" href="2016-10-30-one-lambda-calculus-many-times-2.html#23049" class="Bound"
      >&#931;</a
      ><a name="23050"
      > </a
      ><a name="23051" class="Symbol"
      >(</a
      ><a name="23052" href="2016-10-30-one-lambda-calculus-many-times-2.html#23052" class="Bound"
      >B</a
      ><a name="23053"
      > </a
      ><a name="23054" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23055"
      > </a
      ><a name="23056" href="2016-10-30-one-lambda-calculus-many-times-2.html#23056" class="Bound"
      >&#928;</a
      ><a name="23057" class="Symbol"
      >)</a
      ><a name="23058"
      > </a
      ><a name="23063" href="2016-10-30-one-lambda-calculus-many-times-2.html#23063" class="Bound"
      >f</a
      ><a name="23064"
      >
           </a
      ><a name="23076" class="Comment"
      >-- NJ (&#915; ++ B &#8759; &#928;) ++ &#931; ++ &#916; &#8866; A</a
      ><a name="23108"
      >
      </a
      ><a name="23115" class="Keyword"
      >rewrite</a
      ><a name="23122"
      > </a
      ><a name="23123" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#565" class="Function"
      >sym</a
      ><a name="23126"
      > </a
      ><a name="23127" class="Symbol"
      >(</a
      ><a name="23128" href="2016-10-30-one-lambda-calculus-many-times-2.html#2120" class="Function"
      >++-assoc</a
      ><a name="23136"
      > </a
      ><a name="23137" href="2016-10-30-one-lambda-calculus-many-times-2.html#23047" class="Bound"
      >&#915;</a
      ><a name="23138"
      > </a
      ><a name="23139" class="Symbol"
      >(</a
      ><a name="23140" href="2016-10-30-one-lambda-calculus-many-times-2.html#23052" class="Bound"
      >B</a
      ><a name="23141"
      > </a
      ><a name="23142" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23143"
      > </a
      ><a name="23144" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="23146" class="Symbol"
      >)</a
      ><a name="23147"
      > </a
      ><a name="23148" href="2016-10-30-one-lambda-calculus-many-times-2.html#23056" class="Bound"
      >&#928;</a
      ><a name="23149" class="Symbol"
      >)</a
      ><a name="23150"
      >
           </a
      ><a name="23162" class="Comment"
      >-- NJ ((&#915; ++ B &#8759; []) ++ &#928;) ++ &#931; ++ &#916; &#8866; A</a
      ><a name="23202"
      >
            </a
      ><a name="23215" class="Symbol"
      >=</a
      ><a name="23216"
      > </a
      ><a name="23217" href="2016-10-30-one-lambda-calculus-many-times-2.html#22712" class="Function"
      >p&#8314;&#8242;</a
      ><a name="23220"
      > </a
      ><a name="23221" class="Symbol"
      >(</a
      ><a name="23222" href="2016-10-30-one-lambda-calculus-many-times-2.html#23047" class="Bound"
      >&#915;</a
      ><a name="23223"
      > </a
      ><a name="23224" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23226"
      > </a
      ><a name="23227" href="2016-10-30-one-lambda-calculus-many-times-2.html#23052" class="Bound"
      >B</a
      ><a name="23228"
      > </a
      ><a name="23229" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23230"
      > </a
      ><a name="23231" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="23233" class="Symbol"
      >)</a
      ><a name="23234"
      > </a
      ><a name="23235" href="2016-10-30-one-lambda-calculus-many-times-2.html#23049" class="Bound"
      >&#931;</a
      ><a name="23236"
      > </a
      ><a name="23237" href="2016-10-30-one-lambda-calculus-many-times-2.html#23056" class="Bound"
      >&#928;</a
      ><a name="23238"
      > </a
      ><a name="23243" href="2016-10-30-one-lambda-calculus-many-times-2.html#23269" class="Function"
      >g</a
      ><a name="23244"
      >
        </a
      ><a name="23253" class="Keyword"
      >where</a
      ><a name="23258"
      >
          </a
      ><a name="23269" href="2016-10-30-one-lambda-calculus-many-times-2.html#23269" class="Function"
      >g</a
      ><a name="23270"
      > </a
      ><a name="23271" class="Symbol"
      >:</a
      ><a name="23272"
      > </a
      ><a name="23273" href="2016-10-30-one-lambda-calculus-many-times-2.html#7056" class="Datatype Operator"
      >NJ</a
      ><a name="23275"
      > </a
      ><a name="23276" class="Symbol"
      >((</a
      ><a name="23278" href="2016-10-30-one-lambda-calculus-many-times-2.html#23047" class="Bound"
      >&#915;</a
      ><a name="23279"
      > </a
      ><a name="23280" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23282"
      > </a
      ><a name="23283" href="2016-10-30-one-lambda-calculus-many-times-2.html#23052" class="Bound"
      >B</a
      ><a name="23284"
      > </a
      ><a name="23285" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23286"
      > </a
      ><a name="23287" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="23289" class="Symbol"
      >)</a
      ><a name="23290"
      > </a
      ><a name="23291" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23293"
      > </a
      ><a name="23294" href="2016-10-30-one-lambda-calculus-many-times-2.html#23049" class="Bound"
      >&#931;</a
      ><a name="23295" class="Symbol"
      >)</a
      ><a name="23296"
      > </a
      ><a name="23297" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23299"
      > </a
      ><a name="23300" href="2016-10-30-one-lambda-calculus-many-times-2.html#23056" class="Bound"
      >&#928;</a
      ><a name="23301"
      > </a
      ><a name="23302" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23304"
      > </a
      ><a name="23305" href="2016-10-30-one-lambda-calculus-many-times-2.html#23060" class="Bound"
      >&#916;</a
      ><a name="23306"
      > </a
      ><a name="23307" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="23308"
      > </a
      ><a name="23309" href="2016-10-30-one-lambda-calculus-many-times-2.html#23044" class="Bound"
      >A</a
      ><a name="23310"
      >
          </a
      ><a name="23321" href="2016-10-30-one-lambda-calculus-many-times-2.html#23269" class="Function"
      >g</a
      ><a name="23322"
      > </a
      ><a name="23323" class="Keyword"
      >rewrite</a
      ><a name="23330"
      > </a
      ><a name="23331" href="2016-10-30-one-lambda-calculus-many-times-2.html#2120" class="Function"
      >++-assoc</a
      ><a name="23339"
      > </a
      ><a name="23340" href="2016-10-30-one-lambda-calculus-many-times-2.html#23047" class="Bound"
      >&#915;</a
      ><a name="23341"
      > </a
      ><a name="23342" class="Symbol"
      >(</a
      ><a name="23343" href="2016-10-30-one-lambda-calculus-many-times-2.html#23052" class="Bound"
      >B</a
      ><a name="23344"
      > </a
      ><a name="23345" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23346"
      > </a
      ><a name="23347" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="23349" class="Symbol"
      >)</a
      ><a name="23350"
      > </a
      ><a name="23351" href="2016-10-30-one-lambda-calculus-many-times-2.html#23049" class="Bound"
      >&#931;</a
      ><a name="23352"
      >
                 </a
      ><a name="23370" class="Comment"
      >-- NJ (&#915; ++ B &#8759; &#931;) ++ &#928; ++ &#916; &#8866; A</a
      ><a name="23402"
      >
                  </a
      ><a name="23421" class="Symbol"
      >=</a
      ><a name="23422"
      > </a
      ><a name="23423" href="2016-10-30-one-lambda-calculus-many-times-2.html#21739" class="Function"
      >f&#8314;&#8242;</a
      ><a name="23426"
      > </a
      ><a name="23427" href="2016-10-30-one-lambda-calculus-many-times-2.html#23047" class="Bound"
      >&#915;</a
      ><a name="23428"
      > </a
      ><a name="23429" href="2016-10-30-one-lambda-calculus-many-times-2.html#23049" class="Bound"
      >&#931;</a
      ><a name="23430"
      > </a
      ><a name="23431" href="2016-10-30-one-lambda-calculus-many-times-2.html#23063" class="Bound"
      >f</a
      >
</pre>
<!--{% endraw %}-->
</div>
<div class="foldable">
<!--{% raw %}-->
<pre class="Agda">
    <a name="23491" href="2016-10-30-one-lambda-calculus-many-times-2.html#23491" class="Function"
      >c&#8314;&#8242;</a
      ><a name="23494"
      > </a
      ><a name="23495" class="Symbol"
      >:</a
      ><a name="23496"
      > </a
      ><a name="23505" class="Symbol"
      >&#8704;</a
      ><a name="23506"
      > </a
      ><a name="23507" href="2016-10-30-one-lambda-calculus-many-times-2.html#23507" class="Bound"
      >&#915;</a
      ><a name="23508"
      > </a
      ><a name="23509" class="Symbol"
      >&#8594;</a
      ><a name="23510"
      > </a
      ><a name="23519" href="2016-10-30-one-lambda-calculus-many-times-2.html#7056" class="Datatype Operator"
      >NJ</a
      ><a name="23521"
      > </a
      ><a name="23522" class="Symbol"
      >(</a
      ><a name="23523" href="2016-10-30-one-lambda-calculus-many-times-2.html#23507" class="Bound"
      >&#915;</a
      ><a name="23524"
      > </a
      ><a name="23525" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23527"
      > </a
      ><a name="23528" href="2016-10-30-one-lambda-calculus-many-times-2.html#23507" class="Bound"
      >&#915;</a
      ><a name="23529" class="Symbol"
      >)</a
      ><a name="23530"
      > </a
      ><a name="23531" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23533"
      > </a
      ><a name="23534" href="2016-10-30-one-lambda-calculus-many-times-2.html#23514" class="Bound"
      >&#916;</a
      ><a name="23535"
      > </a
      ><a name="23536" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="23537"
      > </a
      ><a name="23538" href="2016-10-30-one-lambda-calculus-many-times-2.html#23500" class="Bound"
      >A</a
      ><a name="23539"
      > </a
      ><a name="23540" class="Symbol"
      >&#8594;</a
      ><a name="23541"
      > </a
      ><a name="23542" href="2016-10-30-one-lambda-calculus-many-times-2.html#7056" class="Datatype Operator"
      >NJ</a
      ><a name="23544"
      > </a
      ><a name="23545" href="2016-10-30-one-lambda-calculus-many-times-2.html#23507" class="Bound"
      >&#915;</a
      ><a name="23546"
      > </a
      ><a name="23547" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23549"
      > </a
      ><a name="23550" href="2016-10-30-one-lambda-calculus-many-times-2.html#23514" class="Bound"
      >&#916;</a
      ><a name="23551"
      > </a
      ><a name="23552" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="23553"
      > </a
      ><a name="23554" href="2016-10-30-one-lambda-calculus-many-times-2.html#23500" class="Bound"
      >A</a
      ><a name="23555"
      >
    </a
      ><a name="23560" href="2016-10-30-one-lambda-calculus-many-times-2.html#23491" class="Function"
      >c&#8314;&#8242;</a
      ><a name="23563"
      > </a
      ><a name="23568" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="23570"
      >      </a
      ><a name="23580" href="2016-10-30-one-lambda-calculus-many-times-2.html#23580" class="Bound"
      >f</a
      ><a name="23581"
      > </a
      ><a name="23582" class="Symbol"
      >=</a
      ><a name="23583"
      > </a
      ><a name="23584" href="2016-10-30-one-lambda-calculus-many-times-2.html#23580" class="Bound"
      >f</a
      ><a name="23585"
      >
    </a
      ><a name="23590" href="2016-10-30-one-lambda-calculus-many-times-2.html#23491" class="Function"
      >c&#8314;&#8242;</a
      ><a name="23593"
      > </a
      ><a name="23598" class="Symbol"
      >(</a
      ><a name="23599" href="2016-10-30-one-lambda-calculus-many-times-2.html#23599" class="Bound"
      >B</a
      ><a name="23600"
      > </a
      ><a name="23601" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23602"
      > </a
      ><a name="23603" href="2016-10-30-one-lambda-calculus-many-times-2.html#23603" class="Bound"
      >&#915;</a
      ><a name="23604" class="Symbol"
      >)</a
      ><a name="23605"
      > </a
      ><a name="23610" href="2016-10-30-one-lambda-calculus-many-times-2.html#23610" class="Bound"
      >f</a
      ><a name="23611"
      > </a
      ><a name="23612" class="Symbol"
      >=</a
      ><a name="23613"
      > </a
      ><a name="23614" href="2016-10-30-one-lambda-calculus-many-times-2.html#7292" class="InductiveConstructor"
      >c</a
      ><a name="23615"
      > </a
      ><a name="23616" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="23617"
      > </a
      ><a name="23618" href="2016-10-30-one-lambda-calculus-many-times-2.html#22712" class="Function"
      >p&#8314;&#8242;</a
      ><a name="23621"
      > </a
      ><a name="23622" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="23624"
      > </a
      ><a name="23625" href="2016-10-30-one-lambda-calculus-many-times-2.html#23603" class="Bound"
      >&#915;</a
      ><a name="23626"
      > </a
      ><a name="23627" class="Symbol"
      >(</a
      ><a name="23628" href="2016-10-30-one-lambda-calculus-many-times-2.html#23599" class="Bound"
      >B</a
      ><a name="23629"
      > </a
      ><a name="23630" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23631"
      > </a
      ><a name="23632" href="2016-10-30-one-lambda-calculus-many-times-2.html#23599" class="Bound"
      >B</a
      ><a name="23633"
      > </a
      ><a name="23634" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23635"
      > </a
      ><a name="23636" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="23638" class="Symbol"
      >)</a
      ><a name="23639"
      >        </a
      ><a name="23647" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="23648"
      > </a
      ><a name="23649" href="2016-10-30-one-lambda-calculus-many-times-2.html#23491" class="Function"
      >c&#8314;&#8242;</a
      ><a name="23652"
      > </a
      ><a name="23653" href="2016-10-30-one-lambda-calculus-many-times-2.html#23603" class="Bound"
      >&#915;</a
      ><a name="23654"
      >
                      </a
      ><a name="23677" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="23678"
      > </a
      ><a name="23679" href="2016-10-30-one-lambda-calculus-many-times-2.html#22712" class="Function"
      >p&#8314;&#8242;</a
      ><a name="23682"
      > </a
      ><a name="23683" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="23685"
      > </a
      ><a name="23686" class="Symbol"
      >(</a
      ><a name="23687" href="2016-10-30-one-lambda-calculus-many-times-2.html#23599" class="Bound"
      >B</a
      ><a name="23688"
      > </a
      ><a name="23689" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23690"
      > </a
      ><a name="23691" href="2016-10-30-one-lambda-calculus-many-times-2.html#23599" class="Bound"
      >B</a
      ><a name="23692"
      > </a
      ><a name="23693" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23694"
      > </a
      ><a name="23695" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="23697" class="Symbol"
      >)</a
      ><a name="23698"
      > </a
      ><a name="23699" class="Symbol"
      >(</a
      ><a name="23700" href="2016-10-30-one-lambda-calculus-many-times-2.html#23603" class="Bound"
      >&#915;</a
      ><a name="23701"
      > </a
      ><a name="23702" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23704"
      > </a
      ><a name="23705" href="2016-10-30-one-lambda-calculus-many-times-2.html#23603" class="Bound"
      >&#915;</a
      ><a name="23706" class="Symbol"
      >)</a
      ><a name="23707"
      > </a
      ><a name="23708" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="23709"
      > </a
      ><a name="23710" href="2016-10-30-one-lambda-calculus-many-times-2.html#23732" class="Function"
      >g</a
      ><a name="23711"
      >
      </a
      ><a name="23718" class="Keyword"
      >where</a
      ><a name="23723"
      >
        </a
      ><a name="23732" href="2016-10-30-one-lambda-calculus-many-times-2.html#23732" class="Function"
      >g</a
      ><a name="23733"
      > </a
      ><a name="23734" class="Symbol"
      >:</a
      ><a name="23735"
      > </a
      ><a name="23736" href="2016-10-30-one-lambda-calculus-many-times-2.html#7056" class="Datatype Operator"
      >NJ</a
      ><a name="23738"
      > </a
      ><a name="23739" class="Symbol"
      >(</a
      ><a name="23740" href="2016-10-30-one-lambda-calculus-many-times-2.html#23599" class="Bound"
      >B</a
      ><a name="23741"
      > </a
      ><a name="23742" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23743"
      > </a
      ><a name="23744" href="2016-10-30-one-lambda-calculus-many-times-2.html#23599" class="Bound"
      >B</a
      ><a name="23745"
      > </a
      ><a name="23746" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23747"
      > </a
      ><a name="23748" href="2016-10-30-one-lambda-calculus-many-times-2.html#23603" class="Bound"
      >&#915;</a
      ><a name="23749"
      > </a
      ><a name="23750" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23752"
      > </a
      ><a name="23753" href="2016-10-30-one-lambda-calculus-many-times-2.html#23603" class="Bound"
      >&#915;</a
      ><a name="23754" class="Symbol"
      >)</a
      ><a name="23755"
      > </a
      ><a name="23756" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23758"
      > </a
      ><a name="23759" href="2016-10-30-one-lambda-calculus-many-times-2.html#23607" class="Bound"
      >&#916;</a
      ><a name="23760"
      > </a
      ><a name="23761" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="23762"
      > </a
      ><a name="23763" href="2016-10-30-one-lambda-calculus-many-times-2.html#23595" class="Bound"
      >A</a
      ><a name="23764"
      >
        </a
      ><a name="23773" href="2016-10-30-one-lambda-calculus-many-times-2.html#23732" class="Function"
      >g</a
      ><a name="23774"
      > </a
      ><a name="23775" class="Keyword"
      >rewrite</a
      ><a name="23782"
      > </a
      ><a name="23783" href="2016-10-30-one-lambda-calculus-many-times-2.html#2120" class="Function"
      >++-assoc</a
      ><a name="23791"
      > </a
      ><a name="23792" class="Symbol"
      >(</a
      ><a name="23793" href="2016-10-30-one-lambda-calculus-many-times-2.html#23599" class="Bound"
      >B</a
      ><a name="23794"
      > </a
      ><a name="23795" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23796"
      > </a
      ><a name="23797" href="2016-10-30-one-lambda-calculus-many-times-2.html#23599" class="Bound"
      >B</a
      ><a name="23798"
      > </a
      ><a name="23799" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23800"
      > </a
      ><a name="23801" href="2016-10-30-one-lambda-calculus-many-times-2.html#23603" class="Bound"
      >&#915;</a
      ><a name="23802" class="Symbol"
      >)</a
      ><a name="23803"
      > </a
      ><a name="23804" href="2016-10-30-one-lambda-calculus-many-times-2.html#23603" class="Bound"
      >&#915;</a
      ><a name="23805"
      > </a
      ><a name="23806" href="2016-10-30-one-lambda-calculus-many-times-2.html#23607" class="Bound"
      >&#916;</a
      ><a name="23807"
      >
                </a
      ><a name="23824" class="Symbol"
      >=</a
      ><a name="23825"
      > </a
      ><a name="23826" href="2016-10-30-one-lambda-calculus-many-times-2.html#21739" class="Function"
      >f&#8314;&#8242;</a
      ><a name="23829"
      > </a
      ><a name="23830" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="23832"
      > </a
      ><a name="23833" class="Symbol"
      >(</a
      ><a name="23834" href="2016-10-30-one-lambda-calculus-many-times-2.html#23599" class="Bound"
      >B</a
      ><a name="23835"
      > </a
      ><a name="23836" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23837"
      > </a
      ><a name="23838" href="2016-10-30-one-lambda-calculus-many-times-2.html#23603" class="Bound"
      >&#915;</a
      ><a name="23839" class="Symbol"
      >)</a
      ><a name="23840"
      > </a
      ><a name="23841" href="2016-10-30-one-lambda-calculus-many-times-2.html#23875" class="Function"
      >h</a
      ><a name="23842"
      >
            </a
      ><a name="23855" class="Keyword"
      >where</a
      ><a name="23860"
      >
              </a
      ><a name="23875" href="2016-10-30-one-lambda-calculus-many-times-2.html#23875" class="Function"
      >h</a
      ><a name="23876"
      > </a
      ><a name="23877" class="Symbol"
      >:</a
      ><a name="23878"
      > </a
      ><a name="23879" href="2016-10-30-one-lambda-calculus-many-times-2.html#7056" class="Datatype Operator"
      >NJ</a
      ><a name="23881"
      > </a
      ><a name="23882" href="2016-10-30-one-lambda-calculus-many-times-2.html#23599" class="Bound"
      >B</a
      ><a name="23883"
      > </a
      ><a name="23884" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23885"
      > </a
      ><a name="23886" href="2016-10-30-one-lambda-calculus-many-times-2.html#23603" class="Bound"
      >&#915;</a
      ><a name="23887"
      > </a
      ><a name="23888" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23890"
      > </a
      ><a name="23891" href="2016-10-30-one-lambda-calculus-many-times-2.html#23599" class="Bound"
      >B</a
      ><a name="23892"
      > </a
      ><a name="23893" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23894"
      > </a
      ><a name="23895" href="2016-10-30-one-lambda-calculus-many-times-2.html#23603" class="Bound"
      >&#915;</a
      ><a name="23896"
      > </a
      ><a name="23897" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="23899"
      > </a
      ><a name="23900" href="2016-10-30-one-lambda-calculus-many-times-2.html#23607" class="Bound"
      >&#916;</a
      ><a name="23901"
      > </a
      ><a name="23902" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="23903"
      > </a
      ><a name="23904" href="2016-10-30-one-lambda-calculus-many-times-2.html#23595" class="Bound"
      >A</a
      ><a name="23905"
      >
              </a
      ><a name="23920" href="2016-10-30-one-lambda-calculus-many-times-2.html#23875" class="Function"
      >h</a
      ><a name="23921"
      > </a
      ><a name="23922" class="Keyword"
      >rewrite</a
      ><a name="23929"
      > </a
      ><a name="23930" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#565" class="Function"
      >sym</a
      ><a name="23933"
      > </a
      ><a name="23934" class="Symbol"
      >(</a
      ><a name="23935" href="2016-10-30-one-lambda-calculus-many-times-2.html#2120" class="Function"
      >++-assoc</a
      ><a name="23943"
      > </a
      ><a name="23944" class="Symbol"
      >(</a
      ><a name="23945" href="2016-10-30-one-lambda-calculus-many-times-2.html#23599" class="Bound"
      >B</a
      ><a name="23946"
      > </a
      ><a name="23947" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23948"
      > </a
      ><a name="23949" href="2016-10-30-one-lambda-calculus-many-times-2.html#23603" class="Bound"
      >&#915;</a
      ><a name="23950" class="Symbol"
      >)</a
      ><a name="23951"
      > </a
      ><a name="23952" class="Symbol"
      >(</a
      ><a name="23953" href="2016-10-30-one-lambda-calculus-many-times-2.html#23599" class="Bound"
      >B</a
      ><a name="23954"
      > </a
      ><a name="23955" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="23956"
      > </a
      ><a name="23957" href="2016-10-30-one-lambda-calculus-many-times-2.html#23603" class="Bound"
      >&#915;</a
      ><a name="23958" class="Symbol"
      >)</a
      ><a name="23959"
      > </a
      ><a name="23960" href="2016-10-30-one-lambda-calculus-many-times-2.html#23607" class="Bound"
      >&#916;</a
      ><a name="23961" class="Symbol"
      >)</a
      ><a name="23962"
      >
                      </a
      ><a name="23985" class="Symbol"
      >=</a
      ><a name="23986"
      > </a
      ><a name="23987" href="2016-10-30-one-lambda-calculus-many-times-2.html#23610" class="Bound"
      >f</a
      >
</pre>
<!--{% endraw %}-->
</div>
<div class="foldable">
<!--{% raw %}-->
<pre class="Agda">
    <a name="24047" href="2016-10-30-one-lambda-calculus-many-times-2.html#24047" class="Function"
      >s&#8314;&#8242;</a
      ><a name="24050"
      > </a
      ><a name="24051" class="Symbol"
      >:</a
      ><a name="24052"
      > </a
      ><a name="24061" class="Symbol"
      >&#8704;</a
      ><a name="24062"
      > </a
      ><a name="24063" href="2016-10-30-one-lambda-calculus-many-times-2.html#24063" class="Bound"
      >&#915;</a
      ><a name="24064"
      > </a
      ><a name="24065" href="2016-10-30-one-lambda-calculus-many-times-2.html#24065" class="Bound"
      >&#931;</a
      ><a name="24066"
      > </a
      ><a name="24067" class="Symbol"
      >&#8594;</a
      ><a name="24068"
      > </a
      ><a name="24077" href="2016-10-30-one-lambda-calculus-many-times-2.html#7056" class="Datatype Operator"
      >NJ</a
      ><a name="24079"
      > </a
      ><a name="24080" class="Symbol"
      >(</a
      ><a name="24081" href="2016-10-30-one-lambda-calculus-many-times-2.html#24063" class="Bound"
      >&#915;</a
      ><a name="24082"
      > </a
      ><a name="24083" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="24085"
      > </a
      ><a name="24086" href="2016-10-30-one-lambda-calculus-many-times-2.html#24065" class="Bound"
      >&#931;</a
      ><a name="24087" class="Symbol"
      >)</a
      ><a name="24088"
      > </a
      ><a name="24089" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="24091"
      > </a
      ><a name="24092" href="2016-10-30-one-lambda-calculus-many-times-2.html#24072" class="Bound"
      >&#928;</a
      ><a name="24093"
      > </a
      ><a name="24094" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="24095"
      > </a
      ><a name="24096" href="2016-10-30-one-lambda-calculus-many-times-2.html#24056" class="Bound"
      >A</a
      ><a name="24097"
      >
                </a
      ><a name="24114" class="Symbol"
      >&#8594;</a
      ><a name="24115"
      > </a
      ><a name="24116" href="2016-10-30-one-lambda-calculus-many-times-2.html#7056" class="Datatype Operator"
      >NJ</a
      ><a name="24118"
      > </a
      ><a name="24119" class="Symbol"
      >(</a
      ><a name="24120" href="2016-10-30-one-lambda-calculus-many-times-2.html#24063" class="Bound"
      >&#915;</a
      ><a name="24121"
      > </a
      ><a name="24122" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="24124"
      > </a
      ><a name="24125" href="2016-10-30-one-lambda-calculus-many-times-2.html#24072" class="Bound"
      >&#928;</a
      ><a name="24126" class="Symbol"
      >)</a
      ><a name="24127"
      > </a
      ><a name="24128" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="24130"
      > </a
      ><a name="24131" href="2016-10-30-one-lambda-calculus-many-times-2.html#24065" class="Bound"
      >&#931;</a
      ><a name="24132"
      > </a
      ><a name="24133" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="24134"
      > </a
      ><a name="24135" href="2016-10-30-one-lambda-calculus-many-times-2.html#24056" class="Bound"
      >A</a
      ><a name="24136"
      >
    </a
      ><a name="24141" href="2016-10-30-one-lambda-calculus-many-times-2.html#24047" class="Function"
      >s&#8314;&#8242;</a
      ><a name="24144"
      > </a
      ><a name="24149" href="2016-10-30-one-lambda-calculus-many-times-2.html#24149" class="Bound"
      >&#915;</a
      ><a name="24150"
      > </a
      ><a name="24151" href="2016-10-30-one-lambda-calculus-many-times-2.html#24151" class="Bound"
      >&#931;</a
      ><a name="24152"
      > </a
      ><a name="24157" href="2016-10-30-one-lambda-calculus-many-times-2.html#24157" class="Bound"
      >f</a
      ><a name="24158"
      >
      </a
      ><a name="24165" class="Symbol"
      >=</a
      ><a name="24166"
      > </a
      ><a name="24167" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#705" class="Function"
      >subst</a
      ><a name="24172"
      > </a
      ><a name="24173" class="Symbol"
      >(&#955;</a
      ><a name="24175"
      > </a
      ><a name="24176" href="2016-10-30-one-lambda-calculus-many-times-2.html#24176" class="Bound"
      >&#931;</a
      ><a name="24177"
      > </a
      ><a name="24178" class="Symbol"
      >&#8594;</a
      ><a name="24179"
      > </a
      ><a name="24180" href="2016-10-30-one-lambda-calculus-many-times-2.html#7056" class="Datatype Operator"
      >NJ</a
      ><a name="24182"
      > </a
      ><a name="24183" class="Symbol"
      >(</a
      ><a name="24184" href="2016-10-30-one-lambda-calculus-many-times-2.html#24149" class="Bound"
      >&#915;</a
      ><a name="24185"
      > </a
      ><a name="24186" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="24188"
      > </a
      ><a name="24189" href="2016-10-30-one-lambda-calculus-many-times-2.html#24154" class="Bound"
      >&#928;</a
      ><a name="24190" class="Symbol"
      >)</a
      ><a name="24191"
      > </a
      ><a name="24192" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="24194"
      > </a
      ><a name="24195" href="2016-10-30-one-lambda-calculus-many-times-2.html#24176" class="Bound"
      >&#931;</a
      ><a name="24196"
      > </a
      ><a name="24197" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="24198"
      > </a
      ><a name="24199" href="2016-10-30-one-lambda-calculus-many-times-2.html#24146" class="Bound"
      >A</a
      ><a name="24200" class="Symbol"
      >)</a
      ><a name="24201"
      >      </a
      ><a name="24207" class="Symbol"
      >(</a
      ><a name="24208" href="2016-10-30-one-lambda-calculus-many-times-2.html#2084" class="Function"
      >++-identity&#691;</a
      ><a name="24220"
      > </a
      ><a name="24221" href="2016-10-30-one-lambda-calculus-many-times-2.html#24151" class="Bound"
      >&#931;</a
      ><a name="24222" class="Symbol"
      >)</a
      ><a name="24223"
      >
      </a
      ><a name="24230" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="24231"
      > </a
      ><a name="24232" href="2016-10-30-one-lambda-calculus-many-times-2.html#22712" class="Function"
      >p&#8314;&#8242;</a
      ><a name="24235"
      > </a
      ><a name="24236" href="2016-10-30-one-lambda-calculus-many-times-2.html#24149" class="Bound"
      >&#915;</a
      ><a name="24237"
      > </a
      ><a name="24238" href="2016-10-30-one-lambda-calculus-many-times-2.html#24151" class="Bound"
      >&#931;</a
      ><a name="24239"
      > </a
      ><a name="24240" href="2016-10-30-one-lambda-calculus-many-times-2.html#24154" class="Bound"
      >&#928;</a
      ><a name="24241"
      >
      </a
      ><a name="24248" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="24249"
      > </a
      ><a name="24250" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#705" class="Function"
      >subst</a
      ><a name="24255"
      > </a
      ><a name="24256" class="Symbol"
      >(&#955;</a
      ><a name="24258"
      > </a
      ><a name="24259" href="2016-10-30-one-lambda-calculus-many-times-2.html#24259" class="Bound"
      >&#928;</a
      ><a name="24260"
      > </a
      ><a name="24261" class="Symbol"
      >&#8594;</a
      ><a name="24262"
      > </a
      ><a name="24263" href="2016-10-30-one-lambda-calculus-many-times-2.html#7056" class="Datatype Operator"
      >NJ</a
      ><a name="24265"
      > </a
      ><a name="24266" class="Symbol"
      >(</a
      ><a name="24267" href="2016-10-30-one-lambda-calculus-many-times-2.html#24149" class="Bound"
      >&#915;</a
      ><a name="24268"
      > </a
      ><a name="24269" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="24271"
      > </a
      ><a name="24272" href="2016-10-30-one-lambda-calculus-many-times-2.html#24151" class="Bound"
      >&#931;</a
      ><a name="24273" class="Symbol"
      >)</a
      ><a name="24274"
      > </a
      ><a name="24275" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="24277"
      > </a
      ><a name="24278" href="2016-10-30-one-lambda-calculus-many-times-2.html#24259" class="Bound"
      >&#928;</a
      ><a name="24279"
      > </a
      ><a name="24280" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="24281"
      > </a
      ><a name="24282" href="2016-10-30-one-lambda-calculus-many-times-2.html#24146" class="Bound"
      >A</a
      ><a name="24283" class="Symbol"
      >)</a
      ><a name="24284"
      > </a
      ><a name="24285" class="Symbol"
      >(</a
      ><a name="24286" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#565" class="Function"
      >sym</a
      ><a name="24289"
      > </a
      ><a name="24290" class="Symbol"
      >(</a
      ><a name="24291" href="2016-10-30-one-lambda-calculus-many-times-2.html#2084" class="Function"
      >++-identity&#691;</a
      ><a name="24303"
      > </a
      ><a name="24304" href="2016-10-30-one-lambda-calculus-many-times-2.html#24154" class="Bound"
      >&#928;</a
      ><a name="24305" class="Symbol"
      >))</a
      ><a name="24307"
      >
      </a
      ><a name="24314" href="https://agda.github.io/agda-stdlib/Function.html#1835" class="Function Operator"
      >$</a
      ><a name="24315"
      > </a
      ><a name="24316" href="2016-10-30-one-lambda-calculus-many-times-2.html#24157" class="Bound"
      >f</a
      >
</pre>
<!--{% endraw %}-->
</div>

<!--{% raw %}-->
<pre class="Agda">
    <a name="24354" href="2016-10-30-one-lambda-calculus-many-times-2.html#24354" class="Function"
      >ax&#8242;</a
      ><a name="24357"
      > </a
      ><a name="24358" class="Symbol"
      >:</a
      ><a name="24359"
      > </a
      ><a name="24370" href="2016-10-30-one-lambda-calculus-many-times-2.html#24363" class="Bound"
      >A</a
      ><a name="24371"
      > </a
      ><a name="24372" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#2920" class="Function Operator"
      >&#8712;</a
      ><a name="24373"
      > </a
      ><a name="24374" href="2016-10-30-one-lambda-calculus-many-times-2.html#24365" class="Bound"
      >&#915;</a
      ><a name="24375"
      > </a
      ><a name="24376" class="Symbol"
      >&#8594;</a
      ><a name="24377"
      > </a
      ><a name="24378" href="2016-10-30-one-lambda-calculus-many-times-2.html#7056" class="Datatype Operator"
      >NJ</a
      ><a name="24380"
      > </a
      ><a name="24381" href="2016-10-30-one-lambda-calculus-many-times-2.html#24365" class="Bound"
      >&#915;</a
      ><a name="24382"
      > </a
      ><a name="24383" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="24384"
      > </a
      ><a name="24385" href="2016-10-30-one-lambda-calculus-many-times-2.html#24363" class="Bound"
      >A</a
      ><a name="24386"
      >
    </a
      ><a name="24391" href="2016-10-30-one-lambda-calculus-many-times-2.html#24354" class="Function"
      >ax&#8242;</a
      ><a name="24394"
      > </a
      ><a name="24407" class="Symbol"
      >(</a
      ><a name="24408" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1174" class="InductiveConstructor"
      >here</a
      ><a name="24412"
      > </a
      ><a name="24413" href="2016-10-30-one-lambda-calculus-many-times-2.html#24413" class="Bound"
      >px</a
      ><a name="24415" class="Symbol"
      >)</a
      ><a name="24416"
      > </a
      ><a name="24417" class="Keyword"
      >rewrite</a
      ><a name="24424"
      > </a
      ><a name="24425" href="2016-10-30-one-lambda-calculus-many-times-2.html#24413" class="Bound"
      >px</a
      ><a name="24427"
      > </a
      ><a name="24428" class="Symbol"
      >=</a
      ><a name="24429"
      > </a
      ><a name="24430" href="2016-10-30-one-lambda-calculus-many-times-2.html#24047" class="Function"
      >s&#8314;&#8242;</a
      ><a name="24433"
      > </a
      ><a name="24434" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="24436"
      > </a
      ><a name="24437" href="2016-10-30-one-lambda-calculus-many-times-2.html#24404" class="Bound"
      >&#915;</a
      ><a name="24438"
      > </a
      ><a name="24439" class="Symbol"
      >(</a
      ><a name="24440" href="2016-10-30-one-lambda-calculus-many-times-2.html#21515" class="Function"
      >w&#8314;&#8242;</a
      ><a name="24443"
      > </a
      ><a name="24444" href="2016-10-30-one-lambda-calculus-many-times-2.html#24404" class="Bound"
      >&#915;</a
      ><a name="24445"
      > </a
      ><a name="24446" href="2016-10-30-one-lambda-calculus-many-times-2.html#7086" class="InductiveConstructor"
      >ax</a
      ><a name="24448" class="Symbol"
      >)</a
      ><a name="24449"
      >
    </a
      ><a name="24454" href="2016-10-30-one-lambda-calculus-many-times-2.html#24354" class="Function"
      >ax&#8242;</a
      ><a name="24457"
      > </a
      ><a name="24470" class="Symbol"
      >(</a
      ><a name="24471" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor"
      >there</a
      ><a name="24476"
      > </a
      ><a name="24477" href="2016-10-30-one-lambda-calculus-many-times-2.html#24477" class="Bound"
      >x</a
      ><a name="24478" class="Symbol"
      >)</a
      ><a name="24479"
      >            </a
      ><a name="24491" class="Symbol"
      >=</a
      ><a name="24492"
      > </a
      ><a name="24493" href="2016-10-30-one-lambda-calculus-many-times-2.html#7243" class="InductiveConstructor"
      >w</a
      ><a name="24494"
      > </a
      ><a name="24495" class="Symbol"
      >(</a
      ><a name="24496" href="2016-10-30-one-lambda-calculus-many-times-2.html#24354" class="Function"
      >ax&#8242;</a
      ><a name="24499"
      > </a
      ><a name="24500" href="2016-10-30-one-lambda-calculus-many-times-2.html#24477" class="Bound"
      >x</a
      ><a name="24501" class="Symbol"
      >)</a
      >
</pre>
<!--{% endraw %}-->

It turns out to be very useful to define two helper functions which introduce and eliminate the empty context to the right. This is because <span class="Agda Spec"><a class="Bound">Γ</a> <a href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator" target="_blank">++</a> <a href="https://agda.github.io/agda-stdlib/Agda.Builtin.List.html#89" class="InductiveConstructor" target="_blank">[]</a></span> doesn't automatically reduce. Therefore, any proof in which the empty context occurs to the right would involve rewriting by <a class="Agda Spec Function">++&#8209;identityʳ</a>.

<!--{% raw %}-->
<pre class="Agda">
    <a name="25147" href="2016-10-30-one-lambda-calculus-many-times-2.html#25147" class="Function"
      >&#8709;i</a
      ><a name="25149"
      > </a
      ><a name="25150" class="Symbol"
      >:</a
      ><a name="25151"
      > </a
      ><a name="25162" href="2016-10-30-one-lambda-calculus-many-times-2.html#7056" class="Datatype Operator"
      >NJ</a
      ><a name="25164"
      > </a
      ><a name="25165" href="2016-10-30-one-lambda-calculus-many-times-2.html#25157" class="Bound"
      >&#915;</a
      ><a name="25166"
      > </a
      ><a name="25167" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="25168"
      > </a
      ><a name="25169" href="2016-10-30-one-lambda-calculus-many-times-2.html#25155" class="Bound"
      >A</a
      ><a name="25170"
      > </a
      ><a name="25171" class="Symbol"
      >&#8594;</a
      ><a name="25172"
      > </a
      ><a name="25173" href="2016-10-30-one-lambda-calculus-many-times-2.html#7056" class="Datatype Operator"
      >NJ</a
      ><a name="25175"
      > </a
      ><a name="25176" href="2016-10-30-one-lambda-calculus-many-times-2.html#25157" class="Bound"
      >&#915;</a
      ><a name="25177"
      > </a
      ><a name="25178" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="25180"
      > </a
      ><a name="25181" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="25183"
      > </a
      ><a name="25184" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="25185"
      > </a
      ><a name="25186" href="2016-10-30-one-lambda-calculus-many-times-2.html#25155" class="Bound"
      >A</a
      ><a name="25187"
      >
    </a
      ><a name="25192" href="2016-10-30-one-lambda-calculus-many-times-2.html#25147" class="Function"
      >&#8709;i</a
      ><a name="25194"
      > </a
      ><a name="25203" href="2016-10-30-one-lambda-calculus-many-times-2.html#25203" class="Bound"
      >f</a
      ><a name="25204"
      > </a
      ><a name="25205" class="Keyword"
      >rewrite</a
      ><a name="25212"
      > </a
      ><a name="25213" href="2016-10-30-one-lambda-calculus-many-times-2.html#2084" class="Function"
      >++-identity&#691;</a
      ><a name="25225"
      > </a
      ><a name="25226" href="2016-10-30-one-lambda-calculus-many-times-2.html#25200" class="Bound"
      >&#915;</a
      ><a name="25227"
      > </a
      ><a name="25228" class="Symbol"
      >=</a
      ><a name="25229"
      > </a
      ><a name="25230" href="2016-10-30-one-lambda-calculus-many-times-2.html#25203" class="Bound"
      >f</a
      ><a name="25231"
      >
    </a
      ><a name="25236" href="2016-10-30-one-lambda-calculus-many-times-2.html#25236" class="Function"
      >&#8709;e</a
      ><a name="25238"
      > </a
      ><a name="25239" class="Symbol"
      >:</a
      ><a name="25240"
      > </a
      ><a name="25251" href="2016-10-30-one-lambda-calculus-many-times-2.html#7056" class="Datatype Operator"
      >NJ</a
      ><a name="25253"
      > </a
      ><a name="25254" href="2016-10-30-one-lambda-calculus-many-times-2.html#25246" class="Bound"
      >&#915;</a
      ><a name="25255"
      > </a
      ><a name="25256" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="25258"
      > </a
      ><a name="25259" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="25261"
      > </a
      ><a name="25262" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="25263"
      > </a
      ><a name="25264" href="2016-10-30-one-lambda-calculus-many-times-2.html#25244" class="Bound"
      >A</a
      ><a name="25265"
      > </a
      ><a name="25266" class="Symbol"
      >&#8594;</a
      ><a name="25267"
      > </a
      ><a name="25268" href="2016-10-30-one-lambda-calculus-many-times-2.html#7056" class="Datatype Operator"
      >NJ</a
      ><a name="25270"
      > </a
      ><a name="25271" href="2016-10-30-one-lambda-calculus-many-times-2.html#25246" class="Bound"
      >&#915;</a
      ><a name="25272"
      > </a
      ><a name="25273" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="25274"
      > </a
      ><a name="25275" href="2016-10-30-one-lambda-calculus-many-times-2.html#25244" class="Bound"
      >A</a
      ><a name="25276"
      >
    </a
      ><a name="25281" href="2016-10-30-one-lambda-calculus-many-times-2.html#25236" class="Function"
      >&#8709;e</a
      ><a name="25283"
      > </a
      ><a name="25292" href="2016-10-30-one-lambda-calculus-many-times-2.html#25292" class="Bound"
      >f</a
      ><a name="25293"
      > </a
      ><a name="25294" class="Keyword"
      >rewrite</a
      ><a name="25301"
      > </a
      ><a name="25302" href="2016-10-30-one-lambda-calculus-many-times-2.html#2084" class="Function"
      >++-identity&#691;</a
      ><a name="25314"
      > </a
      ><a name="25315" href="2016-10-30-one-lambda-calculus-many-times-2.html#25289" class="Bound"
      >&#915;</a
      ><a name="25316"
      > </a
      ><a name="25317" class="Symbol"
      >=</a
      ><a name="25318"
      > </a
      ><a name="25319" href="2016-10-30-one-lambda-calculus-many-times-2.html#25292" class="Bound"
      >f</a
      >
</pre>
<!--{% endraw %}-->



### Implicit and Explicit Structural Rules

<!--{% raw %}-->
<pre class="Agda">
  <a name="25394" class="Keyword"
      >module</a
      ><a name="25400"
      > </a
      ><a name="25401" href="2016-10-30-one-lambda-calculus-many-times-2.html#25401" class="Module"
      >NJ&#8660;ND</a
      ><a name="25406"
      > </a
      ><a name="25407" class="Keyword"
      >where</a
      ><a name="25412"
      >

    </a
      ><a name="25418" href="2016-10-30-one-lambda-calculus-many-times-2.html#25418" class="Function"
      >&#10233;</a
      ><a name="25419"
      > </a
      ><a name="25420" class="Symbol"
      >:</a
      ><a name="25421"
      > </a
      ><a name="25430" href="2016-10-30-one-lambda-calculus-many-times-2.html#7056" class="Datatype Operator"
      >NJ</a
      ><a name="25432"
      > </a
      ><a name="25433" href="2016-10-30-one-lambda-calculus-many-times-2.html#25425" class="Bound"
      >S</a
      ><a name="25434"
      > </a
      ><a name="25435" class="Symbol"
      >&#8594;</a
      ><a name="25436"
      > </a
      ><a name="25437" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="25439"
      > </a
      ><a name="25440" href="2016-10-30-one-lambda-calculus-many-times-2.html#25425" class="Bound"
      >S</a
      ><a name="25441"
      >
    </a
      ><a name="25446" href="2016-10-30-one-lambda-calculus-many-times-2.html#25418" class="Function"
      >&#10233;</a
      ><a name="25447"
      >  </a
      ><a name="25449" href="2016-10-30-one-lambda-calculus-many-times-2.html#7086" class="InductiveConstructor"
      >ax</a
      ><a name="25451"
      >         </a
      ><a name="25460" class="Symbol"
      >=</a
      ><a name="25461"
      > </a
      ><a name="25462" href="2016-03-20-one-lambda-calculus-many-times.html#10228" class="InductiveConstructor"
      >ax&#8320;</a
      ><a name="25465"
      >
    </a
      ><a name="25470" href="2016-10-30-one-lambda-calculus-many-times-2.html#25418" class="Function"
      >&#10233;</a
      ><a name="25471"
      > </a
      ><a name="25472" class="Symbol"
      >(</a
      ><a name="25473" href="2016-10-30-one-lambda-calculus-many-times-2.html#7125" class="InductiveConstructor"
      >&#8658;i</a
      ><a name="25475"
      > </a
      ><a name="25476" href="2016-10-30-one-lambda-calculus-many-times-2.html#25476" class="Bound"
      >f</a
      ><a name="25477"
      >  </a
      ><a name="25479" class="Symbol"
      >)</a
      ><a name="25480"
      >    </a
      ><a name="25484" class="Symbol"
      >=</a
      ><a name="25485"
      > </a
      ><a name="25486" href="2016-03-20-one-lambda-calculus-many-times.html#5441" class="InductiveConstructor"
      >&#8658;i</a
      ><a name="25488"
      > </a
      ><a name="25489" class="Symbol"
      >(</a
      ><a name="25490" href="2016-10-30-one-lambda-calculus-many-times-2.html#25418" class="Function"
      >&#10233;</a
      ><a name="25491"
      > </a
      ><a name="25492" href="2016-10-30-one-lambda-calculus-many-times-2.html#25476" class="Bound"
      >f</a
      ><a name="25493" class="Symbol"
      >)</a
      ><a name="25494"
      >
    </a
      ><a name="25499" href="2016-10-30-one-lambda-calculus-many-times-2.html#25418" class="Function"
      >&#10233;</a
      ><a name="25500"
      > </a
      ><a name="25501" class="Symbol"
      >(</a
      ><a name="25502" href="2016-10-30-one-lambda-calculus-many-times-2.html#7178" class="InductiveConstructor"
      >&#8658;e</a
      ><a name="25504"
      > </a
      ><a name="25505" class="Symbol"
      >{</a
      ><a name="25506" class="Argument"
      >&#915;</a
      ><a name="25507"
      > </a
      ><a name="25508" class="Symbol"
      >=</a
      ><a name="25509"
      > </a
      ><a name="25510" href="2016-10-30-one-lambda-calculus-many-times-2.html#25510" class="Bound"
      >&#915;</a
      ><a name="25511" class="Symbol"
      >}</a
      ><a name="25512"
      > </a
      ><a name="25513" href="2016-10-30-one-lambda-calculus-many-times-2.html#25513" class="Bound"
      >f</a
      ><a name="25514"
      > </a
      ><a name="25515" href="2016-10-30-one-lambda-calculus-many-times-2.html#25515" class="Bound"
      >g</a
      ><a name="25516" class="Symbol"
      >)</a
      ><a name="25517"
      >    </a
      ><a name="25521" class="Symbol"
      >=</a
      ><a name="25522"
      > </a
      ><a name="25523" href="2016-03-20-one-lambda-calculus-many-times.html#5490" class="InductiveConstructor"
      >&#8658;e</a
      ><a name="25525"
      > </a
      ><a name="25526" class="Symbol"
      >(</a
      ><a name="25527" href="2016-10-30-one-lambda-calculus-many-times-2.html#25570" class="Function"
      >inl</a
      ><a name="25530"
      > </a
      ><a name="25531" class="Symbol"
      >(</a
      ><a name="25532" href="2016-10-30-one-lambda-calculus-many-times-2.html#25418" class="Function"
      >&#10233;</a
      ><a name="25533"
      > </a
      ><a name="25534" href="2016-10-30-one-lambda-calculus-many-times-2.html#25513" class="Bound"
      >f</a
      ><a name="25535" class="Symbol"
      >))</a
      ><a name="25537"
      > </a
      ><a name="25538" class="Symbol"
      >(</a
      ><a name="25539" href="2016-10-30-one-lambda-calculus-many-times-2.html#25668" class="Function"
      >inr</a
      ><a name="25542"
      > </a
      ><a name="25543" class="Symbol"
      >(</a
      ><a name="25544" href="2016-10-30-one-lambda-calculus-many-times-2.html#25418" class="Function"
      >&#10233;</a
      ><a name="25545"
      > </a
      ><a name="25546" href="2016-10-30-one-lambda-calculus-many-times-2.html#25515" class="Bound"
      >g</a
      ><a name="25547" class="Symbol"
      >))</a
      ><a name="25549"
      >
      </a
      ><a name="25556" class="Keyword"
      >where</a
      ><a name="25561"
      >
        </a
      ><a name="25570" href="2016-10-30-one-lambda-calculus-many-times-2.html#25570" class="Function"
      >inl</a
      ><a name="25573"
      > </a
      ><a name="25574" class="Symbol"
      >:</a
      ><a name="25575"
      > </a
      ><a name="25586" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="25588"
      > </a
      ><a name="25589" href="2016-10-30-one-lambda-calculus-many-times-2.html#25510" class="Bound"
      >&#915;</a
      ><a name="25590"
      > </a
      ><a name="25591" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="25592"
      > </a
      ><a name="25593" href="2016-10-30-one-lambda-calculus-many-times-2.html#25579" class="Bound"
      >A</a
      ><a name="25594"
      > </a
      ><a name="25595" class="Symbol"
      >&#8594;</a
      ><a name="25596"
      > </a
      ><a name="25597" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="25599"
      > </a
      ><a name="25600" href="2016-10-30-one-lambda-calculus-many-times-2.html#25510" class="Bound"
      >&#915;</a
      ><a name="25601"
      > </a
      ><a name="25602" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="25604"
      > </a
      ><a name="25605" href="2016-10-30-one-lambda-calculus-many-times-2.html#25581" class="Bound"
      >&#916;</a
      ><a name="25606"
      > </a
      ><a name="25607" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="25608"
      > </a
      ><a name="25609" href="2016-10-30-one-lambda-calculus-many-times-2.html#25579" class="Bound"
      >A</a
      ><a name="25610"
      >
        </a
      ><a name="25619" href="2016-10-30-one-lambda-calculus-many-times-2.html#25570" class="Function"
      >inl</a
      ><a name="25622"
      > </a
      ><a name="25623" class="Symbol"
      >{</a
      ><a name="25624" class="Argument"
      >&#916;</a
      ><a name="25625"
      > </a
      ><a name="25626" class="Symbol"
      >=</a
      ><a name="25627"
      > </a
      ><a name="25628" href="2016-10-30-one-lambda-calculus-many-times-2.html#25628" class="Bound"
      >&#916;</a
      ><a name="25629" class="Symbol"
      >}</a
      ><a name="25630"
      > </a
      ><a name="25631" href="2016-10-30-one-lambda-calculus-many-times-2.html#25631" class="Bound"
      >f</a
      ><a name="25632"
      > </a
      ><a name="25633" class="Symbol"
      >=</a
      ><a name="25634"
      > </a
      ><a name="25635" href="2016-10-30-one-lambda-calculus-many-times-2.html#20978" class="Function"
      >ND.s&#8314;&#8242;</a
      ><a name="25641"
      > </a
      ><a name="25642" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="25644"
      > </a
      ><a name="25645" href="2016-10-30-one-lambda-calculus-many-times-2.html#25628" class="Bound"
      >&#916;</a
      ><a name="25646"
      > </a
      ><a name="25647" class="Symbol"
      >(</a
      ><a name="25648" href="2016-10-30-one-lambda-calculus-many-times-2.html#20583" class="Function"
      >ND.w&#8314;&#8242;</a
      ><a name="25654"
      > </a
      ><a name="25655" href="2016-10-30-one-lambda-calculus-many-times-2.html#25628" class="Bound"
      >&#916;</a
      ><a name="25656"
      > </a
      ><a name="25657" href="2016-10-30-one-lambda-calculus-many-times-2.html#25631" class="Bound"
      >f</a
      ><a name="25658" class="Symbol"
      >)</a
      ><a name="25659"
      >
        </a
      ><a name="25668" href="2016-10-30-one-lambda-calculus-many-times-2.html#25668" class="Function"
      >inr</a
      ><a name="25671"
      > </a
      ><a name="25672" class="Symbol"
      >:</a
      ><a name="25673"
      > </a
      ><a name="25684" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="25686"
      > </a
      ><a name="25687" href="2016-10-30-one-lambda-calculus-many-times-2.html#25679" class="Bound"
      >&#916;</a
      ><a name="25688"
      > </a
      ><a name="25689" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="25690"
      > </a
      ><a name="25691" href="2016-10-30-one-lambda-calculus-many-times-2.html#25677" class="Bound"
      >A</a
      ><a name="25692"
      > </a
      ><a name="25693" class="Symbol"
      >&#8594;</a
      ><a name="25694"
      > </a
      ><a name="25695" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="25697"
      > </a
      ><a name="25698" href="2016-10-30-one-lambda-calculus-many-times-2.html#25510" class="Bound"
      >&#915;</a
      ><a name="25699"
      > </a
      ><a name="25700" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="25702"
      > </a
      ><a name="25703" href="2016-10-30-one-lambda-calculus-many-times-2.html#25679" class="Bound"
      >&#916;</a
      ><a name="25704"
      > </a
      ><a name="25705" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="25706"
      > </a
      ><a name="25707" href="2016-10-30-one-lambda-calculus-many-times-2.html#25677" class="Bound"
      >A</a
      ><a name="25708"
      >
        </a
      ><a name="25717" href="2016-10-30-one-lambda-calculus-many-times-2.html#25668" class="Function"
      >inr</a
      ><a name="25720"
      > </a
      ><a name="25721" href="2016-10-30-one-lambda-calculus-many-times-2.html#25721" class="Bound"
      >f</a
      ><a name="25722"
      > </a
      ><a name="25723" class="Symbol"
      >=</a
      ><a name="25724"
      > </a
      ><a name="25725" href="2016-10-30-one-lambda-calculus-many-times-2.html#20583" class="Function"
      >ND.w&#8314;&#8242;</a
      ><a name="25731"
      > </a
      ><a name="25732" href="2016-10-30-one-lambda-calculus-many-times-2.html#25510" class="Bound"
      >&#915;</a
      ><a name="25733"
      > </a
      ><a name="25734" href="2016-10-30-one-lambda-calculus-many-times-2.html#25721" class="Bound"
      >f</a
      ><a name="25735"
      >

    </a
      ><a name="25741" href="2016-10-30-one-lambda-calculus-many-times-2.html#25418" class="Function"
      >&#10233;</a
      ><a name="25742"
      > </a
      ><a name="25743" class="Symbol"
      >(</a
      ><a name="25744" href="2016-10-30-one-lambda-calculus-many-times-2.html#7243" class="InductiveConstructor"
      >w</a
      ><a name="25745"
      >    </a
      ><a name="25749" href="2016-10-30-one-lambda-calculus-many-times-2.html#25749" class="Bound"
      >f</a
      ><a name="25750" class="Symbol"
      >)</a
      ><a name="25751"
      >    </a
      ><a name="25755" class="Symbol"
      >=</a
      ><a name="25756"
      > </a
      ><a name="25757" href="2016-03-20-one-lambda-calculus-many-times.html#8605" class="Function"
      >ND.w&#8242;</a
      ><a name="25762"
      >   </a
      ><a name="25765" class="Symbol"
      >(</a
      ><a name="25766" href="2016-10-30-one-lambda-calculus-many-times-2.html#25418" class="Function"
      >&#10233;</a
      ><a name="25767"
      > </a
      ><a name="25768" href="2016-10-30-one-lambda-calculus-many-times-2.html#25749" class="Bound"
      >f</a
      ><a name="25769" class="Symbol"
      >)</a
      ><a name="25770"
      >
    </a
      ><a name="25775" href="2016-10-30-one-lambda-calculus-many-times-2.html#25418" class="Function"
      >&#10233;</a
      ><a name="25776"
      > </a
      ><a name="25777" class="Symbol"
      >(</a
      ><a name="25778" href="2016-10-30-one-lambda-calculus-many-times-2.html#7292" class="InductiveConstructor"
      >c</a
      ><a name="25779"
      >    </a
      ><a name="25783" href="2016-10-30-one-lambda-calculus-many-times-2.html#25783" class="Bound"
      >f</a
      ><a name="25784" class="Symbol"
      >)</a
      ><a name="25785"
      >    </a
      ><a name="25789" class="Symbol"
      >=</a
      ><a name="25790"
      > </a
      ><a name="25791" href="2016-10-30-one-lambda-calculus-many-times-2.html#12351" class="Function"
      >ND.c&#8242;</a
      ><a name="25796"
      >   </a
      ><a name="25799" class="Symbol"
      >(</a
      ><a name="25800" href="2016-10-30-one-lambda-calculus-many-times-2.html#25418" class="Function"
      >&#10233;</a
      ><a name="25801"
      > </a
      ><a name="25802" href="2016-10-30-one-lambda-calculus-many-times-2.html#25783" class="Bound"
      >f</a
      ><a name="25803" class="Symbol"
      >)</a
      ><a name="25804"
      >
    </a
      ><a name="25809" href="2016-10-30-one-lambda-calculus-many-times-2.html#25418" class="Function"
      >&#10233;</a
      ><a name="25810"
      > </a
      ><a name="25811" class="Symbol"
      >(</a
      ><a name="25812" href="2016-10-30-one-lambda-calculus-many-times-2.html#7349" class="InductiveConstructor"
      >p</a
      ><a name="25813"
      >  </a
      ><a name="25815" href="2016-10-30-one-lambda-calculus-many-times-2.html#25815" class="Bound"
      >&#915;</a
      ><a name="25816"
      > </a
      ><a name="25817" href="2016-10-30-one-lambda-calculus-many-times-2.html#25817" class="Bound"
      >f</a
      ><a name="25818" class="Symbol"
      >)</a
      ><a name="25819"
      >    </a
      ><a name="25823" class="Symbol"
      >=</a
      ><a name="25824"
      > </a
      ><a name="25825" href="2016-10-30-one-lambda-calculus-many-times-2.html#12736" class="Function"
      >ND.p&#8242;</a
      ><a name="25830"
      > </a
      ><a name="25831" href="2016-10-30-one-lambda-calculus-many-times-2.html#25815" class="Bound"
      >&#915;</a
      ><a name="25832"
      > </a
      ><a name="25833" class="Symbol"
      >(</a
      ><a name="25834" href="2016-10-30-one-lambda-calculus-many-times-2.html#25418" class="Function"
      >&#10233;</a
      ><a name="25835"
      > </a
      ><a name="25836" href="2016-10-30-one-lambda-calculus-many-times-2.html#25817" class="Bound"
      >f</a
      ><a name="25837" class="Symbol"
      >)</a
      ><a name="25838"
      >

    </a
      ><a name="25844" href="2016-10-30-one-lambda-calculus-many-times-2.html#25844" class="Function"
      >&#10232;</a
      ><a name="25845"
      > </a
      ><a name="25846" class="Symbol"
      >:</a
      ><a name="25847"
      > </a
      ><a name="25856" href="2016-03-20-one-lambda-calculus-many-times.html#5373" class="Datatype Operator"
      >ND</a
      ><a name="25858"
      > </a
      ><a name="25859" href="2016-10-30-one-lambda-calculus-many-times-2.html#25851" class="Bound"
      >S</a
      ><a name="25860"
      > </a
      ><a name="25861" class="Symbol"
      >&#8594;</a
      ><a name="25862"
      > </a
      ><a name="25863" href="2016-10-30-one-lambda-calculus-many-times-2.html#7056" class="Datatype Operator"
      >NJ</a
      ><a name="25865"
      > </a
      ><a name="25866" href="2016-10-30-one-lambda-calculus-many-times-2.html#25851" class="Bound"
      >S</a
      ><a name="25867"
      >
    </a
      ><a name="25872" href="2016-10-30-one-lambda-calculus-many-times-2.html#25844" class="Function"
      >&#10232;</a
      ><a name="25873"
      > </a
      ><a name="25874" class="Symbol"
      >(</a
      ><a name="25875" href="2016-03-20-one-lambda-calculus-many-times.html#5403" class="InductiveConstructor"
      >ax</a
      ><a name="25877"
      >  </a
      ><a name="25879" href="2016-10-30-one-lambda-calculus-many-times-2.html#25879" class="Bound"
      >x</a
      ><a name="25880" class="Symbol"
      >)</a
      ><a name="25881"
      >     </a
      ><a name="25886" class="Symbol"
      >=</a
      ><a name="25887"
      > </a
      ><a name="25888" href="2016-10-30-one-lambda-calculus-many-times-2.html#24354" class="Function"
      >NJ.ax&#8242;</a
      ><a name="25894"
      > </a
      ><a name="25895" href="2016-10-30-one-lambda-calculus-many-times-2.html#25879" class="Bound"
      >x</a
      ><a name="25896"
      >
    </a
      ><a name="25901" href="2016-10-30-one-lambda-calculus-many-times-2.html#25844" class="Function"
      >&#10232;</a
      ><a name="25902"
      > </a
      ><a name="25903" class="Symbol"
      >(</a
      ><a name="25904" href="2016-03-20-one-lambda-calculus-many-times.html#5441" class="InductiveConstructor"
      >&#8658;i</a
      ><a name="25906"
      >  </a
      ><a name="25908" href="2016-10-30-one-lambda-calculus-many-times-2.html#25908" class="Bound"
      >f</a
      ><a name="25909" class="Symbol"
      >)</a
      ><a name="25910"
      >     </a
      ><a name="25915" class="Symbol"
      >=</a
      ><a name="25916"
      > </a
      ><a name="25917" href="2016-10-30-one-lambda-calculus-many-times-2.html#7125" class="InductiveConstructor"
      >&#8658;i</a
      ><a name="25919"
      >  </a
      ><a name="25921" class="Symbol"
      >(</a
      ><a name="25922" href="2016-10-30-one-lambda-calculus-many-times-2.html#25844" class="Function"
      >&#10232;</a
      ><a name="25923"
      > </a
      ><a name="25924" href="2016-10-30-one-lambda-calculus-many-times-2.html#25908" class="Bound"
      >f</a
      ><a name="25925" class="Symbol"
      >)</a
      ><a name="25926"
      >
    </a
      ><a name="25931" href="2016-10-30-one-lambda-calculus-many-times-2.html#25844" class="Function"
      >&#10232;</a
      ><a name="25932"
      > </a
      ><a name="25933" class="Symbol"
      >(</a
      ><a name="25934" href="2016-03-20-one-lambda-calculus-many-times.html#5490" class="InductiveConstructor"
      >&#8658;e</a
      ><a name="25936"
      >  </a
      ><a name="25938" class="Symbol"
      >{</a
      ><a name="25939" class="Argument"
      >&#915;</a
      ><a name="25940"
      > </a
      ><a name="25941" class="Symbol"
      >=</a
      ><a name="25942"
      > </a
      ><a name="25943" href="2016-10-30-one-lambda-calculus-many-times-2.html#25943" class="Bound"
      >&#915;</a
      ><a name="25944" class="Symbol"
      >}</a
      ><a name="25945"
      > </a
      ><a name="25946" href="2016-10-30-one-lambda-calculus-many-times-2.html#25946" class="Bound"
      >f</a
      ><a name="25947"
      > </a
      ><a name="25948" href="2016-10-30-one-lambda-calculus-many-times-2.html#25948" class="Bound"
      >g</a
      ><a name="25949" class="Symbol"
      >)</a
      ><a name="25950"
      >   </a
      ><a name="25953" class="Symbol"
      >=</a
      ><a name="25954"
      > </a
      ><a name="25955" href="2016-10-30-one-lambda-calculus-many-times-2.html#25236" class="Function"
      >NJ.&#8709;e</a
      ><a name="25960"
      > </a
      ><a name="25961" class="Symbol"
      >(</a
      ><a name="25962" href="2016-10-30-one-lambda-calculus-many-times-2.html#23491" class="Function"
      >NJ.c&#8314;&#8242;</a
      ><a name="25968"
      > </a
      ><a name="25969" href="2016-10-30-one-lambda-calculus-many-times-2.html#25943" class="Bound"
      >&#915;</a
      ><a name="25970"
      > </a
      ><a name="25971" class="Symbol"
      >(</a
      ><a name="25972" href="2016-10-30-one-lambda-calculus-many-times-2.html#25147" class="Function"
      >NJ.&#8709;i</a
      ><a name="25977"
      > </a
      ><a name="25978" class="Symbol"
      >(</a
      ><a name="25979" href="2016-10-30-one-lambda-calculus-many-times-2.html#7178" class="InductiveConstructor"
      >&#8658;e</a
      ><a name="25981"
      > </a
      ><a name="25982" class="Symbol"
      >(</a
      ><a name="25983" href="2016-10-30-one-lambda-calculus-many-times-2.html#25844" class="Function"
      >&#10232;</a
      ><a name="25984"
      > </a
      ><a name="25985" href="2016-10-30-one-lambda-calculus-many-times-2.html#25946" class="Bound"
      >f</a
      ><a name="25986" class="Symbol"
      >)</a
      ><a name="25987"
      > </a
      ><a name="25988" class="Symbol"
      >(</a
      ><a name="25989" href="2016-10-30-one-lambda-calculus-many-times-2.html#25844" class="Function"
      >&#10232;</a
      ><a name="25990"
      > </a
      ><a name="25991" href="2016-10-30-one-lambda-calculus-many-times-2.html#25948" class="Bound"
      >g</a
      ><a name="25992" class="Symbol"
      >))))</a
      >
</pre>
<!--{% endraw %}-->


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

<!--{% raw %}-->
<pre class="Agda">
  <a name="26700" class="Keyword"
      >infix</a
      ><a name="26705"
      > </a
      ><a name="26706" class="Number"
      >3</a
      ><a name="26707"
      > LJ_

  </a
      ><a name="26715" class="Keyword"
      >data</a
      ><a name="26719"
      > </a
      ><a name="26720" href="2016-10-30-one-lambda-calculus-many-times-2.html#26720" class="Datatype Operator"
      >LJ_</a
      ><a name="26723"
      > </a
      ><a name="26724" class="Symbol"
      >:</a
      ><a name="26725"
      > </a
      ><a name="26726" href="2016-03-20-one-lambda-calculus-many-times.html#3957" class="Datatype"
      >Sequent</a
      ><a name="26733"
      > </a
      ><a name="26734" class="Symbol"
      >&#8594;</a
      ><a name="26735"
      > </a
      ><a name="26736" class="PrimitiveType"
      >Set</a
      ><a name="26739"
      > </a
      ><a name="26740" class="Keyword"
      >where</a
      ><a name="26745"
      >
    </a
      ><a name="26750" href="2016-10-30-one-lambda-calculus-many-times-2.html#26750" class="InductiveConstructor"
      >ax</a
      ><a name="26752"
      >  </a
      ><a name="26754" class="Symbol"
      >:</a
      ><a name="26755"
      > </a
      ><a name="26772" href="2016-10-30-one-lambda-calculus-many-times-2.html#26720" class="Datatype Operator"
      >LJ</a
      ><a name="26774"
      > </a
      ><a name="26775" href="2016-10-30-one-lambda-calculus-many-times-2.html#26759" class="Bound"
      >A</a
      ><a name="26776"
      > </a
      ><a name="26777" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="26778"
      > </a
      ><a name="26779" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="26781"
      > </a
      ><a name="26782" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26783"
      > </a
      ><a name="26784" href="2016-10-30-one-lambda-calculus-many-times-2.html#26759" class="Bound"
      >A</a
      ><a name="26785"
      >
    </a
      ><a name="26790" href="2016-10-30-one-lambda-calculus-many-times-2.html#26790" class="InductiveConstructor"
      >cut</a
      ><a name="26793"
      > </a
      ><a name="26794" class="Symbol"
      >:</a
      ><a name="26795"
      > </a
      ><a name="26812" href="2016-10-30-one-lambda-calculus-many-times-2.html#26720" class="Datatype Operator"
      >LJ</a
      ><a name="26814"
      > </a
      ><a name="26815" href="2016-10-30-one-lambda-calculus-many-times-2.html#26805" class="Bound"
      >&#915;</a
      ><a name="26816"
      > </a
      ><a name="26817" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26818"
      > </a
      ><a name="26819" href="2016-10-30-one-lambda-calculus-many-times-2.html#26799" class="Bound"
      >A</a
      ><a name="26820"
      > </a
      ><a name="26821" class="Symbol"
      >&#8594;</a
      ><a name="26822"
      > </a
      ><a name="26823" href="2016-10-30-one-lambda-calculus-many-times-2.html#26720" class="Datatype Operator"
      >LJ</a
      ><a name="26825"
      > </a
      ><a name="26826" href="2016-10-30-one-lambda-calculus-many-times-2.html#26799" class="Bound"
      >A</a
      ><a name="26827"
      > </a
      ><a name="26828" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="26829"
      > </a
      ><a name="26830" href="2016-10-30-one-lambda-calculus-many-times-2.html#26807" class="Bound"
      >&#916;</a
      ><a name="26831"
      > </a
      ><a name="26832" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26833"
      > </a
      ><a name="26834" href="2016-10-30-one-lambda-calculus-many-times-2.html#26801" class="Bound"
      >B</a
      ><a name="26835"
      > </a
      ><a name="26836" class="Symbol"
      >&#8594;</a
      ><a name="26837"
      > </a
      ><a name="26838" href="2016-10-30-one-lambda-calculus-many-times-2.html#26720" class="Datatype Operator"
      >LJ</a
      ><a name="26840"
      > </a
      ><a name="26841" href="2016-10-30-one-lambda-calculus-many-times-2.html#26805" class="Bound"
      >&#915;</a
      ><a name="26842"
      > </a
      ><a name="26843" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="26845"
      > </a
      ><a name="26846" href="2016-10-30-one-lambda-calculus-many-times-2.html#26807" class="Bound"
      >&#916;</a
      ><a name="26847"
      > </a
      ><a name="26848" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26849"
      > </a
      ><a name="26850" href="2016-10-30-one-lambda-calculus-many-times-2.html#26801" class="Bound"
      >B</a
      ><a name="26851"
      >
    </a
      ><a name="26856" href="2016-10-30-one-lambda-calculus-many-times-2.html#26856" class="InductiveConstructor"
      >&#8658;l</a
      ><a name="26858"
      >  </a
      ><a name="26860" class="Symbol"
      >:</a
      ><a name="26861"
      > </a
      ><a name="26878" href="2016-10-30-one-lambda-calculus-many-times-2.html#26720" class="Datatype Operator"
      >LJ</a
      ><a name="26880"
      > </a
      ><a name="26881" href="2016-10-30-one-lambda-calculus-many-times-2.html#26871" class="Bound"
      >&#915;</a
      ><a name="26882"
      > </a
      ><a name="26883" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26884"
      > </a
      ><a name="26885" href="2016-10-30-one-lambda-calculus-many-times-2.html#26865" class="Bound"
      >A</a
      ><a name="26886"
      > </a
      ><a name="26887" class="Symbol"
      >&#8594;</a
      ><a name="26888"
      > </a
      ><a name="26889" href="2016-10-30-one-lambda-calculus-many-times-2.html#26720" class="Datatype Operator"
      >LJ</a
      ><a name="26891"
      > </a
      ><a name="26892" href="2016-10-30-one-lambda-calculus-many-times-2.html#26867" class="Bound"
      >B</a
      ><a name="26893"
      > </a
      ><a name="26894" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="26895"
      > </a
      ><a name="26896" href="2016-10-30-one-lambda-calculus-many-times-2.html#26873" class="Bound"
      >&#916;</a
      ><a name="26897"
      > </a
      ><a name="26898" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26899"
      > </a
      ><a name="26900" href="2016-10-30-one-lambda-calculus-many-times-2.html#26869" class="Bound"
      >C</a
      ><a name="26901"
      > </a
      ><a name="26902" class="Symbol"
      >&#8594;</a
      ><a name="26903"
      > </a
      ><a name="26904" href="2016-10-30-one-lambda-calculus-many-times-2.html#26720" class="Datatype Operator"
      >LJ</a
      ><a name="26906"
      > </a
      ><a name="26907" href="2016-10-30-one-lambda-calculus-many-times-2.html#26865" class="Bound"
      >A</a
      ><a name="26908"
      > </a
      ><a name="26909" href="2016-03-20-one-lambda-calculus-many-times.html#2694" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="26910"
      > </a
      ><a name="26911" href="2016-10-30-one-lambda-calculus-many-times-2.html#26867" class="Bound"
      >B</a
      ><a name="26912"
      > </a
      ><a name="26913" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="26914"
      > </a
      ><a name="26915" href="2016-10-30-one-lambda-calculus-many-times-2.html#26871" class="Bound"
      >&#915;</a
      ><a name="26916"
      > </a
      ><a name="26917" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="26919"
      > </a
      ><a name="26920" href="2016-10-30-one-lambda-calculus-many-times-2.html#26873" class="Bound"
      >&#916;</a
      ><a name="26921"
      > </a
      ><a name="26922" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26923"
      > </a
      ><a name="26924" href="2016-10-30-one-lambda-calculus-many-times-2.html#26869" class="Bound"
      >C</a
      ><a name="26925"
      >
    </a
      ><a name="26930" href="2016-10-30-one-lambda-calculus-many-times-2.html#26930" class="InductiveConstructor"
      >&#8658;r</a
      ><a name="26932"
      >  </a
      ><a name="26934" class="Symbol"
      >:</a
      ><a name="26935"
      > </a
      ><a name="26952" href="2016-10-30-one-lambda-calculus-many-times-2.html#26720" class="Datatype Operator"
      >LJ</a
      ><a name="26954"
      > </a
      ><a name="26955" href="2016-10-30-one-lambda-calculus-many-times-2.html#26939" class="Bound"
      >A</a
      ><a name="26956"
      > </a
      ><a name="26957" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="26958"
      > </a
      ><a name="26959" href="2016-10-30-one-lambda-calculus-many-times-2.html#26945" class="Bound"
      >&#915;</a
      ><a name="26960"
      > </a
      ><a name="26961" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26962"
      > </a
      ><a name="26963" href="2016-10-30-one-lambda-calculus-many-times-2.html#26941" class="Bound"
      >B</a
      ><a name="26964"
      > </a
      ><a name="26965" class="Symbol"
      >&#8594;</a
      ><a name="26966"
      > </a
      ><a name="26967" href="2016-10-30-one-lambda-calculus-many-times-2.html#26720" class="Datatype Operator"
      >LJ</a
      ><a name="26969"
      > </a
      ><a name="26970" href="2016-10-30-one-lambda-calculus-many-times-2.html#26945" class="Bound"
      >&#915;</a
      ><a name="26971"
      > </a
      ><a name="26972" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="26973"
      > </a
      ><a name="26974" href="2016-10-30-one-lambda-calculus-many-times-2.html#26939" class="Bound"
      >A</a
      ><a name="26975"
      > </a
      ><a name="26976" href="2016-03-20-one-lambda-calculus-many-times.html#2694" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="26977"
      > </a
      ><a name="26978" href="2016-10-30-one-lambda-calculus-many-times-2.html#26941" class="Bound"
      >B</a
      ><a name="26979"
      >
    </a
      ><a name="26984" href="2016-10-30-one-lambda-calculus-many-times-2.html#26984" class="InductiveConstructor"
      >w</a
      ><a name="26985"
      >   </a
      ><a name="26988" class="Symbol"
      >:</a
      ><a name="26989"
      > </a
      ><a name="27006" href="2016-10-30-one-lambda-calculus-many-times-2.html#26720" class="Datatype Operator"
      >LJ</a
      ><a name="27008"
      > </a
      ><a name="27009" href="2016-10-30-one-lambda-calculus-many-times-2.html#26999" class="Bound"
      >&#915;</a
      ><a name="27010"
      > </a
      ><a name="27011" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="27012"
      > </a
      ><a name="27013" href="2016-10-30-one-lambda-calculus-many-times-2.html#26995" class="Bound"
      >B</a
      ><a name="27014"
      > </a
      ><a name="27015" class="Symbol"
      >&#8594;</a
      ><a name="27016"
      > </a
      ><a name="27017" href="2016-10-30-one-lambda-calculus-many-times-2.html#26720" class="Datatype Operator"
      >LJ</a
      ><a name="27019"
      > </a
      ><a name="27020" href="2016-10-30-one-lambda-calculus-many-times-2.html#26993" class="Bound"
      >A</a
      ><a name="27021"
      > </a
      ><a name="27022" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="27023"
      > </a
      ><a name="27024" href="2016-10-30-one-lambda-calculus-many-times-2.html#26999" class="Bound"
      >&#915;</a
      ><a name="27025"
      > </a
      ><a name="27026" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="27027"
      > </a
      ><a name="27028" href="2016-10-30-one-lambda-calculus-many-times-2.html#26995" class="Bound"
      >B</a
      ><a name="27029"
      >
    </a
      ><a name="27034" href="2016-10-30-one-lambda-calculus-many-times-2.html#27034" class="InductiveConstructor"
      >c</a
      ><a name="27035"
      >   </a
      ><a name="27038" class="Symbol"
      >:</a
      ><a name="27039"
      > </a
      ><a name="27056" href="2016-10-30-one-lambda-calculus-many-times-2.html#26720" class="Datatype Operator"
      >LJ</a
      ><a name="27058"
      > </a
      ><a name="27059" href="2016-10-30-one-lambda-calculus-many-times-2.html#27043" class="Bound"
      >A</a
      ><a name="27060"
      > </a
      ><a name="27061" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="27062"
      > </a
      ><a name="27063" href="2016-10-30-one-lambda-calculus-many-times-2.html#27043" class="Bound"
      >A</a
      ><a name="27064"
      > </a
      ><a name="27065" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="27066"
      > </a
      ><a name="27067" href="2016-10-30-one-lambda-calculus-many-times-2.html#27049" class="Bound"
      >&#915;</a
      ><a name="27068"
      > </a
      ><a name="27069" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="27070"
      > </a
      ><a name="27071" href="2016-10-30-one-lambda-calculus-many-times-2.html#27045" class="Bound"
      >B</a
      ><a name="27072"
      > </a
      ><a name="27073" class="Symbol"
      >&#8594;</a
      ><a name="27074"
      > </a
      ><a name="27075" href="2016-10-30-one-lambda-calculus-many-times-2.html#26720" class="Datatype Operator"
      >LJ</a
      ><a name="27077"
      > </a
      ><a name="27078" href="2016-10-30-one-lambda-calculus-many-times-2.html#27043" class="Bound"
      >A</a
      ><a name="27079"
      > </a
      ><a name="27080" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="27081"
      > </a
      ><a name="27082" href="2016-10-30-one-lambda-calculus-many-times-2.html#27049" class="Bound"
      >&#915;</a
      ><a name="27083"
      > </a
      ><a name="27084" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="27085"
      > </a
      ><a name="27086" href="2016-10-30-one-lambda-calculus-many-times-2.html#27045" class="Bound"
      >B</a
      ><a name="27087"
      >
    </a
      ><a name="27092" href="2016-10-30-one-lambda-calculus-many-times-2.html#27092" class="InductiveConstructor"
      >p</a
      ><a name="27093"
      >   </a
      ><a name="27096" class="Symbol"
      >:</a
      ><a name="27097"
      > </a
      ><a name="27110" class="Symbol"
      >&#8704;</a
      ><a name="27111"
      > </a
      ><a name="27112" href="2016-10-30-one-lambda-calculus-many-times-2.html#27112" class="Bound"
      >&#915;</a
      ><a name="27113"
      > </a
      ><a name="27114" class="Symbol"
      >&#8594;</a
      ><a name="27115"
      > </a
      ><a name="27124" href="2016-10-30-one-lambda-calculus-many-times-2.html#26720" class="Datatype Operator"
      >LJ</a
      ><a name="27126"
      > </a
      ><a name="27127" href="2016-10-30-one-lambda-calculus-many-times-2.html#27112" class="Bound"
      >&#915;</a
      ><a name="27128"
      > </a
      ><a name="27129" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="27131"
      > </a
      ><a name="27132" href="2016-10-30-one-lambda-calculus-many-times-2.html#27101" class="Bound"
      >A</a
      ><a name="27133"
      > </a
      ><a name="27134" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="27135"
      > </a
      ><a name="27136" href="2016-10-30-one-lambda-calculus-many-times-2.html#27103" class="Bound"
      >B</a
      ><a name="27137"
      > </a
      ><a name="27138" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="27139"
      > </a
      ><a name="27140" href="2016-10-30-one-lambda-calculus-many-times-2.html#27119" class="Bound"
      >&#916;</a
      ><a name="27141"
      > </a
      ><a name="27142" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="27143"
      > </a
      ><a name="27144" href="2016-10-30-one-lambda-calculus-many-times-2.html#27105" class="Bound"
      >C</a
      ><a name="27145"
      > </a
      ><a name="27146" class="Symbol"
      >&#8594;</a
      ><a name="27147"
      > </a
      ><a name="27148" href="2016-10-30-one-lambda-calculus-many-times-2.html#26720" class="Datatype Operator"
      >LJ</a
      ><a name="27150"
      > </a
      ><a name="27151" href="2016-10-30-one-lambda-calculus-many-times-2.html#27112" class="Bound"
      >&#915;</a
      ><a name="27152"
      > </a
      ><a name="27153" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="27155"
      > </a
      ><a name="27156" href="2016-10-30-one-lambda-calculus-many-times-2.html#27103" class="Bound"
      >B</a
      ><a name="27157"
      > </a
      ><a name="27158" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="27159"
      > </a
      ><a name="27160" href="2016-10-30-one-lambda-calculus-many-times-2.html#27101" class="Bound"
      >A</a
      ><a name="27161"
      > </a
      ><a name="27162" href="Agda.Builtin.List.html#104" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="27163"
      > </a
      ><a name="27164" href="2016-10-30-one-lambda-calculus-many-times-2.html#27119" class="Bound"
      >&#916;</a
      ><a name="27165"
      > </a
      ><a name="27166" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="27167"
      > </a
      ><a name="27168" href="2016-10-30-one-lambda-calculus-many-times-2.html#27105" class="Bound"
      >C</a
      >
</pre>
<!--{% endraw %}-->

<div class="hidden">
<!--{% raw %}-->
<pre class="Agda">
  <a name="27218" class="Keyword"
      >module</a
      ><a name="27224"
      > </a
      ><a name="27225" href="2016-10-30-one-lambda-calculus-many-times-2.html#27225" class="Module"
      >LJ</a
      ><a name="27227"
      > </a
      ><a name="27228" class="Keyword"
      >where</a
      >
</pre>
<!--{% endraw %}-->
</div>


<!--{% raw %}-->
<pre class="Agda">
    <a name="27271" href="2016-10-30-one-lambda-calculus-many-times-2.html#27271" class="Function"
      >&#8709;i</a
      ><a name="27273"
      > </a
      ><a name="27274" class="Symbol"
      >:</a
      ><a name="27275"
      > </a
      ><a name="27286" href="2016-10-30-one-lambda-calculus-many-times-2.html#26720" class="Datatype Operator"
      >LJ</a
      ><a name="27288"
      > </a
      ><a name="27289" href="2016-10-30-one-lambda-calculus-many-times-2.html#27281" class="Bound"
      >&#915;</a
      ><a name="27290"
      > </a
      ><a name="27291" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="27292"
      > </a
      ><a name="27293" href="2016-10-30-one-lambda-calculus-many-times-2.html#27279" class="Bound"
      >A</a
      ><a name="27294"
      > </a
      ><a name="27295" class="Symbol"
      >&#8594;</a
      ><a name="27296"
      > </a
      ><a name="27297" href="2016-10-30-one-lambda-calculus-many-times-2.html#26720" class="Datatype Operator"
      >LJ</a
      ><a name="27299"
      > </a
      ><a name="27300" href="2016-10-30-one-lambda-calculus-many-times-2.html#27281" class="Bound"
      >&#915;</a
      ><a name="27301"
      > </a
      ><a name="27302" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="27304"
      > </a
      ><a name="27305" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="27307"
      > </a
      ><a name="27308" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="27309"
      > </a
      ><a name="27310" href="2016-10-30-one-lambda-calculus-many-times-2.html#27279" class="Bound"
      >A</a
      ><a name="27311"
      >
    </a
      ><a name="27316" href="2016-10-30-one-lambda-calculus-many-times-2.html#27271" class="Function"
      >&#8709;i</a
      ><a name="27318"
      > </a
      ><a name="27327" href="2016-10-30-one-lambda-calculus-many-times-2.html#27327" class="Bound"
      >f</a
      ><a name="27328"
      > </a
      ><a name="27329" class="Keyword"
      >rewrite</a
      ><a name="27336"
      > </a
      ><a name="27337" href="2016-10-30-one-lambda-calculus-many-times-2.html#2084" class="Function"
      >++-identity&#691;</a
      ><a name="27349"
      > </a
      ><a name="27350" href="2016-10-30-one-lambda-calculus-many-times-2.html#27324" class="Bound"
      >&#915;</a
      ><a name="27351"
      > </a
      ><a name="27352" class="Symbol"
      >=</a
      ><a name="27353"
      > </a
      ><a name="27354" href="2016-10-30-one-lambda-calculus-many-times-2.html#27327" class="Bound"
      >f</a
      ><a name="27355"
      >
    </a
      ><a name="27360" href="2016-10-30-one-lambda-calculus-many-times-2.html#27360" class="Function"
      >&#8709;e</a
      ><a name="27362"
      > </a
      ><a name="27363" class="Symbol"
      >:</a
      ><a name="27364"
      > </a
      ><a name="27375" href="2016-10-30-one-lambda-calculus-many-times-2.html#26720" class="Datatype Operator"
      >LJ</a
      ><a name="27377"
      > </a
      ><a name="27378" href="2016-10-30-one-lambda-calculus-many-times-2.html#27370" class="Bound"
      >&#915;</a
      ><a name="27379"
      > </a
      ><a name="27380" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#895" class="Function Operator"
      >++</a
      ><a name="27382"
      > </a
      ><a name="27383" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="27385"
      > </a
      ><a name="27386" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="27387"
      > </a
      ><a name="27388" href="2016-10-30-one-lambda-calculus-many-times-2.html#27368" class="Bound"
      >A</a
      ><a name="27389"
      > </a
      ><a name="27390" class="Symbol"
      >&#8594;</a
      ><a name="27391"
      > </a
      ><a name="27392" href="2016-10-30-one-lambda-calculus-many-times-2.html#26720" class="Datatype Operator"
      >LJ</a
      ><a name="27394"
      > </a
      ><a name="27395" href="2016-10-30-one-lambda-calculus-many-times-2.html#27370" class="Bound"
      >&#915;</a
      ><a name="27396"
      > </a
      ><a name="27397" href="2016-03-20-one-lambda-calculus-many-times.html#3981" class="InductiveConstructor Operator"
      >&#8866;</a
      ><a name="27398"
      > </a
      ><a name="27399" href="2016-10-30-one-lambda-calculus-many-times-2.html#27368" class="Bound"
      >A</a
      ><a name="27400"
      >
    </a
      ><a name="27405" href="2016-10-30-one-lambda-calculus-many-times-2.html#27360" class="Function"
      >&#8709;e</a
      ><a name="27407"
      > </a
      ><a name="27416" href="2016-10-30-one-lambda-calculus-many-times-2.html#27416" class="Bound"
      >f</a
      ><a name="27417"
      > </a
      ><a name="27418" class="Keyword"
      >rewrite</a
      ><a name="27425"
      > </a
      ><a name="27426" href="2016-10-30-one-lambda-calculus-many-times-2.html#2084" class="Function"
      >++-identity&#691;</a
      ><a name="27438"
      > </a
      ><a name="27439" href="2016-10-30-one-lambda-calculus-many-times-2.html#27413" class="Bound"
      >&#915;</a
      ><a name="27440"
      > </a
      ><a name="27441" class="Symbol"
      >=</a
      ><a name="27442"
      > </a
      ><a name="27443" href="2016-10-30-one-lambda-calculus-many-times-2.html#27416" class="Bound"
      >f</a
      >
</pre>
<!--{% endraw %}-->

<!--{% raw %}-->
<pre class="Agda">
  <a name="27472" class="Keyword"
      >module</a
      ><a name="27478"
      > </a
      ><a name="27479" href="2016-10-30-one-lambda-calculus-many-times-2.html#27479" class="Module"
      >LJ&#8660;NJ</a
      ><a name="27484"
      > </a
      ><a name="27485" class="Keyword"
      >where</a
      ><a name="27490"
      >

    </a
      ><a name="27496" href="2016-10-30-one-lambda-calculus-many-times-2.html#27496" class="Function"
      >&#10233;</a
      ><a name="27497"
      > </a
      ><a name="27498" class="Symbol"
      >:</a
      ><a name="27499"
      > </a
      ><a name="27508" href="2016-10-30-one-lambda-calculus-many-times-2.html#26720" class="Datatype Operator"
      >LJ</a
      ><a name="27510"
      > </a
      ><a name="27511" href="2016-10-30-one-lambda-calculus-many-times-2.html#27503" class="Bound"
      >S</a
      ><a name="27512"
      > </a
      ><a name="27513" class="Symbol"
      >&#8594;</a
      ><a name="27514"
      > </a
      ><a name="27515" href="2016-10-30-one-lambda-calculus-many-times-2.html#7056" class="Datatype Operator"
      >NJ</a
      ><a name="27517"
      > </a
      ><a name="27518" href="2016-10-30-one-lambda-calculus-many-times-2.html#27503" class="Bound"
      >S</a
      ><a name="27519"
      >
    </a
      ><a name="27524" href="2016-10-30-one-lambda-calculus-many-times-2.html#27496" class="Function"
      >&#10233;</a
      ><a name="27525"
      >  </a
      ><a name="27527" href="2016-10-30-one-lambda-calculus-many-times-2.html#26750" class="InductiveConstructor"
      >ax</a
      ><a name="27529"
      >       </a
      ><a name="27536" class="Symbol"
      >=</a
      ><a name="27537"
      > </a
      ><a name="27538" href="2016-10-30-one-lambda-calculus-many-times-2.html#7086" class="InductiveConstructor"
      >ax</a
      ><a name="27540"
      >
    </a
      ><a name="27545" href="2016-10-30-one-lambda-calculus-many-times-2.html#27496" class="Function"
      >&#10233;</a
      ><a name="27546"
      > </a
      ><a name="27547" class="Symbol"
      >(</a
      ><a name="27548" href="2016-10-30-one-lambda-calculus-many-times-2.html#26790" class="InductiveConstructor"
      >cut</a
      ><a name="27551"
      > </a
      ><a name="27552" class="Symbol"
      >{</a
      ><a name="27553" class="Argument"
      >&#916;</a
      ><a name="27554"
      > </a
      ><a name="27555" class="Symbol"
      >=</a
      ><a name="27556"
      > </a
      ><a name="27557" href="2016-10-30-one-lambda-calculus-many-times-2.html#27557" class="Bound"
      >&#916;</a
      ><a name="27558" class="Symbol"
      >}</a
      ><a name="27559"
      > </a
      ><a name="27560" href="2016-10-30-one-lambda-calculus-many-times-2.html#27560" class="Bound"
      >f</a
      ><a name="27561"
      > </a
      ><a name="27562" href="2016-10-30-one-lambda-calculus-many-times-2.html#27562" class="Bound"
      >g</a
      ><a name="27563" class="Symbol"
      >)</a
      ><a name="27564"
      > </a
      ><a name="27565" class="Symbol"
      >=</a
      ><a name="27566"
      > </a
      ><a name="27567" href="2016-10-30-one-lambda-calculus-many-times-2.html#24047" class="Function"
      >NJ.s&#8314;&#8242;</a
      ><a name="27573"
      > </a
      ><a name="27574" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="27576"
      > </a
      ><a name="27577" href="2016-10-30-one-lambda-calculus-many-times-2.html#27557" class="Bound"
      >&#916;</a
      ><a name="27578"
      > </a
      ><a name="27579" class="Symbol"
      >(</a
      ><a name="27580" href="2016-10-30-one-lambda-calculus-many-times-2.html#7178" class="InductiveConstructor"
      >&#8658;e</a
      ><a name="27582"
      > </a
      ><a name="27583" class="Symbol"
      >(</a
      ><a name="27584" href="2016-10-30-one-lambda-calculus-many-times-2.html#7125" class="InductiveConstructor"
      >&#8658;i</a
      ><a name="27586"
      > </a
      ><a name="27587" class="Symbol"
      >(</a
      ><a name="27588" href="2016-10-30-one-lambda-calculus-many-times-2.html#27496" class="Function"
      >&#10233;</a
      ><a name="27589"
      > </a
      ><a name="27590" href="2016-10-30-one-lambda-calculus-many-times-2.html#27562" class="Bound"
      >g</a
      ><a name="27591" class="Symbol"
      >))</a
      ><a name="27593"
      > </a
      ><a name="27594" class="Symbol"
      >(</a
      ><a name="27595" href="2016-10-30-one-lambda-calculus-many-times-2.html#27496" class="Function"
      >&#10233;</a
      ><a name="27596"
      > </a
      ><a name="27597" href="2016-10-30-one-lambda-calculus-many-times-2.html#27560" class="Bound"
      >f</a
      ><a name="27598" class="Symbol"
      >))</a
      ><a name="27600"
      >
    </a
      ><a name="27605" href="2016-10-30-one-lambda-calculus-many-times-2.html#27496" class="Function"
      >&#10233;</a
      ><a name="27606"
      > </a
      ><a name="27607" class="Symbol"
      >(</a
      ><a name="27608" href="2016-10-30-one-lambda-calculus-many-times-2.html#26856" class="InductiveConstructor"
      >&#8658;l</a
      ><a name="27610"
      >  </a
      ><a name="27612" class="Symbol"
      >{</a
      ><a name="27613" class="Argument"
      >&#916;</a
      ><a name="27614"
      > </a
      ><a name="27615" class="Symbol"
      >=</a
      ><a name="27616"
      > </a
      ><a name="27617" href="2016-10-30-one-lambda-calculus-many-times-2.html#27617" class="Bound"
      >&#916;</a
      ><a name="27618" class="Symbol"
      >}</a
      ><a name="27619"
      > </a
      ><a name="27620" href="2016-10-30-one-lambda-calculus-many-times-2.html#27620" class="Bound"
      >f</a
      ><a name="27621"
      > </a
      ><a name="27622" href="2016-10-30-one-lambda-calculus-many-times-2.html#27622" class="Bound"
      >g</a
      ><a name="27623" class="Symbol"
      >)</a
      ><a name="27624"
      > </a
      ><a name="27625" class="Symbol"
      >=</a
      ><a name="27626"
      > </a
      ><a name="27627" href="2016-10-30-one-lambda-calculus-many-times-2.html#24047" class="Function"
      >NJ.s&#8314;&#8242;</a
      ><a name="27633"
      > </a
      ><a name="27634" href="Agda.Builtin.List.html#89" class="InductiveConstructor"
      >[]</a
      ><a name="27636"
      > </a
      ><a name="27637" href="2016-10-30-one-lambda-calculus-many-times-2.html#27617" class="Bound"
      >&#916;</a
      ><a name="27638"
      > </a
      ><a name="27639" class="Symbol"
      >(</a
      ><a name="27640" href="2016-10-30-one-lambda-calculus-many-times-2.html#7178" class="InductiveConstructor"
      >&#8658;e</a
      ><a name="27642"
      > </a
      ><a name="27643" class="Symbol"
      >(</a
      ><a name="27644" href="2016-10-30-one-lambda-calculus-many-times-2.html#7125" class="InductiveConstructor"
      >&#8658;i</a
      ><a name="27646"
      > </a
      ><a name="27647" class="Symbol"
      >(</a
      ><a name="27648" href="2016-10-30-one-lambda-calculus-many-times-2.html#27496" class="Function"
      >&#10233;</a
      ><a name="27649"
      > </a
      ><a name="27650" href="2016-10-30-one-lambda-calculus-many-times-2.html#27622" class="Bound"
      >g</a
      ><a name="27651" class="Symbol"
      >))</a
      ><a name="27653"
      > </a
      ><a name="27654" class="Symbol"
      >(</a
      ><a name="27655" href="2016-10-30-one-lambda-calculus-many-times-2.html#7178" class="InductiveConstructor"
      >&#8658;e</a
      ><a name="27657"
      > </a
      ><a name="27658" href="2016-10-30-one-lambda-calculus-many-times-2.html#7086" class="InductiveConstructor"
      >ax</a
      ><a name="27660"
      > </a
      ><a name="27661" class="Symbol"
      >(</a
      ><a name="27662" href="2016-10-30-one-lambda-calculus-many-times-2.html#27496" class="Function"
      >&#10233;</a
      ><a name="27663"
      > </a
      ><a name="27664" href="2016-10-30-one-lambda-calculus-many-times-2.html#27620" class="Bound"
      >f</a
      ><a name="27665" class="Symbol"
      >)))</a
      ><a name="27668"
      >
    </a
      ><a name="27673" href="2016-10-30-one-lambda-calculus-many-times-2.html#27496" class="Function"
      >&#10233;</a
      ><a name="27674"
      > </a
      ><a name="27675" class="Symbol"
      >(</a
      ><a name="27676" href="2016-10-30-one-lambda-calculus-many-times-2.html#26930" class="InductiveConstructor"
      >&#8658;r</a
      ><a name="27678"
      >  </a
      ><a name="27680" href="2016-10-30-one-lambda-calculus-many-times-2.html#27680" class="Bound"
      >f</a
      ><a name="27681" class="Symbol"
      >)</a
      ><a name="27682"
      >   </a
      ><a name="27685" class="Symbol"
      >=</a
      ><a name="27686"
      > </a
      ><a name="27687" href="2016-10-30-one-lambda-calculus-many-times-2.html#7125" class="InductiveConstructor"
      >&#8658;i</a
      ><a name="27689"
      >  </a
      ><a name="27691" class="Symbol"
      >(</a
      ><a name="27692" href="2016-10-30-one-lambda-calculus-many-times-2.html#27496" class="Function"
      >&#10233;</a
      ><a name="27693"
      > </a
      ><a name="27694" href="2016-10-30-one-lambda-calculus-many-times-2.html#27680" class="Bound"
      >f</a
      ><a name="27695" class="Symbol"
      >)</a
      ><a name="27696"
      >
    </a
      ><a name="27701" href="2016-10-30-one-lambda-calculus-many-times-2.html#27496" class="Function"
      >&#10233;</a
      ><a name="27702"
      > </a
      ><a name="27703" class="Symbol"
      >(</a
      ><a name="27704" href="2016-10-30-one-lambda-calculus-many-times-2.html#26984" class="InductiveConstructor"
      >w</a
      ><a name="27705"
      >   </a
      ><a name="27708" href="2016-10-30-one-lambda-calculus-many-times-2.html#27708" class="Bound"
      >f</a
      ><a name="27709" class="Symbol"
      >)</a
      ><a name="27710"
      >   </a
      ><a name="27713" class="Symbol"
      >=</a
      ><a name="27714"
      > </a
      ><a name="27715" href="2016-10-30-one-lambda-calculus-many-times-2.html#7243" class="InductiveConstructor"
      >w</a
      ><a name="27716"
      >   </a
      ><a name="27719" class="Symbol"
      >(</a
      ><a name="27720" href="2016-10-30-one-lambda-calculus-many-times-2.html#27496" class="Function"
      >&#10233;</a
      ><a name="27721"
      > </a
      ><a name="27722" href="2016-10-30-one-lambda-calculus-many-times-2.html#27708" class="Bound"
      >f</a
      ><a name="27723" class="Symbol"
      >)</a
      ><a name="27724"
      >
    </a
      ><a name="27729" href="2016-10-30-one-lambda-calculus-many-times-2.html#27496" class="Function"
      >&#10233;</a
      ><a name="27730"
      > </a
      ><a name="27731" class="Symbol"
      >(</a
      ><a name="27732" href="2016-10-30-one-lambda-calculus-many-times-2.html#27034" class="InductiveConstructor"
      >c</a
      ><a name="27733"
      >   </a
      ><a name="27736" href="2016-10-30-one-lambda-calculus-many-times-2.html#27736" class="Bound"
      >f</a
      ><a name="27737" class="Symbol"
      >)</a
      ><a name="27738"
      >   </a
      ><a name="27741" class="Symbol"
      >=</a
      ><a name="27742"
      > </a
      ><a name="27743" href="2016-10-30-one-lambda-calculus-many-times-2.html#7292" class="InductiveConstructor"
      >c</a
      ><a name="27744"
      >   </a
      ><a name="27747" class="Symbol"
      >(</a
      ><a name="27748" href="2016-10-30-one-lambda-calculus-many-times-2.html#27496" class="Function"
      >&#10233;</a
      ><a name="27749"
      > </a
      ><a name="27750" href="2016-10-30-one-lambda-calculus-many-times-2.html#27736" class="Bound"
      >f</a
      ><a name="27751" class="Symbol"
      >)</a
      ><a name="27752"
      >
    </a
      ><a name="27757" href="2016-10-30-one-lambda-calculus-many-times-2.html#27496" class="Function"
      >&#10233;</a
      ><a name="27758"
      > </a
      ><a name="27759" class="Symbol"
      >(</a
      ><a name="27760" href="2016-10-30-one-lambda-calculus-many-times-2.html#27092" class="InductiveConstructor"
      >p</a
      ><a name="27761"
      > </a
      ><a name="27762" href="2016-10-30-one-lambda-calculus-many-times-2.html#27762" class="Bound"
      >&#915;</a
      ><a name="27763"
      > </a
      ><a name="27764" href="2016-10-30-one-lambda-calculus-many-times-2.html#27764" class="Bound"
      >f</a
      ><a name="27765" class="Symbol"
      >)</a
      ><a name="27766"
      >   </a
      ><a name="27769" class="Symbol"
      >=</a
      ><a name="27770"
      > </a
      ><a name="27771" href="2016-10-30-one-lambda-calculus-many-times-2.html#7349" class="InductiveConstructor"
      >p</a
      ><a name="27772"
      > </a
      ><a name="27773" href="2016-10-30-one-lambda-calculus-many-times-2.html#27762" class="Bound"
      >&#915;</a
      ><a name="27774"
      > </a
      ><a name="27775" class="Symbol"
      >(</a
      ><a name="27776" href="2016-10-30-one-lambda-calculus-many-times-2.html#27496" class="Function"
      >&#10233;</a
      ><a name="27777"
      > </a
      ><a name="27778" href="2016-10-30-one-lambda-calculus-many-times-2.html#27764" class="Bound"
      >f</a
      ><a name="27779" class="Symbol"
      >)</a
      ><a name="27780"
      >

    </a
      ><a name="27786" href="2016-10-30-one-lambda-calculus-many-times-2.html#27786" class="Function"
      >&#10232;</a
      ><a name="27787"
      > </a
      ><a name="27788" class="Symbol"
      >:</a
      ><a name="27789"
      > </a
      ><a name="27798" href="2016-10-30-one-lambda-calculus-many-times-2.html#7056" class="Datatype Operator"
      >NJ</a
      ><a name="27800"
      > </a
      ><a name="27801" href="2016-10-30-one-lambda-calculus-many-times-2.html#27793" class="Bound"
      >S</a
      ><a name="27802"
      > </a
      ><a name="27803" class="Symbol"
      >&#8594;</a
      ><a name="27804"
      > </a
      ><a name="27805" href="2016-10-30-one-lambda-calculus-many-times-2.html#26720" class="Datatype Operator"
      >LJ</a
      ><a name="27807"
      > </a
      ><a name="27808" href="2016-10-30-one-lambda-calculus-many-times-2.html#27793" class="Bound"
      >S</a
      ><a name="27809"
      >
    </a
      ><a name="27814" href="2016-10-30-one-lambda-calculus-many-times-2.html#27786" class="Function"
      >&#10232;</a
      ><a name="27815"
      >  </a
      ><a name="27817" href="2016-10-30-one-lambda-calculus-many-times-2.html#7086" class="InductiveConstructor"
      >ax</a
      ><a name="27819"
      >       </a
      ><a name="27826" class="Symbol"
      >=</a
      ><a name="27827"
      > </a
      ><a name="27828" href="2016-10-30-one-lambda-calculus-many-times-2.html#26750" class="InductiveConstructor"
      >ax</a
      ><a name="27830"
      >
    </a
      ><a name="27835" href="2016-10-30-one-lambda-calculus-many-times-2.html#27786" class="Function"
      >&#10232;</a
      ><a name="27836"
      > </a
      ><a name="27837" class="Symbol"
      >(</a
      ><a name="27838" href="2016-10-30-one-lambda-calculus-many-times-2.html#7125" class="InductiveConstructor"
      >&#8658;i</a
      ><a name="27840"
      >  </a
      ><a name="27842" href="2016-10-30-one-lambda-calculus-many-times-2.html#27842" class="Bound"
      >f</a
      ><a name="27843" class="Symbol"
      >)</a
      ><a name="27844"
      >   </a
      ><a name="27847" class="Symbol"
      >=</a
      ><a name="27848"
      > </a
      ><a name="27849" href="2016-10-30-one-lambda-calculus-many-times-2.html#26930" class="InductiveConstructor"
      >&#8658;r</a
      ><a name="27851"
      >  </a
      ><a name="27853" class="Symbol"
      >(</a
      ><a name="27854" href="2016-10-30-one-lambda-calculus-many-times-2.html#27786" class="Function"
      >&#10232;</a
      ><a name="27855"
      > </a
      ><a name="27856" href="2016-10-30-one-lambda-calculus-many-times-2.html#27842" class="Bound"
      >f</a
      ><a name="27857" class="Symbol"
      >)</a
      ><a name="27858"
      >
    </a
      ><a name="27863" href="2016-10-30-one-lambda-calculus-many-times-2.html#27786" class="Function"
      >&#10232;</a
      ><a name="27864"
      > </a
      ><a name="27865" class="Symbol"
      >(</a
      ><a name="27866" href="2016-10-30-one-lambda-calculus-many-times-2.html#7178" class="InductiveConstructor"
      >&#8658;e</a
      ><a name="27868"
      >  </a
      ><a name="27870" href="2016-10-30-one-lambda-calculus-many-times-2.html#27870" class="Bound"
      >f</a
      ><a name="27871"
      > </a
      ><a name="27872" href="2016-10-30-one-lambda-calculus-many-times-2.html#27872" class="Bound"
      >g</a
      ><a name="27873" class="Symbol"
      >)</a
      ><a name="27874"
      > </a
      ><a name="27875" class="Symbol"
      >=</a
      ><a name="27876"
      > </a
      ><a name="27877" href="2016-10-30-one-lambda-calculus-many-times-2.html#26790" class="InductiveConstructor"
      >cut</a
      ><a name="27880"
      > </a
      ><a name="27881" class="Symbol"
      >(</a
      ><a name="27882" href="2016-10-30-one-lambda-calculus-many-times-2.html#27786" class="Function"
      >&#10232;</a
      ><a name="27883"
      > </a
      ><a name="27884" href="2016-10-30-one-lambda-calculus-many-times-2.html#27870" class="Bound"
      >f</a
      ><a name="27885" class="Symbol"
      >)</a
      ><a name="27886"
      > </a
      ><a name="27887" class="Symbol"
      >(</a
      ><a name="27888" href="2016-10-30-one-lambda-calculus-many-times-2.html#27360" class="Function"
      >LJ.&#8709;e</a
      ><a name="27893"
      > </a
      ><a name="27894" class="Symbol"
      >(</a
      ><a name="27895" href="2016-10-30-one-lambda-calculus-many-times-2.html#26856" class="InductiveConstructor"
      >&#8658;l</a
      ><a name="27897"
      > </a
      ><a name="27898" class="Symbol"
      >(</a
      ><a name="27899" href="2016-10-30-one-lambda-calculus-many-times-2.html#27786" class="Function"
      >&#10232;</a
      ><a name="27900"
      > </a
      ><a name="27901" href="2016-10-30-one-lambda-calculus-many-times-2.html#27872" class="Bound"
      >g</a
      ><a name="27902" class="Symbol"
      >)</a
      ><a name="27903"
      > </a
      ><a name="27904" href="2016-10-30-one-lambda-calculus-many-times-2.html#26750" class="InductiveConstructor"
      >ax</a
      ><a name="27906" class="Symbol"
      >))</a
      ><a name="27908"
      >
    </a
      ><a name="27913" href="2016-10-30-one-lambda-calculus-many-times-2.html#27786" class="Function"
      >&#10232;</a
      ><a name="27914"
      > </a
      ><a name="27915" class="Symbol"
      >(</a
      ><a name="27916" href="2016-10-30-one-lambda-calculus-many-times-2.html#7243" class="InductiveConstructor"
      >w</a
      ><a name="27917"
      >   </a
      ><a name="27920" href="2016-10-30-one-lambda-calculus-many-times-2.html#27920" class="Bound"
      >f</a
      ><a name="27921" class="Symbol"
      >)</a
      ><a name="27922"
      >   </a
      ><a name="27925" class="Symbol"
      >=</a
      ><a name="27926"
      > </a
      ><a name="27927" href="2016-10-30-one-lambda-calculus-many-times-2.html#26984" class="InductiveConstructor"
      >w</a
      ><a name="27928"
      >   </a
      ><a name="27931" class="Symbol"
      >(</a
      ><a name="27932" href="2016-10-30-one-lambda-calculus-many-times-2.html#27786" class="Function"
      >&#10232;</a
      ><a name="27933"
      > </a
      ><a name="27934" href="2016-10-30-one-lambda-calculus-many-times-2.html#27920" class="Bound"
      >f</a
      ><a name="27935" class="Symbol"
      >)</a
      ><a name="27936"
      >
    </a
      ><a name="27941" href="2016-10-30-one-lambda-calculus-many-times-2.html#27786" class="Function"
      >&#10232;</a
      ><a name="27942"
      > </a
      ><a name="27943" class="Symbol"
      >(</a
      ><a name="27944" href="2016-10-30-one-lambda-calculus-many-times-2.html#7292" class="InductiveConstructor"
      >c</a
      ><a name="27945"
      >   </a
      ><a name="27948" href="2016-10-30-one-lambda-calculus-many-times-2.html#27948" class="Bound"
      >f</a
      ><a name="27949" class="Symbol"
      >)</a
      ><a name="27950"
      >   </a
      ><a name="27953" class="Symbol"
      >=</a
      ><a name="27954"
      > </a
      ><a name="27955" href="2016-10-30-one-lambda-calculus-many-times-2.html#27034" class="InductiveConstructor"
      >c</a
      ><a name="27956"
      >   </a
      ><a name="27959" class="Symbol"
      >(</a
      ><a name="27960" href="2016-10-30-one-lambda-calculus-many-times-2.html#27786" class="Function"
      >&#10232;</a
      ><a name="27961"
      > </a
      ><a name="27962" href="2016-10-30-one-lambda-calculus-many-times-2.html#27948" class="Bound"
      >f</a
      ><a name="27963" class="Symbol"
      >)</a
      ><a name="27964"
      >
    </a
      ><a name="27969" href="2016-10-30-one-lambda-calculus-many-times-2.html#27786" class="Function"
      >&#10232;</a
      ><a name="27970"
      > </a
      ><a name="27971" class="Symbol"
      >(</a
      ><a name="27972" href="2016-10-30-one-lambda-calculus-many-times-2.html#7349" class="InductiveConstructor"
      >p</a
      ><a name="27973"
      > </a
      ><a name="27974" href="2016-10-30-one-lambda-calculus-many-times-2.html#27974" class="Bound"
      >&#915;</a
      ><a name="27975"
      > </a
      ><a name="27976" href="2016-10-30-one-lambda-calculus-many-times-2.html#27976" class="Bound"
      >f</a
      ><a name="27977" class="Symbol"
      >)</a
      ><a name="27978"
      >   </a
      ><a name="27981" class="Symbol"
      >=</a
      ><a name="27982"
      > </a
      ><a name="27983" href="2016-10-30-one-lambda-calculus-many-times-2.html#27092" class="InductiveConstructor"
      >p</a
      ><a name="27984"
      > </a
      ><a name="27985" href="2016-10-30-one-lambda-calculus-many-times-2.html#27974" class="Bound"
      >&#915;</a
      ><a name="27986"
      > </a
      ><a name="27987" class="Symbol"
      >(</a
      ><a name="27988" href="2016-10-30-one-lambda-calculus-many-times-2.html#27786" class="Function"
      >&#10232;</a
      ><a name="27989"
      > </a
      ><a name="27990" href="2016-10-30-one-lambda-calculus-many-times-2.html#27976" class="Bound"
      >f</a
      ><a name="27991" class="Symbol"
      >)</a
      >
</pre>
<!--{% endraw %}-->

<!--{% raw %}-->
<pre class="Agda">
  <a name="28020" class="Keyword"
      >module</a
      ><a name="28026"
      > </a
      ><a name="28027" href="2016-10-30-one-lambda-calculus-many-times-2.html#28027" class="Module"
      >LJ&#8660;SC</a
      ><a name="28032"
      > </a
      ><a name="28033" class="Keyword"
      >where</a
      ><a name="28038"
      >

    </a
      ><a name="28044" href="2016-10-30-one-lambda-calculus-many-times-2.html#28044" class="Function"
      >&#10233;</a
      ><a name="28045"
      > </a
      ><a name="28046" class="Symbol"
      >:</a
      ><a name="28047"
      > </a
      ><a name="28056" href="2016-10-30-one-lambda-calculus-many-times-2.html#26720" class="Datatype Operator"
      >LJ</a
      ><a name="28058"
      > </a
      ><a name="28059" href="2016-10-30-one-lambda-calculus-many-times-2.html#28051" class="Bound"
      >S</a
      ><a name="28060"
      > </a
      ><a name="28061" class="Symbol"
      >&#8594;</a
      ><a name="28062"
      > </a
      ><a name="28063" href="2016-03-20-one-lambda-calculus-many-times.html#9787" class="Datatype Operator"
      >SC</a
      ><a name="28065"
      > </a
      ><a name="28066" href="2016-10-30-one-lambda-calculus-many-times-2.html#28051" class="Bound"
      >S</a
      ><a name="28067"
      >
    </a
      ><a name="28072" href="2016-10-30-one-lambda-calculus-many-times-2.html#28044" class="Function"
      >&#10233;</a
      ><a name="28073"
      > </a
      ><a name="28074" href="2016-10-30-one-lambda-calculus-many-times-2.html#28074" class="Bound"
      >f</a
      ><a name="28075"
      > </a
      ><a name="28076" class="Symbol"
      >=</a
      ><a name="28077"
      > </a
      ><a name="28078" href="2016-03-20-one-lambda-calculus-many-times.html#10586" class="Function"
      >ND&#8660;SC.&#10233;</a
      ><a name="28085"
      > </a
      ><a name="28086" class="Symbol"
      >(</a
      ><a name="28087" href="2016-10-30-one-lambda-calculus-many-times-2.html#25418" class="Function"
      >NJ&#8660;ND.&#10233;</a
      ><a name="28094"
      > </a
      ><a name="28095" class="Symbol"
      >(</a
      ><a name="28096" href="2016-10-30-one-lambda-calculus-many-times-2.html#27496" class="Function"
      >LJ&#8660;NJ.&#10233;</a
      ><a name="28103"
      > </a
      ><a name="28104" href="2016-10-30-one-lambda-calculus-many-times-2.html#28074" class="Bound"
      >f</a
      ><a name="28105" class="Symbol"
      >))</a
      ><a name="28107"
      >

    </a
      ><a name="28113" href="2016-10-30-one-lambda-calculus-many-times-2.html#28113" class="Function"
      >&#10232;</a
      ><a name="28114"
      > </a
      ><a name="28115" class="Symbol"
      >:</a
      ><a name="28116"
      > </a
      ><a name="28125" href="2016-03-20-one-lambda-calculus-many-times.html#9787" class="Datatype Operator"
      >SC</a
      ><a name="28127"
      > </a
      ><a name="28128" href="2016-10-30-one-lambda-calculus-many-times-2.html#28120" class="Bound"
      >S</a
      ><a name="28129"
      > </a
      ><a name="28130" class="Symbol"
      >&#8594;</a
      ><a name="28131"
      > </a
      ><a name="28132" href="2016-10-30-one-lambda-calculus-many-times-2.html#26720" class="Datatype Operator"
      >LJ</a
      ><a name="28134"
      > </a
      ><a name="28135" href="2016-10-30-one-lambda-calculus-many-times-2.html#28120" class="Bound"
      >S</a
      ><a name="28136"
      >
    </a
      ><a name="28141" href="2016-10-30-one-lambda-calculus-many-times-2.html#28113" class="Function"
      >&#10232;</a
      ><a name="28142"
      > </a
      ><a name="28143" href="2016-10-30-one-lambda-calculus-many-times-2.html#28143" class="Bound"
      >f</a
      ><a name="28144"
      > </a
      ><a name="28145" class="Symbol"
      >=</a
      ><a name="28146"
      > </a
      ><a name="28147" href="2016-10-30-one-lambda-calculus-many-times-2.html#27786" class="Function"
      >LJ&#8660;NJ.&#10232;</a
      ><a name="28154"
      > </a
      ><a name="28155" class="Symbol"
      >(</a
      ><a name="28156" href="2016-10-30-one-lambda-calculus-many-times-2.html#25844" class="Function"
      >NJ&#8660;ND.&#10232;</a
      ><a name="28163"
      > </a
      ><a name="28164" class="Symbol"
      >(</a
      ><a name="28165" href="2016-03-20-one-lambda-calculus-many-times.html#10709" class="Function"
      >ND&#8660;SC.&#10232;</a
      ><a name="28172"
      > </a
      ><a name="28173" href="2016-10-30-one-lambda-calculus-many-times-2.html#28143" class="Bound"
      >f</a
      ><a name="28174" class="Symbol"
      >))</a
      >
</pre>
<!--{% endraw %}-->


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
<!--{% raw %}-->
<pre class="Agda">
<a name="28935" class="Comment"
      >-- -}</a
      ><a name="28940"
      >
</a
      ><a name="28941" class="Comment"
      >-- -}</a
      ><a name="28946"
      >
</a
      ><a name="28947" class="Comment"
      >-- -}</a
      ><a name="28952"
      >
</a
      ><a name="28953" class="Comment"
      >-- -}</a
      ><a name="28958"
      >
</a
      ><a name="28959" class="Comment"
      >-- -}</a
      >
</pre>
<!--{% endraw %}-->
</div>
