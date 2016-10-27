---
title        : "Linear Types for Erlang OTP (1)"
date         : 2016-10-25 12:00:00
categories   : []
tags         : [agda, erlang, process calculus]
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
<a name="4852" class="Keyword"
      >open</a
      ><a name="4856"
      > </a
      ><a name="4857" class="Keyword"
      >import</a
      ><a name="4863"
      > </a
      ><a name="4864" href="https://agda.github.io/agda-stdlib/Level.html#1" class="Module"
      >Level</a
      ><a name="4869"
      > </a
      ><a name="4870" class="Keyword"
      >using</a
      ><a name="4875"
      > </a
      ><a name="4876" class="Symbol"
      >(</a
      ><a name="4877" href="Agda.Primitive.html#596" class="Primitive"
      >suc</a
      ><a name="4880" class="Symbol"
      >)</a
      ><a name="4881"
      >

</a
      ><a name="4883" class="Keyword"
      >module</a
      ><a name="4889"
      > </a
      ><a name="4890" href="linear-types-for-erlang-otp.html#1" class="Module"
      >linear-types-for-erlang-otp</a
      ><a name="4917"
      > </a
      ><a name="4918" class="Keyword"
      >where</a
      >
{% endraw %}</pre>
</div>

<pre class="Agda">{% raw %}
<a name="4956" class="Keyword"
      >data</a
      ><a name="4960"
      > </a
      ><a name="4961" href="linear-types-for-erlang-otp.html#4961" class="Datatype"
      >Pol</a
      ><a name="4964"
      > </a
      ><a name="4965" class="Symbol"
      >:</a
      ><a name="4966"
      > </a
      ><a name="4967" class="PrimitiveType"
      >Set</a
      ><a name="4970"
      > </a
      ><a name="4971" class="Keyword"
      >where</a
      ><a name="4976"
      >
  </a
      ><a name="4979" href="linear-types-for-erlang-otp.html#4979" class="InductiveConstructor"
      >pos</a
      ><a name="4982"
      > </a
      ><a name="4983" class="Symbol"
      >:</a
      ><a name="4984"
      > </a
      ><a name="4985" href="linear-types-for-erlang-otp.html#4961" class="Datatype"
      >Pol</a
      ><a name="4988"
      >
  </a
      ><a name="4991" href="linear-types-for-erlang-otp.html#4991" class="InductiveConstructor"
      >neg</a
      ><a name="4994"
      > </a
      ><a name="4995" class="Symbol"
      >:</a
      ><a name="4996"
      > </a
      ><a name="4997" href="linear-types-for-erlang-otp.html#4961" class="Datatype"
      >Pol</a
      >
{% endraw %}</pre>

<div class="hidden">
<pre class="Agda">{% raw %}
<a name="5047" class="Keyword"
      >infix</a
      ><a name="5052"
      >  </a
      ><a name="5054" class="Number"
      >9</a
      ><a name="5055"
      > +_
</a
      ><a name="5059" class="Keyword"
      >infix</a
      ><a name="5064"
      >  </a
      ><a name="5066" class="Number"
      >9</a
      ><a name="5067"
      > -_
</a
      ><a name="5071" class="Keyword"
      >infix</a
      ><a name="5076"
      >  </a
      ><a name="5078" class="Number"
      >8</a
      ><a name="5079"
      > ~_
</a
      ><a name="5083" class="Keyword"
      >infix</a
      ><a name="5088"
      >  </a
      ><a name="5090" class="Number"
      >7</a
      ><a name="5091"
      > &#161;_
</a
      ><a name="5095" class="Keyword"
      >infix</a
      ><a name="5100"
      >  </a
      ><a name="5102" class="Number"
      >7</a
      ><a name="5103"
      > &#191;_
</a
      ><a name="5107" class="Keyword"
      >infixl</a
      ><a name="5113"
      > </a
      ><a name="5114" class="Number"
      >6</a
      ><a name="5115"
      > _&amp;_
</a
      ><a name="5120" class="Keyword"
      >infixl</a
      ><a name="5126"
      > </a
      ><a name="5127" class="Number"
      >6</a
      ><a name="5128"
      > _&#8523;_
</a
      ><a name="5133" class="Keyword"
      >infixl</a
      ><a name="5139"
      > </a
      ><a name="5140" class="Number"
      >6</a
      ><a name="5141"
      > _&#8853;_
</a
      ><a name="5146" class="Keyword"
      >infixl</a
      ><a name="5152"
      > </a
      ><a name="5153" class="Number"
      >6</a
      ><a name="5154"
      > _&#8855;_
</a
      ><a name="5159" class="Keyword"
      >infixr</a
      ><a name="5165"
      > </a
      ><a name="5166" class="Number"
      >5</a
      ><a name="5167"
      > _&#8888;_
</a
      ><a name="5172" class="Keyword"
      >infix</a
      ><a name="5177"
      >  </a
      ><a name="5179" class="Number"
      >4</a
      ><a name="5180"
      > &#956;_
</a
      ><a name="5184" class="Keyword"
      >infix</a
      ><a name="5189"
      >  </a
      ><a name="5191" class="Number"
      >4</a
      >
{% endraw %}</pre>
</div>

<pre class="Agda">{% raw %}
<a name="5228" class="Keyword"
      >data</a
      ><a name="5232"
      > </a
      ><a name="5233" href="linear-types-for-erlang-otp.html#5233" class="Datatype"
      >Type</a
      ><a name="5237"
      > </a
      ><a name="5238" class="Symbol"
      >:</a
      ><a name="5239"
      > </a
      ><a name="5240" class="PrimitiveType"
      >Set&#8321;</a
      ><a name="5244"
      > </a
      ><a name="5245" class="Keyword"
      >where</a
      ><a name="5250"
      >
  </a
      ><a name="5253" href="linear-types-for-erlang-otp.html#5253" class="InductiveConstructor"
      >el</a
      ><a name="5255"
      >      </a
      ><a name="5261" class="Symbol"
      >:</a
      ><a name="5262"
      > </a
      ><a name="5263" href="linear-types-for-erlang-otp.html#4961" class="Datatype"
      >Pol</a
      ><a name="5266"
      > </a
      ><a name="5267" class="Symbol"
      >&#8594;</a
      ><a name="5268"
      > </a
      ><a name="5269" class="PrimitiveType"
      >Set</a
      ><a name="5272"
      > </a
      ><a name="5273" class="Symbol"
      >&#8594;</a
      ><a name="5274"
      > </a
      ><a name="5275" href="linear-types-for-erlang-otp.html#5233" class="Datatype"
      >Type</a
      ><a name="5279"
      >
  </a
      ><a name="5282" href="linear-types-for-erlang-otp.html#5282" class="InductiveConstructor"
      >&#8868;</a
      ><a name="5283"
      >   </a
      ><a name="5286" href="linear-types-for-erlang-otp.html#5286" class="InductiveConstructor"
      >&#8869;</a
      ><a name="5287"
      >   </a
      ><a name="5290" class="Symbol"
      >:</a
      ><a name="5291"
      > </a
      ><a name="5292" href="linear-types-for-erlang-otp.html#5233" class="Datatype"
      >Type</a
      ><a name="5296"
      >
  </a
      ><a name="5299" href="linear-types-for-erlang-otp.html#5299" class="InductiveConstructor"
      >&#120792;</a
      ><a name="5300"
      >   </a
      ><a name="5303" href="linear-types-for-erlang-otp.html#5303" class="InductiveConstructor"
      >&#120793;</a
      ><a name="5304"
      >   </a
      ><a name="5307" class="Symbol"
      >:</a
      ><a name="5308"
      > </a
      ><a name="5309" href="linear-types-for-erlang-otp.html#5233" class="Datatype"
      >Type</a
      ><a name="5313"
      >
  </a
      ><a name="5316" href="linear-types-for-erlang-otp.html#5316" class="InductiveConstructor Operator"
      >_&amp;_</a
      ><a name="5319"
      > </a
      ><a name="5320" href="linear-types-for-erlang-otp.html#5320" class="InductiveConstructor Operator"
      >_&#8523;_</a
      ><a name="5323"
      > </a
      ><a name="5324" class="Symbol"
      >:</a
      ><a name="5325"
      > </a
      ><a name="5326" href="linear-types-for-erlang-otp.html#5233" class="Datatype"
      >Type</a
      ><a name="5330"
      > </a
      ><a name="5331" class="Symbol"
      >&#8594;</a
      ><a name="5332"
      > </a
      ><a name="5333" href="linear-types-for-erlang-otp.html#5233" class="Datatype"
      >Type</a
      ><a name="5337"
      > </a
      ><a name="5338" class="Symbol"
      >&#8594;</a
      ><a name="5339"
      > </a
      ><a name="5340" href="linear-types-for-erlang-otp.html#5233" class="Datatype"
      >Type</a
      ><a name="5344"
      >
  </a
      ><a name="5347" href="linear-types-for-erlang-otp.html#5347" class="InductiveConstructor Operator"
      >_&#8853;_</a
      ><a name="5350"
      > </a
      ><a name="5351" href="linear-types-for-erlang-otp.html#5351" class="InductiveConstructor Operator"
      >_&#8855;_</a
      ><a name="5354"
      > </a
      ><a name="5355" class="Symbol"
      >:</a
      ><a name="5356"
      > </a
      ><a name="5357" href="linear-types-for-erlang-otp.html#5233" class="Datatype"
      >Type</a
      ><a name="5361"
      > </a
      ><a name="5362" class="Symbol"
      >&#8594;</a
      ><a name="5363"
      > </a
      ><a name="5364" href="linear-types-for-erlang-otp.html#5233" class="Datatype"
      >Type</a
      ><a name="5368"
      > </a
      ><a name="5369" class="Symbol"
      >&#8594;</a
      ><a name="5370"
      > </a
      ><a name="5371" href="linear-types-for-erlang-otp.html#5233" class="Datatype"
      >Type</a
      ><a name="5375"
      >
  </a
      ><a name="5378" href="linear-types-for-erlang-otp.html#5378" class="InductiveConstructor Operator"
      >&#161;_</a
      ><a name="5380"
      >  </a
      ><a name="5382" href="linear-types-for-erlang-otp.html#5382" class="InductiveConstructor Operator"
      >&#191;_</a
      ><a name="5384"
      >  </a
      ><a name="5386" class="Symbol"
      >:</a
      ><a name="5387"
      > </a
      ><a name="5388" href="linear-types-for-erlang-otp.html#5233" class="Datatype"
      >Type</a
      ><a name="5392"
      > </a
      ><a name="5393" class="Symbol"
      >-&gt;</a
      ><a name="5395"
      > </a
      ><a name="5396" href="linear-types-for-erlang-otp.html#5233" class="Datatype"
      >Type</a
      ><a name="5400"
      >
  </a
      ><a name="5403" href="linear-types-for-erlang-otp.html#5403" class="InductiveConstructor Operator"
      >&#956;_</a
      ><a name="5405"
      >  </a
      ><a name="5407" href="linear-types-for-erlang-otp.html#5407" class="InductiveConstructor Operator"
      >&#957;_</a
      ><a name="5409"
      >  </a
      ><a name="5411" class="Symbol"
      >:</a
      ><a name="5412"
      > </a
      ><a name="5413" class="Symbol"
      >(</a
      ><a name="5414" class="PrimitiveType"
      >Set</a
      ><a name="5417"
      > </a
      ><a name="5418" class="Symbol"
      >&#8594;</a
      ><a name="5419"
      > </a
      ><a name="5420" href="linear-types-for-erlang-otp.html#5233" class="Datatype"
      >Type</a
      ><a name="5424" class="Symbol"
      >)</a
      ><a name="5425"
      > </a
      ><a name="5426" class="Symbol"
      >&#8594;</a
      ><a name="5427"
      > </a
      ><a name="5428" href="linear-types-for-erlang-otp.html#5233" class="Datatype"
      >Type</a
      >
{% endraw %}</pre>

<div class="foldable">
<pre class="Agda">{% raw %}
<a name="5481" class="Keyword"
      >pattern</a
      ><a name="5488"
      > </a
      ><a name="5489" href="linear-types-for-erlang-otp.html#5489" class="InductiveConstructor Operator"
      >+_</a
      ><a name="5491"
      > </a
      ><a name="5492" href="linear-types-for-erlang-otp.html#5503" class="Bound"
      >A</a
      ><a name="5493"
      > </a
      ><a name="5494" class="Symbol"
      >=</a
      ><a name="5495"
      > </a
      ><a name="5496" href="linear-types-for-erlang-otp.html#5253" class="InductiveConstructor"
      >el</a
      ><a name="5498"
      > </a
      ><a name="5499" href="linear-types-for-erlang-otp.html#4979" class="InductiveConstructor"
      >pos</a
      ><a name="5502"
      > </a
      ><a name="5503" href="linear-types-for-erlang-otp.html#5503" class="Bound"
      >A</a
      ><a name="5504"
      >
</a
      ><a name="5505" class="Keyword"
      >pattern</a
      ><a name="5512"
      > </a
      ><a name="5513" href="linear-types-for-erlang-otp.html#5513" class="InductiveConstructor Operator"
      >-_</a
      ><a name="5515"
      > </a
      ><a name="5516" href="linear-types-for-erlang-otp.html#5527" class="Bound"
      >A</a
      ><a name="5517"
      > </a
      ><a name="5518" class="Symbol"
      >=</a
      ><a name="5519"
      > </a
      ><a name="5520" href="linear-types-for-erlang-otp.html#5253" class="InductiveConstructor"
      >el</a
      ><a name="5522"
      > </a
      ><a name="5523" href="linear-types-for-erlang-otp.html#4991" class="InductiveConstructor"
      >neg</a
      ><a name="5526"
      > </a
      ><a name="5527" href="linear-types-for-erlang-otp.html#5527" class="Bound"
      >A</a
      ><a name="5528"
      >

</a
      ><a name="5530" href="linear-types-for-erlang-otp.html#5530" class="Function"
      >&#956;-syntax</a
      ><a name="5538"
      > </a
      ><a name="5539" class="Symbol"
      >=</a
      ><a name="5540"
      > </a
      ><a name="5541" href="linear-types-for-erlang-otp.html#5403" class="InductiveConstructor Operator"
      >&#956;_</a
      ><a name="5543"
      >
</a
      ><a name="5544" href="linear-types-for-erlang-otp.html#5544" class="Function"
      >&#957;-syntax</a
      ><a name="5552"
      > </a
      ><a name="5553" class="Symbol"
      >=</a
      ><a name="5554"
      > </a
      ><a name="5555" href="linear-types-for-erlang-otp.html#5407" class="InductiveConstructor Operator"
      >&#957;_</a
      ><a name="5557"
      >

</a
      ><a name="5559" class="Keyword"
      >syntax</a
      ><a name="5565"
      > &#956;-syntax </a
      ><a name="5575" class="Symbol"
      >(&#955;</a
      ><a name="5577"
      > X </a
      ><a name="5580" class="Symbol"
      >&#8594;</a
      ><a name="5581"
      > A</a
      ><a name="5583" class="Symbol"
      >)</a
      ><a name="5584"
      > </a
      ><a name="5585" class="Symbol"
      >=</a
      ><a name="5586"
      > &#956;[ X ] A
</a
      ><a name="5596" class="Keyword"
      >syntax</a
      ><a name="5602"
      > &#957;-syntax </a
      ><a name="5612" class="Symbol"
      >(&#955;</a
      ><a name="5614"
      > X </a
      ><a name="5617" class="Symbol"
      >&#8594;</a
      ><a name="5618"
      > A</a
      ><a name="5620" class="Symbol"
      >)</a
      ><a name="5621"
      > </a
      ><a name="5622" class="Symbol"
      >=</a
      ><a name="5623"
      > &#957;[ X ] A

</a
      ><a name="5634" class="Symbol"
      >{-#</a
      ><a name="5637"
      > </a
      ><a name="5638" class="Keyword"
      >DISPLAY</a
      ><a name="5645"
      > </a
      ><a name="5646" href="linear-types-for-erlang-otp.html#5253" class="InductiveConstructor"
      >el</a
      ><a name="5648"
      > </a
      ><a name="5649" href="linear-types-for-erlang-otp.html#4979" class="InductiveConstructor"
      >pos</a
      ><a name="5652"
      > </a
      ><a name="5653" href="linear-types-for-erlang-otp.html#5653" class="Bound"
      >A</a
      ><a name="5654"
      > = </a
      ><a name="5657" href="linear-types-for-erlang-otp.html#5489" class="InductiveConstructor Operator"
      >+</a
      ><a name="5658"
      > </a
      ><a name="5659" href="linear-types-for-erlang-otp.html#5653" class="Bound"
      >A</a
      ><a name="5660"
      > </a
      ><a name="5661" class="Symbol"
      >#-}</a
      ><a name="5664"
      >
</a
      ><a name="5665" class="Symbol"
      >{-#</a
      ><a name="5668"
      > </a
      ><a name="5669" class="Keyword"
      >DISPLAY</a
      ><a name="5676"
      > </a
      ><a name="5677" href="linear-types-for-erlang-otp.html#5253" class="InductiveConstructor"
      >el</a
      ><a name="5679"
      > </a
      ><a name="5680" href="linear-types-for-erlang-otp.html#4991" class="InductiveConstructor"
      >neg</a
      ><a name="5683"
      > </a
      ><a name="5684" href="linear-types-for-erlang-otp.html#5684" class="Bound"
      >A</a
      ><a name="5685"
      > = </a
      ><a name="5688" href="linear-types-for-erlang-otp.html#5513" class="InductiveConstructor Operator"
      >-</a
      ><a name="5689"
      > </a
      ><a name="5690" href="linear-types-for-erlang-otp.html#5684" class="Bound"
      >A</a
      ><a name="5691"
      > </a
      ><a name="5692" class="Symbol"
      >#-}</a
      >
{% endraw %}</pre>
</div>

<pre class="Agda">{% raw %}
<a name="5728" href="linear-types-for-erlang-otp.html#5728" class="Function Operator"
      >~_</a
      ><a name="5730"
      > </a
      ><a name="5731" class="Symbol"
      >:</a
      ><a name="5732"
      > </a
      ><a name="5733" href="linear-types-for-erlang-otp.html#5233" class="Datatype"
      >Type</a
      ><a name="5737"
      > </a
      ><a name="5738" class="Symbol"
      >&#8594;</a
      ><a name="5739"
      > </a
      ><a name="5740" href="linear-types-for-erlang-otp.html#5233" class="Datatype"
      >Type</a
      ><a name="5744"
      >
</a
      ><a name="5745" href="linear-types-for-erlang-otp.html#5728" class="Function Operator"
      >~</a
      ><a name="5746"
      > </a
      ><a name="5747" class="Symbol"
      >(</a
      ><a name="5748" href="linear-types-for-erlang-otp.html#5489" class="InductiveConstructor Operator"
      >+</a
      ><a name="5749"
      > </a
      ><a name="5750" href="linear-types-for-erlang-otp.html#5750" class="Bound"
      >A</a
      ><a name="5751" class="Symbol"
      >)</a
      ><a name="5752"
      >   </a
      ><a name="5755" class="Symbol"
      >=</a
      ><a name="5756"
      > </a
      ><a name="5757" href="linear-types-for-erlang-otp.html#5513" class="InductiveConstructor Operator"
      >-</a
      ><a name="5758"
      > </a
      ><a name="5759" href="linear-types-for-erlang-otp.html#5750" class="Bound"
      >A</a
      ><a name="5760"
      >
</a
      ><a name="5761" href="linear-types-for-erlang-otp.html#5728" class="Function Operator"
      >~</a
      ><a name="5762"
      > </a
      ><a name="5763" class="Symbol"
      >(</a
      ><a name="5764" href="linear-types-for-erlang-otp.html#5513" class="InductiveConstructor Operator"
      >-</a
      ><a name="5765"
      > </a
      ><a name="5766" href="linear-types-for-erlang-otp.html#5766" class="Bound"
      >A</a
      ><a name="5767" class="Symbol"
      >)</a
      ><a name="5768"
      >   </a
      ><a name="5771" class="Symbol"
      >=</a
      ><a name="5772"
      > </a
      ><a name="5773" href="linear-types-for-erlang-otp.html#5489" class="InductiveConstructor Operator"
      >+</a
      ><a name="5774"
      > </a
      ><a name="5775" href="linear-types-for-erlang-otp.html#5766" class="Bound"
      >A</a
      ><a name="5776"
      >
</a
      ><a name="5777" href="linear-types-for-erlang-otp.html#5728" class="Function Operator"
      >~</a
      ><a name="5778"
      > </a
      ><a name="5779" href="linear-types-for-erlang-otp.html#5282" class="InductiveConstructor"
      >&#8868;</a
      ><a name="5780"
      >       </a
      ><a name="5787" class="Symbol"
      >=</a
      ><a name="5788"
      > </a
      ><a name="5789" href="linear-types-for-erlang-otp.html#5299" class="InductiveConstructor"
      >&#120792;</a
      ><a name="5790"
      >
</a
      ><a name="5791" href="linear-types-for-erlang-otp.html#5728" class="Function Operator"
      >~</a
      ><a name="5792"
      > </a
      ><a name="5793" href="linear-types-for-erlang-otp.html#5286" class="InductiveConstructor"
      >&#8869;</a
      ><a name="5794"
      >       </a
      ><a name="5801" class="Symbol"
      >=</a
      ><a name="5802"
      > </a
      ><a name="5803" href="linear-types-for-erlang-otp.html#5303" class="InductiveConstructor"
      >&#120793;</a
      ><a name="5804"
      >
</a
      ><a name="5805" href="linear-types-for-erlang-otp.html#5728" class="Function Operator"
      >~</a
      ><a name="5806"
      > </a
      ><a name="5807" href="linear-types-for-erlang-otp.html#5299" class="InductiveConstructor"
      >&#120792;</a
      ><a name="5808"
      >       </a
      ><a name="5815" class="Symbol"
      >=</a
      ><a name="5816"
      > </a
      ><a name="5817" href="linear-types-for-erlang-otp.html#5282" class="InductiveConstructor"
      >&#8868;</a
      ><a name="5818"
      >
</a
      ><a name="5819" href="linear-types-for-erlang-otp.html#5728" class="Function Operator"
      >~</a
      ><a name="5820"
      > </a
      ><a name="5821" href="linear-types-for-erlang-otp.html#5303" class="InductiveConstructor"
      >&#120793;</a
      ><a name="5822"
      >       </a
      ><a name="5829" class="Symbol"
      >=</a
      ><a name="5830"
      > </a
      ><a name="5831" href="linear-types-for-erlang-otp.html#5286" class="InductiveConstructor"
      >&#8869;</a
      ><a name="5832"
      >
</a
      ><a name="5833" href="linear-types-for-erlang-otp.html#5728" class="Function Operator"
      >~</a
      ><a name="5834"
      > </a
      ><a name="5835" class="Symbol"
      >(</a
      ><a name="5836" href="linear-types-for-erlang-otp.html#5836" class="Bound"
      >A</a
      ><a name="5837"
      > </a
      ><a name="5838" href="linear-types-for-erlang-otp.html#5316" class="InductiveConstructor Operator"
      >&amp;</a
      ><a name="5839"
      > </a
      ><a name="5840" href="linear-types-for-erlang-otp.html#5840" class="Bound"
      >B</a
      ><a name="5841" class="Symbol"
      >)</a
      ><a name="5842"
      > </a
      ><a name="5843" class="Symbol"
      >=</a
      ><a name="5844"
      > </a
      ><a name="5845" href="linear-types-for-erlang-otp.html#5728" class="Function Operator"
      >~</a
      ><a name="5846"
      > </a
      ><a name="5847" href="linear-types-for-erlang-otp.html#5836" class="Bound"
      >A</a
      ><a name="5848"
      > </a
      ><a name="5849" href="linear-types-for-erlang-otp.html#5347" class="InductiveConstructor Operator"
      >&#8853;</a
      ><a name="5850"
      > </a
      ><a name="5851" href="linear-types-for-erlang-otp.html#5728" class="Function Operator"
      >~</a
      ><a name="5852"
      > </a
      ><a name="5853" href="linear-types-for-erlang-otp.html#5840" class="Bound"
      >B</a
      ><a name="5854"
      >
</a
      ><a name="5855" href="linear-types-for-erlang-otp.html#5728" class="Function Operator"
      >~</a
      ><a name="5856"
      > </a
      ><a name="5857" class="Symbol"
      >(</a
      ><a name="5858" href="linear-types-for-erlang-otp.html#5858" class="Bound"
      >A</a
      ><a name="5859"
      > </a
      ><a name="5860" href="linear-types-for-erlang-otp.html#5320" class="InductiveConstructor Operator"
      >&#8523;</a
      ><a name="5861"
      > </a
      ><a name="5862" href="linear-types-for-erlang-otp.html#5862" class="Bound"
      >B</a
      ><a name="5863" class="Symbol"
      >)</a
      ><a name="5864"
      > </a
      ><a name="5865" class="Symbol"
      >=</a
      ><a name="5866"
      > </a
      ><a name="5867" href="linear-types-for-erlang-otp.html#5728" class="Function Operator"
      >~</a
      ><a name="5868"
      > </a
      ><a name="5869" href="linear-types-for-erlang-otp.html#5858" class="Bound"
      >A</a
      ><a name="5870"
      > </a
      ><a name="5871" href="linear-types-for-erlang-otp.html#5351" class="InductiveConstructor Operator"
      >&#8855;</a
      ><a name="5872"
      > </a
      ><a name="5873" href="linear-types-for-erlang-otp.html#5728" class="Function Operator"
      >~</a
      ><a name="5874"
      > </a
      ><a name="5875" href="linear-types-for-erlang-otp.html#5862" class="Bound"
      >B</a
      ><a name="5876"
      >
</a
      ><a name="5877" href="linear-types-for-erlang-otp.html#5728" class="Function Operator"
      >~</a
      ><a name="5878"
      > </a
      ><a name="5879" class="Symbol"
      >(</a
      ><a name="5880" href="linear-types-for-erlang-otp.html#5880" class="Bound"
      >A</a
      ><a name="5881"
      > </a
      ><a name="5882" href="linear-types-for-erlang-otp.html#5347" class="InductiveConstructor Operator"
      >&#8853;</a
      ><a name="5883"
      > </a
      ><a name="5884" href="linear-types-for-erlang-otp.html#5884" class="Bound"
      >B</a
      ><a name="5885" class="Symbol"
      >)</a
      ><a name="5886"
      > </a
      ><a name="5887" class="Symbol"
      >=</a
      ><a name="5888"
      > </a
      ><a name="5889" href="linear-types-for-erlang-otp.html#5728" class="Function Operator"
      >~</a
      ><a name="5890"
      > </a
      ><a name="5891" href="linear-types-for-erlang-otp.html#5880" class="Bound"
      >A</a
      ><a name="5892"
      > </a
      ><a name="5893" href="linear-types-for-erlang-otp.html#5316" class="InductiveConstructor Operator"
      >&amp;</a
      ><a name="5894"
      > </a
      ><a name="5895" href="linear-types-for-erlang-otp.html#5728" class="Function Operator"
      >~</a
      ><a name="5896"
      > </a
      ><a name="5897" href="linear-types-for-erlang-otp.html#5884" class="Bound"
      >B</a
      ><a name="5898"
      >
</a
      ><a name="5899" href="linear-types-for-erlang-otp.html#5728" class="Function Operator"
      >~</a
      ><a name="5900"
      > </a
      ><a name="5901" class="Symbol"
      >(</a
      ><a name="5902" href="linear-types-for-erlang-otp.html#5902" class="Bound"
      >A</a
      ><a name="5903"
      > </a
      ><a name="5904" href="linear-types-for-erlang-otp.html#5351" class="InductiveConstructor Operator"
      >&#8855;</a
      ><a name="5905"
      > </a
      ><a name="5906" href="linear-types-for-erlang-otp.html#5906" class="Bound"
      >B</a
      ><a name="5907" class="Symbol"
      >)</a
      ><a name="5908"
      > </a
      ><a name="5909" class="Symbol"
      >=</a
      ><a name="5910"
      > </a
      ><a name="5911" href="linear-types-for-erlang-otp.html#5728" class="Function Operator"
      >~</a
      ><a name="5912"
      > </a
      ><a name="5913" href="linear-types-for-erlang-otp.html#5902" class="Bound"
      >A</a
      ><a name="5914"
      > </a
      ><a name="5915" href="linear-types-for-erlang-otp.html#5320" class="InductiveConstructor Operator"
      >&#8523;</a
      ><a name="5916"
      > </a
      ><a name="5917" href="linear-types-for-erlang-otp.html#5728" class="Function Operator"
      >~</a
      ><a name="5918"
      > </a
      ><a name="5919" href="linear-types-for-erlang-otp.html#5906" class="Bound"
      >B</a
      ><a name="5920"
      >
</a
      ><a name="5921" href="linear-types-for-erlang-otp.html#5728" class="Function Operator"
      >~</a
      ><a name="5922"
      > </a
      ><a name="5923" class="Symbol"
      >(</a
      ><a name="5924" href="linear-types-for-erlang-otp.html#5378" class="InductiveConstructor Operator"
      >&#161;</a
      ><a name="5925"
      > </a
      ><a name="5926" href="linear-types-for-erlang-otp.html#5926" class="Bound"
      >A</a
      ><a name="5927"
      > </a
      ><a name="5928" class="Symbol"
      >)</a
      ><a name="5929"
      >  </a
      ><a name="5931" class="Symbol"
      >=</a
      ><a name="5932"
      > </a
      ><a name="5933" href="linear-types-for-erlang-otp.html#5382" class="InductiveConstructor Operator"
      >&#191;</a
      ><a name="5934"
      > </a
      ><a name="5935" href="linear-types-for-erlang-otp.html#5728" class="Function Operator"
      >~</a
      ><a name="5936"
      > </a
      ><a name="5937" href="linear-types-for-erlang-otp.html#5926" class="Bound"
      >A</a
      ><a name="5938"
      >
</a
      ><a name="5939" href="linear-types-for-erlang-otp.html#5728" class="Function Operator"
      >~</a
      ><a name="5940"
      > </a
      ><a name="5941" class="Symbol"
      >(</a
      ><a name="5942" href="linear-types-for-erlang-otp.html#5382" class="InductiveConstructor Operator"
      >&#191;</a
      ><a name="5943"
      > </a
      ><a name="5944" href="linear-types-for-erlang-otp.html#5944" class="Bound"
      >A</a
      ><a name="5945"
      > </a
      ><a name="5946" class="Symbol"
      >)</a
      ><a name="5947"
      >  </a
      ><a name="5949" class="Symbol"
      >=</a
      ><a name="5950"
      > </a
      ><a name="5951" href="linear-types-for-erlang-otp.html#5378" class="InductiveConstructor Operator"
      >&#161;</a
      ><a name="5952"
      > </a
      ><a name="5953" href="linear-types-for-erlang-otp.html#5728" class="Function Operator"
      >~</a
      ><a name="5954"
      > </a
      ><a name="5955" href="linear-types-for-erlang-otp.html#5944" class="Bound"
      >A</a
      ><a name="5956"
      >
</a
      ><a name="5957" href="linear-types-for-erlang-otp.html#5728" class="Function Operator"
      >~</a
      ><a name="5958"
      > </a
      ><a name="5959" class="Symbol"
      >(</a
      ><a name="5960" href="linear-types-for-erlang-otp.html#5403" class="InductiveConstructor Operator"
      >&#956;</a
      ><a name="5961"
      > </a
      ><a name="5962" href="linear-types-for-erlang-otp.html#5962" class="Bound"
      >F</a
      ><a name="5963" class="Symbol"
      >)</a
      ><a name="5964"
      >   </a
      ><a name="5967" class="Symbol"
      >=</a
      ><a name="5968"
      > </a
      ><a name="5969" href="linear-types-for-erlang-otp.html#5544" class="Function"
      >&#957;[</a
      ><a name="5971"
      > </a
      ><a name="5972" href="linear-types-for-erlang-otp.html#5972" class="Bound"
      >X</a
      ><a name="5973"
      > </a
      ><a name="5974" href="linear-types-for-erlang-otp.html#5544" class="Function"
      >]</a
      ><a name="5975" class="Symbol"
      >(</a
      ><a name="5976" href="linear-types-for-erlang-otp.html#5728" class="Function Operator"
      >~</a
      ><a name="5977"
      > </a
      ><a name="5978" href="linear-types-for-erlang-otp.html#5962" class="Bound"
      >F</a
      ><a name="5979"
      > </a
      ><a name="5980" href="linear-types-for-erlang-otp.html#5972" class="Bound"
      >X</a
      ><a name="5981" class="Symbol"
      >)</a
      ><a name="5982"
      >
</a
      ><a name="5983" href="linear-types-for-erlang-otp.html#5728" class="Function Operator"
      >~</a
      ><a name="5984"
      > </a
      ><a name="5985" class="Symbol"
      >(</a
      ><a name="5986" href="linear-types-for-erlang-otp.html#5407" class="InductiveConstructor Operator"
      >&#957;</a
      ><a name="5987"
      > </a
      ><a name="5988" href="linear-types-for-erlang-otp.html#5988" class="Bound"
      >F</a
      ><a name="5989" class="Symbol"
      >)</a
      ><a name="5990"
      >   </a
      ><a name="5993" class="Symbol"
      >=</a
      ><a name="5994"
      > </a
      ><a name="5995" href="linear-types-for-erlang-otp.html#5530" class="Function"
      >&#956;[</a
      ><a name="5997"
      > </a
      ><a name="5998" href="linear-types-for-erlang-otp.html#5998" class="Bound"
      >X</a
      ><a name="5999"
      > </a
      ><a name="6000" href="linear-types-for-erlang-otp.html#5530" class="Function"
      >]</a
      ><a name="6001" class="Symbol"
      >(</a
      ><a name="6002" href="linear-types-for-erlang-otp.html#5728" class="Function Operator"
      >~</a
      ><a name="6003"
      > </a
      ><a name="6004" href="linear-types-for-erlang-otp.html#5988" class="Bound"
      >F</a
      ><a name="6005"
      > </a
      ><a name="6006" href="linear-types-for-erlang-otp.html#5998" class="Bound"
      >X</a
      ><a name="6007" class="Symbol"
      >)</a
      >
{% endraw %}</pre>

<pre class="Agda">{% raw %}
<a name="6034" href="linear-types-for-erlang-otp.html#6034" class="Function Operator"
      >_&#8888;_</a
      ><a name="6037"
      > </a
      ><a name="6038" class="Symbol"
      >:</a
      ><a name="6039"
      > </a
      ><a name="6040" href="linear-types-for-erlang-otp.html#5233" class="Datatype"
      >Type</a
      ><a name="6044"
      > </a
      ><a name="6045" class="Symbol"
      >&#8594;</a
      ><a name="6046"
      > </a
      ><a name="6047" href="linear-types-for-erlang-otp.html#5233" class="Datatype"
      >Type</a
      ><a name="6051"
      > </a
      ><a name="6052" class="Symbol"
      >&#8594;</a
      ><a name="6053"
      > </a
      ><a name="6054" href="linear-types-for-erlang-otp.html#5233" class="Datatype"
      >Type</a
      ><a name="6058"
      >
</a
      ><a name="6059" href="linear-types-for-erlang-otp.html#6059" class="Bound"
      >A</a
      ><a name="6060"
      > </a
      ><a name="6061" href="linear-types-for-erlang-otp.html#6034" class="Function Operator"
      >&#8888;</a
      ><a name="6062"
      > </a
      ><a name="6063" href="linear-types-for-erlang-otp.html#6063" class="Bound"
      >B</a
      ><a name="6064"
      > </a
      ><a name="6065" class="Symbol"
      >=</a
      ><a name="6066"
      > </a
      ><a name="6067" href="linear-types-for-erlang-otp.html#5728" class="Function Operator"
      >~</a
      ><a name="6068"
      > </a
      ><a name="6069" href="linear-types-for-erlang-otp.html#6059" class="Bound"
      >A</a
      ><a name="6070"
      > </a
      ><a name="6071" href="linear-types-for-erlang-otp.html#5320" class="InductiveConstructor Operator"
      >&#8523;</a
      ><a name="6072"
      > </a
      ><a name="6073" href="linear-types-for-erlang-otp.html#6063" class="Bound"
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
