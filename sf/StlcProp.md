---
title         : "StlcProp: Properties of STLC"
layout        : default
hide-implicit : false
extra-script  : agda-extra-script.html
extra-style   : agda-extra-style.html
permalink     : "/sf/StlcProp.html"
---

<pre class="Agda">{% raw %}
<a name="229" class="Keyword"
      >open</a
      ><a name="233"
      > </a
      ><a name="234" class="Keyword"
      >import</a
      ><a name="240"
      > </a
      ><a name="241" href="https://agda.github.io/agda-stdlib/Function.html#1" class="Module"
      >Function</a
      ><a name="249"
      > </a
      ><a name="250" class="Keyword"
      >using</a
      ><a name="255"
      > </a
      ><a name="256" class="Symbol"
      >(</a
      ><a name="257" href="https://agda.github.io/agda-stdlib/Function.html#713" class="Function Operator"
      >_&#8728;_</a
      ><a name="260" class="Symbol"
      >)</a
      ><a name="261"
      >
</a
      ><a name="262" class="Keyword"
      >open</a
      ><a name="266"
      > </a
      ><a name="267" class="Keyword"
      >import</a
      ><a name="273"
      > </a
      ><a name="274" href="https://agda.github.io/agda-stdlib/Data.Empty.html#1" class="Module"
      >Data.Empty</a
      ><a name="284"
      > </a
      ><a name="285" class="Keyword"
      >using</a
      ><a name="290"
      > </a
      ><a name="291" class="Symbol"
      >(</a
      ><a name="292" href="https://agda.github.io/agda-stdlib/Data.Empty.html#243" class="Datatype"
      >&#8869;</a
      ><a name="293" class="Symbol"
      >;</a
      ><a name="294"
      > </a
      ><a name="295" href="https://agda.github.io/agda-stdlib/Data.Empty.html#348" class="Function"
      >&#8869;-elim</a
      ><a name="301" class="Symbol"
      >)</a
      ><a name="302"
      >
</a
      ><a name="303" class="Keyword"
      >open</a
      ><a name="307"
      > </a
      ><a name="308" class="Keyword"
      >import</a
      ><a name="314"
      > </a
      ><a name="315" href="https://agda.github.io/agda-stdlib/Data.Maybe.html#1" class="Module"
      >Data.Maybe</a
      ><a name="325"
      > </a
      ><a name="326" class="Keyword"
      >using</a
      ><a name="331"
      > </a
      ><a name="332" class="Symbol"
      >(</a
      ><a name="333" href="https://agda.github.io/agda-stdlib/Data.Maybe.Base.html#335" class="Datatype"
      >Maybe</a
      ><a name="338" class="Symbol"
      >;</a
      ><a name="339"
      > </a
      ><a name="340" href="https://agda.github.io/agda-stdlib/Data.Maybe.html#1527" class="InductiveConstructor"
      >just</a
      ><a name="344" class="Symbol"
      >;</a
      ><a name="345"
      > </a
      ><a name="346" href="https://agda.github.io/agda-stdlib/Data.Maybe.html#1588" class="InductiveConstructor"
      >nothing</a
      ><a name="353" class="Symbol"
      >)</a
      ><a name="354"
      >
</a
      ><a name="355" class="Keyword"
      >open</a
      ><a name="359"
      > </a
      ><a name="360" class="Keyword"
      >import</a
      ><a name="366"
      > </a
      ><a name="367" href="https://agda.github.io/agda-stdlib/Data.Product.html#1" class="Module"
      >Data.Product</a
      ><a name="379"
      > </a
      ><a name="380" class="Keyword"
      >using</a
      ><a name="385"
      > </a
      ><a name="386" class="Symbol"
      >(</a
      ><a name="387" href="https://agda.github.io/agda-stdlib/Data.Product.html#823" class="Function"
      >&#8707;</a
      ><a name="388" class="Symbol"
      >;</a
      ><a name="389"
      > </a
      ><a name="390" href="https://agda.github.io/agda-stdlib/Data.Product.html#949" class="Function"
      >&#8707;&#8322;</a
      ><a name="392" class="Symbol"
      >;</a
      ><a name="393"
      > </a
      ><a name="394" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >_,_</a
      ><a name="397" class="Symbol"
      >;</a
      ><a name="398"
      > </a
      ><a name="399" href="https://agda.github.io/agda-stdlib/Data.Product.html#1621" class="Function Operator"
      >,_</a
      ><a name="401" class="Symbol"
      >)</a
      ><a name="402"
      >
</a
      ><a name="403" class="Keyword"
      >open</a
      ><a name="407"
      > </a
      ><a name="408" class="Keyword"
      >import</a
      ><a name="414"
      > </a
      ><a name="415" href="https://agda.github.io/agda-stdlib/Data.Sum.html#1" class="Module"
      >Data.Sum</a
      ><a name="423"
      > </a
      ><a name="424" class="Keyword"
      >using</a
      ><a name="429"
      > </a
      ><a name="430" class="Symbol"
      >(</a
      ><a name="431" href="https://agda.github.io/agda-stdlib/Data.Sum.html#433" class="Datatype Operator"
      >_&#8846;_</a
      ><a name="434" class="Symbol"
      >;</a
      ><a name="435"
      > </a
      ><a name="436" href="https://agda.github.io/agda-stdlib/Data.Sum.html#489" class="InductiveConstructor"
      >inj&#8321;</a
      ><a name="440" class="Symbol"
      >;</a
      ><a name="441"
      > </a
      ><a name="442" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="446" class="Symbol"
      >)</a
      ><a name="447"
      >
</a
      ><a name="448" class="Keyword"
      >open</a
      ><a name="452"
      > </a
      ><a name="453" class="Keyword"
      >import</a
      ><a name="459"
      > </a
      ><a name="460" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#1" class="Module"
      >Relation.Nullary</a
      ><a name="476"
      > </a
      ><a name="477" class="Keyword"
      >using</a
      ><a name="482"
      > </a
      ><a name="483" class="Symbol"
      >(</a
      ><a name="484" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#414" class="Function Operator"
      >&#172;_</a
      ><a name="486" class="Symbol"
      >;</a
      ><a name="487"
      > </a
      ><a name="488" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#484" class="Datatype"
      >Dec</a
      ><a name="491" class="Symbol"
      >;</a
      ><a name="492"
      > </a
      ><a name="493" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="496" class="Symbol"
      >;</a
      ><a name="497"
      > </a
      ><a name="498" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="500" class="Symbol"
      >)</a
      ><a name="501"
      >
</a
      ><a name="502" class="Keyword"
      >open</a
      ><a name="506"
      > </a
      ><a name="507" class="Keyword"
      >import</a
      ><a name="513"
      > </a
      ><a name="514" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.html#1" class="Module"
      >Relation.Binary.PropositionalEquality</a
      ><a name="551"
      > </a
      ><a name="552" class="Keyword"
      >using</a
      ><a name="557"
      > </a
      ><a name="558" class="Symbol"
      >(</a
      ><a name="559" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >_&#8801;_</a
      ><a name="562" class="Symbol"
      >;</a
      ><a name="563"
      > </a
      ><a name="564" href="https://agda.github.io/agda-stdlib/Relation.Binary.Core.html#4493" class="Function Operator"
      >_&#8802;_</a
      ><a name="567" class="Symbol"
      >;</a
      ><a name="568"
      > </a
      ><a name="569" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="573" class="Symbol"
      >)</a
      ><a name="574"
      >
</a
      ><a name="575" class="Keyword"
      >open</a
      ><a name="579"
      > </a
      ><a name="580" class="Keyword"
      >import</a
      ><a name="586"
      > </a
      ><a name="587" href="Stlc.html#1" class="Module"
      >Stlc</a
      >
{% endraw %}</pre>

<pre class="Agda">{% raw %}
<a name="617" class="Keyword"
      >module</a
      ><a name="623"
      > </a
      ><a name="624" href="StlcProp.html#1" class="Module"
      >StlcProp</a
      ><a name="632"
      > </a
      ><a name="633" class="Keyword"
      >where</a
      >
{% endraw %}</pre>

#  Properties of STLC

In this chapter, we develop the fundamental theory of the Simply
Typed Lambda Calculus -- in particular, the type safety
theorem.


## Canonical Forms

As we saw for the simple calculus in the [Stlc](Stlc.html) chapter, the
first step in establishing basic properties of reduction and types
is to identify the possible _canonical forms_ (i.e., well-typed
closed values) belonging to each type.  For $$bool$$, these are the boolean
values $$true$$ and $$false$$.  For arrow types, the canonical forms
are lambda-abstractions.

<pre class="Agda">{% raw %}
<a name="1213" href="StlcProp.html#1213" class="Function"
      >CanonicalForms</a
      ><a name="1227"
      > </a
      ><a name="1228" class="Symbol"
      >:</a
      ><a name="1229"
      > </a
      ><a name="1230" href="Stlc.html#6114" class="Datatype"
      >Term</a
      ><a name="1234"
      > </a
      ><a name="1235" class="Symbol"
      >&#8594;</a
      ><a name="1236"
      > </a
      ><a name="1237" href="Stlc.html#5611" class="Datatype"
      >Type</a
      ><a name="1241"
      > </a
      ><a name="1242" class="Symbol"
      >&#8594;</a
      ><a name="1243"
      > </a
      ><a name="1244" class="PrimitiveType"
      >Set</a
      ><a name="1247"
      >
</a
      ><a name="1248" href="StlcProp.html#1213" class="Function"
      >CanonicalForms</a
      ><a name="1262"
      > </a
      ><a name="1263" href="StlcProp.html#1263" class="Bound"
      >t</a
      ><a name="1264"
      > </a
      ><a name="1265" href="Stlc.html#5630" class="InductiveConstructor"
      >bool</a
      ><a name="1269"
      >    </a
      ><a name="1273" class="Symbol"
      >=</a
      ><a name="1274"
      > </a
      ><a name="1275" href="StlcProp.html#1263" class="Bound"
      >t</a
      ><a name="1276"
      > </a
      ><a name="1277" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="1278"
      > </a
      ><a name="1279" href="Stlc.html#6216" class="InductiveConstructor"
      >true</a
      ><a name="1283"
      > </a
      ><a name="1284" href="https://agda.github.io/agda-stdlib/Data.Sum.html#433" class="Datatype Operator"
      >&#8846;</a
      ><a name="1285"
      > </a
      ><a name="1286" href="StlcProp.html#1263" class="Bound"
      >t</a
      ><a name="1287"
      > </a
      ><a name="1288" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="1289"
      > </a
      ><a name="1290" href="Stlc.html#6231" class="InductiveConstructor"
      >false</a
      ><a name="1295"
      >
</a
      ><a name="1296" href="StlcProp.html#1213" class="Function"
      >CanonicalForms</a
      ><a name="1310"
      > </a
      ><a name="1311" href="StlcProp.html#1311" class="Bound"
      >t</a
      ><a name="1312"
      > </a
      ><a name="1313" class="Symbol"
      >(</a
      ><a name="1314" href="StlcProp.html#1314" class="Bound"
      >A</a
      ><a name="1315"
      > </a
      ><a name="1316" href="Stlc.html#5644" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="1317"
      > </a
      ><a name="1318" href="StlcProp.html#1318" class="Bound"
      >B</a
      ><a name="1319" class="Symbol"
      >)</a
      ><a name="1320"
      > </a
      ><a name="1321" class="Symbol"
      >=</a
      ><a name="1322"
      > </a
      ><a name="1323" href="https://agda.github.io/agda-stdlib/Data.Product.html#949" class="Function"
      >&#8707;&#8322;</a
      ><a name="1325"
      > </a
      ><a name="1326" class="Symbol"
      >&#955;</a
      ><a name="1327"
      > </a
      ><a name="1328" href="StlcProp.html#1328" class="Bound"
      >x</a
      ><a name="1329"
      > </a
      ><a name="1330" href="StlcProp.html#1330" class="Bound"
      >t&#8242;</a
      ><a name="1332"
      > </a
      ><a name="1333" class="Symbol"
      >&#8594;</a
      ><a name="1334"
      > </a
      ><a name="1335" href="StlcProp.html#1311" class="Bound"
      >t</a
      ><a name="1336"
      > </a
      ><a name="1337" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="1338"
      > </a
      ><a name="1339" href="Stlc.html#6182" class="InductiveConstructor"
      >abs</a
      ><a name="1342"
      > </a
      ><a name="1343" href="StlcProp.html#1328" class="Bound"
      >x</a
      ><a name="1344"
      > </a
      ><a name="1345" href="StlcProp.html#1314" class="Bound"
      >A</a
      ><a name="1346"
      > </a
      ><a name="1347" href="StlcProp.html#1330" class="Bound"
      >t&#8242;</a
      ><a name="1349"
      >

</a
      ><a name="1351" href="StlcProp.html#1351" class="Function"
      >canonicalForms</a
      ><a name="1365"
      > </a
      ><a name="1366" class="Symbol"
      >:</a
      ><a name="1367"
      > </a
      ><a name="1368" class="Symbol"
      >&#8704;</a
      ><a name="1369"
      > </a
      ><a name="1370" class="Symbol"
      >{</a
      ><a name="1371" href="StlcProp.html#1371" class="Bound"
      >t</a
      ><a name="1372"
      > </a
      ><a name="1373" href="StlcProp.html#1373" class="Bound"
      >A</a
      ><a name="1374" class="Symbol"
      >}</a
      ><a name="1375"
      > </a
      ><a name="1376" class="Symbol"
      >&#8594;</a
      ><a name="1377"
      > </a
      ><a name="1378" href="Stlc.html#18658" class="Function"
      >&#8709;</a
      ><a name="1379"
      > </a
      ><a name="1380" href="Stlc.html#19629" class="Datatype Operator"
      >&#8866;</a
      ><a name="1381"
      > </a
      ><a name="1382" href="StlcProp.html#1371" class="Bound"
      >t</a
      ><a name="1383"
      > </a
      ><a name="1384" href="Stlc.html#19629" class="Datatype Operator"
      >&#8758;</a
      ><a name="1385"
      > </a
      ><a name="1386" href="StlcProp.html#1373" class="Bound"
      >A</a
      ><a name="1387"
      > </a
      ><a name="1388" class="Symbol"
      >&#8594;</a
      ><a name="1389"
      > </a
      ><a name="1390" href="Stlc.html#9439" class="Datatype"
      >Value</a
      ><a name="1395"
      > </a
      ><a name="1396" href="StlcProp.html#1371" class="Bound"
      >t</a
      ><a name="1397"
      > </a
      ><a name="1398" class="Symbol"
      >&#8594;</a
      ><a name="1399"
      > </a
      ><a name="1400" href="StlcProp.html#1213" class="Function"
      >CanonicalForms</a
      ><a name="1414"
      > </a
      ><a name="1415" href="StlcProp.html#1371" class="Bound"
      >t</a
      ><a name="1416"
      > </a
      ><a name="1417" href="StlcProp.html#1373" class="Bound"
      >A</a
      ><a name="1418"
      >
</a
      ><a name="1419" href="StlcProp.html#1351" class="Function"
      >canonicalForms</a
      ><a name="1433"
      > </a
      ><a name="1434" class="Symbol"
      >(</a
      ><a name="1435" href="Stlc.html#19766" class="InductiveConstructor"
      >abs</a
      ><a name="1438"
      > </a
      ><a name="1439" href="StlcProp.html#1439" class="Bound"
      >t&#8242;</a
      ><a name="1441" class="Symbol"
      >)</a
      ><a name="1442"
      > </a
      ><a name="1443" href="Stlc.html#9466" class="InductiveConstructor"
      >abs</a
      ><a name="1446"
      >   </a
      ><a name="1449" class="Symbol"
      >=</a
      ><a name="1450"
      > </a
      ><a name="1451" class="Symbol"
      >_</a
      ><a name="1452"
      > </a
      ><a name="1453" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="1454"
      > </a
      ><a name="1455" class="Symbol"
      >_</a
      ><a name="1456"
      > </a
      ><a name="1457" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="1458"
      > </a
      ><a name="1459" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="1463"
      >
</a
      ><a name="1464" href="StlcProp.html#1351" class="Function"
      >canonicalForms</a
      ><a name="1478"
      > </a
      ><a name="1479" href="Stlc.html#20016" class="InductiveConstructor"
      >true</a
      ><a name="1483"
      >     </a
      ><a name="1488" href="Stlc.html#9514" class="InductiveConstructor"
      >true</a
      ><a name="1492"
      >  </a
      ><a name="1494" class="Symbol"
      >=</a
      ><a name="1495"
      > </a
      ><a name="1496" href="https://agda.github.io/agda-stdlib/Data.Sum.html#489" class="InductiveConstructor"
      >inj&#8321;</a
      ><a name="1500"
      > </a
      ><a name="1501" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="1505"
      >
</a
      ><a name="1506" href="StlcProp.html#1351" class="Function"
      >canonicalForms</a
      ><a name="1520"
      > </a
      ><a name="1521" href="Stlc.html#20075" class="InductiveConstructor"
      >false</a
      ><a name="1526"
      >    </a
      ><a name="1530" href="Stlc.html#9535" class="InductiveConstructor"
      >false</a
      ><a name="1535"
      > </a
      ><a name="1536" class="Symbol"
      >=</a
      ><a name="1537"
      > </a
      ><a name="1538" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="1542"
      > </a
      ><a name="1543" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      >
{% endraw %}</pre>

## Progress

As before, the _progress_ theorem tells us that closed, well-typed
terms are not stuck: either a well-typed term is a value, or it
can take a reduction step.  The proof is a relatively
straightforward extension of the progress proof we saw in the
[Stlc](Stlc.html) chapter.  We'll give the proof in English first,
then the formal version.

<pre class="Agda">{% raw %}
<a name="1926" href="StlcProp.html#1926" class="Function"
      >progress</a
      ><a name="1934"
      > </a
      ><a name="1935" class="Symbol"
      >:</a
      ><a name="1936"
      > </a
      ><a name="1937" class="Symbol"
      >&#8704;</a
      ><a name="1938"
      > </a
      ><a name="1939" class="Symbol"
      >{</a
      ><a name="1940" href="StlcProp.html#1940" class="Bound"
      >t</a
      ><a name="1941"
      > </a
      ><a name="1942" href="StlcProp.html#1942" class="Bound"
      >A</a
      ><a name="1943" class="Symbol"
      >}</a
      ><a name="1944"
      > </a
      ><a name="1945" class="Symbol"
      >&#8594;</a
      ><a name="1946"
      > </a
      ><a name="1947" href="Stlc.html#18658" class="Function"
      >&#8709;</a
      ><a name="1948"
      > </a
      ><a name="1949" href="Stlc.html#19629" class="Datatype Operator"
      >&#8866;</a
      ><a name="1950"
      > </a
      ><a name="1951" href="StlcProp.html#1940" class="Bound"
      >t</a
      ><a name="1952"
      > </a
      ><a name="1953" href="Stlc.html#19629" class="Datatype Operator"
      >&#8758;</a
      ><a name="1954"
      > </a
      ><a name="1955" href="StlcProp.html#1942" class="Bound"
      >A</a
      ><a name="1956"
      > </a
      ><a name="1957" class="Symbol"
      >&#8594;</a
      ><a name="1958"
      > </a
      ><a name="1959" href="Stlc.html#9439" class="Datatype"
      >Value</a
      ><a name="1964"
      > </a
      ><a name="1965" href="StlcProp.html#1940" class="Bound"
      >t</a
      ><a name="1966"
      > </a
      ><a name="1967" href="https://agda.github.io/agda-stdlib/Data.Sum.html#433" class="Datatype Operator"
      >&#8846;</a
      ><a name="1968"
      > </a
      ><a name="1969" href="https://agda.github.io/agda-stdlib/Data.Product.html#823" class="Function"
      >&#8707;</a
      ><a name="1970"
      > </a
      ><a name="1971" class="Symbol"
      >&#955;</a
      ><a name="1972"
      > </a
      ><a name="1973" href="StlcProp.html#1973" class="Bound"
      >t&#8242;</a
      ><a name="1975"
      > </a
      ><a name="1976" class="Symbol"
      >&#8594;</a
      ><a name="1977"
      > </a
      ><a name="1978" href="StlcProp.html#1940" class="Bound"
      >t</a
      ><a name="1979"
      > </a
      ><a name="1980" href="Stlc.html#15576" class="Datatype Operator"
      >==&gt;</a
      ><a name="1983"
      > </a
      ><a name="1984" href="StlcProp.html#1973" class="Bound"
      >t&#8242;</a
      >
{% endraw %}</pre>

_Proof_: By induction on the derivation of $$\vdash t : A$$.

  - The last rule of the derivation cannot be `var`,
    since a variable is never well typed in an empty context.

  - The `true`, `false`, and `abs` cases are trivial, since in
    each of these cases we can see by inspecting the rule that $$t$$
    is a value.

  - If the last rule of the derivation is `app`, then $$t$$ has the
    form $$t_1\;t_2$$ for som e$$t_1$$ and $$t_2$$, where we know that
    $$t_1$$ and $$t_2$$ are also well typed in the empty context; in particular,
    there exists a type $$B$$ such that $$\vdash t_1 : A\to T$$ and
    $$\vdash t_2 : B$$.  By the induction hypothesis, either $$t_1$$ is a
    value or it can take a reduction step.

  - If $$t_1$$ is a value, then consider $$t_2$$, which by the other
    induction hypothesis must also either be a value or take a step.

    - Suppose $$t_2$$ is a value.  Since $$t_1$$ is a value with an
      arrow type, it must be a lambda abstraction; hence $$t_1\;t_2$$
      can take a step by `red`.

    - Otherwise, $$t_2$$ can take a step, and hence so can $$t_1\;t_2$$
      by `app2`.

  - If $$t_1$$ can take a step, then so can $$t_1 t_2$$ by `app1`.

  - If the last rule of the derivation is `if`, then $$t = \text{if }t_1
    \text{ then }t_2\text{ else }t_3$$, where $$t_1$$ has type $$bool$$.  By
    the IH, $$t_1$$ either is a value or takes a step.

  - If $$t_1$$ is a value, then since it has type $$bool$$ it must be
    either $$true$$ or $$false$$.  If it is $$true$$, then $$t$$ steps
    to $$t_2$$; otherwise it steps to $$t_3$$.

  - Otherwise, $$t_1$$ takes a step, and therefore so does $$t$$ (by `if`).

<pre class="Agda">{% raw %}
<a name="3685" href="StlcProp.html#1926" class="Function"
      >progress</a
      ><a name="3693"
      > </a
      ><a name="3694" class="Symbol"
      >(</a
      ><a name="3695" href="Stlc.html#19673" class="InductiveConstructor"
      >var</a
      ><a name="3698"
      > </a
      ><a name="3699" href="StlcProp.html#3699" class="Bound"
      >x</a
      ><a name="3700"
      > </a
      ><a name="3701" class="Symbol"
      >())</a
      ><a name="3704"
      >
</a
      ><a name="3705" href="StlcProp.html#1926" class="Function"
      >progress</a
      ><a name="3713"
      > </a
      ><a name="3714" href="Stlc.html#20016" class="InductiveConstructor"
      >true</a
      ><a name="3718"
      >      </a
      ><a name="3724" class="Symbol"
      >=</a
      ><a name="3725"
      > </a
      ><a name="3726" href="https://agda.github.io/agda-stdlib/Data.Sum.html#489" class="InductiveConstructor"
      >inj&#8321;</a
      ><a name="3730"
      > </a
      ><a name="3731" href="Stlc.html#9514" class="InductiveConstructor"
      >true</a
      ><a name="3735"
      >
</a
      ><a name="3736" href="StlcProp.html#1926" class="Function"
      >progress</a
      ><a name="3744"
      > </a
      ><a name="3745" href="Stlc.html#20075" class="InductiveConstructor"
      >false</a
      ><a name="3750"
      >     </a
      ><a name="3755" class="Symbol"
      >=</a
      ><a name="3756"
      > </a
      ><a name="3757" href="https://agda.github.io/agda-stdlib/Data.Sum.html#489" class="InductiveConstructor"
      >inj&#8321;</a
      ><a name="3761"
      > </a
      ><a name="3762" href="Stlc.html#9535" class="InductiveConstructor"
      >false</a
      ><a name="3767"
      >
</a
      ><a name="3768" href="StlcProp.html#1926" class="Function"
      >progress</a
      ><a name="3776"
      > </a
      ><a name="3777" class="Symbol"
      >(</a
      ><a name="3778" href="Stlc.html#19766" class="InductiveConstructor"
      >abs</a
      ><a name="3781"
      > </a
      ><a name="3782" href="StlcProp.html#3782" class="Bound"
      >t&#8758;A</a
      ><a name="3785" class="Symbol"
      >)</a
      ><a name="3786"
      > </a
      ><a name="3787" class="Symbol"
      >=</a
      ><a name="3788"
      > </a
      ><a name="3789" href="https://agda.github.io/agda-stdlib/Data.Sum.html#489" class="InductiveConstructor"
      >inj&#8321;</a
      ><a name="3793"
      > </a
      ><a name="3794" href="Stlc.html#9466" class="InductiveConstructor"
      >abs</a
      ><a name="3797"
      >
</a
      ><a name="3798" href="StlcProp.html#1926" class="Function"
      >progress</a
      ><a name="3806"
      > </a
      ><a name="3807" class="Symbol"
      >(</a
      ><a name="3808" href="Stlc.html#19882" class="InductiveConstructor"
      >app</a
      ><a name="3811"
      > </a
      ><a name="3812" href="StlcProp.html#3812" class="Bound"
      >t&#8321;&#8758;A&#8658;B</a
      ><a name="3818"
      > </a
      ><a name="3819" href="StlcProp.html#3819" class="Bound"
      >t&#8322;&#8758;B</a
      ><a name="3823" class="Symbol"
      >)</a
      ><a name="3824"
      >
    </a
      ><a name="3829" class="Keyword"
      >with</a
      ><a name="3833"
      > </a
      ><a name="3834" href="StlcProp.html#1926" class="Function"
      >progress</a
      ><a name="3842"
      > </a
      ><a name="3843" href="StlcProp.html#3812" class="Bound"
      >t&#8321;&#8758;A&#8658;B</a
      ><a name="3849"
      >
</a
      ><a name="3850" class="Symbol"
      >...</a
      ><a name="3853"
      > </a
      ><a name="3854" class="Symbol"
      >|</a
      ><a name="3855"
      > </a
      ><a name="3856" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="3860"
      > </a
      ><a name="3861" class="Symbol"
      >(_</a
      ><a name="3863"
      > </a
      ><a name="3864" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="3865"
      > </a
      ><a name="3866" href="StlcProp.html#3866" class="Bound"
      >t&#8321;&#8658;t&#8321;&#8242;</a
      ><a name="3872" class="Symbol"
      >)</a
      ><a name="3873"
      > </a
      ><a name="3874" class="Symbol"
      >=</a
      ><a name="3875"
      > </a
      ><a name="3876" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="3880"
      > </a
      ><a name="3881" class="Symbol"
      >(_</a
      ><a name="3883"
      > </a
      ><a name="3884" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="3885"
      > </a
      ><a name="3886" href="Stlc.html#15701" class="InductiveConstructor"
      >app1</a
      ><a name="3890"
      > </a
      ><a name="3891" href="StlcProp.html#3866" class="Bound"
      >t&#8321;&#8658;t&#8321;&#8242;</a
      ><a name="3897" class="Symbol"
      >)</a
      ><a name="3898"
      >
</a
      ><a name="3899" class="Symbol"
      >...</a
      ><a name="3902"
      > </a
      ><a name="3903" class="Symbol"
      >|</a
      ><a name="3904"
      > </a
      ><a name="3905" href="https://agda.github.io/agda-stdlib/Data.Sum.html#489" class="InductiveConstructor"
      >inj&#8321;</a
      ><a name="3909"
      > </a
      ><a name="3910" href="StlcProp.html#3910" class="Bound"
      >v&#8321;</a
      ><a name="3912"
      >
    </a
      ><a name="3917" class="Keyword"
      >with</a
      ><a name="3921"
      > </a
      ><a name="3922" href="StlcProp.html#1926" class="Function"
      >progress</a
      ><a name="3930"
      > </a
      ><a name="3931" href="StlcProp.html#3819" class="Bound"
      >t&#8322;&#8758;B</a
      ><a name="3935"
      >
</a
      ><a name="3936" class="Symbol"
      >...</a
      ><a name="3939"
      > </a
      ><a name="3940" class="Symbol"
      >|</a
      ><a name="3941"
      > </a
      ><a name="3942" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="3946"
      > </a
      ><a name="3947" class="Symbol"
      >(_</a
      ><a name="3949"
      > </a
      ><a name="3950" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="3951"
      > </a
      ><a name="3952" href="StlcProp.html#3952" class="Bound"
      >t&#8322;&#8658;t&#8322;&#8242;</a
      ><a name="3958" class="Symbol"
      >)</a
      ><a name="3959"
      > </a
      ><a name="3960" class="Symbol"
      >=</a
      ><a name="3961"
      > </a
      ><a name="3962" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="3966"
      > </a
      ><a name="3967" class="Symbol"
      >(_</a
      ><a name="3969"
      > </a
      ><a name="3970" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="3971"
      > </a
      ><a name="3972" href="Stlc.html#15778" class="InductiveConstructor"
      >app2</a
      ><a name="3976"
      > </a
      ><a name="3977" href="StlcProp.html#3910" class="Bound"
      >v&#8321;</a
      ><a name="3979"
      > </a
      ><a name="3980" href="StlcProp.html#3952" class="Bound"
      >t&#8322;&#8658;t&#8322;&#8242;</a
      ><a name="3986" class="Symbol"
      >)</a
      ><a name="3987"
      >
</a
      ><a name="3988" class="Symbol"
      >...</a
      ><a name="3991"
      > </a
      ><a name="3992" class="Symbol"
      >|</a
      ><a name="3993"
      > </a
      ><a name="3994" href="https://agda.github.io/agda-stdlib/Data.Sum.html#489" class="InductiveConstructor"
      >inj&#8321;</a
      ><a name="3998"
      > </a
      ><a name="3999" href="StlcProp.html#3999" class="Bound"
      >v&#8322;</a
      ><a name="4001"
      >
    </a
      ><a name="4006" class="Keyword"
      >with</a
      ><a name="4010"
      > </a
      ><a name="4011" href="StlcProp.html#1351" class="Function"
      >canonicalForms</a
      ><a name="4025"
      > </a
      ><a name="4026" href="StlcProp.html#3812" class="Bound"
      >t&#8321;&#8758;A&#8658;B</a
      ><a name="4032"
      > </a
      ><a name="4033" href="StlcProp.html#3910" class="Bound"
      >v&#8321;</a
      ><a name="4035"
      >
</a
      ><a name="4036" class="Symbol"
      >...</a
      ><a name="4039"
      > </a
      ><a name="4040" class="Symbol"
      >|</a
      ><a name="4041"
      > </a
      ><a name="4042" class="Symbol"
      >(_</a
      ><a name="4044"
      > </a
      ><a name="4045" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="4046"
      > </a
      ><a name="4047" class="Symbol"
      >_</a
      ><a name="4048"
      > </a
      ><a name="4049" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="4050"
      > </a
      ><a name="4051" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="4055" class="Symbol"
      >)</a
      ><a name="4056"
      > </a
      ><a name="4057" class="Symbol"
      >=</a
      ><a name="4058"
      > </a
      ><a name="4059" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="4063"
      > </a
      ><a name="4064" class="Symbol"
      >(_</a
      ><a name="4066"
      > </a
      ><a name="4067" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="4068"
      > </a
      ><a name="4069" href="Stlc.html#15610" class="InductiveConstructor"
      >red</a
      ><a name="4072"
      > </a
      ><a name="4073" href="StlcProp.html#3999" class="Bound"
      >v&#8322;</a
      ><a name="4075" class="Symbol"
      >)</a
      ><a name="4076"
      >
</a
      ><a name="4077" href="StlcProp.html#1926" class="Function"
      >progress</a
      ><a name="4085"
      > </a
      ><a name="4086" class="Symbol"
      >(</a
      ><a name="4087" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >if</a
      ><a name="4089"
      > </a
      ><a name="4090" href="StlcProp.html#4090" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="4097"
      > </a
      ><a name="4098" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >then</a
      ><a name="4102"
      > </a
      ><a name="4103" href="StlcProp.html#4103" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="4107"
      > </a
      ><a name="4108" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >else</a
      ><a name="4112"
      > </a
      ><a name="4113" href="StlcProp.html#4113" class="Bound"
      >t&#8323;&#8758;A</a
      ><a name="4117" class="Symbol"
      >)</a
      ><a name="4118"
      >
    </a
      ><a name="4123" class="Keyword"
      >with</a
      ><a name="4127"
      > </a
      ><a name="4128" href="StlcProp.html#1926" class="Function"
      >progress</a
      ><a name="4136"
      > </a
      ><a name="4137" href="StlcProp.html#4090" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="4144"
      >
</a
      ><a name="4145" class="Symbol"
      >...</a
      ><a name="4148"
      > </a
      ><a name="4149" class="Symbol"
      >|</a
      ><a name="4150"
      > </a
      ><a name="4151" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="4155"
      > </a
      ><a name="4156" class="Symbol"
      >(_</a
      ><a name="4158"
      > </a
      ><a name="4159" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="4160"
      > </a
      ><a name="4161" href="StlcProp.html#4161" class="Bound"
      >t&#8321;&#8658;t&#8321;&#8242;</a
      ><a name="4167" class="Symbol"
      >)</a
      ><a name="4168"
      > </a
      ><a name="4169" class="Symbol"
      >=</a
      ><a name="4170"
      > </a
      ><a name="4171" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="4175"
      > </a
      ><a name="4176" class="Symbol"
      >(_</a
      ><a name="4178"
      > </a
      ><a name="4179" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="4180"
      > </a
      ><a name="4181" href="Stlc.html#15875" class="InductiveConstructor"
      >if</a
      ><a name="4183"
      > </a
      ><a name="4184" href="StlcProp.html#4161" class="Bound"
      >t&#8321;&#8658;t&#8321;&#8242;</a
      ><a name="4190" class="Symbol"
      >)</a
      ><a name="4191"
      >
</a
      ><a name="4192" class="Symbol"
      >...</a
      ><a name="4195"
      > </a
      ><a name="4196" class="Symbol"
      >|</a
      ><a name="4197"
      > </a
      ><a name="4198" href="https://agda.github.io/agda-stdlib/Data.Sum.html#489" class="InductiveConstructor"
      >inj&#8321;</a
      ><a name="4202"
      > </a
      ><a name="4203" href="StlcProp.html#4203" class="Bound"
      >v&#8321;</a
      ><a name="4205"
      >
    </a
      ><a name="4210" class="Keyword"
      >with</a
      ><a name="4214"
      > </a
      ><a name="4215" href="StlcProp.html#1351" class="Function"
      >canonicalForms</a
      ><a name="4229"
      > </a
      ><a name="4230" href="StlcProp.html#4090" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="4237"
      > </a
      ><a name="4238" href="StlcProp.html#4203" class="Bound"
      >v&#8321;</a
      ><a name="4240"
      >
</a
      ><a name="4241" class="Symbol"
      >...</a
      ><a name="4244"
      > </a
      ><a name="4245" class="Symbol"
      >|</a
      ><a name="4246"
      > </a
      ><a name="4247" href="https://agda.github.io/agda-stdlib/Data.Sum.html#489" class="InductiveConstructor"
      >inj&#8321;</a
      ><a name="4251"
      > </a
      ><a name="4252" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="4256"
      > </a
      ><a name="4257" class="Symbol"
      >=</a
      ><a name="4258"
      > </a
      ><a name="4259" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="4263"
      > </a
      ><a name="4264" class="Symbol"
      >(_</a
      ><a name="4266"
      > </a
      ><a name="4267" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="4268"
      > </a
      ><a name="4269" href="Stlc.html#15976" class="InductiveConstructor"
      >iftrue</a
      ><a name="4275" class="Symbol"
      >)</a
      ><a name="4276"
      >
</a
      ><a name="4277" class="Symbol"
      >...</a
      ><a name="4280"
      > </a
      ><a name="4281" class="Symbol"
      >|</a
      ><a name="4282"
      > </a
      ><a name="4283" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="4287"
      > </a
      ><a name="4288" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="4292"
      > </a
      ><a name="4293" class="Symbol"
      >=</a
      ><a name="4294"
      > </a
      ><a name="4295" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="4299"
      > </a
      ><a name="4300" class="Symbol"
      >(_</a
      ><a name="4302"
      > </a
      ><a name="4303" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="4304"
      > </a
      ><a name="4305" href="Stlc.html#16036" class="InductiveConstructor"
      >iffalse</a
      ><a name="4312" class="Symbol"
      >)</a
      >
{% endraw %}</pre>

#### Exercise: 3 stars, optional (progress_from_term_ind)
Show that progress can also be proved by induction on terms
instead of induction on typing derivations.

<pre class="Agda">{% raw %}
<a name="4502" class="Keyword"
      >postulate</a
      ><a name="4511"
      >
  </a
      ><a name="4514" href="StlcProp.html#4514" class="Postulate"
      >progress&#8242;</a
      ><a name="4523"
      > </a
      ><a name="4524" class="Symbol"
      >:</a
      ><a name="4525"
      > </a
      ><a name="4526" class="Symbol"
      >&#8704;</a
      ><a name="4527"
      > </a
      ><a name="4528" class="Symbol"
      >{</a
      ><a name="4529" href="StlcProp.html#4529" class="Bound"
      >t</a
      ><a name="4530"
      > </a
      ><a name="4531" href="StlcProp.html#4531" class="Bound"
      >A</a
      ><a name="4532" class="Symbol"
      >}</a
      ><a name="4533"
      > </a
      ><a name="4534" class="Symbol"
      >&#8594;</a
      ><a name="4535"
      > </a
      ><a name="4536" href="Stlc.html#18658" class="Function"
      >&#8709;</a
      ><a name="4537"
      > </a
      ><a name="4538" href="Stlc.html#19629" class="Datatype Operator"
      >&#8866;</a
      ><a name="4539"
      > </a
      ><a name="4540" href="StlcProp.html#4529" class="Bound"
      >t</a
      ><a name="4541"
      > </a
      ><a name="4542" href="Stlc.html#19629" class="Datatype Operator"
      >&#8758;</a
      ><a name="4543"
      > </a
      ><a name="4544" href="StlcProp.html#4531" class="Bound"
      >A</a
      ><a name="4545"
      > </a
      ><a name="4546" class="Symbol"
      >&#8594;</a
      ><a name="4547"
      > </a
      ><a name="4548" href="Stlc.html#9439" class="Datatype"
      >Value</a
      ><a name="4553"
      > </a
      ><a name="4554" href="StlcProp.html#4529" class="Bound"
      >t</a
      ><a name="4555"
      > </a
      ><a name="4556" href="https://agda.github.io/agda-stdlib/Data.Sum.html#433" class="Datatype Operator"
      >&#8846;</a
      ><a name="4557"
      > </a
      ><a name="4558" href="https://agda.github.io/agda-stdlib/Data.Product.html#823" class="Function"
      >&#8707;</a
      ><a name="4559"
      > </a
      ><a name="4560" class="Symbol"
      >&#955;</a
      ><a name="4561"
      > </a
      ><a name="4562" href="StlcProp.html#4562" class="Bound"
      >t&#8242;</a
      ><a name="4564"
      > </a
      ><a name="4565" class="Symbol"
      >&#8594;</a
      ><a name="4566"
      > </a
      ><a name="4567" href="StlcProp.html#4529" class="Bound"
      >t</a
      ><a name="4568"
      > </a
      ><a name="4569" href="Stlc.html#15576" class="Datatype Operator"
      >==&gt;</a
      ><a name="4572"
      > </a
      ><a name="4573" href="StlcProp.html#4562" class="Bound"
      >t&#8242;</a
      >
{% endraw %}</pre>

## Preservation

The other half of the type soundness property is the preservation
of types during reduction.  For this, we need to develop some
technical machinery for reasoning about variables and
substitution.  Working from top to bottom (from the high-level
property we are actually interested in to the lowest-level
technical lemmas that are needed by various cases of the more
interesting proofs), the story goes like this:

  - The _preservation theorem_ is proved by induction on a typing
    derivation, pretty much as we did in the [Stlc](Stlc.html)
    chapter.  The one case that is significantly different is the
    one for the $$red$$ rule, whose definition uses the substitution
    operation.  To see that this step preserves typing, we need to
    know that the substitution itself does.  So we prove a...

  - _substitution lemma_, stating that substituting a (closed)
    term $$s$$ for a variable $$x$$ in a term $$t$$ preserves the type
    of $$t$$.  The proof goes by induction on the form of $$t$$ and
    requires looking at all the different cases in the definition
    of substitition.  This time, the tricky cases are the ones for
    variables and for function abstractions.  In both cases, we
    discover that we need to take a term $$s$$ that has been shown
    to be well-typed in some context $$\Gamma$$ and consider the same
    term $$s$$ in a slightly different context $$\Gamma'$$.  For this
    we prove a...

  - _context invariance_ lemma, showing that typing is preserved
    under "inessential changes" to the context $$\Gamma$$ -- in
    particular, changes that do not affect any of the free
    variables of the term.  And finally, for this, we need a
    careful definition of...

  - the _free variables_ of a term -- i.e., those variables
    mentioned in a term and not in the scope of an enclosing
    function abstraction binding a variable of the same name.

To make Agda happy, we need to formalize the story in the opposite
order...


### Free Occurrences

A variable $$x$$ _appears free in_ a term _t_ if $$t$$ contains some
occurrence of $$x$$ that is not under an abstraction labeled $$x$$.
For example:

  - $$y$$ appears free, but $$x$$ does not, in $$\lambda x : A\to B. x\;y$$
  - both $$x$$ and $$y$$ appear free in $$(\lambda x:A\to B. x\;y) x$$
  - no variables appear free in $$\lambda x:A\to B. \lambda y:A. x\;y$$

Formally:

<pre class="Agda">{% raw %}
<a name="6996" class="Keyword"
      >data</a
      ><a name="7000"
      > </a
      ><a name="7001" href="StlcProp.html#7001" class="Datatype Operator"
      >_FreeIn_</a
      ><a name="7009"
      > </a
      ><a name="7010" class="Symbol"
      >(</a
      ><a name="7011" href="StlcProp.html#7011" class="Bound"
      >x</a
      ><a name="7012"
      > </a
      ><a name="7013" class="Symbol"
      >:</a
      ><a name="7014"
      > </a
      ><a name="7015" href="Stlc.html#5778" class="Datatype"
      >Id</a
      ><a name="7017" class="Symbol"
      >)</a
      ><a name="7018"
      > </a
      ><a name="7019" class="Symbol"
      >:</a
      ><a name="7020"
      > </a
      ><a name="7021" href="Stlc.html#6114" class="Datatype"
      >Term</a
      ><a name="7025"
      > </a
      ><a name="7026" class="Symbol"
      >&#8594;</a
      ><a name="7027"
      > </a
      ><a name="7028" class="PrimitiveType"
      >Set</a
      ><a name="7031"
      > </a
      ><a name="7032" class="Keyword"
      >where</a
      ><a name="7037"
      >
  </a
      ><a name="7040" href="StlcProp.html#7040" class="InductiveConstructor"
      >var</a
      ><a name="7043"
      >  </a
      ><a name="7045" class="Symbol"
      >:</a
      ><a name="7046"
      > </a
      ><a name="7047" href="StlcProp.html#7011" class="Bound"
      >x</a
      ><a name="7048"
      > </a
      ><a name="7049" href="StlcProp.html#7001" class="Datatype Operator"
      >FreeIn</a
      ><a name="7055"
      > </a
      ><a name="7056" href="Stlc.html#6133" class="InductiveConstructor"
      >var</a
      ><a name="7059"
      > </a
      ><a name="7060" href="StlcProp.html#7011" class="Bound"
      >x</a
      ><a name="7061"
      >
  </a
      ><a name="7064" href="StlcProp.html#7064" class="InductiveConstructor"
      >abs</a
      ><a name="7067"
      >  </a
      ><a name="7069" class="Symbol"
      >:</a
      ><a name="7070"
      > </a
      ><a name="7071" class="Symbol"
      >&#8704;</a
      ><a name="7072"
      > </a
      ><a name="7073" class="Symbol"
      >{</a
      ><a name="7074" href="StlcProp.html#7074" class="Bound"
      >y</a
      ><a name="7075"
      > </a
      ><a name="7076" href="StlcProp.html#7076" class="Bound"
      >A</a
      ><a name="7077"
      > </a
      ><a name="7078" href="StlcProp.html#7078" class="Bound"
      >t</a
      ><a name="7079" class="Symbol"
      >}</a
      ><a name="7080"
      > </a
      ><a name="7081" class="Symbol"
      >&#8594;</a
      ><a name="7082"
      > </a
      ><a name="7083" href="StlcProp.html#7074" class="Bound"
      >y</a
      ><a name="7084"
      > </a
      ><a name="7085" href="https://agda.github.io/agda-stdlib/Relation.Binary.Core.html#4493" class="Function Operator"
      >&#8802;</a
      ><a name="7086"
      > </a
      ><a name="7087" href="StlcProp.html#7011" class="Bound"
      >x</a
      ><a name="7088"
      > </a
      ><a name="7089" class="Symbol"
      >&#8594;</a
      ><a name="7090"
      > </a
      ><a name="7091" href="StlcProp.html#7011" class="Bound"
      >x</a
      ><a name="7092"
      > </a
      ><a name="7093" href="StlcProp.html#7001" class="Datatype Operator"
      >FreeIn</a
      ><a name="7099"
      > </a
      ><a name="7100" href="StlcProp.html#7078" class="Bound"
      >t</a
      ><a name="7101"
      > </a
      ><a name="7102" class="Symbol"
      >&#8594;</a
      ><a name="7103"
      > </a
      ><a name="7104" href="StlcProp.html#7011" class="Bound"
      >x</a
      ><a name="7105"
      > </a
      ><a name="7106" href="StlcProp.html#7001" class="Datatype Operator"
      >FreeIn</a
      ><a name="7112"
      > </a
      ><a name="7113" href="Stlc.html#6182" class="InductiveConstructor"
      >abs</a
      ><a name="7116"
      > </a
      ><a name="7117" href="StlcProp.html#7074" class="Bound"
      >y</a
      ><a name="7118"
      > </a
      ><a name="7119" href="StlcProp.html#7076" class="Bound"
      >A</a
      ><a name="7120"
      > </a
      ><a name="7121" href="StlcProp.html#7078" class="Bound"
      >t</a
      ><a name="7122"
      >
  </a
      ><a name="7125" href="StlcProp.html#7125" class="InductiveConstructor"
      >app1</a
      ><a name="7129"
      > </a
      ><a name="7130" class="Symbol"
      >:</a
      ><a name="7131"
      > </a
      ><a name="7132" class="Symbol"
      >&#8704;</a
      ><a name="7133"
      > </a
      ><a name="7134" class="Symbol"
      >{</a
      ><a name="7135" href="StlcProp.html#7135" class="Bound"
      >t&#8321;</a
      ><a name="7137"
      > </a
      ><a name="7138" href="StlcProp.html#7138" class="Bound"
      >t&#8322;</a
      ><a name="7140" class="Symbol"
      >}</a
      ><a name="7141"
      > </a
      ><a name="7142" class="Symbol"
      >&#8594;</a
      ><a name="7143"
      > </a
      ><a name="7144" href="StlcProp.html#7011" class="Bound"
      >x</a
      ><a name="7145"
      > </a
      ><a name="7146" href="StlcProp.html#7001" class="Datatype Operator"
      >FreeIn</a
      ><a name="7152"
      > </a
      ><a name="7153" href="StlcProp.html#7135" class="Bound"
      >t&#8321;</a
      ><a name="7155"
      > </a
      ><a name="7156" class="Symbol"
      >&#8594;</a
      ><a name="7157"
      > </a
      ><a name="7158" href="StlcProp.html#7011" class="Bound"
      >x</a
      ><a name="7159"
      > </a
      ><a name="7160" href="StlcProp.html#7001" class="Datatype Operator"
      >FreeIn</a
      ><a name="7166"
      > </a
      ><a name="7167" href="Stlc.html#6153" class="InductiveConstructor"
      >app</a
      ><a name="7170"
      > </a
      ><a name="7171" href="StlcProp.html#7135" class="Bound"
      >t&#8321;</a
      ><a name="7173"
      > </a
      ><a name="7174" href="StlcProp.html#7138" class="Bound"
      >t&#8322;</a
      ><a name="7176"
      >
  </a
      ><a name="7179" href="StlcProp.html#7179" class="InductiveConstructor"
      >app2</a
      ><a name="7183"
      > </a
      ><a name="7184" class="Symbol"
      >:</a
      ><a name="7185"
      > </a
      ><a name="7186" class="Symbol"
      >&#8704;</a
      ><a name="7187"
      > </a
      ><a name="7188" class="Symbol"
      >{</a
      ><a name="7189" href="StlcProp.html#7189" class="Bound"
      >t&#8321;</a
      ><a name="7191"
      > </a
      ><a name="7192" href="StlcProp.html#7192" class="Bound"
      >t&#8322;</a
      ><a name="7194" class="Symbol"
      >}</a
      ><a name="7195"
      > </a
      ><a name="7196" class="Symbol"
      >&#8594;</a
      ><a name="7197"
      > </a
      ><a name="7198" href="StlcProp.html#7011" class="Bound"
      >x</a
      ><a name="7199"
      > </a
      ><a name="7200" href="StlcProp.html#7001" class="Datatype Operator"
      >FreeIn</a
      ><a name="7206"
      > </a
      ><a name="7207" href="StlcProp.html#7192" class="Bound"
      >t&#8322;</a
      ><a name="7209"
      > </a
      ><a name="7210" class="Symbol"
      >&#8594;</a
      ><a name="7211"
      > </a
      ><a name="7212" href="StlcProp.html#7011" class="Bound"
      >x</a
      ><a name="7213"
      > </a
      ><a name="7214" href="StlcProp.html#7001" class="Datatype Operator"
      >FreeIn</a
      ><a name="7220"
      > </a
      ><a name="7221" href="Stlc.html#6153" class="InductiveConstructor"
      >app</a
      ><a name="7224"
      > </a
      ><a name="7225" href="StlcProp.html#7189" class="Bound"
      >t&#8321;</a
      ><a name="7227"
      > </a
      ><a name="7228" href="StlcProp.html#7192" class="Bound"
      >t&#8322;</a
      ><a name="7230"
      >
  </a
      ><a name="7233" href="StlcProp.html#7233" class="InductiveConstructor"
      >if1</a
      ><a name="7236"
      >  </a
      ><a name="7238" class="Symbol"
      >:</a
      ><a name="7239"
      > </a
      ><a name="7240" class="Symbol"
      >&#8704;</a
      ><a name="7241"
      > </a
      ><a name="7242" class="Symbol"
      >{</a
      ><a name="7243" href="StlcProp.html#7243" class="Bound"
      >t&#8321;</a
      ><a name="7245"
      > </a
      ><a name="7246" href="StlcProp.html#7246" class="Bound"
      >t&#8322;</a
      ><a name="7248"
      > </a
      ><a name="7249" href="StlcProp.html#7249" class="Bound"
      >t&#8323;</a
      ><a name="7251" class="Symbol"
      >}</a
      ><a name="7252"
      > </a
      ><a name="7253" class="Symbol"
      >&#8594;</a
      ><a name="7254"
      > </a
      ><a name="7255" href="StlcProp.html#7011" class="Bound"
      >x</a
      ><a name="7256"
      > </a
      ><a name="7257" href="StlcProp.html#7001" class="Datatype Operator"
      >FreeIn</a
      ><a name="7263"
      > </a
      ><a name="7264" href="StlcProp.html#7243" class="Bound"
      >t&#8321;</a
      ><a name="7266"
      > </a
      ><a name="7267" class="Symbol"
      >&#8594;</a
      ><a name="7268"
      > </a
      ><a name="7269" href="StlcProp.html#7011" class="Bound"
      >x</a
      ><a name="7270"
      > </a
      ><a name="7271" href="StlcProp.html#7001" class="Datatype Operator"
      >FreeIn</a
      ><a name="7277"
      > </a
      ><a name="7278" class="Symbol"
      >(</a
      ><a name="7279" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >if</a
      ><a name="7281"
      > </a
      ><a name="7282" href="StlcProp.html#7243" class="Bound"
      >t&#8321;</a
      ><a name="7284"
      > </a
      ><a name="7285" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >then</a
      ><a name="7289"
      > </a
      ><a name="7290" href="StlcProp.html#7246" class="Bound"
      >t&#8322;</a
      ><a name="7292"
      > </a
      ><a name="7293" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >else</a
      ><a name="7297"
      > </a
      ><a name="7298" href="StlcProp.html#7249" class="Bound"
      >t&#8323;</a
      ><a name="7300" class="Symbol"
      >)</a
      ><a name="7301"
      >
  </a
      ><a name="7304" href="StlcProp.html#7304" class="InductiveConstructor"
      >if2</a
      ><a name="7307"
      >  </a
      ><a name="7309" class="Symbol"
      >:</a
      ><a name="7310"
      > </a
      ><a name="7311" class="Symbol"
      >&#8704;</a
      ><a name="7312"
      > </a
      ><a name="7313" class="Symbol"
      >{</a
      ><a name="7314" href="StlcProp.html#7314" class="Bound"
      >t&#8321;</a
      ><a name="7316"
      > </a
      ><a name="7317" href="StlcProp.html#7317" class="Bound"
      >t&#8322;</a
      ><a name="7319"
      > </a
      ><a name="7320" href="StlcProp.html#7320" class="Bound"
      >t&#8323;</a
      ><a name="7322" class="Symbol"
      >}</a
      ><a name="7323"
      > </a
      ><a name="7324" class="Symbol"
      >&#8594;</a
      ><a name="7325"
      > </a
      ><a name="7326" href="StlcProp.html#7011" class="Bound"
      >x</a
      ><a name="7327"
      > </a
      ><a name="7328" href="StlcProp.html#7001" class="Datatype Operator"
      >FreeIn</a
      ><a name="7334"
      > </a
      ><a name="7335" href="StlcProp.html#7317" class="Bound"
      >t&#8322;</a
      ><a name="7337"
      > </a
      ><a name="7338" class="Symbol"
      >&#8594;</a
      ><a name="7339"
      > </a
      ><a name="7340" href="StlcProp.html#7011" class="Bound"
      >x</a
      ><a name="7341"
      > </a
      ><a name="7342" href="StlcProp.html#7001" class="Datatype Operator"
      >FreeIn</a
      ><a name="7348"
      > </a
      ><a name="7349" class="Symbol"
      >(</a
      ><a name="7350" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >if</a
      ><a name="7352"
      > </a
      ><a name="7353" href="StlcProp.html#7314" class="Bound"
      >t&#8321;</a
      ><a name="7355"
      > </a
      ><a name="7356" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >then</a
      ><a name="7360"
      > </a
      ><a name="7361" href="StlcProp.html#7317" class="Bound"
      >t&#8322;</a
      ><a name="7363"
      > </a
      ><a name="7364" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >else</a
      ><a name="7368"
      > </a
      ><a name="7369" href="StlcProp.html#7320" class="Bound"
      >t&#8323;</a
      ><a name="7371" class="Symbol"
      >)</a
      ><a name="7372"
      >
  </a
      ><a name="7375" href="StlcProp.html#7375" class="InductiveConstructor"
      >if3</a
      ><a name="7378"
      >  </a
      ><a name="7380" class="Symbol"
      >:</a
      ><a name="7381"
      > </a
      ><a name="7382" class="Symbol"
      >&#8704;</a
      ><a name="7383"
      > </a
      ><a name="7384" class="Symbol"
      >{</a
      ><a name="7385" href="StlcProp.html#7385" class="Bound"
      >t&#8321;</a
      ><a name="7387"
      > </a
      ><a name="7388" href="StlcProp.html#7388" class="Bound"
      >t&#8322;</a
      ><a name="7390"
      > </a
      ><a name="7391" href="StlcProp.html#7391" class="Bound"
      >t&#8323;</a
      ><a name="7393" class="Symbol"
      >}</a
      ><a name="7394"
      > </a
      ><a name="7395" class="Symbol"
      >&#8594;</a
      ><a name="7396"
      > </a
      ><a name="7397" href="StlcProp.html#7011" class="Bound"
      >x</a
      ><a name="7398"
      > </a
      ><a name="7399" href="StlcProp.html#7001" class="Datatype Operator"
      >FreeIn</a
      ><a name="7405"
      > </a
      ><a name="7406" href="StlcProp.html#7391" class="Bound"
      >t&#8323;</a
      ><a name="7408"
      > </a
      ><a name="7409" class="Symbol"
      >&#8594;</a
      ><a name="7410"
      > </a
      ><a name="7411" href="StlcProp.html#7011" class="Bound"
      >x</a
      ><a name="7412"
      > </a
      ><a name="7413" href="StlcProp.html#7001" class="Datatype Operator"
      >FreeIn</a
      ><a name="7419"
      > </a
      ><a name="7420" class="Symbol"
      >(</a
      ><a name="7421" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >if</a
      ><a name="7423"
      > </a
      ><a name="7424" href="StlcProp.html#7385" class="Bound"
      >t&#8321;</a
      ><a name="7426"
      > </a
      ><a name="7427" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >then</a
      ><a name="7431"
      > </a
      ><a name="7432" href="StlcProp.html#7388" class="Bound"
      >t&#8322;</a
      ><a name="7434"
      > </a
      ><a name="7435" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >else</a
      ><a name="7439"
      > </a
      ><a name="7440" href="StlcProp.html#7391" class="Bound"
      >t&#8323;</a
      ><a name="7442" class="Symbol"
      >)</a
      >
{% endraw %}</pre>

A term in which no variables appear free is said to be _closed_.

<pre class="Agda">{% raw %}
<a name="7535" href="StlcProp.html#7535" class="Function"
      >Closed</a
      ><a name="7541"
      > </a
      ><a name="7542" class="Symbol"
      >:</a
      ><a name="7543"
      > </a
      ><a name="7544" href="Stlc.html#6114" class="Datatype"
      >Term</a
      ><a name="7548"
      > </a
      ><a name="7549" class="Symbol"
      >&#8594;</a
      ><a name="7550"
      > </a
      ><a name="7551" class="PrimitiveType"
      >Set</a
      ><a name="7554"
      >
</a
      ><a name="7555" href="StlcProp.html#7535" class="Function"
      >Closed</a
      ><a name="7561"
      > </a
      ><a name="7562" href="StlcProp.html#7562" class="Bound"
      >t</a
      ><a name="7563"
      > </a
      ><a name="7564" class="Symbol"
      >=</a
      ><a name="7565"
      > </a
      ><a name="7566" class="Symbol"
      >&#8704;</a
      ><a name="7567"
      > </a
      ><a name="7568" class="Symbol"
      >{</a
      ><a name="7569" href="StlcProp.html#7569" class="Bound"
      >x</a
      ><a name="7570" class="Symbol"
      >}</a
      ><a name="7571"
      > </a
      ><a name="7572" class="Symbol"
      >&#8594;</a
      ><a name="7573"
      > </a
      ><a name="7574" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#414" class="Function Operator"
      >&#172;</a
      ><a name="7575"
      > </a
      ><a name="7576" class="Symbol"
      >(</a
      ><a name="7577" href="StlcProp.html#7569" class="Bound"
      >x</a
      ><a name="7578"
      > </a
      ><a name="7579" href="StlcProp.html#7001" class="Datatype Operator"
      >FreeIn</a
      ><a name="7585"
      > </a
      ><a name="7586" href="StlcProp.html#7562" class="Bound"
      >t</a
      ><a name="7587" class="Symbol"
      >)</a
      >
{% endraw %}</pre>

#### Exercise: 1 star (free-in)
If the definition of `_FreeIn_` is not crystal clear to
you, it is a good idea to take a piece of paper and write out the
rules in informal inference-rule notation.  (Although it is a
rather low-level, technical definition, understanding it is
crucial to understanding substitution and its properties, which
are really the crux of the lambda-calculus.)

### Substitution
To prove that substitution preserves typing, we first need a
technical lemma connecting free variables and typing contexts: If
a variable $$x$$ appears free in a term $$t$$, and if we know $$t$$ is
well typed in context $$\Gamma$$, then it must be the case that
$$\Gamma$$ assigns a type to $$x$$.

<pre class="Agda">{% raw %}
<a name="8316" href="StlcProp.html#8316" class="Function"
      >freeInCtxt</a
      ><a name="8326"
      > </a
      ><a name="8327" class="Symbol"
      >:</a
      ><a name="8328"
      > </a
      ><a name="8329" class="Symbol"
      >&#8704;</a
      ><a name="8330"
      > </a
      ><a name="8331" class="Symbol"
      >{</a
      ><a name="8332" href="StlcProp.html#8332" class="Bound"
      >x</a
      ><a name="8333"
      > </a
      ><a name="8334" href="StlcProp.html#8334" class="Bound"
      >t</a
      ><a name="8335"
      > </a
      ><a name="8336" href="StlcProp.html#8336" class="Bound"
      >A</a
      ><a name="8337"
      > </a
      ><a name="8338" href="StlcProp.html#8338" class="Bound"
      >&#915;</a
      ><a name="8339" class="Symbol"
      >}</a
      ><a name="8340"
      > </a
      ><a name="8341" class="Symbol"
      >&#8594;</a
      ><a name="8342"
      > </a
      ><a name="8343" href="StlcProp.html#8332" class="Bound"
      >x</a
      ><a name="8344"
      > </a
      ><a name="8345" href="StlcProp.html#7001" class="Datatype Operator"
      >FreeIn</a
      ><a name="8351"
      > </a
      ><a name="8352" href="StlcProp.html#8334" class="Bound"
      >t</a
      ><a name="8353"
      > </a
      ><a name="8354" class="Symbol"
      >&#8594;</a
      ><a name="8355"
      > </a
      ><a name="8356" href="StlcProp.html#8338" class="Bound"
      >&#915;</a
      ><a name="8357"
      > </a
      ><a name="8358" href="Stlc.html#19629" class="Datatype Operator"
      >&#8866;</a
      ><a name="8359"
      > </a
      ><a name="8360" href="StlcProp.html#8334" class="Bound"
      >t</a
      ><a name="8361"
      > </a
      ><a name="8362" href="Stlc.html#19629" class="Datatype Operator"
      >&#8758;</a
      ><a name="8363"
      > </a
      ><a name="8364" href="StlcProp.html#8336" class="Bound"
      >A</a
      ><a name="8365"
      > </a
      ><a name="8366" class="Symbol"
      >&#8594;</a
      ><a name="8367"
      > </a
      ><a name="8368" href="https://agda.github.io/agda-stdlib/Data.Product.html#823" class="Function"
      >&#8707;</a
      ><a name="8369"
      > </a
      ><a name="8370" class="Symbol"
      >&#955;</a
      ><a name="8371"
      > </a
      ><a name="8372" href="StlcProp.html#8372" class="Bound"
      >B</a
      ><a name="8373"
      > </a
      ><a name="8374" class="Symbol"
      >&#8594;</a
      ><a name="8375"
      > </a
      ><a name="8376" href="StlcProp.html#8338" class="Bound"
      >&#915;</a
      ><a name="8377"
      > </a
      ><a name="8378" href="StlcProp.html#8332" class="Bound"
      >x</a
      ><a name="8379"
      > </a
      ><a name="8380" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="8381"
      > </a
      ><a name="8382" href="https://agda.github.io/agda-stdlib/Data.Maybe.Base.html#373" class="InductiveConstructor"
      >just</a
      ><a name="8386"
      > </a
      ><a name="8387" href="StlcProp.html#8372" class="Bound"
      >B</a
      >
{% endraw %}</pre>

_Proof_: We show, by induction on the proof that $$x$$ appears
  free in $$t$$, that, for all contexts $$\Gamma$$, if $$t$$ is well
  typed under $$\Gamma$$, then $$\Gamma$$ assigns some type to $$x$$.

  - If the last rule used was `var`, then $$t = x$$, and from
    the assumption that $$t$$ is well typed under $$\Gamma$$ we have
    immediately that $$\Gamma$$ assigns a type to $$x$$.

  - If the last rule used was `app1`, then $$t = t_1\;t_2$$ and $$x$$
    appears free in $$t_1$$.  Since $$t$$ is well typed under $$\Gamma$$,
    we can see from the typing rules that $$t_1$$ must also be, and
    the IH then tells us that $$\Gamma$$ assigns $$x$$ a type.

  - Almost all the other cases are similar: $$x$$ appears free in a
    subterm of $$t$$, and since $$t$$ is well typed under $$\Gamma$$, we
    know the subterm of $$t$$ in which $$x$$ appears is well typed
    under $$\Gamma$$ as well, and the IH gives us exactly the
    conclusion we want.

  - The only remaining case is `abs`.  In this case $$t =
    \lambda y:A.t'$$, and $$x$$ appears free in $$t'$$; we also know that
    $$x$$ is different from $$y$$.  The difference from the previous
    cases is that whereas $$t$$ is well typed under $$\Gamma$$, its
    body $$t'$$ is well typed under $$(\Gamma, y:A)$$, so the IH
    allows us to conclude that $$x$$ is assigned some type by the
    extended context $$(\Gamma, y:A)$$.  To conclude that $$\Gamma$$
    assigns a type to $$x$$, we appeal the decidable equality for names
    `_≟_`, noting that $$x$$ and $$y$$ are different variables.

<pre class="Agda">{% raw %}
<a name="9983" href="StlcProp.html#8316" class="Function"
      >freeInCtxt</a
      ><a name="9993"
      > </a
      ><a name="9994" href="StlcProp.html#7040" class="InductiveConstructor"
      >var</a
      ><a name="9997"
      > </a
      ><a name="9998" class="Symbol"
      >(</a
      ><a name="9999" href="Stlc.html#19673" class="InductiveConstructor"
      >var</a
      ><a name="10002"
      > </a
      ><a name="10003" class="Symbol"
      >_</a
      ><a name="10004"
      > </a
      ><a name="10005" href="StlcProp.html#10005" class="Bound"
      >x&#8758;A</a
      ><a name="10008" class="Symbol"
      >)</a
      ><a name="10009"
      > </a
      ><a name="10010" class="Symbol"
      >=</a
      ><a name="10011"
      > </a
      ><a name="10012" class="Symbol"
      >(_</a
      ><a name="10014"
      > </a
      ><a name="10015" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="10016"
      > </a
      ><a name="10017" href="StlcProp.html#10005" class="Bound"
      >x&#8758;A</a
      ><a name="10020" class="Symbol"
      >)</a
      ><a name="10021"
      >
</a
      ><a name="10022" href="StlcProp.html#8316" class="Function"
      >freeInCtxt</a
      ><a name="10032"
      > </a
      ><a name="10033" class="Symbol"
      >(</a
      ><a name="10034" href="StlcProp.html#7125" class="InductiveConstructor"
      >app1</a
      ><a name="10038"
      > </a
      ><a name="10039" href="StlcProp.html#10039" class="Bound"
      >x&#8712;t&#8321;</a
      ><a name="10043" class="Symbol"
      >)</a
      ><a name="10044"
      > </a
      ><a name="10045" class="Symbol"
      >(</a
      ><a name="10046" href="Stlc.html#19882" class="InductiveConstructor"
      >app</a
      ><a name="10049"
      > </a
      ><a name="10050" href="StlcProp.html#10050" class="Bound"
      >t&#8321;&#8758;A</a
      ><a name="10054"
      > </a
      ><a name="10055" class="Symbol"
      >_</a
      ><a name="10056"
      >   </a
      ><a name="10059" class="Symbol"
      >)</a
      ><a name="10060"
      > </a
      ><a name="10061" class="Symbol"
      >=</a
      ><a name="10062"
      > </a
      ><a name="10063" href="StlcProp.html#8316" class="Function"
      >freeInCtxt</a
      ><a name="10073"
      > </a
      ><a name="10074" href="StlcProp.html#10039" class="Bound"
      >x&#8712;t&#8321;</a
      ><a name="10078"
      > </a
      ><a name="10079" href="StlcProp.html#10050" class="Bound"
      >t&#8321;&#8758;A</a
      ><a name="10083"
      >
</a
      ><a name="10084" href="StlcProp.html#8316" class="Function"
      >freeInCtxt</a
      ><a name="10094"
      > </a
      ><a name="10095" class="Symbol"
      >(</a
      ><a name="10096" href="StlcProp.html#7179" class="InductiveConstructor"
      >app2</a
      ><a name="10100"
      > </a
      ><a name="10101" href="StlcProp.html#10101" class="Bound"
      >x&#8712;t&#8322;</a
      ><a name="10105" class="Symbol"
      >)</a
      ><a name="10106"
      > </a
      ><a name="10107" class="Symbol"
      >(</a
      ><a name="10108" href="Stlc.html#19882" class="InductiveConstructor"
      >app</a
      ><a name="10111"
      > </a
      ><a name="10112" class="Symbol"
      >_</a
      ><a name="10113"
      >    </a
      ><a name="10117" href="StlcProp.html#10117" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="10121" class="Symbol"
      >)</a
      ><a name="10122"
      > </a
      ><a name="10123" class="Symbol"
      >=</a
      ><a name="10124"
      > </a
      ><a name="10125" href="StlcProp.html#8316" class="Function"
      >freeInCtxt</a
      ><a name="10135"
      > </a
      ><a name="10136" href="StlcProp.html#10101" class="Bound"
      >x&#8712;t&#8322;</a
      ><a name="10140"
      > </a
      ><a name="10141" href="StlcProp.html#10117" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="10145"
      >
</a
      ><a name="10146" href="StlcProp.html#8316" class="Function"
      >freeInCtxt</a
      ><a name="10156"
      > </a
      ><a name="10157" class="Symbol"
      >(</a
      ><a name="10158" href="StlcProp.html#7233" class="InductiveConstructor"
      >if1</a
      ><a name="10161"
      > </a
      ><a name="10162" href="StlcProp.html#10162" class="Bound"
      >x&#8712;t&#8321;</a
      ><a name="10166" class="Symbol"
      >)</a
      ><a name="10167"
      > </a
      ><a name="10168" class="Symbol"
      >(</a
      ><a name="10169" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >if</a
      ><a name="10171"
      > </a
      ><a name="10172" href="StlcProp.html#10172" class="Bound"
      >t&#8321;&#8758;A</a
      ><a name="10176"
      > </a
      ><a name="10177" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >then</a
      ><a name="10181"
      > </a
      ><a name="10182" class="Symbol"
      >_</a
      ><a name="10183"
      >    </a
      ><a name="10187" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >else</a
      ><a name="10191"
      > </a
      ><a name="10192" class="Symbol"
      >_</a
      ><a name="10193"
      >   </a
      ><a name="10196" class="Symbol"
      >)</a
      ><a name="10197"
      > </a
      ><a name="10198" class="Symbol"
      >=</a
      ><a name="10199"
      > </a
      ><a name="10200" href="StlcProp.html#8316" class="Function"
      >freeInCtxt</a
      ><a name="10210"
      > </a
      ><a name="10211" href="StlcProp.html#10162" class="Bound"
      >x&#8712;t&#8321;</a
      ><a name="10215"
      > </a
      ><a name="10216" href="StlcProp.html#10172" class="Bound"
      >t&#8321;&#8758;A</a
      ><a name="10220"
      >
</a
      ><a name="10221" href="StlcProp.html#8316" class="Function"
      >freeInCtxt</a
      ><a name="10231"
      > </a
      ><a name="10232" class="Symbol"
      >(</a
      ><a name="10233" href="StlcProp.html#7304" class="InductiveConstructor"
      >if2</a
      ><a name="10236"
      > </a
      ><a name="10237" href="StlcProp.html#10237" class="Bound"
      >x&#8712;t&#8322;</a
      ><a name="10241" class="Symbol"
      >)</a
      ><a name="10242"
      > </a
      ><a name="10243" class="Symbol"
      >(</a
      ><a name="10244" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >if</a
      ><a name="10246"
      > </a
      ><a name="10247" class="Symbol"
      >_</a
      ><a name="10248"
      >    </a
      ><a name="10252" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >then</a
      ><a name="10256"
      > </a
      ><a name="10257" href="StlcProp.html#10257" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="10261"
      > </a
      ><a name="10262" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >else</a
      ><a name="10266"
      > </a
      ><a name="10267" class="Symbol"
      >_</a
      ><a name="10268"
      >   </a
      ><a name="10271" class="Symbol"
      >)</a
      ><a name="10272"
      > </a
      ><a name="10273" class="Symbol"
      >=</a
      ><a name="10274"
      > </a
      ><a name="10275" href="StlcProp.html#8316" class="Function"
      >freeInCtxt</a
      ><a name="10285"
      > </a
      ><a name="10286" href="StlcProp.html#10237" class="Bound"
      >x&#8712;t&#8322;</a
      ><a name="10290"
      > </a
      ><a name="10291" href="StlcProp.html#10257" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="10295"
      >
</a
      ><a name="10296" href="StlcProp.html#8316" class="Function"
      >freeInCtxt</a
      ><a name="10306"
      > </a
      ><a name="10307" class="Symbol"
      >(</a
      ><a name="10308" href="StlcProp.html#7375" class="InductiveConstructor"
      >if3</a
      ><a name="10311"
      > </a
      ><a name="10312" href="StlcProp.html#10312" class="Bound"
      >x&#8712;t&#8323;</a
      ><a name="10316" class="Symbol"
      >)</a
      ><a name="10317"
      > </a
      ><a name="10318" class="Symbol"
      >(</a
      ><a name="10319" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >if</a
      ><a name="10321"
      > </a
      ><a name="10322" class="Symbol"
      >_</a
      ><a name="10323"
      >    </a
      ><a name="10327" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >then</a
      ><a name="10331"
      > </a
      ><a name="10332" class="Symbol"
      >_</a
      ><a name="10333"
      >    </a
      ><a name="10337" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >else</a
      ><a name="10341"
      > </a
      ><a name="10342" href="StlcProp.html#10342" class="Bound"
      >t&#8323;&#8758;A</a
      ><a name="10346" class="Symbol"
      >)</a
      ><a name="10347"
      > </a
      ><a name="10348" class="Symbol"
      >=</a
      ><a name="10349"
      > </a
      ><a name="10350" href="StlcProp.html#8316" class="Function"
      >freeInCtxt</a
      ><a name="10360"
      > </a
      ><a name="10361" href="StlcProp.html#10312" class="Bound"
      >x&#8712;t&#8323;</a
      ><a name="10365"
      > </a
      ><a name="10366" href="StlcProp.html#10342" class="Bound"
      >t&#8323;&#8758;A</a
      ><a name="10370"
      >
</a
      ><a name="10371" href="StlcProp.html#8316" class="Function"
      >freeInCtxt</a
      ><a name="10381"
      > </a
      ><a name="10382" class="Symbol"
      >{</a
      ><a name="10383" href="StlcProp.html#10383" class="Bound"
      >x</a
      ><a name="10384" class="Symbol"
      >}</a
      ><a name="10385"
      > </a
      ><a name="10386" class="Symbol"
      >(</a
      ><a name="10387" href="StlcProp.html#7064" class="InductiveConstructor"
      >abs</a
      ><a name="10390"
      > </a
      ><a name="10391" class="Symbol"
      >{</a
      ><a name="10392" href="StlcProp.html#10392" class="Bound"
      >y</a
      ><a name="10393" class="Symbol"
      >}</a
      ><a name="10394"
      > </a
      ><a name="10395" href="StlcProp.html#10395" class="Bound"
      >y&#8800;x</a
      ><a name="10398"
      > </a
      ><a name="10399" href="StlcProp.html#10399" class="Bound"
      >x&#8712;t</a
      ><a name="10402" class="Symbol"
      >)</a
      ><a name="10403"
      > </a
      ><a name="10404" class="Symbol"
      >(</a
      ><a name="10405" href="Stlc.html#19766" class="InductiveConstructor"
      >abs</a
      ><a name="10408"
      > </a
      ><a name="10409" href="StlcProp.html#10409" class="Bound"
      >t&#8758;B</a
      ><a name="10412" class="Symbol"
      >)</a
      ><a name="10413"
      >
    </a
      ><a name="10418" class="Keyword"
      >with</a
      ><a name="10422"
      > </a
      ><a name="10423" href="StlcProp.html#8316" class="Function"
      >freeInCtxt</a
      ><a name="10433"
      > </a
      ><a name="10434" href="StlcProp.html#10399" class="Bound"
      >x&#8712;t</a
      ><a name="10437"
      > </a
      ><a name="10438" href="StlcProp.html#10409" class="Bound"
      >t&#8758;B</a
      ><a name="10441"
      >
</a
      ><a name="10442" class="Symbol"
      >...</a
      ><a name="10445"
      > </a
      ><a name="10446" class="Symbol"
      >|</a
      ><a name="10447"
      > </a
      ><a name="10448" href="StlcProp.html#10448" class="Bound"
      >x&#8758;A</a
      ><a name="10451"
      >
    </a
      ><a name="10456" class="Keyword"
      >with</a
      ><a name="10460"
      > </a
      ><a name="10461" href="StlcProp.html#10392" class="Bound"
      >y</a
      ><a name="10462"
      > </a
      ><a name="10463" href="Stlc.html#5853" class="Function Operator"
      >&#8799;</a
      ><a name="10464"
      > </a
      ><a name="10465" href="StlcProp.html#10383" class="Bound"
      >x</a
      ><a name="10466"
      >
</a
      ><a name="10467" class="Symbol"
      >...</a
      ><a name="10470"
      > </a
      ><a name="10471" class="Symbol"
      >|</a
      ><a name="10472"
      > </a
      ><a name="10473" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="10476"
      > </a
      ><a name="10477" href="StlcProp.html#10477" class="Bound"
      >y=x</a
      ><a name="10480"
      > </a
      ><a name="10481" class="Symbol"
      >=</a
      ><a name="10482"
      > </a
      ><a name="10483" href="https://agda.github.io/agda-stdlib/Data.Empty.html#348" class="Function"
      >&#8869;-elim</a
      ><a name="10489"
      > </a
      ><a name="10490" class="Symbol"
      >(</a
      ><a name="10491" href="StlcProp.html#10395" class="Bound"
      >y&#8800;x</a
      ><a name="10494"
      > </a
      ><a name="10495" href="StlcProp.html#10477" class="Bound"
      >y=x</a
      ><a name="10498" class="Symbol"
      >)</a
      ><a name="10499"
      >
</a
      ><a name="10500" class="Symbol"
      >...</a
      ><a name="10503"
      > </a
      ><a name="10504" class="Symbol"
      >|</a
      ><a name="10505"
      > </a
      ><a name="10506" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="10508"
      >  </a
      ><a name="10510" class="Symbol"
      >_</a
      ><a name="10511"
      >   </a
      ><a name="10514" class="Symbol"
      >=</a
      ><a name="10515"
      > </a
      ><a name="10516" href="StlcProp.html#10448" class="Bound"
      >x&#8758;A</a
      >
{% endraw %}</pre>

Next, we'll need the fact that any term $$t$$ which is well typed in
the empty context is closed (it has no free variables).

#### Exercise: 2 stars, optional (∅⊢-closed)

<pre class="Agda">{% raw %}
<a name="10717" class="Keyword"
      >postulate</a
      ><a name="10726"
      >
  </a
      ><a name="10729" href="StlcProp.html#10729" class="Postulate"
      >&#8709;&#8866;-closed</a
      ><a name="10738"
      > </a
      ><a name="10739" class="Symbol"
      >:</a
      ><a name="10740"
      > </a
      ><a name="10741" class="Symbol"
      >&#8704;</a
      ><a name="10742"
      > </a
      ><a name="10743" class="Symbol"
      >{</a
      ><a name="10744" href="StlcProp.html#10744" class="Bound"
      >t</a
      ><a name="10745"
      > </a
      ><a name="10746" href="StlcProp.html#10746" class="Bound"
      >A</a
      ><a name="10747" class="Symbol"
      >}</a
      ><a name="10748"
      > </a
      ><a name="10749" class="Symbol"
      >&#8594;</a
      ><a name="10750"
      > </a
      ><a name="10751" href="Stlc.html#18658" class="Function"
      >&#8709;</a
      ><a name="10752"
      > </a
      ><a name="10753" href="Stlc.html#19629" class="Datatype Operator"
      >&#8866;</a
      ><a name="10754"
      > </a
      ><a name="10755" href="StlcProp.html#10744" class="Bound"
      >t</a
      ><a name="10756"
      > </a
      ><a name="10757" href="Stlc.html#19629" class="Datatype Operator"
      >&#8758;</a
      ><a name="10758"
      > </a
      ><a name="10759" href="StlcProp.html#10746" class="Bound"
      >A</a
      ><a name="10760"
      > </a
      ><a name="10761" class="Symbol"
      >&#8594;</a
      ><a name="10762"
      > </a
      ><a name="10763" href="StlcProp.html#7535" class="Function"
      >Closed</a
      ><a name="10769"
      > </a
      ><a name="10770" href="StlcProp.html#10744" class="Bound"
      >t</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="10818" href="StlcProp.html#10818" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="10828"
      > </a
      ><a name="10829" class="Symbol"
      >:</a
      ><a name="10830"
      > </a
      ><a name="10831" class="Symbol"
      >&#8704;</a
      ><a name="10832"
      > </a
      ><a name="10833" class="Symbol"
      >{</a
      ><a name="10834" href="StlcProp.html#10834" class="Bound"
      >t</a
      ><a name="10835"
      > </a
      ><a name="10836" href="StlcProp.html#10836" class="Bound"
      >A</a
      ><a name="10837" class="Symbol"
      >}</a
      ><a name="10838"
      > </a
      ><a name="10839" class="Symbol"
      >&#8594;</a
      ><a name="10840"
      > </a
      ><a name="10841" href="Stlc.html#18658" class="Function"
      >&#8709;</a
      ><a name="10842"
      > </a
      ><a name="10843" href="Stlc.html#19629" class="Datatype Operator"
      >&#8866;</a
      ><a name="10844"
      > </a
      ><a name="10845" href="StlcProp.html#10834" class="Bound"
      >t</a
      ><a name="10846"
      > </a
      ><a name="10847" href="Stlc.html#19629" class="Datatype Operator"
      >&#8758;</a
      ><a name="10848"
      > </a
      ><a name="10849" href="StlcProp.html#10836" class="Bound"
      >A</a
      ><a name="10850"
      > </a
      ><a name="10851" class="Symbol"
      >&#8594;</a
      ><a name="10852"
      > </a
      ><a name="10853" href="StlcProp.html#7535" class="Function"
      >Closed</a
      ><a name="10859"
      > </a
      ><a name="10860" href="StlcProp.html#10834" class="Bound"
      >t</a
      ><a name="10861"
      >
</a
      ><a name="10862" href="StlcProp.html#10818" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="10872"
      > </a
      ><a name="10873" class="Symbol"
      >(</a
      ><a name="10874" href="Stlc.html#19673" class="InductiveConstructor"
      >var</a
      ><a name="10877"
      > </a
      ><a name="10878" href="StlcProp.html#10878" class="Bound"
      >x</a
      ><a name="10879"
      > </a
      ><a name="10880" class="Symbol"
      >())</a
      ><a name="10883"
      >
</a
      ><a name="10884" href="StlcProp.html#10818" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="10894"
      > </a
      ><a name="10895" class="Symbol"
      >(</a
      ><a name="10896" href="Stlc.html#19882" class="InductiveConstructor"
      >app</a
      ><a name="10899"
      > </a
      ><a name="10900" href="StlcProp.html#10900" class="Bound"
      >t&#8321;&#8758;A&#8658;B</a
      ><a name="10906"
      > </a
      ><a name="10907" href="StlcProp.html#10907" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="10911" class="Symbol"
      >)</a
      ><a name="10912"
      > </a
      ><a name="10913" class="Symbol"
      >(</a
      ><a name="10914" href="StlcProp.html#7125" class="InductiveConstructor"
      >app1</a
      ><a name="10918"
      > </a
      ><a name="10919" href="StlcProp.html#10919" class="Bound"
      >x&#8712;t&#8321;</a
      ><a name="10923" class="Symbol"
      >)</a
      ><a name="10924"
      > </a
      ><a name="10925" class="Symbol"
      >=</a
      ><a name="10926"
      > </a
      ><a name="10927" href="StlcProp.html#10818" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="10937"
      > </a
      ><a name="10938" href="StlcProp.html#10900" class="Bound"
      >t&#8321;&#8758;A&#8658;B</a
      ><a name="10944"
      > </a
      ><a name="10945" href="StlcProp.html#10919" class="Bound"
      >x&#8712;t&#8321;</a
      ><a name="10949"
      >
</a
      ><a name="10950" href="StlcProp.html#10818" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="10960"
      > </a
      ><a name="10961" class="Symbol"
      >(</a
      ><a name="10962" href="Stlc.html#19882" class="InductiveConstructor"
      >app</a
      ><a name="10965"
      > </a
      ><a name="10966" href="StlcProp.html#10966" class="Bound"
      >t&#8321;&#8758;A&#8658;B</a
      ><a name="10972"
      > </a
      ><a name="10973" href="StlcProp.html#10973" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="10977" class="Symbol"
      >)</a
      ><a name="10978"
      > </a
      ><a name="10979" class="Symbol"
      >(</a
      ><a name="10980" href="StlcProp.html#7179" class="InductiveConstructor"
      >app2</a
      ><a name="10984"
      > </a
      ><a name="10985" href="StlcProp.html#10985" class="Bound"
      >x&#8712;t&#8322;</a
      ><a name="10989" class="Symbol"
      >)</a
      ><a name="10990"
      > </a
      ><a name="10991" class="Symbol"
      >=</a
      ><a name="10992"
      > </a
      ><a name="10993" href="StlcProp.html#10818" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11003"
      > </a
      ><a name="11004" href="StlcProp.html#10973" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="11008"
      > </a
      ><a name="11009" href="StlcProp.html#10985" class="Bound"
      >x&#8712;t&#8322;</a
      ><a name="11013"
      >
</a
      ><a name="11014" href="StlcProp.html#10818" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11024"
      > </a
      ><a name="11025" href="Stlc.html#20016" class="InductiveConstructor"
      >true</a
      ><a name="11029"
      >  </a
      ><a name="11031" class="Symbol"
      >()</a
      ><a name="11033"
      >
</a
      ><a name="11034" href="StlcProp.html#10818" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11044"
      > </a
      ><a name="11045" href="Stlc.html#20075" class="InductiveConstructor"
      >false</a
      ><a name="11050"
      > </a
      ><a name="11051" class="Symbol"
      >()</a
      ><a name="11053"
      >
</a
      ><a name="11054" href="StlcProp.html#10818" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11064"
      > </a
      ><a name="11065" class="Symbol"
      >(</a
      ><a name="11066" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >if</a
      ><a name="11068"
      > </a
      ><a name="11069" href="StlcProp.html#11069" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="11076"
      > </a
      ><a name="11077" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >then</a
      ><a name="11081"
      > </a
      ><a name="11082" href="StlcProp.html#11082" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="11086"
      > </a
      ><a name="11087" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >else</a
      ><a name="11091"
      > </a
      ><a name="11092" href="StlcProp.html#11092" class="Bound"
      >t&#8323;&#8758;A</a
      ><a name="11096" class="Symbol"
      >)</a
      ><a name="11097"
      > </a
      ><a name="11098" class="Symbol"
      >(</a
      ><a name="11099" href="StlcProp.html#7233" class="InductiveConstructor"
      >if1</a
      ><a name="11102"
      > </a
      ><a name="11103" href="StlcProp.html#11103" class="Bound"
      >x&#8712;t&#8321;</a
      ><a name="11107" class="Symbol"
      >)</a
      ><a name="11108"
      > </a
      ><a name="11109" class="Symbol"
      >=</a
      ><a name="11110"
      > </a
      ><a name="11111" href="StlcProp.html#10818" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11121"
      > </a
      ><a name="11122" href="StlcProp.html#11069" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="11129"
      > </a
      ><a name="11130" href="StlcProp.html#11103" class="Bound"
      >x&#8712;t&#8321;</a
      ><a name="11134"
      >
</a
      ><a name="11135" href="StlcProp.html#10818" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11145"
      > </a
      ><a name="11146" class="Symbol"
      >(</a
      ><a name="11147" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >if</a
      ><a name="11149"
      > </a
      ><a name="11150" href="StlcProp.html#11150" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="11157"
      > </a
      ><a name="11158" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >then</a
      ><a name="11162"
      > </a
      ><a name="11163" href="StlcProp.html#11163" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="11167"
      > </a
      ><a name="11168" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >else</a
      ><a name="11172"
      > </a
      ><a name="11173" href="StlcProp.html#11173" class="Bound"
      >t&#8323;&#8758;A</a
      ><a name="11177" class="Symbol"
      >)</a
      ><a name="11178"
      > </a
      ><a name="11179" class="Symbol"
      >(</a
      ><a name="11180" href="StlcProp.html#7304" class="InductiveConstructor"
      >if2</a
      ><a name="11183"
      > </a
      ><a name="11184" href="StlcProp.html#11184" class="Bound"
      >x&#8712;t&#8322;</a
      ><a name="11188" class="Symbol"
      >)</a
      ><a name="11189"
      > </a
      ><a name="11190" class="Symbol"
      >=</a
      ><a name="11191"
      > </a
      ><a name="11192" href="StlcProp.html#10818" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11202"
      > </a
      ><a name="11203" href="StlcProp.html#11163" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="11207"
      > </a
      ><a name="11208" href="StlcProp.html#11184" class="Bound"
      >x&#8712;t&#8322;</a
      ><a name="11212"
      >
</a
      ><a name="11213" href="StlcProp.html#10818" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11223"
      > </a
      ><a name="11224" class="Symbol"
      >(</a
      ><a name="11225" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >if</a
      ><a name="11227"
      > </a
      ><a name="11228" href="StlcProp.html#11228" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="11235"
      > </a
      ><a name="11236" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >then</a
      ><a name="11240"
      > </a
      ><a name="11241" href="StlcProp.html#11241" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="11245"
      > </a
      ><a name="11246" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >else</a
      ><a name="11250"
      > </a
      ><a name="11251" href="StlcProp.html#11251" class="Bound"
      >t&#8323;&#8758;A</a
      ><a name="11255" class="Symbol"
      >)</a
      ><a name="11256"
      > </a
      ><a name="11257" class="Symbol"
      >(</a
      ><a name="11258" href="StlcProp.html#7375" class="InductiveConstructor"
      >if3</a
      ><a name="11261"
      > </a
      ><a name="11262" href="StlcProp.html#11262" class="Bound"
      >x&#8712;t&#8323;</a
      ><a name="11266" class="Symbol"
      >)</a
      ><a name="11267"
      > </a
      ><a name="11268" class="Symbol"
      >=</a
      ><a name="11269"
      > </a
      ><a name="11270" href="StlcProp.html#10818" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11280"
      > </a
      ><a name="11281" href="StlcProp.html#11251" class="Bound"
      >t&#8323;&#8758;A</a
      ><a name="11285"
      > </a
      ><a name="11286" href="StlcProp.html#11262" class="Bound"
      >x&#8712;t&#8323;</a
      ><a name="11290"
      >
</a
      ><a name="11291" href="StlcProp.html#10818" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11301"
      > </a
      ><a name="11302" class="Symbol"
      >(</a
      ><a name="11303" href="Stlc.html#19766" class="InductiveConstructor"
      >abs</a
      ><a name="11306"
      > </a
      ><a name="11307" class="Symbol"
      >{</a
      ><a name="11308" class="Argument"
      >x</a
      ><a name="11309"
      > </a
      ><a name="11310" class="Symbol"
      >=</a
      ><a name="11311"
      > </a
      ><a name="11312" href="StlcProp.html#11312" class="Bound"
      >x</a
      ><a name="11313" class="Symbol"
      >}</a
      ><a name="11314"
      > </a
      ><a name="11315" href="StlcProp.html#11315" class="Bound"
      >t&#8242;&#8758;A</a
      ><a name="11319" class="Symbol"
      >)</a
      ><a name="11320"
      > </a
      ><a name="11321" class="Symbol"
      >{</a
      ><a name="11322" href="StlcProp.html#11322" class="Bound"
      >y</a
      ><a name="11323" class="Symbol"
      >}</a
      ><a name="11324"
      > </a
      ><a name="11325" class="Symbol"
      >(</a
      ><a name="11326" href="StlcProp.html#7064" class="InductiveConstructor"
      >abs</a
      ><a name="11329"
      > </a
      ><a name="11330" href="StlcProp.html#11330" class="Bound"
      >x&#8800;y</a
      ><a name="11333"
      > </a
      ><a name="11334" href="StlcProp.html#11334" class="Bound"
      >y&#8712;t&#8242;</a
      ><a name="11338" class="Symbol"
      >)</a
      ><a name="11339"
      > </a
      ><a name="11340" class="Keyword"
      >with</a
      ><a name="11344"
      > </a
      ><a name="11345" href="StlcProp.html#8316" class="Function"
      >freeInCtxt</a
      ><a name="11355"
      > </a
      ><a name="11356" href="StlcProp.html#11334" class="Bound"
      >y&#8712;t&#8242;</a
      ><a name="11360"
      > </a
      ><a name="11361" href="StlcProp.html#11315" class="Bound"
      >t&#8242;&#8758;A</a
      ><a name="11365"
      >
</a
      ><a name="11366" href="StlcProp.html#10818" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11376"
      > </a
      ><a name="11377" class="Symbol"
      >(</a
      ><a name="11378" class="InductiveConstructor"
      >abs</a
      ><a name="11381"
      > </a
      ><a name="11382" class="Symbol"
      >{</a
      ><a name="11383" class="Argument"
      >x</a
      ><a name="11384"
      > </a
      ><a name="11385" class="Symbol"
      >=</a
      ><a name="11386"
      > </a
      ><a name="11387" href="StlcProp.html#11387" class="Bound"
      >x</a
      ><a name="11388" class="Symbol"
      >}</a
      ><a name="11389"
      > </a
      ><a name="11390" href="StlcProp.html#11390" class="Bound"
      >t&#8242;&#8758;A</a
      ><a name="11394" class="Symbol"
      >)</a
      ><a name="11395"
      > </a
      ><a name="11396" class="Symbol"
      >{</a
      ><a name="11397" href="StlcProp.html#11397" class="Bound"
      >y</a
      ><a name="11398" class="Symbol"
      >}</a
      ><a name="11399"
      > </a
      ><a name="11400" class="Symbol"
      >(</a
      ><a name="11401" class="InductiveConstructor"
      >abs</a
      ><a name="11404"
      > </a
      ><a name="11405" href="StlcProp.html#11405" class="Bound"
      >x&#8800;y</a
      ><a name="11408"
      > </a
      ><a name="11409" href="StlcProp.html#11409" class="Bound"
      >y&#8712;t&#8242;</a
      ><a name="11413" class="Symbol"
      >)</a
      ><a name="11414"
      > </a
      ><a name="11415" class="Symbol"
      >|</a
      ><a name="11416"
      > </a
      ><a name="11417" href="StlcProp.html#11417" class="Bound"
      >A</a
      ><a name="11418"
      > </a
      ><a name="11419" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="11420"
      > </a
      ><a name="11421" href="StlcProp.html#11421" class="Bound"
      >y&#8758;A</a
      ><a name="11424"
      > </a
      ><a name="11425" class="Keyword"
      >with</a
      ><a name="11429"
      > </a
      ><a name="11430" href="StlcProp.html#11387" class="Bound"
      >x</a
      ><a name="11431"
      > </a
      ><a name="11432" href="Stlc.html#5853" class="Function Operator"
      >&#8799;</a
      ><a name="11433"
      > </a
      ><a name="11434" href="StlcProp.html#11397" class="Bound"
      >y</a
      ><a name="11435"
      >
</a
      ><a name="11436" href="StlcProp.html#10818" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11446"
      > </a
      ><a name="11447" class="Symbol"
      >(</a
      ><a name="11448" class="InductiveConstructor"
      >abs</a
      ><a name="11451"
      > </a
      ><a name="11452" class="Symbol"
      >{</a
      ><a name="11453" class="Argument"
      >x</a
      ><a name="11454"
      > </a
      ><a name="11455" class="Symbol"
      >=</a
      ><a name="11456"
      > </a
      ><a name="11457" href="StlcProp.html#11457" class="Bound"
      >x</a
      ><a name="11458" class="Symbol"
      >}</a
      ><a name="11459"
      > </a
      ><a name="11460" href="StlcProp.html#11460" class="Bound"
      >t&#8242;&#8758;A</a
      ><a name="11464" class="Symbol"
      >)</a
      ><a name="11465"
      > </a
      ><a name="11466" class="Symbol"
      >{</a
      ><a name="11467" href="StlcProp.html#11467" class="Bound"
      >y</a
      ><a name="11468" class="Symbol"
      >}</a
      ><a name="11469"
      > </a
      ><a name="11470" class="Symbol"
      >(</a
      ><a name="11471" class="InductiveConstructor"
      >abs</a
      ><a name="11474"
      > </a
      ><a name="11475" href="StlcProp.html#11475" class="Bound"
      >x&#8800;y</a
      ><a name="11478"
      > </a
      ><a name="11479" href="StlcProp.html#11479" class="Bound"
      >y&#8712;t&#8242;</a
      ><a name="11483" class="Symbol"
      >)</a
      ><a name="11484"
      > </a
      ><a name="11485" class="Symbol"
      >|</a
      ><a name="11486"
      > </a
      ><a name="11487" href="StlcProp.html#11487" class="Bound"
      >A</a
      ><a name="11488"
      > </a
      ><a name="11489" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="11490"
      > </a
      ><a name="11491" href="StlcProp.html#11491" class="Bound"
      >y&#8758;A</a
      ><a name="11494"
      > </a
      ><a name="11495" class="Symbol"
      >|</a
      ><a name="11496"
      > </a
      ><a name="11497" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="11500"
      > </a
      ><a name="11501" href="StlcProp.html#11501" class="Bound"
      >x=y</a
      ><a name="11504"
      > </a
      ><a name="11505" class="Symbol"
      >=</a
      ><a name="11506"
      > </a
      ><a name="11507" href="StlcProp.html#11475" class="Bound"
      >x&#8800;y</a
      ><a name="11510"
      > </a
      ><a name="11511" href="StlcProp.html#11501" class="Bound"
      >x=y</a
      ><a name="11514"
      >
</a
      ><a name="11515" href="StlcProp.html#10818" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11525"
      > </a
      ><a name="11526" class="Symbol"
      >(</a
      ><a name="11527" class="InductiveConstructor"
      >abs</a
      ><a name="11530"
      > </a
      ><a name="11531" class="Symbol"
      >{</a
      ><a name="11532" class="Argument"
      >x</a
      ><a name="11533"
      > </a
      ><a name="11534" class="Symbol"
      >=</a
      ><a name="11535"
      > </a
      ><a name="11536" href="StlcProp.html#11536" class="Bound"
      >x</a
      ><a name="11537" class="Symbol"
      >}</a
      ><a name="11538"
      > </a
      ><a name="11539" href="StlcProp.html#11539" class="Bound"
      >t&#8242;&#8758;A</a
      ><a name="11543" class="Symbol"
      >)</a
      ><a name="11544"
      > </a
      ><a name="11545" class="Symbol"
      >{</a
      ><a name="11546" href="StlcProp.html#11546" class="Bound"
      >y</a
      ><a name="11547" class="Symbol"
      >}</a
      ><a name="11548"
      > </a
      ><a name="11549" class="Symbol"
      >(</a
      ><a name="11550" class="InductiveConstructor"
      >abs</a
      ><a name="11553"
      > </a
      ><a name="11554" href="StlcProp.html#11554" class="Bound"
      >x&#8800;y</a
      ><a name="11557"
      > </a
      ><a name="11558" href="StlcProp.html#11558" class="Bound"
      >y&#8712;t&#8242;</a
      ><a name="11562" class="Symbol"
      >)</a
      ><a name="11563"
      > </a
      ><a name="11564" class="Symbol"
      >|</a
      ><a name="11565"
      > </a
      ><a name="11566" href="StlcProp.html#11566" class="Bound"
      >A</a
      ><a name="11567"
      > </a
      ><a name="11568" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="11569"
      > </a
      ><a name="11570" class="Symbol"
      >()</a
      ><a name="11572"
      >  </a
      ><a name="11574" class="Symbol"
      >|</a
      ><a name="11575"
      > </a
      ><a name="11576" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="11578"
      >  </a
      ><a name="11580" class="Symbol"
      >_</a
      >
{% endraw %}</pre>
</div>

Sometimes, when we have a proof $$\Gamma\vdash t : A$$, we will need to
replace $$\Gamma$$ by a different context $$\Gamma'$$.  When is it safe
to do this?  Intuitively, it must at least be the case that
$$\Gamma'$$ assigns the same types as $$\Gamma$$ to all the variables
that appear free in $$t$$. In fact, this is the only condition that
is needed.

<pre class="Agda">{% raw %}
<a name="11968" href="StlcProp.html#11968" class="Function"
      >replaceCtxt</a
      ><a name="11979"
      > </a
      ><a name="11980" class="Symbol"
      >:</a
      ><a name="11981"
      > </a
      ><a name="11982" class="Symbol"
      >&#8704;</a
      ><a name="11983"
      > </a
      ><a name="11984" class="Symbol"
      >{</a
      ><a name="11985" href="StlcProp.html#11985" class="Bound"
      >&#915;</a
      ><a name="11986"
      > </a
      ><a name="11987" href="StlcProp.html#11987" class="Bound"
      >&#915;&#8242;</a
      ><a name="11989"
      > </a
      ><a name="11990" href="StlcProp.html#11990" class="Bound"
      >t</a
      ><a name="11991"
      > </a
      ><a name="11992" href="StlcProp.html#11992" class="Bound"
      >A</a
      ><a name="11993" class="Symbol"
      >}</a
      ><a name="11994"
      >
            </a
      ><a name="12007" class="Symbol"
      >&#8594;</a
      ><a name="12008"
      > </a
      ><a name="12009" class="Symbol"
      >(&#8704;</a
      ><a name="12011"
      > </a
      ><a name="12012" class="Symbol"
      >{</a
      ><a name="12013" href="StlcProp.html#12013" class="Bound"
      >x</a
      ><a name="12014" class="Symbol"
      >}</a
      ><a name="12015"
      > </a
      ><a name="12016" class="Symbol"
      >&#8594;</a
      ><a name="12017"
      > </a
      ><a name="12018" href="StlcProp.html#12013" class="Bound"
      >x</a
      ><a name="12019"
      > </a
      ><a name="12020" href="StlcProp.html#7001" class="Datatype Operator"
      >FreeIn</a
      ><a name="12026"
      > </a
      ><a name="12027" href="StlcProp.html#11990" class="Bound"
      >t</a
      ><a name="12028"
      > </a
      ><a name="12029" class="Symbol"
      >&#8594;</a
      ><a name="12030"
      > </a
      ><a name="12031" href="StlcProp.html#11985" class="Bound"
      >&#915;</a
      ><a name="12032"
      > </a
      ><a name="12033" href="StlcProp.html#12013" class="Bound"
      >x</a
      ><a name="12034"
      > </a
      ><a name="12035" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="12036"
      > </a
      ><a name="12037" href="StlcProp.html#11987" class="Bound"
      >&#915;&#8242;</a
      ><a name="12039"
      > </a
      ><a name="12040" href="StlcProp.html#12013" class="Bound"
      >x</a
      ><a name="12041" class="Symbol"
      >)</a
      ><a name="12042"
      >
            </a
      ><a name="12055" class="Symbol"
      >&#8594;</a
      ><a name="12056"
      > </a
      ><a name="12057" href="StlcProp.html#11985" class="Bound"
      >&#915;</a
      ><a name="12058"
      >  </a
      ><a name="12060" href="Stlc.html#19629" class="Datatype Operator"
      >&#8866;</a
      ><a name="12061"
      > </a
      ><a name="12062" href="StlcProp.html#11990" class="Bound"
      >t</a
      ><a name="12063"
      > </a
      ><a name="12064" href="Stlc.html#19629" class="Datatype Operator"
      >&#8758;</a
      ><a name="12065"
      > </a
      ><a name="12066" href="StlcProp.html#11992" class="Bound"
      >A</a
      ><a name="12067"
      >
            </a
      ><a name="12080" class="Symbol"
      >&#8594;</a
      ><a name="12081"
      > </a
      ><a name="12082" href="StlcProp.html#11987" class="Bound"
      >&#915;&#8242;</a
      ><a name="12084"
      > </a
      ><a name="12085" href="Stlc.html#19629" class="Datatype Operator"
      >&#8866;</a
      ><a name="12086"
      > </a
      ><a name="12087" href="StlcProp.html#11990" class="Bound"
      >t</a
      ><a name="12088"
      > </a
      ><a name="12089" href="Stlc.html#19629" class="Datatype Operator"
      >&#8758;</a
      ><a name="12090"
      > </a
      ><a name="12091" href="StlcProp.html#11992" class="Bound"
      >A</a
      >
{% endraw %}</pre>

_Proof_: By induction on the derivation of
$$\Gamma \vdash t \in T$$.

  - If the last rule in the derivation was `var`, then $$t = x$$
    and $$\Gamma x = T$$.  By assumption, $$\Gamma' x = T$$ as well, and
    hence $$\Gamma' \vdash t : T$$ by `var`.

  - If the last rule was `abs`, then $$t = \lambda y:A. t'$$, with
    $$T = A\to B$$ and $$\Gamma, y : A \vdash t' : B$$.  The
    induction hypothesis is that, for any context $$\Gamma''$$, if
    $$\Gamma, y:A$$ and $$\Gamma''$$ assign the same types to all the
    free variables in $$t'$$, then $$t'$$ has type $$B$$ under
    $$\Gamma''$$.  Let $$\Gamma'$$ be a context which agrees with
    $$\Gamma$$ on the free variables in $$t$$; we must show
    $$\Gamma' \vdash \lambda y:A. t' : A\to B$$.

    By $$abs$$, it suffices to show that $$\Gamma', y:A \vdash t' : t'$$.
    By the IH (setting $$\Gamma'' = Gamma', y:A$$), it suffices to show
    that $$\Gamma, y:A$$ and $$\Gamma', y:A$$ agree on all the variables
    that appear free in $$t'$$.

    Any variable occurring free in $$t'$$ must be either $$y$$ or
    some other variable.  $$\Gamma, y:A$$ and $$\Gamma', y:A$$
    clearly agree on $$y$$.  Otherwise, note that any variable other
    than $$y$$ that occurs free in $$t'$$ also occurs free in
    $$t = \lambda y:A. t'$$, and by assumption $$\Gamma$$ and
    $$\Gamma'$$ agree on all such variables; hence so do $$\Gamma, y:A$$ and
    $$\Gamma', y:A$$.

  - If the last rule was `app`, then $$t = t_1\;t_2$$, with
    $$\Gamma \vdash t_1 : A\to T$$ and $$\Gamma \vdash t_2 : A$$.
    One induction hypothesis states that for all contexts $$\Gamma'$$,
    if $$\Gamma'$$ agrees with $$\Gamma$$ on the free variables in $$t_1$$,
    then $$t_1$$ has type $$A\to T$$ under $$\Gamma'$$; there is a similar IH
    for $$t_2$$.  We must show that $$t_1\;t_2$$ also has type $$T$$ under
    $$\Gamma'$$, given the assumption that $$\Gamma'$$ agrees with
    $$\Gamma$$ on all the free variables in $$t_1\;t_2$$.  By `app`, it
    suffices to show that $$t_1$$ and $$t_2$$ each have the same type
    under $$\Gamma'$$ as under $$\Gamma$$.  But all free variables in
    $$t_1$$ are also free in $$t_1\;t_2$$, and similarly for $$t_2$$;
    hence the desired result follows from the induction hypotheses.

<pre class="Agda">{% raw %}
<a name="14395" href="StlcProp.html#11968" class="Function"
      >replaceCtxt</a
      ><a name="14406"
      > </a
      ><a name="14407" href="StlcProp.html#14407" class="Bound"
      >f</a
      ><a name="14408"
      > </a
      ><a name="14409" class="Symbol"
      >(</a
      ><a name="14410" href="Stlc.html#19673" class="InductiveConstructor"
      >var</a
      ><a name="14413"
      > </a
      ><a name="14414" href="StlcProp.html#14414" class="Bound"
      >x</a
      ><a name="14415"
      > </a
      ><a name="14416" href="StlcProp.html#14416" class="Bound"
      >x&#8758;A</a
      ><a name="14419" class="Symbol"
      >)</a
      ><a name="14420"
      > </a
      ><a name="14421" class="Keyword"
      >rewrite</a
      ><a name="14428"
      > </a
      ><a name="14429" href="StlcProp.html#14407" class="Bound"
      >f</a
      ><a name="14430"
      > </a
      ><a name="14431" href="StlcProp.html#7040" class="InductiveConstructor"
      >var</a
      ><a name="14434"
      > </a
      ><a name="14435" class="Symbol"
      >=</a
      ><a name="14436"
      > </a
      ><a name="14437" href="Stlc.html#19673" class="InductiveConstructor"
      >var</a
      ><a name="14440"
      > </a
      ><a name="14441" href="StlcProp.html#14414" class="Bound"
      >x</a
      ><a name="14442"
      > </a
      ><a name="14443" href="StlcProp.html#14416" class="Bound"
      >x&#8758;A</a
      ><a name="14446"
      >
</a
      ><a name="14447" href="StlcProp.html#11968" class="Function"
      >replaceCtxt</a
      ><a name="14458"
      > </a
      ><a name="14459" href="StlcProp.html#14459" class="Bound"
      >f</a
      ><a name="14460"
      > </a
      ><a name="14461" class="Symbol"
      >(</a
      ><a name="14462" href="Stlc.html#19882" class="InductiveConstructor"
      >app</a
      ><a name="14465"
      > </a
      ><a name="14466" href="StlcProp.html#14466" class="Bound"
      >t&#8321;&#8758;A&#8658;B</a
      ><a name="14472"
      > </a
      ><a name="14473" href="StlcProp.html#14473" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="14477" class="Symbol"
      >)</a
      ><a name="14478"
      >
  </a
      ><a name="14481" class="Symbol"
      >=</a
      ><a name="14482"
      > </a
      ><a name="14483" href="Stlc.html#19882" class="InductiveConstructor"
      >app</a
      ><a name="14486"
      > </a
      ><a name="14487" class="Symbol"
      >(</a
      ><a name="14488" href="StlcProp.html#11968" class="Function"
      >replaceCtxt</a
      ><a name="14499"
      > </a
      ><a name="14500" class="Symbol"
      >(</a
      ><a name="14501" href="StlcProp.html#14459" class="Bound"
      >f</a
      ><a name="14502"
      > </a
      ><a name="14503" href="https://agda.github.io/agda-stdlib/Function.html#713" class="Function Operator"
      >&#8728;</a
      ><a name="14504"
      > </a
      ><a name="14505" href="StlcProp.html#7125" class="InductiveConstructor"
      >app1</a
      ><a name="14509" class="Symbol"
      >)</a
      ><a name="14510"
      > </a
      ><a name="14511" href="StlcProp.html#14466" class="Bound"
      >t&#8321;&#8758;A&#8658;B</a
      ><a name="14517" class="Symbol"
      >)</a
      ><a name="14518"
      > </a
      ><a name="14519" class="Symbol"
      >(</a
      ><a name="14520" href="StlcProp.html#11968" class="Function"
      >replaceCtxt</a
      ><a name="14531"
      > </a
      ><a name="14532" class="Symbol"
      >(</a
      ><a name="14533" href="StlcProp.html#14459" class="Bound"
      >f</a
      ><a name="14534"
      > </a
      ><a name="14535" href="https://agda.github.io/agda-stdlib/Function.html#713" class="Function Operator"
      >&#8728;</a
      ><a name="14536"
      > </a
      ><a name="14537" href="StlcProp.html#7179" class="InductiveConstructor"
      >app2</a
      ><a name="14541" class="Symbol"
      >)</a
      ><a name="14542"
      > </a
      ><a name="14543" href="StlcProp.html#14473" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="14547" class="Symbol"
      >)</a
      ><a name="14548"
      >
</a
      ><a name="14549" href="StlcProp.html#11968" class="Function"
      >replaceCtxt</a
      ><a name="14560"
      > </a
      ><a name="14561" class="Symbol"
      >{</a
      ><a name="14562" href="StlcProp.html#14562" class="Bound"
      >&#915;</a
      ><a name="14563" class="Symbol"
      >}</a
      ><a name="14564"
      > </a
      ><a name="14565" class="Symbol"
      >{</a
      ><a name="14566" href="StlcProp.html#14566" class="Bound"
      >&#915;&#8242;</a
      ><a name="14568" class="Symbol"
      >}</a
      ><a name="14569"
      > </a
      ><a name="14570" href="StlcProp.html#14570" class="Bound"
      >f</a
      ><a name="14571"
      > </a
      ><a name="14572" class="Symbol"
      >(</a
      ><a name="14573" href="Stlc.html#19766" class="InductiveConstructor"
      >abs</a
      ><a name="14576"
      > </a
      ><a name="14577" class="Symbol"
      >{</a
      ><a name="14578" class="DottedPattern Symbol"
      >.</a
      ><a name="14579" href="StlcProp.html#14562" class="DottedPattern Bound"
      >&#915;</a
      ><a name="14580" class="Symbol"
      >}</a
      ><a name="14581"
      > </a
      ><a name="14582" class="Symbol"
      >{</a
      ><a name="14583" href="StlcProp.html#14583" class="Bound"
      >x</a
      ><a name="14584" class="Symbol"
      >}</a
      ><a name="14585"
      > </a
      ><a name="14586" class="Symbol"
      >{</a
      ><a name="14587" href="StlcProp.html#14587" class="Bound"
      >A</a
      ><a name="14588" class="Symbol"
      >}</a
      ><a name="14589"
      > </a
      ><a name="14590" class="Symbol"
      >{</a
      ><a name="14591" href="StlcProp.html#14591" class="Bound"
      >B</a
      ><a name="14592" class="Symbol"
      >}</a
      ><a name="14593"
      > </a
      ><a name="14594" class="Symbol"
      >{</a
      ><a name="14595" href="StlcProp.html#14595" class="Bound"
      >t&#8242;</a
      ><a name="14597" class="Symbol"
      >}</a
      ><a name="14598"
      > </a
      ><a name="14599" href="StlcProp.html#14599" class="Bound"
      >t&#8242;&#8758;B</a
      ><a name="14603" class="Symbol"
      >)</a
      ><a name="14604"
      >
  </a
      ><a name="14607" class="Symbol"
      >=</a
      ><a name="14608"
      > </a
      ><a name="14609" href="Stlc.html#19766" class="InductiveConstructor"
      >abs</a
      ><a name="14612"
      > </a
      ><a name="14613" class="Symbol"
      >(</a
      ><a name="14614" href="StlcProp.html#11968" class="Function"
      >replaceCtxt</a
      ><a name="14625"
      > </a
      ><a name="14626" href="StlcProp.html#14647" class="Function"
      >f&#8242;</a
      ><a name="14628"
      > </a
      ><a name="14629" href="StlcProp.html#14599" class="Bound"
      >t&#8242;&#8758;B</a
      ><a name="14633" class="Symbol"
      >)</a
      ><a name="14634"
      >
  </a
      ><a name="14637" class="Keyword"
      >where</a
      ><a name="14642"
      >
    </a
      ><a name="14647" href="StlcProp.html#14647" class="Function"
      >f&#8242;</a
      ><a name="14649"
      > </a
      ><a name="14650" class="Symbol"
      >:</a
      ><a name="14651"
      > </a
      ><a name="14652" class="Symbol"
      >&#8704;</a
      ><a name="14653"
      > </a
      ><a name="14654" class="Symbol"
      >{</a
      ><a name="14655" href="StlcProp.html#14655" class="Bound"
      >y</a
      ><a name="14656" class="Symbol"
      >}</a
      ><a name="14657"
      > </a
      ><a name="14658" class="Symbol"
      >&#8594;</a
      ><a name="14659"
      > </a
      ><a name="14660" href="StlcProp.html#14655" class="Bound"
      >y</a
      ><a name="14661"
      > </a
      ><a name="14662" href="StlcProp.html#7001" class="Datatype Operator"
      >FreeIn</a
      ><a name="14668"
      > </a
      ><a name="14669" href="StlcProp.html#14595" class="Bound"
      >t&#8242;</a
      ><a name="14671"
      > </a
      ><a name="14672" class="Symbol"
      >&#8594;</a
      ><a name="14673"
      > </a
      ><a name="14674" class="Symbol"
      >(</a
      ><a name="14675" href="StlcProp.html#14562" class="Bound"
      >&#915;</a
      ><a name="14676"
      > </a
      ><a name="14677" href="Stlc.html#18686" class="Function Operator"
      >,</a
      ><a name="14678"
      > </a
      ><a name="14679" href="StlcProp.html#14583" class="Bound"
      >x</a
      ><a name="14680"
      > </a
      ><a name="14681" href="Stlc.html#18686" class="Function Operator"
      >&#8758;</a
      ><a name="14682"
      > </a
      ><a name="14683" href="StlcProp.html#14587" class="Bound"
      >A</a
      ><a name="14684" class="Symbol"
      >)</a
      ><a name="14685"
      > </a
      ><a name="14686" href="StlcProp.html#14655" class="Bound"
      >y</a
      ><a name="14687"
      > </a
      ><a name="14688" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="14689"
      > </a
      ><a name="14690" class="Symbol"
      >(</a
      ><a name="14691" href="StlcProp.html#14566" class="Bound"
      >&#915;&#8242;</a
      ><a name="14693"
      > </a
      ><a name="14694" href="Stlc.html#18686" class="Function Operator"
      >,</a
      ><a name="14695"
      > </a
      ><a name="14696" href="StlcProp.html#14583" class="Bound"
      >x</a
      ><a name="14697"
      > </a
      ><a name="14698" href="Stlc.html#18686" class="Function Operator"
      >&#8758;</a
      ><a name="14699"
      > </a
      ><a name="14700" href="StlcProp.html#14587" class="Bound"
      >A</a
      ><a name="14701" class="Symbol"
      >)</a
      ><a name="14702"
      > </a
      ><a name="14703" href="StlcProp.html#14655" class="Bound"
      >y</a
      ><a name="14704"
      >
    </a
      ><a name="14709" href="StlcProp.html#14647" class="Function"
      >f&#8242;</a
      ><a name="14711"
      > </a
      ><a name="14712" class="Symbol"
      >{</a
      ><a name="14713" href="StlcProp.html#14713" class="Bound"
      >y</a
      ><a name="14714" class="Symbol"
      >}</a
      ><a name="14715"
      > </a
      ><a name="14716" href="StlcProp.html#14716" class="Bound"
      >y&#8712;t&#8242;</a
      ><a name="14720"
      > </a
      ><a name="14721" class="Keyword"
      >with</a
      ><a name="14725"
      > </a
      ><a name="14726" href="StlcProp.html#14583" class="Bound"
      >x</a
      ><a name="14727"
      > </a
      ><a name="14728" href="Stlc.html#5853" class="Function Operator"
      >&#8799;</a
      ><a name="14729"
      > </a
      ><a name="14730" href="StlcProp.html#14713" class="Bound"
      >y</a
      ><a name="14731"
      >
    </a
      ><a name="14736" class="Symbol"
      >...</a
      ><a name="14739"
      > </a
      ><a name="14740" class="Symbol"
      >|</a
      ><a name="14741"
      > </a
      ><a name="14742" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="14745"
      > </a
      ><a name="14746" class="Symbol"
      >_</a
      ><a name="14747"
      >   </a
      ><a name="14750" class="Symbol"
      >=</a
      ><a name="14751"
      > </a
      ><a name="14752" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="14756"
      >
    </a
      ><a name="14761" class="Symbol"
      >...</a
      ><a name="14764"
      > </a
      ><a name="14765" class="Symbol"
      >|</a
      ><a name="14766"
      > </a
      ><a name="14767" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="14769"
      >  </a
      ><a name="14771" href="StlcProp.html#14771" class="Bound"
      >x&#8800;y</a
      ><a name="14774"
      > </a
      ><a name="14775" class="Symbol"
      >=</a
      ><a name="14776"
      > </a
      ><a name="14777" href="StlcProp.html#14570" class="Bound"
      >f</a
      ><a name="14778"
      > </a
      ><a name="14779" class="Symbol"
      >(</a
      ><a name="14780" href="StlcProp.html#7064" class="InductiveConstructor"
      >abs</a
      ><a name="14783"
      > </a
      ><a name="14784" href="StlcProp.html#14771" class="Bound"
      >x&#8800;y</a
      ><a name="14787"
      > </a
      ><a name="14788" href="StlcProp.html#14716" class="Bound"
      >y&#8712;t&#8242;</a
      ><a name="14792" class="Symbol"
      >)</a
      ><a name="14793"
      >
</a
      ><a name="14794" href="StlcProp.html#11968" class="Function"
      >replaceCtxt</a
      ><a name="14805"
      > </a
      ><a name="14806" class="Symbol"
      >_</a
      ><a name="14807"
      > </a
      ><a name="14808" href="Stlc.html#20016" class="InductiveConstructor"
      >true</a
      ><a name="14812"
      >  </a
      ><a name="14814" class="Symbol"
      >=</a
      ><a name="14815"
      > </a
      ><a name="14816" href="Stlc.html#20016" class="InductiveConstructor"
      >true</a
      ><a name="14820"
      >
</a
      ><a name="14821" href="StlcProp.html#11968" class="Function"
      >replaceCtxt</a
      ><a name="14832"
      > </a
      ><a name="14833" class="Symbol"
      >_</a
      ><a name="14834"
      > </a
      ><a name="14835" href="Stlc.html#20075" class="InductiveConstructor"
      >false</a
      ><a name="14840"
      > </a
      ><a name="14841" class="Symbol"
      >=</a
      ><a name="14842"
      > </a
      ><a name="14843" href="Stlc.html#20075" class="InductiveConstructor"
      >false</a
      ><a name="14848"
      >
</a
      ><a name="14849" href="StlcProp.html#11968" class="Function"
      >replaceCtxt</a
      ><a name="14860"
      > </a
      ><a name="14861" href="StlcProp.html#14861" class="Bound"
      >f</a
      ><a name="14862"
      > </a
      ><a name="14863" class="Symbol"
      >(</a
      ><a name="14864" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >if</a
      ><a name="14866"
      > </a
      ><a name="14867" href="StlcProp.html#14867" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="14874"
      > </a
      ><a name="14875" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >then</a
      ><a name="14879"
      > </a
      ><a name="14880" href="StlcProp.html#14880" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="14884"
      > </a
      ><a name="14885" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >else</a
      ><a name="14889"
      > </a
      ><a name="14890" href="StlcProp.html#14890" class="Bound"
      >t&#8323;&#8758;A</a
      ><a name="14894" class="Symbol"
      >)</a
      ><a name="14895"
      >
  </a
      ><a name="14898" class="Symbol"
      >=</a
      ><a name="14899"
      > </a
      ><a name="14900" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >if</a
      ><a name="14902"
      >   </a
      ><a name="14905" href="StlcProp.html#11968" class="Function"
      >replaceCtxt</a
      ><a name="14916"
      > </a
      ><a name="14917" class="Symbol"
      >(</a
      ><a name="14918" href="StlcProp.html#14861" class="Bound"
      >f</a
      ><a name="14919"
      > </a
      ><a name="14920" href="https://agda.github.io/agda-stdlib/Function.html#713" class="Function Operator"
      >&#8728;</a
      ><a name="14921"
      > </a
      ><a name="14922" href="StlcProp.html#7233" class="InductiveConstructor"
      >if1</a
      ><a name="14925" class="Symbol"
      >)</a
      ><a name="14926"
      > </a
      ><a name="14927" href="StlcProp.html#14867" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="14934"
      >
    </a
      ><a name="14939" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >then</a
      ><a name="14943"
      > </a
      ><a name="14944" href="StlcProp.html#11968" class="Function"
      >replaceCtxt</a
      ><a name="14955"
      > </a
      ><a name="14956" class="Symbol"
      >(</a
      ><a name="14957" href="StlcProp.html#14861" class="Bound"
      >f</a
      ><a name="14958"
      > </a
      ><a name="14959" href="https://agda.github.io/agda-stdlib/Function.html#713" class="Function Operator"
      >&#8728;</a
      ><a name="14960"
      > </a
      ><a name="14961" href="StlcProp.html#7304" class="InductiveConstructor"
      >if2</a
      ><a name="14964" class="Symbol"
      >)</a
      ><a name="14965"
      > </a
      ><a name="14966" href="StlcProp.html#14880" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="14970"
      >
    </a
      ><a name="14975" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >else</a
      ><a name="14979"
      > </a
      ><a name="14980" href="StlcProp.html#11968" class="Function"
      >replaceCtxt</a
      ><a name="14991"
      > </a
      ><a name="14992" class="Symbol"
      >(</a
      ><a name="14993" href="StlcProp.html#14861" class="Bound"
      >f</a
      ><a name="14994"
      > </a
      ><a name="14995" href="https://agda.github.io/agda-stdlib/Function.html#713" class="Function Operator"
      >&#8728;</a
      ><a name="14996"
      > </a
      ><a name="14997" href="StlcProp.html#7375" class="InductiveConstructor"
      >if3</a
      ><a name="15000" class="Symbol"
      >)</a
      ><a name="15001"
      > </a
      ><a name="15002" href="StlcProp.html#14890" class="Bound"
      >t&#8323;&#8758;A</a
      >
{% endraw %}</pre>

Now we come to the conceptual heart of the proof that reduction
preserves types -- namely, the observation that _substitution_
preserves types.

Formally, the so-called _Substitution Lemma_ says this: Suppose we
have a term $$t$$ with a free variable $$x$$, and suppose we've been
able to assign a type $$T$$ to $$t$$ under the assumption that $$x$$ has
some type $$U$$.  Also, suppose that we have some other term $$v$$ and
that we've shown that $$v$$ has type $$U$$.  Then, since $$v$$ satisfies
the assumption we made about $$x$$ when typing $$t$$, we should be
able to substitute $$v$$ for each of the occurrences of $$x$$ in $$t$$
and obtain a new term that still has type $$T$$.

_Lemma_: If $$\Gamma,x:U \vdash t : T$$ and $$\vdash v : U$$, then
$$\Gamma \vdash [x:=v]t : T$$.

<pre class="Agda">{% raw %}
<a name="15817" href="StlcProp.html#15817" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="15833"
      > </a
      ><a name="15834" class="Symbol"
      >:</a
      ><a name="15835"
      > </a
      ><a name="15836" class="Symbol"
      >&#8704;</a
      ><a name="15837"
      > </a
      ><a name="15838" class="Symbol"
      >{</a
      ><a name="15839" href="StlcProp.html#15839" class="Bound"
      >&#915;</a
      ><a name="15840"
      > </a
      ><a name="15841" href="StlcProp.html#15841" class="Bound"
      >x</a
      ><a name="15842"
      > </a
      ><a name="15843" href="StlcProp.html#15843" class="Bound"
      >A</a
      ><a name="15844"
      > </a
      ><a name="15845" href="StlcProp.html#15845" class="Bound"
      >t</a
      ><a name="15846"
      > </a
      ><a name="15847" href="StlcProp.html#15847" class="Bound"
      >v</a
      ><a name="15848"
      > </a
      ><a name="15849" href="StlcProp.html#15849" class="Bound"
      >B</a
      ><a name="15850" class="Symbol"
      >}</a
      ><a name="15851"
      >
                 </a
      ><a name="15869" class="Symbol"
      >&#8594;</a
      ><a name="15870"
      > </a
      ><a name="15871" href="Stlc.html#18658" class="Function"
      >&#8709;</a
      ><a name="15872"
      > </a
      ><a name="15873" href="Stlc.html#19629" class="Datatype Operator"
      >&#8866;</a
      ><a name="15874"
      > </a
      ><a name="15875" href="StlcProp.html#15847" class="Bound"
      >v</a
      ><a name="15876"
      > </a
      ><a name="15877" href="Stlc.html#19629" class="Datatype Operator"
      >&#8758;</a
      ><a name="15878"
      > </a
      ><a name="15879" href="StlcProp.html#15843" class="Bound"
      >A</a
      ><a name="15880"
      >
                 </a
      ><a name="15898" class="Symbol"
      >&#8594;</a
      ><a name="15899"
      > </a
      ><a name="15900" href="StlcProp.html#15839" class="Bound"
      >&#915;</a
      ><a name="15901"
      > </a
      ><a name="15902" href="Stlc.html#18686" class="Function Operator"
      >,</a
      ><a name="15903"
      > </a
      ><a name="15904" href="StlcProp.html#15841" class="Bound"
      >x</a
      ><a name="15905"
      > </a
      ><a name="15906" href="Stlc.html#18686" class="Function Operator"
      >&#8758;</a
      ><a name="15907"
      > </a
      ><a name="15908" href="StlcProp.html#15843" class="Bound"
      >A</a
      ><a name="15909"
      > </a
      ><a name="15910" href="Stlc.html#19629" class="Datatype Operator"
      >&#8866;</a
      ><a name="15911"
      > </a
      ><a name="15912" href="StlcProp.html#15845" class="Bound"
      >t</a
      ><a name="15913"
      > </a
      ><a name="15914" href="Stlc.html#19629" class="Datatype Operator"
      >&#8758;</a
      ><a name="15915"
      > </a
      ><a name="15916" href="StlcProp.html#15849" class="Bound"
      >B</a
      ><a name="15917"
      >
                 </a
      ><a name="15935" class="Symbol"
      >&#8594;</a
      ><a name="15936"
      > </a
      ><a name="15937" href="StlcProp.html#15839" class="Bound"
      >&#915;</a
      ><a name="15938"
      > </a
      ><a name="15939" href="Stlc.html#18686" class="Function Operator"
      >,</a
      ><a name="15940"
      > </a
      ><a name="15941" href="StlcProp.html#15841" class="Bound"
      >x</a
      ><a name="15942"
      > </a
      ><a name="15943" href="Stlc.html#18686" class="Function Operator"
      >&#8758;</a
      ><a name="15944"
      > </a
      ><a name="15945" href="StlcProp.html#15843" class="Bound"
      >A</a
      ><a name="15946"
      > </a
      ><a name="15947" href="Stlc.html#19629" class="Datatype Operator"
      >&#8866;</a
      ><a name="15948"
      > </a
      ><a name="15949" href="Stlc.html#12659" class="Function Operator"
      >[</a
      ><a name="15950"
      > </a
      ><a name="15951" href="StlcProp.html#15841" class="Bound"
      >x</a
      ><a name="15952"
      > </a
      ><a name="15953" href="Stlc.html#12659" class="Function Operator"
      >:=</a
      ><a name="15955"
      > </a
      ><a name="15956" href="StlcProp.html#15847" class="Bound"
      >v</a
      ><a name="15957"
      > </a
      ><a name="15958" href="Stlc.html#12659" class="Function Operator"
      >]</a
      ><a name="15959"
      > </a
      ><a name="15960" href="StlcProp.html#15845" class="Bound"
      >t</a
      ><a name="15961"
      > </a
      ><a name="15962" href="Stlc.html#19629" class="Datatype Operator"
      >&#8758;</a
      ><a name="15963"
      > </a
      ><a name="15964" href="StlcProp.html#15849" class="Bound"
      >B</a
      >
{% endraw %}</pre>

One technical subtlety in the statement of the lemma is that
we assign $$v$$ the type $$U$$ in the _empty_ context -- in other
words, we assume $$v$$ is closed.  This assumption considerably
simplifies the $$abs$$ case of the proof (compared to assuming
$$\Gamma \vdash v : U$$, which would be the other reasonable assumption
at this point) because the context invariance lemma then tells us
that $$v$$ has type $$U$$ in any context at all -- we don't have to
worry about free variables in $$v$$ clashing with the variable being
introduced into the context by $$abs$$.

The substitution lemma can be viewed as a kind of "commutation"
property.  Intuitively, it says that substitution and typing can
be done in either order: we can either assign types to the terms
$$t$$ and $$v$$ separately (under suitable contexts) and then combine
them using substitution, or we can substitute first and then
assign a type to $$ $$x:=v$$ t $$ -- the result is the same either
way.

_Proof_: We show, by induction on $$t$$, that for all $$T$$ and
$$\Gamma$$, if $$\Gamma,x:U \vdash t : T$$ and $$\vdash v : U$$, then $$\Gamma
\vdash $$x:=v$$t : T$$.

  - If $$t$$ is a variable there are two cases to consider,
    depending on whether $$t$$ is $$x$$ or some other variable.

      - If $$t = x$$, then from the fact that $$\Gamma, x:U \vdash x :
        T$$ we conclude that $$U = T$$.  We must show that $$$$x:=v$$x =
        v$$ has type $$T$$ under $$\Gamma$$, given the assumption that
        $$v$$ has type $$U = T$$ under the empty context.  This
        follows from context invariance: if a closed term has type
        $$T$$ in the empty context, it has that type in any context.

      - If $$t$$ is some variable $$y$$ that is not equal to $$x$$, then
        we need only note that $$y$$ has the same type under $$\Gamma,
        x:U$$ as under $$\Gamma$$.

  - If $$t$$ is an abstraction $$\lambda y:T_11. t_12$$, then the IH tells us,
    for all $$\Gamma'$$ and $$T'$$, that if $$\Gamma',x:U \vdash t_12 : T'$$
    and $$\vdash v : U$$, then $$\Gamma' \vdash $$x:=v$$t_12 : T'$$.

    The substitution in the conclusion behaves differently
    depending on whether $$x$$ and $$y$$ are the same variable.

    First, suppose $$x = y$$.  Then, by the definition of
    substitution, $$[x:=v]t = t$$, so we just need to show $$\Gamma \vdash
    t : T$$.  But we know $$\Gamma,x:U \vdash t : T$$, and, since $$y$$
    does not appear free in $$\lambda y:T_11. t_12$$, the context invariance
    lemma yields $$\Gamma \vdash t : T$$.

    Second, suppose $$x <> y$$.  We know $$\Gamma,x:U,y:T_11 \vdash t_12 :
    T_12$$ by inversion of the typing relation, from which
    $$\Gamma,y:T_11,x:U \vdash t_12 : T_12$$ follows by the context
    invariance lemma, so the IH applies, giving us $$\Gamma,y:T_11 \vdash
    $$x:=v$$t_12 : T_12$$.  By $$abs$$, $$\Gamma \vdash \lambda y:T_11. $$x:=v$$t_12
    : T_11→T_12$$, and by the definition of substitution (noting
    that $$x <> y$$), $$\Gamma \vdash \lambda y:T_11. $$x:=v$$t_12 : T_11→T_12$$ as
    required.

  - If $$t$$ is an application $$t_1 t_2$$, the result follows
    straightforwardly from the definition of substitution and the
    induction hypotheses.

  - The remaining cases are similar to the application case.

One more technical note: This proof is a rare case where an
induction on terms, rather than typing derivations, yields a
simpler argument.  The reason for this is that the assumption
$$update Gamma x U \vdash t : T$$ is not completely generic, in the
sense that one of the "slots" in the typing relation -- namely the
context -- is not just a variable, and this means that Agda's
native induction tactic does not give us the induction hypothesis
that we want.  It is possible to work around this, but the needed
generalization is a little tricky.  The term $$t$$, on the other
hand, _is_ completely generic.

<pre class="Agda">{% raw %}
<a name="19875" href="StlcProp.html#15817" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="19891"
      > </a
      ><a name="19892" class="Symbol"
      >{</a
      ><a name="19893" href="StlcProp.html#19893" class="Bound"
      >&#915;</a
      ><a name="19894" class="Symbol"
      >}</a
      ><a name="19895"
      > </a
      ><a name="19896" class="Symbol"
      >{</a
      ><a name="19897" href="StlcProp.html#19897" class="Bound"
      >x</a
      ><a name="19898" class="Symbol"
      >}</a
      ><a name="19899"
      > </a
      ><a name="19900" href="StlcProp.html#19900" class="Bound"
      >v&#8758;A</a
      ><a name="19903"
      > </a
      ><a name="19904" class="Symbol"
      >(</a
      ><a name="19905" href="Stlc.html#19673" class="InductiveConstructor"
      >var</a
      ><a name="19908"
      > </a
      ><a name="19909" href="StlcProp.html#19909" class="Bound"
      >y</a
      ><a name="19910"
      > </a
      ><a name="19911" href="StlcProp.html#19911" class="Bound"
      >y&#8712;&#915;</a
      ><a name="19914" class="Symbol"
      >)</a
      ><a name="19915"
      > </a
      ><a name="19916" class="Keyword"
      >with</a
      ><a name="19920"
      > </a
      ><a name="19921" href="StlcProp.html#19897" class="Bound"
      >x</a
      ><a name="19922"
      > </a
      ><a name="19923" href="Stlc.html#5853" class="Function Operator"
      >&#8799;</a
      ><a name="19924"
      > </a
      ><a name="19925" href="StlcProp.html#19909" class="Bound"
      >y</a
      ><a name="19926"
      >
</a
      ><a name="19927" class="Symbol"
      >...</a
      ><a name="19930"
      > </a
      ><a name="19931" class="Symbol"
      >|</a
      ><a name="19932"
      > </a
      ><a name="19933" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="19936"
      > </a
      ><a name="19937" href="StlcProp.html#19937" class="Bound"
      >x=y</a
      ><a name="19940"
      > </a
      ><a name="19941" class="Symbol"
      >=</a
      ><a name="19942"
      > </a
      ><a name="19943" class="Symbol"
      >{!!}</a
      ><a name="19947"
      >
</a
      ><a name="19948" class="Symbol"
      >...</a
      ><a name="19951"
      > </a
      ><a name="19952" class="Symbol"
      >|</a
      ><a name="19953"
      > </a
      ><a name="19954" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="19956"
      >  </a
      ><a name="19958" href="StlcProp.html#19958" class="Bound"
      >x&#8800;y</a
      ><a name="19961"
      > </a
      ><a name="19962" class="Symbol"
      >=</a
      ><a name="19963"
      > </a
      ><a name="19964" class="Symbol"
      >{!!}</a
      ><a name="19968"
      >
</a
      ><a name="19969" href="StlcProp.html#15817" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="19985"
      > </a
      ><a name="19986" href="StlcProp.html#19986" class="Bound"
      >v&#8758;A</a
      ><a name="19989"
      > </a
      ><a name="19990" class="Symbol"
      >(</a
      ><a name="19991" href="Stlc.html#19766" class="InductiveConstructor"
      >abs</a
      ><a name="19994"
      > </a
      ><a name="19995" href="StlcProp.html#19995" class="Bound"
      >t&#8242;&#8758;B</a
      ><a name="19999" class="Symbol"
      >)</a
      ><a name="20000"
      > </a
      ><a name="20001" class="Symbol"
      >=</a
      ><a name="20002"
      > </a
      ><a name="20003" class="Symbol"
      >{!!}</a
      ><a name="20007"
      >
</a
      ><a name="20008" href="StlcProp.html#15817" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="20024"
      > </a
      ><a name="20025" href="StlcProp.html#20025" class="Bound"
      >v&#8758;A</a
      ><a name="20028"
      > </a
      ><a name="20029" class="Symbol"
      >(</a
      ><a name="20030" href="Stlc.html#19882" class="InductiveConstructor"
      >app</a
      ><a name="20033"
      > </a
      ><a name="20034" href="StlcProp.html#20034" class="Bound"
      >t&#8321;&#8758;A&#8658;B</a
      ><a name="20040"
      > </a
      ><a name="20041" href="StlcProp.html#20041" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="20045" class="Symbol"
      >)</a
      ><a name="20046"
      > </a
      ><a name="20047" class="Symbol"
      >=</a
      ><a name="20048"
      >
  </a
      ><a name="20051" href="Stlc.html#19882" class="InductiveConstructor"
      >app</a
      ><a name="20054"
      > </a
      ><a name="20055" class="Symbol"
      >(</a
      ><a name="20056" href="StlcProp.html#15817" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="20072"
      > </a
      ><a name="20073" href="StlcProp.html#20025" class="Bound"
      >v&#8758;A</a
      ><a name="20076"
      > </a
      ><a name="20077" href="StlcProp.html#20034" class="Bound"
      >t&#8321;&#8758;A&#8658;B</a
      ><a name="20083" class="Symbol"
      >)</a
      ><a name="20084"
      > </a
      ><a name="20085" class="Symbol"
      >(</a
      ><a name="20086" href="StlcProp.html#15817" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="20102"
      > </a
      ><a name="20103" href="StlcProp.html#20025" class="Bound"
      >v&#8758;A</a
      ><a name="20106"
      > </a
      ><a name="20107" href="StlcProp.html#20041" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="20111" class="Symbol"
      >)</a
      ><a name="20112"
      >
</a
      ><a name="20113" href="StlcProp.html#15817" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="20129"
      > </a
      ><a name="20130" href="StlcProp.html#20130" class="Bound"
      >v&#8758;A</a
      ><a name="20133"
      > </a
      ><a name="20134" href="Stlc.html#20016" class="InductiveConstructor"
      >true</a
      ><a name="20138"
      >  </a
      ><a name="20140" class="Symbol"
      >=</a
      ><a name="20141"
      > </a
      ><a name="20142" href="Stlc.html#20016" class="InductiveConstructor"
      >true</a
      ><a name="20146"
      >
</a
      ><a name="20147" href="StlcProp.html#15817" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="20163"
      > </a
      ><a name="20164" href="StlcProp.html#20164" class="Bound"
      >v&#8758;A</a
      ><a name="20167"
      > </a
      ><a name="20168" href="Stlc.html#20075" class="InductiveConstructor"
      >false</a
      ><a name="20173"
      > </a
      ><a name="20174" class="Symbol"
      >=</a
      ><a name="20175"
      > </a
      ><a name="20176" href="Stlc.html#20075" class="InductiveConstructor"
      >false</a
      ><a name="20181"
      >
</a
      ><a name="20182" href="StlcProp.html#15817" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="20198"
      > </a
      ><a name="20199" href="StlcProp.html#20199" class="Bound"
      >v&#8758;A</a
      ><a name="20202"
      > </a
      ><a name="20203" class="Symbol"
      >(</a
      ><a name="20204" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >if</a
      ><a name="20206"
      > </a
      ><a name="20207" href="StlcProp.html#20207" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="20214"
      > </a
      ><a name="20215" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >then</a
      ><a name="20219"
      > </a
      ><a name="20220" href="StlcProp.html#20220" class="Bound"
      >t&#8322;&#8758;B</a
      ><a name="20224"
      > </a
      ><a name="20225" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >else</a
      ><a name="20229"
      > </a
      ><a name="20230" href="StlcProp.html#20230" class="Bound"
      >t&#8323;&#8758;B&#8323;</a
      ><a name="20235" class="Symbol"
      >)</a
      ><a name="20236"
      > </a
      ><a name="20237" class="Symbol"
      >=</a
      ><a name="20238"
      >
  </a
      ><a name="20241" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >if</a
      ><a name="20243"
      >   </a
      ><a name="20246" href="StlcProp.html#15817" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="20262"
      > </a
      ><a name="20263" href="StlcProp.html#20199" class="Bound"
      >v&#8758;A</a
      ><a name="20266"
      > </a
      ><a name="20267" href="StlcProp.html#20207" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="20274"
      >
  </a
      ><a name="20277" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >then</a
      ><a name="20281"
      > </a
      ><a name="20282" href="StlcProp.html#15817" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="20298"
      > </a
      ><a name="20299" href="StlcProp.html#20199" class="Bound"
      >v&#8758;A</a
      ><a name="20302"
      > </a
      ><a name="20303" href="StlcProp.html#20220" class="Bound"
      >t&#8322;&#8758;B</a
      ><a name="20307"
      >
  </a
      ><a name="20310" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >else</a
      ><a name="20314"
      > </a
      ><a name="20315" href="StlcProp.html#15817" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="20331"
      > </a
      ><a name="20332" href="StlcProp.html#20199" class="Bound"
      >v&#8758;A</a
      ><a name="20335"
      > </a
      ><a name="20336" href="StlcProp.html#20230" class="Bound"
      >t&#8323;&#8758;B&#8323;</a
      >
{% endraw %}</pre>


### Main Theorem

We now have the tools we need to prove preservation: if a closed
term $$t$$ has type $$T$$ and takes a step to $$t'$$, then $$t'$$
is also a closed term with type $$T$$.  In other words, the small-step
reduction relation preserves types.

Theorem preservation : forall t t' T,
     empty \vdash t : T  →
     t ==> t'  →
     empty \vdash t' : T.

_Proof_: By induction on the derivation of $$\vdash t : T$$.

- We can immediately rule out $$var$$, $$abs$$, $$T_True$$, and
  $$T_False$$ as the final rules in the derivation, since in each of
  these cases $$t$$ cannot take a step.

- If the last rule in the derivation was $$app$$, then $$t = t_1
  t_2$$.  There are three cases to consider, one for each rule that
  could have been used to show that $$t_1 t_2$$ takes a step to $$t'$$.

    - If $$t_1 t_2$$ takes a step by $$Sapp1$$, with $$t_1$$ stepping to
      $$t_1'$$, then by the IH $$t_1'$$ has the same type as $$t_1$$, and
      hence $$t_1' t_2$$ has the same type as $$t_1 t_2$$.

    - The $$Sapp2$$ case is similar.

    - If $$t_1 t_2$$ takes a step by $$Sred$$, then $$t_1 =
      \lambda x:T_11.t_12$$ and $$t_1 t_2$$ steps to $$$$x:=t_2$$t_12$$; the
      desired result now follows from the fact that substitution
      preserves types.

    - If the last rule in the derivation was $$if$$, then $$t = if t_1
      then t_2 else t_3$$, and there are again three cases depending on
      how $$t$$ steps.

    - If $$t$$ steps to $$t_2$$ or $$t_3$$, the result is immediate, since
      $$t_2$$ and $$t_3$$ have the same type as $$t$$.

    - Otherwise, $$t$$ steps by $$Sif$$, and the desired conclusion
      follows directly from the induction hypothesis.

Proof with eauto.
  remember (@empty ty) as Gamma.
  intros t t' T HT. generalize dependent t'.
  induction HT;
       intros t' HE; subst Gamma; subst;
       try solve $$inversion HE; subst; auto$$.
  - (* app
    inversion HE; subst...
    (* Most of the cases are immediate by induction,
       and $$eauto$$ takes care of them
    + (* Sred
      apply substitution_preserves_typing with T_11...
      inversion HT_1...
Qed.

#### Exercise: 2 stars, recommended (subject_expansion_stlc)
An exercise in the $$Stlc$$$$sf/Stlc.html$$ chapter asked about the subject
expansion property for the simple language of arithmetic and
boolean expressions.  Does this property hold for STLC?  That is,
is it always the case that, if $$t ==> t'$$ and $$has_type t' T$$,
then $$empty \vdash t : T$$?  If so, prove it.  If not, give a
counter-example not involving conditionals.

(* FILL IN HERE

## Type Soundness

#### Exercise: 2 stars, optional (type_soundness)
Put progress and preservation together and show that a well-typed
term can _never_ reach a stuck state.

Definition stuck (t:tm) : Prop :=
  (normal_form step) t /\ ~ value t.

Corollary soundness : forall t t' T,
  empty \vdash t : T →
  t ==>* t' →
  ~(stuck t').
Proof.
  intros t t' T Hhas_type Hmulti. unfold stuck.
  intros $$Hnf Hnot_val$$. unfold normal_form in Hnf.
  induction Hmulti.
  (* FILL IN HERE  Admitted.
(** $$$$


## Uniqueness of Types

#### Exercise: 3 stars (types_unique)
Another nice property of the STLC is that types are unique: a
given term (in a given context) has at most one type.
Formalize this statement and prove it.

(* FILL IN HERE
(** $$$$


## Additional Exercises

#### Exercise: 1 star (progress_preservation_statement)
Without peeking at their statements above, write down the progress
and preservation theorems for the simply typed lambda-calculus.
$$$$

#### Exercise: 2 stars (stlc_variation1)
Suppose we add a new term $$zap$$ with the following reduction rule

                     ---------                  (ST_Zap)
                     t ==> zap

and the following typing rule:

                  ----------------               (T_Zap)
                  Gamma \vdash zap : T

Which of the following properties of the STLC remain true in
the presence of these rules?  For each property, write either
"remains true" or "becomes false." If a property becomes
false, give a counterexample.

  - Determinism of $$step$$

  - Progress

  - Preservation


#### Exercise: 2 stars (stlc_variation2)
Suppose instead that we add a new term $$foo$$ with the following
reduction rules:

                   -----------------                (ST_Foo1)
                   (\lambda x:A. x) ==> foo

                     ------------                   (ST_Foo2)
                     foo ==> true

Which of the following properties of the STLC remain true in
the presence of this rule?  For each one, write either
"remains true" or else "becomes false." If a property becomes
false, give a counterexample.

  - Determinism of $$step$$

  - Progress

  - Preservation

#### Exercise: 2 stars (stlc_variation3)
Suppose instead that we remove the rule $$Sapp1$$ from the $$step$$
relation. Which of the following properties of the STLC remain
true in the presence of this rule?  For each one, write either
"remains true" or else "becomes false." If a property becomes
false, give a counterexample.

  - Determinism of $$step$$

  - Progress

  - Preservation

#### Exercise: 2 stars, optional (stlc_variation4)
Suppose instead that we add the following new rule to the
reduction relation:

        ----------------------------------        (ST_FunnyIfTrue)
        (if true then t_1 else t_2) ==> true

Which of the following properties of the STLC remain true in
the presence of this rule?  For each one, write either
"remains true" or else "becomes false." If a property becomes
false, give a counterexample.

  - Determinism of $$step$$

  - Progress

  - Preservation



#### Exercise: 2 stars, optional (stlc_variation5)
Suppose instead that we add the following new rule to the typing
relation:

             Gamma \vdash t_1 : bool→bool→bool
                 Gamma \vdash t_2 : bool
             ------------------------------          (T_FunnyApp)
                Gamma \vdash t_1 t_2 : bool

Which of the following properties of the STLC remain true in
the presence of this rule?  For each one, write either
"remains true" or else "becomes false." If a property becomes
false, give a counterexample.

  - Determinism of $$step$$

  - Progress

  - Preservation



#### Exercise: 2 stars, optional (stlc_variation6)
Suppose instead that we add the following new rule to the typing
relation:

                 Gamma \vdash t_1 : bool
                 Gamma \vdash t_2 : bool
                ---------------------               (T_FunnyApp')
                Gamma \vdash t_1 t_2 : bool

Which of the following properties of the STLC remain true in
the presence of this rule?  For each one, write either
"remains true" or else "becomes false." If a property becomes
false, give a counterexample.

  - Determinism of $$step$$

  - Progress

  - Preservation



#### Exercise: 2 stars, optional (stlc_variation7)
Suppose we add the following new rule to the typing relation
of the STLC:

                     ------------------- (T_FunnyAbs)
                     \vdash \lambda x:bool.t : bool

Which of the following properties of the STLC remain true in
the presence of this rule?  For each one, write either
"remains true" or else "becomes false." If a property becomes
false, give a counterexample.

  - Determinism of $$step$$

  - Progress

  - Preservation


### Exercise: STLC with Arithmetic

To see how the STLC might function as the core of a real
programming language, let's extend it with a concrete base
type of numbers and some constants and primitive
operators.

To types, we add a base type of natural numbers (and remove
booleans, for brevity).

Inductive ty : Type :=
  | TArrow : ty → ty → ty
  | TNat   : ty.

To terms, we add natural number constants, along with
successor, predecessor, multiplication, and zero-testing.

Inductive tm : Type :=
  | tvar : id → tm
  | tapp : tm → tm → tm
  | tabs : id → ty → tm → tm
  | tnat  : nat → tm
  | tsucc : tm → tm
  | tpred : tm → tm
  | tmult : tm → tm → tm
  | tif0  : tm → tm → tm → tm.

#### Exercise: 4 stars (stlc_arith)
Finish formalizing the definition and properties of the STLC extended
with arithmetic.  Specifically:

  - Copy the whole development of STLC that we went through above (from
    the definition of values through the Type Soundness theorem), and
    paste it into the file at this point.

  - Extend the definitions of the $$subst$$ operation and the $$step$$
     relation to include appropriate clauses for the arithmetic operators.

  - Extend the proofs of all the properties (up to $$soundness$$) of
    the original STLC to deal with the new syntactic forms.  Make
    sure Agda accepts the whole file.
