---
title         : "Stlc: The Simply Typed Lambda-Calculus"
layout        : default
hide-implicit : false
extra-script  : agda-extra-script.html
extra-style   : agda-extra-style.html
---

<div class="hidden">
\begin{code}
open import Data.Empty using (⊥; ⊥-elim)
open import Data.Maybe using (Maybe; just; nothing)
open import Data.Nat using (ℕ; suc; zero; _+_)
open import Data.Product using (∃; ∄; _,_)
open import Function using (_∘_; _$_)
open import Relation.Nullary using (Dec; yes; no)
open import Relation.Binary.PropositionalEquality using (_≡_; _≢_; refl)
\end{code}
</div>

\begin{code}
module Stlc where
\end{code}

# The Simply Typed Lambda-Calculus

The simply typed lambda-calculus (STLC) is a tiny core
calculus embodying the key concept of _functional abstraction_,
which shows up in pretty much every real-world programming
language in some form (functions, procedures, methods, etc.).

We will follow exactly the same pattern as in the previous chapter
when formalizing this calculus (syntax, small-step semantics,
typing rules) and its main properties (progress and preservation).
The new technical challenges arise from the mechanisms of
_variable binding_ and _substitution_.  It which will take some
work to deal with these.


## Overview

The STLC is built on some collection of _base types_:
booleans, numbers, strings, etc.  The exact choice of base types
doesn't matter much -- the construction of the language and its
theoretical properties work out the same no matter what we
choose -- so for the sake of brevity let's take just `bool` for
the moment.  At the end of the chapter we'll see how to add more
base types, and in later chapters we'll enrich the pure STLC with
other useful constructs like pairs, records, subtyping, and
mutable state.

Starting from boolean constants and conditionals, we add three
things:

  - variables
  - function abstractions
  - application

This gives us the following collection of abstract syntax
constructors (written out first in informal BNF notation -- we'll
formalize it below).

    t ::= x                       variable
        | λx:T1.t2                abstraction
        | t1 t2                   application
        | true                    constant true
        | false                   constant false
        | if t1 then t2 else t3   conditional


The `\` symbol in a function abstraction `λx:T1.t2` is generally
written as a Greek letter "lambda" (hence the name of the
calculus).  The variable `x` is called the _parameter_ to the
function; the term `t2` is its _body_.  The annotation `:T1`
specifies the type of arguments that the function can be applied
to.

Some examples:

  - `λx:bool. x`

    The identity function for booleans.
  - `(λx:bool. x) true`

    The identity function for booleans, applied to the boolean `true`.
  - `λx:bool. if x then false else true`

    The boolean "not" function.
  - `λx:bool. true`

    The constant function that takes every (boolean) argument to `true`.
  - `λx:bool. λy:bool. x`

    A two-argument function that takes two booleans and returns the
    first one.  (As in Agda, a two-argument function is really a
    one-argument function whose body is also a one-argument function.)
  - `(λx:bool. λy:bool. x) false true`

    A two-argument function that takes two booleans and returns the
    first one, applied to the booleans `false` and `true`.

    As in Agda, application associates to the left -- i.e., this
    expression is parsed as `((λx:bool. λy:bool. x) false) true`.
  - `\f:bool⇒bool. f (f true)`

    A higher-order function that takes a _function_ `f` (from booleans
    to booleans) as an argument, applies `f` to `true`, and applies
    `f` again to the result.
  - `(\f:bool⇒bool. f (f true)) (λx:bool. false)`

    The same higher-order function, applied to the constantly `false`
    function.

As the last several examples show, the STLC is a language of
_higher-order_ functions: we can write down functions that take
other functions as arguments and/or return other functions as
results.

The STLC doesn't provide any primitive syntax for defining _named_
functions -- all functions are "anonymous."  We'll see in chapter
`MoreStlc` that it is easy to add named functions to what we've
got -- indeed, the fundamental naming and binding mechanisms are
exactly the same.

The _types_ of the STLC include `bool`, which classifies the
boolean constants `true` and `false` as well as more complex
computations that yield booleans, plus _arrow types_ that classify
functions.


    T ::= bool
        | T1 → T2

For example:

  - `λx:bool. false` has type `bool⇒bool`
  - `λx:bool. x` has type `bool⇒bool`
  - `(λx:bool. x) true` has type `bool`
  - `λx:bool. λy:bool. x` has type `bool⇒bool⇒bool`
    (i.e., `bool⇒(bool⇒bool)`)
  - `(λx:bool. λy:bool. x) false` has type `bool⇒bool`
  - `(λx:bool. λy:bool. x) false true` has type `bool`

## Syntax

We begin by formalizing the syntax of the STLC.


### Types

\begin{code}
data Type : Set where
  bool : Type
  _⇒_ : Type → Type → Type

infixr 5 _⇒_
\end{code}


### Terms

\begin{code}
data Id : Set where
  id : ℕ → Id
\end{code}

<div class="hidden">
\begin{code}
id-inj : ∀ {x y} → id x ≡ id y → x ≡ y
id-inj refl = refl

_≟_ : (x y : Id) → Dec (x ≡ y)
id x ≟ id y with x Data.Nat.≟ y
... | yes x=y rewrite x=y = yes refl
... | no  x≠y = no (x≠y ∘ id-inj)
\end{code}
</div>

\begin{code}
data Term : Set where
  var   : Id → Term
  app   : Term → Term → Term
  abs   : Id → Type → Term → Term
  true  : Term
  false : Term
  if_then_else_ : Term → Term → Term → Term

infixr 8 if_then_else_
\end{code}

Note that an abstraction `λx:A.t` (formally, `abs x A t`) is
always annotated with the type `A` of its parameter, in contrast
to Agda (and other functional languages like ML, Haskell, etc.),
which use _type inference_ to fill in missing annotations.  We're
not considering type inference here.

Some examples...

\begin{code}
x = id 0
y = id 1
z = id 2
\end{code}
<div class="hidden">
\begin{code}
{-# DISPLAY zero = x #-}
{-# DISPLAY suc zero = y #-}
{-# DISPLAY suc (suc zero) = z #-}
\end{code}
</div>

`idB = λx:bool. x`

\begin{code}
idB = (abs x bool (var x))
\end{code}

`idBB = λx:bool⇒bool. x`

\begin{code}
idBB = (abs x (bool ⇒ bool) (var x))
\end{code}

`idBBBB = λx:(bool⇒bool) → (bool⇒bool). x`

\begin{code}
idBBBB = (abs x ((bool ⇒ bool) ⇒ (bool ⇒ bool)) (var x))
\end{code}

`k = λx:bool. λy:bool. x`

\begin{code}
k = (abs x bool (abs y bool (var x)))
\end{code}

`notB = λx:bool. if x then false else true`

\begin{code}
notB = (abs x bool (if (var x) then false else true))
\end{code}

<div class="hidden">
\begin{code}
{-# DISPLAY abs 0 bool (var 0) = idB #-}
{-# DISPLAY abs 0 (bool ⇒ bool) (var 0) = idBB #-}
{-# DISPLAY abs 0 ((bool ⇒ bool) ⇒ (bool ⇒ bool)) (var 0) = idBBBB #-}
{-# DISPLAY abs 0 bool (abs y bool (var 0)) = k #-}
{-# DISPLAY abs 0 bool (if (var 0) then false else true) = notB #-}
\end{code}
</div>

## Operational Semantics

To define the small-step semantics of STLC terms, we begin,
as always, by defining the set of values.  Next, we define the
critical notions of _free variables_ and _substitution_, which are
used in the reduction rule for application expressions.  And
finally we give the small-step relation itself.

### Values

To define the values of the STLC, we have a few cases to consider.

First, for the boolean part of the language, the situation is
clear: `true` and `false` are the only values.  An `if`
expression is never a value.

Second, an application is clearly not a value: It represents a
function being invoked on some argument, which clearly still has
work left to do.

Third, for abstractions, we have a choice:

  - We can say that `λx:T. t1` is a value only when `t1` is a
    value -- i.e., only if the function's body has been
    reduced (as much as it can be without knowing what argument it
    is going to be applied to).

  - Or we can say that `λx:T. t1` is always a value, no matter
    whether `t1` is one or not -- in other words, we can say that
    reduction stops at abstractions.

Agda makes the first choice -- for example,

\begin{code}
testNormalize : (λ (x : ℕ) → 3 + 4) ≡ (λ (x : ℕ) → 7)
testNormalize = refl
\end{code}

Most real-world functional programming languages make the second
choice -- reduction of a function's body only begins when the
function is actually applied to an argument.  We also make the
second choice here.

\begin{code}
data Value : Term → Set where
  abs   : forall {x A t}
        → Value (abs x A t)
  true  : Value true
  false : Value false
\end{code}

Finally, we must consider what constitutes a _complete_ program.

Intuitively, a "complete program" must not refer to any undefined
variables.  We'll see shortly how to define the _free_ variables
in a STLC term.  A complete program is _closed_ -- that is, it
contains no free variables.

Having made the choice not to reduce under abstractions, we don't
need to worry about whether variables are values, since we'll
always be reducing programs "from the outside in," and that means
the `step` relation will always be working with closed terms.


### Substitution

Now we come to the heart of the STLC: the operation of
substituting one term for a variable in another term.  This
operation is used below to define the operational semantics of
function application, where we will need to substitute the
argument term for the function parameter in the function's body.
For example, we reduce

`(λx:bool. if x then true else x) false`

to

`if false then true else false`

by substituting `false` for the parameter `x` in the body of the
function.

In general, we need to be able to substitute some given term `s`
for occurrences of some variable `x` in another term `t`.  In
informal discussions, this is usually written `[x:=s]t` and
pronounced "substitute `x` with `s` in `t`."

Here are some examples:
  - `[x:=true](if x then x else false)`
     yields `if true then true else false`
  - `[x:=true]x`
    yields `true`
  - `[x:=true](if x then x else y)`
    yields `if true then true else y`
  - `[x:=true]y`
    yields `y`
  - `[x:=true]false`
    yields `false` (vacuous substitution)
  - `[x:=true](λy:bool. if y then x else false)`
    yields `λy:bool. if y then true else false`
  - `[x:=true](λy:bool. x)`
    yields `λy:bool. true`
  - `[x:=true](λy:bool. y)`
    yields `λy:bool. y`
  - `[x:=true](λx:bool. x)`
    yields `λx:bool. x`

The last example is very important: substituting `x` with `true` in
`λx:bool. x` does _not_ yield `λx:bool. true`!  The reason for
this is that the `x` in the body of `λx:bool. x` is _bound_ by the
abstraction: it is a new, local name that just happens to be
spelled the same as some global name `x`.

Here is the definition, informally...

    [x:=s]x         = s
    [x:=s]y         = y                  if x ≢ y
    [x:=s](λx:A. t) = λx:A. t
    [x:=s](λy:A. t) = λy:A. [x:=s]t      if x ≢ y
    [x:=s](t1 t2)   = ([x:=s]t1) ([x:=s]t2)
    [x:=s]true      = true
    [x:=s]false     = false
    [x:=s](if t1 then t2 else t3) =
      if [x:=s]t1 then [x:=s]t2 else [x:=s]t3


... and formally:

\begin{code}
[_:=_]_ : Id -> Term -> Term -> Term
[ x := v ] (var y) with x ≟ y
... | yes x=y = v
... | no  x≠y = var y
[ x := v ] (app s t) = app ([ x := v ] s) ([ x := v ] t)
[ x := v ] (abs y A t) with x ≟ y
... | yes x=y = abs y A t
... | no  x≠y = abs y A ([ x := v ] t)
[ x := v ] true  = true
[ x := v ] false = false
[ x := v ] (if s then t else u) =
  if [ x := v ] s then [ x := v ] t else  [ x := v ] u

infix 9 [_:=_]_
\end{code}

_Technical note_: Substitution becomes trickier to define if we
consider the case where `s`, the term being substituted for a
variable in some other term, may itself contain free variables.
Since we are only interested here in defining the `step` relation
on closed terms (i.e., terms like `λx:bool. x` that include
binders for all of the variables they mention), we can avoid this
extra complexity here, but it must be dealt with when formalizing
richer languages.


#### Exercise: 3 stars (substi)
The definition that we gave above defines substitution as a _function_.
Suppose, instead, we wanted to define substitution as an inductive _relation_.
We've begun the definition by providing the `data` header and
one of the constructors; your job is to fill in the rest of the
constructors and prove that the relation you\begin
              → [ x := s ] t ≡ t'
              → [ x := s ] t ==> t'
subst-correct s x t t' p = {!!} -- FILL IN HERE
\end{code}


### Reduction

The small-step reduction relation for STLC now follows the
same pattern as the ones we have seen before.  Intuitively, to
reduce a function application, we first reduce its left-hand
side (the function) until it becomes an abstraction; then we
reduce its right-hand side (the argument) until it is also a
value; and finally we substitute the argument for the bound
variable in the body of the abstraction.  This last rule, written
informally as

`(λx:T.t12) v2 ==> [x:=v2]t12`

is traditionally called "beta-reduction".

    value v2
    ----------------------------                         (red)
    (λx:T.t12) v2 ==> [x:=v2]t12

    t1 ==> t1'
    ----------------                                     (app1)
    t1 t2 ==> t1' t2

    value v1
    t2 ==> t2'
    ----------------                                     (app2)
    v1 t2 ==> v1 t2'

... plus the usual rules for booleans:

    --------------------------------                     (iftrue)
    (if true then t1 else t2) ==> t1

    ---------------------------------                    (iffalse)
    (if false then t1 else t2) ==> t2

    t1 ==> t1'
    ---------------------------------------------------- (if)
    (if t1 then t2 else t3) ==> (if t1' then t2 else t3)


Formally:

\begin{code}
data _==>_ : Term → Term → Set where
  red     : forall {x A s t}
          → Value t
          → app (abs x A s) t ==> [ x := t ] s
  app1    : forall {s s' t}
          → s ==> s'
          → app s t ==> app s' t
  app2    : forall {s t t'}
          → Value s
          → t ==> t'
          → app s t ==> app s t'
  if      : forall {s s' t u}
          → s ==> s'
          → if s then t else u ==> if s' then t else u
  iftrue  : forall {s t}
          → if true then s else t ==> s
  iffalse : forall {s t}
          → if false then s else t ==> t

infix 1 _==>_
\end{code}

<div class="hidden">
\begin{code}
data Multi (R : Term → Term → Set) : Term → Term → Set where
  refl : forall {x} -> Multi R x x
  step : forall {x y z} -> R x y -> Multi R y z -> Multi R x z
\end{code}
</div>

\begin{code}
_==>*_ : Term → Term → Set
_==>*_ = Multi _==>_
\end{code}

<div class="hidden">
\begin{code}
{-# DISPLAY Multi _==>_ = _==>*_ #-}
\end{code}
</div>

### Examples

Example:

    ((λx:bool⇒bool. x) (λx:bool. x)) ==>* (λx:bool. x)

\begin{code}
step-example1 : (app idBB idB) ==>* idB
step-example1 = step (red abs)
              $ refl
\end{code}

Example:

    ((λx:bool⇒bool. x) ((λx:bool⇒bool. x) (λx:bool. x)))
    ==>* (λx:bool. x)

\begin{code}
step-example2 : (app idBB (app idBB idB)) ==>* idB
step-example2 = step (app2 abs (red abs))
              $ step (red abs)
              $ refl
\end{code}

Example:

    ((λx:bool⇒bool. x) (λx:bool. if x then false else true)) true)
    ==>* false

\begin{code}
step-example3 : (app (app idBB notB) true) ==>* false
step-example3 = step (app1 (red abs))
              $ step (red true)
              $ step iftrue
              $ refl
\end{code}

Example:

    ((λx:bool → bool. x) ((λx:bool. if x then false else true) true))
    ==>* false

\begin{code}
step-example4 : (app idBB (app notB true)) ==>* false
step-example4 = step (app2 abs (red true))
              $ step (app2 abs iftrue)
              $ step (red false)
              $ refl
\end{code}

#### Exercise: 2 stars (step_example3)

\begin{code}
step-example5 : (app (app idBBBB idBB) idB) ==>* idB
step-example5 = {!!} -- FILL IN HERE
\end{code}


## Typing

Next we consider the typing relation of the STLC.

### Contexts

_Question_: What is the type of the term "`x y`"?

_Answer_: It depends on the types of `x` and `y`!

I.e., in order to assign a type to a term, we need to know
what assumptions we should make about the types of its free
variables.

This leads us to a three-place _typing judgment_, informally
written `Γ ⊢ t ∶ T`, where `Γ` is a "typing context" -- a mapping from
-- variables to their types.

Informally, we'll write `Γ, x:A` for "extend the partial function `Γ`
to also map `x` to `A`."  Formally, we use the function `_,_∶_` (or
"update") to add a binding to a context.

\begin{code}
Ctxt : Set
Ctxt = Id → Maybe Type

∅ : Ctxt
∅ = λ _ → nothing

_,_∶_ : Ctxt -> Id -> Type -> Ctxt
(Γ , x ∶ A) y with x ≟ y
... | yes x=y = just A
... | no  x≠y = Γ y

infixl 3 _,_∶_
\end{code}


### Typing Relation

    Γ x = T
    ---------                                  (var)
    Γ ⊢ x ∶ T

    Γ , x:A ⊢ t12 ∶ B
    ------------------                         (abs)
    Γ ⊢ λx:A.t12 ∶ A⇒B

    Γ ⊢ t1 ∶ A⇒B
    Γ ⊢ t2 ∶ A
    -------------                              (app)
    Γ ⊢ t1 t2 ∶ B

    ---------------                            (true)
    Γ ⊢ true ∶ bool

    ----------------                           (false)
    Γ ⊢ false ∶ bool

    Γ ⊢ t1 ∶ bool    Γ ⊢ t2 ∶ T    Γ ⊢ t3 ∶ T
    -----------------------------------------  (if)
    Γ ⊢ if t1 then t2 else t3 ∶ T


We can read the three-place relation `Γ ⊢ t ∶ T` as:
"to the term `t` we can assign the type `T` using as types for
the free variables of `t` the ones specified in the context
`Γ`."

\begin{code}
data _⊢_∶_ : Ctxt -> Term -> Type -> Set where
  var           : forall {Γ} x {A}
                → Γ x ≡ just A
                → Γ ⊢ var x ∶ A
  abs           : forall {Γ} {x} {A} {B} {s}
                → Γ , x ∶ A ⊢ s ∶ B
                → Γ ⊢ abs x A s ∶ A ⇒ B
  app           : forall {Γ} {A} {B} {s} {t}
                → Γ ⊢ s ∶ A ⇒ B
                → Γ ⊢ t ∶ A
                → Γ ⊢ app s t ∶ B
  true          : forall {Γ}
                → Γ ⊢ true  ∶ bool
  false         : forall {Γ}
                → Γ ⊢ false ∶ bool
  if_then_else_ : forall {Γ} {s} {t} {u} {A}
                → Γ ⊢ s ∶ bool
                → Γ ⊢ t ∶ A
                → Γ ⊢ u ∶ A
                → Γ ⊢ if s then t else u ∶ A

infix 1 _⊢_∶_
\end{code}

### Examples

\begin{code}
typing-example1 : ∅ ⊢ idB ∶ bool ⇒ bool
typing-example1 = abs (var x refl)
\end{code}

Another example:

    empty ⊢ λx:A. λy:A⇒A. y (y x)) ∶ A⇒(A⇒A)⇒A

\begin{code}
typing-example2 : ∅ ⊢
  (abs x bool
    (abs y (bool ⇒ bool)
      (app (var y)
        (app (var y) (var x))))) ∶
  (bool ⇒ (bool ⇒ bool) ⇒ bool)
typing-example2 =
  (abs
    (abs
      (app (var y refl)
        (app (var y refl) (var x refl) ))))
\end{code}

#### Exercise: 2 stars (typing_example_3)
Formally prove the following typing derivation holds:

    empty ⊢ λx:bool⇒B. λy:bool⇒bool. \z:bool. y (x z) ∶ T.

\begin{code}
typing-example3 : ∃ λ A → ∅ ⊢
  (abs x (bool ⇒ bool)
    (abs y (bool ⇒ bool)
      (abs z bool
        (app (var y) (app (var x) (var z)))))) ∶ A
typing-example3 = {!!} -- FILL IN HERE
\end{code}

We can also show that terms are _not_ typable.  For example, let's
formally check that there is no typing derivation assigning a type
to the term `λx:bool. λy:bool, x y` -- i.e.,

    ~ exists T,
    empty ⊢ λx:bool. λy:bool, x y : T.

\begin{code}
typing-nonexample1 : ∄ λ A → ∅ ⊢
  (abs x bool
    (abs y bool
      (app (var x) (var y)))) ∶ A
typing-nonexample1 = {!!} -- FILL IN HERE
\end{code}

#### Exercise: 3 stars, optional (typing_nonexample_3)
Another nonexample:

    ~ (exists S, exists T,
    empty ⊢ λx:S. x x ∶ T).

\begin{code}
typing-nonexample2 : ∄ λ A → ∃ λ B → ∅ ⊢
  (abs x B (app (var x) (var x))) ∶ A
typing-nonexample2 = {!!} -- FILL IN HERE
\end{code}
