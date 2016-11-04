---
title        : "Linear Types for Erlang/OTP (1)"
date         : 2016-10-25 12:00:00
categories   : []
tags         : [draft, agda, erlang, process calculus]
extra-script : [agda-extra-script.html]
extra-style  : [agda-extra-style.html]
---

*This is the first post in a series in which I will investigate linear
types for Erlang/OTP. In these posts, I will discuss the the generic
server architecture implemented in Erlang's `gen_server` and
supervisor trees.*

*Whenever possible, I will implement similar programs directly in
Wadler's [Classical Processes](https://github.com/pepijnkokke/cpgv).
Quite often, however, the type system for CP will not be expressive
enough to type such programs. In these cases, I will implement the
types and programs using Agda as my meta-language---as a sort-of
template CP.*

## Prelude: Linear Types

As mentioned I will occasionally resort to using Agda as my
meta-language. In this post, I will use Agda to talk about linear
types---and in order to do that, I need to tell Agda what linear types
are.

<div class="hidden">
<!--{% raw %}--><pre class="Agda">
<a name="1080" class="Keyword"
      >open</a
      ><a name="1084"
      > </a
      ><a name="1085" class="Keyword"
      >import</a
      ><a name="1091"
      > </a
      ><a name="1092" href="https://agda.github.io/agda-stdlib/Data.Fin.html#1" class="Module"
      >Data.Fin</a
      ><a name="1100"
      > </a
      ><a name="1101" class="Keyword"
      >using</a
      ><a name="1106"
      > </a
      ><a name="1107" class="Symbol"
      >(</a
      ><a name="1108" href="https://agda.github.io/agda-stdlib/Data.Fin.html#842" class="Datatype"
      >Fin</a
      ><a name="1111" class="Symbol"
      >;</a
      ><a name="1112"
      > </a
      ><a name="1113" href="https://agda.github.io/agda-stdlib/Data.Fin.html#895" class="InductiveConstructor"
      >suc</a
      ><a name="1116" class="Symbol"
      >;</a
      ><a name="1117"
      > </a
      ><a name="1118" href="https://agda.github.io/agda-stdlib/Data.Fin.html#864" class="InductiveConstructor"
      >zero</a
      ><a name="1122" class="Symbol"
      >)</a
      ><a name="1123"
      >
</a
      ><a name="1124" class="Keyword"
      >open</a
      ><a name="1128"
      > </a
      ><a name="1129" class="Keyword"
      >import</a
      ><a name="1135"
      > </a
      ><a name="1136" href="https://agda.github.io/agda-stdlib/Data.Nat.html#1" class="Module"
      >Data.Nat</a
      ><a name="1144"
      > </a
      ><a name="1145" class="Keyword"
      >using</a
      ><a name="1150"
      > </a
      ><a name="1151" class="Symbol"
      >(</a
      ><a name="1152" href="Agda.Builtin.Nat.html#69" class="Datatype"
      >&#8469;</a
      ><a name="1153" class="Symbol"
      >;</a
      ><a name="1154"
      > </a
      ><a name="1155" href="Agda.Builtin.Nat.html#202" class="Primitive Operator"
      >_+_</a
      ><a name="1158" class="Symbol"
      >)</a
      ><a name="1159"
      >
</a
      ><a name="1160" class="Keyword"
      >open</a
      ><a name="1164"
      > </a
      ><a name="1165" class="Keyword"
      >import</a
      ><a name="1171"
      > </a
      ><a name="1172" href="https://agda.github.io/agda-stdlib/Data.Vec.html#1" class="Module"
      >Data.Vec</a
      ><a name="1180"
      > </a
      ><a name="1181" class="Keyword"
      >using</a
      ><a name="1186"
      > </a
      ><a name="1187" class="Symbol"
      >(</a
      ><a name="1188" href="https://agda.github.io/agda-stdlib/Data.Vec.html#609" class="Datatype"
      >Vec</a
      ><a name="1191" class="Symbol"
      >;</a
      ><a name="1192"
      > </a
      ><a name="1193" href="https://agda.github.io/agda-stdlib/Data.Vec.html#1999" class="Function"
      >map</a
      ><a name="1196" class="Symbol"
      >;</a
      ><a name="1197"
      > </a
      ><a name="1198" href="https://agda.github.io/agda-stdlib/Data.Vec.html#2745" class="Function"
      >foldr&#8321;</a
      ><a name="1204" class="Symbol"
      >;</a
      ><a name="1205"
      > </a
      ><a name="1206" href="https://agda.github.io/agda-stdlib/Data.Vec.html#6871" class="Function"
      >allFin</a
      ><a name="1212" class="Symbol"
      >)</a
      ><a name="1213"
      >
</a
      ><a name="1214" class="Keyword"
      >open</a
      ><a name="1218"
      > </a
      ><a name="1219" class="Keyword"
      >import</a
      ><a name="1225"
      > </a
      ><a name="1226" href="https://agda.github.io/agda-stdlib/Data.Product.html#1" class="Module"
      >Data.Product</a
      ><a name="1238"
      > </a
      ><a name="1239" class="Keyword"
      >using</a
      ><a name="1244"
      > </a
      ><a name="1245" class="Symbol"
      >(</a
      ><a name="1246" href="https://agda.github.io/agda-stdlib/Data.Product.html#1073" class="Function Operator"
      >_&#215;_</a
      ><a name="1249" class="Symbol"
      >;</a
      ><a name="1250"
      > </a
      ><a name="1251" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >_,_</a
      ><a name="1254" class="Symbol"
      >)</a
      ><a name="1255"
      >
</a
      ><a name="1256" class="Keyword"
      >open</a
      ><a name="1260"
      > </a
      ><a name="1261" class="Keyword"
      >import</a
      ><a name="1267"
      > </a
      ><a name="1268" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.html#1" class="Module"
      >Relation.Binary.PropositionalEquality</a
      ><a name="1305"
      > </a
      ><a name="1306" class="Keyword"
      >using</a
      ><a name="1311"
      > </a
      ><a name="1312" class="Symbol"
      >(</a
      ><a name="1313" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >_&#8801;_</a
      ><a name="1316" class="Symbol"
      >;</a
      ><a name="1317"
      > </a
      ><a name="1318" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="1322" class="Symbol"
      >)</a
      >
</pre><!--{% endraw %}-->
</div>

<div class="hidden">
<!--{% raw %}--><pre class="Agda">
<a name="1377" class="Keyword"
      >module</a
      ><a name="1383"
      > </a
      ><a name="1384" href="2016-10-25-linear-types-for-erlang-otp-1.html#1" class="Module"
      >2016-10-25-linear-types-for-erlang-otp-1</a
      ><a name="1424"
      > </a
      ><a name="1425" class="Keyword"
      >where</a
      >
</pre><!--{% endraw %}-->
</div>

<div class="hidden">
<!--{% raw %}--><pre class="Agda">
<a name="1484" class="Keyword"
      >infix</a
      ><a name="1489"
      >  </a
      ><a name="1491" class="Number"
      >9</a
      ><a name="1492"
      > +_ -_
</a
      ><a name="1499" class="Keyword"
      >infix</a
      ><a name="1504"
      >  </a
      ><a name="1506" class="Number"
      >8</a
      ><a name="1507"
      > ~_
</a
      ><a name="1511" class="Keyword"
      >infix</a
      ><a name="1516"
      >  </a
      ><a name="1518" class="Number"
      >7</a
      ><a name="1519"
      > &#161;_ &#191;_
</a
      ><a name="1526" class="Keyword"
      >infixl</a
      ><a name="1532"
      > </a
      ><a name="1533" class="Number"
      >6</a
      ><a name="1534"
      > _&amp;_ _&#8523;_ _&#8853;_ _&#8855;_
</a
      ><a name="1551" class="Keyword"
      >infixr</a
      ><a name="1557"
      > </a
      ><a name="1558" class="Number"
      >5</a
      >
</pre><!--{% endraw %}-->
</div>

Below I define a small Agda module which describes linear types. Feel
free to inspect it. Briefly, it defines the structure of linear types
as close to the syntax of linear logic as we can get.

<div class="foldable">
<!--{% raw %}--><pre class="Agda">
<a name="1814" class="Comment"
      >-- Prelude. Click `+` to unfold.</a
      ><a name="1846"
      >

</a
      ><a name="1848" class="Comment"
      >-- As we can have both positive and negative atoms, we</a
      ><a name="1902"
      >
</a
      ><a name="1903" class="Comment"
      >-- defined a type `Pol`, which will represent the polarities</a
      ><a name="1963"
      >
</a
      ><a name="1964" class="Comment"
      >-- of primitive types.</a
      ><a name="1986"
      >
</a
      ><a name="1987" class="Keyword"
      >data</a
      ><a name="1991"
      > </a
      ><a name="1992" href="2016-10-25-linear-types-for-erlang-otp-1.html#1992" class="Datatype"
      >Pol</a
      ><a name="1995"
      > </a
      ><a name="1996" class="Symbol"
      >:</a
      ><a name="1997"
      > </a
      ><a name="1998" class="PrimitiveType"
      >Set</a
      ><a name="2001"
      > </a
      ><a name="2002" class="Keyword"
      >where</a
      ><a name="2007"
      >
  </a
      ><a name="2010" href="2016-10-25-linear-types-for-erlang-otp-1.html#2010" class="InductiveConstructor"
      >pos</a
      ><a name="2013"
      > </a
      ><a name="2014" class="Symbol"
      >:</a
      ><a name="2015"
      > </a
      ><a name="2016" href="2016-10-25-linear-types-for-erlang-otp-1.html#1992" class="Datatype"
      >Pol</a
      ><a name="2019"
      >
  </a
      ><a name="2022" href="2016-10-25-linear-types-for-erlang-otp-1.html#2022" class="InductiveConstructor"
      >neg</a
      ><a name="2025"
      > </a
      ><a name="2026" class="Symbol"
      >:</a
      ><a name="2027"
      > </a
      ><a name="2028" href="2016-10-25-linear-types-for-erlang-otp-1.html#1992" class="Datatype"
      >Pol</a
      ><a name="2031"
      >

</a
      ><a name="2033" class="Comment"
      >-- As in software foundations, we defined identifiers as a</a
      ><a name="2091"
      >
</a
      ><a name="2092" class="Comment"
      >-- simple wrapper type around the natural numbers.</a
      ><a name="2142"
      >
</a
      ><a name="2143" class="Keyword"
      >data</a
      ><a name="2147"
      > </a
      ><a name="2148" href="2016-10-25-linear-types-for-erlang-otp-1.html#2148" class="Datatype"
      >Id</a
      ><a name="2150"
      > </a
      ><a name="2151" class="Symbol"
      >:</a
      ><a name="2152"
      > </a
      ><a name="2153" class="PrimitiveType"
      >Set</a
      ><a name="2156"
      > </a
      ><a name="2157" class="Keyword"
      >where</a
      ><a name="2162"
      >
  </a
      ><a name="2165" href="2016-10-25-linear-types-for-erlang-otp-1.html#2165" class="InductiveConstructor"
      >id</a
      ><a name="2167"
      > </a
      ><a name="2168" class="Symbol"
      >:</a
      ><a name="2169"
      > </a
      ><a name="2170" href="Agda.Builtin.Nat.html#69" class="Datatype"
      >&#8469;</a
      ><a name="2171"
      > </a
      ><a name="2172" class="Symbol"
      >&#8594;</a
      ><a name="2173"
      > </a
      ><a name="2174" href="2016-10-25-linear-types-for-erlang-otp-1.html#2148" class="Datatype"
      >Id</a
      ><a name="2176"
      >

</a
      ><a name="2178" class="Comment"
      >-- The types are defined, using as much as is possible of the</a
      ><a name="2239"
      >
</a
      ><a name="2240" class="Comment"
      >-- original syntax of linear logic. The only except are the</a
      ><a name="2299"
      >
</a
      ><a name="2300" class="Comment"
      >-- exponentials: ? is a reserved symbol, so we use &#161; and &#191;.</a
      ><a name="2359"
      >
</a
      ><a name="2360" class="Keyword"
      >data</a
      ><a name="2364"
      > </a
      ><a name="2365" href="2016-10-25-linear-types-for-erlang-otp-1.html#2365" class="Datatype"
      >Type</a
      ><a name="2369"
      > </a
      ><a name="2370" class="Symbol"
      >:</a
      ><a name="2371"
      > </a
      ><a name="2372" class="PrimitiveType"
      >Set</a
      ><a name="2375"
      > </a
      ><a name="2376" class="Keyword"
      >where</a
      ><a name="2381"
      >
  </a
      ><a name="2384" href="2016-10-25-linear-types-for-erlang-otp-1.html#2384" class="InductiveConstructor"
      >var</a
      ><a name="2387"
      >     </a
      ><a name="2392" class="Symbol"
      >:</a
      ><a name="2393"
      > </a
      ><a name="2394" href="2016-10-25-linear-types-for-erlang-otp-1.html#1992" class="Datatype"
      >Pol</a
      ><a name="2397"
      > </a
      ><a name="2398" class="Symbol"
      >&#8594;</a
      ><a name="2399"
      > </a
      ><a name="2400" href="2016-10-25-linear-types-for-erlang-otp-1.html#2148" class="Datatype"
      >Id</a
      ><a name="2402"
      > </a
      ><a name="2403" class="Symbol"
      >&#8594;</a
      ><a name="2404"
      > </a
      ><a name="2405" href="2016-10-25-linear-types-for-erlang-otp-1.html#2365" class="Datatype"
      >Type</a
      ><a name="2409"
      >
  </a
      ><a name="2412" href="2016-10-25-linear-types-for-erlang-otp-1.html#2412" class="InductiveConstructor"
      >&#8868;</a
      ><a name="2413"
      >   </a
      ><a name="2416" href="2016-10-25-linear-types-for-erlang-otp-1.html#2416" class="InductiveConstructor"
      >&#8869;</a
      ><a name="2417"
      >   </a
      ><a name="2420" class="Symbol"
      >:</a
      ><a name="2421"
      > </a
      ><a name="2422" href="2016-10-25-linear-types-for-erlang-otp-1.html#2365" class="Datatype"
      >Type</a
      ><a name="2426"
      >
  </a
      ><a name="2429" href="2016-10-25-linear-types-for-erlang-otp-1.html#2429" class="InductiveConstructor"
      >&#120792;</a
      ><a name="2430"
      >   </a
      ><a name="2433" href="2016-10-25-linear-types-for-erlang-otp-1.html#2433" class="InductiveConstructor"
      >&#120793;</a
      ><a name="2434"
      >   </a
      ><a name="2437" class="Symbol"
      >:</a
      ><a name="2438"
      > </a
      ><a name="2439" href="2016-10-25-linear-types-for-erlang-otp-1.html#2365" class="Datatype"
      >Type</a
      ><a name="2443"
      >
  </a
      ><a name="2446" href="2016-10-25-linear-types-for-erlang-otp-1.html#2446" class="InductiveConstructor Operator"
      >_&amp;_</a
      ><a name="2449"
      > </a
      ><a name="2450" href="2016-10-25-linear-types-for-erlang-otp-1.html#2450" class="InductiveConstructor Operator"
      >_&#8523;_</a
      ><a name="2453"
      > </a
      ><a name="2454" class="Symbol"
      >:</a
      ><a name="2455"
      > </a
      ><a name="2456" href="2016-10-25-linear-types-for-erlang-otp-1.html#2365" class="Datatype"
      >Type</a
      ><a name="2460"
      > </a
      ><a name="2461" class="Symbol"
      >&#8594;</a
      ><a name="2462"
      > </a
      ><a name="2463" href="2016-10-25-linear-types-for-erlang-otp-1.html#2365" class="Datatype"
      >Type</a
      ><a name="2467"
      > </a
      ><a name="2468" class="Symbol"
      >&#8594;</a
      ><a name="2469"
      > </a
      ><a name="2470" href="2016-10-25-linear-types-for-erlang-otp-1.html#2365" class="Datatype"
      >Type</a
      ><a name="2474"
      >
  </a
      ><a name="2477" href="2016-10-25-linear-types-for-erlang-otp-1.html#2477" class="InductiveConstructor Operator"
      >_&#8853;_</a
      ><a name="2480"
      > </a
      ><a name="2481" href="2016-10-25-linear-types-for-erlang-otp-1.html#2481" class="InductiveConstructor Operator"
      >_&#8855;_</a
      ><a name="2484"
      > </a
      ><a name="2485" class="Symbol"
      >:</a
      ><a name="2486"
      > </a
      ><a name="2487" href="2016-10-25-linear-types-for-erlang-otp-1.html#2365" class="Datatype"
      >Type</a
      ><a name="2491"
      > </a
      ><a name="2492" class="Symbol"
      >&#8594;</a
      ><a name="2493"
      > </a
      ><a name="2494" href="2016-10-25-linear-types-for-erlang-otp-1.html#2365" class="Datatype"
      >Type</a
      ><a name="2498"
      > </a
      ><a name="2499" class="Symbol"
      >&#8594;</a
      ><a name="2500"
      > </a
      ><a name="2501" href="2016-10-25-linear-types-for-erlang-otp-1.html#2365" class="Datatype"
      >Type</a
      ><a name="2505"
      >
  </a
      ><a name="2508" href="2016-10-25-linear-types-for-erlang-otp-1.html#2508" class="InductiveConstructor Operator"
      >&#161;_</a
      ><a name="2510"
      >  </a
      ><a name="2512" href="2016-10-25-linear-types-for-erlang-otp-1.html#2512" class="InductiveConstructor Operator"
      >&#191;_</a
      ><a name="2514"
      >  </a
      ><a name="2516" class="Symbol"
      >:</a
      ><a name="2517"
      > </a
      ><a name="2518" href="2016-10-25-linear-types-for-erlang-otp-1.html#2365" class="Datatype"
      >Type</a
      ><a name="2522"
      > </a
      ><a name="2523" class="Symbol"
      >-&gt;</a
      ><a name="2525"
      > </a
      ><a name="2526" href="2016-10-25-linear-types-for-erlang-otp-1.html#2365" class="Datatype"
      >Type</a
      ><a name="2530"
      >
  </a
      ><a name="2533" href="2016-10-25-linear-types-for-erlang-otp-1.html#2533" class="InductiveConstructor"
      >&#956;</a
      ><a name="2534"
      >   </a
      ><a name="2537" href="2016-10-25-linear-types-for-erlang-otp-1.html#2537" class="InductiveConstructor"
      >&#957;</a
      ><a name="2538"
      >   </a
      ><a name="2541" class="Symbol"
      >:</a
      ><a name="2542"
      > </a
      ><a name="2543" class="Symbol"
      >(</a
      ><a name="2544" href="2016-10-25-linear-types-for-erlang-otp-1.html#2148" class="Datatype"
      >Id</a
      ><a name="2546"
      > </a
      ><a name="2547" class="Symbol"
      >&#8594;</a
      ><a name="2548"
      > </a
      ><a name="2549" href="2016-10-25-linear-types-for-erlang-otp-1.html#2365" class="Datatype"
      >Type</a
      ><a name="2553" class="Symbol"
      >)</a
      ><a name="2554"
      > </a
      ><a name="2555" class="Symbol"
      >&#8594;</a
      ><a name="2556"
      > </a
      ><a name="2557" href="2016-10-25-linear-types-for-erlang-otp-1.html#2365" class="Datatype"
      >Type</a
      ><a name="2561"
      >

</a
      ><a name="2563" class="Comment"
      >-- While we would like to be able to treat both positive</a
      ><a name="2619"
      >
</a
      ><a name="2620" class="Comment"
      >-- and negative occurances of variables as a single case</a
      ><a name="2676"
      >
</a
      ><a name="2677" class="Comment"
      >-- in proofs, writing `var pos X` is tedious. Therefore,</a
      ><a name="2733"
      >
</a
      ><a name="2734" class="Comment"
      >-- we defined the syntax (+ A) and (- A) for variables.</a
      ><a name="2789"
      >
</a
      ><a name="2790" class="Keyword"
      >pattern</a
      ><a name="2797"
      > </a
      ><a name="2798" href="2016-10-25-linear-types-for-erlang-otp-1.html#2798" class="InductiveConstructor Operator"
      >+_</a
      ><a name="2800"
      > </a
      ><a name="2801" href="2016-10-25-linear-types-for-erlang-otp-1.html#2813" class="Bound"
      >A</a
      ><a name="2802"
      > </a
      ><a name="2803" class="Symbol"
      >=</a
      ><a name="2804"
      > </a
      ><a name="2805" href="2016-10-25-linear-types-for-erlang-otp-1.html#2384" class="InductiveConstructor"
      >var</a
      ><a name="2808"
      > </a
      ><a name="2809" href="2016-10-25-linear-types-for-erlang-otp-1.html#2010" class="InductiveConstructor"
      >pos</a
      ><a name="2812"
      > </a
      ><a name="2813" href="2016-10-25-linear-types-for-erlang-otp-1.html#2813" class="Bound"
      >A</a
      ><a name="2814"
      >
</a
      ><a name="2815" class="Keyword"
      >pattern</a
      ><a name="2822"
      > </a
      ><a name="2823" href="2016-10-25-linear-types-for-erlang-otp-1.html#2823" class="InductiveConstructor Operator"
      >-_</a
      ><a name="2825"
      > </a
      ><a name="2826" href="2016-10-25-linear-types-for-erlang-otp-1.html#2838" class="Bound"
      >A</a
      ><a name="2827"
      > </a
      ><a name="2828" class="Symbol"
      >=</a
      ><a name="2829"
      > </a
      ><a name="2830" href="2016-10-25-linear-types-for-erlang-otp-1.html#2384" class="InductiveConstructor"
      >var</a
      ><a name="2833"
      > </a
      ><a name="2834" href="2016-10-25-linear-types-for-erlang-otp-1.html#2022" class="InductiveConstructor"
      >neg</a
      ><a name="2837"
      > </a
      ><a name="2838" href="2016-10-25-linear-types-for-erlang-otp-1.html#2838" class="Bound"
      >A</a
      ><a name="2839"
      >
</a
      ><a name="2840" class="Symbol"
      >{-#</a
      ><a name="2843"
      > </a
      ><a name="2844" class="Keyword"
      >DISPLAY</a
      ><a name="2851"
      > </a
      ><a name="2852" href="2016-10-25-linear-types-for-erlang-otp-1.html#2384" class="InductiveConstructor"
      >var</a
      ><a name="2855"
      > </a
      ><a name="2856" href="2016-10-25-linear-types-for-erlang-otp-1.html#2010" class="InductiveConstructor"
      >pos</a
      ><a name="2859"
      > </a
      ><a name="2860" href="2016-10-25-linear-types-for-erlang-otp-1.html#2860" class="Bound"
      >A</a
      ><a name="2861"
      > = </a
      ><a name="2864" href="2016-10-25-linear-types-for-erlang-otp-1.html#2798" class="InductiveConstructor Operator"
      >+</a
      ><a name="2865"
      > </a
      ><a name="2866" href="2016-10-25-linear-types-for-erlang-otp-1.html#2860" class="Bound"
      >A</a
      ><a name="2867"
      > </a
      ><a name="2868" class="Symbol"
      >#-}</a
      ><a name="2871"
      >
</a
      ><a name="2872" class="Symbol"
      >{-#</a
      ><a name="2875"
      > </a
      ><a name="2876" class="Keyword"
      >DISPLAY</a
      ><a name="2883"
      > </a
      ><a name="2884" href="2016-10-25-linear-types-for-erlang-otp-1.html#2384" class="InductiveConstructor"
      >var</a
      ><a name="2887"
      > </a
      ><a name="2888" href="2016-10-25-linear-types-for-erlang-otp-1.html#2022" class="InductiveConstructor"
      >neg</a
      ><a name="2891"
      > </a
      ><a name="2892" href="2016-10-25-linear-types-for-erlang-otp-1.html#2892" class="Bound"
      >A</a
      ><a name="2893"
      > = </a
      ><a name="2896" href="2016-10-25-linear-types-for-erlang-otp-1.html#2823" class="InductiveConstructor Operator"
      >-</a
      ><a name="2897"
      > </a
      ><a name="2898" href="2016-10-25-linear-types-for-erlang-otp-1.html#2892" class="Bound"
      >A</a
      ><a name="2899"
      > </a
      ><a name="2900" class="Symbol"
      >#-}</a
      ><a name="2903"
      >

</a
      ><a name="2905" class="Comment"
      >-- We want to be able to write both (&#956; F) and (&#956;[ X ] A).</a
      ><a name="2962"
      >
</a
      ><a name="2963" class="Comment"
      >-- Therefore, we define the primitive type constructor as</a
      ><a name="3020"
      >
</a
      ><a name="3021" class="Comment"
      >-- &#956;, and attach a syntax macro which allows it to bind an</a
      ><a name="3079"
      >
</a
      ><a name="3080" class="Comment"
      >-- argument X. This way we never have to write &#956; (&#955; X &#8594; A)).</a
      ><a name="3140"
      >
</a
      ><a name="3141" class="Keyword"
      >syntax</a
      ><a name="3147"
      > &#956; </a
      ><a name="3150" class="Symbol"
      >(&#955;</a
      ><a name="3152"
      > X </a
      ><a name="3155" class="Symbol"
      >&#8594;</a
      ><a name="3156"
      > A</a
      ><a name="3158" class="Symbol"
      >)</a
      ><a name="3159"
      > </a
      ><a name="3160" class="Symbol"
      >=</a
      ><a name="3161"
      > &#956;[ X ] A
</a
      ><a name="3171" class="Keyword"
      >syntax</a
      ><a name="3177"
      > &#957; </a
      ><a name="3180" class="Symbol"
      >(&#955;</a
      ><a name="3182"
      > X </a
      ><a name="3185" class="Symbol"
      >&#8594;</a
      ><a name="3186"
      > A</a
      ><a name="3188" class="Symbol"
      >)</a
      ><a name="3189"
      > </a
      ><a name="3190" class="Symbol"
      >=</a
      ><a name="3191"
      > &#957;[ X ] A

</a
      ><a name="3202" class="Comment"
      >-- We define negation as a recursive function over the</a
      ><a name="3256"
      >
</a
      ><a name="3257" class="Comment"
      >-- structure of types -- as you would expect, basically.</a
      ><a name="3313"
      >
</a
      ><a name="3314" href="2016-10-25-linear-types-for-erlang-otp-1.html#3314" class="Function Operator"
      >~_</a
      ><a name="3316"
      > </a
      ><a name="3317" class="Symbol"
      >:</a
      ><a name="3318"
      > </a
      ><a name="3319" href="2016-10-25-linear-types-for-erlang-otp-1.html#2365" class="Datatype"
      >Type</a
      ><a name="3323"
      > </a
      ><a name="3324" class="Symbol"
      >&#8594;</a
      ><a name="3325"
      > </a
      ><a name="3326" href="2016-10-25-linear-types-for-erlang-otp-1.html#2365" class="Datatype"
      >Type</a
      ><a name="3330"
      >
</a
      ><a name="3331" href="2016-10-25-linear-types-for-erlang-otp-1.html#3314" class="Function Operator"
      >~</a
      ><a name="3332"
      > </a
      ><a name="3333" class="Symbol"
      >(</a
      ><a name="3334" href="2016-10-25-linear-types-for-erlang-otp-1.html#2798" class="InductiveConstructor Operator"
      >+</a
      ><a name="3335"
      > </a
      ><a name="3336" href="2016-10-25-linear-types-for-erlang-otp-1.html#3336" class="Bound"
      >A</a
      ><a name="3337" class="Symbol"
      >)</a
      ><a name="3338"
      >   </a
      ><a name="3341" class="Symbol"
      >=</a
      ><a name="3342"
      > </a
      ><a name="3343" href="2016-10-25-linear-types-for-erlang-otp-1.html#2823" class="InductiveConstructor Operator"
      >-</a
      ><a name="3344"
      > </a
      ><a name="3345" href="2016-10-25-linear-types-for-erlang-otp-1.html#3336" class="Bound"
      >A</a
      ><a name="3346"
      >           </a
      ><a name="3357" class="Symbol"
      >;</a
      ><a name="3358"
      > </a
      ><a name="3359" href="2016-10-25-linear-types-for-erlang-otp-1.html#3314" class="Function Operator"
      >~</a
      ><a name="3360"
      > </a
      ><a name="3361" class="Symbol"
      >(</a
      ><a name="3362" href="2016-10-25-linear-types-for-erlang-otp-1.html#2823" class="InductiveConstructor Operator"
      >-</a
      ><a name="3363"
      > </a
      ><a name="3364" href="2016-10-25-linear-types-for-erlang-otp-1.html#3364" class="Bound"
      >A</a
      ><a name="3365" class="Symbol"
      >)</a
      ><a name="3366"
      >   </a
      ><a name="3369" class="Symbol"
      >=</a
      ><a name="3370"
      > </a
      ><a name="3371" href="2016-10-25-linear-types-for-erlang-otp-1.html#2798" class="InductiveConstructor Operator"
      >+</a
      ><a name="3372"
      > </a
      ><a name="3373" href="2016-10-25-linear-types-for-erlang-otp-1.html#3364" class="Bound"
      >A</a
      ><a name="3374"
      >
</a
      ><a name="3375" href="2016-10-25-linear-types-for-erlang-otp-1.html#3314" class="Function Operator"
      >~</a
      ><a name="3376"
      > </a
      ><a name="3377" href="2016-10-25-linear-types-for-erlang-otp-1.html#2429" class="InductiveConstructor"
      >&#120792;</a
      ><a name="3378"
      >       </a
      ><a name="3385" class="Symbol"
      >=</a
      ><a name="3386"
      > </a
      ><a name="3387" href="2016-10-25-linear-types-for-erlang-otp-1.html#2412" class="InductiveConstructor"
      >&#8868;</a
      ><a name="3388"
      >             </a
      ><a name="3401" class="Symbol"
      >;</a
      ><a name="3402"
      > </a
      ><a name="3403" href="2016-10-25-linear-types-for-erlang-otp-1.html#3314" class="Function Operator"
      >~</a
      ><a name="3404"
      > </a
      ><a name="3405" href="2016-10-25-linear-types-for-erlang-otp-1.html#2412" class="InductiveConstructor"
      >&#8868;</a
      ><a name="3406"
      >       </a
      ><a name="3413" class="Symbol"
      >=</a
      ><a name="3414"
      > </a
      ><a name="3415" href="2016-10-25-linear-types-for-erlang-otp-1.html#2429" class="InductiveConstructor"
      >&#120792;</a
      ><a name="3416"
      >
</a
      ><a name="3417" href="2016-10-25-linear-types-for-erlang-otp-1.html#3314" class="Function Operator"
      >~</a
      ><a name="3418"
      > </a
      ><a name="3419" href="2016-10-25-linear-types-for-erlang-otp-1.html#2433" class="InductiveConstructor"
      >&#120793;</a
      ><a name="3420"
      >       </a
      ><a name="3427" class="Symbol"
      >=</a
      ><a name="3428"
      > </a
      ><a name="3429" href="2016-10-25-linear-types-for-erlang-otp-1.html#2416" class="InductiveConstructor"
      >&#8869;</a
      ><a name="3430"
      >             </a
      ><a name="3443" class="Symbol"
      >;</a
      ><a name="3444"
      > </a
      ><a name="3445" href="2016-10-25-linear-types-for-erlang-otp-1.html#3314" class="Function Operator"
      >~</a
      ><a name="3446"
      > </a
      ><a name="3447" href="2016-10-25-linear-types-for-erlang-otp-1.html#2416" class="InductiveConstructor"
      >&#8869;</a
      ><a name="3448"
      >       </a
      ><a name="3455" class="Symbol"
      >=</a
      ><a name="3456"
      > </a
      ><a name="3457" href="2016-10-25-linear-types-for-erlang-otp-1.html#2433" class="InductiveConstructor"
      >&#120793;</a
      ><a name="3458"
      >
</a
      ><a name="3459" href="2016-10-25-linear-types-for-erlang-otp-1.html#3314" class="Function Operator"
      >~</a
      ><a name="3460"
      > </a
      ><a name="3461" class="Symbol"
      >(</a
      ><a name="3462" href="2016-10-25-linear-types-for-erlang-otp-1.html#3462" class="Bound"
      >A</a
      ><a name="3463"
      > </a
      ><a name="3464" href="2016-10-25-linear-types-for-erlang-otp-1.html#2477" class="InductiveConstructor Operator"
      >&#8853;</a
      ><a name="3465"
      > </a
      ><a name="3466" href="2016-10-25-linear-types-for-erlang-otp-1.html#3466" class="Bound"
      >B</a
      ><a name="3467" class="Symbol"
      >)</a
      ><a name="3468"
      > </a
      ><a name="3469" class="Symbol"
      >=</a
      ><a name="3470"
      > </a
      ><a name="3471" href="2016-10-25-linear-types-for-erlang-otp-1.html#3314" class="Function Operator"
      >~</a
      ><a name="3472"
      > </a
      ><a name="3473" href="2016-10-25-linear-types-for-erlang-otp-1.html#3462" class="Bound"
      >A</a
      ><a name="3474"
      > </a
      ><a name="3475" href="2016-10-25-linear-types-for-erlang-otp-1.html#2446" class="InductiveConstructor Operator"
      >&amp;</a
      ><a name="3476"
      > </a
      ><a name="3477" href="2016-10-25-linear-types-for-erlang-otp-1.html#3314" class="Function Operator"
      >~</a
      ><a name="3478"
      > </a
      ><a name="3479" href="2016-10-25-linear-types-for-erlang-otp-1.html#3466" class="Bound"
      >B</a
      ><a name="3480"
      >     </a
      ><a name="3485" class="Symbol"
      >;</a
      ><a name="3486"
      > </a
      ><a name="3487" href="2016-10-25-linear-types-for-erlang-otp-1.html#3314" class="Function Operator"
      >~</a
      ><a name="3488"
      > </a
      ><a name="3489" class="Symbol"
      >(</a
      ><a name="3490" href="2016-10-25-linear-types-for-erlang-otp-1.html#3490" class="Bound"
      >A</a
      ><a name="3491"
      > </a
      ><a name="3492" href="2016-10-25-linear-types-for-erlang-otp-1.html#2446" class="InductiveConstructor Operator"
      >&amp;</a
      ><a name="3493"
      > </a
      ><a name="3494" href="2016-10-25-linear-types-for-erlang-otp-1.html#3494" class="Bound"
      >B</a
      ><a name="3495" class="Symbol"
      >)</a
      ><a name="3496"
      > </a
      ><a name="3497" class="Symbol"
      >=</a
      ><a name="3498"
      > </a
      ><a name="3499" href="2016-10-25-linear-types-for-erlang-otp-1.html#3314" class="Function Operator"
      >~</a
      ><a name="3500"
      > </a
      ><a name="3501" href="2016-10-25-linear-types-for-erlang-otp-1.html#3490" class="Bound"
      >A</a
      ><a name="3502"
      > </a
      ><a name="3503" href="2016-10-25-linear-types-for-erlang-otp-1.html#2477" class="InductiveConstructor Operator"
      >&#8853;</a
      ><a name="3504"
      > </a
      ><a name="3505" href="2016-10-25-linear-types-for-erlang-otp-1.html#3314" class="Function Operator"
      >~</a
      ><a name="3506"
      > </a
      ><a name="3507" href="2016-10-25-linear-types-for-erlang-otp-1.html#3494" class="Bound"
      >B</a
      ><a name="3508"
      >
</a
      ><a name="3509" href="2016-10-25-linear-types-for-erlang-otp-1.html#3314" class="Function Operator"
      >~</a
      ><a name="3510"
      > </a
      ><a name="3511" class="Symbol"
      >(</a
      ><a name="3512" href="2016-10-25-linear-types-for-erlang-otp-1.html#3512" class="Bound"
      >A</a
      ><a name="3513"
      > </a
      ><a name="3514" href="2016-10-25-linear-types-for-erlang-otp-1.html#2481" class="InductiveConstructor Operator"
      >&#8855;</a
      ><a name="3515"
      > </a
      ><a name="3516" href="2016-10-25-linear-types-for-erlang-otp-1.html#3516" class="Bound"
      >B</a
      ><a name="3517" class="Symbol"
      >)</a
      ><a name="3518"
      > </a
      ><a name="3519" class="Symbol"
      >=</a
      ><a name="3520"
      > </a
      ><a name="3521" href="2016-10-25-linear-types-for-erlang-otp-1.html#3314" class="Function Operator"
      >~</a
      ><a name="3522"
      > </a
      ><a name="3523" href="2016-10-25-linear-types-for-erlang-otp-1.html#3512" class="Bound"
      >A</a
      ><a name="3524"
      > </a
      ><a name="3525" href="2016-10-25-linear-types-for-erlang-otp-1.html#2450" class="InductiveConstructor Operator"
      >&#8523;</a
      ><a name="3526"
      > </a
      ><a name="3527" href="2016-10-25-linear-types-for-erlang-otp-1.html#3314" class="Function Operator"
      >~</a
      ><a name="3528"
      > </a
      ><a name="3529" href="2016-10-25-linear-types-for-erlang-otp-1.html#3516" class="Bound"
      >B</a
      ><a name="3530"
      >     </a
      ><a name="3535" class="Symbol"
      >;</a
      ><a name="3536"
      > </a
      ><a name="3537" href="2016-10-25-linear-types-for-erlang-otp-1.html#3314" class="Function Operator"
      >~</a
      ><a name="3538"
      > </a
      ><a name="3539" class="Symbol"
      >(</a
      ><a name="3540" href="2016-10-25-linear-types-for-erlang-otp-1.html#3540" class="Bound"
      >A</a
      ><a name="3541"
      > </a
      ><a name="3542" href="2016-10-25-linear-types-for-erlang-otp-1.html#2450" class="InductiveConstructor Operator"
      >&#8523;</a
      ><a name="3543"
      > </a
      ><a name="3544" href="2016-10-25-linear-types-for-erlang-otp-1.html#3544" class="Bound"
      >B</a
      ><a name="3545" class="Symbol"
      >)</a
      ><a name="3546"
      > </a
      ><a name="3547" class="Symbol"
      >=</a
      ><a name="3548"
      > </a
      ><a name="3549" href="2016-10-25-linear-types-for-erlang-otp-1.html#3314" class="Function Operator"
      >~</a
      ><a name="3550"
      > </a
      ><a name="3551" href="2016-10-25-linear-types-for-erlang-otp-1.html#3540" class="Bound"
      >A</a
      ><a name="3552"
      > </a
      ><a name="3553" href="2016-10-25-linear-types-for-erlang-otp-1.html#2481" class="InductiveConstructor Operator"
      >&#8855;</a
      ><a name="3554"
      > </a
      ><a name="3555" href="2016-10-25-linear-types-for-erlang-otp-1.html#3314" class="Function Operator"
      >~</a
      ><a name="3556"
      > </a
      ><a name="3557" href="2016-10-25-linear-types-for-erlang-otp-1.html#3544" class="Bound"
      >B</a
      ><a name="3558"
      >
</a
      ><a name="3559" href="2016-10-25-linear-types-for-erlang-otp-1.html#3314" class="Function Operator"
      >~</a
      ><a name="3560"
      > </a
      ><a name="3561" class="Symbol"
      >(</a
      ><a name="3562" href="2016-10-25-linear-types-for-erlang-otp-1.html#2508" class="InductiveConstructor Operator"
      >&#161;</a
      ><a name="3563"
      > </a
      ><a name="3564" href="2016-10-25-linear-types-for-erlang-otp-1.html#3564" class="Bound"
      >A</a
      ><a name="3565"
      > </a
      ><a name="3566" class="Symbol"
      >)</a
      ><a name="3567"
      >  </a
      ><a name="3569" class="Symbol"
      >=</a
      ><a name="3570"
      > </a
      ><a name="3571" href="2016-10-25-linear-types-for-erlang-otp-1.html#2512" class="InductiveConstructor Operator"
      >&#191;</a
      ><a name="3572"
      > </a
      ><a name="3573" href="2016-10-25-linear-types-for-erlang-otp-1.html#3314" class="Function Operator"
      >~</a
      ><a name="3574"
      > </a
      ><a name="3575" href="2016-10-25-linear-types-for-erlang-otp-1.html#3564" class="Bound"
      >A</a
      ><a name="3576"
      >         </a
      ><a name="3585" class="Symbol"
      >;</a
      ><a name="3586"
      > </a
      ><a name="3587" href="2016-10-25-linear-types-for-erlang-otp-1.html#3314" class="Function Operator"
      >~</a
      ><a name="3588"
      > </a
      ><a name="3589" class="Symbol"
      >(</a
      ><a name="3590" href="2016-10-25-linear-types-for-erlang-otp-1.html#2512" class="InductiveConstructor Operator"
      >&#191;</a
      ><a name="3591"
      > </a
      ><a name="3592" href="2016-10-25-linear-types-for-erlang-otp-1.html#3592" class="Bound"
      >A</a
      ><a name="3593"
      > </a
      ><a name="3594" class="Symbol"
      >)</a
      ><a name="3595"
      >  </a
      ><a name="3597" class="Symbol"
      >=</a
      ><a name="3598"
      > </a
      ><a name="3599" href="2016-10-25-linear-types-for-erlang-otp-1.html#2508" class="InductiveConstructor Operator"
      >&#161;</a
      ><a name="3600"
      > </a
      ><a name="3601" href="2016-10-25-linear-types-for-erlang-otp-1.html#3314" class="Function Operator"
      >~</a
      ><a name="3602"
      > </a
      ><a name="3603" href="2016-10-25-linear-types-for-erlang-otp-1.html#3592" class="Bound"
      >A</a
      ><a name="3604"
      >
</a
      ><a name="3605" href="2016-10-25-linear-types-for-erlang-otp-1.html#3314" class="Function Operator"
      >~</a
      ><a name="3606"
      > </a
      ><a name="3607" class="Symbol"
      >(</a
      ><a name="3608" href="2016-10-25-linear-types-for-erlang-otp-1.html#2533" class="InductiveConstructor"
      >&#956;</a
      ><a name="3609"
      > </a
      ><a name="3610" href="2016-10-25-linear-types-for-erlang-otp-1.html#3610" class="Bound"
      >F</a
      ><a name="3611" class="Symbol"
      >)</a
      ><a name="3612"
      >   </a
      ><a name="3615" class="Symbol"
      >=</a
      ><a name="3616"
      > </a
      ><a name="3617" href="2016-10-25-linear-types-for-erlang-otp-1.html#2537" class="InductiveConstructor"
      >&#957;[</a
      ><a name="3619"
      > </a
      ><a name="3620" href="2016-10-25-linear-types-for-erlang-otp-1.html#3620" class="Bound"
      >X</a
      ><a name="3621"
      > </a
      ><a name="3622" href="2016-10-25-linear-types-for-erlang-otp-1.html#2537" class="InductiveConstructor"
      >]</a
      ><a name="3623" class="Symbol"
      >(</a
      ><a name="3624" href="2016-10-25-linear-types-for-erlang-otp-1.html#3314" class="Function Operator"
      >~</a
      ><a name="3625"
      > </a
      ><a name="3626" href="2016-10-25-linear-types-for-erlang-otp-1.html#3610" class="Bound"
      >F</a
      ><a name="3627"
      > </a
      ><a name="3628" href="2016-10-25-linear-types-for-erlang-otp-1.html#3620" class="Bound"
      >X</a
      ><a name="3629" class="Symbol"
      >)</a
      ><a name="3630"
      > </a
      ><a name="3631" class="Symbol"
      >;</a
      ><a name="3632"
      > </a
      ><a name="3633" href="2016-10-25-linear-types-for-erlang-otp-1.html#3314" class="Function Operator"
      >~</a
      ><a name="3634"
      > </a
      ><a name="3635" class="Symbol"
      >(</a
      ><a name="3636" href="2016-10-25-linear-types-for-erlang-otp-1.html#2537" class="InductiveConstructor"
      >&#957;</a
      ><a name="3637"
      > </a
      ><a name="3638" href="2016-10-25-linear-types-for-erlang-otp-1.html#3638" class="Bound"
      >F</a
      ><a name="3639" class="Symbol"
      >)</a
      ><a name="3640"
      >   </a
      ><a name="3643" class="Symbol"
      >=</a
      ><a name="3644"
      > </a
      ><a name="3645" href="2016-10-25-linear-types-for-erlang-otp-1.html#2533" class="InductiveConstructor"
      >&#956;[</a
      ><a name="3647"
      > </a
      ><a name="3648" href="2016-10-25-linear-types-for-erlang-otp-1.html#3648" class="Bound"
      >X</a
      ><a name="3649"
      > </a
      ><a name="3650" href="2016-10-25-linear-types-for-erlang-otp-1.html#2533" class="InductiveConstructor"
      >]</a
      ><a name="3651" class="Symbol"
      >(</a
      ><a name="3652" href="2016-10-25-linear-types-for-erlang-otp-1.html#3314" class="Function Operator"
      >~</a
      ><a name="3653"
      > </a
      ><a name="3654" href="2016-10-25-linear-types-for-erlang-otp-1.html#3638" class="Bound"
      >F</a
      ><a name="3655"
      > </a
      ><a name="3656" href="2016-10-25-linear-types-for-erlang-otp-1.html#3648" class="Bound"
      >X</a
      ><a name="3657" class="Symbol"
      >)</a
      >
</pre><!--{% endraw %}-->
</div>

For instance, we can use the definitions in this module to define the
lollipop.

<!--{% raw %}--><pre class="Agda">
<a name="3772" href="2016-10-25-linear-types-for-erlang-otp-1.html#3772" class="Function Operator"
      >_&#8888;_</a
      ><a name="3775"
      > </a
      ><a name="3776" class="Symbol"
      >:</a
      ><a name="3777"
      > </a
      ><a name="3778" href="2016-10-25-linear-types-for-erlang-otp-1.html#2365" class="Datatype"
      >Type</a
      ><a name="3782"
      > </a
      ><a name="3783" class="Symbol"
      >&#8594;</a
      ><a name="3784"
      > </a
      ><a name="3785" href="2016-10-25-linear-types-for-erlang-otp-1.html#2365" class="Datatype"
      >Type</a
      ><a name="3789"
      > </a
      ><a name="3790" class="Symbol"
      >&#8594;</a
      ><a name="3791"
      > </a
      ><a name="3792" href="2016-10-25-linear-types-for-erlang-otp-1.html#2365" class="Datatype"
      >Type</a
      ><a name="3796"
      >
</a
      ><a name="3797" href="2016-10-25-linear-types-for-erlang-otp-1.html#3797" class="Bound"
      >A</a
      ><a name="3798"
      > </a
      ><a name="3799" href="2016-10-25-linear-types-for-erlang-otp-1.html#3772" class="Function Operator"
      >&#8888;</a
      ><a name="3800"
      > </a
      ><a name="3801" href="2016-10-25-linear-types-for-erlang-otp-1.html#3801" class="Bound"
      >B</a
      ><a name="3802"
      > </a
      ><a name="3803" class="Symbol"
      >=</a
      ><a name="3804"
      > </a
      ><a name="3805" href="2016-10-25-linear-types-for-erlang-otp-1.html#3314" class="Function Operator"
      >~</a
      ><a name="3806"
      > </a
      ><a name="3807" href="2016-10-25-linear-types-for-erlang-otp-1.html#3797" class="Bound"
      >A</a
      ><a name="3808"
      > </a
      ><a name="3809" href="2016-10-25-linear-types-for-erlang-otp-1.html#2450" class="InductiveConstructor Operator"
      >&#8523;</a
      ><a name="3810"
      > </a
      ><a name="3811" href="2016-10-25-linear-types-for-erlang-otp-1.html#3801" class="Bound"
      >B</a
      >
</pre><!--{% endraw %}-->

Another thing that we can do---which will be extremely useful later
on---is to define the structure of "named" sums. The implementation of
CP supports these, and I use them quite heavily to implement datatypes.

This is also where the use of Agda as a meta-language becomes
apparent. I cannot describe these types *within* CP, but I can
describe them as a *template* on top of CP, and use Agda to feel
reassured that what I'm doing is relatively sane.

We define named sums as a *fold* over a finite list of names, applying
some type-level function *F* to each name, and joining the resulting
types with plus (`⊕`). Then we define a syntax macro which hides the
binder in the function `F`.

<!--{% raw %}--><pre class="Agda">
<a name="4529" class="Keyword"
      >syntax</a
      ><a name="4535"
      > &#8853;-Fin </a
      ><a name="4542" class="Symbol"
      >(&#955;</a
      ><a name="4544"
      > i </a
      ><a name="4547" class="Symbol"
      >&#8594;</a
      ><a name="4548"
      > A</a
      ><a name="4550" class="Symbol"
      >)</a
      ><a name="4551"
      > </a
      ><a name="4552" class="Symbol"
      >=</a
      ><a name="4553"
      > &#8853;[ i ] A

</a
      ><a name="4564" href="2016-10-25-linear-types-for-erlang-otp-1.html#4564" class="Function"
      >&#8853;-Fin</a
      ><a name="4569"
      > </a
      ><a name="4570" class="Symbol"
      >:</a
      ><a name="4571"
      > </a
      ><a name="4572" class="Symbol"
      >&#8704;</a
      ><a name="4573"
      > </a
      ><a name="4574" class="Symbol"
      >{</a
      ><a name="4575" href="2016-10-25-linear-types-for-erlang-otp-1.html#4575" class="Bound"
      >n</a
      ><a name="4576" class="Symbol"
      >}</a
      ><a name="4577"
      > </a
      ><a name="4578" class="Symbol"
      >(</a
      ><a name="4579" href="2016-10-25-linear-types-for-erlang-otp-1.html#4579" class="Bound"
      >F</a
      ><a name="4580"
      > </a
      ><a name="4581" class="Symbol"
      >:</a
      ><a name="4582"
      > </a
      ><a name="4583" href="https://agda.github.io/agda-stdlib/Data.Fin.html#842" class="Datatype"
      >Fin</a
      ><a name="4586"
      > </a
      ><a name="4587" class="Symbol"
      >(</a
      ><a name="4588" class="Number"
      >2</a
      ><a name="4589"
      > </a
      ><a name="4590" href="Agda.Builtin.Nat.html#202" class="Primitive Operator"
      >+</a
      ><a name="4591"
      > </a
      ><a name="4592" href="2016-10-25-linear-types-for-erlang-otp-1.html#4575" class="Bound"
      >n</a
      ><a name="4593" class="Symbol"
      >)</a
      ><a name="4594"
      > </a
      ><a name="4595" class="Symbol"
      >&#8594;</a
      ><a name="4596"
      > </a
      ><a name="4597" href="2016-10-25-linear-types-for-erlang-otp-1.html#2365" class="Datatype"
      >Type</a
      ><a name="4601" class="Symbol"
      >)</a
      ><a name="4602"
      > </a
      ><a name="4603" class="Symbol"
      >&#8594;</a
      ><a name="4604"
      > </a
      ><a name="4605" href="2016-10-25-linear-types-for-erlang-otp-1.html#2365" class="Datatype"
      >Type</a
      ><a name="4609"
      >
</a
      ><a name="4610" href="2016-10-25-linear-types-for-erlang-otp-1.html#4564" class="Function"
      >&#8853;-Fin</a
      ><a name="4615"
      > </a
      ><a name="4616" class="Symbol"
      >{</a
      ><a name="4617" href="2016-10-25-linear-types-for-erlang-otp-1.html#4617" class="Bound"
      >n</a
      ><a name="4618" class="Symbol"
      >}</a
      ><a name="4619"
      > </a
      ><a name="4620" href="2016-10-25-linear-types-for-erlang-otp-1.html#4620" class="Bound"
      >F</a
      ><a name="4621"
      > </a
      ><a name="4622" class="Symbol"
      >=</a
      ><a name="4623"
      > </a
      ><a name="4624" href="https://agda.github.io/agda-stdlib/Data.Vec.html#2745" class="Function"
      >foldr&#8321;</a
      ><a name="4630"
      > </a
      ><a name="4631" href="2016-10-25-linear-types-for-erlang-otp-1.html#2477" class="InductiveConstructor Operator"
      >_&#8853;_</a
      ><a name="4634"
      > </a
      ><a name="4635" class="Symbol"
      >(</a
      ><a name="4636" href="https://agda.github.io/agda-stdlib/Data.Vec.html#1999" class="Function"
      >map</a
      ><a name="4639"
      > </a
      ><a name="4640" href="2016-10-25-linear-types-for-erlang-otp-1.html#4620" class="Bound"
      >F</a
      ><a name="4641"
      > </a
      ><a name="4642" class="Symbol"
      >(</a
      ><a name="4643" href="https://agda.github.io/agda-stdlib/Data.Vec.html#6871" class="Function"
      >allFin</a
      ><a name="4649"
      > </a
      ><a name="4650" class="Symbol"
      >(</a
      ><a name="4651" class="Number"
      >2</a
      ><a name="4652"
      > </a
      ><a name="4653" href="Agda.Builtin.Nat.html#202" class="Primitive Operator"
      >+</a
      ><a name="4654"
      > </a
      ><a name="4655" href="2016-10-25-linear-types-for-erlang-otp-1.html#4617" class="Bound"
      >n</a
      ><a name="4656" class="Symbol"
      >)))</a
      >
</pre><!--{% endraw %}-->

We define a similar construction for with (`&`).

<!--{% raw %}--><pre class="Agda">
<a name="4735" class="Keyword"
      >syntax</a
      ><a name="4741"
      > &amp;-Fin </a
      ><a name="4748" class="Symbol"
      >(&#955;</a
      ><a name="4750"
      > i </a
      ><a name="4753" class="Symbol"
      >&#8594;</a
      ><a name="4754"
      > A</a
      ><a name="4756" class="Symbol"
      >)</a
      ><a name="4757"
      > </a
      ><a name="4758" class="Symbol"
      >=</a
      ><a name="4759"
      > &amp;[ i ] A

</a
      ><a name="4770" href="2016-10-25-linear-types-for-erlang-otp-1.html#4770" class="Function"
      >&amp;-Fin</a
      ><a name="4775"
      > </a
      ><a name="4776" class="Symbol"
      >:</a
      ><a name="4777"
      > </a
      ><a name="4778" class="Symbol"
      >&#8704;</a
      ><a name="4779"
      > </a
      ><a name="4780" class="Symbol"
      >{</a
      ><a name="4781" href="2016-10-25-linear-types-for-erlang-otp-1.html#4781" class="Bound"
      >n</a
      ><a name="4782" class="Symbol"
      >}</a
      ><a name="4783"
      > </a
      ><a name="4784" class="Symbol"
      >(</a
      ><a name="4785" href="2016-10-25-linear-types-for-erlang-otp-1.html#4785" class="Bound"
      >F</a
      ><a name="4786"
      > </a
      ><a name="4787" class="Symbol"
      >:</a
      ><a name="4788"
      > </a
      ><a name="4789" href="https://agda.github.io/agda-stdlib/Data.Fin.html#842" class="Datatype"
      >Fin</a
      ><a name="4792"
      > </a
      ><a name="4793" class="Symbol"
      >(</a
      ><a name="4794" class="Number"
      >2</a
      ><a name="4795"
      > </a
      ><a name="4796" href="Agda.Builtin.Nat.html#202" class="Primitive Operator"
      >+</a
      ><a name="4797"
      > </a
      ><a name="4798" href="2016-10-25-linear-types-for-erlang-otp-1.html#4781" class="Bound"
      >n</a
      ><a name="4799" class="Symbol"
      >)</a
      ><a name="4800"
      > </a
      ><a name="4801" class="Symbol"
      >&#8594;</a
      ><a name="4802"
      > </a
      ><a name="4803" href="2016-10-25-linear-types-for-erlang-otp-1.html#2365" class="Datatype"
      >Type</a
      ><a name="4807" class="Symbol"
      >)</a
      ><a name="4808"
      > </a
      ><a name="4809" class="Symbol"
      >&#8594;</a
      ><a name="4810"
      > </a
      ><a name="4811" href="2016-10-25-linear-types-for-erlang-otp-1.html#2365" class="Datatype"
      >Type</a
      ><a name="4815"
      >
</a
      ><a name="4816" href="2016-10-25-linear-types-for-erlang-otp-1.html#4770" class="Function"
      >&amp;-Fin</a
      ><a name="4821"
      > </a
      ><a name="4822" class="Symbol"
      >{</a
      ><a name="4823" href="2016-10-25-linear-types-for-erlang-otp-1.html#4823" class="Bound"
      >n</a
      ><a name="4824" class="Symbol"
      >}</a
      ><a name="4825"
      > </a
      ><a name="4826" href="2016-10-25-linear-types-for-erlang-otp-1.html#4826" class="Bound"
      >F</a
      ><a name="4827"
      > </a
      ><a name="4828" class="Symbol"
      >=</a
      ><a name="4829"
      > </a
      ><a name="4830" href="https://agda.github.io/agda-stdlib/Data.Vec.html#2745" class="Function"
      >foldr&#8321;</a
      ><a name="4836"
      > </a
      ><a name="4837" href="2016-10-25-linear-types-for-erlang-otp-1.html#2446" class="InductiveConstructor Operator"
      >_&amp;_</a
      ><a name="4840"
      > </a
      ><a name="4841" class="Symbol"
      >(</a
      ><a name="4842" href="https://agda.github.io/agda-stdlib/Data.Vec.html#1999" class="Function"
      >map</a
      ><a name="4845"
      > </a
      ><a name="4846" href="2016-10-25-linear-types-for-erlang-otp-1.html#4826" class="Bound"
      >F</a
      ><a name="4847"
      > </a
      ><a name="4848" class="Symbol"
      >(</a
      ><a name="4849" href="https://agda.github.io/agda-stdlib/Data.Vec.html#6871" class="Function"
      >allFin</a
      ><a name="4855"
      > </a
      ><a name="4856" class="Symbol"
      >(</a
      ><a name="4857" class="Number"
      >2</a
      ><a name="4858"
      > </a
      ><a name="4859" href="Agda.Builtin.Nat.html#202" class="Primitive Operator"
      >+</a
      ><a name="4860"
      > </a
      ><a name="4861" href="2016-10-25-linear-types-for-erlang-otp-1.html#4823" class="Bound"
      >n</a
      ><a name="4862" class="Symbol"
      >)))</a
      >
</pre><!--{% endraw %}-->

This is as good a time as any to mention that this post is *both*
literate Agda and literate [CP](https://github.com/pepijnkokke/cpgv).


## The Road to the Generic Server: The Basic Server

In the first few posts, I will let myself be guided by Joe Armstrong's
*Road to the Generic Server*[^armstrong], in which he explains what he
considers to be the most important part of Erlang---the generic server.

Below I've reproduced (without any permission) a small Erlang module
from Joe's book. This module implements the first generic server: it
exports the function `start/2`, which starts a server which behaves
according to some request handler, and the function `rpc/2`,
which---as it's name suggests---sends procedure calls to the server.
In this first attempt, the server merely receives requests, and
handles them using the given request handler.

``` erlang
module(server1).
export([start/2, rpc/2]).

start(Name, Mod) ->
  register(Name, spawn(fun() -> loop(Name, Mod, Mod:init()) end)).

rpc(Name, Request) ->
  Name ! {self(), Request},
  receive
    {Name, Response} -> Response
  end.

loop(Name, Mod, State) ->
  receive
    {From, Request} ->
      {Response, State1} = Mod:handle(Request, State),
      From ! {Name, Response},
      loop(Name, Mod, State1}
  end.
```

Joe then writes a small request handler for `server1`. This handler
can handle two types of requests: `add` and `whereis`.
For example, the request `{add,joe,at_home}` will tell the server
that joe is currently at home---this overwrites any previous knowledge
the server might've had about Joe's location. The request
`{whereis,joe}` will ask the server where Joe is.

This behaviour is implemented in the function `handle/2`. The
functions `add` and `whereis` then communicate with the `name_server`
by sending remote proceduce calls using `rpc/2`.

``` erlang
module(name_server).
export([init/0, add/2, whereis/1, handle/2]).
import(server1, [rpc/2]).

%% client routines
add(Name, Place) -> rpc(name_server, {add, Name, Place}).
whereis(Name)    -> rpc(name_server, {whereis, Name}).

%% callback routines
init() -> dict::new().

handle({add, Name, Place}, Dict) -> {ok, dict:store(Name, Place, Dict)};
handle({whereis, Name}, Dict)    -> {dict:find(Name, Dict), Dict}.
```

The point is this: We specified a server and its client as a
sequential function---`handle`---and a pair of remote procedure
calls. We didn't have to be aware of any underlying concurreny.

If we want to use the `name_server` module, we simply start a
server---the only telltale sign that some measure of concurrency is
involved---and then use the exposed remote procedure calls.

``` erlang
1> server1:start(name_server, name_server).
true
2> name_server:add(joe, "at home").
ok
3> name_server:whereis(joe).
{ok, "at home"}
```


## A generic server in Classical Processes?

Before we start to think about how to translate `server1` to CP, it
may be useful to consider which parts are essential, and which parts
are merely useful. For instance, starting the server and binding it to
a global name---using `register/2` might be incredible useful.
However, such instances of dynamic name binding are tedious to
formalise. Instead, we choose to read this code more like an assignment.

``` erlang
main() ->
  name_server = spawn(fun() -> loop(...) end).
  ...
```

This allows us to treat the spawning of a server as a top-level cut,
and the PID assigned to `name_server` as a channel.

This means that the main problem is implementing `loop/2`. If we
briefly consider the arguments of loop, we see that it should receive
some initial state `Init`, and some request handler `Mod`---the `Name`
argument is no longer required.
The type of the initial state can be whatever we need. However, the
type of the request handler should be a sum of "handler functions"...

``` coq
Handler := +{ ... callback types ...  }
```

The server that it returns should be able to handle various requests,
which should correspond to the requests handled by `Mod`...

``` coq
Server := +{ ... similar callback types without state ... } * Server
```

This constraint may be somewhat tricky---if not impossible---to
formalise using the types of CP... so it may be easier to start out by
implementing the `name_server`.


## A name server in Classical Processes

Of course, if our exercise in implementing the `name_server` is to
have any value, we must use the same structure that we would use
generically. That is to say, we should construct it using a
"sequential" request handler and a loop function.
This is what we will do... in a while...

### Names, places, stuff...

CP doesn't exactly come with a rich standard library, which means
we'll have to implement the datatypes we need. First, we implement two
datatypes to represent names and places. We'll represent both as
named sums: all possible names are `joe` and `helen`, and all possible
places are `at_home` and `at_work`---that second one at least seems
general enough to me.

In addition to these basic types, we define the processes which
communicate these values along a channel. And because we'll often use
places in non-linear manners---because it's convenient, not because
it's needed---we'll have their processes communicate !-places instead.

``` haskell
type  Name      = +{joe:1, helen:1}.
type  Place     = +{at_home:1, at_work:1}.

check Joe(n)    |- n : Name.
def   Joe(n)    = n/joe.n[].0.
check Helen(n)  |- n : Name.
def   Helen(n)  = n/helen.n[].0.

check AtHome(p) |- p : !Place.
def   AtHome(p) = !p(p).p/at_home.p[].0.
check AtWork(p) |- p : !Place.
def   AtWork(p) = !p(p).p/at_work.p[].0.
```

Secondly, we define dictionaries. That is to say, finite maps between
names and (maybe) places. We really don't want to get into defining
generic maps right now, trust me.

``` haskell
type Maybe(A) = +{nothing:1, just:A}.
type Dict     = Name -o Maybe(Place).
```

To use such dictionaries, we define a couple functions:

  - `Empty(d)` sends an empty dictionary along d;
  - `Store(d,n,p,d1)` receives a dictionary d, a name n, and a
    place p, and then sends a dictionary along d1 which maps n
    to p and all other names according to d; and,
  - `Find(d,n,p)` receives a dictionary d and a name n,
    and sends the place associated with n according to d along p.

What you'd expect them to do, basically. Their definitions have been
folded because they're tedious and the post isn't really concerned
with how to implement dictionaries---nor would they help you if we
really wanted to implement a generic dictionary. Feel free to inspect
them, though.

``` haskell
check Empty(d) |- d : !Dict.
def   Empty(d)
      = !d(d).d(n).case n
        { joe   : n().d/nothing.d[].0
        ; helen : n().d/nothing.d[].0
        }.
```
{:.foldable}

``` haskell
check Store(d,n,p,d1) |- d : ~!Dict, n : ~Name, p : ~!Place, d1 : !Dict.
def   Store(d,n,p,d1)
      = case n
        { joe   : n().!d1(d1).d1(n1).case n1
          { joe   : n1().?p[p].d1/just.d1<->p
          ; helen : n1().?d[d].d[d].( d/helen.d[].0 | d1<->d )
          }
        ; helen : n().!d1(d1).d1(n1).case n1
          { joe   : n1().?d[d].d[d].( d/helen.d[].0 | d1<->d )
          ; helen : n1().?p[p].d1/just.d1<->p
          }
        }.
```
{:.foldable}

``` haskell
check Find(d,n,p) |- d : ~!Dict, n : ~Name, p : !Maybe(Place).
def   Find(d,n,p)
      = case n
        { joe   : ?d[d].d[d].( d/joe.d[].0
        | n().case d
          { nothing : d().!p(p).p/nothing.p[].0
          ; just    : case d
            { at_home : d().!p(p).p/just.p/at_home.p[].0
            ; at_work : d().!p(p).p/just.p/at_work.p[].0
            }})
        ; helen : ?d[d].d[d].( d/helen.d[].0
        | n().case d
          { nothing : d().!p(p).p/nothing.p[].0
          ; just    : case d
            { at_home : d().!p(p).p/just.p/at_home.p[].0
            ; at_work : d().!p(p).p/just.p/at_work.p[].0
            }})}.
```
{:.foldable}

While we're at it, we should probably tell Agda about these types.

<div class="foldable">
<!--{% raw %}--><pre class="Agda">
<a name="12901" href="2016-10-25-linear-types-for-erlang-otp-1.html#12901" class="Function"
      >Maybe</a
      ><a name="12906"
      > </a
      ><a name="12907" class="Symbol"
      >:</a
      ><a name="12908"
      > </a
      ><a name="12909" href="2016-10-25-linear-types-for-erlang-otp-1.html#2365" class="Datatype"
      >Type</a
      ><a name="12913"
      > </a
      ><a name="12914" class="Symbol"
      >&#8594;</a
      ><a name="12915"
      > </a
      ><a name="12916" href="2016-10-25-linear-types-for-erlang-otp-1.html#2365" class="Datatype"
      >Type</a
      ><a name="12920"
      >
</a
      ><a name="12921" href="2016-10-25-linear-types-for-erlang-otp-1.html#12901" class="Function"
      >Maybe</a
      ><a name="12926"
      > </a
      ><a name="12927" href="2016-10-25-linear-types-for-erlang-otp-1.html#12927" class="Bound"
      >A</a
      ><a name="12928"
      > </a
      ><a name="12929" class="Symbol"
      >=</a
      ><a name="12930"
      > </a
      ><a name="12931" href="2016-10-25-linear-types-for-erlang-otp-1.html#2433" class="InductiveConstructor"
      >&#120793;</a
      ><a name="12932"
      > </a
      ><a name="12933" href="2016-10-25-linear-types-for-erlang-otp-1.html#2477" class="InductiveConstructor Operator"
      >&#8853;</a
      ><a name="12934"
      > </a
      ><a name="12935" href="2016-10-25-linear-types-for-erlang-otp-1.html#12927" class="Bound"
      >A</a
      ><a name="12936"
      >
</a
      ><a name="12937" href="2016-10-25-linear-types-for-erlang-otp-1.html#12937" class="Function"
      >Name</a
      ><a name="12941"
      >    </a
      ><a name="12945" class="Symbol"
      >=</a
      ><a name="12946"
      > </a
      ><a name="12947" href="2016-10-25-linear-types-for-erlang-otp-1.html#2433" class="InductiveConstructor"
      >&#120793;</a
      ><a name="12948"
      > </a
      ><a name="12949" href="2016-10-25-linear-types-for-erlang-otp-1.html#2477" class="InductiveConstructor Operator"
      >&#8853;</a
      ><a name="12950"
      > </a
      ><a name="12951" href="2016-10-25-linear-types-for-erlang-otp-1.html#2433" class="InductiveConstructor"
      >&#120793;</a
      ><a name="12952"
      >
</a
      ><a name="12953" href="2016-10-25-linear-types-for-erlang-otp-1.html#12953" class="Function"
      >Place</a
      ><a name="12958"
      >   </a
      ><a name="12961" class="Symbol"
      >=</a
      ><a name="12962"
      > </a
      ><a name="12963" href="2016-10-25-linear-types-for-erlang-otp-1.html#2433" class="InductiveConstructor"
      >&#120793;</a
      ><a name="12964"
      > </a
      ><a name="12965" href="2016-10-25-linear-types-for-erlang-otp-1.html#2477" class="InductiveConstructor Operator"
      >&#8853;</a
      ><a name="12966"
      > </a
      ><a name="12967" href="2016-10-25-linear-types-for-erlang-otp-1.html#2433" class="InductiveConstructor"
      >&#120793;</a
      ><a name="12968"
      >
</a
      ><a name="12969" href="2016-10-25-linear-types-for-erlang-otp-1.html#12969" class="Function"
      >Dict</a
      ><a name="12973"
      >    </a
      ><a name="12977" class="Symbol"
      >=</a
      ><a name="12978"
      > </a
      ><a name="12979" href="2016-10-25-linear-types-for-erlang-otp-1.html#12937" class="Function"
      >Name</a
      ><a name="12983"
      > </a
      ><a name="12984" href="2016-10-25-linear-types-for-erlang-otp-1.html#3772" class="Function Operator"
      >&#8888;</a
      ><a name="12985"
      > </a
      ><a name="12986" href="2016-10-25-linear-types-for-erlang-otp-1.html#12901" class="Function"
      >Maybe</a
      ><a name="12991"
      > </a
      ><a name="12992" href="2016-10-25-linear-types-for-erlang-otp-1.html#12953" class="Function"
      >Place</a
      >
</pre><!--{% endraw %}-->
</div>


### Modules and their types

We can implement the type of the `name_server`... euh... module
as... well, as follows: it should respond to either `add` or
`whereis`. In the first case, it should receive a name, a place and a
dict, and it'll reply with *nothing*, but update the dictionary. In
the second case, it'll receive just a name *n* and a dict---and it'll
reply with whatever location it finds in the dict under *n*, but it'll
leave it dict unchanged.

``` haskell
type  Module =
      &{ add     : (Name * !Place * !Dict) -o (1 * !Dict)
       , whereis : (Name * !Dict) -o (!Maybe(Place) * !Dict)
       }.
```

We can implement a `name_server` module which does what it ought to do in CP.

``` haskell
check Module(h) |- h : !Module.
def   Module(h) = !h(h).case h
      { add     : h(d).d(p).p(n).h[x].( x[].0 | Store(d,n,p,h) )
      ; whereis : h(d).d(n).h[p].( Find(d,n,p) | h<->d )
      }.
```

There *is* a generic pattern to module types: they form a named
"with", in which the types of each option follow a specific pattern,
but are allowed to vary in some parameters with the *name*.

<!--{% raw %}--><pre class="Agda">
<a name="14135" href="2016-10-25-linear-types-for-erlang-otp-1.html#14135" class="Function"
      >Module</a
      ><a name="14141"
      > </a
      ><a name="14142" class="Symbol"
      >:</a
      ><a name="14143"
      > </a
      ><a name="14144" class="Symbol"
      >&#8704;</a
      ><a name="14145"
      > </a
      ><a name="14146" class="Symbol"
      >{</a
      ><a name="14147" href="2016-10-25-linear-types-for-erlang-otp-1.html#14147" class="Bound"
      >n</a
      ><a name="14148" class="Symbol"
      >}</a
      ><a name="14149"
      > </a
      ><a name="14150" class="Symbol"
      >(</a
      ><a name="14151" href="2016-10-25-linear-types-for-erlang-otp-1.html#14151" class="Bound"
      >A</a
      ><a name="14152"
      > </a
      ><a name="14153" href="2016-10-25-linear-types-for-erlang-otp-1.html#14153" class="Bound"
      >R</a
      ><a name="14154"
      > </a
      ><a name="14155" class="Symbol"
      >:</a
      ><a name="14156"
      > </a
      ><a name="14157" href="https://agda.github.io/agda-stdlib/Data.Fin.html#842" class="Datatype"
      >Fin</a
      ><a name="14160"
      > </a
      ><a name="14161" class="Symbol"
      >(</a
      ><a name="14162" class="Number"
      >2</a
      ><a name="14163"
      > </a
      ><a name="14164" href="Agda.Builtin.Nat.html#202" class="Primitive Operator"
      >+</a
      ><a name="14165"
      > </a
      ><a name="14166" href="2016-10-25-linear-types-for-erlang-otp-1.html#14147" class="Bound"
      >n</a
      ><a name="14167" class="Symbol"
      >)</a
      ><a name="14168"
      > </a
      ><a name="14169" class="Symbol"
      >&#8594;</a
      ><a name="14170"
      > </a
      ><a name="14171" href="2016-10-25-linear-types-for-erlang-otp-1.html#2365" class="Datatype"
      >Type</a
      ><a name="14175" class="Symbol"
      >)</a
      ><a name="14176"
      > </a
      ><a name="14177" class="Symbol"
      >(</a
      ><a name="14178" href="2016-10-25-linear-types-for-erlang-otp-1.html#14178" class="Bound"
      >S</a
      ><a name="14179"
      > </a
      ><a name="14180" class="Symbol"
      >:</a
      ><a name="14181"
      > </a
      ><a name="14182" href="2016-10-25-linear-types-for-erlang-otp-1.html#2365" class="Datatype"
      >Type</a
      ><a name="14186" class="Symbol"
      >)</a
      ><a name="14187"
      > </a
      ><a name="14188" class="Symbol"
      >&#8594;</a
      ><a name="14189"
      > </a
      ><a name="14190" href="2016-10-25-linear-types-for-erlang-otp-1.html#2365" class="Datatype"
      >Type</a
      ><a name="14194"
      >
</a
      ><a name="14195" href="2016-10-25-linear-types-for-erlang-otp-1.html#14135" class="Function"
      >Module</a
      ><a name="14201"
      > </a
      ><a name="14202" href="2016-10-25-linear-types-for-erlang-otp-1.html#14202" class="Bound"
      >A</a
      ><a name="14203"
      > </a
      ><a name="14204" href="2016-10-25-linear-types-for-erlang-otp-1.html#14204" class="Bound"
      >R</a
      ><a name="14205"
      > </a
      ><a name="14206" href="2016-10-25-linear-types-for-erlang-otp-1.html#14206" class="Bound"
      >S</a
      ><a name="14207"
      > </a
      ><a name="14208" class="Symbol"
      >=</a
      ><a name="14209"
      > </a
      ><a name="14210" href="2016-10-25-linear-types-for-erlang-otp-1.html#4770" class="Function"
      >&amp;[</a
      ><a name="14212"
      > </a
      ><a name="14213" href="2016-10-25-linear-types-for-erlang-otp-1.html#14213" class="Bound"
      >i</a
      ><a name="14214"
      > </a
      ><a name="14215" href="2016-10-25-linear-types-for-erlang-otp-1.html#4770" class="Function"
      >]</a
      ><a name="14216"
      > </a
      ><a name="14217" class="Symbol"
      >(</a
      ><a name="14218" href="2016-10-25-linear-types-for-erlang-otp-1.html#14202" class="Bound"
      >A</a
      ><a name="14219"
      > </a
      ><a name="14220" href="2016-10-25-linear-types-for-erlang-otp-1.html#14213" class="Bound"
      >i</a
      ><a name="14221"
      > </a
      ><a name="14222" href="2016-10-25-linear-types-for-erlang-otp-1.html#2481" class="InductiveConstructor Operator"
      >&#8855;</a
      ><a name="14223"
      > </a
      ><a name="14224" href="2016-10-25-linear-types-for-erlang-otp-1.html#14206" class="Bound"
      >S</a
      ><a name="14225"
      > </a
      ><a name="14226" href="2016-10-25-linear-types-for-erlang-otp-1.html#3772" class="Function Operator"
      >&#8888;</a
      ><a name="14227"
      > </a
      ><a name="14228" href="2016-10-25-linear-types-for-erlang-otp-1.html#14204" class="Bound"
      >R</a
      ><a name="14229"
      > </a
      ><a name="14230" href="2016-10-25-linear-types-for-erlang-otp-1.html#14213" class="Bound"
      >i</a
      ><a name="14231"
      > </a
      ><a name="14232" href="2016-10-25-linear-types-for-erlang-otp-1.html#2481" class="InductiveConstructor Operator"
      >&#8855;</a
      ><a name="14233"
      > </a
      ><a name="14234" href="2016-10-25-linear-types-for-erlang-otp-1.html#14206" class="Bound"
      >S</a
      ><a name="14235" class="Symbol"
      >)</a
      >
</pre><!--{% endraw %}-->

We can use this type to derive the type for the `name_server`
module. First, we defined a datatype for requests. We can either
define this as a datatype, and then provide a bijection with a finite
type, or we can simply define it as some syntactic sugar on top of
finite types. We'll choose the second option here.

<!--{% raw %}--><pre class="Agda">
<a name="14578" href="2016-10-25-linear-types-for-erlang-otp-1.html#14578" class="Function"
      >Request</a
      ><a name="14585"
      > </a
      ><a name="14586" class="Symbol"
      >=</a
      ><a name="14587"
      > </a
      ><a name="14588" href="https://agda.github.io/agda-stdlib/Data.Fin.html#842" class="Datatype"
      >Fin</a
      ><a name="14591"
      > </a
      ><a name="14592" class="Number"
      >2</a
      ><a name="14593"
      >
</a
      ><a name="14594" class="Keyword"
      >pattern</a
      ><a name="14601"
      > </a
      ><a name="14602" href="2016-10-25-linear-types-for-erlang-otp-1.html#14602" class="InductiveConstructor"
      >add</a
      ><a name="14605"
      >     </a
      ><a name="14610" class="Symbol"
      >=</a
      ><a name="14611"
      > </a
      ><a name="14612" href="https://agda.github.io/agda-stdlib/Data.Fin.html#864" class="InductiveConstructor"
      >zero</a
      ><a name="14616"
      >
</a
      ><a name="14617" class="Keyword"
      >pattern</a
      ><a name="14624"
      > </a
      ><a name="14625" href="2016-10-25-linear-types-for-erlang-otp-1.html#14625" class="InductiveConstructor"
      >whereis</a
      ><a name="14632"
      > </a
      ><a name="14633" class="Symbol"
      >=</a
      ><a name="14634"
      > </a
      ><a name="14635" href="https://agda.github.io/agda-stdlib/Data.Fin.html#895" class="InductiveConstructor"
      >suc</a
      ><a name="14638"
      > </a
      ><a name="14639" href="https://agda.github.io/agda-stdlib/Data.Fin.html#864" class="InductiveConstructor"
      >zero</a
      ><a name="14643"
      >
</a
      ><a name="14644" class="Keyword"
      >pattern</a
      ><a name="14651"
      > </a
      ><a name="14652" href="2016-10-25-linear-types-for-erlang-otp-1.html#14652" class="InductiveConstructor"
      >end</a
      ><a name="14655"
      >     </a
      ><a name="14660" class="Symbol"
      >=</a
      ><a name="14661"
      > </a
      ><a name="14662" href="https://agda.github.io/agda-stdlib/Data.Fin.html#895" class="InductiveConstructor"
      >suc</a
      ><a name="14665"
      > </a
      ><a name="14666" class="Symbol"
      >(</a
      ><a name="14667" href="https://agda.github.io/agda-stdlib/Data.Fin.html#895" class="InductiveConstructor"
      >suc</a
      ><a name="14670"
      > </a
      ><a name="14671" class="Symbol"
      >())</a
      >
</pre><!--{% endraw %}-->

Once we have a type for requests, we can define the `A`, `R` and `S`
parameters of `Module`.

<!--{% raw %}--><pre class="Agda">
<a name="14794" href="2016-10-25-linear-types-for-erlang-otp-1.html#14794" class="Function"
      >A</a
      ><a name="14795"
      > </a
      ><a name="14796" class="Symbol"
      >:</a
      ><a name="14797"
      > </a
      ><a name="14798" href="2016-10-25-linear-types-for-erlang-otp-1.html#14578" class="Function"
      >Request</a
      ><a name="14805"
      > </a
      ><a name="14806" class="Symbol"
      >&#8594;</a
      ><a name="14807"
      > </a
      ><a name="14808" href="2016-10-25-linear-types-for-erlang-otp-1.html#2365" class="Datatype"
      >Type</a
      ><a name="14812"
      >
</a
      ><a name="14813" href="2016-10-25-linear-types-for-erlang-otp-1.html#14794" class="Function"
      >A</a
      ><a name="14814"
      > </a
      ><a name="14815" href="2016-10-25-linear-types-for-erlang-otp-1.html#14602" class="InductiveConstructor"
      >add</a
      ><a name="14818"
      >     </a
      ><a name="14823" class="Symbol"
      >=</a
      ><a name="14824"
      > </a
      ><a name="14825" href="2016-10-25-linear-types-for-erlang-otp-1.html#12937" class="Function"
      >Name</a
      ><a name="14829"
      > </a
      ><a name="14830" href="2016-10-25-linear-types-for-erlang-otp-1.html#2481" class="InductiveConstructor Operator"
      >&#8855;</a
      ><a name="14831"
      > </a
      ><a name="14832" href="2016-10-25-linear-types-for-erlang-otp-1.html#2508" class="InductiveConstructor Operator"
      >&#161;</a
      ><a name="14833"
      > </a
      ><a name="14834" href="2016-10-25-linear-types-for-erlang-otp-1.html#12953" class="Function"
      >Place</a
      ><a name="14839"
      >
</a
      ><a name="14840" href="2016-10-25-linear-types-for-erlang-otp-1.html#14794" class="Function"
      >A</a
      ><a name="14841"
      > </a
      ><a name="14842" href="2016-10-25-linear-types-for-erlang-otp-1.html#14625" class="InductiveConstructor"
      >whereis</a
      ><a name="14849"
      > </a
      ><a name="14850" class="Symbol"
      >=</a
      ><a name="14851"
      > </a
      ><a name="14852" href="2016-10-25-linear-types-for-erlang-otp-1.html#12937" class="Function"
      >Name</a
      ><a name="14856"
      >
</a
      ><a name="14857" href="2016-10-25-linear-types-for-erlang-otp-1.html#14794" class="Function"
      >A</a
      ><a name="14858"
      > </a
      ><a name="14859" href="2016-10-25-linear-types-for-erlang-otp-1.html#14652" class="InductiveConstructor"
      >end</a
      ><a name="14862"
      >

</a
      ><a name="14864" href="2016-10-25-linear-types-for-erlang-otp-1.html#14864" class="Function"
      >R</a
      ><a name="14865"
      > </a
      ><a name="14866" class="Symbol"
      >:</a
      ><a name="14867"
      > </a
      ><a name="14868" href="2016-10-25-linear-types-for-erlang-otp-1.html#14578" class="Function"
      >Request</a
      ><a name="14875"
      > </a
      ><a name="14876" class="Symbol"
      >&#8594;</a
      ><a name="14877"
      > </a
      ><a name="14878" href="2016-10-25-linear-types-for-erlang-otp-1.html#2365" class="Datatype"
      >Type</a
      ><a name="14882"
      >
</a
      ><a name="14883" href="2016-10-25-linear-types-for-erlang-otp-1.html#14864" class="Function"
      >R</a
      ><a name="14884"
      > </a
      ><a name="14885" href="2016-10-25-linear-types-for-erlang-otp-1.html#14602" class="InductiveConstructor"
      >add</a
      ><a name="14888"
      >     </a
      ><a name="14893" class="Symbol"
      >=</a
      ><a name="14894"
      > </a
      ><a name="14895" href="2016-10-25-linear-types-for-erlang-otp-1.html#2433" class="InductiveConstructor"
      >&#120793;</a
      ><a name="14896"
      >
</a
      ><a name="14897" href="2016-10-25-linear-types-for-erlang-otp-1.html#14864" class="Function"
      >R</a
      ><a name="14898"
      > </a
      ><a name="14899" href="2016-10-25-linear-types-for-erlang-otp-1.html#14625" class="InductiveConstructor"
      >whereis</a
      ><a name="14906"
      > </a
      ><a name="14907" class="Symbol"
      >=</a
      ><a name="14908"
      > </a
      ><a name="14909" href="2016-10-25-linear-types-for-erlang-otp-1.html#2508" class="InductiveConstructor Operator"
      >&#161;</a
      ><a name="14910"
      > </a
      ><a name="14911" href="2016-10-25-linear-types-for-erlang-otp-1.html#12901" class="Function"
      >Maybe</a
      ><a name="14916"
      > </a
      ><a name="14917" href="2016-10-25-linear-types-for-erlang-otp-1.html#12953" class="Function"
      >Place</a
      ><a name="14922"
      >
</a
      ><a name="14923" href="2016-10-25-linear-types-for-erlang-otp-1.html#14864" class="Function"
      >R</a
      ><a name="14924"
      > </a
      ><a name="14925" href="2016-10-25-linear-types-for-erlang-otp-1.html#14652" class="InductiveConstructor"
      >end</a
      ><a name="14928"
      >

</a
      ><a name="14930" href="2016-10-25-linear-types-for-erlang-otp-1.html#14930" class="Function"
      >S</a
      ><a name="14931"
      > </a
      ><a name="14932" class="Symbol"
      >:</a
      ><a name="14933"
      > </a
      ><a name="14934" href="2016-10-25-linear-types-for-erlang-otp-1.html#2365" class="Datatype"
      >Type</a
      ><a name="14938"
      >
</a
      ><a name="14939" href="2016-10-25-linear-types-for-erlang-otp-1.html#14930" class="Function"
      >S</a
      ><a name="14940"
      > </a
      ><a name="14941" class="Symbol"
      >=</a
      ><a name="14942"
      > </a
      ><a name="14943" href="2016-10-25-linear-types-for-erlang-otp-1.html#2508" class="InductiveConstructor Operator"
      >&#161;</a
      ><a name="14944"
      > </a
      ><a name="14945" href="2016-10-25-linear-types-for-erlang-otp-1.html#12969" class="Function"
      >Dict</a
      >
</pre><!--{% endraw %}-->

Now we can show that `Module A R S` indeed derives the correct type.

<!--{% raw %}--><pre class="Agda">
<a name="15045" href="2016-10-25-linear-types-for-erlang-otp-1.html#15045" class="Function"
      >NameModule</a
      ><a name="15055"
      > </a
      ><a name="15056" class="Symbol"
      >=</a
      ><a name="15057"
      > </a
      ><a name="15058" href="2016-10-25-linear-types-for-erlang-otp-1.html#14135" class="Function"
      >Module</a
      ><a name="15064"
      > </a
      ><a name="15065" href="2016-10-25-linear-types-for-erlang-otp-1.html#14794" class="Function"
      >A</a
      ><a name="15066"
      > </a
      ><a name="15067" href="2016-10-25-linear-types-for-erlang-otp-1.html#14864" class="Function"
      >R</a
      ><a name="15068"
      > </a
      ><a name="15069" href="2016-10-25-linear-types-for-erlang-otp-1.html#14930" class="Function"
      >S</a
      ><a name="15070"
      >
</a
      ><a name="15071" class="Comment"
      >--&gt;</a
      ><a name="15074"
      >
</a
      ><a name="15075" href="2016-10-25-linear-types-for-erlang-otp-1.html#15075" class="Function Operator"
      >test_NameModule</a
      ><a name="15090"
      > </a
      ><a name="15091" class="Symbol"
      >:</a
      ><a name="15092"
      > </a
      ><a name="15093" href="2016-10-25-linear-types-for-erlang-otp-1.html#15045" class="Function"
      >NameModule</a
      ><a name="15103"
      > </a
      ><a name="15104" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="15105"
      >
  </a
      ><a name="15108" class="Comment"
      >{- add     -}</a
      ><a name="15121"
      > </a
      ><a name="15122" class="Symbol"
      >(</a
      ><a name="15123" href="2016-10-25-linear-types-for-erlang-otp-1.html#12937" class="Function"
      >Name</a
      ><a name="15127"
      > </a
      ><a name="15128" href="2016-10-25-linear-types-for-erlang-otp-1.html#2481" class="InductiveConstructor Operator"
      >&#8855;</a
      ><a name="15129"
      > </a
      ><a name="15130" href="2016-10-25-linear-types-for-erlang-otp-1.html#2508" class="InductiveConstructor Operator"
      >&#161;</a
      ><a name="15131"
      > </a
      ><a name="15132" href="2016-10-25-linear-types-for-erlang-otp-1.html#12953" class="Function"
      >Place</a
      ><a name="15137"
      > </a
      ><a name="15138" href="2016-10-25-linear-types-for-erlang-otp-1.html#2481" class="InductiveConstructor Operator"
      >&#8855;</a
      ><a name="15139"
      > </a
      ><a name="15140" href="2016-10-25-linear-types-for-erlang-otp-1.html#2508" class="InductiveConstructor Operator"
      >&#161;</a
      ><a name="15141"
      > </a
      ><a name="15142" href="2016-10-25-linear-types-for-erlang-otp-1.html#12969" class="Function"
      >Dict</a
      ><a name="15146"
      > </a
      ><a name="15147" href="2016-10-25-linear-types-for-erlang-otp-1.html#3772" class="Function Operator"
      >&#8888;</a
      ><a name="15148"
      > </a
      ><a name="15149" href="2016-10-25-linear-types-for-erlang-otp-1.html#2433" class="InductiveConstructor"
      >&#120793;</a
      ><a name="15150"
      >             </a
      ><a name="15163" href="2016-10-25-linear-types-for-erlang-otp-1.html#2481" class="InductiveConstructor Operator"
      >&#8855;</a
      ><a name="15164"
      > </a
      ><a name="15165" href="2016-10-25-linear-types-for-erlang-otp-1.html#2508" class="InductiveConstructor Operator"
      >&#161;</a
      ><a name="15166"
      > </a
      ><a name="15167" href="2016-10-25-linear-types-for-erlang-otp-1.html#12969" class="Function"
      >Dict</a
      ><a name="15171" class="Symbol"
      >)</a
      ><a name="15172"
      > </a
      ><a name="15173" href="2016-10-25-linear-types-for-erlang-otp-1.html#2446" class="InductiveConstructor Operator"
      >&amp;</a
      ><a name="15174"
      >
  </a
      ><a name="15177" class="Comment"
      >{- whereis -}</a
      ><a name="15190"
      > </a
      ><a name="15191" class="Symbol"
      >(</a
      ><a name="15192" href="2016-10-25-linear-types-for-erlang-otp-1.html#12937" class="Function"
      >Name</a
      ><a name="15196"
      >           </a
      ><a name="15207" href="2016-10-25-linear-types-for-erlang-otp-1.html#2481" class="InductiveConstructor Operator"
      >&#8855;</a
      ><a name="15208"
      > </a
      ><a name="15209" href="2016-10-25-linear-types-for-erlang-otp-1.html#2508" class="InductiveConstructor Operator"
      >&#161;</a
      ><a name="15210"
      > </a
      ><a name="15211" href="2016-10-25-linear-types-for-erlang-otp-1.html#12969" class="Function"
      >Dict</a
      ><a name="15215"
      > </a
      ><a name="15216" href="2016-10-25-linear-types-for-erlang-otp-1.html#3772" class="Function Operator"
      >&#8888;</a
      ><a name="15217"
      > </a
      ><a name="15218" href="2016-10-25-linear-types-for-erlang-otp-1.html#2508" class="InductiveConstructor Operator"
      >&#161;</a
      ><a name="15219"
      > </a
      ><a name="15220" href="2016-10-25-linear-types-for-erlang-otp-1.html#12901" class="Function"
      >Maybe</a
      ><a name="15225"
      > </a
      ><a name="15226" href="2016-10-25-linear-types-for-erlang-otp-1.html#12953" class="Function"
      >Place</a
      ><a name="15231"
      > </a
      ><a name="15232" href="2016-10-25-linear-types-for-erlang-otp-1.html#2481" class="InductiveConstructor Operator"
      >&#8855;</a
      ><a name="15233"
      > </a
      ><a name="15234" href="2016-10-25-linear-types-for-erlang-otp-1.html#2508" class="InductiveConstructor Operator"
      >&#161;</a
      ><a name="15235"
      > </a
      ><a name="15236" href="2016-10-25-linear-types-for-erlang-otp-1.html#12969" class="Function"
      >Dict</a
      ><a name="15240" class="Symbol"
      >)</a
      ><a name="15241"
      >
</a
      ><a name="15242" href="2016-10-25-linear-types-for-erlang-otp-1.html#15075" class="Function Operator"
      >test_NameModule</a
      ><a name="15257"
      > </a
      ><a name="15258" class="Symbol"
      >=</a
      ><a name="15259"
      > </a
      ><a name="15260" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      >
</pre><!--{% endraw %}-->


### Servers and loops

The server type is *similar* to that of the module, but different in
subtle ways. First of all, a module only needs to handle a single
request. However, a server---after handling a request---should be
ready to receive the next one.

Therefore, server types are greatest fixed points: they will handle a
request, and return a new channel on which they can receive requests.
Ideally, this wouldn't *need* to terminate---we can hold the server
channel for a while, and then return it to the environment when we are
done interacting.[^locks] However, for practical purposes, we'll have
the server respond to a request to `halt`, in addition to the
`name_server` requests `add` and `whereis`.

``` haskell
type  Server = nu X.
      &{ halt    : 1
       , add     : (!Name * !Place) -o (1 * X)
       , whereis : !Name -o (!Maybe(Place) * X)
       }.
```

Now, our mission is to construct a server using a module and an
initial state---to define `loop`. This---it turns out---is not
possible in CP. The reason for this is the definition of the
$$(\nu)$$-rule.

As it is defined in *Talking Bananas*[^talkban], corec is only
well-type if the context consists *solely* of the channels involved in
the recursion. This is crucial to preserve linearity, since channels
involved in a recursion may be used an arbitrary number of
times. However, it should not be harmful to allow a context of
unrestricted channels (and perhaps fixed points) to be used during the
recursion. We define $$(\nu')$$ to be the variant which allows this.

$$
    \frac%
    {P \vdash y : A^{\bot}, x : F(A)}%
    {\text{corec }x(y).P \vdash y : A^{\bot}, x : \nu F}%
    (\nu)
    \qquad
    \frac%
    {P \vdash !\Gamma, y : A^{\bot}, x : F(A)}%
    {\text{corec }x(y).P \vdash !\Gamma, y : A^{\bot}, x : \nu F}%
    (\nu')
$$

It turns out that such a rule is exactly what we need to define
`loop`. The loop is a fold over all requests the server will receive,
with the corec threading the state through the server. The freedom
that we gained in $$(\nu')$$ is exactly what we needed to be able to
*respond* to requests---albeit always non-linearily.[^munu]

``` haskell
check Loop(d,h,s) |- d : ~!Dict, h : ~!Module, s : Server.
def   Loop(d,h,s) =
      corec s(d).case s
      { halt    : s[].0
      ; add     : s(p).p(n).
                  ?h[h].h/add.h[h].(h[h].(h[h].(?n[n].h<->n|h<->p)|h<->d)|
                  h(r).s[s].(s<->r|s<->h))
      ; whereis : s(n).
                  ?h[h].h/whereis.h[h].(
                  h[h].(?n[n].h<->n|h<->d)|
                  h(r).s[s].(s<->r|s<->h))
      }.
```

We can look at an example execution of such a server. For instance,
how would we encode the example from way-up-above in the bit about
Erlang? I mean this one:

``` erlang
1> server1:start(name_server, name_server).
true
2> name_server:add(joe, "at home").
ok
3> name_server:whereis(joe).
{ok, "at home"}
```

Well, the anwer is, we'd encode it as follow. We spawn an empty
dictionary and a module, and use them to start a server. We then send
two `add` requests to the server, storing the locations of `joe` and
`helen`, and finally request the location of `joe`.

``` haskell
check   new [d:!Dict]   ( Empty(d)    |
        new [h:!Module] ( Module(h)   |
        new [s:Server]  ( Loop(d,h,s) |
        rec s.
            s/add.
            s[s].( s[s].(
                !s(s).s/joe.s[].0 |
                !s(s).s/at_home.s[].0 ) |
                s(r).r().
        rec s.
            s/add.
            s[s].( s[s].(
                !s(s).s/helen.s[].0 |
                !s(s).s/at_work.s[].0 ) |
                s(r).r().
        rec s.
            s/whereis.
            s[s].( !s(s).s/joe.s[].0 |
            s(r).
        rec s.
            s/halt.
            s().
        p<->r
        ) ) ) ) ) ) |- p : !Maybe(Place).
```

This normalises, eventually, to the channel that just sends
`at_home`. Exactly as we'd want.

``` haskell
check   !p(p).p/just.p/at_home.p[].0
        |- p : !Maybe(Place).
```

So: what is the type of a generic server? It's very similar to that of
a module---a named with where the types of the different options are
allowed to vary with the name.

<!--{% raw %}--><pre class="Agda">
<a name="19480" href="2016-10-25-linear-types-for-erlang-otp-1.html#19480" class="Function"
      >Server</a
      ><a name="19486"
      > </a
      ><a name="19487" class="Symbol"
      >:</a
      ><a name="19488"
      > </a
      ><a name="19489" class="Symbol"
      >&#8704;</a
      ><a name="19490"
      > </a
      ><a name="19491" class="Symbol"
      >{</a
      ><a name="19492" href="2016-10-25-linear-types-for-erlang-otp-1.html#19492" class="Bound"
      >n</a
      ><a name="19493" class="Symbol"
      >}</a
      ><a name="19494"
      > </a
      ><a name="19495" class="Symbol"
      >(</a
      ><a name="19496" href="2016-10-25-linear-types-for-erlang-otp-1.html#19496" class="Bound"
      >A</a
      ><a name="19497"
      > </a
      ><a name="19498" href="2016-10-25-linear-types-for-erlang-otp-1.html#19498" class="Bound"
      >R</a
      ><a name="19499"
      > </a
      ><a name="19500" class="Symbol"
      >:</a
      ><a name="19501"
      > </a
      ><a name="19502" href="https://agda.github.io/agda-stdlib/Data.Fin.html#842" class="Datatype"
      >Fin</a
      ><a name="19505"
      > </a
      ><a name="19506" class="Symbol"
      >(</a
      ><a name="19507" class="Number"
      >2</a
      ><a name="19508"
      > </a
      ><a name="19509" href="Agda.Builtin.Nat.html#202" class="Primitive Operator"
      >+</a
      ><a name="19510"
      > </a
      ><a name="19511" href="2016-10-25-linear-types-for-erlang-otp-1.html#19492" class="Bound"
      >n</a
      ><a name="19512" class="Symbol"
      >)</a
      ><a name="19513"
      > </a
      ><a name="19514" class="Symbol"
      >&#8594;</a
      ><a name="19515"
      > </a
      ><a name="19516" href="2016-10-25-linear-types-for-erlang-otp-1.html#2365" class="Datatype"
      >Type</a
      ><a name="19520" class="Symbol"
      >)</a
      ><a name="19521"
      > </a
      ><a name="19522" class="Symbol"
      >&#8594;</a
      ><a name="19523"
      > </a
      ><a name="19524" href="2016-10-25-linear-types-for-erlang-otp-1.html#2365" class="Datatype"
      >Type</a
      ><a name="19528"
      >
</a
      ><a name="19529" href="2016-10-25-linear-types-for-erlang-otp-1.html#19480" class="Function"
      >Server</a
      ><a name="19535"
      > </a
      ><a name="19536" href="2016-10-25-linear-types-for-erlang-otp-1.html#19536" class="Bound"
      >A</a
      ><a name="19537"
      > </a
      ><a name="19538" href="2016-10-25-linear-types-for-erlang-otp-1.html#19538" class="Bound"
      >R</a
      ><a name="19539"
      > </a
      ><a name="19540" class="Symbol"
      >=</a
      ><a name="19541"
      > </a
      ><a name="19542" href="2016-10-25-linear-types-for-erlang-otp-1.html#2537" class="InductiveConstructor"
      >&#957;[</a
      ><a name="19544"
      > </a
      ><a name="19545" href="2016-10-25-linear-types-for-erlang-otp-1.html#19545" class="Bound"
      >X</a
      ><a name="19546"
      > </a
      ><a name="19547" href="2016-10-25-linear-types-for-erlang-otp-1.html#2537" class="InductiveConstructor"
      >]</a
      ><a name="19548"
      > </a
      ><a name="19549" href="2016-10-25-linear-types-for-erlang-otp-1.html#4770" class="Function"
      >&amp;[</a
      ><a name="19551"
      > </a
      ><a name="19552" href="2016-10-25-linear-types-for-erlang-otp-1.html#19552" class="Bound"
      >i</a
      ><a name="19553"
      > </a
      ><a name="19554" href="2016-10-25-linear-types-for-erlang-otp-1.html#4770" class="Function"
      >]</a
      ><a name="19555"
      > </a
      ><a name="19556" class="Symbol"
      >(</a
      ><a name="19557" href="2016-10-25-linear-types-for-erlang-otp-1.html#19536" class="Bound"
      >A</a
      ><a name="19558"
      > </a
      ><a name="19559" href="2016-10-25-linear-types-for-erlang-otp-1.html#19552" class="Bound"
      >i</a
      ><a name="19560"
      > </a
      ><a name="19561" href="2016-10-25-linear-types-for-erlang-otp-1.html#3772" class="Function Operator"
      >&#8888;</a
      ><a name="19562"
      > </a
      ><a name="19563" href="2016-10-25-linear-types-for-erlang-otp-1.html#19538" class="Bound"
      >R</a
      ><a name="19564"
      > </a
      ><a name="19565" href="2016-10-25-linear-types-for-erlang-otp-1.html#19552" class="Bound"
      >i</a
      ><a name="19566"
      > </a
      ><a name="19567" href="2016-10-25-linear-types-for-erlang-otp-1.html#2481" class="InductiveConstructor Operator"
      >&#8855;</a
      ><a name="19568"
      > </a
      ><a name="19569" href="2016-10-25-linear-types-for-erlang-otp-1.html#2798" class="InductiveConstructor Operator"
      >+</a
      ><a name="19570"
      > </a
      ><a name="19571" href="2016-10-25-linear-types-for-erlang-otp-1.html#19545" class="Bound"
      >X</a
      ><a name="19572" class="Symbol"
      >)</a
      >
</pre><!--{% endraw %}-->

We can check this by showing that the server type for the
`name_server` derived from `Server` corresponds to the type that we
wrote down in our CP implementation. And indeed it does.

<!--{% raw %}--><pre class="Agda">
<a name="19783" href="2016-10-25-linear-types-for-erlang-otp-1.html#19783" class="Function"
      >NameServer</a
      ><a name="19793"
      > </a
      ><a name="19794" class="Symbol"
      >=</a
      ><a name="19795"
      > </a
      ><a name="19796" href="2016-10-25-linear-types-for-erlang-otp-1.html#19480" class="Function"
      >Server</a
      ><a name="19802"
      > </a
      ><a name="19803" href="2016-10-25-linear-types-for-erlang-otp-1.html#14794" class="Function"
      >A</a
      ><a name="19804"
      > </a
      ><a name="19805" href="2016-10-25-linear-types-for-erlang-otp-1.html#14864" class="Function"
      >R</a
      ><a name="19806"
      >
</a
      ><a name="19807" class="Comment"
      >--&gt;</a
      ><a name="19810"
      >
</a
      ><a name="19811" href="2016-10-25-linear-types-for-erlang-otp-1.html#19811" class="Function Operator"
      >test_NameServer</a
      ><a name="19826"
      > </a
      ><a name="19827" class="Symbol"
      >:</a
      ><a name="19828"
      > </a
      ><a name="19829" href="2016-10-25-linear-types-for-erlang-otp-1.html#19783" class="Function"
      >NameServer</a
      ><a name="19839"
      > </a
      ><a name="19840" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="19841"
      > </a
      ><a name="19842" href="2016-10-25-linear-types-for-erlang-otp-1.html#2537" class="InductiveConstructor"
      >&#957;[</a
      ><a name="19844"
      > </a
      ><a name="19845" href="2016-10-25-linear-types-for-erlang-otp-1.html#19845" class="Bound"
      >X</a
      ><a name="19846"
      > </a
      ><a name="19847" href="2016-10-25-linear-types-for-erlang-otp-1.html#2537" class="InductiveConstructor"
      >]</a
      ><a name="19848"
      > </a
      ><a name="19849" class="Symbol"
      >(</a
      ><a name="19850"
      >
  </a
      ><a name="19853" class="Comment"
      >{- add     -}</a
      ><a name="19866"
      > </a
      ><a name="19867" class="Symbol"
      >(</a
      ><a name="19868" href="2016-10-25-linear-types-for-erlang-otp-1.html#12937" class="Function"
      >Name</a
      ><a name="19872"
      > </a
      ><a name="19873" href="2016-10-25-linear-types-for-erlang-otp-1.html#2481" class="InductiveConstructor Operator"
      >&#8855;</a
      ><a name="19874"
      > </a
      ><a name="19875" href="2016-10-25-linear-types-for-erlang-otp-1.html#2508" class="InductiveConstructor Operator"
      >&#161;</a
      ><a name="19876"
      > </a
      ><a name="19877" href="2016-10-25-linear-types-for-erlang-otp-1.html#12953" class="Function"
      >Place</a
      ><a name="19882"
      > </a
      ><a name="19883" href="2016-10-25-linear-types-for-erlang-otp-1.html#3772" class="Function Operator"
      >&#8888;</a
      ><a name="19884"
      > </a
      ><a name="19885" href="2016-10-25-linear-types-for-erlang-otp-1.html#2433" class="InductiveConstructor"
      >&#120793;</a
      ><a name="19886"
      >             </a
      ><a name="19899" href="2016-10-25-linear-types-for-erlang-otp-1.html#2481" class="InductiveConstructor Operator"
      >&#8855;</a
      ><a name="19900"
      > </a
      ><a name="19901" href="2016-10-25-linear-types-for-erlang-otp-1.html#2798" class="InductiveConstructor Operator"
      >+</a
      ><a name="19902"
      > </a
      ><a name="19903" href="2016-10-25-linear-types-for-erlang-otp-1.html#19845" class="Bound"
      >X</a
      ><a name="19904"
      > </a
      ><a name="19905" class="Symbol"
      >)</a
      ><a name="19906"
      > </a
      ><a name="19907" href="2016-10-25-linear-types-for-erlang-otp-1.html#2446" class="InductiveConstructor Operator"
      >&amp;</a
      ><a name="19908"
      >
  </a
      ><a name="19911" class="Comment"
      >{- whereis -}</a
      ><a name="19924"
      > </a
      ><a name="19925" class="Symbol"
      >(</a
      ><a name="19926" href="2016-10-25-linear-types-for-erlang-otp-1.html#12937" class="Function"
      >Name</a
      ><a name="19930"
      >           </a
      ><a name="19941" href="2016-10-25-linear-types-for-erlang-otp-1.html#3772" class="Function Operator"
      >&#8888;</a
      ><a name="19942"
      > </a
      ><a name="19943" href="2016-10-25-linear-types-for-erlang-otp-1.html#2508" class="InductiveConstructor Operator"
      >&#161;</a
      ><a name="19944"
      > </a
      ><a name="19945" href="2016-10-25-linear-types-for-erlang-otp-1.html#12901" class="Function"
      >Maybe</a
      ><a name="19950"
      > </a
      ><a name="19951" href="2016-10-25-linear-types-for-erlang-otp-1.html#12953" class="Function"
      >Place</a
      ><a name="19956"
      > </a
      ><a name="19957" href="2016-10-25-linear-types-for-erlang-otp-1.html#2481" class="InductiveConstructor Operator"
      >&#8855;</a
      ><a name="19958"
      > </a
      ><a name="19959" href="2016-10-25-linear-types-for-erlang-otp-1.html#2798" class="InductiveConstructor Operator"
      >+</a
      ><a name="19960"
      > </a
      ><a name="19961" href="2016-10-25-linear-types-for-erlang-otp-1.html#19845" class="Bound"
      >X</a
      ><a name="19962" class="Symbol"
      >))</a
      ><a name="19964"
      >
</a
      ><a name="19965" href="2016-10-25-linear-types-for-erlang-otp-1.html#19811" class="Function Operator"
      >test_NameServer</a
      ><a name="19980"
      > </a
      ><a name="19981" class="Symbol"
      >=</a
      ><a name="19982"
      > </a
      ><a name="19983" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      >
</pre><!--{% endraw %}-->

This makes the type of `loop` fairly easy to define: it's a function
from a module to a server, where the both respect the same names, and
their argument and response types vary with the name in the same way.

<!--{% raw %}--><pre class="Agda">
<a name="20223" href="2016-10-25-linear-types-for-erlang-otp-1.html#20223" class="Function"
      >Loop</a
      ><a name="20227"
      > </a
      ><a name="20228" class="Symbol"
      >:</a
      ><a name="20229"
      > </a
      ><a name="20230" class="Symbol"
      >&#8704;</a
      ><a name="20231"
      > </a
      ><a name="20232" class="Symbol"
      >{</a
      ><a name="20233" href="2016-10-25-linear-types-for-erlang-otp-1.html#20233" class="Bound"
      >n</a
      ><a name="20234" class="Symbol"
      >}</a
      ><a name="20235"
      > </a
      ><a name="20236" class="Symbol"
      >(</a
      ><a name="20237" href="2016-10-25-linear-types-for-erlang-otp-1.html#20237" class="Bound"
      >A</a
      ><a name="20238"
      > </a
      ><a name="20239" href="2016-10-25-linear-types-for-erlang-otp-1.html#20239" class="Bound"
      >R</a
      ><a name="20240"
      > </a
      ><a name="20241" class="Symbol"
      >:</a
      ><a name="20242"
      > </a
      ><a name="20243" href="https://agda.github.io/agda-stdlib/Data.Fin.html#842" class="Datatype"
      >Fin</a
      ><a name="20246"
      > </a
      ><a name="20247" class="Symbol"
      >(</a
      ><a name="20248" class="Number"
      >2</a
      ><a name="20249"
      > </a
      ><a name="20250" href="Agda.Builtin.Nat.html#202" class="Primitive Operator"
      >+</a
      ><a name="20251"
      > </a
      ><a name="20252" href="2016-10-25-linear-types-for-erlang-otp-1.html#20233" class="Bound"
      >n</a
      ><a name="20253" class="Symbol"
      >)</a
      ><a name="20254"
      > </a
      ><a name="20255" class="Symbol"
      >&#8594;</a
      ><a name="20256"
      > </a
      ><a name="20257" href="2016-10-25-linear-types-for-erlang-otp-1.html#2365" class="Datatype"
      >Type</a
      ><a name="20261" class="Symbol"
      >)</a
      ><a name="20262"
      > </a
      ><a name="20263" class="Symbol"
      >(</a
      ><a name="20264" href="2016-10-25-linear-types-for-erlang-otp-1.html#20264" class="Bound"
      >S</a
      ><a name="20265"
      > </a
      ><a name="20266" class="Symbol"
      >:</a
      ><a name="20267"
      > </a
      ><a name="20268" href="2016-10-25-linear-types-for-erlang-otp-1.html#2365" class="Datatype"
      >Type</a
      ><a name="20272" class="Symbol"
      >)</a
      ><a name="20273"
      > </a
      ><a name="20274" class="Symbol"
      >&#8594;</a
      ><a name="20275"
      > </a
      ><a name="20276" href="2016-10-25-linear-types-for-erlang-otp-1.html#2365" class="Datatype"
      >Type</a
      ><a name="20280"
      >
</a
      ><a name="20281" href="2016-10-25-linear-types-for-erlang-otp-1.html#20223" class="Function"
      >Loop</a
      ><a name="20285"
      > </a
      ><a name="20286" href="2016-10-25-linear-types-for-erlang-otp-1.html#20286" class="Bound"
      >A</a
      ><a name="20287"
      > </a
      ><a name="20288" href="2016-10-25-linear-types-for-erlang-otp-1.html#20288" class="Bound"
      >R</a
      ><a name="20289"
      > </a
      ><a name="20290" href="2016-10-25-linear-types-for-erlang-otp-1.html#20290" class="Bound"
      >S</a
      ><a name="20291"
      > </a
      ><a name="20292" class="Symbol"
      >=</a
      ><a name="20293"
      > </a
      ><a name="20294" href="2016-10-25-linear-types-for-erlang-otp-1.html#14135" class="Function"
      >Module</a
      ><a name="20300"
      > </a
      ><a name="20301" href="2016-10-25-linear-types-for-erlang-otp-1.html#20286" class="Bound"
      >A</a
      ><a name="20302"
      > </a
      ><a name="20303" href="2016-10-25-linear-types-for-erlang-otp-1.html#20288" class="Bound"
      >R</a
      ><a name="20304"
      > </a
      ><a name="20305" href="2016-10-25-linear-types-for-erlang-otp-1.html#20290" class="Bound"
      >S</a
      ><a name="20306"
      > </a
      ><a name="20307" href="2016-10-25-linear-types-for-erlang-otp-1.html#3772" class="Function Operator"
      >&#8888;</a
      ><a name="20308"
      > </a
      ><a name="20309" href="2016-10-25-linear-types-for-erlang-otp-1.html#19480" class="Function"
      >Server</a
      ><a name="20315"
      > </a
      ><a name="20316" href="2016-10-25-linear-types-for-erlang-otp-1.html#20286" class="Bound"
      >A</a
      ><a name="20317"
      > </a
      ><a name="20318" href="2016-10-25-linear-types-for-erlang-otp-1.html#20288" class="Bound"
      >R</a
      >
</pre><!--{% endraw %}-->

---

[^armstrong]: Joe Armstrong, *Programming Erlang: Software for a
    Concurrent World*. The Pragmatic Bookshelf, 2007. Chapter 16.

[^locks]: This has a strong feeling of locks to it. This makes sense,
    as CP is a synchronous π-calculus. If we move to an asynchronous
    π-calculus, we might be able to give semantics for a server that
    feel a little less... lock-y.

[^talkban]: Sam Lindley and Garrett J. Morris, *Talking Bananas:
    Structural Recursion for Session Types*. In the proceedings of
    [ICFP 2016](http://conf.researchr.org/home/icfp-2016/).

[^munu]: It may be sane to include fixed points in such contexts as
    well.
