---
title        : "Linear Types for Erlang OTP (1)"
date         : 2016-10-25 12:00:00
categories   : []
tags         : [draft, agda, erlang, process calculus]
extra-script : agda-extra-script.html
extra-style  : agda-extra-style.html
---

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

``` erlang
module(name_server).
export([init/0, add/2, where_is/1, handle/2]).
import(server1, [rpc/2]).

%% client routines
add(Name, Place) -> rpc(name_server, {add, Name, Place}).
where_is(Name)   -> rpc(name_server, {where_is, Name}).

%% callback routines
init() -> dict::new().

handle({add, Name, Place}, Dict) -> {ok, dict:store(Name, Place, Dict)};
handle({where_is, Name}, Dict)    -> {dict:find(Name, Dict), Dict}.
```

``` erlang
1> server1:start(name_server, name_server).
true
2> name_server:add(joe, "at home").
ok
3> name_server:where_is(joe).
{ok, "at home"}
```

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

``` haskell
type Maybe(A) = +{nothing:1, just:A}.
type Dict     = ~Name || Maybe(Place).
```

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

``` haskell
type  Handler =
      &{ add      : ~(Name * !Place * !Dict) || (1 * !Dict)
       , where_is : ~(Name * !Dict) || (!Maybe(Place) * !Dict)
       }.
```

``` haskell
check Handler(h) |- h : !Handler.
def   Handler(h) = !h(h).case h
      { add      : h(d).d(p).p(n).h[x].( x[].0 | Store(d,n,p,h) )
      ; where_is : h(d).d(n).h[p].( Find(d,n,p) | h<->d )
      }.
```

``` haskell
type  Server = nu X.
      &{ halt     : 1
       , add      : (!Name * !Place) -o (1 * X)
       , where_is : !Name -o (!Maybe(Place) * X)
       }.
```

``` haskell
check Loop(d,h,s) |- d : ~!Dict, h : ~!Handler, s : Server.
def   Loop(d,h,s) =
      corec s(d).case s
      { halt     : s[].0
      ; add      : s(p).p(n).
                   ?h[h].h/add.h[h].(h[h].(h[h].(?n[n].h<->n|h<->p)|h<->d)|
                   h(r).s[s].(s<->r|s<->h))
      ; where_is : s(n).
                   ?h[h].h/where_is.h[h].(
                   h[h].(?n[n].h<->n|h<->d)|
                   h(r).s[s].(s<->r|s<->h))
      }.
```


``` haskell
check   new [d:!Dict]    ( Empty(d)    |
        new [h:!Handler] ( Handler(h)  |
        new [s:Server]   ( Loop(d,h,s) |
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
            s/where_is.
            s[s].( !s(s).s/joe.s[].0 |
            s(r).
        rec s.
            s/halt.
            s().
        p<->r
        ) ) ) ) ) ) |- p : !Maybe(Place).
```

``` haskell
check   !p(p).p/just.p/at_home.p[].0
        |- p : !Maybe(Place).
```

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="4859" class="Keyword"
      >open</a
      ><a name="4863"
      > </a
      ><a name="4864" class="Keyword"
      >import</a
      ><a name="4870"
      > </a
      ><a name="4871" href="https://agda.github.io/agda-stdlib/Level.html#1" class="Module"
      >Level</a
      ><a name="4876"
      > </a
      ><a name="4877" class="Keyword"
      >using</a
      ><a name="4882"
      > </a
      ><a name="4883" class="Symbol"
      >(</a
      ><a name="4884" href="Agda.Primitive.html#596" class="Primitive"
      >suc</a
      ><a name="4887" class="Symbol"
      >)</a
      ><a name="4888"
      >

</a
      ><a name="4890" class="Keyword"
      >module</a
      ><a name="4896"
      > </a
      ><a name="4897" href="linear-types-for-erlang-otp.html#1" class="Module"
      >linear-types-for-erlang-otp</a
      ><a name="4924"
      > </a
      ><a name="4925" class="Keyword"
      >where</a
      >
{% endraw %}</pre>
</div>

<pre class="Agda">{% raw %}
<a name="4963" class="Keyword"
      >data</a
      ><a name="4967"
      > </a
      ><a name="4968" href="linear-types-for-erlang-otp.html#4968" class="Datatype"
      >Pol</a
      ><a name="4971"
      > </a
      ><a name="4972" class="Symbol"
      >:</a
      ><a name="4973"
      > </a
      ><a name="4974" class="PrimitiveType"
      >Set</a
      ><a name="4977"
      > </a
      ><a name="4978" class="Keyword"
      >where</a
      ><a name="4983"
      >
  </a
      ><a name="4986" href="linear-types-for-erlang-otp.html#4986" class="InductiveConstructor"
      >pos</a
      ><a name="4989"
      > </a
      ><a name="4990" class="Symbol"
      >:</a
      ><a name="4991"
      > </a
      ><a name="4992" href="linear-types-for-erlang-otp.html#4968" class="Datatype"
      >Pol</a
      ><a name="4995"
      >
  </a
      ><a name="4998" href="linear-types-for-erlang-otp.html#4998" class="InductiveConstructor"
      >neg</a
      ><a name="5001"
      > </a
      ><a name="5002" class="Symbol"
      >:</a
      ><a name="5003"
      > </a
      ><a name="5004" href="linear-types-for-erlang-otp.html#4968" class="Datatype"
      >Pol</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="5054" class="Keyword"
      >infix</a
      ><a name="5059"
      >  </a
      ><a name="5061" class="Number"
      >9</a
      ><a name="5062"
      > +_
</a
      ><a name="5066" class="Keyword"
      >infix</a
      ><a name="5071"
      >  </a
      ><a name="5073" class="Number"
      >9</a
      ><a name="5074"
      > -_
</a
      ><a name="5078" class="Keyword"
      >infix</a
      ><a name="5083"
      >  </a
      ><a name="5085" class="Number"
      >8</a
      ><a name="5086"
      > ~_
</a
      ><a name="5090" class="Keyword"
      >infix</a
      ><a name="5095"
      >  </a
      ><a name="5097" class="Number"
      >7</a
      ><a name="5098"
      > &#161;_
</a
      ><a name="5102" class="Keyword"
      >infix</a
      ><a name="5107"
      >  </a
      ><a name="5109" class="Number"
      >7</a
      ><a name="5110"
      > &#191;_
</a
      ><a name="5114" class="Keyword"
      >infixl</a
      ><a name="5120"
      > </a
      ><a name="5121" class="Number"
      >6</a
      ><a name="5122"
      > _&amp;_
</a
      ><a name="5127" class="Keyword"
      >infixl</a
      ><a name="5133"
      > </a
      ><a name="5134" class="Number"
      >6</a
      ><a name="5135"
      > _&#8523;_
</a
      ><a name="5140" class="Keyword"
      >infixl</a
      ><a name="5146"
      > </a
      ><a name="5147" class="Number"
      >6</a
      ><a name="5148"
      > _&#8853;_
</a
      ><a name="5153" class="Keyword"
      >infixl</a
      ><a name="5159"
      > </a
      ><a name="5160" class="Number"
      >6</a
      ><a name="5161"
      > _&#8855;_
</a
      ><a name="5166" class="Keyword"
      >infixr</a
      ><a name="5172"
      > </a
      ><a name="5173" class="Number"
      >5</a
      ><a name="5174"
      > _&#8888;_
</a
      ><a name="5179" class="Keyword"
      >infix</a
      ><a name="5184"
      >  </a
      ><a name="5186" class="Number"
      >4</a
      ><a name="5187"
      > &#956;_
</a
      ><a name="5191" class="Keyword"
      >infix</a
      ><a name="5196"
      >  </a
      ><a name="5198" class="Number"
      >4</a
      >
{% endraw %}</pre>
</div>

<pre class="Agda">{% raw %}
<a name="5235" class="Keyword"
      >data</a
      ><a name="5239"
      > </a
      ><a name="5240" href="linear-types-for-erlang-otp.html#5240" class="Datatype"
      >Type</a
      ><a name="5244"
      > </a
      ><a name="5245" class="Symbol"
      >:</a
      ><a name="5246"
      > </a
      ><a name="5247" class="PrimitiveType"
      >Set&#8321;</a
      ><a name="5251"
      > </a
      ><a name="5252" class="Keyword"
      >where</a
      ><a name="5257"
      >
  </a
      ><a name="5260" href="linear-types-for-erlang-otp.html#5260" class="InductiveConstructor"
      >el</a
      ><a name="5262"
      >      </a
      ><a name="5268" class="Symbol"
      >:</a
      ><a name="5269"
      > </a
      ><a name="5270" href="linear-types-for-erlang-otp.html#4968" class="Datatype"
      >Pol</a
      ><a name="5273"
      > </a
      ><a name="5274" class="Symbol"
      >&#8594;</a
      ><a name="5275"
      > </a
      ><a name="5276" class="PrimitiveType"
      >Set</a
      ><a name="5279"
      > </a
      ><a name="5280" class="Symbol"
      >&#8594;</a
      ><a name="5281"
      > </a
      ><a name="5282" href="linear-types-for-erlang-otp.html#5240" class="Datatype"
      >Type</a
      ><a name="5286"
      >
  </a
      ><a name="5289" href="linear-types-for-erlang-otp.html#5289" class="InductiveConstructor"
      >&#8868;</a
      ><a name="5290"
      >   </a
      ><a name="5293" href="linear-types-for-erlang-otp.html#5293" class="InductiveConstructor"
      >&#8869;</a
      ><a name="5294"
      >   </a
      ><a name="5297" class="Symbol"
      >:</a
      ><a name="5298"
      > </a
      ><a name="5299" href="linear-types-for-erlang-otp.html#5240" class="Datatype"
      >Type</a
      ><a name="5303"
      >
  </a
      ><a name="5306" href="linear-types-for-erlang-otp.html#5306" class="InductiveConstructor"
      >&#120792;</a
      ><a name="5307"
      >   </a
      ><a name="5310" href="linear-types-for-erlang-otp.html#5310" class="InductiveConstructor"
      >&#120793;</a
      ><a name="5311"
      >   </a
      ><a name="5314" class="Symbol"
      >:</a
      ><a name="5315"
      > </a
      ><a name="5316" href="linear-types-for-erlang-otp.html#5240" class="Datatype"
      >Type</a
      ><a name="5320"
      >
  </a
      ><a name="5323" href="linear-types-for-erlang-otp.html#5323" class="InductiveConstructor Operator"
      >_&amp;_</a
      ><a name="5326"
      > </a
      ><a name="5327" href="linear-types-for-erlang-otp.html#5327" class="InductiveConstructor Operator"
      >_&#8523;_</a
      ><a name="5330"
      > </a
      ><a name="5331" class="Symbol"
      >:</a
      ><a name="5332"
      > </a
      ><a name="5333" href="linear-types-for-erlang-otp.html#5240" class="Datatype"
      >Type</a
      ><a name="5337"
      > </a
      ><a name="5338" class="Symbol"
      >&#8594;</a
      ><a name="5339"
      > </a
      ><a name="5340" href="linear-types-for-erlang-otp.html#5240" class="Datatype"
      >Type</a
      ><a name="5344"
      > </a
      ><a name="5345" class="Symbol"
      >&#8594;</a
      ><a name="5346"
      > </a
      ><a name="5347" href="linear-types-for-erlang-otp.html#5240" class="Datatype"
      >Type</a
      ><a name="5351"
      >
  </a
      ><a name="5354" href="linear-types-for-erlang-otp.html#5354" class="InductiveConstructor Operator"
      >_&#8853;_</a
      ><a name="5357"
      > </a
      ><a name="5358" href="linear-types-for-erlang-otp.html#5358" class="InductiveConstructor Operator"
      >_&#8855;_</a
      ><a name="5361"
      > </a
      ><a name="5362" class="Symbol"
      >:</a
      ><a name="5363"
      > </a
      ><a name="5364" href="linear-types-for-erlang-otp.html#5240" class="Datatype"
      >Type</a
      ><a name="5368"
      > </a
      ><a name="5369" class="Symbol"
      >&#8594;</a
      ><a name="5370"
      > </a
      ><a name="5371" href="linear-types-for-erlang-otp.html#5240" class="Datatype"
      >Type</a
      ><a name="5375"
      > </a
      ><a name="5376" class="Symbol"
      >&#8594;</a
      ><a name="5377"
      > </a
      ><a name="5378" href="linear-types-for-erlang-otp.html#5240" class="Datatype"
      >Type</a
      ><a name="5382"
      >
  </a
      ><a name="5385" href="linear-types-for-erlang-otp.html#5385" class="InductiveConstructor Operator"
      >&#161;_</a
      ><a name="5387"
      >  </a
      ><a name="5389" href="linear-types-for-erlang-otp.html#5389" class="InductiveConstructor Operator"
      >&#191;_</a
      ><a name="5391"
      >  </a
      ><a name="5393" class="Symbol"
      >:</a
      ><a name="5394"
      > </a
      ><a name="5395" href="linear-types-for-erlang-otp.html#5240" class="Datatype"
      >Type</a
      ><a name="5399"
      > </a
      ><a name="5400" class="Symbol"
      >-&gt;</a
      ><a name="5402"
      > </a
      ><a name="5403" href="linear-types-for-erlang-otp.html#5240" class="Datatype"
      >Type</a
      ><a name="5407"
      >
  </a
      ><a name="5410" href="linear-types-for-erlang-otp.html#5410" class="InductiveConstructor Operator"
      >&#956;_</a
      ><a name="5412"
      >  </a
      ><a name="5414" href="linear-types-for-erlang-otp.html#5414" class="InductiveConstructor Operator"
      >&#957;_</a
      ><a name="5416"
      >  </a
      ><a name="5418" class="Symbol"
      >:</a
      ><a name="5419"
      > </a
      ><a name="5420" class="Symbol"
      >(</a
      ><a name="5421" class="PrimitiveType"
      >Set</a
      ><a name="5424"
      > </a
      ><a name="5425" class="Symbol"
      >&#8594;</a
      ><a name="5426"
      > </a
      ><a name="5427" href="linear-types-for-erlang-otp.html#5240" class="Datatype"
      >Type</a
      ><a name="5431" class="Symbol"
      >)</a
      ><a name="5432"
      > </a
      ><a name="5433" class="Symbol"
      >&#8594;</a
      ><a name="5434"
      > </a
      ><a name="5435" href="linear-types-for-erlang-otp.html#5240" class="Datatype"
      >Type</a
      >
{% endraw %}</pre>

<div class="foldable">
<pre class="Agda">{% raw %}
<a name="5488" class="Keyword"
      >pattern</a
      ><a name="5495"
      > </a
      ><a name="5496" href="linear-types-for-erlang-otp.html#5496" class="InductiveConstructor Operator"
      >+_</a
      ><a name="5498"
      > </a
      ><a name="5499" href="linear-types-for-erlang-otp.html#5510" class="Bound"
      >A</a
      ><a name="5500"
      > </a
      ><a name="5501" class="Symbol"
      >=</a
      ><a name="5502"
      > </a
      ><a name="5503" href="linear-types-for-erlang-otp.html#5260" class="InductiveConstructor"
      >el</a
      ><a name="5505"
      > </a
      ><a name="5506" href="linear-types-for-erlang-otp.html#4986" class="InductiveConstructor"
      >pos</a
      ><a name="5509"
      > </a
      ><a name="5510" href="linear-types-for-erlang-otp.html#5510" class="Bound"
      >A</a
      ><a name="5511"
      >
</a
      ><a name="5512" class="Keyword"
      >pattern</a
      ><a name="5519"
      > </a
      ><a name="5520" href="linear-types-for-erlang-otp.html#5520" class="InductiveConstructor Operator"
      >-_</a
      ><a name="5522"
      > </a
      ><a name="5523" href="linear-types-for-erlang-otp.html#5534" class="Bound"
      >A</a
      ><a name="5524"
      > </a
      ><a name="5525" class="Symbol"
      >=</a
      ><a name="5526"
      > </a
      ><a name="5527" href="linear-types-for-erlang-otp.html#5260" class="InductiveConstructor"
      >el</a
      ><a name="5529"
      > </a
      ><a name="5530" href="linear-types-for-erlang-otp.html#4998" class="InductiveConstructor"
      >neg</a
      ><a name="5533"
      > </a
      ><a name="5534" href="linear-types-for-erlang-otp.html#5534" class="Bound"
      >A</a
      ><a name="5535"
      >

</a
      ><a name="5537" href="linear-types-for-erlang-otp.html#5537" class="Function"
      >&#956;-syntax</a
      ><a name="5545"
      > </a
      ><a name="5546" class="Symbol"
      >=</a
      ><a name="5547"
      > </a
      ><a name="5548" href="linear-types-for-erlang-otp.html#5410" class="InductiveConstructor Operator"
      >&#956;_</a
      ><a name="5550"
      >
</a
      ><a name="5551" href="linear-types-for-erlang-otp.html#5551" class="Function"
      >&#957;-syntax</a
      ><a name="5559"
      > </a
      ><a name="5560" class="Symbol"
      >=</a
      ><a name="5561"
      > </a
      ><a name="5562" href="linear-types-for-erlang-otp.html#5414" class="InductiveConstructor Operator"
      >&#957;_</a
      ><a name="5564"
      >

</a
      ><a name="5566" class="Keyword"
      >syntax</a
      ><a name="5572"
      > &#956;-syntax </a
      ><a name="5582" class="Symbol"
      >(&#955;</a
      ><a name="5584"
      > X </a
      ><a name="5587" class="Symbol"
      >&#8594;</a
      ><a name="5588"
      > A</a
      ><a name="5590" class="Symbol"
      >)</a
      ><a name="5591"
      > </a
      ><a name="5592" class="Symbol"
      >=</a
      ><a name="5593"
      > &#956;[ X ] A
</a
      ><a name="5603" class="Keyword"
      >syntax</a
      ><a name="5609"
      > &#957;-syntax </a
      ><a name="5619" class="Symbol"
      >(&#955;</a
      ><a name="5621"
      > X </a
      ><a name="5624" class="Symbol"
      >&#8594;</a
      ><a name="5625"
      > A</a
      ><a name="5627" class="Symbol"
      >)</a
      ><a name="5628"
      > </a
      ><a name="5629" class="Symbol"
      >=</a
      ><a name="5630"
      > &#957;[ X ] A

</a
      ><a name="5641" class="Symbol"
      >{-#</a
      ><a name="5644"
      > </a
      ><a name="5645" class="Keyword"
      >DISPLAY</a
      ><a name="5652"
      > </a
      ><a name="5653" href="linear-types-for-erlang-otp.html#5260" class="InductiveConstructor"
      >el</a
      ><a name="5655"
      > </a
      ><a name="5656" href="linear-types-for-erlang-otp.html#4986" class="InductiveConstructor"
      >pos</a
      ><a name="5659"
      > </a
      ><a name="5660" href="linear-types-for-erlang-otp.html#5660" class="Bound"
      >A</a
      ><a name="5661"
      > = </a
      ><a name="5664" href="linear-types-for-erlang-otp.html#5496" class="InductiveConstructor Operator"
      >+</a
      ><a name="5665"
      > </a
      ><a name="5666" href="linear-types-for-erlang-otp.html#5660" class="Bound"
      >A</a
      ><a name="5667"
      > </a
      ><a name="5668" class="Symbol"
      >#-}</a
      ><a name="5671"
      >
</a
      ><a name="5672" class="Symbol"
      >{-#</a
      ><a name="5675"
      > </a
      ><a name="5676" class="Keyword"
      >DISPLAY</a
      ><a name="5683"
      > </a
      ><a name="5684" href="linear-types-for-erlang-otp.html#5260" class="InductiveConstructor"
      >el</a
      ><a name="5686"
      > </a
      ><a name="5687" href="linear-types-for-erlang-otp.html#4998" class="InductiveConstructor"
      >neg</a
      ><a name="5690"
      > </a
      ><a name="5691" href="linear-types-for-erlang-otp.html#5691" class="Bound"
      >A</a
      ><a name="5692"
      > = </a
      ><a name="5695" href="linear-types-for-erlang-otp.html#5520" class="InductiveConstructor Operator"
      >-</a
      ><a name="5696"
      > </a
      ><a name="5697" href="linear-types-for-erlang-otp.html#5691" class="Bound"
      >A</a
      ><a name="5698"
      > </a
      ><a name="5699" class="Symbol"
      >#-}</a
      >
{% endraw %}</pre>
</div>

<pre class="Agda">{% raw %}
<a name="5735" href="linear-types-for-erlang-otp.html#5735" class="Function Operator"
      >~_</a
      ><a name="5737"
      > </a
      ><a name="5738" class="Symbol"
      >:</a
      ><a name="5739"
      > </a
      ><a name="5740" href="linear-types-for-erlang-otp.html#5240" class="Datatype"
      >Type</a
      ><a name="5744"
      > </a
      ><a name="5745" class="Symbol"
      >&#8594;</a
      ><a name="5746"
      > </a
      ><a name="5747" href="linear-types-for-erlang-otp.html#5240" class="Datatype"
      >Type</a
      ><a name="5751"
      >
</a
      ><a name="5752" href="linear-types-for-erlang-otp.html#5735" class="Function Operator"
      >~</a
      ><a name="5753"
      > </a
      ><a name="5754" class="Symbol"
      >(</a
      ><a name="5755" href="linear-types-for-erlang-otp.html#5496" class="InductiveConstructor Operator"
      >+</a
      ><a name="5756"
      > </a
      ><a name="5757" href="linear-types-for-erlang-otp.html#5757" class="Bound"
      >A</a
      ><a name="5758" class="Symbol"
      >)</a
      ><a name="5759"
      >   </a
      ><a name="5762" class="Symbol"
      >=</a
      ><a name="5763"
      > </a
      ><a name="5764" href="linear-types-for-erlang-otp.html#5520" class="InductiveConstructor Operator"
      >-</a
      ><a name="5765"
      > </a
      ><a name="5766" href="linear-types-for-erlang-otp.html#5757" class="Bound"
      >A</a
      ><a name="5767"
      >
</a
      ><a name="5768" href="linear-types-for-erlang-otp.html#5735" class="Function Operator"
      >~</a
      ><a name="5769"
      > </a
      ><a name="5770" class="Symbol"
      >(</a
      ><a name="5771" href="linear-types-for-erlang-otp.html#5520" class="InductiveConstructor Operator"
      >-</a
      ><a name="5772"
      > </a
      ><a name="5773" href="linear-types-for-erlang-otp.html#5773" class="Bound"
      >A</a
      ><a name="5774" class="Symbol"
      >)</a
      ><a name="5775"
      >   </a
      ><a name="5778" class="Symbol"
      >=</a
      ><a name="5779"
      > </a
      ><a name="5780" href="linear-types-for-erlang-otp.html#5496" class="InductiveConstructor Operator"
      >+</a
      ><a name="5781"
      > </a
      ><a name="5782" href="linear-types-for-erlang-otp.html#5773" class="Bound"
      >A</a
      ><a name="5783"
      >
</a
      ><a name="5784" href="linear-types-for-erlang-otp.html#5735" class="Function Operator"
      >~</a
      ><a name="5785"
      > </a
      ><a name="5786" href="linear-types-for-erlang-otp.html#5289" class="InductiveConstructor"
      >&#8868;</a
      ><a name="5787"
      >       </a
      ><a name="5794" class="Symbol"
      >=</a
      ><a name="5795"
      > </a
      ><a name="5796" href="linear-types-for-erlang-otp.html#5306" class="InductiveConstructor"
      >&#120792;</a
      ><a name="5797"
      >
</a
      ><a name="5798" href="linear-types-for-erlang-otp.html#5735" class="Function Operator"
      >~</a
      ><a name="5799"
      > </a
      ><a name="5800" href="linear-types-for-erlang-otp.html#5293" class="InductiveConstructor"
      >&#8869;</a
      ><a name="5801"
      >       </a
      ><a name="5808" class="Symbol"
      >=</a
      ><a name="5809"
      > </a
      ><a name="5810" href="linear-types-for-erlang-otp.html#5310" class="InductiveConstructor"
      >&#120793;</a
      ><a name="5811"
      >
</a
      ><a name="5812" href="linear-types-for-erlang-otp.html#5735" class="Function Operator"
      >~</a
      ><a name="5813"
      > </a
      ><a name="5814" href="linear-types-for-erlang-otp.html#5306" class="InductiveConstructor"
      >&#120792;</a
      ><a name="5815"
      >       </a
      ><a name="5822" class="Symbol"
      >=</a
      ><a name="5823"
      > </a
      ><a name="5824" href="linear-types-for-erlang-otp.html#5289" class="InductiveConstructor"
      >&#8868;</a
      ><a name="5825"
      >
</a
      ><a name="5826" href="linear-types-for-erlang-otp.html#5735" class="Function Operator"
      >~</a
      ><a name="5827"
      > </a
      ><a name="5828" href="linear-types-for-erlang-otp.html#5310" class="InductiveConstructor"
      >&#120793;</a
      ><a name="5829"
      >       </a
      ><a name="5836" class="Symbol"
      >=</a
      ><a name="5837"
      > </a
      ><a name="5838" href="linear-types-for-erlang-otp.html#5293" class="InductiveConstructor"
      >&#8869;</a
      ><a name="5839"
      >
</a
      ><a name="5840" href="linear-types-for-erlang-otp.html#5735" class="Function Operator"
      >~</a
      ><a name="5841"
      > </a
      ><a name="5842" class="Symbol"
      >(</a
      ><a name="5843" href="linear-types-for-erlang-otp.html#5843" class="Bound"
      >A</a
      ><a name="5844"
      > </a
      ><a name="5845" href="linear-types-for-erlang-otp.html#5323" class="InductiveConstructor Operator"
      >&amp;</a
      ><a name="5846"
      > </a
      ><a name="5847" href="linear-types-for-erlang-otp.html#5847" class="Bound"
      >B</a
      ><a name="5848" class="Symbol"
      >)</a
      ><a name="5849"
      > </a
      ><a name="5850" class="Symbol"
      >=</a
      ><a name="5851"
      > </a
      ><a name="5852" href="linear-types-for-erlang-otp.html#5735" class="Function Operator"
      >~</a
      ><a name="5853"
      > </a
      ><a name="5854" href="linear-types-for-erlang-otp.html#5843" class="Bound"
      >A</a
      ><a name="5855"
      > </a
      ><a name="5856" href="linear-types-for-erlang-otp.html#5354" class="InductiveConstructor Operator"
      >&#8853;</a
      ><a name="5857"
      > </a
      ><a name="5858" href="linear-types-for-erlang-otp.html#5735" class="Function Operator"
      >~</a
      ><a name="5859"
      > </a
      ><a name="5860" href="linear-types-for-erlang-otp.html#5847" class="Bound"
      >B</a
      ><a name="5861"
      >
</a
      ><a name="5862" href="linear-types-for-erlang-otp.html#5735" class="Function Operator"
      >~</a
      ><a name="5863"
      > </a
      ><a name="5864" class="Symbol"
      >(</a
      ><a name="5865" href="linear-types-for-erlang-otp.html#5865" class="Bound"
      >A</a
      ><a name="5866"
      > </a
      ><a name="5867" href="linear-types-for-erlang-otp.html#5327" class="InductiveConstructor Operator"
      >&#8523;</a
      ><a name="5868"
      > </a
      ><a name="5869" href="linear-types-for-erlang-otp.html#5869" class="Bound"
      >B</a
      ><a name="5870" class="Symbol"
      >)</a
      ><a name="5871"
      > </a
      ><a name="5872" class="Symbol"
      >=</a
      ><a name="5873"
      > </a
      ><a name="5874" href="linear-types-for-erlang-otp.html#5735" class="Function Operator"
      >~</a
      ><a name="5875"
      > </a
      ><a name="5876" href="linear-types-for-erlang-otp.html#5865" class="Bound"
      >A</a
      ><a name="5877"
      > </a
      ><a name="5878" href="linear-types-for-erlang-otp.html#5358" class="InductiveConstructor Operator"
      >&#8855;</a
      ><a name="5879"
      > </a
      ><a name="5880" href="linear-types-for-erlang-otp.html#5735" class="Function Operator"
      >~</a
      ><a name="5881"
      > </a
      ><a name="5882" href="linear-types-for-erlang-otp.html#5869" class="Bound"
      >B</a
      ><a name="5883"
      >
</a
      ><a name="5884" href="linear-types-for-erlang-otp.html#5735" class="Function Operator"
      >~</a
      ><a name="5885"
      > </a
      ><a name="5886" class="Symbol"
      >(</a
      ><a name="5887" href="linear-types-for-erlang-otp.html#5887" class="Bound"
      >A</a
      ><a name="5888"
      > </a
      ><a name="5889" href="linear-types-for-erlang-otp.html#5354" class="InductiveConstructor Operator"
      >&#8853;</a
      ><a name="5890"
      > </a
      ><a name="5891" href="linear-types-for-erlang-otp.html#5891" class="Bound"
      >B</a
      ><a name="5892" class="Symbol"
      >)</a
      ><a name="5893"
      > </a
      ><a name="5894" class="Symbol"
      >=</a
      ><a name="5895"
      > </a
      ><a name="5896" href="linear-types-for-erlang-otp.html#5735" class="Function Operator"
      >~</a
      ><a name="5897"
      > </a
      ><a name="5898" href="linear-types-for-erlang-otp.html#5887" class="Bound"
      >A</a
      ><a name="5899"
      > </a
      ><a name="5900" href="linear-types-for-erlang-otp.html#5323" class="InductiveConstructor Operator"
      >&amp;</a
      ><a name="5901"
      > </a
      ><a name="5902" href="linear-types-for-erlang-otp.html#5735" class="Function Operator"
      >~</a
      ><a name="5903"
      > </a
      ><a name="5904" href="linear-types-for-erlang-otp.html#5891" class="Bound"
      >B</a
      ><a name="5905"
      >
</a
      ><a name="5906" href="linear-types-for-erlang-otp.html#5735" class="Function Operator"
      >~</a
      ><a name="5907"
      > </a
      ><a name="5908" class="Symbol"
      >(</a
      ><a name="5909" href="linear-types-for-erlang-otp.html#5909" class="Bound"
      >A</a
      ><a name="5910"
      > </a
      ><a name="5911" href="linear-types-for-erlang-otp.html#5358" class="InductiveConstructor Operator"
      >&#8855;</a
      ><a name="5912"
      > </a
      ><a name="5913" href="linear-types-for-erlang-otp.html#5913" class="Bound"
      >B</a
      ><a name="5914" class="Symbol"
      >)</a
      ><a name="5915"
      > </a
      ><a name="5916" class="Symbol"
      >=</a
      ><a name="5917"
      > </a
      ><a name="5918" href="linear-types-for-erlang-otp.html#5735" class="Function Operator"
      >~</a
      ><a name="5919"
      > </a
      ><a name="5920" href="linear-types-for-erlang-otp.html#5909" class="Bound"
      >A</a
      ><a name="5921"
      > </a
      ><a name="5922" href="linear-types-for-erlang-otp.html#5327" class="InductiveConstructor Operator"
      >&#8523;</a
      ><a name="5923"
      > </a
      ><a name="5924" href="linear-types-for-erlang-otp.html#5735" class="Function Operator"
      >~</a
      ><a name="5925"
      > </a
      ><a name="5926" href="linear-types-for-erlang-otp.html#5913" class="Bound"
      >B</a
      ><a name="5927"
      >
</a
      ><a name="5928" href="linear-types-for-erlang-otp.html#5735" class="Function Operator"
      >~</a
      ><a name="5929"
      > </a
      ><a name="5930" class="Symbol"
      >(</a
      ><a name="5931" href="linear-types-for-erlang-otp.html#5385" class="InductiveConstructor Operator"
      >&#161;</a
      ><a name="5932"
      > </a
      ><a name="5933" href="linear-types-for-erlang-otp.html#5933" class="Bound"
      >A</a
      ><a name="5934"
      > </a
      ><a name="5935" class="Symbol"
      >)</a
      ><a name="5936"
      >  </a
      ><a name="5938" class="Symbol"
      >=</a
      ><a name="5939"
      > </a
      ><a name="5940" href="linear-types-for-erlang-otp.html#5389" class="InductiveConstructor Operator"
      >&#191;</a
      ><a name="5941"
      > </a
      ><a name="5942" href="linear-types-for-erlang-otp.html#5735" class="Function Operator"
      >~</a
      ><a name="5943"
      > </a
      ><a name="5944" href="linear-types-for-erlang-otp.html#5933" class="Bound"
      >A</a
      ><a name="5945"
      >
</a
      ><a name="5946" href="linear-types-for-erlang-otp.html#5735" class="Function Operator"
      >~</a
      ><a name="5947"
      > </a
      ><a name="5948" class="Symbol"
      >(</a
      ><a name="5949" href="linear-types-for-erlang-otp.html#5389" class="InductiveConstructor Operator"
      >&#191;</a
      ><a name="5950"
      > </a
      ><a name="5951" href="linear-types-for-erlang-otp.html#5951" class="Bound"
      >A</a
      ><a name="5952"
      > </a
      ><a name="5953" class="Symbol"
      >)</a
      ><a name="5954"
      >  </a
      ><a name="5956" class="Symbol"
      >=</a
      ><a name="5957"
      > </a
      ><a name="5958" href="linear-types-for-erlang-otp.html#5385" class="InductiveConstructor Operator"
      >&#161;</a
      ><a name="5959"
      > </a
      ><a name="5960" href="linear-types-for-erlang-otp.html#5735" class="Function Operator"
      >~</a
      ><a name="5961"
      > </a
      ><a name="5962" href="linear-types-for-erlang-otp.html#5951" class="Bound"
      >A</a
      ><a name="5963"
      >
</a
      ><a name="5964" href="linear-types-for-erlang-otp.html#5735" class="Function Operator"
      >~</a
      ><a name="5965"
      > </a
      ><a name="5966" class="Symbol"
      >(</a
      ><a name="5967" href="linear-types-for-erlang-otp.html#5410" class="InductiveConstructor Operator"
      >&#956;</a
      ><a name="5968"
      > </a
      ><a name="5969" href="linear-types-for-erlang-otp.html#5969" class="Bound"
      >F</a
      ><a name="5970" class="Symbol"
      >)</a
      ><a name="5971"
      >   </a
      ><a name="5974" class="Symbol"
      >=</a
      ><a name="5975"
      > </a
      ><a name="5976" href="linear-types-for-erlang-otp.html#5551" class="Function"
      >&#957;[</a
      ><a name="5978"
      > </a
      ><a name="5979" href="linear-types-for-erlang-otp.html#5979" class="Bound"
      >X</a
      ><a name="5980"
      > </a
      ><a name="5981" href="linear-types-for-erlang-otp.html#5551" class="Function"
      >]</a
      ><a name="5982" class="Symbol"
      >(</a
      ><a name="5983" href="linear-types-for-erlang-otp.html#5735" class="Function Operator"
      >~</a
      ><a name="5984"
      > </a
      ><a name="5985" href="linear-types-for-erlang-otp.html#5969" class="Bound"
      >F</a
      ><a name="5986"
      > </a
      ><a name="5987" href="linear-types-for-erlang-otp.html#5979" class="Bound"
      >X</a
      ><a name="5988" class="Symbol"
      >)</a
      ><a name="5989"
      >
</a
      ><a name="5990" href="linear-types-for-erlang-otp.html#5735" class="Function Operator"
      >~</a
      ><a name="5991"
      > </a
      ><a name="5992" class="Symbol"
      >(</a
      ><a name="5993" href="linear-types-for-erlang-otp.html#5414" class="InductiveConstructor Operator"
      >&#957;</a
      ><a name="5994"
      > </a
      ><a name="5995" href="linear-types-for-erlang-otp.html#5995" class="Bound"
      >F</a
      ><a name="5996" class="Symbol"
      >)</a
      ><a name="5997"
      >   </a
      ><a name="6000" class="Symbol"
      >=</a
      ><a name="6001"
      > </a
      ><a name="6002" href="linear-types-for-erlang-otp.html#5537" class="Function"
      >&#956;[</a
      ><a name="6004"
      > </a
      ><a name="6005" href="linear-types-for-erlang-otp.html#6005" class="Bound"
      >X</a
      ><a name="6006"
      > </a
      ><a name="6007" href="linear-types-for-erlang-otp.html#5537" class="Function"
      >]</a
      ><a name="6008" class="Symbol"
      >(</a
      ><a name="6009" href="linear-types-for-erlang-otp.html#5735" class="Function Operator"
      >~</a
      ><a name="6010"
      > </a
      ><a name="6011" href="linear-types-for-erlang-otp.html#5995" class="Bound"
      >F</a
      ><a name="6012"
      > </a
      ><a name="6013" href="linear-types-for-erlang-otp.html#6005" class="Bound"
      >X</a
      ><a name="6014" class="Symbol"
      >)</a
      >
{% endraw %}</pre>

<pre class="Agda">{% raw %}
<a name="6041" href="linear-types-for-erlang-otp.html#6041" class="Function Operator"
      >_&#8888;_</a
      ><a name="6044"
      > </a
      ><a name="6045" class="Symbol"
      >:</a
      ><a name="6046"
      > </a
      ><a name="6047" href="linear-types-for-erlang-otp.html#5240" class="Datatype"
      >Type</a
      ><a name="6051"
      > </a
      ><a name="6052" class="Symbol"
      >&#8594;</a
      ><a name="6053"
      > </a
      ><a name="6054" href="linear-types-for-erlang-otp.html#5240" class="Datatype"
      >Type</a
      ><a name="6058"
      > </a
      ><a name="6059" class="Symbol"
      >&#8594;</a
      ><a name="6060"
      > </a
      ><a name="6061" href="linear-types-for-erlang-otp.html#5240" class="Datatype"
      >Type</a
      ><a name="6065"
      >
</a
      ><a name="6066" href="linear-types-for-erlang-otp.html#6066" class="Bound"
      >A</a
      ><a name="6067"
      > </a
      ><a name="6068" href="linear-types-for-erlang-otp.html#6041" class="Function Operator"
      >&#8888;</a
      ><a name="6069"
      > </a
      ><a name="6070" href="linear-types-for-erlang-otp.html#6070" class="Bound"
      >B</a
      ><a name="6071"
      > </a
      ><a name="6072" class="Symbol"
      >=</a
      ><a name="6073"
      > </a
      ><a name="6074" href="linear-types-for-erlang-otp.html#5735" class="Function Operator"
      >~</a
      ><a name="6075"
      > </a
      ><a name="6076" href="linear-types-for-erlang-otp.html#6066" class="Bound"
      >A</a
      ><a name="6077"
      > </a
      ><a name="6078" href="linear-types-for-erlang-otp.html#5327" class="InductiveConstructor Operator"
      >&#8523;</a
      ><a name="6079"
      > </a
      ><a name="6080" href="linear-types-for-erlang-otp.html#6070" class="Bound"
      >B</a
      >
{% endraw %}</pre>

So: what should start *really* do? It should start up a process which
handles requests according to the module definition `Mod`, indefinitely,
and initialises with the state returned by `Mod:init/0`.
Every other function `Mod` can represent should be of a callback type,
and each of these should be exposed by the process bound to `Name`.
This means that a module is *any* heterogeneous, named sum.
For instance, `CalcMod` below is a valid module:

Nat = var pos (id "Nat")
{-# DISPLAY var pos (id "Nat") = Nat #-}

Mod : {Message : Set} (st : Type) (msgs : List Message) (arg resp : Message → Type) → Type
Mod st msgs arg resp = foldl _⊕_ st (map (λ msg → arg msg ⊸ (resp msg ⅋ st)) msgs)


data CalcMsg : Set where
  Add  : CalcMsg
  Mult : CalcMsg
  Retn : CalcMsg

CalcMod : Type
CalcMod = Mod Nat (Add ∷ Mult ∷ Retn ∷ []) arg resp
  where
    arg resp : CalcMsg → Type
    arg  Add  = Nat
    arg  Mult = Nat
    arg  Retn = 𝟙
    resp Add  = 𝟙
    resp Mult = 𝟙
    resp Retn = Nat

testCalcMod : CalcMod ≡ {-init-}  Nat ⊕
                        {-add-}  (Nat ⊸ 𝟙 ⅋ Nat) ⊕
                        {-mult-} (Nat ⊸ 𝟙 ⅋ Nat) ⊕
                        {-retn-} (𝟙 ⊸ Nat ⅋ Nat)
testCalcMod = refl

However, `NameMod` below is *also* a valid module:

However, we cannot express this pattern in CP's type system.
