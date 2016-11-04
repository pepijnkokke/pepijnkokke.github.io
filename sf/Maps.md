---
title         : "Maps: Total and Partial Maps"
layout        : default
hide-implicit : false
extra-script  : agda-extra-script.html
extra-style   : agda-extra-style.html
permalink     : "sf/Maps.html"
---

# Maps: Total and Partial Maps

Maps (or dictionaries) are ubiquitous data structures, both in
software construction generally and in the theory of programming
languages in particular; we're going to need them in many places in
the coming chapters.  They also make a nice case study using ideas
we've seen in previous chapters, including building data structures
out of higher-order functions (from [Basics](sf/Basics.html)
and [Poly](sf/Poly.html) and the use of reflection to streamline
proofs (from [IndProp](sf/IndProp.html).

We'll define two flavors of maps: _total_ maps, which include a
"default" element to be returned when a key being looked up
doesn't exist, and _partial_ maps, which return an `Maybe` to
indicate success or failure.  The latter is defined in terms of
the former, using `nothing` as the default element.

## The Agda Standard Library

One small digression before we start.

Unlike the chapters we have seen so far, this one does not
import the chapter before it (and, transitively, all the
earlier chapters).  Instead, in this chapter and from now, on
we're going to import the definitions and theorems we need
directly from Agda's standard library stuff.  You should not notice
much difference, though, because we've been careful to name our
own definitions and theorems the same as their counterparts in the
standard library, wherever they overlap.

<!--{% raw %}--><pre class="Agda">
<a name="1605" class="Keyword"
      >open</a
      ><a name="1609"
      > </a
      ><a name="1610" class="Keyword"
      >import</a
      ><a name="1616"
      > </a
      ><a name="1617" href="https://agda.github.io/agda-stdlib/Function.html#1" class="Module"
      >Function</a
      ><a name="1625"
      >         </a
      ><a name="1634" class="Keyword"
      >using</a
      ><a name="1639"
      > </a
      ><a name="1640" class="Symbol"
      >(</a
      ><a name="1641" href="https://agda.github.io/agda-stdlib/Function.html#713" class="Function Operator"
      >_&#8728;_</a
      ><a name="1644" class="Symbol"
      >)</a
      ><a name="1645"
      >
</a
      ><a name="1646" class="Keyword"
      >open</a
      ><a name="1650"
      > </a
      ><a name="1651" class="Keyword"
      >import</a
      ><a name="1657"
      > </a
      ><a name="1658" href="https://agda.github.io/agda-stdlib/Data.Bool.html#1" class="Module"
      >Data.Bool</a
      ><a name="1667"
      >        </a
      ><a name="1675" class="Keyword"
      >using</a
      ><a name="1680"
      > </a
      ><a name="1681" class="Symbol"
      >(</a
      ><a name="1682" href="Agda.Builtin.Bool.html#39" class="Datatype"
      >Bool</a
      ><a name="1686" class="Symbol"
      >;</a
      ><a name="1687"
      > </a
      ><a name="1688" href="Agda.Builtin.Bool.html#64" class="InductiveConstructor"
      >true</a
      ><a name="1692" class="Symbol"
      >;</a
      ><a name="1693"
      > </a
      ><a name="1694" href="Agda.Builtin.Bool.html#58" class="InductiveConstructor"
      >false</a
      ><a name="1699" class="Symbol"
      >)</a
      ><a name="1700"
      >
</a
      ><a name="1701" class="Keyword"
      >open</a
      ><a name="1705"
      > </a
      ><a name="1706" class="Keyword"
      >import</a
      ><a name="1712"
      > </a
      ><a name="1713" href="https://agda.github.io/agda-stdlib/Data.Empty.html#1" class="Module"
      >Data.Empty</a
      ><a name="1723"
      >       </a
      ><a name="1730" class="Keyword"
      >using</a
      ><a name="1735"
      > </a
      ><a name="1736" class="Symbol"
      >(</a
      ><a name="1737" href="https://agda.github.io/agda-stdlib/Data.Empty.html#243" class="Datatype"
      >&#8869;</a
      ><a name="1738" class="Symbol"
      >;</a
      ><a name="1739"
      > </a
      ><a name="1740" href="https://agda.github.io/agda-stdlib/Data.Empty.html#348" class="Function"
      >&#8869;-elim</a
      ><a name="1746" class="Symbol"
      >)</a
      ><a name="1747"
      >
</a
      ><a name="1748" class="Keyword"
      >open</a
      ><a name="1752"
      > </a
      ><a name="1753" class="Keyword"
      >import</a
      ><a name="1759"
      > </a
      ><a name="1760" href="https://agda.github.io/agda-stdlib/Data.Maybe.html#1" class="Module"
      >Data.Maybe</a
      ><a name="1770"
      >       </a
      ><a name="1777" class="Keyword"
      >using</a
      ><a name="1782"
      > </a
      ><a name="1783" class="Symbol"
      >(</a
      ><a name="1784" href="https://agda.github.io/agda-stdlib/Data.Maybe.Base.html#335" class="Datatype"
      >Maybe</a
      ><a name="1789" class="Symbol"
      >;</a
      ><a name="1790"
      > </a
      ><a name="1791" href="https://agda.github.io/agda-stdlib/Data.Maybe.html#1527" class="InductiveConstructor"
      >just</a
      ><a name="1795" class="Symbol"
      >;</a
      ><a name="1796"
      > </a
      ><a name="1797" href="https://agda.github.io/agda-stdlib/Data.Maybe.html#1588" class="InductiveConstructor"
      >nothing</a
      ><a name="1804" class="Symbol"
      >)</a
      ><a name="1805"
      >
</a
      ><a name="1806" class="Keyword"
      >open</a
      ><a name="1810"
      > </a
      ><a name="1811" class="Keyword"
      >import</a
      ><a name="1817"
      > </a
      ><a name="1818" href="https://agda.github.io/agda-stdlib/Data.Nat.html#1" class="Module"
      >Data.Nat</a
      ><a name="1826"
      >         </a
      ><a name="1835" class="Keyword"
      >using</a
      ><a name="1840"
      > </a
      ><a name="1841" class="Symbol"
      >(</a
      ><a name="1842" href="Agda.Builtin.Nat.html#69" class="Datatype"
      >&#8469;</a
      ><a name="1843" class="Symbol"
      >)</a
      ><a name="1844"
      >
</a
      ><a name="1845" class="Keyword"
      >open</a
      ><a name="1849"
      > </a
      ><a name="1850" class="Keyword"
      >import</a
      ><a name="1856"
      > </a
      ><a name="1857" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#1" class="Module"
      >Relation.Nullary</a
      ><a name="1873"
      > </a
      ><a name="1874" class="Keyword"
      >using</a
      ><a name="1879"
      > </a
      ><a name="1880" class="Symbol"
      >(</a
      ><a name="1881" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#484" class="Datatype"
      >Dec</a
      ><a name="1884" class="Symbol"
      >;</a
      ><a name="1885"
      > </a
      ><a name="1886" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="1889" class="Symbol"
      >;</a
      ><a name="1890"
      > </a
      ><a name="1891" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="1893" class="Symbol"
      >)</a
      ><a name="1894"
      >
</a
      ><a name="1895" class="Keyword"
      >open</a
      ><a name="1899"
      > </a
      ><a name="1900" class="Keyword"
      >import</a
      ><a name="1906"
      > </a
      ><a name="1907" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.html#1" class="Module"
      >Relation.Binary.PropositionalEquality</a
      >
</pre><!--{% endraw %}-->

Documentation for the standard library can be found at
<https://agda.github.io/agda-stdlib/>.

## Identifiers

First, we need a type for the keys that we use to index into our
maps.  For this purpose, we again use the type Id` from the
[Lists](sf/Lists.html) chapter.  To make this chapter self contained,
we repeat its definition here, together with the equality comparison
function for ids and its fundamental property.

<!--{% raw %}--><pre class="Agda">
<a name="2393" class="Keyword"
      >data</a
      ><a name="2397"
      > </a
      ><a name="2398" href="Maps.html#2398" class="Datatype"
      >Id</a
      ><a name="2400"
      > </a
      ><a name="2401" class="Symbol"
      >:</a
      ><a name="2402"
      > </a
      ><a name="2403" class="PrimitiveType"
      >Set</a
      ><a name="2406"
      > </a
      ><a name="2407" class="Keyword"
      >where</a
      ><a name="2412"
      >
  </a
      ><a name="2415" href="Maps.html#2415" class="InductiveConstructor"
      >id</a
      ><a name="2417"
      > </a
      ><a name="2418" class="Symbol"
      >:</a
      ><a name="2419"
      > </a
      ><a name="2420" href="Agda.Builtin.Nat.html#69" class="Datatype"
      >&#8469;</a
      ><a name="2421"
      > </a
      ><a name="2422" class="Symbol"
      >&#8594;</a
      ><a name="2423"
      > </a
      ><a name="2424" href="Maps.html#2398" class="Datatype"
      >Id</a
      >
</pre><!--{% endraw %}-->

<!--{% raw %}--><pre class="Agda">
<a name="2452" href="Maps.html#2452" class="Function Operator"
      >_&#8799;_</a
      ><a name="2455"
      > </a
      ><a name="2456" class="Symbol"
      >:</a
      ><a name="2457"
      > </a
      ><a name="2458" class="Symbol"
      >(</a
      ><a name="2459" href="Maps.html#2459" class="Bound"
      >x</a
      ><a name="2460"
      > </a
      ><a name="2461" href="Maps.html#2461" class="Bound"
      >y</a
      ><a name="2462"
      > </a
      ><a name="2463" class="Symbol"
      >:</a
      ><a name="2464"
      > </a
      ><a name="2465" href="Maps.html#2398" class="Datatype"
      >Id</a
      ><a name="2467" class="Symbol"
      >)</a
      ><a name="2468"
      > </a
      ><a name="2469" class="Symbol"
      >&#8594;</a
      ><a name="2470"
      > </a
      ><a name="2471" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#484" class="Datatype"
      >Dec</a
      ><a name="2474"
      > </a
      ><a name="2475" class="Symbol"
      >(</a
      ><a name="2476" href="Maps.html#2459" class="Bound"
      >x</a
      ><a name="2477"
      > </a
      ><a name="2478" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="2479"
      > </a
      ><a name="2480" href="Maps.html#2461" class="Bound"
      >y</a
      ><a name="2481" class="Symbol"
      >)</a
      ><a name="2482"
      >
</a
      ><a name="2483" href="Maps.html#2415" class="InductiveConstructor"
      >id</a
      ><a name="2485"
      > </a
      ><a name="2486" href="Maps.html#2486" class="Bound"
      >x</a
      ><a name="2487"
      > </a
      ><a name="2488" href="Maps.html#2452" class="Function Operator"
      >&#8799;</a
      ><a name="2489"
      > </a
      ><a name="2490" href="Maps.html#2415" class="InductiveConstructor"
      >id</a
      ><a name="2492"
      > </a
      ><a name="2493" href="Maps.html#2493" class="Bound"
      >y</a
      ><a name="2494"
      > </a
      ><a name="2495" class="Keyword"
      >with</a
      ><a name="2499"
      > </a
      ><a name="2500" href="Maps.html#2486" class="Bound"
      >x</a
      ><a name="2501"
      > </a
      ><a name="2502" href="https://agda.github.io/agda-stdlib/Data.Nat.Base.html#3199" class="Function Operator"
      >Data.Nat.&#8799;</a
      ><a name="2512"
      > </a
      ><a name="2513" href="Maps.html#2493" class="Bound"
      >y</a
      ><a name="2514"
      >
</a
      ><a name="2515" href="Maps.html#2415" class="InductiveConstructor"
      >id</a
      ><a name="2517"
      > </a
      ><a name="2518" href="Maps.html#2518" class="Bound"
      >x</a
      ><a name="2519"
      > </a
      ><a name="2520" href="Maps.html#2452" class="Function Operator"
      >&#8799;</a
      ><a name="2521"
      > </a
      ><a name="2522" href="Maps.html#2415" class="InductiveConstructor"
      >id</a
      ><a name="2524"
      > </a
      ><a name="2525" href="Maps.html#2525" class="Bound"
      >y</a
      ><a name="2526"
      > </a
      ><a name="2527" class="Symbol"
      >|</a
      ><a name="2528"
      > </a
      ><a name="2529" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="2532"
      > </a
      ><a name="2533" href="Maps.html#2533" class="Bound"
      >x=y</a
      ><a name="2536"
      > </a
      ><a name="2537" class="Keyword"
      >rewrite</a
      ><a name="2544"
      > </a
      ><a name="2545" href="Maps.html#2533" class="Bound"
      >x=y</a
      ><a name="2548"
      > </a
      ><a name="2549" class="Symbol"
      >=</a
      ><a name="2550"
      > </a
      ><a name="2551" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="2554"
      > </a
      ><a name="2555" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="2559"
      >
</a
      ><a name="2560" href="Maps.html#2415" class="InductiveConstructor"
      >id</a
      ><a name="2562"
      > </a
      ><a name="2563" href="Maps.html#2563" class="Bound"
      >x</a
      ><a name="2564"
      > </a
      ><a name="2565" href="Maps.html#2452" class="Function Operator"
      >&#8799;</a
      ><a name="2566"
      > </a
      ><a name="2567" href="Maps.html#2415" class="InductiveConstructor"
      >id</a
      ><a name="2569"
      > </a
      ><a name="2570" href="Maps.html#2570" class="Bound"
      >y</a
      ><a name="2571"
      > </a
      ><a name="2572" class="Symbol"
      >|</a
      ><a name="2573"
      > </a
      ><a name="2574" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="2576"
      >  </a
      ><a name="2578" href="Maps.html#2578" class="Bound"
      >x&#8800;y</a
      ><a name="2581"
      > </a
      ><a name="2582" class="Symbol"
      >=</a
      ><a name="2583"
      > </a
      ><a name="2584" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="2586"
      > </a
      ><a name="2587" class="Symbol"
      >(</a
      ><a name="2588" href="Maps.html#2578" class="Bound"
      >x&#8800;y</a
      ><a name="2591"
      > </a
      ><a name="2592" href="https://agda.github.io/agda-stdlib/Function.html#713" class="Function Operator"
      >&#8728;</a
      ><a name="2593"
      > </a
      ><a name="2594" href="Maps.html#2614" class="Function"
      >id-inj</a
      ><a name="2600" class="Symbol"
      >)</a
      ><a name="2601"
      >
  </a
      ><a name="2604" class="Keyword"
      >where</a
      ><a name="2609"
      >
    </a
      ><a name="2614" href="Maps.html#2614" class="Function"
      >id-inj</a
      ><a name="2620"
      > </a
      ><a name="2621" class="Symbol"
      >:</a
      ><a name="2622"
      > </a
      ><a name="2623" class="Symbol"
      >&#8704;</a
      ><a name="2624"
      > </a
      ><a name="2625" class="Symbol"
      >{</a
      ><a name="2626" href="Maps.html#2626" class="Bound"
      >x</a
      ><a name="2627"
      > </a
      ><a name="2628" href="Maps.html#2628" class="Bound"
      >y</a
      ><a name="2629" class="Symbol"
      >}</a
      ><a name="2630"
      > </a
      ><a name="2631" class="Symbol"
      >&#8594;</a
      ><a name="2632"
      > </a
      ><a name="2633" href="Maps.html#2415" class="InductiveConstructor"
      >id</a
      ><a name="2635"
      > </a
      ><a name="2636" href="Maps.html#2626" class="Bound"
      >x</a
      ><a name="2637"
      > </a
      ><a name="2638" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="2639"
      > </a
      ><a name="2640" href="Maps.html#2415" class="InductiveConstructor"
      >id</a
      ><a name="2642"
      > </a
      ><a name="2643" href="Maps.html#2628" class="Bound"
      >y</a
      ><a name="2644"
      > </a
      ><a name="2645" class="Symbol"
      >&#8594;</a
      ><a name="2646"
      > </a
      ><a name="2647" href="Maps.html#2626" class="Bound"
      >x</a
      ><a name="2648"
      > </a
      ><a name="2649" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="2650"
      > </a
      ><a name="2651" href="Maps.html#2628" class="Bound"
      >y</a
      ><a name="2652"
      >
    </a
      ><a name="2657" href="Maps.html#2614" class="Function"
      >id-inj</a
      ><a name="2663"
      > </a
      ><a name="2664" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="2668"
      > </a
      ><a name="2669" class="Symbol"
      >=</a
      ><a name="2670"
      > </a
      ><a name="2671" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      >
</pre><!--{% endraw %}-->

## Total Maps

Our main job in this chapter will be to build a definition of
partial maps that is similar in behavior to the one we saw in the
[Lists](sf/Lists.html) chapter, plus accompanying lemmas about their
behavior.

This time around, though, we're going to use _functions_, rather
than lists of key-value pairs, to build maps.  The advantage of
this representation is that it offers a more _extensional_ view of
maps, where two maps that respond to queries in the same way will
be represented as literally the same thing (the same function),
rather than just "equivalent" data structures.  This, in turn,
simplifies proofs that use maps.

We build partial maps in two steps.  First, we define a type of
_total maps_ that return a default value when we look up a key
that is not present in the map.

<!--{% raw %}--><pre class="Agda">
<a name="3507" href="Maps.html#3507" class="Function"
      >TotalMap</a
      ><a name="3515"
      > </a
      ><a name="3516" class="Symbol"
      >:</a
      ><a name="3517"
      > </a
      ><a name="3518" class="PrimitiveType"
      >Set</a
      ><a name="3521"
      > </a
      ><a name="3522" class="Symbol"
      >&#8594;</a
      ><a name="3523"
      > </a
      ><a name="3524" class="PrimitiveType"
      >Set</a
      ><a name="3527"
      >
</a
      ><a name="3528" href="Maps.html#3507" class="Function"
      >TotalMap</a
      ><a name="3536"
      > </a
      ><a name="3537" href="Maps.html#3537" class="Bound"
      >A</a
      ><a name="3538"
      > </a
      ><a name="3539" class="Symbol"
      >=</a
      ><a name="3540"
      > </a
      ><a name="3541" href="Maps.html#2398" class="Datatype"
      >Id</a
      ><a name="3543"
      > </a
      ><a name="3544" class="Symbol"
      >&#8594;</a
      ><a name="3545"
      > </a
      ><a name="3546" href="Maps.html#3537" class="Bound"
      >A</a
      >
</pre><!--{% endraw %}-->

Intuitively, a total map over anﬁ element type $$A$$ _is_ just a
function that can be used to look up ids, yielding $$A$$s.

<!--{% raw %}--><pre class="Agda">
<a name="3698" class="Keyword"
      >module</a
      ><a name="3704"
      > </a
      ><a name="3705" href="Maps.html#3705" class="Module"
      >TotalMap</a
      ><a name="3713"
      > </a
      ><a name="3714" class="Keyword"
      >where</a
      >
</pre><!--{% endraw %}-->

The function `empty` yields an empty total map, given a
default element; this map always returns the default element when
applied to any id.

<!--{% raw %}--><pre class="Agda">
  <a name="3889" href="Maps.html#3889" class="Function"
      >empty</a
      ><a name="3894"
      > </a
      ><a name="3895" class="Symbol"
      >:</a
      ><a name="3896"
      > </a
      ><a name="3897" class="Symbol"
      >&#8704;</a
      ><a name="3898"
      > </a
      ><a name="3899" class="Symbol"
      >{</a
      ><a name="3900" href="Maps.html#3900" class="Bound"
      >A</a
      ><a name="3901" class="Symbol"
      >}</a
      ><a name="3902"
      > </a
      ><a name="3903" class="Symbol"
      >&#8594;</a
      ><a name="3904"
      > </a
      ><a name="3905" href="Maps.html#3900" class="Bound"
      >A</a
      ><a name="3906"
      > </a
      ><a name="3907" class="Symbol"
      >&#8594;</a
      ><a name="3908"
      > </a
      ><a name="3909" href="Maps.html#3507" class="Function"
      >TotalMap</a
      ><a name="3917"
      > </a
      ><a name="3918" href="Maps.html#3900" class="Bound"
      >A</a
      ><a name="3919"
      >
  </a
      ><a name="3922" href="Maps.html#3889" class="Function"
      >empty</a
      ><a name="3927"
      > </a
      ><a name="3928" href="Maps.html#3928" class="Bound"
      >x</a
      ><a name="3929"
      > </a
      ><a name="3930" class="Symbol"
      >=</a
      ><a name="3931"
      > </a
      ><a name="3932" class="Symbol"
      >&#955;</a
      ><a name="3933"
      > </a
      ><a name="3934" href="Maps.html#3934" class="Bound"
      >_</a
      ><a name="3935"
      > </a
      ><a name="3936" class="Symbol"
      >&#8594;</a
      ><a name="3937"
      > </a
      ><a name="3938" href="Maps.html#3928" class="Bound"
      >x</a
      >
</pre><!--{% endraw %}-->

More interesting is the `update` function, which (as before) takes
a map $$m$$, a key $$x$$, and a value $$v$$ and returns a new map that
takes $$x$$ to $$v$$ and takes every other key to whatever $$m$$ does.

<!--{% raw %}--><pre class="Agda">
  <a name="4177" href="Maps.html#4177" class="Function"
      >update</a
      ><a name="4183"
      > </a
      ><a name="4184" class="Symbol"
      >:</a
      ><a name="4185"
      > </a
      ><a name="4186" class="Symbol"
      >&#8704;</a
      ><a name="4187"
      > </a
      ><a name="4188" class="Symbol"
      >{</a
      ><a name="4189" href="Maps.html#4189" class="Bound"
      >A</a
      ><a name="4190" class="Symbol"
      >}</a
      ><a name="4191"
      > </a
      ><a name="4192" class="Symbol"
      >&#8594;</a
      ><a name="4193"
      > </a
      ><a name="4194" href="Maps.html#3507" class="Function"
      >TotalMap</a
      ><a name="4202"
      > </a
      ><a name="4203" href="Maps.html#4189" class="Bound"
      >A</a
      ><a name="4204"
      > </a
      ><a name="4205" class="Symbol"
      >-&gt;</a
      ><a name="4207"
      > </a
      ><a name="4208" href="Maps.html#2398" class="Datatype"
      >Id</a
      ><a name="4210"
      > </a
      ><a name="4211" class="Symbol"
      >-&gt;</a
      ><a name="4213"
      > </a
      ><a name="4214" href="Maps.html#4189" class="Bound"
      >A</a
      ><a name="4215"
      > </a
      ><a name="4216" class="Symbol"
      >-&gt;</a
      ><a name="4218"
      > </a
      ><a name="4219" href="Maps.html#3507" class="Function"
      >TotalMap</a
      ><a name="4227"
      > </a
      ><a name="4228" href="Maps.html#4189" class="Bound"
      >A</a
      ><a name="4229"
      >
  </a
      ><a name="4232" href="Maps.html#4177" class="Function"
      >update</a
      ><a name="4238"
      > </a
      ><a name="4239" href="Maps.html#4239" class="Bound"
      >m</a
      ><a name="4240"
      > </a
      ><a name="4241" href="Maps.html#4241" class="Bound"
      >x</a
      ><a name="4242"
      > </a
      ><a name="4243" href="Maps.html#4243" class="Bound"
      >v</a
      ><a name="4244"
      > </a
      ><a name="4245" href="Maps.html#4245" class="Bound"
      >y</a
      ><a name="4246"
      > </a
      ><a name="4247" class="Keyword"
      >with</a
      ><a name="4251"
      > </a
      ><a name="4252" href="Maps.html#4241" class="Bound"
      >x</a
      ><a name="4253"
      > </a
      ><a name="4254" href="Maps.html#2452" class="Function Operator"
      >&#8799;</a
      ><a name="4255"
      > </a
      ><a name="4256" href="Maps.html#4245" class="Bound"
      >y</a
      ><a name="4257"
      >
  </a
      ><a name="4260" class="Symbol"
      >...</a
      ><a name="4263"
      > </a
      ><a name="4264" class="Symbol"
      >|</a
      ><a name="4265"
      > </a
      ><a name="4266" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="4269"
      > </a
      ><a name="4270" href="Maps.html#4270" class="Bound"
      >x=y</a
      ><a name="4273"
      > </a
      ><a name="4274" class="Symbol"
      >=</a
      ><a name="4275"
      > </a
      ><a name="4276" href="Maps.html#4243" class="Bound"
      >v</a
      ><a name="4277"
      >
  </a
      ><a name="4280" class="Symbol"
      >...</a
      ><a name="4283"
      > </a
      ><a name="4284" class="Symbol"
      >|</a
      ><a name="4285"
      > </a
      ><a name="4286" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="4288"
      >  </a
      ><a name="4290" href="Maps.html#4290" class="Bound"
      >x&#8800;y</a
      ><a name="4293"
      > </a
      ><a name="4294" class="Symbol"
      >=</a
      ><a name="4295"
      > </a
      ><a name="4296" href="Maps.html#4239" class="Bound"
      >m</a
      ><a name="4297"
      > </a
      ><a name="4298" href="Maps.html#4245" class="Bound"
      >y</a
      >
</pre><!--{% endraw %}-->

This definition is a nice example of higher-order programming.
The `update` function takes a _function_ $$m$$ and yields a new
function $$\lambda x'.\vdots$$ that behaves like the desired map.

For example, we can build a map taking ids to bools, where `id
3` is mapped to `true` and every other key is mapped to `false`,
like this:

<!--{% raw %}--><pre class="Agda">
  <a name="4661" href="Maps.html#4661" class="Function"
      >examplemap</a
      ><a name="4671"
      > </a
      ><a name="4672" class="Symbol"
      >:</a
      ><a name="4673"
      > </a
      ><a name="4674" href="Maps.html#3507" class="Function"
      >TotalMap</a
      ><a name="4682"
      > </a
      ><a name="4683" href="Agda.Builtin.Bool.html#39" class="Datatype"
      >Bool</a
      ><a name="4687"
      >
  </a
      ><a name="4690" href="Maps.html#4661" class="Function"
      >examplemap</a
      ><a name="4700"
      > </a
      ><a name="4701" class="Symbol"
      >=</a
      ><a name="4702"
      > </a
      ><a name="4703" href="Maps.html#4177" class="Function"
      >update</a
      ><a name="4709"
      > </a
      ><a name="4710" class="Symbol"
      >(</a
      ><a name="4711" href="Maps.html#4177" class="Function"
      >update</a
      ><a name="4717"
      > </a
      ><a name="4718" class="Symbol"
      >(</a
      ><a name="4719" href="Maps.html#3889" class="Function"
      >empty</a
      ><a name="4724"
      > </a
      ><a name="4725" href="Agda.Builtin.Bool.html#58" class="InductiveConstructor"
      >false</a
      ><a name="4730" class="Symbol"
      >)</a
      ><a name="4731"
      > </a
      ><a name="4732" class="Symbol"
      >(</a
      ><a name="4733" href="Maps.html#2415" class="InductiveConstructor"
      >id</a
      ><a name="4735"
      > </a
      ><a name="4736" class="Number"
      >1</a
      ><a name="4737" class="Symbol"
      >)</a
      ><a name="4738"
      > </a
      ><a name="4739" href="Agda.Builtin.Bool.html#58" class="InductiveConstructor"
      >false</a
      ><a name="4744" class="Symbol"
      >)</a
      ><a name="4745"
      > </a
      ><a name="4746" class="Symbol"
      >(</a
      ><a name="4747" href="Maps.html#2415" class="InductiveConstructor"
      >id</a
      ><a name="4749"
      > </a
      ><a name="4750" class="Number"
      >3</a
      ><a name="4751" class="Symbol"
      >)</a
      ><a name="4752"
      > </a
      ><a name="4753" href="Agda.Builtin.Bool.html#64" class="InductiveConstructor"
      >true</a
      >
</pre><!--{% endraw %}-->

This completes the definition of total maps.  Note that we don't
need to define a `find` operation because it is just function
application!

<!--{% raw %}--><pre class="Agda">
  <a name="4926" href="Maps.html#4926" class="Function Operator"
      >test_examplemap0</a
      ><a name="4942"
      > </a
      ><a name="4943" class="Symbol"
      >:</a
      ><a name="4944"
      > </a
      ><a name="4945" href="Maps.html#4661" class="Function"
      >examplemap</a
      ><a name="4955"
      > </a
      ><a name="4956" class="Symbol"
      >(</a
      ><a name="4957" href="Maps.html#2415" class="InductiveConstructor"
      >id</a
      ><a name="4959"
      > </a
      ><a name="4960" class="Number"
      >0</a
      ><a name="4961" class="Symbol"
      >)</a
      ><a name="4962"
      > </a
      ><a name="4963" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="4964"
      > </a
      ><a name="4965" href="Agda.Builtin.Bool.html#58" class="InductiveConstructor"
      >false</a
      ><a name="4970"
      >
  </a
      ><a name="4973" href="Maps.html#4926" class="Function Operator"
      >test_examplemap0</a
      ><a name="4989"
      > </a
      ><a name="4990" class="Symbol"
      >=</a
      ><a name="4991"
      > </a
      ><a name="4992" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="4996"
      >

  </a
      ><a name="5000" href="Maps.html#5000" class="Function Operator"
      >test_examplemap1</a
      ><a name="5016"
      > </a
      ><a name="5017" class="Symbol"
      >:</a
      ><a name="5018"
      > </a
      ><a name="5019" href="Maps.html#4661" class="Function"
      >examplemap</a
      ><a name="5029"
      > </a
      ><a name="5030" class="Symbol"
      >(</a
      ><a name="5031" href="Maps.html#2415" class="InductiveConstructor"
      >id</a
      ><a name="5033"
      > </a
      ><a name="5034" class="Number"
      >1</a
      ><a name="5035" class="Symbol"
      >)</a
      ><a name="5036"
      > </a
      ><a name="5037" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="5038"
      > </a
      ><a name="5039" href="Agda.Builtin.Bool.html#58" class="InductiveConstructor"
      >false</a
      ><a name="5044"
      >
  </a
      ><a name="5047" href="Maps.html#5000" class="Function Operator"
      >test_examplemap1</a
      ><a name="5063"
      > </a
      ><a name="5064" class="Symbol"
      >=</a
      ><a name="5065"
      > </a
      ><a name="5066" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="5070"
      >

  </a
      ><a name="5074" href="Maps.html#5074" class="Function Operator"
      >test_examplemap2</a
      ><a name="5090"
      > </a
      ><a name="5091" class="Symbol"
      >:</a
      ><a name="5092"
      > </a
      ><a name="5093" href="Maps.html#4661" class="Function"
      >examplemap</a
      ><a name="5103"
      > </a
      ><a name="5104" class="Symbol"
      >(</a
      ><a name="5105" href="Maps.html#2415" class="InductiveConstructor"
      >id</a
      ><a name="5107"
      > </a
      ><a name="5108" class="Number"
      >2</a
      ><a name="5109" class="Symbol"
      >)</a
      ><a name="5110"
      > </a
      ><a name="5111" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="5112"
      > </a
      ><a name="5113" href="Agda.Builtin.Bool.html#58" class="InductiveConstructor"
      >false</a
      ><a name="5118"
      >
  </a
      ><a name="5121" href="Maps.html#5074" class="Function Operator"
      >test_examplemap2</a
      ><a name="5137"
      > </a
      ><a name="5138" class="Symbol"
      >=</a
      ><a name="5139"
      > </a
      ><a name="5140" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="5144"
      >

  </a
      ><a name="5148" href="Maps.html#5148" class="Function Operator"
      >test_examplemap3</a
      ><a name="5164"
      > </a
      ><a name="5165" class="Symbol"
      >:</a
      ><a name="5166"
      > </a
      ><a name="5167" href="Maps.html#4661" class="Function"
      >examplemap</a
      ><a name="5177"
      > </a
      ><a name="5178" class="Symbol"
      >(</a
      ><a name="5179" href="Maps.html#2415" class="InductiveConstructor"
      >id</a
      ><a name="5181"
      > </a
      ><a name="5182" class="Number"
      >3</a
      ><a name="5183" class="Symbol"
      >)</a
      ><a name="5184"
      > </a
      ><a name="5185" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="5186"
      > </a
      ><a name="5187" href="Agda.Builtin.Bool.html#64" class="InductiveConstructor"
      >true</a
      ><a name="5191"
      >
  </a
      ><a name="5194" href="Maps.html#5148" class="Function Operator"
      >test_examplemap3</a
      ><a name="5210"
      > </a
      ><a name="5211" class="Symbol"
      >=</a
      ><a name="5212"
      > </a
      ><a name="5213" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      >
</pre><!--{% endraw %}-->

To use maps in later chapters, we'll need several fundamental
facts about how they behave.  Even if you don't work the following
exercises, make sure you thoroughly understand the statements of
the lemmas!  (Some of the proofs require the functional
extensionality axiom, which is discussed in the [Logic]
chapter and included in the Agda standard library.)

#### Exercise: 1 star, optional (apply-empty)
First, the empty map returns its default element for all keys:

<!--{% raw %}--><pre class="Agda">
  <a name="5714" class="Keyword"
      >postulate</a
      ><a name="5723"
      >
    </a
      ><a name="5728" href="Maps.html#5728" class="Postulate"
      >apply-empty</a
      ><a name="5739"
      > </a
      ><a name="5740" class="Symbol"
      >:</a
      ><a name="5741"
      > </a
      ><a name="5742" class="Symbol"
      >&#8704;</a
      ><a name="5743"
      > </a
      ><a name="5744" class="Symbol"
      >{</a
      ><a name="5745" href="Maps.html#5745" class="Bound"
      >A</a
      ><a name="5746"
      > </a
      ><a name="5747" href="Maps.html#5747" class="Bound"
      >x</a
      ><a name="5748"
      > </a
      ><a name="5749" href="Maps.html#5749" class="Bound"
      >v</a
      ><a name="5750" class="Symbol"
      >}</a
      ><a name="5751"
      > </a
      ><a name="5752" class="Symbol"
      >&#8594;</a
      ><a name="5753"
      > </a
      ><a name="5754" href="Maps.html#3889" class="Function"
      >empty</a
      ><a name="5759"
      > </a
      ><a name="5760" class="Symbol"
      >{</a
      ><a name="5761" href="Maps.html#5745" class="Bound"
      >A</a
      ><a name="5762" class="Symbol"
      >}</a
      ><a name="5763"
      > </a
      ><a name="5764" href="Maps.html#5749" class="Bound"
      >v</a
      ><a name="5765"
      > </a
      ><a name="5766" href="Maps.html#5747" class="Bound"
      >x</a
      ><a name="5767"
      > </a
      ><a name="5768" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="5769"
      > </a
      ><a name="5770" href="Maps.html#5749" class="Bound"
      >v</a
      >
</pre><!--{% endraw %}-->

<div class="hidden">
<!--{% raw %}--><pre class="Agda">
  <a name="5820" href="Maps.html#5820" class="Function"
      >apply-empty&#8242;</a
      ><a name="5832"
      > </a
      ><a name="5833" class="Symbol"
      >:</a
      ><a name="5834"
      > </a
      ><a name="5835" class="Symbol"
      >&#8704;</a
      ><a name="5836"
      > </a
      ><a name="5837" class="Symbol"
      >{</a
      ><a name="5838" href="Maps.html#5838" class="Bound"
      >A</a
      ><a name="5839"
      > </a
      ><a name="5840" href="Maps.html#5840" class="Bound"
      >x</a
      ><a name="5841"
      > </a
      ><a name="5842" href="Maps.html#5842" class="Bound"
      >v</a
      ><a name="5843" class="Symbol"
      >}</a
      ><a name="5844"
      > </a
      ><a name="5845" class="Symbol"
      >&#8594;</a
      ><a name="5846"
      > </a
      ><a name="5847" href="Maps.html#3889" class="Function"
      >empty</a
      ><a name="5852"
      > </a
      ><a name="5853" class="Symbol"
      >{</a
      ><a name="5854" href="Maps.html#5838" class="Bound"
      >A</a
      ><a name="5855" class="Symbol"
      >}</a
      ><a name="5856"
      > </a
      ><a name="5857" href="Maps.html#5842" class="Bound"
      >v</a
      ><a name="5858"
      > </a
      ><a name="5859" href="Maps.html#5840" class="Bound"
      >x</a
      ><a name="5860"
      > </a
      ><a name="5861" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="5862"
      > </a
      ><a name="5863" href="Maps.html#5842" class="Bound"
      >v</a
      ><a name="5864"
      >
  </a
      ><a name="5867" href="Maps.html#5820" class="Function"
      >apply-empty&#8242;</a
      ><a name="5879"
      > </a
      ><a name="5880" class="Symbol"
      >=</a
      ><a name="5881"
      > </a
      ><a name="5882" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      >
</pre><!--{% endraw %}-->
</div>

#### Exercise: 2 stars, optional (update-eq)
Next, if we update a map $$m$$ at a key $$x$$ with a new value $$v$$
and then look up $$x$$ in the map resulting from the `update`, we get
back $$v$$:

<!--{% raw %}--><pre class="Agda">
  <a name="6118" class="Keyword"
      >postulate</a
      ><a name="6127"
      >
    </a
      ><a name="6132" href="Maps.html#6132" class="Postulate"
      >update-eq</a
      ><a name="6141"
      > </a
      ><a name="6142" class="Symbol"
      >:</a
      ><a name="6143"
      > </a
      ><a name="6144" class="Symbol"
      >&#8704;</a
      ><a name="6145"
      > </a
      ><a name="6146" class="Symbol"
      >{</a
      ><a name="6147" href="Maps.html#6147" class="Bound"
      >A</a
      ><a name="6148"
      > </a
      ><a name="6149" href="Maps.html#6149" class="Bound"
      >v</a
      ><a name="6150" class="Symbol"
      >}</a
      ><a name="6151"
      > </a
      ><a name="6152" class="Symbol"
      >(</a
      ><a name="6153" href="Maps.html#6153" class="Bound"
      >m</a
      ><a name="6154"
      > </a
      ><a name="6155" class="Symbol"
      >:</a
      ><a name="6156"
      > </a
      ><a name="6157" href="Maps.html#3507" class="Function"
      >TotalMap</a
      ><a name="6165"
      > </a
      ><a name="6166" href="Maps.html#6147" class="Bound"
      >A</a
      ><a name="6167" class="Symbol"
      >)</a
      ><a name="6168"
      > </a
      ><a name="6169" class="Symbol"
      >(</a
      ><a name="6170" href="Maps.html#6170" class="Bound"
      >x</a
      ><a name="6171"
      > </a
      ><a name="6172" class="Symbol"
      >:</a
      ><a name="6173"
      > </a
      ><a name="6174" href="Maps.html#2398" class="Datatype"
      >Id</a
      ><a name="6176" class="Symbol"
      >)</a
      ><a name="6177"
      >
              </a
      ><a name="6192" class="Symbol"
      >&#8594;</a
      ><a name="6193"
      > </a
      ><a name="6194" class="Symbol"
      >(</a
      ><a name="6195" href="Maps.html#4177" class="Function"
      >update</a
      ><a name="6201"
      > </a
      ><a name="6202" href="Maps.html#6153" class="Bound"
      >m</a
      ><a name="6203"
      > </a
      ><a name="6204" href="Maps.html#6170" class="Bound"
      >x</a
      ><a name="6205"
      > </a
      ><a name="6206" href="Maps.html#6149" class="Bound"
      >v</a
      ><a name="6207" class="Symbol"
      >)</a
      ><a name="6208"
      > </a
      ><a name="6209" href="Maps.html#6170" class="Bound"
      >x</a
      ><a name="6210"
      > </a
      ><a name="6211" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="6212"
      > </a
      ><a name="6213" href="Maps.html#6149" class="Bound"
      >v</a
      >
</pre><!--{% endraw %}-->

<div class="hidden">
<!--{% raw %}--><pre class="Agda">
  <a name="6263" href="Maps.html#6263" class="Function"
      >update-eq&#8242;</a
      ><a name="6273"
      > </a
      ><a name="6274" class="Symbol"
      >:</a
      ><a name="6275"
      > </a
      ><a name="6276" class="Symbol"
      >&#8704;</a
      ><a name="6277"
      > </a
      ><a name="6278" class="Symbol"
      >{</a
      ><a name="6279" href="Maps.html#6279" class="Bound"
      >A</a
      ><a name="6280"
      > </a
      ><a name="6281" href="Maps.html#6281" class="Bound"
      >v</a
      ><a name="6282" class="Symbol"
      >}</a
      ><a name="6283"
      > </a
      ><a name="6284" class="Symbol"
      >(</a
      ><a name="6285" href="Maps.html#6285" class="Bound"
      >m</a
      ><a name="6286"
      > </a
      ><a name="6287" class="Symbol"
      >:</a
      ><a name="6288"
      > </a
      ><a name="6289" href="Maps.html#3507" class="Function"
      >TotalMap</a
      ><a name="6297"
      > </a
      ><a name="6298" href="Maps.html#6279" class="Bound"
      >A</a
      ><a name="6299" class="Symbol"
      >)</a
      ><a name="6300"
      > </a
      ><a name="6301" class="Symbol"
      >(</a
      ><a name="6302" href="Maps.html#6302" class="Bound"
      >x</a
      ><a name="6303"
      > </a
      ><a name="6304" class="Symbol"
      >:</a
      ><a name="6305"
      > </a
      ><a name="6306" href="Maps.html#2398" class="Datatype"
      >Id</a
      ><a name="6308" class="Symbol"
      >)</a
      ><a name="6309"
      >
             </a
      ><a name="6323" class="Symbol"
      >&#8594;</a
      ><a name="6324"
      > </a
      ><a name="6325" class="Symbol"
      >(</a
      ><a name="6326" href="Maps.html#4177" class="Function"
      >update</a
      ><a name="6332"
      > </a
      ><a name="6333" href="Maps.html#6285" class="Bound"
      >m</a
      ><a name="6334"
      > </a
      ><a name="6335" href="Maps.html#6302" class="Bound"
      >x</a
      ><a name="6336"
      > </a
      ><a name="6337" href="Maps.html#6281" class="Bound"
      >v</a
      ><a name="6338" class="Symbol"
      >)</a
      ><a name="6339"
      > </a
      ><a name="6340" href="Maps.html#6302" class="Bound"
      >x</a
      ><a name="6341"
      > </a
      ><a name="6342" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="6343"
      > </a
      ><a name="6344" href="Maps.html#6281" class="Bound"
      >v</a
      ><a name="6345"
      >
  </a
      ><a name="6348" href="Maps.html#6263" class="Function"
      >update-eq&#8242;</a
      ><a name="6358"
      > </a
      ><a name="6359" href="Maps.html#6359" class="Bound"
      >m</a
      ><a name="6360"
      > </a
      ><a name="6361" href="Maps.html#6361" class="Bound"
      >x</a
      ><a name="6362"
      > </a
      ><a name="6363" class="Keyword"
      >with</a
      ><a name="6367"
      > </a
      ><a name="6368" href="Maps.html#6361" class="Bound"
      >x</a
      ><a name="6369"
      > </a
      ><a name="6370" href="Maps.html#2452" class="Function Operator"
      >&#8799;</a
      ><a name="6371"
      > </a
      ><a name="6372" href="Maps.html#6361" class="Bound"
      >x</a
      ><a name="6373"
      >
  </a
      ><a name="6376" class="Symbol"
      >...</a
      ><a name="6379"
      > </a
      ><a name="6380" class="Symbol"
      >|</a
      ><a name="6381"
      > </a
      ><a name="6382" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="6385"
      > </a
      ><a name="6386" href="Maps.html#6386" class="Bound"
      >x=x</a
      ><a name="6389"
      > </a
      ><a name="6390" class="Symbol"
      >=</a
      ><a name="6391"
      > </a
      ><a name="6392" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="6396"
      >
  </a
      ><a name="6399" class="Symbol"
      >...</a
      ><a name="6402"
      > </a
      ><a name="6403" class="Symbol"
      >|</a
      ><a name="6404"
      > </a
      ><a name="6405" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="6407"
      >  </a
      ><a name="6409" href="Maps.html#6409" class="Bound"
      >x&#8800;x</a
      ><a name="6412"
      > </a
      ><a name="6413" class="Symbol"
      >=</a
      ><a name="6414"
      > </a
      ><a name="6415" href="https://agda.github.io/agda-stdlib/Data.Empty.html#348" class="Function"
      >&#8869;-elim</a
      ><a name="6421"
      > </a
      ><a name="6422" class="Symbol"
      >(</a
      ><a name="6423" href="Maps.html#6409" class="Bound"
      >x&#8800;x</a
      ><a name="6426"
      > </a
      ><a name="6427" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="6431" class="Symbol"
      >)</a
      >
</pre><!--{% endraw %}-->
</div>

#### Exercise: 2 stars, optional (update-neq)
On the other hand, if we update a map $$m$$ at a key $$x$$ and
then look up a _different_ key $$y$$ in the resulting map, we get
the same result that $$m$$ would have given:

<!--{% raw %}--><pre class="Agda">
  <a name="6688" href="Maps.html#6688" class="Function"
      >update-neq</a
      ><a name="6698"
      > </a
      ><a name="6699" class="Symbol"
      >:</a
      ><a name="6700"
      > </a
      ><a name="6701" class="Symbol"
      >&#8704;</a
      ><a name="6702"
      > </a
      ><a name="6703" class="Symbol"
      >{</a
      ><a name="6704" href="Maps.html#6704" class="Bound"
      >A</a
      ><a name="6705"
      > </a
      ><a name="6706" href="Maps.html#6706" class="Bound"
      >v</a
      ><a name="6707" class="Symbol"
      >}</a
      ><a name="6708"
      > </a
      ><a name="6709" class="Symbol"
      >(</a
      ><a name="6710" href="Maps.html#6710" class="Bound"
      >m</a
      ><a name="6711"
      > </a
      ><a name="6712" class="Symbol"
      >:</a
      ><a name="6713"
      > </a
      ><a name="6714" href="Maps.html#3507" class="Function"
      >TotalMap</a
      ><a name="6722"
      > </a
      ><a name="6723" href="Maps.html#6704" class="Bound"
      >A</a
      ><a name="6724" class="Symbol"
      >)</a
      ><a name="6725"
      > </a
      ><a name="6726" class="Symbol"
      >(</a
      ><a name="6727" href="Maps.html#6727" class="Bound"
      >x</a
      ><a name="6728"
      > </a
      ><a name="6729" href="Maps.html#6729" class="Bound"
      >y</a
      ><a name="6730"
      > </a
      ><a name="6731" class="Symbol"
      >:</a
      ><a name="6732"
      > </a
      ><a name="6733" href="Maps.html#2398" class="Datatype"
      >Id</a
      ><a name="6735" class="Symbol"
      >)</a
      ><a name="6736"
      >
             </a
      ><a name="6750" class="Symbol"
      >&#8594;</a
      ><a name="6751"
      > </a
      ><a name="6752" href="Maps.html#6727" class="Bound"
      >x</a
      ><a name="6753"
      > </a
      ><a name="6754" href="https://agda.github.io/agda-stdlib/Relation.Binary.Core.html#4493" class="Function Operator"
      >&#8802;</a
      ><a name="6755"
      > </a
      ><a name="6756" href="Maps.html#6729" class="Bound"
      >y</a
      ><a name="6757"
      > </a
      ><a name="6758" class="Symbol"
      >&#8594;</a
      ><a name="6759"
      > </a
      ><a name="6760" class="Symbol"
      >(</a
      ><a name="6761" href="Maps.html#4177" class="Function"
      >update</a
      ><a name="6767"
      > </a
      ><a name="6768" href="Maps.html#6710" class="Bound"
      >m</a
      ><a name="6769"
      > </a
      ><a name="6770" href="Maps.html#6727" class="Bound"
      >x</a
      ><a name="6771"
      > </a
      ><a name="6772" href="Maps.html#6706" class="Bound"
      >v</a
      ><a name="6773" class="Symbol"
      >)</a
      ><a name="6774"
      > </a
      ><a name="6775" href="Maps.html#6729" class="Bound"
      >y</a
      ><a name="6776"
      > </a
      ><a name="6777" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="6778"
      > </a
      ><a name="6779" href="Maps.html#6710" class="Bound"
      >m</a
      ><a name="6780"
      > </a
      ><a name="6781" href="Maps.html#6729" class="Bound"
      >y</a
      ><a name="6782"
      >
  </a
      ><a name="6785" href="Maps.html#6688" class="Function"
      >update-neq</a
      ><a name="6795"
      > </a
      ><a name="6796" href="Maps.html#6796" class="Bound"
      >m</a
      ><a name="6797"
      > </a
      ><a name="6798" href="Maps.html#6798" class="Bound"
      >x</a
      ><a name="6799"
      > </a
      ><a name="6800" href="Maps.html#6800" class="Bound"
      >y</a
      ><a name="6801"
      > </a
      ><a name="6802" href="Maps.html#6802" class="Bound"
      >x&#8800;y</a
      ><a name="6805"
      > </a
      ><a name="6806" class="Keyword"
      >with</a
      ><a name="6810"
      > </a
      ><a name="6811" href="Maps.html#6798" class="Bound"
      >x</a
      ><a name="6812"
      > </a
      ><a name="6813" href="Maps.html#2452" class="Function Operator"
      >&#8799;</a
      ><a name="6814"
      > </a
      ><a name="6815" href="Maps.html#6800" class="Bound"
      >y</a
      ><a name="6816"
      >
  </a
      ><a name="6819" class="Symbol"
      >...</a
      ><a name="6822"
      > </a
      ><a name="6823" class="Symbol"
      >|</a
      ><a name="6824"
      > </a
      ><a name="6825" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="6828"
      > </a
      ><a name="6829" href="Maps.html#6829" class="Bound"
      >x=y</a
      ><a name="6832"
      > </a
      ><a name="6833" class="Symbol"
      >=</a
      ><a name="6834"
      > </a
      ><a name="6835" href="https://agda.github.io/agda-stdlib/Data.Empty.html#348" class="Function"
      >&#8869;-elim</a
      ><a name="6841"
      > </a
      ><a name="6842" class="Symbol"
      >(</a
      ><a name="6843" href="Maps.html#6802" class="Bound"
      >x&#8800;y</a
      ><a name="6846"
      > </a
      ><a name="6847" href="Maps.html#6829" class="Bound"
      >x=y</a
      ><a name="6850" class="Symbol"
      >)</a
      ><a name="6851"
      >
  </a
      ><a name="6854" class="Symbol"
      >...</a
      ><a name="6857"
      > </a
      ><a name="6858" class="Symbol"
      >|</a
      ><a name="6859"
      > </a
      ><a name="6860" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="6862"
      >  </a
      ><a name="6864" class="Symbol"
      >_</a
      ><a name="6865"
      >   </a
      ><a name="6868" class="Symbol"
      >=</a
      ><a name="6869"
      > </a
      ><a name="6870" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      >
</pre><!--{% endraw %}-->

#### Exercise: 2 stars, optional (update-shadow)
If we update a map $$m$$ at a key $$x$$ with a value $$v_1$$ and then
update again with the same key $$x$$ and another value $$v_2$$, the
resulting map behaves the same (gives the same result when applied
to any key) as the simpler map obtained by performing just
the second `update` on $$m$$:

<!--{% raw %}--><pre class="Agda">
  <a name="7246" class="Keyword"
      >postulate</a
      ><a name="7255"
      >
    </a
      ><a name="7260" href="Maps.html#7260" class="Postulate"
      >update-shadow</a
      ><a name="7273"
      > </a
      ><a name="7274" class="Symbol"
      >:</a
      ><a name="7275"
      > </a
      ><a name="7276" class="Symbol"
      >&#8704;</a
      ><a name="7277"
      > </a
      ><a name="7278" class="Symbol"
      >{</a
      ><a name="7279" href="Maps.html#7279" class="Bound"
      >A</a
      ><a name="7280"
      > </a
      ><a name="7281" href="Maps.html#7281" class="Bound"
      >v1</a
      ><a name="7283"
      > </a
      ><a name="7284" href="Maps.html#7284" class="Bound"
      >v2</a
      ><a name="7286" class="Symbol"
      >}</a
      ><a name="7287"
      > </a
      ><a name="7288" class="Symbol"
      >(</a
      ><a name="7289" href="Maps.html#7289" class="Bound"
      >m</a
      ><a name="7290"
      > </a
      ><a name="7291" class="Symbol"
      >:</a
      ><a name="7292"
      > </a
      ><a name="7293" href="Maps.html#3507" class="Function"
      >TotalMap</a
      ><a name="7301"
      > </a
      ><a name="7302" href="Maps.html#7279" class="Bound"
      >A</a
      ><a name="7303" class="Symbol"
      >)</a
      ><a name="7304"
      > </a
      ><a name="7305" class="Symbol"
      >(</a
      ><a name="7306" href="Maps.html#7306" class="Bound"
      >x</a
      ><a name="7307"
      > </a
      ><a name="7308" href="Maps.html#7308" class="Bound"
      >y</a
      ><a name="7309"
      > </a
      ><a name="7310" class="Symbol"
      >:</a
      ><a name="7311"
      > </a
      ><a name="7312" href="Maps.html#2398" class="Datatype"
      >Id</a
      ><a name="7314" class="Symbol"
      >)</a
      ><a name="7315"
      >
                  </a
      ><a name="7334" class="Symbol"
      >&#8594;</a
      ><a name="7335"
      > </a
      ><a name="7336" class="Symbol"
      >(</a
      ><a name="7337" href="Maps.html#4177" class="Function"
      >update</a
      ><a name="7343"
      > </a
      ><a name="7344" class="Symbol"
      >(</a
      ><a name="7345" href="Maps.html#4177" class="Function"
      >update</a
      ><a name="7351"
      > </a
      ><a name="7352" href="Maps.html#7289" class="Bound"
      >m</a
      ><a name="7353"
      > </a
      ><a name="7354" href="Maps.html#7306" class="Bound"
      >x</a
      ><a name="7355"
      > </a
      ><a name="7356" href="Maps.html#7281" class="Bound"
      >v1</a
      ><a name="7358" class="Symbol"
      >)</a
      ><a name="7359"
      > </a
      ><a name="7360" href="Maps.html#7306" class="Bound"
      >x</a
      ><a name="7361"
      > </a
      ><a name="7362" href="Maps.html#7284" class="Bound"
      >v2</a
      ><a name="7364" class="Symbol"
      >)</a
      ><a name="7365"
      > </a
      ><a name="7366" href="Maps.html#7308" class="Bound"
      >y</a
      ><a name="7367"
      > </a
      ><a name="7368" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="7369"
      > </a
      ><a name="7370" class="Symbol"
      >(</a
      ><a name="7371" href="Maps.html#4177" class="Function"
      >update</a
      ><a name="7377"
      > </a
      ><a name="7378" href="Maps.html#7289" class="Bound"
      >m</a
      ><a name="7379"
      > </a
      ><a name="7380" href="Maps.html#7306" class="Bound"
      >x</a
      ><a name="7381"
      > </a
      ><a name="7382" href="Maps.html#7284" class="Bound"
      >v2</a
      ><a name="7384" class="Symbol"
      >)</a
      ><a name="7385"
      > </a
      ><a name="7386" href="Maps.html#7308" class="Bound"
      >y</a
      >
</pre><!--{% endraw %}-->

<div class="hidden">
<!--{% raw %}--><pre class="Agda">
  <a name="7436" href="Maps.html#7436" class="Function"
      >update-shadow&#8242;</a
      ><a name="7450"
      > </a
      ><a name="7451" class="Symbol"
      >:</a
      ><a name="7452"
      > </a
      ><a name="7453" class="Symbol"
      >&#8704;</a
      ><a name="7454"
      > </a
      ><a name="7455" class="Symbol"
      >{</a
      ><a name="7456" href="Maps.html#7456" class="Bound"
      >A</a
      ><a name="7457"
      > </a
      ><a name="7458" href="Maps.html#7458" class="Bound"
      >v1</a
      ><a name="7460"
      > </a
      ><a name="7461" href="Maps.html#7461" class="Bound"
      >v2</a
      ><a name="7463" class="Symbol"
      >}</a
      ><a name="7464"
      > </a
      ><a name="7465" class="Symbol"
      >(</a
      ><a name="7466" href="Maps.html#7466" class="Bound"
      >m</a
      ><a name="7467"
      > </a
      ><a name="7468" class="Symbol"
      >:</a
      ><a name="7469"
      > </a
      ><a name="7470" href="Maps.html#3507" class="Function"
      >TotalMap</a
      ><a name="7478"
      > </a
      ><a name="7479" href="Maps.html#7456" class="Bound"
      >A</a
      ><a name="7480" class="Symbol"
      >)</a
      ><a name="7481"
      > </a
      ><a name="7482" class="Symbol"
      >(</a
      ><a name="7483" href="Maps.html#7483" class="Bound"
      >x</a
      ><a name="7484"
      > </a
      ><a name="7485" href="Maps.html#7485" class="Bound"
      >y</a
      ><a name="7486"
      > </a
      ><a name="7487" class="Symbol"
      >:</a
      ><a name="7488"
      > </a
      ><a name="7489" href="Maps.html#2398" class="Datatype"
      >Id</a
      ><a name="7491" class="Symbol"
      >)</a
      ><a name="7492"
      >
                 </a
      ><a name="7510" class="Symbol"
      >&#8594;</a
      ><a name="7511"
      > </a
      ><a name="7512" class="Symbol"
      >(</a
      ><a name="7513" href="Maps.html#4177" class="Function"
      >update</a
      ><a name="7519"
      > </a
      ><a name="7520" class="Symbol"
      >(</a
      ><a name="7521" href="Maps.html#4177" class="Function"
      >update</a
      ><a name="7527"
      > </a
      ><a name="7528" href="Maps.html#7466" class="Bound"
      >m</a
      ><a name="7529"
      > </a
      ><a name="7530" href="Maps.html#7483" class="Bound"
      >x</a
      ><a name="7531"
      > </a
      ><a name="7532" href="Maps.html#7458" class="Bound"
      >v1</a
      ><a name="7534" class="Symbol"
      >)</a
      ><a name="7535"
      > </a
      ><a name="7536" href="Maps.html#7483" class="Bound"
      >x</a
      ><a name="7537"
      > </a
      ><a name="7538" href="Maps.html#7461" class="Bound"
      >v2</a
      ><a name="7540" class="Symbol"
      >)</a
      ><a name="7541"
      > </a
      ><a name="7542" href="Maps.html#7485" class="Bound"
      >y</a
      ><a name="7543"
      > </a
      ><a name="7544" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="7545"
      > </a
      ><a name="7546" class="Symbol"
      >(</a
      ><a name="7547" href="Maps.html#4177" class="Function"
      >update</a
      ><a name="7553"
      > </a
      ><a name="7554" href="Maps.html#7466" class="Bound"
      >m</a
      ><a name="7555"
      > </a
      ><a name="7556" href="Maps.html#7483" class="Bound"
      >x</a
      ><a name="7557"
      > </a
      ><a name="7558" href="Maps.html#7461" class="Bound"
      >v2</a
      ><a name="7560" class="Symbol"
      >)</a
      ><a name="7561"
      > </a
      ><a name="7562" href="Maps.html#7485" class="Bound"
      >y</a
      ><a name="7563"
      >
  </a
      ><a name="7566" href="Maps.html#7436" class="Function"
      >update-shadow&#8242;</a
      ><a name="7580"
      > </a
      ><a name="7581" href="Maps.html#7581" class="Bound"
      >m</a
      ><a name="7582"
      > </a
      ><a name="7583" href="Maps.html#7583" class="Bound"
      >x</a
      ><a name="7584"
      > </a
      ><a name="7585" href="Maps.html#7585" class="Bound"
      >y</a
      ><a name="7586"
      >
      </a
      ><a name="7593" class="Keyword"
      >with</a
      ><a name="7597"
      > </a
      ><a name="7598" href="Maps.html#7583" class="Bound"
      >x</a
      ><a name="7599"
      > </a
      ><a name="7600" href="Maps.html#2452" class="Function Operator"
      >&#8799;</a
      ><a name="7601"
      > </a
      ><a name="7602" href="Maps.html#7585" class="Bound"
      >y</a
      ><a name="7603"
      >
  </a
      ><a name="7606" class="Symbol"
      >...</a
      ><a name="7609"
      > </a
      ><a name="7610" class="Symbol"
      >|</a
      ><a name="7611"
      > </a
      ><a name="7612" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="7615"
      > </a
      ><a name="7616" href="Maps.html#7616" class="Bound"
      >x=y</a
      ><a name="7619"
      > </a
      ><a name="7620" class="Symbol"
      >=</a
      ><a name="7621"
      > </a
      ><a name="7622" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="7626"
      >
  </a
      ><a name="7629" class="Symbol"
      >...</a
      ><a name="7632"
      > </a
      ><a name="7633" class="Symbol"
      >|</a
      ><a name="7634"
      > </a
      ><a name="7635" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="7637"
      >  </a
      ><a name="7639" href="Maps.html#7639" class="Bound"
      >x&#8800;y</a
      ><a name="7642"
      > </a
      ><a name="7643" class="Symbol"
      >=</a
      ><a name="7644"
      > </a
      ><a name="7645" href="Maps.html#6688" class="Function"
      >update-neq</a
      ><a name="7655"
      > </a
      ><a name="7656" href="Maps.html#7581" class="Bound"
      >m</a
      ><a name="7657"
      > </a
      ><a name="7658" href="Maps.html#7583" class="Bound"
      >x</a
      ><a name="7659"
      > </a
      ><a name="7660" href="Maps.html#7585" class="Bound"
      >y</a
      ><a name="7661"
      > </a
      ><a name="7662" href="Maps.html#7639" class="Bound"
      >x&#8800;y</a
      >
</pre><!--{% endraw %}-->
</div>

#### Exercise: 2 stars (update-same)
Prove the following theorem, which states that if we update a map to
assign key $$x$$ the same value as it already has in $$m$$, then the
result is equal to $$m$$:

<!--{% raw %}--><pre class="Agda">
  <a name="7902" class="Keyword"
      >postulate</a
      ><a name="7911"
      >
    </a
      ><a name="7916" href="Maps.html#7916" class="Postulate"
      >update-same</a
      ><a name="7927"
      > </a
      ><a name="7928" class="Symbol"
      >:</a
      ><a name="7929"
      > </a
      ><a name="7930" class="Symbol"
      >&#8704;</a
      ><a name="7931"
      > </a
      ><a name="7932" class="Symbol"
      >{</a
      ><a name="7933" href="Maps.html#7933" class="Bound"
      >A</a
      ><a name="7934" class="Symbol"
      >}</a
      ><a name="7935"
      > </a
      ><a name="7936" class="Symbol"
      >(</a
      ><a name="7937" href="Maps.html#7937" class="Bound"
      >m</a
      ><a name="7938"
      > </a
      ><a name="7939" class="Symbol"
      >:</a
      ><a name="7940"
      > </a
      ><a name="7941" href="Maps.html#3507" class="Function"
      >TotalMap</a
      ><a name="7949"
      > </a
      ><a name="7950" href="Maps.html#7933" class="Bound"
      >A</a
      ><a name="7951" class="Symbol"
      >)</a
      ><a name="7952"
      > </a
      ><a name="7953" class="Symbol"
      >(</a
      ><a name="7954" href="Maps.html#7954" class="Bound"
      >x</a
      ><a name="7955"
      > </a
      ><a name="7956" href="Maps.html#7956" class="Bound"
      >y</a
      ><a name="7957"
      > </a
      ><a name="7958" class="Symbol"
      >:</a
      ><a name="7959"
      > </a
      ><a name="7960" href="Maps.html#2398" class="Datatype"
      >Id</a
      ><a name="7962" class="Symbol"
      >)</a
      ><a name="7963"
      >
                </a
      ><a name="7980" class="Symbol"
      >&#8594;</a
      ><a name="7981"
      > </a
      ><a name="7982" class="Symbol"
      >(</a
      ><a name="7983" href="Maps.html#4177" class="Function"
      >update</a
      ><a name="7989"
      > </a
      ><a name="7990" href="Maps.html#7937" class="Bound"
      >m</a
      ><a name="7991"
      > </a
      ><a name="7992" href="Maps.html#7954" class="Bound"
      >x</a
      ><a name="7993"
      > </a
      ><a name="7994" class="Symbol"
      >(</a
      ><a name="7995" href="Maps.html#7937" class="Bound"
      >m</a
      ><a name="7996"
      > </a
      ><a name="7997" href="Maps.html#7954" class="Bound"
      >x</a
      ><a name="7998" class="Symbol"
      >))</a
      ><a name="8000"
      > </a
      ><a name="8001" href="Maps.html#7956" class="Bound"
      >y</a
      ><a name="8002"
      > </a
      ><a name="8003" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="8004"
      > </a
      ><a name="8005" href="Maps.html#7937" class="Bound"
      >m</a
      ><a name="8006"
      > </a
      ><a name="8007" href="Maps.html#7956" class="Bound"
      >y</a
      >
</pre><!--{% endraw %}-->

<div class="hidden">
<!--{% raw %}--><pre class="Agda">
  <a name="8057" href="Maps.html#8057" class="Function"
      >update-same&#8242;</a
      ><a name="8069"
      > </a
      ><a name="8070" class="Symbol"
      >:</a
      ><a name="8071"
      > </a
      ><a name="8072" class="Symbol"
      >&#8704;</a
      ><a name="8073"
      > </a
      ><a name="8074" class="Symbol"
      >{</a
      ><a name="8075" href="Maps.html#8075" class="Bound"
      >A</a
      ><a name="8076" class="Symbol"
      >}</a
      ><a name="8077"
      > </a
      ><a name="8078" class="Symbol"
      >(</a
      ><a name="8079" href="Maps.html#8079" class="Bound"
      >m</a
      ><a name="8080"
      > </a
      ><a name="8081" class="Symbol"
      >:</a
      ><a name="8082"
      > </a
      ><a name="8083" href="Maps.html#3507" class="Function"
      >TotalMap</a
      ><a name="8091"
      > </a
      ><a name="8092" href="Maps.html#8075" class="Bound"
      >A</a
      ><a name="8093" class="Symbol"
      >)</a
      ><a name="8094"
      > </a
      ><a name="8095" class="Symbol"
      >(</a
      ><a name="8096" href="Maps.html#8096" class="Bound"
      >x</a
      ><a name="8097"
      > </a
      ><a name="8098" href="Maps.html#8098" class="Bound"
      >y</a
      ><a name="8099"
      > </a
      ><a name="8100" class="Symbol"
      >:</a
      ><a name="8101"
      > </a
      ><a name="8102" href="Maps.html#2398" class="Datatype"
      >Id</a
      ><a name="8104" class="Symbol"
      >)</a
      ><a name="8105"
      >
               </a
      ><a name="8121" class="Symbol"
      >&#8594;</a
      ><a name="8122"
      > </a
      ><a name="8123" class="Symbol"
      >(</a
      ><a name="8124" href="Maps.html#4177" class="Function"
      >update</a
      ><a name="8130"
      > </a
      ><a name="8131" href="Maps.html#8079" class="Bound"
      >m</a
      ><a name="8132"
      > </a
      ><a name="8133" href="Maps.html#8096" class="Bound"
      >x</a
      ><a name="8134"
      > </a
      ><a name="8135" class="Symbol"
      >(</a
      ><a name="8136" href="Maps.html#8079" class="Bound"
      >m</a
      ><a name="8137"
      > </a
      ><a name="8138" href="Maps.html#8096" class="Bound"
      >x</a
      ><a name="8139" class="Symbol"
      >))</a
      ><a name="8141"
      > </a
      ><a name="8142" href="Maps.html#8098" class="Bound"
      >y</a
      ><a name="8143"
      > </a
      ><a name="8144" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="8145"
      > </a
      ><a name="8146" href="Maps.html#8079" class="Bound"
      >m</a
      ><a name="8147"
      > </a
      ><a name="8148" href="Maps.html#8098" class="Bound"
      >y</a
      ><a name="8149"
      >
  </a
      ><a name="8152" href="Maps.html#8057" class="Function"
      >update-same&#8242;</a
      ><a name="8164"
      > </a
      ><a name="8165" href="Maps.html#8165" class="Bound"
      >m</a
      ><a name="8166"
      > </a
      ><a name="8167" href="Maps.html#8167" class="Bound"
      >x</a
      ><a name="8168"
      > </a
      ><a name="8169" href="Maps.html#8169" class="Bound"
      >y</a
      ><a name="8170"
      >
    </a
      ><a name="8175" class="Keyword"
      >with</a
      ><a name="8179"
      > </a
      ><a name="8180" href="Maps.html#8167" class="Bound"
      >x</a
      ><a name="8181"
      > </a
      ><a name="8182" href="Maps.html#2452" class="Function Operator"
      >&#8799;</a
      ><a name="8183"
      > </a
      ><a name="8184" href="Maps.html#8169" class="Bound"
      >y</a
      ><a name="8185"
      >
  </a
      ><a name="8188" class="Symbol"
      >...</a
      ><a name="8191"
      > </a
      ><a name="8192" class="Symbol"
      >|</a
      ><a name="8193"
      > </a
      ><a name="8194" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="8197"
      > </a
      ><a name="8198" href="Maps.html#8198" class="Bound"
      >x=y</a
      ><a name="8201"
      > </a
      ><a name="8202" class="Keyword"
      >rewrite</a
      ><a name="8209"
      > </a
      ><a name="8210" href="Maps.html#8198" class="Bound"
      >x=y</a
      ><a name="8213"
      > </a
      ><a name="8214" class="Symbol"
      >=</a
      ><a name="8215"
      > </a
      ><a name="8216" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="8220"
      >
  </a
      ><a name="8223" class="Symbol"
      >...</a
      ><a name="8226"
      > </a
      ><a name="8227" class="Symbol"
      >|</a
      ><a name="8228"
      > </a
      ><a name="8229" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="8231"
      >  </a
      ><a name="8233" href="Maps.html#8233" class="Bound"
      >x&#8800;y</a
      ><a name="8236"
      > </a
      ><a name="8237" class="Symbol"
      >=</a
      ><a name="8238"
      > </a
      ><a name="8239" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      >
</pre><!--{% endraw %}-->
</div>

#### Exercise: 3 stars, recommended (update-permute)
Prove one final property of the `update` function: If we update a map
$$m$$ at two distinct keys, it doesn't matter in which order we do the
updates.

<!--{% raw %}--><pre class="Agda">
  <a name="8482" class="Keyword"
      >postulate</a
      ><a name="8491"
      >
    </a
      ><a name="8496" href="Maps.html#8496" class="Postulate"
      >update-permute</a
      ><a name="8510"
      > </a
      ><a name="8511" class="Symbol"
      >:</a
      ><a name="8512"
      > </a
      ><a name="8513" class="Symbol"
      >&#8704;</a
      ><a name="8514"
      > </a
      ><a name="8515" class="Symbol"
      >{</a
      ><a name="8516" href="Maps.html#8516" class="Bound"
      >A</a
      ><a name="8517"
      > </a
      ><a name="8518" href="Maps.html#8518" class="Bound"
      >v1</a
      ><a name="8520"
      > </a
      ><a name="8521" href="Maps.html#8521" class="Bound"
      >v2</a
      ><a name="8523" class="Symbol"
      >}</a
      ><a name="8524"
      > </a
      ><a name="8525" class="Symbol"
      >(</a
      ><a name="8526" href="Maps.html#8526" class="Bound"
      >m</a
      ><a name="8527"
      > </a
      ><a name="8528" class="Symbol"
      >:</a
      ><a name="8529"
      > </a
      ><a name="8530" href="Maps.html#3507" class="Function"
      >TotalMap</a
      ><a name="8538"
      > </a
      ><a name="8539" href="Maps.html#8516" class="Bound"
      >A</a
      ><a name="8540" class="Symbol"
      >)</a
      ><a name="8541"
      > </a
      ><a name="8542" class="Symbol"
      >(</a
      ><a name="8543" href="Maps.html#8543" class="Bound"
      >x1</a
      ><a name="8545"
      > </a
      ><a name="8546" href="Maps.html#8546" class="Bound"
      >x2</a
      ><a name="8548"
      > </a
      ><a name="8549" href="Maps.html#8549" class="Bound"
      >y</a
      ><a name="8550"
      > </a
      ><a name="8551" class="Symbol"
      >:</a
      ><a name="8552"
      > </a
      ><a name="8553" href="Maps.html#2398" class="Datatype"
      >Id</a
      ><a name="8555" class="Symbol"
      >)</a
      ><a name="8556"
      >
                   </a
      ><a name="8576" class="Symbol"
      >&#8594;</a
      ><a name="8577"
      > </a
      ><a name="8578" href="Maps.html#8543" class="Bound"
      >x1</a
      ><a name="8580"
      > </a
      ><a name="8581" href="https://agda.github.io/agda-stdlib/Relation.Binary.Core.html#4493" class="Function Operator"
      >&#8802;</a
      ><a name="8582"
      > </a
      ><a name="8583" href="Maps.html#8546" class="Bound"
      >x2</a
      ><a name="8585"
      > </a
      ><a name="8586" class="Symbol"
      >&#8594;</a
      ><a name="8587"
      > </a
      ><a name="8588" class="Symbol"
      >(</a
      ><a name="8589" href="Maps.html#4177" class="Function"
      >update</a
      ><a name="8595"
      > </a
      ><a name="8596" class="Symbol"
      >(</a
      ><a name="8597" href="Maps.html#4177" class="Function"
      >update</a
      ><a name="8603"
      > </a
      ><a name="8604" href="Maps.html#8526" class="Bound"
      >m</a
      ><a name="8605"
      > </a
      ><a name="8606" href="Maps.html#8546" class="Bound"
      >x2</a
      ><a name="8608"
      > </a
      ><a name="8609" href="Maps.html#8521" class="Bound"
      >v2</a
      ><a name="8611" class="Symbol"
      >)</a
      ><a name="8612"
      > </a
      ><a name="8613" href="Maps.html#8543" class="Bound"
      >x1</a
      ><a name="8615"
      > </a
      ><a name="8616" href="Maps.html#8518" class="Bound"
      >v1</a
      ><a name="8618" class="Symbol"
      >)</a
      ><a name="8619"
      > </a
      ><a name="8620" href="Maps.html#8549" class="Bound"
      >y</a
      ><a name="8621"
      >
                             </a
      ><a name="8651" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="8652"
      > </a
      ><a name="8653" class="Symbol"
      >(</a
      ><a name="8654" href="Maps.html#4177" class="Function"
      >update</a
      ><a name="8660"
      > </a
      ><a name="8661" class="Symbol"
      >(</a
      ><a name="8662" href="Maps.html#4177" class="Function"
      >update</a
      ><a name="8668"
      > </a
      ><a name="8669" href="Maps.html#8526" class="Bound"
      >m</a
      ><a name="8670"
      > </a
      ><a name="8671" href="Maps.html#8543" class="Bound"
      >x1</a
      ><a name="8673"
      > </a
      ><a name="8674" href="Maps.html#8518" class="Bound"
      >v1</a
      ><a name="8676" class="Symbol"
      >)</a
      ><a name="8677"
      > </a
      ><a name="8678" href="Maps.html#8546" class="Bound"
      >x2</a
      ><a name="8680"
      > </a
      ><a name="8681" href="Maps.html#8521" class="Bound"
      >v2</a
      ><a name="8683" class="Symbol"
      >)</a
      ><a name="8684"
      > </a
      ><a name="8685" href="Maps.html#8549" class="Bound"
      >y</a
      >
</pre><!--{% endraw %}-->

<div class="hidden">
<!--{% raw %}--><pre class="Agda">
  <a name="8735" href="Maps.html#8735" class="Function"
      >update-permute&#8242;</a
      ><a name="8750"
      > </a
      ><a name="8751" class="Symbol"
      >:</a
      ><a name="8752"
      > </a
      ><a name="8753" class="Symbol"
      >&#8704;</a
      ><a name="8754"
      > </a
      ><a name="8755" class="Symbol"
      >{</a
      ><a name="8756" href="Maps.html#8756" class="Bound"
      >A</a
      ><a name="8757"
      > </a
      ><a name="8758" href="Maps.html#8758" class="Bound"
      >v1</a
      ><a name="8760"
      > </a
      ><a name="8761" href="Maps.html#8761" class="Bound"
      >v2</a
      ><a name="8763" class="Symbol"
      >}</a
      ><a name="8764"
      > </a
      ><a name="8765" class="Symbol"
      >(</a
      ><a name="8766" href="Maps.html#8766" class="Bound"
      >m</a
      ><a name="8767"
      > </a
      ><a name="8768" class="Symbol"
      >:</a
      ><a name="8769"
      > </a
      ><a name="8770" href="Maps.html#3507" class="Function"
      >TotalMap</a
      ><a name="8778"
      > </a
      ><a name="8779" href="Maps.html#8756" class="Bound"
      >A</a
      ><a name="8780" class="Symbol"
      >)</a
      ><a name="8781"
      > </a
      ><a name="8782" class="Symbol"
      >(</a
      ><a name="8783" href="Maps.html#8783" class="Bound"
      >x1</a
      ><a name="8785"
      > </a
      ><a name="8786" href="Maps.html#8786" class="Bound"
      >x2</a
      ><a name="8788"
      > </a
      ><a name="8789" href="Maps.html#8789" class="Bound"
      >y</a
      ><a name="8790"
      > </a
      ><a name="8791" class="Symbol"
      >:</a
      ><a name="8792"
      > </a
      ><a name="8793" href="Maps.html#2398" class="Datatype"
      >Id</a
      ><a name="8795" class="Symbol"
      >)</a
      ><a name="8796"
      >
                  </a
      ><a name="8815" class="Symbol"
      >&#8594;</a
      ><a name="8816"
      > </a
      ><a name="8817" href="Maps.html#8783" class="Bound"
      >x1</a
      ><a name="8819"
      > </a
      ><a name="8820" href="https://agda.github.io/agda-stdlib/Relation.Binary.Core.html#4493" class="Function Operator"
      >&#8802;</a
      ><a name="8821"
      > </a
      ><a name="8822" href="Maps.html#8786" class="Bound"
      >x2</a
      ><a name="8824"
      > </a
      ><a name="8825" class="Symbol"
      >&#8594;</a
      ><a name="8826"
      > </a
      ><a name="8827" class="Symbol"
      >(</a
      ><a name="8828" href="Maps.html#4177" class="Function"
      >update</a
      ><a name="8834"
      > </a
      ><a name="8835" class="Symbol"
      >(</a
      ><a name="8836" href="Maps.html#4177" class="Function"
      >update</a
      ><a name="8842"
      > </a
      ><a name="8843" href="Maps.html#8766" class="Bound"
      >m</a
      ><a name="8844"
      > </a
      ><a name="8845" href="Maps.html#8786" class="Bound"
      >x2</a
      ><a name="8847"
      > </a
      ><a name="8848" href="Maps.html#8761" class="Bound"
      >v2</a
      ><a name="8850" class="Symbol"
      >)</a
      ><a name="8851"
      > </a
      ><a name="8852" href="Maps.html#8783" class="Bound"
      >x1</a
      ><a name="8854"
      > </a
      ><a name="8855" href="Maps.html#8758" class="Bound"
      >v1</a
      ><a name="8857" class="Symbol"
      >)</a
      ><a name="8858"
      > </a
      ><a name="8859" href="Maps.html#8789" class="Bound"
      >y</a
      ><a name="8860"
      >
                            </a
      ><a name="8889" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="8890"
      > </a
      ><a name="8891" class="Symbol"
      >(</a
      ><a name="8892" href="Maps.html#4177" class="Function"
      >update</a
      ><a name="8898"
      > </a
      ><a name="8899" class="Symbol"
      >(</a
      ><a name="8900" href="Maps.html#4177" class="Function"
      >update</a
      ><a name="8906"
      > </a
      ><a name="8907" href="Maps.html#8766" class="Bound"
      >m</a
      ><a name="8908"
      > </a
      ><a name="8909" href="Maps.html#8783" class="Bound"
      >x1</a
      ><a name="8911"
      > </a
      ><a name="8912" href="Maps.html#8758" class="Bound"
      >v1</a
      ><a name="8914" class="Symbol"
      >)</a
      ><a name="8915"
      > </a
      ><a name="8916" href="Maps.html#8786" class="Bound"
      >x2</a
      ><a name="8918"
      > </a
      ><a name="8919" href="Maps.html#8761" class="Bound"
      >v2</a
      ><a name="8921" class="Symbol"
      >)</a
      ><a name="8922"
      > </a
      ><a name="8923" href="Maps.html#8789" class="Bound"
      >y</a
      ><a name="8924"
      >
  </a
      ><a name="8927" href="Maps.html#8735" class="Function"
      >update-permute&#8242;</a
      ><a name="8942"
      > </a
      ><a name="8943" class="Symbol"
      >{</a
      ><a name="8944" href="Maps.html#8944" class="Bound"
      >A</a
      ><a name="8945" class="Symbol"
      >}</a
      ><a name="8946"
      > </a
      ><a name="8947" class="Symbol"
      >{</a
      ><a name="8948" href="Maps.html#8948" class="Bound"
      >v1</a
      ><a name="8950" class="Symbol"
      >}</a
      ><a name="8951"
      > </a
      ><a name="8952" class="Symbol"
      >{</a
      ><a name="8953" href="Maps.html#8953" class="Bound"
      >v2</a
      ><a name="8955" class="Symbol"
      >}</a
      ><a name="8956"
      > </a
      ><a name="8957" href="Maps.html#8957" class="Bound"
      >m</a
      ><a name="8958"
      > </a
      ><a name="8959" href="Maps.html#8959" class="Bound"
      >x1</a
      ><a name="8961"
      > </a
      ><a name="8962" href="Maps.html#8962" class="Bound"
      >x2</a
      ><a name="8964"
      > </a
      ><a name="8965" href="Maps.html#8965" class="Bound"
      >y</a
      ><a name="8966"
      > </a
      ><a name="8967" href="Maps.html#8967" class="Bound"
      >x1&#8800;x2</a
      ><a name="8972"
      >
    </a
      ><a name="8977" class="Keyword"
      >with</a
      ><a name="8981"
      > </a
      ><a name="8982" href="Maps.html#8959" class="Bound"
      >x1</a
      ><a name="8984"
      > </a
      ><a name="8985" href="Maps.html#2452" class="Function Operator"
      >&#8799;</a
      ><a name="8986"
      > </a
      ><a name="8987" href="Maps.html#8965" class="Bound"
      >y</a
      ><a name="8988"
      > </a
      ><a name="8989" class="Symbol"
      >|</a
      ><a name="8990"
      > </a
      ><a name="8991" href="Maps.html#8962" class="Bound"
      >x2</a
      ><a name="8993"
      > </a
      ><a name="8994" href="Maps.html#2452" class="Function Operator"
      >&#8799;</a
      ><a name="8995"
      > </a
      ><a name="8996" href="Maps.html#8965" class="Bound"
      >y</a
      ><a name="8997"
      >
  </a
      ><a name="9000" class="Symbol"
      >...</a
      ><a name="9003"
      > </a
      ><a name="9004" class="Symbol"
      >|</a
      ><a name="9005"
      > </a
      ><a name="9006" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="9009"
      > </a
      ><a name="9010" href="Maps.html#9010" class="Bound"
      >x1=y</a
      ><a name="9014"
      > </a
      ><a name="9015" class="Symbol"
      >|</a
      ><a name="9016"
      > </a
      ><a name="9017" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="9020"
      > </a
      ><a name="9021" href="Maps.html#9021" class="Bound"
      >x2=y</a
      ><a name="9025"
      > </a
      ><a name="9026" class="Symbol"
      >=</a
      ><a name="9027"
      > </a
      ><a name="9028" href="https://agda.github.io/agda-stdlib/Data.Empty.html#348" class="Function"
      >&#8869;-elim</a
      ><a name="9034"
      > </a
      ><a name="9035" class="Symbol"
      >(</a
      ><a name="9036" href="Maps.html#8967" class="Bound"
      >x1&#8800;x2</a
      ><a name="9041"
      > </a
      ><a name="9042" class="Symbol"
      >(</a
      ><a name="9043" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#632" class="Function"
      >trans</a
      ><a name="9048"
      > </a
      ><a name="9049" href="Maps.html#9010" class="Bound"
      >x1=y</a
      ><a name="9053"
      > </a
      ><a name="9054" class="Symbol"
      >(</a
      ><a name="9055" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#565" class="Function"
      >sym</a
      ><a name="9058"
      > </a
      ><a name="9059" href="Maps.html#9021" class="Bound"
      >x2=y</a
      ><a name="9063" class="Symbol"
      >)))</a
      ><a name="9066"
      >
  </a
      ><a name="9069" class="Symbol"
      >...</a
      ><a name="9072"
      > </a
      ><a name="9073" class="Symbol"
      >|</a
      ><a name="9074"
      > </a
      ><a name="9075" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="9077"
      >  </a
      ><a name="9079" href="Maps.html#9079" class="Bound"
      >x1&#8800;y</a
      ><a name="9083"
      > </a
      ><a name="9084" class="Symbol"
      >|</a
      ><a name="9085"
      > </a
      ><a name="9086" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="9089"
      > </a
      ><a name="9090" href="Maps.html#9090" class="Bound"
      >x2=y</a
      ><a name="9094"
      > </a
      ><a name="9095" class="Keyword"
      >rewrite</a
      ><a name="9102"
      > </a
      ><a name="9103" href="Maps.html#9090" class="Bound"
      >x2=y</a
      ><a name="9107"
      > </a
      ><a name="9108" class="Symbol"
      >=</a
      ><a name="9109"
      > </a
      ><a name="9110" href="Maps.html#6263" class="Function"
      >update-eq&#8242;</a
      ><a name="9120"
      > </a
      ><a name="9121" href="Maps.html#8957" class="Bound"
      >m</a
      ><a name="9122"
      > </a
      ><a name="9123" href="Maps.html#8965" class="Bound"
      >y</a
      ><a name="9124"
      >
  </a
      ><a name="9127" class="Symbol"
      >...</a
      ><a name="9130"
      > </a
      ><a name="9131" class="Symbol"
      >|</a
      ><a name="9132"
      > </a
      ><a name="9133" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="9136"
      > </a
      ><a name="9137" href="Maps.html#9137" class="Bound"
      >x1=y</a
      ><a name="9141"
      > </a
      ><a name="9142" class="Symbol"
      >|</a
      ><a name="9143"
      > </a
      ><a name="9144" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="9146"
      >  </a
      ><a name="9148" href="Maps.html#9148" class="Bound"
      >x2&#8800;y</a
      ><a name="9152"
      > </a
      ><a name="9153" class="Keyword"
      >rewrite</a
      ><a name="9160"
      > </a
      ><a name="9161" href="Maps.html#9137" class="Bound"
      >x1=y</a
      ><a name="9165"
      > </a
      ><a name="9166" class="Symbol"
      >=</a
      ><a name="9167"
      > </a
      ><a name="9168" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#565" class="Function"
      >sym</a
      ><a name="9171"
      > </a
      ><a name="9172" class="Symbol"
      >(</a
      ><a name="9173" href="Maps.html#6263" class="Function"
      >update-eq&#8242;</a
      ><a name="9183"
      > </a
      ><a name="9184" href="Maps.html#8957" class="Bound"
      >m</a
      ><a name="9185"
      > </a
      ><a name="9186" href="Maps.html#8965" class="Bound"
      >y</a
      ><a name="9187" class="Symbol"
      >)</a
      ><a name="9188"
      >
  </a
      ><a name="9191" class="Symbol"
      >...</a
      ><a name="9194"
      > </a
      ><a name="9195" class="Symbol"
      >|</a
      ><a name="9196"
      > </a
      ><a name="9197" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="9199"
      >  </a
      ><a name="9201" href="Maps.html#9201" class="Bound"
      >x1&#8800;y</a
      ><a name="9205"
      > </a
      ><a name="9206" class="Symbol"
      >|</a
      ><a name="9207"
      > </a
      ><a name="9208" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="9210"
      >  </a
      ><a name="9212" href="Maps.html#9212" class="Bound"
      >x2&#8800;y</a
      ><a name="9216"
      > </a
      ><a name="9217" class="Symbol"
      >=</a
      ><a name="9218"
      >
    </a
      ><a name="9223" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#632" class="Function"
      >trans</a
      ><a name="9228"
      > </a
      ><a name="9229" class="Symbol"
      >(</a
      ><a name="9230" href="Maps.html#6688" class="Function"
      >update-neq</a
      ><a name="9240"
      > </a
      ><a name="9241" href="Maps.html#8957" class="Bound"
      >m</a
      ><a name="9242"
      > </a
      ><a name="9243" href="Maps.html#8962" class="Bound"
      >x2</a
      ><a name="9245"
      > </a
      ><a name="9246" href="Maps.html#8965" class="Bound"
      >y</a
      ><a name="9247"
      > </a
      ><a name="9248" href="Maps.html#9212" class="Bound"
      >x2&#8800;y</a
      ><a name="9252" class="Symbol"
      >)</a
      ><a name="9253"
      > </a
      ><a name="9254" class="Symbol"
      >(</a
      ><a name="9255" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#565" class="Function"
      >sym</a
      ><a name="9258"
      > </a
      ><a name="9259" class="Symbol"
      >(</a
      ><a name="9260" href="Maps.html#6688" class="Function"
      >update-neq</a
      ><a name="9270"
      > </a
      ><a name="9271" href="Maps.html#8957" class="Bound"
      >m</a
      ><a name="9272"
      > </a
      ><a name="9273" href="Maps.html#8959" class="Bound"
      >x1</a
      ><a name="9275"
      > </a
      ><a name="9276" href="Maps.html#8965" class="Bound"
      >y</a
      ><a name="9277"
      > </a
      ><a name="9278" href="Maps.html#9201" class="Bound"
      >x1&#8800;y</a
      ><a name="9282" class="Symbol"
      >))</a
      >
</pre><!--{% endraw %}-->
</div>

## Partial maps

Finally, we define _partial maps_ on top of total maps.  A partial
map with elements of type `A` is simply a total map with elements
of type `Maybe A` and default element `nothing`.

<!--{% raw %}--><pre class="Agda">
<a name="9517" href="Maps.html#9517" class="Function"
      >PartialMap</a
      ><a name="9527"
      > </a
      ><a name="9528" class="Symbol"
      >:</a
      ><a name="9529"
      > </a
      ><a name="9530" class="PrimitiveType"
      >Set</a
      ><a name="9533"
      > </a
      ><a name="9534" class="Symbol"
      >&#8594;</a
      ><a name="9535"
      > </a
      ><a name="9536" class="PrimitiveType"
      >Set</a
      ><a name="9539"
      >
</a
      ><a name="9540" href="Maps.html#9517" class="Function"
      >PartialMap</a
      ><a name="9550"
      > </a
      ><a name="9551" href="Maps.html#9551" class="Bound"
      >A</a
      ><a name="9552"
      > </a
      ><a name="9553" class="Symbol"
      >=</a
      ><a name="9554"
      > </a
      ><a name="9555" href="Maps.html#3507" class="Function"
      >TotalMap</a
      ><a name="9563"
      > </a
      ><a name="9564" class="Symbol"
      >(</a
      ><a name="9565" href="https://agda.github.io/agda-stdlib/Data.Maybe.Base.html#335" class="Datatype"
      >Maybe</a
      ><a name="9570"
      > </a
      ><a name="9571" href="Maps.html#9551" class="Bound"
      >A</a
      ><a name="9572" class="Symbol"
      >)</a
      >
</pre><!--{% endraw %}-->

<!--{% raw %}--><pre class="Agda">
<a name="9599" class="Keyword"
      >module</a
      ><a name="9605"
      > </a
      ><a name="9606" href="Maps.html#9606" class="Module"
      >PartialMap</a
      ><a name="9616"
      > </a
      ><a name="9617" class="Keyword"
      >where</a
      >
</pre><!--{% endraw %}-->

<!--{% raw %}--><pre class="Agda">
  <a name="9650" href="Maps.html#9650" class="Function"
      >empty</a
      ><a name="9655"
      > </a
      ><a name="9656" class="Symbol"
      >:</a
      ><a name="9657"
      > </a
      ><a name="9658" class="Symbol"
      >&#8704;</a
      ><a name="9659"
      > </a
      ><a name="9660" class="Symbol"
      >{</a
      ><a name="9661" href="Maps.html#9661" class="Bound"
      >A</a
      ><a name="9662" class="Symbol"
      >}</a
      ><a name="9663"
      > </a
      ><a name="9664" class="Symbol"
      >&#8594;</a
      ><a name="9665"
      > </a
      ><a name="9666" href="Maps.html#9517" class="Function"
      >PartialMap</a
      ><a name="9676"
      > </a
      ><a name="9677" href="Maps.html#9661" class="Bound"
      >A</a
      ><a name="9678"
      >
  </a
      ><a name="9681" href="Maps.html#9650" class="Function"
      >empty</a
      ><a name="9686"
      > </a
      ><a name="9687" class="Symbol"
      >=</a
      ><a name="9688"
      > </a
      ><a name="9689" href="Maps.html#3889" class="Function"
      >TotalMap.empty</a
      ><a name="9703"
      > </a
      ><a name="9704" href="https://agda.github.io/agda-stdlib/Data.Maybe.Base.html#403" class="InductiveConstructor"
      >nothing</a
      >
</pre><!--{% endraw %}-->

<!--{% raw %}--><pre class="Agda">
  <a name="9739" href="Maps.html#9739" class="Function"
      >update</a
      ><a name="9745"
      > </a
      ><a name="9746" class="Symbol"
      >:</a
      ><a name="9747"
      > </a
      ><a name="9748" class="Symbol"
      >&#8704;</a
      ><a name="9749"
      > </a
      ><a name="9750" class="Symbol"
      >{</a
      ><a name="9751" href="Maps.html#9751" class="Bound"
      >A</a
      ><a name="9752" class="Symbol"
      >}</a
      ><a name="9753"
      > </a
      ><a name="9754" class="Symbol"
      >(</a
      ><a name="9755" href="Maps.html#9755" class="Bound"
      >m</a
      ><a name="9756"
      > </a
      ><a name="9757" class="Symbol"
      >:</a
      ><a name="9758"
      > </a
      ><a name="9759" href="Maps.html#9517" class="Function"
      >PartialMap</a
      ><a name="9769"
      > </a
      ><a name="9770" href="Maps.html#9751" class="Bound"
      >A</a
      ><a name="9771" class="Symbol"
      >)</a
      ><a name="9772"
      > </a
      ><a name="9773" class="Symbol"
      >(</a
      ><a name="9774" href="Maps.html#9774" class="Bound"
      >x</a
      ><a name="9775"
      > </a
      ><a name="9776" class="Symbol"
      >:</a
      ><a name="9777"
      > </a
      ><a name="9778" href="Maps.html#2398" class="Datatype"
      >Id</a
      ><a name="9780" class="Symbol"
      >)</a
      ><a name="9781"
      > </a
      ><a name="9782" class="Symbol"
      >(</a
      ><a name="9783" href="Maps.html#9783" class="Bound"
      >v</a
      ><a name="9784"
      > </a
      ><a name="9785" class="Symbol"
      >:</a
      ><a name="9786"
      > </a
      ><a name="9787" href="Maps.html#9751" class="Bound"
      >A</a
      ><a name="9788" class="Symbol"
      >)</a
      ><a name="9789"
      > </a
      ><a name="9790" class="Symbol"
      >&#8594;</a
      ><a name="9791"
      > </a
      ><a name="9792" href="Maps.html#9517" class="Function"
      >PartialMap</a
      ><a name="9802"
      > </a
      ><a name="9803" href="Maps.html#9751" class="Bound"
      >A</a
      ><a name="9804"
      >
  </a
      ><a name="9807" href="Maps.html#9739" class="Function"
      >update</a
      ><a name="9813"
      > </a
      ><a name="9814" href="Maps.html#9814" class="Bound"
      >m</a
      ><a name="9815"
      > </a
      ><a name="9816" href="Maps.html#9816" class="Bound"
      >x</a
      ><a name="9817"
      > </a
      ><a name="9818" href="Maps.html#9818" class="Bound"
      >v</a
      ><a name="9819"
      > </a
      ><a name="9820" class="Symbol"
      >=</a
      ><a name="9821"
      > </a
      ><a name="9822" href="Maps.html#4177" class="Function"
      >TotalMap.update</a
      ><a name="9837"
      > </a
      ><a name="9838" href="Maps.html#9814" class="Bound"
      >m</a
      ><a name="9839"
      > </a
      ><a name="9840" href="Maps.html#9816" class="Bound"
      >x</a
      ><a name="9841"
      > </a
      ><a name="9842" class="Symbol"
      >(</a
      ><a name="9843" href="https://agda.github.io/agda-stdlib/Data.Maybe.Base.html#373" class="InductiveConstructor"
      >just</a
      ><a name="9847"
      > </a
      ><a name="9848" href="Maps.html#9818" class="Bound"
      >v</a
      ><a name="9849" class="Symbol"
      >)</a
      >
</pre><!--{% endraw %}-->

We can now lift all of the basic lemmas about total maps to
partial maps.

<!--{% raw %}--><pre class="Agda">
  <a name="9953" href="Maps.html#9953" class="Function"
      >update-eq</a
      ><a name="9962"
      > </a
      ><a name="9963" class="Symbol"
      >:</a
      ><a name="9964"
      > </a
      ><a name="9965" class="Symbol"
      >&#8704;</a
      ><a name="9966"
      > </a
      ><a name="9967" class="Symbol"
      >{</a
      ><a name="9968" href="Maps.html#9968" class="Bound"
      >A</a
      ><a name="9969"
      > </a
      ><a name="9970" href="Maps.html#9970" class="Bound"
      >v</a
      ><a name="9971" class="Symbol"
      >}</a
      ><a name="9972"
      > </a
      ><a name="9973" class="Symbol"
      >(</a
      ><a name="9974" href="Maps.html#9974" class="Bound"
      >m</a
      ><a name="9975"
      > </a
      ><a name="9976" class="Symbol"
      >:</a
      ><a name="9977"
      > </a
      ><a name="9978" href="Maps.html#9517" class="Function"
      >PartialMap</a
      ><a name="9988"
      > </a
      ><a name="9989" href="Maps.html#9968" class="Bound"
      >A</a
      ><a name="9990" class="Symbol"
      >)</a
      ><a name="9991"
      > </a
      ><a name="9992" class="Symbol"
      >(</a
      ><a name="9993" href="Maps.html#9993" class="Bound"
      >x</a
      ><a name="9994"
      > </a
      ><a name="9995" class="Symbol"
      >:</a
      ><a name="9996"
      > </a
      ><a name="9997" href="Maps.html#2398" class="Datatype"
      >Id</a
      ><a name="9999" class="Symbol"
      >)</a
      ><a name="10000"
      >
            </a
      ><a name="10013" class="Symbol"
      >&#8594;</a
      ><a name="10014"
      > </a
      ><a name="10015" class="Symbol"
      >(</a
      ><a name="10016" href="Maps.html#9739" class="Function"
      >update</a
      ><a name="10022"
      > </a
      ><a name="10023" href="Maps.html#9974" class="Bound"
      >m</a
      ><a name="10024"
      > </a
      ><a name="10025" href="Maps.html#9993" class="Bound"
      >x</a
      ><a name="10026"
      > </a
      ><a name="10027" href="Maps.html#9970" class="Bound"
      >v</a
      ><a name="10028" class="Symbol"
      >)</a
      ><a name="10029"
      > </a
      ><a name="10030" href="Maps.html#9993" class="Bound"
      >x</a
      ><a name="10031"
      > </a
      ><a name="10032" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="10033"
      > </a
      ><a name="10034" href="https://agda.github.io/agda-stdlib/Data.Maybe.Base.html#373" class="InductiveConstructor"
      >just</a
      ><a name="10038"
      > </a
      ><a name="10039" href="Maps.html#9970" class="Bound"
      >v</a
      ><a name="10040"
      >
  </a
      ><a name="10043" href="Maps.html#9953" class="Function"
      >update-eq</a
      ><a name="10052"
      > </a
      ><a name="10053" href="Maps.html#10053" class="Bound"
      >m</a
      ><a name="10054"
      > </a
      ><a name="10055" href="Maps.html#10055" class="Bound"
      >x</a
      ><a name="10056"
      > </a
      ><a name="10057" class="Symbol"
      >=</a
      ><a name="10058"
      > </a
      ><a name="10059" href="Maps.html#6132" class="Postulate"
      >TotalMap.update-eq</a
      ><a name="10077"
      > </a
      ><a name="10078" href="Maps.html#10053" class="Bound"
      >m</a
      ><a name="10079"
      > </a
      ><a name="10080" href="Maps.html#10055" class="Bound"
      >x</a
      >
</pre><!--{% endraw %}-->

<!--{% raw %}--><pre class="Agda">
  <a name="10109" href="Maps.html#10109" class="Function"
      >update-neq</a
      ><a name="10119"
      > </a
      ><a name="10120" class="Symbol"
      >:</a
      ><a name="10121"
      > </a
      ><a name="10122" class="Symbol"
      >&#8704;</a
      ><a name="10123"
      > </a
      ><a name="10124" class="Symbol"
      >{</a
      ><a name="10125" href="Maps.html#10125" class="Bound"
      >A</a
      ><a name="10126"
      > </a
      ><a name="10127" href="Maps.html#10127" class="Bound"
      >v</a
      ><a name="10128" class="Symbol"
      >}</a
      ><a name="10129"
      > </a
      ><a name="10130" class="Symbol"
      >(</a
      ><a name="10131" href="Maps.html#10131" class="Bound"
      >m</a
      ><a name="10132"
      > </a
      ><a name="10133" class="Symbol"
      >:</a
      ><a name="10134"
      > </a
      ><a name="10135" href="Maps.html#9517" class="Function"
      >PartialMap</a
      ><a name="10145"
      > </a
      ><a name="10146" href="Maps.html#10125" class="Bound"
      >A</a
      ><a name="10147" class="Symbol"
      >)</a
      ><a name="10148"
      > </a
      ><a name="10149" class="Symbol"
      >(</a
      ><a name="10150" href="Maps.html#10150" class="Bound"
      >x</a
      ><a name="10151"
      > </a
      ><a name="10152" href="Maps.html#10152" class="Bound"
      >y</a
      ><a name="10153"
      > </a
      ><a name="10154" class="Symbol"
      >:</a
      ><a name="10155"
      > </a
      ><a name="10156" href="Maps.html#2398" class="Datatype"
      >Id</a
      ><a name="10158" class="Symbol"
      >)</a
      ><a name="10159"
      >
             </a
      ><a name="10173" class="Symbol"
      >&#8594;</a
      ><a name="10174"
      > </a
      ><a name="10175" href="Maps.html#10150" class="Bound"
      >x</a
      ><a name="10176"
      > </a
      ><a name="10177" href="https://agda.github.io/agda-stdlib/Relation.Binary.Core.html#4493" class="Function Operator"
      >&#8802;</a
      ><a name="10178"
      > </a
      ><a name="10179" href="Maps.html#10152" class="Bound"
      >y</a
      ><a name="10180"
      > </a
      ><a name="10181" class="Symbol"
      >&#8594;</a
      ><a name="10182"
      > </a
      ><a name="10183" class="Symbol"
      >(</a
      ><a name="10184" href="Maps.html#9739" class="Function"
      >update</a
      ><a name="10190"
      > </a
      ><a name="10191" href="Maps.html#10131" class="Bound"
      >m</a
      ><a name="10192"
      > </a
      ><a name="10193" href="Maps.html#10150" class="Bound"
      >x</a
      ><a name="10194"
      > </a
      ><a name="10195" href="Maps.html#10127" class="Bound"
      >v</a
      ><a name="10196" class="Symbol"
      >)</a
      ><a name="10197"
      > </a
      ><a name="10198" href="Maps.html#10152" class="Bound"
      >y</a
      ><a name="10199"
      > </a
      ><a name="10200" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="10201"
      > </a
      ><a name="10202" href="Maps.html#10131" class="Bound"
      >m</a
      ><a name="10203"
      > </a
      ><a name="10204" href="Maps.html#10152" class="Bound"
      >y</a
      ><a name="10205"
      >
  </a
      ><a name="10208" href="Maps.html#10109" class="Function"
      >update-neq</a
      ><a name="10218"
      > </a
      ><a name="10219" href="Maps.html#10219" class="Bound"
      >m</a
      ><a name="10220"
      > </a
      ><a name="10221" href="Maps.html#10221" class="Bound"
      >x</a
      ><a name="10222"
      > </a
      ><a name="10223" href="Maps.html#10223" class="Bound"
      >y</a
      ><a name="10224"
      > </a
      ><a name="10225" href="Maps.html#10225" class="Bound"
      >x&#8800;y</a
      ><a name="10228"
      > </a
      ><a name="10229" class="Symbol"
      >=</a
      ><a name="10230"
      > </a
      ><a name="10231" href="Maps.html#6688" class="Function"
      >TotalMap.update-neq</a
      ><a name="10250"
      > </a
      ><a name="10251" href="Maps.html#10219" class="Bound"
      >m</a
      ><a name="10252"
      > </a
      ><a name="10253" href="Maps.html#10221" class="Bound"
      >x</a
      ><a name="10254"
      > </a
      ><a name="10255" href="Maps.html#10223" class="Bound"
      >y</a
      ><a name="10256"
      > </a
      ><a name="10257" href="Maps.html#10225" class="Bound"
      >x&#8800;y</a
      >
</pre><!--{% endraw %}-->

<!--{% raw %}--><pre class="Agda">
  <a name="10288" href="Maps.html#10288" class="Function"
      >update-shadow</a
      ><a name="10301"
      > </a
      ><a name="10302" class="Symbol"
      >:</a
      ><a name="10303"
      > </a
      ><a name="10304" class="Symbol"
      >&#8704;</a
      ><a name="10305"
      > </a
      ><a name="10306" class="Symbol"
      >{</a
      ><a name="10307" href="Maps.html#10307" class="Bound"
      >A</a
      ><a name="10308"
      > </a
      ><a name="10309" href="Maps.html#10309" class="Bound"
      >v1</a
      ><a name="10311"
      > </a
      ><a name="10312" href="Maps.html#10312" class="Bound"
      >v2</a
      ><a name="10314" class="Symbol"
      >}</a
      ><a name="10315"
      > </a
      ><a name="10316" class="Symbol"
      >(</a
      ><a name="10317" href="Maps.html#10317" class="Bound"
      >m</a
      ><a name="10318"
      > </a
      ><a name="10319" class="Symbol"
      >:</a
      ><a name="10320"
      > </a
      ><a name="10321" href="Maps.html#9517" class="Function"
      >PartialMap</a
      ><a name="10331"
      > </a
      ><a name="10332" href="Maps.html#10307" class="Bound"
      >A</a
      ><a name="10333" class="Symbol"
      >)</a
      ><a name="10334"
      > </a
      ><a name="10335" class="Symbol"
      >(</a
      ><a name="10336" href="Maps.html#10336" class="Bound"
      >x</a
      ><a name="10337"
      > </a
      ><a name="10338" href="Maps.html#10338" class="Bound"
      >y</a
      ><a name="10339"
      > </a
      ><a name="10340" class="Symbol"
      >:</a
      ><a name="10341"
      > </a
      ><a name="10342" href="Maps.html#2398" class="Datatype"
      >Id</a
      ><a name="10344" class="Symbol"
      >)</a
      ><a name="10345"
      >
                </a
      ><a name="10362" class="Symbol"
      >&#8594;</a
      ><a name="10363"
      > </a
      ><a name="10364" class="Symbol"
      >(</a
      ><a name="10365" href="Maps.html#9739" class="Function"
      >update</a
      ><a name="10371"
      > </a
      ><a name="10372" class="Symbol"
      >(</a
      ><a name="10373" href="Maps.html#9739" class="Function"
      >update</a
      ><a name="10379"
      > </a
      ><a name="10380" href="Maps.html#10317" class="Bound"
      >m</a
      ><a name="10381"
      > </a
      ><a name="10382" href="Maps.html#10336" class="Bound"
      >x</a
      ><a name="10383"
      > </a
      ><a name="10384" href="Maps.html#10309" class="Bound"
      >v1</a
      ><a name="10386" class="Symbol"
      >)</a
      ><a name="10387"
      > </a
      ><a name="10388" href="Maps.html#10336" class="Bound"
      >x</a
      ><a name="10389"
      > </a
      ><a name="10390" href="Maps.html#10312" class="Bound"
      >v2</a
      ><a name="10392" class="Symbol"
      >)</a
      ><a name="10393"
      > </a
      ><a name="10394" href="Maps.html#10338" class="Bound"
      >y</a
      ><a name="10395"
      > </a
      ><a name="10396" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="10397"
      > </a
      ><a name="10398" class="Symbol"
      >(</a
      ><a name="10399" href="Maps.html#9739" class="Function"
      >update</a
      ><a name="10405"
      > </a
      ><a name="10406" href="Maps.html#10317" class="Bound"
      >m</a
      ><a name="10407"
      > </a
      ><a name="10408" href="Maps.html#10336" class="Bound"
      >x</a
      ><a name="10409"
      > </a
      ><a name="10410" href="Maps.html#10312" class="Bound"
      >v2</a
      ><a name="10412" class="Symbol"
      >)</a
      ><a name="10413"
      > </a
      ><a name="10414" href="Maps.html#10338" class="Bound"
      >y</a
      ><a name="10415"
      >
  </a
      ><a name="10418" href="Maps.html#10288" class="Function"
      >update-shadow</a
      ><a name="10431"
      > </a
      ><a name="10432" href="Maps.html#10432" class="Bound"
      >m</a
      ><a name="10433"
      > </a
      ><a name="10434" href="Maps.html#10434" class="Bound"
      >x</a
      ><a name="10435"
      > </a
      ><a name="10436" href="Maps.html#10436" class="Bound"
      >y</a
      ><a name="10437"
      > </a
      ><a name="10438" class="Symbol"
      >=</a
      ><a name="10439"
      > </a
      ><a name="10440" href="Maps.html#7260" class="Postulate"
      >TotalMap.update-shadow</a
      ><a name="10462"
      > </a
      ><a name="10463" href="Maps.html#10432" class="Bound"
      >m</a
      ><a name="10464"
      > </a
      ><a name="10465" href="Maps.html#10434" class="Bound"
      >x</a
      ><a name="10466"
      > </a
      ><a name="10467" href="Maps.html#10436" class="Bound"
      >y</a
      >
</pre><!--{% endraw %}-->

<!--{% raw %}--><pre class="Agda">
  <a name="10496" href="Maps.html#10496" class="Function"
      >update-same</a
      ><a name="10507"
      > </a
      ><a name="10508" class="Symbol"
      >:</a
      ><a name="10509"
      > </a
      ><a name="10510" class="Symbol"
      >&#8704;</a
      ><a name="10511"
      > </a
      ><a name="10512" class="Symbol"
      >{</a
      ><a name="10513" href="Maps.html#10513" class="Bound"
      >A</a
      ><a name="10514"
      > </a
      ><a name="10515" href="Maps.html#10515" class="Bound"
      >v</a
      ><a name="10516" class="Symbol"
      >}</a
      ><a name="10517"
      > </a
      ><a name="10518" class="Symbol"
      >(</a
      ><a name="10519" href="Maps.html#10519" class="Bound"
      >m</a
      ><a name="10520"
      > </a
      ><a name="10521" class="Symbol"
      >:</a
      ><a name="10522"
      > </a
      ><a name="10523" href="Maps.html#9517" class="Function"
      >PartialMap</a
      ><a name="10533"
      > </a
      ><a name="10534" href="Maps.html#10513" class="Bound"
      >A</a
      ><a name="10535" class="Symbol"
      >)</a
      ><a name="10536"
      > </a
      ><a name="10537" class="Symbol"
      >(</a
      ><a name="10538" href="Maps.html#10538" class="Bound"
      >x</a
      ><a name="10539"
      > </a
      ><a name="10540" href="Maps.html#10540" class="Bound"
      >y</a
      ><a name="10541"
      > </a
      ><a name="10542" class="Symbol"
      >:</a
      ><a name="10543"
      > </a
      ><a name="10544" href="Maps.html#2398" class="Datatype"
      >Id</a
      ><a name="10546" class="Symbol"
      >)</a
      ><a name="10547"
      >
              </a
      ><a name="10562" class="Symbol"
      >&#8594;</a
      ><a name="10563"
      > </a
      ><a name="10564" href="Maps.html#10519" class="Bound"
      >m</a
      ><a name="10565"
      > </a
      ><a name="10566" href="Maps.html#10538" class="Bound"
      >x</a
      ><a name="10567"
      > </a
      ><a name="10568" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="10569"
      > </a
      ><a name="10570" href="https://agda.github.io/agda-stdlib/Data.Maybe.Base.html#373" class="InductiveConstructor"
      >just</a
      ><a name="10574"
      > </a
      ><a name="10575" href="Maps.html#10515" class="Bound"
      >v</a
      ><a name="10576"
      >
              </a
      ><a name="10591" class="Symbol"
      >&#8594;</a
      ><a name="10592"
      > </a
      ><a name="10593" class="Symbol"
      >(</a
      ><a name="10594" href="Maps.html#9739" class="Function"
      >update</a
      ><a name="10600"
      > </a
      ><a name="10601" href="Maps.html#10519" class="Bound"
      >m</a
      ><a name="10602"
      > </a
      ><a name="10603" href="Maps.html#10538" class="Bound"
      >x</a
      ><a name="10604"
      > </a
      ><a name="10605" href="Maps.html#10515" class="Bound"
      >v</a
      ><a name="10606" class="Symbol"
      >)</a
      ><a name="10607"
      > </a
      ><a name="10608" href="Maps.html#10540" class="Bound"
      >y</a
      ><a name="10609"
      > </a
      ><a name="10610" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="10611"
      > </a
      ><a name="10612" href="Maps.html#10519" class="Bound"
      >m</a
      ><a name="10613"
      > </a
      ><a name="10614" href="Maps.html#10540" class="Bound"
      >y</a
      ><a name="10615"
      >
  </a
      ><a name="10618" href="Maps.html#10496" class="Function"
      >update-same</a
      ><a name="10629"
      > </a
      ><a name="10630" href="Maps.html#10630" class="Bound"
      >m</a
      ><a name="10631"
      > </a
      ><a name="10632" href="Maps.html#10632" class="Bound"
      >x</a
      ><a name="10633"
      > </a
      ><a name="10634" href="Maps.html#10634" class="Bound"
      >y</a
      ><a name="10635"
      > </a
      ><a name="10636" href="Maps.html#10636" class="Bound"
      >mx=v</a
      ><a name="10640"
      > </a
      ><a name="10641" class="Keyword"
      >rewrite</a
      ><a name="10648"
      > </a
      ><a name="10649" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#565" class="Function"
      >sym</a
      ><a name="10652"
      > </a
      ><a name="10653" href="Maps.html#10636" class="Bound"
      >mx=v</a
      ><a name="10657"
      > </a
      ><a name="10658" class="Symbol"
      >=</a
      ><a name="10659"
      > </a
      ><a name="10660" href="Maps.html#7916" class="Postulate"
      >TotalMap.update-same</a
      ><a name="10680"
      > </a
      ><a name="10681" href="Maps.html#10630" class="Bound"
      >m</a
      ><a name="10682"
      > </a
      ><a name="10683" href="Maps.html#10632" class="Bound"
      >x</a
      ><a name="10684"
      > </a
      ><a name="10685" href="Maps.html#10634" class="Bound"
      >y</a
      >
</pre><!--{% endraw %}-->

<!--{% raw %}--><pre class="Agda">
  <a name="10714" href="Maps.html#10714" class="Function"
      >update-permute</a
      ><a name="10728"
      > </a
      ><a name="10729" class="Symbol"
      >:</a
      ><a name="10730"
      > </a
      ><a name="10731" class="Symbol"
      >&#8704;</a
      ><a name="10732"
      > </a
      ><a name="10733" class="Symbol"
      >{</a
      ><a name="10734" href="Maps.html#10734" class="Bound"
      >A</a
      ><a name="10735"
      > </a
      ><a name="10736" href="Maps.html#10736" class="Bound"
      >v1</a
      ><a name="10738"
      > </a
      ><a name="10739" href="Maps.html#10739" class="Bound"
      >v2</a
      ><a name="10741" class="Symbol"
      >}</a
      ><a name="10742"
      > </a
      ><a name="10743" class="Symbol"
      >(</a
      ><a name="10744" href="Maps.html#10744" class="Bound"
      >m</a
      ><a name="10745"
      > </a
      ><a name="10746" class="Symbol"
      >:</a
      ><a name="10747"
      > </a
      ><a name="10748" href="Maps.html#9517" class="Function"
      >PartialMap</a
      ><a name="10758"
      > </a
      ><a name="10759" href="Maps.html#10734" class="Bound"
      >A</a
      ><a name="10760" class="Symbol"
      >)</a
      ><a name="10761"
      > </a
      ><a name="10762" class="Symbol"
      >(</a
      ><a name="10763" href="Maps.html#10763" class="Bound"
      >x1</a
      ><a name="10765"
      > </a
      ><a name="10766" href="Maps.html#10766" class="Bound"
      >x2</a
      ><a name="10768"
      > </a
      ><a name="10769" href="Maps.html#10769" class="Bound"
      >y</a
      ><a name="10770"
      > </a
      ><a name="10771" class="Symbol"
      >:</a
      ><a name="10772"
      > </a
      ><a name="10773" href="Maps.html#2398" class="Datatype"
      >Id</a
      ><a name="10775" class="Symbol"
      >)</a
      ><a name="10776"
      >
                 </a
      ><a name="10794" class="Symbol"
      >&#8594;</a
      ><a name="10795"
      > </a
      ><a name="10796" href="Maps.html#10763" class="Bound"
      >x1</a
      ><a name="10798"
      > </a
      ><a name="10799" href="https://agda.github.io/agda-stdlib/Relation.Binary.Core.html#4493" class="Function Operator"
      >&#8802;</a
      ><a name="10800"
      > </a
      ><a name="10801" href="Maps.html#10766" class="Bound"
      >x2</a
      ><a name="10803"
      > </a
      ><a name="10804" class="Symbol"
      >&#8594;</a
      ><a name="10805"
      > </a
      ><a name="10806" class="Symbol"
      >(</a
      ><a name="10807" href="Maps.html#9739" class="Function"
      >update</a
      ><a name="10813"
      > </a
      ><a name="10814" class="Symbol"
      >(</a
      ><a name="10815" href="Maps.html#9739" class="Function"
      >update</a
      ><a name="10821"
      > </a
      ><a name="10822" href="Maps.html#10744" class="Bound"
      >m</a
      ><a name="10823"
      > </a
      ><a name="10824" href="Maps.html#10766" class="Bound"
      >x2</a
      ><a name="10826"
      > </a
      ><a name="10827" href="Maps.html#10739" class="Bound"
      >v2</a
      ><a name="10829" class="Symbol"
      >)</a
      ><a name="10830"
      > </a
      ><a name="10831" href="Maps.html#10763" class="Bound"
      >x1</a
      ><a name="10833"
      > </a
      ><a name="10834" href="Maps.html#10736" class="Bound"
      >v1</a
      ><a name="10836" class="Symbol"
      >)</a
      ><a name="10837"
      > </a
      ><a name="10838" href="Maps.html#10769" class="Bound"
      >y</a
      ><a name="10839"
      >
                           </a
      ><a name="10867" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="10868"
      > </a
      ><a name="10869" class="Symbol"
      >(</a
      ><a name="10870" href="Maps.html#9739" class="Function"
      >update</a
      ><a name="10876"
      > </a
      ><a name="10877" class="Symbol"
      >(</a
      ><a name="10878" href="Maps.html#9739" class="Function"
      >update</a
      ><a name="10884"
      > </a
      ><a name="10885" href="Maps.html#10744" class="Bound"
      >m</a
      ><a name="10886"
      > </a
      ><a name="10887" href="Maps.html#10763" class="Bound"
      >x1</a
      ><a name="10889"
      > </a
      ><a name="10890" href="Maps.html#10736" class="Bound"
      >v1</a
      ><a name="10892" class="Symbol"
      >)</a
      ><a name="10893"
      > </a
      ><a name="10894" href="Maps.html#10766" class="Bound"
      >x2</a
      ><a name="10896"
      > </a
      ><a name="10897" href="Maps.html#10739" class="Bound"
      >v2</a
      ><a name="10899" class="Symbol"
      >)</a
      ><a name="10900"
      > </a
      ><a name="10901" href="Maps.html#10769" class="Bound"
      >y</a
      ><a name="10902"
      >
  </a
      ><a name="10905" href="Maps.html#10714" class="Function"
      >update-permute</a
      ><a name="10919"
      > </a
      ><a name="10920" href="Maps.html#10920" class="Bound"
      >m</a
      ><a name="10921"
      > </a
      ><a name="10922" href="Maps.html#10922" class="Bound"
      >x1</a
      ><a name="10924"
      > </a
      ><a name="10925" href="Maps.html#10925" class="Bound"
      >x2</a
      ><a name="10927"
      > </a
      ><a name="10928" href="Maps.html#10928" class="Bound"
      >y</a
      ><a name="10929"
      > </a
      ><a name="10930" href="Maps.html#10930" class="Bound"
      >x1&#8800;x2</a
      ><a name="10935"
      > </a
      ><a name="10936" class="Symbol"
      >=</a
      ><a name="10937"
      > </a
      ><a name="10938" href="Maps.html#8496" class="Postulate"
      >TotalMap.update-permute</a
      ><a name="10961"
      > </a
      ><a name="10962" href="Maps.html#10920" class="Bound"
      >m</a
      ><a name="10963"
      > </a
      ><a name="10964" href="Maps.html#10922" class="Bound"
      >x1</a
      ><a name="10966"
      > </a
      ><a name="10967" href="Maps.html#10925" class="Bound"
      >x2</a
      ><a name="10969"
      > </a
      ><a name="10970" href="Maps.html#10928" class="Bound"
      >y</a
      ><a name="10971"
      > </a
      ><a name="10972" href="Maps.html#10930" class="Bound"
      >x1&#8800;x2</a
      >
</pre><!--{% endraw %}-->
