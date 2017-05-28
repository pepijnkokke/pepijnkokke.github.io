---
title        : "Insertion sort in Agda"
date         : 2016-03-01 12:00:00
categories   : [compsci]
tags         : [agda]
extra-script : [agda-extra-script.html]
extra-style  : [agda-extra-style.html]
---

I wrote this code a long time ago, and verifiying the correctness of
some sorting algorithm is pretty much *the* standard "Hello World! I
can Agda!" blog post---well, that and implementing the
λ-calculus---but I really wanted an excuse to test my Jekyll/Agda
integration.

Now, the version of insertion sort that I will write in this blog post
will be *correct by construction*. By this I mean that I will
implemented insertion sort as a function from lists to ordered lists,
where the type of ordered lists only contains ordered lists.
There are some concerns about whether this style of programming is the
right way to go. If you read a lot of Coq code, you will notice that
Coq programmers often implement functions without *any*
guarantees---e.g. they would implement insertion sort as a function from
lists to lists---and then prove the function's properties separately.
Personally, I have found that this style can lead to very clumsy code,
but there are good arguments to be made for its naive efficiency, both
in terms of time and space---if you don't need some property, you
don't have to compute its proof!

I'm getting carried away... Well, one last announcement in the public
interest: This post is written in literate Agda, and I've gone through
the effort of using the Agda hilighter. This means that all functions
and module names have links to their definitions---be it within the
post, or in the Agda standard library!

Obligatory "this is literate code, here are my imports."

<pre class="Agda">
{% raw %}
<a name="1719" class="Keyword"
      >open</a
      ><a name="1723"
      > </a
      ><a name="1724" class="Keyword"
      >import</a
      ><a name="1730"
      > </a
      ><a name="1731" href="https://agda.github.io/agda-stdlib/Level.html#1" class="Module"
      >Level</a
      ><a name="1736"
      >            </a
      ><a name="1748" class="Keyword"
      >using</a
      ><a name="1753"
      > </a
      ><a name="1754" class="Symbol"
      >(</a
      ><a name="1755" href="Agda.Primitive.html#657" class="Primitive Operator"
      >_&#8852;_</a
      ><a name="1758" class="Symbol"
      >)</a
      ><a name="1759"
      >
</a
      ><a name="1760" class="Keyword"
      >open</a
      ><a name="1764"
      > </a
      ><a name="1765" class="Keyword"
      >import</a
      ><a name="1771"
      > </a
      ><a name="1772" href="https://agda.github.io/agda-stdlib/Data.Vec.html#1" class="Module"
      >Data.Vec</a
      ><a name="1780"
      >         </a
      ><a name="1789" class="Keyword"
      >using</a
      ><a name="1794"
      > </a
      ><a name="1795" class="Symbol"
      >(</a
      ><a name="1796" href="https://agda.github.io/agda-stdlib/Data.Vec.html#638" class="Datatype"
      >Vec</a
      ><a name="1799" class="Symbol"
      >;</a
      ><a name="1800"
      > </a
      ><a name="1801" href="https://agda.github.io/agda-stdlib/Data.Vec.html#678" class="InductiveConstructor"
      >[]</a
      ><a name="1803" class="Symbol"
      >;</a
      ><a name="1804"
      > </a
      ><a name="1805" href="https://agda.github.io/agda-stdlib/Data.Vec.html#697" class="InductiveConstructor Operator"
      >_&#8759;_</a
      ><a name="1808" class="Symbol"
      >)</a
      ><a name="1809"
      >
</a
      ><a name="1810" class="Keyword"
      >open</a
      ><a name="1814"
      > </a
      ><a name="1815" class="Keyword"
      >import</a
      ><a name="1821"
      > </a
      ><a name="1822" href="https://agda.github.io/agda-stdlib/Data.Nat.html#1" class="Module"
      >Data.Nat</a
      ><a name="1830"
      >         </a
      ><a name="1839" class="Keyword"
      >using</a
      ><a name="1844"
      > </a
      ><a name="1845" class="Symbol"
      >(</a
      ><a name="1846" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#97" class="Datatype"
      >&#8469;</a
      ><a name="1847" class="Symbol"
      >;</a
      ><a name="1848"
      > </a
      ><a name="1849" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#115" class="InductiveConstructor"
      >zero</a
      ><a name="1853" class="Symbol"
      >;</a
      ><a name="1854"
      > </a
      ><a name="1855" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#128" class="InductiveConstructor"
      >suc</a
      ><a name="1858" class="Symbol"
      >)</a
      ><a name="1859"
      >
</a
      ><a name="1860" class="Keyword"
      >open</a
      ><a name="1864"
      > </a
      ><a name="1865" class="Keyword"
      >import</a
      ><a name="1871"
      > </a
      ><a name="1872" href="https://agda.github.io/agda-stdlib/Data.Sum.html#1" class="Module"
      >Data.Sum</a
      ><a name="1880"
      >         </a
      ><a name="1889" class="Keyword"
      >using</a
      ><a name="1894"
      > </a
      ><a name="1895" class="Symbol"
      >(</a
      ><a name="1896" href="https://agda.github.io/agda-stdlib/Data.Sum.html#433" class="Datatype Operator"
      >_&#8846;_</a
      ><a name="1899" class="Symbol"
      >;</a
      ><a name="1900"
      > </a
      ><a name="1901" href="https://agda.github.io/agda-stdlib/Data.Sum.html#489" class="InductiveConstructor"
      >inj&#8321;</a
      ><a name="1905" class="Symbol"
      >;</a
      ><a name="1906"
      > </a
      ><a name="1907" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="1911" class="Symbol"
      >)</a
      ><a name="1912"
      >
</a
      ><a name="1913" class="Keyword"
      >open</a
      ><a name="1917"
      > </a
      ><a name="1918" class="Keyword"
      >import</a
      ><a name="1924"
      > </a
      ><a name="1925" href="https://agda.github.io/agda-stdlib/Data.Product.html#1" class="Module"
      >Data.Product</a
      ><a name="1937"
      >     </a
      ><a name="1942" class="Keyword"
      >using</a
      ><a name="1947"
      > </a
      ><a name="1948" class="Symbol"
      >(</a
      ><a name="1949" href="https://agda.github.io/agda-stdlib/Data.Product.html#823" class="Function"
      >&#8707;</a
      ><a name="1950" class="Symbol"
      >;</a
      ><a name="1951"
      > </a
      ><a name="1952" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >_,_</a
      ><a name="1955" class="Symbol"
      >;</a
      ><a name="1956"
      > </a
      ><a name="1957" href="https://agda.github.io/agda-stdlib/Data.Product.html#525" class="Field"
      >proj&#8321;</a
      ><a name="1962" class="Symbol"
      >;</a
      ><a name="1963"
      > </a
      ><a name="1964" href="https://agda.github.io/agda-stdlib/Data.Product.html#539" class="Field"
      >proj&#8322;</a
      ><a name="1969" class="Symbol"
      >)</a
      ><a name="1970"
      >
</a
      ><a name="1971" class="Keyword"
      >open</a
      ><a name="1975"
      > </a
      ><a name="1976" class="Keyword"
      >import</a
      ><a name="1982"
      > </a
      ><a name="1983" href="https://agda.github.io/agda-stdlib/Data.Empty.html#1" class="Module"
      >Data.Empty</a
      ><a name="1993"
      >       </a
      ><a name="2000" class="Keyword"
      >using</a
      ><a name="2005"
      > </a
      ><a name="2006" class="Symbol"
      >(</a
      ><a name="2007" href="https://agda.github.io/agda-stdlib/Data.Empty.html#360" class="Function"
      >&#8869;-elim</a
      ><a name="2013" class="Symbol"
      >)</a
      ><a name="2014"
      >
</a
      ><a name="2015" class="Keyword"
      >open</a
      ><a name="2019"
      > </a
      ><a name="2020" class="Keyword"
      >import</a
      ><a name="2026"
      > </a
      ><a name="2027" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#1" class="Module"
      >Relation.Nullary</a
      ><a name="2043"
      > </a
      ><a name="2044" class="Keyword"
      >using</a
      ><a name="2049"
      > </a
      ><a name="2050" class="Symbol"
      >(</a
      ><a name="2051" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#414" class="Function Operator"
      >&#172;_</a
      ><a name="2053" class="Symbol"
      >;</a
      ><a name="2054"
      > </a
      ><a name="2055" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#484" class="Datatype"
      >Dec</a
      ><a name="2058" class="Symbol"
      >;</a
      ><a name="2059"
      > </a
      ><a name="2060" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="2063" class="Symbol"
      >;</a
      ><a name="2064"
      > </a
      ><a name="2065" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="2067" class="Symbol"
      >)</a
      ><a name="2068"
      >
</a
      ><a name="2069" class="Keyword"
      >open</a
      ><a name="2073"
      > </a
      ><a name="2074" class="Keyword"
      >import</a
      ><a name="2080"
      > </a
      ><a name="2081" href="https://agda.github.io/agda-stdlib/Relation.Binary.html#1" class="Module"
      >Relation.Binary</a
      ><a name="2096"
      >
</a
      ><a name="2097" class="Keyword"
      >open</a
      ><a name="2101"
      > </a
      ><a name="2102" class="Keyword"
      >import</a
      ><a name="2108"
      > </a
      ><a name="2109" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.html#1" class="Module"
      >Relation.Binary.PropositionalEquality</a
      >
{% endraw %}
</pre>

So the first question is "What do we want to sort?" The boring answer
would be "lists of integers", but let's be a little bit more
general. We can sort anything that forms a *decidable, total
order*. Basically, this means three things:

  - we have some type A;
  - for any x and y of type A, we have a *type* of orderings between
    them, which we write as `x ≤ y`;
  - we can actually get that ordering using `x ≤? y` or `total x y`.

Below, we define our module to work for any decidable total order, and
we unpack that order. If you have a look at `≤?` and `total`, you'll
notice that they do slightly different things. For some x and y, `x ≤?
y` will tell you whether or not `x ≤ y`, whereas `total` will tell you
whether it is `x ≤ y` or `y ≤ x`.

<div style="display:none;">
<pre class="Agda">
{% raw %}
<a name="2955" class="Keyword"
      >module</a
      ><a name="2961"
      > </a
      ><a name="2962" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#1" class="Module"
      >2016-03-01-insertion-sort-in-agda</a
      ><a name="2995"
      > </a
      ><a name="2996" class="Keyword"
      >where</a
      >
{% endraw %}
</pre>
</div>

<pre class="Agda">
{% raw %}
<a name="3034" class="Keyword"
      >module</a
      ><a name="3040"
      > </a
      ><a name="3041" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3041" class="Module"
      >InsertionSort</a
      ><a name="3054"
      > </a
      ><a name="3065" class="Symbol"
      >{{</a
      ><a name="3067" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3067" class="Bound"
      >Ord</a
      ><a name="3070"
      > </a
      ><a name="3071" class="Symbol"
      >:</a
      ><a name="3072"
      > </a
      ><a name="3073" href="https://agda.github.io/agda-stdlib/Relation.Binary.html#9224" class="Record"
      >DecTotalOrder</a
      ><a name="3086"
      > </a
      ><a name="3087" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3056" class="Bound"
      >c</a
      ><a name="3088"
      > </a
      ><a name="3089" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3058" class="Bound"
      >&#8467;&#8321;</a
      ><a name="3091"
      > </a
      ><a name="3092" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3061" class="Bound"
      >&#8467;&#8322;</a
      ><a name="3094" class="Symbol"
      >}}</a
      ><a name="3096"
      > </a
      ><a name="3097" class="Keyword"
      >where</a
      ><a name="3102"
      >

  </a
      ><a name="3106" class="Keyword"
      >open</a
      ><a name="3110"
      > </a
      ><a name="3111" href="https://agda.github.io/agda-stdlib/Relation.Binary.html#9224" class="Module"
      >DecTotalOrder</a
      ><a name="3124"
      > </a
      ><a name="3125" class="Symbol"
      >{{...}}</a
      ><a name="3132"
      >
    </a
      ><a name="3137" class="Keyword"
      >using</a
      ><a name="3142"
      > </a
      ><a name="3143" class="Symbol"
      >(</a
      ><a name="3144"
      >_&#8804;_</a
      ><a name="3147" class="Symbol"
      >;</a
      ><a name="3148"
      > _&#8804;?_</a
      ><a name="3153" class="Symbol"
      >;</a
      ><a name="3154"
      > total</a
      ><a name="3160" class="Symbol"
      >)</a
      ><a name="3161"
      >
    </a
      ><a name="3166" class="Keyword"
      >renaming</a
      ><a name="3174"
      > </a
      ><a name="3175" class="Symbol"
      >(</a
      ><a name="3176"
      >trans </a
      ><a name="3182" class="Symbol"
      >to</a
      ><a name="3184"
      > &#8804;-trans</a
      ><a name="3192" class="Symbol"
      >)</a
      ><a name="3193"
      >
  </a
      ><a name="3196" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3196" class="Function"
      >A</a
      ><a name="3197"
      > </a
      ><a name="3198" class="Symbol"
      >=</a
      ><a name="3199"
      > </a
      ><a name="3200" href="https://agda.github.io/agda-stdlib/Relation.Binary.html#9308" class="Field"
      >DecTotalOrder.Carrier</a
      ><a name="3221"
      > </a
      ><a name="3222" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3067" class="Bound"
      >Ord</a
      >
{% endraw %}
</pre>

The type A is already ordered, but it would be incredibly convenient
if it were also *bounded*---meaning that it has a value which is
smaller than everything else, and a value which is bigger than
everything else. Below, we define a wrapper for A which is bounded at
the top by ⊤ and at the bottom by ⊥:

<pre class="Agda">
{% raw %}
  <a name="3558" class="Keyword"
      >data</a
      ><a name="3562"
      > </a
      ><a name="3563" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3563" class="Datatype"
      >A&#770;</a
      ><a name="3565"
      > </a
      ><a name="3566" class="Symbol"
      >:</a
      ><a name="3567"
      > </a
      ><a name="3568" class="PrimitiveType"
      >Set</a
      ><a name="3571"
      > </a
      ><a name="3572" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3056" class="Bound"
      >c</a
      ><a name="3573"
      > </a
      ><a name="3574" class="Keyword"
      >where</a
      ><a name="3579"
      >
    </a
      ><a name="3584" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3584" class="InductiveConstructor"
      >&#8868;</a
      ><a name="3585"
      > </a
      ><a name="3586" class="Symbol"
      >:</a
      ><a name="3587"
      > </a
      ><a name="3588" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3563" class="Datatype"
      >A&#770;</a
      ><a name="3590"
      >
    </a
      ><a name="3595" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3595" class="InductiveConstructor"
      >&#8869;</a
      ><a name="3596"
      > </a
      ><a name="3597" class="Symbol"
      >:</a
      ><a name="3598"
      > </a
      ><a name="3599" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3563" class="Datatype"
      >A&#770;</a
      ><a name="3601"
      >
    </a
      ><a name="3606" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3606" class="InductiveConstructor Operator"
      >&#10214;_&#10215;</a
      ><a name="3609"
      > </a
      ><a name="3610" class="Symbol"
      >:</a
      ><a name="3611"
      > </a
      ><a name="3612" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3196" class="Function"
      >A</a
      ><a name="3613"
      > </a
      ><a name="3614" class="Symbol"
      >&#8594;</a
      ><a name="3615"
      > </a
      ><a name="3616" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3563" class="Datatype"
      >A&#770;</a
      >
{% endraw %}
</pre>

We still need to encode the fact that ⊥ and ⊤ are in fact smaller and
bigger than all other values. Below, we defined the order ≲ on bounded
Â... where we simply state these facts as ⊥≲ and ≲⊤:

<pre class="Agda">
{% raw %}
  <a name="3842" class="Keyword"
      >infix</a
      ><a name="3847"
      > </a
      ><a name="3848" class="Number"
      >4</a
      ><a name="3849"
      > </a
      ><a name="3850" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3862" class="Datatype Operator"
      >_&#8818;_</a
      ><a name="3853"
      >

  </a
      ><a name="3857" class="Keyword"
      >data</a
      ><a name="3861"
      > </a
      ><a name="3862" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3862" class="Datatype Operator"
      >_&#8818;_</a
      ><a name="3865"
      > </a
      ><a name="3866" class="Symbol"
      >:</a
      ><a name="3867"
      > </a
      ><a name="3868" href="https://agda.github.io/agda-stdlib/Relation.Binary.Core.html#740" class="Function"
      >Rel</a
      ><a name="3871"
      > </a
      ><a name="3872" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3563" class="Datatype"
      >A&#770;</a
      ><a name="3874"
      > </a
      ><a name="3875" class="Symbol"
      >(</a
      ><a name="3876" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3056" class="Bound"
      >c</a
      ><a name="3877"
      > </a
      ><a name="3878" href="Agda.Primitive.html#657" class="Primitive Operator"
      >&#8852;</a
      ><a name="3879"
      > </a
      ><a name="3880" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3061" class="Bound"
      >&#8467;&#8322;</a
      ><a name="3882" class="Symbol"
      >)</a
      ><a name="3883"
      > </a
      ><a name="3884" class="Keyword"
      >where</a
      ><a name="3889"
      >
    </a
      ><a name="3894" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3894" class="InductiveConstructor"
      >&#8869;&#8818;</a
      ><a name="3896"
      > </a
      ><a name="3897" class="Symbol"
      >:</a
      ><a name="3898"
      > </a
      ><a name="3907" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3595" class="InductiveConstructor"
      >&#8869;</a
      ><a name="3908"
      > </a
      ><a name="3909" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3862" class="Datatype Operator"
      >&#8818;</a
      ><a name="3910"
      > </a
      ><a name="3911" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3902" class="Bound"
      >x</a
      ><a name="3912"
      >
    </a
      ><a name="3917" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3917" class="InductiveConstructor"
      >&#8818;&#8868;</a
      ><a name="3919"
      > </a
      ><a name="3920" class="Symbol"
      >:</a
      ><a name="3921"
      > </a
      ><a name="3930" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3925" class="Bound"
      >x</a
      ><a name="3931"
      > </a
      ><a name="3932" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3862" class="Datatype Operator"
      >&#8818;</a
      ><a name="3933"
      > </a
      ><a name="3934" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3584" class="InductiveConstructor"
      >&#8868;</a
      ><a name="3935"
      >
    </a
      ><a name="3940" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3940" class="InductiveConstructor"
      >&#8804;-lift</a
      ><a name="3946"
      > </a
      ><a name="3947" class="Symbol"
      >:</a
      ><a name="3948"
      > </a
      ><a name="3959" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3952" class="Bound"
      >x</a
      ><a name="3960"
      > </a
      ><a name="3961" href="https://agda.github.io/agda-stdlib/Relation.Binary.html#9373" class="Field Operator"
      >&#8804;</a
      ><a name="3962"
      > </a
      ><a name="3963" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3954" class="Bound"
      >y</a
      ><a name="3964"
      > </a
      ><a name="3965" class="Symbol"
      >&#8594;</a
      ><a name="3966"
      > </a
      ><a name="3967" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3606" class="InductiveConstructor Operator"
      >&#10214;</a
      ><a name="3968"
      > </a
      ><a name="3969" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3952" class="Bound"
      >x</a
      ><a name="3970"
      > </a
      ><a name="3971" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3606" class="InductiveConstructor Operator"
      >&#10215;</a
      ><a name="3972"
      > </a
      ><a name="3973" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3862" class="Datatype Operator"
      >&#8818;</a
      ><a name="3974"
      > </a
      ><a name="3975" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3606" class="InductiveConstructor Operator"
      >&#10214;</a
      ><a name="3976"
      > </a
      ><a name="3977" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3954" class="Bound"
      >y</a
      ><a name="3978"
      > </a
      ><a name="3979" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3606" class="InductiveConstructor Operator"
      >&#10215;</a
      >
{% endraw %}
</pre>

Note that with the last constructor, we can lift the order of any two
values in A into ≲. However, if we only have a proof of ≰, then the
lifting is slightly more involved. Therefore, we define a function
which does this for us:

<pre class="Agda">
{% raw %}
  <a name="4238" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4238" class="Function"
      >&#8816;-lift</a
      ><a name="4244"
      > </a
      ><a name="4245" class="Symbol"
      >:</a
      ><a name="4246"
      > </a
      ><a name="4257" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#414" class="Function Operator"
      >&#172;</a
      ><a name="4258"
      > </a
      ><a name="4259" class="Symbol"
      >(</a
      ><a name="4260" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4252" class="Bound"
      >y</a
      ><a name="4261"
      > </a
      ><a name="4262" href="https://agda.github.io/agda-stdlib/Relation.Binary.html#9373" class="Field Operator"
      >&#8804;</a
      ><a name="4263"
      > </a
      ><a name="4264" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4250" class="Bound"
      >x</a
      ><a name="4265" class="Symbol"
      >)</a
      ><a name="4266"
      > </a
      ><a name="4267" class="Symbol"
      >&#8594;</a
      ><a name="4268"
      > </a
      ><a name="4269" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3606" class="InductiveConstructor Operator"
      >&#10214;</a
      ><a name="4270"
      > </a
      ><a name="4271" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4250" class="Bound"
      >x</a
      ><a name="4272"
      > </a
      ><a name="4273" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3606" class="InductiveConstructor Operator"
      >&#10215;</a
      ><a name="4274"
      > </a
      ><a name="4275" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3862" class="Datatype Operator"
      >&#8818;</a
      ><a name="4276"
      > </a
      ><a name="4277" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3606" class="InductiveConstructor Operator"
      >&#10214;</a
      ><a name="4278"
      > </a
      ><a name="4279" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4252" class="Bound"
      >y</a
      ><a name="4280"
      > </a
      ><a name="4281" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3606" class="InductiveConstructor Operator"
      >&#10215;</a
      ><a name="4282"
      >
  </a
      ><a name="4285" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4238" class="Function"
      >&#8816;-lift</a
      ><a name="4291"
      > </a
      ><a name="4300" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4300" class="Bound"
      >y&#8816;x</a
      ><a name="4303"
      > </a
      ><a name="4304" class="Keyword"
      >with</a
      ><a name="4308"
      > </a
      ><a name="4309" href="https://agda.github.io/agda-stdlib/Relation.Binary.html#8067" class="Function"
      >total</a
      ><a name="4314"
      > </a
      ><a name="4315" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4293" class="Bound"
      >x</a
      ><a name="4316"
      > </a
      ><a name="4317" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4297" class="Bound"
      >y</a
      ><a name="4318"
      >
  </a
      ><a name="4321" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4238" class="Function"
      >&#8816;-lift</a
      ><a name="4327"
      > </a
      ><a name="4328" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4328" class="Bound"
      >y&#8816;x</a
      ><a name="4331"
      > </a
      ><a name="4332" class="Symbol"
      >|</a
      ><a name="4333"
      > </a
      ><a name="4334" href="https://agda.github.io/agda-stdlib/Data.Sum.html#489" class="InductiveConstructor"
      >inj&#8321;</a
      ><a name="4338"
      > </a
      ><a name="4339" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4339" class="Bound"
      >x&#8804;y</a
      ><a name="4342"
      > </a
      ><a name="4343" class="Symbol"
      >=</a
      ><a name="4344"
      > </a
      ><a name="4345" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3940" class="InductiveConstructor"
      >&#8804;-lift</a
      ><a name="4351"
      > </a
      ><a name="4352" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4339" class="Bound"
      >x&#8804;y</a
      ><a name="4355"
      >
  </a
      ><a name="4358" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4238" class="Function"
      >&#8816;-lift</a
      ><a name="4364"
      > </a
      ><a name="4365" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4365" class="Bound"
      >y&#8816;x</a
      ><a name="4368"
      > </a
      ><a name="4369" class="Symbol"
      >|</a
      ><a name="4370"
      > </a
      ><a name="4371" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="4375"
      > </a
      ><a name="4376" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4376" class="Bound"
      >y&#8804;x</a
      ><a name="4379"
      > </a
      ><a name="4380" class="Symbol"
      >=</a
      ><a name="4381"
      > </a
      ><a name="4382" href="https://agda.github.io/agda-stdlib/Data.Empty.html#360" class="Function"
      >&#8869;-elim</a
      ><a name="4388"
      > </a
      ><a name="4389" class="Symbol"
      >(</a
      ><a name="4390" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4365" class="Bound"
      >y&#8816;x</a
      ><a name="4393"
      > </a
      ><a name="4394" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4376" class="Bound"
      >y&#8804;x</a
      ><a name="4397" class="Symbol"
      >)</a
      >
{% endraw %}
</pre>

Another thing we can do with two values of type Â is compute their
*minimum*. This is one example where we deviate from *correctness by
construction*: we define minimum function ⊓, and only then prove its
correctness:

<pre class="Agda">
{% raw %}
  <a name="4646" class="Keyword"
      >infix</a
      ><a name="4651"
      > </a
      ><a name="4652" class="Number"
      >5</a
      ><a name="4653"
      > </a
      ><a name="4654" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4661" class="Function Operator"
      >_&#8851;_</a
      ><a name="4657"
      >

  </a
      ><a name="4661" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4661" class="Function Operator"
      >_&#8851;_</a
      ><a name="4664"
      > </a
      ><a name="4665" class="Symbol"
      >:</a
      ><a name="4666"
      > </a
      ><a name="4667" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3563" class="Datatype"
      >A&#770;</a
      ><a name="4669"
      > </a
      ><a name="4670" class="Symbol"
      >&#8594;</a
      ><a name="4671"
      > </a
      ><a name="4672" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3563" class="Datatype"
      >A&#770;</a
      ><a name="4674"
      > </a
      ><a name="4675" class="Symbol"
      >&#8594;</a
      ><a name="4676"
      > </a
      ><a name="4677" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3563" class="Datatype"
      >A&#770;</a
      ><a name="4679"
      >
  </a
      ><a name="4682" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3584" class="InductiveConstructor"
      >&#8868;</a
      ><a name="4683"
      > </a
      ><a name="4684" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4661" class="Function Operator"
      >&#8851;</a
      ><a name="4685"
      > </a
      ><a name="4686" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4686" class="Bound"
      >y</a
      ><a name="4687"
      > </a
      ><a name="4688" class="Symbol"
      >=</a
      ><a name="4689"
      > </a
      ><a name="4690" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4686" class="Bound"
      >y</a
      ><a name="4691"
      >
  </a
      ><a name="4694" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3595" class="InductiveConstructor"
      >&#8869;</a
      ><a name="4695"
      > </a
      ><a name="4696" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4661" class="Function Operator"
      >&#8851;</a
      ><a name="4697"
      > </a
      ><a name="4698" class="Symbol"
      >_</a
      ><a name="4699"
      > </a
      ><a name="4700" class="Symbol"
      >=</a
      ><a name="4701"
      > </a
      ><a name="4702" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3595" class="InductiveConstructor"
      >&#8869;</a
      ><a name="4703"
      >
  </a
      ><a name="4706" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4706" class="Bound"
      >x</a
      ><a name="4707"
      > </a
      ><a name="4708" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4661" class="Function Operator"
      >&#8851;</a
      ><a name="4709"
      > </a
      ><a name="4710" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3584" class="InductiveConstructor"
      >&#8868;</a
      ><a name="4711"
      > </a
      ><a name="4712" class="Symbol"
      >=</a
      ><a name="4713"
      > </a
      ><a name="4714" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4706" class="Bound"
      >x</a
      ><a name="4715"
      >
  </a
      ><a name="4718" class="Symbol"
      >_</a
      ><a name="4719"
      > </a
      ><a name="4720" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4661" class="Function Operator"
      >&#8851;</a
      ><a name="4721"
      > </a
      ><a name="4722" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3595" class="InductiveConstructor"
      >&#8869;</a
      ><a name="4723"
      > </a
      ><a name="4724" class="Symbol"
      >=</a
      ><a name="4725"
      > </a
      ><a name="4726" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3595" class="InductiveConstructor"
      >&#8869;</a
      ><a name="4727"
      >
  </a
      ><a name="4730" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3606" class="InductiveConstructor Operator"
      >&#10214;</a
      ><a name="4731"
      > </a
      ><a name="4732" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4732" class="Bound"
      >x</a
      ><a name="4733"
      > </a
      ><a name="4734" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3606" class="InductiveConstructor Operator"
      >&#10215;</a
      ><a name="4735"
      > </a
      ><a name="4736" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4661" class="Function Operator"
      >&#8851;</a
      ><a name="4737"
      > </a
      ><a name="4738" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3606" class="InductiveConstructor Operator"
      >&#10214;</a
      ><a name="4739"
      > </a
      ><a name="4740" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4740" class="Bound"
      >y</a
      ><a name="4741"
      > </a
      ><a name="4742" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3606" class="InductiveConstructor Operator"
      >&#10215;</a
      ><a name="4743"
      > </a
      ><a name="4744" class="Keyword"
      >with</a
      ><a name="4748"
      > </a
      ><a name="4749" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4732" class="Bound"
      >x</a
      ><a name="4750"
      > </a
      ><a name="4751" href="https://agda.github.io/agda-stdlib/Relation.Binary.html#8876" class="Function Operator"
      >&#8804;?</a
      ><a name="4753"
      > </a
      ><a name="4754" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4740" class="Bound"
      >y</a
      ><a name="4755"
      >
  </a
      ><a name="4758" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3606" class="InductiveConstructor Operator"
      >&#10214;</a
      ><a name="4759"
      > </a
      ><a name="4760" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4760" class="Bound"
      >x</a
      ><a name="4761"
      > </a
      ><a name="4762" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3606" class="InductiveConstructor Operator"
      >&#10215;</a
      ><a name="4763"
      > </a
      ><a name="4764" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4661" class="Function Operator"
      >&#8851;</a
      ><a name="4765"
      > </a
      ><a name="4766" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3606" class="InductiveConstructor Operator"
      >&#10214;</a
      ><a name="4767"
      > </a
      ><a name="4768" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4768" class="Bound"
      >y</a
      ><a name="4769"
      > </a
      ><a name="4770" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3606" class="InductiveConstructor Operator"
      >&#10215;</a
      ><a name="4771"
      > </a
      ><a name="4772" class="Symbol"
      >|</a
      ><a name="4773"
      > </a
      ><a name="4774" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="4777"
      > </a
      ><a name="4778" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4778" class="Bound"
      >x&#8804;y</a
      ><a name="4781"
      > </a
      ><a name="4782" class="Symbol"
      >=</a
      ><a name="4783"
      > </a
      ><a name="4784" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3606" class="InductiveConstructor Operator"
      >&#10214;</a
      ><a name="4785"
      > </a
      ><a name="4786" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4760" class="Bound"
      >x</a
      ><a name="4787"
      > </a
      ><a name="4788" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3606" class="InductiveConstructor Operator"
      >&#10215;</a
      ><a name="4789"
      >
  </a
      ><a name="4792" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3606" class="InductiveConstructor Operator"
      >&#10214;</a
      ><a name="4793"
      > </a
      ><a name="4794" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4794" class="Bound"
      >x</a
      ><a name="4795"
      > </a
      ><a name="4796" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3606" class="InductiveConstructor Operator"
      >&#10215;</a
      ><a name="4797"
      > </a
      ><a name="4798" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4661" class="Function Operator"
      >&#8851;</a
      ><a name="4799"
      > </a
      ><a name="4800" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3606" class="InductiveConstructor Operator"
      >&#10214;</a
      ><a name="4801"
      > </a
      ><a name="4802" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4802" class="Bound"
      >y</a
      ><a name="4803"
      > </a
      ><a name="4804" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3606" class="InductiveConstructor Operator"
      >&#10215;</a
      ><a name="4805"
      > </a
      ><a name="4806" class="Symbol"
      >|</a
      ><a name="4807"
      > </a
      ><a name="4808" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="4810"
      >  </a
      ><a name="4812" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4812" class="Bound"
      >x&gt;y</a
      ><a name="4815"
      > </a
      ><a name="4816" class="Symbol"
      >=</a
      ><a name="4817"
      > </a
      ><a name="4818" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3606" class="InductiveConstructor Operator"
      >&#10214;</a
      ><a name="4819"
      > </a
      ><a name="4820" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4802" class="Bound"
      >y</a
      ><a name="4821"
      > </a
      ><a name="4822" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3606" class="InductiveConstructor Operator"
      >&#10215;</a
      ><a name="4823"
      >

  </a
      ><a name="4827" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4827" class="Function"
      >&#8851;-conserves-&#8818;</a
      ><a name="4840"
      > </a
      ><a name="4841" class="Symbol"
      >:</a
      ><a name="4842"
      > </a
      ><a name="4855" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4846" class="Bound"
      >x</a
      ><a name="4856"
      > </a
      ><a name="4857" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3862" class="Datatype Operator"
      >&#8818;</a
      ><a name="4858"
      > </a
      ><a name="4859" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4848" class="Bound"
      >y</a
      ><a name="4860"
      > </a
      ><a name="4861" class="Symbol"
      >&#8594;</a
      ><a name="4862"
      > </a
      ><a name="4863" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4846" class="Bound"
      >x</a
      ><a name="4864"
      > </a
      ><a name="4865" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3862" class="Datatype Operator"
      >&#8818;</a
      ><a name="4866"
      > </a
      ><a name="4867" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4850" class="Bound"
      >z</a
      ><a name="4868"
      > </a
      ><a name="4869" class="Symbol"
      >&#8594;</a
      ><a name="4870"
      > </a
      ><a name="4871" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4846" class="Bound"
      >x</a
      ><a name="4872"
      > </a
      ><a name="4873" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3862" class="Datatype Operator"
      >&#8818;</a
      ><a name="4874"
      > </a
      ><a name="4875" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4848" class="Bound"
      >y</a
      ><a name="4876"
      > </a
      ><a name="4877" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4661" class="Function Operator"
      >&#8851;</a
      ><a name="4878"
      > </a
      ><a name="4879" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4850" class="Bound"
      >z</a
      ><a name="4880"
      >
  </a
      ><a name="4883" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4827" class="Function"
      >&#8851;-conserves-&#8818;</a
      ><a name="4896"
      > </a
      ><a name="4905" class="Symbol"
      >{_}</a
      ><a name="4908"
      > </a
      ><a name="4909" class="Symbol"
      >_</a
      ><a name="4910"
      > </a
      ><a name="4911" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4911" class="Bound"
      >q</a
      ><a name="4912"
      > </a
      ><a name="4913" class="Symbol"
      >=</a
      ><a name="4914"
      > </a
      ><a name="4915" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4911" class="Bound"
      >q</a
      ><a name="4916"
      >
  </a
      ><a name="4919" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4827" class="Function"
      >&#8851;-conserves-&#8818;</a
      ><a name="4932"
      > </a
      ><a name="4941" class="Symbol"
      >{_}</a
      ><a name="4944"
      > </a
      ><a name="4945" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4945" class="Bound"
      >p</a
      ><a name="4946"
      > </a
      ><a name="4947" class="Symbol"
      >_</a
      ><a name="4948"
      > </a
      ><a name="4949" class="Symbol"
      >=</a
      ><a name="4950"
      > </a
      ><a name="4951" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4945" class="Bound"
      >p</a
      ><a name="4952"
      >
  </a
      ><a name="4955" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4827" class="Function"
      >&#8851;-conserves-&#8818;</a
      ><a name="4968"
      > </a
      ><a name="4985" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4985" class="Bound"
      >p</a
      ><a name="4986"
      > </a
      ><a name="4987" class="Symbol"
      >_</a
      ><a name="4988"
      > </a
      ><a name="4989" class="Symbol"
      >=</a
      ><a name="4990"
      > </a
      ><a name="4991" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4985" class="Bound"
      >p</a
      ><a name="4992"
      >
  </a
      ><a name="4995" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4827" class="Function"
      >&#8851;-conserves-&#8818;</a
      ><a name="5008"
      > </a
      ><a name="5025" class="Symbol"
      >_</a
      ><a name="5026"
      > </a
      ><a name="5027" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#5027" class="Bound"
      >q</a
      ><a name="5028"
      > </a
      ><a name="5029" class="Symbol"
      >=</a
      ><a name="5030"
      > </a
      ><a name="5031" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#5027" class="Bound"
      >q</a
      ><a name="5032"
      >
  </a
      ><a name="5035" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4827" class="Function"
      >&#8851;-conserves-&#8818;</a
      ><a name="5048"
      > </a
      ><a name="5069" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#5069" class="Bound"
      >p</a
      ><a name="5070"
      > </a
      ><a name="5071" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#5071" class="Bound"
      >q</a
      ><a name="5072"
      > </a
      ><a name="5073" class="Keyword"
      >with</a
      ><a name="5077"
      > </a
      ><a name="5078" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#5056" class="Bound"
      >y</a
      ><a name="5079"
      > </a
      ><a name="5080" href="https://agda.github.io/agda-stdlib/Relation.Binary.html#8876" class="Function Operator"
      >&#8804;?</a
      ><a name="5082"
      > </a
      ><a name="5083" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#5064" class="Bound"
      >z</a
      ><a name="5084"
      >
  </a
      ><a name="5087" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4827" class="Function"
      >&#8851;-conserves-&#8818;</a
      ><a name="5100"
      > </a
      ><a name="5121" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#5121" class="Bound"
      >p</a
      ><a name="5122"
      > </a
      ><a name="5123" class="Symbol"
      >_</a
      ><a name="5124"
      > </a
      ><a name="5125" class="Symbol"
      >|</a
      ><a name="5126"
      > </a
      ><a name="5127" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="5130"
      > </a
      ><a name="5131" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#5131" class="Bound"
      >y&#8804;z</a
      ><a name="5134"
      > </a
      ><a name="5135" class="Symbol"
      >=</a
      ><a name="5136"
      > </a
      ><a name="5137" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#5121" class="Bound"
      >p</a
      ><a name="5138"
      >
  </a
      ><a name="5141" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4827" class="Function"
      >&#8851;-conserves-&#8818;</a
      ><a name="5154"
      > </a
      ><a name="5175" class="Symbol"
      >_</a
      ><a name="5176"
      > </a
      ><a name="5177" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#5177" class="Bound"
      >q</a
      ><a name="5178"
      > </a
      ><a name="5179" class="Symbol"
      >|</a
      ><a name="5180"
      > </a
      ><a name="5181" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="5183"
      >  </a
      ><a name="5185" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#5185" class="Bound"
      >y&#8816;z</a
      ><a name="5188"
      > </a
      ><a name="5189" class="Symbol"
      >=</a
      ><a name="5190"
      > </a
      ><a name="5191" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#5177" class="Bound"
      >q</a
      >
{% endraw %}
</pre>

Insertion sort has rather complicated invariants. If we were implementing
mergesort, that we could define ordered lists as lists in which every
element is larger than those before it... But alas! Such a crude
analysis won't work for insertion sort! In fact, the only guarantee that
insertion sort gives us is that after one "bubble"---one iteration over
the list---the *last* element is sorted... and that after *k* insertions,
the last *k* elements are sorted...

So to implement insertion sort, we're going to need some way to represent
lists of which the last *k* elements are sorted. In fact, because it's
easier to implement, we're going to go with an encoding which ensures
us that at most the *first* *k* elements are still *unsorted*.

The `OVec` datatype below has three parameters: *l*, *n* and *k*. The
first of these is the lower bound... that is to say, of the sorted
part, the smallest element is *l*.
The second is the length of the list. One question that we've avoided
so far is the question "What sort of things can go wrong in a sorting
algorithm?" Obviously, the first thing that comes to mind is "it
doens't sort", but some other problems that it could have is that it
can *delete* elements, or *copy* elements. While keeping track of the
length doesn't solve *all* of those problems---if we delete as much as
we copy, we don't change the length---but it's a good starting point.
The last, *k*, is the number of still unsorted elements at the
beginning of the list.

There are three ways to construct an `OVec`:

  - we have the empty list, which has zero length, and zero unsorted
    elements... and a sorted segment of length zero with lower bound
    ⊤---this was the main reason to introduce Â;
  - we can add an element to the sorted segment of the list---as long
    as there aren't any unsorted elements in there yet---but we will
    have to prove that the new element is actually smaller than the
    current lower bound;
  - and finally, we can forgo all sorting, and just add some unsorted
    elements to the front of the list.

<pre class="Agda">
{% raw %}
  <a name="7284" class="Keyword"
      >data</a
      ><a name="7288"
      > </a
      ><a name="7289" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7289" class="Datatype"
      >OVec</a
      ><a name="7293"
      > </a
      ><a name="7294" class="Symbol"
      >:</a
      ><a name="7295"
      > </a
      ><a name="7296" class="Symbol"
      >(</a
      ><a name="7297" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7297" class="Bound"
      >l</a
      ><a name="7298"
      > </a
      ><a name="7299" class="Symbol"
      >:</a
      ><a name="7300"
      > </a
      ><a name="7301" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3563" class="Datatype"
      >A&#770;</a
      ><a name="7303" class="Symbol"
      >)</a
      ><a name="7304"
      > </a
      ><a name="7305" class="Symbol"
      >(</a
      ><a name="7306" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7306" class="Bound"
      >n</a
      ><a name="7307"
      > </a
      ><a name="7308" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7308" class="Bound"
      >k</a
      ><a name="7309"
      > </a
      ><a name="7310" class="Symbol"
      >:</a
      ><a name="7311"
      > </a
      ><a name="7312" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#97" class="Datatype"
      >&#8469;</a
      ><a name="7313" class="Symbol"
      >)</a
      ><a name="7314"
      > </a
      ><a name="7315" class="Symbol"
      >&#8594;</a
      ><a name="7316"
      > </a
      ><a name="7317" class="PrimitiveType"
      >Set</a
      ><a name="7320"
      > </a
      ><a name="7321" class="Symbol"
      >(</a
      ><a name="7322" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3056" class="Bound"
      >c</a
      ><a name="7323"
      > </a
      ><a name="7324" href="Agda.Primitive.html#657" class="Primitive Operator"
      >&#8852;</a
      ><a name="7325"
      > </a
      ><a name="7326" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3061" class="Bound"
      >&#8467;&#8322;</a
      ><a name="7328" class="Symbol"
      >)</a
      ><a name="7329"
      > </a
      ><a name="7330" class="Keyword"
      >where</a
      ><a name="7335"
      >

    </a
      ><a name="7341" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7341" class="InductiveConstructor"
      >[]</a
      ><a name="7343"
      >     </a
      ><a name="7348" class="Symbol"
      >:</a
      ><a name="7349"
      > </a
      ><a name="7350" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7289" class="Datatype"
      >OVec</a
      ><a name="7354"
      > </a
      ><a name="7355" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3584" class="InductiveConstructor"
      >&#8868;</a
      ><a name="7356"
      > </a
      ><a name="7357" class="Number"
      >0</a
      ><a name="7358"
      > </a
      ><a name="7359" class="Number"
      >0</a
      ><a name="7360"
      >

    </a
      ><a name="7366" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7366" class="InductiveConstructor Operator"
      >_&#8759;_by_</a
      ><a name="7372"
      > </a
      ><a name="7373" class="Symbol"
      >:</a
      ><a name="7374"
      > </a
      ><a name="7383" class="Symbol"
      >(</a
      ><a name="7384" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7384" class="Bound"
      >x</a
      ><a name="7385"
      > </a
      ><a name="7386" class="Symbol"
      >:</a
      ><a name="7387"
      > </a
      ><a name="7388" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3196" class="Function"
      >A</a
      ><a name="7389" class="Symbol"
      >)</a
      ><a name="7390"
      > </a
      ><a name="7391" class="Symbol"
      >(</a
      ><a name="7392" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7392" class="Bound"
      >xs</a
      ><a name="7394"
      > </a
      ><a name="7395" class="Symbol"
      >:</a
      ><a name="7396"
      > </a
      ><a name="7397" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7289" class="Datatype"
      >OVec</a
      ><a name="7401"
      > </a
      ><a name="7402" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7378" class="Bound"
      >l</a
      ><a name="7403"
      > </a
      ><a name="7404" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7380" class="Bound"
      >n</a
      ><a name="7405"
      > </a
      ><a name="7406" class="Number"
      >0</a
      ><a name="7407" class="Symbol"
      >)</a
      ><a name="7408"
      >
           </a
      ><a name="7420" class="Symbol"
      >&#8594;</a
      ><a name="7421"
      > </a
      ><a name="7422" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3606" class="InductiveConstructor Operator"
      >&#10214;</a
      ><a name="7423"
      > </a
      ><a name="7424" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7384" class="Bound"
      >x</a
      ><a name="7425"
      > </a
      ><a name="7426" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3606" class="InductiveConstructor Operator"
      >&#10215;</a
      ><a name="7427"
      > </a
      ><a name="7428" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3862" class="Datatype Operator"
      >&#8818;</a
      ><a name="7429"
      > </a
      ><a name="7430" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7378" class="Bound"
      >l</a
      ><a name="7431"
      > </a
      ><a name="7432" class="Symbol"
      >&#8594;</a
      ><a name="7433"
      > </a
      ><a name="7434" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7289" class="Datatype"
      >OVec</a
      ><a name="7438"
      > </a
      ><a name="7439" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3606" class="InductiveConstructor Operator"
      >&#10214;</a
      ><a name="7440"
      > </a
      ><a name="7441" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7384" class="Bound"
      >x</a
      ><a name="7442"
      > </a
      ><a name="7443" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3606" class="InductiveConstructor Operator"
      >&#10215;</a
      ><a name="7444"
      > </a
      ><a name="7445" class="Symbol"
      >(</a
      ><a name="7446" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#128" class="InductiveConstructor"
      >suc</a
      ><a name="7449"
      > </a
      ><a name="7450" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7380" class="Bound"
      >n</a
      ><a name="7451" class="Symbol"
      >)</a
      ><a name="7452"
      > </a
      ><a name="7453" class="Number"
      >0</a
      ><a name="7454"
      >

    </a
      ><a name="7460" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7460" class="InductiveConstructor Operator"
      >_&#8759;_</a
      ><a name="7463"
      >    </a
      ><a name="7467" class="Symbol"
      >:</a
      ><a name="7468"
      > </a
      ><a name="7479" class="Symbol"
      >(</a
      ><a name="7480" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7480" class="Bound"
      >x</a
      ><a name="7481"
      > </a
      ><a name="7482" class="Symbol"
      >:</a
      ><a name="7483"
      > </a
      ><a name="7484" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3196" class="Function"
      >A</a
      ><a name="7485" class="Symbol"
      >)</a
      ><a name="7486"
      > </a
      ><a name="7487" class="Symbol"
      >(</a
      ><a name="7488" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7488" class="Bound"
      >xs</a
      ><a name="7490"
      > </a
      ><a name="7491" class="Symbol"
      >:</a
      ><a name="7492"
      > </a
      ><a name="7493" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7289" class="Datatype"
      >OVec</a
      ><a name="7497"
      > </a
      ><a name="7498" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7472" class="Bound"
      >l</a
      ><a name="7499"
      > </a
      ><a name="7500" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7474" class="Bound"
      >n</a
      ><a name="7501"
      > </a
      ><a name="7502" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7476" class="Bound"
      >k</a
      ><a name="7503" class="Symbol"
      >)</a
      ><a name="7504"
      >
           </a
      ><a name="7516" class="Symbol"
      >&#8594;</a
      ><a name="7517"
      > </a
      ><a name="7518" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7289" class="Datatype"
      >OVec</a
      ><a name="7522"
      > </a
      ><a name="7523" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3595" class="InductiveConstructor"
      >&#8869;</a
      ><a name="7524"
      > </a
      ><a name="7525" class="Symbol"
      >(</a
      ><a name="7526" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#128" class="InductiveConstructor"
      >suc</a
      ><a name="7529"
      > </a
      ><a name="7530" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7474" class="Bound"
      >n</a
      ><a name="7531" class="Symbol"
      >)</a
      ><a name="7532"
      > </a
      ><a name="7533" class="Symbol"
      >(</a
      ><a name="7534" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#128" class="InductiveConstructor"
      >suc</a
      ><a name="7537"
      > </a
      ><a name="7538" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7476" class="Bound"
      >k</a
      ><a name="7539" class="Symbol"
      >)</a
      >
{% endraw %}
</pre>

If we have a regular vector---a list which tracks its length---we can
turn it into a k-ordered vector together with some lower bound. (This
is the reason we're using vectors... if we were using lists, we'd have
another existential with the lists length in it.) Our naive process of
just inserting all elements in the vector as *unsorted* means that the
lower bound will be either ⊤ or ⊥. And we can show that!

<pre class="Agda">
{% raw %}
  <a name="7979" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7979" class="Function"
      >fromVec</a
      ><a name="7986"
      > </a
      ><a name="7987" class="Symbol"
      >:</a
      ><a name="7988"
      > </a
      ><a name="7997" href="https://agda.github.io/agda-stdlib/Data.Vec.html#638" class="Datatype"
      >Vec</a
      ><a name="8000"
      > </a
      ><a name="8001" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3196" class="Function"
      >A</a
      ><a name="8002"
      > </a
      ><a name="8003" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7992" class="Bound"
      >n</a
      ><a name="8004"
      > </a
      ><a name="8005" class="Symbol"
      >&#8594;</a
      ><a name="8006"
      > </a
      ><a name="8007" href="https://agda.github.io/agda-stdlib/Data.Product.html#823" class="Function"
      >&#8707;</a
      ><a name="8008"
      > </a
      ><a name="8009" class="Symbol"
      >(&#955;</a
      ><a name="8011"
      > </a
      ><a name="8012" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8012" class="Bound"
      >l</a
      ><a name="8013"
      > </a
      ><a name="8014" class="Symbol"
      >&#8594;</a
      ><a name="8015"
      > </a
      ><a name="8016" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7289" class="Datatype"
      >OVec</a
      ><a name="8020"
      > </a
      ><a name="8021" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8012" class="Bound"
      >l</a
      ><a name="8022"
      > </a
      ><a name="8023" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7992" class="Bound"
      >n</a
      ><a name="8024"
      > </a
      ><a name="8025" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7992" class="Bound"
      >n</a
      ><a name="8026" class="Symbol"
      >)</a
      ><a name="8027"
      >
  </a
      ><a name="8030" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7979" class="Function"
      >fromVec</a
      ><a name="8037"
      > </a
      ><a name="8038" href="https://agda.github.io/agda-stdlib/Data.Vec.html#678" class="InductiveConstructor"
      >[]</a
      ><a name="8040"
      > </a
      ><a name="8041" class="Symbol"
      >=</a
      ><a name="8042"
      > </a
      ><a name="8043" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3584" class="InductiveConstructor"
      >&#8868;</a
      ><a name="8044"
      > </a
      ><a name="8045" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="8046"
      > </a
      ><a name="8047" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7341" class="InductiveConstructor"
      >[]</a
      ><a name="8049"
      >
  </a
      ><a name="8052" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7979" class="Function"
      >fromVec</a
      ><a name="8059"
      > </a
      ><a name="8060" class="Symbol"
      >(</a
      ><a name="8061" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8061" class="Bound"
      >x</a
      ><a name="8062"
      > </a
      ><a name="8063" href="https://agda.github.io/agda-stdlib/Data.Vec.html#697" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="8064"
      > </a
      ><a name="8065" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8065" class="Bound"
      >xs</a
      ><a name="8067" class="Symbol"
      >)</a
      ><a name="8068"
      > </a
      ><a name="8069" class="Symbol"
      >=</a
      ><a name="8070"
      > </a
      ><a name="8071" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3595" class="InductiveConstructor"
      >&#8869;</a
      ><a name="8072"
      > </a
      ><a name="8073" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="8074"
      > </a
      ><a name="8075" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8061" class="Bound"
      >x</a
      ><a name="8076"
      > </a
      ><a name="8077" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7460" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="8078"
      > </a
      ><a name="8079" href="https://agda.github.io/agda-stdlib/Data.Product.html#539" class="Field"
      >proj&#8322;</a
      ><a name="8084"
      > </a
      ><a name="8085" class="Symbol"
      >(</a
      ><a name="8086" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7979" class="Function"
      >fromVec</a
      ><a name="8093"
      > </a
      ><a name="8094" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8065" class="Bound"
      >xs</a
      ><a name="8096" class="Symbol"
      >)</a
      ><a name="8097"
      >

  </a
      ><a name="8101" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8101" class="Function"
      >fromVec-&#8868;or&#8869;</a
      ><a name="8113"
      > </a
      ><a name="8114" class="Symbol"
      >:</a
      ><a name="8115"
      > </a
      ><a name="8143" class="Keyword"
      >let</a
      ><a name="8146"
      > </a
      ><a name="8147" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8147" class="Bound"
      >l</a
      ><a name="8148"
      > </a
      ><a name="8149" class="Symbol"
      >=</a
      ><a name="8150"
      > </a
      ><a name="8151" href="https://agda.github.io/agda-stdlib/Data.Product.html#525" class="Field"
      >proj&#8321;</a
      ><a name="8156"
      > </a
      ><a name="8157" class="Symbol"
      >(</a
      ><a name="8158" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7979" class="Function"
      >fromVec</a
      ><a name="8165"
      > </a
      ><a name="8166" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8123" class="Bound"
      >xs</a
      ><a name="8168" class="Symbol"
      >)</a
      ><a name="8169"
      > </a
      ><a name="8170" class="Keyword"
      >in</a
      ><a name="8172"
      > </a
      ><a name="8173" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8147" class="Bound"
      >l</a
      ><a name="8174"
      > </a
      ><a name="8175" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Equality.html#83" class="Datatype Operator"
      >&#8801;</a
      ><a name="8176"
      > </a
      ><a name="8177" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3584" class="InductiveConstructor"
      >&#8868;</a
      ><a name="8178"
      > </a
      ><a name="8179" href="https://agda.github.io/agda-stdlib/Data.Sum.html#433" class="Datatype Operator"
      >&#8846;</a
      ><a name="8180"
      > </a
      ><a name="8181" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8147" class="Bound"
      >l</a
      ><a name="8182"
      > </a
      ><a name="8183" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Equality.html#83" class="Datatype Operator"
      >&#8801;</a
      ><a name="8184"
      > </a
      ><a name="8185" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3595" class="InductiveConstructor"
      >&#8869;</a
      ><a name="8186"
      >
  </a
      ><a name="8189" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8101" class="Function"
      >fromVec-&#8868;or&#8869;</a
      ><a name="8201"
      > </a
      ><a name="8222" class="Symbol"
      >=</a
      ><a name="8223"
      > </a
      ><a name="8224" href="https://agda.github.io/agda-stdlib/Data.Sum.html#489" class="InductiveConstructor"
      >inj&#8321;</a
      ><a name="8228"
      > </a
      ><a name="8229" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Equality.html#140" class="InductiveConstructor"
      >refl</a
      ><a name="8233"
      >
  </a
      ><a name="8236" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8101" class="Function"
      >fromVec-&#8868;or&#8869;</a
      ><a name="8248"
      > </a
      ><a name="8269" class="Symbol"
      >=</a
      ><a name="8270"
      > </a
      ><a name="8271" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="8275"
      > </a
      ><a name="8276" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Equality.html#140" class="InductiveConstructor"
      >refl</a
      >
{% endraw %}
</pre>

And obviously, we can also turn any k-ordered vector into a regular
vector simply by forgetting about all the order evidence:

<pre class="Agda">
{% raw %}
  <a name="8435" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8435" class="Function"
      >toVec</a
      ><a name="8440"
      > </a
      ><a name="8441" class="Symbol"
      >:</a
      ><a name="8442"
      > </a
      ><a name="8455" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7289" class="Datatype"
      >OVec</a
      ><a name="8459"
      > </a
      ><a name="8460" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8446" class="Bound"
      >l</a
      ><a name="8461"
      > </a
      ><a name="8462" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8448" class="Bound"
      >n</a
      ><a name="8463"
      > </a
      ><a name="8464" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8450" class="Bound"
      >k</a
      ><a name="8465"
      > </a
      ><a name="8466" class="Symbol"
      >&#8594;</a
      ><a name="8467"
      > </a
      ><a name="8468" href="https://agda.github.io/agda-stdlib/Data.Vec.html#638" class="Datatype"
      >Vec</a
      ><a name="8471"
      > </a
      ><a name="8472" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3196" class="Function"
      >A</a
      ><a name="8473"
      > </a
      ><a name="8474" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8448" class="Bound"
      >n</a
      ><a name="8475"
      >
  </a
      ><a name="8478" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8435" class="Function"
      >toVec</a
      ><a name="8483"
      > </a
      ><a name="8484" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7341" class="InductiveConstructor"
      >[]</a
      ><a name="8486"
      > </a
      ><a name="8487" class="Symbol"
      >=</a
      ><a name="8488"
      > </a
      ><a name="8489" href="https://agda.github.io/agda-stdlib/Data.Vec.html#678" class="InductiveConstructor"
      >[]</a
      ><a name="8491"
      >
  </a
      ><a name="8494" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8435" class="Function"
      >toVec</a
      ><a name="8499"
      > </a
      ><a name="8500" class="Symbol"
      >(</a
      ><a name="8501" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8501" class="Bound"
      >x</a
      ><a name="8502"
      > </a
      ><a name="8503" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7460" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="8504"
      > </a
      ><a name="8505" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8505" class="Bound"
      >xs</a
      ><a name="8507" class="Symbol"
      >)</a
      ><a name="8508"
      > </a
      ><a name="8509" class="Symbol"
      >=</a
      ><a name="8510"
      > </a
      ><a name="8511" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8501" class="Bound"
      >x</a
      ><a name="8512"
      > </a
      ><a name="8513" href="https://agda.github.io/agda-stdlib/Data.Vec.html#697" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="8514"
      > </a
      ><a name="8515" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8435" class="Function"
      >toVec</a
      ><a name="8520"
      > </a
      ><a name="8521" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8505" class="Bound"
      >xs</a
      ><a name="8523"
      >
  </a
      ><a name="8526" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8435" class="Function"
      >toVec</a
      ><a name="8531"
      > </a
      ><a name="8532" class="Symbol"
      >(</a
      ><a name="8533" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8533" class="Bound"
      >x</a
      ><a name="8534"
      > </a
      ><a name="8535" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7366" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="8536"
      > </a
      ><a name="8537" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8537" class="Bound"
      >xs</a
      ><a name="8539"
      > </a
      ><a name="8540" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7366" class="InductiveConstructor Operator"
      >by</a
      ><a name="8542"
      > </a
      ><a name="8543" class="Symbol"
      >_)</a
      ><a name="8545"
      > </a
      ><a name="8546" class="Symbol"
      >=</a
      ><a name="8547"
      > </a
      ><a name="8548" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8533" class="Bound"
      >x</a
      ><a name="8549"
      > </a
      ><a name="8550" href="https://agda.github.io/agda-stdlib/Data.Vec.html#697" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="8551"
      > </a
      ><a name="8552" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8435" class="Function"
      >toVec</a
      ><a name="8557"
      > </a
      ><a name="8558" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8537" class="Bound"
      >xs</a
      >
{% endraw %}
</pre>

Finally! We've developed enough vocabulary to write down what it
really means to perform an insertion:

<pre class="Agda">
{% raw %}
  <a name="8692" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8692" class="Function"
      >insert</a
      ><a name="8698"
      > </a
      ><a name="8699" class="Symbol"
      >:</a
      ><a name="8700"
      > </a
      ><a name="8711" class="Symbol"
      >(</a
      ><a name="8712" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8712" class="Bound"
      >x</a
      ><a name="8713"
      > </a
      ><a name="8714" class="Symbol"
      >:</a
      ><a name="8715"
      > </a
      ><a name="8716" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3196" class="Function"
      >A</a
      ><a name="8717" class="Symbol"
      >)</a
      ><a name="8718"
      > </a
      ><a name="8719" class="Symbol"
      >&#8594;</a
      ><a name="8720"
      > </a
      ><a name="8721" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7289" class="Datatype"
      >OVec</a
      ><a name="8725"
      > </a
      ><a name="8726" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8704" class="Bound"
      >l</a
      ><a name="8727"
      > </a
      ><a name="8728" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8706" class="Bound"
      >n</a
      ><a name="8729"
      > </a
      ><a name="8730" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8708" class="Bound"
      >k</a
      ><a name="8731"
      > </a
      ><a name="8732" class="Symbol"
      >&#8594;</a
      ><a name="8733"
      > </a
      ><a name="8734" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7289" class="Datatype"
      >OVec</a
      ><a name="8738"
      > </a
      ><a name="8739" class="Symbol"
      >(</a
      ><a name="8740" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3606" class="InductiveConstructor Operator"
      >&#10214;</a
      ><a name="8741"
      > </a
      ><a name="8742" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8712" class="Bound"
      >x</a
      ><a name="8743"
      > </a
      ><a name="8744" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3606" class="InductiveConstructor Operator"
      >&#10215;</a
      ><a name="8745"
      > </a
      ><a name="8746" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4661" class="Function Operator"
      >&#8851;</a
      ><a name="8747"
      > </a
      ><a name="8748" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8704" class="Bound"
      >l</a
      ><a name="8749" class="Symbol"
      >)</a
      ><a name="8750"
      > </a
      ><a name="8751" class="Symbol"
      >(</a
      ><a name="8752" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#128" class="InductiveConstructor"
      >suc</a
      ><a name="8755"
      > </a
      ><a name="8756" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8706" class="Bound"
      >n</a
      ><a name="8757" class="Symbol"
      >)</a
      ><a name="8758"
      > </a
      ><a name="8759" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8708" class="Bound"
      >k</a
      ><a name="8760"
      >
  </a
      ><a name="8763" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8692" class="Function"
      >insert</a
      ><a name="8769"
      > </a
      ><a name="8770" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8770" class="Bound"
      >x</a
      ><a name="8771"
      > </a
      ><a name="8772" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7341" class="InductiveConstructor"
      >[]</a
      ><a name="8774"
      >       </a
      ><a name="8781" class="Symbol"
      >=</a
      ><a name="8782"
      > </a
      ><a name="8783" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8770" class="Bound"
      >x</a
      ><a name="8784"
      > </a
      ><a name="8785" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7366" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="8786"
      > </a
      ><a name="8787" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7341" class="InductiveConstructor"
      >[]</a
      ><a name="8789"
      > </a
      ><a name="8790" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7366" class="InductiveConstructor Operator"
      >by</a
      ><a name="8792"
      > </a
      ><a name="8793" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3917" class="InductiveConstructor"
      >&#8818;&#8868;</a
      ><a name="8795"
      >
  </a
      ><a name="8798" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8692" class="Function"
      >insert</a
      ><a name="8804"
      > </a
      ><a name="8805" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8805" class="Bound"
      >x</a
      ><a name="8806"
      > </a
      ><a name="8807" class="Symbol"
      >(</a
      ><a name="8808" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8808" class="Bound"
      >y</a
      ><a name="8809"
      > </a
      ><a name="8810" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7460" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="8811"
      > </a
      ><a name="8812" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8812" class="Bound"
      >xs</a
      ><a name="8814" class="Symbol"
      >)</a
      ><a name="8815"
      > </a
      ><a name="8816" class="Symbol"
      >=</a
      ><a name="8817"
      > </a
      ><a name="8818" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8808" class="Bound"
      >y</a
      ><a name="8819"
      > </a
      ><a name="8820" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7460" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="8821"
      > </a
      ><a name="8822" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8692" class="Function"
      >insert</a
      ><a name="8828"
      > </a
      ><a name="8829" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8805" class="Bound"
      >x</a
      ><a name="8830"
      > </a
      ><a name="8831" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8812" class="Bound"
      >xs</a
      ><a name="8833"
      >
  </a
      ><a name="8836" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8692" class="Function"
      >insert</a
      ><a name="8842"
      > </a
      ><a name="8843" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8843" class="Bound"
      >x</a
      ><a name="8844"
      > </a
      ><a name="8845" class="Symbol"
      >(</a
      ><a name="8846" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8846" class="Bound"
      >y</a
      ><a name="8847"
      > </a
      ><a name="8848" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7366" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="8849"
      > </a
      ><a name="8850" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8850" class="Bound"
      >xs</a
      ><a name="8852"
      > </a
      ><a name="8853" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7366" class="InductiveConstructor Operator"
      >by</a
      ><a name="8855"
      > </a
      ><a name="8856" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8856" class="Bound"
      >p</a
      ><a name="8857" class="Symbol"
      >)</a
      ><a name="8858"
      > </a
      ><a name="8859" class="Keyword"
      >with</a
      ><a name="8863"
      > </a
      ><a name="8864" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8843" class="Bound"
      >x</a
      ><a name="8865"
      > </a
      ><a name="8866" href="https://agda.github.io/agda-stdlib/Relation.Binary.html#8876" class="Function Operator"
      >&#8804;?</a
      ><a name="8868"
      > </a
      ><a name="8869" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8846" class="Bound"
      >y</a
      ><a name="8870"
      >
  </a
      ><a name="8873" class="Symbol"
      >...</a
      ><a name="8876"
      > </a
      ><a name="8877" class="Symbol"
      >|</a
      ><a name="8878"
      > </a
      ><a name="8879" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="8882"
      > </a
      ><a name="8883" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8883" class="Bound"
      >x&#8804;y</a
      ><a name="8886"
      > </a
      ><a name="8887" class="Symbol"
      >=</a
      ><a name="8888"
      > </a
      ><a name="8889" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8843" class="Bound"
      >x</a
      ><a name="8890"
      > </a
      ><a name="8891" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7366" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="8892"
      > </a
      ><a name="8893" class="Symbol"
      >(</a
      ><a name="8894" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8846" class="Bound"
      >y</a
      ><a name="8895"
      > </a
      ><a name="8896" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7366" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="8897"
      > </a
      ><a name="8898" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8850" class="Bound"
      >xs</a
      ><a name="8900"
      > </a
      ><a name="8901" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7366" class="InductiveConstructor Operator"
      >by</a
      ><a name="8903"
      > </a
      ><a name="8904" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8856" class="Bound"
      >p</a
      ><a name="8905" class="Symbol"
      >)</a
      ><a name="8906"
      >
                  </a
      ><a name="8925" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7366" class="InductiveConstructor Operator"
      >by</a
      ><a name="8927"
      > </a
      ><a name="8928" class="Symbol"
      >(</a
      ><a name="8929" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3940" class="InductiveConstructor"
      >&#8804;-lift</a
      ><a name="8935"
      > </a
      ><a name="8936" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8883" class="Bound"
      >x&#8804;y</a
      ><a name="8939" class="Symbol"
      >)</a
      ><a name="8940"
      >
  </a
      ><a name="8943" class="Symbol"
      >...</a
      ><a name="8946"
      > </a
      ><a name="8947" class="Symbol"
      >|</a
      ><a name="8948"
      > </a
      ><a name="8949" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="8951"
      >  </a
      ><a name="8953" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8953" class="Bound"
      >x&#8816;y</a
      ><a name="8956"
      > </a
      ><a name="8957" class="Symbol"
      >=</a
      ><a name="8958"
      > </a
      ><a name="8959" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8846" class="Bound"
      >y</a
      ><a name="8960"
      > </a
      ><a name="8961" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7366" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="8962"
      > </a
      ><a name="8963" class="Symbol"
      >(</a
      ><a name="8964" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8692" class="Function"
      >insert</a
      ><a name="8970"
      > </a
      ><a name="8971" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8843" class="Bound"
      >x</a
      ><a name="8972"
      > </a
      ><a name="8973" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8850" class="Bound"
      >xs</a
      ><a name="8975" class="Symbol"
      >)</a
      ><a name="8976"
      >
                  </a
      ><a name="8995" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7366" class="InductiveConstructor Operator"
      >by</a
      ><a name="8997"
      > </a
      ><a name="8998" class="Symbol"
      >(</a
      ><a name="8999" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4827" class="Function"
      >&#8851;-conserves-&#8818;</a
      ><a name="9012"
      > </a
      ><a name="9013" class="Symbol"
      >(</a
      ><a name="9014" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4238" class="Function"
      >&#8816;-lift</a
      ><a name="9020"
      > </a
      ><a name="9021" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8953" class="Bound"
      >x&#8816;y</a
      ><a name="9024" class="Symbol"
      >)</a
      ><a name="9025"
      > </a
      ><a name="9026" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8856" class="Bound"
      >p</a
      ><a name="9027" class="Symbol"
      >)</a
      >
{% endraw %}
</pre>

Note that insert takes a vector with *k* unsorted elements, and
returns a vector which has one more element, but still only *k*
unsorted elements! It does this (obviously) by inserting the element
at the right position within the sorted portion of the vector.

It follows fairly easily from the fact that 'insert' inserts an
element in the sorted portion of the vector, that if we take elements
from the unsorted portion, insert it, and repeat this *k* times, we'll
have sorted *k* elements... and therefore the list.

<pre class="Agda">
{% raw %}
  <a name="9575" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#9575" class="Function"
      >insertsort</a
      ><a name="9585"
      > </a
      ><a name="9586" class="Symbol"
      >:</a
      ><a name="9587"
      > </a
      ><a name="9600" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7289" class="Datatype"
      >OVec</a
      ><a name="9604"
      > </a
      ><a name="9605" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#9591" class="Bound"
      >l</a
      ><a name="9606"
      > </a
      ><a name="9607" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#9593" class="Bound"
      >n</a
      ><a name="9608"
      > </a
      ><a name="9609" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#9595" class="Bound"
      >k</a
      ><a name="9610"
      > </a
      ><a name="9611" class="Symbol"
      >&#8594;</a
      ><a name="9612"
      > </a
      ><a name="9613" href="https://agda.github.io/agda-stdlib/Data.Product.html#823" class="Function"
      >&#8707;</a
      ><a name="9614"
      > </a
      ><a name="9615" class="Symbol"
      >(&#955;</a
      ><a name="9617"
      > </a
      ><a name="9618" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#9618" class="Bound"
      >l</a
      ><a name="9619"
      > </a
      ><a name="9620" class="Symbol"
      >&#8594;</a
      ><a name="9621"
      > </a
      ><a name="9622" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7289" class="Datatype"
      >OVec</a
      ><a name="9626"
      > </a
      ><a name="9627" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#9618" class="Bound"
      >l</a
      ><a name="9628"
      > </a
      ><a name="9629" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#9593" class="Bound"
      >n</a
      ><a name="9630"
      > </a
      ><a name="9631" class="Number"
      >0</a
      ><a name="9632" class="Symbol"
      >)</a
      ><a name="9633"
      >
  </a
      ><a name="9636" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#9575" class="Function"
      >insertsort</a
      ><a name="9646"
      > </a
      ><a name="9647" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7341" class="InductiveConstructor"
      >[]</a
      ><a name="9649"
      >            </a
      ><a name="9661" class="Symbol"
      >=</a
      ><a name="9662"
      > </a
      ><a name="9663" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3584" class="InductiveConstructor"
      >&#8868;</a
      ><a name="9664"
      > </a
      ><a name="9665" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="9666"
      > </a
      ><a name="9667" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7341" class="InductiveConstructor"
      >[]</a
      ><a name="9669"
      >
  </a
      ><a name="9672" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#9575" class="Function"
      >insertsort</a
      ><a name="9682"
      > </a
      ><a name="9683" class="Symbol"
      >(</a
      ><a name="9684" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#9684" class="Bound"
      >x</a
      ><a name="9685"
      > </a
      ><a name="9686" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7460" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="9687"
      > </a
      ><a name="9688" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#9688" class="Bound"
      >xs</a
      ><a name="9690" class="Symbol"
      >)</a
      ><a name="9691"
      >      </a
      ><a name="9697" class="Symbol"
      >=</a
      ><a name="9698"
      > </a
      ><a name="9699" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#9575" class="Function"
      >insertsort</a
      ><a name="9709"
      > </a
      ><a name="9710" class="Symbol"
      >(</a
      ><a name="9711" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8692" class="Function"
      >insert</a
      ><a name="9717"
      > </a
      ><a name="9718" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#9684" class="Bound"
      >x</a
      ><a name="9719"
      > </a
      ><a name="9720" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#9688" class="Bound"
      >xs</a
      ><a name="9722" class="Symbol"
      >)</a
      ><a name="9723"
      >
  </a
      ><a name="9726" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#9575" class="Function"
      >insertsort</a
      ><a name="9736"
      > </a
      ><a name="9737" class="Symbol"
      >(</a
      ><a name="9738" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#9738" class="Bound"
      >x</a
      ><a name="9739"
      > </a
      ><a name="9740" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7366" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="9741"
      > </a
      ><a name="9742" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#9742" class="Bound"
      >xs</a
      ><a name="9744"
      > </a
      ><a name="9745" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7366" class="InductiveConstructor Operator"
      >by</a
      ><a name="9747"
      > </a
      ><a name="9748" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#9748" class="Bound"
      >p</a
      ><a name="9749" class="Symbol"
      >)</a
      ><a name="9750"
      > </a
      ><a name="9751" class="Symbol"
      >=</a
      ><a name="9752"
      > </a
      ><a name="9753" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3606" class="InductiveConstructor Operator"
      >&#10214;</a
      ><a name="9754"
      > </a
      ><a name="9755" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#9738" class="Bound"
      >x</a
      ><a name="9756"
      > </a
      ><a name="9757" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3606" class="InductiveConstructor Operator"
      >&#10215;</a
      ><a name="9758"
      > </a
      ><a name="9759" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="9760"
      > </a
      ><a name="9761" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#9738" class="Bound"
      >x</a
      ><a name="9762"
      > </a
      ><a name="9763" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7366" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="9764"
      > </a
      ><a name="9765" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#9742" class="Bound"
      >xs</a
      ><a name="9767"
      > </a
      ><a name="9768" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7366" class="InductiveConstructor Operator"
      >by</a
      ><a name="9770"
      > </a
      ><a name="9771" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#9748" class="Bound"
      >p</a
      >
{% endraw %}
</pre>

There is one thing we haven't verified so far---and I've hinted at this
possibility above. It is fairly simple to implement an insertion sort
algorithm with the *same* type which simply takes the first element
and repeats it *n* times.
So our types aren't perfect. However, such constraints are a little
harder to encode in data types. One approach would be to construct a
sorting permutation instead of working with an input and output list.
What we could do to make this code work is to give a separate
proof---though this would go against my correctness by construction
sensibilities---stating that if an element is in the input list it is
in the output list. However, as I mostly wrote this blog post as a
test case for my Jekyll/Agda integration... I'm not going to put in
the effort to do either.

One amusing anecdote about this code is that while I was writing it, I
thought I was implementing bubble sort---so much for safety. However,
if you have a look at the invariants that both algorithms maintain,
they are really quite similar. In fact, we can easily implement bubble
sort using our `OVec` data type. The underlying algorithm is
incredibly similar to insert. However, as opposed to inserting the
first element in the correct position, "bubble" has trouble making up
its mind and drops whatever it's holding when it sees a bigger element!

<pre class="Agda">
{% raw %}
  <a name="11155" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11155" class="Function"
      >bubble</a
      ><a name="11161"
      > </a
      ><a name="11162" class="Symbol"
      >:</a
      ><a name="11163"
      > </a
      ><a name="11174" class="Symbol"
      >(</a
      ><a name="11175" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11175" class="Bound"
      >x</a
      ><a name="11176"
      > </a
      ><a name="11177" class="Symbol"
      >:</a
      ><a name="11178"
      > </a
      ><a name="11179" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3196" class="Function"
      >A</a
      ><a name="11180" class="Symbol"
      >)</a
      ><a name="11181"
      > </a
      ><a name="11182" class="Symbol"
      >&#8594;</a
      ><a name="11183"
      > </a
      ><a name="11184" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7289" class="Datatype"
      >OVec</a
      ><a name="11188"
      > </a
      ><a name="11189" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11167" class="Bound"
      >l</a
      ><a name="11190"
      > </a
      ><a name="11191" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11169" class="Bound"
      >n</a
      ><a name="11192"
      > </a
      ><a name="11193" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11171" class="Bound"
      >k</a
      ><a name="11194"
      > </a
      ><a name="11195" class="Symbol"
      >&#8594;</a
      ><a name="11196"
      > </a
      ><a name="11197" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7289" class="Datatype"
      >OVec</a
      ><a name="11201"
      > </a
      ><a name="11202" class="Symbol"
      >(</a
      ><a name="11203" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3606" class="InductiveConstructor Operator"
      >&#10214;</a
      ><a name="11204"
      > </a
      ><a name="11205" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11175" class="Bound"
      >x</a
      ><a name="11206"
      > </a
      ><a name="11207" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3606" class="InductiveConstructor Operator"
      >&#10215;</a
      ><a name="11208"
      > </a
      ><a name="11209" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4661" class="Function Operator"
      >&#8851;</a
      ><a name="11210"
      > </a
      ><a name="11211" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11167" class="Bound"
      >l</a
      ><a name="11212" class="Symbol"
      >)</a
      ><a name="11213"
      > </a
      ><a name="11214" class="Symbol"
      >(</a
      ><a name="11215" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#128" class="InductiveConstructor"
      >suc</a
      ><a name="11218"
      > </a
      ><a name="11219" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11169" class="Bound"
      >n</a
      ><a name="11220" class="Symbol"
      >)</a
      ><a name="11221"
      > </a
      ><a name="11222" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11171" class="Bound"
      >k</a
      ><a name="11223"
      >
  </a
      ><a name="11226" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11155" class="Function"
      >bubble</a
      ><a name="11232"
      > </a
      ><a name="11233" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11233" class="Bound"
      >x</a
      ><a name="11234"
      > </a
      ><a name="11235" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7341" class="InductiveConstructor"
      >[]</a
      ><a name="11237"
      >            </a
      ><a name="11249" class="Symbol"
      >=</a
      ><a name="11250"
      > </a
      ><a name="11251" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11233" class="Bound"
      >x</a
      ><a name="11252"
      > </a
      ><a name="11253" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7366" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="11254"
      > </a
      ><a name="11255" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7341" class="InductiveConstructor"
      >[]</a
      ><a name="11257"
      > </a
      ><a name="11258" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7366" class="InductiveConstructor Operator"
      >by</a
      ><a name="11260"
      > </a
      ><a name="11261" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3917" class="InductiveConstructor"
      >&#8818;&#8868;</a
      ><a name="11263"
      >
  </a
      ><a name="11266" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11155" class="Function"
      >bubble</a
      ><a name="11272"
      > </a
      ><a name="11273" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11273" class="Bound"
      >x</a
      ><a name="11274"
      > </a
      ><a name="11275" class="Symbol"
      >(</a
      ><a name="11276" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11276" class="Bound"
      >y</a
      ><a name="11277"
      > </a
      ><a name="11278" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7460" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="11279"
      > </a
      ><a name="11280" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11280" class="Bound"
      >xs</a
      ><a name="11282" class="Symbol"
      >)</a
      ><a name="11283"
      >      </a
      ><a name="11289" class="Keyword"
      >with</a
      ><a name="11293"
      > </a
      ><a name="11294" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11273" class="Bound"
      >x</a
      ><a name="11295"
      > </a
      ><a name="11296" href="https://agda.github.io/agda-stdlib/Relation.Binary.html#8876" class="Function Operator"
      >&#8804;?</a
      ><a name="11298"
      > </a
      ><a name="11299" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11276" class="Bound"
      >y</a
      ><a name="11300"
      >
  </a
      ><a name="11303" class="Symbol"
      >...</a
      ><a name="11306"
      > </a
      ><a name="11307" class="Symbol"
      >|</a
      ><a name="11308"
      > </a
      ><a name="11309" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="11311"
      >  </a
      ><a name="11313" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11313" class="Bound"
      >x&#8816;y</a
      ><a name="11316"
      > </a
      ><a name="11317" class="Symbol"
      >=</a
      ><a name="11318"
      > </a
      ><a name="11319" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11276" class="Bound"
      >y</a
      ><a name="11320"
      > </a
      ><a name="11321" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7460" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="11322"
      > </a
      ><a name="11323" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11155" class="Function"
      >bubble</a
      ><a name="11329"
      > </a
      ><a name="11330" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11273" class="Bound"
      >x</a
      ><a name="11331"
      > </a
      ><a name="11332" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11280" class="Bound"
      >xs</a
      ><a name="11334"
      >
  </a
      ><a name="11337" class="Symbol"
      >...</a
      ><a name="11340"
      > </a
      ><a name="11341" class="Symbol"
      >|</a
      ><a name="11342"
      > </a
      ><a name="11343" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="11346"
      > </a
      ><a name="11347" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11347" class="Bound"
      >x&#8804;y</a
      ><a name="11350"
      > </a
      ><a name="11351" class="Symbol"
      >=</a
      ><a name="11352"
      > </a
      ><a name="11353" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11273" class="Bound"
      >x</a
      ><a name="11354"
      > </a
      ><a name="11355" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7460" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="11356"
      > </a
      ><a name="11357" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11155" class="Function"
      >bubble</a
      ><a name="11363"
      > </a
      ><a name="11364" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11276" class="Bound"
      >y</a
      ><a name="11365"
      > </a
      ><a name="11366" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11280" class="Bound"
      >xs</a
      ><a name="11368"
      >
  </a
      ><a name="11371" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11155" class="Function"
      >bubble</a
      ><a name="11377"
      > </a
      ><a name="11378" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11378" class="Bound"
      >x</a
      ><a name="11379"
      > </a
      ><a name="11380" class="Symbol"
      >(</a
      ><a name="11381" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11381" class="Bound"
      >y</a
      ><a name="11382"
      > </a
      ><a name="11383" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7366" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="11384"
      > </a
      ><a name="11385" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11385" class="Bound"
      >xs</a
      ><a name="11387"
      > </a
      ><a name="11388" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7366" class="InductiveConstructor Operator"
      >by</a
      ><a name="11390"
      > </a
      ><a name="11391" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11391" class="Bound"
      >p</a
      ><a name="11392" class="Symbol"
      >)</a
      ><a name="11393"
      > </a
      ><a name="11394" class="Keyword"
      >with</a
      ><a name="11398"
      > </a
      ><a name="11399" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11378" class="Bound"
      >x</a
      ><a name="11400"
      > </a
      ><a name="11401" href="https://agda.github.io/agda-stdlib/Relation.Binary.html#8876" class="Function Operator"
      >&#8804;?</a
      ><a name="11403"
      > </a
      ><a name="11404" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11381" class="Bound"
      >y</a
      ><a name="11405"
      >
  </a
      ><a name="11408" class="Symbol"
      >...</a
      ><a name="11411"
      > </a
      ><a name="11412" class="Symbol"
      >|</a
      ><a name="11413"
      > </a
      ><a name="11414" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="11416"
      >  </a
      ><a name="11418" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11418" class="Bound"
      >x&#8816;y</a
      ><a name="11421"
      > </a
      ><a name="11422" class="Symbol"
      >=</a
      ><a name="11423"
      > </a
      ><a name="11424" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11381" class="Bound"
      >y</a
      ><a name="11425"
      > </a
      ><a name="11426" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7366" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="11427"
      > </a
      ><a name="11428" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11155" class="Function"
      >bubble</a
      ><a name="11434"
      > </a
      ><a name="11435" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11378" class="Bound"
      >x</a
      ><a name="11436"
      > </a
      ><a name="11437" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11385" class="Bound"
      >xs</a
      ><a name="11439"
      >
                  </a
      ><a name="11458" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7366" class="InductiveConstructor Operator"
      >by</a
      ><a name="11460"
      > </a
      ><a name="11461" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4827" class="Function"
      >&#8851;-conserves-&#8818;</a
      ><a name="11474"
      > </a
      ><a name="11475" class="Symbol"
      >(</a
      ><a name="11476" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4238" class="Function"
      >&#8816;-lift</a
      ><a name="11482"
      > </a
      ><a name="11483" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11418" class="Bound"
      >x&#8816;y</a
      ><a name="11486" class="Symbol"
      >)</a
      ><a name="11487"
      > </a
      ><a name="11488" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11391" class="Bound"
      >p</a
      ><a name="11489"
      >
  </a
      ><a name="11492" class="Symbol"
      >...</a
      ><a name="11495"
      > </a
      ><a name="11496" class="Symbol"
      >|</a
      ><a name="11497"
      > </a
      ><a name="11498" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="11501"
      > </a
      ><a name="11502" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11502" class="Bound"
      >x&#8804;y</a
      ><a name="11505"
      > </a
      ><a name="11506" class="Symbol"
      >=</a
      ><a name="11507"
      > </a
      ><a name="11508" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11378" class="Bound"
      >x</a
      ><a name="11509"
      > </a
      ><a name="11510" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7366" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="11511"
      > </a
      ><a name="11512" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11155" class="Function"
      >bubble</a
      ><a name="11518"
      > </a
      ><a name="11519" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11381" class="Bound"
      >y</a
      ><a name="11520"
      > </a
      ><a name="11521" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11385" class="Bound"
      >xs</a
      ><a name="11523"
      >
                  </a
      ><a name="11542" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7366" class="InductiveConstructor Operator"
      >by</a
      ><a name="11544"
      > </a
      ><a name="11545" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4827" class="Function"
      >&#8851;-conserves-&#8818;</a
      ><a name="11558"
      > </a
      ><a name="11559" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11595" class="Function"
      >x&#8818;y</a
      ><a name="11562"
      > </a
      ><a name="11563" class="Symbol"
      >(</a
      ><a name="11564" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11937" class="Function"
      >&#8818;-trans</a
      ><a name="11571"
      > </a
      ><a name="11572" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11595" class="Function"
      >x&#8818;y</a
      ><a name="11575"
      > </a
      ><a name="11576" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11391" class="Bound"
      >p</a
      ><a name="11577" class="Symbol"
      >)</a
      ><a name="11578"
      >
    </a
      ><a name="11583" class="Keyword"
      >where</a
      ><a name="11588"
      >
      </a
      ><a name="11595" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11595" class="Function"
      >x&#8818;y</a
      ><a name="11598"
      > </a
      ><a name="11599" class="Symbol"
      >=</a
      ><a name="11600"
      > </a
      ><a name="11601" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3940" class="InductiveConstructor"
      >&#8804;-lift</a
      ><a name="11607"
      > </a
      ><a name="11608" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11502" class="Bound"
      >x&#8804;y</a
      >
{% endraw %}
</pre>

All that we need is to show that our home-brewed ≲-relation is
transitive. This follows immediately from the underlying
order. This kind of stuff---the adding of bounds to total
order---should really be provided by the standard library. And perhaps
it is, and I've simply failed to find it...

<pre class="Agda">
{% raw %}
      <a name="11937" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11937" class="Function"
      >&#8818;-trans</a
      ><a name="11944"
      > </a
      ><a name="11945" class="Symbol"
      >:</a
      ><a name="11946"
      > </a
      ><a name="11959" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11950" class="Bound"
      >x</a
      ><a name="11960"
      > </a
      ><a name="11961" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3862" class="Datatype Operator"
      >&#8818;</a
      ><a name="11962"
      > </a
      ><a name="11963" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11952" class="Bound"
      >y</a
      ><a name="11964"
      > </a
      ><a name="11965" class="Symbol"
      >&#8594;</a
      ><a name="11966"
      > </a
      ><a name="11967" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11952" class="Bound"
      >y</a
      ><a name="11968"
      > </a
      ><a name="11969" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3862" class="Datatype Operator"
      >&#8818;</a
      ><a name="11970"
      > </a
      ><a name="11971" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11954" class="Bound"
      >z</a
      ><a name="11972"
      > </a
      ><a name="11973" class="Symbol"
      >&#8594;</a
      ><a name="11974"
      > </a
      ><a name="11975" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11950" class="Bound"
      >x</a
      ><a name="11976"
      > </a
      ><a name="11977" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3862" class="Datatype Operator"
      >&#8818;</a
      ><a name="11978"
      > </a
      ><a name="11979" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11954" class="Bound"
      >z</a
      ><a name="11980"
      >
      </a
      ><a name="11987" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11937" class="Function"
      >&#8818;-trans</a
      ><a name="11994"
      >  </a
      ><a name="11996" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3894" class="InductiveConstructor"
      >&#8869;&#8818;</a
      ><a name="11998"
      >         </a
      ><a name="12007" class="Symbol"
      >_</a
      ><a name="12008"
      >         </a
      ><a name="12017" class="Symbol"
      >=</a
      ><a name="12018"
      > </a
      ><a name="12019" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3894" class="InductiveConstructor"
      >&#8869;&#8818;</a
      ><a name="12021"
      >
      </a
      ><a name="12028" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11937" class="Function"
      >&#8818;-trans</a
      ><a name="12035"
      >  </a
      ><a name="12037" class="Symbol"
      >_</a
      ><a name="12038"
      >          </a
      ><a name="12048" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3917" class="InductiveConstructor"
      >&#8818;&#8868;</a
      ><a name="12050"
      >        </a
      ><a name="12058" class="Symbol"
      >=</a
      ><a name="12059"
      > </a
      ><a name="12060" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3917" class="InductiveConstructor"
      >&#8818;&#8868;</a
      ><a name="12062"
      >
      </a
      ><a name="12069" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11937" class="Function"
      >&#8818;-trans</a
      ><a name="12076"
      > </a
      ><a name="12077" class="Symbol"
      >(</a
      ><a name="12078" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3940" class="InductiveConstructor"
      >&#8804;-lift</a
      ><a name="12084"
      > </a
      ><a name="12085" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12085" class="Bound"
      >p</a
      ><a name="12086" class="Symbol"
      >)</a
      ><a name="12087"
      > </a
      ><a name="12088" class="Symbol"
      >(</a
      ><a name="12089" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3940" class="InductiveConstructor"
      >&#8804;-lift</a
      ><a name="12095"
      > </a
      ><a name="12096" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12096" class="Bound"
      >q</a
      ><a name="12097" class="Symbol"
      >)</a
      ><a name="12098"
      > </a
      ><a name="12099" class="Symbol"
      >=</a
      ><a name="12100"
      > </a
      ><a name="12101" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3940" class="InductiveConstructor"
      >&#8804;-lift</a
      ><a name="12107"
      > </a
      ><a name="12108" class="Symbol"
      >(</a
      ><a name="12109" href="https://agda.github.io/agda-stdlib/Relation.Binary.html#1190" class="Function"
      >&#8804;-trans</a
      ><a name="12116"
      > </a
      ><a name="12117" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12085" class="Bound"
      >p</a
      ><a name="12118"
      > </a
      ><a name="12119" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12096" class="Bound"
      >q</a
      ><a name="12120" class="Symbol"
      >)</a
      >
{% endraw %}
</pre>

At any rate, once we have our "bubble" function, the implementation of
the sorting algorithm is trivial---and exactly identical to the
definition of insertion sort!

<pre class="Agda">
{% raw %}
  <a name="12315" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12315" class="Function"
      >bubblesort</a
      ><a name="12325"
      > </a
      ><a name="12326" class="Symbol"
      >:</a
      ><a name="12327"
      > </a
      ><a name="12340" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7289" class="Datatype"
      >OVec</a
      ><a name="12344"
      > </a
      ><a name="12345" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12331" class="Bound"
      >l</a
      ><a name="12346"
      > </a
      ><a name="12347" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12333" class="Bound"
      >n</a
      ><a name="12348"
      > </a
      ><a name="12349" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12335" class="Bound"
      >k</a
      ><a name="12350"
      > </a
      ><a name="12351" class="Symbol"
      >&#8594;</a
      ><a name="12352"
      > </a
      ><a name="12353" href="https://agda.github.io/agda-stdlib/Data.Product.html#823" class="Function"
      >&#8707;</a
      ><a name="12354"
      > </a
      ><a name="12355" class="Symbol"
      >(&#955;</a
      ><a name="12357"
      > </a
      ><a name="12358" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12358" class="Bound"
      >l</a
      ><a name="12359"
      > </a
      ><a name="12360" class="Symbol"
      >&#8594;</a
      ><a name="12361"
      > </a
      ><a name="12362" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7289" class="Datatype"
      >OVec</a
      ><a name="12366"
      > </a
      ><a name="12367" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12358" class="Bound"
      >l</a
      ><a name="12368"
      > </a
      ><a name="12369" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12333" class="Bound"
      >n</a
      ><a name="12370"
      > </a
      ><a name="12371" class="Number"
      >0</a
      ><a name="12372" class="Symbol"
      >)</a
      ><a name="12373"
      >
  </a
      ><a name="12376" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12315" class="Function"
      >bubblesort</a
      ><a name="12386"
      > </a
      ><a name="12387" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7341" class="InductiveConstructor"
      >[]</a
      ><a name="12389"
      >            </a
      ><a name="12401" class="Symbol"
      >=</a
      ><a name="12402"
      > </a
      ><a name="12403" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3584" class="InductiveConstructor"
      >&#8868;</a
      ><a name="12404"
      > </a
      ><a name="12405" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="12406"
      > </a
      ><a name="12407" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7341" class="InductiveConstructor"
      >[]</a
      ><a name="12409"
      >
  </a
      ><a name="12412" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12315" class="Function"
      >bubblesort</a
      ><a name="12422"
      > </a
      ><a name="12423" class="Symbol"
      >(</a
      ><a name="12424" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12424" class="Bound"
      >x</a
      ><a name="12425"
      > </a
      ><a name="12426" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7460" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12427"
      > </a
      ><a name="12428" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12428" class="Bound"
      >xs</a
      ><a name="12430" class="Symbol"
      >)</a
      ><a name="12431"
      >      </a
      ><a name="12437" class="Symbol"
      >=</a
      ><a name="12438"
      > </a
      ><a name="12439" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12315" class="Function"
      >bubblesort</a
      ><a name="12449"
      > </a
      ><a name="12450" class="Symbol"
      >(</a
      ><a name="12451" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11155" class="Function"
      >bubble</a
      ><a name="12457"
      > </a
      ><a name="12458" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12424" class="Bound"
      >x</a
      ><a name="12459"
      > </a
      ><a name="12460" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12428" class="Bound"
      >xs</a
      ><a name="12462" class="Symbol"
      >)</a
      ><a name="12463"
      >
  </a
      ><a name="12466" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12315" class="Function"
      >bubblesort</a
      ><a name="12476"
      > </a
      ><a name="12477" class="Symbol"
      >(</a
      ><a name="12478" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12478" class="Bound"
      >x</a
      ><a name="12479"
      > </a
      ><a name="12480" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7366" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12481"
      > </a
      ><a name="12482" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12482" class="Bound"
      >xs</a
      ><a name="12484"
      > </a
      ><a name="12485" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7366" class="InductiveConstructor Operator"
      >by</a
      ><a name="12487"
      > </a
      ><a name="12488" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12488" class="Bound"
      >p</a
      ><a name="12489" class="Symbol"
      >)</a
      ><a name="12490"
      > </a
      ><a name="12491" class="Symbol"
      >=</a
      ><a name="12492"
      > </a
      ><a name="12493" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3606" class="InductiveConstructor Operator"
      >&#10214;</a
      ><a name="12494"
      > </a
      ><a name="12495" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12478" class="Bound"
      >x</a
      ><a name="12496"
      > </a
      ><a name="12497" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3606" class="InductiveConstructor Operator"
      >&#10215;</a
      ><a name="12498"
      > </a
      ><a name="12499" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="12500"
      > </a
      ><a name="12501" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12478" class="Bound"
      >x</a
      ><a name="12502"
      > </a
      ><a name="12503" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7366" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12504"
      > </a
      ><a name="12505" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12482" class="Bound"
      >xs</a
      ><a name="12507"
      > </a
      ><a name="12508" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7366" class="InductiveConstructor Operator"
      >by</a
      ><a name="12510"
      > </a
      ><a name="12511" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12488" class="Bound"
      >p</a
      >
{% endraw %}
</pre>

This does lead to an interesting point: how do you know that what
you've implemented is actually what you *wanted* to implement?
Of course, a similar discussion applies much more strongly to
programming languages with weaker or non-existent type systems.
However, the point seems to be brought up more often once you stray
into the realm of verification.

Obviously, if you write your program in a language such as JavaScript,
there is nothing that tells you you've implemented the right algorithm.
And it would be rather hard to come up with a test which could tell
the difference between insertion sort and bubble sort---though a
stress-test may reveal the fact. However, in JavaScript, one cannot
even tell the difference between two completely different algorithms,
e.g. "insertion sort" and "Lehvenstein distance", without using
tests. And even then, tests generally only cover a small, finite
number of cases. You may have implemented algorithm *A* for the first
100 inputs, and algorithm *B* afterwards, and you'll never know.

Once you enter the realm of Agda, the argument can be made a little
neater: using a language with a *strong* type system, you limit the
set of all possible algorithms with your types, and you can be sure
that you've implemented *one* of the algorithms in that set.
The trick is to narrow down the set to exactly those algorithms that
you need.

In the above exercise, I failed to do so. The set of algorithms that I
selected for was the set of algorithms that turn lists into sorted
lists of equal length, without inspecting the values (other than by
comparison) and maintaining the "*k*-unsorted elements" invariant.
As we've seen, some of the algorithms in this set are insertion sort,
bubble sort, and "copy the first element *n* times". And because I
paid little attention---I'm convinced my brain simply implemented what
was an obvious optimalisation---I picked the wrong one.

The second question that usually follows is "How do you know that you've
written down the right *property*?" For instance, one small mistake in
my definition of `OVec` would have it mean "a list where sometimes an
element is smaller than one of the elements after it".
Obviously, sorting algorithms would have this property... Now, the
simple answer is that you don't. And this holds for Agda, Coq,
JavaScript, set theory... There is no real way to ensure that what
you write down, in general, corresponds to what you wanted to write
down.
But there is one redeeming factor. Set theory is believed to not be a
hot mess because there are *tons* of people who've checked the
proofs, and who've used the proved properties to prove other, more
complex properties. When you prove a lemma, you intend to *use* it to
prove some different lemma. And in general, if you've proven the wrong
lemma, your next proof will *fail*. And obviously, the notion that the
*usage* of properties and and *repeated checking* of proofs strengtens
a theory applies even more strongly to theories which are also
*machine-checked*.

