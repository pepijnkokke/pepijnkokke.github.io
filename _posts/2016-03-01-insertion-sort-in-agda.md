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
      > </a
      ><a name="3133" class="Keyword"
      >using</a
      ><a name="3138"
      > </a
      ><a name="3139" class="Symbol"
      >(</a
      ><a name="3140"
      >_&#8804;_</a
      ><a name="3143" class="Symbol"
      >;</a
      ><a name="3144"
      > _&#8804;?_</a
      ><a name="3149" class="Symbol"
      >;</a
      ><a name="3150"
      > total</a
      ><a name="3156" class="Symbol"
      >)</a
      ><a name="3157"
      > </a
      ><a name="3158" class="Keyword"
      >renaming</a
      ><a name="3166"
      > </a
      ><a name="3167" class="Symbol"
      >(</a
      ><a name="3168"
      >trans </a
      ><a name="3174" class="Symbol"
      >to</a
      ><a name="3176"
      > &#8804;-trans</a
      ><a name="3184" class="Symbol"
      >)</a
      ><a name="3185"
      >
  </a
      ><a name="3188" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3188" class="Function"
      >A</a
      ><a name="3189"
      > </a
      ><a name="3190" class="Symbol"
      >=</a
      ><a name="3191"
      > </a
      ><a name="3192" href="https://agda.github.io/agda-stdlib/Relation.Binary.html#9308" class="Field"
      >DecTotalOrder.Carrier</a
      ><a name="3213"
      > </a
      ><a name="3214" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3067" class="Bound"
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
  <a name="3550" class="Keyword"
      >data</a
      ><a name="3554"
      > </a
      ><a name="3555" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3555" class="Datatype"
      >A&#770;</a
      ><a name="3557"
      > </a
      ><a name="3558" class="Symbol"
      >:</a
      ><a name="3559"
      > </a
      ><a name="3560" class="PrimitiveType"
      >Set</a
      ><a name="3563"
      > </a
      ><a name="3564" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3056" class="Bound"
      >c</a
      ><a name="3565"
      > </a
      ><a name="3566" class="Keyword"
      >where</a
      ><a name="3571"
      >
    </a
      ><a name="3576" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3576" class="InductiveConstructor"
      >&#8868;</a
      ><a name="3577"
      > </a
      ><a name="3578" class="Symbol"
      >:</a
      ><a name="3579"
      > </a
      ><a name="3580" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3555" class="Datatype"
      >A&#770;</a
      ><a name="3582"
      >
    </a
      ><a name="3587" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3587" class="InductiveConstructor"
      >&#8869;</a
      ><a name="3588"
      > </a
      ><a name="3589" class="Symbol"
      >:</a
      ><a name="3590"
      > </a
      ><a name="3591" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3555" class="Datatype"
      >A&#770;</a
      ><a name="3593"
      >
    </a
      ><a name="3598" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3598" class="InductiveConstructor Operator"
      >&#10214;_&#10215;</a
      ><a name="3601"
      > </a
      ><a name="3602" class="Symbol"
      >:</a
      ><a name="3603"
      > </a
      ><a name="3604" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3188" class="Function"
      >A</a
      ><a name="3605"
      > </a
      ><a name="3606" class="Symbol"
      >&#8594;</a
      ><a name="3607"
      > </a
      ><a name="3608" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3555" class="Datatype"
      >A&#770;</a
      >
{% endraw %}
</pre>

We still need to encode the fact that ⊥ and ⊤ are in fact smaller and
bigger than all other values. Below, we defined the order ≲ on bounded
Â... where we simply state these facts as ⊥≲ and ≲⊤:

<pre class="Agda">
{% raw %}
  <a name="3834" class="Keyword"
      >infix</a
      ><a name="3839"
      > </a
      ><a name="3840" class="Number"
      >4</a
      ><a name="3841"
      > </a
      ><a name="3842" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3854" class="Datatype Operator"
      >_&#8818;_</a
      ><a name="3845"
      >

  </a
      ><a name="3849" class="Keyword"
      >data</a
      ><a name="3853"
      > </a
      ><a name="3854" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3854" class="Datatype Operator"
      >_&#8818;_</a
      ><a name="3857"
      > </a
      ><a name="3858" class="Symbol"
      >:</a
      ><a name="3859"
      > </a
      ><a name="3860" href="https://agda.github.io/agda-stdlib/Relation.Binary.Core.html#740" class="Function"
      >Rel</a
      ><a name="3863"
      > </a
      ><a name="3864" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3555" class="Datatype"
      >A&#770;</a
      ><a name="3866"
      > </a
      ><a name="3867" class="Symbol"
      >(</a
      ><a name="3868" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3056" class="Bound"
      >c</a
      ><a name="3869"
      > </a
      ><a name="3870" href="Agda.Primitive.html#657" class="Primitive Operator"
      >&#8852;</a
      ><a name="3871"
      > </a
      ><a name="3872" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3061" class="Bound"
      >&#8467;&#8322;</a
      ><a name="3874" class="Symbol"
      >)</a
      ><a name="3875"
      > </a
      ><a name="3876" class="Keyword"
      >where</a
      ><a name="3881"
      >
    </a
      ><a name="3886" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3886" class="InductiveConstructor"
      >&#8869;&#8818;</a
      ><a name="3888"
      > </a
      ><a name="3889" class="Symbol"
      >:</a
      ><a name="3890"
      > </a
      ><a name="3899" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3587" class="InductiveConstructor"
      >&#8869;</a
      ><a name="3900"
      > </a
      ><a name="3901" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3854" class="Datatype Operator"
      >&#8818;</a
      ><a name="3902"
      > </a
      ><a name="3903" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3894" class="Bound"
      >x</a
      ><a name="3904"
      >
    </a
      ><a name="3909" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3909" class="InductiveConstructor"
      >&#8818;&#8868;</a
      ><a name="3911"
      > </a
      ><a name="3912" class="Symbol"
      >:</a
      ><a name="3913"
      > </a
      ><a name="3922" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3917" class="Bound"
      >x</a
      ><a name="3923"
      > </a
      ><a name="3924" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3854" class="Datatype Operator"
      >&#8818;</a
      ><a name="3925"
      > </a
      ><a name="3926" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3576" class="InductiveConstructor"
      >&#8868;</a
      ><a name="3927"
      >
    </a
      ><a name="3932" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3932" class="InductiveConstructor"
      >&#8804;-lift</a
      ><a name="3938"
      > </a
      ><a name="3939" class="Symbol"
      >:</a
      ><a name="3940"
      > </a
      ><a name="3951" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3944" class="Bound"
      >x</a
      ><a name="3952"
      > </a
      ><a name="3953" href="https://agda.github.io/agda-stdlib/Relation.Binary.html#9373" class="Field Operator"
      >&#8804;</a
      ><a name="3954"
      > </a
      ><a name="3955" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3946" class="Bound"
      >y</a
      ><a name="3956"
      > </a
      ><a name="3957" class="Symbol"
      >&#8594;</a
      ><a name="3958"
      > </a
      ><a name="3959" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3598" class="InductiveConstructor Operator"
      >&#10214;</a
      ><a name="3960"
      > </a
      ><a name="3961" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3944" class="Bound"
      >x</a
      ><a name="3962"
      > </a
      ><a name="3963" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3598" class="InductiveConstructor Operator"
      >&#10215;</a
      ><a name="3964"
      > </a
      ><a name="3965" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3854" class="Datatype Operator"
      >&#8818;</a
      ><a name="3966"
      > </a
      ><a name="3967" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3598" class="InductiveConstructor Operator"
      >&#10214;</a
      ><a name="3968"
      > </a
      ><a name="3969" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3946" class="Bound"
      >y</a
      ><a name="3970"
      > </a
      ><a name="3971" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3598" class="InductiveConstructor Operator"
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
  <a name="4230" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4230" class="Function"
      >&#8816;-lift</a
      ><a name="4236"
      > </a
      ><a name="4237" class="Symbol"
      >:</a
      ><a name="4238"
      > </a
      ><a name="4249" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#414" class="Function Operator"
      >&#172;</a
      ><a name="4250"
      > </a
      ><a name="4251" class="Symbol"
      >(</a
      ><a name="4252" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4244" class="Bound"
      >y</a
      ><a name="4253"
      > </a
      ><a name="4254" href="https://agda.github.io/agda-stdlib/Relation.Binary.html#9373" class="Field Operator"
      >&#8804;</a
      ><a name="4255"
      > </a
      ><a name="4256" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4242" class="Bound"
      >x</a
      ><a name="4257" class="Symbol"
      >)</a
      ><a name="4258"
      > </a
      ><a name="4259" class="Symbol"
      >&#8594;</a
      ><a name="4260"
      > </a
      ><a name="4261" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3598" class="InductiveConstructor Operator"
      >&#10214;</a
      ><a name="4262"
      > </a
      ><a name="4263" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4242" class="Bound"
      >x</a
      ><a name="4264"
      > </a
      ><a name="4265" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3598" class="InductiveConstructor Operator"
      >&#10215;</a
      ><a name="4266"
      > </a
      ><a name="4267" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3854" class="Datatype Operator"
      >&#8818;</a
      ><a name="4268"
      > </a
      ><a name="4269" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3598" class="InductiveConstructor Operator"
      >&#10214;</a
      ><a name="4270"
      > </a
      ><a name="4271" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4244" class="Bound"
      >y</a
      ><a name="4272"
      > </a
      ><a name="4273" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3598" class="InductiveConstructor Operator"
      >&#10215;</a
      ><a name="4274"
      >
  </a
      ><a name="4277" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4230" class="Function"
      >&#8816;-lift</a
      ><a name="4283"
      > </a
      ><a name="4292" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4292" class="Bound"
      >y&#8816;x</a
      ><a name="4295"
      > </a
      ><a name="4296" class="Keyword"
      >with</a
      ><a name="4300"
      > </a
      ><a name="4301" href="https://agda.github.io/agda-stdlib/Relation.Binary.html#8067" class="Function"
      >total</a
      ><a name="4306"
      > </a
      ><a name="4307" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4285" class="Bound"
      >x</a
      ><a name="4308"
      > </a
      ><a name="4309" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4289" class="Bound"
      >y</a
      ><a name="4310"
      >
  </a
      ><a name="4313" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4230" class="Function"
      >&#8816;-lift</a
      ><a name="4319"
      > </a
      ><a name="4320" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4320" class="Bound"
      >y&#8816;x</a
      ><a name="4323"
      > </a
      ><a name="4324" class="Symbol"
      >|</a
      ><a name="4325"
      > </a
      ><a name="4326" href="https://agda.github.io/agda-stdlib/Data.Sum.html#489" class="InductiveConstructor"
      >inj&#8321;</a
      ><a name="4330"
      > </a
      ><a name="4331" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4331" class="Bound"
      >x&#8804;y</a
      ><a name="4334"
      > </a
      ><a name="4335" class="Symbol"
      >=</a
      ><a name="4336"
      > </a
      ><a name="4337" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3932" class="InductiveConstructor"
      >&#8804;-lift</a
      ><a name="4343"
      > </a
      ><a name="4344" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4331" class="Bound"
      >x&#8804;y</a
      ><a name="4347"
      >
  </a
      ><a name="4350" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4230" class="Function"
      >&#8816;-lift</a
      ><a name="4356"
      > </a
      ><a name="4357" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4357" class="Bound"
      >y&#8816;x</a
      ><a name="4360"
      > </a
      ><a name="4361" class="Symbol"
      >|</a
      ><a name="4362"
      > </a
      ><a name="4363" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="4367"
      > </a
      ><a name="4368" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4368" class="Bound"
      >y&#8804;x</a
      ><a name="4371"
      > </a
      ><a name="4372" class="Symbol"
      >=</a
      ><a name="4373"
      > </a
      ><a name="4374" href="https://agda.github.io/agda-stdlib/Data.Empty.html#360" class="Function"
      >&#8869;-elim</a
      ><a name="4380"
      > </a
      ><a name="4381" class="Symbol"
      >(</a
      ><a name="4382" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4357" class="Bound"
      >y&#8816;x</a
      ><a name="4385"
      > </a
      ><a name="4386" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4368" class="Bound"
      >y&#8804;x</a
      ><a name="4389" class="Symbol"
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
  <a name="4638" class="Keyword"
      >infix</a
      ><a name="4643"
      > </a
      ><a name="4644" class="Number"
      >5</a
      ><a name="4645"
      > </a
      ><a name="4646" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4653" class="Function Operator"
      >_&#8851;_</a
      ><a name="4649"
      >

  </a
      ><a name="4653" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4653" class="Function Operator"
      >_&#8851;_</a
      ><a name="4656"
      > </a
      ><a name="4657" class="Symbol"
      >:</a
      ><a name="4658"
      > </a
      ><a name="4659" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3555" class="Datatype"
      >A&#770;</a
      ><a name="4661"
      > </a
      ><a name="4662" class="Symbol"
      >&#8594;</a
      ><a name="4663"
      > </a
      ><a name="4664" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3555" class="Datatype"
      >A&#770;</a
      ><a name="4666"
      > </a
      ><a name="4667" class="Symbol"
      >&#8594;</a
      ><a name="4668"
      > </a
      ><a name="4669" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3555" class="Datatype"
      >A&#770;</a
      ><a name="4671"
      >
  </a
      ><a name="4674" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3576" class="InductiveConstructor"
      >&#8868;</a
      ><a name="4675"
      > </a
      ><a name="4676" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4653" class="Function Operator"
      >&#8851;</a
      ><a name="4677"
      > </a
      ><a name="4678" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4678" class="Bound"
      >y</a
      ><a name="4679"
      > </a
      ><a name="4680" class="Symbol"
      >=</a
      ><a name="4681"
      > </a
      ><a name="4682" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4678" class="Bound"
      >y</a
      ><a name="4683"
      >
  </a
      ><a name="4686" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3587" class="InductiveConstructor"
      >&#8869;</a
      ><a name="4687"
      > </a
      ><a name="4688" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4653" class="Function Operator"
      >&#8851;</a
      ><a name="4689"
      > </a
      ><a name="4690" class="Symbol"
      >_</a
      ><a name="4691"
      > </a
      ><a name="4692" class="Symbol"
      >=</a
      ><a name="4693"
      > </a
      ><a name="4694" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3587" class="InductiveConstructor"
      >&#8869;</a
      ><a name="4695"
      >
  </a
      ><a name="4698" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4698" class="Bound"
      >x</a
      ><a name="4699"
      > </a
      ><a name="4700" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4653" class="Function Operator"
      >&#8851;</a
      ><a name="4701"
      > </a
      ><a name="4702" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3576" class="InductiveConstructor"
      >&#8868;</a
      ><a name="4703"
      > </a
      ><a name="4704" class="Symbol"
      >=</a
      ><a name="4705"
      > </a
      ><a name="4706" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4698" class="Bound"
      >x</a
      ><a name="4707"
      >
  </a
      ><a name="4710" class="Symbol"
      >_</a
      ><a name="4711"
      > </a
      ><a name="4712" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4653" class="Function Operator"
      >&#8851;</a
      ><a name="4713"
      > </a
      ><a name="4714" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3587" class="InductiveConstructor"
      >&#8869;</a
      ><a name="4715"
      > </a
      ><a name="4716" class="Symbol"
      >=</a
      ><a name="4717"
      > </a
      ><a name="4718" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3587" class="InductiveConstructor"
      >&#8869;</a
      ><a name="4719"
      >
  </a
      ><a name="4722" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3598" class="InductiveConstructor Operator"
      >&#10214;</a
      ><a name="4723"
      > </a
      ><a name="4724" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4724" class="Bound"
      >x</a
      ><a name="4725"
      > </a
      ><a name="4726" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3598" class="InductiveConstructor Operator"
      >&#10215;</a
      ><a name="4727"
      > </a
      ><a name="4728" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4653" class="Function Operator"
      >&#8851;</a
      ><a name="4729"
      > </a
      ><a name="4730" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3598" class="InductiveConstructor Operator"
      >&#10214;</a
      ><a name="4731"
      > </a
      ><a name="4732" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4732" class="Bound"
      >y</a
      ><a name="4733"
      > </a
      ><a name="4734" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3598" class="InductiveConstructor Operator"
      >&#10215;</a
      ><a name="4735"
      > </a
      ><a name="4736" class="Keyword"
      >with</a
      ><a name="4740"
      > </a
      ><a name="4741" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4724" class="Bound"
      >x</a
      ><a name="4742"
      > </a
      ><a name="4743" href="https://agda.github.io/agda-stdlib/Relation.Binary.html#8876" class="Function Operator"
      >&#8804;?</a
      ><a name="4745"
      > </a
      ><a name="4746" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4732" class="Bound"
      >y</a
      ><a name="4747"
      >
  </a
      ><a name="4750" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3598" class="InductiveConstructor Operator"
      >&#10214;</a
      ><a name="4751"
      > </a
      ><a name="4752" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4752" class="Bound"
      >x</a
      ><a name="4753"
      > </a
      ><a name="4754" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3598" class="InductiveConstructor Operator"
      >&#10215;</a
      ><a name="4755"
      > </a
      ><a name="4756" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4653" class="Function Operator"
      >&#8851;</a
      ><a name="4757"
      > </a
      ><a name="4758" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3598" class="InductiveConstructor Operator"
      >&#10214;</a
      ><a name="4759"
      > </a
      ><a name="4760" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4760" class="Bound"
      >y</a
      ><a name="4761"
      > </a
      ><a name="4762" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3598" class="InductiveConstructor Operator"
      >&#10215;</a
      ><a name="4763"
      > </a
      ><a name="4764" class="Symbol"
      >|</a
      ><a name="4765"
      > </a
      ><a name="4766" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="4769"
      > </a
      ><a name="4770" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4770" class="Bound"
      >x&#8804;y</a
      ><a name="4773"
      > </a
      ><a name="4774" class="Symbol"
      >=</a
      ><a name="4775"
      > </a
      ><a name="4776" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3598" class="InductiveConstructor Operator"
      >&#10214;</a
      ><a name="4777"
      > </a
      ><a name="4778" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4752" class="Bound"
      >x</a
      ><a name="4779"
      > </a
      ><a name="4780" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3598" class="InductiveConstructor Operator"
      >&#10215;</a
      ><a name="4781"
      >
  </a
      ><a name="4784" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3598" class="InductiveConstructor Operator"
      >&#10214;</a
      ><a name="4785"
      > </a
      ><a name="4786" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4786" class="Bound"
      >x</a
      ><a name="4787"
      > </a
      ><a name="4788" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3598" class="InductiveConstructor Operator"
      >&#10215;</a
      ><a name="4789"
      > </a
      ><a name="4790" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4653" class="Function Operator"
      >&#8851;</a
      ><a name="4791"
      > </a
      ><a name="4792" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3598" class="InductiveConstructor Operator"
      >&#10214;</a
      ><a name="4793"
      > </a
      ><a name="4794" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4794" class="Bound"
      >y</a
      ><a name="4795"
      > </a
      ><a name="4796" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3598" class="InductiveConstructor Operator"
      >&#10215;</a
      ><a name="4797"
      > </a
      ><a name="4798" class="Symbol"
      >|</a
      ><a name="4799"
      > </a
      ><a name="4800" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="4802"
      >  </a
      ><a name="4804" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4804" class="Bound"
      >x&gt;y</a
      ><a name="4807"
      > </a
      ><a name="4808" class="Symbol"
      >=</a
      ><a name="4809"
      > </a
      ><a name="4810" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3598" class="InductiveConstructor Operator"
      >&#10214;</a
      ><a name="4811"
      > </a
      ><a name="4812" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4794" class="Bound"
      >y</a
      ><a name="4813"
      > </a
      ><a name="4814" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3598" class="InductiveConstructor Operator"
      >&#10215;</a
      ><a name="4815"
      >

  </a
      ><a name="4819" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4819" class="Function"
      >&#8851;-conserves-&#8818;</a
      ><a name="4832"
      > </a
      ><a name="4833" class="Symbol"
      >:</a
      ><a name="4834"
      > </a
      ><a name="4847" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4838" class="Bound"
      >x</a
      ><a name="4848"
      > </a
      ><a name="4849" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3854" class="Datatype Operator"
      >&#8818;</a
      ><a name="4850"
      > </a
      ><a name="4851" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4840" class="Bound"
      >y</a
      ><a name="4852"
      > </a
      ><a name="4853" class="Symbol"
      >&#8594;</a
      ><a name="4854"
      > </a
      ><a name="4855" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4838" class="Bound"
      >x</a
      ><a name="4856"
      > </a
      ><a name="4857" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3854" class="Datatype Operator"
      >&#8818;</a
      ><a name="4858"
      > </a
      ><a name="4859" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4842" class="Bound"
      >z</a
      ><a name="4860"
      > </a
      ><a name="4861" class="Symbol"
      >&#8594;</a
      ><a name="4862"
      > </a
      ><a name="4863" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4838" class="Bound"
      >x</a
      ><a name="4864"
      > </a
      ><a name="4865" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3854" class="Datatype Operator"
      >&#8818;</a
      ><a name="4866"
      > </a
      ><a name="4867" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4840" class="Bound"
      >y</a
      ><a name="4868"
      > </a
      ><a name="4869" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4653" class="Function Operator"
      >&#8851;</a
      ><a name="4870"
      > </a
      ><a name="4871" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4842" class="Bound"
      >z</a
      ><a name="4872"
      >
  </a
      ><a name="4875" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4819" class="Function"
      >&#8851;-conserves-&#8818;</a
      ><a name="4888"
      > </a
      ><a name="4897" class="Symbol"
      >{_}</a
      ><a name="4900"
      > </a
      ><a name="4901" class="Symbol"
      >_</a
      ><a name="4902"
      > </a
      ><a name="4903" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4903" class="Bound"
      >q</a
      ><a name="4904"
      > </a
      ><a name="4905" class="Symbol"
      >=</a
      ><a name="4906"
      > </a
      ><a name="4907" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4903" class="Bound"
      >q</a
      ><a name="4908"
      >
  </a
      ><a name="4911" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4819" class="Function"
      >&#8851;-conserves-&#8818;</a
      ><a name="4924"
      > </a
      ><a name="4933" class="Symbol"
      >{_}</a
      ><a name="4936"
      > </a
      ><a name="4937" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4937" class="Bound"
      >p</a
      ><a name="4938"
      > </a
      ><a name="4939" class="Symbol"
      >_</a
      ><a name="4940"
      > </a
      ><a name="4941" class="Symbol"
      >=</a
      ><a name="4942"
      > </a
      ><a name="4943" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4937" class="Bound"
      >p</a
      ><a name="4944"
      >
  </a
      ><a name="4947" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4819" class="Function"
      >&#8851;-conserves-&#8818;</a
      ><a name="4960"
      > </a
      ><a name="4977" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4977" class="Bound"
      >p</a
      ><a name="4978"
      > </a
      ><a name="4979" class="Symbol"
      >_</a
      ><a name="4980"
      > </a
      ><a name="4981" class="Symbol"
      >=</a
      ><a name="4982"
      > </a
      ><a name="4983" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4977" class="Bound"
      >p</a
      ><a name="4984"
      >
  </a
      ><a name="4987" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4819" class="Function"
      >&#8851;-conserves-&#8818;</a
      ><a name="5000"
      > </a
      ><a name="5017" class="Symbol"
      >_</a
      ><a name="5018"
      > </a
      ><a name="5019" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#5019" class="Bound"
      >q</a
      ><a name="5020"
      > </a
      ><a name="5021" class="Symbol"
      >=</a
      ><a name="5022"
      > </a
      ><a name="5023" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#5019" class="Bound"
      >q</a
      ><a name="5024"
      >
  </a
      ><a name="5027" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4819" class="Function"
      >&#8851;-conserves-&#8818;</a
      ><a name="5040"
      > </a
      ><a name="5061" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#5061" class="Bound"
      >p</a
      ><a name="5062"
      > </a
      ><a name="5063" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#5063" class="Bound"
      >q</a
      ><a name="5064"
      > </a
      ><a name="5065" class="Keyword"
      >with</a
      ><a name="5069"
      > </a
      ><a name="5070" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#5048" class="Bound"
      >y</a
      ><a name="5071"
      > </a
      ><a name="5072" href="https://agda.github.io/agda-stdlib/Relation.Binary.html#8876" class="Function Operator"
      >&#8804;?</a
      ><a name="5074"
      > </a
      ><a name="5075" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#5056" class="Bound"
      >z</a
      ><a name="5076"
      >
  </a
      ><a name="5079" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4819" class="Function"
      >&#8851;-conserves-&#8818;</a
      ><a name="5092"
      > </a
      ><a name="5113" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#5113" class="Bound"
      >p</a
      ><a name="5114"
      > </a
      ><a name="5115" class="Symbol"
      >_</a
      ><a name="5116"
      > </a
      ><a name="5117" class="Symbol"
      >|</a
      ><a name="5118"
      > </a
      ><a name="5119" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="5122"
      > </a
      ><a name="5123" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#5123" class="Bound"
      >y&#8804;z</a
      ><a name="5126"
      > </a
      ><a name="5127" class="Symbol"
      >=</a
      ><a name="5128"
      > </a
      ><a name="5129" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#5113" class="Bound"
      >p</a
      ><a name="5130"
      >
  </a
      ><a name="5133" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4819" class="Function"
      >&#8851;-conserves-&#8818;</a
      ><a name="5146"
      > </a
      ><a name="5167" class="Symbol"
      >_</a
      ><a name="5168"
      > </a
      ><a name="5169" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#5169" class="Bound"
      >q</a
      ><a name="5170"
      > </a
      ><a name="5171" class="Symbol"
      >|</a
      ><a name="5172"
      > </a
      ><a name="5173" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="5175"
      >  </a
      ><a name="5177" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#5177" class="Bound"
      >y&#8816;z</a
      ><a name="5180"
      > </a
      ><a name="5181" class="Symbol"
      >=</a
      ><a name="5182"
      > </a
      ><a name="5183" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#5169" class="Bound"
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
  <a name="7276" class="Keyword"
      >data</a
      ><a name="7280"
      > </a
      ><a name="7281" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7281" class="Datatype"
      >OVec</a
      ><a name="7285"
      > </a
      ><a name="7286" class="Symbol"
      >:</a
      ><a name="7287"
      > </a
      ><a name="7288" class="Symbol"
      >(</a
      ><a name="7289" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7289" class="Bound"
      >l</a
      ><a name="7290"
      > </a
      ><a name="7291" class="Symbol"
      >:</a
      ><a name="7292"
      > </a
      ><a name="7293" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3555" class="Datatype"
      >A&#770;</a
      ><a name="7295" class="Symbol"
      >)</a
      ><a name="7296"
      > </a
      ><a name="7297" class="Symbol"
      >(</a
      ><a name="7298" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7298" class="Bound"
      >n</a
      ><a name="7299"
      > </a
      ><a name="7300" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7300" class="Bound"
      >k</a
      ><a name="7301"
      > </a
      ><a name="7302" class="Symbol"
      >:</a
      ><a name="7303"
      > </a
      ><a name="7304" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#97" class="Datatype"
      >&#8469;</a
      ><a name="7305" class="Symbol"
      >)</a
      ><a name="7306"
      > </a
      ><a name="7307" class="Symbol"
      >&#8594;</a
      ><a name="7308"
      > </a
      ><a name="7309" class="PrimitiveType"
      >Set</a
      ><a name="7312"
      > </a
      ><a name="7313" class="Symbol"
      >(</a
      ><a name="7314" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3056" class="Bound"
      >c</a
      ><a name="7315"
      > </a
      ><a name="7316" href="Agda.Primitive.html#657" class="Primitive Operator"
      >&#8852;</a
      ><a name="7317"
      > </a
      ><a name="7318" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3061" class="Bound"
      >&#8467;&#8322;</a
      ><a name="7320" class="Symbol"
      >)</a
      ><a name="7321"
      > </a
      ><a name="7322" class="Keyword"
      >where</a
      ><a name="7327"
      >

    </a
      ><a name="7333" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7333" class="InductiveConstructor"
      >[]</a
      ><a name="7335"
      >     </a
      ><a name="7340" class="Symbol"
      >:</a
      ><a name="7341"
      > </a
      ><a name="7342" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7281" class="Datatype"
      >OVec</a
      ><a name="7346"
      > </a
      ><a name="7347" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3576" class="InductiveConstructor"
      >&#8868;</a
      ><a name="7348"
      > </a
      ><a name="7349" class="Number"
      >0</a
      ><a name="7350"
      > </a
      ><a name="7351" class="Number"
      >0</a
      ><a name="7352"
      >

    </a
      ><a name="7358" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7358" class="InductiveConstructor Operator"
      >_&#8759;_by_</a
      ><a name="7364"
      > </a
      ><a name="7365" class="Symbol"
      >:</a
      ><a name="7366"
      > </a
      ><a name="7375" class="Symbol"
      >(</a
      ><a name="7376" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7376" class="Bound"
      >x</a
      ><a name="7377"
      > </a
      ><a name="7378" class="Symbol"
      >:</a
      ><a name="7379"
      > </a
      ><a name="7380" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3188" class="Function"
      >A</a
      ><a name="7381" class="Symbol"
      >)</a
      ><a name="7382"
      > </a
      ><a name="7383" class="Symbol"
      >(</a
      ><a name="7384" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7384" class="Bound"
      >xs</a
      ><a name="7386"
      > </a
      ><a name="7387" class="Symbol"
      >:</a
      ><a name="7388"
      > </a
      ><a name="7389" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7281" class="Datatype"
      >OVec</a
      ><a name="7393"
      > </a
      ><a name="7394" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7370" class="Bound"
      >l</a
      ><a name="7395"
      > </a
      ><a name="7396" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7372" class="Bound"
      >n</a
      ><a name="7397"
      > </a
      ><a name="7398" class="Number"
      >0</a
      ><a name="7399" class="Symbol"
      >)</a
      ><a name="7400"
      >
           </a
      ><a name="7412" class="Symbol"
      >&#8594;</a
      ><a name="7413"
      > </a
      ><a name="7414" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3598" class="InductiveConstructor Operator"
      >&#10214;</a
      ><a name="7415"
      > </a
      ><a name="7416" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7376" class="Bound"
      >x</a
      ><a name="7417"
      > </a
      ><a name="7418" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3598" class="InductiveConstructor Operator"
      >&#10215;</a
      ><a name="7419"
      > </a
      ><a name="7420" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3854" class="Datatype Operator"
      >&#8818;</a
      ><a name="7421"
      > </a
      ><a name="7422" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7370" class="Bound"
      >l</a
      ><a name="7423"
      > </a
      ><a name="7424" class="Symbol"
      >&#8594;</a
      ><a name="7425"
      > </a
      ><a name="7426" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7281" class="Datatype"
      >OVec</a
      ><a name="7430"
      > </a
      ><a name="7431" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3598" class="InductiveConstructor Operator"
      >&#10214;</a
      ><a name="7432"
      > </a
      ><a name="7433" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7376" class="Bound"
      >x</a
      ><a name="7434"
      > </a
      ><a name="7435" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3598" class="InductiveConstructor Operator"
      >&#10215;</a
      ><a name="7436"
      > </a
      ><a name="7437" class="Symbol"
      >(</a
      ><a name="7438" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#128" class="InductiveConstructor"
      >suc</a
      ><a name="7441"
      > </a
      ><a name="7442" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7372" class="Bound"
      >n</a
      ><a name="7443" class="Symbol"
      >)</a
      ><a name="7444"
      > </a
      ><a name="7445" class="Number"
      >0</a
      ><a name="7446"
      >

    </a
      ><a name="7452" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7452" class="InductiveConstructor Operator"
      >_&#8759;_</a
      ><a name="7455"
      >    </a
      ><a name="7459" class="Symbol"
      >:</a
      ><a name="7460"
      > </a
      ><a name="7471" class="Symbol"
      >(</a
      ><a name="7472" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7472" class="Bound"
      >x</a
      ><a name="7473"
      > </a
      ><a name="7474" class="Symbol"
      >:</a
      ><a name="7475"
      > </a
      ><a name="7476" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3188" class="Function"
      >A</a
      ><a name="7477" class="Symbol"
      >)</a
      ><a name="7478"
      > </a
      ><a name="7479" class="Symbol"
      >(</a
      ><a name="7480" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7480" class="Bound"
      >xs</a
      ><a name="7482"
      > </a
      ><a name="7483" class="Symbol"
      >:</a
      ><a name="7484"
      > </a
      ><a name="7485" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7281" class="Datatype"
      >OVec</a
      ><a name="7489"
      > </a
      ><a name="7490" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7464" class="Bound"
      >l</a
      ><a name="7491"
      > </a
      ><a name="7492" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7466" class="Bound"
      >n</a
      ><a name="7493"
      > </a
      ><a name="7494" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7468" class="Bound"
      >k</a
      ><a name="7495" class="Symbol"
      >)</a
      ><a name="7496"
      >
           </a
      ><a name="7508" class="Symbol"
      >&#8594;</a
      ><a name="7509"
      > </a
      ><a name="7510" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7281" class="Datatype"
      >OVec</a
      ><a name="7514"
      > </a
      ><a name="7515" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3587" class="InductiveConstructor"
      >&#8869;</a
      ><a name="7516"
      > </a
      ><a name="7517" class="Symbol"
      >(</a
      ><a name="7518" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#128" class="InductiveConstructor"
      >suc</a
      ><a name="7521"
      > </a
      ><a name="7522" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7466" class="Bound"
      >n</a
      ><a name="7523" class="Symbol"
      >)</a
      ><a name="7524"
      > </a
      ><a name="7525" class="Symbol"
      >(</a
      ><a name="7526" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#128" class="InductiveConstructor"
      >suc</a
      ><a name="7529"
      > </a
      ><a name="7530" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7468" class="Bound"
      >k</a
      ><a name="7531" class="Symbol"
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
  <a name="7971" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7971" class="Function"
      >fromVec</a
      ><a name="7978"
      > </a
      ><a name="7979" class="Symbol"
      >:</a
      ><a name="7980"
      > </a
      ><a name="7989" href="https://agda.github.io/agda-stdlib/Data.Vec.html#638" class="Datatype"
      >Vec</a
      ><a name="7992"
      > </a
      ><a name="7993" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3188" class="Function"
      >A</a
      ><a name="7994"
      > </a
      ><a name="7995" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7984" class="Bound"
      >n</a
      ><a name="7996"
      > </a
      ><a name="7997" class="Symbol"
      >&#8594;</a
      ><a name="7998"
      > </a
      ><a name="7999" href="https://agda.github.io/agda-stdlib/Data.Product.html#823" class="Function"
      >&#8707;</a
      ><a name="8000"
      > </a
      ><a name="8001" class="Symbol"
      >(&#955;</a
      ><a name="8003"
      > </a
      ><a name="8004" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8004" class="Bound"
      >l</a
      ><a name="8005"
      > </a
      ><a name="8006" class="Symbol"
      >&#8594;</a
      ><a name="8007"
      > </a
      ><a name="8008" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7281" class="Datatype"
      >OVec</a
      ><a name="8012"
      > </a
      ><a name="8013" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8004" class="Bound"
      >l</a
      ><a name="8014"
      > </a
      ><a name="8015" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7984" class="Bound"
      >n</a
      ><a name="8016"
      > </a
      ><a name="8017" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7984" class="Bound"
      >n</a
      ><a name="8018" class="Symbol"
      >)</a
      ><a name="8019"
      >
  </a
      ><a name="8022" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7971" class="Function"
      >fromVec</a
      ><a name="8029"
      > </a
      ><a name="8030" href="https://agda.github.io/agda-stdlib/Data.Vec.html#678" class="InductiveConstructor"
      >[]</a
      ><a name="8032"
      > </a
      ><a name="8033" class="Symbol"
      >=</a
      ><a name="8034"
      > </a
      ><a name="8035" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3576" class="InductiveConstructor"
      >&#8868;</a
      ><a name="8036"
      > </a
      ><a name="8037" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="8038"
      > </a
      ><a name="8039" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7333" class="InductiveConstructor"
      >[]</a
      ><a name="8041"
      >
  </a
      ><a name="8044" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7971" class="Function"
      >fromVec</a
      ><a name="8051"
      > </a
      ><a name="8052" class="Symbol"
      >(</a
      ><a name="8053" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8053" class="Bound"
      >x</a
      ><a name="8054"
      > </a
      ><a name="8055" href="https://agda.github.io/agda-stdlib/Data.Vec.html#697" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="8056"
      > </a
      ><a name="8057" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8057" class="Bound"
      >xs</a
      ><a name="8059" class="Symbol"
      >)</a
      ><a name="8060"
      > </a
      ><a name="8061" class="Symbol"
      >=</a
      ><a name="8062"
      > </a
      ><a name="8063" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3587" class="InductiveConstructor"
      >&#8869;</a
      ><a name="8064"
      > </a
      ><a name="8065" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="8066"
      > </a
      ><a name="8067" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8053" class="Bound"
      >x</a
      ><a name="8068"
      > </a
      ><a name="8069" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7452" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="8070"
      > </a
      ><a name="8071" href="https://agda.github.io/agda-stdlib/Data.Product.html#539" class="Field"
      >proj&#8322;</a
      ><a name="8076"
      > </a
      ><a name="8077" class="Symbol"
      >(</a
      ><a name="8078" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7971" class="Function"
      >fromVec</a
      ><a name="8085"
      > </a
      ><a name="8086" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8057" class="Bound"
      >xs</a
      ><a name="8088" class="Symbol"
      >)</a
      ><a name="8089"
      >

  </a
      ><a name="8093" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8093" class="Function"
      >fromVec-&#8868;or&#8869;</a
      ><a name="8105"
      > </a
      ><a name="8106" class="Symbol"
      >:</a
      ><a name="8107"
      > </a
      ><a name="8135" class="Keyword"
      >let</a
      ><a name="8138"
      > </a
      ><a name="8139" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8139" class="Bound"
      >l</a
      ><a name="8140"
      > </a
      ><a name="8141" class="Symbol"
      >=</a
      ><a name="8142"
      > </a
      ><a name="8143" href="https://agda.github.io/agda-stdlib/Data.Product.html#525" class="Field"
      >proj&#8321;</a
      ><a name="8148"
      > </a
      ><a name="8149" class="Symbol"
      >(</a
      ><a name="8150" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7971" class="Function"
      >fromVec</a
      ><a name="8157"
      > </a
      ><a name="8158" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8115" class="Bound"
      >xs</a
      ><a name="8160" class="Symbol"
      >)</a
      ><a name="8161"
      > </a
      ><a name="8162" class="Keyword"
      >in</a
      ><a name="8164"
      > </a
      ><a name="8165" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8139" class="Bound"
      >l</a
      ><a name="8166"
      > </a
      ><a name="8167" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Equality.html#83" class="Datatype Operator"
      >&#8801;</a
      ><a name="8168"
      > </a
      ><a name="8169" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3576" class="InductiveConstructor"
      >&#8868;</a
      ><a name="8170"
      > </a
      ><a name="8171" href="https://agda.github.io/agda-stdlib/Data.Sum.html#433" class="Datatype Operator"
      >&#8846;</a
      ><a name="8172"
      > </a
      ><a name="8173" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8139" class="Bound"
      >l</a
      ><a name="8174"
      > </a
      ><a name="8175" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Equality.html#83" class="Datatype Operator"
      >&#8801;</a
      ><a name="8176"
      > </a
      ><a name="8177" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3587" class="InductiveConstructor"
      >&#8869;</a
      ><a name="8178"
      >
  </a
      ><a name="8181" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8093" class="Function"
      >fromVec-&#8868;or&#8869;</a
      ><a name="8193"
      > </a
      ><a name="8214" class="Symbol"
      >=</a
      ><a name="8215"
      > </a
      ><a name="8216" href="https://agda.github.io/agda-stdlib/Data.Sum.html#489" class="InductiveConstructor"
      >inj&#8321;</a
      ><a name="8220"
      > </a
      ><a name="8221" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Equality.html#140" class="InductiveConstructor"
      >refl</a
      ><a name="8225"
      >
  </a
      ><a name="8228" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8093" class="Function"
      >fromVec-&#8868;or&#8869;</a
      ><a name="8240"
      > </a
      ><a name="8261" class="Symbol"
      >=</a
      ><a name="8262"
      > </a
      ><a name="8263" href="https://agda.github.io/agda-stdlib/Data.Sum.html#514" class="InductiveConstructor"
      >inj&#8322;</a
      ><a name="8267"
      > </a
      ><a name="8268" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Equality.html#140" class="InductiveConstructor"
      >refl</a
      >
{% endraw %}
</pre>

And obviously, we can also turn any k-ordered vector into a regular
vector simply by forgetting about all the order evidence:

<pre class="Agda">
{% raw %}
  <a name="8427" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8427" class="Function"
      >toVec</a
      ><a name="8432"
      > </a
      ><a name="8433" class="Symbol"
      >:</a
      ><a name="8434"
      > </a
      ><a name="8447" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7281" class="Datatype"
      >OVec</a
      ><a name="8451"
      > </a
      ><a name="8452" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8438" class="Bound"
      >l</a
      ><a name="8453"
      > </a
      ><a name="8454" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8440" class="Bound"
      >n</a
      ><a name="8455"
      > </a
      ><a name="8456" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8442" class="Bound"
      >k</a
      ><a name="8457"
      > </a
      ><a name="8458" class="Symbol"
      >&#8594;</a
      ><a name="8459"
      > </a
      ><a name="8460" href="https://agda.github.io/agda-stdlib/Data.Vec.html#638" class="Datatype"
      >Vec</a
      ><a name="8463"
      > </a
      ><a name="8464" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3188" class="Function"
      >A</a
      ><a name="8465"
      > </a
      ><a name="8466" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8440" class="Bound"
      >n</a
      ><a name="8467"
      >
  </a
      ><a name="8470" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8427" class="Function"
      >toVec</a
      ><a name="8475"
      > </a
      ><a name="8476" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7333" class="InductiveConstructor"
      >[]</a
      ><a name="8478"
      > </a
      ><a name="8479" class="Symbol"
      >=</a
      ><a name="8480"
      > </a
      ><a name="8481" href="https://agda.github.io/agda-stdlib/Data.Vec.html#678" class="InductiveConstructor"
      >[]</a
      ><a name="8483"
      >
  </a
      ><a name="8486" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8427" class="Function"
      >toVec</a
      ><a name="8491"
      > </a
      ><a name="8492" class="Symbol"
      >(</a
      ><a name="8493" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8493" class="Bound"
      >x</a
      ><a name="8494"
      > </a
      ><a name="8495" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7452" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="8496"
      > </a
      ><a name="8497" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8497" class="Bound"
      >xs</a
      ><a name="8499" class="Symbol"
      >)</a
      ><a name="8500"
      > </a
      ><a name="8501" class="Symbol"
      >=</a
      ><a name="8502"
      > </a
      ><a name="8503" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8493" class="Bound"
      >x</a
      ><a name="8504"
      > </a
      ><a name="8505" href="https://agda.github.io/agda-stdlib/Data.Vec.html#697" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="8506"
      > </a
      ><a name="8507" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8427" class="Function"
      >toVec</a
      ><a name="8512"
      > </a
      ><a name="8513" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8497" class="Bound"
      >xs</a
      ><a name="8515"
      >
  </a
      ><a name="8518" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8427" class="Function"
      >toVec</a
      ><a name="8523"
      > </a
      ><a name="8524" class="Symbol"
      >(</a
      ><a name="8525" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8525" class="Bound"
      >x</a
      ><a name="8526"
      > </a
      ><a name="8527" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7358" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="8528"
      > </a
      ><a name="8529" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8529" class="Bound"
      >xs</a
      ><a name="8531"
      > </a
      ><a name="8532" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7358" class="InductiveConstructor Operator"
      >by</a
      ><a name="8534"
      > </a
      ><a name="8535" class="Symbol"
      >_)</a
      ><a name="8537"
      > </a
      ><a name="8538" class="Symbol"
      >=</a
      ><a name="8539"
      > </a
      ><a name="8540" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8525" class="Bound"
      >x</a
      ><a name="8541"
      > </a
      ><a name="8542" href="https://agda.github.io/agda-stdlib/Data.Vec.html#697" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="8543"
      > </a
      ><a name="8544" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8427" class="Function"
      >toVec</a
      ><a name="8549"
      > </a
      ><a name="8550" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8529" class="Bound"
      >xs</a
      >
{% endraw %}
</pre>

Finally! We've developed enough vocabulary to write down what it
really means to perform an insertion:

<pre class="Agda">
{% raw %}
  <a name="8684" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8684" class="Function"
      >insert</a
      ><a name="8690"
      > </a
      ><a name="8691" class="Symbol"
      >:</a
      ><a name="8692"
      > </a
      ><a name="8703" class="Symbol"
      >(</a
      ><a name="8704" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8704" class="Bound"
      >x</a
      ><a name="8705"
      > </a
      ><a name="8706" class="Symbol"
      >:</a
      ><a name="8707"
      > </a
      ><a name="8708" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3188" class="Function"
      >A</a
      ><a name="8709" class="Symbol"
      >)</a
      ><a name="8710"
      > </a
      ><a name="8711" class="Symbol"
      >&#8594;</a
      ><a name="8712"
      > </a
      ><a name="8713" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7281" class="Datatype"
      >OVec</a
      ><a name="8717"
      > </a
      ><a name="8718" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8696" class="Bound"
      >l</a
      ><a name="8719"
      > </a
      ><a name="8720" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8698" class="Bound"
      >n</a
      ><a name="8721"
      > </a
      ><a name="8722" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8700" class="Bound"
      >k</a
      ><a name="8723"
      > </a
      ><a name="8724" class="Symbol"
      >&#8594;</a
      ><a name="8725"
      > </a
      ><a name="8726" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7281" class="Datatype"
      >OVec</a
      ><a name="8730"
      > </a
      ><a name="8731" class="Symbol"
      >(</a
      ><a name="8732" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3598" class="InductiveConstructor Operator"
      >&#10214;</a
      ><a name="8733"
      > </a
      ><a name="8734" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8704" class="Bound"
      >x</a
      ><a name="8735"
      > </a
      ><a name="8736" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3598" class="InductiveConstructor Operator"
      >&#10215;</a
      ><a name="8737"
      > </a
      ><a name="8738" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4653" class="Function Operator"
      >&#8851;</a
      ><a name="8739"
      > </a
      ><a name="8740" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8696" class="Bound"
      >l</a
      ><a name="8741" class="Symbol"
      >)</a
      ><a name="8742"
      > </a
      ><a name="8743" class="Symbol"
      >(</a
      ><a name="8744" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#128" class="InductiveConstructor"
      >suc</a
      ><a name="8747"
      > </a
      ><a name="8748" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8698" class="Bound"
      >n</a
      ><a name="8749" class="Symbol"
      >)</a
      ><a name="8750"
      > </a
      ><a name="8751" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8700" class="Bound"
      >k</a
      ><a name="8752"
      >
  </a
      ><a name="8755" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8684" class="Function"
      >insert</a
      ><a name="8761"
      > </a
      ><a name="8762" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8762" class="Bound"
      >x</a
      ><a name="8763"
      > </a
      ><a name="8764" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7333" class="InductiveConstructor"
      >[]</a
      ><a name="8766"
      >       </a
      ><a name="8773" class="Symbol"
      >=</a
      ><a name="8774"
      > </a
      ><a name="8775" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8762" class="Bound"
      >x</a
      ><a name="8776"
      > </a
      ><a name="8777" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7358" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="8778"
      > </a
      ><a name="8779" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7333" class="InductiveConstructor"
      >[]</a
      ><a name="8781"
      > </a
      ><a name="8782" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7358" class="InductiveConstructor Operator"
      >by</a
      ><a name="8784"
      > </a
      ><a name="8785" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3909" class="InductiveConstructor"
      >&#8818;&#8868;</a
      ><a name="8787"
      >
  </a
      ><a name="8790" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8684" class="Function"
      >insert</a
      ><a name="8796"
      > </a
      ><a name="8797" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8797" class="Bound"
      >x</a
      ><a name="8798"
      > </a
      ><a name="8799" class="Symbol"
      >(</a
      ><a name="8800" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8800" class="Bound"
      >y</a
      ><a name="8801"
      > </a
      ><a name="8802" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7452" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="8803"
      > </a
      ><a name="8804" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8804" class="Bound"
      >xs</a
      ><a name="8806" class="Symbol"
      >)</a
      ><a name="8807"
      > </a
      ><a name="8808" class="Symbol"
      >=</a
      ><a name="8809"
      > </a
      ><a name="8810" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8800" class="Bound"
      >y</a
      ><a name="8811"
      > </a
      ><a name="8812" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7452" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="8813"
      > </a
      ><a name="8814" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8684" class="Function"
      >insert</a
      ><a name="8820"
      > </a
      ><a name="8821" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8797" class="Bound"
      >x</a
      ><a name="8822"
      > </a
      ><a name="8823" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8804" class="Bound"
      >xs</a
      ><a name="8825"
      >
  </a
      ><a name="8828" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8684" class="Function"
      >insert</a
      ><a name="8834"
      > </a
      ><a name="8835" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8835" class="Bound"
      >x</a
      ><a name="8836"
      > </a
      ><a name="8837" class="Symbol"
      >(</a
      ><a name="8838" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8838" class="Bound"
      >y</a
      ><a name="8839"
      > </a
      ><a name="8840" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7358" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="8841"
      > </a
      ><a name="8842" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8842" class="Bound"
      >xs</a
      ><a name="8844"
      > </a
      ><a name="8845" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7358" class="InductiveConstructor Operator"
      >by</a
      ><a name="8847"
      > </a
      ><a name="8848" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8848" class="Bound"
      >p</a
      ><a name="8849" class="Symbol"
      >)</a
      ><a name="8850"
      > </a
      ><a name="8851" class="Keyword"
      >with</a
      ><a name="8855"
      > </a
      ><a name="8856" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8835" class="Bound"
      >x</a
      ><a name="8857"
      > </a
      ><a name="8858" href="https://agda.github.io/agda-stdlib/Relation.Binary.html#8876" class="Function Operator"
      >&#8804;?</a
      ><a name="8860"
      > </a
      ><a name="8861" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8838" class="Bound"
      >y</a
      ><a name="8862"
      >
  </a
      ><a name="8865" class="Symbol"
      >...</a
      ><a name="8868"
      > </a
      ><a name="8869" class="Symbol"
      >|</a
      ><a name="8870"
      > </a
      ><a name="8871" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="8874"
      > </a
      ><a name="8875" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8875" class="Bound"
      >x&#8804;y</a
      ><a name="8878"
      > </a
      ><a name="8879" class="Symbol"
      >=</a
      ><a name="8880"
      > </a
      ><a name="8881" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8835" class="Bound"
      >x</a
      ><a name="8882"
      > </a
      ><a name="8883" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7358" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="8884"
      > </a
      ><a name="8885" class="Symbol"
      >(</a
      ><a name="8886" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8838" class="Bound"
      >y</a
      ><a name="8887"
      > </a
      ><a name="8888" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7358" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="8889"
      > </a
      ><a name="8890" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8842" class="Bound"
      >xs</a
      ><a name="8892"
      > </a
      ><a name="8893" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7358" class="InductiveConstructor Operator"
      >by</a
      ><a name="8895"
      > </a
      ><a name="8896" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8848" class="Bound"
      >p</a
      ><a name="8897" class="Symbol"
      >)</a
      ><a name="8898"
      > </a
      ><a name="8899" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7358" class="InductiveConstructor Operator"
      >by</a
      ><a name="8901"
      > </a
      ><a name="8902" class="Symbol"
      >(</a
      ><a name="8903" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3932" class="InductiveConstructor"
      >&#8804;-lift</a
      ><a name="8909"
      > </a
      ><a name="8910" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8875" class="Bound"
      >x&#8804;y</a
      ><a name="8913" class="Symbol"
      >)</a
      ><a name="8914"
      >
  </a
      ><a name="8917" class="Symbol"
      >...</a
      ><a name="8920"
      > </a
      ><a name="8921" class="Symbol"
      >|</a
      ><a name="8922"
      > </a
      ><a name="8923" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="8925"
      >  </a
      ><a name="8927" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8927" class="Bound"
      >x&#8816;y</a
      ><a name="8930"
      > </a
      ><a name="8931" class="Symbol"
      >=</a
      ><a name="8932"
      > </a
      ><a name="8933" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8838" class="Bound"
      >y</a
      ><a name="8934"
      > </a
      ><a name="8935" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7358" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="8936"
      > </a
      ><a name="8937" class="Symbol"
      >(</a
      ><a name="8938" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8684" class="Function"
      >insert</a
      ><a name="8944"
      > </a
      ><a name="8945" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8835" class="Bound"
      >x</a
      ><a name="8946"
      > </a
      ><a name="8947" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8842" class="Bound"
      >xs</a
      ><a name="8949" class="Symbol"
      >)</a
      ><a name="8950"
      > </a
      ><a name="8951" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7358" class="InductiveConstructor Operator"
      >by</a
      ><a name="8953"
      > </a
      ><a name="8954" class="Symbol"
      >(</a
      ><a name="8955" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4819" class="Function"
      >&#8851;-conserves-&#8818;</a
      ><a name="8968"
      > </a
      ><a name="8969" class="Symbol"
      >(</a
      ><a name="8970" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4230" class="Function"
      >&#8816;-lift</a
      ><a name="8976"
      > </a
      ><a name="8977" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8927" class="Bound"
      >x&#8816;y</a
      ><a name="8980" class="Symbol"
      >)</a
      ><a name="8981"
      > </a
      ><a name="8982" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8848" class="Bound"
      >p</a
      ><a name="8983" class="Symbol"
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
  <a name="9531" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#9531" class="Function"
      >insertsort</a
      ><a name="9541"
      > </a
      ><a name="9542" class="Symbol"
      >:</a
      ><a name="9543"
      > </a
      ><a name="9556" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7281" class="Datatype"
      >OVec</a
      ><a name="9560"
      > </a
      ><a name="9561" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#9547" class="Bound"
      >l</a
      ><a name="9562"
      > </a
      ><a name="9563" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#9549" class="Bound"
      >n</a
      ><a name="9564"
      > </a
      ><a name="9565" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#9551" class="Bound"
      >k</a
      ><a name="9566"
      > </a
      ><a name="9567" class="Symbol"
      >&#8594;</a
      ><a name="9568"
      > </a
      ><a name="9569" href="https://agda.github.io/agda-stdlib/Data.Product.html#823" class="Function"
      >&#8707;</a
      ><a name="9570"
      > </a
      ><a name="9571" class="Symbol"
      >(&#955;</a
      ><a name="9573"
      > </a
      ><a name="9574" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#9574" class="Bound"
      >l</a
      ><a name="9575"
      > </a
      ><a name="9576" class="Symbol"
      >&#8594;</a
      ><a name="9577"
      > </a
      ><a name="9578" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7281" class="Datatype"
      >OVec</a
      ><a name="9582"
      > </a
      ><a name="9583" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#9574" class="Bound"
      >l</a
      ><a name="9584"
      > </a
      ><a name="9585" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#9549" class="Bound"
      >n</a
      ><a name="9586"
      > </a
      ><a name="9587" class="Number"
      >0</a
      ><a name="9588" class="Symbol"
      >)</a
      ><a name="9589"
      >
  </a
      ><a name="9592" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#9531" class="Function"
      >insertsort</a
      ><a name="9602"
      > </a
      ><a name="9603" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7333" class="InductiveConstructor"
      >[]</a
      ><a name="9605"
      >            </a
      ><a name="9617" class="Symbol"
      >=</a
      ><a name="9618"
      > </a
      ><a name="9619" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3576" class="InductiveConstructor"
      >&#8868;</a
      ><a name="9620"
      > </a
      ><a name="9621" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="9622"
      > </a
      ><a name="9623" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7333" class="InductiveConstructor"
      >[]</a
      ><a name="9625"
      >
  </a
      ><a name="9628" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#9531" class="Function"
      >insertsort</a
      ><a name="9638"
      > </a
      ><a name="9639" class="Symbol"
      >(</a
      ><a name="9640" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#9640" class="Bound"
      >x</a
      ><a name="9641"
      > </a
      ><a name="9642" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7452" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="9643"
      > </a
      ><a name="9644" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#9644" class="Bound"
      >xs</a
      ><a name="9646" class="Symbol"
      >)</a
      ><a name="9647"
      >      </a
      ><a name="9653" class="Symbol"
      >=</a
      ><a name="9654"
      > </a
      ><a name="9655" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#9531" class="Function"
      >insertsort</a
      ><a name="9665"
      > </a
      ><a name="9666" class="Symbol"
      >(</a
      ><a name="9667" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#8684" class="Function"
      >insert</a
      ><a name="9673"
      > </a
      ><a name="9674" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#9640" class="Bound"
      >x</a
      ><a name="9675"
      > </a
      ><a name="9676" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#9644" class="Bound"
      >xs</a
      ><a name="9678" class="Symbol"
      >)</a
      ><a name="9679"
      >
  </a
      ><a name="9682" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#9531" class="Function"
      >insertsort</a
      ><a name="9692"
      > </a
      ><a name="9693" class="Symbol"
      >(</a
      ><a name="9694" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#9694" class="Bound"
      >x</a
      ><a name="9695"
      > </a
      ><a name="9696" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7358" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="9697"
      > </a
      ><a name="9698" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#9698" class="Bound"
      >xs</a
      ><a name="9700"
      > </a
      ><a name="9701" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7358" class="InductiveConstructor Operator"
      >by</a
      ><a name="9703"
      > </a
      ><a name="9704" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#9704" class="Bound"
      >p</a
      ><a name="9705" class="Symbol"
      >)</a
      ><a name="9706"
      > </a
      ><a name="9707" class="Symbol"
      >=</a
      ><a name="9708"
      > </a
      ><a name="9709" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3598" class="InductiveConstructor Operator"
      >&#10214;</a
      ><a name="9710"
      > </a
      ><a name="9711" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#9694" class="Bound"
      >x</a
      ><a name="9712"
      > </a
      ><a name="9713" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3598" class="InductiveConstructor Operator"
      >&#10215;</a
      ><a name="9714"
      > </a
      ><a name="9715" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="9716"
      > </a
      ><a name="9717" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#9694" class="Bound"
      >x</a
      ><a name="9718"
      > </a
      ><a name="9719" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7358" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="9720"
      > </a
      ><a name="9721" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#9698" class="Bound"
      >xs</a
      ><a name="9723"
      > </a
      ><a name="9724" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7358" class="InductiveConstructor Operator"
      >by</a
      ><a name="9726"
      > </a
      ><a name="9727" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#9704" class="Bound"
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
  <a name="11111" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11111" class="Function"
      >bubble</a
      ><a name="11117"
      > </a
      ><a name="11118" class="Symbol"
      >:</a
      ><a name="11119"
      > </a
      ><a name="11130" class="Symbol"
      >(</a
      ><a name="11131" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11131" class="Bound"
      >x</a
      ><a name="11132"
      > </a
      ><a name="11133" class="Symbol"
      >:</a
      ><a name="11134"
      > </a
      ><a name="11135" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3188" class="Function"
      >A</a
      ><a name="11136" class="Symbol"
      >)</a
      ><a name="11137"
      > </a
      ><a name="11138" class="Symbol"
      >&#8594;</a
      ><a name="11139"
      > </a
      ><a name="11140" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7281" class="Datatype"
      >OVec</a
      ><a name="11144"
      > </a
      ><a name="11145" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11123" class="Bound"
      >l</a
      ><a name="11146"
      > </a
      ><a name="11147" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11125" class="Bound"
      >n</a
      ><a name="11148"
      > </a
      ><a name="11149" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11127" class="Bound"
      >k</a
      ><a name="11150"
      > </a
      ><a name="11151" class="Symbol"
      >&#8594;</a
      ><a name="11152"
      > </a
      ><a name="11153" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7281" class="Datatype"
      >OVec</a
      ><a name="11157"
      > </a
      ><a name="11158" class="Symbol"
      >(</a
      ><a name="11159" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3598" class="InductiveConstructor Operator"
      >&#10214;</a
      ><a name="11160"
      > </a
      ><a name="11161" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11131" class="Bound"
      >x</a
      ><a name="11162"
      > </a
      ><a name="11163" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3598" class="InductiveConstructor Operator"
      >&#10215;</a
      ><a name="11164"
      > </a
      ><a name="11165" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4653" class="Function Operator"
      >&#8851;</a
      ><a name="11166"
      > </a
      ><a name="11167" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11123" class="Bound"
      >l</a
      ><a name="11168" class="Symbol"
      >)</a
      ><a name="11169"
      > </a
      ><a name="11170" class="Symbol"
      >(</a
      ><a name="11171" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#128" class="InductiveConstructor"
      >suc</a
      ><a name="11174"
      > </a
      ><a name="11175" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11125" class="Bound"
      >n</a
      ><a name="11176" class="Symbol"
      >)</a
      ><a name="11177"
      > </a
      ><a name="11178" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11127" class="Bound"
      >k</a
      ><a name="11179"
      >
  </a
      ><a name="11182" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11111" class="Function"
      >bubble</a
      ><a name="11188"
      > </a
      ><a name="11189" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11189" class="Bound"
      >x</a
      ><a name="11190"
      > </a
      ><a name="11191" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7333" class="InductiveConstructor"
      >[]</a
      ><a name="11193"
      >            </a
      ><a name="11205" class="Symbol"
      >=</a
      ><a name="11206"
      > </a
      ><a name="11207" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11189" class="Bound"
      >x</a
      ><a name="11208"
      > </a
      ><a name="11209" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7358" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="11210"
      > </a
      ><a name="11211" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7333" class="InductiveConstructor"
      >[]</a
      ><a name="11213"
      > </a
      ><a name="11214" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7358" class="InductiveConstructor Operator"
      >by</a
      ><a name="11216"
      > </a
      ><a name="11217" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3909" class="InductiveConstructor"
      >&#8818;&#8868;</a
      ><a name="11219"
      >
  </a
      ><a name="11222" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11111" class="Function"
      >bubble</a
      ><a name="11228"
      > </a
      ><a name="11229" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11229" class="Bound"
      >x</a
      ><a name="11230"
      > </a
      ><a name="11231" class="Symbol"
      >(</a
      ><a name="11232" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11232" class="Bound"
      >y</a
      ><a name="11233"
      > </a
      ><a name="11234" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7452" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="11235"
      > </a
      ><a name="11236" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11236" class="Bound"
      >xs</a
      ><a name="11238" class="Symbol"
      >)</a
      ><a name="11239"
      >      </a
      ><a name="11245" class="Keyword"
      >with</a
      ><a name="11249"
      > </a
      ><a name="11250" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11229" class="Bound"
      >x</a
      ><a name="11251"
      > </a
      ><a name="11252" href="https://agda.github.io/agda-stdlib/Relation.Binary.html#8876" class="Function Operator"
      >&#8804;?</a
      ><a name="11254"
      > </a
      ><a name="11255" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11232" class="Bound"
      >y</a
      ><a name="11256"
      >
  </a
      ><a name="11259" class="Symbol"
      >...</a
      ><a name="11262"
      > </a
      ><a name="11263" class="Symbol"
      >|</a
      ><a name="11264"
      > </a
      ><a name="11265" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="11267"
      >  </a
      ><a name="11269" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11269" class="Bound"
      >x&#8816;y</a
      ><a name="11272"
      > </a
      ><a name="11273" class="Symbol"
      >=</a
      ><a name="11274"
      > </a
      ><a name="11275" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11232" class="Bound"
      >y</a
      ><a name="11276"
      > </a
      ><a name="11277" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7452" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="11278"
      > </a
      ><a name="11279" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11111" class="Function"
      >bubble</a
      ><a name="11285"
      > </a
      ><a name="11286" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11229" class="Bound"
      >x</a
      ><a name="11287"
      > </a
      ><a name="11288" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11236" class="Bound"
      >xs</a
      ><a name="11290"
      >
  </a
      ><a name="11293" class="Symbol"
      >...</a
      ><a name="11296"
      > </a
      ><a name="11297" class="Symbol"
      >|</a
      ><a name="11298"
      > </a
      ><a name="11299" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="11302"
      > </a
      ><a name="11303" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11303" class="Bound"
      >x&#8804;y</a
      ><a name="11306"
      > </a
      ><a name="11307" class="Symbol"
      >=</a
      ><a name="11308"
      > </a
      ><a name="11309" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11229" class="Bound"
      >x</a
      ><a name="11310"
      > </a
      ><a name="11311" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7452" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="11312"
      > </a
      ><a name="11313" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11111" class="Function"
      >bubble</a
      ><a name="11319"
      > </a
      ><a name="11320" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11232" class="Bound"
      >y</a
      ><a name="11321"
      > </a
      ><a name="11322" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11236" class="Bound"
      >xs</a
      ><a name="11324"
      >
  </a
      ><a name="11327" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11111" class="Function"
      >bubble</a
      ><a name="11333"
      > </a
      ><a name="11334" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11334" class="Bound"
      >x</a
      ><a name="11335"
      > </a
      ><a name="11336" class="Symbol"
      >(</a
      ><a name="11337" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11337" class="Bound"
      >y</a
      ><a name="11338"
      > </a
      ><a name="11339" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7358" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="11340"
      > </a
      ><a name="11341" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11341" class="Bound"
      >xs</a
      ><a name="11343"
      > </a
      ><a name="11344" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7358" class="InductiveConstructor Operator"
      >by</a
      ><a name="11346"
      > </a
      ><a name="11347" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11347" class="Bound"
      >p</a
      ><a name="11348" class="Symbol"
      >)</a
      ><a name="11349"
      > </a
      ><a name="11350" class="Keyword"
      >with</a
      ><a name="11354"
      > </a
      ><a name="11355" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11334" class="Bound"
      >x</a
      ><a name="11356"
      > </a
      ><a name="11357" href="https://agda.github.io/agda-stdlib/Relation.Binary.html#8876" class="Function Operator"
      >&#8804;?</a
      ><a name="11359"
      > </a
      ><a name="11360" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11337" class="Bound"
      >y</a
      ><a name="11361"
      >
  </a
      ><a name="11364" class="Symbol"
      >...</a
      ><a name="11367"
      > </a
      ><a name="11368" class="Symbol"
      >|</a
      ><a name="11369"
      > </a
      ><a name="11370" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#547" class="InductiveConstructor"
      >no</a
      ><a name="11372"
      >  </a
      ><a name="11374" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11374" class="Bound"
      >x&#8816;y</a
      ><a name="11377"
      > </a
      ><a name="11378" class="Symbol"
      >=</a
      ><a name="11379"
      > </a
      ><a name="11380" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11337" class="Bound"
      >y</a
      ><a name="11381"
      > </a
      ><a name="11382" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7358" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="11383"
      > </a
      ><a name="11384" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11111" class="Function"
      >bubble</a
      ><a name="11390"
      > </a
      ><a name="11391" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11334" class="Bound"
      >x</a
      ><a name="11392"
      > </a
      ><a name="11393" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11341" class="Bound"
      >xs</a
      ><a name="11395"
      > </a
      ><a name="11396" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7358" class="InductiveConstructor Operator"
      >by</a
      ><a name="11398"
      > </a
      ><a name="11399" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4819" class="Function"
      >&#8851;-conserves-&#8818;</a
      ><a name="11412"
      > </a
      ><a name="11413" class="Symbol"
      >(</a
      ><a name="11414" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4230" class="Function"
      >&#8816;-lift</a
      ><a name="11420"
      > </a
      ><a name="11421" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11374" class="Bound"
      >x&#8816;y</a
      ><a name="11424" class="Symbol"
      >)</a
      ><a name="11425"
      > </a
      ><a name="11426" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11347" class="Bound"
      >p</a
      ><a name="11427"
      >
  </a
      ><a name="11430" class="Symbol"
      >...</a
      ><a name="11433"
      > </a
      ><a name="11434" class="Symbol"
      >|</a
      ><a name="11435"
      > </a
      ><a name="11436" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#520" class="InductiveConstructor"
      >yes</a
      ><a name="11439"
      > </a
      ><a name="11440" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11440" class="Bound"
      >x&#8804;y</a
      ><a name="11443"
      > </a
      ><a name="11444" class="Symbol"
      >=</a
      ><a name="11445"
      > </a
      ><a name="11446" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11334" class="Bound"
      >x</a
      ><a name="11447"
      > </a
      ><a name="11448" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7358" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="11449"
      > </a
      ><a name="11450" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11111" class="Function"
      >bubble</a
      ><a name="11456"
      > </a
      ><a name="11457" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11337" class="Bound"
      >y</a
      ><a name="11458"
      > </a
      ><a name="11459" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11341" class="Bound"
      >xs</a
      ><a name="11461"
      > </a
      ><a name="11462" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7358" class="InductiveConstructor Operator"
      >by</a
      ><a name="11464"
      > </a
      ><a name="11465" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#4819" class="Function"
      >&#8851;-conserves-&#8818;</a
      ><a name="11478"
      > </a
      ><a name="11479" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11515" class="Function"
      >x&#8818;y</a
      ><a name="11482"
      > </a
      ><a name="11483" class="Symbol"
      >(</a
      ><a name="11484" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11857" class="Function"
      >&#8818;-trans</a
      ><a name="11491"
      > </a
      ><a name="11492" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11515" class="Function"
      >x&#8818;y</a
      ><a name="11495"
      > </a
      ><a name="11496" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11347" class="Bound"
      >p</a
      ><a name="11497" class="Symbol"
      >)</a
      ><a name="11498"
      >
    </a
      ><a name="11503" class="Keyword"
      >where</a
      ><a name="11508"
      >
      </a
      ><a name="11515" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11515" class="Function"
      >x&#8818;y</a
      ><a name="11518"
      > </a
      ><a name="11519" class="Symbol"
      >=</a
      ><a name="11520"
      > </a
      ><a name="11521" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3932" class="InductiveConstructor"
      >&#8804;-lift</a
      ><a name="11527"
      > </a
      ><a name="11528" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11440" class="Bound"
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
      <a name="11857" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11857" class="Function"
      >&#8818;-trans</a
      ><a name="11864"
      > </a
      ><a name="11865" class="Symbol"
      >:</a
      ><a name="11866"
      > </a
      ><a name="11879" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11870" class="Bound"
      >x</a
      ><a name="11880"
      > </a
      ><a name="11881" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3854" class="Datatype Operator"
      >&#8818;</a
      ><a name="11882"
      > </a
      ><a name="11883" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11872" class="Bound"
      >y</a
      ><a name="11884"
      > </a
      ><a name="11885" class="Symbol"
      >&#8594;</a
      ><a name="11886"
      > </a
      ><a name="11887" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11872" class="Bound"
      >y</a
      ><a name="11888"
      > </a
      ><a name="11889" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3854" class="Datatype Operator"
      >&#8818;</a
      ><a name="11890"
      > </a
      ><a name="11891" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11874" class="Bound"
      >z</a
      ><a name="11892"
      > </a
      ><a name="11893" class="Symbol"
      >&#8594;</a
      ><a name="11894"
      > </a
      ><a name="11895" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11870" class="Bound"
      >x</a
      ><a name="11896"
      > </a
      ><a name="11897" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3854" class="Datatype Operator"
      >&#8818;</a
      ><a name="11898"
      > </a
      ><a name="11899" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11874" class="Bound"
      >z</a
      ><a name="11900"
      >
      </a
      ><a name="11907" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11857" class="Function"
      >&#8818;-trans</a
      ><a name="11914"
      >  </a
      ><a name="11916" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3886" class="InductiveConstructor"
      >&#8869;&#8818;</a
      ><a name="11918"
      >         </a
      ><a name="11927" class="Symbol"
      >_</a
      ><a name="11928"
      >         </a
      ><a name="11937" class="Symbol"
      >=</a
      ><a name="11938"
      > </a
      ><a name="11939" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3886" class="InductiveConstructor"
      >&#8869;&#8818;</a
      ><a name="11941"
      >
      </a
      ><a name="11948" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11857" class="Function"
      >&#8818;-trans</a
      ><a name="11955"
      >  </a
      ><a name="11957" class="Symbol"
      >_</a
      ><a name="11958"
      >          </a
      ><a name="11968" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3909" class="InductiveConstructor"
      >&#8818;&#8868;</a
      ><a name="11970"
      >        </a
      ><a name="11978" class="Symbol"
      >=</a
      ><a name="11979"
      > </a
      ><a name="11980" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3909" class="InductiveConstructor"
      >&#8818;&#8868;</a
      ><a name="11982"
      >
      </a
      ><a name="11989" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11857" class="Function"
      >&#8818;-trans</a
      ><a name="11996"
      > </a
      ><a name="11997" class="Symbol"
      >(</a
      ><a name="11998" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3932" class="InductiveConstructor"
      >&#8804;-lift</a
      ><a name="12004"
      > </a
      ><a name="12005" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12005" class="Bound"
      >p</a
      ><a name="12006" class="Symbol"
      >)</a
      ><a name="12007"
      > </a
      ><a name="12008" class="Symbol"
      >(</a
      ><a name="12009" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3932" class="InductiveConstructor"
      >&#8804;-lift</a
      ><a name="12015"
      > </a
      ><a name="12016" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12016" class="Bound"
      >q</a
      ><a name="12017" class="Symbol"
      >)</a
      ><a name="12018"
      > </a
      ><a name="12019" class="Symbol"
      >=</a
      ><a name="12020"
      > </a
      ><a name="12021" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3932" class="InductiveConstructor"
      >&#8804;-lift</a
      ><a name="12027"
      > </a
      ><a name="12028" class="Symbol"
      >(</a
      ><a name="12029" href="https://agda.github.io/agda-stdlib/Relation.Binary.html#1190" class="Function"
      >&#8804;-trans</a
      ><a name="12036"
      > </a
      ><a name="12037" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12005" class="Bound"
      >p</a
      ><a name="12038"
      > </a
      ><a name="12039" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12016" class="Bound"
      >q</a
      ><a name="12040" class="Symbol"
      >)</a
      >
{% endraw %}
</pre>

At any rate, once we have our "bubble" function, the implementation of
the sorting algorithm is trivial---and exactly identical to the
definition of insertion sort!

<pre class="Agda">
{% raw %}
  <a name="12235" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12235" class="Function"
      >bubblesort</a
      ><a name="12245"
      > </a
      ><a name="12246" class="Symbol"
      >:</a
      ><a name="12247"
      > </a
      ><a name="12260" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7281" class="Datatype"
      >OVec</a
      ><a name="12264"
      > </a
      ><a name="12265" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12251" class="Bound"
      >l</a
      ><a name="12266"
      > </a
      ><a name="12267" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12253" class="Bound"
      >n</a
      ><a name="12268"
      > </a
      ><a name="12269" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12255" class="Bound"
      >k</a
      ><a name="12270"
      > </a
      ><a name="12271" class="Symbol"
      >&#8594;</a
      ><a name="12272"
      > </a
      ><a name="12273" href="https://agda.github.io/agda-stdlib/Data.Product.html#823" class="Function"
      >&#8707;</a
      ><a name="12274"
      > </a
      ><a name="12275" class="Symbol"
      >(&#955;</a
      ><a name="12277"
      > </a
      ><a name="12278" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12278" class="Bound"
      >l</a
      ><a name="12279"
      > </a
      ><a name="12280" class="Symbol"
      >&#8594;</a
      ><a name="12281"
      > </a
      ><a name="12282" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7281" class="Datatype"
      >OVec</a
      ><a name="12286"
      > </a
      ><a name="12287" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12278" class="Bound"
      >l</a
      ><a name="12288"
      > </a
      ><a name="12289" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12253" class="Bound"
      >n</a
      ><a name="12290"
      > </a
      ><a name="12291" class="Number"
      >0</a
      ><a name="12292" class="Symbol"
      >)</a
      ><a name="12293"
      >
  </a
      ><a name="12296" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12235" class="Function"
      >bubblesort</a
      ><a name="12306"
      > </a
      ><a name="12307" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7333" class="InductiveConstructor"
      >[]</a
      ><a name="12309"
      >            </a
      ><a name="12321" class="Symbol"
      >=</a
      ><a name="12322"
      > </a
      ><a name="12323" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3576" class="InductiveConstructor"
      >&#8868;</a
      ><a name="12324"
      > </a
      ><a name="12325" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="12326"
      > </a
      ><a name="12327" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7333" class="InductiveConstructor"
      >[]</a
      ><a name="12329"
      >
  </a
      ><a name="12332" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12235" class="Function"
      >bubblesort</a
      ><a name="12342"
      > </a
      ><a name="12343" class="Symbol"
      >(</a
      ><a name="12344" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12344" class="Bound"
      >x</a
      ><a name="12345"
      > </a
      ><a name="12346" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7452" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12347"
      > </a
      ><a name="12348" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12348" class="Bound"
      >xs</a
      ><a name="12350" class="Symbol"
      >)</a
      ><a name="12351"
      >      </a
      ><a name="12357" class="Symbol"
      >=</a
      ><a name="12358"
      > </a
      ><a name="12359" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12235" class="Function"
      >bubblesort</a
      ><a name="12369"
      > </a
      ><a name="12370" class="Symbol"
      >(</a
      ><a name="12371" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#11111" class="Function"
      >bubble</a
      ><a name="12377"
      > </a
      ><a name="12378" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12344" class="Bound"
      >x</a
      ><a name="12379"
      > </a
      ><a name="12380" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12348" class="Bound"
      >xs</a
      ><a name="12382" class="Symbol"
      >)</a
      ><a name="12383"
      >
  </a
      ><a name="12386" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12235" class="Function"
      >bubblesort</a
      ><a name="12396"
      > </a
      ><a name="12397" class="Symbol"
      >(</a
      ><a name="12398" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12398" class="Bound"
      >x</a
      ><a name="12399"
      > </a
      ><a name="12400" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7358" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12401"
      > </a
      ><a name="12402" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12402" class="Bound"
      >xs</a
      ><a name="12404"
      > </a
      ><a name="12405" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7358" class="InductiveConstructor Operator"
      >by</a
      ><a name="12407"
      > </a
      ><a name="12408" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12408" class="Bound"
      >p</a
      ><a name="12409" class="Symbol"
      >)</a
      ><a name="12410"
      > </a
      ><a name="12411" class="Symbol"
      >=</a
      ><a name="12412"
      > </a
      ><a name="12413" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3598" class="InductiveConstructor Operator"
      >&#10214;</a
      ><a name="12414"
      > </a
      ><a name="12415" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12398" class="Bound"
      >x</a
      ><a name="12416"
      > </a
      ><a name="12417" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#3598" class="InductiveConstructor Operator"
      >&#10215;</a
      ><a name="12418"
      > </a
      ><a name="12419" href="https://agda.github.io/agda-stdlib/Data.Product.html#509" class="InductiveConstructor Operator"
      >,</a
      ><a name="12420"
      > </a
      ><a name="12421" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12398" class="Bound"
      >x</a
      ><a name="12422"
      > </a
      ><a name="12423" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7358" class="InductiveConstructor Operator"
      >&#8759;</a
      ><a name="12424"
      > </a
      ><a name="12425" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12402" class="Bound"
      >xs</a
      ><a name="12427"
      > </a
      ><a name="12428" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#7358" class="InductiveConstructor Operator"
      >by</a
      ><a name="12430"
      > </a
      ><a name="12431" href="{% endraw %}{% post_url 2016-03-01-insertion-sort-in-agda %}{% raw %}#12408" class="Bound"
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

