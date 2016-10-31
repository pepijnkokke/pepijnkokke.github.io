---
title        : "Linear Types for Erlang/OTP (1)"
date         : 2016-10-25 12:00:00
categories   : []
tags         : [draft, agda, erlang, process calculus]
extra-script : agda-extra-script.html
extra-style  : agda-extra-style.html
---

*This is the first post in a series in which I will investigate linear
types for Erlang/OTP. In these posts, I will discuss the the generic
server architecture implemented in Erlang's `gen_server` and
supervisor trees.*

*Whenever possible, I will implement similar programs directly in
Wadler's [Classical Processes](https://github.com/pepijnkokke/cpgv).
Quite often, however, the type system for CP will not be expressive
enough to type such programs. In these cases, I will implement the
types and programs using Agda as my meta-language---as a sort-of
template CP.*

## Prelude: Linear Types

As mentioned I will occasionally resort to using Agda as my
meta-language. In this post, I will use Agda to talk about linear
types---and in order to do that, I need to tell Agda what linear types
are.

<div class="hidden">
\begin{code}
open import Data.Fin using (Fin; suc; zero)
open import Data.Nat using (ℕ; _+_)
open import Data.Vec using (Vec; map; foldr₁; allFin)
open import Data.Product using (_×_; _,_)
open import Relation.Binary.PropositionalEquality using (_≡_; refl)
\end{code}
</div>

<div class="hidden">
\begin{code}
module 2016-10-25-linear-types-for-erlang-otp-1 where
\end{code}
</div>

<div class="hidden">
\begin{code}
infix  9 +_ -_
infix  8 ~_
infix  7 ¡_ ¿_
infixl 6 _&_ _⅋_ _⊕_ _⊗_
infixr 5 _⊸_
\end{code}
</div>

Below I define a small Agda module which describes linear types. Feel
free to inspect it. Briefly, it defines the structure of linear types
as close to the syntax of linear logic as we can get.

<div class="foldable">
\begin{code}
-- Prelude. Click `+` to unfold.

-- As we can have both positive and negative atoms, we
-- defined a type `Pol`, which will represent the polarities
-- of primitive types.
data Pol : Set where
  pos : Pol
  neg : Pol

-- As in software foundations, we defined identifiers as a
-- simple wrapper type around the natural numbers.
data Id : Set where
  id : ℕ → Id

-- The types are defined, using as much as is possible of the
-- original syntax of linear logic. The only except are the
-- exponentials: ? is a reserved symbol, so we use ¡ and ¿.
data Type : Set where
  var     : Pol → Id → Type
  ⊤   ⊥   : Type
  𝟘   𝟙   : Type
  _&_ _⅋_ : Type → Type → Type
  _⊕_ _⊗_ : Type → Type → Type
  ¡_  ¿_  : Type -> Type
  μ   ν   : (Id → Type) → Type

-- While we would like to be able to treat both positive
-- and negative occurances of variables as a single case
-- in proofs, writing `var pos X` is tedious. Therefore,
-- we defined the syntax (+ A) and (- A) for variables.
pattern +_ A = var pos A
pattern -_ A = var neg A
{-# DISPLAY var pos A = + A #-}
{-# DISPLAY var neg A = - A #-}

-- We want to be able to write both (μ F) and (μ[ X ] A).
-- Therefore, we define the primitive type constructor as
-- μ, and attach a syntax macro which allows it to bind an
-- argument X. This way we never have to write μ (λ X → A)).
syntax μ (λ X → A) = μ[ X ] A
syntax ν (λ X → A) = ν[ X ] A

-- We define negation as a recursive function over the
-- structure of types -- as you would expect, basically.
~_ : Type → Type
~ (+ A)   = - A           ; ~ (- A)   = + A
~ 𝟘       = ⊤             ; ~ ⊤       = 𝟘
~ 𝟙       = ⊥             ; ~ ⊥       = 𝟙
~ (A ⊕ B) = ~ A & ~ B     ; ~ (A & B) = ~ A ⊕ ~ B
~ (A ⊗ B) = ~ A ⅋ ~ B     ; ~ (A ⅋ B) = ~ A ⊗ ~ B
~ (¡ A )  = ¿ ~ A         ; ~ (¿ A )  = ¡ ~ A
~ (μ F)   = ν[ X ](~ F X) ; ~ (ν F)   = μ[ X ](~ F X)
\end{code}
</div>

For instance, we can use the definitions in this module to define the
lollipop.

\begin{code}
_⊸_ : Type → Type → Type
A ⊸ B = ~ A ⅋ B
\end{code}

Another thing that we can do---which will be extremely useful later
on---is to define the structure of "named" sums. The implementation of
CP supports these, and I use them quite heavily to implement datatypes.

This is also where the use of Agda as a meta-language becomes
apparent. I cannot describe these types *within* CP, but I can
describe them as a *template* on top of CP, and use Agda to feel
reassured that what I'm doing is relatively sane.

We define named sums as a *fold* over a finite list of names, applying
some type-level function *F* to each name, and joining the resulting
types with plus (`⊕`). Then we define a syntax macro which hides the
binder in the function `F`.

\begin{code}
syntax ⊕-Fin (λ i → A) = ⊕[ i ] A

⊕-Fin : ∀ {n} (F : Fin (2 + n) → Type) → Type
⊕-Fin {n} F = foldr₁ _⊕_ (map F (allFin (2 + n)))
\end{code}

We define a similar construction for with (`&`).

\begin{code}
syntax &-Fin (λ i → A) = &[ i ] A

&-Fin : ∀ {n} (F : Fin (2 + n) → Type) → Type
&-Fin {n} F = foldr₁ _&_ (map F (allFin (2 + n)))
\end{code}

This is as good a time as any to mention that this post is *both*
literate Agda and literate [CP](https://github.com/pepijnkokke/cpgv).


## The Road to the Generic Server: The Basic Server

In the first few posts, I will let myself be guided by Joe Armstrong's
*Road to the Generic Server*[^armstrong], in which he explains what he
considers to be the most important part of Erlang---the generic server.

Below I've reproduced (without any permission) a small Erlang module
from Joe's book. This module implements the first generic server: it
exports the function `start/2`, which starts a server which behaves
according to some request handler, and the function `rpc/2`,
which---as it's name suggests---sends procedure calls to the server.
In this first attempt, the server merely receives requests, and
handles them using the given request handler.

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

Joe then writes a small request handler for `server1`. This handler
can handle two types of requests: `add` and `whereis`.
For example, the request `{add,joe,at_home}` will tell the server
that joe is currently at home---this overwrites any previous knowledge
the server might've had about Joe's location. The request
`{whereis,joe}` will ask the server where Joe is.

This behaviour is implemented in the function `handle/2`. The
functions `add` and `whereis` then communicate with the `name_server`
by sending remote proceduce calls using `rpc/2`.

``` erlang
module(name_server).
export([init/0, add/2, whereis/1, handle/2]).
import(server1, [rpc/2]).

%% client routines
add(Name, Place) -> rpc(name_server, {add, Name, Place}).
whereis(Name)    -> rpc(name_server, {whereis, Name}).

%% callback routines
init() -> dict::new().

handle({add, Name, Place}, Dict) -> {ok, dict:store(Name, Place, Dict)};
handle({whereis, Name}, Dict)    -> {dict:find(Name, Dict), Dict}.
```

The point is this: We specified a server and its client as a
sequential function---`handle`---and a pair of remote procedure
calls. We didn't have to be aware of any underlying concurreny.

If we want to use the `name_server` module, we simply start a
server---the only telltale sign that some measure of concurrency is
involved---and then use the exposed remote procedure calls.

``` erlang
1> server1:start(name_server, name_server).
true
2> name_server:add(joe, "at home").
ok
3> name_server:whereis(joe).
{ok, "at home"}
```


## A generic server in Classical Processes?

Before we start to think about how to translate `server1` to CP, it
may be useful to consider which parts are essential, and which parts
are merely useful. For instance, starting the server and binding it to
a global name---using `register/2` might be incredible useful.
However, such instances of dynamic name binding are tedious to
formalise. Instead, we choose to read this code more like an assignment.

``` erlang
main() ->
  name_server = spawn(fun() -> loop(...) end).
  ...
```

This allows us to treat the spawning of a server as a top-level cut,
and the PID assigned to `name_server` as a channel.

This means that the main problem is implementing `loop/2`. If we
briefly consider the arguments of loop, we see that it should receive
some initial state `Init`, and some request handler `Mod`---the `Name`
argument is no longer required.
The type of the initial state can be whatever we need. However, the
type of the request handler should be a sum of "handler functions"...

``` coq
Handler := +{ ... callback types ...  }
```

The server that it returns should be able to handle various requests,
which should correspond to the requests handled by `Mod`...

``` coq
Server := +{ ... similar callback types without state ... } * Server
```

This constraint may be somewhat tricky---if not impossible---to
formalise using the types of CP... so it may be easier to start out by
implementing the `name_server`.


## A name server in Classical Processes

Of course, if our exercise in implementing the `name_server` is to
have any value, we must use the same structure that we would use
generically. That is to say, we should construct it using a
"sequential" request handler and a loop function.
This is what we will do... in a while...

### Names, places, stuff...

CP doesn't exactly come with a rich standard library, which means
we'll have to implement the datatypes we need. First, we implement two
datatypes to represent names and places. We'll represent both as
named sums: all possible names are `joe` and `helen`, and all possible
places are `at_home` and `at_work`---that second one at least seems
general enough to me.

In addition to these basic types, we define the processes which
communicate these values along a channel. And because we'll often use
places in non-linear manners---because it's convenient, not because
it's needed---we'll have their processes communicate !-places instead.

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

Secondly, we define dictionaries. That is to say, finite maps between
names and (maybe) places. We really don't want to get into defining
generic maps right now, trust me.

``` haskell
type Maybe(A) = +{nothing:1, just:A}.
type Dict     = Name -o Maybe(Place).
```

To use such dictionaries, we define a couple functions:

  - `Empty(d)` sends an empty dictionary along d;
  - `Store(d,n,p,d1)` receives a dictionary d, a name n, and a
    place p, and then sends a dictionary along d1 which maps n
    to p and all other names according to d; and,
  - `Find(d,n,p)` receives a dictionary d and a name n,
    and sends the place associated with n according to d along p.

What you'd expect them to do, basically. Their definitions have been
folded because they're tedious and the post isn't really concerned
with how to implement dictionaries---nor would they help you if we
really wanted to implement a generic dictionary. Feel free to inspect
them, though.

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

While we're at it, we should probably tell Agda about these types.

<div class="foldable">
\begin{code}
Maybe : Type → Type
Maybe A = 𝟙 ⊕ A
Name    = 𝟙 ⊕ 𝟙
Place   = 𝟙 ⊕ 𝟙
Dict    = Name ⊸ Maybe Place
\end{code}
</div>


### Modules and their types

We can implement the type of the `name_server`... euh... module
as... well, as follows: it should respond to either `add` or
`whereis`. In the first case, it should receive a name, a place and a
dict, and it'll reply with *nothing*, but update the dictionary. In
the second case, it'll receive just a name *n* and a dict---and it'll
reply with whatever location it finds in the dict under *n*, but it'll
leave it dict unchanged.

``` haskell
type  Module =
      &{ add     : (Name * !Place * !Dict) -o (1 * !Dict)
       , whereis : (Name * !Dict) -o (!Maybe(Place) * !Dict)
       }.
```

We can implement a `name_server` module which does what it ought to do in CP.

``` haskell
check Module(h) |- h : !Module.
def   Module(h) = !h(h).case h
      { add     : h(d).d(p).p(n).h[x].( x[].0 | Store(d,n,p,h) )
      ; whereis : h(d).d(n).h[p].( Find(d,n,p) | h<->d )
      }.
```

There *is* a generic pattern to module types: they form a named
"with", in which the types of each option follow a specific pattern,
but are allowed to vary in some parameters with the *name*.

\begin{code}
Module : ∀ {n} (A R : Fin (2 + n) → Type) (S : Type) → Type
Module A R S = &[ i ] (A i ⊗ S ⊸ R i ⊗ S)
\end{code}

We can use this type to derive the type for the `name_server`
module. First, we defined a datatype for requests. We can either
define this as a datatype, and then provide a bijection with a finite
type, or we can simply define it as some syntactic sugar on top of
finite types. We'll choose the second option here.

\begin{code}
Request = Fin 2
pattern add     = zero
pattern whereis = suc zero
pattern end     = suc (suc ())
\end{code}

Once we have a type for requests, we can define the `A`, `R` and `S`
parameters of `Module`.

\begin{code}
A : Request → Type
A add     = Name ⊗ ¡ Place
A whereis = Name
A end

R : Request → Type
R add     = 𝟙
R whereis = ¡ Maybe Place
R end

S : Type
S = ¡ Dict
\end{code}

Now we can show that `Module A R S` indeed derives the correct type.

\begin{code}
NameModule = Module A R S
-->
test_NameModule : NameModule ≡
  {- add     -} (Name ⊗ ¡ Place ⊗ ¡ Dict ⊸ 𝟙             ⊗ ¡ Dict) &
  {- whereis -} (Name           ⊗ ¡ Dict ⊸ ¡ Maybe Place ⊗ ¡ Dict)
test_NameModule = refl
\end{code}


### Servers and loops

The server type is *similar* to that of the module, but different in
subtle ways. First of all, a module only needs to handle a single
request. However, a server---after handling a request---should be
ready to receive the next one.

Therefore, server types are greatest fixed points: they will handle a
request, and return a new channel on which they can receive requests.
Ideally, this wouldn't *need* to terminate---we can hold the server
channel for a while, and then return it to the environment when we are
done interacting.[^locks] However, for practical purposes, we'll have
the server respond to a request to `halt`, in addition to the
`name_server` requests `add` and `whereis`.

``` haskell
type  Server = nu X.
      &{ halt    : 1
       , add     : (!Name * !Place) -o (1 * X)
       , whereis : !Name -o (!Maybe(Place) * X)
       }.
```

Now, our mission is to construct a server using a module and an
initial state---to define `loop`. This---it turns out---is not
possible in CP. The reason for this is the definition of the
$$(\nu)$$-rule.

As it is defined in *Talking Bananas*[^talkban], corec is only
well-type if the context consists *solely* of the channels involved in
the recursion. This is crucial to preserve linearity, since channels
involved in a recursion may be used an arbitrary number of
times. However, it should not be harmful to allow a context of
unrestricted channels (and perhaps fixed points) to be used during the
recursion. We define $$(\nu')$$ to be the variant which allows this.

$$
    \frac%
    {P \vdash y : A^{\bot}, x : F(A)}%
    {\text{corec }x(y).P \vdash y : A^{\bot}, x : \nu F}%
    (\nu)
    \qquad
    \frac%
    {P \vdash !\Gamma, y : A^{\bot}, x : F(A)}%
    {\text{corec }x(y).P \vdash !\Gamma, y : A^{\bot}, x : \nu F}%
    (\nu')
$$

It turns out that such a rule is exactly what we need to define
`loop`. The loop is a fold over all requests the server will receive,
with the corec threading the state through the server. The freedom
that we gained in $$(\nu')$$ is exactly what we needed to be able to
*respond* to requests---albeit always non-linearily.[^munu]

``` haskell
check Loop(d,h,s) |- d : ~!Dict, h : ~!Module, s : Server.
def   Loop(d,h,s) =
      corec s(d).case s
      { halt    : s[].0
      ; add     : s(p).p(n).
                  ?h[h].h/add.h[h].(h[h].(h[h].(?n[n].h<->n|h<->p)|h<->d)|
                  h(r).s[s].(s<->r|s<->h))
      ; whereis : s(n).
                  ?h[h].h/whereis.h[h].(
                  h[h].(?n[n].h<->n|h<->d)|
                  h(r).s[s].(s<->r|s<->h))
      }.
```

We can look at an example execution of such a server. For instance,
how would we encode the example from way-up-above in the bit about
Erlang? I mean this one:

``` erlang
1> server1:start(name_server, name_server).
true
2> name_server:add(joe, "at home").
ok
3> name_server:whereis(joe).
{ok, "at home"}
```

Well, the anwer is, we'd encode it as follow. We spawn an empty
dictionary and a module, and use them to start a server. We then send
two `add` requests to the server, storing the locations of `joe` and
`helen`, and finally request the location of `joe`.

``` haskell
check   new [d:!Dict]   ( Empty(d)    |
        new [h:!Module] ( Module(h)   |
        new [s:Server]  ( Loop(d,h,s) |
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
            s/whereis.
            s[s].( !s(s).s/joe.s[].0 |
            s(r).
        rec s.
            s/halt.
            s().
        p<->r
        ) ) ) ) ) ) |- p : !Maybe(Place).
```

This normalises, eventually, to the channel that just sends
`at_home`. Exactly as we'd want.

``` haskell
check   !p(p).p/just.p/at_home.p[].0
        |- p : !Maybe(Place).
```

So: what is the type of a generic server? It's very similar to that of
a module---a named with where the types of the different options are
allowed to vary with the name.

\begin{code}
Server : ∀ {n} (A R : Fin (2 + n) → Type) → Type
Server A R = ν[ X ] &[ i ] (A i ⊸ R i ⊗ + X)
\end{code}

We can check this by showing that the server type for the
`name_server` derived from `Server` corresponds to the type that we
wrote down in our CP implementation. And indeed it does.

\begin{code}
NameServer = Server A R
-->
test_NameServer : NameServer ≡ ν[ X ] (
  {- add     -} (Name ⊗ ¡ Place ⊸ 𝟙             ⊗ + X ) &
  {- whereis -} (Name           ⊸ ¡ Maybe Place ⊗ + X))
test_NameServer = refl
\end{code}

This makes the type of `loop` fairly easy to define: it's a function
from a module to a server, where the both respect the same names, and
their argument and response types vary with the name in the same way.

\begin{code}
Loop : ∀ {n} (A R : Fin (2 + n) → Type) (S : Type) → Type
Loop A R S = Module A R S ⊸ Server A R
\end{code}

---

[^armstrong]: Joe Armstrong, *Programming Erlang: Software for a
    Concurrent World*. The Pragmatic Bookshelf, 2007. Chapter 16.

[^locks]: This has a strong feeling of locks to it. This makes sense,
    as CP is a synchronous π-calculus. If we move to an asynchronous
    π-calculus, we might be able to give semantics for a server that
    feel a little less... lock-y.

[^talkban]: Sam Lindley and Garrett J. Morris, *Talking Bananas:
    Structural Recursion for Session Types*. In the proceedings of
    [ICFP 2016](http://conf.researchr.org/home/icfp-2016/).

[^munu]: It may be sane to include fixed points in such contexts as
    well.
