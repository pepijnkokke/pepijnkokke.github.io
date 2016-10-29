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
</div>

<pre class="Agda">{% raw %}
<a name="624" class="Keyword"
      >module</a
      ><a name="630"
      > </a
      ><a name="631" href="StlcProp.html#1" class="Module"
      >StlcProp</a
      ><a name="639"
      > </a
      ><a name="640" class="Keyword"
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
<a name="1220" href="StlcProp.html#1220" class="Function"
      >CanonicalForms</a
      ><a name="1234"
      > </a
      ><a name="1235" class="Symbol"
      >:</a
      ><a name="1236"
      > </a
      ><a name="1237" href="Stlc.html#6114" class="Datatype"
      >Term</a
      ><a name="1241"
      > </a
      ><a name="1242" class="Symbol"
      >&#8594;</a
      ><a name="1243"
      > </a
      ><a name="1244" href="Stlc.html#5611" class="Datatype"
      >Type</a
      ><a name="1248"
      > </a
      ><a name="1249" class="Symbol"
      >&#8594;</a
      ><a name="1250"
      > </a
      ><a name="1251" class="PrimitiveType"
      >Set</a
      ><a name="1254"
      >
</a
      ><a name="1255" href="StlcProp.html#1220" class="Function"
      >CanonicalForms</a
      ><a name="1269"
      > </a
      ><a name="1270" href="StlcProp.html#1270" class="Bound"
      >t</a
      ><a name="1271"
      > </a
      ><a name="1272" href="Stlc.html#5630" class="InductiveConstructor"
      >bool</a
      ><a name="1276"
      >    </a
      ><a name="1280" class="Symbol"
      >=</a
      ><a name="1281"
      > </a
      ><a name="1282" href="StlcProp.html#1270" class="Bound"
      >t</a
      ><a name="1283"
      > </a
      ><a name="1284" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="1285"
      > </a
      ><a name="1286" href="Stlc.html#6216" class="InductiveConstructor"
      >true</a
      ><a name="1290"
      > </a
      ><a name="1291" href="https://agda.github.io/agda-stdlib/Data.Sum.html#433" class="Datatype Operator"
      >&#8846;</a
      ><a name="1292"
      > </a
      ><a name="1293" href="StlcProp.html#1270" class="Bound"
      >t</a
      ><a name="1294"
      > </a
      ><a name="1295" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="1296"
      > </a
      ><a name="1297" href="Stlc.html#6231" class="InductiveConstructor"
      >false</a
      ><a name="1302"
      >
</a
      ><a name="1303" href="StlcProp.html#1220" class="Function"
      >CanonicalForms</a
      ><a name="1317"
      > </a
      ><a name="1318" href="StlcProp.html#1318" class="Bound"
      >t</a
      ><a name="1319"
      > </a
      ><a name="1320" class="Symbol"
      >(</a
      ><a name="1321" href="StlcProp.html#1321" class="Bound"
      >A</a
      ><a name="1322"
      > </a
      ><a name="1323" href="Stlc.html#5644" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="1324"
      > </a
      ><a name="1325" href="StlcProp.html#1325" class="Bound"
      >B</a
      ><a name="1326" class="Symbol"
      >)</a
      ><a name="1327"
      > </a
      ><a name="1328" class="Symbol"
      >=</a
      ><a name="1329"
      > </a
      ><a name="1330" href="https://agda.github.io/agda-stdlib/Data.Product.html#949" class="Function"
      >&#8707;&#8322;</a
      ><a name="1332"
      > </a
      ><a name="1333" class="Symbol"
      >&#955;</a
      ><a name="1334"
      > </a
      ><a name="1335" href="StlcProp.html#1335" class="Bound"
      >x</a
      ><a name="1336"
      > </a
      ><a name="1337" href="StlcProp.html#1337" class="Bound"
      >t&#8242;</a
      ><a name="1339"
      > </a
      ><a name="1340" class="Symbol"
      >&#8594;</a
      ><a name="1341"
      > </a
      ><a name="1342" href="StlcProp.html#1318" class="Bound"
      >t</a
      ><a name="1343"
      > </a
      ><a name="1344" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="1345"
      > </a
      ><a name="1346" href="Stlc.html#6182" class="InductiveConstructor"
      >abs</a
      ><a name="1349"
      > </a
      ><a name="1350" href="StlcProp.html#1335" class="Bound"
      >x</a
      ><a name="1351"
      > </a
      ><a name="1352" href="StlcProp.html#1321" class="Bound"
      >A</a
      ><a name="1353"
      > </a
      ><a name="1354" href="StlcProp.html#1337" class="Bound"
      >t&#8242;</a
      ><a name="1356"
      >

</a
      ><a name="1358" href="StlcProp.html#1358" class="Function"
      >canonicalForms</a
      ><a name="1372"
      > </a
      ><a name="1373" class="Symbol"
      >:</a
      ><a name="1374"
      > </a
      ><a name="1375" class="Symbol"
      >&#8704;</a
      ><a name="1376"
      > </a
      ><a name="1377" class="Symbol"
      >{</a
      ><a name="1378" href="StlcProp.html#1378" class="Bound"
      >t</a
      ><a name="1379"
      > </a
      ><a name="1380" href="StlcProp.html#1380" class="Bound"
      >A</a
      ><a name="1381" class="Symbol"
      >}</a
      ><a name="1382"
      > </a
      ><a name="1383" class="Symbol"
      >&#8594;</a
      ><a name="1384"
      > </a
      ><a name="1385" href="Stlc.html#18658" class="Function"
      >&#8709;</a
      ><a name="1386"
      > </a
      ><a name="1387" href="Stlc.html#19629" class="Datatype Operator"
      >&#8866;</a
      ><a name="1388"
      > </a
      ><a name="1389" href="StlcProp.html#1378" class="Bound"
      >t</a
      ><a name="1390"
      > </a
      ><a name="1391" href="Stlc.html#19629" class="Datatype Operator"
      >&#8758;</a
      ><a name="1392"
      > </a
      ><a name="1393" href="StlcProp.html#1380" class="Bound"
      >A</a
      ><a name="1394"
      > </a
      ><a name="1395" class="Symbol"
      >&#8594;</a
      ><a name="1396"
      > </a
      ><a name="1397" href="Stlc.html#9439" class="Datatype"
      >Value</a
      ><a name="1402"
      > </a
      ><a name="1403" href="StlcProp.html#1378" class="Bound"
      >t</a
      ><a name="1404"
      > </a
      ><a name="1405" class="Symbol"
      >&#8594;</a
      ><a name="1406"
      > </a
      ><a name="1407" href="StlcProp.html#1220" class="Function"
      >CanonicalForms</a
      ><a name="1421"
      > </a
      ><a name="1422" href="StlcProp.html#1378" class="Bound"
      >t</a
      ><a name="1423"
      > </a
      ><a name="1424" href="StlcProp.html#1380" class="Bound"
      >A</a
      ><a name="1425"
      >
</a
      ><a name="1426" href="StlcProp.html#1358" class="Function"
      >canonicalForms</a
      ><a name="1440"
      > </a
      ><a name="1441" class="Symbol"
      >(</a
      ><a name="1442" href="Stlc.html#19766" class="InductiveConstructor"
      >abs</a
      ><a name="1445"
      > </a
      ><a name="1446" href="StlcProp.html#1446" class="Bound"
      >t&#8242;</a
      ><a name="1448" class="Symbol"
      >)</a
      ><a name="1449"
      > </a
      ><a name="1450" href="Stlc.html#9466" class="InductiveConstructor"
      >abs</a
      ><a name="1453"
      >   </a
      ><a name="1456" class="Symbol"
      >=</a
      ><a name="1457"
      > </a
      ><a name="1458" class="Symbol"
      >_</a
      ><a name="1459"
      > </a
      ><a name="1460" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="1461"
      > </a
      ><a name="1462" class="Symbol"
      >_</a
      ><a name="1463"
      > </a
      ><a name="1464" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="1465"
      > </a
      ><a name="1466" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="1470"
      >
</a
      ><a name="1471" href="StlcProp.html#1358" class="Function"
      >canonicalForms</a
      ><a name="1485"
      > </a
      ><a name="1486" href="Stlc.html#20016" class="InductiveConstructor"
      >true</a
      ><a name="1490"
      >     </a
      ><a name="1495" href="Stlc.html#9514" class="InductiveConstructor"
      >true</a
      ><a name="1499"
      >  </a
      ><a name="1501" class="Symbol"
      >=</a
      ><a name="1502"
      > </a
      ><a name="1503" href="https://agda.github.io/agda-stdlib/Data.Sum.html#489" class="InductiveConstructor"
      >inj&#8321;</a
      ><a name="1507"
      > </a
      ><a name="1508" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="1512"
      >
</a
      ><a name="1513" href="StlcProp.html#1358" class="Function"
      >canonicalForms</a
      ><a name="1527"
      > </a
      ><a name="1528" href="Stlc.html#20075" class="InductiveConstructor"
      >false</a
      ><a name="1533"
      >    </a
      ><a name="1537" href="Stlc.html#9535" class="InductiveConstructor"
      >false</a
      ><a name="1542"
      > </a
      ><a name="1543" class="Symbol"
      >=</a
      ><a name="1544"
      > </a
      ><a name="1545" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="1549"
      > </a
      ><a name="1550" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
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
<a name="1933" href="StlcProp.html#1933" class="Function"
      >progress</a
      ><a name="1941"
      > </a
      ><a name="1942" class="Symbol"
      >:</a
      ><a name="1943"
      > </a
      ><a name="1944" class="Symbol"
      >&#8704;</a
      ><a name="1945"
      > </a
      ><a name="1946" class="Symbol"
      >{</a
      ><a name="1947" href="StlcProp.html#1947" class="Bound"
      >t</a
      ><a name="1948"
      > </a
      ><a name="1949" href="StlcProp.html#1949" class="Bound"
      >A</a
      ><a name="1950" class="Symbol"
      >}</a
      ><a name="1951"
      > </a
      ><a name="1952" class="Symbol"
      >&#8594;</a
      ><a name="1953"
      > </a
      ><a name="1954" href="Stlc.html#18658" class="Function"
      >&#8709;</a
      ><a name="1955"
      > </a
      ><a name="1956" href="Stlc.html#19629" class="Datatype Operator"
      >&#8866;</a
      ><a name="1957"
      > </a
      ><a name="1958" href="StlcProp.html#1947" class="Bound"
      >t</a
      ><a name="1959"
      > </a
      ><a name="1960" href="Stlc.html#19629" class="Datatype Operator"
      >&#8758;</a
      ><a name="1961"
      > </a
      ><a name="1962" href="StlcProp.html#1949" class="Bound"
      >A</a
      ><a name="1963"
      > </a
      ><a name="1964" class="Symbol"
      >&#8594;</a
      ><a name="1965"
      > </a
      ><a name="1966" href="Stlc.html#9439" class="Datatype"
      >Value</a
      ><a name="1971"
      > </a
      ><a name="1972" href="StlcProp.html#1947" class="Bound"
      >t</a
      ><a name="1973"
      > </a
      ><a name="1974" href="https://agda.github.io/agda-stdlib/Data.Sum.html#433" class="Datatype Operator"
      >&#8846;</a
      ><a name="1975"
      > </a
      ><a name="1976" href="https://agda.github.io/agda-stdlib/Data.Product.html#823" class="Function"
      >&#8707;</a
      ><a name="1977"
      > </a
      ><a name="1978" class="Symbol"
      >&#955;</a
      ><a name="1979"
      > </a
      ><a name="1980" href="StlcProp.html#1980" class="Bound"
      >t&#8242;</a
      ><a name="1982"
      > </a
      ><a name="1983" class="Symbol"
      >&#8594;</a
      ><a name="1984"
      > </a
      ><a name="1985" href="StlcProp.html#1947" class="Bound"
      >t</a
      ><a name="1986"
      > </a
      ><a name="1987" href="Stlc.html#15576" class="Datatype Operator"
      >==&gt;</a
      ><a name="1990"
      > </a
      ><a name="1991" href="StlcProp.html#1980" class="Bound"
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
<a name="3692" href="StlcProp.html#1933" class="Function"
      >progress</a
      ><a name="3700"
      > </a
      ><a name="3701" class="Symbol"
      >(</a
      ><a name="3702" href="Stlc.html#19673" class="InductiveConstructor"
      >var</a
      ><a name="3705"
      > </a
      ><a name="3706" href="StlcProp.html#3706" class="Bound"
      >x</a
      ><a name="3707"
      > </a
      ><a name="3708" class="Symbol"
      >())</a
      ><a name="3711"
      >
</a
      ><a name="3712" href="StlcProp.html#1933" class="Function"
      >progress</a
      ><a name="3720"
      > </a
      ><a name="3721" href="Stlc.html#20016" class="InductiveConstructor"
      >true</a
      ><a name="3725"
      >      </a
      ><a name="3731" class="Symbol"
      >=</a
      ><a name="3732"
      > </a
      ><a name="3733" href="https://agda.github.io/agda-stdlib/Data.Sum.html#489" class="InductiveConstructor"
      >inj&#8321;</a
      ><a name="3737"
      > </a
      ><a name="3738" href="Stlc.html#9514" class="InductiveConstructor"
      >true</a
      ><a name="3742"
      >
</a
      ><a name="3743" href="StlcProp.html#1933" class="Function"
      >progress</a
      ><a name="3751"
      > </a
      ><a name="3752" href="Stlc.html#20075" class="InductiveConstructor"
      >false</a
      ><a name="3757"
      >     </a
      ><a name="3762" class="Symbol"
      >=</a
      ><a name="3763"
      > </a
      ><a name="3764" href="https://agda.github.io/agda-stdlib/Data.Sum.html#489" class="InductiveConstructor"
      >inj&#8321;</a
      ><a name="3768"
      > </a
      ><a name="3769" href="Stlc.html#9535" class="InductiveConstructor"
      >false</a
      ><a name="3774"
      >
</a
      ><a name="3775" href="StlcProp.html#1933" class="Function"
      >progress</a
      ><a name="3783"
      > </a
      ><a name="3784" class="Symbol"
      >(</a
      ><a name="3785" href="Stlc.html#19766" class="InductiveConstructor"
      >abs</a
      ><a name="3788"
      > </a
      ><a name="3789" href="StlcProp.html#3789" class="Bound"
      >t&#8758;A</a
      ><a name="3792" class="Symbol"
      >)</a
      ><a name="3793"
      > </a
      ><a name="3794" class="Symbol"
      >=</a
      ><a name="3795"
      > </a
      ><a name="3796" href="https://agda.github.io/agda-stdlib/Data.Sum.html#489" class="InductiveConstructor"
      >inj&#8321;</a
      ><a name="3800"
      > </a
      ><a name="3801" href="Stlc.html#9466" class="InductiveConstructor"
      >abs</a
      ><a name="3804"
      >
</a
      ><a name="3805" href="StlcProp.html#1933" class="Function"
      >progress</a
      ><a name="3813"
      > </a
      ><a name="3814" class="Symbol"
      >(</a
      ><a name="3815" href="Stlc.html#19882" class="InductiveConstructor"
      >app</a
      ><a name="3818"
      > </a
      ><a name="3819" href="StlcProp.html#3819" class="Bound"
      >t&#8321;&#8758;A&#8658;B</a
      ><a name="3825"
      > </a
      ><a name="3826" href="StlcProp.html#3826" class="Bound"
      >t&#8322;&#8758;B</a
      ><a name="3830" class="Symbol"
      >)</a
      ><a name="3831"
      >
    </a
      ><a name="3836" class="Keyword"
      >with</a
      ><a name="3840"
      > </a
      ><a name="3841" href="StlcProp.html#1933" class="Function"
      >progress</a
      ><a name="3849"
      > </a
      ><a name="3850" href="StlcProp.html#3819" class="Bound"
      >t&#8321;&#8758;A&#8658;B</a
      ><a name="3856"
      >
</a
      ><a name="3857" class="Symbol"
      >...</a
      ><a name="3860"
      > </a
      ><a name="3861" class="Symbol"
      >|</a
      ><a name="3862"
      > </a
      ><a name="3863" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="3867"
      > </a
      ><a name="3868" class="Symbol"
      >(_</a
      ><a name="3870"
      > </a
      ><a name="3871" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="3872"
      > </a
      ><a name="3873" href="StlcProp.html#3873" class="Bound"
      >t&#8321;&#8658;t&#8321;&#8242;</a
      ><a name="3879" class="Symbol"
      >)</a
      ><a name="3880"
      > </a
      ><a name="3881" class="Symbol"
      >=</a
      ><a name="3882"
      > </a
      ><a name="3883" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="3887"
      > </a
      ><a name="3888" class="Symbol"
      >(_</a
      ><a name="3890"
      > </a
      ><a name="3891" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="3892"
      > </a
      ><a name="3893" href="Stlc.html#15701" class="InductiveConstructor"
      >app1</a
      ><a name="3897"
      > </a
      ><a name="3898" href="StlcProp.html#3873" class="Bound"
      >t&#8321;&#8658;t&#8321;&#8242;</a
      ><a name="3904" class="Symbol"
      >)</a
      ><a name="3905"
      >
</a
      ><a name="3906" class="Symbol"
      >...</a
      ><a name="3909"
      > </a
      ><a name="3910" class="Symbol"
      >|</a
      ><a name="3911"
      > </a
      ><a name="3912" href="https://agda.github.io/agda-stdlib/Data.Sum.html#489" class="InductiveConstructor"
      >inj&#8321;</a
      ><a name="3916"
      > </a
      ><a name="3917" href="StlcProp.html#3917" class="Bound"
      >v&#8321;</a
      ><a name="3919"
      >
    </a
      ><a name="3924" class="Keyword"
      >with</a
      ><a name="3928"
      > </a
      ><a name="3929" href="StlcProp.html#1933" class="Function"
      >progress</a
      ><a name="3937"
      > </a
      ><a name="3938" href="StlcProp.html#3826" class="Bound"
      >t&#8322;&#8758;B</a
      ><a name="3942"
      >
</a
      ><a name="3943" class="Symbol"
      >...</a
      ><a name="3946"
      > </a
      ><a name="3947" class="Symbol"
      >|</a
      ><a name="3948"
      > </a
      ><a name="3949" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="3953"
      > </a
      ><a name="3954" class="Symbol"
      >(_</a
      ><a name="3956"
      > </a
      ><a name="3957" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="3958"
      > </a
      ><a name="3959" href="StlcProp.html#3959" class="Bound"
      >t&#8322;&#8658;t&#8322;&#8242;</a
      ><a name="3965" class="Symbol"
      >)</a
      ><a name="3966"
      > </a
      ><a name="3967" class="Symbol"
      >=</a
      ><a name="3968"
      > </a
      ><a name="3969" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="3973"
      > </a
      ><a name="3974" class="Symbol"
      >(_</a
      ><a name="3976"
      > </a
      ><a name="3977" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="3978"
      > </a
      ><a name="3979" href="Stlc.html#15778" class="InductiveConstructor"
      >app2</a
      ><a name="3983"
      > </a
      ><a name="3984" href="StlcProp.html#3917" class="Bound"
      >v&#8321;</a
      ><a name="3986"
      > </a
      ><a name="3987" href="StlcProp.html#3959" class="Bound"
      >t&#8322;&#8658;t&#8322;&#8242;</a
      ><a name="3993" class="Symbol"
      >)</a
      ><a name="3994"
      >
</a
      ><a name="3995" class="Symbol"
      >...</a
      ><a name="3998"
      > </a
      ><a name="3999" class="Symbol"
      >|</a
      ><a name="4000"
      > </a
      ><a name="4001" href="https://agda.github.io/agda-stdlib/Data.Sum.html#489" class="InductiveConstructor"
      >inj&#8321;</a
      ><a name="4005"
      > </a
      ><a name="4006" href="StlcProp.html#4006" class="Bound"
      >v&#8322;</a
      ><a name="4008"
      >
    </a
      ><a name="4013" class="Keyword"
      >with</a
      ><a name="4017"
      > </a
      ><a name="4018" href="StlcProp.html#1358" class="Function"
      >canonicalForms</a
      ><a name="4032"
      > </a
      ><a name="4033" href="StlcProp.html#3819" class="Bound"
      >t&#8321;&#8758;A&#8658;B</a
      ><a name="4039"
      > </a
      ><a name="4040" href="StlcProp.html#3917" class="Bound"
      >v&#8321;</a
      ><a name="4042"
      >
</a
      ><a name="4043" class="Symbol"
      >...</a
      ><a name="4046"
      > </a
      ><a name="4047" class="Symbol"
      >|</a
      ><a name="4048"
      > </a
      ><a name="4049" class="Symbol"
      >(_</a
      ><a name="4051"
      > </a
      ><a name="4052" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="4053"
      > </a
      ><a name="4054" class="Symbol"
      >_</a
      ><a name="4055"
      > </a
      ><a name="4056" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="4057"
      > </a
      ><a name="4058" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="4062" class="Symbol"
      >)</a
      ><a name="4063"
      > </a
      ><a name="4064" class="Symbol"
      >=</a
      ><a name="4065"
      > </a
      ><a name="4066" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="4070"
      > </a
      ><a name="4071" class="Symbol"
      >(_</a
      ><a name="4073"
      > </a
      ><a name="4074" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="4075"
      > </a
      ><a name="4076" href="Stlc.html#15610" class="InductiveConstructor"
      >red</a
      ><a name="4079"
      > </a
      ><a name="4080" href="StlcProp.html#4006" class="Bound"
      >v&#8322;</a
      ><a name="4082" class="Symbol"
      >)</a
      ><a name="4083"
      >
</a
      ><a name="4084" href="StlcProp.html#1933" class="Function"
      >progress</a
      ><a name="4092"
      > </a
      ><a name="4093" class="Symbol"
      >(</a
      ><a name="4094" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >if</a
      ><a name="4096"
      > </a
      ><a name="4097" href="StlcProp.html#4097" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="4104"
      > </a
      ><a name="4105" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >then</a
      ><a name="4109"
      > </a
      ><a name="4110" href="StlcProp.html#4110" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="4114"
      > </a
      ><a name="4115" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >else</a
      ><a name="4119"
      > </a
      ><a name="4120" href="StlcProp.html#4120" class="Bound"
      >t&#8323;&#8758;A</a
      ><a name="4124" class="Symbol"
      >)</a
      ><a name="4125"
      >
    </a
      ><a name="4130" class="Keyword"
      >with</a
      ><a name="4134"
      > </a
      ><a name="4135" href="StlcProp.html#1933" class="Function"
      >progress</a
      ><a name="4143"
      > </a
      ><a name="4144" href="StlcProp.html#4097" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="4151"
      >
</a
      ><a name="4152" class="Symbol"
      >...</a
      ><a name="4155"
      > </a
      ><a name="4156" class="Symbol"
      >|</a
      ><a name="4157"
      > </a
      ><a name="4158" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="4162"
      > </a
      ><a name="4163" class="Symbol"
      >(_</a
      ><a name="4165"
      > </a
      ><a name="4166" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="4167"
      > </a
      ><a name="4168" href="StlcProp.html#4168" class="Bound"
      >t&#8321;&#8658;t&#8321;&#8242;</a
      ><a name="4174" class="Symbol"
      >)</a
      ><a name="4175"
      > </a
      ><a name="4176" class="Symbol"
      >=</a
      ><a name="4177"
      > </a
      ><a name="4178" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="4182"
      > </a
      ><a name="4183" class="Symbol"
      >(_</a
      ><a name="4185"
      > </a
      ><a name="4186" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="4187"
      > </a
      ><a name="4188" href="Stlc.html#15875" class="InductiveConstructor"
      >if</a
      ><a name="4190"
      > </a
      ><a name="4191" href="StlcProp.html#4168" class="Bound"
      >t&#8321;&#8658;t&#8321;&#8242;</a
      ><a name="4197" class="Symbol"
      >)</a
      ><a name="4198"
      >
</a
      ><a name="4199" class="Symbol"
      >...</a
      ><a name="4202"
      > </a
      ><a name="4203" class="Symbol"
      >|</a
      ><a name="4204"
      > </a
      ><a name="4205" href="https://agda.github.io/agda-stdlib/Data.Sum.html#489" class="InductiveConstructor"
      >inj&#8321;</a
      ><a name="4209"
      > </a
      ><a name="4210" href="StlcProp.html#4210" class="Bound"
      >v&#8321;</a
      ><a name="4212"
      >
    </a
      ><a name="4217" class="Keyword"
      >with</a
      ><a name="4221"
      > </a
      ><a name="4222" href="StlcProp.html#1358" class="Function"
      >canonicalForms</a
      ><a name="4236"
      > </a
      ><a name="4237" href="StlcProp.html#4097" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="4244"
      > </a
      ><a name="4245" href="StlcProp.html#4210" class="Bound"
      >v&#8321;</a
      ><a name="4247"
      >
</a
      ><a name="4248" class="Symbol"
      >...</a
      ><a name="4251"
      > </a
      ><a name="4252" class="Symbol"
      >|</a
      ><a name="4253"
      > </a
      ><a name="4254" href="https://agda.github.io/agda-stdlib/Data.Sum.html#489" class="InductiveConstructor"
      >inj&#8321;</a
      ><a name="4258"
      > </a
      ><a name="4259" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="4263"
      > </a
      ><a name="4264" class="Symbol"
      >=</a
      ><a name="4265"
      > </a
      ><a name="4266" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="4270"
      > </a
      ><a name="4271" class="Symbol"
      >(_</a
      ><a name="4273"
      > </a
      ><a name="4274" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="4275"
      > </a
      ><a name="4276" href="Stlc.html#15976" class="InductiveConstructor"
      >iftrue</a
      ><a name="4282" class="Symbol"
      >)</a
      ><a name="4283"
      >
</a
      ><a name="4284" class="Symbol"
      >...</a
      ><a name="4287"
      > </a
      ><a name="4288" class="Symbol"
      >|</a
      ><a name="4289"
      > </a
      ><a name="4290" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="4294"
      > </a
      ><a name="4295" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="4299"
      > </a
      ><a name="4300" class="Symbol"
      >=</a
      ><a name="4301"
      > </a
      ><a name="4302" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="4306"
      > </a
      ><a name="4307" class="Symbol"
      >(_</a
      ><a name="4309"
      > </a
      ><a name="4310" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="4311"
      > </a
      ><a name="4312" href="Stlc.html#16036" class="InductiveConstructor"
      >iffalse</a
      ><a name="4319" class="Symbol"
      >)</a
      >
{% endraw %}</pre>

#### Exercise: 3 stars, optional (progress_from_term_ind)
Show that progress can also be proved by induction on terms
instead of induction on typing derivations.

<pre class="Agda">{% raw %}
<a name="4509" class="Keyword"
      >postulate</a
      ><a name="4518"
      >
  </a
      ><a name="4521" href="StlcProp.html#4521" class="Postulate"
      >progress&#8242;</a
      ><a name="4530"
      > </a
      ><a name="4531" class="Symbol"
      >:</a
      ><a name="4532"
      > </a
      ><a name="4533" class="Symbol"
      >&#8704;</a
      ><a name="4534"
      > </a
      ><a name="4535" class="Symbol"
      >{</a
      ><a name="4536" href="StlcProp.html#4536" class="Bound"
      >t</a
      ><a name="4537"
      > </a
      ><a name="4538" href="StlcProp.html#4538" class="Bound"
      >A</a
      ><a name="4539" class="Symbol"
      >}</a
      ><a name="4540"
      > </a
      ><a name="4541" class="Symbol"
      >&#8594;</a
      ><a name="4542"
      > </a
      ><a name="4543" href="Stlc.html#18658" class="Function"
      >&#8709;</a
      ><a name="4544"
      > </a
      ><a name="4545" href="Stlc.html#19629" class="Datatype Operator"
      >&#8866;</a
      ><a name="4546"
      > </a
      ><a name="4547" href="StlcProp.html#4536" class="Bound"
      >t</a
      ><a name="4548"
      > </a
      ><a name="4549" href="Stlc.html#19629" class="Datatype Operator"
      >&#8758;</a
      ><a name="4550"
      > </a
      ><a name="4551" href="StlcProp.html#4538" class="Bound"
      >A</a
      ><a name="4552"
      > </a
      ><a name="4553" class="Symbol"
      >&#8594;</a
      ><a name="4554"
      > </a
      ><a name="4555" href="Stlc.html#9439" class="Datatype"
      >Value</a
      ><a name="4560"
      > </a
      ><a name="4561" href="StlcProp.html#4536" class="Bound"
      >t</a
      ><a name="4562"
      > </a
      ><a name="4563" href="https://agda.github.io/agda-stdlib/Data.Sum.html#433" class="Datatype Operator"
      >&#8846;</a
      ><a name="4564"
      > </a
      ><a name="4565" href="https://agda.github.io/agda-stdlib/Data.Product.html#823" class="Function"
      >&#8707;</a
      ><a name="4566"
      > </a
      ><a name="4567" class="Symbol"
      >&#955;</a
      ><a name="4568"
      > </a
      ><a name="4569" href="StlcProp.html#4569" class="Bound"
      >t&#8242;</a
      ><a name="4571"
      > </a
      ><a name="4572" class="Symbol"
      >&#8594;</a
      ><a name="4573"
      > </a
      ><a name="4574" href="StlcProp.html#4536" class="Bound"
      >t</a
      ><a name="4575"
      > </a
      ><a name="4576" href="Stlc.html#15576" class="Datatype Operator"
      >==&gt;</a
      ><a name="4579"
      > </a
      ><a name="4580" href="StlcProp.html#4569" class="Bound"
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
<a name="7003" class="Keyword"
      >data</a
      ><a name="7007"
      > </a
      ><a name="7008" href="StlcProp.html#7008" class="Datatype Operator"
      >_FreeIn_</a
      ><a name="7016"
      > </a
      ><a name="7017" class="Symbol"
      >(</a
      ><a name="7018" href="StlcProp.html#7018" class="Bound"
      >x</a
      ><a name="7019"
      > </a
      ><a name="7020" class="Symbol"
      >:</a
      ><a name="7021"
      > </a
      ><a name="7022" href="Stlc.html#5778" class="Datatype"
      >Id</a
      ><a name="7024" class="Symbol"
      >)</a
      ><a name="7025"
      > </a
      ><a name="7026" class="Symbol"
      >:</a
      ><a name="7027"
      > </a
      ><a name="7028" href="Stlc.html#6114" class="Datatype"
      >Term</a
      ><a name="7032"
      > </a
      ><a name="7033" class="Symbol"
      >&#8594;</a
      ><a name="7034"
      > </a
      ><a name="7035" class="PrimitiveType"
      >Set</a
      ><a name="7038"
      > </a
      ><a name="7039" class="Keyword"
      >where</a
      ><a name="7044"
      >
  </a
      ><a name="7047" href="StlcProp.html#7047" class="InductiveConstructor"
      >var</a
      ><a name="7050"
      >  </a
      ><a name="7052" class="Symbol"
      >:</a
      ><a name="7053"
      > </a
      ><a name="7054" href="StlcProp.html#7018" class="Bound"
      >x</a
      ><a name="7055"
      > </a
      ><a name="7056" href="StlcProp.html#7008" class="Datatype Operator"
      >FreeIn</a
      ><a name="7062"
      > </a
      ><a name="7063" href="Stlc.html#6133" class="InductiveConstructor"
      >var</a
      ><a name="7066"
      > </a
      ><a name="7067" href="StlcProp.html#7018" class="Bound"
      >x</a
      ><a name="7068"
      >
  </a
      ><a name="7071" href="StlcProp.html#7071" class="InductiveConstructor"
      >abs</a
      ><a name="7074"
      >  </a
      ><a name="7076" class="Symbol"
      >:</a
      ><a name="7077"
      > </a
      ><a name="7078" class="Symbol"
      >&#8704;</a
      ><a name="7079"
      > </a
      ><a name="7080" class="Symbol"
      >{</a
      ><a name="7081" href="StlcProp.html#7081" class="Bound"
      >y</a
      ><a name="7082"
      > </a
      ><a name="7083" href="StlcProp.html#7083" class="Bound"
      >A</a
      ><a name="7084"
      > </a
      ><a name="7085" href="StlcProp.html#7085" class="Bound"
      >t</a
      ><a name="7086" class="Symbol"
      >}</a
      ><a name="7087"
      > </a
      ><a name="7088" class="Symbol"
      >&#8594;</a
      ><a name="7089"
      > </a
      ><a name="7090" href="StlcProp.html#7081" class="Bound"
      >y</a
      ><a name="7091"
      > </a
      ><a name="7092" href="https://agda.github.io/agda-stdlib/Relation.Binary.Core.html#4493" class="Function Operator"
      >&#8802;</a
      ><a name="7093"
      > </a
      ><a name="7094" href="StlcProp.html#7018" class="Bound"
      >x</a
      ><a name="7095"
      > </a
      ><a name="7096" class="Symbol"
      >&#8594;</a
      ><a name="7097"
      > </a
      ><a name="7098" href="StlcProp.html#7018" class="Bound"
      >x</a
      ><a name="7099"
      > </a
      ><a name="7100" href="StlcProp.html#7008" class="Datatype Operator"
      >FreeIn</a
      ><a name="7106"
      > </a
      ><a name="7107" href="StlcProp.html#7085" class="Bound"
      >t</a
      ><a name="7108"
      > </a
      ><a name="7109" class="Symbol"
      >&#8594;</a
      ><a name="7110"
      > </a
      ><a name="7111" href="StlcProp.html#7018" class="Bound"
      >x</a
      ><a name="7112"
      > </a
      ><a name="7113" href="StlcProp.html#7008" class="Datatype Operator"
      >FreeIn</a
      ><a name="7119"
      > </a
      ><a name="7120" href="Stlc.html#6182" class="InductiveConstructor"
      >abs</a
      ><a name="7123"
      > </a
      ><a name="7124" href="StlcProp.html#7081" class="Bound"
      >y</a
      ><a name="7125"
      > </a
      ><a name="7126" href="StlcProp.html#7083" class="Bound"
      >A</a
      ><a name="7127"
      > </a
      ><a name="7128" href="StlcProp.html#7085" class="Bound"
      >t</a
      ><a name="7129"
      >
  </a
      ><a name="7132" href="StlcProp.html#7132" class="InductiveConstructor"
      >app1</a
      ><a name="7136"
      > </a
      ><a name="7137" class="Symbol"
      >:</a
      ><a name="7138"
      > </a
      ><a name="7139" class="Symbol"
      >&#8704;</a
      ><a name="7140"
      > </a
      ><a name="7141" class="Symbol"
      >{</a
      ><a name="7142" href="StlcProp.html#7142" class="Bound"
      >t&#8321;</a
      ><a name="7144"
      > </a
      ><a name="7145" href="StlcProp.html#7145" class="Bound"
      >t&#8322;</a
      ><a name="7147" class="Symbol"
      >}</a
      ><a name="7148"
      > </a
      ><a name="7149" class="Symbol"
      >&#8594;</a
      ><a name="7150"
      > </a
      ><a name="7151" href="StlcProp.html#7018" class="Bound"
      >x</a
      ><a name="7152"
      > </a
      ><a name="7153" href="StlcProp.html#7008" class="Datatype Operator"
      >FreeIn</a
      ><a name="7159"
      > </a
      ><a name="7160" href="StlcProp.html#7142" class="Bound"
      >t&#8321;</a
      ><a name="7162"
      > </a
      ><a name="7163" class="Symbol"
      >&#8594;</a
      ><a name="7164"
      > </a
      ><a name="7165" href="StlcProp.html#7018" class="Bound"
      >x</a
      ><a name="7166"
      > </a
      ><a name="7167" href="StlcProp.html#7008" class="Datatype Operator"
      >FreeIn</a
      ><a name="7173"
      > </a
      ><a name="7174" href="Stlc.html#6153" class="InductiveConstructor"
      >app</a
      ><a name="7177"
      > </a
      ><a name="7178" href="StlcProp.html#7142" class="Bound"
      >t&#8321;</a
      ><a name="7180"
      > </a
      ><a name="7181" href="StlcProp.html#7145" class="Bound"
      >t&#8322;</a
      ><a name="7183"
      >
  </a
      ><a name="7186" href="StlcProp.html#7186" class="InductiveConstructor"
      >app2</a
      ><a name="7190"
      > </a
      ><a name="7191" class="Symbol"
      >:</a
      ><a name="7192"
      > </a
      ><a name="7193" class="Symbol"
      >&#8704;</a
      ><a name="7194"
      > </a
      ><a name="7195" class="Symbol"
      >{</a
      ><a name="7196" href="StlcProp.html#7196" class="Bound"
      >t&#8321;</a
      ><a name="7198"
      > </a
      ><a name="7199" href="StlcProp.html#7199" class="Bound"
      >t&#8322;</a
      ><a name="7201" class="Symbol"
      >}</a
      ><a name="7202"
      > </a
      ><a name="7203" class="Symbol"
      >&#8594;</a
      ><a name="7204"
      > </a
      ><a name="7205" href="StlcProp.html#7018" class="Bound"
      >x</a
      ><a name="7206"
      > </a
      ><a name="7207" href="StlcProp.html#7008" class="Datatype Operator"
      >FreeIn</a
      ><a name="7213"
      > </a
      ><a name="7214" href="StlcProp.html#7199" class="Bound"
      >t&#8322;</a
      ><a name="7216"
      > </a
      ><a name="7217" class="Symbol"
      >&#8594;</a
      ><a name="7218"
      > </a
      ><a name="7219" href="StlcProp.html#7018" class="Bound"
      >x</a
      ><a name="7220"
      > </a
      ><a name="7221" href="StlcProp.html#7008" class="Datatype Operator"
      >FreeIn</a
      ><a name="7227"
      > </a
      ><a name="7228" href="Stlc.html#6153" class="InductiveConstructor"
      >app</a
      ><a name="7231"
      > </a
      ><a name="7232" href="StlcProp.html#7196" class="Bound"
      >t&#8321;</a
      ><a name="7234"
      > </a
      ><a name="7235" href="StlcProp.html#7199" class="Bound"
      >t&#8322;</a
      ><a name="7237"
      >
  </a
      ><a name="7240" href="StlcProp.html#7240" class="InductiveConstructor"
      >if1</a
      ><a name="7243"
      >  </a
      ><a name="7245" class="Symbol"
      >:</a
      ><a name="7246"
      > </a
      ><a name="7247" class="Symbol"
      >&#8704;</a
      ><a name="7248"
      > </a
      ><a name="7249" class="Symbol"
      >{</a
      ><a name="7250" href="StlcProp.html#7250" class="Bound"
      >t&#8321;</a
      ><a name="7252"
      > </a
      ><a name="7253" href="StlcProp.html#7253" class="Bound"
      >t&#8322;</a
      ><a name="7255"
      > </a
      ><a name="7256" href="StlcProp.html#7256" class="Bound"
      >t&#8323;</a
      ><a name="7258" class="Symbol"
      >}</a
      ><a name="7259"
      > </a
      ><a name="7260" class="Symbol"
      >&#8594;</a
      ><a name="7261"
      > </a
      ><a name="7262" href="StlcProp.html#7018" class="Bound"
      >x</a
      ><a name="7263"
      > </a
      ><a name="7264" href="StlcProp.html#7008" class="Datatype Operator"
      >FreeIn</a
      ><a name="7270"
      > </a
      ><a name="7271" href="StlcProp.html#7250" class="Bound"
      >t&#8321;</a
      ><a name="7273"
      > </a
      ><a name="7274" class="Symbol"
      >&#8594;</a
      ><a name="7275"
      > </a
      ><a name="7276" href="StlcProp.html#7018" class="Bound"
      >x</a
      ><a name="7277"
      > </a
      ><a name="7278" href="StlcProp.html#7008" class="Datatype Operator"
      >FreeIn</a
      ><a name="7284"
      > </a
      ><a name="7285" class="Symbol"
      >(</a
      ><a name="7286" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >if</a
      ><a name="7288"
      > </a
      ><a name="7289" href="StlcProp.html#7250" class="Bound"
      >t&#8321;</a
      ><a name="7291"
      > </a
      ><a name="7292" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >then</a
      ><a name="7296"
      > </a
      ><a name="7297" href="StlcProp.html#7253" class="Bound"
      >t&#8322;</a
      ><a name="7299"
      > </a
      ><a name="7300" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >else</a
      ><a name="7304"
      > </a
      ><a name="7305" href="StlcProp.html#7256" class="Bound"
      >t&#8323;</a
      ><a name="7307" class="Symbol"
      >)</a
      ><a name="7308"
      >
  </a
      ><a name="7311" href="StlcProp.html#7311" class="InductiveConstructor"
      >if2</a
      ><a name="7314"
      >  </a
      ><a name="7316" class="Symbol"
      >:</a
      ><a name="7317"
      > </a
      ><a name="7318" class="Symbol"
      >&#8704;</a
      ><a name="7319"
      > </a
      ><a name="7320" class="Symbol"
      >{</a
      ><a name="7321" href="StlcProp.html#7321" class="Bound"
      >t&#8321;</a
      ><a name="7323"
      > </a
      ><a name="7324" href="StlcProp.html#7324" class="Bound"
      >t&#8322;</a
      ><a name="7326"
      > </a
      ><a name="7327" href="StlcProp.html#7327" class="Bound"
      >t&#8323;</a
      ><a name="7329" class="Symbol"
      >}</a
      ><a name="7330"
      > </a
      ><a name="7331" class="Symbol"
      >&#8594;</a
      ><a name="7332"
      > </a
      ><a name="7333" href="StlcProp.html#7018" class="Bound"
      >x</a
      ><a name="7334"
      > </a
      ><a name="7335" href="StlcProp.html#7008" class="Datatype Operator"
      >FreeIn</a
      ><a name="7341"
      > </a
      ><a name="7342" href="StlcProp.html#7324" class="Bound"
      >t&#8322;</a
      ><a name="7344"
      > </a
      ><a name="7345" class="Symbol"
      >&#8594;</a
      ><a name="7346"
      > </a
      ><a name="7347" href="StlcProp.html#7018" class="Bound"
      >x</a
      ><a name="7348"
      > </a
      ><a name="7349" href="StlcProp.html#7008" class="Datatype Operator"
      >FreeIn</a
      ><a name="7355"
      > </a
      ><a name="7356" class="Symbol"
      >(</a
      ><a name="7357" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >if</a
      ><a name="7359"
      > </a
      ><a name="7360" href="StlcProp.html#7321" class="Bound"
      >t&#8321;</a
      ><a name="7362"
      > </a
      ><a name="7363" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >then</a
      ><a name="7367"
      > </a
      ><a name="7368" href="StlcProp.html#7324" class="Bound"
      >t&#8322;</a
      ><a name="7370"
      > </a
      ><a name="7371" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >else</a
      ><a name="7375"
      > </a
      ><a name="7376" href="StlcProp.html#7327" class="Bound"
      >t&#8323;</a
      ><a name="7378" class="Symbol"
      >)</a
      ><a name="7379"
      >
  </a
      ><a name="7382" href="StlcProp.html#7382" class="InductiveConstructor"
      >if3</a
      ><a name="7385"
      >  </a
      ><a name="7387" class="Symbol"
      >:</a
      ><a name="7388"
      > </a
      ><a name="7389" class="Symbol"
      >&#8704;</a
      ><a name="7390"
      > </a
      ><a name="7391" class="Symbol"
      >{</a
      ><a name="7392" href="StlcProp.html#7392" class="Bound"
      >t&#8321;</a
      ><a name="7394"
      > </a
      ><a name="7395" href="StlcProp.html#7395" class="Bound"
      >t&#8322;</a
      ><a name="7397"
      > </a
      ><a name="7398" href="StlcProp.html#7398" class="Bound"
      >t&#8323;</a
      ><a name="7400" class="Symbol"
      >}</a
      ><a name="7401"
      > </a
      ><a name="7402" class="Symbol"
      >&#8594;</a
      ><a name="7403"
      > </a
      ><a name="7404" href="StlcProp.html#7018" class="Bound"
      >x</a
      ><a name="7405"
      > </a
      ><a name="7406" href="StlcProp.html#7008" class="Datatype Operator"
      >FreeIn</a
      ><a name="7412"
      > </a
      ><a name="7413" href="StlcProp.html#7398" class="Bound"
      >t&#8323;</a
      ><a name="7415"
      > </a
      ><a name="7416" class="Symbol"
      >&#8594;</a
      ><a name="7417"
      > </a
      ><a name="7418" href="StlcProp.html#7018" class="Bound"
      >x</a
      ><a name="7419"
      > </a
      ><a name="7420" href="StlcProp.html#7008" class="Datatype Operator"
      >FreeIn</a
      ><a name="7426"
      > </a
      ><a name="7427" class="Symbol"
      >(</a
      ><a name="7428" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >if</a
      ><a name="7430"
      > </a
      ><a name="7431" href="StlcProp.html#7392" class="Bound"
      >t&#8321;</a
      ><a name="7433"
      > </a
      ><a name="7434" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >then</a
      ><a name="7438"
      > </a
      ><a name="7439" href="StlcProp.html#7395" class="Bound"
      >t&#8322;</a
      ><a name="7441"
      > </a
      ><a name="7442" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >else</a
      ><a name="7446"
      > </a
      ><a name="7447" href="StlcProp.html#7398" class="Bound"
      >t&#8323;</a
      ><a name="7449" class="Symbol"
      >)</a
      >
{% endraw %}</pre>

A term in which no variables appear free is said to be _closed_.

<pre class="Agda">{% raw %}
<a name="7542" href="StlcProp.html#7542" class="Function"
      >Closed</a
      ><a name="7548"
      > </a
      ><a name="7549" class="Symbol"
      >:</a
      ><a name="7550"
      > </a
      ><a name="7551" href="Stlc.html#6114" class="Datatype"
      >Term</a
      ><a name="7555"
      > </a
      ><a name="7556" class="Symbol"
      >&#8594;</a
      ><a name="7557"
      > </a
      ><a name="7558" class="PrimitiveType"
      >Set</a
      ><a name="7561"
      >
</a
      ><a name="7562" href="StlcProp.html#7542" class="Function"
      >Closed</a
      ><a name="7568"
      > </a
      ><a name="7569" href="StlcProp.html#7569" class="Bound"
      >t</a
      ><a name="7570"
      > </a
      ><a name="7571" class="Symbol"
      >=</a
      ><a name="7572"
      > </a
      ><a name="7573" class="Symbol"
      >&#8704;</a
      ><a name="7574"
      > </a
      ><a name="7575" class="Symbol"
      >{</a
      ><a name="7576" href="StlcProp.html#7576" class="Bound"
      >x</a
      ><a name="7577" class="Symbol"
      >}</a
      ><a name="7578"
      > </a
      ><a name="7579" class="Symbol"
      >&#8594;</a
      ><a name="7580"
      > </a
      ><a name="7581" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#414" class="Function Operator"
      >&#172;</a
      ><a name="7582"
      > </a
      ><a name="7583" class="Symbol"
      >(</a
      ><a name="7584" href="StlcProp.html#7576" class="Bound"
      >x</a
      ><a name="7585"
      > </a
      ><a name="7586" href="StlcProp.html#7008" class="Datatype Operator"
      >FreeIn</a
      ><a name="7592"
      > </a
      ><a name="7593" href="StlcProp.html#7569" class="Bound"
      >t</a
      ><a name="7594" class="Symbol"
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
<a name="8323" href="StlcProp.html#8323" class="Function"
      >freeInCtxt</a
      ><a name="8333"
      > </a
      ><a name="8334" class="Symbol"
      >:</a
      ><a name="8335"
      > </a
      ><a name="8336" class="Symbol"
      >&#8704;</a
      ><a name="8337"
      > </a
      ><a name="8338" class="Symbol"
      >{</a
      ><a name="8339" href="StlcProp.html#8339" class="Bound"
      >x</a
      ><a name="8340"
      > </a
      ><a name="8341" href="StlcProp.html#8341" class="Bound"
      >t</a
      ><a name="8342"
      > </a
      ><a name="8343" href="StlcProp.html#8343" class="Bound"
      >A</a
      ><a name="8344"
      > </a
      ><a name="8345" href="StlcProp.html#8345" class="Bound"
      >&#915;</a
      ><a name="8346" class="Symbol"
      >}</a
      ><a name="8347"
      > </a
      ><a name="8348" class="Symbol"
      >&#8594;</a
      ><a name="8349"
      > </a
      ><a name="8350" href="StlcProp.html#8339" class="Bound"
      >x</a
      ><a name="8351"
      > </a
      ><a name="8352" href="StlcProp.html#7008" class="Datatype Operator"
      >FreeIn</a
      ><a name="8358"
      > </a
      ><a name="8359" href="StlcProp.html#8341" class="Bound"
      >t</a
      ><a name="8360"
      > </a
      ><a name="8361" class="Symbol"
      >&#8594;</a
      ><a name="8362"
      > </a
      ><a name="8363" href="StlcProp.html#8345" class="Bound"
      >&#915;</a
      ><a name="8364"
      > </a
      ><a name="8365" href="Stlc.html#19629" class="Datatype Operator"
      >&#8866;</a
      ><a name="8366"
      > </a
      ><a name="8367" href="StlcProp.html#8341" class="Bound"
      >t</a
      ><a name="8368"
      > </a
      ><a name="8369" href="Stlc.html#19629" class="Datatype Operator"
      >&#8758;</a
      ><a name="8370"
      > </a
      ><a name="8371" href="StlcProp.html#8343" class="Bound"
      >A</a
      ><a name="8372"
      > </a
      ><a name="8373" class="Symbol"
      >&#8594;</a
      ><a name="8374"
      > </a
      ><a name="8375" href="https://agda.github.io/agda-stdlib/Data.Product.html#823" class="Function"
      >&#8707;</a
      ><a name="8376"
      > </a
      ><a name="8377" class="Symbol"
      >&#955;</a
      ><a name="8378"
      > </a
      ><a name="8379" href="StlcProp.html#8379" class="Bound"
      >B</a
      ><a name="8380"
      > </a
      ><a name="8381" class="Symbol"
      >&#8594;</a
      ><a name="8382"
      > </a
      ><a name="8383" href="StlcProp.html#8345" class="Bound"
      >&#915;</a
      ><a name="8384"
      > </a
      ><a name="8385" href="StlcProp.html#8339" class="Bound"
      >x</a
      ><a name="8386"
      > </a
      ><a name="8387" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="8388"
      > </a
      ><a name="8389" href="https://agda.github.io/agda-stdlib/Data.Maybe.Base.html#373" class="InductiveConstructor"
      >just</a
      ><a name="8393"
      > </a
      ><a name="8394" href="StlcProp.html#8379" class="Bound"
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
<a name="9990" href="StlcProp.html#8323" class="Function"
      >freeInCtxt</a
      ><a name="10000"
      > </a
      ><a name="10001" href="StlcProp.html#7047" class="InductiveConstructor"
      >var</a
      ><a name="10004"
      > </a
      ><a name="10005" class="Symbol"
      >(</a
      ><a name="10006" href="Stlc.html#19673" class="InductiveConstructor"
      >var</a
      ><a name="10009"
      > </a
      ><a name="10010" class="Symbol"
      >_</a
      ><a name="10011"
      > </a
      ><a name="10012" href="StlcProp.html#10012" class="Bound"
      >x&#8758;A</a
      ><a name="10015" class="Symbol"
      >)</a
      ><a name="10016"
      > </a
      ><a name="10017" class="Symbol"
      >=</a
      ><a name="10018"
      > </a
      ><a name="10019" class="Symbol"
      >(_</a
      ><a name="10021"
      > </a
      ><a name="10022" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="10023"
      > </a
      ><a name="10024" href="StlcProp.html#10012" class="Bound"
      >x&#8758;A</a
      ><a name="10027" class="Symbol"
      >)</a
      ><a name="10028"
      >
</a
      ><a name="10029" href="StlcProp.html#8323" class="Function"
      >freeInCtxt</a
      ><a name="10039"
      > </a
      ><a name="10040" class="Symbol"
      >(</a
      ><a name="10041" href="StlcProp.html#7132" class="InductiveConstructor"
      >app1</a
      ><a name="10045"
      > </a
      ><a name="10046" href="StlcProp.html#10046" class="Bound"
      >x&#8712;t&#8321;</a
      ><a name="10050" class="Symbol"
      >)</a
      ><a name="10051"
      > </a
      ><a name="10052" class="Symbol"
      >(</a
      ><a name="10053" href="Stlc.html#19882" class="InductiveConstructor"
      >app</a
      ><a name="10056"
      > </a
      ><a name="10057" href="StlcProp.html#10057" class="Bound"
      >t&#8321;&#8758;A</a
      ><a name="10061"
      > </a
      ><a name="10062" class="Symbol"
      >_</a
      ><a name="10063"
      >   </a
      ><a name="10066" class="Symbol"
      >)</a
      ><a name="10067"
      > </a
      ><a name="10068" class="Symbol"
      >=</a
      ><a name="10069"
      > </a
      ><a name="10070" href="StlcProp.html#8323" class="Function"
      >freeInCtxt</a
      ><a name="10080"
      > </a
      ><a name="10081" href="StlcProp.html#10046" class="Bound"
      >x&#8712;t&#8321;</a
      ><a name="10085"
      > </a
      ><a name="10086" href="StlcProp.html#10057" class="Bound"
      >t&#8321;&#8758;A</a
      ><a name="10090"
      >
</a
      ><a name="10091" href="StlcProp.html#8323" class="Function"
      >freeInCtxt</a
      ><a name="10101"
      > </a
      ><a name="10102" class="Symbol"
      >(</a
      ><a name="10103" href="StlcProp.html#7186" class="InductiveConstructor"
      >app2</a
      ><a name="10107"
      > </a
      ><a name="10108" href="StlcProp.html#10108" class="Bound"
      >x&#8712;t&#8322;</a
      ><a name="10112" class="Symbol"
      >)</a
      ><a name="10113"
      > </a
      ><a name="10114" class="Symbol"
      >(</a
      ><a name="10115" href="Stlc.html#19882" class="InductiveConstructor"
      >app</a
      ><a name="10118"
      > </a
      ><a name="10119" class="Symbol"
      >_</a
      ><a name="10120"
      >    </a
      ><a name="10124" href="StlcProp.html#10124" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="10128" class="Symbol"
      >)</a
      ><a name="10129"
      > </a
      ><a name="10130" class="Symbol"
      >=</a
      ><a name="10131"
      > </a
      ><a name="10132" href="StlcProp.html#8323" class="Function"
      >freeInCtxt</a
      ><a name="10142"
      > </a
      ><a name="10143" href="StlcProp.html#10108" class="Bound"
      >x&#8712;t&#8322;</a
      ><a name="10147"
      > </a
      ><a name="10148" href="StlcProp.html#10124" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="10152"
      >
</a
      ><a name="10153" href="StlcProp.html#8323" class="Function"
      >freeInCtxt</a
      ><a name="10163"
      > </a
      ><a name="10164" class="Symbol"
      >(</a
      ><a name="10165" href="StlcProp.html#7240" class="InductiveConstructor"
      >if1</a
      ><a name="10168"
      > </a
      ><a name="10169" href="StlcProp.html#10169" class="Bound"
      >x&#8712;t&#8321;</a
      ><a name="10173" class="Symbol"
      >)</a
      ><a name="10174"
      > </a
      ><a name="10175" class="Symbol"
      >(</a
      ><a name="10176" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >if</a
      ><a name="10178"
      > </a
      ><a name="10179" href="StlcProp.html#10179" class="Bound"
      >t&#8321;&#8758;A</a
      ><a name="10183"
      > </a
      ><a name="10184" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >then</a
      ><a name="10188"
      > </a
      ><a name="10189" class="Symbol"
      >_</a
      ><a name="10190"
      >    </a
      ><a name="10194" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >else</a
      ><a name="10198"
      > </a
      ><a name="10199" class="Symbol"
      >_</a
      ><a name="10200"
      >   </a
      ><a name="10203" class="Symbol"
      >)</a
      ><a name="10204"
      > </a
      ><a name="10205" class="Symbol"
      >=</a
      ><a name="10206"
      > </a
      ><a name="10207" href="StlcProp.html#8323" class="Function"
      >freeInCtxt</a
      ><a name="10217"
      > </a
      ><a name="10218" href="StlcProp.html#10169" class="Bound"
      >x&#8712;t&#8321;</a
      ><a name="10222"
      > </a
      ><a name="10223" href="StlcProp.html#10179" class="Bound"
      >t&#8321;&#8758;A</a
      ><a name="10227"
      >
</a
      ><a name="10228" href="StlcProp.html#8323" class="Function"
      >freeInCtxt</a
      ><a name="10238"
      > </a
      ><a name="10239" class="Symbol"
      >(</a
      ><a name="10240" href="StlcProp.html#7311" class="InductiveConstructor"
      >if2</a
      ><a name="10243"
      > </a
      ><a name="10244" href="StlcProp.html#10244" class="Bound"
      >x&#8712;t&#8322;</a
      ><a name="10248" class="Symbol"
      >)</a
      ><a name="10249"
      > </a
      ><a name="10250" class="Symbol"
      >(</a
      ><a name="10251" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >if</a
      ><a name="10253"
      > </a
      ><a name="10254" class="Symbol"
      >_</a
      ><a name="10255"
      >    </a
      ><a name="10259" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >then</a
      ><a name="10263"
      > </a
      ><a name="10264" href="StlcProp.html#10264" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="10268"
      > </a
      ><a name="10269" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >else</a
      ><a name="10273"
      > </a
      ><a name="10274" class="Symbol"
      >_</a
      ><a name="10275"
      >   </a
      ><a name="10278" class="Symbol"
      >)</a
      ><a name="10279"
      > </a
      ><a name="10280" class="Symbol"
      >=</a
      ><a name="10281"
      > </a
      ><a name="10282" href="StlcProp.html#8323" class="Function"
      >freeInCtxt</a
      ><a name="10292"
      > </a
      ><a name="10293" href="StlcProp.html#10244" class="Bound"
      >x&#8712;t&#8322;</a
      ><a name="10297"
      > </a
      ><a name="10298" href="StlcProp.html#10264" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="10302"
      >
</a
      ><a name="10303" href="StlcProp.html#8323" class="Function"
      >freeInCtxt</a
      ><a name="10313"
      > </a
      ><a name="10314" class="Symbol"
      >(</a
      ><a name="10315" href="StlcProp.html#7382" class="InductiveConstructor"
      >if3</a
      ><a name="10318"
      > </a
      ><a name="10319" href="StlcProp.html#10319" class="Bound"
      >x&#8712;t&#8323;</a
      ><a name="10323" class="Symbol"
      >)</a
      ><a name="10324"
      > </a
      ><a name="10325" class="Symbol"
      >(</a
      ><a name="10326" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >if</a
      ><a name="10328"
      > </a
      ><a name="10329" class="Symbol"
      >_</a
      ><a name="10330"
      >    </a
      ><a name="10334" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >then</a
      ><a name="10338"
      > </a
      ><a name="10339" class="Symbol"
      >_</a
      ><a name="10340"
      >    </a
      ><a name="10344" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >else</a
      ><a name="10348"
      > </a
      ><a name="10349" href="StlcProp.html#10349" class="Bound"
      >t&#8323;&#8758;A</a
      ><a name="10353" class="Symbol"
      >)</a
      ><a name="10354"
      > </a
      ><a name="10355" class="Symbol"
      >=</a
      ><a name="10356"
      > </a
      ><a name="10357" href="StlcProp.html#8323" class="Function"
      >freeInCtxt</a
      ><a name="10367"
      > </a
      ><a name="10368" href="StlcProp.html#10319" class="Bound"
      >x&#8712;t&#8323;</a
      ><a name="10372"
      > </a
      ><a name="10373" href="StlcProp.html#10349" class="Bound"
      >t&#8323;&#8758;A</a
      ><a name="10377"
      >
</a
      ><a name="10378" href="StlcProp.html#8323" class="Function"
      >freeInCtxt</a
      ><a name="10388"
      > </a
      ><a name="10389" class="Symbol"
      >{</a
      ><a name="10390" href="StlcProp.html#10390" class="Bound"
      >x</a
      ><a name="10391" class="Symbol"
      >}</a
      ><a name="10392"
      > </a
      ><a name="10393" class="Symbol"
      >(</a
      ><a name="10394" href="StlcProp.html#7071" class="InductiveConstructor"
      >abs</a
      ><a name="10397"
      > </a
      ><a name="10398" class="Symbol"
      >{</a
      ><a name="10399" href="StlcProp.html#10399" class="Bound"
      >y</a
      ><a name="10400" class="Symbol"
      >}</a
      ><a name="10401"
      > </a
      ><a name="10402" href="StlcProp.html#10402" class="Bound"
      >y&#8800;x</a
      ><a name="10405"
      > </a
      ><a name="10406" href="StlcProp.html#10406" class="Bound"
      >x&#8712;t</a
      ><a name="10409" class="Symbol"
      >)</a
      ><a name="10410"
      > </a
      ><a name="10411" class="Symbol"
      >(</a
      ><a name="10412" href="Stlc.html#19766" class="InductiveConstructor"
      >abs</a
      ><a name="10415"
      > </a
      ><a name="10416" href="StlcProp.html#10416" class="Bound"
      >t&#8758;B</a
      ><a name="10419" class="Symbol"
      >)</a
      ><a name="10420"
      >
    </a
      ><a name="10425" class="Keyword"
      >with</a
      ><a name="10429"
      > </a
      ><a name="10430" href="StlcProp.html#8323" class="Function"
      >freeInCtxt</a
      ><a name="10440"
      > </a
      ><a name="10441" href="StlcProp.html#10406" class="Bound"
      >x&#8712;t</a
      ><a name="10444"
      > </a
      ><a name="10445" href="StlcProp.html#10416" class="Bound"
      >t&#8758;B</a
      ><a name="10448"
      >
</a
      ><a name="10449" class="Symbol"
      >...</a
      ><a name="10452"
      > </a
      ><a name="10453" class="Symbol"
      >|</a
      ><a name="10454"
      > </a
      ><a name="10455" href="StlcProp.html#10455" class="Bound"
      >x&#8758;A</a
      ><a name="10458"
      >
    </a
      ><a name="10463" class="Keyword"
      >with</a
      ><a name="10467"
      > </a
      ><a name="10468" href="StlcProp.html#10399" class="Bound"
      >y</a
      ><a name="10469"
      > </a
      ><a name="10470" href="Stlc.html#5853" class="Function Operator"
      >&#8799;</a
      ><a name="10471"
      > </a
      ><a name="10472" href="StlcProp.html#10390" class="Bound"
      >x</a
      ><a name="10473"
      >
</a
      ><a name="10474" class="Symbol"
      >...</a
      ><a name="10477"
      > </a
      ><a name="10478" class="Symbol"
      >|</a
      ><a name="10479"
      > </a
      ><a name="10480" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="10483"
      > </a
      ><a name="10484" href="StlcProp.html#10484" class="Bound"
      >y=x</a
      ><a name="10487"
      > </a
      ><a name="10488" class="Symbol"
      >=</a
      ><a name="10489"
      > </a
      ><a name="10490" href="https://agda.github.io/agda-stdlib/Data.Empty.html#348" class="Function"
      >&#8869;-elim</a
      ><a name="10496"
      > </a
      ><a name="10497" class="Symbol"
      >(</a
      ><a name="10498" href="StlcProp.html#10402" class="Bound"
      >y&#8800;x</a
      ><a name="10501"
      > </a
      ><a name="10502" href="StlcProp.html#10484" class="Bound"
      >y=x</a
      ><a name="10505" class="Symbol"
      >)</a
      ><a name="10506"
      >
</a
      ><a name="10507" class="Symbol"
      >...</a
      ><a name="10510"
      > </a
      ><a name="10511" class="Symbol"
      >|</a
      ><a name="10512"
      > </a
      ><a name="10513" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="10515"
      >  </a
      ><a name="10517" class="Symbol"
      >_</a
      ><a name="10518"
      >   </a
      ><a name="10521" class="Symbol"
      >=</a
      ><a name="10522"
      > </a
      ><a name="10523" href="StlcProp.html#10455" class="Bound"
      >x&#8758;A</a
      >
{% endraw %}</pre>

Next, we'll need the fact that any term $$t$$ which is well typed in
the empty context is closed (it has no free variables).

#### Exercise: 2 stars, optional (∅⊢-closed)

<pre class="Agda">{% raw %}
<a name="10724" class="Keyword"
      >postulate</a
      ><a name="10733"
      >
  </a
      ><a name="10736" href="StlcProp.html#10736" class="Postulate"
      >&#8709;&#8866;-closed</a
      ><a name="10745"
      > </a
      ><a name="10746" class="Symbol"
      >:</a
      ><a name="10747"
      > </a
      ><a name="10748" class="Symbol"
      >&#8704;</a
      ><a name="10749"
      > </a
      ><a name="10750" class="Symbol"
      >{</a
      ><a name="10751" href="StlcProp.html#10751" class="Bound"
      >t</a
      ><a name="10752"
      > </a
      ><a name="10753" href="StlcProp.html#10753" class="Bound"
      >A</a
      ><a name="10754" class="Symbol"
      >}</a
      ><a name="10755"
      > </a
      ><a name="10756" class="Symbol"
      >&#8594;</a
      ><a name="10757"
      > </a
      ><a name="10758" href="Stlc.html#18658" class="Function"
      >&#8709;</a
      ><a name="10759"
      > </a
      ><a name="10760" href="Stlc.html#19629" class="Datatype Operator"
      >&#8866;</a
      ><a name="10761"
      > </a
      ><a name="10762" href="StlcProp.html#10751" class="Bound"
      >t</a
      ><a name="10763"
      > </a
      ><a name="10764" href="Stlc.html#19629" class="Datatype Operator"
      >&#8758;</a
      ><a name="10765"
      > </a
      ><a name="10766" href="StlcProp.html#10753" class="Bound"
      >A</a
      ><a name="10767"
      > </a
      ><a name="10768" class="Symbol"
      >&#8594;</a
      ><a name="10769"
      > </a
      ><a name="10770" href="StlcProp.html#7542" class="Function"
      >Closed</a
      ><a name="10776"
      > </a
      ><a name="10777" href="StlcProp.html#10751" class="Bound"
      >t</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="10825" href="StlcProp.html#10825" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="10835"
      > </a
      ><a name="10836" class="Symbol"
      >:</a
      ><a name="10837"
      > </a
      ><a name="10838" class="Symbol"
      >&#8704;</a
      ><a name="10839"
      > </a
      ><a name="10840" class="Symbol"
      >{</a
      ><a name="10841" href="StlcProp.html#10841" class="Bound"
      >t</a
      ><a name="10842"
      > </a
      ><a name="10843" href="StlcProp.html#10843" class="Bound"
      >A</a
      ><a name="10844" class="Symbol"
      >}</a
      ><a name="10845"
      > </a
      ><a name="10846" class="Symbol"
      >&#8594;</a
      ><a name="10847"
      > </a
      ><a name="10848" href="Stlc.html#18658" class="Function"
      >&#8709;</a
      ><a name="10849"
      > </a
      ><a name="10850" href="Stlc.html#19629" class="Datatype Operator"
      >&#8866;</a
      ><a name="10851"
      > </a
      ><a name="10852" href="StlcProp.html#10841" class="Bound"
      >t</a
      ><a name="10853"
      > </a
      ><a name="10854" href="Stlc.html#19629" class="Datatype Operator"
      >&#8758;</a
      ><a name="10855"
      > </a
      ><a name="10856" href="StlcProp.html#10843" class="Bound"
      >A</a
      ><a name="10857"
      > </a
      ><a name="10858" class="Symbol"
      >&#8594;</a
      ><a name="10859"
      > </a
      ><a name="10860" href="StlcProp.html#7542" class="Function"
      >Closed</a
      ><a name="10866"
      > </a
      ><a name="10867" href="StlcProp.html#10841" class="Bound"
      >t</a
      ><a name="10868"
      >
</a
      ><a name="10869" href="StlcProp.html#10825" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="10879"
      > </a
      ><a name="10880" class="Symbol"
      >(</a
      ><a name="10881" href="Stlc.html#19673" class="InductiveConstructor"
      >var</a
      ><a name="10884"
      > </a
      ><a name="10885" href="StlcProp.html#10885" class="Bound"
      >x</a
      ><a name="10886"
      > </a
      ><a name="10887" class="Symbol"
      >())</a
      ><a name="10890"
      >
</a
      ><a name="10891" href="StlcProp.html#10825" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="10901"
      > </a
      ><a name="10902" class="Symbol"
      >(</a
      ><a name="10903" href="Stlc.html#19882" class="InductiveConstructor"
      >app</a
      ><a name="10906"
      > </a
      ><a name="10907" href="StlcProp.html#10907" class="Bound"
      >t&#8321;&#8758;A&#8658;B</a
      ><a name="10913"
      > </a
      ><a name="10914" href="StlcProp.html#10914" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="10918" class="Symbol"
      >)</a
      ><a name="10919"
      > </a
      ><a name="10920" class="Symbol"
      >(</a
      ><a name="10921" href="StlcProp.html#7132" class="InductiveConstructor"
      >app1</a
      ><a name="10925"
      > </a
      ><a name="10926" href="StlcProp.html#10926" class="Bound"
      >x&#8712;t&#8321;</a
      ><a name="10930" class="Symbol"
      >)</a
      ><a name="10931"
      > </a
      ><a name="10932" class="Symbol"
      >=</a
      ><a name="10933"
      > </a
      ><a name="10934" href="StlcProp.html#10825" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="10944"
      > </a
      ><a name="10945" href="StlcProp.html#10907" class="Bound"
      >t&#8321;&#8758;A&#8658;B</a
      ><a name="10951"
      > </a
      ><a name="10952" href="StlcProp.html#10926" class="Bound"
      >x&#8712;t&#8321;</a
      ><a name="10956"
      >
</a
      ><a name="10957" href="StlcProp.html#10825" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="10967"
      > </a
      ><a name="10968" class="Symbol"
      >(</a
      ><a name="10969" href="Stlc.html#19882" class="InductiveConstructor"
      >app</a
      ><a name="10972"
      > </a
      ><a name="10973" href="StlcProp.html#10973" class="Bound"
      >t&#8321;&#8758;A&#8658;B</a
      ><a name="10979"
      > </a
      ><a name="10980" href="StlcProp.html#10980" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="10984" class="Symbol"
      >)</a
      ><a name="10985"
      > </a
      ><a name="10986" class="Symbol"
      >(</a
      ><a name="10987" href="StlcProp.html#7186" class="InductiveConstructor"
      >app2</a
      ><a name="10991"
      > </a
      ><a name="10992" href="StlcProp.html#10992" class="Bound"
      >x&#8712;t&#8322;</a
      ><a name="10996" class="Symbol"
      >)</a
      ><a name="10997"
      > </a
      ><a name="10998" class="Symbol"
      >=</a
      ><a name="10999"
      > </a
      ><a name="11000" href="StlcProp.html#10825" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11010"
      > </a
      ><a name="11011" href="StlcProp.html#10980" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="11015"
      > </a
      ><a name="11016" href="StlcProp.html#10992" class="Bound"
      >x&#8712;t&#8322;</a
      ><a name="11020"
      >
</a
      ><a name="11021" href="StlcProp.html#10825" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11031"
      > </a
      ><a name="11032" href="Stlc.html#20016" class="InductiveConstructor"
      >true</a
      ><a name="11036"
      >  </a
      ><a name="11038" class="Symbol"
      >()</a
      ><a name="11040"
      >
</a
      ><a name="11041" href="StlcProp.html#10825" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11051"
      > </a
      ><a name="11052" href="Stlc.html#20075" class="InductiveConstructor"
      >false</a
      ><a name="11057"
      > </a
      ><a name="11058" class="Symbol"
      >()</a
      ><a name="11060"
      >
</a
      ><a name="11061" href="StlcProp.html#10825" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11071"
      > </a
      ><a name="11072" class="Symbol"
      >(</a
      ><a name="11073" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >if</a
      ><a name="11075"
      > </a
      ><a name="11076" href="StlcProp.html#11076" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="11083"
      > </a
      ><a name="11084" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >then</a
      ><a name="11088"
      > </a
      ><a name="11089" href="StlcProp.html#11089" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="11093"
      > </a
      ><a name="11094" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >else</a
      ><a name="11098"
      > </a
      ><a name="11099" href="StlcProp.html#11099" class="Bound"
      >t&#8323;&#8758;A</a
      ><a name="11103" class="Symbol"
      >)</a
      ><a name="11104"
      > </a
      ><a name="11105" class="Symbol"
      >(</a
      ><a name="11106" href="StlcProp.html#7240" class="InductiveConstructor"
      >if1</a
      ><a name="11109"
      > </a
      ><a name="11110" href="StlcProp.html#11110" class="Bound"
      >x&#8712;t&#8321;</a
      ><a name="11114" class="Symbol"
      >)</a
      ><a name="11115"
      > </a
      ><a name="11116" class="Symbol"
      >=</a
      ><a name="11117"
      > </a
      ><a name="11118" href="StlcProp.html#10825" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11128"
      > </a
      ><a name="11129" href="StlcProp.html#11076" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="11136"
      > </a
      ><a name="11137" href="StlcProp.html#11110" class="Bound"
      >x&#8712;t&#8321;</a
      ><a name="11141"
      >
</a
      ><a name="11142" href="StlcProp.html#10825" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11152"
      > </a
      ><a name="11153" class="Symbol"
      >(</a
      ><a name="11154" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >if</a
      ><a name="11156"
      > </a
      ><a name="11157" href="StlcProp.html#11157" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="11164"
      > </a
      ><a name="11165" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >then</a
      ><a name="11169"
      > </a
      ><a name="11170" href="StlcProp.html#11170" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="11174"
      > </a
      ><a name="11175" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >else</a
      ><a name="11179"
      > </a
      ><a name="11180" href="StlcProp.html#11180" class="Bound"
      >t&#8323;&#8758;A</a
      ><a name="11184" class="Symbol"
      >)</a
      ><a name="11185"
      > </a
      ><a name="11186" class="Symbol"
      >(</a
      ><a name="11187" href="StlcProp.html#7311" class="InductiveConstructor"
      >if2</a
      ><a name="11190"
      > </a
      ><a name="11191" href="StlcProp.html#11191" class="Bound"
      >x&#8712;t&#8322;</a
      ><a name="11195" class="Symbol"
      >)</a
      ><a name="11196"
      > </a
      ><a name="11197" class="Symbol"
      >=</a
      ><a name="11198"
      > </a
      ><a name="11199" href="StlcProp.html#10825" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11209"
      > </a
      ><a name="11210" href="StlcProp.html#11170" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="11214"
      > </a
      ><a name="11215" href="StlcProp.html#11191" class="Bound"
      >x&#8712;t&#8322;</a
      ><a name="11219"
      >
</a
      ><a name="11220" href="StlcProp.html#10825" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11230"
      > </a
      ><a name="11231" class="Symbol"
      >(</a
      ><a name="11232" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >if</a
      ><a name="11234"
      > </a
      ><a name="11235" href="StlcProp.html#11235" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="11242"
      > </a
      ><a name="11243" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >then</a
      ><a name="11247"
      > </a
      ><a name="11248" href="StlcProp.html#11248" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="11252"
      > </a
      ><a name="11253" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >else</a
      ><a name="11257"
      > </a
      ><a name="11258" href="StlcProp.html#11258" class="Bound"
      >t&#8323;&#8758;A</a
      ><a name="11262" class="Symbol"
      >)</a
      ><a name="11263"
      > </a
      ><a name="11264" class="Symbol"
      >(</a
      ><a name="11265" href="StlcProp.html#7382" class="InductiveConstructor"
      >if3</a
      ><a name="11268"
      > </a
      ><a name="11269" href="StlcProp.html#11269" class="Bound"
      >x&#8712;t&#8323;</a
      ><a name="11273" class="Symbol"
      >)</a
      ><a name="11274"
      > </a
      ><a name="11275" class="Symbol"
      >=</a
      ><a name="11276"
      > </a
      ><a name="11277" href="StlcProp.html#10825" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11287"
      > </a
      ><a name="11288" href="StlcProp.html#11258" class="Bound"
      >t&#8323;&#8758;A</a
      ><a name="11292"
      > </a
      ><a name="11293" href="StlcProp.html#11269" class="Bound"
      >x&#8712;t&#8323;</a
      ><a name="11297"
      >
</a
      ><a name="11298" href="StlcProp.html#10825" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11308"
      > </a
      ><a name="11309" class="Symbol"
      >(</a
      ><a name="11310" href="Stlc.html#19766" class="InductiveConstructor"
      >abs</a
      ><a name="11313"
      > </a
      ><a name="11314" class="Symbol"
      >{</a
      ><a name="11315" class="Argument"
      >x</a
      ><a name="11316"
      > </a
      ><a name="11317" class="Symbol"
      >=</a
      ><a name="11318"
      > </a
      ><a name="11319" href="StlcProp.html#11319" class="Bound"
      >x</a
      ><a name="11320" class="Symbol"
      >}</a
      ><a name="11321"
      > </a
      ><a name="11322" href="StlcProp.html#11322" class="Bound"
      >t&#8242;&#8758;A</a
      ><a name="11326" class="Symbol"
      >)</a
      ><a name="11327"
      > </a
      ><a name="11328" class="Symbol"
      >{</a
      ><a name="11329" href="StlcProp.html#11329" class="Bound"
      >y</a
      ><a name="11330" class="Symbol"
      >}</a
      ><a name="11331"
      > </a
      ><a name="11332" class="Symbol"
      >(</a
      ><a name="11333" href="StlcProp.html#7071" class="InductiveConstructor"
      >abs</a
      ><a name="11336"
      > </a
      ><a name="11337" href="StlcProp.html#11337" class="Bound"
      >x&#8800;y</a
      ><a name="11340"
      > </a
      ><a name="11341" href="StlcProp.html#11341" class="Bound"
      >y&#8712;t&#8242;</a
      ><a name="11345" class="Symbol"
      >)</a
      ><a name="11346"
      > </a
      ><a name="11347" class="Keyword"
      >with</a
      ><a name="11351"
      > </a
      ><a name="11352" href="StlcProp.html#8323" class="Function"
      >freeInCtxt</a
      ><a name="11362"
      > </a
      ><a name="11363" href="StlcProp.html#11341" class="Bound"
      >y&#8712;t&#8242;</a
      ><a name="11367"
      > </a
      ><a name="11368" href="StlcProp.html#11322" class="Bound"
      >t&#8242;&#8758;A</a
      ><a name="11372"
      >
</a
      ><a name="11373" href="StlcProp.html#10825" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11383"
      > </a
      ><a name="11384" class="Symbol"
      >(</a
      ><a name="11385" class="InductiveConstructor"
      >abs</a
      ><a name="11388"
      > </a
      ><a name="11389" class="Symbol"
      >{</a
      ><a name="11390" class="Argument"
      >x</a
      ><a name="11391"
      > </a
      ><a name="11392" class="Symbol"
      >=</a
      ><a name="11393"
      > </a
      ><a name="11394" href="StlcProp.html#11394" class="Bound"
      >x</a
      ><a name="11395" class="Symbol"
      >}</a
      ><a name="11396"
      > </a
      ><a name="11397" href="StlcProp.html#11397" class="Bound"
      >t&#8242;&#8758;A</a
      ><a name="11401" class="Symbol"
      >)</a
      ><a name="11402"
      > </a
      ><a name="11403" class="Symbol"
      >{</a
      ><a name="11404" href="StlcProp.html#11404" class="Bound"
      >y</a
      ><a name="11405" class="Symbol"
      >}</a
      ><a name="11406"
      > </a
      ><a name="11407" class="Symbol"
      >(</a
      ><a name="11408" class="InductiveConstructor"
      >abs</a
      ><a name="11411"
      > </a
      ><a name="11412" href="StlcProp.html#11412" class="Bound"
      >x&#8800;y</a
      ><a name="11415"
      > </a
      ><a name="11416" href="StlcProp.html#11416" class="Bound"
      >y&#8712;t&#8242;</a
      ><a name="11420" class="Symbol"
      >)</a
      ><a name="11421"
      > </a
      ><a name="11422" class="Symbol"
      >|</a
      ><a name="11423"
      > </a
      ><a name="11424" href="StlcProp.html#11424" class="Bound"
      >A</a
      ><a name="11425"
      > </a
      ><a name="11426" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="11427"
      > </a
      ><a name="11428" href="StlcProp.html#11428" class="Bound"
      >y&#8758;A</a
      ><a name="11431"
      > </a
      ><a name="11432" class="Keyword"
      >with</a
      ><a name="11436"
      > </a
      ><a name="11437" href="StlcProp.html#11394" class="Bound"
      >x</a
      ><a name="11438"
      > </a
      ><a name="11439" href="Stlc.html#5853" class="Function Operator"
      >&#8799;</a
      ><a name="11440"
      > </a
      ><a name="11441" href="StlcProp.html#11404" class="Bound"
      >y</a
      ><a name="11442"
      >
</a
      ><a name="11443" href="StlcProp.html#10825" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11453"
      > </a
      ><a name="11454" class="Symbol"
      >(</a
      ><a name="11455" class="InductiveConstructor"
      >abs</a
      ><a name="11458"
      > </a
      ><a name="11459" class="Symbol"
      >{</a
      ><a name="11460" class="Argument"
      >x</a
      ><a name="11461"
      > </a
      ><a name="11462" class="Symbol"
      >=</a
      ><a name="11463"
      > </a
      ><a name="11464" href="StlcProp.html#11464" class="Bound"
      >x</a
      ><a name="11465" class="Symbol"
      >}</a
      ><a name="11466"
      > </a
      ><a name="11467" href="StlcProp.html#11467" class="Bound"
      >t&#8242;&#8758;A</a
      ><a name="11471" class="Symbol"
      >)</a
      ><a name="11472"
      > </a
      ><a name="11473" class="Symbol"
      >{</a
      ><a name="11474" href="StlcProp.html#11474" class="Bound"
      >y</a
      ><a name="11475" class="Symbol"
      >}</a
      ><a name="11476"
      > </a
      ><a name="11477" class="Symbol"
      >(</a
      ><a name="11478" class="InductiveConstructor"
      >abs</a
      ><a name="11481"
      > </a
      ><a name="11482" href="StlcProp.html#11482" class="Bound"
      >x&#8800;y</a
      ><a name="11485"
      > </a
      ><a name="11486" href="StlcProp.html#11486" class="Bound"
      >y&#8712;t&#8242;</a
      ><a name="11490" class="Symbol"
      >)</a
      ><a name="11491"
      > </a
      ><a name="11492" class="Symbol"
      >|</a
      ><a name="11493"
      > </a
      ><a name="11494" href="StlcProp.html#11494" class="Bound"
      >A</a
      ><a name="11495"
      > </a
      ><a name="11496" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="11497"
      > </a
      ><a name="11498" href="StlcProp.html#11498" class="Bound"
      >y&#8758;A</a
      ><a name="11501"
      > </a
      ><a name="11502" class="Symbol"
      >|</a
      ><a name="11503"
      > </a
      ><a name="11504" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="11507"
      > </a
      ><a name="11508" href="StlcProp.html#11508" class="Bound"
      >x=y</a
      ><a name="11511"
      > </a
      ><a name="11512" class="Symbol"
      >=</a
      ><a name="11513"
      > </a
      ><a name="11514" href="StlcProp.html#11482" class="Bound"
      >x&#8800;y</a
      ><a name="11517"
      > </a
      ><a name="11518" href="StlcProp.html#11508" class="Bound"
      >x=y</a
      ><a name="11521"
      >
</a
      ><a name="11522" href="StlcProp.html#10825" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11532"
      > </a
      ><a name="11533" class="Symbol"
      >(</a
      ><a name="11534" class="InductiveConstructor"
      >abs</a
      ><a name="11537"
      > </a
      ><a name="11538" class="Symbol"
      >{</a
      ><a name="11539" class="Argument"
      >x</a
      ><a name="11540"
      > </a
      ><a name="11541" class="Symbol"
      >=</a
      ><a name="11542"
      > </a
      ><a name="11543" href="StlcProp.html#11543" class="Bound"
      >x</a
      ><a name="11544" class="Symbol"
      >}</a
      ><a name="11545"
      > </a
      ><a name="11546" href="StlcProp.html#11546" class="Bound"
      >t&#8242;&#8758;A</a
      ><a name="11550" class="Symbol"
      >)</a
      ><a name="11551"
      > </a
      ><a name="11552" class="Symbol"
      >{</a
      ><a name="11553" href="StlcProp.html#11553" class="Bound"
      >y</a
      ><a name="11554" class="Symbol"
      >}</a
      ><a name="11555"
      > </a
      ><a name="11556" class="Symbol"
      >(</a
      ><a name="11557" class="InductiveConstructor"
      >abs</a
      ><a name="11560"
      > </a
      ><a name="11561" href="StlcProp.html#11561" class="Bound"
      >x&#8800;y</a
      ><a name="11564"
      > </a
      ><a name="11565" href="StlcProp.html#11565" class="Bound"
      >y&#8712;t&#8242;</a
      ><a name="11569" class="Symbol"
      >)</a
      ><a name="11570"
      > </a
      ><a name="11571" class="Symbol"
      >|</a
      ><a name="11572"
      > </a
      ><a name="11573" href="StlcProp.html#11573" class="Bound"
      >A</a
      ><a name="11574"
      > </a
      ><a name="11575" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="11576"
      > </a
      ><a name="11577" class="Symbol"
      >()</a
      ><a name="11579"
      >  </a
      ><a name="11581" class="Symbol"
      >|</a
      ><a name="11582"
      > </a
      ><a name="11583" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="11585"
      >  </a
      ><a name="11587" class="Symbol"
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
<a name="11975" href="StlcProp.html#11975" class="Function"
      >replaceCtxt</a
      ><a name="11986"
      > </a
      ><a name="11987" class="Symbol"
      >:</a
      ><a name="11988"
      > </a
      ><a name="11989" class="Symbol"
      >&#8704;</a
      ><a name="11990"
      > </a
      ><a name="11991" class="Symbol"
      >{</a
      ><a name="11992" href="StlcProp.html#11992" class="Bound"
      >&#915;</a
      ><a name="11993"
      > </a
      ><a name="11994" href="StlcProp.html#11994" class="Bound"
      >&#915;&#8242;</a
      ><a name="11996"
      > </a
      ><a name="11997" href="StlcProp.html#11997" class="Bound"
      >t</a
      ><a name="11998"
      > </a
      ><a name="11999" href="StlcProp.html#11999" class="Bound"
      >A</a
      ><a name="12000" class="Symbol"
      >}</a
      ><a name="12001"
      >
            </a
      ><a name="12014" class="Symbol"
      >&#8594;</a
      ><a name="12015"
      > </a
      ><a name="12016" class="Symbol"
      >(&#8704;</a
      ><a name="12018"
      > </a
      ><a name="12019" class="Symbol"
      >{</a
      ><a name="12020" href="StlcProp.html#12020" class="Bound"
      >x</a
      ><a name="12021" class="Symbol"
      >}</a
      ><a name="12022"
      > </a
      ><a name="12023" class="Symbol"
      >&#8594;</a
      ><a name="12024"
      > </a
      ><a name="12025" href="StlcProp.html#12020" class="Bound"
      >x</a
      ><a name="12026"
      > </a
      ><a name="12027" href="StlcProp.html#7008" class="Datatype Operator"
      >FreeIn</a
      ><a name="12033"
      > </a
      ><a name="12034" href="StlcProp.html#11997" class="Bound"
      >t</a
      ><a name="12035"
      > </a
      ><a name="12036" class="Symbol"
      >&#8594;</a
      ><a name="12037"
      > </a
      ><a name="12038" href="StlcProp.html#11992" class="Bound"
      >&#915;</a
      ><a name="12039"
      > </a
      ><a name="12040" href="StlcProp.html#12020" class="Bound"
      >x</a
      ><a name="12041"
      > </a
      ><a name="12042" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="12043"
      > </a
      ><a name="12044" href="StlcProp.html#11994" class="Bound"
      >&#915;&#8242;</a
      ><a name="12046"
      > </a
      ><a name="12047" href="StlcProp.html#12020" class="Bound"
      >x</a
      ><a name="12048" class="Symbol"
      >)</a
      ><a name="12049"
      >
            </a
      ><a name="12062" class="Symbol"
      >&#8594;</a
      ><a name="12063"
      > </a
      ><a name="12064" href="StlcProp.html#11992" class="Bound"
      >&#915;</a
      ><a name="12065"
      >  </a
      ><a name="12067" href="Stlc.html#19629" class="Datatype Operator"
      >&#8866;</a
      ><a name="12068"
      > </a
      ><a name="12069" href="StlcProp.html#11997" class="Bound"
      >t</a
      ><a name="12070"
      > </a
      ><a name="12071" href="Stlc.html#19629" class="Datatype Operator"
      >&#8758;</a
      ><a name="12072"
      > </a
      ><a name="12073" href="StlcProp.html#11999" class="Bound"
      >A</a
      ><a name="12074"
      >
            </a
      ><a name="12087" class="Symbol"
      >&#8594;</a
      ><a name="12088"
      > </a
      ><a name="12089" href="StlcProp.html#11994" class="Bound"
      >&#915;&#8242;</a
      ><a name="12091"
      > </a
      ><a name="12092" href="Stlc.html#19629" class="Datatype Operator"
      >&#8866;</a
      ><a name="12093"
      > </a
      ><a name="12094" href="StlcProp.html#11997" class="Bound"
      >t</a
      ><a name="12095"
      > </a
      ><a name="12096" href="Stlc.html#19629" class="Datatype Operator"
      >&#8758;</a
      ><a name="12097"
      > </a
      ><a name="12098" href="StlcProp.html#11999" class="Bound"
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
<a name="14402" href="StlcProp.html#11975" class="Function"
      >replaceCtxt</a
      ><a name="14413"
      > </a
      ><a name="14414" href="StlcProp.html#14414" class="Bound"
      >f</a
      ><a name="14415"
      > </a
      ><a name="14416" class="Symbol"
      >(</a
      ><a name="14417" href="Stlc.html#19673" class="InductiveConstructor"
      >var</a
      ><a name="14420"
      > </a
      ><a name="14421" href="StlcProp.html#14421" class="Bound"
      >x</a
      ><a name="14422"
      > </a
      ><a name="14423" href="StlcProp.html#14423" class="Bound"
      >x&#8758;A</a
      ><a name="14426" class="Symbol"
      >)</a
      ><a name="14427"
      > </a
      ><a name="14428" class="Keyword"
      >rewrite</a
      ><a name="14435"
      > </a
      ><a name="14436" href="StlcProp.html#14414" class="Bound"
      >f</a
      ><a name="14437"
      > </a
      ><a name="14438" href="StlcProp.html#7047" class="InductiveConstructor"
      >var</a
      ><a name="14441"
      > </a
      ><a name="14442" class="Symbol"
      >=</a
      ><a name="14443"
      > </a
      ><a name="14444" href="Stlc.html#19673" class="InductiveConstructor"
      >var</a
      ><a name="14447"
      > </a
      ><a name="14448" href="StlcProp.html#14421" class="Bound"
      >x</a
      ><a name="14449"
      > </a
      ><a name="14450" href="StlcProp.html#14423" class="Bound"
      >x&#8758;A</a
      ><a name="14453"
      >
</a
      ><a name="14454" href="StlcProp.html#11975" class="Function"
      >replaceCtxt</a
      ><a name="14465"
      > </a
      ><a name="14466" href="StlcProp.html#14466" class="Bound"
      >f</a
      ><a name="14467"
      > </a
      ><a name="14468" class="Symbol"
      >(</a
      ><a name="14469" href="Stlc.html#19882" class="InductiveConstructor"
      >app</a
      ><a name="14472"
      > </a
      ><a name="14473" href="StlcProp.html#14473" class="Bound"
      >t&#8321;&#8758;A&#8658;B</a
      ><a name="14479"
      > </a
      ><a name="14480" href="StlcProp.html#14480" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="14484" class="Symbol"
      >)</a
      ><a name="14485"
      >
  </a
      ><a name="14488" class="Symbol"
      >=</a
      ><a name="14489"
      > </a
      ><a name="14490" href="Stlc.html#19882" class="InductiveConstructor"
      >app</a
      ><a name="14493"
      > </a
      ><a name="14494" class="Symbol"
      >(</a
      ><a name="14495" href="StlcProp.html#11975" class="Function"
      >replaceCtxt</a
      ><a name="14506"
      > </a
      ><a name="14507" class="Symbol"
      >(</a
      ><a name="14508" href="StlcProp.html#14466" class="Bound"
      >f</a
      ><a name="14509"
      > </a
      ><a name="14510" href="https://agda.github.io/agda-stdlib/Function.html#713" class="Function Operator"
      >&#8728;</a
      ><a name="14511"
      > </a
      ><a name="14512" href="StlcProp.html#7132" class="InductiveConstructor"
      >app1</a
      ><a name="14516" class="Symbol"
      >)</a
      ><a name="14517"
      > </a
      ><a name="14518" href="StlcProp.html#14473" class="Bound"
      >t&#8321;&#8758;A&#8658;B</a
      ><a name="14524" class="Symbol"
      >)</a
      ><a name="14525"
      > </a
      ><a name="14526" class="Symbol"
      >(</a
      ><a name="14527" href="StlcProp.html#11975" class="Function"
      >replaceCtxt</a
      ><a name="14538"
      > </a
      ><a name="14539" class="Symbol"
      >(</a
      ><a name="14540" href="StlcProp.html#14466" class="Bound"
      >f</a
      ><a name="14541"
      > </a
      ><a name="14542" href="https://agda.github.io/agda-stdlib/Function.html#713" class="Function Operator"
      >&#8728;</a
      ><a name="14543"
      > </a
      ><a name="14544" href="StlcProp.html#7186" class="InductiveConstructor"
      >app2</a
      ><a name="14548" class="Symbol"
      >)</a
      ><a name="14549"
      > </a
      ><a name="14550" href="StlcProp.html#14480" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="14554" class="Symbol"
      >)</a
      ><a name="14555"
      >
</a
      ><a name="14556" href="StlcProp.html#11975" class="Function"
      >replaceCtxt</a
      ><a name="14567"
      > </a
      ><a name="14568" class="Symbol"
      >{</a
      ><a name="14569" href="StlcProp.html#14569" class="Bound"
      >&#915;</a
      ><a name="14570" class="Symbol"
      >}</a
      ><a name="14571"
      > </a
      ><a name="14572" class="Symbol"
      >{</a
      ><a name="14573" href="StlcProp.html#14573" class="Bound"
      >&#915;&#8242;</a
      ><a name="14575" class="Symbol"
      >}</a
      ><a name="14576"
      > </a
      ><a name="14577" href="StlcProp.html#14577" class="Bound"
      >f</a
      ><a name="14578"
      > </a
      ><a name="14579" class="Symbol"
      >(</a
      ><a name="14580" href="Stlc.html#19766" class="InductiveConstructor"
      >abs</a
      ><a name="14583"
      > </a
      ><a name="14584" class="Symbol"
      >{</a
      ><a name="14585" class="DottedPattern Symbol"
      >.</a
      ><a name="14586" href="StlcProp.html#14569" class="DottedPattern Bound"
      >&#915;</a
      ><a name="14587" class="Symbol"
      >}</a
      ><a name="14588"
      > </a
      ><a name="14589" class="Symbol"
      >{</a
      ><a name="14590" href="StlcProp.html#14590" class="Bound"
      >x</a
      ><a name="14591" class="Symbol"
      >}</a
      ><a name="14592"
      > </a
      ><a name="14593" class="Symbol"
      >{</a
      ><a name="14594" href="StlcProp.html#14594" class="Bound"
      >A</a
      ><a name="14595" class="Symbol"
      >}</a
      ><a name="14596"
      > </a
      ><a name="14597" class="Symbol"
      >{</a
      ><a name="14598" href="StlcProp.html#14598" class="Bound"
      >B</a
      ><a name="14599" class="Symbol"
      >}</a
      ><a name="14600"
      > </a
      ><a name="14601" class="Symbol"
      >{</a
      ><a name="14602" href="StlcProp.html#14602" class="Bound"
      >t&#8242;</a
      ><a name="14604" class="Symbol"
      >}</a
      ><a name="14605"
      > </a
      ><a name="14606" href="StlcProp.html#14606" class="Bound"
      >t&#8242;&#8758;B</a
      ><a name="14610" class="Symbol"
      >)</a
      ><a name="14611"
      >
  </a
      ><a name="14614" class="Symbol"
      >=</a
      ><a name="14615"
      > </a
      ><a name="14616" href="Stlc.html#19766" class="InductiveConstructor"
      >abs</a
      ><a name="14619"
      > </a
      ><a name="14620" class="Symbol"
      >(</a
      ><a name="14621" href="StlcProp.html#11975" class="Function"
      >replaceCtxt</a
      ><a name="14632"
      > </a
      ><a name="14633" href="StlcProp.html#14654" class="Function"
      >f&#8242;</a
      ><a name="14635"
      > </a
      ><a name="14636" href="StlcProp.html#14606" class="Bound"
      >t&#8242;&#8758;B</a
      ><a name="14640" class="Symbol"
      >)</a
      ><a name="14641"
      >
  </a
      ><a name="14644" class="Keyword"
      >where</a
      ><a name="14649"
      >
    </a
      ><a name="14654" href="StlcProp.html#14654" class="Function"
      >f&#8242;</a
      ><a name="14656"
      > </a
      ><a name="14657" class="Symbol"
      >:</a
      ><a name="14658"
      > </a
      ><a name="14659" class="Symbol"
      >&#8704;</a
      ><a name="14660"
      > </a
      ><a name="14661" class="Symbol"
      >{</a
      ><a name="14662" href="StlcProp.html#14662" class="Bound"
      >y</a
      ><a name="14663" class="Symbol"
      >}</a
      ><a name="14664"
      > </a
      ><a name="14665" class="Symbol"
      >&#8594;</a
      ><a name="14666"
      > </a
      ><a name="14667" href="StlcProp.html#14662" class="Bound"
      >y</a
      ><a name="14668"
      > </a
      ><a name="14669" href="StlcProp.html#7008" class="Datatype Operator"
      >FreeIn</a
      ><a name="14675"
      > </a
      ><a name="14676" href="StlcProp.html#14602" class="Bound"
      >t&#8242;</a
      ><a name="14678"
      > </a
      ><a name="14679" class="Symbol"
      >&#8594;</a
      ><a name="14680"
      > </a
      ><a name="14681" class="Symbol"
      >(</a
      ><a name="14682" href="StlcProp.html#14569" class="Bound"
      >&#915;</a
      ><a name="14683"
      > </a
      ><a name="14684" href="Stlc.html#18686" class="Function Operator"
      >,</a
      ><a name="14685"
      > </a
      ><a name="14686" href="StlcProp.html#14590" class="Bound"
      >x</a
      ><a name="14687"
      > </a
      ><a name="14688" href="Stlc.html#18686" class="Function Operator"
      >&#8758;</a
      ><a name="14689"
      > </a
      ><a name="14690" href="StlcProp.html#14594" class="Bound"
      >A</a
      ><a name="14691" class="Symbol"
      >)</a
      ><a name="14692"
      > </a
      ><a name="14693" href="StlcProp.html#14662" class="Bound"
      >y</a
      ><a name="14694"
      > </a
      ><a name="14695" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="14696"
      > </a
      ><a name="14697" class="Symbol"
      >(</a
      ><a name="14698" href="StlcProp.html#14573" class="Bound"
      >&#915;&#8242;</a
      ><a name="14700"
      > </a
      ><a name="14701" href="Stlc.html#18686" class="Function Operator"
      >,</a
      ><a name="14702"
      > </a
      ><a name="14703" href="StlcProp.html#14590" class="Bound"
      >x</a
      ><a name="14704"
      > </a
      ><a name="14705" href="Stlc.html#18686" class="Function Operator"
      >&#8758;</a
      ><a name="14706"
      > </a
      ><a name="14707" href="StlcProp.html#14594" class="Bound"
      >A</a
      ><a name="14708" class="Symbol"
      >)</a
      ><a name="14709"
      > </a
      ><a name="14710" href="StlcProp.html#14662" class="Bound"
      >y</a
      ><a name="14711"
      >
    </a
      ><a name="14716" href="StlcProp.html#14654" class="Function"
      >f&#8242;</a
      ><a name="14718"
      > </a
      ><a name="14719" class="Symbol"
      >{</a
      ><a name="14720" href="StlcProp.html#14720" class="Bound"
      >y</a
      ><a name="14721" class="Symbol"
      >}</a
      ><a name="14722"
      > </a
      ><a name="14723" href="StlcProp.html#14723" class="Bound"
      >y&#8712;t&#8242;</a
      ><a name="14727"
      > </a
      ><a name="14728" class="Keyword"
      >with</a
      ><a name="14732"
      > </a
      ><a name="14733" href="StlcProp.html#14590" class="Bound"
      >x</a
      ><a name="14734"
      > </a
      ><a name="14735" href="Stlc.html#5853" class="Function Operator"
      >&#8799;</a
      ><a name="14736"
      > </a
      ><a name="14737" href="StlcProp.html#14720" class="Bound"
      >y</a
      ><a name="14738"
      >
    </a
      ><a name="14743" class="Symbol"
      >...</a
      ><a name="14746"
      > </a
      ><a name="14747" class="Symbol"
      >|</a
      ><a name="14748"
      > </a
      ><a name="14749" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="14752"
      > </a
      ><a name="14753" class="Symbol"
      >_</a
      ><a name="14754"
      >   </a
      ><a name="14757" class="Symbol"
      >=</a
      ><a name="14758"
      > </a
      ><a name="14759" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="14763"
      >
    </a
      ><a name="14768" class="Symbol"
      >...</a
      ><a name="14771"
      > </a
      ><a name="14772" class="Symbol"
      >|</a
      ><a name="14773"
      > </a
      ><a name="14774" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="14776"
      >  </a
      ><a name="14778" href="StlcProp.html#14778" class="Bound"
      >x&#8800;y</a
      ><a name="14781"
      > </a
      ><a name="14782" class="Symbol"
      >=</a
      ><a name="14783"
      > </a
      ><a name="14784" href="StlcProp.html#14577" class="Bound"
      >f</a
      ><a name="14785"
      > </a
      ><a name="14786" class="Symbol"
      >(</a
      ><a name="14787" href="StlcProp.html#7071" class="InductiveConstructor"
      >abs</a
      ><a name="14790"
      > </a
      ><a name="14791" href="StlcProp.html#14778" class="Bound"
      >x&#8800;y</a
      ><a name="14794"
      > </a
      ><a name="14795" href="StlcProp.html#14723" class="Bound"
      >y&#8712;t&#8242;</a
      ><a name="14799" class="Symbol"
      >)</a
      ><a name="14800"
      >
</a
      ><a name="14801" href="StlcProp.html#11975" class="Function"
      >replaceCtxt</a
      ><a name="14812"
      > </a
      ><a name="14813" class="Symbol"
      >_</a
      ><a name="14814"
      > </a
      ><a name="14815" href="Stlc.html#20016" class="InductiveConstructor"
      >true</a
      ><a name="14819"
      >  </a
      ><a name="14821" class="Symbol"
      >=</a
      ><a name="14822"
      > </a
      ><a name="14823" href="Stlc.html#20016" class="InductiveConstructor"
      >true</a
      ><a name="14827"
      >
</a
      ><a name="14828" href="StlcProp.html#11975" class="Function"
      >replaceCtxt</a
      ><a name="14839"
      > </a
      ><a name="14840" class="Symbol"
      >_</a
      ><a name="14841"
      > </a
      ><a name="14842" href="Stlc.html#20075" class="InductiveConstructor"
      >false</a
      ><a name="14847"
      > </a
      ><a name="14848" class="Symbol"
      >=</a
      ><a name="14849"
      > </a
      ><a name="14850" href="Stlc.html#20075" class="InductiveConstructor"
      >false</a
      ><a name="14855"
      >
</a
      ><a name="14856" href="StlcProp.html#11975" class="Function"
      >replaceCtxt</a
      ><a name="14867"
      > </a
      ><a name="14868" href="StlcProp.html#14868" class="Bound"
      >f</a
      ><a name="14869"
      > </a
      ><a name="14870" class="Symbol"
      >(</a
      ><a name="14871" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >if</a
      ><a name="14873"
      > </a
      ><a name="14874" href="StlcProp.html#14874" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="14881"
      > </a
      ><a name="14882" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >then</a
      ><a name="14886"
      > </a
      ><a name="14887" href="StlcProp.html#14887" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="14891"
      > </a
      ><a name="14892" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >else</a
      ><a name="14896"
      > </a
      ><a name="14897" href="StlcProp.html#14897" class="Bound"
      >t&#8323;&#8758;A</a
      ><a name="14901" class="Symbol"
      >)</a
      ><a name="14902"
      >
  </a
      ><a name="14905" class="Symbol"
      >=</a
      ><a name="14906"
      > </a
      ><a name="14907" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >if</a
      ><a name="14909"
      >   </a
      ><a name="14912" href="StlcProp.html#11975" class="Function"
      >replaceCtxt</a
      ><a name="14923"
      > </a
      ><a name="14924" class="Symbol"
      >(</a
      ><a name="14925" href="StlcProp.html#14868" class="Bound"
      >f</a
      ><a name="14926"
      > </a
      ><a name="14927" href="https://agda.github.io/agda-stdlib/Function.html#713" class="Function Operator"
      >&#8728;</a
      ><a name="14928"
      > </a
      ><a name="14929" href="StlcProp.html#7240" class="InductiveConstructor"
      >if1</a
      ><a name="14932" class="Symbol"
      >)</a
      ><a name="14933"
      > </a
      ><a name="14934" href="StlcProp.html#14874" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="14941"
      >
    </a
      ><a name="14946" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >then</a
      ><a name="14950"
      > </a
      ><a name="14951" href="StlcProp.html#11975" class="Function"
      >replaceCtxt</a
      ><a name="14962"
      > </a
      ><a name="14963" class="Symbol"
      >(</a
      ><a name="14964" href="StlcProp.html#14868" class="Bound"
      >f</a
      ><a name="14965"
      > </a
      ><a name="14966" href="https://agda.github.io/agda-stdlib/Function.html#713" class="Function Operator"
      >&#8728;</a
      ><a name="14967"
      > </a
      ><a name="14968" href="StlcProp.html#7311" class="InductiveConstructor"
      >if2</a
      ><a name="14971" class="Symbol"
      >)</a
      ><a name="14972"
      > </a
      ><a name="14973" href="StlcProp.html#14887" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="14977"
      >
    </a
      ><a name="14982" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >else</a
      ><a name="14986"
      > </a
      ><a name="14987" href="StlcProp.html#11975" class="Function"
      >replaceCtxt</a
      ><a name="14998"
      > </a
      ><a name="14999" class="Symbol"
      >(</a
      ><a name="15000" href="StlcProp.html#14868" class="Bound"
      >f</a
      ><a name="15001"
      > </a
      ><a name="15002" href="https://agda.github.io/agda-stdlib/Function.html#713" class="Function Operator"
      >&#8728;</a
      ><a name="15003"
      > </a
      ><a name="15004" href="StlcProp.html#7382" class="InductiveConstructor"
      >if3</a
      ><a name="15007" class="Symbol"
      >)</a
      ><a name="15008"
      > </a
      ><a name="15009" href="StlcProp.html#14897" class="Bound"
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
<a name="15824" href="StlcProp.html#15824" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="15840"
      > </a
      ><a name="15841" class="Symbol"
      >:</a
      ><a name="15842"
      > </a
      ><a name="15843" class="Symbol"
      >&#8704;</a
      ><a name="15844"
      > </a
      ><a name="15845" class="Symbol"
      >{</a
      ><a name="15846" href="StlcProp.html#15846" class="Bound"
      >&#915;</a
      ><a name="15847"
      > </a
      ><a name="15848" href="StlcProp.html#15848" class="Bound"
      >x</a
      ><a name="15849"
      > </a
      ><a name="15850" href="StlcProp.html#15850" class="Bound"
      >A</a
      ><a name="15851"
      > </a
      ><a name="15852" href="StlcProp.html#15852" class="Bound"
      >t</a
      ><a name="15853"
      > </a
      ><a name="15854" href="StlcProp.html#15854" class="Bound"
      >v</a
      ><a name="15855"
      > </a
      ><a name="15856" href="StlcProp.html#15856" class="Bound"
      >B</a
      ><a name="15857" class="Symbol"
      >}</a
      ><a name="15858"
      >
                 </a
      ><a name="15876" class="Symbol"
      >&#8594;</a
      ><a name="15877"
      > </a
      ><a name="15878" href="Stlc.html#18658" class="Function"
      >&#8709;</a
      ><a name="15879"
      > </a
      ><a name="15880" href="Stlc.html#19629" class="Datatype Operator"
      >&#8866;</a
      ><a name="15881"
      > </a
      ><a name="15882" href="StlcProp.html#15854" class="Bound"
      >v</a
      ><a name="15883"
      > </a
      ><a name="15884" href="Stlc.html#19629" class="Datatype Operator"
      >&#8758;</a
      ><a name="15885"
      > </a
      ><a name="15886" href="StlcProp.html#15850" class="Bound"
      >A</a
      ><a name="15887"
      >
                 </a
      ><a name="15905" class="Symbol"
      >&#8594;</a
      ><a name="15906"
      > </a
      ><a name="15907" href="StlcProp.html#15846" class="Bound"
      >&#915;</a
      ><a name="15908"
      > </a
      ><a name="15909" href="Stlc.html#18686" class="Function Operator"
      >,</a
      ><a name="15910"
      > </a
      ><a name="15911" href="StlcProp.html#15848" class="Bound"
      >x</a
      ><a name="15912"
      > </a
      ><a name="15913" href="Stlc.html#18686" class="Function Operator"
      >&#8758;</a
      ><a name="15914"
      > </a
      ><a name="15915" href="StlcProp.html#15850" class="Bound"
      >A</a
      ><a name="15916"
      > </a
      ><a name="15917" href="Stlc.html#19629" class="Datatype Operator"
      >&#8866;</a
      ><a name="15918"
      > </a
      ><a name="15919" href="StlcProp.html#15852" class="Bound"
      >t</a
      ><a name="15920"
      > </a
      ><a name="15921" href="Stlc.html#19629" class="Datatype Operator"
      >&#8758;</a
      ><a name="15922"
      > </a
      ><a name="15923" href="StlcProp.html#15856" class="Bound"
      >B</a
      ><a name="15924"
      >
                 </a
      ><a name="15942" class="Symbol"
      >&#8594;</a
      ><a name="15943"
      > </a
      ><a name="15944" href="StlcProp.html#15846" class="Bound"
      >&#915;</a
      ><a name="15945"
      > </a
      ><a name="15946" href="Stlc.html#18686" class="Function Operator"
      >,</a
      ><a name="15947"
      > </a
      ><a name="15948" href="StlcProp.html#15848" class="Bound"
      >x</a
      ><a name="15949"
      > </a
      ><a name="15950" href="Stlc.html#18686" class="Function Operator"
      >&#8758;</a
      ><a name="15951"
      > </a
      ><a name="15952" href="StlcProp.html#15850" class="Bound"
      >A</a
      ><a name="15953"
      > </a
      ><a name="15954" href="Stlc.html#19629" class="Datatype Operator"
      >&#8866;</a
      ><a name="15955"
      > </a
      ><a name="15956" href="Stlc.html#12659" class="Function Operator"
      >[</a
      ><a name="15957"
      > </a
      ><a name="15958" href="StlcProp.html#15848" class="Bound"
      >x</a
      ><a name="15959"
      > </a
      ><a name="15960" href="Stlc.html#12659" class="Function Operator"
      >:=</a
      ><a name="15962"
      > </a
      ><a name="15963" href="StlcProp.html#15854" class="Bound"
      >v</a
      ><a name="15964"
      > </a
      ><a name="15965" href="Stlc.html#12659" class="Function Operator"
      >]</a
      ><a name="15966"
      > </a
      ><a name="15967" href="StlcProp.html#15852" class="Bound"
      >t</a
      ><a name="15968"
      > </a
      ><a name="15969" href="Stlc.html#19629" class="Datatype Operator"
      >&#8758;</a
      ><a name="15970"
      > </a
      ><a name="15971" href="StlcProp.html#15856" class="Bound"
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
<a name="19882" href="StlcProp.html#15824" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="19898"
      > </a
      ><a name="19899" class="Symbol"
      >{</a
      ><a name="19900" href="StlcProp.html#19900" class="Bound"
      >&#915;</a
      ><a name="19901" class="Symbol"
      >}</a
      ><a name="19902"
      > </a
      ><a name="19903" class="Symbol"
      >{</a
      ><a name="19904" href="StlcProp.html#19904" class="Bound"
      >x</a
      ><a name="19905" class="Symbol"
      >}</a
      ><a name="19906"
      > </a
      ><a name="19907" href="StlcProp.html#19907" class="Bound"
      >v&#8758;A</a
      ><a name="19910"
      > </a
      ><a name="19911" class="Symbol"
      >(</a
      ><a name="19912" href="Stlc.html#19673" class="InductiveConstructor"
      >var</a
      ><a name="19915"
      > </a
      ><a name="19916" href="StlcProp.html#19916" class="Bound"
      >y</a
      ><a name="19917"
      > </a
      ><a name="19918" href="StlcProp.html#19918" class="Bound"
      >y&#8712;&#915;</a
      ><a name="19921" class="Symbol"
      >)</a
      ><a name="19922"
      > </a
      ><a name="19923" class="Keyword"
      >with</a
      ><a name="19927"
      > </a
      ><a name="19928" href="StlcProp.html#19904" class="Bound"
      >x</a
      ><a name="19929"
      > </a
      ><a name="19930" href="Stlc.html#5853" class="Function Operator"
      >&#8799;</a
      ><a name="19931"
      > </a
      ><a name="19932" href="StlcProp.html#19916" class="Bound"
      >y</a
      ><a name="19933"
      >
</a
      ><a name="19934" class="Symbol"
      >...</a
      ><a name="19937"
      > </a
      ><a name="19938" class="Symbol"
      >|</a
      ><a name="19939"
      > </a
      ><a name="19940" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="19943"
      > </a
      ><a name="19944" href="StlcProp.html#19944" class="Bound"
      >x=y</a
      ><a name="19947"
      > </a
      ><a name="19948" class="Symbol"
      >=</a
      ><a name="19949"
      > </a
      ><a name="19950" class="Symbol"
      >{!!}</a
      ><a name="19954"
      >
</a
      ><a name="19955" class="Symbol"
      >...</a
      ><a name="19958"
      > </a
      ><a name="19959" class="Symbol"
      >|</a
      ><a name="19960"
      > </a
      ><a name="19961" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="19963"
      >  </a
      ><a name="19965" href="StlcProp.html#19965" class="Bound"
      >x&#8800;y</a
      ><a name="19968"
      > </a
      ><a name="19969" class="Symbol"
      >=</a
      ><a name="19970"
      > </a
      ><a name="19971" class="Symbol"
      >{!!}</a
      ><a name="19975"
      >
</a
      ><a name="19976" href="StlcProp.html#15824" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="19992"
      > </a
      ><a name="19993" href="StlcProp.html#19993" class="Bound"
      >v&#8758;A</a
      ><a name="19996"
      > </a
      ><a name="19997" class="Symbol"
      >(</a
      ><a name="19998" href="Stlc.html#19766" class="InductiveConstructor"
      >abs</a
      ><a name="20001"
      > </a
      ><a name="20002" href="StlcProp.html#20002" class="Bound"
      >t&#8242;&#8758;B</a
      ><a name="20006" class="Symbol"
      >)</a
      ><a name="20007"
      > </a
      ><a name="20008" class="Symbol"
      >=</a
      ><a name="20009"
      > </a
      ><a name="20010" class="Symbol"
      >{!!}</a
      ><a name="20014"
      >
</a
      ><a name="20015" href="StlcProp.html#15824" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="20031"
      > </a
      ><a name="20032" href="StlcProp.html#20032" class="Bound"
      >v&#8758;A</a
      ><a name="20035"
      > </a
      ><a name="20036" class="Symbol"
      >(</a
      ><a name="20037" href="Stlc.html#19882" class="InductiveConstructor"
      >app</a
      ><a name="20040"
      > </a
      ><a name="20041" href="StlcProp.html#20041" class="Bound"
      >t&#8321;&#8758;A&#8658;B</a
      ><a name="20047"
      > </a
      ><a name="20048" href="StlcProp.html#20048" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="20052" class="Symbol"
      >)</a
      ><a name="20053"
      > </a
      ><a name="20054" class="Symbol"
      >=</a
      ><a name="20055"
      >
  </a
      ><a name="20058" href="Stlc.html#19882" class="InductiveConstructor"
      >app</a
      ><a name="20061"
      > </a
      ><a name="20062" class="Symbol"
      >(</a
      ><a name="20063" href="StlcProp.html#15824" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="20079"
      > </a
      ><a name="20080" href="StlcProp.html#20032" class="Bound"
      >v&#8758;A</a
      ><a name="20083"
      > </a
      ><a name="20084" href="StlcProp.html#20041" class="Bound"
      >t&#8321;&#8758;A&#8658;B</a
      ><a name="20090" class="Symbol"
      >)</a
      ><a name="20091"
      > </a
      ><a name="20092" class="Symbol"
      >(</a
      ><a name="20093" href="StlcProp.html#15824" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="20109"
      > </a
      ><a name="20110" href="StlcProp.html#20032" class="Bound"
      >v&#8758;A</a
      ><a name="20113"
      > </a
      ><a name="20114" href="StlcProp.html#20048" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="20118" class="Symbol"
      >)</a
      ><a name="20119"
      >
</a
      ><a name="20120" href="StlcProp.html#15824" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="20136"
      > </a
      ><a name="20137" href="StlcProp.html#20137" class="Bound"
      >v&#8758;A</a
      ><a name="20140"
      > </a
      ><a name="20141" href="Stlc.html#20016" class="InductiveConstructor"
      >true</a
      ><a name="20145"
      >  </a
      ><a name="20147" class="Symbol"
      >=</a
      ><a name="20148"
      > </a
      ><a name="20149" href="Stlc.html#20016" class="InductiveConstructor"
      >true</a
      ><a name="20153"
      >
</a
      ><a name="20154" href="StlcProp.html#15824" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="20170"
      > </a
      ><a name="20171" href="StlcProp.html#20171" class="Bound"
      >v&#8758;A</a
      ><a name="20174"
      > </a
      ><a name="20175" href="Stlc.html#20075" class="InductiveConstructor"
      >false</a
      ><a name="20180"
      > </a
      ><a name="20181" class="Symbol"
      >=</a
      ><a name="20182"
      > </a
      ><a name="20183" href="Stlc.html#20075" class="InductiveConstructor"
      >false</a
      ><a name="20188"
      >
</a
      ><a name="20189" href="StlcProp.html#15824" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="20205"
      > </a
      ><a name="20206" href="StlcProp.html#20206" class="Bound"
      >v&#8758;A</a
      ><a name="20209"
      > </a
      ><a name="20210" class="Symbol"
      >(</a
      ><a name="20211" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >if</a
      ><a name="20213"
      > </a
      ><a name="20214" href="StlcProp.html#20214" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="20221"
      > </a
      ><a name="20222" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >then</a
      ><a name="20226"
      > </a
      ><a name="20227" href="StlcProp.html#20227" class="Bound"
      >t&#8322;&#8758;B</a
      ><a name="20231"
      > </a
      ><a name="20232" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >else</a
      ><a name="20236"
      > </a
      ><a name="20237" href="StlcProp.html#20237" class="Bound"
      >t&#8323;&#8758;B</a
      ><a name="20241" class="Symbol"
      >)</a
      ><a name="20242"
      > </a
      ><a name="20243" class="Symbol"
      >=</a
      ><a name="20244"
      >
  </a
      ><a name="20247" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >if</a
      ><a name="20249"
      >   </a
      ><a name="20252" href="StlcProp.html#15824" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="20268"
      > </a
      ><a name="20269" href="StlcProp.html#20206" class="Bound"
      >v&#8758;A</a
      ><a name="20272"
      > </a
      ><a name="20273" href="StlcProp.html#20214" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="20280"
      >
  </a
      ><a name="20283" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >then</a
      ><a name="20287"
      > </a
      ><a name="20288" href="StlcProp.html#15824" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="20304"
      > </a
      ><a name="20305" href="StlcProp.html#20206" class="Bound"
      >v&#8758;A</a
      ><a name="20308"
      > </a
      ><a name="20309" href="StlcProp.html#20227" class="Bound"
      >t&#8322;&#8758;B</a
      ><a name="20313"
      >
  </a
      ><a name="20316" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >else</a
      ><a name="20320"
      > </a
      ><a name="20321" href="StlcProp.html#15824" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="20337"
      > </a
      ><a name="20338" href="StlcProp.html#20206" class="Bound"
      >v&#8758;A</a
      ><a name="20341"
      > </a
      ><a name="20342" href="StlcProp.html#20237" class="Bound"
      >t&#8323;&#8758;B</a
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
