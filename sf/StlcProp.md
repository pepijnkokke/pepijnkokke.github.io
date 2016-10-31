---
title         : "StlcProp: Properties of STLC"
layout        : default
hide-implicit : false
extra-script  : agda-extra-script.html
extra-style   : agda-extra-style.html
---

<pre class="Agda">{% raw %}
<a name="193" class="Keyword"
      >module</a
      ><a name="199"
      > </a
      ><a name="200" href="StlcProp.html#1" class="Module"
      >StlcProp</a
      ><a name="208"
      > </a
      ><a name="209" class="Keyword"
      >where</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="261" class="Keyword"
      >open</a
      ><a name="265"
      > </a
      ><a name="266" class="Keyword"
      >import</a
      ><a name="272"
      > </a
      ><a name="273" href="https://agda.github.io/agda-stdlib/Function.html#1" class="Module"
      >Function</a
      ><a name="281"
      > </a
      ><a name="282" class="Keyword"
      >using</a
      ><a name="287"
      > </a
      ><a name="288" class="Symbol"
      >(</a
      ><a name="289" href="https://agda.github.io/agda-stdlib/Function.html#713" class="Function Operator"
      >_&#8728;_</a
      ><a name="292" class="Symbol"
      >)</a
      ><a name="293"
      >
</a
      ><a name="294" class="Keyword"
      >open</a
      ><a name="298"
      > </a
      ><a name="299" class="Keyword"
      >import</a
      ><a name="305"
      > </a
      ><a name="306" href="https://agda.github.io/agda-stdlib/Data.Empty.html#1" class="Module"
      >Data.Empty</a
      ><a name="316"
      > </a
      ><a name="317" class="Keyword"
      >using</a
      ><a name="322"
      > </a
      ><a name="323" class="Symbol"
      >(</a
      ><a name="324" href="https://agda.github.io/agda-stdlib/Data.Empty.html#243" class="Datatype"
      >&#8869;</a
      ><a name="325" class="Symbol"
      >;</a
      ><a name="326"
      > </a
      ><a name="327" href="https://agda.github.io/agda-stdlib/Data.Empty.html#348" class="Function"
      >&#8869;-elim</a
      ><a name="333" class="Symbol"
      >)</a
      ><a name="334"
      >
</a
      ><a name="335" class="Keyword"
      >open</a
      ><a name="339"
      > </a
      ><a name="340" class="Keyword"
      >import</a
      ><a name="346"
      > </a
      ><a name="347" href="https://agda.github.io/agda-stdlib/Data.Maybe.html#1" class="Module"
      >Data.Maybe</a
      ><a name="357"
      > </a
      ><a name="358" class="Keyword"
      >using</a
      ><a name="363"
      > </a
      ><a name="364" class="Symbol"
      >(</a
      ><a name="365" href="https://agda.github.io/agda-stdlib/Data.Maybe.Base.html#335" class="Datatype"
      >Maybe</a
      ><a name="370" class="Symbol"
      >;</a
      ><a name="371"
      > </a
      ><a name="372" href="https://agda.github.io/agda-stdlib/Data.Maybe.html#1527" class="InductiveConstructor"
      >just</a
      ><a name="376" class="Symbol"
      >;</a
      ><a name="377"
      > </a
      ><a name="378" href="https://agda.github.io/agda-stdlib/Data.Maybe.html#1588" class="InductiveConstructor"
      >nothing</a
      ><a name="385" class="Symbol"
      >)</a
      ><a name="386"
      >
</a
      ><a name="387" class="Keyword"
      >open</a
      ><a name="391"
      > </a
      ><a name="392" class="Keyword"
      >import</a
      ><a name="398"
      > </a
      ><a name="399" href="https://agda.github.io/agda-stdlib/Data.Product.html#1" class="Module"
      >Data.Product</a
      ><a name="411"
      > </a
      ><a name="412" class="Keyword"
      >using</a
      ><a name="417"
      > </a
      ><a name="418" class="Symbol"
      >(</a
      ><a name="419" href="https://agda.github.io/agda-stdlib/Data.Product.html#823" class="Function"
      >&#8707;</a
      ><a name="420" class="Symbol"
      >;</a
      ><a name="421"
      > </a
      ><a name="422" href="https://agda.github.io/agda-stdlib/Data.Product.html#949" class="Function"
      >&#8707;&#8322;</a
      ><a name="424" class="Symbol"
      >;</a
      ><a name="425"
      > </a
      ><a name="426" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >_,_</a
      ><a name="429" class="Symbol"
      >;</a
      ><a name="430"
      > </a
      ><a name="431" href="https://agda.github.io/agda-stdlib/Data.Product.html#1621" class="Function Operator"
      >,_</a
      ><a name="433" class="Symbol"
      >)</a
      ><a name="434"
      >
</a
      ><a name="435" class="Keyword"
      >open</a
      ><a name="439"
      > </a
      ><a name="440" class="Keyword"
      >import</a
      ><a name="446"
      > </a
      ><a name="447" href="https://agda.github.io/agda-stdlib/Data.Sum.html#1" class="Module"
      >Data.Sum</a
      ><a name="455"
      > </a
      ><a name="456" class="Keyword"
      >using</a
      ><a name="461"
      > </a
      ><a name="462" class="Symbol"
      >(</a
      ><a name="463" href="https://agda.github.io/agda-stdlib/Data.Sum.html#433" class="Datatype Operator"
      >_&#8846;_</a
      ><a name="466" class="Symbol"
      >;</a
      ><a name="467"
      > </a
      ><a name="468" href="https://agda.github.io/agda-stdlib/Data.Sum.html#489" class="InductiveConstructor"
      >inj&#8321;</a
      ><a name="472" class="Symbol"
      >;</a
      ><a name="473"
      > </a
      ><a name="474" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="478" class="Symbol"
      >)</a
      ><a name="479"
      >
</a
      ><a name="480" class="Keyword"
      >open</a
      ><a name="484"
      > </a
      ><a name="485" class="Keyword"
      >import</a
      ><a name="491"
      > </a
      ><a name="492" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#1" class="Module"
      >Relation.Nullary</a
      ><a name="508"
      > </a
      ><a name="509" class="Keyword"
      >using</a
      ><a name="514"
      > </a
      ><a name="515" class="Symbol"
      >(</a
      ><a name="516" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#414" class="Function Operator"
      >&#172;_</a
      ><a name="518" class="Symbol"
      >;</a
      ><a name="519"
      > </a
      ><a name="520" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#484" class="Datatype"
      >Dec</a
      ><a name="523" class="Symbol"
      >;</a
      ><a name="524"
      > </a
      ><a name="525" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="528" class="Symbol"
      >;</a
      ><a name="529"
      > </a
      ><a name="530" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="532" class="Symbol"
      >)</a
      ><a name="533"
      >
</a
      ><a name="534" class="Keyword"
      >open</a
      ><a name="538"
      > </a
      ><a name="539" class="Keyword"
      >import</a
      ><a name="545"
      > </a
      ><a name="546" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.html#1" class="Module"
      >Relation.Binary.PropositionalEquality</a
      ><a name="583"
      > </a
      ><a name="584" class="Keyword"
      >using</a
      ><a name="589"
      > </a
      ><a name="590" class="Symbol"
      >(</a
      ><a name="591" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >_&#8801;_</a
      ><a name="594" class="Symbol"
      >;</a
      ><a name="595"
      > </a
      ><a name="596" href="https://agda.github.io/agda-stdlib/Relation.Binary.Core.html#4493" class="Function Operator"
      >_&#8802;_</a
      ><a name="599" class="Symbol"
      >;</a
      ><a name="600"
      > </a
      ><a name="601" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="605" class="Symbol"
      >)</a
      ><a name="606"
      >
</a
      ><a name="607" class="Keyword"
      >open</a
      ><a name="611"
      > </a
      ><a name="612" class="Keyword"
      >import</a
      ><a name="618"
      > </a
      ><a name="619" href="Stlc.html#1" class="Module"
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
<a name="1205" href="StlcProp.html#1205" class="Function"
      >CanonicalForms</a
      ><a name="1219"
      > </a
      ><a name="1220" class="Symbol"
      >:</a
      ><a name="1221"
      > </a
      ><a name="1222" href="Stlc.html#6082" class="Datatype"
      >Term</a
      ><a name="1226"
      > </a
      ><a name="1227" class="Symbol"
      >&#8594;</a
      ><a name="1228"
      > </a
      ><a name="1229" href="Stlc.html#5579" class="Datatype"
      >Type</a
      ><a name="1233"
      > </a
      ><a name="1234" class="Symbol"
      >&#8594;</a
      ><a name="1235"
      > </a
      ><a name="1236" class="PrimitiveType"
      >Set</a
      ><a name="1239"
      >
</a
      ><a name="1240" href="StlcProp.html#1205" class="Function"
      >CanonicalForms</a
      ><a name="1254"
      > </a
      ><a name="1255" href="StlcProp.html#1255" class="Bound"
      >t</a
      ><a name="1256"
      > </a
      ><a name="1257" href="Stlc.html#5598" class="InductiveConstructor"
      >bool</a
      ><a name="1261"
      >    </a
      ><a name="1265" class="Symbol"
      >=</a
      ><a name="1266"
      > </a
      ><a name="1267" href="StlcProp.html#1255" class="Bound"
      >t</a
      ><a name="1268"
      > </a
      ><a name="1269" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="1270"
      > </a
      ><a name="1271" href="Stlc.html#6184" class="InductiveConstructor"
      >true</a
      ><a name="1275"
      > </a
      ><a name="1276" href="https://agda.github.io/agda-stdlib/Data.Sum.html#433" class="Datatype Operator"
      >&#8846;</a
      ><a name="1277"
      > </a
      ><a name="1278" href="StlcProp.html#1255" class="Bound"
      >t</a
      ><a name="1279"
      > </a
      ><a name="1280" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="1281"
      > </a
      ><a name="1282" href="Stlc.html#6199" class="InductiveConstructor"
      >false</a
      ><a name="1287"
      >
</a
      ><a name="1288" href="StlcProp.html#1205" class="Function"
      >CanonicalForms</a
      ><a name="1302"
      > </a
      ><a name="1303" href="StlcProp.html#1303" class="Bound"
      >t</a
      ><a name="1304"
      > </a
      ><a name="1305" class="Symbol"
      >(</a
      ><a name="1306" href="StlcProp.html#1306" class="Bound"
      >A</a
      ><a name="1307"
      > </a
      ><a name="1308" href="Stlc.html#5612" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="1309"
      > </a
      ><a name="1310" href="StlcProp.html#1310" class="Bound"
      >B</a
      ><a name="1311" class="Symbol"
      >)</a
      ><a name="1312"
      > </a
      ><a name="1313" class="Symbol"
      >=</a
      ><a name="1314"
      > </a
      ><a name="1315" href="https://agda.github.io/agda-stdlib/Data.Product.html#949" class="Function"
      >&#8707;&#8322;</a
      ><a name="1317"
      > </a
      ><a name="1318" class="Symbol"
      >&#955;</a
      ><a name="1319"
      > </a
      ><a name="1320" href="StlcProp.html#1320" class="Bound"
      >x</a
      ><a name="1321"
      > </a
      ><a name="1322" href="StlcProp.html#1322" class="Bound"
      >t&#8242;</a
      ><a name="1324"
      > </a
      ><a name="1325" class="Symbol"
      >&#8594;</a
      ><a name="1326"
      > </a
      ><a name="1327" href="StlcProp.html#1303" class="Bound"
      >t</a
      ><a name="1328"
      > </a
      ><a name="1329" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="1330"
      > </a
      ><a name="1331" href="Stlc.html#6150" class="InductiveConstructor"
      >abs</a
      ><a name="1334"
      > </a
      ><a name="1335" href="StlcProp.html#1320" class="Bound"
      >x</a
      ><a name="1336"
      > </a
      ><a name="1337" href="StlcProp.html#1306" class="Bound"
      >A</a
      ><a name="1338"
      > </a
      ><a name="1339" href="StlcProp.html#1322" class="Bound"
      >t&#8242;</a
      ><a name="1341"
      >

</a
      ><a name="1343" href="StlcProp.html#1343" class="Function"
      >canonicalForms</a
      ><a name="1357"
      > </a
      ><a name="1358" class="Symbol"
      >:</a
      ><a name="1359"
      > </a
      ><a name="1360" class="Symbol"
      >&#8704;</a
      ><a name="1361"
      > </a
      ><a name="1362" class="Symbol"
      >{</a
      ><a name="1363" href="StlcProp.html#1363" class="Bound"
      >t</a
      ><a name="1364"
      > </a
      ><a name="1365" href="StlcProp.html#1365" class="Bound"
      >A</a
      ><a name="1366" class="Symbol"
      >}</a
      ><a name="1367"
      > </a
      ><a name="1368" class="Symbol"
      >&#8594;</a
      ><a name="1369"
      > </a
      ><a name="1370" href="Stlc.html#18626" class="Function"
      >&#8709;</a
      ><a name="1371"
      > </a
      ><a name="1372" href="Stlc.html#19597" class="Datatype Operator"
      >&#8866;</a
      ><a name="1373"
      > </a
      ><a name="1374" href="StlcProp.html#1363" class="Bound"
      >t</a
      ><a name="1375"
      > </a
      ><a name="1376" href="Stlc.html#19597" class="Datatype Operator"
      >&#8758;</a
      ><a name="1377"
      > </a
      ><a name="1378" href="StlcProp.html#1365" class="Bound"
      >A</a
      ><a name="1379"
      > </a
      ><a name="1380" class="Symbol"
      >&#8594;</a
      ><a name="1381"
      > </a
      ><a name="1382" href="Stlc.html#9407" class="Datatype"
      >Value</a
      ><a name="1387"
      > </a
      ><a name="1388" href="StlcProp.html#1363" class="Bound"
      >t</a
      ><a name="1389"
      > </a
      ><a name="1390" class="Symbol"
      >&#8594;</a
      ><a name="1391"
      > </a
      ><a name="1392" href="StlcProp.html#1205" class="Function"
      >CanonicalForms</a
      ><a name="1406"
      > </a
      ><a name="1407" href="StlcProp.html#1363" class="Bound"
      >t</a
      ><a name="1408"
      > </a
      ><a name="1409" href="StlcProp.html#1365" class="Bound"
      >A</a
      ><a name="1410"
      >
</a
      ><a name="1411" href="StlcProp.html#1343" class="Function"
      >canonicalForms</a
      ><a name="1425"
      > </a
      ><a name="1426" class="Symbol"
      >(</a
      ><a name="1427" href="Stlc.html#19734" class="InductiveConstructor"
      >abs</a
      ><a name="1430"
      > </a
      ><a name="1431" href="StlcProp.html#1431" class="Bound"
      >t&#8242;</a
      ><a name="1433" class="Symbol"
      >)</a
      ><a name="1434"
      > </a
      ><a name="1435" href="Stlc.html#9434" class="InductiveConstructor"
      >abs</a
      ><a name="1438"
      >   </a
      ><a name="1441" class="Symbol"
      >=</a
      ><a name="1442"
      > </a
      ><a name="1443" class="Symbol"
      >_</a
      ><a name="1444"
      > </a
      ><a name="1445" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="1446"
      > </a
      ><a name="1447" class="Symbol"
      >_</a
      ><a name="1448"
      > </a
      ><a name="1449" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="1450"
      > </a
      ><a name="1451" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="1455"
      >
</a
      ><a name="1456" href="StlcProp.html#1343" class="Function"
      >canonicalForms</a
      ><a name="1470"
      > </a
      ><a name="1471" href="Stlc.html#19984" class="InductiveConstructor"
      >true</a
      ><a name="1475"
      >     </a
      ><a name="1480" href="Stlc.html#9482" class="InductiveConstructor"
      >true</a
      ><a name="1484"
      >  </a
      ><a name="1486" class="Symbol"
      >=</a
      ><a name="1487"
      > </a
      ><a name="1488" href="https://agda.github.io/agda-stdlib/Data.Sum.html#489" class="InductiveConstructor"
      >inj&#8321;</a
      ><a name="1492"
      > </a
      ><a name="1493" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="1497"
      >
</a
      ><a name="1498" href="StlcProp.html#1343" class="Function"
      >canonicalForms</a
      ><a name="1512"
      > </a
      ><a name="1513" href="Stlc.html#20043" class="InductiveConstructor"
      >false</a
      ><a name="1518"
      >    </a
      ><a name="1522" href="Stlc.html#9503" class="InductiveConstructor"
      >false</a
      ><a name="1527"
      > </a
      ><a name="1528" class="Symbol"
      >=</a
      ><a name="1529"
      > </a
      ><a name="1530" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="1534"
      > </a
      ><a name="1535" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
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
<a name="1918" href="StlcProp.html#1918" class="Function"
      >progress</a
      ><a name="1926"
      > </a
      ><a name="1927" class="Symbol"
      >:</a
      ><a name="1928"
      > </a
      ><a name="1929" class="Symbol"
      >&#8704;</a
      ><a name="1930"
      > </a
      ><a name="1931" class="Symbol"
      >{</a
      ><a name="1932" href="StlcProp.html#1932" class="Bound"
      >t</a
      ><a name="1933"
      > </a
      ><a name="1934" href="StlcProp.html#1934" class="Bound"
      >A</a
      ><a name="1935" class="Symbol"
      >}</a
      ><a name="1936"
      > </a
      ><a name="1937" class="Symbol"
      >&#8594;</a
      ><a name="1938"
      > </a
      ><a name="1939" href="Stlc.html#18626" class="Function"
      >&#8709;</a
      ><a name="1940"
      > </a
      ><a name="1941" href="Stlc.html#19597" class="Datatype Operator"
      >&#8866;</a
      ><a name="1942"
      > </a
      ><a name="1943" href="StlcProp.html#1932" class="Bound"
      >t</a
      ><a name="1944"
      > </a
      ><a name="1945" href="Stlc.html#19597" class="Datatype Operator"
      >&#8758;</a
      ><a name="1946"
      > </a
      ><a name="1947" href="StlcProp.html#1934" class="Bound"
      >A</a
      ><a name="1948"
      > </a
      ><a name="1949" class="Symbol"
      >&#8594;</a
      ><a name="1950"
      > </a
      ><a name="1951" href="Stlc.html#9407" class="Datatype"
      >Value</a
      ><a name="1956"
      > </a
      ><a name="1957" href="StlcProp.html#1932" class="Bound"
      >t</a
      ><a name="1958"
      > </a
      ><a name="1959" href="https://agda.github.io/agda-stdlib/Data.Sum.html#433" class="Datatype Operator"
      >&#8846;</a
      ><a name="1960"
      > </a
      ><a name="1961" href="https://agda.github.io/agda-stdlib/Data.Product.html#823" class="Function"
      >&#8707;</a
      ><a name="1962"
      > </a
      ><a name="1963" class="Symbol"
      >&#955;</a
      ><a name="1964"
      > </a
      ><a name="1965" href="StlcProp.html#1965" class="Bound"
      >t&#8242;</a
      ><a name="1967"
      > </a
      ><a name="1968" class="Symbol"
      >&#8594;</a
      ><a name="1969"
      > </a
      ><a name="1970" href="StlcProp.html#1932" class="Bound"
      >t</a
      ><a name="1971"
      > </a
      ><a name="1972" href="Stlc.html#15544" class="Datatype Operator"
      >==&gt;</a
      ><a name="1975"
      > </a
      ><a name="1976" href="StlcProp.html#1965" class="Bound"
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
<a name="3677" href="StlcProp.html#1918" class="Function"
      >progress</a
      ><a name="3685"
      > </a
      ><a name="3686" class="Symbol"
      >(</a
      ><a name="3687" href="Stlc.html#19641" class="InductiveConstructor"
      >var</a
      ><a name="3690"
      > </a
      ><a name="3691" href="StlcProp.html#3691" class="Bound"
      >x</a
      ><a name="3692"
      > </a
      ><a name="3693" class="Symbol"
      >())</a
      ><a name="3696"
      >
</a
      ><a name="3697" href="StlcProp.html#1918" class="Function"
      >progress</a
      ><a name="3705"
      > </a
      ><a name="3706" href="Stlc.html#19984" class="InductiveConstructor"
      >true</a
      ><a name="3710"
      >      </a
      ><a name="3716" class="Symbol"
      >=</a
      ><a name="3717"
      > </a
      ><a name="3718" href="https://agda.github.io/agda-stdlib/Data.Sum.html#489" class="InductiveConstructor"
      >inj&#8321;</a
      ><a name="3722"
      > </a
      ><a name="3723" href="Stlc.html#9482" class="InductiveConstructor"
      >true</a
      ><a name="3727"
      >
</a
      ><a name="3728" href="StlcProp.html#1918" class="Function"
      >progress</a
      ><a name="3736"
      > </a
      ><a name="3737" href="Stlc.html#20043" class="InductiveConstructor"
      >false</a
      ><a name="3742"
      >     </a
      ><a name="3747" class="Symbol"
      >=</a
      ><a name="3748"
      > </a
      ><a name="3749" href="https://agda.github.io/agda-stdlib/Data.Sum.html#489" class="InductiveConstructor"
      >inj&#8321;</a
      ><a name="3753"
      > </a
      ><a name="3754" href="Stlc.html#9503" class="InductiveConstructor"
      >false</a
      ><a name="3759"
      >
</a
      ><a name="3760" href="StlcProp.html#1918" class="Function"
      >progress</a
      ><a name="3768"
      > </a
      ><a name="3769" class="Symbol"
      >(</a
      ><a name="3770" href="Stlc.html#19734" class="InductiveConstructor"
      >abs</a
      ><a name="3773"
      > </a
      ><a name="3774" href="StlcProp.html#3774" class="Bound"
      >t&#8758;A</a
      ><a name="3777" class="Symbol"
      >)</a
      ><a name="3778"
      > </a
      ><a name="3779" class="Symbol"
      >=</a
      ><a name="3780"
      > </a
      ><a name="3781" href="https://agda.github.io/agda-stdlib/Data.Sum.html#489" class="InductiveConstructor"
      >inj&#8321;</a
      ><a name="3785"
      > </a
      ><a name="3786" href="Stlc.html#9434" class="InductiveConstructor"
      >abs</a
      ><a name="3789"
      >
</a
      ><a name="3790" href="StlcProp.html#1918" class="Function"
      >progress</a
      ><a name="3798"
      > </a
      ><a name="3799" class="Symbol"
      >(</a
      ><a name="3800" href="Stlc.html#19850" class="InductiveConstructor"
      >app</a
      ><a name="3803"
      > </a
      ><a name="3804" href="StlcProp.html#3804" class="Bound"
      >t&#8321;&#8758;A&#8658;B</a
      ><a name="3810"
      > </a
      ><a name="3811" href="StlcProp.html#3811" class="Bound"
      >t&#8322;&#8758;B</a
      ><a name="3815" class="Symbol"
      >)</a
      ><a name="3816"
      >
    </a
      ><a name="3821" class="Keyword"
      >with</a
      ><a name="3825"
      > </a
      ><a name="3826" href="StlcProp.html#1918" class="Function"
      >progress</a
      ><a name="3834"
      > </a
      ><a name="3835" href="StlcProp.html#3804" class="Bound"
      >t&#8321;&#8758;A&#8658;B</a
      ><a name="3841"
      >
</a
      ><a name="3842" class="Symbol"
      >...</a
      ><a name="3845"
      > </a
      ><a name="3846" class="Symbol"
      >|</a
      ><a name="3847"
      > </a
      ><a name="3848" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="3852"
      > </a
      ><a name="3853" class="Symbol"
      >(_</a
      ><a name="3855"
      > </a
      ><a name="3856" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="3857"
      > </a
      ><a name="3858" href="StlcProp.html#3858" class="Bound"
      >t&#8321;&#8658;t&#8321;&#8242;</a
      ><a name="3864" class="Symbol"
      >)</a
      ><a name="3865"
      > </a
      ><a name="3866" class="Symbol"
      >=</a
      ><a name="3867"
      > </a
      ><a name="3868" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="3872"
      > </a
      ><a name="3873" class="Symbol"
      >(_</a
      ><a name="3875"
      > </a
      ><a name="3876" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="3877"
      > </a
      ><a name="3878" href="Stlc.html#15669" class="InductiveConstructor"
      >app1</a
      ><a name="3882"
      > </a
      ><a name="3883" href="StlcProp.html#3858" class="Bound"
      >t&#8321;&#8658;t&#8321;&#8242;</a
      ><a name="3889" class="Symbol"
      >)</a
      ><a name="3890"
      >
</a
      ><a name="3891" class="Symbol"
      >...</a
      ><a name="3894"
      > </a
      ><a name="3895" class="Symbol"
      >|</a
      ><a name="3896"
      > </a
      ><a name="3897" href="https://agda.github.io/agda-stdlib/Data.Sum.html#489" class="InductiveConstructor"
      >inj&#8321;</a
      ><a name="3901"
      > </a
      ><a name="3902" href="StlcProp.html#3902" class="Bound"
      >v&#8321;</a
      ><a name="3904"
      >
    </a
      ><a name="3909" class="Keyword"
      >with</a
      ><a name="3913"
      > </a
      ><a name="3914" href="StlcProp.html#1918" class="Function"
      >progress</a
      ><a name="3922"
      > </a
      ><a name="3923" href="StlcProp.html#3811" class="Bound"
      >t&#8322;&#8758;B</a
      ><a name="3927"
      >
</a
      ><a name="3928" class="Symbol"
      >...</a
      ><a name="3931"
      > </a
      ><a name="3932" class="Symbol"
      >|</a
      ><a name="3933"
      > </a
      ><a name="3934" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="3938"
      > </a
      ><a name="3939" class="Symbol"
      >(_</a
      ><a name="3941"
      > </a
      ><a name="3942" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="3943"
      > </a
      ><a name="3944" href="StlcProp.html#3944" class="Bound"
      >t&#8322;&#8658;t&#8322;&#8242;</a
      ><a name="3950" class="Symbol"
      >)</a
      ><a name="3951"
      > </a
      ><a name="3952" class="Symbol"
      >=</a
      ><a name="3953"
      > </a
      ><a name="3954" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="3958"
      > </a
      ><a name="3959" class="Symbol"
      >(_</a
      ><a name="3961"
      > </a
      ><a name="3962" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="3963"
      > </a
      ><a name="3964" href="Stlc.html#15746" class="InductiveConstructor"
      >app2</a
      ><a name="3968"
      > </a
      ><a name="3969" href="StlcProp.html#3902" class="Bound"
      >v&#8321;</a
      ><a name="3971"
      > </a
      ><a name="3972" href="StlcProp.html#3944" class="Bound"
      >t&#8322;&#8658;t&#8322;&#8242;</a
      ><a name="3978" class="Symbol"
      >)</a
      ><a name="3979"
      >
</a
      ><a name="3980" class="Symbol"
      >...</a
      ><a name="3983"
      > </a
      ><a name="3984" class="Symbol"
      >|</a
      ><a name="3985"
      > </a
      ><a name="3986" href="https://agda.github.io/agda-stdlib/Data.Sum.html#489" class="InductiveConstructor"
      >inj&#8321;</a
      ><a name="3990"
      > </a
      ><a name="3991" href="StlcProp.html#3991" class="Bound"
      >v&#8322;</a
      ><a name="3993"
      >
    </a
      ><a name="3998" class="Keyword"
      >with</a
      ><a name="4002"
      > </a
      ><a name="4003" href="StlcProp.html#1343" class="Function"
      >canonicalForms</a
      ><a name="4017"
      > </a
      ><a name="4018" href="StlcProp.html#3804" class="Bound"
      >t&#8321;&#8758;A&#8658;B</a
      ><a name="4024"
      > </a
      ><a name="4025" href="StlcProp.html#3902" class="Bound"
      >v&#8321;</a
      ><a name="4027"
      >
</a
      ><a name="4028" class="Symbol"
      >...</a
      ><a name="4031"
      > </a
      ><a name="4032" class="Symbol"
      >|</a
      ><a name="4033"
      > </a
      ><a name="4034" class="Symbol"
      >(_</a
      ><a name="4036"
      > </a
      ><a name="4037" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="4038"
      > </a
      ><a name="4039" class="Symbol"
      >_</a
      ><a name="4040"
      > </a
      ><a name="4041" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="4042"
      > </a
      ><a name="4043" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="4047" class="Symbol"
      >)</a
      ><a name="4048"
      > </a
      ><a name="4049" class="Symbol"
      >=</a
      ><a name="4050"
      > </a
      ><a name="4051" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="4055"
      > </a
      ><a name="4056" class="Symbol"
      >(_</a
      ><a name="4058"
      > </a
      ><a name="4059" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="4060"
      > </a
      ><a name="4061" href="Stlc.html#15578" class="InductiveConstructor"
      >red</a
      ><a name="4064"
      > </a
      ><a name="4065" href="StlcProp.html#3991" class="Bound"
      >v&#8322;</a
      ><a name="4067" class="Symbol"
      >)</a
      ><a name="4068"
      >
</a
      ><a name="4069" href="StlcProp.html#1918" class="Function"
      >progress</a
      ><a name="4077"
      > </a
      ><a name="4078" class="Symbol"
      >(</a
      ><a name="4079" href="Stlc.html#20102" class="InductiveConstructor Operator"
      >if</a
      ><a name="4081"
      > </a
      ><a name="4082" href="StlcProp.html#4082" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="4089"
      > </a
      ><a name="4090" href="Stlc.html#20102" class="InductiveConstructor Operator"
      >then</a
      ><a name="4094"
      > </a
      ><a name="4095" href="StlcProp.html#4095" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="4099"
      > </a
      ><a name="4100" href="Stlc.html#20102" class="InductiveConstructor Operator"
      >else</a
      ><a name="4104"
      > </a
      ><a name="4105" href="StlcProp.html#4105" class="Bound"
      >t&#8323;&#8758;A</a
      ><a name="4109" class="Symbol"
      >)</a
      ><a name="4110"
      >
    </a
      ><a name="4115" class="Keyword"
      >with</a
      ><a name="4119"
      > </a
      ><a name="4120" href="StlcProp.html#1918" class="Function"
      >progress</a
      ><a name="4128"
      > </a
      ><a name="4129" href="StlcProp.html#4082" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="4136"
      >
</a
      ><a name="4137" class="Symbol"
      >...</a
      ><a name="4140"
      > </a
      ><a name="4141" class="Symbol"
      >|</a
      ><a name="4142"
      > </a
      ><a name="4143" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="4147"
      > </a
      ><a name="4148" class="Symbol"
      >(_</a
      ><a name="4150"
      > </a
      ><a name="4151" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="4152"
      > </a
      ><a name="4153" href="StlcProp.html#4153" class="Bound"
      >t&#8321;&#8658;t&#8321;&#8242;</a
      ><a name="4159" class="Symbol"
      >)</a
      ><a name="4160"
      > </a
      ><a name="4161" class="Symbol"
      >=</a
      ><a name="4162"
      > </a
      ><a name="4163" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="4167"
      > </a
      ><a name="4168" class="Symbol"
      >(_</a
      ><a name="4170"
      > </a
      ><a name="4171" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="4172"
      > </a
      ><a name="4173" href="Stlc.html#15843" class="InductiveConstructor"
      >if</a
      ><a name="4175"
      > </a
      ><a name="4176" href="StlcProp.html#4153" class="Bound"
      >t&#8321;&#8658;t&#8321;&#8242;</a
      ><a name="4182" class="Symbol"
      >)</a
      ><a name="4183"
      >
</a
      ><a name="4184" class="Symbol"
      >...</a
      ><a name="4187"
      > </a
      ><a name="4188" class="Symbol"
      >|</a
      ><a name="4189"
      > </a
      ><a name="4190" href="https://agda.github.io/agda-stdlib/Data.Sum.html#489" class="InductiveConstructor"
      >inj&#8321;</a
      ><a name="4194"
      > </a
      ><a name="4195" href="StlcProp.html#4195" class="Bound"
      >v&#8321;</a
      ><a name="4197"
      >
    </a
      ><a name="4202" class="Keyword"
      >with</a
      ><a name="4206"
      > </a
      ><a name="4207" href="StlcProp.html#1343" class="Function"
      >canonicalForms</a
      ><a name="4221"
      > </a
      ><a name="4222" href="StlcProp.html#4082" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="4229"
      > </a
      ><a name="4230" href="StlcProp.html#4195" class="Bound"
      >v&#8321;</a
      ><a name="4232"
      >
</a
      ><a name="4233" class="Symbol"
      >...</a
      ><a name="4236"
      > </a
      ><a name="4237" class="Symbol"
      >|</a
      ><a name="4238"
      > </a
      ><a name="4239" href="https://agda.github.io/agda-stdlib/Data.Sum.html#489" class="InductiveConstructor"
      >inj&#8321;</a
      ><a name="4243"
      > </a
      ><a name="4244" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="4248"
      > </a
      ><a name="4249" class="Symbol"
      >=</a
      ><a name="4250"
      > </a
      ><a name="4251" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="4255"
      > </a
      ><a name="4256" class="Symbol"
      >(_</a
      ><a name="4258"
      > </a
      ><a name="4259" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="4260"
      > </a
      ><a name="4261" href="Stlc.html#15944" class="InductiveConstructor"
      >iftrue</a
      ><a name="4267" class="Symbol"
      >)</a
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
      ><a name="4275" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
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
      ><a name="4297" href="Stlc.html#16004" class="InductiveConstructor"
      >iffalse</a
      ><a name="4304" class="Symbol"
      >)</a
      >
{% endraw %}</pre>

#### Exercise: 3 stars, optional (progress_from_term_ind)
Show that progress can also be proved by induction on terms
instead of induction on typing derivations.

<pre class="Agda">{% raw %}
<a name="4494" class="Keyword"
      >postulate</a
      ><a name="4503"
      >
  </a
      ><a name="4506" href="StlcProp.html#4506" class="Postulate"
      >progress&#8242;</a
      ><a name="4515"
      > </a
      ><a name="4516" class="Symbol"
      >:</a
      ><a name="4517"
      > </a
      ><a name="4518" class="Symbol"
      >&#8704;</a
      ><a name="4519"
      > </a
      ><a name="4520" class="Symbol"
      >{</a
      ><a name="4521" href="StlcProp.html#4521" class="Bound"
      >t</a
      ><a name="4522"
      > </a
      ><a name="4523" href="StlcProp.html#4523" class="Bound"
      >A</a
      ><a name="4524" class="Symbol"
      >}</a
      ><a name="4525"
      > </a
      ><a name="4526" class="Symbol"
      >&#8594;</a
      ><a name="4527"
      > </a
      ><a name="4528" href="Stlc.html#18626" class="Function"
      >&#8709;</a
      ><a name="4529"
      > </a
      ><a name="4530" href="Stlc.html#19597" class="Datatype Operator"
      >&#8866;</a
      ><a name="4531"
      > </a
      ><a name="4532" href="StlcProp.html#4521" class="Bound"
      >t</a
      ><a name="4533"
      > </a
      ><a name="4534" href="Stlc.html#19597" class="Datatype Operator"
      >&#8758;</a
      ><a name="4535"
      > </a
      ><a name="4536" href="StlcProp.html#4523" class="Bound"
      >A</a
      ><a name="4537"
      > </a
      ><a name="4538" class="Symbol"
      >&#8594;</a
      ><a name="4539"
      > </a
      ><a name="4540" href="Stlc.html#9407" class="Datatype"
      >Value</a
      ><a name="4545"
      > </a
      ><a name="4546" href="StlcProp.html#4521" class="Bound"
      >t</a
      ><a name="4547"
      > </a
      ><a name="4548" href="https://agda.github.io/agda-stdlib/Data.Sum.html#433" class="Datatype Operator"
      >&#8846;</a
      ><a name="4549"
      > </a
      ><a name="4550" href="https://agda.github.io/agda-stdlib/Data.Product.html#823" class="Function"
      >&#8707;</a
      ><a name="4551"
      > </a
      ><a name="4552" class="Symbol"
      >&#955;</a
      ><a name="4553"
      > </a
      ><a name="4554" href="StlcProp.html#4554" class="Bound"
      >t&#8242;</a
      ><a name="4556"
      > </a
      ><a name="4557" class="Symbol"
      >&#8594;</a
      ><a name="4558"
      > </a
      ><a name="4559" href="StlcProp.html#4521" class="Bound"
      >t</a
      ><a name="4560"
      > </a
      ><a name="4561" href="Stlc.html#15544" class="Datatype Operator"
      >==&gt;</a
      ><a name="4564"
      > </a
      ><a name="4565" href="StlcProp.html#4554" class="Bound"
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
<a name="6988" class="Keyword"
      >data</a
      ><a name="6992"
      > </a
      ><a name="6993" href="StlcProp.html#6993" class="Datatype Operator"
      >_FreeIn_</a
      ><a name="7001"
      > </a
      ><a name="7002" class="Symbol"
      >(</a
      ><a name="7003" href="StlcProp.html#7003" class="Bound"
      >x</a
      ><a name="7004"
      > </a
      ><a name="7005" class="Symbol"
      >:</a
      ><a name="7006"
      > </a
      ><a name="7007" href="Stlc.html#5746" class="Datatype"
      >Id</a
      ><a name="7009" class="Symbol"
      >)</a
      ><a name="7010"
      > </a
      ><a name="7011" class="Symbol"
      >:</a
      ><a name="7012"
      > </a
      ><a name="7013" href="Stlc.html#6082" class="Datatype"
      >Term</a
      ><a name="7017"
      > </a
      ><a name="7018" class="Symbol"
      >&#8594;</a
      ><a name="7019"
      > </a
      ><a name="7020" class="PrimitiveType"
      >Set</a
      ><a name="7023"
      > </a
      ><a name="7024" class="Keyword"
      >where</a
      ><a name="7029"
      >
  </a
      ><a name="7032" href="StlcProp.html#7032" class="InductiveConstructor"
      >var</a
      ><a name="7035"
      >  </a
      ><a name="7037" class="Symbol"
      >:</a
      ><a name="7038"
      > </a
      ><a name="7039" href="StlcProp.html#7003" class="Bound"
      >x</a
      ><a name="7040"
      > </a
      ><a name="7041" href="StlcProp.html#6993" class="Datatype Operator"
      >FreeIn</a
      ><a name="7047"
      > </a
      ><a name="7048" href="Stlc.html#6101" class="InductiveConstructor"
      >var</a
      ><a name="7051"
      > </a
      ><a name="7052" href="StlcProp.html#7003" class="Bound"
      >x</a
      ><a name="7053"
      >
  </a
      ><a name="7056" href="StlcProp.html#7056" class="InductiveConstructor"
      >abs</a
      ><a name="7059"
      >  </a
      ><a name="7061" class="Symbol"
      >:</a
      ><a name="7062"
      > </a
      ><a name="7063" class="Symbol"
      >&#8704;</a
      ><a name="7064"
      > </a
      ><a name="7065" class="Symbol"
      >{</a
      ><a name="7066" href="StlcProp.html#7066" class="Bound"
      >y</a
      ><a name="7067"
      > </a
      ><a name="7068" href="StlcProp.html#7068" class="Bound"
      >A</a
      ><a name="7069"
      > </a
      ><a name="7070" href="StlcProp.html#7070" class="Bound"
      >t</a
      ><a name="7071" class="Symbol"
      >}</a
      ><a name="7072"
      > </a
      ><a name="7073" class="Symbol"
      >&#8594;</a
      ><a name="7074"
      > </a
      ><a name="7075" href="StlcProp.html#7066" class="Bound"
      >y</a
      ><a name="7076"
      > </a
      ><a name="7077" href="https://agda.github.io/agda-stdlib/Relation.Binary.Core.html#4493" class="Function Operator"
      >&#8802;</a
      ><a name="7078"
      > </a
      ><a name="7079" href="StlcProp.html#7003" class="Bound"
      >x</a
      ><a name="7080"
      > </a
      ><a name="7081" class="Symbol"
      >&#8594;</a
      ><a name="7082"
      > </a
      ><a name="7083" href="StlcProp.html#7003" class="Bound"
      >x</a
      ><a name="7084"
      > </a
      ><a name="7085" href="StlcProp.html#6993" class="Datatype Operator"
      >FreeIn</a
      ><a name="7091"
      > </a
      ><a name="7092" href="StlcProp.html#7070" class="Bound"
      >t</a
      ><a name="7093"
      > </a
      ><a name="7094" class="Symbol"
      >&#8594;</a
      ><a name="7095"
      > </a
      ><a name="7096" href="StlcProp.html#7003" class="Bound"
      >x</a
      ><a name="7097"
      > </a
      ><a name="7098" href="StlcProp.html#6993" class="Datatype Operator"
      >FreeIn</a
      ><a name="7104"
      > </a
      ><a name="7105" href="Stlc.html#6150" class="InductiveConstructor"
      >abs</a
      ><a name="7108"
      > </a
      ><a name="7109" href="StlcProp.html#7066" class="Bound"
      >y</a
      ><a name="7110"
      > </a
      ><a name="7111" href="StlcProp.html#7068" class="Bound"
      >A</a
      ><a name="7112"
      > </a
      ><a name="7113" href="StlcProp.html#7070" class="Bound"
      >t</a
      ><a name="7114"
      >
  </a
      ><a name="7117" href="StlcProp.html#7117" class="InductiveConstructor"
      >app1</a
      ><a name="7121"
      > </a
      ><a name="7122" class="Symbol"
      >:</a
      ><a name="7123"
      > </a
      ><a name="7124" class="Symbol"
      >&#8704;</a
      ><a name="7125"
      > </a
      ><a name="7126" class="Symbol"
      >{</a
      ><a name="7127" href="StlcProp.html#7127" class="Bound"
      >t&#8321;</a
      ><a name="7129"
      > </a
      ><a name="7130" href="StlcProp.html#7130" class="Bound"
      >t&#8322;</a
      ><a name="7132" class="Symbol"
      >}</a
      ><a name="7133"
      > </a
      ><a name="7134" class="Symbol"
      >&#8594;</a
      ><a name="7135"
      > </a
      ><a name="7136" href="StlcProp.html#7003" class="Bound"
      >x</a
      ><a name="7137"
      > </a
      ><a name="7138" href="StlcProp.html#6993" class="Datatype Operator"
      >FreeIn</a
      ><a name="7144"
      > </a
      ><a name="7145" href="StlcProp.html#7127" class="Bound"
      >t&#8321;</a
      ><a name="7147"
      > </a
      ><a name="7148" class="Symbol"
      >&#8594;</a
      ><a name="7149"
      > </a
      ><a name="7150" href="StlcProp.html#7003" class="Bound"
      >x</a
      ><a name="7151"
      > </a
      ><a name="7152" href="StlcProp.html#6993" class="Datatype Operator"
      >FreeIn</a
      ><a name="7158"
      > </a
      ><a name="7159" href="Stlc.html#6121" class="InductiveConstructor"
      >app</a
      ><a name="7162"
      > </a
      ><a name="7163" href="StlcProp.html#7127" class="Bound"
      >t&#8321;</a
      ><a name="7165"
      > </a
      ><a name="7166" href="StlcProp.html#7130" class="Bound"
      >t&#8322;</a
      ><a name="7168"
      >
  </a
      ><a name="7171" href="StlcProp.html#7171" class="InductiveConstructor"
      >app2</a
      ><a name="7175"
      > </a
      ><a name="7176" class="Symbol"
      >:</a
      ><a name="7177"
      > </a
      ><a name="7178" class="Symbol"
      >&#8704;</a
      ><a name="7179"
      > </a
      ><a name="7180" class="Symbol"
      >{</a
      ><a name="7181" href="StlcProp.html#7181" class="Bound"
      >t&#8321;</a
      ><a name="7183"
      > </a
      ><a name="7184" href="StlcProp.html#7184" class="Bound"
      >t&#8322;</a
      ><a name="7186" class="Symbol"
      >}</a
      ><a name="7187"
      > </a
      ><a name="7188" class="Symbol"
      >&#8594;</a
      ><a name="7189"
      > </a
      ><a name="7190" href="StlcProp.html#7003" class="Bound"
      >x</a
      ><a name="7191"
      > </a
      ><a name="7192" href="StlcProp.html#6993" class="Datatype Operator"
      >FreeIn</a
      ><a name="7198"
      > </a
      ><a name="7199" href="StlcProp.html#7184" class="Bound"
      >t&#8322;</a
      ><a name="7201"
      > </a
      ><a name="7202" class="Symbol"
      >&#8594;</a
      ><a name="7203"
      > </a
      ><a name="7204" href="StlcProp.html#7003" class="Bound"
      >x</a
      ><a name="7205"
      > </a
      ><a name="7206" href="StlcProp.html#6993" class="Datatype Operator"
      >FreeIn</a
      ><a name="7212"
      > </a
      ><a name="7213" href="Stlc.html#6121" class="InductiveConstructor"
      >app</a
      ><a name="7216"
      > </a
      ><a name="7217" href="StlcProp.html#7181" class="Bound"
      >t&#8321;</a
      ><a name="7219"
      > </a
      ><a name="7220" href="StlcProp.html#7184" class="Bound"
      >t&#8322;</a
      ><a name="7222"
      >
  </a
      ><a name="7225" href="StlcProp.html#7225" class="InductiveConstructor"
      >if1</a
      ><a name="7228"
      >  </a
      ><a name="7230" class="Symbol"
      >:</a
      ><a name="7231"
      > </a
      ><a name="7232" class="Symbol"
      >&#8704;</a
      ><a name="7233"
      > </a
      ><a name="7234" class="Symbol"
      >{</a
      ><a name="7235" href="StlcProp.html#7235" class="Bound"
      >t&#8321;</a
      ><a name="7237"
      > </a
      ><a name="7238" href="StlcProp.html#7238" class="Bound"
      >t&#8322;</a
      ><a name="7240"
      > </a
      ><a name="7241" href="StlcProp.html#7241" class="Bound"
      >t&#8323;</a
      ><a name="7243" class="Symbol"
      >}</a
      ><a name="7244"
      > </a
      ><a name="7245" class="Symbol"
      >&#8594;</a
      ><a name="7246"
      > </a
      ><a name="7247" href="StlcProp.html#7003" class="Bound"
      >x</a
      ><a name="7248"
      > </a
      ><a name="7249" href="StlcProp.html#6993" class="Datatype Operator"
      >FreeIn</a
      ><a name="7255"
      > </a
      ><a name="7256" href="StlcProp.html#7235" class="Bound"
      >t&#8321;</a
      ><a name="7258"
      > </a
      ><a name="7259" class="Symbol"
      >&#8594;</a
      ><a name="7260"
      > </a
      ><a name="7261" href="StlcProp.html#7003" class="Bound"
      >x</a
      ><a name="7262"
      > </a
      ><a name="7263" href="StlcProp.html#6993" class="Datatype Operator"
      >FreeIn</a
      ><a name="7269"
      > </a
      ><a name="7270" class="Symbol"
      >(</a
      ><a name="7271" href="Stlc.html#6214" class="InductiveConstructor Operator"
      >if</a
      ><a name="7273"
      > </a
      ><a name="7274" href="StlcProp.html#7235" class="Bound"
      >t&#8321;</a
      ><a name="7276"
      > </a
      ><a name="7277" href="Stlc.html#6214" class="InductiveConstructor Operator"
      >then</a
      ><a name="7281"
      > </a
      ><a name="7282" href="StlcProp.html#7238" class="Bound"
      >t&#8322;</a
      ><a name="7284"
      > </a
      ><a name="7285" href="Stlc.html#6214" class="InductiveConstructor Operator"
      >else</a
      ><a name="7289"
      > </a
      ><a name="7290" href="StlcProp.html#7241" class="Bound"
      >t&#8323;</a
      ><a name="7292" class="Symbol"
      >)</a
      ><a name="7293"
      >
  </a
      ><a name="7296" href="StlcProp.html#7296" class="InductiveConstructor"
      >if2</a
      ><a name="7299"
      >  </a
      ><a name="7301" class="Symbol"
      >:</a
      ><a name="7302"
      > </a
      ><a name="7303" class="Symbol"
      >&#8704;</a
      ><a name="7304"
      > </a
      ><a name="7305" class="Symbol"
      >{</a
      ><a name="7306" href="StlcProp.html#7306" class="Bound"
      >t&#8321;</a
      ><a name="7308"
      > </a
      ><a name="7309" href="StlcProp.html#7309" class="Bound"
      >t&#8322;</a
      ><a name="7311"
      > </a
      ><a name="7312" href="StlcProp.html#7312" class="Bound"
      >t&#8323;</a
      ><a name="7314" class="Symbol"
      >}</a
      ><a name="7315"
      > </a
      ><a name="7316" class="Symbol"
      >&#8594;</a
      ><a name="7317"
      > </a
      ><a name="7318" href="StlcProp.html#7003" class="Bound"
      >x</a
      ><a name="7319"
      > </a
      ><a name="7320" href="StlcProp.html#6993" class="Datatype Operator"
      >FreeIn</a
      ><a name="7326"
      > </a
      ><a name="7327" href="StlcProp.html#7309" class="Bound"
      >t&#8322;</a
      ><a name="7329"
      > </a
      ><a name="7330" class="Symbol"
      >&#8594;</a
      ><a name="7331"
      > </a
      ><a name="7332" href="StlcProp.html#7003" class="Bound"
      >x</a
      ><a name="7333"
      > </a
      ><a name="7334" href="StlcProp.html#6993" class="Datatype Operator"
      >FreeIn</a
      ><a name="7340"
      > </a
      ><a name="7341" class="Symbol"
      >(</a
      ><a name="7342" href="Stlc.html#6214" class="InductiveConstructor Operator"
      >if</a
      ><a name="7344"
      > </a
      ><a name="7345" href="StlcProp.html#7306" class="Bound"
      >t&#8321;</a
      ><a name="7347"
      > </a
      ><a name="7348" href="Stlc.html#6214" class="InductiveConstructor Operator"
      >then</a
      ><a name="7352"
      > </a
      ><a name="7353" href="StlcProp.html#7309" class="Bound"
      >t&#8322;</a
      ><a name="7355"
      > </a
      ><a name="7356" href="Stlc.html#6214" class="InductiveConstructor Operator"
      >else</a
      ><a name="7360"
      > </a
      ><a name="7361" href="StlcProp.html#7312" class="Bound"
      >t&#8323;</a
      ><a name="7363" class="Symbol"
      >)</a
      ><a name="7364"
      >
  </a
      ><a name="7367" href="StlcProp.html#7367" class="InductiveConstructor"
      >if3</a
      ><a name="7370"
      >  </a
      ><a name="7372" class="Symbol"
      >:</a
      ><a name="7373"
      > </a
      ><a name="7374" class="Symbol"
      >&#8704;</a
      ><a name="7375"
      > </a
      ><a name="7376" class="Symbol"
      >{</a
      ><a name="7377" href="StlcProp.html#7377" class="Bound"
      >t&#8321;</a
      ><a name="7379"
      > </a
      ><a name="7380" href="StlcProp.html#7380" class="Bound"
      >t&#8322;</a
      ><a name="7382"
      > </a
      ><a name="7383" href="StlcProp.html#7383" class="Bound"
      >t&#8323;</a
      ><a name="7385" class="Symbol"
      >}</a
      ><a name="7386"
      > </a
      ><a name="7387" class="Symbol"
      >&#8594;</a
      ><a name="7388"
      > </a
      ><a name="7389" href="StlcProp.html#7003" class="Bound"
      >x</a
      ><a name="7390"
      > </a
      ><a name="7391" href="StlcProp.html#6993" class="Datatype Operator"
      >FreeIn</a
      ><a name="7397"
      > </a
      ><a name="7398" href="StlcProp.html#7383" class="Bound"
      >t&#8323;</a
      ><a name="7400"
      > </a
      ><a name="7401" class="Symbol"
      >&#8594;</a
      ><a name="7402"
      > </a
      ><a name="7403" href="StlcProp.html#7003" class="Bound"
      >x</a
      ><a name="7404"
      > </a
      ><a name="7405" href="StlcProp.html#6993" class="Datatype Operator"
      >FreeIn</a
      ><a name="7411"
      > </a
      ><a name="7412" class="Symbol"
      >(</a
      ><a name="7413" href="Stlc.html#6214" class="InductiveConstructor Operator"
      >if</a
      ><a name="7415"
      > </a
      ><a name="7416" href="StlcProp.html#7377" class="Bound"
      >t&#8321;</a
      ><a name="7418"
      > </a
      ><a name="7419" href="Stlc.html#6214" class="InductiveConstructor Operator"
      >then</a
      ><a name="7423"
      > </a
      ><a name="7424" href="StlcProp.html#7380" class="Bound"
      >t&#8322;</a
      ><a name="7426"
      > </a
      ><a name="7427" href="Stlc.html#6214" class="InductiveConstructor Operator"
      >else</a
      ><a name="7431"
      > </a
      ><a name="7432" href="StlcProp.html#7383" class="Bound"
      >t&#8323;</a
      ><a name="7434" class="Symbol"
      >)</a
      >
{% endraw %}</pre>

A term in which no variables appear free is said to be _closed_.

<pre class="Agda">{% raw %}
<a name="7527" href="StlcProp.html#7527" class="Function"
      >Closed</a
      ><a name="7533"
      > </a
      ><a name="7534" class="Symbol"
      >:</a
      ><a name="7535"
      > </a
      ><a name="7536" href="Stlc.html#6082" class="Datatype"
      >Term</a
      ><a name="7540"
      > </a
      ><a name="7541" class="Symbol"
      >&#8594;</a
      ><a name="7542"
      > </a
      ><a name="7543" class="PrimitiveType"
      >Set</a
      ><a name="7546"
      >
</a
      ><a name="7547" href="StlcProp.html#7527" class="Function"
      >Closed</a
      ><a name="7553"
      > </a
      ><a name="7554" href="StlcProp.html#7554" class="Bound"
      >t</a
      ><a name="7555"
      > </a
      ><a name="7556" class="Symbol"
      >=</a
      ><a name="7557"
      > </a
      ><a name="7558" class="Symbol"
      >&#8704;</a
      ><a name="7559"
      > </a
      ><a name="7560" class="Symbol"
      >{</a
      ><a name="7561" href="StlcProp.html#7561" class="Bound"
      >x</a
      ><a name="7562" class="Symbol"
      >}</a
      ><a name="7563"
      > </a
      ><a name="7564" class="Symbol"
      >&#8594;</a
      ><a name="7565"
      > </a
      ><a name="7566" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#414" class="Function Operator"
      >&#172;</a
      ><a name="7567"
      > </a
      ><a name="7568" class="Symbol"
      >(</a
      ><a name="7569" href="StlcProp.html#7561" class="Bound"
      >x</a
      ><a name="7570"
      > </a
      ><a name="7571" href="StlcProp.html#6993" class="Datatype Operator"
      >FreeIn</a
      ><a name="7577"
      > </a
      ><a name="7578" href="StlcProp.html#7554" class="Bound"
      >t</a
      ><a name="7579" class="Symbol"
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
<a name="8308" href="StlcProp.html#8308" class="Function"
      >freeInCtxt</a
      ><a name="8318"
      > </a
      ><a name="8319" class="Symbol"
      >:</a
      ><a name="8320"
      > </a
      ><a name="8321" class="Symbol"
      >&#8704;</a
      ><a name="8322"
      > </a
      ><a name="8323" class="Symbol"
      >{</a
      ><a name="8324" href="StlcProp.html#8324" class="Bound"
      >x</a
      ><a name="8325"
      > </a
      ><a name="8326" href="StlcProp.html#8326" class="Bound"
      >t</a
      ><a name="8327"
      > </a
      ><a name="8328" href="StlcProp.html#8328" class="Bound"
      >A</a
      ><a name="8329"
      > </a
      ><a name="8330" href="StlcProp.html#8330" class="Bound"
      >&#915;</a
      ><a name="8331" class="Symbol"
      >}</a
      ><a name="8332"
      > </a
      ><a name="8333" class="Symbol"
      >&#8594;</a
      ><a name="8334"
      > </a
      ><a name="8335" href="StlcProp.html#8324" class="Bound"
      >x</a
      ><a name="8336"
      > </a
      ><a name="8337" href="StlcProp.html#6993" class="Datatype Operator"
      >FreeIn</a
      ><a name="8343"
      > </a
      ><a name="8344" href="StlcProp.html#8326" class="Bound"
      >t</a
      ><a name="8345"
      > </a
      ><a name="8346" class="Symbol"
      >&#8594;</a
      ><a name="8347"
      > </a
      ><a name="8348" href="StlcProp.html#8330" class="Bound"
      >&#915;</a
      ><a name="8349"
      > </a
      ><a name="8350" href="Stlc.html#19597" class="Datatype Operator"
      >&#8866;</a
      ><a name="8351"
      > </a
      ><a name="8352" href="StlcProp.html#8326" class="Bound"
      >t</a
      ><a name="8353"
      > </a
      ><a name="8354" href="Stlc.html#19597" class="Datatype Operator"
      >&#8758;</a
      ><a name="8355"
      > </a
      ><a name="8356" href="StlcProp.html#8328" class="Bound"
      >A</a
      ><a name="8357"
      > </a
      ><a name="8358" class="Symbol"
      >&#8594;</a
      ><a name="8359"
      > </a
      ><a name="8360" href="https://agda.github.io/agda-stdlib/Data.Product.html#823" class="Function"
      >&#8707;</a
      ><a name="8361"
      > </a
      ><a name="8362" class="Symbol"
      >&#955;</a
      ><a name="8363"
      > </a
      ><a name="8364" href="StlcProp.html#8364" class="Bound"
      >B</a
      ><a name="8365"
      > </a
      ><a name="8366" class="Symbol"
      >&#8594;</a
      ><a name="8367"
      > </a
      ><a name="8368" href="StlcProp.html#8330" class="Bound"
      >&#915;</a
      ><a name="8369"
      > </a
      ><a name="8370" href="StlcProp.html#8324" class="Bound"
      >x</a
      ><a name="8371"
      > </a
      ><a name="8372" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="8373"
      > </a
      ><a name="8374" href="https://agda.github.io/agda-stdlib/Data.Maybe.Base.html#373" class="InductiveConstructor"
      >just</a
      ><a name="8378"
      > </a
      ><a name="8379" href="StlcProp.html#8364" class="Bound"
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
<a name="9975" href="StlcProp.html#8308" class="Function"
      >freeInCtxt</a
      ><a name="9985"
      > </a
      ><a name="9986" href="StlcProp.html#7032" class="InductiveConstructor"
      >var</a
      ><a name="9989"
      > </a
      ><a name="9990" class="Symbol"
      >(</a
      ><a name="9991" href="Stlc.html#19641" class="InductiveConstructor"
      >var</a
      ><a name="9994"
      > </a
      ><a name="9995" class="Symbol"
      >_</a
      ><a name="9996"
      > </a
      ><a name="9997" href="StlcProp.html#9997" class="Bound"
      >x&#8758;A</a
      ><a name="10000" class="Symbol"
      >)</a
      ><a name="10001"
      > </a
      ><a name="10002" class="Symbol"
      >=</a
      ><a name="10003"
      > </a
      ><a name="10004" class="Symbol"
      >(_</a
      ><a name="10006"
      > </a
      ><a name="10007" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="10008"
      > </a
      ><a name="10009" href="StlcProp.html#9997" class="Bound"
      >x&#8758;A</a
      ><a name="10012" class="Symbol"
      >)</a
      ><a name="10013"
      >
</a
      ><a name="10014" href="StlcProp.html#8308" class="Function"
      >freeInCtxt</a
      ><a name="10024"
      > </a
      ><a name="10025" class="Symbol"
      >(</a
      ><a name="10026" href="StlcProp.html#7117" class="InductiveConstructor"
      >app1</a
      ><a name="10030"
      > </a
      ><a name="10031" href="StlcProp.html#10031" class="Bound"
      >x&#8712;t&#8321;</a
      ><a name="10035" class="Symbol"
      >)</a
      ><a name="10036"
      > </a
      ><a name="10037" class="Symbol"
      >(</a
      ><a name="10038" href="Stlc.html#19850" class="InductiveConstructor"
      >app</a
      ><a name="10041"
      > </a
      ><a name="10042" href="StlcProp.html#10042" class="Bound"
      >t&#8321;&#8758;A</a
      ><a name="10046"
      > </a
      ><a name="10047" class="Symbol"
      >_</a
      ><a name="10048"
      >   </a
      ><a name="10051" class="Symbol"
      >)</a
      ><a name="10052"
      > </a
      ><a name="10053" class="Symbol"
      >=</a
      ><a name="10054"
      > </a
      ><a name="10055" href="StlcProp.html#8308" class="Function"
      >freeInCtxt</a
      ><a name="10065"
      > </a
      ><a name="10066" href="StlcProp.html#10031" class="Bound"
      >x&#8712;t&#8321;</a
      ><a name="10070"
      > </a
      ><a name="10071" href="StlcProp.html#10042" class="Bound"
      >t&#8321;&#8758;A</a
      ><a name="10075"
      >
</a
      ><a name="10076" href="StlcProp.html#8308" class="Function"
      >freeInCtxt</a
      ><a name="10086"
      > </a
      ><a name="10087" class="Symbol"
      >(</a
      ><a name="10088" href="StlcProp.html#7171" class="InductiveConstructor"
      >app2</a
      ><a name="10092"
      > </a
      ><a name="10093" href="StlcProp.html#10093" class="Bound"
      >x&#8712;t&#8322;</a
      ><a name="10097" class="Symbol"
      >)</a
      ><a name="10098"
      > </a
      ><a name="10099" class="Symbol"
      >(</a
      ><a name="10100" href="Stlc.html#19850" class="InductiveConstructor"
      >app</a
      ><a name="10103"
      > </a
      ><a name="10104" class="Symbol"
      >_</a
      ><a name="10105"
      >    </a
      ><a name="10109" href="StlcProp.html#10109" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="10113" class="Symbol"
      >)</a
      ><a name="10114"
      > </a
      ><a name="10115" class="Symbol"
      >=</a
      ><a name="10116"
      > </a
      ><a name="10117" href="StlcProp.html#8308" class="Function"
      >freeInCtxt</a
      ><a name="10127"
      > </a
      ><a name="10128" href="StlcProp.html#10093" class="Bound"
      >x&#8712;t&#8322;</a
      ><a name="10132"
      > </a
      ><a name="10133" href="StlcProp.html#10109" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="10137"
      >
</a
      ><a name="10138" href="StlcProp.html#8308" class="Function"
      >freeInCtxt</a
      ><a name="10148"
      > </a
      ><a name="10149" class="Symbol"
      >(</a
      ><a name="10150" href="StlcProp.html#7225" class="InductiveConstructor"
      >if1</a
      ><a name="10153"
      >  </a
      ><a name="10155" href="StlcProp.html#10155" class="Bound"
      >x&#8712;t&#8321;</a
      ><a name="10159" class="Symbol"
      >)</a
      ><a name="10160"
      > </a
      ><a name="10161" class="Symbol"
      >(</a
      ><a name="10162" href="Stlc.html#20102" class="InductiveConstructor Operator"
      >if</a
      ><a name="10164"
      > </a
      ><a name="10165" href="StlcProp.html#10165" class="Bound"
      >t&#8321;&#8758;A</a
      ><a name="10169"
      > </a
      ><a name="10170" href="Stlc.html#20102" class="InductiveConstructor Operator"
      >then</a
      ><a name="10174"
      > </a
      ><a name="10175" class="Symbol"
      >_</a
      ><a name="10176"
      >    </a
      ><a name="10180" href="Stlc.html#20102" class="InductiveConstructor Operator"
      >else</a
      ><a name="10184"
      > </a
      ><a name="10185" class="Symbol"
      >_</a
      ><a name="10186"
      >   </a
      ><a name="10189" class="Symbol"
      >)</a
      ><a name="10190"
      > </a
      ><a name="10191" class="Symbol"
      >=</a
      ><a name="10192"
      > </a
      ><a name="10193" href="StlcProp.html#8308" class="Function"
      >freeInCtxt</a
      ><a name="10203"
      > </a
      ><a name="10204" href="StlcProp.html#10155" class="Bound"
      >x&#8712;t&#8321;</a
      ><a name="10208"
      > </a
      ><a name="10209" href="StlcProp.html#10165" class="Bound"
      >t&#8321;&#8758;A</a
      ><a name="10213"
      >
</a
      ><a name="10214" href="StlcProp.html#8308" class="Function"
      >freeInCtxt</a
      ><a name="10224"
      > </a
      ><a name="10225" class="Symbol"
      >(</a
      ><a name="10226" href="StlcProp.html#7296" class="InductiveConstructor"
      >if2</a
      ><a name="10229"
      >  </a
      ><a name="10231" href="StlcProp.html#10231" class="Bound"
      >x&#8712;t&#8322;</a
      ><a name="10235" class="Symbol"
      >)</a
      ><a name="10236"
      > </a
      ><a name="10237" class="Symbol"
      >(</a
      ><a name="10238" href="Stlc.html#20102" class="InductiveConstructor Operator"
      >if</a
      ><a name="10240"
      > </a
      ><a name="10241" class="Symbol"
      >_</a
      ><a name="10242"
      >    </a
      ><a name="10246" href="Stlc.html#20102" class="InductiveConstructor Operator"
      >then</a
      ><a name="10250"
      > </a
      ><a name="10251" href="StlcProp.html#10251" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="10255"
      > </a
      ><a name="10256" href="Stlc.html#20102" class="InductiveConstructor Operator"
      >else</a
      ><a name="10260"
      > </a
      ><a name="10261" class="Symbol"
      >_</a
      ><a name="10262"
      >   </a
      ><a name="10265" class="Symbol"
      >)</a
      ><a name="10266"
      > </a
      ><a name="10267" class="Symbol"
      >=</a
      ><a name="10268"
      > </a
      ><a name="10269" href="StlcProp.html#8308" class="Function"
      >freeInCtxt</a
      ><a name="10279"
      > </a
      ><a name="10280" href="StlcProp.html#10231" class="Bound"
      >x&#8712;t&#8322;</a
      ><a name="10284"
      > </a
      ><a name="10285" href="StlcProp.html#10251" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="10289"
      >
</a
      ><a name="10290" href="StlcProp.html#8308" class="Function"
      >freeInCtxt</a
      ><a name="10300"
      > </a
      ><a name="10301" class="Symbol"
      >(</a
      ><a name="10302" href="StlcProp.html#7367" class="InductiveConstructor"
      >if3</a
      ><a name="10305"
      >  </a
      ><a name="10307" href="StlcProp.html#10307" class="Bound"
      >x&#8712;t&#8323;</a
      ><a name="10311" class="Symbol"
      >)</a
      ><a name="10312"
      > </a
      ><a name="10313" class="Symbol"
      >(</a
      ><a name="10314" href="Stlc.html#20102" class="InductiveConstructor Operator"
      >if</a
      ><a name="10316"
      > </a
      ><a name="10317" class="Symbol"
      >_</a
      ><a name="10318"
      >    </a
      ><a name="10322" href="Stlc.html#20102" class="InductiveConstructor Operator"
      >then</a
      ><a name="10326"
      > </a
      ><a name="10327" class="Symbol"
      >_</a
      ><a name="10328"
      >    </a
      ><a name="10332" href="Stlc.html#20102" class="InductiveConstructor Operator"
      >else</a
      ><a name="10336"
      > </a
      ><a name="10337" href="StlcProp.html#10337" class="Bound"
      >t&#8323;&#8758;A</a
      ><a name="10341" class="Symbol"
      >)</a
      ><a name="10342"
      > </a
      ><a name="10343" class="Symbol"
      >=</a
      ><a name="10344"
      > </a
      ><a name="10345" href="StlcProp.html#8308" class="Function"
      >freeInCtxt</a
      ><a name="10355"
      > </a
      ><a name="10356" href="StlcProp.html#10307" class="Bound"
      >x&#8712;t&#8323;</a
      ><a name="10360"
      > </a
      ><a name="10361" href="StlcProp.html#10337" class="Bound"
      >t&#8323;&#8758;A</a
      ><a name="10365"
      >
</a
      ><a name="10366" href="StlcProp.html#8308" class="Function"
      >freeInCtxt</a
      ><a name="10376"
      > </a
      ><a name="10377" class="Symbol"
      >{</a
      ><a name="10378" href="StlcProp.html#10378" class="Bound"
      >x</a
      ><a name="10379" class="Symbol"
      >}</a
      ><a name="10380"
      > </a
      ><a name="10381" class="Symbol"
      >(</a
      ><a name="10382" href="StlcProp.html#7056" class="InductiveConstructor"
      >abs</a
      ><a name="10385"
      > </a
      ><a name="10386" class="Symbol"
      >{</a
      ><a name="10387" href="StlcProp.html#10387" class="Bound"
      >y</a
      ><a name="10388" class="Symbol"
      >}</a
      ><a name="10389"
      > </a
      ><a name="10390" href="StlcProp.html#10390" class="Bound"
      >y&#8800;x</a
      ><a name="10393"
      > </a
      ><a name="10394" href="StlcProp.html#10394" class="Bound"
      >x&#8712;t</a
      ><a name="10397" class="Symbol"
      >)</a
      ><a name="10398"
      > </a
      ><a name="10399" class="Symbol"
      >(</a
      ><a name="10400" href="Stlc.html#19734" class="InductiveConstructor"
      >abs</a
      ><a name="10403"
      > </a
      ><a name="10404" href="StlcProp.html#10404" class="Bound"
      >t&#8758;B</a
      ><a name="10407" class="Symbol"
      >)</a
      ><a name="10408"
      >
    </a
      ><a name="10413" class="Keyword"
      >with</a
      ><a name="10417"
      > </a
      ><a name="10418" href="StlcProp.html#8308" class="Function"
      >freeInCtxt</a
      ><a name="10428"
      > </a
      ><a name="10429" href="StlcProp.html#10394" class="Bound"
      >x&#8712;t</a
      ><a name="10432"
      > </a
      ><a name="10433" href="StlcProp.html#10404" class="Bound"
      >t&#8758;B</a
      ><a name="10436"
      >
</a
      ><a name="10437" class="Symbol"
      >...</a
      ><a name="10440"
      > </a
      ><a name="10441" class="Symbol"
      >|</a
      ><a name="10442"
      > </a
      ><a name="10443" href="StlcProp.html#10443" class="Bound"
      >x&#8758;A</a
      ><a name="10446"
      >
    </a
      ><a name="10451" class="Keyword"
      >with</a
      ><a name="10455"
      > </a
      ><a name="10456" href="StlcProp.html#10387" class="Bound"
      >y</a
      ><a name="10457"
      > </a
      ><a name="10458" href="Stlc.html#5821" class="Function Operator"
      >&#8799;</a
      ><a name="10459"
      > </a
      ><a name="10460" href="StlcProp.html#10378" class="Bound"
      >x</a
      ><a name="10461"
      >
</a
      ><a name="10462" class="Symbol"
      >...</a
      ><a name="10465"
      > </a
      ><a name="10466" class="Symbol"
      >|</a
      ><a name="10467"
      > </a
      ><a name="10468" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="10471"
      > </a
      ><a name="10472" href="StlcProp.html#10472" class="Bound"
      >y=x</a
      ><a name="10475"
      > </a
      ><a name="10476" class="Symbol"
      >=</a
      ><a name="10477"
      > </a
      ><a name="10478" href="https://agda.github.io/agda-stdlib/Data.Empty.html#348" class="Function"
      >&#8869;-elim</a
      ><a name="10484"
      > </a
      ><a name="10485" class="Symbol"
      >(</a
      ><a name="10486" href="StlcProp.html#10390" class="Bound"
      >y&#8800;x</a
      ><a name="10489"
      > </a
      ><a name="10490" href="StlcProp.html#10472" class="Bound"
      >y=x</a
      ><a name="10493" class="Symbol"
      >)</a
      ><a name="10494"
      >
</a
      ><a name="10495" class="Symbol"
      >...</a
      ><a name="10498"
      > </a
      ><a name="10499" class="Symbol"
      >|</a
      ><a name="10500"
      > </a
      ><a name="10501" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="10503"
      >  </a
      ><a name="10505" class="Symbol"
      >_</a
      ><a name="10506"
      >   </a
      ><a name="10509" class="Symbol"
      >=</a
      ><a name="10510"
      > </a
      ><a name="10511" href="StlcProp.html#10443" class="Bound"
      >x&#8758;A</a
      >
{% endraw %}</pre>

Next, we'll need the fact that any term $$t$$ which is well typed in
the empty context is closed (it has no free variables).

#### Exercise: 2 stars, optional (∅⊢-closed)

<pre class="Agda">{% raw %}
<a name="10712" class="Keyword"
      >postulate</a
      ><a name="10721"
      >
  </a
      ><a name="10724" href="StlcProp.html#10724" class="Postulate"
      >&#8709;&#8866;-closed</a
      ><a name="10733"
      > </a
      ><a name="10734" class="Symbol"
      >:</a
      ><a name="10735"
      > </a
      ><a name="10736" class="Symbol"
      >&#8704;</a
      ><a name="10737"
      > </a
      ><a name="10738" class="Symbol"
      >{</a
      ><a name="10739" href="StlcProp.html#10739" class="Bound"
      >t</a
      ><a name="10740"
      > </a
      ><a name="10741" href="StlcProp.html#10741" class="Bound"
      >A</a
      ><a name="10742" class="Symbol"
      >}</a
      ><a name="10743"
      > </a
      ><a name="10744" class="Symbol"
      >&#8594;</a
      ><a name="10745"
      > </a
      ><a name="10746" href="Stlc.html#18626" class="Function"
      >&#8709;</a
      ><a name="10747"
      > </a
      ><a name="10748" href="Stlc.html#19597" class="Datatype Operator"
      >&#8866;</a
      ><a name="10749"
      > </a
      ><a name="10750" href="StlcProp.html#10739" class="Bound"
      >t</a
      ><a name="10751"
      > </a
      ><a name="10752" href="Stlc.html#19597" class="Datatype Operator"
      >&#8758;</a
      ><a name="10753"
      > </a
      ><a name="10754" href="StlcProp.html#10741" class="Bound"
      >A</a
      ><a name="10755"
      > </a
      ><a name="10756" class="Symbol"
      >&#8594;</a
      ><a name="10757"
      > </a
      ><a name="10758" href="StlcProp.html#7527" class="Function"
      >Closed</a
      ><a name="10764"
      > </a
      ><a name="10765" href="StlcProp.html#10739" class="Bound"
      >t</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="10813" href="StlcProp.html#10813" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="10823"
      > </a
      ><a name="10824" class="Symbol"
      >:</a
      ><a name="10825"
      > </a
      ><a name="10826" class="Symbol"
      >&#8704;</a
      ><a name="10827"
      > </a
      ><a name="10828" class="Symbol"
      >{</a
      ><a name="10829" href="StlcProp.html#10829" class="Bound"
      >t</a
      ><a name="10830"
      > </a
      ><a name="10831" href="StlcProp.html#10831" class="Bound"
      >A</a
      ><a name="10832" class="Symbol"
      >}</a
      ><a name="10833"
      > </a
      ><a name="10834" class="Symbol"
      >&#8594;</a
      ><a name="10835"
      > </a
      ><a name="10836" href="Stlc.html#18626" class="Function"
      >&#8709;</a
      ><a name="10837"
      > </a
      ><a name="10838" href="Stlc.html#19597" class="Datatype Operator"
      >&#8866;</a
      ><a name="10839"
      > </a
      ><a name="10840" href="StlcProp.html#10829" class="Bound"
      >t</a
      ><a name="10841"
      > </a
      ><a name="10842" href="Stlc.html#19597" class="Datatype Operator"
      >&#8758;</a
      ><a name="10843"
      > </a
      ><a name="10844" href="StlcProp.html#10831" class="Bound"
      >A</a
      ><a name="10845"
      > </a
      ><a name="10846" class="Symbol"
      >&#8594;</a
      ><a name="10847"
      > </a
      ><a name="10848" href="StlcProp.html#7527" class="Function"
      >Closed</a
      ><a name="10854"
      > </a
      ><a name="10855" href="StlcProp.html#10829" class="Bound"
      >t</a
      ><a name="10856"
      >
</a
      ><a name="10857" href="StlcProp.html#10813" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="10867"
      > </a
      ><a name="10868" class="Symbol"
      >(</a
      ><a name="10869" href="Stlc.html#19641" class="InductiveConstructor"
      >var</a
      ><a name="10872"
      > </a
      ><a name="10873" href="StlcProp.html#10873" class="Bound"
      >x</a
      ><a name="10874"
      > </a
      ><a name="10875" class="Symbol"
      >())</a
      ><a name="10878"
      >
</a
      ><a name="10879" href="StlcProp.html#10813" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="10889"
      > </a
      ><a name="10890" class="Symbol"
      >(</a
      ><a name="10891" href="Stlc.html#19850" class="InductiveConstructor"
      >app</a
      ><a name="10894"
      > </a
      ><a name="10895" href="StlcProp.html#10895" class="Bound"
      >t&#8321;&#8758;A&#8658;B</a
      ><a name="10901"
      > </a
      ><a name="10902" href="StlcProp.html#10902" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="10906" class="Symbol"
      >)</a
      ><a name="10907"
      > </a
      ><a name="10908" class="Symbol"
      >(</a
      ><a name="10909" href="StlcProp.html#7117" class="InductiveConstructor"
      >app1</a
      ><a name="10913"
      > </a
      ><a name="10914" href="StlcProp.html#10914" class="Bound"
      >x&#8712;t&#8321;</a
      ><a name="10918" class="Symbol"
      >)</a
      ><a name="10919"
      > </a
      ><a name="10920" class="Symbol"
      >=</a
      ><a name="10921"
      > </a
      ><a name="10922" href="StlcProp.html#10813" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="10932"
      > </a
      ><a name="10933" href="StlcProp.html#10895" class="Bound"
      >t&#8321;&#8758;A&#8658;B</a
      ><a name="10939"
      > </a
      ><a name="10940" href="StlcProp.html#10914" class="Bound"
      >x&#8712;t&#8321;</a
      ><a name="10944"
      >
</a
      ><a name="10945" href="StlcProp.html#10813" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="10955"
      > </a
      ><a name="10956" class="Symbol"
      >(</a
      ><a name="10957" href="Stlc.html#19850" class="InductiveConstructor"
      >app</a
      ><a name="10960"
      > </a
      ><a name="10961" href="StlcProp.html#10961" class="Bound"
      >t&#8321;&#8758;A&#8658;B</a
      ><a name="10967"
      > </a
      ><a name="10968" href="StlcProp.html#10968" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="10972" class="Symbol"
      >)</a
      ><a name="10973"
      > </a
      ><a name="10974" class="Symbol"
      >(</a
      ><a name="10975" href="StlcProp.html#7171" class="InductiveConstructor"
      >app2</a
      ><a name="10979"
      > </a
      ><a name="10980" href="StlcProp.html#10980" class="Bound"
      >x&#8712;t&#8322;</a
      ><a name="10984" class="Symbol"
      >)</a
      ><a name="10985"
      > </a
      ><a name="10986" class="Symbol"
      >=</a
      ><a name="10987"
      > </a
      ><a name="10988" href="StlcProp.html#10813" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="10998"
      > </a
      ><a name="10999" href="StlcProp.html#10968" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="11003"
      > </a
      ><a name="11004" href="StlcProp.html#10980" class="Bound"
      >x&#8712;t&#8322;</a
      ><a name="11008"
      >
</a
      ><a name="11009" href="StlcProp.html#10813" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11019"
      > </a
      ><a name="11020" href="Stlc.html#19984" class="InductiveConstructor"
      >true</a
      ><a name="11024"
      >  </a
      ><a name="11026" class="Symbol"
      >()</a
      ><a name="11028"
      >
</a
      ><a name="11029" href="StlcProp.html#10813" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11039"
      > </a
      ><a name="11040" href="Stlc.html#20043" class="InductiveConstructor"
      >false</a
      ><a name="11045"
      > </a
      ><a name="11046" class="Symbol"
      >()</a
      ><a name="11048"
      >
</a
      ><a name="11049" href="StlcProp.html#10813" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11059"
      > </a
      ><a name="11060" class="Symbol"
      >(</a
      ><a name="11061" href="Stlc.html#20102" class="InductiveConstructor Operator"
      >if</a
      ><a name="11063"
      > </a
      ><a name="11064" href="StlcProp.html#11064" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="11071"
      > </a
      ><a name="11072" href="Stlc.html#20102" class="InductiveConstructor Operator"
      >then</a
      ><a name="11076"
      > </a
      ><a name="11077" href="StlcProp.html#11077" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="11081"
      > </a
      ><a name="11082" href="Stlc.html#20102" class="InductiveConstructor Operator"
      >else</a
      ><a name="11086"
      > </a
      ><a name="11087" href="StlcProp.html#11087" class="Bound"
      >t&#8323;&#8758;A</a
      ><a name="11091" class="Symbol"
      >)</a
      ><a name="11092"
      > </a
      ><a name="11093" class="Symbol"
      >(</a
      ><a name="11094" href="StlcProp.html#7225" class="InductiveConstructor"
      >if1</a
      ><a name="11097"
      > </a
      ><a name="11098" href="StlcProp.html#11098" class="Bound"
      >x&#8712;t&#8321;</a
      ><a name="11102" class="Symbol"
      >)</a
      ><a name="11103"
      > </a
      ><a name="11104" class="Symbol"
      >=</a
      ><a name="11105"
      > </a
      ><a name="11106" href="StlcProp.html#10813" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11116"
      > </a
      ><a name="11117" href="StlcProp.html#11064" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="11124"
      > </a
      ><a name="11125" href="StlcProp.html#11098" class="Bound"
      >x&#8712;t&#8321;</a
      ><a name="11129"
      >
</a
      ><a name="11130" href="StlcProp.html#10813" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11140"
      > </a
      ><a name="11141" class="Symbol"
      >(</a
      ><a name="11142" href="Stlc.html#20102" class="InductiveConstructor Operator"
      >if</a
      ><a name="11144"
      > </a
      ><a name="11145" href="StlcProp.html#11145" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="11152"
      > </a
      ><a name="11153" href="Stlc.html#20102" class="InductiveConstructor Operator"
      >then</a
      ><a name="11157"
      > </a
      ><a name="11158" href="StlcProp.html#11158" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="11162"
      > </a
      ><a name="11163" href="Stlc.html#20102" class="InductiveConstructor Operator"
      >else</a
      ><a name="11167"
      > </a
      ><a name="11168" href="StlcProp.html#11168" class="Bound"
      >t&#8323;&#8758;A</a
      ><a name="11172" class="Symbol"
      >)</a
      ><a name="11173"
      > </a
      ><a name="11174" class="Symbol"
      >(</a
      ><a name="11175" href="StlcProp.html#7296" class="InductiveConstructor"
      >if2</a
      ><a name="11178"
      > </a
      ><a name="11179" href="StlcProp.html#11179" class="Bound"
      >x&#8712;t&#8322;</a
      ><a name="11183" class="Symbol"
      >)</a
      ><a name="11184"
      > </a
      ><a name="11185" class="Symbol"
      >=</a
      ><a name="11186"
      > </a
      ><a name="11187" href="StlcProp.html#10813" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11197"
      > </a
      ><a name="11198" href="StlcProp.html#11158" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="11202"
      > </a
      ><a name="11203" href="StlcProp.html#11179" class="Bound"
      >x&#8712;t&#8322;</a
      ><a name="11207"
      >
</a
      ><a name="11208" href="StlcProp.html#10813" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11218"
      > </a
      ><a name="11219" class="Symbol"
      >(</a
      ><a name="11220" href="Stlc.html#20102" class="InductiveConstructor Operator"
      >if</a
      ><a name="11222"
      > </a
      ><a name="11223" href="StlcProp.html#11223" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="11230"
      > </a
      ><a name="11231" href="Stlc.html#20102" class="InductiveConstructor Operator"
      >then</a
      ><a name="11235"
      > </a
      ><a name="11236" href="StlcProp.html#11236" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="11240"
      > </a
      ><a name="11241" href="Stlc.html#20102" class="InductiveConstructor Operator"
      >else</a
      ><a name="11245"
      > </a
      ><a name="11246" href="StlcProp.html#11246" class="Bound"
      >t&#8323;&#8758;A</a
      ><a name="11250" class="Symbol"
      >)</a
      ><a name="11251"
      > </a
      ><a name="11252" class="Symbol"
      >(</a
      ><a name="11253" href="StlcProp.html#7367" class="InductiveConstructor"
      >if3</a
      ><a name="11256"
      > </a
      ><a name="11257" href="StlcProp.html#11257" class="Bound"
      >x&#8712;t&#8323;</a
      ><a name="11261" class="Symbol"
      >)</a
      ><a name="11262"
      > </a
      ><a name="11263" class="Symbol"
      >=</a
      ><a name="11264"
      > </a
      ><a name="11265" href="StlcProp.html#10813" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11275"
      > </a
      ><a name="11276" href="StlcProp.html#11246" class="Bound"
      >t&#8323;&#8758;A</a
      ><a name="11280"
      > </a
      ><a name="11281" href="StlcProp.html#11257" class="Bound"
      >x&#8712;t&#8323;</a
      ><a name="11285"
      >
</a
      ><a name="11286" href="StlcProp.html#10813" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11296"
      > </a
      ><a name="11297" class="Symbol"
      >(</a
      ><a name="11298" href="Stlc.html#19734" class="InductiveConstructor"
      >abs</a
      ><a name="11301"
      > </a
      ><a name="11302" class="Symbol"
      >{</a
      ><a name="11303" class="Argument"
      >x</a
      ><a name="11304"
      > </a
      ><a name="11305" class="Symbol"
      >=</a
      ><a name="11306"
      > </a
      ><a name="11307" href="StlcProp.html#11307" class="Bound"
      >x</a
      ><a name="11308" class="Symbol"
      >}</a
      ><a name="11309"
      > </a
      ><a name="11310" href="StlcProp.html#11310" class="Bound"
      >t&#8242;&#8758;A</a
      ><a name="11314" class="Symbol"
      >)</a
      ><a name="11315"
      > </a
      ><a name="11316" class="Symbol"
      >{</a
      ><a name="11317" href="StlcProp.html#11317" class="Bound"
      >y</a
      ><a name="11318" class="Symbol"
      >}</a
      ><a name="11319"
      > </a
      ><a name="11320" class="Symbol"
      >(</a
      ><a name="11321" href="StlcProp.html#7056" class="InductiveConstructor"
      >abs</a
      ><a name="11324"
      > </a
      ><a name="11325" href="StlcProp.html#11325" class="Bound"
      >x&#8800;y</a
      ><a name="11328"
      > </a
      ><a name="11329" href="StlcProp.html#11329" class="Bound"
      >y&#8712;t&#8242;</a
      ><a name="11333" class="Symbol"
      >)</a
      ><a name="11334"
      > </a
      ><a name="11335" class="Keyword"
      >with</a
      ><a name="11339"
      > </a
      ><a name="11340" href="StlcProp.html#8308" class="Function"
      >freeInCtxt</a
      ><a name="11350"
      > </a
      ><a name="11351" href="StlcProp.html#11329" class="Bound"
      >y&#8712;t&#8242;</a
      ><a name="11355"
      > </a
      ><a name="11356" href="StlcProp.html#11310" class="Bound"
      >t&#8242;&#8758;A</a
      ><a name="11360"
      >
</a
      ><a name="11361" href="StlcProp.html#10813" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11371"
      > </a
      ><a name="11372" class="Symbol"
      >(</a
      ><a name="11373" class="InductiveConstructor"
      >abs</a
      ><a name="11376"
      > </a
      ><a name="11377" class="Symbol"
      >{</a
      ><a name="11378" class="Argument"
      >x</a
      ><a name="11379"
      > </a
      ><a name="11380" class="Symbol"
      >=</a
      ><a name="11381"
      > </a
      ><a name="11382" href="StlcProp.html#11382" class="Bound"
      >x</a
      ><a name="11383" class="Symbol"
      >}</a
      ><a name="11384"
      > </a
      ><a name="11385" href="StlcProp.html#11385" class="Bound"
      >t&#8242;&#8758;A</a
      ><a name="11389" class="Symbol"
      >)</a
      ><a name="11390"
      > </a
      ><a name="11391" class="Symbol"
      >{</a
      ><a name="11392" href="StlcProp.html#11392" class="Bound"
      >y</a
      ><a name="11393" class="Symbol"
      >}</a
      ><a name="11394"
      > </a
      ><a name="11395" class="Symbol"
      >(</a
      ><a name="11396" class="InductiveConstructor"
      >abs</a
      ><a name="11399"
      > </a
      ><a name="11400" href="StlcProp.html#11400" class="Bound"
      >x&#8800;y</a
      ><a name="11403"
      > </a
      ><a name="11404" href="StlcProp.html#11404" class="Bound"
      >y&#8712;t&#8242;</a
      ><a name="11408" class="Symbol"
      >)</a
      ><a name="11409"
      > </a
      ><a name="11410" class="Symbol"
      >|</a
      ><a name="11411"
      > </a
      ><a name="11412" href="StlcProp.html#11412" class="Bound"
      >A</a
      ><a name="11413"
      > </a
      ><a name="11414" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="11415"
      > </a
      ><a name="11416" href="StlcProp.html#11416" class="Bound"
      >y&#8758;A</a
      ><a name="11419"
      > </a
      ><a name="11420" class="Keyword"
      >with</a
      ><a name="11424"
      > </a
      ><a name="11425" href="StlcProp.html#11382" class="Bound"
      >x</a
      ><a name="11426"
      > </a
      ><a name="11427" href="Stlc.html#5821" class="Function Operator"
      >&#8799;</a
      ><a name="11428"
      > </a
      ><a name="11429" href="StlcProp.html#11392" class="Bound"
      >y</a
      ><a name="11430"
      >
</a
      ><a name="11431" href="StlcProp.html#10813" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11441"
      > </a
      ><a name="11442" class="Symbol"
      >(</a
      ><a name="11443" class="InductiveConstructor"
      >abs</a
      ><a name="11446"
      > </a
      ><a name="11447" class="Symbol"
      >{</a
      ><a name="11448" class="Argument"
      >x</a
      ><a name="11449"
      > </a
      ><a name="11450" class="Symbol"
      >=</a
      ><a name="11451"
      > </a
      ><a name="11452" href="StlcProp.html#11452" class="Bound"
      >x</a
      ><a name="11453" class="Symbol"
      >}</a
      ><a name="11454"
      > </a
      ><a name="11455" href="StlcProp.html#11455" class="Bound"
      >t&#8242;&#8758;A</a
      ><a name="11459" class="Symbol"
      >)</a
      ><a name="11460"
      > </a
      ><a name="11461" class="Symbol"
      >{</a
      ><a name="11462" href="StlcProp.html#11462" class="Bound"
      >y</a
      ><a name="11463" class="Symbol"
      >}</a
      ><a name="11464"
      > </a
      ><a name="11465" class="Symbol"
      >(</a
      ><a name="11466" class="InductiveConstructor"
      >abs</a
      ><a name="11469"
      > </a
      ><a name="11470" href="StlcProp.html#11470" class="Bound"
      >x&#8800;y</a
      ><a name="11473"
      > </a
      ><a name="11474" href="StlcProp.html#11474" class="Bound"
      >y&#8712;t&#8242;</a
      ><a name="11478" class="Symbol"
      >)</a
      ><a name="11479"
      > </a
      ><a name="11480" class="Symbol"
      >|</a
      ><a name="11481"
      > </a
      ><a name="11482" href="StlcProp.html#11482" class="Bound"
      >A</a
      ><a name="11483"
      > </a
      ><a name="11484" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="11485"
      > </a
      ><a name="11486" href="StlcProp.html#11486" class="Bound"
      >y&#8758;A</a
      ><a name="11489"
      > </a
      ><a name="11490" class="Symbol"
      >|</a
      ><a name="11491"
      > </a
      ><a name="11492" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="11495"
      > </a
      ><a name="11496" href="StlcProp.html#11496" class="Bound"
      >x=y</a
      ><a name="11499"
      > </a
      ><a name="11500" class="Symbol"
      >=</a
      ><a name="11501"
      > </a
      ><a name="11502" href="StlcProp.html#11470" class="Bound"
      >x&#8800;y</a
      ><a name="11505"
      > </a
      ><a name="11506" href="StlcProp.html#11496" class="Bound"
      >x=y</a
      ><a name="11509"
      >
</a
      ><a name="11510" href="StlcProp.html#10813" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11520"
      > </a
      ><a name="11521" class="Symbol"
      >(</a
      ><a name="11522" class="InductiveConstructor"
      >abs</a
      ><a name="11525"
      > </a
      ><a name="11526" class="Symbol"
      >{</a
      ><a name="11527" class="Argument"
      >x</a
      ><a name="11528"
      > </a
      ><a name="11529" class="Symbol"
      >=</a
      ><a name="11530"
      > </a
      ><a name="11531" href="StlcProp.html#11531" class="Bound"
      >x</a
      ><a name="11532" class="Symbol"
      >}</a
      ><a name="11533"
      > </a
      ><a name="11534" href="StlcProp.html#11534" class="Bound"
      >t&#8242;&#8758;A</a
      ><a name="11538" class="Symbol"
      >)</a
      ><a name="11539"
      > </a
      ><a name="11540" class="Symbol"
      >{</a
      ><a name="11541" href="StlcProp.html#11541" class="Bound"
      >y</a
      ><a name="11542" class="Symbol"
      >}</a
      ><a name="11543"
      > </a
      ><a name="11544" class="Symbol"
      >(</a
      ><a name="11545" class="InductiveConstructor"
      >abs</a
      ><a name="11548"
      > </a
      ><a name="11549" href="StlcProp.html#11549" class="Bound"
      >x&#8800;y</a
      ><a name="11552"
      > </a
      ><a name="11553" href="StlcProp.html#11553" class="Bound"
      >y&#8712;t&#8242;</a
      ><a name="11557" class="Symbol"
      >)</a
      ><a name="11558"
      > </a
      ><a name="11559" class="Symbol"
      >|</a
      ><a name="11560"
      > </a
      ><a name="11561" href="StlcProp.html#11561" class="Bound"
      >A</a
      ><a name="11562"
      > </a
      ><a name="11563" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="11564"
      > </a
      ><a name="11565" class="Symbol"
      >()</a
      ><a name="11567"
      >  </a
      ><a name="11569" class="Symbol"
      >|</a
      ><a name="11570"
      > </a
      ><a name="11571" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="11573"
      >  </a
      ><a name="11575" class="Symbol"
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
<a name="11963" href="StlcProp.html#11963" class="Function"
      >replaceCtxt</a
      ><a name="11974"
      > </a
      ><a name="11975" class="Symbol"
      >:</a
      ><a name="11976"
      > </a
      ><a name="11977" class="Symbol"
      >&#8704;</a
      ><a name="11978"
      > </a
      ><a name="11979" class="Symbol"
      >{</a
      ><a name="11980" href="StlcProp.html#11980" class="Bound"
      >&#915;</a
      ><a name="11981"
      > </a
      ><a name="11982" href="StlcProp.html#11982" class="Bound"
      >&#915;&#8242;</a
      ><a name="11984"
      > </a
      ><a name="11985" href="StlcProp.html#11985" class="Bound"
      >t</a
      ><a name="11986"
      > </a
      ><a name="11987" href="StlcProp.html#11987" class="Bound"
      >A</a
      ><a name="11988" class="Symbol"
      >}</a
      ><a name="11989"
      >
            </a
      ><a name="12002" class="Symbol"
      >&#8594;</a
      ><a name="12003"
      > </a
      ><a name="12004" class="Symbol"
      >(&#8704;</a
      ><a name="12006"
      > </a
      ><a name="12007" class="Symbol"
      >{</a
      ><a name="12008" href="StlcProp.html#12008" class="Bound"
      >x</a
      ><a name="12009" class="Symbol"
      >}</a
      ><a name="12010"
      > </a
      ><a name="12011" class="Symbol"
      >&#8594;</a
      ><a name="12012"
      > </a
      ><a name="12013" href="StlcProp.html#12008" class="Bound"
      >x</a
      ><a name="12014"
      > </a
      ><a name="12015" href="StlcProp.html#6993" class="Datatype Operator"
      >FreeIn</a
      ><a name="12021"
      > </a
      ><a name="12022" href="StlcProp.html#11985" class="Bound"
      >t</a
      ><a name="12023"
      > </a
      ><a name="12024" class="Symbol"
      >&#8594;</a
      ><a name="12025"
      > </a
      ><a name="12026" href="StlcProp.html#11980" class="Bound"
      >&#915;</a
      ><a name="12027"
      > </a
      ><a name="12028" href="StlcProp.html#12008" class="Bound"
      >x</a
      ><a name="12029"
      > </a
      ><a name="12030" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="12031"
      > </a
      ><a name="12032" href="StlcProp.html#11982" class="Bound"
      >&#915;&#8242;</a
      ><a name="12034"
      > </a
      ><a name="12035" href="StlcProp.html#12008" class="Bound"
      >x</a
      ><a name="12036" class="Symbol"
      >)</a
      ><a name="12037"
      >
            </a
      ><a name="12050" class="Symbol"
      >&#8594;</a
      ><a name="12051"
      > </a
      ><a name="12052" href="StlcProp.html#11980" class="Bound"
      >&#915;</a
      ><a name="12053"
      >  </a
      ><a name="12055" href="Stlc.html#19597" class="Datatype Operator"
      >&#8866;</a
      ><a name="12056"
      > </a
      ><a name="12057" href="StlcProp.html#11985" class="Bound"
      >t</a
      ><a name="12058"
      > </a
      ><a name="12059" href="Stlc.html#19597" class="Datatype Operator"
      >&#8758;</a
      ><a name="12060"
      > </a
      ><a name="12061" href="StlcProp.html#11987" class="Bound"
      >A</a
      ><a name="12062"
      >
            </a
      ><a name="12075" class="Symbol"
      >&#8594;</a
      ><a name="12076"
      > </a
      ><a name="12077" href="StlcProp.html#11982" class="Bound"
      >&#915;&#8242;</a
      ><a name="12079"
      > </a
      ><a name="12080" href="Stlc.html#19597" class="Datatype Operator"
      >&#8866;</a
      ><a name="12081"
      > </a
      ><a name="12082" href="StlcProp.html#11985" class="Bound"
      >t</a
      ><a name="12083"
      > </a
      ><a name="12084" href="Stlc.html#19597" class="Datatype Operator"
      >&#8758;</a
      ><a name="12085"
      > </a
      ><a name="12086" href="StlcProp.html#11987" class="Bound"
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
<a name="14391" href="StlcProp.html#11963" class="Function"
      >replaceCtxt</a
      ><a name="14402"
      > </a
      ><a name="14403" href="StlcProp.html#14403" class="Bound"
      >f</a
      ><a name="14404"
      > </a
      ><a name="14405" class="Symbol"
      >(</a
      ><a name="14406" href="Stlc.html#19641" class="InductiveConstructor"
      >var</a
      ><a name="14409"
      > </a
      ><a name="14410" href="StlcProp.html#14410" class="Bound"
      >x</a
      ><a name="14411"
      > </a
      ><a name="14412" href="StlcProp.html#14412" class="Bound"
      >x&#8758;A</a
      ><a name="14415" class="Symbol"
      >)</a
      ><a name="14416"
      > </a
      ><a name="14417" class="Keyword"
      >rewrite</a
      ><a name="14424"
      > </a
      ><a name="14425" href="StlcProp.html#14403" class="Bound"
      >f</a
      ><a name="14426"
      > </a
      ><a name="14427" href="StlcProp.html#7032" class="InductiveConstructor"
      >var</a
      ><a name="14430"
      > </a
      ><a name="14431" class="Symbol"
      >=</a
      ><a name="14432"
      > </a
      ><a name="14433" href="Stlc.html#19641" class="InductiveConstructor"
      >var</a
      ><a name="14436"
      > </a
      ><a name="14437" href="StlcProp.html#14410" class="Bound"
      >x</a
      ><a name="14438"
      > </a
      ><a name="14439" href="StlcProp.html#14412" class="Bound"
      >x&#8758;A</a
      ><a name="14442"
      >
</a
      ><a name="14443" href="StlcProp.html#11963" class="Function"
      >replaceCtxt</a
      ><a name="14454"
      > </a
      ><a name="14455" href="StlcProp.html#14455" class="Bound"
      >f</a
      ><a name="14456"
      > </a
      ><a name="14457" class="Symbol"
      >(</a
      ><a name="14458" href="Stlc.html#19850" class="InductiveConstructor"
      >app</a
      ><a name="14461"
      > </a
      ><a name="14462" href="StlcProp.html#14462" class="Bound"
      >t&#8321;&#8758;A&#8658;B</a
      ><a name="14468"
      > </a
      ><a name="14469" href="StlcProp.html#14469" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="14473" class="Symbol"
      >)</a
      ><a name="14474"
      >
  </a
      ><a name="14477" class="Symbol"
      >=</a
      ><a name="14478"
      > </a
      ><a name="14479" href="Stlc.html#19850" class="InductiveConstructor"
      >app</a
      ><a name="14482"
      > </a
      ><a name="14483" class="Symbol"
      >(</a
      ><a name="14484" href="StlcProp.html#11963" class="Function"
      >replaceCtxt</a
      ><a name="14495"
      > </a
      ><a name="14496" class="Symbol"
      >(</a
      ><a name="14497" href="StlcProp.html#14455" class="Bound"
      >f</a
      ><a name="14498"
      > </a
      ><a name="14499" href="https://agda.github.io/agda-stdlib/Function.html#713" class="Function Operator"
      >&#8728;</a
      ><a name="14500"
      > </a
      ><a name="14501" href="StlcProp.html#7117" class="InductiveConstructor"
      >app1</a
      ><a name="14505" class="Symbol"
      >)</a
      ><a name="14506"
      > </a
      ><a name="14507" href="StlcProp.html#14462" class="Bound"
      >t&#8321;&#8758;A&#8658;B</a
      ><a name="14513" class="Symbol"
      >)</a
      ><a name="14514"
      > </a
      ><a name="14515" class="Symbol"
      >(</a
      ><a name="14516" href="StlcProp.html#11963" class="Function"
      >replaceCtxt</a
      ><a name="14527"
      > </a
      ><a name="14528" class="Symbol"
      >(</a
      ><a name="14529" href="StlcProp.html#14455" class="Bound"
      >f</a
      ><a name="14530"
      > </a
      ><a name="14531" href="https://agda.github.io/agda-stdlib/Function.html#713" class="Function Operator"
      >&#8728;</a
      ><a name="14532"
      > </a
      ><a name="14533" href="StlcProp.html#7171" class="InductiveConstructor"
      >app2</a
      ><a name="14537" class="Symbol"
      >)</a
      ><a name="14538"
      > </a
      ><a name="14539" href="StlcProp.html#14469" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="14543" class="Symbol"
      >)</a
      ><a name="14544"
      >
</a
      ><a name="14545" href="StlcProp.html#11963" class="Function"
      >replaceCtxt</a
      ><a name="14556"
      > </a
      ><a name="14557" class="Symbol"
      >{</a
      ><a name="14558" href="StlcProp.html#14558" class="Bound"
      >&#915;</a
      ><a name="14559" class="Symbol"
      >}</a
      ><a name="14560"
      > </a
      ><a name="14561" class="Symbol"
      >{</a
      ><a name="14562" href="StlcProp.html#14562" class="Bound"
      >&#915;&#8242;</a
      ><a name="14564" class="Symbol"
      >}</a
      ><a name="14565"
      > </a
      ><a name="14566" href="StlcProp.html#14566" class="Bound"
      >f</a
      ><a name="14567"
      > </a
      ><a name="14568" class="Symbol"
      >(</a
      ><a name="14569" href="Stlc.html#19734" class="InductiveConstructor"
      >abs</a
      ><a name="14572"
      > </a
      ><a name="14573" class="Symbol"
      >{</a
      ><a name="14574" class="DottedPattern Symbol"
      >.</a
      ><a name="14575" href="StlcProp.html#14558" class="DottedPattern Bound"
      >&#915;</a
      ><a name="14576" class="Symbol"
      >}</a
      ><a name="14577"
      > </a
      ><a name="14578" class="Symbol"
      >{</a
      ><a name="14579" href="StlcProp.html#14579" class="Bound"
      >x</a
      ><a name="14580" class="Symbol"
      >}</a
      ><a name="14581"
      > </a
      ><a name="14582" class="Symbol"
      >{</a
      ><a name="14583" href="StlcProp.html#14583" class="Bound"
      >A</a
      ><a name="14584" class="Symbol"
      >}</a
      ><a name="14585"
      > </a
      ><a name="14586" class="Symbol"
      >{</a
      ><a name="14587" href="StlcProp.html#14587" class="Bound"
      >B</a
      ><a name="14588" class="Symbol"
      >}</a
      ><a name="14589"
      > </a
      ><a name="14590" class="Symbol"
      >{</a
      ><a name="14591" href="StlcProp.html#14591" class="Bound"
      >t&#8242;</a
      ><a name="14593" class="Symbol"
      >}</a
      ><a name="14594"
      > </a
      ><a name="14595" href="StlcProp.html#14595" class="Bound"
      >t&#8242;&#8758;B</a
      ><a name="14599" class="Symbol"
      >)</a
      ><a name="14600"
      >
  </a
      ><a name="14603" class="Symbol"
      >=</a
      ><a name="14604"
      > </a
      ><a name="14605" href="Stlc.html#19734" class="InductiveConstructor"
      >abs</a
      ><a name="14608"
      > </a
      ><a name="14609" class="Symbol"
      >(</a
      ><a name="14610" href="StlcProp.html#11963" class="Function"
      >replaceCtxt</a
      ><a name="14621"
      > </a
      ><a name="14622" href="StlcProp.html#14643" class="Function"
      >f&#8242;</a
      ><a name="14624"
      > </a
      ><a name="14625" href="StlcProp.html#14595" class="Bound"
      >t&#8242;&#8758;B</a
      ><a name="14629" class="Symbol"
      >)</a
      ><a name="14630"
      >
  </a
      ><a name="14633" class="Keyword"
      >where</a
      ><a name="14638"
      >
    </a
      ><a name="14643" href="StlcProp.html#14643" class="Function"
      >f&#8242;</a
      ><a name="14645"
      > </a
      ><a name="14646" class="Symbol"
      >:</a
      ><a name="14647"
      > </a
      ><a name="14648" class="Symbol"
      >&#8704;</a
      ><a name="14649"
      > </a
      ><a name="14650" class="Symbol"
      >{</a
      ><a name="14651" href="StlcProp.html#14651" class="Bound"
      >y</a
      ><a name="14652" class="Symbol"
      >}</a
      ><a name="14653"
      > </a
      ><a name="14654" class="Symbol"
      >&#8594;</a
      ><a name="14655"
      > </a
      ><a name="14656" href="StlcProp.html#14651" class="Bound"
      >y</a
      ><a name="14657"
      > </a
      ><a name="14658" href="StlcProp.html#6993" class="Datatype Operator"
      >FreeIn</a
      ><a name="14664"
      > </a
      ><a name="14665" href="StlcProp.html#14591" class="Bound"
      >t&#8242;</a
      ><a name="14667"
      > </a
      ><a name="14668" class="Symbol"
      >&#8594;</a
      ><a name="14669"
      > </a
      ><a name="14670" class="Symbol"
      >(</a
      ><a name="14671" href="StlcProp.html#14558" class="Bound"
      >&#915;</a
      ><a name="14672"
      > </a
      ><a name="14673" href="Stlc.html#18654" class="Function Operator"
      >,</a
      ><a name="14674"
      > </a
      ><a name="14675" href="StlcProp.html#14579" class="Bound"
      >x</a
      ><a name="14676"
      > </a
      ><a name="14677" href="Stlc.html#18654" class="Function Operator"
      >&#8758;</a
      ><a name="14678"
      > </a
      ><a name="14679" href="StlcProp.html#14583" class="Bound"
      >A</a
      ><a name="14680" class="Symbol"
      >)</a
      ><a name="14681"
      > </a
      ><a name="14682" href="StlcProp.html#14651" class="Bound"
      >y</a
      ><a name="14683"
      > </a
      ><a name="14684" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="14685"
      > </a
      ><a name="14686" class="Symbol"
      >(</a
      ><a name="14687" href="StlcProp.html#14562" class="Bound"
      >&#915;&#8242;</a
      ><a name="14689"
      > </a
      ><a name="14690" href="Stlc.html#18654" class="Function Operator"
      >,</a
      ><a name="14691"
      > </a
      ><a name="14692" href="StlcProp.html#14579" class="Bound"
      >x</a
      ><a name="14693"
      > </a
      ><a name="14694" href="Stlc.html#18654" class="Function Operator"
      >&#8758;</a
      ><a name="14695"
      > </a
      ><a name="14696" href="StlcProp.html#14583" class="Bound"
      >A</a
      ><a name="14697" class="Symbol"
      >)</a
      ><a name="14698"
      > </a
      ><a name="14699" href="StlcProp.html#14651" class="Bound"
      >y</a
      ><a name="14700"
      >
    </a
      ><a name="14705" href="StlcProp.html#14643" class="Function"
      >f&#8242;</a
      ><a name="14707"
      > </a
      ><a name="14708" class="Symbol"
      >{</a
      ><a name="14709" href="StlcProp.html#14709" class="Bound"
      >y</a
      ><a name="14710" class="Symbol"
      >}</a
      ><a name="14711"
      > </a
      ><a name="14712" href="StlcProp.html#14712" class="Bound"
      >y&#8712;t&#8242;</a
      ><a name="14716"
      > </a
      ><a name="14717" class="Keyword"
      >with</a
      ><a name="14721"
      > </a
      ><a name="14722" href="StlcProp.html#14579" class="Bound"
      >x</a
      ><a name="14723"
      > </a
      ><a name="14724" href="Stlc.html#5821" class="Function Operator"
      >&#8799;</a
      ><a name="14725"
      > </a
      ><a name="14726" href="StlcProp.html#14709" class="Bound"
      >y</a
      ><a name="14727"
      >
    </a
      ><a name="14732" class="Symbol"
      >...</a
      ><a name="14735"
      > </a
      ><a name="14736" class="Symbol"
      >|</a
      ><a name="14737"
      > </a
      ><a name="14738" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="14741"
      > </a
      ><a name="14742" class="Symbol"
      >_</a
      ><a name="14743"
      >   </a
      ><a name="14746" class="Symbol"
      >=</a
      ><a name="14747"
      > </a
      ><a name="14748" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="14752"
      >
    </a
      ><a name="14757" class="Symbol"
      >...</a
      ><a name="14760"
      > </a
      ><a name="14761" class="Symbol"
      >|</a
      ><a name="14762"
      > </a
      ><a name="14763" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="14765"
      >  </a
      ><a name="14767" href="StlcProp.html#14767" class="Bound"
      >x&#8800;y</a
      ><a name="14770"
      > </a
      ><a name="14771" class="Symbol"
      >=</a
      ><a name="14772"
      > </a
      ><a name="14773" href="StlcProp.html#14566" class="Bound"
      >f</a
      ><a name="14774"
      > </a
      ><a name="14775" class="Symbol"
      >(</a
      ><a name="14776" href="StlcProp.html#7056" class="InductiveConstructor"
      >abs</a
      ><a name="14779"
      > </a
      ><a name="14780" href="StlcProp.html#14767" class="Bound"
      >x&#8800;y</a
      ><a name="14783"
      > </a
      ><a name="14784" href="StlcProp.html#14712" class="Bound"
      >y&#8712;t&#8242;</a
      ><a name="14788" class="Symbol"
      >)</a
      ><a name="14789"
      >
</a
      ><a name="14790" href="StlcProp.html#11963" class="Function"
      >replaceCtxt</a
      ><a name="14801"
      > </a
      ><a name="14802" class="Symbol"
      >_</a
      ><a name="14803"
      > </a
      ><a name="14804" href="Stlc.html#19984" class="InductiveConstructor"
      >true</a
      ><a name="14808"
      >  </a
      ><a name="14810" class="Symbol"
      >=</a
      ><a name="14811"
      > </a
      ><a name="14812" href="Stlc.html#19984" class="InductiveConstructor"
      >true</a
      ><a name="14816"
      >
</a
      ><a name="14817" href="StlcProp.html#11963" class="Function"
      >replaceCtxt</a
      ><a name="14828"
      > </a
      ><a name="14829" class="Symbol"
      >_</a
      ><a name="14830"
      > </a
      ><a name="14831" href="Stlc.html#20043" class="InductiveConstructor"
      >false</a
      ><a name="14836"
      > </a
      ><a name="14837" class="Symbol"
      >=</a
      ><a name="14838"
      > </a
      ><a name="14839" href="Stlc.html#20043" class="InductiveConstructor"
      >false</a
      ><a name="14844"
      >
</a
      ><a name="14845" href="StlcProp.html#11963" class="Function"
      >replaceCtxt</a
      ><a name="14856"
      > </a
      ><a name="14857" href="StlcProp.html#14857" class="Bound"
      >f</a
      ><a name="14858"
      > </a
      ><a name="14859" class="Symbol"
      >(</a
      ><a name="14860" href="Stlc.html#20102" class="InductiveConstructor Operator"
      >if</a
      ><a name="14862"
      > </a
      ><a name="14863" href="StlcProp.html#14863" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="14870"
      > </a
      ><a name="14871" href="Stlc.html#20102" class="InductiveConstructor Operator"
      >then</a
      ><a name="14875"
      > </a
      ><a name="14876" href="StlcProp.html#14876" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="14880"
      > </a
      ><a name="14881" href="Stlc.html#20102" class="InductiveConstructor Operator"
      >else</a
      ><a name="14885"
      > </a
      ><a name="14886" href="StlcProp.html#14886" class="Bound"
      >t&#8323;&#8758;A</a
      ><a name="14890" class="Symbol"
      >)</a
      ><a name="14891"
      >
  </a
      ><a name="14894" class="Symbol"
      >=</a
      ><a name="14895"
      > </a
      ><a name="14896" href="Stlc.html#20102" class="InductiveConstructor Operator"
      >if</a
      ><a name="14898"
      >   </a
      ><a name="14901" href="StlcProp.html#11963" class="Function"
      >replaceCtxt</a
      ><a name="14912"
      > </a
      ><a name="14913" class="Symbol"
      >(</a
      ><a name="14914" href="StlcProp.html#14857" class="Bound"
      >f</a
      ><a name="14915"
      > </a
      ><a name="14916" href="https://agda.github.io/agda-stdlib/Function.html#713" class="Function Operator"
      >&#8728;</a
      ><a name="14917"
      > </a
      ><a name="14918" href="StlcProp.html#7225" class="InductiveConstructor"
      >if1</a
      ><a name="14921" class="Symbol"
      >)</a
      ><a name="14922"
      > </a
      ><a name="14923" href="StlcProp.html#14863" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="14930"
      >
    </a
      ><a name="14935" href="Stlc.html#20102" class="InductiveConstructor Operator"
      >then</a
      ><a name="14939"
      > </a
      ><a name="14940" href="StlcProp.html#11963" class="Function"
      >replaceCtxt</a
      ><a name="14951"
      > </a
      ><a name="14952" class="Symbol"
      >(</a
      ><a name="14953" href="StlcProp.html#14857" class="Bound"
      >f</a
      ><a name="14954"
      > </a
      ><a name="14955" href="https://agda.github.io/agda-stdlib/Function.html#713" class="Function Operator"
      >&#8728;</a
      ><a name="14956"
      > </a
      ><a name="14957" href="StlcProp.html#7296" class="InductiveConstructor"
      >if2</a
      ><a name="14960" class="Symbol"
      >)</a
      ><a name="14961"
      > </a
      ><a name="14962" href="StlcProp.html#14876" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="14966"
      >
    </a
      ><a name="14971" href="Stlc.html#20102" class="InductiveConstructor Operator"
      >else</a
      ><a name="14975"
      > </a
      ><a name="14976" href="StlcProp.html#11963" class="Function"
      >replaceCtxt</a
      ><a name="14987"
      > </a
      ><a name="14988" class="Symbol"
      >(</a
      ><a name="14989" href="StlcProp.html#14857" class="Bound"
      >f</a
      ><a name="14990"
      > </a
      ><a name="14991" href="https://agda.github.io/agda-stdlib/Function.html#713" class="Function Operator"
      >&#8728;</a
      ><a name="14992"
      > </a
      ><a name="14993" href="StlcProp.html#7367" class="InductiveConstructor"
      >if3</a
      ><a name="14996" class="Symbol"
      >)</a
      ><a name="14997"
      > </a
      ><a name="14998" href="StlcProp.html#14886" class="Bound"
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
<a name="15813" href="StlcProp.html#15813" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="15829"
      > </a
      ><a name="15830" class="Symbol"
      >:</a
      ><a name="15831"
      > </a
      ><a name="15832" class="Symbol"
      >&#8704;</a
      ><a name="15833"
      > </a
      ><a name="15834" class="Symbol"
      >{</a
      ><a name="15835" href="StlcProp.html#15835" class="Bound"
      >&#915;</a
      ><a name="15836"
      > </a
      ><a name="15837" href="StlcProp.html#15837" class="Bound"
      >x</a
      ><a name="15838"
      > </a
      ><a name="15839" href="StlcProp.html#15839" class="Bound"
      >A</a
      ><a name="15840"
      > </a
      ><a name="15841" href="StlcProp.html#15841" class="Bound"
      >t</a
      ><a name="15842"
      > </a
      ><a name="15843" href="StlcProp.html#15843" class="Bound"
      >v</a
      ><a name="15844"
      > </a
      ><a name="15845" href="StlcProp.html#15845" class="Bound"
      >B</a
      ><a name="15846" class="Symbol"
      >}</a
      ><a name="15847"
      >
                 </a
      ><a name="15865" class="Symbol"
      >&#8594;</a
      ><a name="15866"
      > </a
      ><a name="15867" href="Stlc.html#18626" class="Function"
      >&#8709;</a
      ><a name="15868"
      > </a
      ><a name="15869" href="Stlc.html#19597" class="Datatype Operator"
      >&#8866;</a
      ><a name="15870"
      > </a
      ><a name="15871" href="StlcProp.html#15843" class="Bound"
      >v</a
      ><a name="15872"
      > </a
      ><a name="15873" href="Stlc.html#19597" class="Datatype Operator"
      >&#8758;</a
      ><a name="15874"
      > </a
      ><a name="15875" href="StlcProp.html#15839" class="Bound"
      >A</a
      ><a name="15876"
      >
                 </a
      ><a name="15894" class="Symbol"
      >&#8594;</a
      ><a name="15895"
      > </a
      ><a name="15896" href="StlcProp.html#15835" class="Bound"
      >&#915;</a
      ><a name="15897"
      > </a
      ><a name="15898" href="Stlc.html#18654" class="Function Operator"
      >,</a
      ><a name="15899"
      > </a
      ><a name="15900" href="StlcProp.html#15837" class="Bound"
      >x</a
      ><a name="15901"
      > </a
      ><a name="15902" href="Stlc.html#18654" class="Function Operator"
      >&#8758;</a
      ><a name="15903"
      > </a
      ><a name="15904" href="StlcProp.html#15839" class="Bound"
      >A</a
      ><a name="15905"
      > </a
      ><a name="15906" href="Stlc.html#19597" class="Datatype Operator"
      >&#8866;</a
      ><a name="15907"
      > </a
      ><a name="15908" href="StlcProp.html#15841" class="Bound"
      >t</a
      ><a name="15909"
      > </a
      ><a name="15910" href="Stlc.html#19597" class="Datatype Operator"
      >&#8758;</a
      ><a name="15911"
      > </a
      ><a name="15912" href="StlcProp.html#15845" class="Bound"
      >B</a
      ><a name="15913"
      >
                 </a
      ><a name="15931" class="Symbol"
      >&#8594;</a
      ><a name="15932"
      > </a
      ><a name="15933" href="StlcProp.html#15835" class="Bound"
      >&#915;</a
      ><a name="15934"
      > </a
      ><a name="15935" href="Stlc.html#18654" class="Function Operator"
      >,</a
      ><a name="15936"
      > </a
      ><a name="15937" href="StlcProp.html#15837" class="Bound"
      >x</a
      ><a name="15938"
      > </a
      ><a name="15939" href="Stlc.html#18654" class="Function Operator"
      >&#8758;</a
      ><a name="15940"
      > </a
      ><a name="15941" href="StlcProp.html#15839" class="Bound"
      >A</a
      ><a name="15942"
      > </a
      ><a name="15943" href="Stlc.html#19597" class="Datatype Operator"
      >&#8866;</a
      ><a name="15944"
      > </a
      ><a name="15945" href="Stlc.html#12627" class="Function Operator"
      >[</a
      ><a name="15946"
      > </a
      ><a name="15947" href="StlcProp.html#15837" class="Bound"
      >x</a
      ><a name="15948"
      > </a
      ><a name="15949" href="Stlc.html#12627" class="Function Operator"
      >:=</a
      ><a name="15951"
      > </a
      ><a name="15952" href="StlcProp.html#15843" class="Bound"
      >v</a
      ><a name="15953"
      > </a
      ><a name="15954" href="Stlc.html#12627" class="Function Operator"
      >]</a
      ><a name="15955"
      > </a
      ><a name="15956" href="StlcProp.html#15841" class="Bound"
      >t</a
      ><a name="15957"
      > </a
      ><a name="15958" href="Stlc.html#19597" class="Datatype Operator"
      >&#8758;</a
      ><a name="15959"
      > </a
      ><a name="15960" href="StlcProp.html#15845" class="Bound"
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
<a name="19871" href="StlcProp.html#15813" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="19887"
      > </a
      ><a name="19888" class="Symbol"
      >{</a
      ><a name="19889" href="StlcProp.html#19889" class="Bound"
      >&#915;</a
      ><a name="19890" class="Symbol"
      >}</a
      ><a name="19891"
      > </a
      ><a name="19892" class="Symbol"
      >{</a
      ><a name="19893" href="StlcProp.html#19893" class="Bound"
      >x</a
      ><a name="19894" class="Symbol"
      >}</a
      ><a name="19895"
      > </a
      ><a name="19896" href="StlcProp.html#19896" class="Bound"
      >v&#8758;A</a
      ><a name="19899"
      > </a
      ><a name="19900" class="Symbol"
      >(</a
      ><a name="19901" href="Stlc.html#19641" class="InductiveConstructor"
      >var</a
      ><a name="19904"
      > </a
      ><a name="19905" href="StlcProp.html#19905" class="Bound"
      >y</a
      ><a name="19906"
      > </a
      ><a name="19907" href="StlcProp.html#19907" class="Bound"
      >y&#8712;&#915;</a
      ><a name="19910" class="Symbol"
      >)</a
      ><a name="19911"
      > </a
      ><a name="19912" class="Keyword"
      >with</a
      ><a name="19916"
      > </a
      ><a name="19917" href="StlcProp.html#19893" class="Bound"
      >x</a
      ><a name="19918"
      > </a
      ><a name="19919" href="Stlc.html#5821" class="Function Operator"
      >&#8799;</a
      ><a name="19920"
      > </a
      ><a name="19921" href="StlcProp.html#19905" class="Bound"
      >y</a
      ><a name="19922"
      >
</a
      ><a name="19923" class="Symbol"
      >...</a
      ><a name="19926"
      > </a
      ><a name="19927" class="Symbol"
      >|</a
      ><a name="19928"
      > </a
      ><a name="19929" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="19932"
      > </a
      ><a name="19933" href="StlcProp.html#19933" class="Bound"
      >x=y</a
      ><a name="19936"
      > </a
      ><a name="19937" class="Symbol"
      >=</a
      ><a name="19938"
      > </a
      ><a name="19939" class="Symbol"
      >{!!}</a
      ><a name="19943"
      >
</a
      ><a name="19944" class="Symbol"
      >...</a
      ><a name="19947"
      > </a
      ><a name="19948" class="Symbol"
      >|</a
      ><a name="19949"
      > </a
      ><a name="19950" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="19952"
      >  </a
      ><a name="19954" href="StlcProp.html#19954" class="Bound"
      >x&#8800;y</a
      ><a name="19957"
      > </a
      ><a name="19958" class="Symbol"
      >=</a
      ><a name="19959"
      > </a
      ><a name="19960" class="Symbol"
      >{!!}</a
      ><a name="19964"
      >
</a
      ><a name="19965" href="StlcProp.html#15813" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="19981"
      > </a
      ><a name="19982" href="StlcProp.html#19982" class="Bound"
      >v&#8758;A</a
      ><a name="19985"
      > </a
      ><a name="19986" class="Symbol"
      >(</a
      ><a name="19987" href="Stlc.html#19734" class="InductiveConstructor"
      >abs</a
      ><a name="19990"
      > </a
      ><a name="19991" href="StlcProp.html#19991" class="Bound"
      >t&#8242;&#8758;B</a
      ><a name="19995" class="Symbol"
      >)</a
      ><a name="19996"
      > </a
      ><a name="19997" class="Symbol"
      >=</a
      ><a name="19998"
      > </a
      ><a name="19999" class="Symbol"
      >{!!}</a
      ><a name="20003"
      >
</a
      ><a name="20004" href="StlcProp.html#15813" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="20020"
      > </a
      ><a name="20021" href="StlcProp.html#20021" class="Bound"
      >v&#8758;A</a
      ><a name="20024"
      > </a
      ><a name="20025" class="Symbol"
      >(</a
      ><a name="20026" href="Stlc.html#19850" class="InductiveConstructor"
      >app</a
      ><a name="20029"
      > </a
      ><a name="20030" href="StlcProp.html#20030" class="Bound"
      >t&#8321;&#8758;A&#8658;B</a
      ><a name="20036"
      > </a
      ><a name="20037" href="StlcProp.html#20037" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="20041" class="Symbol"
      >)</a
      ><a name="20042"
      > </a
      ><a name="20043" class="Symbol"
      >=</a
      ><a name="20044"
      >
  </a
      ><a name="20047" href="Stlc.html#19850" class="InductiveConstructor"
      >app</a
      ><a name="20050"
      > </a
      ><a name="20051" class="Symbol"
      >(</a
      ><a name="20052" href="StlcProp.html#15813" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="20068"
      > </a
      ><a name="20069" href="StlcProp.html#20021" class="Bound"
      >v&#8758;A</a
      ><a name="20072"
      > </a
      ><a name="20073" href="StlcProp.html#20030" class="Bound"
      >t&#8321;&#8758;A&#8658;B</a
      ><a name="20079" class="Symbol"
      >)</a
      ><a name="20080"
      > </a
      ><a name="20081" class="Symbol"
      >(</a
      ><a name="20082" href="StlcProp.html#15813" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="20098"
      > </a
      ><a name="20099" href="StlcProp.html#20021" class="Bound"
      >v&#8758;A</a
      ><a name="20102"
      > </a
      ><a name="20103" href="StlcProp.html#20037" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="20107" class="Symbol"
      >)</a
      ><a name="20108"
      >
</a
      ><a name="20109" href="StlcProp.html#15813" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="20125"
      > </a
      ><a name="20126" href="StlcProp.html#20126" class="Bound"
      >v&#8758;A</a
      ><a name="20129"
      > </a
      ><a name="20130" href="Stlc.html#19984" class="InductiveConstructor"
      >true</a
      ><a name="20134"
      >  </a
      ><a name="20136" class="Symbol"
      >=</a
      ><a name="20137"
      > </a
      ><a name="20138" href="Stlc.html#19984" class="InductiveConstructor"
      >true</a
      ><a name="20142"
      >
</a
      ><a name="20143" href="StlcProp.html#15813" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="20159"
      > </a
      ><a name="20160" href="StlcProp.html#20160" class="Bound"
      >v&#8758;A</a
      ><a name="20163"
      > </a
      ><a name="20164" href="Stlc.html#20043" class="InductiveConstructor"
      >false</a
      ><a name="20169"
      > </a
      ><a name="20170" class="Symbol"
      >=</a
      ><a name="20171"
      > </a
      ><a name="20172" href="Stlc.html#20043" class="InductiveConstructor"
      >false</a
      ><a name="20177"
      >
</a
      ><a name="20178" href="StlcProp.html#15813" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="20194"
      > </a
      ><a name="20195" href="StlcProp.html#20195" class="Bound"
      >v&#8758;A</a
      ><a name="20198"
      > </a
      ><a name="20199" class="Symbol"
      >(</a
      ><a name="20200" href="Stlc.html#20102" class="InductiveConstructor Operator"
      >if</a
      ><a name="20202"
      > </a
      ><a name="20203" href="StlcProp.html#20203" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="20210"
      > </a
      ><a name="20211" href="Stlc.html#20102" class="InductiveConstructor Operator"
      >then</a
      ><a name="20215"
      > </a
      ><a name="20216" href="StlcProp.html#20216" class="Bound"
      >t&#8322;&#8758;B</a
      ><a name="20220"
      > </a
      ><a name="20221" href="Stlc.html#20102" class="InductiveConstructor Operator"
      >else</a
      ><a name="20225"
      > </a
      ><a name="20226" href="StlcProp.html#20226" class="Bound"
      >t&#8323;&#8758;B</a
      ><a name="20230" class="Symbol"
      >)</a
      ><a name="20231"
      > </a
      ><a name="20232" class="Symbol"
      >=</a
      ><a name="20233"
      >
  </a
      ><a name="20236" href="Stlc.html#20102" class="InductiveConstructor Operator"
      >if</a
      ><a name="20238"
      >   </a
      ><a name="20241" href="StlcProp.html#15813" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="20257"
      > </a
      ><a name="20258" href="StlcProp.html#20195" class="Bound"
      >v&#8758;A</a
      ><a name="20261"
      > </a
      ><a name="20262" href="StlcProp.html#20203" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="20269"
      >
  </a
      ><a name="20272" href="Stlc.html#20102" class="InductiveConstructor Operator"
      >then</a
      ><a name="20276"
      > </a
      ><a name="20277" href="StlcProp.html#15813" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="20293"
      > </a
      ><a name="20294" href="StlcProp.html#20195" class="Bound"
      >v&#8758;A</a
      ><a name="20297"
      > </a
      ><a name="20298" href="StlcProp.html#20216" class="Bound"
      >t&#8322;&#8758;B</a
      ><a name="20302"
      >
  </a
      ><a name="20305" href="Stlc.html#20102" class="InductiveConstructor Operator"
      >else</a
      ><a name="20309"
      > </a
      ><a name="20310" href="StlcProp.html#15813" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="20326"
      > </a
      ><a name="20327" href="StlcProp.html#20195" class="Bound"
      >v&#8758;A</a
      ><a name="20330"
      > </a
      ><a name="20331" href="StlcProp.html#20226" class="Bound"
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
