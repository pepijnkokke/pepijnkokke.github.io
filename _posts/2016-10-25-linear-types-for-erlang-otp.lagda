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
\begin{code}
open import Level using (suc)

module linear-types-for-erlang-otp where
\end{code}
</div>

\begin{code}
data Pol : Set where
  pos : Pol
  neg : Pol
\end{code}

<div class="hidden">
\begin{code}
infix  9 +_
infix  9 -_
infix  8 ~_
infix  7 ¡_
infix  7 ¿_
infixl 6 _&_
infixl 6 _⅋_
infixl 6 _⊕_
infixl 6 _⊗_
infixr 5 _⊸_
infix  4 μ_
infix  4 ν_
\end{code}
</div>

\begin{code}
data Type : Set₁ where
  el      : Pol → Set → Type
  ⊤   ⊥   : Type
  𝟘   𝟙   : Type
  _&_ _⅋_ : Type → Type → Type
  _⊕_ _⊗_ : Type → Type → Type
  ¡_  ¿_  : Type -> Type
  μ_  ν_  : (Set → Type) → Type
\end{code}

<div class="foldable">
\begin{code}
pattern +_ A = el pos A
pattern -_ A = el neg A

μ-syntax = μ_
ν-syntax = ν_

syntax μ-syntax (λ X → A) = μ[ X ] A
syntax ν-syntax (λ X → A) = ν[ X ] A

{-# DISPLAY el pos A = + A #-}
{-# DISPLAY el neg A = - A #-}
\end{code}
</div>

\begin{code}
~_ : Type → Type
~ (+ A)   = - A
~ (- A)   = + A
~ ⊤       = 𝟘
~ ⊥       = 𝟙
~ 𝟘       = ⊤
~ 𝟙       = ⊥
~ (A & B) = ~ A ⊕ ~ B
~ (A ⅋ B) = ~ A ⊗ ~ B
~ (A ⊕ B) = ~ A & ~ B
~ (A ⊗ B) = ~ A ⅋ ~ B
~ (¡ A )  = ¿ ~ A
~ (¿ A )  = ¡ ~ A
~ (μ F)   = ν[ X ](~ F X)
~ (ν F)   = μ[ X ](~ F X)
\end{code}

\begin{code}
_⊸_ : Type → Type → Type
A ⊸ B = ~ A ⅋ B
\end{code}

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
