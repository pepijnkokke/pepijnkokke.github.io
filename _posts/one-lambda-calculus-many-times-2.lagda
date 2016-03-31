---
title         : One λ-calculus, many times... (2)
date          : 2016-03-26 12:00:00
categories    : [compsci]
tags          : [agda]
hide_implicit : true
---

This post is a continuation of *[One λ-calculus, many times...](
{% post_url 2016-03-20-one-lambda-calculus-many-times %})*, in which I
explored the use natural deduction and sequent calculus systems as
type systems for the simply-typed lambda calculus.[^minproplog] In
this post, I will have a look at a variant of one of these systems
which has explicit structural rules: Gentzen's LJ.

<div class="hidden">
\begin{code}
import 2016-03-20-one-lambda-calculus-many-times as Part1
module 2016-03-26-one-lambda-calculus-many-times-2 where
\end{code}
</div>

The structure of this post will be very similar to that of part
one---which means that we will start out by having a look at the
syntax of LJ:

\begin{code}
module Syntax (Atom : Set) where
\end{code}

We will reuse our notions of types and sequents from the previous post:

<div class="hidden">
\begin{code}
  open Part1.Syntax Atom using (Type; El; _⇒_; Sequent; _⊢_)
  open import Data.Nat             using (ℕ; suc; zero)
  open import Data.Fin             using (Fin; suc; zero)
  open import Data.List            using (List; _∷_; []; _++_)
  open import Data.List.Any        using (module Membership; here; there)
  open import Function.Equivalence using (_⇔_; id; map; equivalence)
  open import Relation.Binary.PropositionalEquality
  open Membership (setoid Type)    using (_∈_; _⊆_)
\end{code}
</div>
<pre class="Agda Spec">  </a><a name="2567" class="Keyword">data</a><a name="2571"> </a><a name="2572" href="/2016/one-lambda-calculus-many-times/#1142" class="Module">Type</a><a name="2576"> </a><a name="2577" class="Symbol">:</a><a name="2578"> </a><a name="2579" class="PrimitiveType">Set</a><a name="2582"> </a><a name="2583" class="Keyword">where</a><a name="2588">
    </a><a name="2593" href="/2016/one-lambda-calculus-many-times/#2593" class="InductiveConstructor">El</a><a name="2595">  </a><a name="2597" class="Symbol">:</a><a name="2598"> </a><a name="2599" href="/2016/one-lambda-calculus-many-times/#1497" class="Bound">Atom</a><a name="2603"> </a><a name="2604" class="Symbol">→</a><a name="2605"> </a><a name="2606" href="/2016/one-lambda-calculus-many-times/#2572" class="Datatype">Type</a><a name="2610">
    </a><a name="2615" href="/2016/one-lambda-calculus-many-times/#2615" class="InductiveConstructor Operator">_⇒_</a><a name="2618"> </a><a name="2619" class="Symbol">:</a><a name="2620"> </a><a name="2621" href="/2016/one-lambda-calculus-many-times/#2572" class="Datatype">Type</a><a name="2625"> </a><a name="2626" class="Symbol">→</a><a name="2627"> </a><a name="2628" href="/2016/one-lambda-calculus-many-times/#2572" class="Datatype">Type</a><a name="2632"> </a><a name="2633" class="Symbol">→</a><a name="2634"> </a><a name="2635" href="/2016/one-lambda-calculus-many-times/#2572" class="Datatype">Type</a>

  </a><a name="3873" class="Keyword">data</a><a name="3877"> </a><a name="3878" href="/2016/one-lambda-calculus-many-times/#1142" class="Module">Sequent</a><a name="3885"> </a><a name="3886" class="Symbol">:</a><a name="3887"> </a><a name="3888" class="PrimitiveType">Set</a><a name="3891"> </a><a name="3892" class="Keyword">where</a><a name="3897">
    </a><a name="3902" href="/2016/one-lambda-calculus-many-times/#3902" class="InductiveConstructor Operator">_⊢_</a><a name="3905"> </a><a name="3906" class="Symbol">:</a><a name="3907"> </a><a name="3908" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#669" class="Datatype" target="_blank">List</a><a name="3912"> </a><a name="3913" href="/2016/one-lambda-calculus-many-times/#2572" class="Datatype">Type</a><a name="3917"> </a><a name="3918" class="Symbol">→</a><a name="3919"> </a><a name="3920" href="/2016/one-lambda-calculus-many-times/#2572" class="Datatype">Type</a><a name="3924"> </a><a name="3925" class="Symbol">→</a><a name="3926"> </a><a name="3927" href="/2016/one-lambda-calculus-many-times/#3878" class="Datatype">Sequent</a></pre>



$$
    \begin{array}{c}
    \frac{}{A \vdash A}{\small ax}
    \quad
    \frac{\Gamma \vdash A \quad A , \Delta \vdash B}{\Gamma, \Delta \vdash B}{\small cut}
    \quad
    \frac{\Gamma \vdash A \quad B , \Delta \vdash C}{A \Rightarrow  B , \Gamma, \Delta \vdash C}{\small{\Rightarrow}\!l}
    \quad
    \frac{A , \Gamma \vdash B}{\Gamma \vdash A \Rightarrow B}{\small{\Rightarrow}\!r}
    \\
    \\
    \frac{\Gamma \vdash B}{A , \Gamma \vdash B}{\small w}
    \quad
    \frac{A , A , \Gamma \vdash B}{A , \Gamma \vdash B}{\small c}
    \quad
    \frac{\Gamma , A , B , \Delta \vdash B}{\Gamma , B , A , \Delta \vdash B}{\small p}
    \end{array}
$$


\begin{code}
  infix 3 LJ_

  data LJ_ : Sequent → Set where
    ax  : ∀ {A        } → LJ A ∷ [] ⊢ A
    cut : ∀ {A B   Γ Δ} → LJ Γ ⊢ A → LJ A ∷ Δ ⊢ B → LJ Γ ++ Δ ⊢ B
    ⇒l  : ∀ {A B C Γ Δ} → LJ Γ ⊢ A → LJ B ∷ Δ ⊢ C → LJ A ⇒ B ∷ Γ ++ Δ ⊢ C
    ⇒r  : ∀ {A B   Γ  } → LJ A ∷ Γ ⊢ B → LJ Γ ⊢ A ⇒ B
\end{code}


---

[^minproplog]: Or, alternatively, as axiomatisations of minimal propositional logic.
