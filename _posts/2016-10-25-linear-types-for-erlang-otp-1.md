---
title        : "Linear Types for Erlang/OTP (1)"
date         : 2016-10-25 12:00:00
categories   : []
tags         : [draft, agda, erlang, process calculus]
extra-script : agda-extra-script.html
extra-style  : agda-extra-style.html
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
<a name="1076" class="Keyword"
      >open</a
      ><a name="1080"
      > </a
      ><a name="1081" class="Keyword"
      >import</a
      ><a name="1087"
      > </a
      ><a name="1088" href="https://agda.github.io/agda-stdlib/Data.Fin.html#1" class="Module"
      >Data.Fin</a
      ><a name="1096"
      > </a
      ><a name="1097" class="Keyword"
      >using</a
      ><a name="1102"
      > </a
      ><a name="1103" class="Symbol"
      >(</a
      ><a name="1104" href="https://agda.github.io/agda-stdlib/Data.Fin.html#842" class="Datatype"
      >Fin</a
      ><a name="1107" class="Symbol"
      >;</a
      ><a name="1108"
      > </a
      ><a name="1109" href="https://agda.github.io/agda-stdlib/Data.Fin.html#895" class="InductiveConstructor"
      >suc</a
      ><a name="1112" class="Symbol"
      >;</a
      ><a name="1113"
      > </a
      ><a name="1114" href="https://agda.github.io/agda-stdlib/Data.Fin.html#864" class="InductiveConstructor"
      >zero</a
      ><a name="1118" class="Symbol"
      >)</a
      ><a name="1119"
      >
</a
      ><a name="1120" class="Keyword"
      >open</a
      ><a name="1124"
      > </a
      ><a name="1125" class="Keyword"
      >import</a
      ><a name="1131"
      > </a
      ><a name="1132" href="https://agda.github.io/agda-stdlib/Data.Nat.html#1" class="Module"
      >Data.Nat</a
      ><a name="1140"
      > </a
      ><a name="1141" class="Keyword"
      >using</a
      ><a name="1146"
      > </a
      ><a name="1147" class="Symbol"
      >(</a
      ><a name="1148" href="Agda.Builtin.Nat.html#69" class="Datatype"
      >&#8469;</a
      ><a name="1149" class="Symbol"
      >;</a
      ><a name="1150"
      > </a
      ><a name="1151" href="Agda.Builtin.Nat.html#202" class="Primitive Operator"
      >_+_</a
      ><a name="1154" class="Symbol"
      >)</a
      ><a name="1155"
      >
</a
      ><a name="1156" class="Keyword"
      >open</a
      ><a name="1160"
      > </a
      ><a name="1161" class="Keyword"
      >import</a
      ><a name="1167"
      > </a
      ><a name="1168" href="https://agda.github.io/agda-stdlib/Data.Vec.html#1" class="Module"
      >Data.Vec</a
      ><a name="1176"
      > </a
      ><a name="1177" class="Keyword"
      >using</a
      ><a name="1182"
      > </a
      ><a name="1183" class="Symbol"
      >(</a
      ><a name="1184" href="https://agda.github.io/agda-stdlib/Data.Vec.html#609" class="Datatype"
      >Vec</a
      ><a name="1187" class="Symbol"
      >;</a
      ><a name="1188"
      > </a
      ><a name="1189" href="https://agda.github.io/agda-stdlib/Data.Vec.html#1999" class="Function"
      >map</a
      ><a name="1192" class="Symbol"
      >;</a
      ><a name="1193"
      > </a
      ><a name="1194" href="https://agda.github.io/agda-stdlib/Data.Vec.html#2745" class="Function"
      >foldr&#8321;</a
      ><a name="1200" class="Symbol"
      >;</a
      ><a name="1201"
      > </a
      ><a name="1202" href="https://agda.github.io/agda-stdlib/Data.Vec.html#6871" class="Function"
      >allFin</a
      ><a name="1208" class="Symbol"
      >)</a
      ><a name="1209"
      >
</a
      ><a name="1210" class="Keyword"
      >open</a
      ><a name="1214"
      > </a
      ><a name="1215" class="Keyword"
      >import</a
      ><a name="1221"
      > </a
      ><a name="1222" href="https://agda.github.io/agda-stdlib/Data.Product.html#1" class="Module"
      >Data.Product</a
      ><a name="1234"
      > </a
      ><a name="1235" class="Keyword"
      >using</a
      ><a name="1240"
      > </a
      ><a name="1241" class="Symbol"
      >(</a
      ><a name="1242" href="https://agda.github.io/agda-stdlib/Data.Product.html#1073" class="Function Operator"
      >_&#215;_</a
      ><a name="1245" class="Symbol"
      >;</a
      ><a name="1246"
      > </a
      ><a name="1247" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >_,_</a
      ><a name="1250" class="Symbol"
      >)</a
      ><a name="1251"
      >
</a
      ><a name="1252" class="Keyword"
      >open</a
      ><a name="1256"
      > </a
      ><a name="1257" class="Keyword"
      >import</a
      ><a name="1263"
      > </a
      ><a name="1264" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.html#1" class="Module"
      >Relation.Binary.PropositionalEquality</a
      ><a name="1301"
      > </a
      ><a name="1302" class="Keyword"
      >using</a
      ><a name="1307"
      > </a
      ><a name="1308" class="Symbol"
      >(</a
      ><a name="1309" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >_&#8801;_</a
      ><a name="1312" class="Symbol"
      >;</a
      ><a name="1313"
      > </a
      ><a name="1314" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="1318" class="Symbol"
      >)</a
      >
</pre><!--{% endraw %}-->
</div>

<div class="hidden">
<!--{% raw %}--><pre class="Agda">
<a name="1373" class="Keyword"
      >module</a
      ><a name="1379"
      > </a
      ><a name="1380" href="2016-10-25-linear-types-for-erlang-otp-1.html#1" class="Module"
      >2016-10-25-linear-types-for-erlang-otp-1</a
      ><a name="1420"
      > </a
      ><a name="1421" class="Keyword"
      >where</a
      >
</pre><!--{% endraw %}-->
</div>

<div class="hidden">
<!--{% raw %}--><pre class="Agda">
<a name="1480" class="Keyword"
      >infix</a
      ><a name="1485"
      >  </a
      ><a name="1487" class="Number"
      >9</a
      ><a name="1488"
      > +_ -_
</a
      ><a name="1495" class="Keyword"
      >infix</a
      ><a name="1500"
      >  </a
      ><a name="1502" class="Number"
      >8</a
      ><a name="1503"
      > ~_
</a
      ><a name="1507" class="Keyword"
      >infix</a
      ><a name="1512"
      >  </a
      ><a name="1514" class="Number"
      >7</a
      ><a name="1515"
      > &#161;_ &#191;_
</a
      ><a name="1522" class="Keyword"
      >infixl</a
      ><a name="1528"
      > </a
      ><a name="1529" class="Number"
      >6</a
      ><a name="1530"
      > _&amp;_ _&#8523;_ _&#8853;_ _&#8855;_
</a
      ><a name="1547" class="Keyword"
      >infixr</a
      ><a name="1553"
      > </a
      ><a name="1554" class="Number"
      >5</a
      >
</pre><!--{% endraw %}-->
</div>

Below I define a small Agda module which describes linear types. Feel
free to inspect it. Briefly, it defines the structure of linear types
as close to the syntax of linear logic as we can get.

<div class="foldable">
<!--{% raw %}--><pre class="Agda">
<a name="1810" class="Comment"
      >-- Prelude. Click `+` to unfold.</a
      ><a name="1842"
      >

</a
      ><a name="1844" class="Comment"
      >-- As we can have both positive and negative atoms, we</a
      ><a name="1898"
      >
</a
      ><a name="1899" class="Comment"
      >-- defined a type `Pol`, which will represent the polarities</a
      ><a name="1959"
      >
</a
      ><a name="1960" class="Comment"
      >-- of primitive types.</a
      ><a name="1982"
      >
</a
      ><a name="1983" class="Keyword"
      >data</a
      ><a name="1987"
      > </a
      ><a name="1988" href="2016-10-25-linear-types-for-erlang-otp-1.html#1988" class="Datatype"
      >Pol</a
      ><a name="1991"
      > </a
      ><a name="1992" class="Symbol"
      >:</a
      ><a name="1993"
      > </a
      ><a name="1994" class="PrimitiveType"
      >Set</a
      ><a name="1997"
      > </a
      ><a name="1998" class="Keyword"
      >where</a
      ><a name="2003"
      >
  </a
      ><a name="2006" href="2016-10-25-linear-types-for-erlang-otp-1.html#2006" class="InductiveConstructor"
      >pos</a
      ><a name="2009"
      > </a
      ><a name="2010" class="Symbol"
      >:</a
      ><a name="2011"
      > </a
      ><a name="2012" href="2016-10-25-linear-types-for-erlang-otp-1.html#1988" class="Datatype"
      >Pol</a
      ><a name="2015"
      >
  </a
      ><a name="2018" href="2016-10-25-linear-types-for-erlang-otp-1.html#2018" class="InductiveConstructor"
      >neg</a
      ><a name="2021"
      > </a
      ><a name="2022" class="Symbol"
      >:</a
      ><a name="2023"
      > </a
      ><a name="2024" href="2016-10-25-linear-types-for-erlang-otp-1.html#1988" class="Datatype"
      >Pol</a
      ><a name="2027"
      >

</a
      ><a name="2029" class="Comment"
      >-- As in software foundations, we defined identifiers as a</a
      ><a name="2087"
      >
</a
      ><a name="2088" class="Comment"
      >-- simple wrapper type around the natural numbers.</a
      ><a name="2138"
      >
</a
      ><a name="2139" class="Keyword"
      >data</a
      ><a name="2143"
      > </a
      ><a name="2144" href="2016-10-25-linear-types-for-erlang-otp-1.html#2144" class="Datatype"
      >Id</a
      ><a name="2146"
      > </a
      ><a name="2147" class="Symbol"
      >:</a
      ><a name="2148"
      > </a
      ><a name="2149" class="PrimitiveType"
      >Set</a
      ><a name="2152"
      > </a
      ><a name="2153" class="Keyword"
      >where</a
      ><a name="2158"
      >
  </a
      ><a name="2161" href="2016-10-25-linear-types-for-erlang-otp-1.html#2161" class="InductiveConstructor"
      >id</a
      ><a name="2163"
      > </a
      ><a name="2164" class="Symbol"
      >:</a
      ><a name="2165"
      > </a
      ><a name="2166" href="Agda.Builtin.Nat.html#69" class="Datatype"
      >&#8469;</a
      ><a name="2167"
      > </a
      ><a name="2168" class="Symbol"
      >&#8594;</a
      ><a name="2169"
      > </a
      ><a name="2170" href="2016-10-25-linear-types-for-erlang-otp-1.html#2144" class="Datatype"
      >Id</a
      ><a name="2172"
      >

</a
      ><a name="2174" class="Comment"
      >-- The types are defined, using as much as is possible of the</a
      ><a name="2235"
      >
</a
      ><a name="2236" class="Comment"
      >-- original syntax of linear logic. The only except are the</a
      ><a name="2295"
      >
</a
      ><a name="2296" class="Comment"
      >-- exponentials: ? is a reserved symbol, so we use &#161; and &#191;.</a
      ><a name="2355"
      >
</a
      ><a name="2356" class="Keyword"
      >data</a
      ><a name="2360"
      > </a
      ><a name="2361" href="2016-10-25-linear-types-for-erlang-otp-1.html#2361" class="Datatype"
      >Type</a
      ><a name="2365"
      > </a
      ><a name="2366" class="Symbol"
      >:</a
      ><a name="2367"
      > </a
      ><a name="2368" class="PrimitiveType"
      >Set</a
      ><a name="2371"
      > </a
      ><a name="2372" class="Keyword"
      >where</a
      ><a name="2377"
      >
  </a
      ><a name="2380" href="2016-10-25-linear-types-for-erlang-otp-1.html#2380" class="InductiveConstructor"
      >var</a
      ><a name="2383"
      >     </a
      ><a name="2388" class="Symbol"
      >:</a
      ><a name="2389"
      > </a
      ><a name="2390" href="2016-10-25-linear-types-for-erlang-otp-1.html#1988" class="Datatype"
      >Pol</a
      ><a name="2393"
      > </a
      ><a name="2394" class="Symbol"
      >&#8594;</a
      ><a name="2395"
      > </a
      ><a name="2396" href="2016-10-25-linear-types-for-erlang-otp-1.html#2144" class="Datatype"
      >Id</a
      ><a name="2398"
      > </a
      ><a name="2399" class="Symbol"
      >&#8594;</a
      ><a name="2400"
      > </a
      ><a name="2401" href="2016-10-25-linear-types-for-erlang-otp-1.html#2361" class="Datatype"
      >Type</a
      ><a name="2405"
      >
  </a
      ><a name="2408" href="2016-10-25-linear-types-for-erlang-otp-1.html#2408" class="InductiveConstructor"
      >&#8868;</a
      ><a name="2409"
      >   </a
      ><a name="2412" href="2016-10-25-linear-types-for-erlang-otp-1.html#2412" class="InductiveConstructor"
      >&#8869;</a
      ><a name="2413"
      >   </a
      ><a name="2416" class="Symbol"
      >:</a
      ><a name="2417"
      > </a
      ><a name="2418" href="2016-10-25-linear-types-for-erlang-otp-1.html#2361" class="Datatype"
      >Type</a
      ><a name="2422"
      >
  </a
      ><a name="2425" href="2016-10-25-linear-types-for-erlang-otp-1.html#2425" class="InductiveConstructor"
      >&#120792;</a
      ><a name="2426"
      >   </a
      ><a name="2429" href="2016-10-25-linear-types-for-erlang-otp-1.html#2429" class="InductiveConstructor"
      >&#120793;</a
      ><a name="2430"
      >   </a
      ><a name="2433" class="Symbol"
      >:</a
      ><a name="2434"
      > </a
      ><a name="2435" href="2016-10-25-linear-types-for-erlang-otp-1.html#2361" class="Datatype"
      >Type</a
      ><a name="2439"
      >
  </a
      ><a name="2442" href="2016-10-25-linear-types-for-erlang-otp-1.html#2442" class="InductiveConstructor Operator"
      >_&amp;_</a
      ><a name="2445"
      > </a
      ><a name="2446" href="2016-10-25-linear-types-for-erlang-otp-1.html#2446" class="InductiveConstructor Operator"
      >_&#8523;_</a
      ><a name="2449"
      > </a
      ><a name="2450" class="Symbol"
      >:</a
      ><a name="2451"
      > </a
      ><a name="2452" href="2016-10-25-linear-types-for-erlang-otp-1.html#2361" class="Datatype"
      >Type</a
      ><a name="2456"
      > </a
      ><a name="2457" class="Symbol"
      >&#8594;</a
      ><a name="2458"
      > </a
      ><a name="2459" href="2016-10-25-linear-types-for-erlang-otp-1.html#2361" class="Datatype"
      >Type</a
      ><a name="2463"
      > </a
      ><a name="2464" class="Symbol"
      >&#8594;</a
      ><a name="2465"
      > </a
      ><a name="2466" href="2016-10-25-linear-types-for-erlang-otp-1.html#2361" class="Datatype"
      >Type</a
      ><a name="2470"
      >
  </a
      ><a name="2473" href="2016-10-25-linear-types-for-erlang-otp-1.html#2473" class="InductiveConstructor Operator"
      >_&#8853;_</a
      ><a name="2476"
      > </a
      ><a name="2477" href="2016-10-25-linear-types-for-erlang-otp-1.html#2477" class="InductiveConstructor Operator"
      >_&#8855;_</a
      ><a name="2480"
      > </a
      ><a name="2481" class="Symbol"
      >:</a
      ><a name="2482"
      > </a
      ><a name="2483" href="2016-10-25-linear-types-for-erlang-otp-1.html#2361" class="Datatype"
      >Type</a
      ><a name="2487"
      > </a
      ><a name="2488" class="Symbol"
      >&#8594;</a
      ><a name="2489"
      > </a
      ><a name="2490" href="2016-10-25-linear-types-for-erlang-otp-1.html#2361" class="Datatype"
      >Type</a
      ><a name="2494"
      > </a
      ><a name="2495" class="Symbol"
      >&#8594;</a
      ><a name="2496"
      > </a
      ><a name="2497" href="2016-10-25-linear-types-for-erlang-otp-1.html#2361" class="Datatype"
      >Type</a
      ><a name="2501"
      >
  </a
      ><a name="2504" href="2016-10-25-linear-types-for-erlang-otp-1.html#2504" class="InductiveConstructor Operator"
      >&#161;_</a
      ><a name="2506"
      >  </a
      ><a name="2508" href="2016-10-25-linear-types-for-erlang-otp-1.html#2508" class="InductiveConstructor Operator"
      >&#191;_</a
      ><a name="2510"
      >  </a
      ><a name="2512" class="Symbol"
      >:</a
      ><a name="2513"
      > </a
      ><a name="2514" href="2016-10-25-linear-types-for-erlang-otp-1.html#2361" class="Datatype"
      >Type</a
      ><a name="2518"
      > </a
      ><a name="2519" class="Symbol"
      >-&gt;</a
      ><a name="2521"
      > </a
      ><a name="2522" href="2016-10-25-linear-types-for-erlang-otp-1.html#2361" class="Datatype"
      >Type</a
      ><a name="2526"
      >
  </a
      ><a name="2529" href="2016-10-25-linear-types-for-erlang-otp-1.html#2529" class="InductiveConstructor"
      >&#956;</a
      ><a name="2530"
      >   </a
      ><a name="2533" href="2016-10-25-linear-types-for-erlang-otp-1.html#2533" class="InductiveConstructor"
      >&#957;</a
      ><a name="2534"
      >   </a
      ><a name="2537" class="Symbol"
      >:</a
      ><a name="2538"
      > </a
      ><a name="2539" class="Symbol"
      >(</a
      ><a name="2540" href="2016-10-25-linear-types-for-erlang-otp-1.html#2144" class="Datatype"
      >Id</a
      ><a name="2542"
      > </a
      ><a name="2543" class="Symbol"
      >&#8594;</a
      ><a name="2544"
      > </a
      ><a name="2545" href="2016-10-25-linear-types-for-erlang-otp-1.html#2361" class="Datatype"
      >Type</a
      ><a name="2549" class="Symbol"
      >)</a
      ><a name="2550"
      > </a
      ><a name="2551" class="Symbol"
      >&#8594;</a
      ><a name="2552"
      > </a
      ><a name="2553" href="2016-10-25-linear-types-for-erlang-otp-1.html#2361" class="Datatype"
      >Type</a
      ><a name="2557"
      >

</a
      ><a name="2559" class="Comment"
      >-- While we would like to be able to treat both positive</a
      ><a name="2615"
      >
</a
      ><a name="2616" class="Comment"
      >-- and negative occurances of variables as a single case</a
      ><a name="2672"
      >
</a
      ><a name="2673" class="Comment"
      >-- in proofs, writing `var pos X` is tedious. Therefore,</a
      ><a name="2729"
      >
</a
      ><a name="2730" class="Comment"
      >-- we defined the syntax (+ A) and (- A) for variables.</a
      ><a name="2785"
      >
</a
      ><a name="2786" class="Keyword"
      >pattern</a
      ><a name="2793"
      > </a
      ><a name="2794" href="2016-10-25-linear-types-for-erlang-otp-1.html#2794" class="InductiveConstructor Operator"
      >+_</a
      ><a name="2796"
      > </a
      ><a name="2797" href="2016-10-25-linear-types-for-erlang-otp-1.html#2809" class="Bound"
      >A</a
      ><a name="2798"
      > </a
      ><a name="2799" class="Symbol"
      >=</a
      ><a name="2800"
      > </a
      ><a name="2801" href="2016-10-25-linear-types-for-erlang-otp-1.html#2380" class="InductiveConstructor"
      >var</a
      ><a name="2804"
      > </a
      ><a name="2805" href="2016-10-25-linear-types-for-erlang-otp-1.html#2006" class="InductiveConstructor"
      >pos</a
      ><a name="2808"
      > </a
      ><a name="2809" href="2016-10-25-linear-types-for-erlang-otp-1.html#2809" class="Bound"
      >A</a
      ><a name="2810"
      >
</a
      ><a name="2811" class="Keyword"
      >pattern</a
      ><a name="2818"
      > </a
      ><a name="2819" href="2016-10-25-linear-types-for-erlang-otp-1.html#2819" class="InductiveConstructor Operator"
      >-_</a
      ><a name="2821"
      > </a
      ><a name="2822" href="2016-10-25-linear-types-for-erlang-otp-1.html#2834" class="Bound"
      >A</a
      ><a name="2823"
      > </a
      ><a name="2824" class="Symbol"
      >=</a
      ><a name="2825"
      > </a
      ><a name="2826" href="2016-10-25-linear-types-for-erlang-otp-1.html#2380" class="InductiveConstructor"
      >var</a
      ><a name="2829"
      > </a
      ><a name="2830" href="2016-10-25-linear-types-for-erlang-otp-1.html#2018" class="InductiveConstructor"
      >neg</a
      ><a name="2833"
      > </a
      ><a name="2834" href="2016-10-25-linear-types-for-erlang-otp-1.html#2834" class="Bound"
      >A</a
      ><a name="2835"
      >
</a
      ><a name="2836" class="Symbol"
      >{-#</a
      ><a name="2839"
      > </a
      ><a name="2840" class="Keyword"
      >DISPLAY</a
      ><a name="2847"
      > </a
      ><a name="2848" href="2016-10-25-linear-types-for-erlang-otp-1.html#2380" class="InductiveConstructor"
      >var</a
      ><a name="2851"
      > </a
      ><a name="2852" href="2016-10-25-linear-types-for-erlang-otp-1.html#2006" class="InductiveConstructor"
      >pos</a
      ><a name="2855"
      > </a
      ><a name="2856" href="2016-10-25-linear-types-for-erlang-otp-1.html#2856" class="Bound"
      >A</a
      ><a name="2857"
      > = </a
      ><a name="2860" href="2016-10-25-linear-types-for-erlang-otp-1.html#2794" class="InductiveConstructor Operator"
      >+</a
      ><a name="2861"
      > </a
      ><a name="2862" href="2016-10-25-linear-types-for-erlang-otp-1.html#2856" class="Bound"
      >A</a
      ><a name="2863"
      > </a
      ><a name="2864" class="Symbol"
      >#-}</a
      ><a name="2867"
      >
</a
      ><a name="2868" class="Symbol"
      >{-#</a
      ><a name="2871"
      > </a
      ><a name="2872" class="Keyword"
      >DISPLAY</a
      ><a name="2879"
      > </a
      ><a name="2880" href="2016-10-25-linear-types-for-erlang-otp-1.html#2380" class="InductiveConstructor"
      >var</a
      ><a name="2883"
      > </a
      ><a name="2884" href="2016-10-25-linear-types-for-erlang-otp-1.html#2018" class="InductiveConstructor"
      >neg</a
      ><a name="2887"
      > </a
      ><a name="2888" href="2016-10-25-linear-types-for-erlang-otp-1.html#2888" class="Bound"
      >A</a
      ><a name="2889"
      > = </a
      ><a name="2892" href="2016-10-25-linear-types-for-erlang-otp-1.html#2819" class="InductiveConstructor Operator"
      >-</a
      ><a name="2893"
      > </a
      ><a name="2894" href="2016-10-25-linear-types-for-erlang-otp-1.html#2888" class="Bound"
      >A</a
      ><a name="2895"
      > </a
      ><a name="2896" class="Symbol"
      >#-}</a
      ><a name="2899"
      >

</a
      ><a name="2901" class="Comment"
      >-- We want to be able to write both (&#956; F) and (&#956;[ X ] A).</a
      ><a name="2958"
      >
</a
      ><a name="2959" class="Comment"
      >-- Therefore, we define the primitive type constructor as</a
      ><a name="3016"
      >
</a
      ><a name="3017" class="Comment"
      >-- &#956;, and attach a syntax macro which allows it to bind an</a
      ><a name="3075"
      >
</a
      ><a name="3076" class="Comment"
      >-- argument X. This way we never have to write &#956; (&#955; X &#8594; A)).</a
      ><a name="3136"
      >
</a
      ><a name="3137" class="Keyword"
      >syntax</a
      ><a name="3143"
      > &#956; </a
      ><a name="3146" class="Symbol"
      >(&#955;</a
      ><a name="3148"
      > X </a
      ><a name="3151" class="Symbol"
      >&#8594;</a
      ><a name="3152"
      > A</a
      ><a name="3154" class="Symbol"
      >)</a
      ><a name="3155"
      > </a
      ><a name="3156" class="Symbol"
      >=</a
      ><a name="3157"
      > &#956;[ X ] A
</a
      ><a name="3167" class="Keyword"
      >syntax</a
      ><a name="3173"
      > &#957; </a
      ><a name="3176" class="Symbol"
      >(&#955;</a
      ><a name="3178"
      > X </a
      ><a name="3181" class="Symbol"
      >&#8594;</a
      ><a name="3182"
      > A</a
      ><a name="3184" class="Symbol"
      >)</a
      ><a name="3185"
      > </a
      ><a name="3186" class="Symbol"
      >=</a
      ><a name="3187"
      > &#957;[ X ] A

</a
      ><a name="3198" class="Comment"
      >-- We define negation as a recursive function over the</a
      ><a name="3252"
      >
</a
      ><a name="3253" class="Comment"
      >-- structure of types -- as you would expect, basically.</a
      ><a name="3309"
      >
</a
      ><a name="3310" href="2016-10-25-linear-types-for-erlang-otp-1.html#3310" class="Function Operator"
      >~_</a
      ><a name="3312"
      > </a
      ><a name="3313" class="Symbol"
      >:</a
      ><a name="3314"
      > </a
      ><a name="3315" href="2016-10-25-linear-types-for-erlang-otp-1.html#2361" class="Datatype"
      >Type</a
      ><a name="3319"
      > </a
      ><a name="3320" class="Symbol"
      >&#8594;</a
      ><a name="3321"
      > </a
      ><a name="3322" href="2016-10-25-linear-types-for-erlang-otp-1.html#2361" class="Datatype"
      >Type</a
      ><a name="3326"
      >
</a
      ><a name="3327" href="2016-10-25-linear-types-for-erlang-otp-1.html#3310" class="Function Operator"
      >~</a
      ><a name="3328"
      > </a
      ><a name="3329" class="Symbol"
      >(</a
      ><a name="3330" href="2016-10-25-linear-types-for-erlang-otp-1.html#2794" class="InductiveConstructor Operator"
      >+</a
      ><a name="3331"
      > </a
      ><a name="3332" href="2016-10-25-linear-types-for-erlang-otp-1.html#3332" class="Bound"
      >A</a
      ><a name="3333" class="Symbol"
      >)</a
      ><a name="3334"
      >   </a
      ><a name="3337" class="Symbol"
      >=</a
      ><a name="3338"
      > </a
      ><a name="3339" href="2016-10-25-linear-types-for-erlang-otp-1.html#2819" class="InductiveConstructor Operator"
      >-</a
      ><a name="3340"
      > </a
      ><a name="3341" href="2016-10-25-linear-types-for-erlang-otp-1.html#3332" class="Bound"
      >A</a
      ><a name="3342"
      >           </a
      ><a name="3353" class="Symbol"
      >;</a
      ><a name="3354"
      > </a
      ><a name="3355" href="2016-10-25-linear-types-for-erlang-otp-1.html#3310" class="Function Operator"
      >~</a
      ><a name="3356"
      > </a
      ><a name="3357" class="Symbol"
      >(</a
      ><a name="3358" href="2016-10-25-linear-types-for-erlang-otp-1.html#2819" class="InductiveConstructor Operator"
      >-</a
      ><a name="3359"
      > </a
      ><a name="3360" href="2016-10-25-linear-types-for-erlang-otp-1.html#3360" class="Bound"
      >A</a
      ><a name="3361" class="Symbol"
      >)</a
      ><a name="3362"
      >   </a
      ><a name="3365" class="Symbol"
      >=</a
      ><a name="3366"
      > </a
      ><a name="3367" href="2016-10-25-linear-types-for-erlang-otp-1.html#2794" class="InductiveConstructor Operator"
      >+</a
      ><a name="3368"
      > </a
      ><a name="3369" href="2016-10-25-linear-types-for-erlang-otp-1.html#3360" class="Bound"
      >A</a
      ><a name="3370"
      >
</a
      ><a name="3371" href="2016-10-25-linear-types-for-erlang-otp-1.html#3310" class="Function Operator"
      >~</a
      ><a name="3372"
      > </a
      ><a name="3373" href="2016-10-25-linear-types-for-erlang-otp-1.html#2425" class="InductiveConstructor"
      >&#120792;</a
      ><a name="3374"
      >       </a
      ><a name="3381" class="Symbol"
      >=</a
      ><a name="3382"
      > </a
      ><a name="3383" href="2016-10-25-linear-types-for-erlang-otp-1.html#2408" class="InductiveConstructor"
      >&#8868;</a
      ><a name="3384"
      >             </a
      ><a name="3397" class="Symbol"
      >;</a
      ><a name="3398"
      > </a
      ><a name="3399" href="2016-10-25-linear-types-for-erlang-otp-1.html#3310" class="Function Operator"
      >~</a
      ><a name="3400"
      > </a
      ><a name="3401" href="2016-10-25-linear-types-for-erlang-otp-1.html#2408" class="InductiveConstructor"
      >&#8868;</a
      ><a name="3402"
      >       </a
      ><a name="3409" class="Symbol"
      >=</a
      ><a name="3410"
      > </a
      ><a name="3411" href="2016-10-25-linear-types-for-erlang-otp-1.html#2425" class="InductiveConstructor"
      >&#120792;</a
      ><a name="3412"
      >
</a
      ><a name="3413" href="2016-10-25-linear-types-for-erlang-otp-1.html#3310" class="Function Operator"
      >~</a
      ><a name="3414"
      > </a
      ><a name="3415" href="2016-10-25-linear-types-for-erlang-otp-1.html#2429" class="InductiveConstructor"
      >&#120793;</a
      ><a name="3416"
      >       </a
      ><a name="3423" class="Symbol"
      >=</a
      ><a name="3424"
      > </a
      ><a name="3425" href="2016-10-25-linear-types-for-erlang-otp-1.html#2412" class="InductiveConstructor"
      >&#8869;</a
      ><a name="3426"
      >             </a
      ><a name="3439" class="Symbol"
      >;</a
      ><a name="3440"
      > </a
      ><a name="3441" href="2016-10-25-linear-types-for-erlang-otp-1.html#3310" class="Function Operator"
      >~</a
      ><a name="3442"
      > </a
      ><a name="3443" href="2016-10-25-linear-types-for-erlang-otp-1.html#2412" class="InductiveConstructor"
      >&#8869;</a
      ><a name="3444"
      >       </a
      ><a name="3451" class="Symbol"
      >=</a
      ><a name="3452"
      > </a
      ><a name="3453" href="2016-10-25-linear-types-for-erlang-otp-1.html#2429" class="InductiveConstructor"
      >&#120793;</a
      ><a name="3454"
      >
</a
      ><a name="3455" href="2016-10-25-linear-types-for-erlang-otp-1.html#3310" class="Function Operator"
      >~</a
      ><a name="3456"
      > </a
      ><a name="3457" class="Symbol"
      >(</a
      ><a name="3458" href="2016-10-25-linear-types-for-erlang-otp-1.html#3458" class="Bound"
      >A</a
      ><a name="3459"
      > </a
      ><a name="3460" href="2016-10-25-linear-types-for-erlang-otp-1.html#2473" class="InductiveConstructor Operator"
      >&#8853;</a
      ><a name="3461"
      > </a
      ><a name="3462" href="2016-10-25-linear-types-for-erlang-otp-1.html#3462" class="Bound"
      >B</a
      ><a name="3463" class="Symbol"
      >)</a
      ><a name="3464"
      > </a
      ><a name="3465" class="Symbol"
      >=</a
      ><a name="3466"
      > </a
      ><a name="3467" href="2016-10-25-linear-types-for-erlang-otp-1.html#3310" class="Function Operator"
      >~</a
      ><a name="3468"
      > </a
      ><a name="3469" href="2016-10-25-linear-types-for-erlang-otp-1.html#3458" class="Bound"
      >A</a
      ><a name="3470"
      > </a
      ><a name="3471" href="2016-10-25-linear-types-for-erlang-otp-1.html#2442" class="InductiveConstructor Operator"
      >&amp;</a
      ><a name="3472"
      > </a
      ><a name="3473" href="2016-10-25-linear-types-for-erlang-otp-1.html#3310" class="Function Operator"
      >~</a
      ><a name="3474"
      > </a
      ><a name="3475" href="2016-10-25-linear-types-for-erlang-otp-1.html#3462" class="Bound"
      >B</a
      ><a name="3476"
      >     </a
      ><a name="3481" class="Symbol"
      >;</a
      ><a name="3482"
      > </a
      ><a name="3483" href="2016-10-25-linear-types-for-erlang-otp-1.html#3310" class="Function Operator"
      >~</a
      ><a name="3484"
      > </a
      ><a name="3485" class="Symbol"
      >(</a
      ><a name="3486" href="2016-10-25-linear-types-for-erlang-otp-1.html#3486" class="Bound"
      >A</a
      ><a name="3487"
      > </a
      ><a name="3488" href="2016-10-25-linear-types-for-erlang-otp-1.html#2442" class="InductiveConstructor Operator"
      >&amp;</a
      ><a name="3489"
      > </a
      ><a name="3490" href="2016-10-25-linear-types-for-erlang-otp-1.html#3490" class="Bound"
      >B</a
      ><a name="3491" class="Symbol"
      >)</a
      ><a name="3492"
      > </a
      ><a name="3493" class="Symbol"
      >=</a
      ><a name="3494"
      > </a
      ><a name="3495" href="2016-10-25-linear-types-for-erlang-otp-1.html#3310" class="Function Operator"
      >~</a
      ><a name="3496"
      > </a
      ><a name="3497" href="2016-10-25-linear-types-for-erlang-otp-1.html#3486" class="Bound"
      >A</a
      ><a name="3498"
      > </a
      ><a name="3499" href="2016-10-25-linear-types-for-erlang-otp-1.html#2473" class="InductiveConstructor Operator"
      >&#8853;</a
      ><a name="3500"
      > </a
      ><a name="3501" href="2016-10-25-linear-types-for-erlang-otp-1.html#3310" class="Function Operator"
      >~</a
      ><a name="3502"
      > </a
      ><a name="3503" href="2016-10-25-linear-types-for-erlang-otp-1.html#3490" class="Bound"
      >B</a
      ><a name="3504"
      >
</a
      ><a name="3505" href="2016-10-25-linear-types-for-erlang-otp-1.html#3310" class="Function Operator"
      >~</a
      ><a name="3506"
      > </a
      ><a name="3507" class="Symbol"
      >(</a
      ><a name="3508" href="2016-10-25-linear-types-for-erlang-otp-1.html#3508" class="Bound"
      >A</a
      ><a name="3509"
      > </a
      ><a name="3510" href="2016-10-25-linear-types-for-erlang-otp-1.html#2477" class="InductiveConstructor Operator"
      >&#8855;</a
      ><a name="3511"
      > </a
      ><a name="3512" href="2016-10-25-linear-types-for-erlang-otp-1.html#3512" class="Bound"
      >B</a
      ><a name="3513" class="Symbol"
      >)</a
      ><a name="3514"
      > </a
      ><a name="3515" class="Symbol"
      >=</a
      ><a name="3516"
      > </a
      ><a name="3517" href="2016-10-25-linear-types-for-erlang-otp-1.html#3310" class="Function Operator"
      >~</a
      ><a name="3518"
      > </a
      ><a name="3519" href="2016-10-25-linear-types-for-erlang-otp-1.html#3508" class="Bound"
      >A</a
      ><a name="3520"
      > </a
      ><a name="3521" href="2016-10-25-linear-types-for-erlang-otp-1.html#2446" class="InductiveConstructor Operator"
      >&#8523;</a
      ><a name="3522"
      > </a
      ><a name="3523" href="2016-10-25-linear-types-for-erlang-otp-1.html#3310" class="Function Operator"
      >~</a
      ><a name="3524"
      > </a
      ><a name="3525" href="2016-10-25-linear-types-for-erlang-otp-1.html#3512" class="Bound"
      >B</a
      ><a name="3526"
      >     </a
      ><a name="3531" class="Symbol"
      >;</a
      ><a name="3532"
      > </a
      ><a name="3533" href="2016-10-25-linear-types-for-erlang-otp-1.html#3310" class="Function Operator"
      >~</a
      ><a name="3534"
      > </a
      ><a name="3535" class="Symbol"
      >(</a
      ><a name="3536" href="2016-10-25-linear-types-for-erlang-otp-1.html#3536" class="Bound"
      >A</a
      ><a name="3537"
      > </a
      ><a name="3538" href="2016-10-25-linear-types-for-erlang-otp-1.html#2446" class="InductiveConstructor Operator"
      >&#8523;</a
      ><a name="3539"
      > </a
      ><a name="3540" href="2016-10-25-linear-types-for-erlang-otp-1.html#3540" class="Bound"
      >B</a
      ><a name="3541" class="Symbol"
      >)</a
      ><a name="3542"
      > </a
      ><a name="3543" class="Symbol"
      >=</a
      ><a name="3544"
      > </a
      ><a name="3545" href="2016-10-25-linear-types-for-erlang-otp-1.html#3310" class="Function Operator"
      >~</a
      ><a name="3546"
      > </a
      ><a name="3547" href="2016-10-25-linear-types-for-erlang-otp-1.html#3536" class="Bound"
      >A</a
      ><a name="3548"
      > </a
      ><a name="3549" href="2016-10-25-linear-types-for-erlang-otp-1.html#2477" class="InductiveConstructor Operator"
      >&#8855;</a
      ><a name="3550"
      > </a
      ><a name="3551" href="2016-10-25-linear-types-for-erlang-otp-1.html#3310" class="Function Operator"
      >~</a
      ><a name="3552"
      > </a
      ><a name="3553" href="2016-10-25-linear-types-for-erlang-otp-1.html#3540" class="Bound"
      >B</a
      ><a name="3554"
      >
</a
      ><a name="3555" href="2016-10-25-linear-types-for-erlang-otp-1.html#3310" class="Function Operator"
      >~</a
      ><a name="3556"
      > </a
      ><a name="3557" class="Symbol"
      >(</a
      ><a name="3558" href="2016-10-25-linear-types-for-erlang-otp-1.html#2504" class="InductiveConstructor Operator"
      >&#161;</a
      ><a name="3559"
      > </a
      ><a name="3560" href="2016-10-25-linear-types-for-erlang-otp-1.html#3560" class="Bound"
      >A</a
      ><a name="3561"
      > </a
      ><a name="3562" class="Symbol"
      >)</a
      ><a name="3563"
      >  </a
      ><a name="3565" class="Symbol"
      >=</a
      ><a name="3566"
      > </a
      ><a name="3567" href="2016-10-25-linear-types-for-erlang-otp-1.html#2508" class="InductiveConstructor Operator"
      >&#191;</a
      ><a name="3568"
      > </a
      ><a name="3569" href="2016-10-25-linear-types-for-erlang-otp-1.html#3310" class="Function Operator"
      >~</a
      ><a name="3570"
      > </a
      ><a name="3571" href="2016-10-25-linear-types-for-erlang-otp-1.html#3560" class="Bound"
      >A</a
      ><a name="3572"
      >         </a
      ><a name="3581" class="Symbol"
      >;</a
      ><a name="3582"
      > </a
      ><a name="3583" href="2016-10-25-linear-types-for-erlang-otp-1.html#3310" class="Function Operator"
      >~</a
      ><a name="3584"
      > </a
      ><a name="3585" class="Symbol"
      >(</a
      ><a name="3586" href="2016-10-25-linear-types-for-erlang-otp-1.html#2508" class="InductiveConstructor Operator"
      >&#191;</a
      ><a name="3587"
      > </a
      ><a name="3588" href="2016-10-25-linear-types-for-erlang-otp-1.html#3588" class="Bound"
      >A</a
      ><a name="3589"
      > </a
      ><a name="3590" class="Symbol"
      >)</a
      ><a name="3591"
      >  </a
      ><a name="3593" class="Symbol"
      >=</a
      ><a name="3594"
      > </a
      ><a name="3595" href="2016-10-25-linear-types-for-erlang-otp-1.html#2504" class="InductiveConstructor Operator"
      >&#161;</a
      ><a name="3596"
      > </a
      ><a name="3597" href="2016-10-25-linear-types-for-erlang-otp-1.html#3310" class="Function Operator"
      >~</a
      ><a name="3598"
      > </a
      ><a name="3599" href="2016-10-25-linear-types-for-erlang-otp-1.html#3588" class="Bound"
      >A</a
      ><a name="3600"
      >
</a
      ><a name="3601" href="2016-10-25-linear-types-for-erlang-otp-1.html#3310" class="Function Operator"
      >~</a
      ><a name="3602"
      > </a
      ><a name="3603" class="Symbol"
      >(</a
      ><a name="3604" href="2016-10-25-linear-types-for-erlang-otp-1.html#2529" class="InductiveConstructor"
      >&#956;</a
      ><a name="3605"
      > </a
      ><a name="3606" href="2016-10-25-linear-types-for-erlang-otp-1.html#3606" class="Bound"
      >F</a
      ><a name="3607" class="Symbol"
      >)</a
      ><a name="3608"
      >   </a
      ><a name="3611" class="Symbol"
      >=</a
      ><a name="3612"
      > </a
      ><a name="3613" href="2016-10-25-linear-types-for-erlang-otp-1.html#2533" class="InductiveConstructor"
      >&#957;[</a
      ><a name="3615"
      > </a
      ><a name="3616" href="2016-10-25-linear-types-for-erlang-otp-1.html#3616" class="Bound"
      >X</a
      ><a name="3617"
      > </a
      ><a name="3618" href="2016-10-25-linear-types-for-erlang-otp-1.html#2533" class="InductiveConstructor"
      >]</a
      ><a name="3619" class="Symbol"
      >(</a
      ><a name="3620" href="2016-10-25-linear-types-for-erlang-otp-1.html#3310" class="Function Operator"
      >~</a
      ><a name="3621"
      > </a
      ><a name="3622" href="2016-10-25-linear-types-for-erlang-otp-1.html#3606" class="Bound"
      >F</a
      ><a name="3623"
      > </a
      ><a name="3624" href="2016-10-25-linear-types-for-erlang-otp-1.html#3616" class="Bound"
      >X</a
      ><a name="3625" class="Symbol"
      >)</a
      ><a name="3626"
      > </a
      ><a name="3627" class="Symbol"
      >;</a
      ><a name="3628"
      > </a
      ><a name="3629" href="2016-10-25-linear-types-for-erlang-otp-1.html#3310" class="Function Operator"
      >~</a
      ><a name="3630"
      > </a
      ><a name="3631" class="Symbol"
      >(</a
      ><a name="3632" href="2016-10-25-linear-types-for-erlang-otp-1.html#2533" class="InductiveConstructor"
      >&#957;</a
      ><a name="3633"
      > </a
      ><a name="3634" href="2016-10-25-linear-types-for-erlang-otp-1.html#3634" class="Bound"
      >F</a
      ><a name="3635" class="Symbol"
      >)</a
      ><a name="3636"
      >   </a
      ><a name="3639" class="Symbol"
      >=</a
      ><a name="3640"
      > </a
      ><a name="3641" href="2016-10-25-linear-types-for-erlang-otp-1.html#2529" class="InductiveConstructor"
      >&#956;[</a
      ><a name="3643"
      > </a
      ><a name="3644" href="2016-10-25-linear-types-for-erlang-otp-1.html#3644" class="Bound"
      >X</a
      ><a name="3645"
      > </a
      ><a name="3646" href="2016-10-25-linear-types-for-erlang-otp-1.html#2529" class="InductiveConstructor"
      >]</a
      ><a name="3647" class="Symbol"
      >(</a
      ><a name="3648" href="2016-10-25-linear-types-for-erlang-otp-1.html#3310" class="Function Operator"
      >~</a
      ><a name="3649"
      > </a
      ><a name="3650" href="2016-10-25-linear-types-for-erlang-otp-1.html#3634" class="Bound"
      >F</a
      ><a name="3651"
      > </a
      ><a name="3652" href="2016-10-25-linear-types-for-erlang-otp-1.html#3644" class="Bound"
      >X</a
      ><a name="3653" class="Symbol"
      >)</a
      >
</pre><!--{% endraw %}-->
</div>

For instance, we can use the definitions in this module to define the
lollipop.

<!--{% raw %}--><pre class="Agda">
<a name="3768" href="2016-10-25-linear-types-for-erlang-otp-1.html#3768" class="Function Operator"
      >_&#8888;_</a
      ><a name="3771"
      > </a
      ><a name="3772" class="Symbol"
      >:</a
      ><a name="3773"
      > </a
      ><a name="3774" href="2016-10-25-linear-types-for-erlang-otp-1.html#2361" class="Datatype"
      >Type</a
      ><a name="3778"
      > </a
      ><a name="3779" class="Symbol"
      >&#8594;</a
      ><a name="3780"
      > </a
      ><a name="3781" href="2016-10-25-linear-types-for-erlang-otp-1.html#2361" class="Datatype"
      >Type</a
      ><a name="3785"
      > </a
      ><a name="3786" class="Symbol"
      >&#8594;</a
      ><a name="3787"
      > </a
      ><a name="3788" href="2016-10-25-linear-types-for-erlang-otp-1.html#2361" class="Datatype"
      >Type</a
      ><a name="3792"
      >
</a
      ><a name="3793" href="2016-10-25-linear-types-for-erlang-otp-1.html#3793" class="Bound"
      >A</a
      ><a name="3794"
      > </a
      ><a name="3795" href="2016-10-25-linear-types-for-erlang-otp-1.html#3768" class="Function Operator"
      >&#8888;</a
      ><a name="3796"
      > </a
      ><a name="3797" href="2016-10-25-linear-types-for-erlang-otp-1.html#3797" class="Bound"
      >B</a
      ><a name="3798"
      > </a
      ><a name="3799" class="Symbol"
      >=</a
      ><a name="3800"
      > </a
      ><a name="3801" href="2016-10-25-linear-types-for-erlang-otp-1.html#3310" class="Function Operator"
      >~</a
      ><a name="3802"
      > </a
      ><a name="3803" href="2016-10-25-linear-types-for-erlang-otp-1.html#3793" class="Bound"
      >A</a
      ><a name="3804"
      > </a
      ><a name="3805" href="2016-10-25-linear-types-for-erlang-otp-1.html#2446" class="InductiveConstructor Operator"
      >&#8523;</a
      ><a name="3806"
      > </a
      ><a name="3807" href="2016-10-25-linear-types-for-erlang-otp-1.html#3797" class="Bound"
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
<a name="4525" class="Keyword"
      >syntax</a
      ><a name="4531"
      > &#8853;-Fin </a
      ><a name="4538" class="Symbol"
      >(&#955;</a
      ><a name="4540"
      > i </a
      ><a name="4543" class="Symbol"
      >&#8594;</a
      ><a name="4544"
      > A</a
      ><a name="4546" class="Symbol"
      >)</a
      ><a name="4547"
      > </a
      ><a name="4548" class="Symbol"
      >=</a
      ><a name="4549"
      > &#8853;[ i ] A

</a
      ><a name="4560" href="2016-10-25-linear-types-for-erlang-otp-1.html#4560" class="Function"
      >&#8853;-Fin</a
      ><a name="4565"
      > </a
      ><a name="4566" class="Symbol"
      >:</a
      ><a name="4567"
      > </a
      ><a name="4568" class="Symbol"
      >&#8704;</a
      ><a name="4569"
      > </a
      ><a name="4570" class="Symbol"
      >{</a
      ><a name="4571" href="2016-10-25-linear-types-for-erlang-otp-1.html#4571" class="Bound"
      >n</a
      ><a name="4572" class="Symbol"
      >}</a
      ><a name="4573"
      > </a
      ><a name="4574" class="Symbol"
      >(</a
      ><a name="4575" href="2016-10-25-linear-types-for-erlang-otp-1.html#4575" class="Bound"
      >F</a
      ><a name="4576"
      > </a
      ><a name="4577" class="Symbol"
      >:</a
      ><a name="4578"
      > </a
      ><a name="4579" href="https://agda.github.io/agda-stdlib/Data.Fin.html#842" class="Datatype"
      >Fin</a
      ><a name="4582"
      > </a
      ><a name="4583" class="Symbol"
      >(</a
      ><a name="4584" class="Number"
      >2</a
      ><a name="4585"
      > </a
      ><a name="4586" href="Agda.Builtin.Nat.html#202" class="Primitive Operator"
      >+</a
      ><a name="4587"
      > </a
      ><a name="4588" href="2016-10-25-linear-types-for-erlang-otp-1.html#4571" class="Bound"
      >n</a
      ><a name="4589" class="Symbol"
      >)</a
      ><a name="4590"
      > </a
      ><a name="4591" class="Symbol"
      >&#8594;</a
      ><a name="4592"
      > </a
      ><a name="4593" href="2016-10-25-linear-types-for-erlang-otp-1.html#2361" class="Datatype"
      >Type</a
      ><a name="4597" class="Symbol"
      >)</a
      ><a name="4598"
      > </a
      ><a name="4599" class="Symbol"
      >&#8594;</a
      ><a name="4600"
      > </a
      ><a name="4601" href="2016-10-25-linear-types-for-erlang-otp-1.html#2361" class="Datatype"
      >Type</a
      ><a name="4605"
      >
</a
      ><a name="4606" href="2016-10-25-linear-types-for-erlang-otp-1.html#4560" class="Function"
      >&#8853;-Fin</a
      ><a name="4611"
      > </a
      ><a name="4612" class="Symbol"
      >{</a
      ><a name="4613" href="2016-10-25-linear-types-for-erlang-otp-1.html#4613" class="Bound"
      >n</a
      ><a name="4614" class="Symbol"
      >}</a
      ><a name="4615"
      > </a
      ><a name="4616" href="2016-10-25-linear-types-for-erlang-otp-1.html#4616" class="Bound"
      >F</a
      ><a name="4617"
      > </a
      ><a name="4618" class="Symbol"
      >=</a
      ><a name="4619"
      > </a
      ><a name="4620" href="https://agda.github.io/agda-stdlib/Data.Vec.html#2745" class="Function"
      >foldr&#8321;</a
      ><a name="4626"
      > </a
      ><a name="4627" href="2016-10-25-linear-types-for-erlang-otp-1.html#2473" class="InductiveConstructor Operator"
      >_&#8853;_</a
      ><a name="4630"
      > </a
      ><a name="4631" class="Symbol"
      >(</a
      ><a name="4632" href="https://agda.github.io/agda-stdlib/Data.Vec.html#1999" class="Function"
      >map</a
      ><a name="4635"
      > </a
      ><a name="4636" href="2016-10-25-linear-types-for-erlang-otp-1.html#4616" class="Bound"
      >F</a
      ><a name="4637"
      > </a
      ><a name="4638" class="Symbol"
      >(</a
      ><a name="4639" href="https://agda.github.io/agda-stdlib/Data.Vec.html#6871" class="Function"
      >allFin</a
      ><a name="4645"
      > </a
      ><a name="4646" class="Symbol"
      >(</a
      ><a name="4647" class="Number"
      >2</a
      ><a name="4648"
      > </a
      ><a name="4649" href="Agda.Builtin.Nat.html#202" class="Primitive Operator"
      >+</a
      ><a name="4650"
      > </a
      ><a name="4651" href="2016-10-25-linear-types-for-erlang-otp-1.html#4613" class="Bound"
      >n</a
      ><a name="4652" class="Symbol"
      >)))</a
      >
</pre><!--{% endraw %}-->

We define a similar construction for with (`&`).

<!--{% raw %}--><pre class="Agda">
<a name="4731" class="Keyword"
      >syntax</a
      ><a name="4737"
      > &amp;-Fin </a
      ><a name="4744" class="Symbol"
      >(&#955;</a
      ><a name="4746"
      > i </a
      ><a name="4749" class="Symbol"
      >&#8594;</a
      ><a name="4750"
      > A</a
      ><a name="4752" class="Symbol"
      >)</a
      ><a name="4753"
      > </a
      ><a name="4754" class="Symbol"
      >=</a
      ><a name="4755"
      > &amp;[ i ] A

</a
      ><a name="4766" href="2016-10-25-linear-types-for-erlang-otp-1.html#4766" class="Function"
      >&amp;-Fin</a
      ><a name="4771"
      > </a
      ><a name="4772" class="Symbol"
      >:</a
      ><a name="4773"
      > </a
      ><a name="4774" class="Symbol"
      >&#8704;</a
      ><a name="4775"
      > </a
      ><a name="4776" class="Symbol"
      >{</a
      ><a name="4777" href="2016-10-25-linear-types-for-erlang-otp-1.html#4777" class="Bound"
      >n</a
      ><a name="4778" class="Symbol"
      >}</a
      ><a name="4779"
      > </a
      ><a name="4780" class="Symbol"
      >(</a
      ><a name="4781" href="2016-10-25-linear-types-for-erlang-otp-1.html#4781" class="Bound"
      >F</a
      ><a name="4782"
      > </a
      ><a name="4783" class="Symbol"
      >:</a
      ><a name="4784"
      > </a
      ><a name="4785" href="https://agda.github.io/agda-stdlib/Data.Fin.html#842" class="Datatype"
      >Fin</a
      ><a name="4788"
      > </a
      ><a name="4789" class="Symbol"
      >(</a
      ><a name="4790" class="Number"
      >2</a
      ><a name="4791"
      > </a
      ><a name="4792" href="Agda.Builtin.Nat.html#202" class="Primitive Operator"
      >+</a
      ><a name="4793"
      > </a
      ><a name="4794" href="2016-10-25-linear-types-for-erlang-otp-1.html#4777" class="Bound"
      >n</a
      ><a name="4795" class="Symbol"
      >)</a
      ><a name="4796"
      > </a
      ><a name="4797" class="Symbol"
      >&#8594;</a
      ><a name="4798"
      > </a
      ><a name="4799" href="2016-10-25-linear-types-for-erlang-otp-1.html#2361" class="Datatype"
      >Type</a
      ><a name="4803" class="Symbol"
      >)</a
      ><a name="4804"
      > </a
      ><a name="4805" class="Symbol"
      >&#8594;</a
      ><a name="4806"
      > </a
      ><a name="4807" href="2016-10-25-linear-types-for-erlang-otp-1.html#2361" class="Datatype"
      >Type</a
      ><a name="4811"
      >
</a
      ><a name="4812" href="2016-10-25-linear-types-for-erlang-otp-1.html#4766" class="Function"
      >&amp;-Fin</a
      ><a name="4817"
      > </a
      ><a name="4818" class="Symbol"
      >{</a
      ><a name="4819" href="2016-10-25-linear-types-for-erlang-otp-1.html#4819" class="Bound"
      >n</a
      ><a name="4820" class="Symbol"
      >}</a
      ><a name="4821"
      > </a
      ><a name="4822" href="2016-10-25-linear-types-for-erlang-otp-1.html#4822" class="Bound"
      >F</a
      ><a name="4823"
      > </a
      ><a name="4824" class="Symbol"
      >=</a
      ><a name="4825"
      > </a
      ><a name="4826" href="https://agda.github.io/agda-stdlib/Data.Vec.html#2745" class="Function"
      >foldr&#8321;</a
      ><a name="4832"
      > </a
      ><a name="4833" href="2016-10-25-linear-types-for-erlang-otp-1.html#2442" class="InductiveConstructor Operator"
      >_&amp;_</a
      ><a name="4836"
      > </a
      ><a name="4837" class="Symbol"
      >(</a
      ><a name="4838" href="https://agda.github.io/agda-stdlib/Data.Vec.html#1999" class="Function"
      >map</a
      ><a name="4841"
      > </a
      ><a name="4842" href="2016-10-25-linear-types-for-erlang-otp-1.html#4822" class="Bound"
      >F</a
      ><a name="4843"
      > </a
      ><a name="4844" class="Symbol"
      >(</a
      ><a name="4845" href="https://agda.github.io/agda-stdlib/Data.Vec.html#6871" class="Function"
      >allFin</a
      ><a name="4851"
      > </a
      ><a name="4852" class="Symbol"
      >(</a
      ><a name="4853" class="Number"
      >2</a
      ><a name="4854"
      > </a
      ><a name="4855" href="Agda.Builtin.Nat.html#202" class="Primitive Operator"
      >+</a
      ><a name="4856"
      > </a
      ><a name="4857" href="2016-10-25-linear-types-for-erlang-otp-1.html#4819" class="Bound"
      >n</a
      ><a name="4858" class="Symbol"
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
<a name="12897" href="2016-10-25-linear-types-for-erlang-otp-1.html#12897" class="Function"
      >Maybe</a
      ><a name="12902"
      > </a
      ><a name="12903" class="Symbol"
      >:</a
      ><a name="12904"
      > </a
      ><a name="12905" href="2016-10-25-linear-types-for-erlang-otp-1.html#2361" class="Datatype"
      >Type</a
      ><a name="12909"
      > </a
      ><a name="12910" class="Symbol"
      >&#8594;</a
      ><a name="12911"
      > </a
      ><a name="12912" href="2016-10-25-linear-types-for-erlang-otp-1.html#2361" class="Datatype"
      >Type</a
      ><a name="12916"
      >
</a
      ><a name="12917" href="2016-10-25-linear-types-for-erlang-otp-1.html#12897" class="Function"
      >Maybe</a
      ><a name="12922"
      > </a
      ><a name="12923" href="2016-10-25-linear-types-for-erlang-otp-1.html#12923" class="Bound"
      >A</a
      ><a name="12924"
      > </a
      ><a name="12925" class="Symbol"
      >=</a
      ><a name="12926"
      > </a
      ><a name="12927" href="2016-10-25-linear-types-for-erlang-otp-1.html#2429" class="InductiveConstructor"
      >&#120793;</a
      ><a name="12928"
      > </a
      ><a name="12929" href="2016-10-25-linear-types-for-erlang-otp-1.html#2473" class="InductiveConstructor Operator"
      >&#8853;</a
      ><a name="12930"
      > </a
      ><a name="12931" href="2016-10-25-linear-types-for-erlang-otp-1.html#12923" class="Bound"
      >A</a
      ><a name="12932"
      >
</a
      ><a name="12933" href="2016-10-25-linear-types-for-erlang-otp-1.html#12933" class="Function"
      >Name</a
      ><a name="12937"
      >    </a
      ><a name="12941" class="Symbol"
      >=</a
      ><a name="12942"
      > </a
      ><a name="12943" href="2016-10-25-linear-types-for-erlang-otp-1.html#2429" class="InductiveConstructor"
      >&#120793;</a
      ><a name="12944"
      > </a
      ><a name="12945" href="2016-10-25-linear-types-for-erlang-otp-1.html#2473" class="InductiveConstructor Operator"
      >&#8853;</a
      ><a name="12946"
      > </a
      ><a name="12947" href="2016-10-25-linear-types-for-erlang-otp-1.html#2429" class="InductiveConstructor"
      >&#120793;</a
      ><a name="12948"
      >
</a
      ><a name="12949" href="2016-10-25-linear-types-for-erlang-otp-1.html#12949" class="Function"
      >Place</a
      ><a name="12954"
      >   </a
      ><a name="12957" class="Symbol"
      >=</a
      ><a name="12958"
      > </a
      ><a name="12959" href="2016-10-25-linear-types-for-erlang-otp-1.html#2429" class="InductiveConstructor"
      >&#120793;</a
      ><a name="12960"
      > </a
      ><a name="12961" href="2016-10-25-linear-types-for-erlang-otp-1.html#2473" class="InductiveConstructor Operator"
      >&#8853;</a
      ><a name="12962"
      > </a
      ><a name="12963" href="2016-10-25-linear-types-for-erlang-otp-1.html#2429" class="InductiveConstructor"
      >&#120793;</a
      ><a name="12964"
      >
</a
      ><a name="12965" href="2016-10-25-linear-types-for-erlang-otp-1.html#12965" class="Function"
      >Dict</a
      ><a name="12969"
      >    </a
      ><a name="12973" class="Symbol"
      >=</a
      ><a name="12974"
      > </a
      ><a name="12975" href="2016-10-25-linear-types-for-erlang-otp-1.html#12933" class="Function"
      >Name</a
      ><a name="12979"
      > </a
      ><a name="12980" href="2016-10-25-linear-types-for-erlang-otp-1.html#3768" class="Function Operator"
      >&#8888;</a
      ><a name="12981"
      > </a
      ><a name="12982" href="2016-10-25-linear-types-for-erlang-otp-1.html#12897" class="Function"
      >Maybe</a
      ><a name="12987"
      > </a
      ><a name="12988" href="2016-10-25-linear-types-for-erlang-otp-1.html#12949" class="Function"
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
<a name="14131" href="2016-10-25-linear-types-for-erlang-otp-1.html#14131" class="Function"
      >Module</a
      ><a name="14137"
      > </a
      ><a name="14138" class="Symbol"
      >:</a
      ><a name="14139"
      > </a
      ><a name="14140" class="Symbol"
      >&#8704;</a
      ><a name="14141"
      > </a
      ><a name="14142" class="Symbol"
      >{</a
      ><a name="14143" href="2016-10-25-linear-types-for-erlang-otp-1.html#14143" class="Bound"
      >n</a
      ><a name="14144" class="Symbol"
      >}</a
      ><a name="14145"
      > </a
      ><a name="14146" class="Symbol"
      >(</a
      ><a name="14147" href="2016-10-25-linear-types-for-erlang-otp-1.html#14147" class="Bound"
      >A</a
      ><a name="14148"
      > </a
      ><a name="14149" href="2016-10-25-linear-types-for-erlang-otp-1.html#14149" class="Bound"
      >R</a
      ><a name="14150"
      > </a
      ><a name="14151" class="Symbol"
      >:</a
      ><a name="14152"
      > </a
      ><a name="14153" href="https://agda.github.io/agda-stdlib/Data.Fin.html#842" class="Datatype"
      >Fin</a
      ><a name="14156"
      > </a
      ><a name="14157" class="Symbol"
      >(</a
      ><a name="14158" class="Number"
      >2</a
      ><a name="14159"
      > </a
      ><a name="14160" href="Agda.Builtin.Nat.html#202" class="Primitive Operator"
      >+</a
      ><a name="14161"
      > </a
      ><a name="14162" href="2016-10-25-linear-types-for-erlang-otp-1.html#14143" class="Bound"
      >n</a
      ><a name="14163" class="Symbol"
      >)</a
      ><a name="14164"
      > </a
      ><a name="14165" class="Symbol"
      >&#8594;</a
      ><a name="14166"
      > </a
      ><a name="14167" href="2016-10-25-linear-types-for-erlang-otp-1.html#2361" class="Datatype"
      >Type</a
      ><a name="14171" class="Symbol"
      >)</a
      ><a name="14172"
      > </a
      ><a name="14173" class="Symbol"
      >(</a
      ><a name="14174" href="2016-10-25-linear-types-for-erlang-otp-1.html#14174" class="Bound"
      >S</a
      ><a name="14175"
      > </a
      ><a name="14176" class="Symbol"
      >:</a
      ><a name="14177"
      > </a
      ><a name="14178" href="2016-10-25-linear-types-for-erlang-otp-1.html#2361" class="Datatype"
      >Type</a
      ><a name="14182" class="Symbol"
      >)</a
      ><a name="14183"
      > </a
      ><a name="14184" class="Symbol"
      >&#8594;</a
      ><a name="14185"
      > </a
      ><a name="14186" href="2016-10-25-linear-types-for-erlang-otp-1.html#2361" class="Datatype"
      >Type</a
      ><a name="14190"
      >
</a
      ><a name="14191" href="2016-10-25-linear-types-for-erlang-otp-1.html#14131" class="Function"
      >Module</a
      ><a name="14197"
      > </a
      ><a name="14198" href="2016-10-25-linear-types-for-erlang-otp-1.html#14198" class="Bound"
      >A</a
      ><a name="14199"
      > </a
      ><a name="14200" href="2016-10-25-linear-types-for-erlang-otp-1.html#14200" class="Bound"
      >R</a
      ><a name="14201"
      > </a
      ><a name="14202" href="2016-10-25-linear-types-for-erlang-otp-1.html#14202" class="Bound"
      >S</a
      ><a name="14203"
      > </a
      ><a name="14204" class="Symbol"
      >=</a
      ><a name="14205"
      > </a
      ><a name="14206" href="2016-10-25-linear-types-for-erlang-otp-1.html#4766" class="Function"
      >&amp;[</a
      ><a name="14208"
      > </a
      ><a name="14209" href="2016-10-25-linear-types-for-erlang-otp-1.html#14209" class="Bound"
      >i</a
      ><a name="14210"
      > </a
      ><a name="14211" href="2016-10-25-linear-types-for-erlang-otp-1.html#4766" class="Function"
      >]</a
      ><a name="14212"
      > </a
      ><a name="14213" class="Symbol"
      >(</a
      ><a name="14214" href="2016-10-25-linear-types-for-erlang-otp-1.html#14198" class="Bound"
      >A</a
      ><a name="14215"
      > </a
      ><a name="14216" href="2016-10-25-linear-types-for-erlang-otp-1.html#14209" class="Bound"
      >i</a
      ><a name="14217"
      > </a
      ><a name="14218" href="2016-10-25-linear-types-for-erlang-otp-1.html#2477" class="InductiveConstructor Operator"
      >&#8855;</a
      ><a name="14219"
      > </a
      ><a name="14220" href="2016-10-25-linear-types-for-erlang-otp-1.html#14202" class="Bound"
      >S</a
      ><a name="14221"
      > </a
      ><a name="14222" href="2016-10-25-linear-types-for-erlang-otp-1.html#3768" class="Function Operator"
      >&#8888;</a
      ><a name="14223"
      > </a
      ><a name="14224" href="2016-10-25-linear-types-for-erlang-otp-1.html#14200" class="Bound"
      >R</a
      ><a name="14225"
      > </a
      ><a name="14226" href="2016-10-25-linear-types-for-erlang-otp-1.html#14209" class="Bound"
      >i</a
      ><a name="14227"
      > </a
      ><a name="14228" href="2016-10-25-linear-types-for-erlang-otp-1.html#2477" class="InductiveConstructor Operator"
      >&#8855;</a
      ><a name="14229"
      > </a
      ><a name="14230" href="2016-10-25-linear-types-for-erlang-otp-1.html#14202" class="Bound"
      >S</a
      ><a name="14231" class="Symbol"
      >)</a
      >
</pre><!--{% endraw %}-->

We can use this type to derive the type for the `name_server`
module. First, we defined a datatype for requests. We can either
define this as a datatype, and then provide a bijection with a finite
type, or we can simply define it as some syntactic sugar on top of
finite types. We'll choose the second option here.

<!--{% raw %}--><pre class="Agda">
<a name="14574" href="2016-10-25-linear-types-for-erlang-otp-1.html#14574" class="Function"
      >Request</a
      ><a name="14581"
      > </a
      ><a name="14582" class="Symbol"
      >=</a
      ><a name="14583"
      > </a
      ><a name="14584" href="https://agda.github.io/agda-stdlib/Data.Fin.html#842" class="Datatype"
      >Fin</a
      ><a name="14587"
      > </a
      ><a name="14588" class="Number"
      >2</a
      ><a name="14589"
      >
</a
      ><a name="14590" class="Keyword"
      >pattern</a
      ><a name="14597"
      > </a
      ><a name="14598" href="2016-10-25-linear-types-for-erlang-otp-1.html#14598" class="InductiveConstructor"
      >add</a
      ><a name="14601"
      >     </a
      ><a name="14606" class="Symbol"
      >=</a
      ><a name="14607"
      > </a
      ><a name="14608" href="https://agda.github.io/agda-stdlib/Data.Fin.html#864" class="InductiveConstructor"
      >zero</a
      ><a name="14612"
      >
</a
      ><a name="14613" class="Keyword"
      >pattern</a
      ><a name="14620"
      > </a
      ><a name="14621" href="2016-10-25-linear-types-for-erlang-otp-1.html#14621" class="InductiveConstructor"
      >whereis</a
      ><a name="14628"
      > </a
      ><a name="14629" class="Symbol"
      >=</a
      ><a name="14630"
      > </a
      ><a name="14631" href="https://agda.github.io/agda-stdlib/Data.Fin.html#895" class="InductiveConstructor"
      >suc</a
      ><a name="14634"
      > </a
      ><a name="14635" href="https://agda.github.io/agda-stdlib/Data.Fin.html#864" class="InductiveConstructor"
      >zero</a
      ><a name="14639"
      >
</a
      ><a name="14640" class="Keyword"
      >pattern</a
      ><a name="14647"
      > </a
      ><a name="14648" href="2016-10-25-linear-types-for-erlang-otp-1.html#14648" class="InductiveConstructor"
      >end</a
      ><a name="14651"
      >     </a
      ><a name="14656" class="Symbol"
      >=</a
      ><a name="14657"
      > </a
      ><a name="14658" href="https://agda.github.io/agda-stdlib/Data.Fin.html#895" class="InductiveConstructor"
      >suc</a
      ><a name="14661"
      > </a
      ><a name="14662" class="Symbol"
      >(</a
      ><a name="14663" href="https://agda.github.io/agda-stdlib/Data.Fin.html#895" class="InductiveConstructor"
      >suc</a
      ><a name="14666"
      > </a
      ><a name="14667" class="Symbol"
      >())</a
      >
</pre><!--{% endraw %}-->

Once we have a type for requests, we can define the `A`, `R` and `S`
parameters of `Module`.

<!--{% raw %}--><pre class="Agda">
<a name="14790" href="2016-10-25-linear-types-for-erlang-otp-1.html#14790" class="Function"
      >A</a
      ><a name="14791"
      > </a
      ><a name="14792" class="Symbol"
      >:</a
      ><a name="14793"
      > </a
      ><a name="14794" href="2016-10-25-linear-types-for-erlang-otp-1.html#14574" class="Function"
      >Request</a
      ><a name="14801"
      > </a
      ><a name="14802" class="Symbol"
      >&#8594;</a
      ><a name="14803"
      > </a
      ><a name="14804" href="2016-10-25-linear-types-for-erlang-otp-1.html#2361" class="Datatype"
      >Type</a
      ><a name="14808"
      >
</a
      ><a name="14809" href="2016-10-25-linear-types-for-erlang-otp-1.html#14790" class="Function"
      >A</a
      ><a name="14810"
      > </a
      ><a name="14811" href="2016-10-25-linear-types-for-erlang-otp-1.html#14598" class="InductiveConstructor"
      >add</a
      ><a name="14814"
      >     </a
      ><a name="14819" class="Symbol"
      >=</a
      ><a name="14820"
      > </a
      ><a name="14821" href="2016-10-25-linear-types-for-erlang-otp-1.html#12933" class="Function"
      >Name</a
      ><a name="14825"
      > </a
      ><a name="14826" href="2016-10-25-linear-types-for-erlang-otp-1.html#2477" class="InductiveConstructor Operator"
      >&#8855;</a
      ><a name="14827"
      > </a
      ><a name="14828" href="2016-10-25-linear-types-for-erlang-otp-1.html#2504" class="InductiveConstructor Operator"
      >&#161;</a
      ><a name="14829"
      > </a
      ><a name="14830" href="2016-10-25-linear-types-for-erlang-otp-1.html#12949" class="Function"
      >Place</a
      ><a name="14835"
      >
</a
      ><a name="14836" href="2016-10-25-linear-types-for-erlang-otp-1.html#14790" class="Function"
      >A</a
      ><a name="14837"
      > </a
      ><a name="14838" href="2016-10-25-linear-types-for-erlang-otp-1.html#14621" class="InductiveConstructor"
      >whereis</a
      ><a name="14845"
      > </a
      ><a name="14846" class="Symbol"
      >=</a
      ><a name="14847"
      > </a
      ><a name="14848" href="2016-10-25-linear-types-for-erlang-otp-1.html#12933" class="Function"
      >Name</a
      ><a name="14852"
      >
</a
      ><a name="14853" href="2016-10-25-linear-types-for-erlang-otp-1.html#14790" class="Function"
      >A</a
      ><a name="14854"
      > </a
      ><a name="14855" href="2016-10-25-linear-types-for-erlang-otp-1.html#14648" class="InductiveConstructor"
      >end</a
      ><a name="14858"
      >

</a
      ><a name="14860" href="2016-10-25-linear-types-for-erlang-otp-1.html#14860" class="Function"
      >R</a
      ><a name="14861"
      > </a
      ><a name="14862" class="Symbol"
      >:</a
      ><a name="14863"
      > </a
      ><a name="14864" href="2016-10-25-linear-types-for-erlang-otp-1.html#14574" class="Function"
      >Request</a
      ><a name="14871"
      > </a
      ><a name="14872" class="Symbol"
      >&#8594;</a
      ><a name="14873"
      > </a
      ><a name="14874" href="2016-10-25-linear-types-for-erlang-otp-1.html#2361" class="Datatype"
      >Type</a
      ><a name="14878"
      >
</a
      ><a name="14879" href="2016-10-25-linear-types-for-erlang-otp-1.html#14860" class="Function"
      >R</a
      ><a name="14880"
      > </a
      ><a name="14881" href="2016-10-25-linear-types-for-erlang-otp-1.html#14598" class="InductiveConstructor"
      >add</a
      ><a name="14884"
      >     </a
      ><a name="14889" class="Symbol"
      >=</a
      ><a name="14890"
      > </a
      ><a name="14891" href="2016-10-25-linear-types-for-erlang-otp-1.html#2429" class="InductiveConstructor"
      >&#120793;</a
      ><a name="14892"
      >
</a
      ><a name="14893" href="2016-10-25-linear-types-for-erlang-otp-1.html#14860" class="Function"
      >R</a
      ><a name="14894"
      > </a
      ><a name="14895" href="2016-10-25-linear-types-for-erlang-otp-1.html#14621" class="InductiveConstructor"
      >whereis</a
      ><a name="14902"
      > </a
      ><a name="14903" class="Symbol"
      >=</a
      ><a name="14904"
      > </a
      ><a name="14905" href="2016-10-25-linear-types-for-erlang-otp-1.html#2504" class="InductiveConstructor Operator"
      >&#161;</a
      ><a name="14906"
      > </a
      ><a name="14907" href="2016-10-25-linear-types-for-erlang-otp-1.html#12897" class="Function"
      >Maybe</a
      ><a name="14912"
      > </a
      ><a name="14913" href="2016-10-25-linear-types-for-erlang-otp-1.html#12949" class="Function"
      >Place</a
      ><a name="14918"
      >
</a
      ><a name="14919" href="2016-10-25-linear-types-for-erlang-otp-1.html#14860" class="Function"
      >R</a
      ><a name="14920"
      > </a
      ><a name="14921" href="2016-10-25-linear-types-for-erlang-otp-1.html#14648" class="InductiveConstructor"
      >end</a
      ><a name="14924"
      >

</a
      ><a name="14926" href="2016-10-25-linear-types-for-erlang-otp-1.html#14926" class="Function"
      >S</a
      ><a name="14927"
      > </a
      ><a name="14928" class="Symbol"
      >:</a
      ><a name="14929"
      > </a
      ><a name="14930" href="2016-10-25-linear-types-for-erlang-otp-1.html#2361" class="Datatype"
      >Type</a
      ><a name="14934"
      >
</a
      ><a name="14935" href="2016-10-25-linear-types-for-erlang-otp-1.html#14926" class="Function"
      >S</a
      ><a name="14936"
      > </a
      ><a name="14937" class="Symbol"
      >=</a
      ><a name="14938"
      > </a
      ><a name="14939" href="2016-10-25-linear-types-for-erlang-otp-1.html#2504" class="InductiveConstructor Operator"
      >&#161;</a
      ><a name="14940"
      > </a
      ><a name="14941" href="2016-10-25-linear-types-for-erlang-otp-1.html#12965" class="Function"
      >Dict</a
      >
</pre><!--{% endraw %}-->

Now we can show that `Module A R S` indeed derives the correct type.

<!--{% raw %}--><pre class="Agda">
<a name="15041" href="2016-10-25-linear-types-for-erlang-otp-1.html#15041" class="Function"
      >NameModule</a
      ><a name="15051"
      > </a
      ><a name="15052" class="Symbol"
      >=</a
      ><a name="15053"
      > </a
      ><a name="15054" href="2016-10-25-linear-types-for-erlang-otp-1.html#14131" class="Function"
      >Module</a
      ><a name="15060"
      > </a
      ><a name="15061" href="2016-10-25-linear-types-for-erlang-otp-1.html#14790" class="Function"
      >A</a
      ><a name="15062"
      > </a
      ><a name="15063" href="2016-10-25-linear-types-for-erlang-otp-1.html#14860" class="Function"
      >R</a
      ><a name="15064"
      > </a
      ><a name="15065" href="2016-10-25-linear-types-for-erlang-otp-1.html#14926" class="Function"
      >S</a
      ><a name="15066"
      >
</a
      ><a name="15067" class="Comment"
      >--&gt;</a
      ><a name="15070"
      >
</a
      ><a name="15071" href="2016-10-25-linear-types-for-erlang-otp-1.html#15071" class="Function Operator"
      >test_NameModule</a
      ><a name="15086"
      > </a
      ><a name="15087" class="Symbol"
      >:</a
      ><a name="15088"
      > </a
      ><a name="15089" href="2016-10-25-linear-types-for-erlang-otp-1.html#15041" class="Function"
      >NameModule</a
      ><a name="15099"
      > </a
      ><a name="15100" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="15101"
      >
  </a
      ><a name="15104" class="Comment"
      >{- add     -}</a
      ><a name="15117"
      > </a
      ><a name="15118" class="Symbol"
      >(</a
      ><a name="15119" href="2016-10-25-linear-types-for-erlang-otp-1.html#12933" class="Function"
      >Name</a
      ><a name="15123"
      > </a
      ><a name="15124" href="2016-10-25-linear-types-for-erlang-otp-1.html#2477" class="InductiveConstructor Operator"
      >&#8855;</a
      ><a name="15125"
      > </a
      ><a name="15126" href="2016-10-25-linear-types-for-erlang-otp-1.html#2504" class="InductiveConstructor Operator"
      >&#161;</a
      ><a name="15127"
      > </a
      ><a name="15128" href="2016-10-25-linear-types-for-erlang-otp-1.html#12949" class="Function"
      >Place</a
      ><a name="15133"
      > </a
      ><a name="15134" href="2016-10-25-linear-types-for-erlang-otp-1.html#2477" class="InductiveConstructor Operator"
      >&#8855;</a
      ><a name="15135"
      > </a
      ><a name="15136" href="2016-10-25-linear-types-for-erlang-otp-1.html#2504" class="InductiveConstructor Operator"
      >&#161;</a
      ><a name="15137"
      > </a
      ><a name="15138" href="2016-10-25-linear-types-for-erlang-otp-1.html#12965" class="Function"
      >Dict</a
      ><a name="15142"
      > </a
      ><a name="15143" href="2016-10-25-linear-types-for-erlang-otp-1.html#3768" class="Function Operator"
      >&#8888;</a
      ><a name="15144"
      > </a
      ><a name="15145" href="2016-10-25-linear-types-for-erlang-otp-1.html#2429" class="InductiveConstructor"
      >&#120793;</a
      ><a name="15146"
      >             </a
      ><a name="15159" href="2016-10-25-linear-types-for-erlang-otp-1.html#2477" class="InductiveConstructor Operator"
      >&#8855;</a
      ><a name="15160"
      > </a
      ><a name="15161" href="2016-10-25-linear-types-for-erlang-otp-1.html#2504" class="InductiveConstructor Operator"
      >&#161;</a
      ><a name="15162"
      > </a
      ><a name="15163" href="2016-10-25-linear-types-for-erlang-otp-1.html#12965" class="Function"
      >Dict</a
      ><a name="15167" class="Symbol"
      >)</a
      ><a name="15168"
      > </a
      ><a name="15169" href="2016-10-25-linear-types-for-erlang-otp-1.html#2442" class="InductiveConstructor Operator"
      >&amp;</a
      ><a name="15170"
      >
  </a
      ><a name="15173" class="Comment"
      >{- whereis -}</a
      ><a name="15186"
      > </a
      ><a name="15187" class="Symbol"
      >(</a
      ><a name="15188" href="2016-10-25-linear-types-for-erlang-otp-1.html#12933" class="Function"
      >Name</a
      ><a name="15192"
      >           </a
      ><a name="15203" href="2016-10-25-linear-types-for-erlang-otp-1.html#2477" class="InductiveConstructor Operator"
      >&#8855;</a
      ><a name="15204"
      > </a
      ><a name="15205" href="2016-10-25-linear-types-for-erlang-otp-1.html#2504" class="InductiveConstructor Operator"
      >&#161;</a
      ><a name="15206"
      > </a
      ><a name="15207" href="2016-10-25-linear-types-for-erlang-otp-1.html#12965" class="Function"
      >Dict</a
      ><a name="15211"
      > </a
      ><a name="15212" href="2016-10-25-linear-types-for-erlang-otp-1.html#3768" class="Function Operator"
      >&#8888;</a
      ><a name="15213"
      > </a
      ><a name="15214" href="2016-10-25-linear-types-for-erlang-otp-1.html#2504" class="InductiveConstructor Operator"
      >&#161;</a
      ><a name="15215"
      > </a
      ><a name="15216" href="2016-10-25-linear-types-for-erlang-otp-1.html#12897" class="Function"
      >Maybe</a
      ><a name="15221"
      > </a
      ><a name="15222" href="2016-10-25-linear-types-for-erlang-otp-1.html#12949" class="Function"
      >Place</a
      ><a name="15227"
      > </a
      ><a name="15228" href="2016-10-25-linear-types-for-erlang-otp-1.html#2477" class="InductiveConstructor Operator"
      >&#8855;</a
      ><a name="15229"
      > </a
      ><a name="15230" href="2016-10-25-linear-types-for-erlang-otp-1.html#2504" class="InductiveConstructor Operator"
      >&#161;</a
      ><a name="15231"
      > </a
      ><a name="15232" href="2016-10-25-linear-types-for-erlang-otp-1.html#12965" class="Function"
      >Dict</a
      ><a name="15236" class="Symbol"
      >)</a
      ><a name="15237"
      >
</a
      ><a name="15238" href="2016-10-25-linear-types-for-erlang-otp-1.html#15071" class="Function Operator"
      >test_NameModule</a
      ><a name="15253"
      > </a
      ><a name="15254" class="Symbol"
      >=</a
      ><a name="15255"
      > </a
      ><a name="15256" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
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
<a name="19476" href="2016-10-25-linear-types-for-erlang-otp-1.html#19476" class="Function"
      >Server</a
      ><a name="19482"
      > </a
      ><a name="19483" class="Symbol"
      >:</a
      ><a name="19484"
      > </a
      ><a name="19485" class="Symbol"
      >&#8704;</a
      ><a name="19486"
      > </a
      ><a name="19487" class="Symbol"
      >{</a
      ><a name="19488" href="2016-10-25-linear-types-for-erlang-otp-1.html#19488" class="Bound"
      >n</a
      ><a name="19489" class="Symbol"
      >}</a
      ><a name="19490"
      > </a
      ><a name="19491" class="Symbol"
      >(</a
      ><a name="19492" href="2016-10-25-linear-types-for-erlang-otp-1.html#19492" class="Bound"
      >A</a
      ><a name="19493"
      > </a
      ><a name="19494" href="2016-10-25-linear-types-for-erlang-otp-1.html#19494" class="Bound"
      >R</a
      ><a name="19495"
      > </a
      ><a name="19496" class="Symbol"
      >:</a
      ><a name="19497"
      > </a
      ><a name="19498" href="https://agda.github.io/agda-stdlib/Data.Fin.html#842" class="Datatype"
      >Fin</a
      ><a name="19501"
      > </a
      ><a name="19502" class="Symbol"
      >(</a
      ><a name="19503" class="Number"
      >2</a
      ><a name="19504"
      > </a
      ><a name="19505" href="Agda.Builtin.Nat.html#202" class="Primitive Operator"
      >+</a
      ><a name="19506"
      > </a
      ><a name="19507" href="2016-10-25-linear-types-for-erlang-otp-1.html#19488" class="Bound"
      >n</a
      ><a name="19508" class="Symbol"
      >)</a
      ><a name="19509"
      > </a
      ><a name="19510" class="Symbol"
      >&#8594;</a
      ><a name="19511"
      > </a
      ><a name="19512" href="2016-10-25-linear-types-for-erlang-otp-1.html#2361" class="Datatype"
      >Type</a
      ><a name="19516" class="Symbol"
      >)</a
      ><a name="19517"
      > </a
      ><a name="19518" class="Symbol"
      >&#8594;</a
      ><a name="19519"
      > </a
      ><a name="19520" href="2016-10-25-linear-types-for-erlang-otp-1.html#2361" class="Datatype"
      >Type</a
      ><a name="19524"
      >
</a
      ><a name="19525" href="2016-10-25-linear-types-for-erlang-otp-1.html#19476" class="Function"
      >Server</a
      ><a name="19531"
      > </a
      ><a name="19532" href="2016-10-25-linear-types-for-erlang-otp-1.html#19532" class="Bound"
      >A</a
      ><a name="19533"
      > </a
      ><a name="19534" href="2016-10-25-linear-types-for-erlang-otp-1.html#19534" class="Bound"
      >R</a
      ><a name="19535"
      > </a
      ><a name="19536" class="Symbol"
      >=</a
      ><a name="19537"
      > </a
      ><a name="19538" href="2016-10-25-linear-types-for-erlang-otp-1.html#2533" class="InductiveConstructor"
      >&#957;[</a
      ><a name="19540"
      > </a
      ><a name="19541" href="2016-10-25-linear-types-for-erlang-otp-1.html#19541" class="Bound"
      >X</a
      ><a name="19542"
      > </a
      ><a name="19543" href="2016-10-25-linear-types-for-erlang-otp-1.html#2533" class="InductiveConstructor"
      >]</a
      ><a name="19544"
      > </a
      ><a name="19545" href="2016-10-25-linear-types-for-erlang-otp-1.html#4766" class="Function"
      >&amp;[</a
      ><a name="19547"
      > </a
      ><a name="19548" href="2016-10-25-linear-types-for-erlang-otp-1.html#19548" class="Bound"
      >i</a
      ><a name="19549"
      > </a
      ><a name="19550" href="2016-10-25-linear-types-for-erlang-otp-1.html#4766" class="Function"
      >]</a
      ><a name="19551"
      > </a
      ><a name="19552" class="Symbol"
      >(</a
      ><a name="19553" href="2016-10-25-linear-types-for-erlang-otp-1.html#19532" class="Bound"
      >A</a
      ><a name="19554"
      > </a
      ><a name="19555" href="2016-10-25-linear-types-for-erlang-otp-1.html#19548" class="Bound"
      >i</a
      ><a name="19556"
      > </a
      ><a name="19557" href="2016-10-25-linear-types-for-erlang-otp-1.html#3768" class="Function Operator"
      >&#8888;</a
      ><a name="19558"
      > </a
      ><a name="19559" href="2016-10-25-linear-types-for-erlang-otp-1.html#19534" class="Bound"
      >R</a
      ><a name="19560"
      > </a
      ><a name="19561" href="2016-10-25-linear-types-for-erlang-otp-1.html#19548" class="Bound"
      >i</a
      ><a name="19562"
      > </a
      ><a name="19563" href="2016-10-25-linear-types-for-erlang-otp-1.html#2477" class="InductiveConstructor Operator"
      >&#8855;</a
      ><a name="19564"
      > </a
      ><a name="19565" href="2016-10-25-linear-types-for-erlang-otp-1.html#2794" class="InductiveConstructor Operator"
      >+</a
      ><a name="19566"
      > </a
      ><a name="19567" href="2016-10-25-linear-types-for-erlang-otp-1.html#19541" class="Bound"
      >X</a
      ><a name="19568" class="Symbol"
      >)</a
      >
</pre><!--{% endraw %}-->

We can check this by showing that the server type for the
`name_server` derived from `Server` corresponds to the type that we
wrote down in our CP implementation. And indeed it does.

<!--{% raw %}--><pre class="Agda">
<a name="19779" href="2016-10-25-linear-types-for-erlang-otp-1.html#19779" class="Function"
      >NameServer</a
      ><a name="19789"
      > </a
      ><a name="19790" class="Symbol"
      >=</a
      ><a name="19791"
      > </a
      ><a name="19792" href="2016-10-25-linear-types-for-erlang-otp-1.html#19476" class="Function"
      >Server</a
      ><a name="19798"
      > </a
      ><a name="19799" href="2016-10-25-linear-types-for-erlang-otp-1.html#14790" class="Function"
      >A</a
      ><a name="19800"
      > </a
      ><a name="19801" href="2016-10-25-linear-types-for-erlang-otp-1.html#14860" class="Function"
      >R</a
      ><a name="19802"
      >
</a
      ><a name="19803" class="Comment"
      >--&gt;</a
      ><a name="19806"
      >
</a
      ><a name="19807" href="2016-10-25-linear-types-for-erlang-otp-1.html#19807" class="Function Operator"
      >test_NameServer</a
      ><a name="19822"
      > </a
      ><a name="19823" class="Symbol"
      >:</a
      ><a name="19824"
      > </a
      ><a name="19825" href="2016-10-25-linear-types-for-erlang-otp-1.html#19779" class="Function"
      >NameServer</a
      ><a name="19835"
      > </a
      ><a name="19836" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="19837"
      > </a
      ><a name="19838" href="2016-10-25-linear-types-for-erlang-otp-1.html#2533" class="InductiveConstructor"
      >&#957;[</a
      ><a name="19840"
      > </a
      ><a name="19841" href="2016-10-25-linear-types-for-erlang-otp-1.html#19841" class="Bound"
      >X</a
      ><a name="19842"
      > </a
      ><a name="19843" href="2016-10-25-linear-types-for-erlang-otp-1.html#2533" class="InductiveConstructor"
      >]</a
      ><a name="19844"
      > </a
      ><a name="19845" class="Symbol"
      >(</a
      ><a name="19846"
      >
  </a
      ><a name="19849" class="Comment"
      >{- add     -}</a
      ><a name="19862"
      > </a
      ><a name="19863" class="Symbol"
      >(</a
      ><a name="19864" href="2016-10-25-linear-types-for-erlang-otp-1.html#12933" class="Function"
      >Name</a
      ><a name="19868"
      > </a
      ><a name="19869" href="2016-10-25-linear-types-for-erlang-otp-1.html#2477" class="InductiveConstructor Operator"
      >&#8855;</a
      ><a name="19870"
      > </a
      ><a name="19871" href="2016-10-25-linear-types-for-erlang-otp-1.html#2504" class="InductiveConstructor Operator"
      >&#161;</a
      ><a name="19872"
      > </a
      ><a name="19873" href="2016-10-25-linear-types-for-erlang-otp-1.html#12949" class="Function"
      >Place</a
      ><a name="19878"
      > </a
      ><a name="19879" href="2016-10-25-linear-types-for-erlang-otp-1.html#3768" class="Function Operator"
      >&#8888;</a
      ><a name="19880"
      > </a
      ><a name="19881" href="2016-10-25-linear-types-for-erlang-otp-1.html#2429" class="InductiveConstructor"
      >&#120793;</a
      ><a name="19882"
      >             </a
      ><a name="19895" href="2016-10-25-linear-types-for-erlang-otp-1.html#2477" class="InductiveConstructor Operator"
      >&#8855;</a
      ><a name="19896"
      > </a
      ><a name="19897" href="2016-10-25-linear-types-for-erlang-otp-1.html#2794" class="InductiveConstructor Operator"
      >+</a
      ><a name="19898"
      > </a
      ><a name="19899" href="2016-10-25-linear-types-for-erlang-otp-1.html#19841" class="Bound"
      >X</a
      ><a name="19900"
      > </a
      ><a name="19901" class="Symbol"
      >)</a
      ><a name="19902"
      > </a
      ><a name="19903" href="2016-10-25-linear-types-for-erlang-otp-1.html#2442" class="InductiveConstructor Operator"
      >&amp;</a
      ><a name="19904"
      >
  </a
      ><a name="19907" class="Comment"
      >{- whereis -}</a
      ><a name="19920"
      > </a
      ><a name="19921" class="Symbol"
      >(</a
      ><a name="19922" href="2016-10-25-linear-types-for-erlang-otp-1.html#12933" class="Function"
      >Name</a
      ><a name="19926"
      >           </a
      ><a name="19937" href="2016-10-25-linear-types-for-erlang-otp-1.html#3768" class="Function Operator"
      >&#8888;</a
      ><a name="19938"
      > </a
      ><a name="19939" href="2016-10-25-linear-types-for-erlang-otp-1.html#2504" class="InductiveConstructor Operator"
      >&#161;</a
      ><a name="19940"
      > </a
      ><a name="19941" href="2016-10-25-linear-types-for-erlang-otp-1.html#12897" class="Function"
      >Maybe</a
      ><a name="19946"
      > </a
      ><a name="19947" href="2016-10-25-linear-types-for-erlang-otp-1.html#12949" class="Function"
      >Place</a
      ><a name="19952"
      > </a
      ><a name="19953" href="2016-10-25-linear-types-for-erlang-otp-1.html#2477" class="InductiveConstructor Operator"
      >&#8855;</a
      ><a name="19954"
      > </a
      ><a name="19955" href="2016-10-25-linear-types-for-erlang-otp-1.html#2794" class="InductiveConstructor Operator"
      >+</a
      ><a name="19956"
      > </a
      ><a name="19957" href="2016-10-25-linear-types-for-erlang-otp-1.html#19841" class="Bound"
      >X</a
      ><a name="19958" class="Symbol"
      >))</a
      ><a name="19960"
      >
</a
      ><a name="19961" href="2016-10-25-linear-types-for-erlang-otp-1.html#19807" class="Function Operator"
      >test_NameServer</a
      ><a name="19976"
      > </a
      ><a name="19977" class="Symbol"
      >=</a
      ><a name="19978"
      > </a
      ><a name="19979" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      >
</pre><!--{% endraw %}-->

This makes the type of `loop` fairly easy to define: it's a function
from a module to a server, where the both respect the same names, and
their argument and response types vary with the name in the same way.

<!--{% raw %}--><pre class="Agda">
<a name="20219" href="2016-10-25-linear-types-for-erlang-otp-1.html#20219" class="Function"
      >Loop</a
      ><a name="20223"
      > </a
      ><a name="20224" class="Symbol"
      >:</a
      ><a name="20225"
      > </a
      ><a name="20226" class="Symbol"
      >&#8704;</a
      ><a name="20227"
      > </a
      ><a name="20228" class="Symbol"
      >{</a
      ><a name="20229" href="2016-10-25-linear-types-for-erlang-otp-1.html#20229" class="Bound"
      >n</a
      ><a name="20230" class="Symbol"
      >}</a
      ><a name="20231"
      > </a
      ><a name="20232" class="Symbol"
      >(</a
      ><a name="20233" href="2016-10-25-linear-types-for-erlang-otp-1.html#20233" class="Bound"
      >A</a
      ><a name="20234"
      > </a
      ><a name="20235" href="2016-10-25-linear-types-for-erlang-otp-1.html#20235" class="Bound"
      >R</a
      ><a name="20236"
      > </a
      ><a name="20237" class="Symbol"
      >:</a
      ><a name="20238"
      > </a
      ><a name="20239" href="https://agda.github.io/agda-stdlib/Data.Fin.html#842" class="Datatype"
      >Fin</a
      ><a name="20242"
      > </a
      ><a name="20243" class="Symbol"
      >(</a
      ><a name="20244" class="Number"
      >2</a
      ><a name="20245"
      > </a
      ><a name="20246" href="Agda.Builtin.Nat.html#202" class="Primitive Operator"
      >+</a
      ><a name="20247"
      > </a
      ><a name="20248" href="2016-10-25-linear-types-for-erlang-otp-1.html#20229" class="Bound"
      >n</a
      ><a name="20249" class="Symbol"
      >)</a
      ><a name="20250"
      > </a
      ><a name="20251" class="Symbol"
      >&#8594;</a
      ><a name="20252"
      > </a
      ><a name="20253" href="2016-10-25-linear-types-for-erlang-otp-1.html#2361" class="Datatype"
      >Type</a
      ><a name="20257" class="Symbol"
      >)</a
      ><a name="20258"
      > </a
      ><a name="20259" class="Symbol"
      >(</a
      ><a name="20260" href="2016-10-25-linear-types-for-erlang-otp-1.html#20260" class="Bound"
      >S</a
      ><a name="20261"
      > </a
      ><a name="20262" class="Symbol"
      >:</a
      ><a name="20263"
      > </a
      ><a name="20264" href="2016-10-25-linear-types-for-erlang-otp-1.html#2361" class="Datatype"
      >Type</a
      ><a name="20268" class="Symbol"
      >)</a
      ><a name="20269"
      > </a
      ><a name="20270" class="Symbol"
      >&#8594;</a
      ><a name="20271"
      > </a
      ><a name="20272" href="2016-10-25-linear-types-for-erlang-otp-1.html#2361" class="Datatype"
      >Type</a
      ><a name="20276"
      >
</a
      ><a name="20277" href="2016-10-25-linear-types-for-erlang-otp-1.html#20219" class="Function"
      >Loop</a
      ><a name="20281"
      > </a
      ><a name="20282" href="2016-10-25-linear-types-for-erlang-otp-1.html#20282" class="Bound"
      >A</a
      ><a name="20283"
      > </a
      ><a name="20284" href="2016-10-25-linear-types-for-erlang-otp-1.html#20284" class="Bound"
      >R</a
      ><a name="20285"
      > </a
      ><a name="20286" href="2016-10-25-linear-types-for-erlang-otp-1.html#20286" class="Bound"
      >S</a
      ><a name="20287"
      > </a
      ><a name="20288" class="Symbol"
      >=</a
      ><a name="20289"
      > </a
      ><a name="20290" href="2016-10-25-linear-types-for-erlang-otp-1.html#14131" class="Function"
      >Module</a
      ><a name="20296"
      > </a
      ><a name="20297" href="2016-10-25-linear-types-for-erlang-otp-1.html#20282" class="Bound"
      >A</a
      ><a name="20298"
      > </a
      ><a name="20299" href="2016-10-25-linear-types-for-erlang-otp-1.html#20284" class="Bound"
      >R</a
      ><a name="20300"
      > </a
      ><a name="20301" href="2016-10-25-linear-types-for-erlang-otp-1.html#20286" class="Bound"
      >S</a
      ><a name="20302"
      > </a
      ><a name="20303" href="2016-10-25-linear-types-for-erlang-otp-1.html#3768" class="Function Operator"
      >&#8888;</a
      ><a name="20304"
      > </a
      ><a name="20305" href="2016-10-25-linear-types-for-erlang-otp-1.html#19476" class="Function"
      >Server</a
      ><a name="20311"
      > </a
      ><a name="20312" href="2016-10-25-linear-types-for-erlang-otp-1.html#20282" class="Bound"
      >A</a
      ><a name="20313"
      > </a
      ><a name="20314" href="2016-10-25-linear-types-for-erlang-otp-1.html#20284" class="Bound"
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
