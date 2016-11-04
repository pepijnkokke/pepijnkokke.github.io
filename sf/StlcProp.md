---
title         : "StlcProp: Properties of STLC"
layout        : default
hide-implicit : false
extra-script  : agda-extra-script.html
extra-style   : agda-extra-style.html
permalink     : "sf/StlcProp.html"
---

<!--{% raw %}--><pre class="Agda">
<a name="228" class="Keyword"
      >module</a
      ><a name="234"
      > </a
      ><a name="235" href="StlcProp.html#1" class="Module"
      >StlcProp</a
      ><a name="243"
      > </a
      ><a name="244" class="Keyword"
      >where</a
      >
</pre><!--{% endraw %}-->

<div class="hidden">
<!--{% raw %}--><pre class="Agda">
<a name="296" class="Keyword"
      >open</a
      ><a name="300"
      > </a
      ><a name="301" class="Keyword"
      >import</a
      ><a name="307"
      > </a
      ><a name="308" href="https://agda.github.io/agda-stdlib/Function.html#1" class="Module"
      >Function</a
      ><a name="316"
      > </a
      ><a name="317" class="Keyword"
      >using</a
      ><a name="322"
      > </a
      ><a name="323" class="Symbol"
      >(</a
      ><a name="324" href="https://agda.github.io/agda-stdlib/Function.html#713" class="Function Operator"
      >_&#8728;_</a
      ><a name="327" class="Symbol"
      >)</a
      ><a name="328"
      >
</a
      ><a name="329" class="Keyword"
      >open</a
      ><a name="333"
      > </a
      ><a name="334" class="Keyword"
      >import</a
      ><a name="340"
      > </a
      ><a name="341" href="https://agda.github.io/agda-stdlib/Data.Empty.html#1" class="Module"
      >Data.Empty</a
      ><a name="351"
      > </a
      ><a name="352" class="Keyword"
      >using</a
      ><a name="357"
      > </a
      ><a name="358" class="Symbol"
      >(</a
      ><a name="359" href="https://agda.github.io/agda-stdlib/Data.Empty.html#243" class="Datatype"
      >&#8869;</a
      ><a name="360" class="Symbol"
      >;</a
      ><a name="361"
      > </a
      ><a name="362" href="https://agda.github.io/agda-stdlib/Data.Empty.html#348" class="Function"
      >&#8869;-elim</a
      ><a name="368" class="Symbol"
      >)</a
      ><a name="369"
      >
</a
      ><a name="370" class="Keyword"
      >open</a
      ><a name="374"
      > </a
      ><a name="375" class="Keyword"
      >import</a
      ><a name="381"
      > </a
      ><a name="382" href="https://agda.github.io/agda-stdlib/Data.Maybe.html#1" class="Module"
      >Data.Maybe</a
      ><a name="392"
      > </a
      ><a name="393" class="Keyword"
      >using</a
      ><a name="398"
      > </a
      ><a name="399" class="Symbol"
      >(</a
      ><a name="400" href="https://agda.github.io/agda-stdlib/Data.Maybe.Base.html#335" class="Datatype"
      >Maybe</a
      ><a name="405" class="Symbol"
      >;</a
      ><a name="406"
      > </a
      ><a name="407" href="https://agda.github.io/agda-stdlib/Data.Maybe.html#1527" class="InductiveConstructor"
      >just</a
      ><a name="411" class="Symbol"
      >;</a
      ><a name="412"
      > </a
      ><a name="413" href="https://agda.github.io/agda-stdlib/Data.Maybe.html#1588" class="InductiveConstructor"
      >nothing</a
      ><a name="420" class="Symbol"
      >)</a
      ><a name="421"
      >
</a
      ><a name="422" class="Keyword"
      >open</a
      ><a name="426"
      > </a
      ><a name="427" class="Keyword"
      >import</a
      ><a name="433"
      > </a
      ><a name="434" href="https://agda.github.io/agda-stdlib/Data.Product.html#1" class="Module"
      >Data.Product</a
      ><a name="446"
      > </a
      ><a name="447" class="Keyword"
      >using</a
      ><a name="452"
      > </a
      ><a name="453" class="Symbol"
      >(</a
      ><a name="454" href="https://agda.github.io/agda-stdlib/Data.Product.html#823" class="Function"
      >&#8707;</a
      ><a name="455" class="Symbol"
      >;</a
      ><a name="456"
      > </a
      ><a name="457" href="https://agda.github.io/agda-stdlib/Data.Product.html#949" class="Function"
      >&#8707;&#8322;</a
      ><a name="459" class="Symbol"
      >;</a
      ><a name="460"
      > </a
      ><a name="461" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >_,_</a
      ><a name="464" class="Symbol"
      >;</a
      ><a name="465"
      > </a
      ><a name="466" href="https://agda.github.io/agda-stdlib/Data.Product.html#1621" class="Function Operator"
      >,_</a
      ><a name="468" class="Symbol"
      >)</a
      ><a name="469"
      >
</a
      ><a name="470" class="Keyword"
      >open</a
      ><a name="474"
      > </a
      ><a name="475" class="Keyword"
      >import</a
      ><a name="481"
      > </a
      ><a name="482" href="https://agda.github.io/agda-stdlib/Data.Sum.html#1" class="Module"
      >Data.Sum</a
      ><a name="490"
      > </a
      ><a name="491" class="Keyword"
      >using</a
      ><a name="496"
      > </a
      ><a name="497" class="Symbol"
      >(</a
      ><a name="498" href="https://agda.github.io/agda-stdlib/Data.Sum.html#433" class="Datatype Operator"
      >_&#8846;_</a
      ><a name="501" class="Symbol"
      >;</a
      ><a name="502"
      > </a
      ><a name="503" href="https://agda.github.io/agda-stdlib/Data.Sum.html#489" class="InductiveConstructor"
      >inj&#8321;</a
      ><a name="507" class="Symbol"
      >;</a
      ><a name="508"
      > </a
      ><a name="509" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="513" class="Symbol"
      >)</a
      ><a name="514"
      >
</a
      ><a name="515" class="Keyword"
      >open</a
      ><a name="519"
      > </a
      ><a name="520" class="Keyword"
      >import</a
      ><a name="526"
      > </a
      ><a name="527" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#1" class="Module"
      >Relation.Nullary</a
      ><a name="543"
      > </a
      ><a name="544" class="Keyword"
      >using</a
      ><a name="549"
      > </a
      ><a name="550" class="Symbol"
      >(</a
      ><a name="551" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#414" class="Function Operator"
      >&#172;_</a
      ><a name="553" class="Symbol"
      >;</a
      ><a name="554"
      > </a
      ><a name="555" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#484" class="Datatype"
      >Dec</a
      ><a name="558" class="Symbol"
      >;</a
      ><a name="559"
      > </a
      ><a name="560" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="563" class="Symbol"
      >;</a
      ><a name="564"
      > </a
      ><a name="565" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="567" class="Symbol"
      >)</a
      ><a name="568"
      >
</a
      ><a name="569" class="Keyword"
      >open</a
      ><a name="573"
      > </a
      ><a name="574" class="Keyword"
      >import</a
      ><a name="580"
      > </a
      ><a name="581" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.html#1" class="Module"
      >Relation.Binary.PropositionalEquality</a
      ><a name="618"
      > </a
      ><a name="619" class="Keyword"
      >using</a
      ><a name="624"
      > </a
      ><a name="625" class="Symbol"
      >(</a
      ><a name="626" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >_&#8801;_</a
      ><a name="629" class="Symbol"
      >;</a
      ><a name="630"
      > </a
      ><a name="631" href="https://agda.github.io/agda-stdlib/Relation.Binary.Core.html#4493" class="Function Operator"
      >_&#8802;_</a
      ><a name="634" class="Symbol"
      >;</a
      ><a name="635"
      > </a
      ><a name="636" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="640" class="Symbol"
      >)</a
      ><a name="641"
      >
</a
      ><a name="642" class="Keyword"
      >open</a
      ><a name="646"
      > </a
      ><a name="647" class="Keyword"
      >import</a
      ><a name="653"
      > </a
      ><a name="654" class="Module"
      >Maps</a
      ><a name="658"
      >
</a
      ><a name="659" class="Keyword"
      >open</a
      ><a name="663"
      > </a
      ><a name="664" class="Keyword"
      >import</a
      ><a name="670"
      > </a
      ><a name="671" href="Stlc.html#1" class="Module"
      >Stlc</a
      >
</pre><!--{% endraw %}-->
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

<!--{% raw %}--><pre class="Agda">
<a name="1257" href="StlcProp.html#1257" class="Function"
      >CanonicalForms</a
      ><a name="1271"
      > </a
      ><a name="1272" class="Symbol"
      >:</a
      ><a name="1273"
      > </a
      ><a name="1274" href="Stlc.html#5753" class="Datatype"
      >Term</a
      ><a name="1278"
      > </a
      ><a name="1279" class="Symbol"
      >&#8594;</a
      ><a name="1280"
      > </a
      ><a name="1281" href="Stlc.html#5586" class="Datatype"
      >Type</a
      ><a name="1285"
      > </a
      ><a name="1286" class="Symbol"
      >&#8594;</a
      ><a name="1287"
      > </a
      ><a name="1288" class="PrimitiveType"
      >Set</a
      ><a name="1291"
      >
</a
      ><a name="1292" href="StlcProp.html#1257" class="Function"
      >CanonicalForms</a
      ><a name="1306"
      > </a
      ><a name="1307" href="StlcProp.html#1307" class="Bound"
      >t</a
      ><a name="1308"
      > </a
      ><a name="1309" href="Stlc.html#5605" class="InductiveConstructor"
      >bool</a
      ><a name="1313"
      >    </a
      ><a name="1317" class="Symbol"
      >=</a
      ><a name="1318"
      > </a
      ><a name="1319" href="StlcProp.html#1307" class="Bound"
      >t</a
      ><a name="1320"
      > </a
      ><a name="1321" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="1322"
      > </a
      ><a name="1323" href="Stlc.html#5855" class="InductiveConstructor"
      >true</a
      ><a name="1327"
      > </a
      ><a name="1328" href="https://agda.github.io/agda-stdlib/Data.Sum.html#433" class="Datatype Operator"
      >&#8846;</a
      ><a name="1329"
      > </a
      ><a name="1330" href="StlcProp.html#1307" class="Bound"
      >t</a
      ><a name="1331"
      > </a
      ><a name="1332" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="1333"
      > </a
      ><a name="1334" href="Stlc.html#5870" class="InductiveConstructor"
      >false</a
      ><a name="1339"
      >
</a
      ><a name="1340" href="StlcProp.html#1257" class="Function"
      >CanonicalForms</a
      ><a name="1354"
      > </a
      ><a name="1355" href="StlcProp.html#1355" class="Bound"
      >t</a
      ><a name="1356"
      > </a
      ><a name="1357" class="Symbol"
      >(</a
      ><a name="1358" href="StlcProp.html#1358" class="Bound"
      >A</a
      ><a name="1359"
      > </a
      ><a name="1360" href="Stlc.html#5619" class="InductiveConstructor Operator"
      >&#8658;</a
      ><a name="1361"
      > </a
      ><a name="1362" href="StlcProp.html#1362" class="Bound"
      >B</a
      ><a name="1363" class="Symbol"
      >)</a
      ><a name="1364"
      > </a
      ><a name="1365" class="Symbol"
      >=</a
      ><a name="1366"
      > </a
      ><a name="1367" href="https://agda.github.io/agda-stdlib/Data.Product.html#949" class="Function"
      >&#8707;&#8322;</a
      ><a name="1369"
      > </a
      ><a name="1370" class="Symbol"
      >&#955;</a
      ><a name="1371"
      > </a
      ><a name="1372" href="StlcProp.html#1372" class="Bound"
      >x</a
      ><a name="1373"
      > </a
      ><a name="1374" href="StlcProp.html#1374" class="Bound"
      >t&#8242;</a
      ><a name="1376"
      > </a
      ><a name="1377" class="Symbol"
      >&#8594;</a
      ><a name="1378"
      > </a
      ><a name="1379" href="StlcProp.html#1355" class="Bound"
      >t</a
      ><a name="1380"
      > </a
      ><a name="1381" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="1382"
      > </a
      ><a name="1383" href="Stlc.html#5821" class="InductiveConstructor"
      >abs</a
      ><a name="1386"
      > </a
      ><a name="1387" href="StlcProp.html#1372" class="Bound"
      >x</a
      ><a name="1388"
      > </a
      ><a name="1389" href="StlcProp.html#1358" class="Bound"
      >A</a
      ><a name="1390"
      > </a
      ><a name="1391" href="StlcProp.html#1374" class="Bound"
      >t&#8242;</a
      ><a name="1393"
      >

</a
      ><a name="1395" href="StlcProp.html#1395" class="Function"
      >canonicalForms</a
      ><a name="1409"
      > </a
      ><a name="1410" class="Symbol"
      >:</a
      ><a name="1411"
      > </a
      ><a name="1412" class="Symbol"
      >&#8704;</a
      ><a name="1413"
      > </a
      ><a name="1414" class="Symbol"
      >{</a
      ><a name="1415" href="StlcProp.html#1415" class="Bound"
      >t</a
      ><a name="1416"
      > </a
      ><a name="1417" href="StlcProp.html#1417" class="Bound"
      >A</a
      ><a name="1418" class="Symbol"
      >}</a
      ><a name="1419"
      > </a
      ><a name="1420" class="Symbol"
      >&#8594;</a
      ><a name="1421"
      > </a
      ><a name="1422" href="Stlc.html#18297" class="Function"
      >&#8709;</a
      ><a name="1423"
      > </a
      ><a name="1424" href="Stlc.html#19229" class="Datatype Operator"
      >&#8866;</a
      ><a name="1425"
      > </a
      ><a name="1426" href="StlcProp.html#1415" class="Bound"
      >t</a
      ><a name="1427"
      > </a
      ><a name="1428" href="Stlc.html#19229" class="Datatype Operator"
      >&#8758;</a
      ><a name="1429"
      > </a
      ><a name="1430" href="StlcProp.html#1417" class="Bound"
      >A</a
      ><a name="1431"
      > </a
      ><a name="1432" class="Symbol"
      >&#8594;</a
      ><a name="1433"
      > </a
      ><a name="1434" href="Stlc.html#9078" class="Datatype"
      >Value</a
      ><a name="1439"
      > </a
      ><a name="1440" href="StlcProp.html#1415" class="Bound"
      >t</a
      ><a name="1441"
      > </a
      ><a name="1442" class="Symbol"
      >&#8594;</a
      ><a name="1443"
      > </a
      ><a name="1444" href="StlcProp.html#1257" class="Function"
      >CanonicalForms</a
      ><a name="1458"
      > </a
      ><a name="1459" href="StlcProp.html#1415" class="Bound"
      >t</a
      ><a name="1460"
      > </a
      ><a name="1461" href="StlcProp.html#1417" class="Bound"
      >A</a
      ><a name="1462"
      >
</a
      ><a name="1463" href="StlcProp.html#1395" class="Function"
      >canonicalForms</a
      ><a name="1477"
      > </a
      ><a name="1478" class="Symbol"
      >(</a
      ><a name="1479" href="Stlc.html#19366" class="InductiveConstructor"
      >abs</a
      ><a name="1482"
      > </a
      ><a name="1483" href="StlcProp.html#1483" class="Bound"
      >t&#8242;</a
      ><a name="1485" class="Symbol"
      >)</a
      ><a name="1486"
      > </a
      ><a name="1487" href="Stlc.html#9105" class="InductiveConstructor"
      >abs</a
      ><a name="1490"
      >   </a
      ><a name="1493" class="Symbol"
      >=</a
      ><a name="1494"
      > </a
      ><a name="1495" class="Symbol"
      >_</a
      ><a name="1496"
      > </a
      ><a name="1497" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="1498"
      > </a
      ><a name="1499" class="Symbol"
      >_</a
      ><a name="1500"
      > </a
      ><a name="1501" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="1502"
      > </a
      ><a name="1503" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="1507"
      >
</a
      ><a name="1508" href="StlcProp.html#1395" class="Function"
      >canonicalForms</a
      ><a name="1522"
      > </a
      ><a name="1523" href="Stlc.html#19616" class="InductiveConstructor"
      >true</a
      ><a name="1527"
      >     </a
      ><a name="1532" href="Stlc.html#9153" class="InductiveConstructor"
      >true</a
      ><a name="1536"
      >  </a
      ><a name="1538" class="Symbol"
      >=</a
      ><a name="1539"
      > </a
      ><a name="1540" href="https://agda.github.io/agda-stdlib/Data.Sum.html#489" class="InductiveConstructor"
      >inj&#8321;</a
      ><a name="1544"
      > </a
      ><a name="1545" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="1549"
      >
</a
      ><a name="1550" href="StlcProp.html#1395" class="Function"
      >canonicalForms</a
      ><a name="1564"
      > </a
      ><a name="1565" href="Stlc.html#19675" class="InductiveConstructor"
      >false</a
      ><a name="1570"
      >    </a
      ><a name="1574" href="Stlc.html#9174" class="InductiveConstructor"
      >false</a
      ><a name="1579"
      > </a
      ><a name="1580" class="Symbol"
      >=</a
      ><a name="1581"
      > </a
      ><a name="1582" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="1586"
      > </a
      ><a name="1587" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      >
</pre><!--{% endraw %}-->

## Progress

As before, the _progress_ theorem tells us that closed, well-typed
terms are not stuck: either a well-typed term is a value, or it
can take a reduction step.  The proof is a relatively
straightforward extension of the progress proof we saw in the
[Stlc](Stlc.html) chapter.  We'll give the proof in English first,
then the formal version.

<!--{% raw %}--><pre class="Agda">
<a name="1970" href="StlcProp.html#1970" class="Function"
      >progress</a
      ><a name="1978"
      > </a
      ><a name="1979" class="Symbol"
      >:</a
      ><a name="1980"
      > </a
      ><a name="1981" class="Symbol"
      >&#8704;</a
      ><a name="1982"
      > </a
      ><a name="1983" class="Symbol"
      >{</a
      ><a name="1984" href="StlcProp.html#1984" class="Bound"
      >t</a
      ><a name="1985"
      > </a
      ><a name="1986" href="StlcProp.html#1986" class="Bound"
      >A</a
      ><a name="1987" class="Symbol"
      >}</a
      ><a name="1988"
      > </a
      ><a name="1989" class="Symbol"
      >&#8594;</a
      ><a name="1990"
      > </a
      ><a name="1991" href="Stlc.html#18297" class="Function"
      >&#8709;</a
      ><a name="1992"
      > </a
      ><a name="1993" href="Stlc.html#19229" class="Datatype Operator"
      >&#8866;</a
      ><a name="1994"
      > </a
      ><a name="1995" href="StlcProp.html#1984" class="Bound"
      >t</a
      ><a name="1996"
      > </a
      ><a name="1997" href="Stlc.html#19229" class="Datatype Operator"
      >&#8758;</a
      ><a name="1998"
      > </a
      ><a name="1999" href="StlcProp.html#1986" class="Bound"
      >A</a
      ><a name="2000"
      > </a
      ><a name="2001" class="Symbol"
      >&#8594;</a
      ><a name="2002"
      > </a
      ><a name="2003" href="Stlc.html#9078" class="Datatype"
      >Value</a
      ><a name="2008"
      > </a
      ><a name="2009" href="StlcProp.html#1984" class="Bound"
      >t</a
      ><a name="2010"
      > </a
      ><a name="2011" href="https://agda.github.io/agda-stdlib/Data.Sum.html#433" class="Datatype Operator"
      >&#8846;</a
      ><a name="2012"
      > </a
      ><a name="2013" href="https://agda.github.io/agda-stdlib/Data.Product.html#823" class="Function"
      >&#8707;</a
      ><a name="2014"
      > </a
      ><a name="2015" class="Symbol"
      >&#955;</a
      ><a name="2016"
      > </a
      ><a name="2017" href="StlcProp.html#2017" class="Bound"
      >t&#8242;</a
      ><a name="2019"
      > </a
      ><a name="2020" class="Symbol"
      >&#8594;</a
      ><a name="2021"
      > </a
      ><a name="2022" href="StlcProp.html#1984" class="Bound"
      >t</a
      ><a name="2023"
      > </a
      ><a name="2024" href="Stlc.html#15215" class="Datatype Operator"
      >==&gt;</a
      ><a name="2027"
      > </a
      ><a name="2028" href="StlcProp.html#2017" class="Bound"
      >t&#8242;</a
      >
</pre><!--{% endraw %}-->

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

<!--{% raw %}--><pre class="Agda">
<a name="3729" href="StlcProp.html#1970" class="Function"
      >progress</a
      ><a name="3737"
      > </a
      ><a name="3738" class="Symbol"
      >(</a
      ><a name="3739" href="Stlc.html#19273" class="InductiveConstructor"
      >var</a
      ><a name="3742"
      > </a
      ><a name="3743" href="StlcProp.html#3743" class="Bound"
      >x</a
      ><a name="3744"
      > </a
      ><a name="3745" class="Symbol"
      >())</a
      ><a name="3748"
      >
</a
      ><a name="3749" href="StlcProp.html#1970" class="Function"
      >progress</a
      ><a name="3757"
      > </a
      ><a name="3758" href="Stlc.html#19616" class="InductiveConstructor"
      >true</a
      ><a name="3762"
      >      </a
      ><a name="3768" class="Symbol"
      >=</a
      ><a name="3769"
      > </a
      ><a name="3770" href="https://agda.github.io/agda-stdlib/Data.Sum.html#489" class="InductiveConstructor"
      >inj&#8321;</a
      ><a name="3774"
      > </a
      ><a name="3775" href="Stlc.html#9153" class="InductiveConstructor"
      >true</a
      ><a name="3779"
      >
</a
      ><a name="3780" href="StlcProp.html#1970" class="Function"
      >progress</a
      ><a name="3788"
      > </a
      ><a name="3789" href="Stlc.html#19675" class="InductiveConstructor"
      >false</a
      ><a name="3794"
      >     </a
      ><a name="3799" class="Symbol"
      >=</a
      ><a name="3800"
      > </a
      ><a name="3801" href="https://agda.github.io/agda-stdlib/Data.Sum.html#489" class="InductiveConstructor"
      >inj&#8321;</a
      ><a name="3805"
      > </a
      ><a name="3806" href="Stlc.html#9174" class="InductiveConstructor"
      >false</a
      ><a name="3811"
      >
</a
      ><a name="3812" href="StlcProp.html#1970" class="Function"
      >progress</a
      ><a name="3820"
      > </a
      ><a name="3821" class="Symbol"
      >(</a
      ><a name="3822" href="Stlc.html#19366" class="InductiveConstructor"
      >abs</a
      ><a name="3825"
      > </a
      ><a name="3826" href="StlcProp.html#3826" class="Bound"
      >t&#8758;A</a
      ><a name="3829" class="Symbol"
      >)</a
      ><a name="3830"
      > </a
      ><a name="3831" class="Symbol"
      >=</a
      ><a name="3832"
      > </a
      ><a name="3833" href="https://agda.github.io/agda-stdlib/Data.Sum.html#489" class="InductiveConstructor"
      >inj&#8321;</a
      ><a name="3837"
      > </a
      ><a name="3838" href="Stlc.html#9105" class="InductiveConstructor"
      >abs</a
      ><a name="3841"
      >
</a
      ><a name="3842" href="StlcProp.html#1970" class="Function"
      >progress</a
      ><a name="3850"
      > </a
      ><a name="3851" class="Symbol"
      >(</a
      ><a name="3852" href="Stlc.html#19482" class="InductiveConstructor"
      >app</a
      ><a name="3855"
      > </a
      ><a name="3856" href="StlcProp.html#3856" class="Bound"
      >t&#8321;&#8758;A&#8658;B</a
      ><a name="3862"
      > </a
      ><a name="3863" href="StlcProp.html#3863" class="Bound"
      >t&#8322;&#8758;B</a
      ><a name="3867" class="Symbol"
      >)</a
      ><a name="3868"
      >
    </a
      ><a name="3873" class="Keyword"
      >with</a
      ><a name="3877"
      > </a
      ><a name="3878" href="StlcProp.html#1970" class="Function"
      >progress</a
      ><a name="3886"
      > </a
      ><a name="3887" href="StlcProp.html#3856" class="Bound"
      >t&#8321;&#8758;A&#8658;B</a
      ><a name="3893"
      >
</a
      ><a name="3894" class="Symbol"
      >...</a
      ><a name="3897"
      > </a
      ><a name="3898" class="Symbol"
      >|</a
      ><a name="3899"
      > </a
      ><a name="3900" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="3904"
      > </a
      ><a name="3905" class="Symbol"
      >(_</a
      ><a name="3907"
      > </a
      ><a name="3908" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="3909"
      > </a
      ><a name="3910" href="StlcProp.html#3910" class="Bound"
      >t&#8321;&#8658;t&#8321;&#8242;</a
      ><a name="3916" class="Symbol"
      >)</a
      ><a name="3917"
      > </a
      ><a name="3918" class="Symbol"
      >=</a
      ><a name="3919"
      > </a
      ><a name="3920" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="3924"
      > </a
      ><a name="3925" class="Symbol"
      >(_</a
      ><a name="3927"
      > </a
      ><a name="3928" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="3929"
      > </a
      ><a name="3930" href="Stlc.html#15340" class="InductiveConstructor"
      >app1</a
      ><a name="3934"
      > </a
      ><a name="3935" href="StlcProp.html#3910" class="Bound"
      >t&#8321;&#8658;t&#8321;&#8242;</a
      ><a name="3941" class="Symbol"
      >)</a
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
      ><a name="3949" href="https://agda.github.io/agda-stdlib/Data.Sum.html#489" class="InductiveConstructor"
      >inj&#8321;</a
      ><a name="3953"
      > </a
      ><a name="3954" href="StlcProp.html#3954" class="Bound"
      >v&#8321;</a
      ><a name="3956"
      >
    </a
      ><a name="3961" class="Keyword"
      >with</a
      ><a name="3965"
      > </a
      ><a name="3966" href="StlcProp.html#1970" class="Function"
      >progress</a
      ><a name="3974"
      > </a
      ><a name="3975" href="StlcProp.html#3863" class="Bound"
      >t&#8322;&#8758;B</a
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
      ><a name="3986" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="3990"
      > </a
      ><a name="3991" class="Symbol"
      >(_</a
      ><a name="3993"
      > </a
      ><a name="3994" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="3995"
      > </a
      ><a name="3996" href="StlcProp.html#3996" class="Bound"
      >t&#8322;&#8658;t&#8322;&#8242;</a
      ><a name="4002" class="Symbol"
      >)</a
      ><a name="4003"
      > </a
      ><a name="4004" class="Symbol"
      >=</a
      ><a name="4005"
      > </a
      ><a name="4006" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="4010"
      > </a
      ><a name="4011" class="Symbol"
      >(_</a
      ><a name="4013"
      > </a
      ><a name="4014" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="4015"
      > </a
      ><a name="4016" href="Stlc.html#15417" class="InductiveConstructor"
      >app2</a
      ><a name="4020"
      > </a
      ><a name="4021" href="StlcProp.html#3954" class="Bound"
      >v&#8321;</a
      ><a name="4023"
      > </a
      ><a name="4024" href="StlcProp.html#3996" class="Bound"
      >t&#8322;&#8658;t&#8322;&#8242;</a
      ><a name="4030" class="Symbol"
      >)</a
      ><a name="4031"
      >
</a
      ><a name="4032" class="Symbol"
      >...</a
      ><a name="4035"
      > </a
      ><a name="4036" class="Symbol"
      >|</a
      ><a name="4037"
      > </a
      ><a name="4038" href="https://agda.github.io/agda-stdlib/Data.Sum.html#489" class="InductiveConstructor"
      >inj&#8321;</a
      ><a name="4042"
      > </a
      ><a name="4043" href="StlcProp.html#4043" class="Bound"
      >v&#8322;</a
      ><a name="4045"
      >
    </a
      ><a name="4050" class="Keyword"
      >with</a
      ><a name="4054"
      > </a
      ><a name="4055" href="StlcProp.html#1395" class="Function"
      >canonicalForms</a
      ><a name="4069"
      > </a
      ><a name="4070" href="StlcProp.html#3856" class="Bound"
      >t&#8321;&#8758;A&#8658;B</a
      ><a name="4076"
      > </a
      ><a name="4077" href="StlcProp.html#3954" class="Bound"
      >v&#8321;</a
      ><a name="4079"
      >
</a
      ><a name="4080" class="Symbol"
      >...</a
      ><a name="4083"
      > </a
      ><a name="4084" class="Symbol"
      >|</a
      ><a name="4085"
      > </a
      ><a name="4086" class="Symbol"
      >(_</a
      ><a name="4088"
      > </a
      ><a name="4089" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="4090"
      > </a
      ><a name="4091" class="Symbol"
      >_</a
      ><a name="4092"
      > </a
      ><a name="4093" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="4094"
      > </a
      ><a name="4095" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="4099" class="Symbol"
      >)</a
      ><a name="4100"
      > </a
      ><a name="4101" class="Symbol"
      >=</a
      ><a name="4102"
      > </a
      ><a name="4103" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="4107"
      > </a
      ><a name="4108" class="Symbol"
      >(_</a
      ><a name="4110"
      > </a
      ><a name="4111" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="4112"
      > </a
      ><a name="4113" href="Stlc.html#15249" class="InductiveConstructor"
      >red</a
      ><a name="4116"
      > </a
      ><a name="4117" href="StlcProp.html#4043" class="Bound"
      >v&#8322;</a
      ><a name="4119" class="Symbol"
      >)</a
      ><a name="4120"
      >
</a
      ><a name="4121" href="StlcProp.html#1970" class="Function"
      >progress</a
      ><a name="4129"
      > </a
      ><a name="4130" class="Symbol"
      >(</a
      ><a name="4131" href="Stlc.html#19734" class="InductiveConstructor Operator"
      >if</a
      ><a name="4133"
      > </a
      ><a name="4134" href="StlcProp.html#4134" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="4141"
      > </a
      ><a name="4142" href="Stlc.html#19734" class="InductiveConstructor Operator"
      >then</a
      ><a name="4146"
      > </a
      ><a name="4147" href="StlcProp.html#4147" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="4151"
      > </a
      ><a name="4152" href="Stlc.html#19734" class="InductiveConstructor Operator"
      >else</a
      ><a name="4156"
      > </a
      ><a name="4157" href="StlcProp.html#4157" class="Bound"
      >t&#8323;&#8758;A</a
      ><a name="4161" class="Symbol"
      >)</a
      ><a name="4162"
      >
    </a
      ><a name="4167" class="Keyword"
      >with</a
      ><a name="4171"
      > </a
      ><a name="4172" href="StlcProp.html#1970" class="Function"
      >progress</a
      ><a name="4180"
      > </a
      ><a name="4181" href="StlcProp.html#4134" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="4188"
      >
</a
      ><a name="4189" class="Symbol"
      >...</a
      ><a name="4192"
      > </a
      ><a name="4193" class="Symbol"
      >|</a
      ><a name="4194"
      > </a
      ><a name="4195" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="4199"
      > </a
      ><a name="4200" class="Symbol"
      >(_</a
      ><a name="4202"
      > </a
      ><a name="4203" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="4204"
      > </a
      ><a name="4205" href="StlcProp.html#4205" class="Bound"
      >t&#8321;&#8658;t&#8321;&#8242;</a
      ><a name="4211" class="Symbol"
      >)</a
      ><a name="4212"
      > </a
      ><a name="4213" class="Symbol"
      >=</a
      ><a name="4214"
      > </a
      ><a name="4215" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="4219"
      > </a
      ><a name="4220" class="Symbol"
      >(_</a
      ><a name="4222"
      > </a
      ><a name="4223" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="4224"
      > </a
      ><a name="4225" href="Stlc.html#15514" class="InductiveConstructor"
      >if</a
      ><a name="4227"
      > </a
      ><a name="4228" href="StlcProp.html#4205" class="Bound"
      >t&#8321;&#8658;t&#8321;&#8242;</a
      ><a name="4234" class="Symbol"
      >)</a
      ><a name="4235"
      >
</a
      ><a name="4236" class="Symbol"
      >...</a
      ><a name="4239"
      > </a
      ><a name="4240" class="Symbol"
      >|</a
      ><a name="4241"
      > </a
      ><a name="4242" href="https://agda.github.io/agda-stdlib/Data.Sum.html#489" class="InductiveConstructor"
      >inj&#8321;</a
      ><a name="4246"
      > </a
      ><a name="4247" href="StlcProp.html#4247" class="Bound"
      >v&#8321;</a
      ><a name="4249"
      >
    </a
      ><a name="4254" class="Keyword"
      >with</a
      ><a name="4258"
      > </a
      ><a name="4259" href="StlcProp.html#1395" class="Function"
      >canonicalForms</a
      ><a name="4273"
      > </a
      ><a name="4274" href="StlcProp.html#4134" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="4281"
      > </a
      ><a name="4282" href="StlcProp.html#4247" class="Bound"
      >v&#8321;</a
      ><a name="4284"
      >
</a
      ><a name="4285" class="Symbol"
      >...</a
      ><a name="4288"
      > </a
      ><a name="4289" class="Symbol"
      >|</a
      ><a name="4290"
      > </a
      ><a name="4291" href="https://agda.github.io/agda-stdlib/Data.Sum.html#489" class="InductiveConstructor"
      >inj&#8321;</a
      ><a name="4295"
      > </a
      ><a name="4296" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="4300"
      > </a
      ><a name="4301" class="Symbol"
      >=</a
      ><a name="4302"
      > </a
      ><a name="4303" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="4307"
      > </a
      ><a name="4308" class="Symbol"
      >(_</a
      ><a name="4310"
      > </a
      ><a name="4311" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="4312"
      > </a
      ><a name="4313" href="Stlc.html#15615" class="InductiveConstructor"
      >iftrue</a
      ><a name="4319" class="Symbol"
      >)</a
      ><a name="4320"
      >
</a
      ><a name="4321" class="Symbol"
      >...</a
      ><a name="4324"
      > </a
      ><a name="4325" class="Symbol"
      >|</a
      ><a name="4326"
      > </a
      ><a name="4327" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="4331"
      > </a
      ><a name="4332" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="4336"
      > </a
      ><a name="4337" class="Symbol"
      >=</a
      ><a name="4338"
      > </a
      ><a name="4339" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="4343"
      > </a
      ><a name="4344" class="Symbol"
      >(_</a
      ><a name="4346"
      > </a
      ><a name="4347" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="4348"
      > </a
      ><a name="4349" href="Stlc.html#15675" class="InductiveConstructor"
      >iffalse</a
      ><a name="4356" class="Symbol"
      >)</a
      >
</pre><!--{% endraw %}-->

#### Exercise: 3 stars, optional (progress_from_term_ind)
Show that progress can also be proved by induction on terms
instead of induction on typing derivations.

<!--{% raw %}--><pre class="Agda">
<a name="4546" class="Keyword"
      >postulate</a
      ><a name="4555"
      >
  </a
      ><a name="4558" href="StlcProp.html#4558" class="Postulate"
      >progress&#8242;</a
      ><a name="4567"
      > </a
      ><a name="4568" class="Symbol"
      >:</a
      ><a name="4569"
      > </a
      ><a name="4570" class="Symbol"
      >&#8704;</a
      ><a name="4571"
      > </a
      ><a name="4572" class="Symbol"
      >{</a
      ><a name="4573" href="StlcProp.html#4573" class="Bound"
      >t</a
      ><a name="4574"
      > </a
      ><a name="4575" href="StlcProp.html#4575" class="Bound"
      >A</a
      ><a name="4576" class="Symbol"
      >}</a
      ><a name="4577"
      > </a
      ><a name="4578" class="Symbol"
      >&#8594;</a
      ><a name="4579"
      > </a
      ><a name="4580" href="Stlc.html#18297" class="Function"
      >&#8709;</a
      ><a name="4581"
      > </a
      ><a name="4582" href="Stlc.html#19229" class="Datatype Operator"
      >&#8866;</a
      ><a name="4583"
      > </a
      ><a name="4584" href="StlcProp.html#4573" class="Bound"
      >t</a
      ><a name="4585"
      > </a
      ><a name="4586" href="Stlc.html#19229" class="Datatype Operator"
      >&#8758;</a
      ><a name="4587"
      > </a
      ><a name="4588" href="StlcProp.html#4575" class="Bound"
      >A</a
      ><a name="4589"
      > </a
      ><a name="4590" class="Symbol"
      >&#8594;</a
      ><a name="4591"
      > </a
      ><a name="4592" href="Stlc.html#9078" class="Datatype"
      >Value</a
      ><a name="4597"
      > </a
      ><a name="4598" href="StlcProp.html#4573" class="Bound"
      >t</a
      ><a name="4599"
      > </a
      ><a name="4600" href="https://agda.github.io/agda-stdlib/Data.Sum.html#433" class="Datatype Operator"
      >&#8846;</a
      ><a name="4601"
      > </a
      ><a name="4602" href="https://agda.github.io/agda-stdlib/Data.Product.html#823" class="Function"
      >&#8707;</a
      ><a name="4603"
      > </a
      ><a name="4604" class="Symbol"
      >&#955;</a
      ><a name="4605"
      > </a
      ><a name="4606" href="StlcProp.html#4606" class="Bound"
      >t&#8242;</a
      ><a name="4608"
      > </a
      ><a name="4609" class="Symbol"
      >&#8594;</a
      ><a name="4610"
      > </a
      ><a name="4611" href="StlcProp.html#4573" class="Bound"
      >t</a
      ><a name="4612"
      > </a
      ><a name="4613" href="Stlc.html#15215" class="Datatype Operator"
      >==&gt;</a
      ><a name="4616"
      > </a
      ><a name="4617" href="StlcProp.html#4606" class="Bound"
      >t&#8242;</a
      >
</pre><!--{% endraw %}-->

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

<!--{% raw %}--><pre class="Agda">
<a name="7040" class="Keyword"
      >data</a
      ><a name="7044"
      > </a
      ><a name="7045" href="StlcProp.html#7045" class="Datatype Operator"
      >_FreeIn_</a
      ><a name="7053"
      > </a
      ><a name="7054" class="Symbol"
      >(</a
      ><a name="7055" href="StlcProp.html#7055" class="Bound"
      >x</a
      ><a name="7056"
      > </a
      ><a name="7057" class="Symbol"
      >:</a
      ><a name="7058"
      > </a
      ><a name="7059" href="Maps.html#2638" class="Datatype"
      >Id</a
      ><a name="7061" class="Symbol"
      >)</a
      ><a name="7062"
      > </a
      ><a name="7063" class="Symbol"
      >:</a
      ><a name="7064"
      > </a
      ><a name="7065" href="Stlc.html#5753" class="Datatype"
      >Term</a
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
      ><a name="7084" href="StlcProp.html#7084" class="InductiveConstructor"
      >var</a
      ><a name="7087"
      >  </a
      ><a name="7089" class="Symbol"
      >:</a
      ><a name="7090"
      > </a
      ><a name="7091" href="StlcProp.html#7055" class="Bound"
      >x</a
      ><a name="7092"
      > </a
      ><a name="7093" href="StlcProp.html#7045" class="Datatype Operator"
      >FreeIn</a
      ><a name="7099"
      > </a
      ><a name="7100" href="Stlc.html#5772" class="InductiveConstructor"
      >var</a
      ><a name="7103"
      > </a
      ><a name="7104" href="StlcProp.html#7055" class="Bound"
      >x</a
      ><a name="7105"
      >
  </a
      ><a name="7108" href="StlcProp.html#7108" class="InductiveConstructor"
      >abs</a
      ><a name="7111"
      >  </a
      ><a name="7113" class="Symbol"
      >:</a
      ><a name="7114"
      > </a
      ><a name="7115" class="Symbol"
      >&#8704;</a
      ><a name="7116"
      > </a
      ><a name="7117" class="Symbol"
      >{</a
      ><a name="7118" href="StlcProp.html#7118" class="Bound"
      >y</a
      ><a name="7119"
      > </a
      ><a name="7120" href="StlcProp.html#7120" class="Bound"
      >A</a
      ><a name="7121"
      > </a
      ><a name="7122" href="StlcProp.html#7122" class="Bound"
      >t</a
      ><a name="7123" class="Symbol"
      >}</a
      ><a name="7124"
      > </a
      ><a name="7125" class="Symbol"
      >&#8594;</a
      ><a name="7126"
      > </a
      ><a name="7127" href="StlcProp.html#7118" class="Bound"
      >y</a
      ><a name="7128"
      > </a
      ><a name="7129" href="https://agda.github.io/agda-stdlib/Relation.Binary.Core.html#4493" class="Function Operator"
      >&#8802;</a
      ><a name="7130"
      > </a
      ><a name="7131" href="StlcProp.html#7055" class="Bound"
      >x</a
      ><a name="7132"
      > </a
      ><a name="7133" class="Symbol"
      >&#8594;</a
      ><a name="7134"
      > </a
      ><a name="7135" href="StlcProp.html#7055" class="Bound"
      >x</a
      ><a name="7136"
      > </a
      ><a name="7137" href="StlcProp.html#7045" class="Datatype Operator"
      >FreeIn</a
      ><a name="7143"
      > </a
      ><a name="7144" href="StlcProp.html#7122" class="Bound"
      >t</a
      ><a name="7145"
      > </a
      ><a name="7146" class="Symbol"
      >&#8594;</a
      ><a name="7147"
      > </a
      ><a name="7148" href="StlcProp.html#7055" class="Bound"
      >x</a
      ><a name="7149"
      > </a
      ><a name="7150" href="StlcProp.html#7045" class="Datatype Operator"
      >FreeIn</a
      ><a name="7156"
      > </a
      ><a name="7157" href="Stlc.html#5821" class="InductiveConstructor"
      >abs</a
      ><a name="7160"
      > </a
      ><a name="7161" href="StlcProp.html#7118" class="Bound"
      >y</a
      ><a name="7162"
      > </a
      ><a name="7163" href="StlcProp.html#7120" class="Bound"
      >A</a
      ><a name="7164"
      > </a
      ><a name="7165" href="StlcProp.html#7122" class="Bound"
      >t</a
      ><a name="7166"
      >
  </a
      ><a name="7169" href="StlcProp.html#7169" class="InductiveConstructor"
      >app1</a
      ><a name="7173"
      > </a
      ><a name="7174" class="Symbol"
      >:</a
      ><a name="7175"
      > </a
      ><a name="7176" class="Symbol"
      >&#8704;</a
      ><a name="7177"
      > </a
      ><a name="7178" class="Symbol"
      >{</a
      ><a name="7179" href="StlcProp.html#7179" class="Bound"
      >t&#8321;</a
      ><a name="7181"
      > </a
      ><a name="7182" href="StlcProp.html#7182" class="Bound"
      >t&#8322;</a
      ><a name="7184" class="Symbol"
      >}</a
      ><a name="7185"
      > </a
      ><a name="7186" class="Symbol"
      >&#8594;</a
      ><a name="7187"
      > </a
      ><a name="7188" href="StlcProp.html#7055" class="Bound"
      >x</a
      ><a name="7189"
      > </a
      ><a name="7190" href="StlcProp.html#7045" class="Datatype Operator"
      >FreeIn</a
      ><a name="7196"
      > </a
      ><a name="7197" href="StlcProp.html#7179" class="Bound"
      >t&#8321;</a
      ><a name="7199"
      > </a
      ><a name="7200" class="Symbol"
      >&#8594;</a
      ><a name="7201"
      > </a
      ><a name="7202" href="StlcProp.html#7055" class="Bound"
      >x</a
      ><a name="7203"
      > </a
      ><a name="7204" href="StlcProp.html#7045" class="Datatype Operator"
      >FreeIn</a
      ><a name="7210"
      > </a
      ><a name="7211" href="Stlc.html#5792" class="InductiveConstructor"
      >app</a
      ><a name="7214"
      > </a
      ><a name="7215" href="StlcProp.html#7179" class="Bound"
      >t&#8321;</a
      ><a name="7217"
      > </a
      ><a name="7218" href="StlcProp.html#7182" class="Bound"
      >t&#8322;</a
      ><a name="7220"
      >
  </a
      ><a name="7223" href="StlcProp.html#7223" class="InductiveConstructor"
      >app2</a
      ><a name="7227"
      > </a
      ><a name="7228" class="Symbol"
      >:</a
      ><a name="7229"
      > </a
      ><a name="7230" class="Symbol"
      >&#8704;</a
      ><a name="7231"
      > </a
      ><a name="7232" class="Symbol"
      >{</a
      ><a name="7233" href="StlcProp.html#7233" class="Bound"
      >t&#8321;</a
      ><a name="7235"
      > </a
      ><a name="7236" href="StlcProp.html#7236" class="Bound"
      >t&#8322;</a
      ><a name="7238" class="Symbol"
      >}</a
      ><a name="7239"
      > </a
      ><a name="7240" class="Symbol"
      >&#8594;</a
      ><a name="7241"
      > </a
      ><a name="7242" href="StlcProp.html#7055" class="Bound"
      >x</a
      ><a name="7243"
      > </a
      ><a name="7244" href="StlcProp.html#7045" class="Datatype Operator"
      >FreeIn</a
      ><a name="7250"
      > </a
      ><a name="7251" href="StlcProp.html#7236" class="Bound"
      >t&#8322;</a
      ><a name="7253"
      > </a
      ><a name="7254" class="Symbol"
      >&#8594;</a
      ><a name="7255"
      > </a
      ><a name="7256" href="StlcProp.html#7055" class="Bound"
      >x</a
      ><a name="7257"
      > </a
      ><a name="7258" href="StlcProp.html#7045" class="Datatype Operator"
      >FreeIn</a
      ><a name="7264"
      > </a
      ><a name="7265" href="Stlc.html#5792" class="InductiveConstructor"
      >app</a
      ><a name="7268"
      > </a
      ><a name="7269" href="StlcProp.html#7233" class="Bound"
      >t&#8321;</a
      ><a name="7271"
      > </a
      ><a name="7272" href="StlcProp.html#7236" class="Bound"
      >t&#8322;</a
      ><a name="7274"
      >
  </a
      ><a name="7277" href="StlcProp.html#7277" class="InductiveConstructor"
      >if1</a
      ><a name="7280"
      >  </a
      ><a name="7282" class="Symbol"
      >:</a
      ><a name="7283"
      > </a
      ><a name="7284" class="Symbol"
      >&#8704;</a
      ><a name="7285"
      > </a
      ><a name="7286" class="Symbol"
      >{</a
      ><a name="7287" href="StlcProp.html#7287" class="Bound"
      >t&#8321;</a
      ><a name="7289"
      > </a
      ><a name="7290" href="StlcProp.html#7290" class="Bound"
      >t&#8322;</a
      ><a name="7292"
      > </a
      ><a name="7293" href="StlcProp.html#7293" class="Bound"
      >t&#8323;</a
      ><a name="7295" class="Symbol"
      >}</a
      ><a name="7296"
      > </a
      ><a name="7297" class="Symbol"
      >&#8594;</a
      ><a name="7298"
      > </a
      ><a name="7299" href="StlcProp.html#7055" class="Bound"
      >x</a
      ><a name="7300"
      > </a
      ><a name="7301" href="StlcProp.html#7045" class="Datatype Operator"
      >FreeIn</a
      ><a name="7307"
      > </a
      ><a name="7308" href="StlcProp.html#7287" class="Bound"
      >t&#8321;</a
      ><a name="7310"
      > </a
      ><a name="7311" class="Symbol"
      >&#8594;</a
      ><a name="7312"
      > </a
      ><a name="7313" href="StlcProp.html#7055" class="Bound"
      >x</a
      ><a name="7314"
      > </a
      ><a name="7315" href="StlcProp.html#7045" class="Datatype Operator"
      >FreeIn</a
      ><a name="7321"
      > </a
      ><a name="7322" class="Symbol"
      >(</a
      ><a name="7323" href="Stlc.html#5885" class="InductiveConstructor Operator"
      >if</a
      ><a name="7325"
      > </a
      ><a name="7326" href="StlcProp.html#7287" class="Bound"
      >t&#8321;</a
      ><a name="7328"
      > </a
      ><a name="7329" href="Stlc.html#5885" class="InductiveConstructor Operator"
      >then</a
      ><a name="7333"
      > </a
      ><a name="7334" href="StlcProp.html#7290" class="Bound"
      >t&#8322;</a
      ><a name="7336"
      > </a
      ><a name="7337" href="Stlc.html#5885" class="InductiveConstructor Operator"
      >else</a
      ><a name="7341"
      > </a
      ><a name="7342" href="StlcProp.html#7293" class="Bound"
      >t&#8323;</a
      ><a name="7344" class="Symbol"
      >)</a
      ><a name="7345"
      >
  </a
      ><a name="7348" href="StlcProp.html#7348" class="InductiveConstructor"
      >if2</a
      ><a name="7351"
      >  </a
      ><a name="7353" class="Symbol"
      >:</a
      ><a name="7354"
      > </a
      ><a name="7355" class="Symbol"
      >&#8704;</a
      ><a name="7356"
      > </a
      ><a name="7357" class="Symbol"
      >{</a
      ><a name="7358" href="StlcProp.html#7358" class="Bound"
      >t&#8321;</a
      ><a name="7360"
      > </a
      ><a name="7361" href="StlcProp.html#7361" class="Bound"
      >t&#8322;</a
      ><a name="7363"
      > </a
      ><a name="7364" href="StlcProp.html#7364" class="Bound"
      >t&#8323;</a
      ><a name="7366" class="Symbol"
      >}</a
      ><a name="7367"
      > </a
      ><a name="7368" class="Symbol"
      >&#8594;</a
      ><a name="7369"
      > </a
      ><a name="7370" href="StlcProp.html#7055" class="Bound"
      >x</a
      ><a name="7371"
      > </a
      ><a name="7372" href="StlcProp.html#7045" class="Datatype Operator"
      >FreeIn</a
      ><a name="7378"
      > </a
      ><a name="7379" href="StlcProp.html#7361" class="Bound"
      >t&#8322;</a
      ><a name="7381"
      > </a
      ><a name="7382" class="Symbol"
      >&#8594;</a
      ><a name="7383"
      > </a
      ><a name="7384" href="StlcProp.html#7055" class="Bound"
      >x</a
      ><a name="7385"
      > </a
      ><a name="7386" href="StlcProp.html#7045" class="Datatype Operator"
      >FreeIn</a
      ><a name="7392"
      > </a
      ><a name="7393" class="Symbol"
      >(</a
      ><a name="7394" href="Stlc.html#5885" class="InductiveConstructor Operator"
      >if</a
      ><a name="7396"
      > </a
      ><a name="7397" href="StlcProp.html#7358" class="Bound"
      >t&#8321;</a
      ><a name="7399"
      > </a
      ><a name="7400" href="Stlc.html#5885" class="InductiveConstructor Operator"
      >then</a
      ><a name="7404"
      > </a
      ><a name="7405" href="StlcProp.html#7361" class="Bound"
      >t&#8322;</a
      ><a name="7407"
      > </a
      ><a name="7408" href="Stlc.html#5885" class="InductiveConstructor Operator"
      >else</a
      ><a name="7412"
      > </a
      ><a name="7413" href="StlcProp.html#7364" class="Bound"
      >t&#8323;</a
      ><a name="7415" class="Symbol"
      >)</a
      ><a name="7416"
      >
  </a
      ><a name="7419" href="StlcProp.html#7419" class="InductiveConstructor"
      >if3</a
      ><a name="7422"
      >  </a
      ><a name="7424" class="Symbol"
      >:</a
      ><a name="7425"
      > </a
      ><a name="7426" class="Symbol"
      >&#8704;</a
      ><a name="7427"
      > </a
      ><a name="7428" class="Symbol"
      >{</a
      ><a name="7429" href="StlcProp.html#7429" class="Bound"
      >t&#8321;</a
      ><a name="7431"
      > </a
      ><a name="7432" href="StlcProp.html#7432" class="Bound"
      >t&#8322;</a
      ><a name="7434"
      > </a
      ><a name="7435" href="StlcProp.html#7435" class="Bound"
      >t&#8323;</a
      ><a name="7437" class="Symbol"
      >}</a
      ><a name="7438"
      > </a
      ><a name="7439" class="Symbol"
      >&#8594;</a
      ><a name="7440"
      > </a
      ><a name="7441" href="StlcProp.html#7055" class="Bound"
      >x</a
      ><a name="7442"
      > </a
      ><a name="7443" href="StlcProp.html#7045" class="Datatype Operator"
      >FreeIn</a
      ><a name="7449"
      > </a
      ><a name="7450" href="StlcProp.html#7435" class="Bound"
      >t&#8323;</a
      ><a name="7452"
      > </a
      ><a name="7453" class="Symbol"
      >&#8594;</a
      ><a name="7454"
      > </a
      ><a name="7455" href="StlcProp.html#7055" class="Bound"
      >x</a
      ><a name="7456"
      > </a
      ><a name="7457" href="StlcProp.html#7045" class="Datatype Operator"
      >FreeIn</a
      ><a name="7463"
      > </a
      ><a name="7464" class="Symbol"
      >(</a
      ><a name="7465" href="Stlc.html#5885" class="InductiveConstructor Operator"
      >if</a
      ><a name="7467"
      > </a
      ><a name="7468" href="StlcProp.html#7429" class="Bound"
      >t&#8321;</a
      ><a name="7470"
      > </a
      ><a name="7471" href="Stlc.html#5885" class="InductiveConstructor Operator"
      >then</a
      ><a name="7475"
      > </a
      ><a name="7476" href="StlcProp.html#7432" class="Bound"
      >t&#8322;</a
      ><a name="7478"
      > </a
      ><a name="7479" href="Stlc.html#5885" class="InductiveConstructor Operator"
      >else</a
      ><a name="7483"
      > </a
      ><a name="7484" href="StlcProp.html#7435" class="Bound"
      >t&#8323;</a
      ><a name="7486" class="Symbol"
      >)</a
      >
</pre><!--{% endraw %}-->

A term in which no variables appear free is said to be _closed_.

<!--{% raw %}--><pre class="Agda">
<a name="7579" href="StlcProp.html#7579" class="Function"
      >Closed</a
      ><a name="7585"
      > </a
      ><a name="7586" class="Symbol"
      >:</a
      ><a name="7587"
      > </a
      ><a name="7588" href="Stlc.html#5753" class="Datatype"
      >Term</a
      ><a name="7592"
      > </a
      ><a name="7593" class="Symbol"
      >&#8594;</a
      ><a name="7594"
      > </a
      ><a name="7595" class="PrimitiveType"
      >Set</a
      ><a name="7598"
      >
</a
      ><a name="7599" href="StlcProp.html#7579" class="Function"
      >Closed</a
      ><a name="7605"
      > </a
      ><a name="7606" href="StlcProp.html#7606" class="Bound"
      >t</a
      ><a name="7607"
      > </a
      ><a name="7608" class="Symbol"
      >=</a
      ><a name="7609"
      > </a
      ><a name="7610" class="Symbol"
      >&#8704;</a
      ><a name="7611"
      > </a
      ><a name="7612" class="Symbol"
      >{</a
      ><a name="7613" href="StlcProp.html#7613" class="Bound"
      >x</a
      ><a name="7614" class="Symbol"
      >}</a
      ><a name="7615"
      > </a
      ><a name="7616" class="Symbol"
      >&#8594;</a
      ><a name="7617"
      > </a
      ><a name="7618" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#414" class="Function Operator"
      >&#172;</a
      ><a name="7619"
      > </a
      ><a name="7620" class="Symbol"
      >(</a
      ><a name="7621" href="StlcProp.html#7613" class="Bound"
      >x</a
      ><a name="7622"
      > </a
      ><a name="7623" href="StlcProp.html#7045" class="Datatype Operator"
      >FreeIn</a
      ><a name="7629"
      > </a
      ><a name="7630" href="StlcProp.html#7606" class="Bound"
      >t</a
      ><a name="7631" class="Symbol"
      >)</a
      >
</pre><!--{% endraw %}-->

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

<!--{% raw %}--><pre class="Agda">
<a name="8360" href="StlcProp.html#8360" class="Function"
      >freeInCtxt</a
      ><a name="8370"
      > </a
      ><a name="8371" class="Symbol"
      >:</a
      ><a name="8372"
      > </a
      ><a name="8373" class="Symbol"
      >&#8704;</a
      ><a name="8374"
      > </a
      ><a name="8375" class="Symbol"
      >{</a
      ><a name="8376" href="StlcProp.html#8376" class="Bound"
      >x</a
      ><a name="8377"
      > </a
      ><a name="8378" href="StlcProp.html#8378" class="Bound"
      >t</a
      ><a name="8379"
      > </a
      ><a name="8380" href="StlcProp.html#8380" class="Bound"
      >A</a
      ><a name="8381"
      > </a
      ><a name="8382" href="StlcProp.html#8382" class="Bound"
      >&#915;</a
      ><a name="8383" class="Symbol"
      >}</a
      ><a name="8384"
      > </a
      ><a name="8385" class="Symbol"
      >&#8594;</a
      ><a name="8386"
      > </a
      ><a name="8387" href="StlcProp.html#8376" class="Bound"
      >x</a
      ><a name="8388"
      > </a
      ><a name="8389" href="StlcProp.html#7045" class="Datatype Operator"
      >FreeIn</a
      ><a name="8395"
      > </a
      ><a name="8396" href="StlcProp.html#8378" class="Bound"
      >t</a
      ><a name="8397"
      > </a
      ><a name="8398" class="Symbol"
      >&#8594;</a
      ><a name="8399"
      > </a
      ><a name="8400" href="StlcProp.html#8382" class="Bound"
      >&#915;</a
      ><a name="8401"
      > </a
      ><a name="8402" href="Stlc.html#19229" class="Datatype Operator"
      >&#8866;</a
      ><a name="8403"
      > </a
      ><a name="8404" href="StlcProp.html#8378" class="Bound"
      >t</a
      ><a name="8405"
      > </a
      ><a name="8406" href="Stlc.html#19229" class="Datatype Operator"
      >&#8758;</a
      ><a name="8407"
      > </a
      ><a name="8408" href="StlcProp.html#8380" class="Bound"
      >A</a
      ><a name="8409"
      > </a
      ><a name="8410" class="Symbol"
      >&#8594;</a
      ><a name="8411"
      > </a
      ><a name="8412" href="https://agda.github.io/agda-stdlib/Data.Product.html#823" class="Function"
      >&#8707;</a
      ><a name="8413"
      > </a
      ><a name="8414" class="Symbol"
      >&#955;</a
      ><a name="8415"
      > </a
      ><a name="8416" href="StlcProp.html#8416" class="Bound"
      >B</a
      ><a name="8417"
      > </a
      ><a name="8418" class="Symbol"
      >&#8594;</a
      ><a name="8419"
      > </a
      ><a name="8420" href="StlcProp.html#8382" class="Bound"
      >&#915;</a
      ><a name="8421"
      > </a
      ><a name="8422" href="StlcProp.html#8376" class="Bound"
      >x</a
      ><a name="8423"
      > </a
      ><a name="8424" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="8425"
      > </a
      ><a name="8426" href="https://agda.github.io/agda-stdlib/Data.Maybe.Base.html#373" class="InductiveConstructor"
      >just</a
      ><a name="8430"
      > </a
      ><a name="8431" href="StlcProp.html#8416" class="Bound"
      >B</a
      >
</pre><!--{% endraw %}-->

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

<!--{% raw %}--><pre class="Agda">
<a name="10027" href="StlcProp.html#8360" class="Function"
      >freeInCtxt</a
      ><a name="10037"
      > </a
      ><a name="10038" href="StlcProp.html#7084" class="InductiveConstructor"
      >var</a
      ><a name="10041"
      > </a
      ><a name="10042" class="Symbol"
      >(</a
      ><a name="10043" href="Stlc.html#19273" class="InductiveConstructor"
      >var</a
      ><a name="10046"
      > </a
      ><a name="10047" class="Symbol"
      >_</a
      ><a name="10048"
      > </a
      ><a name="10049" href="StlcProp.html#10049" class="Bound"
      >x&#8758;A</a
      ><a name="10052" class="Symbol"
      >)</a
      ><a name="10053"
      > </a
      ><a name="10054" class="Symbol"
      >=</a
      ><a name="10055"
      > </a
      ><a name="10056" class="Symbol"
      >(_</a
      ><a name="10058"
      > </a
      ><a name="10059" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="10060"
      > </a
      ><a name="10061" href="StlcProp.html#10049" class="Bound"
      >x&#8758;A</a
      ><a name="10064" class="Symbol"
      >)</a
      ><a name="10065"
      >
</a
      ><a name="10066" href="StlcProp.html#8360" class="Function"
      >freeInCtxt</a
      ><a name="10076"
      > </a
      ><a name="10077" class="Symbol"
      >(</a
      ><a name="10078" href="StlcProp.html#7169" class="InductiveConstructor"
      >app1</a
      ><a name="10082"
      > </a
      ><a name="10083" href="StlcProp.html#10083" class="Bound"
      >x&#8712;t&#8321;</a
      ><a name="10087" class="Symbol"
      >)</a
      ><a name="10088"
      > </a
      ><a name="10089" class="Symbol"
      >(</a
      ><a name="10090" href="Stlc.html#19482" class="InductiveConstructor"
      >app</a
      ><a name="10093"
      > </a
      ><a name="10094" href="StlcProp.html#10094" class="Bound"
      >t&#8321;&#8758;A</a
      ><a name="10098"
      > </a
      ><a name="10099" class="Symbol"
      >_</a
      ><a name="10100"
      >   </a
      ><a name="10103" class="Symbol"
      >)</a
      ><a name="10104"
      > </a
      ><a name="10105" class="Symbol"
      >=</a
      ><a name="10106"
      > </a
      ><a name="10107" href="StlcProp.html#8360" class="Function"
      >freeInCtxt</a
      ><a name="10117"
      > </a
      ><a name="10118" href="StlcProp.html#10083" class="Bound"
      >x&#8712;t&#8321;</a
      ><a name="10122"
      > </a
      ><a name="10123" href="StlcProp.html#10094" class="Bound"
      >t&#8321;&#8758;A</a
      ><a name="10127"
      >
</a
      ><a name="10128" href="StlcProp.html#8360" class="Function"
      >freeInCtxt</a
      ><a name="10138"
      > </a
      ><a name="10139" class="Symbol"
      >(</a
      ><a name="10140" href="StlcProp.html#7223" class="InductiveConstructor"
      >app2</a
      ><a name="10144"
      > </a
      ><a name="10145" href="StlcProp.html#10145" class="Bound"
      >x&#8712;t&#8322;</a
      ><a name="10149" class="Symbol"
      >)</a
      ><a name="10150"
      > </a
      ><a name="10151" class="Symbol"
      >(</a
      ><a name="10152" href="Stlc.html#19482" class="InductiveConstructor"
      >app</a
      ><a name="10155"
      > </a
      ><a name="10156" class="Symbol"
      >_</a
      ><a name="10157"
      >    </a
      ><a name="10161" href="StlcProp.html#10161" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="10165" class="Symbol"
      >)</a
      ><a name="10166"
      > </a
      ><a name="10167" class="Symbol"
      >=</a
      ><a name="10168"
      > </a
      ><a name="10169" href="StlcProp.html#8360" class="Function"
      >freeInCtxt</a
      ><a name="10179"
      > </a
      ><a name="10180" href="StlcProp.html#10145" class="Bound"
      >x&#8712;t&#8322;</a
      ><a name="10184"
      > </a
      ><a name="10185" href="StlcProp.html#10161" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="10189"
      >
</a
      ><a name="10190" href="StlcProp.html#8360" class="Function"
      >freeInCtxt</a
      ><a name="10200"
      > </a
      ><a name="10201" class="Symbol"
      >(</a
      ><a name="10202" href="StlcProp.html#7277" class="InductiveConstructor"
      >if1</a
      ><a name="10205"
      >  </a
      ><a name="10207" href="StlcProp.html#10207" class="Bound"
      >x&#8712;t&#8321;</a
      ><a name="10211" class="Symbol"
      >)</a
      ><a name="10212"
      > </a
      ><a name="10213" class="Symbol"
      >(</a
      ><a name="10214" href="Stlc.html#19734" class="InductiveConstructor Operator"
      >if</a
      ><a name="10216"
      > </a
      ><a name="10217" href="StlcProp.html#10217" class="Bound"
      >t&#8321;&#8758;A</a
      ><a name="10221"
      > </a
      ><a name="10222" href="Stlc.html#19734" class="InductiveConstructor Operator"
      >then</a
      ><a name="10226"
      > </a
      ><a name="10227" class="Symbol"
      >_</a
      ><a name="10228"
      >    </a
      ><a name="10232" href="Stlc.html#19734" class="InductiveConstructor Operator"
      >else</a
      ><a name="10236"
      > </a
      ><a name="10237" class="Symbol"
      >_</a
      ><a name="10238"
      >   </a
      ><a name="10241" class="Symbol"
      >)</a
      ><a name="10242"
      > </a
      ><a name="10243" class="Symbol"
      >=</a
      ><a name="10244"
      > </a
      ><a name="10245" href="StlcProp.html#8360" class="Function"
      >freeInCtxt</a
      ><a name="10255"
      > </a
      ><a name="10256" href="StlcProp.html#10207" class="Bound"
      >x&#8712;t&#8321;</a
      ><a name="10260"
      > </a
      ><a name="10261" href="StlcProp.html#10217" class="Bound"
      >t&#8321;&#8758;A</a
      ><a name="10265"
      >
</a
      ><a name="10266" href="StlcProp.html#8360" class="Function"
      >freeInCtxt</a
      ><a name="10276"
      > </a
      ><a name="10277" class="Symbol"
      >(</a
      ><a name="10278" href="StlcProp.html#7348" class="InductiveConstructor"
      >if2</a
      ><a name="10281"
      >  </a
      ><a name="10283" href="StlcProp.html#10283" class="Bound"
      >x&#8712;t&#8322;</a
      ><a name="10287" class="Symbol"
      >)</a
      ><a name="10288"
      > </a
      ><a name="10289" class="Symbol"
      >(</a
      ><a name="10290" href="Stlc.html#19734" class="InductiveConstructor Operator"
      >if</a
      ><a name="10292"
      > </a
      ><a name="10293" class="Symbol"
      >_</a
      ><a name="10294"
      >    </a
      ><a name="10298" href="Stlc.html#19734" class="InductiveConstructor Operator"
      >then</a
      ><a name="10302"
      > </a
      ><a name="10303" href="StlcProp.html#10303" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="10307"
      > </a
      ><a name="10308" href="Stlc.html#19734" class="InductiveConstructor Operator"
      >else</a
      ><a name="10312"
      > </a
      ><a name="10313" class="Symbol"
      >_</a
      ><a name="10314"
      >   </a
      ><a name="10317" class="Symbol"
      >)</a
      ><a name="10318"
      > </a
      ><a name="10319" class="Symbol"
      >=</a
      ><a name="10320"
      > </a
      ><a name="10321" href="StlcProp.html#8360" class="Function"
      >freeInCtxt</a
      ><a name="10331"
      > </a
      ><a name="10332" href="StlcProp.html#10283" class="Bound"
      >x&#8712;t&#8322;</a
      ><a name="10336"
      > </a
      ><a name="10337" href="StlcProp.html#10303" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="10341"
      >
</a
      ><a name="10342" href="StlcProp.html#8360" class="Function"
      >freeInCtxt</a
      ><a name="10352"
      > </a
      ><a name="10353" class="Symbol"
      >(</a
      ><a name="10354" href="StlcProp.html#7419" class="InductiveConstructor"
      >if3</a
      ><a name="10357"
      >  </a
      ><a name="10359" href="StlcProp.html#10359" class="Bound"
      >x&#8712;t&#8323;</a
      ><a name="10363" class="Symbol"
      >)</a
      ><a name="10364"
      > </a
      ><a name="10365" class="Symbol"
      >(</a
      ><a name="10366" href="Stlc.html#19734" class="InductiveConstructor Operator"
      >if</a
      ><a name="10368"
      > </a
      ><a name="10369" class="Symbol"
      >_</a
      ><a name="10370"
      >    </a
      ><a name="10374" href="Stlc.html#19734" class="InductiveConstructor Operator"
      >then</a
      ><a name="10378"
      > </a
      ><a name="10379" class="Symbol"
      >_</a
      ><a name="10380"
      >    </a
      ><a name="10384" href="Stlc.html#19734" class="InductiveConstructor Operator"
      >else</a
      ><a name="10388"
      > </a
      ><a name="10389" href="StlcProp.html#10389" class="Bound"
      >t&#8323;&#8758;A</a
      ><a name="10393" class="Symbol"
      >)</a
      ><a name="10394"
      > </a
      ><a name="10395" class="Symbol"
      >=</a
      ><a name="10396"
      > </a
      ><a name="10397" href="StlcProp.html#8360" class="Function"
      >freeInCtxt</a
      ><a name="10407"
      > </a
      ><a name="10408" href="StlcProp.html#10359" class="Bound"
      >x&#8712;t&#8323;</a
      ><a name="10412"
      > </a
      ><a name="10413" href="StlcProp.html#10389" class="Bound"
      >t&#8323;&#8758;A</a
      ><a name="10417"
      >
</a
      ><a name="10418" href="StlcProp.html#8360" class="Function"
      >freeInCtxt</a
      ><a name="10428"
      > </a
      ><a name="10429" class="Symbol"
      >{</a
      ><a name="10430" href="StlcProp.html#10430" class="Bound"
      >x</a
      ><a name="10431" class="Symbol"
      >}</a
      ><a name="10432"
      > </a
      ><a name="10433" class="Symbol"
      >(</a
      ><a name="10434" href="StlcProp.html#7108" class="InductiveConstructor"
      >abs</a
      ><a name="10437"
      > </a
      ><a name="10438" class="Symbol"
      >{</a
      ><a name="10439" href="StlcProp.html#10439" class="Bound"
      >y</a
      ><a name="10440" class="Symbol"
      >}</a
      ><a name="10441"
      > </a
      ><a name="10442" href="StlcProp.html#10442" class="Bound"
      >y&#8800;x</a
      ><a name="10445"
      > </a
      ><a name="10446" href="StlcProp.html#10446" class="Bound"
      >x&#8712;t</a
      ><a name="10449" class="Symbol"
      >)</a
      ><a name="10450"
      > </a
      ><a name="10451" class="Symbol"
      >(</a
      ><a name="10452" href="Stlc.html#19366" class="InductiveConstructor"
      >abs</a
      ><a name="10455"
      > </a
      ><a name="10456" href="StlcProp.html#10456" class="Bound"
      >t&#8758;B</a
      ><a name="10459" class="Symbol"
      >)</a
      ><a name="10460"
      >
    </a
      ><a name="10465" class="Keyword"
      >with</a
      ><a name="10469"
      > </a
      ><a name="10470" href="StlcProp.html#8360" class="Function"
      >freeInCtxt</a
      ><a name="10480"
      > </a
      ><a name="10481" href="StlcProp.html#10446" class="Bound"
      >x&#8712;t</a
      ><a name="10484"
      > </a
      ><a name="10485" href="StlcProp.html#10456" class="Bound"
      >t&#8758;B</a
      ><a name="10488"
      >
</a
      ><a name="10489" class="Symbol"
      >...</a
      ><a name="10492"
      > </a
      ><a name="10493" class="Symbol"
      >|</a
      ><a name="10494"
      > </a
      ><a name="10495" href="StlcProp.html#10495" class="Bound"
      >x&#8758;A</a
      ><a name="10498"
      >
    </a
      ><a name="10503" class="Keyword"
      >with</a
      ><a name="10507"
      > </a
      ><a name="10508" href="StlcProp.html#10439" class="Bound"
      >y</a
      ><a name="10509"
      > </a
      ><a name="10510" href="Maps.html#2692" class="Function Operator"
      >&#8799;</a
      ><a name="10511"
      > </a
      ><a name="10512" href="StlcProp.html#10430" class="Bound"
      >x</a
      ><a name="10513"
      >
</a
      ><a name="10514" class="Symbol"
      >...</a
      ><a name="10517"
      > </a
      ><a name="10518" class="Symbol"
      >|</a
      ><a name="10519"
      > </a
      ><a name="10520" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="10523"
      > </a
      ><a name="10524" href="StlcProp.html#10524" class="Bound"
      >y=x</a
      ><a name="10527"
      > </a
      ><a name="10528" class="Symbol"
      >=</a
      ><a name="10529"
      > </a
      ><a name="10530" href="https://agda.github.io/agda-stdlib/Data.Empty.html#348" class="Function"
      >&#8869;-elim</a
      ><a name="10536"
      > </a
      ><a name="10537" class="Symbol"
      >(</a
      ><a name="10538" href="StlcProp.html#10442" class="Bound"
      >y&#8800;x</a
      ><a name="10541"
      > </a
      ><a name="10542" href="StlcProp.html#10524" class="Bound"
      >y=x</a
      ><a name="10545" class="Symbol"
      >)</a
      ><a name="10546"
      >
</a
      ><a name="10547" class="Symbol"
      >...</a
      ><a name="10550"
      > </a
      ><a name="10551" class="Symbol"
      >|</a
      ><a name="10552"
      > </a
      ><a name="10553" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="10555"
      >  </a
      ><a name="10557" class="Symbol"
      >_</a
      ><a name="10558"
      >   </a
      ><a name="10561" class="Symbol"
      >=</a
      ><a name="10562"
      > </a
      ><a name="10563" href="StlcProp.html#10495" class="Bound"
      >x&#8758;A</a
      >
</pre><!--{% endraw %}-->

Next, we'll need the fact that any term $$t$$ which is well typed in
the empty context is closed (it has no free variables).

#### Exercise: 2 stars, optional (∅⊢-closed)

<!--{% raw %}--><pre class="Agda">
<a name="10764" class="Keyword"
      >postulate</a
      ><a name="10773"
      >
  </a
      ><a name="10776" href="StlcProp.html#10776" class="Postulate"
      >&#8709;&#8866;-closed</a
      ><a name="10785"
      > </a
      ><a name="10786" class="Symbol"
      >:</a
      ><a name="10787"
      > </a
      ><a name="10788" class="Symbol"
      >&#8704;</a
      ><a name="10789"
      > </a
      ><a name="10790" class="Symbol"
      >{</a
      ><a name="10791" href="StlcProp.html#10791" class="Bound"
      >t</a
      ><a name="10792"
      > </a
      ><a name="10793" href="StlcProp.html#10793" class="Bound"
      >A</a
      ><a name="10794" class="Symbol"
      >}</a
      ><a name="10795"
      > </a
      ><a name="10796" class="Symbol"
      >&#8594;</a
      ><a name="10797"
      > </a
      ><a name="10798" href="Stlc.html#18297" class="Function"
      >&#8709;</a
      ><a name="10799"
      > </a
      ><a name="10800" href="Stlc.html#19229" class="Datatype Operator"
      >&#8866;</a
      ><a name="10801"
      > </a
      ><a name="10802" href="StlcProp.html#10791" class="Bound"
      >t</a
      ><a name="10803"
      > </a
      ><a name="10804" href="Stlc.html#19229" class="Datatype Operator"
      >&#8758;</a
      ><a name="10805"
      > </a
      ><a name="10806" href="StlcProp.html#10793" class="Bound"
      >A</a
      ><a name="10807"
      > </a
      ><a name="10808" class="Symbol"
      >&#8594;</a
      ><a name="10809"
      > </a
      ><a name="10810" href="StlcProp.html#7579" class="Function"
      >Closed</a
      ><a name="10816"
      > </a
      ><a name="10817" href="StlcProp.html#10791" class="Bound"
      >t</a
      >
</pre><!--{% endraw %}-->

<div class="hidden">
<!--{% raw %}--><pre class="Agda">
<a name="10865" href="StlcProp.html#10865" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="10875"
      > </a
      ><a name="10876" class="Symbol"
      >:</a
      ><a name="10877"
      > </a
      ><a name="10878" class="Symbol"
      >&#8704;</a
      ><a name="10879"
      > </a
      ><a name="10880" class="Symbol"
      >{</a
      ><a name="10881" href="StlcProp.html#10881" class="Bound"
      >t</a
      ><a name="10882"
      > </a
      ><a name="10883" href="StlcProp.html#10883" class="Bound"
      >A</a
      ><a name="10884" class="Symbol"
      >}</a
      ><a name="10885"
      > </a
      ><a name="10886" class="Symbol"
      >&#8594;</a
      ><a name="10887"
      > </a
      ><a name="10888" href="Stlc.html#18297" class="Function"
      >&#8709;</a
      ><a name="10889"
      > </a
      ><a name="10890" href="Stlc.html#19229" class="Datatype Operator"
      >&#8866;</a
      ><a name="10891"
      > </a
      ><a name="10892" href="StlcProp.html#10881" class="Bound"
      >t</a
      ><a name="10893"
      > </a
      ><a name="10894" href="Stlc.html#19229" class="Datatype Operator"
      >&#8758;</a
      ><a name="10895"
      > </a
      ><a name="10896" href="StlcProp.html#10883" class="Bound"
      >A</a
      ><a name="10897"
      > </a
      ><a name="10898" class="Symbol"
      >&#8594;</a
      ><a name="10899"
      > </a
      ><a name="10900" href="StlcProp.html#7579" class="Function"
      >Closed</a
      ><a name="10906"
      > </a
      ><a name="10907" href="StlcProp.html#10881" class="Bound"
      >t</a
      ><a name="10908"
      >
</a
      ><a name="10909" href="StlcProp.html#10865" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="10919"
      > </a
      ><a name="10920" class="Symbol"
      >(</a
      ><a name="10921" href="Stlc.html#19273" class="InductiveConstructor"
      >var</a
      ><a name="10924"
      > </a
      ><a name="10925" href="StlcProp.html#10925" class="Bound"
      >x</a
      ><a name="10926"
      > </a
      ><a name="10927" class="Symbol"
      >())</a
      ><a name="10930"
      >
</a
      ><a name="10931" href="StlcProp.html#10865" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="10941"
      > </a
      ><a name="10942" class="Symbol"
      >(</a
      ><a name="10943" href="Stlc.html#19482" class="InductiveConstructor"
      >app</a
      ><a name="10946"
      > </a
      ><a name="10947" href="StlcProp.html#10947" class="Bound"
      >t&#8321;&#8758;A&#8658;B</a
      ><a name="10953"
      > </a
      ><a name="10954" href="StlcProp.html#10954" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="10958" class="Symbol"
      >)</a
      ><a name="10959"
      > </a
      ><a name="10960" class="Symbol"
      >(</a
      ><a name="10961" href="StlcProp.html#7169" class="InductiveConstructor"
      >app1</a
      ><a name="10965"
      > </a
      ><a name="10966" href="StlcProp.html#10966" class="Bound"
      >x&#8712;t&#8321;</a
      ><a name="10970" class="Symbol"
      >)</a
      ><a name="10971"
      > </a
      ><a name="10972" class="Symbol"
      >=</a
      ><a name="10973"
      > </a
      ><a name="10974" href="StlcProp.html#10865" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="10984"
      > </a
      ><a name="10985" href="StlcProp.html#10947" class="Bound"
      >t&#8321;&#8758;A&#8658;B</a
      ><a name="10991"
      > </a
      ><a name="10992" href="StlcProp.html#10966" class="Bound"
      >x&#8712;t&#8321;</a
      ><a name="10996"
      >
</a
      ><a name="10997" href="StlcProp.html#10865" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11007"
      > </a
      ><a name="11008" class="Symbol"
      >(</a
      ><a name="11009" href="Stlc.html#19482" class="InductiveConstructor"
      >app</a
      ><a name="11012"
      > </a
      ><a name="11013" href="StlcProp.html#11013" class="Bound"
      >t&#8321;&#8758;A&#8658;B</a
      ><a name="11019"
      > </a
      ><a name="11020" href="StlcProp.html#11020" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="11024" class="Symbol"
      >)</a
      ><a name="11025"
      > </a
      ><a name="11026" class="Symbol"
      >(</a
      ><a name="11027" href="StlcProp.html#7223" class="InductiveConstructor"
      >app2</a
      ><a name="11031"
      > </a
      ><a name="11032" href="StlcProp.html#11032" class="Bound"
      >x&#8712;t&#8322;</a
      ><a name="11036" class="Symbol"
      >)</a
      ><a name="11037"
      > </a
      ><a name="11038" class="Symbol"
      >=</a
      ><a name="11039"
      > </a
      ><a name="11040" href="StlcProp.html#10865" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11050"
      > </a
      ><a name="11051" href="StlcProp.html#11020" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="11055"
      > </a
      ><a name="11056" href="StlcProp.html#11032" class="Bound"
      >x&#8712;t&#8322;</a
      ><a name="11060"
      >
</a
      ><a name="11061" href="StlcProp.html#10865" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11071"
      > </a
      ><a name="11072" href="Stlc.html#19616" class="InductiveConstructor"
      >true</a
      ><a name="11076"
      >  </a
      ><a name="11078" class="Symbol"
      >()</a
      ><a name="11080"
      >
</a
      ><a name="11081" href="StlcProp.html#10865" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11091"
      > </a
      ><a name="11092" href="Stlc.html#19675" class="InductiveConstructor"
      >false</a
      ><a name="11097"
      > </a
      ><a name="11098" class="Symbol"
      >()</a
      ><a name="11100"
      >
</a
      ><a name="11101" href="StlcProp.html#10865" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11111"
      > </a
      ><a name="11112" class="Symbol"
      >(</a
      ><a name="11113" href="Stlc.html#19734" class="InductiveConstructor Operator"
      >if</a
      ><a name="11115"
      > </a
      ><a name="11116" href="StlcProp.html#11116" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="11123"
      > </a
      ><a name="11124" href="Stlc.html#19734" class="InductiveConstructor Operator"
      >then</a
      ><a name="11128"
      > </a
      ><a name="11129" href="StlcProp.html#11129" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="11133"
      > </a
      ><a name="11134" href="Stlc.html#19734" class="InductiveConstructor Operator"
      >else</a
      ><a name="11138"
      > </a
      ><a name="11139" href="StlcProp.html#11139" class="Bound"
      >t&#8323;&#8758;A</a
      ><a name="11143" class="Symbol"
      >)</a
      ><a name="11144"
      > </a
      ><a name="11145" class="Symbol"
      >(</a
      ><a name="11146" href="StlcProp.html#7277" class="InductiveConstructor"
      >if1</a
      ><a name="11149"
      > </a
      ><a name="11150" href="StlcProp.html#11150" class="Bound"
      >x&#8712;t&#8321;</a
      ><a name="11154" class="Symbol"
      >)</a
      ><a name="11155"
      > </a
      ><a name="11156" class="Symbol"
      >=</a
      ><a name="11157"
      > </a
      ><a name="11158" href="StlcProp.html#10865" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11168"
      > </a
      ><a name="11169" href="StlcProp.html#11116" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="11176"
      > </a
      ><a name="11177" href="StlcProp.html#11150" class="Bound"
      >x&#8712;t&#8321;</a
      ><a name="11181"
      >
</a
      ><a name="11182" href="StlcProp.html#10865" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11192"
      > </a
      ><a name="11193" class="Symbol"
      >(</a
      ><a name="11194" href="Stlc.html#19734" class="InductiveConstructor Operator"
      >if</a
      ><a name="11196"
      > </a
      ><a name="11197" href="StlcProp.html#11197" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="11204"
      > </a
      ><a name="11205" href="Stlc.html#19734" class="InductiveConstructor Operator"
      >then</a
      ><a name="11209"
      > </a
      ><a name="11210" href="StlcProp.html#11210" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="11214"
      > </a
      ><a name="11215" href="Stlc.html#19734" class="InductiveConstructor Operator"
      >else</a
      ><a name="11219"
      > </a
      ><a name="11220" href="StlcProp.html#11220" class="Bound"
      >t&#8323;&#8758;A</a
      ><a name="11224" class="Symbol"
      >)</a
      ><a name="11225"
      > </a
      ><a name="11226" class="Symbol"
      >(</a
      ><a name="11227" href="StlcProp.html#7348" class="InductiveConstructor"
      >if2</a
      ><a name="11230"
      > </a
      ><a name="11231" href="StlcProp.html#11231" class="Bound"
      >x&#8712;t&#8322;</a
      ><a name="11235" class="Symbol"
      >)</a
      ><a name="11236"
      > </a
      ><a name="11237" class="Symbol"
      >=</a
      ><a name="11238"
      > </a
      ><a name="11239" href="StlcProp.html#10865" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11249"
      > </a
      ><a name="11250" href="StlcProp.html#11210" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="11254"
      > </a
      ><a name="11255" href="StlcProp.html#11231" class="Bound"
      >x&#8712;t&#8322;</a
      ><a name="11259"
      >
</a
      ><a name="11260" href="StlcProp.html#10865" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11270"
      > </a
      ><a name="11271" class="Symbol"
      >(</a
      ><a name="11272" href="Stlc.html#19734" class="InductiveConstructor Operator"
      >if</a
      ><a name="11274"
      > </a
      ><a name="11275" href="StlcProp.html#11275" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="11282"
      > </a
      ><a name="11283" href="Stlc.html#19734" class="InductiveConstructor Operator"
      >then</a
      ><a name="11287"
      > </a
      ><a name="11288" href="StlcProp.html#11288" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="11292"
      > </a
      ><a name="11293" href="Stlc.html#19734" class="InductiveConstructor Operator"
      >else</a
      ><a name="11297"
      > </a
      ><a name="11298" href="StlcProp.html#11298" class="Bound"
      >t&#8323;&#8758;A</a
      ><a name="11302" class="Symbol"
      >)</a
      ><a name="11303"
      > </a
      ><a name="11304" class="Symbol"
      >(</a
      ><a name="11305" href="StlcProp.html#7419" class="InductiveConstructor"
      >if3</a
      ><a name="11308"
      > </a
      ><a name="11309" href="StlcProp.html#11309" class="Bound"
      >x&#8712;t&#8323;</a
      ><a name="11313" class="Symbol"
      >)</a
      ><a name="11314"
      > </a
      ><a name="11315" class="Symbol"
      >=</a
      ><a name="11316"
      > </a
      ><a name="11317" href="StlcProp.html#10865" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11327"
      > </a
      ><a name="11328" href="StlcProp.html#11298" class="Bound"
      >t&#8323;&#8758;A</a
      ><a name="11332"
      > </a
      ><a name="11333" href="StlcProp.html#11309" class="Bound"
      >x&#8712;t&#8323;</a
      ><a name="11337"
      >
</a
      ><a name="11338" href="StlcProp.html#10865" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11348"
      > </a
      ><a name="11349" class="Symbol"
      >(</a
      ><a name="11350" href="Stlc.html#19366" class="InductiveConstructor"
      >abs</a
      ><a name="11353"
      > </a
      ><a name="11354" class="Symbol"
      >{</a
      ><a name="11355" class="Argument"
      >x</a
      ><a name="11356"
      > </a
      ><a name="11357" class="Symbol"
      >=</a
      ><a name="11358"
      > </a
      ><a name="11359" href="StlcProp.html#11359" class="Bound"
      >x</a
      ><a name="11360" class="Symbol"
      >}</a
      ><a name="11361"
      > </a
      ><a name="11362" href="StlcProp.html#11362" class="Bound"
      >t&#8242;&#8758;A</a
      ><a name="11366" class="Symbol"
      >)</a
      ><a name="11367"
      > </a
      ><a name="11368" class="Symbol"
      >{</a
      ><a name="11369" href="StlcProp.html#11369" class="Bound"
      >y</a
      ><a name="11370" class="Symbol"
      >}</a
      ><a name="11371"
      > </a
      ><a name="11372" class="Symbol"
      >(</a
      ><a name="11373" href="StlcProp.html#7108" class="InductiveConstructor"
      >abs</a
      ><a name="11376"
      > </a
      ><a name="11377" href="StlcProp.html#11377" class="Bound"
      >x&#8800;y</a
      ><a name="11380"
      > </a
      ><a name="11381" href="StlcProp.html#11381" class="Bound"
      >y&#8712;t&#8242;</a
      ><a name="11385" class="Symbol"
      >)</a
      ><a name="11386"
      > </a
      ><a name="11387" class="Keyword"
      >with</a
      ><a name="11391"
      > </a
      ><a name="11392" href="StlcProp.html#8360" class="Function"
      >freeInCtxt</a
      ><a name="11402"
      > </a
      ><a name="11403" href="StlcProp.html#11381" class="Bound"
      >y&#8712;t&#8242;</a
      ><a name="11407"
      > </a
      ><a name="11408" href="StlcProp.html#11362" class="Bound"
      >t&#8242;&#8758;A</a
      ><a name="11412"
      >
</a
      ><a name="11413" href="StlcProp.html#10865" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11423"
      > </a
      ><a name="11424" class="Symbol"
      >(</a
      ><a name="11425" class="InductiveConstructor"
      >abs</a
      ><a name="11428"
      > </a
      ><a name="11429" class="Symbol"
      >{</a
      ><a name="11430" class="Argument"
      >x</a
      ><a name="11431"
      > </a
      ><a name="11432" class="Symbol"
      >=</a
      ><a name="11433"
      > </a
      ><a name="11434" href="StlcProp.html#11434" class="Bound"
      >x</a
      ><a name="11435" class="Symbol"
      >}</a
      ><a name="11436"
      > </a
      ><a name="11437" href="StlcProp.html#11437" class="Bound"
      >t&#8242;&#8758;A</a
      ><a name="11441" class="Symbol"
      >)</a
      ><a name="11442"
      > </a
      ><a name="11443" class="Symbol"
      >{</a
      ><a name="11444" href="StlcProp.html#11444" class="Bound"
      >y</a
      ><a name="11445" class="Symbol"
      >}</a
      ><a name="11446"
      > </a
      ><a name="11447" class="Symbol"
      >(</a
      ><a name="11448" class="InductiveConstructor"
      >abs</a
      ><a name="11451"
      > </a
      ><a name="11452" href="StlcProp.html#11452" class="Bound"
      >x&#8800;y</a
      ><a name="11455"
      > </a
      ><a name="11456" href="StlcProp.html#11456" class="Bound"
      >y&#8712;t&#8242;</a
      ><a name="11460" class="Symbol"
      >)</a
      ><a name="11461"
      > </a
      ><a name="11462" class="Symbol"
      >|</a
      ><a name="11463"
      > </a
      ><a name="11464" href="StlcProp.html#11464" class="Bound"
      >A</a
      ><a name="11465"
      > </a
      ><a name="11466" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="11467"
      > </a
      ><a name="11468" href="StlcProp.html#11468" class="Bound"
      >y&#8758;A</a
      ><a name="11471"
      > </a
      ><a name="11472" class="Keyword"
      >with</a
      ><a name="11476"
      > </a
      ><a name="11477" href="StlcProp.html#11434" class="Bound"
      >x</a
      ><a name="11478"
      > </a
      ><a name="11479" href="Maps.html#2692" class="Function Operator"
      >&#8799;</a
      ><a name="11480"
      > </a
      ><a name="11481" href="StlcProp.html#11444" class="Bound"
      >y</a
      ><a name="11482"
      >
</a
      ><a name="11483" href="StlcProp.html#10865" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11493"
      > </a
      ><a name="11494" class="Symbol"
      >(</a
      ><a name="11495" class="InductiveConstructor"
      >abs</a
      ><a name="11498"
      > </a
      ><a name="11499" class="Symbol"
      >{</a
      ><a name="11500" class="Argument"
      >x</a
      ><a name="11501"
      > </a
      ><a name="11502" class="Symbol"
      >=</a
      ><a name="11503"
      > </a
      ><a name="11504" href="StlcProp.html#11504" class="Bound"
      >x</a
      ><a name="11505" class="Symbol"
      >}</a
      ><a name="11506"
      > </a
      ><a name="11507" href="StlcProp.html#11507" class="Bound"
      >t&#8242;&#8758;A</a
      ><a name="11511" class="Symbol"
      >)</a
      ><a name="11512"
      > </a
      ><a name="11513" class="Symbol"
      >{</a
      ><a name="11514" href="StlcProp.html#11514" class="Bound"
      >y</a
      ><a name="11515" class="Symbol"
      >}</a
      ><a name="11516"
      > </a
      ><a name="11517" class="Symbol"
      >(</a
      ><a name="11518" class="InductiveConstructor"
      >abs</a
      ><a name="11521"
      > </a
      ><a name="11522" href="StlcProp.html#11522" class="Bound"
      >x&#8800;y</a
      ><a name="11525"
      > </a
      ><a name="11526" href="StlcProp.html#11526" class="Bound"
      >y&#8712;t&#8242;</a
      ><a name="11530" class="Symbol"
      >)</a
      ><a name="11531"
      > </a
      ><a name="11532" class="Symbol"
      >|</a
      ><a name="11533"
      > </a
      ><a name="11534" href="StlcProp.html#11534" class="Bound"
      >A</a
      ><a name="11535"
      > </a
      ><a name="11536" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="11537"
      > </a
      ><a name="11538" href="StlcProp.html#11538" class="Bound"
      >y&#8758;A</a
      ><a name="11541"
      > </a
      ><a name="11542" class="Symbol"
      >|</a
      ><a name="11543"
      > </a
      ><a name="11544" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="11547"
      > </a
      ><a name="11548" href="StlcProp.html#11548" class="Bound"
      >x=y</a
      ><a name="11551"
      > </a
      ><a name="11552" class="Symbol"
      >=</a
      ><a name="11553"
      > </a
      ><a name="11554" href="StlcProp.html#11522" class="Bound"
      >x&#8800;y</a
      ><a name="11557"
      > </a
      ><a name="11558" href="StlcProp.html#11548" class="Bound"
      >x=y</a
      ><a name="11561"
      >
</a
      ><a name="11562" href="StlcProp.html#10865" class="Function"
      >&#8709;&#8866;-closed&#8242;</a
      ><a name="11572"
      > </a
      ><a name="11573" class="Symbol"
      >(</a
      ><a name="11574" class="InductiveConstructor"
      >abs</a
      ><a name="11577"
      > </a
      ><a name="11578" class="Symbol"
      >{</a
      ><a name="11579" class="Argument"
      >x</a
      ><a name="11580"
      > </a
      ><a name="11581" class="Symbol"
      >=</a
      ><a name="11582"
      > </a
      ><a name="11583" href="StlcProp.html#11583" class="Bound"
      >x</a
      ><a name="11584" class="Symbol"
      >}</a
      ><a name="11585"
      > </a
      ><a name="11586" href="StlcProp.html#11586" class="Bound"
      >t&#8242;&#8758;A</a
      ><a name="11590" class="Symbol"
      >)</a
      ><a name="11591"
      > </a
      ><a name="11592" class="Symbol"
      >{</a
      ><a name="11593" href="StlcProp.html#11593" class="Bound"
      >y</a
      ><a name="11594" class="Symbol"
      >}</a
      ><a name="11595"
      > </a
      ><a name="11596" class="Symbol"
      >(</a
      ><a name="11597" class="InductiveConstructor"
      >abs</a
      ><a name="11600"
      > </a
      ><a name="11601" href="StlcProp.html#11601" class="Bound"
      >x&#8800;y</a
      ><a name="11604"
      > </a
      ><a name="11605" href="StlcProp.html#11605" class="Bound"
      >y&#8712;t&#8242;</a
      ><a name="11609" class="Symbol"
      >)</a
      ><a name="11610"
      > </a
      ><a name="11611" class="Symbol"
      >|</a
      ><a name="11612"
      > </a
      ><a name="11613" href="StlcProp.html#11613" class="Bound"
      >A</a
      ><a name="11614"
      > </a
      ><a name="11615" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="11616"
      > </a
      ><a name="11617" class="Symbol"
      >()</a
      ><a name="11619"
      >  </a
      ><a name="11621" class="Symbol"
      >|</a
      ><a name="11622"
      > </a
      ><a name="11623" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="11625"
      >  </a
      ><a name="11627" class="Symbol"
      >_</a
      >
</pre><!--{% endraw %}-->
</div>

Sometimes, when we have a proof $$\Gamma\vdash t : A$$, we will need to
replace $$\Gamma$$ by a different context $$\Gamma'$$.  When is it safe
to do this?  Intuitively, it must at least be the case that
$$\Gamma'$$ assigns the same types as $$\Gamma$$ to all the variables
that appear free in $$t$$. In fact, this is the only condition that
is needed.

<!--{% raw %}--><pre class="Agda">
<a name="12015" href="StlcProp.html#12015" class="Function"
      >replaceCtxt</a
      ><a name="12026"
      > </a
      ><a name="12027" class="Symbol"
      >:</a
      ><a name="12028"
      > </a
      ><a name="12029" class="Symbol"
      >&#8704;</a
      ><a name="12030"
      > </a
      ><a name="12031" class="Symbol"
      >{</a
      ><a name="12032" href="StlcProp.html#12032" class="Bound"
      >&#915;</a
      ><a name="12033"
      > </a
      ><a name="12034" href="StlcProp.html#12034" class="Bound"
      >&#915;&#8242;</a
      ><a name="12036"
      > </a
      ><a name="12037" href="StlcProp.html#12037" class="Bound"
      >t</a
      ><a name="12038"
      > </a
      ><a name="12039" href="StlcProp.html#12039" class="Bound"
      >A</a
      ><a name="12040" class="Symbol"
      >}</a
      ><a name="12041"
      >
            </a
      ><a name="12054" class="Symbol"
      >&#8594;</a
      ><a name="12055"
      > </a
      ><a name="12056" class="Symbol"
      >(&#8704;</a
      ><a name="12058"
      > </a
      ><a name="12059" class="Symbol"
      >{</a
      ><a name="12060" href="StlcProp.html#12060" class="Bound"
      >x</a
      ><a name="12061" class="Symbol"
      >}</a
      ><a name="12062"
      > </a
      ><a name="12063" class="Symbol"
      >&#8594;</a
      ><a name="12064"
      > </a
      ><a name="12065" href="StlcProp.html#12060" class="Bound"
      >x</a
      ><a name="12066"
      > </a
      ><a name="12067" href="StlcProp.html#7045" class="Datatype Operator"
      >FreeIn</a
      ><a name="12073"
      > </a
      ><a name="12074" href="StlcProp.html#12037" class="Bound"
      >t</a
      ><a name="12075"
      > </a
      ><a name="12076" class="Symbol"
      >&#8594;</a
      ><a name="12077"
      > </a
      ><a name="12078" href="StlcProp.html#12032" class="Bound"
      >&#915;</a
      ><a name="12079"
      > </a
      ><a name="12080" href="StlcProp.html#12060" class="Bound"
      >x</a
      ><a name="12081"
      > </a
      ><a name="12082" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="12083"
      > </a
      ><a name="12084" href="StlcProp.html#12034" class="Bound"
      >&#915;&#8242;</a
      ><a name="12086"
      > </a
      ><a name="12087" href="StlcProp.html#12060" class="Bound"
      >x</a
      ><a name="12088" class="Symbol"
      >)</a
      ><a name="12089"
      >
            </a
      ><a name="12102" class="Symbol"
      >&#8594;</a
      ><a name="12103"
      > </a
      ><a name="12104" href="StlcProp.html#12032" class="Bound"
      >&#915;</a
      ><a name="12105"
      >  </a
      ><a name="12107" href="Stlc.html#19229" class="Datatype Operator"
      >&#8866;</a
      ><a name="12108"
      > </a
      ><a name="12109" href="StlcProp.html#12037" class="Bound"
      >t</a
      ><a name="12110"
      > </a
      ><a name="12111" href="Stlc.html#19229" class="Datatype Operator"
      >&#8758;</a
      ><a name="12112"
      > </a
      ><a name="12113" href="StlcProp.html#12039" class="Bound"
      >A</a
      ><a name="12114"
      >
            </a
      ><a name="12127" class="Symbol"
      >&#8594;</a
      ><a name="12128"
      > </a
      ><a name="12129" href="StlcProp.html#12034" class="Bound"
      >&#915;&#8242;</a
      ><a name="12131"
      > </a
      ><a name="12132" href="Stlc.html#19229" class="Datatype Operator"
      >&#8866;</a
      ><a name="12133"
      > </a
      ><a name="12134" href="StlcProp.html#12037" class="Bound"
      >t</a
      ><a name="12135"
      > </a
      ><a name="12136" href="Stlc.html#19229" class="Datatype Operator"
      >&#8758;</a
      ><a name="12137"
      > </a
      ><a name="12138" href="StlcProp.html#12039" class="Bound"
      >A</a
      >
</pre><!--{% endraw %}-->

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

<!--{% raw %}--><pre class="Agda">
<a name="14443" href="StlcProp.html#12015" class="Function"
      >replaceCtxt</a
      ><a name="14454"
      > </a
      ><a name="14455" href="StlcProp.html#14455" class="Bound"
      >f</a
      ><a name="14456"
      > </a
      ><a name="14457" class="Symbol"
      >(</a
      ><a name="14458" href="Stlc.html#19273" class="InductiveConstructor"
      >var</a
      ><a name="14461"
      > </a
      ><a name="14462" href="StlcProp.html#14462" class="Bound"
      >x</a
      ><a name="14463"
      > </a
      ><a name="14464" href="StlcProp.html#14464" class="Bound"
      >x&#8758;A</a
      ><a name="14467" class="Symbol"
      >)</a
      ><a name="14468"
      > </a
      ><a name="14469" class="Keyword"
      >rewrite</a
      ><a name="14476"
      > </a
      ><a name="14477" href="StlcProp.html#14455" class="Bound"
      >f</a
      ><a name="14478"
      > </a
      ><a name="14479" href="StlcProp.html#7084" class="InductiveConstructor"
      >var</a
      ><a name="14482"
      > </a
      ><a name="14483" class="Symbol"
      >=</a
      ><a name="14484"
      > </a
      ><a name="14485" href="Stlc.html#19273" class="InductiveConstructor"
      >var</a
      ><a name="14488"
      > </a
      ><a name="14489" href="StlcProp.html#14462" class="Bound"
      >x</a
      ><a name="14490"
      > </a
      ><a name="14491" href="StlcProp.html#14464" class="Bound"
      >x&#8758;A</a
      ><a name="14494"
      >
</a
      ><a name="14495" href="StlcProp.html#12015" class="Function"
      >replaceCtxt</a
      ><a name="14506"
      > </a
      ><a name="14507" href="StlcProp.html#14507" class="Bound"
      >f</a
      ><a name="14508"
      > </a
      ><a name="14509" class="Symbol"
      >(</a
      ><a name="14510" href="Stlc.html#19482" class="InductiveConstructor"
      >app</a
      ><a name="14513"
      > </a
      ><a name="14514" href="StlcProp.html#14514" class="Bound"
      >t&#8321;&#8758;A&#8658;B</a
      ><a name="14520"
      > </a
      ><a name="14521" href="StlcProp.html#14521" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="14525" class="Symbol"
      >)</a
      ><a name="14526"
      >
  </a
      ><a name="14529" class="Symbol"
      >=</a
      ><a name="14530"
      > </a
      ><a name="14531" href="Stlc.html#19482" class="InductiveConstructor"
      >app</a
      ><a name="14534"
      > </a
      ><a name="14535" class="Symbol"
      >(</a
      ><a name="14536" href="StlcProp.html#12015" class="Function"
      >replaceCtxt</a
      ><a name="14547"
      > </a
      ><a name="14548" class="Symbol"
      >(</a
      ><a name="14549" href="StlcProp.html#14507" class="Bound"
      >f</a
      ><a name="14550"
      > </a
      ><a name="14551" href="https://agda.github.io/agda-stdlib/Function.html#713" class="Function Operator"
      >&#8728;</a
      ><a name="14552"
      > </a
      ><a name="14553" href="StlcProp.html#7169" class="InductiveConstructor"
      >app1</a
      ><a name="14557" class="Symbol"
      >)</a
      ><a name="14558"
      > </a
      ><a name="14559" href="StlcProp.html#14514" class="Bound"
      >t&#8321;&#8758;A&#8658;B</a
      ><a name="14565" class="Symbol"
      >)</a
      ><a name="14566"
      > </a
      ><a name="14567" class="Symbol"
      >(</a
      ><a name="14568" href="StlcProp.html#12015" class="Function"
      >replaceCtxt</a
      ><a name="14579"
      > </a
      ><a name="14580" class="Symbol"
      >(</a
      ><a name="14581" href="StlcProp.html#14507" class="Bound"
      >f</a
      ><a name="14582"
      > </a
      ><a name="14583" href="https://agda.github.io/agda-stdlib/Function.html#713" class="Function Operator"
      >&#8728;</a
      ><a name="14584"
      > </a
      ><a name="14585" href="StlcProp.html#7223" class="InductiveConstructor"
      >app2</a
      ><a name="14589" class="Symbol"
      >)</a
      ><a name="14590"
      > </a
      ><a name="14591" href="StlcProp.html#14521" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="14595" class="Symbol"
      >)</a
      ><a name="14596"
      >
</a
      ><a name="14597" href="StlcProp.html#12015" class="Function"
      >replaceCtxt</a
      ><a name="14608"
      > </a
      ><a name="14609" class="Symbol"
      >{</a
      ><a name="14610" href="StlcProp.html#14610" class="Bound"
      >&#915;</a
      ><a name="14611" class="Symbol"
      >}</a
      ><a name="14612"
      > </a
      ><a name="14613" class="Symbol"
      >{</a
      ><a name="14614" href="StlcProp.html#14614" class="Bound"
      >&#915;&#8242;</a
      ><a name="14616" class="Symbol"
      >}</a
      ><a name="14617"
      > </a
      ><a name="14618" href="StlcProp.html#14618" class="Bound"
      >f</a
      ><a name="14619"
      > </a
      ><a name="14620" class="Symbol"
      >(</a
      ><a name="14621" href="Stlc.html#19366" class="InductiveConstructor"
      >abs</a
      ><a name="14624"
      > </a
      ><a name="14625" class="Symbol"
      >{</a
      ><a name="14626" class="DottedPattern Symbol"
      >.</a
      ><a name="14627" href="StlcProp.html#14610" class="DottedPattern Bound"
      >&#915;</a
      ><a name="14628" class="Symbol"
      >}</a
      ><a name="14629"
      > </a
      ><a name="14630" class="Symbol"
      >{</a
      ><a name="14631" href="StlcProp.html#14631" class="Bound"
      >x</a
      ><a name="14632" class="Symbol"
      >}</a
      ><a name="14633"
      > </a
      ><a name="14634" class="Symbol"
      >{</a
      ><a name="14635" href="StlcProp.html#14635" class="Bound"
      >A</a
      ><a name="14636" class="Symbol"
      >}</a
      ><a name="14637"
      > </a
      ><a name="14638" class="Symbol"
      >{</a
      ><a name="14639" href="StlcProp.html#14639" class="Bound"
      >B</a
      ><a name="14640" class="Symbol"
      >}</a
      ><a name="14641"
      > </a
      ><a name="14642" class="Symbol"
      >{</a
      ><a name="14643" href="StlcProp.html#14643" class="Bound"
      >t&#8242;</a
      ><a name="14645" class="Symbol"
      >}</a
      ><a name="14646"
      > </a
      ><a name="14647" href="StlcProp.html#14647" class="Bound"
      >t&#8242;&#8758;B</a
      ><a name="14651" class="Symbol"
      >)</a
      ><a name="14652"
      >
  </a
      ><a name="14655" class="Symbol"
      >=</a
      ><a name="14656"
      > </a
      ><a name="14657" href="Stlc.html#19366" class="InductiveConstructor"
      >abs</a
      ><a name="14660"
      > </a
      ><a name="14661" class="Symbol"
      >(</a
      ><a name="14662" href="StlcProp.html#12015" class="Function"
      >replaceCtxt</a
      ><a name="14673"
      > </a
      ><a name="14674" href="StlcProp.html#14695" class="Function"
      >f&#8242;</a
      ><a name="14676"
      > </a
      ><a name="14677" href="StlcProp.html#14647" class="Bound"
      >t&#8242;&#8758;B</a
      ><a name="14681" class="Symbol"
      >)</a
      ><a name="14682"
      >
  </a
      ><a name="14685" class="Keyword"
      >where</a
      ><a name="14690"
      >
    </a
      ><a name="14695" href="StlcProp.html#14695" class="Function"
      >f&#8242;</a
      ><a name="14697"
      > </a
      ><a name="14698" class="Symbol"
      >:</a
      ><a name="14699"
      > </a
      ><a name="14700" class="Symbol"
      >&#8704;</a
      ><a name="14701"
      > </a
      ><a name="14702" class="Symbol"
      >{</a
      ><a name="14703" href="StlcProp.html#14703" class="Bound"
      >y</a
      ><a name="14704" class="Symbol"
      >}</a
      ><a name="14705"
      > </a
      ><a name="14706" class="Symbol"
      >&#8594;</a
      ><a name="14707"
      > </a
      ><a name="14708" href="StlcProp.html#14703" class="Bound"
      >y</a
      ><a name="14709"
      > </a
      ><a name="14710" href="StlcProp.html#7045" class="Datatype Operator"
      >FreeIn</a
      ><a name="14716"
      > </a
      ><a name="14717" href="StlcProp.html#14643" class="Bound"
      >t&#8242;</a
      ><a name="14719"
      > </a
      ><a name="14720" class="Symbol"
      >&#8594;</a
      ><a name="14721"
      > </a
      ><a name="14722" class="Symbol"
      >(</a
      ><a name="14723" href="StlcProp.html#14610" class="Bound"
      >&#915;</a
      ><a name="14724"
      > </a
      ><a name="14725" href="Stlc.html#18328" class="Function Operator"
      >,</a
      ><a name="14726"
      > </a
      ><a name="14727" href="StlcProp.html#14631" class="Bound"
      >x</a
      ><a name="14728"
      > </a
      ><a name="14729" href="Stlc.html#18328" class="Function Operator"
      >&#8758;</a
      ><a name="14730"
      > </a
      ><a name="14731" href="StlcProp.html#14635" class="Bound"
      >A</a
      ><a name="14732" class="Symbol"
      >)</a
      ><a name="14733"
      > </a
      ><a name="14734" href="StlcProp.html#14703" class="Bound"
      >y</a
      ><a name="14735"
      > </a
      ><a name="14736" href="Agda.Builtin.Equality.html#55" class="Datatype Operator"
      >&#8801;</a
      ><a name="14737"
      > </a
      ><a name="14738" class="Symbol"
      >(</a
      ><a name="14739" href="StlcProp.html#14614" class="Bound"
      >&#915;&#8242;</a
      ><a name="14741"
      > </a
      ><a name="14742" href="Stlc.html#18328" class="Function Operator"
      >,</a
      ><a name="14743"
      > </a
      ><a name="14744" href="StlcProp.html#14631" class="Bound"
      >x</a
      ><a name="14745"
      > </a
      ><a name="14746" href="Stlc.html#18328" class="Function Operator"
      >&#8758;</a
      ><a name="14747"
      > </a
      ><a name="14748" href="StlcProp.html#14635" class="Bound"
      >A</a
      ><a name="14749" class="Symbol"
      >)</a
      ><a name="14750"
      > </a
      ><a name="14751" href="StlcProp.html#14703" class="Bound"
      >y</a
      ><a name="14752"
      >
    </a
      ><a name="14757" href="StlcProp.html#14695" class="Function"
      >f&#8242;</a
      ><a name="14759"
      > </a
      ><a name="14760" class="Symbol"
      >{</a
      ><a name="14761" href="StlcProp.html#14761" class="Bound"
      >y</a
      ><a name="14762" class="Symbol"
      >}</a
      ><a name="14763"
      > </a
      ><a name="14764" href="StlcProp.html#14764" class="Bound"
      >y&#8712;t&#8242;</a
      ><a name="14768"
      > </a
      ><a name="14769" class="Keyword"
      >with</a
      ><a name="14773"
      > </a
      ><a name="14774" href="StlcProp.html#14631" class="Bound"
      >x</a
      ><a name="14775"
      > </a
      ><a name="14776" href="Maps.html#2692" class="Function Operator"
      >&#8799;</a
      ><a name="14777"
      > </a
      ><a name="14778" href="StlcProp.html#14761" class="Bound"
      >y</a
      ><a name="14779"
      >
    </a
      ><a name="14784" class="Symbol"
      >...</a
      ><a name="14787"
      > </a
      ><a name="14788" class="Symbol"
      >|</a
      ><a name="14789"
      > </a
      ><a name="14790" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="14793"
      > </a
      ><a name="14794" class="Symbol"
      >_</a
      ><a name="14795"
      >   </a
      ><a name="14798" class="Symbol"
      >=</a
      ><a name="14799"
      > </a
      ><a name="14800" href="Agda.Builtin.Equality.html#112" class="InductiveConstructor"
      >refl</a
      ><a name="14804"
      >
    </a
      ><a name="14809" class="Symbol"
      >...</a
      ><a name="14812"
      > </a
      ><a name="14813" class="Symbol"
      >|</a
      ><a name="14814"
      > </a
      ><a name="14815" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="14817"
      >  </a
      ><a name="14819" href="StlcProp.html#14819" class="Bound"
      >x&#8800;y</a
      ><a name="14822"
      > </a
      ><a name="14823" class="Symbol"
      >=</a
      ><a name="14824"
      > </a
      ><a name="14825" href="StlcProp.html#14618" class="Bound"
      >f</a
      ><a name="14826"
      > </a
      ><a name="14827" class="Symbol"
      >(</a
      ><a name="14828" href="StlcProp.html#7108" class="InductiveConstructor"
      >abs</a
      ><a name="14831"
      > </a
      ><a name="14832" href="StlcProp.html#14819" class="Bound"
      >x&#8800;y</a
      ><a name="14835"
      > </a
      ><a name="14836" href="StlcProp.html#14764" class="Bound"
      >y&#8712;t&#8242;</a
      ><a name="14840" class="Symbol"
      >)</a
      ><a name="14841"
      >
</a
      ><a name="14842" href="StlcProp.html#12015" class="Function"
      >replaceCtxt</a
      ><a name="14853"
      > </a
      ><a name="14854" class="Symbol"
      >_</a
      ><a name="14855"
      > </a
      ><a name="14856" href="Stlc.html#19616" class="InductiveConstructor"
      >true</a
      ><a name="14860"
      >  </a
      ><a name="14862" class="Symbol"
      >=</a
      ><a name="14863"
      > </a
      ><a name="14864" href="Stlc.html#19616" class="InductiveConstructor"
      >true</a
      ><a name="14868"
      >
</a
      ><a name="14869" href="StlcProp.html#12015" class="Function"
      >replaceCtxt</a
      ><a name="14880"
      > </a
      ><a name="14881" class="Symbol"
      >_</a
      ><a name="14882"
      > </a
      ><a name="14883" href="Stlc.html#19675" class="InductiveConstructor"
      >false</a
      ><a name="14888"
      > </a
      ><a name="14889" class="Symbol"
      >=</a
      ><a name="14890"
      > </a
      ><a name="14891" href="Stlc.html#19675" class="InductiveConstructor"
      >false</a
      ><a name="14896"
      >
</a
      ><a name="14897" href="StlcProp.html#12015" class="Function"
      >replaceCtxt</a
      ><a name="14908"
      > </a
      ><a name="14909" href="StlcProp.html#14909" class="Bound"
      >f</a
      ><a name="14910"
      > </a
      ><a name="14911" class="Symbol"
      >(</a
      ><a name="14912" href="Stlc.html#19734" class="InductiveConstructor Operator"
      >if</a
      ><a name="14914"
      > </a
      ><a name="14915" href="StlcProp.html#14915" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="14922"
      > </a
      ><a name="14923" href="Stlc.html#19734" class="InductiveConstructor Operator"
      >then</a
      ><a name="14927"
      > </a
      ><a name="14928" href="StlcProp.html#14928" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="14932"
      > </a
      ><a name="14933" href="Stlc.html#19734" class="InductiveConstructor Operator"
      >else</a
      ><a name="14937"
      > </a
      ><a name="14938" href="StlcProp.html#14938" class="Bound"
      >t&#8323;&#8758;A</a
      ><a name="14942" class="Symbol"
      >)</a
      ><a name="14943"
      >
  </a
      ><a name="14946" class="Symbol"
      >=</a
      ><a name="14947"
      > </a
      ><a name="14948" href="Stlc.html#19734" class="InductiveConstructor Operator"
      >if</a
      ><a name="14950"
      >   </a
      ><a name="14953" href="StlcProp.html#12015" class="Function"
      >replaceCtxt</a
      ><a name="14964"
      > </a
      ><a name="14965" class="Symbol"
      >(</a
      ><a name="14966" href="StlcProp.html#14909" class="Bound"
      >f</a
      ><a name="14967"
      > </a
      ><a name="14968" href="https://agda.github.io/agda-stdlib/Function.html#713" class="Function Operator"
      >&#8728;</a
      ><a name="14969"
      > </a
      ><a name="14970" href="StlcProp.html#7277" class="InductiveConstructor"
      >if1</a
      ><a name="14973" class="Symbol"
      >)</a
      ><a name="14974"
      > </a
      ><a name="14975" href="StlcProp.html#14915" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="14982"
      >
    </a
      ><a name="14987" href="Stlc.html#19734" class="InductiveConstructor Operator"
      >then</a
      ><a name="14991"
      > </a
      ><a name="14992" href="StlcProp.html#12015" class="Function"
      >replaceCtxt</a
      ><a name="15003"
      > </a
      ><a name="15004" class="Symbol"
      >(</a
      ><a name="15005" href="StlcProp.html#14909" class="Bound"
      >f</a
      ><a name="15006"
      > </a
      ><a name="15007" href="https://agda.github.io/agda-stdlib/Function.html#713" class="Function Operator"
      >&#8728;</a
      ><a name="15008"
      > </a
      ><a name="15009" href="StlcProp.html#7348" class="InductiveConstructor"
      >if2</a
      ><a name="15012" class="Symbol"
      >)</a
      ><a name="15013"
      > </a
      ><a name="15014" href="StlcProp.html#14928" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="15018"
      >
    </a
      ><a name="15023" href="Stlc.html#19734" class="InductiveConstructor Operator"
      >else</a
      ><a name="15027"
      > </a
      ><a name="15028" href="StlcProp.html#12015" class="Function"
      >replaceCtxt</a
      ><a name="15039"
      > </a
      ><a name="15040" class="Symbol"
      >(</a
      ><a name="15041" href="StlcProp.html#14909" class="Bound"
      >f</a
      ><a name="15042"
      > </a
      ><a name="15043" href="https://agda.github.io/agda-stdlib/Function.html#713" class="Function Operator"
      >&#8728;</a
      ><a name="15044"
      > </a
      ><a name="15045" href="StlcProp.html#7419" class="InductiveConstructor"
      >if3</a
      ><a name="15048" class="Symbol"
      >)</a
      ><a name="15049"
      > </a
      ><a name="15050" href="StlcProp.html#14938" class="Bound"
      >t&#8323;&#8758;A</a
      >
</pre><!--{% endraw %}-->

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

<!--{% raw %}--><pre class="Agda">
<a name="15865" href="StlcProp.html#15865" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="15881"
      > </a
      ><a name="15882" class="Symbol"
      >:</a
      ><a name="15883"
      > </a
      ><a name="15884" class="Symbol"
      >&#8704;</a
      ><a name="15885"
      > </a
      ><a name="15886" class="Symbol"
      >{</a
      ><a name="15887" href="StlcProp.html#15887" class="Bound"
      >&#915;</a
      ><a name="15888"
      > </a
      ><a name="15889" href="StlcProp.html#15889" class="Bound"
      >x</a
      ><a name="15890"
      > </a
      ><a name="15891" href="StlcProp.html#15891" class="Bound"
      >A</a
      ><a name="15892"
      > </a
      ><a name="15893" href="StlcProp.html#15893" class="Bound"
      >t</a
      ><a name="15894"
      > </a
      ><a name="15895" href="StlcProp.html#15895" class="Bound"
      >v</a
      ><a name="15896"
      > </a
      ><a name="15897" href="StlcProp.html#15897" class="Bound"
      >B</a
      ><a name="15898" class="Symbol"
      >}</a
      ><a name="15899"
      >
                 </a
      ><a name="15917" class="Symbol"
      >&#8594;</a
      ><a name="15918"
      > </a
      ><a name="15919" href="Stlc.html#18297" class="Function"
      >&#8709;</a
      ><a name="15920"
      > </a
      ><a name="15921" href="Stlc.html#19229" class="Datatype Operator"
      >&#8866;</a
      ><a name="15922"
      > </a
      ><a name="15923" href="StlcProp.html#15895" class="Bound"
      >v</a
      ><a name="15924"
      > </a
      ><a name="15925" href="Stlc.html#19229" class="Datatype Operator"
      >&#8758;</a
      ><a name="15926"
      > </a
      ><a name="15927" href="StlcProp.html#15891" class="Bound"
      >A</a
      ><a name="15928"
      >
                 </a
      ><a name="15946" class="Symbol"
      >&#8594;</a
      ><a name="15947"
      > </a
      ><a name="15948" href="StlcProp.html#15887" class="Bound"
      >&#915;</a
      ><a name="15949"
      > </a
      ><a name="15950" href="Stlc.html#18328" class="Function Operator"
      >,</a
      ><a name="15951"
      > </a
      ><a name="15952" href="StlcProp.html#15889" class="Bound"
      >x</a
      ><a name="15953"
      > </a
      ><a name="15954" href="Stlc.html#18328" class="Function Operator"
      >&#8758;</a
      ><a name="15955"
      > </a
      ><a name="15956" href="StlcProp.html#15891" class="Bound"
      >A</a
      ><a name="15957"
      > </a
      ><a name="15958" href="Stlc.html#19229" class="Datatype Operator"
      >&#8866;</a
      ><a name="15959"
      > </a
      ><a name="15960" href="StlcProp.html#15893" class="Bound"
      >t</a
      ><a name="15961"
      > </a
      ><a name="15962" href="Stlc.html#19229" class="Datatype Operator"
      >&#8758;</a
      ><a name="15963"
      > </a
      ><a name="15964" href="StlcProp.html#15897" class="Bound"
      >B</a
      ><a name="15965"
      >
                 </a
      ><a name="15983" class="Symbol"
      >&#8594;</a
      ><a name="15984"
      > </a
      ><a name="15985" href="StlcProp.html#15887" class="Bound"
      >&#915;</a
      ><a name="15986"
      > </a
      ><a name="15987" href="Stlc.html#18328" class="Function Operator"
      >,</a
      ><a name="15988"
      > </a
      ><a name="15989" href="StlcProp.html#15889" class="Bound"
      >x</a
      ><a name="15990"
      > </a
      ><a name="15991" href="Stlc.html#18328" class="Function Operator"
      >&#8758;</a
      ><a name="15992"
      > </a
      ><a name="15993" href="StlcProp.html#15891" class="Bound"
      >A</a
      ><a name="15994"
      > </a
      ><a name="15995" href="Stlc.html#19229" class="Datatype Operator"
      >&#8866;</a
      ><a name="15996"
      > </a
      ><a name="15997" href="Stlc.html#12298" class="Function Operator"
      >[</a
      ><a name="15998"
      > </a
      ><a name="15999" href="StlcProp.html#15889" class="Bound"
      >x</a
      ><a name="16000"
      > </a
      ><a name="16001" href="Stlc.html#12298" class="Function Operator"
      >:=</a
      ><a name="16003"
      > </a
      ><a name="16004" href="StlcProp.html#15895" class="Bound"
      >v</a
      ><a name="16005"
      > </a
      ><a name="16006" href="Stlc.html#12298" class="Function Operator"
      >]</a
      ><a name="16007"
      > </a
      ><a name="16008" href="StlcProp.html#15893" class="Bound"
      >t</a
      ><a name="16009"
      > </a
      ><a name="16010" href="Stlc.html#19229" class="Datatype Operator"
      >&#8758;</a
      ><a name="16011"
      > </a
      ><a name="16012" href="StlcProp.html#15897" class="Bound"
      >B</a
      >
</pre><!--{% endraw %}-->

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

<!--{% raw %}--><pre class="Agda">
<a name="19923" href="StlcProp.html#15865" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="19939"
      > </a
      ><a name="19940" class="Symbol"
      >{</a
      ><a name="19941" href="StlcProp.html#19941" class="Bound"
      >&#915;</a
      ><a name="19942" class="Symbol"
      >}</a
      ><a name="19943"
      > </a
      ><a name="19944" class="Symbol"
      >{</a
      ><a name="19945" href="StlcProp.html#19945" class="Bound"
      >x</a
      ><a name="19946" class="Symbol"
      >}</a
      ><a name="19947"
      > </a
      ><a name="19948" href="StlcProp.html#19948" class="Bound"
      >v&#8758;A</a
      ><a name="19951"
      > </a
      ><a name="19952" class="Symbol"
      >(</a
      ><a name="19953" href="Stlc.html#19273" class="InductiveConstructor"
      >var</a
      ><a name="19956"
      > </a
      ><a name="19957" href="StlcProp.html#19957" class="Bound"
      >y</a
      ><a name="19958"
      > </a
      ><a name="19959" href="StlcProp.html#19959" class="Bound"
      >y&#8712;&#915;</a
      ><a name="19962" class="Symbol"
      >)</a
      ><a name="19963"
      > </a
      ><a name="19964" class="Keyword"
      >with</a
      ><a name="19968"
      > </a
      ><a name="19969" href="StlcProp.html#19945" class="Bound"
      >x</a
      ><a name="19970"
      > </a
      ><a name="19971" href="Maps.html#2692" class="Function Operator"
      >&#8799;</a
      ><a name="19972"
      > </a
      ><a name="19973" href="StlcProp.html#19957" class="Bound"
      >y</a
      ><a name="19974"
      >
</a
      ><a name="19975" class="Symbol"
      >...</a
      ><a name="19978"
      > </a
      ><a name="19979" class="Symbol"
      >|</a
      ><a name="19980"
      > </a
      ><a name="19981" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="19984"
      > </a
      ><a name="19985" href="StlcProp.html#19985" class="Bound"
      >x=y</a
      ><a name="19988"
      > </a
      ><a name="19989" class="Symbol"
      >=</a
      ><a name="19990"
      > </a
      ><a name="19991" class="Symbol"
      >{!!}</a
      ><a name="19995"
      >
</a
      ><a name="19996" class="Symbol"
      >...</a
      ><a name="19999"
      > </a
      ><a name="20000" class="Symbol"
      >|</a
      ><a name="20001"
      > </a
      ><a name="20002" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="20004"
      >  </a
      ><a name="20006" href="StlcProp.html#20006" class="Bound"
      >x&#8800;y</a
      ><a name="20009"
      > </a
      ><a name="20010" class="Symbol"
      >=</a
      ><a name="20011"
      > </a
      ><a name="20012" class="Symbol"
      >{!!}</a
      ><a name="20016"
      >
</a
      ><a name="20017" href="StlcProp.html#15865" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="20033"
      > </a
      ><a name="20034" href="StlcProp.html#20034" class="Bound"
      >v&#8758;A</a
      ><a name="20037"
      > </a
      ><a name="20038" class="Symbol"
      >(</a
      ><a name="20039" href="Stlc.html#19366" class="InductiveConstructor"
      >abs</a
      ><a name="20042"
      > </a
      ><a name="20043" href="StlcProp.html#20043" class="Bound"
      >t&#8242;&#8758;B</a
      ><a name="20047" class="Symbol"
      >)</a
      ><a name="20048"
      > </a
      ><a name="20049" class="Symbol"
      >=</a
      ><a name="20050"
      > </a
      ><a name="20051" class="Symbol"
      >{!!}</a
      ><a name="20055"
      >
</a
      ><a name="20056" href="StlcProp.html#15865" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="20072"
      > </a
      ><a name="20073" href="StlcProp.html#20073" class="Bound"
      >v&#8758;A</a
      ><a name="20076"
      > </a
      ><a name="20077" class="Symbol"
      >(</a
      ><a name="20078" href="Stlc.html#19482" class="InductiveConstructor"
      >app</a
      ><a name="20081"
      > </a
      ><a name="20082" href="StlcProp.html#20082" class="Bound"
      >t&#8321;&#8758;A&#8658;B</a
      ><a name="20088"
      > </a
      ><a name="20089" href="StlcProp.html#20089" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="20093" class="Symbol"
      >)</a
      ><a name="20094"
      > </a
      ><a name="20095" class="Symbol"
      >=</a
      ><a name="20096"
      >
  </a
      ><a name="20099" href="Stlc.html#19482" class="InductiveConstructor"
      >app</a
      ><a name="20102"
      > </a
      ><a name="20103" class="Symbol"
      >(</a
      ><a name="20104" href="StlcProp.html#15865" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="20120"
      > </a
      ><a name="20121" href="StlcProp.html#20073" class="Bound"
      >v&#8758;A</a
      ><a name="20124"
      > </a
      ><a name="20125" href="StlcProp.html#20082" class="Bound"
      >t&#8321;&#8758;A&#8658;B</a
      ><a name="20131" class="Symbol"
      >)</a
      ><a name="20132"
      > </a
      ><a name="20133" class="Symbol"
      >(</a
      ><a name="20134" href="StlcProp.html#15865" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="20150"
      > </a
      ><a name="20151" href="StlcProp.html#20073" class="Bound"
      >v&#8758;A</a
      ><a name="20154"
      > </a
      ><a name="20155" href="StlcProp.html#20089" class="Bound"
      >t&#8322;&#8758;A</a
      ><a name="20159" class="Symbol"
      >)</a
      ><a name="20160"
      >
</a
      ><a name="20161" href="StlcProp.html#15865" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="20177"
      > </a
      ><a name="20178" href="StlcProp.html#20178" class="Bound"
      >v&#8758;A</a
      ><a name="20181"
      > </a
      ><a name="20182" href="Stlc.html#19616" class="InductiveConstructor"
      >true</a
      ><a name="20186"
      >  </a
      ><a name="20188" class="Symbol"
      >=</a
      ><a name="20189"
      > </a
      ><a name="20190" href="Stlc.html#19616" class="InductiveConstructor"
      >true</a
      ><a name="20194"
      >
</a
      ><a name="20195" href="StlcProp.html#15865" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="20211"
      > </a
      ><a name="20212" href="StlcProp.html#20212" class="Bound"
      >v&#8758;A</a
      ><a name="20215"
      > </a
      ><a name="20216" href="Stlc.html#19675" class="InductiveConstructor"
      >false</a
      ><a name="20221"
      > </a
      ><a name="20222" class="Symbol"
      >=</a
      ><a name="20223"
      > </a
      ><a name="20224" href="Stlc.html#19675" class="InductiveConstructor"
      >false</a
      ><a name="20229"
      >
</a
      ><a name="20230" href="StlcProp.html#15865" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="20246"
      > </a
      ><a name="20247" href="StlcProp.html#20247" class="Bound"
      >v&#8758;A</a
      ><a name="20250"
      > </a
      ><a name="20251" class="Symbol"
      >(</a
      ><a name="20252" href="Stlc.html#19734" class="InductiveConstructor Operator"
      >if</a
      ><a name="20254"
      > </a
      ><a name="20255" href="StlcProp.html#20255" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="20262"
      > </a
      ><a name="20263" href="Stlc.html#19734" class="InductiveConstructor Operator"
      >then</a
      ><a name="20267"
      > </a
      ><a name="20268" href="StlcProp.html#20268" class="Bound"
      >t&#8322;&#8758;B</a
      ><a name="20272"
      > </a
      ><a name="20273" href="Stlc.html#19734" class="InductiveConstructor Operator"
      >else</a
      ><a name="20277"
      > </a
      ><a name="20278" href="StlcProp.html#20278" class="Bound"
      >t&#8323;&#8758;B</a
      ><a name="20282" class="Symbol"
      >)</a
      ><a name="20283"
      > </a
      ><a name="20284" class="Symbol"
      >=</a
      ><a name="20285"
      >
  </a
      ><a name="20288" href="Stlc.html#19734" class="InductiveConstructor Operator"
      >if</a
      ><a name="20290"
      >   </a
      ><a name="20293" href="StlcProp.html#15865" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="20309"
      > </a
      ><a name="20310" href="StlcProp.html#20247" class="Bound"
      >v&#8758;A</a
      ><a name="20313"
      > </a
      ><a name="20314" href="StlcProp.html#20255" class="Bound"
      >t&#8321;&#8758;bool</a
      ><a name="20321"
      >
  </a
      ><a name="20324" href="Stlc.html#19734" class="InductiveConstructor Operator"
      >then</a
      ><a name="20328"
      > </a
      ><a name="20329" href="StlcProp.html#15865" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="20345"
      > </a
      ><a name="20346" href="StlcProp.html#20247" class="Bound"
      >v&#8758;A</a
      ><a name="20349"
      > </a
      ><a name="20350" href="StlcProp.html#20268" class="Bound"
      >t&#8322;&#8758;B</a
      ><a name="20354"
      >
  </a
      ><a name="20357" href="Stlc.html#19734" class="InductiveConstructor Operator"
      >else</a
      ><a name="20361"
      > </a
      ><a name="20362" href="StlcProp.html#15865" class="Function"
      >[:=]-preserves-&#8866;</a
      ><a name="20378"
      > </a
      ><a name="20379" href="StlcProp.html#20247" class="Bound"
      >v&#8758;A</a
      ><a name="20382"
      > </a
      ><a name="20383" href="StlcProp.html#20278" class="Bound"
      >t&#8323;&#8758;B</a
      >
</pre><!--{% endraw %}-->


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
