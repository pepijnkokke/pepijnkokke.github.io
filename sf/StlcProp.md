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
      >module</a
      ><a name="235"
      > </a
      ><a name="236" href="StlcProp.html#1" class="Module"
      >StlcProp</a
      ><a name="244"
      > </a
      ><a name="245" class="Keyword"
      >where</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="297" class="Keyword"
      >open</a
      ><a name="301"
      > </a
      ><a name="302" class="Keyword"
      >import</a
      ><a name="308"
      > </a
      ><a name="309" href="https://agda.github.io/agda-stdlib/Function.html#1" class="Module"
      >Function</a
      ><a name="317"
      > </a
      ><a name="318" class="Keyword"
      >using</a
      ><a name="323"
      > </a
      ><a name="324" class="Symbol"
      >(</a
      ><a name="325" href="https://agda.github.io/agda-stdlib/Function.html#713" class="Function Operator"
      >_&#8728;_</a
      ><a name="328" class="Symbol"
      >)</a
      ><a name="329"
      >
</a
      ><a name="330" class="Keyword"
      >open</a
      ><a name="334"
      > </a
      ><a name="335" class="Keyword"
      >import</a
      ><a name="341"
      > </a
      ><a name="342" href="https://agda.github.io/agda-stdlib/Data.Empty.html#1" class="Module"
      >Data.Empty</a
      ><a name="352"
      > </a
      ><a name="353" class="Keyword"
      >using</a
      ><a name="358"
      > </a
      ><a name="359" class="Symbol"
      >(</a
      ><a name="360" href="https://agda.github.io/agda-stdlib/Data.Empty.html#243" class="Datatype"
      >&#8869;</a
      ><a name="361" class="Symbol"
      >;</a
      ><a name="362"
      > </a
      ><a name="363" href="https://agda.github.io/agda-stdlib/Data.Empty.html#348" class="Function"
      >&#8869;-elim</a
      ><a name="369" class="Symbol"
      >)</a
      ><a name="370"
      >
</a
      ><a name="371" class="Keyword"
      >open</a
      ><a name="375"
      > </a
      ><a name="376" class="Keyword"
      >import</a
      ><a name="382"
      > </a
      ><a name="383" href="https://agda.github.io/agda-stdlib/Data.Maybe.html#1" class="Module"
      >Data.Maybe</a
      ><a name="393"
      > </a
      ><a name="394" class="Keyword"
      >using</a
      ><a name="399"
      > </a
      ><a name="400" class="Symbol"
      >(</a
      ><a name="401" href="https://agda.github.io/agda-stdlib/Data.Maybe.Base.html#335" class="Datatype"
      >Maybe</a
      ><a name="406" class="Symbol"
      >;</a
      ><a name="407"
      > </a
      ><a name="408" href="https://agda.github.io/agda-stdlib/Data.Maybe.html#1527" class="InductiveConstructor"
      >just</a
      ><a name="412" class="Symbol"
      >;</a
      ><a name="413"
      > </a
      ><a name="414" href="https://agda.github.io/agda-stdlib/Data.Maybe.html#1588" class="InductiveConstructor"
      >nothing</a
      ><a name="421" class="Symbol"
      >)</a
      ><a name="422"
      >
</a
      ><a name="423" class="Keyword"
      >open</a
      ><a name="427"
      > </a
      ><a name="428" class="Keyword"
      >import</a
      ><a name="434"
      > </a
      ><a name="435" href="https://agda.github.io/agda-stdlib/Data.Product.html#1" class="Module"
      >Data.Product</a
      ><a name="447"
      > </a
      ><a name="448" class="Keyword"
      >using</a
      ><a name="453"
      > </a
      ><a name="454" class="Symbol"
      >(</a
      ><a name="455" href="https://agda.github.io/agda-stdlib/Data.Product.html#823" class="Function"
      >&#8707;</a
      ><a name="456" class="Symbol"
      >;</a
      ><a name="457"
      > </a
      ><a name="458" href="https://agda.github.io/agda-stdlib/Data.Product.html#949" class="Function"
      >&#8707;&#8322;</a
      ><a name="460" class="Symbol"
      >;</a
      ><a name="461"
      > </a
      ><a name="462" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >_,_</a
      ><a name="465" class="Symbol"
      >;</a
      ><a name="466"
      > </a
      ><a name="467" href="https://agda.github.io/agda-stdlib/Data.Product.html#1621" class="Function Operator"
      >,_</a
      ><a name="469" class="Symbol"
      >)</a
      ><a name="470"
      >
</a
      ><a name="471" class="Keyword"
      >open</a
      ><a name="475"
      > </a
      ><a name="476" class="Keyword"
      >import</a
      ><a name="482"
      > </a
      ><a name="483" href="https://agda.github.io/agda-stdlib/Data.Sum.html#1" class="Module"
      >Data.Sum</a
      ><a name="491"
      > </a
      ><a name="492" class="Keyword"
      >using</a
      ><a name="497"
      > </a
      ><a name="498" class="Symbol"
      >(</a
      ><a name="499" href="https://agda.github.io/agda-stdlib/Data.Sum.html#433" class="Datatype Operator"
      >_&#8846;_</a
      ><a name="502" class="Symbol"
      >;</a
      ><a name="503"
      > </a
      ><a name="504" href="https://agda.github.io/agda-stdlib/Data.Sum.html#489" class="InductiveConstructor"
      >inj&#8321;</a
      ><a name="508" class="Symbol"
      >;</a
      ><a name="509"
      > </a
      ><a name="510" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="514" class="Symbol"
      >)</a
      ><a name="515"
      >
</a
      ><a name="516" class="Keyword"
      >open</a
      ><a name="520"
      > </a
      ><a name="521" class="Keyword"
      >import</a
      ><a name="527"
      > </a
      ><a name="528" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#1" class="Module"
      >Relation.Nullary</a
      ><a name="544"
      > </a
      ><a name="545" class="Keyword"
      >using</a
      ><a name="550"
      > </a
      ><a name="551" class="Symbol"
      >(</a
      ><a name="552" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#414" class="Function Operator"
      >&#172;_</a
      ><a name="554" class="Symbol"
      >;</a
      ><a name="555"
      > </a
      ><a name="556" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#484" class="Datatype"
      >Dec</a
      ><a name="559" class="Symbol"
      >;</a
      ><a name="560"
      > </a
      ><a name="561" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="564" class="Symbol"
      >;</a
      ><a name="565"
      > </a
      ><a name="566" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="568" class="Symbol"
      >)</a
      ><a name="569"
      >
</a
      ><a name="570" class="Keyword"
      >open</a
      ><a name="574"
      > </a
      ><a name="575" class="Keyword"
      >import</a
      ><a name="581"
      > </a
      ><a name="582" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.html#1" class="Module"
      >Relation.Binary.PropositionalEquality</a
      ><a name="619"
      > </a
      ><a name="620" class="Keyword"
      >using</a
      ><a name="625"
      > </a
      ><a name="626" class="Symbol"
      >(</a
      ><a name="627" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >_&#8801;_</a
      ><a name="630" class="Symbol"
      >;</a
      ><a name="631"
      > </a
      ><a name="632" href="https://agda.github.io/agda-stdlib/Relation.Binary.Core.html#4493" class="Function Operator"
      >_&#8802;_</a
      ><a name="635" class="Symbol"
      >;</a
      ><a name="636"
      > </a
      ><a name="637" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="641" class="Symbol"
      >)</a
      ><a name="642"
      >
</a
      ><a name="643" class="Keyword"
      >open</a
      ><a name="647"
      > </a
      ><a name="648" class="Keyword"
      >import</a
      ><a name="654"
      > </a
      ><a name="655" href="Stlc.html#1" class="Module"
      >Stlc</a
      >
{% endraw %}</pre>
</div>

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
<a name="1241" href="StlcProp.html#1241" class="Function"
      >CanonicalForms</a
      ><a name="1255"
      > </a
      ><a name="1256" class="Symbol"
      >:</a
      ><a name="1257"
      > </a
      ><a name="1258" href="Stlc.html#6114" class="Datatype"
      >Term</a
      ><a name="1262"
      > </a
      ><a name="1263" class="Symbol"
      >&#8594;</a
      ><a name="1264"
      > </a
      ><a name="1265" href="Stlc.html#5611" class="Datatype"
      >Type</a
      ><a name="1269"
      > </a
      ><a name="1270" class="Symbol"
      >&#8594;</a
      ><a name="1271"
      > </a
      ><a name="1272" class="PrimitiveType"
      >Set</a
      ><a name="1275"
      >
</a
      ><a name="1276" href="StlcProp.html#1241" class="Function"
      >CanonicalForms</a
      ><a name="1290"
      > </a
      ><a name="1291" href="StlcProp.html#1291" class="Bound"
      >t</a
      ><a name="1292"
      > </a
      ><a name="1293" href="Stlc.html#5630" class="InductiveConstructor"
      >bool</a
      ><a name="1297"
      >    </a
      ><a name="1301" class="Symbol"
      >=</a
      ><a name="1302"
      > </a
      ><a name="1303" href="StlcProp.html#1291" class="Bound"
      >t</a
      ><a name="1304"
      > </a
      ><a name="1305" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="1306"
      > </a
      ><a name="1307" href="Stlc.html#6216" class="InductiveConstructor"
      >true</a
      ><a name="1311"
      > </a
      ><a name="1312" href="https://agda.github.io/agda-stdlib/Data.Sum.html#433" class="Datatype Operator"
      >&#8846;</a
      ><a name="1313"
      > </a
      ><a name="1314" href="StlcProp.html#1291" class="Bound"
      >t</a
      ><a name="1315"
      > </a
      ><a name="1316" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="1317"
      > </a
      ><a name="1318" href="Stlc.html#6231" class="InductiveConstructor"
      >false</a
      ><a name="1323"
      >
</a
      ><a name="1324" href="StlcProp.html#1241" class="Function"
      >CanonicalForms</a
      ><a name="1338"
      > </a
      ><a name="1339" href="StlcProp.html#1339" class="Bound"
      >t</a
      ><a name="1340"
      > </a
      ><a name="1341" class="Symbol"
      >(</a
      ><a name="1342" href="StlcProp.html#1342" class="Bound"
      >A</a
      ><a name="1343"
      > </a
      ><a name="1344" href="Stlc.html#5644" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="1345"
      > </a
      ><a name="1346" href="StlcProp.html#1346" class="Bound"
      >B</a
      ><a name="1347" class="Symbol"
      >)</a
      ><a name="1348"
      > </a
      ><a name="1349" class="Symbol"
      >=</a
      ><a name="1350"
      > </a
      ><a name="1351" href="https://agda.github.io/agda-stdlib/Data.Product.html#949" class="Function"
      >&#8707;&#8322;</a
      ><a name="1353"
      > </a
      ><a name="1354" class="Symbol"
      >&#955;</a
      ><a name="1355"
      > </a
      ><a name="1356" href="StlcProp.html#1356" class="Bound"
      >x</a
      ><a name="1357"
      > </a
      ><a name="1358" href="StlcProp.html#1358" class="Bound"
      >t&#8242;</a
      ><a name="1360"
      > </a
      ><a name="1361" class="Symbol"
      >&#8594;</a
      ><a name="1362"
      > </a
      ><a name="1363" href="StlcProp.html#1339" class="Bound"
      >t</a
      ><a name="1364"
      > </a
      ><a name="1365" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="1366"
      > </a
      ><a name="1367" href="Stlc.html#6182" class="InductiveConstructor"
      >abs</a
      ><a name="1370"
      > </a
      ><a name="1371" href="StlcProp.html#1356" class="Bound"
      >x</a
      ><a name="1372"
      > </a
      ><a name="1373" href="StlcProp.html#1342" class="Bound"
      >A</a
      ><a name="1374"
      > </a
      ><a name="1375" href="StlcProp.html#1358" class="Bound"
      >t&#8242;</a
      ><a name="1377"
      >

</a
      ><a name="1379" href="StlcProp.html#1379" class="Function"
      >canonicalForms</a
      ><a name="1393"
      > </a
      ><a name="1394" class="Symbol"
      >:</a
      ><a name="1395"
      > </a
      ><a name="1396" class="Symbol"
      >&#8704;</a
      ><a name="1397"
      > </a
      ><a name="1398" class="Symbol"
      >{</a
      ><a name="1399" href="StlcProp.html#1399" class="Bound"
      >t</a
      ><a name="1400"
      > </a
      ><a name="1401" href="StlcProp.html#1401" class="Bound"
      >A</a
      ><a name="1402" class="Symbol"
      >}</a
      ><a name="1403"
      > </a
      ><a name="1404" class="Symbol"
      >&#8594;</a
      ><a name="1405"
      > </a
      ><a name="1406" href="Stlc.html#18658" class="Function"
      >&#8709;</a
      ><a name="1407"
      > </a
      ><a name="1408" href="Stlc.html#19629" class="Datatype Operator"
      >&#8866;</a
      ><a name="1409"
      > </a
      ><a name="1410" href="StlcProp.html#1399" class="Bound"
      >t</a
      ><a name="1411"
      > </a
      ><a name="1412" href="Stlc.html#19629" class="Datatype Operator"
      >&#8758;</a
      ><a name="1413"
      > </a
      ><a name="1414" href="StlcProp.html#1401" class="Bound"
      >A</a
      ><a name="1415"
      > </a
      ><a name="1416" class="Symbol"
      >&#8594;</a
      ><a name="1417"
      > </a
      ><a name="1418" href="Stlc.html#9439" class="Datatype"
      >Value</a
      ><a name="1423"
      > </a
      ><a name="1424" href="StlcProp.html#1399" class="Bound"
      >t</a
      ><a name="1425"
      > </a
      ><a name="1426" class="Symbol"
      >&#8594;</a
      ><a name="1427"
      > </a
      ><a name="1428" href="StlcProp.html#1241" class="Function"
      >CanonicalForms</a
      ><a name="1442"
      > </a
      ><a name="1443" href="StlcProp.html#1399" class="Bound"
      >t</a
      ><a name="1444"
      > </a
      ><a name="1445" href="StlcProp.html#1401" class="Bound"
      >A</a
      ><a name="1446"
      >
</a
      ><a name="1447" href="StlcProp.html#1379" class="Function"
      >canonicalForms</a
      ><a name="1461"
      > </a
      ><a name="1462" class="Symbol"
      >(</a
      ><a name="1463" href="Stlc.html#19766" class="InductiveConstructor"
      >abs</a
      ><a name="1466"
      > </a
      ><a name="1467" href="StlcProp.html#1467" class="Bound"
      >t&#8242;</a
      ><a name="1469" class="Symbol"
      >)</a
      ><a name="1470"
      > </a
      ><a name="1471" href="Stlc.html#9466" class="InductiveConstructor"
      >abs</a
      ><a name="1474"
      >   </a
      ><a name="1477" class="Symbol"
      >=</a
      ><a name="1478"
      > </a
      ><a name="1479" class="Symbol"
      >_</a
      ><a name="1480"
      > </a
      ><a name="1481" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="1482"
      > </a
      ><a name="1483" class="Symbol"
      >_</a
      ><a name="1484"
      > </a
      ><a name="1485" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="1486"
      > </a
      ><a name="1487" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="1491"
      >
</a
      ><a name="1492" href="StlcProp.html#1379" class="Function"
      >canonicalForms</a
      ><a name="1506"
      > </a
      ><a name="1507" href="Stlc.html#20016" class="InductiveConstructor"
      >true</a
      ><a name="1511"
      >     </a
      ><a name="1516" href="Stlc.html#9514" class="InductiveConstructor"
      >true</a
      ><a name="1520"
      >  </a
      ><a name="1522" class="Symbol"
      >=</a
      ><a name="1523"
      > </a
      ><a name="1524" href="https://agda.github.io/agda-stdlib/Data.Sum.html#489" class="InductiveConstructor"
      >inj&#8321;</a
      ><a name="1528"
      > </a
      ><a name="1529" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="1533"
      >
</a
      ><a name="1534" href="StlcProp.html#1379" class="Function"
      >canonicalForms</a
      ><a name="1548"
      > </a
      ><a name="1549" href="Stlc.html#20075" class="InductiveConstructor"
      >false</a
      ><a name="1554"
      >    </a
      ><a name="1558" href="Stlc.html#9535" class="InductiveConstructor"
      >false</a
      ><a name="1563"
      > </a
      ><a name="1564" class="Symbol"
      >=</a
      ><a name="1565"
      > </a
      ><a name="1566" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="1570"
      > </a
      ><a name="1571" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
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
<a name="1954" href="StlcProp.html#1954" class="Function"
      >progress</a
      ><a name="1962"
      > </a
      ><a name="1963" class="Symbol"
      >:</a
      ><a name="1964"
      > </a
      ><a name="1965" class="Symbol"
      >&#8704;</a
      ><a name="1966"
      > </a
      ><a name="1967" class="Symbol"
      >{</a
      ><a name="1968" href="StlcProp.html#1968" class="Bound"
      >t</a
      ><a name="1969"
      > </a
      ><a name="1970" href="StlcProp.html#1970" class="Bound"
      >A</a
      ><a name="1971" class="Symbol"
      >}</a
      ><a name="1972"
      > </a
      ><a name="1973" class="Symbol"
      >&#8594;</a
      ><a name="1974"
      > </a
      ><a name="1975" href="Stlc.html#18658" class="Function"
      >&#8709;</a
      ><a name="1976"
      > </a
      ><a name="1977" href="Stlc.html#19629" class="Datatype Operator"
      >&#8866;</a
      ><a name="1978"
      > </a
      ><a name="1979" href="StlcProp.html#1968" class="Bound"
      >t</a
      ><a name="1980"
      > </a
      ><a name="1981" href="Stlc.html#19629" class="Datatype Operator"
      >&#8758;</a
      ><a name="1982"
      > </a
      ><a name="1983" href="StlcProp.html#1970" class="Bound"
      >A</a
      ><a name="1984"
      > </a
      ><a name="1985" class="Symbol"
      >&#8594;</a
      ><a name="1986"
      > </a
      ><a name="1987" href="Stlc.html#9439" class="Datatype"
      >Value</a
      ><a name="1992"
      > </a
      ><a name="1993" href="StlcProp.html#1968" class="Bound"
      >t</a
      ><a name="1994"
      > </a
      ><a name="1995" href="https://agda.github.io/agda-stdlib/Data.Sum.html#433" class="Datatype Operator"
      >&#8846;</a
      ><a name="1996"
      > </a
      ><a name="1997" href="https://agda.github.io/agda-stdlib/Data.Product.html#823" class="Function"
      >&#8707;</a
      ><a name="1998"
      > </a
      ><a name="1999" class="Symbol"
      >&#955;</a
      ><a name="2000"
      > </a
      ><a name="2001" href="StlcProp.html#2001" class="Bound"
      >t&#8242;</a
      ><a name="2003"
      > </a
      ><a name="2004" class="Symbol"
      >&#8594;</a
      ><a name="2005"
      > </a
      ><a name="2006" href="StlcProp.html#1968" class="Bound"
      >t</a
      ><a name="2007"
      > </a
      ><a name="2008" href="Stlc.html#15576" class="Datatype Operator"
      >==&gt;</a
      ><a name="2011"
      > </a
      ><a name="2012" href="StlcProp.html#2001" class="Bound"
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
<a name="3713" href="StlcProp.html#1954" class="Function"
      >progress</a
      ><a name="3721"
      > </a
      ><a name="3722" class="Symbol"
      >(</a
      ><a name="3723" href="Stlc.html#19673" class="InductiveConstructor"
      >var</a
      ><a name="3726"
      > </a
      ><a name="3727" href="StlcProp.html#3727" class="Bound"
      >x</a
      ><a name="3728"
      > </a
      ><a name="3729" class="Symbol"
      >())</a
      ><a name="3732"
      >
</a
      ><a name="3733" href="StlcProp.html#1954" class="Function"
      >progress</a
      ><a name="3741"
      > </a
      ><a name="3742" href="Stlc.html#20016" class="InductiveConstructor"
      >true</a
      ><a name="3746"
      >      </a
      ><a name="3752" class="Symbol"
      >=</a
      ><a name="3753"
      > </a
      ><a name="3754" href="https://agda.github.io/agda-stdlib/Data.Sum.html#489" class="InductiveConstructor"
      >inj&#8321;</a
      ><a name="3758"
      > </a
      ><a name="3759" href="Stlc.html#9514" class="InductiveConstructor"
      >true</a
      ><a name="3763"
      >
</a
      ><a name="3764" href="StlcProp.html#1954" class="Function"
      >progress</a
      ><a name="3772"
      > </a
      ><a name="3773" href="Stlc.html#20075" class="InductiveConstructor"
      >false</a
      ><a name="3778"
      >     </a
      ><a name="3783" class="Symbol"
      >=</a
      ><a name="3784"
      > </a
      ><a name="3785" href="https://agda.github.io/agda-stdlib/Data.Sum.html#489" class="InductiveConstructor"
      >inj&#8321;</a
      ><a name="3789"
      > </a
      ><a name="3790" href="Stlc.html#9535" class="InductiveConstructor"
      >false</a
      ><a name="3795"
      >
</a
      ><a name="3796" href="StlcProp.html#1954" class="Function"
      >progress</a
      ><a name="3804"
      > </a
      ><a name="3805" class="Symbol"
      >(</a
      ><a name="3806" href="Stlc.html#19766" class="InductiveConstructor"
      >abs</a
      ><a name="3809"
      > </a
      ><a name="3810" href="StlcProp.html#3810" class="Bound"
      >t&#8758;A</a
      ><a name="3813" class="Symbol"
      >)</a
      ><a name="3814"
      > </a
      ><a name="3815" class="Symbol"
      >=</a
      ><a name="3816"
      > </a
      ><a name="3817" href="https://agda.github.io/agda-stdlib/Data.Sum.html#489" class="InductiveConstructor"
      >inj&#8321;</a
      ><a name="3821"
      > </a
      ><a name="3822" href="Stlc.html#9466" class="InductiveConstructor"
      >abs</a
      ><a name="3825"
      >
</a
      ><a name="3826" href="StlcProp.html#1954" class="Function"
      >progress</a
      ><a name="3834"
      > </a
      ><a name="3835" class="Symbol"
      >(</a
      ><a name="3836" href="Stlc.html#19882" class="InductiveConstructor"
      >app</a
      ><a name="3839"
      > </a
      ><a name="3840" href="StlcProp.html#3840" class="Bound"
      >t&#8321;&#8758;A&#8658;B</a
      ><a name="3846"
      > </a
      ><a name="3847" href="StlcProp.html#3847" class="Bound"
      >t&#8322;&#8758;B</a
      ><a name="3851" class="Symbol"
      >)</a
      ><a name="3852"
      >
    </a
      ><a name="3857" class="Keyword"
      >with</a
      ><a name="3861"
      > </a
      ><a name="3862" href="StlcProp.html#1954" class="Function"
      >progress</a
      ><a name="3870"
      > </a
      ><a name="3871" href="StlcProp.html#3840" class="Bound"
      >t&#8321;&#8758;A&#8658;B</a
      ><a name="3877"
      >
</a
      ><a name="3878" class="Symbol"
      >...</a
      ><a name="3881"
      > </a
      ><a name="3882" class="Symbol"
      >|</a
      ><a name="3883"
      > </a
      ><a name="3884" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="3888"
      > </a
      ><a name="3889" class="Symbol"
      >(_</a
      ><a name="3891"
      > </a
      ><a name="3892" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="3893"
      > </a
      ><a name="3894" href="StlcProp.html#3894" class="Bound"
      >t&#8321;&#8658;t&#8321;&#8242;</a
      ><a name="3900" class="Symbol"
      >)</a
      ><a name="3901"
      > </a
      ><a name="3902" class="Symbol"
      >=</a
      ><a name="3903"
      > </a
      ><a name="3904" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="3908"
      > </a
      ><a name="3909" class="Symbol"
      >(_</a
      ><a name="3911"
      > </a
      ><a name="3912" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="3913"
      > </a
      ><a name="3914" href="Stlc.html#15701" class="InductiveConstructor"
      >app1</a
      ><a name="3918"
      > </a
      ><a name="3919" href="StlcProp.html#3894" class="Bound"
      >t&#8321;&#8658;t&#8321;&#8242;</a
      ><a name="3925" class="Symbol"
      >)</a
      ><a name="3926"
      >
</a
      ><a name="3927" class="Symbol"
      >...</a
      ><a name="3930"
      > </a
      ><a name="3931" class="Symbol"
      >|</a
      ><a name="3932"
      > </a
      ><a name="3933" href="https://agda.github.io/agda-stdlib/Data.Sum.html#489" class="InductiveConstructor"
      >inj&#8321;</a
      ><a name="3937"
      > </a
      ><a name="3938" href="StlcProp.html#3938" class="Bound"
      >v&#8321;</a
      ><a name="3940"
      >
    </a
      ><a name="3945" class="Keyword"
      >with</a
      ><a name="3949"
      > </a
      ><a name="3950" href="StlcProp.html#1954" class="Function"
      >progress</a
      ><a name="3958"
      > </a
      ><a name="3959" href="StlcProp.html#3847" class="Bound"
      >t&#8322;&#8758;B</a
      ><a name="3963"
      >
</a
      ><a name="3964" class="Symbol"
      >...</a
      ><a name="3967"
      > </a
      ><a name="3968" class="Symbol"
      >|</a
      ><a name="3969"
      > </a
      ><a name="3970" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="3974"
      > </a
      ><a name="3975" class="Symbol"
      >(_</a
      ><a name="3977"
      > </a
      ><a name="3978" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="3979"
      > </a
      ><a name="3980" href="StlcProp.html#3980" class="Bound"
      >t&#8322;&#8658;t&#8322;&#8242;</a
      ><a name="3986" class="Symbol"
      >)</a
      ><a name="3987"
      > </a
      ><a name="3988" class="Symbol"
      >=</a
      ><a name="3989"
      > </a
      ><a name="3990" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="3994"
      > </a
      ><a name="3995" class="Symbol"
      >(_</a
      ><a name="3997"
      > </a
      ><a name="3998" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="3999"
      > </a
      ><a name="4000" href="Stlc.html#15778" class="InductiveConstructor"
      >app2</a
      ><a name="4004"
      > </a
      ><a name="4005" href="StlcProp.html#3938" class="Bound"
      >v&#8321;</a
      ><a name="4007"
      > </a
      ><a name="4008" href="StlcProp.html#3980" class="Bound"
      >t&#8322;&#8658;t&#8322;&#8242;</a
      ><a name="4014" class="Symbol"
      >)</a
      ><a name="4015"
      >
</a
      ><a name="4016" class="Symbol"
      >...</a
      ><a name="4019"
      > </a
      ><a name="4020" class="Symbol"
      >|</a
      ><a name="4021"
      > </a
      ><a name="4022" href="https://agda.github.io/agda-stdlib/Data.Sum.html#489" class="InductiveConstructor"
      >inj&#8321;</a
      ><a name="4026"
      > </a
      ><a name="4027" href="StlcProp.html#4027" class="Bound"
      >v&#8322;</a
      ><a name="4029"
      >
    </a
      ><a name="4034" class="Keyword"
      >with</a
      ><a name="4038"
      > </a
      ><a name="4039" href="StlcProp.html#1379" class="Function"
      >canonicalForms</a
      ><a name="4053"
      > </a
      ><a name="4054" href="StlcProp.html#3840" class="Bound"
      >t&#8321;&#8758;A&#8658;B</a
      ><a name="4060"
      > </a
      ><a name="4061" href="StlcProp.html#3938" class="Bound"
      >v&#8321;</a
      ><a name="4063"
      >
</a
      ><a name="4064" class="Symbol"
      >...</a
      ><a name="4067"
      > </a
      ><a name="4068" class="Symbol"
      >|</a
      ><a name="4069"
      > </a
      ><a name="4070" class="Symbol"
      >(_</a
      ><a name="4072"
      > </a
      ><a name="4073" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="4074"
      > </a
      ><a name="4075" class="Symbol"
      >_</a
      ><a name="4076"
      > </a
      ><a name="4077" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="4078"
      > </a
      ><a name="4079" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="4083" class="Symbol"
      >)</a
      ><a name="4084"
      > </a
      ><a name="4085" class="Symbol"
      >=</a
      ><a name="4086"
      > </a
      ><a name="4087" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="4091"
      > </a
      ><a name="4092" class="Symbol"
      >(_</a
      ><a name="4094"
      > </a
      ><a name="4095" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="4096"
      > </a
      ><a name="4097" href="Stlc.html#15610" class="InductiveConstructor"
      >red</a
      ><a name="4100"
      > </a
      ><a name="4101" href="StlcProp.html#4027" class="Bound"
      >v&#8322;</a
      ><a name="4103" class="Symbol"
      >)</a
      ><a name="4104"
      >
</a
      ><a name="4105" href="StlcProp.html#1954" class="Function"
      >progress</a
      ><a name="4113"
      > </a
      ><a name="4114" class="Symbol"
      >(</a
      ><a name="4115" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >if</a
      ><a name="4117"
      > </a
      ><a name="4118" href="StlcProp.html#4118" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="4125"
      > </a
      ><a name="4126" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >then</a
      ><a name="4130"
      > </a
      ><a name="4131" href="StlcProp.html#4131" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="4135"
      > </a
      ><a name="4136" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >else</a
      ><a name="4140"
      > </a
      ><a name="4141" href="StlcProp.html#4141" class="Bound"
      >t&#8323;&#8758;A</a
      ><a name="4145" class="Symbol"
      >)</a
      ><a name="4146"
      >
    </a
      ><a name="4151" class="Keyword"
      >with</a
      ><a name="4155"
      > </a
      ><a name="4156" href="StlcProp.html#1954" class="Function"
      >progress</a
      ><a name="4164"
      > </a
      ><a name="4165" href="StlcProp.html#4118" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="4172"
      >
</a
      ><a name="4173" class="Symbol"
      >...</a
      ><a name="4176"
      > </a
      ><a name="4177" class="Symbol"
      >|</a
      ><a name="4178"
      > </a
      ><a name="4179" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="4183"
      > </a
      ><a name="4184" class="Symbol"
      >(_</a
      ><a name="4186"
      > </a
      ><a name="4187" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="4188"
      > </a
      ><a name="4189" href="StlcProp.html#4189" class="Bound"
      >t&#8321;&#8658;t&#8321;&#8242;</a
      ><a name="4195" class="Symbol"
      >)</a
      ><a name="4196"
      > </a
      ><a name="4197" class="Symbol"
      >=</a
      ><a name="4198"
      > </a
      ><a name="4199" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="4203"
      > </a
      ><a name="4204" class="Symbol"
      >(_</a
      ><a name="4206"
      > </a
      ><a name="4207" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="4208"
      > </a
      ><a name="4209" href="Stlc.html#15875" class="InductiveConstructor"
      >if</a
      ><a name="4211"
      > </a
      ><a name="4212" href="StlcProp.html#4189" class="Bound"
      >t&#8321;&#8658;t&#8321;&#8242;</a
      ><a name="4218" class="Symbol"
      >)</a
      ><a name="4219"
      >
</a
      ><a name="4220" class="Symbol"
      >...</a
      ><a name="4223"
      > </a
      ><a name="4224" class="Symbol"
      >|</a
      ><a name="4225"
      > </a
      ><a name="4226" href="https://agda.github.io/agda-stdlib/Data.Sum.html#489" class="InductiveConstructor"
      >inj&#8321;</a
      ><a name="4230"
      > </a
      ><a name="4231" href="StlcProp.html#4231" class="Bound"
      >v&#8321;</a
      ><a name="4233"
      >
    </a
      ><a name="4238" class="Keyword"
      >with</a
      ><a name="4242"
      > </a
      ><a name="4243" href="StlcProp.html#1379" class="Function"
      >canonicalForms</a
      ><a name="4257"
      > </a
      ><a name="4258" href="StlcProp.html#4118" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="4265"
      > </a
      ><a name="4266" href="StlcProp.html#4231" class="Bound"
      >v&#8321;</a
      ><a name="4268"
      >
</a
      ><a name="4269" class="Symbol"
      >...</a
      ><a name="4272"
      > </a
      ><a name="4273" class="Symbol"
      >|</a
      ><a name="4274"
      > </a
      ><a name="4275" href="https://agda.github.io/agda-stdlib/Data.Sum.html#489" class="InductiveConstructor"
      >inj&#8321;</a
      ><a name="4279"
      > </a
      ><a name="4280" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="4284"
      > </a
      ><a name="4285" class="Symbol"
      >=</a
      ><a name="4286"
      > </a
      ><a name="4287" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="4291"
      > </a
      ><a name="4292" class="Symbol"
      >(_</a
      ><a name="4294"
      > </a
      ><a name="4295" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="4296"
      > </a
      ><a name="4297" href="Stlc.html#15976" class="InductiveConstructor"
      >iftrue</a
      ><a name="4303" class="Symbol"
      >)</a
      ><a name="4304"
      >
</a
      ><a name="4305" class="Symbol"
      >...</a
      ><a name="4308"
      > </a
      ><a name="4309" class="Symbol"
      >|</a
      ><a name="4310"
      > </a
      ><a name="4311" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="4315"
      > </a
      ><a name="4316" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="4320"
      > </a
      ><a name="4321" class="Symbol"
      >=</a
      ><a name="4322"
      > </a
      ><a name="4323" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="4327"
      > </a
      ><a name="4328" class="Symbol"
      >(_</a
      ><a name="4330"
      > </a
      ><a name="4331" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="4332"
      > </a
      ><a name="4333" href="Stlc.html#16036" class="InductiveConstructor"
      >iffalse</a
      ><a name="4340" class="Symbol"
      >)</a
      >
{% endraw %}</pre>

#### Exercise: 3 stars, optional (progress_from_term_ind)
Show that progress can also be proved by induction on terms
instead of induction on typing derivations.

<pre class="Agda">{% raw %}
<a name="4530" class="Keyword"
      >postulate</a
      ><a name="4539"
      >
  </a
      ><a name="4542" href="StlcProp.html#4542" class="Postulate"
      >progress&#8242;</a
      ><a name="4551"
      > </a
      ><a name="4552" class="Symbol"
      >:</a
      ><a name="4553"
      > </a
      ><a name="4554" class="Symbol"
      >&#8704;</a
      ><a name="4555"
      > </a
      ><a name="4556" class="Symbol"
      >{</a
      ><a name="4557" href="StlcProp.html#4557" class="Bound"
      >t</a
      ><a name="4558"
      > </a
      ><a name="4559" href="StlcProp.html#4559" class="Bound"
      >A</a
      ><a name="4560" class="Symbol"
      >}</a
      ><a name="4561"
      > </a
      ><a name="4562" class="Symbol"
      >&#8594;</a
      ><a name="4563"
      > </a
      ><a name="4564" href="Stlc.html#18658" class="Function"
      >&#8709;</a
      ><a name="4565"
      > </a
      ><a name="4566" href="Stlc.html#19629" class="Datatype Operator"
      >&#8866;</a
      ><a name="4567"
      > </a
      ><a name="4568" href="StlcProp.html#4557" class="Bound"
      >t</a
      ><a name="4569"
      > </a
      ><a name="4570" href="Stlc.html#19629" class="Datatype Operator"
      >&#8758;</a
      ><a name="4571"
      > </a
      ><a name="4572" href="StlcProp.html#4559" class="Bound"
      >A</a
      ><a name="4573"
      > </a
      ><a name="4574" class="Symbol"
      >&#8594;</a
      ><a name="4575"
      > </a
      ><a name="4576" href="Stlc.html#9439" class="Datatype"
      >Value</a
      ><a name="4581"
      > </a
      ><a name="4582" href="StlcProp.html#4557" class="Bound"
      >t</a
      ><a name="4583"
      > </a
      ><a name="4584" href="https://agda.github.io/agda-stdlib/Data.Sum.html#433" class="Datatype Operator"
      >&#8846;</a
      ><a name="4585"
      > </a
      ><a name="4586" href="https://agda.github.io/agda-stdlib/Data.Product.html#823" class="Function"
      >&#8707;</a
      ><a name="4587"
      > </a
      ><a name="4588" class="Symbol"
      >&#955;</a
      ><a name="4589"
      > </a
      ><a name="4590" href="StlcProp.html#4590" class="Bound"
      >t&#8242;</a
      ><a name="4592"
      > </a
      ><a name="4593" class="Symbol"
      >&#8594;</a
      ><a name="4594"
      > </a
      ><a name="4595" href="StlcProp.html#4557" class="Bound"
      >t</a
      ><a name="4596"
      > </a
      ><a name="4597" href="Stlc.html#15576" class="Datatype Operator"
      >==&gt;</a
      ><a name="4600"
      > </a
      ><a name="4601" href="StlcProp.html#4590" class="Bound"
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
<a name="7024" class="Keyword"
      >data</a
      ><a name="7028"
      > </a
      ><a name="7029" href="StlcProp.html#7029" class="Datatype Operator"
      >_FreeIn_</a
      ><a name="7037"
      > </a
      ><a name="7038" class="Symbol"
      >(</a
      ><a name="7039" href="StlcProp.html#7039" class="Bound"
      >x</a
      ><a name="7040"
      > </a
      ><a name="7041" class="Symbol"
      >:</a
      ><a name="7042"
      > </a
      ><a name="7043" href="Stlc.html#5778" class="Datatype"
      >Id</a
      ><a name="7045" class="Symbol"
      >)</a
      ><a name="7046"
      > </a
      ><a name="7047" class="Symbol"
      >:</a
      ><a name="7048"
      > </a
      ><a name="7049" href="Stlc.html#6114" class="Datatype"
      >Term</a
      ><a name="7053"
      > </a
      ><a name="7054" class="Symbol"
      >&#8594;</a
      ><a name="7055"
      > </a
      ><a name="7056" class="PrimitiveType"
      >Set</a
      ><a name="7059"
      > </a
      ><a name="7060" class="Keyword"
      >where</a
      ><a name="7065"
      >
  </a
      ><a name="7068" href="StlcProp.html#7068" class="InductiveConstructor"
      >var</a
      ><a name="7071"
      >  </a
      ><a name="7073" class="Symbol"
      >:</a
      ><a name="7074"
      > </a
      ><a name="7075" href="StlcProp.html#7039" class="Bound"
      >x</a
      ><a name="7076"
      > </a
      ><a name="7077" href="StlcProp.html#7029" class="Datatype Operator"
      >FreeIn</a
      ><a name="7083"
      > </a
      ><a name="7084" href="Stlc.html#6133" class="InductiveConstructor"
      >var</a
      ><a name="7087"
      > </a
      ><a name="7088" href="StlcProp.html#7039" class="Bound"
      >x</a
      ><a name="7089"
      >
  </a
      ><a name="7092" href="StlcProp.html#7092" class="InductiveConstructor"
      >abs</a
      ><a name="7095"
      >  </a
      ><a name="7097" class="Symbol"
      >:</a
      ><a name="7098"
      > </a
      ><a name="7099" class="Symbol"
      >&#8704;</a
      ><a name="7100"
      > </a
      ><a name="7101" class="Symbol"
      >{</a
      ><a name="7102" href="StlcProp.html#7102" class="Bound"
      >y</a
      ><a name="7103"
      > </a
      ><a name="7104" href="StlcProp.html#7104" class="Bound"
      >A</a
      ><a name="7105"
      > </a
      ><a name="7106" href="StlcProp.html#7106" class="Bound"
      >t</a
      ><a name="7107" class="Symbol"
      >}</a
      ><a name="7108"
      > </a
      ><a name="7109" class="Symbol"
      >&#8594;</a
      ><a name="7110"
      > </a
      ><a name="7111" href="StlcProp.html#7102" class="Bound"
      >y</a
      ><a name="7112"
      > </a
      ><a name="7113" href="https://agda.github.io/agda-stdlib/Relation.Binary.Core.html#4493" class="Function Operator"
      >&#8802;</a
      ><a name="7114"
      > </a
      ><a name="7115" href="StlcProp.html#7039" class="Bound"
      >x</a
      ><a name="7116"
      > </a
      ><a name="7117" class="Symbol"
      >&#8594;</a
      ><a name="7118"
      > </a
      ><a name="7119" href="StlcProp.html#7039" class="Bound"
      >x</a
      ><a name="7120"
      > </a
      ><a name="7121" href="StlcProp.html#7029" class="Datatype Operator"
      >FreeIn</a
      ><a name="7127"
      > </a
      ><a name="7128" href="StlcProp.html#7106" class="Bound"
      >t</a
      ><a name="7129"
      > </a
      ><a name="7130" class="Symbol"
      >&#8594;</a
      ><a name="7131"
      > </a
      ><a name="7132" href="StlcProp.html#7039" class="Bound"
      >x</a
      ><a name="7133"
      > </a
      ><a name="7134" href="StlcProp.html#7029" class="Datatype Operator"
      >FreeIn</a
      ><a name="7140"
      > </a
      ><a name="7141" href="Stlc.html#6182" class="InductiveConstructor"
      >abs</a
      ><a name="7144"
      > </a
      ><a name="7145" href="StlcProp.html#7102" class="Bound"
      >y</a
      ><a name="7146"
      > </a
      ><a name="7147" href="StlcProp.html#7104" class="Bound"
      >A</a
      ><a name="7148"
      > </a
      ><a name="7149" href="StlcProp.html#7106" class="Bound"
      >t</a
      ><a name="7150"
      >
  </a
      ><a name="7153" href="StlcProp.html#7153" class="InductiveConstructor"
      >app1</a
      ><a name="7157"
      > </a
      ><a name="7158" class="Symbol"
      >:</a
      ><a name="7159"
      > </a
      ><a name="7160" class="Symbol"
      >&#8704;</a
      ><a name="7161"
      > </a
      ><a name="7162" class="Symbol"
      >{</a
      ><a name="7163" href="StlcProp.html#7163" class="Bound"
      >t&#8321;</a
      ><a name="7165"
      > </a
      ><a name="7166" href="StlcProp.html#7166" class="Bound"
      >t&#8322;</a
      ><a name="7168" class="Symbol"
      >}</a
      ><a name="7169"
      > </a
      ><a name="7170" class="Symbol"
      >&#8594;</a
      ><a name="7171"
      > </a
      ><a name="7172" href="StlcProp.html#7039" class="Bound"
      >x</a
      ><a name="7173"
      > </a
      ><a name="7174" href="StlcProp.html#7029" class="Datatype Operator"
      >FreeIn</a
      ><a name="7180"
      > </a
      ><a name="7181" href="StlcProp.html#7163" class="Bound"
      >t&#8321;</a
      ><a name="7183"
      > </a
      ><a name="7184" class="Symbol"
      >&#8594;</a
      ><a name="7185"
      > </a
      ><a name="7186" href="StlcProp.html#7039" class="Bound"
      >x</a
      ><a name="7187"
      > </a
      ><a name="7188" href="StlcProp.html#7029" class="Datatype Operator"
      >FreeIn</a
      ><a name="7194"
      > </a
      ><a name="7195" href="Stlc.html#6153" class="InductiveConstructor"
      >app</a
      ><a name="7198"
      > </a
      ><a name="7199" href="StlcProp.html#7163" class="Bound"
      >t&#8321;</a
      ><a name="7201"
      > </a
      ><a name="7202" href="StlcProp.html#7166" class="Bound"
      >t&#8322;</a
      ><a name="7204"
      >
  </a
      ><a name="7207" href="StlcProp.html#7207" class="InductiveConstructor"
      >app2</a
      ><a name="7211"
      > </a
      ><a name="7212" class="Symbol"
      >:</a
      ><a name="7213"
      > </a
      ><a name="7214" class="Symbol"
      >&#8704;</a
      ><a name="7215"
      > </a
      ><a name="7216" class="Symbol"
      >{</a
      ><a name="7217" href="StlcProp.html#7217" class="Bound"
      >t&#8321;</a
      ><a name="7219"
      > </a
      ><a name="7220" href="StlcProp.html#7220" class="Bound"
      >t&#8322;</a
      ><a name="7222" class="Symbol"
      >}</a
      ><a name="7223"
      > </a
      ><a name="7224" class="Symbol"
      >&#8594;</a
      ><a name="7225"
      > </a
      ><a name="7226" href="StlcProp.html#7039" class="Bound"
      >x</a
      ><a name="7227"
      > </a
      ><a name="7228" href="StlcProp.html#7029" class="Datatype Operator"
      >FreeIn</a
      ><a name="7234"
      > </a
      ><a name="7235" href="StlcProp.html#7220" class="Bound"
      >t&#8322;</a
      ><a name="7237"
      > </a
      ><a name="7238" class="Symbol"
      >&#8594;</a
      ><a name="7239"
      > </a
      ><a name="7240" href="StlcProp.html#7039" class="Bound"
      >x</a
      ><a name="7241"
      > </a
      ><a name="7242" href="StlcProp.html#7029" class="Datatype Operator"
      >FreeIn</a
      ><a name="7248"
      > </a
      ><a name="7249" href="Stlc.html#6153" class="InductiveConstructor"
      >app</a
      ><a name="7252"
      > </a
      ><a name="7253" href="StlcProp.html#7217" class="Bound"
      >t&#8321;</a
      ><a name="7255"
      > </a
      ><a name="7256" href="StlcProp.html#7220" class="Bound"
      >t&#8322;</a
      ><a name="7258"
      >
  </a
      ><a name="7261" href="StlcProp.html#7261" class="InductiveConstructor"
      >if1</a
      ><a name="7264"
      >  </a
      ><a name="7266" class="Symbol"
      >:</a
      ><a name="7267"
      > </a
      ><a name="7268" class="Symbol"
      >&#8704;</a
      ><a name="7269"
      > </a
      ><a name="7270" class="Symbol"
      >{</a
      ><a name="7271" href="StlcProp.html#7271" class="Bound"
      >t&#8321;</a
      ><a name="7273"
      > </a
      ><a name="7274" href="StlcProp.html#7274" class="Bound"
      >t&#8322;</a
      ><a name="7276"
      > </a
      ><a name="7277" href="StlcProp.html#7277" class="Bound"
      >t&#8323;</a
      ><a name="7279" class="Symbol"
      >}</a
      ><a name="7280"
      > </a
      ><a name="7281" class="Symbol"
      >&#8594;</a
      ><a name="7282"
      > </a
      ><a name="7283" href="StlcProp.html#7039" class="Bound"
      >x</a
      ><a name="7284"
      > </a
      ><a name="7285" href="StlcProp.html#7029" class="Datatype Operator"
      >FreeIn</a
      ><a name="7291"
      > </a
      ><a name="7292" href="StlcProp.html#7271" class="Bound"
      >t&#8321;</a
      ><a name="7294"
      > </a
      ><a name="7295" class="Symbol"
      >&#8594;</a
      ><a name="7296"
      > </a
      ><a name="7297" href="StlcProp.html#7039" class="Bound"
      >x</a
      ><a name="7298"
      > </a
      ><a name="7299" href="StlcProp.html#7029" class="Datatype Operator"
      >FreeIn</a
      ><a name="7305"
      > </a
      ><a name="7306" class="Symbol"
      >(</a
      ><a name="7307" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >if</a
      ><a name="7309"
      > </a
      ><a name="7310" href="StlcProp.html#7271" class="Bound"
      >t&#8321;</a
      ><a name="7312"
      > </a
      ><a name="7313" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >then</a
      ><a name="7317"
      > </a
      ><a name="7318" href="StlcProp.html#7274" class="Bound"
      >t&#8322;</a
      ><a name="7320"
      > </a
      ><a name="7321" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >else</a
      ><a name="7325"
      > </a
      ><a name="7326" href="StlcProp.html#7277" class="Bound"
      >t&#8323;</a
      ><a name="7328" class="Symbol"
      >)</a
      ><a name="7329"
      >
  </a
      ><a name="7332" href="StlcProp.html#7332" class="InductiveConstructor"
      >if2</a
      ><a name="7335"
      >  </a
      ><a name="7337" class="Symbol"
      >:</a
      ><a name="7338"
      > </a
      ><a name="7339" class="Symbol"
      >&#8704;</a
      ><a name="7340"
      > </a
      ><a name="7341" class="Symbol"
      >{</a
      ><a name="7342" href="StlcProp.html#7342" class="Bound"
      >t&#8321;</a
      ><a name="7344"
      > </a
      ><a name="7345" href="StlcProp.html#7345" class="Bound"
      >t&#8322;</a
      ><a name="7347"
      > </a
      ><a name="7348" href="StlcProp.html#7348" class="Bound"
      >t&#8323;</a
      ><a name="7350" class="Symbol"
      >}</a
      ><a name="7351"
      > </a
      ><a name="7352" class="Symbol"
      >&#8594;</a
      ><a name="7353"
      > </a
      ><a name="7354" href="StlcProp.html#7039" class="Bound"
      >x</a
      ><a name="7355"
      > </a
      ><a name="7356" href="StlcProp.html#7029" class="Datatype Operator"
      >FreeIn</a
      ><a name="7362"
      > </a
      ><a name="7363" href="StlcProp.html#7345" class="Bound"
      >t&#8322;</a
      ><a name="7365"
      > </a
      ><a name="7366" class="Symbol"
      >&#8594;</a
      ><a name="7367"
      > </a
      ><a name="7368" href="StlcProp.html#7039" class="Bound"
      >x</a
      ><a name="7369"
      > </a
      ><a name="7370" href="StlcProp.html#7029" class="Datatype Operator"
      >FreeIn</a
      ><a name="7376"
      > </a
      ><a name="7377" class="Symbol"
      >(</a
      ><a name="7378" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >if</a
      ><a name="7380"
      > </a
      ><a name="7381" href="StlcProp.html#7342" class="Bound"
      >t&#8321;</a
      ><a name="7383"
      > </a
      ><a name="7384" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >then</a
      ><a name="7388"
      > </a
      ><a name="7389" href="StlcProp.html#7345" class="Bound"
      >t&#8322;</a
      ><a name="7391"
      > </a
      ><a name="7392" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >else</a
      ><a name="7396"
      > </a
      ><a name="7397" href="StlcProp.html#7348" class="Bound"
      >t&#8323;</a
      ><a name="7399" class="Symbol"
      >)</a
      ><a name="7400"
      >
  </a
      ><a name="7403" href="StlcProp.html#7403" class="InductiveConstructor"
      >if3</a
      ><a name="7406"
      >  </a
      ><a name="7408" class="Symbol"
      >:</a
      ><a name="7409"
      > </a
      ><a name="7410" class="Symbol"
      >&#8704;</a
      ><a name="7411"
      > </a
      ><a name="7412" class="Symbol"
      >{</a
      ><a name="7413" href="StlcProp.html#7413" class="Bound"
      >t&#8321;</a
      ><a name="7415"
      > </a
      ><a name="7416" href="StlcProp.html#7416" class="Bound"
      >t&#8322;</a
      ><a name="7418"
      > </a
      ><a name="7419" href="StlcProp.html#7419" class="Bound"
      >t&#8323;</a
      ><a name="7421" class="Symbol"
      >}</a
      ><a name="7422"
      > </a
      ><a name="7423" class="Symbol"
      >&#8594;</a
      ><a name="7424"
      > </a
      ><a name="7425" href="StlcProp.html#7039" class="Bound"
      >x</a
      ><a name="7426"
      > </a
      ><a name="7427" href="StlcProp.html#7029" class="Datatype Operator"
      >FreeIn</a
      ><a name="7433"
      > </a
      ><a name="7434" href="StlcProp.html#7419" class="Bound"
      >t&#8323;</a
      ><a name="7436"
      > </a
      ><a name="7437" class="Symbol"
      >&#8594;</a
      ><a name="7438"
      > </a
      ><a name="7439" href="StlcProp.html#7039" class="Bound"
      >x</a
      ><a name="7440"
      > </a
      ><a name="7441" href="StlcProp.html#7029" class="Datatype Operator"
      >FreeIn</a
      ><a name="7447"
      > </a
      ><a name="7448" class="Symbol"
      >(</a
      ><a name="7449" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >if</a
      ><a name="7451"
      > </a
      ><a name="7452" href="StlcProp.html#7413" class="Bound"
      >t&#8321;</a
      ><a name="7454"
      > </a
      ><a name="7455" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >then</a
      ><a name="7459"
      > </a
      ><a name="7460" href="StlcProp.html#7416" class="Bound"
      >t&#8322;</a
      ><a name="7462"
      > </a
      ><a name="7463" href="Stlc.html#6246" class="InductiveConstructor Operator"
      >else</a
      ><a name="7467"
      > </a
      ><a name="7468" href="StlcProp.html#7419" class="Bound"
      >t&#8323;</a
      ><a name="7470" class="Symbol"
      >)</a
      >
{% endraw %}</pre>

A term in which no variables appear free is said to be _closed_.

<pre class="Agda">{% raw %}
<a name="7563" href="StlcProp.html#7563" class="Function"
      >Closed</a
      ><a name="7569"
      > </a
      ><a name="7570" class="Symbol"
      >:</a
      ><a name="7571"
      > </a
      ><a name="7572" href="Stlc.html#6114" class="Datatype"
      >Term</a
      ><a name="7576"
      > </a
      ><a name="7577" class="Symbol"
      >&#8594;</a
      ><a name="7578"
      > </a
      ><a name="7579" class="PrimitiveType"
      >Set</a
      ><a name="7582"
      >
</a
      ><a name="7583" href="StlcProp.html#7563" class="Function"
      >Closed</a
      ><a name="7589"
      > </a
      ><a name="7590" href="StlcProp.html#7590" class="Bound"
      >t</a
      ><a name="7591"
      > </a
      ><a name="7592" class="Symbol"
      >=</a
      ><a name="7593"
      > </a
      ><a name="7594" class="Symbol"
      >&#8704;</a
      ><a name="7595"
      > </a
      ><a name="7596" class="Symbol"
      >{</a
      ><a name="7597" href="StlcProp.html#7597" class="Bound"
      >x</a
      ><a name="7598" class="Symbol"
      >}</a
      ><a name="7599"
      > </a
      ><a name="7600" class="Symbol"
      >&#8594;</a
      ><a name="7601"
      > </a
      ><a name="7602" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#414" class="Function Operator"
      >&#172;</a
      ><a name="7603"
      > </a
      ><a name="7604" class="Symbol"
      >(</a
      ><a name="7605" href="StlcProp.html#7597" class="Bound"
      >x</a
      ><a name="7606"
      > </a
      ><a name="7607" href="StlcProp.html#7029" class="Datatype Operator"
      >FreeIn</a
      ><a name="7613"
      > </a
      ><a name="7614" href="StlcProp.html#7590" class="Bound"
      >t</a
      ><a name="7615" class="Symbol"
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
<a name="8344" href="StlcProp.html#8344" class="Function"
      >freeInCtxt</a
      ><a name="8354"
      > </a
      ><a name="8355" class="Symbol"
      >:</a
      ><a name="8356"
      > </a
      ><a name="8357" class="Symbol"
      >&#8704;</a
      ><a name="8358"
      > </a
      ><a name="8359" class="Symbol"
      >{</a
      ><a name="8360" href="StlcProp.html#8360" class="Bound"
      >x</a
      ><a name="8361"
      > </a
      ><a name="8362" href="StlcProp.html#8362" class="Bound"
      >t</a
      ><a name="8363"
      > </a
      ><a name="8364" href="StlcProp.html#8364" class="Bound"
      >A</a
      ><a name="8365"
      > </a
      ><a name="8366" href="StlcProp.html#8366" class="Bound"
      >&#915;</a
      ><a name="8367" class="Symbol"
      >}</a
      ><a name="8368"
      > </a
      ><a name="8369" class="Symbol"
      >&#8594;</a
      ><a name="8370"
      > </a
      ><a name="8371" href="StlcProp.html#8360" class="Bound"
      >x</a
      ><a name="8372"
      > </a
      ><a name="8373" href="StlcProp.html#7029" class="Datatype Operator"
      >FreeIn</a
      ><a name="8379"
      > </a
      ><a name="8380" href="StlcProp.html#8362" class="Bound"
      >t</a
      ><a name="8381"
      > </a
      ><a name="8382" class="Symbol"
      >&#8594;</a
      ><a name="8383"
      > </a
      ><a name="8384" href="StlcProp.html#8366" class="Bound"
      >&#915;</a
      ><a name="8385"
      > </a
      ><a name="8386" href="Stlc.html#19629" class="Datatype Operator"
      >&#8866;</a
      ><a name="8387"
      > </a
      ><a name="8388" href="StlcProp.html#8362" class="Bound"
      >t</a
      ><a name="8389"
      > </a
      ><a name="8390" href="Stlc.html#19629" class="Datatype Operator"
      >&#8758;</a
      ><a name="8391"
      > </a
      ><a name="8392" href="StlcProp.html#8364" class="Bound"
      >A</a
      ><a name="8393"
      > </a
      ><a name="8394" class="Symbol"
      >&#8594;</a
      ><a name="8395"
      > </a
      ><a name="8396" href="https://agda.github.io/agda-stdlib/Data.Product.html#823" class="Function"
      >&#8707;</a
      ><a name="8397"
      > </a
      ><a name="8398" class="Symbol"
      >&#955;</a
      ><a name="8399"
      > </a
      ><a name="8400" href="StlcProp.html#8400" class="Bound"
      >B</a
      ><a name="8401"
      > </a
      ><a name="8402" class="Symbol"
      >&#8594;</a
      ><a name="8403"
      > </a
      ><a name="8404" href="StlcProp.html#8366" class="Bound"
      >&#915;</a
      ><a name="8405"
      > </a
      ><a name="8406" href="StlcProp.html#8360" class="Bound"
      >x</a
      ><a name="8407"
      > </a
      ><a name="8408" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="8409"
      > </a
      ><a name="8410" href="https://agda.github.io/agda-stdlib/Data.Maybe.Base.html#373" class="InductiveConstructor"
      >just</a
      ><a name="8414"
      > </a
      ><a name="8415" href="StlcProp.html#8400" class="Bound"
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
<a name="10011" href="StlcProp.html#8344" class="Function"
      >freeInCtxt</a
      ><a name="10021"
      > </a
      ><a name="10022" href="StlcProp.html#7068" class="InductiveConstructor"
      >var</a
      ><a name="10025"
      > </a
      ><a name="10026" class="Symbol"
      >(</a
      ><a name="10027" href="Stlc.html#19673" class="InductiveConstructor"
      >var</a
      ><a name="10030"
      > </a
      ><a name="10031" class="Symbol"
      >_</a
      ><a name="10032"
      > </a
      ><a name="10033" href="StlcProp.html#10033" class="Bound"
      >x&#8758;A</a
      ><a name="10036" class="Symbol"
      >)</a
      ><a name="10037"
      > </a
      ><a name="10038" class="Symbol"
      >=</a
      ><a name="10039"
      > </a
      ><a name="10040" class="Symbol"
      >(_</a
      ><a name="10042"
      > </a
      ><a name="10043" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="10044"
      > </a
      ><a name="10045" href="StlcProp.html#10033" class="Bound"
      >x&#8758;A</a
      ><a name="10048" class="Symbol"
      >)</a
      ><a name="10049"
      >
</a
      ><a name="10050" href="StlcProp.html#8344" class="Function"
      >freeInCtxt</a
      ><a name="10060"
      > </a
      ><a name="10061" class="Symbol"
      >(</a
      ><a name="10062" href="StlcProp.html#7153" class="InductiveConstructor"
      >app1</a
      ><a name="10066"
      > </a
      ><a name="10067" href="StlcProp.html#10067" class="Bound"
      >x&#8712;t&#8321;</a
      ><a name="10071" class="Symbol"
      >)</a
      ><a name="10072"
      > </a
      ><a name="10073" class="Symbol"
      >(</a
      ><a name="10074" href="Stlc.html#19882" class="InductiveConstructor"
      >app</a
      ><a name="10077"
      > </a
      ><a name="10078" href="StlcProp.html#10078" class="Bound"
      >t&#8321;&#8758;A</a
      ><a name="10082"
      > </a
      ><a name="10083" class="Symbol"
      >_</a
      ><a name="10084"
      >   </a
      ><a name="10087" class="Symbol"
      >)</a
      ><a name="10088"
      > </a
      ><a name="10089" class="Symbol"
      >=</a
      ><a name="10090"
      > </a
      ><a name="10091" href="StlcProp.html#8344" class="Function"
      >freeInCtxt</a
      ><a name="10101"
      > </a
      ><a name="10102" href="StlcProp.html#10067" class="Bound"
      >x&#8712;t&#8321;</a
      ><a name="10106"
      > </a
      ><a name="10107" href="StlcProp.html#10078" class="Bound"
      >t&#8321;&#8758;A</a
      ><a name="10111"
      >
</a
      ><a name="10112" href="StlcProp.html#8344" class="Function"
      >freeInCtxt</a
      ><a name="10122"
      > </a
      ><a name="10123" class="Symbol"
      >(</a
      ><a name="10124" href="StlcProp.html#7207" class="InductiveConstructor"
      >app2</a
      ><a name="10128"
      > </a
      ><a name="10129" href="StlcProp.html#10129" class="Bound"
      >x&#8712;t&#8322;</a
      ><a name="10133" class="Symbol"
      >)</a
      ><a name="10134"
      > </a
      ><a name="10135" class="Symbol"
      >(</a
      ><a name="10136" href="Stlc.html#19882" class="InductiveConstructor"
      >app</a
      ><a name="10139"
      > </a
      ><a name="10140" class="Symbol"
      >_</a
      ><a name="10141"
      >    </a
      ><a name="10145" href="StlcProp.html#10145" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="10149" class="Symbol"
      >)</a
      ><a name="10150"
      > </a
      ><a name="10151" class="Symbol"
      >=</a
      ><a name="10152"
      > </a
      ><a name="10153" href="StlcProp.html#8344" class="Function"
      >freeInCtxt</a
      ><a name="10163"
      > </a
      ><a name="10164" href="StlcProp.html#10129" class="Bound"
      >x&#8712;t&#8322;</a
      ><a name="10168"
      > </a
      ><a name="10169" href="StlcProp.html#10145" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="10173"
      >
</a
      ><a name="10174" href="StlcProp.html#8344" class="Function"
      >freeInCtxt</a
      ><a name="10184"
      > </a
      ><a name="10185" class="Symbol"
      >(</a
      ><a name="10186" href="StlcProp.html#7261" class="InductiveConstructor"
      >if1</a
      ><a name="10189"
      >  </a
      ><a name="10191" href="StlcProp.html#10191" class="Bound"
      >x&#8712;t&#8321;</a
      ><a name="10195" class="Symbol"
      >)</a
      ><a name="10196"
      > </a
      ><a name="10197" class="Symbol"
      >(</a
      ><a name="10198" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >if</a
      ><a name="10200"
      > </a
      ><a name="10201" href="StlcProp.html#10201" class="Bound"
      >t&#8321;&#8758;A</a
      ><a name="10205"
      > </a
      ><a name="10206" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >then</a
      ><a name="10210"
      > </a
      ><a name="10211" class="Symbol"
      >_</a
      ><a name="10212"
      >    </a
      ><a name="10216" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >else</a
      ><a name="10220"
      > </a
      ><a name="10221" class="Symbol"
      >_</a
      ><a name="10222"
      >   </a
      ><a name="10225" class="Symbol"
      >)</a
      ><a name="10226"
      > </a
      ><a name="10227" class="Symbol"
      >=</a
      ><a name="10228"
      > </a
      ><a name="10229" href="StlcProp.html#8344" class="Function"
      >freeInCtxt</a
      ><a name="10239"
      > </a
      ><a name="10240" href="StlcProp.html#10191" class="Bound"
      >x&#8712;t&#8321;</a
      ><a name="10244"
      > </a
      ><a name="10245" href="StlcProp.html#10201" class="Bound"
      >t&#8321;&#8758;A</a
      ><a name="10249"
      >
</a
      ><a name="10250" href="StlcProp.html#8344" class="Function"
      >freeInCtxt</a
      ><a name="10260"
      > </a
      ><a name="10261" class="Symbol"
      >(</a
      ><a name="10262" href="StlcProp.html#7332" class="InductiveConstructor"
      >if2</a
      ><a name="10265"
      >  </a
      ><a name="10267" href="StlcProp.html#10267" class="Bound"
      >x&#8712;t&#8322;</a
      ><a name="10271" class="Symbol"
      >)</a
      ><a name="10272"
      > </a
      ><a name="10273" class="Symbol"
      >(</a
      ><a name="10274" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >if</a
      ><a name="10276"
      > </a
      ><a name="10277" class="Symbol"
      >_</a
      ><a name="10278"
      >    </a
      ><a name="10282" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >then</a
      ><a name="10286"
      > </a
      ><a name="10287" href="StlcProp.html#10287" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="10291"
      > </a
      ><a name="10292" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >else</a
      ><a name="10296"
      > </a
      ><a name="10297" class="Symbol"
      >_</a
      ><a name="10298"
      >   </a
      ><a name="10301" class="Symbol"
      >)</a
      ><a name="10302"
      > </a
      ><a name="10303" class="Symbol"
      >=</a
      ><a name="10304"
      > </a
      ><a name="10305" href="StlcProp.html#8344" class="Function"
      >freeInCtxt</a
      ><a name="10315"
      > </a
      ><a name="10316" href="StlcProp.html#10267" class="Bound"
      >x&#8712;t&#8322;</a
      ><a name="10320"
      > </a
      ><a name="10321" href="StlcProp.html#10287" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="10325"
      >
</a
      ><a name="10326" href="StlcProp.html#8344" class="Function"
      >freeInCtxt</a
      ><a name="10336"
      > </a
      ><a name="10337" class="Symbol"
      >(</a
      ><a name="10338" href="StlcProp.html#7403" class="InductiveConstructor"
      >if3</a
      ><a name="10341"
      >  </a
      ><a name="10343" href="StlcProp.html#10343" class="Bound"
      >x&#8712;t&#8323;</a
      ><a name="10347" class="Symbol"
      >)</a
      ><a name="10348"
      > </a
      ><a name="10349" class="Symbol"
      >(</a
      ><a name="10350" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >if</a
      ><a name="10352"
      > </a
      ><a name="10353" class="Symbol"
      >_</a
      ><a name="10354"
      >    </a
      ><a name="10358" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >then</a
      ><a name="10362"
      > </a
      ><a name="10363" class="Symbol"
      >_</a
      ><a name="10364"
      >    </a
      ><a name="10368" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >else</a
      ><a name="10372"
      > </a
      ><a name="10373" href="StlcProp.html#10373" class="Bound"
      >t&#8323;&#8758;A</a
      ><a name="10377" class="Symbol"
      >)</a
      ><a name="10378"
      > </a
      ><a name="10379" class="Symbol"
      >=</a
      ><a name="10380"
      > </a
      ><a name="10381" href="StlcProp.html#8344" class="Function"
      >freeInCtxt</a
      ><a name="10391"
      > </a
      ><a name="10392" href="StlcProp.html#10343" class="Bound"
      >x&#8712;t&#8323;</a
      ><a name="10396"
      > </a
      ><a name="10397" href="StlcProp.html#10373" class="Bound"
      >t&#8323;&#8758;A</a
      ><a name="10401"
      >
</a
      ><a name="10402" href="StlcProp.html#8344" class="Function"
      >freeInCtxt</a
      ><a name="10412"
      > </a
      ><a name="10413" class="Symbol"
      >{</a
      ><a name="10414" href="StlcProp.html#10414" class="Bound"
      >x</a
      ><a name="10415" class="Symbol"
      >}</a
      ><a name="10416"
      > </a
      ><a name="10417" class="Symbol"
      >(</a
      ><a name="10418" href="StlcProp.html#7092" class="InductiveConstructor"
      >abs</a
      ><a name="10421"
      > </a
      ><a name="10422" class="Symbol"
      >{</a
      ><a name="10423" href="StlcProp.html#10423" class="Bound"
      >y</a
      ><a name="10424" class="Symbol"
      >}</a
      ><a name="10425"
      > </a
      ><a name="10426" href="StlcProp.html#10426" class="Bound"
      >y&#8800;x</a
      ><a name="10429"
      > </a
      ><a name="10430" href="StlcProp.html#10430" class="Bound"
      >x&#8712;t</a
      ><a name="10433" class="Symbol"
      >)</a
      ><a name="10434"
      > </a
      ><a name="10435" class="Symbol"
      >(</a
      ><a name="10436" href="Stlc.html#19766" class="InductiveConstructor"
      >abs</a
      ><a name="10439"
      > </a
      ><a name="10440" href="StlcProp.html#10440" class="Bound"
      >t&#8758;B</a
      ><a name="10443" class="Symbol"
      >)</a
      ><a name="10444"
      >
    </a
      ><a name="10449" class="Keyword"
      >with</a
      ><a name="10453"
      > </a
      ><a name="10454" href="StlcProp.html#8344" class="Function"
      >freeInCtxt</a
      ><a name="10464"
      > </a
      ><a name="10465" href="StlcProp.html#10430" class="Bound"
      >x&#8712;t</a
      ><a name="10468"
      > </a
      ><a name="10469" href="StlcProp.html#10440" class="Bound"
      >t&#8758;B</a
      ><a name="10472"
      >
</a
      ><a name="10473" class="Symbol"
      >...</a
      ><a name="10476"
      > </a
      ><a name="10477" class="Symbol"
      >|</a
      ><a name="10478"
      > </a
      ><a name="10479" href="StlcProp.html#10479" class="Bound"
      >x&#8758;A</a
      ><a name="10482"
      >
    </a
      ><a name="10487" class="Keyword"
      >with</a
      ><a name="10491"
      > </a
      ><a name="10492" href="StlcProp.html#10423" class="Bound"
      >y</a
      ><a name="10493"
      > </a
      ><a name="10494" href="Stlc.html#5853" class="Function Operator"
      >&#8799;</a
      ><a name="10495"
      > </a
      ><a name="10496" href="StlcProp.html#10414" class="Bound"
      >x</a
      ><a name="10497"
      >
</a
      ><a name="10498" class="Symbol"
      >...</a
      ><a name="10501"
      > </a
      ><a name="10502" class="Symbol"
      >|</a
      ><a name="10503"
      > </a
      ><a name="10504" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="10507"
      > </a
      ><a name="10508" href="StlcProp.html#10508" class="Bound"
      >y=x</a
      ><a name="10511"
      > </a
      ><a name="10512" class="Symbol"
      >=</a
      ><a name="10513"
      > </a
      ><a name="10514" href="https://agda.github.io/agda-stdlib/Data.Empty.html#348" class="Function"
      >&#8869;-elim</a
      ><a name="10520"
      > </a
      ><a name="10521" class="Symbol"
      >(</a
      ><a name="10522" href="StlcProp.html#10426" class="Bound"
      >y&#8800;x</a
      ><a name="10525"
      > </a
      ><a name="10526" href="StlcProp.html#10508" class="Bound"
      >y=x</a
      ><a name="10529" class="Symbol"
      >)</a
      ><a name="10530"
      >
</a
      ><a name="10531" class="Symbol"
      >...</a
      ><a name="10534"
      > </a
      ><a name="10535" class="Symbol"
      >|</a
      ><a name="10536"
      > </a
      ><a name="10537" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="10539"
      >  </a
      ><a name="10541" class="Symbol"
      >_</a
      ><a name="10542"
      >   </a
      ><a name="10545" class="Symbol"
      >=</a
      ><a name="10546"
      > </a
      ><a name="10547" href="StlcProp.html#10479" class="Bound"
      >x&#8758;A</a
      >
{% endraw %}</pre>

Next, we'll need the fact that any term $$t$$ which is well typed in
the empty context is closed (it has no free variables).

#### Exercise: 2 stars, optional (∅⊢-closed)

<pre class="Agda">{% raw %}
<a name="10748" class="Keyword"
      >postulate</a
      ><a name="10757"
      >
  </a
      ><a name="10760" href="StlcProp.html#10760" class="Postulate"
      >&#8709;&#8866;-closed</a
      ><a name="10769"
      > </a
      ><a name="10770" class="Symbol"
      >:</a
      ><a name="10771"
      > </a
      ><a name="10772" class="Symbol"
      >&#8704;</a
      ><a name="10773"
      > </a
      ><a name="10774" class="Symbol"
      >{</a
      ><a name="10775" href="StlcProp.html#10775" class="Bound"
      >t</a
      ><a name="10776"
      > </a
      ><a name="10777" href="StlcProp.html#10777" class="Bound"
      >A</a
      ><a name="10778" class="Symbol"
      >}</a
      ><a name="10779"
      > </a
      ><a name="10780" class="Symbol"
      >&#8594;</a
      ><a name="10781"
      > </a
      ><a name="10782" href="Stlc.html#18658" class="Function"
      >&#8709;</a
      ><a name="10783"
      > </a
      ><a name="10784" href="Stlc.html#19629" class="Datatype Operator"
      >&#8866;</a
      ><a name="10785"
      > </a
      ><a name="10786" href="StlcProp.html#10775" class="Bound"
      >t</a
      ><a name="10787"
      > </a
      ><a name="10788" href="Stlc.html#19629" class="Datatype Operator"
      >&#8758;</a
      ><a name="10789"
      > </a
      ><a name="10790" href="StlcProp.html#10777" class="Bound"
      >A</a
      ><a name="10791"
      > </a
      ><a name="10792" class="Symbol"
      >&#8594;</a
      ><a name="10793"
      > </a
      ><a name="10794" href="StlcProp.html#7563" class="Function"
      >Closed</a
      ><a name="10800"
      > </a
      ><a name="10801" href="StlcProp.html#10775" class="Bound"
      >t</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="10849" href="StlcProp.html#10849" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="10859"
      > </a
      ><a name="10860" class="Symbol"
      >:</a
      ><a name="10861"
      > </a
      ><a name="10862" class="Symbol"
      >&#8704;</a
      ><a name="10863"
      > </a
      ><a name="10864" class="Symbol"
      >{</a
      ><a name="10865" href="StlcProp.html#10865" class="Bound"
      >t</a
      ><a name="10866"
      > </a
      ><a name="10867" href="StlcProp.html#10867" class="Bound"
      >A</a
      ><a name="10868" class="Symbol"
      >}</a
      ><a name="10869"
      > </a
      ><a name="10870" class="Symbol"
      >&#8594;</a
      ><a name="10871"
      > </a
      ><a name="10872" href="Stlc.html#18658" class="Function"
      >&#8709;</a
      ><a name="10873"
      > </a
      ><a name="10874" href="Stlc.html#19629" class="Datatype Operator"
      >&#8866;</a
      ><a name="10875"
      > </a
      ><a name="10876" href="StlcProp.html#10865" class="Bound"
      >t</a
      ><a name="10877"
      > </a
      ><a name="10878" href="Stlc.html#19629" class="Datatype Operator"
      >&#8758;</a
      ><a name="10879"
      > </a
      ><a name="10880" href="StlcProp.html#10867" class="Bound"
      >A</a
      ><a name="10881"
      > </a
      ><a name="10882" class="Symbol"
      >&#8594;</a
      ><a name="10883"
      > </a
      ><a name="10884" href="StlcProp.html#7563" class="Function"
      >Closed</a
      ><a name="10890"
      > </a
      ><a name="10891" href="StlcProp.html#10865" class="Bound"
      >t</a
      ><a name="10892"
      >
</a
      ><a name="10893" href="StlcProp.html#10849" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="10903"
      > </a
      ><a name="10904" class="Symbol"
      >(</a
      ><a name="10905" href="Stlc.html#19673" class="InductiveConstructor"
      >var</a
      ><a name="10908"
      > </a
      ><a name="10909" href="StlcProp.html#10909" class="Bound"
      >x</a
      ><a name="10910"
      > </a
      ><a name="10911" class="Symbol"
      >())</a
      ><a name="10914"
      >
</a
      ><a name="10915" href="StlcProp.html#10849" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="10925"
      > </a
      ><a name="10926" class="Symbol"
      >(</a
      ><a name="10927" href="Stlc.html#19882" class="InductiveConstructor"
      >app</a
      ><a name="10930"
      > </a
      ><a name="10931" href="StlcProp.html#10931" class="Bound"
      >t&#8321;&#8758;A&#8658;B</a
      ><a name="10937"
      > </a
      ><a name="10938" href="StlcProp.html#10938" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="10942" class="Symbol"
      >)</a
      ><a name="10943"
      > </a
      ><a name="10944" class="Symbol"
      >(</a
      ><a name="10945" href="StlcProp.html#7153" class="InductiveConstructor"
      >app1</a
      ><a name="10949"
      > </a
      ><a name="10950" href="StlcProp.html#10950" class="Bound"
      >x&#8712;t&#8321;</a
      ><a name="10954" class="Symbol"
      >)</a
      ><a name="10955"
      > </a
      ><a name="10956" class="Symbol"
      >=</a
      ><a name="10957"
      > </a
      ><a name="10958" href="StlcProp.html#10849" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="10968"
      > </a
      ><a name="10969" href="StlcProp.html#10931" class="Bound"
      >t&#8321;&#8758;A&#8658;B</a
      ><a name="10975"
      > </a
      ><a name="10976" href="StlcProp.html#10950" class="Bound"
      >x&#8712;t&#8321;</a
      ><a name="10980"
      >
</a
      ><a name="10981" href="StlcProp.html#10849" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="10991"
      > </a
      ><a name="10992" class="Symbol"
      >(</a
      ><a name="10993" href="Stlc.html#19882" class="InductiveConstructor"
      >app</a
      ><a name="10996"
      > </a
      ><a name="10997" href="StlcProp.html#10997" class="Bound"
      >t&#8321;&#8758;A&#8658;B</a
      ><a name="11003"
      > </a
      ><a name="11004" href="StlcProp.html#11004" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="11008" class="Symbol"
      >)</a
      ><a name="11009"
      > </a
      ><a name="11010" class="Symbol"
      >(</a
      ><a name="11011" href="StlcProp.html#7207" class="InductiveConstructor"
      >app2</a
      ><a name="11015"
      > </a
      ><a name="11016" href="StlcProp.html#11016" class="Bound"
      >x&#8712;t&#8322;</a
      ><a name="11020" class="Symbol"
      >)</a
      ><a name="11021"
      > </a
      ><a name="11022" class="Symbol"
      >=</a
      ><a name="11023"
      > </a
      ><a name="11024" href="StlcProp.html#10849" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11034"
      > </a
      ><a name="11035" href="StlcProp.html#11004" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="11039"
      > </a
      ><a name="11040" href="StlcProp.html#11016" class="Bound"
      >x&#8712;t&#8322;</a
      ><a name="11044"
      >
</a
      ><a name="11045" href="StlcProp.html#10849" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11055"
      > </a
      ><a name="11056" href="Stlc.html#20016" class="InductiveConstructor"
      >true</a
      ><a name="11060"
      >  </a
      ><a name="11062" class="Symbol"
      >()</a
      ><a name="11064"
      >
</a
      ><a name="11065" href="StlcProp.html#10849" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11075"
      > </a
      ><a name="11076" href="Stlc.html#20075" class="InductiveConstructor"
      >false</a
      ><a name="11081"
      > </a
      ><a name="11082" class="Symbol"
      >()</a
      ><a name="11084"
      >
</a
      ><a name="11085" href="StlcProp.html#10849" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11095"
      > </a
      ><a name="11096" class="Symbol"
      >(</a
      ><a name="11097" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >if</a
      ><a name="11099"
      > </a
      ><a name="11100" href="StlcProp.html#11100" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="11107"
      > </a
      ><a name="11108" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >then</a
      ><a name="11112"
      > </a
      ><a name="11113" href="StlcProp.html#11113" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="11117"
      > </a
      ><a name="11118" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >else</a
      ><a name="11122"
      > </a
      ><a name="11123" href="StlcProp.html#11123" class="Bound"
      >t&#8323;&#8758;A</a
      ><a name="11127" class="Symbol"
      >)</a
      ><a name="11128"
      > </a
      ><a name="11129" class="Symbol"
      >(</a
      ><a name="11130" href="StlcProp.html#7261" class="InductiveConstructor"
      >if1</a
      ><a name="11133"
      > </a
      ><a name="11134" href="StlcProp.html#11134" class="Bound"
      >x&#8712;t&#8321;</a
      ><a name="11138" class="Symbol"
      >)</a
      ><a name="11139"
      > </a
      ><a name="11140" class="Symbol"
      >=</a
      ><a name="11141"
      > </a
      ><a name="11142" href="StlcProp.html#10849" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11152"
      > </a
      ><a name="11153" href="StlcProp.html#11100" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="11160"
      > </a
      ><a name="11161" href="StlcProp.html#11134" class="Bound"
      >x&#8712;t&#8321;</a
      ><a name="11165"
      >
</a
      ><a name="11166" href="StlcProp.html#10849" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11176"
      > </a
      ><a name="11177" class="Symbol"
      >(</a
      ><a name="11178" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >if</a
      ><a name="11180"
      > </a
      ><a name="11181" href="StlcProp.html#11181" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="11188"
      > </a
      ><a name="11189" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >then</a
      ><a name="11193"
      > </a
      ><a name="11194" href="StlcProp.html#11194" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="11198"
      > </a
      ><a name="11199" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >else</a
      ><a name="11203"
      > </a
      ><a name="11204" href="StlcProp.html#11204" class="Bound"
      >t&#8323;&#8758;A</a
      ><a name="11208" class="Symbol"
      >)</a
      ><a name="11209"
      > </a
      ><a name="11210" class="Symbol"
      >(</a
      ><a name="11211" href="StlcProp.html#7332" class="InductiveConstructor"
      >if2</a
      ><a name="11214"
      > </a
      ><a name="11215" href="StlcProp.html#11215" class="Bound"
      >x&#8712;t&#8322;</a
      ><a name="11219" class="Symbol"
      >)</a
      ><a name="11220"
      > </a
      ><a name="11221" class="Symbol"
      >=</a
      ><a name="11222"
      > </a
      ><a name="11223" href="StlcProp.html#10849" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11233"
      > </a
      ><a name="11234" href="StlcProp.html#11194" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="11238"
      > </a
      ><a name="11239" href="StlcProp.html#11215" class="Bound"
      >x&#8712;t&#8322;</a
      ><a name="11243"
      >
</a
      ><a name="11244" href="StlcProp.html#10849" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11254"
      > </a
      ><a name="11255" class="Symbol"
      >(</a
      ><a name="11256" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >if</a
      ><a name="11258"
      > </a
      ><a name="11259" href="StlcProp.html#11259" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="11266"
      > </a
      ><a name="11267" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >then</a
      ><a name="11271"
      > </a
      ><a name="11272" href="StlcProp.html#11272" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="11276"
      > </a
      ><a name="11277" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >else</a
      ><a name="11281"
      > </a
      ><a name="11282" href="StlcProp.html#11282" class="Bound"
      >t&#8323;&#8758;A</a
      ><a name="11286" class="Symbol"
      >)</a
      ><a name="11287"
      > </a
      ><a name="11288" class="Symbol"
      >(</a
      ><a name="11289" href="StlcProp.html#7403" class="InductiveConstructor"
      >if3</a
      ><a name="11292"
      > </a
      ><a name="11293" href="StlcProp.html#11293" class="Bound"
      >x&#8712;t&#8323;</a
      ><a name="11297" class="Symbol"
      >)</a
      ><a name="11298"
      > </a
      ><a name="11299" class="Symbol"
      >=</a
      ><a name="11300"
      > </a
      ><a name="11301" href="StlcProp.html#10849" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11311"
      > </a
      ><a name="11312" href="StlcProp.html#11282" class="Bound"
      >t&#8323;&#8758;A</a
      ><a name="11316"
      > </a
      ><a name="11317" href="StlcProp.html#11293" class="Bound"
      >x&#8712;t&#8323;</a
      ><a name="11321"
      >
</a
      ><a name="11322" href="StlcProp.html#10849" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11332"
      > </a
      ><a name="11333" class="Symbol"
      >(</a
      ><a name="11334" href="Stlc.html#19766" class="InductiveConstructor"
      >abs</a
      ><a name="11337"
      > </a
      ><a name="11338" class="Symbol"
      >{</a
      ><a name="11339" class="Argument"
      >x</a
      ><a name="11340"
      > </a
      ><a name="11341" class="Symbol"
      >=</a
      ><a name="11342"
      > </a
      ><a name="11343" href="StlcProp.html#11343" class="Bound"
      >x</a
      ><a name="11344" class="Symbol"
      >}</a
      ><a name="11345"
      > </a
      ><a name="11346" href="StlcProp.html#11346" class="Bound"
      >t&#8242;&#8758;A</a
      ><a name="11350" class="Symbol"
      >)</a
      ><a name="11351"
      > </a
      ><a name="11352" class="Symbol"
      >{</a
      ><a name="11353" href="StlcProp.html#11353" class="Bound"
      >y</a
      ><a name="11354" class="Symbol"
      >}</a
      ><a name="11355"
      > </a
      ><a name="11356" class="Symbol"
      >(</a
      ><a name="11357" href="StlcProp.html#7092" class="InductiveConstructor"
      >abs</a
      ><a name="11360"
      > </a
      ><a name="11361" href="StlcProp.html#11361" class="Bound"
      >x&#8800;y</a
      ><a name="11364"
      > </a
      ><a name="11365" href="StlcProp.html#11365" class="Bound"
      >y&#8712;t&#8242;</a
      ><a name="11369" class="Symbol"
      >)</a
      ><a name="11370"
      > </a
      ><a name="11371" class="Keyword"
      >with</a
      ><a name="11375"
      > </a
      ><a name="11376" href="StlcProp.html#8344" class="Function"
      >freeInCtxt</a
      ><a name="11386"
      > </a
      ><a name="11387" href="StlcProp.html#11365" class="Bound"
      >y&#8712;t&#8242;</a
      ><a name="11391"
      > </a
      ><a name="11392" href="StlcProp.html#11346" class="Bound"
      >t&#8242;&#8758;A</a
      ><a name="11396"
      >
</a
      ><a name="11397" href="StlcProp.html#10849" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11407"
      > </a
      ><a name="11408" class="Symbol"
      >(</a
      ><a name="11409" class="InductiveConstructor"
      >abs</a
      ><a name="11412"
      > </a
      ><a name="11413" class="Symbol"
      >{</a
      ><a name="11414" class="Argument"
      >x</a
      ><a name="11415"
      > </a
      ><a name="11416" class="Symbol"
      >=</a
      ><a name="11417"
      > </a
      ><a name="11418" href="StlcProp.html#11418" class="Bound"
      >x</a
      ><a name="11419" class="Symbol"
      >}</a
      ><a name="11420"
      > </a
      ><a name="11421" href="StlcProp.html#11421" class="Bound"
      >t&#8242;&#8758;A</a
      ><a name="11425" class="Symbol"
      >)</a
      ><a name="11426"
      > </a
      ><a name="11427" class="Symbol"
      >{</a
      ><a name="11428" href="StlcProp.html#11428" class="Bound"
      >y</a
      ><a name="11429" class="Symbol"
      >}</a
      ><a name="11430"
      > </a
      ><a name="11431" class="Symbol"
      >(</a
      ><a name="11432" class="InductiveConstructor"
      >abs</a
      ><a name="11435"
      > </a
      ><a name="11436" href="StlcProp.html#11436" class="Bound"
      >x&#8800;y</a
      ><a name="11439"
      > </a
      ><a name="11440" href="StlcProp.html#11440" class="Bound"
      >y&#8712;t&#8242;</a
      ><a name="11444" class="Symbol"
      >)</a
      ><a name="11445"
      > </a
      ><a name="11446" class="Symbol"
      >|</a
      ><a name="11447"
      > </a
      ><a name="11448" href="StlcProp.html#11448" class="Bound"
      >A</a
      ><a name="11449"
      > </a
      ><a name="11450" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="11451"
      > </a
      ><a name="11452" href="StlcProp.html#11452" class="Bound"
      >y&#8758;A</a
      ><a name="11455"
      > </a
      ><a name="11456" class="Keyword"
      >with</a
      ><a name="11460"
      > </a
      ><a name="11461" href="StlcProp.html#11418" class="Bound"
      >x</a
      ><a name="11462"
      > </a
      ><a name="11463" href="Stlc.html#5853" class="Function Operator"
      >&#8799;</a
      ><a name="11464"
      > </a
      ><a name="11465" href="StlcProp.html#11428" class="Bound"
      >y</a
      ><a name="11466"
      >
</a
      ><a name="11467" href="StlcProp.html#10849" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11477"
      > </a
      ><a name="11478" class="Symbol"
      >(</a
      ><a name="11479" class="InductiveConstructor"
      >abs</a
      ><a name="11482"
      > </a
      ><a name="11483" class="Symbol"
      >{</a
      ><a name="11484" class="Argument"
      >x</a
      ><a name="11485"
      > </a
      ><a name="11486" class="Symbol"
      >=</a
      ><a name="11487"
      > </a
      ><a name="11488" href="StlcProp.html#11488" class="Bound"
      >x</a
      ><a name="11489" class="Symbol"
      >}</a
      ><a name="11490"
      > </a
      ><a name="11491" href="StlcProp.html#11491" class="Bound"
      >t&#8242;&#8758;A</a
      ><a name="11495" class="Symbol"
      >)</a
      ><a name="11496"
      > </a
      ><a name="11497" class="Symbol"
      >{</a
      ><a name="11498" href="StlcProp.html#11498" class="Bound"
      >y</a
      ><a name="11499" class="Symbol"
      >}</a
      ><a name="11500"
      > </a
      ><a name="11501" class="Symbol"
      >(</a
      ><a name="11502" class="InductiveConstructor"
      >abs</a
      ><a name="11505"
      > </a
      ><a name="11506" href="StlcProp.html#11506" class="Bound"
      >x&#8800;y</a
      ><a name="11509"
      > </a
      ><a name="11510" href="StlcProp.html#11510" class="Bound"
      >y&#8712;t&#8242;</a
      ><a name="11514" class="Symbol"
      >)</a
      ><a name="11515"
      > </a
      ><a name="11516" class="Symbol"
      >|</a
      ><a name="11517"
      > </a
      ><a name="11518" href="StlcProp.html#11518" class="Bound"
      >A</a
      ><a name="11519"
      > </a
      ><a name="11520" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="11521"
      > </a
      ><a name="11522" href="StlcProp.html#11522" class="Bound"
      >y&#8758;A</a
      ><a name="11525"
      > </a
      ><a name="11526" class="Symbol"
      >|</a
      ><a name="11527"
      > </a
      ><a name="11528" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="11531"
      > </a
      ><a name="11532" href="StlcProp.html#11532" class="Bound"
      >x=y</a
      ><a name="11535"
      > </a
      ><a name="11536" class="Symbol"
      >=</a
      ><a name="11537"
      > </a
      ><a name="11538" href="StlcProp.html#11506" class="Bound"
      >x&#8800;y</a
      ><a name="11541"
      > </a
      ><a name="11542" href="StlcProp.html#11532" class="Bound"
      >x=y</a
      ><a name="11545"
      >
</a
      ><a name="11546" href="StlcProp.html#10849" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11556"
      > </a
      ><a name="11557" class="Symbol"
      >(</a
      ><a name="11558" class="InductiveConstructor"
      >abs</a
      ><a name="11561"
      > </a
      ><a name="11562" class="Symbol"
      >{</a
      ><a name="11563" class="Argument"
      >x</a
      ><a name="11564"
      > </a
      ><a name="11565" class="Symbol"
      >=</a
      ><a name="11566"
      > </a
      ><a name="11567" href="StlcProp.html#11567" class="Bound"
      >x</a
      ><a name="11568" class="Symbol"
      >}</a
      ><a name="11569"
      > </a
      ><a name="11570" href="StlcProp.html#11570" class="Bound"
      >t&#8242;&#8758;A</a
      ><a name="11574" class="Symbol"
      >)</a
      ><a name="11575"
      > </a
      ><a name="11576" class="Symbol"
      >{</a
      ><a name="11577" href="StlcProp.html#11577" class="Bound"
      >y</a
      ><a name="11578" class="Symbol"
      >}</a
      ><a name="11579"
      > </a
      ><a name="11580" class="Symbol"
      >(</a
      ><a name="11581" class="InductiveConstructor"
      >abs</a
      ><a name="11584"
      > </a
      ><a name="11585" href="StlcProp.html#11585" class="Bound"
      >x&#8800;y</a
      ><a name="11588"
      > </a
      ><a name="11589" href="StlcProp.html#11589" class="Bound"
      >y&#8712;t&#8242;</a
      ><a name="11593" class="Symbol"
      >)</a
      ><a name="11594"
      > </a
      ><a name="11595" class="Symbol"
      >|</a
      ><a name="11596"
      > </a
      ><a name="11597" href="StlcProp.html#11597" class="Bound"
      >A</a
      ><a name="11598"
      > </a
      ><a name="11599" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="11600"
      > </a
      ><a name="11601" class="Symbol"
      >()</a
      ><a name="11603"
      >  </a
      ><a name="11605" class="Symbol"
      >|</a
      ><a name="11606"
      > </a
      ><a name="11607" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="11609"
      >  </a
      ><a name="11611" class="Symbol"
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
<a name="11999" href="StlcProp.html#11999" class="Function"
      >replaceCtxt</a
      ><a name="12010"
      > </a
      ><a name="12011" class="Symbol"
      >:</a
      ><a name="12012"
      > </a
      ><a name="12013" class="Symbol"
      >&#8704;</a
      ><a name="12014"
      > </a
      ><a name="12015" class="Symbol"
      >{</a
      ><a name="12016" href="StlcProp.html#12016" class="Bound"
      >&#915;</a
      ><a name="12017"
      > </a
      ><a name="12018" href="StlcProp.html#12018" class="Bound"
      >&#915;&#8242;</a
      ><a name="12020"
      > </a
      ><a name="12021" href="StlcProp.html#12021" class="Bound"
      >t</a
      ><a name="12022"
      > </a
      ><a name="12023" href="StlcProp.html#12023" class="Bound"
      >A</a
      ><a name="12024" class="Symbol"
      >}</a
      ><a name="12025"
      >
            </a
      ><a name="12038" class="Symbol"
      >&#8594;</a
      ><a name="12039"
      > </a
      ><a name="12040" class="Symbol"
      >(&#8704;</a
      ><a name="12042"
      > </a
      ><a name="12043" class="Symbol"
      >{</a
      ><a name="12044" href="StlcProp.html#12044" class="Bound"
      >x</a
      ><a name="12045" class="Symbol"
      >}</a
      ><a name="12046"
      > </a
      ><a name="12047" class="Symbol"
      >&#8594;</a
      ><a name="12048"
      > </a
      ><a name="12049" href="StlcProp.html#12044" class="Bound"
      >x</a
      ><a name="12050"
      > </a
      ><a name="12051" href="StlcProp.html#7029" class="Datatype Operator"
      >FreeIn</a
      ><a name="12057"
      > </a
      ><a name="12058" href="StlcProp.html#12021" class="Bound"
      >t</a
      ><a name="12059"
      > </a
      ><a name="12060" class="Symbol"
      >&#8594;</a
      ><a name="12061"
      > </a
      ><a name="12062" href="StlcProp.html#12016" class="Bound"
      >&#915;</a
      ><a name="12063"
      > </a
      ><a name="12064" href="StlcProp.html#12044" class="Bound"
      >x</a
      ><a name="12065"
      > </a
      ><a name="12066" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="12067"
      > </a
      ><a name="12068" href="StlcProp.html#12018" class="Bound"
      >&#915;&#8242;</a
      ><a name="12070"
      > </a
      ><a name="12071" href="StlcProp.html#12044" class="Bound"
      >x</a
      ><a name="12072" class="Symbol"
      >)</a
      ><a name="12073"
      >
            </a
      ><a name="12086" class="Symbol"
      >&#8594;</a
      ><a name="12087"
      > </a
      ><a name="12088" href="StlcProp.html#12016" class="Bound"
      >&#915;</a
      ><a name="12089"
      >  </a
      ><a name="12091" href="Stlc.html#19629" class="Datatype Operator"
      >&#8866;</a
      ><a name="12092"
      > </a
      ><a name="12093" href="StlcProp.html#12021" class="Bound"
      >t</a
      ><a name="12094"
      > </a
      ><a name="12095" href="Stlc.html#19629" class="Datatype Operator"
      >&#8758;</a
      ><a name="12096"
      > </a
      ><a name="12097" href="StlcProp.html#12023" class="Bound"
      >A</a
      ><a name="12098"
      >
            </a
      ><a name="12111" class="Symbol"
      >&#8594;</a
      ><a name="12112"
      > </a
      ><a name="12113" href="StlcProp.html#12018" class="Bound"
      >&#915;&#8242;</a
      ><a name="12115"
      > </a
      ><a name="12116" href="Stlc.html#19629" class="Datatype Operator"
      >&#8866;</a
      ><a name="12117"
      > </a
      ><a name="12118" href="StlcProp.html#12021" class="Bound"
      >t</a
      ><a name="12119"
      > </a
      ><a name="12120" href="Stlc.html#19629" class="Datatype Operator"
      >&#8758;</a
      ><a name="12121"
      > </a
      ><a name="12122" href="StlcProp.html#12023" class="Bound"
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
    By the IH (setting $$\Gamma'' = \Gamma', y:A$$), it suffices to show
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
<a name="14427" href="StlcProp.html#11999" class="Function"
      >replaceCtxt</a
      ><a name="14438"
      > </a
      ><a name="14439" href="StlcProp.html#14439" class="Bound"
      >f</a
      ><a name="14440"
      > </a
      ><a name="14441" class="Symbol"
      >(</a
      ><a name="14442" href="Stlc.html#19673" class="InductiveConstructor"
      >var</a
      ><a name="14445"
      > </a
      ><a name="14446" href="StlcProp.html#14446" class="Bound"
      >x</a
      ><a name="14447"
      > </a
      ><a name="14448" href="StlcProp.html#14448" class="Bound"
      >x&#8758;A</a
      ><a name="14451" class="Symbol"
      >)</a
      ><a name="14452"
      > </a
      ><a name="14453" class="Keyword"
      >rewrite</a
      ><a name="14460"
      > </a
      ><a name="14461" href="StlcProp.html#14439" class="Bound"
      >f</a
      ><a name="14462"
      > </a
      ><a name="14463" href="StlcProp.html#7068" class="InductiveConstructor"
      >var</a
      ><a name="14466"
      > </a
      ><a name="14467" class="Symbol"
      >=</a
      ><a name="14468"
      > </a
      ><a name="14469" href="Stlc.html#19673" class="InductiveConstructor"
      >var</a
      ><a name="14472"
      > </a
      ><a name="14473" href="StlcProp.html#14446" class="Bound"
      >x</a
      ><a name="14474"
      > </a
      ><a name="14475" href="StlcProp.html#14448" class="Bound"
      >x&#8758;A</a
      ><a name="14478"
      >
</a
      ><a name="14479" href="StlcProp.html#11999" class="Function"
      >replaceCtxt</a
      ><a name="14490"
      > </a
      ><a name="14491" href="StlcProp.html#14491" class="Bound"
      >f</a
      ><a name="14492"
      > </a
      ><a name="14493" class="Symbol"
      >(</a
      ><a name="14494" href="Stlc.html#19882" class="InductiveConstructor"
      >app</a
      ><a name="14497"
      > </a
      ><a name="14498" href="StlcProp.html#14498" class="Bound"
      >t&#8321;&#8758;A&#8658;B</a
      ><a name="14504"
      > </a
      ><a name="14505" href="StlcProp.html#14505" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="14509" class="Symbol"
      >)</a
      ><a name="14510"
      >
  </a
      ><a name="14513" class="Symbol"
      >=</a
      ><a name="14514"
      > </a
      ><a name="14515" href="Stlc.html#19882" class="InductiveConstructor"
      >app</a
      ><a name="14518"
      > </a
      ><a name="14519" class="Symbol"
      >(</a
      ><a name="14520" href="StlcProp.html#11999" class="Function"
      >replaceCtxt</a
      ><a name="14531"
      > </a
      ><a name="14532" class="Symbol"
      >(</a
      ><a name="14533" href="StlcProp.html#14491" class="Bound"
      >f</a
      ><a name="14534"
      > </a
      ><a name="14535" href="https://agda.github.io/agda-stdlib/Function.html#713" class="Function Operator"
      >&#8728;</a
      ><a name="14536"
      > </a
      ><a name="14537" href="StlcProp.html#7153" class="InductiveConstructor"
      >app1</a
      ><a name="14541" class="Symbol"
      >)</a
      ><a name="14542"
      > </a
      ><a name="14543" href="StlcProp.html#14498" class="Bound"
      >t&#8321;&#8758;A&#8658;B</a
      ><a name="14549" class="Symbol"
      >)</a
      ><a name="14550"
      > </a
      ><a name="14551" class="Symbol"
      >(</a
      ><a name="14552" href="StlcProp.html#11999" class="Function"
      >replaceCtxt</a
      ><a name="14563"
      > </a
      ><a name="14564" class="Symbol"
      >(</a
      ><a name="14565" href="StlcProp.html#14491" class="Bound"
      >f</a
      ><a name="14566"
      > </a
      ><a name="14567" href="https://agda.github.io/agda-stdlib/Function.html#713" class="Function Operator"
      >&#8728;</a
      ><a name="14568"
      > </a
      ><a name="14569" href="StlcProp.html#7207" class="InductiveConstructor"
      >app2</a
      ><a name="14573" class="Symbol"
      >)</a
      ><a name="14574"
      > </a
      ><a name="14575" href="StlcProp.html#14505" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="14579" class="Symbol"
      >)</a
      ><a name="14580"
      >
</a
      ><a name="14581" href="StlcProp.html#11999" class="Function"
      >replaceCtxt</a
      ><a name="14592"
      > </a
      ><a name="14593" class="Symbol"
      >{</a
      ><a name="14594" href="StlcProp.html#14594" class="Bound"
      >&#915;</a
      ><a name="14595" class="Symbol"
      >}</a
      ><a name="14596"
      > </a
      ><a name="14597" class="Symbol"
      >{</a
      ><a name="14598" href="StlcProp.html#14598" class="Bound"
      >&#915;&#8242;</a
      ><a name="14600" class="Symbol"
      >}</a
      ><a name="14601"
      > </a
      ><a name="14602" href="StlcProp.html#14602" class="Bound"
      >f</a
      ><a name="14603"
      > </a
      ><a name="14604" class="Symbol"
      >(</a
      ><a name="14605" href="Stlc.html#19766" class="InductiveConstructor"
      >abs</a
      ><a name="14608"
      > </a
      ><a name="14609" class="Symbol"
      >{</a
      ><a name="14610" class="DottedPattern Symbol"
      >.</a
      ><a name="14611" href="StlcProp.html#14594" class="DottedPattern Bound"
      >&#915;</a
      ><a name="14612" class="Symbol"
      >}</a
      ><a name="14613"
      > </a
      ><a name="14614" class="Symbol"
      >{</a
      ><a name="14615" href="StlcProp.html#14615" class="Bound"
      >x</a
      ><a name="14616" class="Symbol"
      >}</a
      ><a name="14617"
      > </a
      ><a name="14618" class="Symbol"
      >{</a
      ><a name="14619" href="StlcProp.html#14619" class="Bound"
      >A</a
      ><a name="14620" class="Symbol"
      >}</a
      ><a name="14621"
      > </a
      ><a name="14622" class="Symbol"
      >{</a
      ><a name="14623" href="StlcProp.html#14623" class="Bound"
      >B</a
      ><a name="14624" class="Symbol"
      >}</a
      ><a name="14625"
      > </a
      ><a name="14626" class="Symbol"
      >{</a
      ><a name="14627" href="StlcProp.html#14627" class="Bound"
      >t&#8242;</a
      ><a name="14629" class="Symbol"
      >}</a
      ><a name="14630"
      > </a
      ><a name="14631" href="StlcProp.html#14631" class="Bound"
      >t&#8242;&#8758;B</a
      ><a name="14635" class="Symbol"
      >)</a
      ><a name="14636"
      >
  </a
      ><a name="14639" class="Symbol"
      >=</a
      ><a name="14640"
      > </a
      ><a name="14641" href="Stlc.html#19766" class="InductiveConstructor"
      >abs</a
      ><a name="14644"
      > </a
      ><a name="14645" class="Symbol"
      >(</a
      ><a name="14646" href="StlcProp.html#11999" class="Function"
      >replaceCtxt</a
      ><a name="14657"
      > </a
      ><a name="14658" href="StlcProp.html#14679" class="Function"
      >f&#8242;</a
      ><a name="14660"
      > </a
      ><a name="14661" href="StlcProp.html#14631" class="Bound"
      >t&#8242;&#8758;B</a
      ><a name="14665" class="Symbol"
      >)</a
      ><a name="14666"
      >
  </a
      ><a name="14669" class="Keyword"
      >where</a
      ><a name="14674"
      >
    </a
      ><a name="14679" href="StlcProp.html#14679" class="Function"
      >f&#8242;</a
      ><a name="14681"
      > </a
      ><a name="14682" class="Symbol"
      >:</a
      ><a name="14683"
      > </a
      ><a name="14684" class="Symbol"
      >&#8704;</a
      ><a name="14685"
      > </a
      ><a name="14686" class="Symbol"
      >{</a
      ><a name="14687" href="StlcProp.html#14687" class="Bound"
      >y</a
      ><a name="14688" class="Symbol"
      >}</a
      ><a name="14689"
      > </a
      ><a name="14690" class="Symbol"
      >&#8594;</a
      ><a name="14691"
      > </a
      ><a name="14692" href="StlcProp.html#14687" class="Bound"
      >y</a
      ><a name="14693"
      > </a
      ><a name="14694" href="StlcProp.html#7029" class="Datatype Operator"
      >FreeIn</a
      ><a name="14700"
      > </a
      ><a name="14701" href="StlcProp.html#14627" class="Bound"
      >t&#8242;</a
      ><a name="14703"
      > </a
      ><a name="14704" class="Symbol"
      >&#8594;</a
      ><a name="14705"
      > </a
      ><a name="14706" class="Symbol"
      >(</a
      ><a name="14707" href="StlcProp.html#14594" class="Bound"
      >&#915;</a
      ><a name="14708"
      > </a
      ><a name="14709" href="Stlc.html#18686" class="Function Operator"
      >,</a
      ><a name="14710"
      > </a
      ><a name="14711" href="StlcProp.html#14615" class="Bound"
      >x</a
      ><a name="14712"
      > </a
      ><a name="14713" href="Stlc.html#18686" class="Function Operator"
      >&#8758;</a
      ><a name="14714"
      > </a
      ><a name="14715" href="StlcProp.html#14619" class="Bound"
      >A</a
      ><a name="14716" class="Symbol"
      >)</a
      ><a name="14717"
      > </a
      ><a name="14718" href="StlcProp.html#14687" class="Bound"
      >y</a
      ><a name="14719"
      > </a
      ><a name="14720" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="14721"
      > </a
      ><a name="14722" class="Symbol"
      >(</a
      ><a name="14723" href="StlcProp.html#14598" class="Bound"
      >&#915;&#8242;</a
      ><a name="14725"
      > </a
      ><a name="14726" href="Stlc.html#18686" class="Function Operator"
      >,</a
      ><a name="14727"
      > </a
      ><a name="14728" href="StlcProp.html#14615" class="Bound"
      >x</a
      ><a name="14729"
      > </a
      ><a name="14730" href="Stlc.html#18686" class="Function Operator"
      >&#8758;</a
      ><a name="14731"
      > </a
      ><a name="14732" href="StlcProp.html#14619" class="Bound"
      >A</a
      ><a name="14733" class="Symbol"
      >)</a
      ><a name="14734"
      > </a
      ><a name="14735" href="StlcProp.html#14687" class="Bound"
      >y</a
      ><a name="14736"
      >
    </a
      ><a name="14741" href="StlcProp.html#14679" class="Function"
      >f&#8242;</a
      ><a name="14743"
      > </a
      ><a name="14744" class="Symbol"
      >{</a
      ><a name="14745" href="StlcProp.html#14745" class="Bound"
      >y</a
      ><a name="14746" class="Symbol"
      >}</a
      ><a name="14747"
      > </a
      ><a name="14748" href="StlcProp.html#14748" class="Bound"
      >y&#8712;t&#8242;</a
      ><a name="14752"
      > </a
      ><a name="14753" class="Keyword"
      >with</a
      ><a name="14757"
      > </a
      ><a name="14758" href="StlcProp.html#14615" class="Bound"
      >x</a
      ><a name="14759"
      > </a
      ><a name="14760" href="Stlc.html#5853" class="Function Operator"
      >&#8799;</a
      ><a name="14761"
      > </a
      ><a name="14762" href="StlcProp.html#14745" class="Bound"
      >y</a
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
      ><a name="14774" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="14777"
      > </a
      ><a name="14778" class="Symbol"
      >_</a
      ><a name="14779"
      >   </a
      ><a name="14782" class="Symbol"
      >=</a
      ><a name="14783"
      > </a
      ><a name="14784" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="14788"
      >
    </a
      ><a name="14793" class="Symbol"
      >...</a
      ><a name="14796"
      > </a
      ><a name="14797" class="Symbol"
      >|</a
      ><a name="14798"
      > </a
      ><a name="14799" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="14801"
      >  </a
      ><a name="14803" href="StlcProp.html#14803" class="Bound"
      >x&#8800;y</a
      ><a name="14806"
      > </a
      ><a name="14807" class="Symbol"
      >=</a
      ><a name="14808"
      > </a
      ><a name="14809" href="StlcProp.html#14602" class="Bound"
      >f</a
      ><a name="14810"
      > </a
      ><a name="14811" class="Symbol"
      >(</a
      ><a name="14812" href="StlcProp.html#7092" class="InductiveConstructor"
      >abs</a
      ><a name="14815"
      > </a
      ><a name="14816" href="StlcProp.html#14803" class="Bound"
      >x&#8800;y</a
      ><a name="14819"
      > </a
      ><a name="14820" href="StlcProp.html#14748" class="Bound"
      >y&#8712;t&#8242;</a
      ><a name="14824" class="Symbol"
      >)</a
      ><a name="14825"
      >
</a
      ><a name="14826" href="StlcProp.html#11999" class="Function"
      >replaceCtxt</a
      ><a name="14837"
      > </a
      ><a name="14838" class="Symbol"
      >_</a
      ><a name="14839"
      > </a
      ><a name="14840" href="Stlc.html#20016" class="InductiveConstructor"
      >true</a
      ><a name="14844"
      >  </a
      ><a name="14846" class="Symbol"
      >=</a
      ><a name="14847"
      > </a
      ><a name="14848" href="Stlc.html#20016" class="InductiveConstructor"
      >true</a
      ><a name="14852"
      >
</a
      ><a name="14853" href="StlcProp.html#11999" class="Function"
      >replaceCtxt</a
      ><a name="14864"
      > </a
      ><a name="14865" class="Symbol"
      >_</a
      ><a name="14866"
      > </a
      ><a name="14867" href="Stlc.html#20075" class="InductiveConstructor"
      >false</a
      ><a name="14872"
      > </a
      ><a name="14873" class="Symbol"
      >=</a
      ><a name="14874"
      > </a
      ><a name="14875" href="Stlc.html#20075" class="InductiveConstructor"
      >false</a
      ><a name="14880"
      >
</a
      ><a name="14881" href="StlcProp.html#11999" class="Function"
      >replaceCtxt</a
      ><a name="14892"
      > </a
      ><a name="14893" href="StlcProp.html#14893" class="Bound"
      >f</a
      ><a name="14894"
      > </a
      ><a name="14895" class="Symbol"
      >(</a
      ><a name="14896" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >if</a
      ><a name="14898"
      > </a
      ><a name="14899" href="StlcProp.html#14899" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="14906"
      > </a
      ><a name="14907" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >then</a
      ><a name="14911"
      > </a
      ><a name="14912" href="StlcProp.html#14912" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="14916"
      > </a
      ><a name="14917" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >else</a
      ><a name="14921"
      > </a
      ><a name="14922" href="StlcProp.html#14922" class="Bound"
      >t&#8323;&#8758;A</a
      ><a name="14926" class="Symbol"
      >)</a
      ><a name="14927"
      >
  </a
      ><a name="14930" class="Symbol"
      >=</a
      ><a name="14931"
      > </a
      ><a name="14932" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >if</a
      ><a name="14934"
      >   </a
      ><a name="14937" href="StlcProp.html#11999" class="Function"
      >replaceCtxt</a
      ><a name="14948"
      > </a
      ><a name="14949" class="Symbol"
      >(</a
      ><a name="14950" href="StlcProp.html#14893" class="Bound"
      >f</a
      ><a name="14951"
      > </a
      ><a name="14952" href="https://agda.github.io/agda-stdlib/Function.html#713" class="Function Operator"
      >&#8728;</a
      ><a name="14953"
      > </a
      ><a name="14954" href="StlcProp.html#7261" class="InductiveConstructor"
      >if1</a
      ><a name="14957" class="Symbol"
      >)</a
      ><a name="14958"
      > </a
      ><a name="14959" href="StlcProp.html#14899" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="14966"
      >
    </a
      ><a name="14971" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >then</a
      ><a name="14975"
      > </a
      ><a name="14976" href="StlcProp.html#11999" class="Function"
      >replaceCtxt</a
      ><a name="14987"
      > </a
      ><a name="14988" class="Symbol"
      >(</a
      ><a name="14989" href="StlcProp.html#14893" class="Bound"
      >f</a
      ><a name="14990"
      > </a
      ><a name="14991" href="https://agda.github.io/agda-stdlib/Function.html#713" class="Function Operator"
      >&#8728;</a
      ><a name="14992"
      > </a
      ><a name="14993" href="StlcProp.html#7332" class="InductiveConstructor"
      >if2</a
      ><a name="14996" class="Symbol"
      >)</a
      ><a name="14997"
      > </a
      ><a name="14998" href="StlcProp.html#14912" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="15002"
      >
    </a
      ><a name="15007" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >else</a
      ><a name="15011"
      > </a
      ><a name="15012" href="StlcProp.html#11999" class="Function"
      >replaceCtxt</a
      ><a name="15023"
      > </a
      ><a name="15024" class="Symbol"
      >(</a
      ><a name="15025" href="StlcProp.html#14893" class="Bound"
      >f</a
      ><a name="15026"
      > </a
      ><a name="15027" href="https://agda.github.io/agda-stdlib/Function.html#713" class="Function Operator"
      >&#8728;</a
      ><a name="15028"
      > </a
      ><a name="15029" href="StlcProp.html#7403" class="InductiveConstructor"
      >if3</a
      ><a name="15032" class="Symbol"
      >)</a
      ><a name="15033"
      > </a
      ><a name="15034" href="StlcProp.html#14922" class="Bound"
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
<a name="15849" href="StlcProp.html#15849" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="15865"
      > </a
      ><a name="15866" class="Symbol"
      >:</a
      ><a name="15867"
      > </a
      ><a name="15868" class="Symbol"
      >&#8704;</a
      ><a name="15869"
      > </a
      ><a name="15870" class="Symbol"
      >{</a
      ><a name="15871" href="StlcProp.html#15871" class="Bound"
      >&#915;</a
      ><a name="15872"
      > </a
      ><a name="15873" href="StlcProp.html#15873" class="Bound"
      >x</a
      ><a name="15874"
      > </a
      ><a name="15875" href="StlcProp.html#15875" class="Bound"
      >A</a
      ><a name="15876"
      > </a
      ><a name="15877" href="StlcProp.html#15877" class="Bound"
      >t</a
      ><a name="15878"
      > </a
      ><a name="15879" href="StlcProp.html#15879" class="Bound"
      >v</a
      ><a name="15880"
      > </a
      ><a name="15881" href="StlcProp.html#15881" class="Bound"
      >B</a
      ><a name="15882" class="Symbol"
      >}</a
      ><a name="15883"
      >
                 </a
      ><a name="15901" class="Symbol"
      >&#8594;</a
      ><a name="15902"
      > </a
      ><a name="15903" href="Stlc.html#18658" class="Function"
      >&#8709;</a
      ><a name="15904"
      > </a
      ><a name="15905" href="Stlc.html#19629" class="Datatype Operator"
      >&#8866;</a
      ><a name="15906"
      > </a
      ><a name="15907" href="StlcProp.html#15879" class="Bound"
      >v</a
      ><a name="15908"
      > </a
      ><a name="15909" href="Stlc.html#19629" class="Datatype Operator"
      >&#8758;</a
      ><a name="15910"
      > </a
      ><a name="15911" href="StlcProp.html#15875" class="Bound"
      >A</a
      ><a name="15912"
      >
                 </a
      ><a name="15930" class="Symbol"
      >&#8594;</a
      ><a name="15931"
      > </a
      ><a name="15932" href="StlcProp.html#15871" class="Bound"
      >&#915;</a
      ><a name="15933"
      > </a
      ><a name="15934" href="Stlc.html#18686" class="Function Operator"
      >,</a
      ><a name="15935"
      > </a
      ><a name="15936" href="StlcProp.html#15873" class="Bound"
      >x</a
      ><a name="15937"
      > </a
      ><a name="15938" href="Stlc.html#18686" class="Function Operator"
      >&#8758;</a
      ><a name="15939"
      > </a
      ><a name="15940" href="StlcProp.html#15875" class="Bound"
      >A</a
      ><a name="15941"
      > </a
      ><a name="15942" href="Stlc.html#19629" class="Datatype Operator"
      >&#8866;</a
      ><a name="15943"
      > </a
      ><a name="15944" href="StlcProp.html#15877" class="Bound"
      >t</a
      ><a name="15945"
      > </a
      ><a name="15946" href="Stlc.html#19629" class="Datatype Operator"
      >&#8758;</a
      ><a name="15947"
      > </a
      ><a name="15948" href="StlcProp.html#15881" class="Bound"
      >B</a
      ><a name="15949"
      >
                 </a
      ><a name="15967" class="Symbol"
      >&#8594;</a
      ><a name="15968"
      > </a
      ><a name="15969" href="StlcProp.html#15871" class="Bound"
      >&#915;</a
      ><a name="15970"
      > </a
      ><a name="15971" href="Stlc.html#18686" class="Function Operator"
      >,</a
      ><a name="15972"
      > </a
      ><a name="15973" href="StlcProp.html#15873" class="Bound"
      >x</a
      ><a name="15974"
      > </a
      ><a name="15975" href="Stlc.html#18686" class="Function Operator"
      >&#8758;</a
      ><a name="15976"
      > </a
      ><a name="15977" href="StlcProp.html#15875" class="Bound"
      >A</a
      ><a name="15978"
      > </a
      ><a name="15979" href="Stlc.html#19629" class="Datatype Operator"
      >&#8866;</a
      ><a name="15980"
      > </a
      ><a name="15981" href="Stlc.html#12659" class="Function Operator"
      >[</a
      ><a name="15982"
      > </a
      ><a name="15983" href="StlcProp.html#15873" class="Bound"
      >x</a
      ><a name="15984"
      > </a
      ><a name="15985" href="Stlc.html#12659" class="Function Operator"
      >:=</a
      ><a name="15987"
      > </a
      ><a name="15988" href="StlcProp.html#15879" class="Bound"
      >v</a
      ><a name="15989"
      > </a
      ><a name="15990" href="Stlc.html#12659" class="Function Operator"
      >]</a
      ><a name="15991"
      > </a
      ><a name="15992" href="StlcProp.html#15877" class="Bound"
      >t</a
      ><a name="15993"
      > </a
      ><a name="15994" href="Stlc.html#19629" class="Datatype Operator"
      >&#8758;</a
      ><a name="15995"
      > </a
      ><a name="15996" href="StlcProp.html#15881" class="Bound"
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
<a name="19907" href="StlcProp.html#15849" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="19923"
      > </a
      ><a name="19924" class="Symbol"
      >{</a
      ><a name="19925" href="StlcProp.html#19925" class="Bound"
      >&#915;</a
      ><a name="19926" class="Symbol"
      >}</a
      ><a name="19927"
      > </a
      ><a name="19928" class="Symbol"
      >{</a
      ><a name="19929" href="StlcProp.html#19929" class="Bound"
      >x</a
      ><a name="19930" class="Symbol"
      >}</a
      ><a name="19931"
      > </a
      ><a name="19932" href="StlcProp.html#19932" class="Bound"
      >v&#8758;A</a
      ><a name="19935"
      > </a
      ><a name="19936" class="Symbol"
      >(</a
      ><a name="19937" href="Stlc.html#19673" class="InductiveConstructor"
      >var</a
      ><a name="19940"
      > </a
      ><a name="19941" href="StlcProp.html#19941" class="Bound"
      >y</a
      ><a name="19942"
      > </a
      ><a name="19943" href="StlcProp.html#19943" class="Bound"
      >y&#8712;&#915;</a
      ><a name="19946" class="Symbol"
      >)</a
      ><a name="19947"
      > </a
      ><a name="19948" class="Keyword"
      >with</a
      ><a name="19952"
      > </a
      ><a name="19953" href="StlcProp.html#19929" class="Bound"
      >x</a
      ><a name="19954"
      > </a
      ><a name="19955" href="Stlc.html#5853" class="Function Operator"
      >&#8799;</a
      ><a name="19956"
      > </a
      ><a name="19957" href="StlcProp.html#19941" class="Bound"
      >y</a
      ><a name="19958"
      >
</a
      ><a name="19959" class="Symbol"
      >...</a
      ><a name="19962"
      > </a
      ><a name="19963" class="Symbol"
      >|</a
      ><a name="19964"
      > </a
      ><a name="19965" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="19968"
      > </a
      ><a name="19969" href="StlcProp.html#19969" class="Bound"
      >x=y</a
      ><a name="19972"
      > </a
      ><a name="19973" class="Symbol"
      >=</a
      ><a name="19974"
      > </a
      ><a name="19975" class="Symbol"
      >{!!}</a
      ><a name="19979"
      >
</a
      ><a name="19980" class="Symbol"
      >...</a
      ><a name="19983"
      > </a
      ><a name="19984" class="Symbol"
      >|</a
      ><a name="19985"
      > </a
      ><a name="19986" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="19988"
      >  </a
      ><a name="19990" href="StlcProp.html#19990" class="Bound"
      >x&#8800;y</a
      ><a name="19993"
      > </a
      ><a name="19994" class="Symbol"
      >=</a
      ><a name="19995"
      > </a
      ><a name="19996" class="Symbol"
      >{!!}</a
      ><a name="20000"
      >
</a
      ><a name="20001" href="StlcProp.html#15849" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="20017"
      > </a
      ><a name="20018" href="StlcProp.html#20018" class="Bound"
      >v&#8758;A</a
      ><a name="20021"
      > </a
      ><a name="20022" class="Symbol"
      >(</a
      ><a name="20023" href="Stlc.html#19766" class="InductiveConstructor"
      >abs</a
      ><a name="20026"
      > </a
      ><a name="20027" href="StlcProp.html#20027" class="Bound"
      >t&#8242;&#8758;B</a
      ><a name="20031" class="Symbol"
      >)</a
      ><a name="20032"
      > </a
      ><a name="20033" class="Symbol"
      >=</a
      ><a name="20034"
      > </a
      ><a name="20035" class="Symbol"
      >{!!}</a
      ><a name="20039"
      >
</a
      ><a name="20040" href="StlcProp.html#15849" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="20056"
      > </a
      ><a name="20057" href="StlcProp.html#20057" class="Bound"
      >v&#8758;A</a
      ><a name="20060"
      > </a
      ><a name="20061" class="Symbol"
      >(</a
      ><a name="20062" href="Stlc.html#19882" class="InductiveConstructor"
      >app</a
      ><a name="20065"
      > </a
      ><a name="20066" href="StlcProp.html#20066" class="Bound"
      >t&#8321;&#8758;A&#8658;B</a
      ><a name="20072"
      > </a
      ><a name="20073" href="StlcProp.html#20073" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="20077" class="Symbol"
      >)</a
      ><a name="20078"
      > </a
      ><a name="20079" class="Symbol"
      >=</a
      ><a name="20080"
      >
  </a
      ><a name="20083" href="Stlc.html#19882" class="InductiveConstructor"
      >app</a
      ><a name="20086"
      > </a
      ><a name="20087" class="Symbol"
      >(</a
      ><a name="20088" href="StlcProp.html#15849" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="20104"
      > </a
      ><a name="20105" href="StlcProp.html#20057" class="Bound"
      >v&#8758;A</a
      ><a name="20108"
      > </a
      ><a name="20109" href="StlcProp.html#20066" class="Bound"
      >t&#8321;&#8758;A&#8658;B</a
      ><a name="20115" class="Symbol"
      >)</a
      ><a name="20116"
      > </a
      ><a name="20117" class="Symbol"
      >(</a
      ><a name="20118" href="StlcProp.html#15849" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="20134"
      > </a
      ><a name="20135" href="StlcProp.html#20057" class="Bound"
      >v&#8758;A</a
      ><a name="20138"
      > </a
      ><a name="20139" href="StlcProp.html#20073" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="20143" class="Symbol"
      >)</a
      ><a name="20144"
      >
</a
      ><a name="20145" href="StlcProp.html#15849" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="20161"
      > </a
      ><a name="20162" href="StlcProp.html#20162" class="Bound"
      >v&#8758;A</a
      ><a name="20165"
      > </a
      ><a name="20166" href="Stlc.html#20016" class="InductiveConstructor"
      >true</a
      ><a name="20170"
      >  </a
      ><a name="20172" class="Symbol"
      >=</a
      ><a name="20173"
      > </a
      ><a name="20174" href="Stlc.html#20016" class="InductiveConstructor"
      >true</a
      ><a name="20178"
      >
</a
      ><a name="20179" href="StlcProp.html#15849" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="20195"
      > </a
      ><a name="20196" href="StlcProp.html#20196" class="Bound"
      >v&#8758;A</a
      ><a name="20199"
      > </a
      ><a name="20200" href="Stlc.html#20075" class="InductiveConstructor"
      >false</a
      ><a name="20205"
      > </a
      ><a name="20206" class="Symbol"
      >=</a
      ><a name="20207"
      > </a
      ><a name="20208" href="Stlc.html#20075" class="InductiveConstructor"
      >false</a
      ><a name="20213"
      >
</a
      ><a name="20214" href="StlcProp.html#15849" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="20230"
      > </a
      ><a name="20231" href="StlcProp.html#20231" class="Bound"
      >v&#8758;A</a
      ><a name="20234"
      > </a
      ><a name="20235" class="Symbol"
      >(</a
      ><a name="20236" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >if</a
      ><a name="20238"
      > </a
      ><a name="20239" href="StlcProp.html#20239" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="20246"
      > </a
      ><a name="20247" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >then</a
      ><a name="20251"
      > </a
      ><a name="20252" href="StlcProp.html#20252" class="Bound"
      >t&#8322;&#8758;B</a
      ><a name="20256"
      > </a
      ><a name="20257" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >else</a
      ><a name="20261"
      > </a
      ><a name="20262" href="StlcProp.html#20262" class="Bound"
      >t&#8323;&#8758;B</a
      ><a name="20266" class="Symbol"
      >)</a
      ><a name="20267"
      > </a
      ><a name="20268" class="Symbol"
      >=</a
      ><a name="20269"
      >
  </a
      ><a name="20272" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >if</a
      ><a name="20274"
      >   </a
      ><a name="20277" href="StlcProp.html#15849" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="20293"
      > </a
      ><a name="20294" href="StlcProp.html#20231" class="Bound"
      >v&#8758;A</a
      ><a name="20297"
      > </a
      ><a name="20298" href="StlcProp.html#20239" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="20305"
      >
  </a
      ><a name="20308" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >then</a
      ><a name="20312"
      > </a
      ><a name="20313" href="StlcProp.html#15849" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="20329"
      > </a
      ><a name="20330" href="StlcProp.html#20231" class="Bound"
      >v&#8758;A</a
      ><a name="20333"
      > </a
      ><a name="20334" href="StlcProp.html#20252" class="Bound"
      >t&#8322;&#8758;B</a
      ><a name="20338"
      >
  </a
      ><a name="20341" href="Stlc.html#20134" class="InductiveConstructor Operator"
      >else</a
      ><a name="20345"
      > </a
      ><a name="20346" href="StlcProp.html#15849" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="20362"
      > </a
      ><a name="20363" href="StlcProp.html#20231" class="Bound"
      >v&#8758;A</a
      ><a name="20366"
      > </a
      ><a name="20367" href="StlcProp.html#20262" class="Bound"
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
