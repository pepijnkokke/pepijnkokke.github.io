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
{-# OPTIONS --allow-unsolved-metas #-}
import 2016-03-20-one-lambda-calculus-many-times as Part1
module one-lambda-calculus-many-times-2 where
\end{code}
</div>

The structure of this post will be very similar to that of part
one---which means that we will start out by having a look at the
syntax of NJ, and then have a look at its semantics and relation to
the system ND we discussed last time. But first, the syntax:

\begin{code}
module Syntax (Atom : Set) where
\end{code}

We can reuse our notions of types and sequents from the previous post:

<div class="hidden">
\begin{code}
  open Part1.Syntax Atom
  open import Algebra                 using (module Monoid)
  open import Data.Nat                using (ℕ; suc; zero)
  open import Data.Fin                using (Fin; suc; zero)
  open import Data.List               using (List; _∷_; []; _++_)
  open import Data.List.Any           using (module Membership; here; there)
  open import Data.Product            using (proj₁; proj₂)
  open import Function                using (_$_)
  open import Function.Equivalence    using (_⇔_; id; map; equivalence)
  open import Relation.Binary.PropositionalEquality
  open Membership (setoid Type)       using (_∈_; _⊆_)
  open Monoid (Data.List.monoid Type) using () renaming (identity to ++-identity; assoc to ++-assoc)
  ++-identityʳ = proj₂ ++-identity
\end{code}
</div>
<pre class="Agda Spec">  </a><a name="2567" class="Keyword">data</a><a name="2571"> </a><a name="2572" href="/2016/one-lambda-calculus-many-times/#1142" class="Module">Type</a><a name="2576"> </a><a name="2577" class="Symbol">:</a><a name="2578"> </a><a name="2579" class="PrimitiveType">Set</a><a name="2582"> </a><a name="2583" class="Keyword">where</a><a name="2588">
    </a><a name="2593" href="/2016/one-lambda-calculus-many-times/#2593" class="InductiveConstructor">El</a><a name="2595">  </a><a name="2597" class="Symbol">:</a><a name="2598"> </a><a name="2599" href="/2016/one-lambda-calculus-many-times/#1497" class="Bound">Atom</a><a name="2603"> </a><a name="2604" class="Symbol">→</a><a name="2605"> </a><a name="2606" href="/2016/one-lambda-calculus-many-times/#2572" class="Datatype">Type</a><a name="2610">
    </a><a name="2615" href="/2016/one-lambda-calculus-many-times/#2615" class="InductiveConstructor Operator">_⇒_</a><a name="2618"> </a><a name="2619" class="Symbol">:</a><a name="2620"> </a><a name="2621" href="/2016/one-lambda-calculus-many-times/#2572" class="Datatype">Type</a><a name="2625"> </a><a name="2626" class="Symbol">→</a><a name="2627"> </a><a name="2628" href="/2016/one-lambda-calculus-many-times/#2572" class="Datatype">Type</a><a name="2632"> </a><a name="2633" class="Symbol">→</a><a name="2634"> </a><a name="2635" href="/2016/one-lambda-calculus-many-times/#2572" class="Datatype">Type</a>

  </a><a name="3873" class="Keyword">data</a><a name="3877"> </a><a name="3878" href="/2016/one-lambda-calculus-many-times/#1142" class="Module">Sequent</a><a name="3885"> </a><a name="3886" class="Symbol">:</a><a name="3887"> </a><a name="3888" class="PrimitiveType">Set</a><a name="3891"> </a><a name="3892" class="Keyword">where</a><a name="3897">
    </a><a name="3902" href="/2016/one-lambda-calculus-many-times/#3902" class="InductiveConstructor Operator">_⊢_</a><a name="3905"> </a><a name="3906" class="Symbol">:</a><a name="3907"> </a><a name="3908" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#669" class="Datatype" target="_blank">List</a><a name="3912"> </a><a name="3913" href="/2016/one-lambda-calculus-many-times/#2572" class="Datatype">Type</a><a name="3917"> </a><a name="3918" class="Symbol">→</a><a name="3919"> </a><a name="3920" href="/2016/one-lambda-calculus-many-times/#2572" class="Datatype">Type</a><a name="3924"> </a><a name="3925" class="Symbol">→</a><a name="3926"> </a><a name="3927" href="/2016/one-lambda-calculus-many-times/#3878" class="Datatype">Sequent</a></pre>

Now, the usual axiomatisation for NJ is as follows:

$$
  \begin{array}{c}
  \frac{}{A \vdash A}{\small ax}
  \quad
  \frac{A , \Gamma \vdash B}{\Gamma \vdash A \Rightarrow B}{\small{\Rightarrow}\!i}
  \quad
  \frac{\Gamma \vdash A \Rightarrow B \quad \Delta \vdash A}{\Gamma , \Delta \vdash B}{\small{\Rightarrow}\!e}
  \\
  \\
  \frac{\Gamma \vdash B}{A , \Gamma \vdash B}{\small w}
  \quad
  \frac{A , A , \Gamma \vdash B}{A , \Gamma \vdash B}{\small c}
  \quad
  \frac{\Gamma , A , B , \Delta \vdash C}{\Gamma , B , A , \Delta \vdash C}{\small p}
  \end{array}
$$

<br />
There are three notable changes when comparing this to the system SC:

  - **Weakening**. The axiom no longer allows for arbitrary contexts
    to be present, it *has* to be $$A \vdash A$$. An implication of
    this is that we no longer have the option to have *unused*
    formulas in our context. If we *do* want to have unused formulas,
    we can add this using the *weakening* rule (or $$w$$).

  - **Contraction**. When we apply a binary rule, we no longer pass
    the entire context to both sides---instead, we have to choose
    how to *split* the context. So what do we do if there is a formula
    which we want to use in *both* branches of the proof? We can use
    the *contraction*[^contraction] (or $$c$$) rule, which *copies* a
    formula, and then pass a copy to either branch.

  - **Permutation**. The third change lies with the structure of our
    contexts and with the $$ax$$ rule. In the previous system, we
    thought of our contexts as *sets*, even though we implemented them
    with lists. This showed itself in the definition of the $$ax$$
    rule, which took an extra argument---a proof that the desired
    type $$A$$ was a member of the context $$\Gamma$$:

    $$
      \frac{A \in \Gamma}{\Gamma \vdash A}{\small ax}
    $$

    Without this, we've also lost the ability to have variables point
    to arbitrary positions in the context. In other words, our system
    is *ordered*. To remedy this, we've added add a third new rule:
    permutation (or $$p$$).

Below, I've implemented the resulting system in Agda:

\begin{code}
  infix 3 NJ_

  data NJ_ : Sequent → Set where
    ax  : ∀ {A        } → NJ A ∷ [] ⊢ A
    ⇒i  : ∀ {A B   Γ  } → NJ A ∷ Γ ⊢ B → NJ Γ ⊢ A ⇒ B
    ⇒e  : ∀ {A B   Γ Δ} → NJ Γ ⊢ A ⇒ B → NJ Δ ⊢ A → NJ Γ ++ Δ ⊢ B
    w   : ∀ {A B   Γ  } → NJ Γ ⊢ B → NJ A ∷ Γ ⊢ B
    c   : ∀ {A B   Γ  } → NJ A ∷ A ∷ Γ ⊢ B → NJ A ∷ Γ ⊢ B
    p   : ∀ {A B C} → ∀ Γ → ∀ {Δ} → NJ Γ ++ A ∷ B ∷ Δ ⊢ C → NJ Γ ++ B ∷ A ∷ Δ ⊢ C
\end{code}

<pre class="Agda Spec">  <a name="8526" href="/2016/one-lambda-calculus-many-times/#8526" class="Function">w′</a><a name="8528"> </a><a name="8529" class="Symbol">:</a><a name="8530"> </a><a name="8543" href="/2016/one-lambda-calculus-many-times/#5294" class="Datatype Operator">ND</a><a name="8545"> </a><a name="8546" href="/2016/one-lambda-calculus-many-times/#8538" class="Bound">Γ</a><a name="8547"> </a><a name="8548" href="/2016/one-lambda-calculus-many-times/#3902" class="InductiveConstructor Operator">⊢</a><a name="8549"> </a><a name="8550" href="/2016/one-lambda-calculus-many-times/#8536" class="Bound">B</a><a name="8551"> </a><a name="8552" class="Symbol">→</a><a name="8553"> </a><a name="8554" href="/2016/one-lambda-calculus-many-times/#5294" class="Datatype Operator">ND</a><a name="8556"> </a><a name="8557" href="/2016/one-lambda-calculus-many-times/#8534" class="Bound">A</a><a name="8558"> </a><a name="8559" href="https://agda.github.io/agda-stdlib/Data.List.Base.html#721" class="InductiveConstructor Operator" target="_blank">∷</a><a name="8560"> </a><a name="8561" href="/2016/one-lambda-calculus-many-times/#8538" class="Bound">Γ</a><a name="8562"> </a><a name="8563" href="/2016/one-lambda-calculus-many-times/#3902" class="InductiveConstructor Operator">⊢</a><a name="8564"> </a><a name="8565" href="/2016/one-lambda-calculus-many-times/#8536" class="Bound">B</a><a name="8566">
  </a><a name="8569" href="/2016/one-lambda-calculus-many-times/#8526" class="Function">w′</a><a name="8571"> </a><a name="8572" class="Symbol">=</a><a name="8573"> </a><a name="8574" href="/2016/one-lambda-calculus-many-times/#7228" class="Function">struct</a><a name="8580"> </a><a name="8581" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor" target="_blank">there</a></pre>

\begin{code}
  c′ : ∀ {A B Γ} → ND A ∷ A ∷ Γ ⊢ B → ND A ∷ Γ ⊢ B
  c′ = struct contract
    where
      contract : ∀ {A Γ} → A ∷ A ∷ Γ ⊆ A ∷ Γ
      contract (here px) = here px
      contract (there i) = i
\end{code}

\begin{code}
  p′ : ∀ {A B C} → ∀ Γ → ∀ {Δ} → ND Γ ++ A ∷ B ∷ Δ ⊢ C → ND Γ ++ B ∷ A ∷ Δ ⊢ C
  p′ Γ = struct (permute Γ)
    where
      permute : ∀ {A B} → ∀ Γ → ∀ {Δ} → Γ ++ A ∷ B ∷ Δ ⊆ Γ ++ B ∷ A ∷ Δ
      permute []      (here px)         = there (here px)
      permute []      (there (here px)) = here px
      permute []      (there (there i)) = there (there i)
      permute (D ∷ Γ) (here px)         = here px
      permute (D ∷ Γ) (there i)         = there (permute Γ i)
\end{code}

\begin{code}
  w⁺ : ∀ {A} → ∀ Γ → ∀ {Δ} → NJ Δ ⊢ A → NJ Γ ++ Δ ⊢ A
  w⁺ []      f = f
  w⁺ (B ∷ Γ) f = w (w⁺ Γ f)
\end{code}

\begin{code}
  p⁺′ : ∀ {A B} → ∀ Γ Σ → ∀ {Δ} → NJ (Γ ++ Σ) ++ (A ∷ Δ) ⊢ B
              → NJ (Γ ++ A ∷ Σ) ++ Δ ⊢ B
  p⁺′ {A} {B} Γ [] {Δ} f
         -- NJ (Γ ++ A ∷ []) ++ Δ ⊢ .B
    rewrite ++-identityʳ Γ
         -- NJ (Γ ++ A ∷ []) ++ Δ ⊢ B
          | ++-assoc Γ (A ∷ []) Δ
         -- NJ Γ ++ A ∷ Δ ⊢ B
          = f

  p⁺′ {A} {B} Γ (C ∷ Σ) {Δ} f
    rewrite ++-assoc Γ (A ∷ C ∷ Σ) Δ
         -- NJ Γ ++ A ∷ C ∷ Σ ++ Δ ⊢ B
          = p Γ g
      where
        g : NJ Γ ++ C ∷ A ∷ Σ ++ Δ ⊢ B
        g rewrite sym (++-assoc Γ (C ∷ []) (A ∷ Σ ++ Δ))
               -- NJ (Γ ++ C ∷ []) ++ A ∷ Σ ++ Δ ⊢ B
                | sym (++-assoc (Γ ++ C ∷ []) (A ∷ Σ) Δ)
               -- NJ ((Γ ++ C ∷ []) ++ A ∷ Σ) ++ Δ ⊢ B
               = p⁺′ (Γ ++ C ∷ []) Σ {Δ} h
            where
              h : NJ ((Γ ++ C ∷ []) ++ Σ) ++ A ∷ Δ ⊢ B
              h rewrite ++-assoc Γ (C ∷ []) Σ = f
\end{code}

\begin{code}
  p⁺ : ∀ {A} → ∀ Γ Σ Π → ∀ {Δ} → NJ (Γ ++ Σ) ++ (Π ++ Δ) ⊢ A
               → NJ (Γ ++ Π) ++ (Σ ++ Δ) ⊢ A
  p⁺ {A} Γ Σ [] {Δ} f
         -- NJ (Γ ++ []) ++ Σ ++ Δ ⊢ A
    rewrite ++-identityʳ Γ
         -- NJ Γ ++ Σ ++ Δ ⊢ A
          | sym (++-assoc Γ Σ Δ)
         -- NJ (Γ ++ Σ) ++ Δ ⊢ A
          = f

  p⁺ {A} Γ Σ (B ∷ Π) {Δ} f
         -- NJ (Γ ++ B ∷ Π) ++ Σ ++ Δ ⊢ A
    rewrite sym (++-assoc Γ (B ∷ []) Π)
         -- NJ ((Γ ++ B ∷ []) ++ Π) ++ Σ ++ Δ ⊢ A
          = p⁺ (Γ ++ B ∷ []) Σ Π {Δ} g
      where
        g : NJ ((Γ ++ B ∷ []) ++ Σ) ++ Π ++ Δ ⊢ A
        g rewrite ++-assoc Γ (B ∷ []) Σ
               -- NJ (Γ ++ B ∷ Σ) ++ Π ++ Δ ⊢ A
                = p⁺′ Γ Σ f
\end{code}

\begin{code}
  c⁺ : ∀ {A} → ∀ Γ → ∀ {Δ} → NJ Γ ++ Γ ++ Δ ⊢ A → NJ Γ ++ Δ ⊢ A
  c⁺ {A} []      {Δ} f = f
  c⁺ {A} (B ∷ Γ) {Δ} f = c (p⁺ [] Γ (B ∷ B ∷ []) (c⁺ Γ g))
    where
      g : NJ Γ ++ Γ ++ B ∷ B ∷ Δ ⊢ A
      g rewrite sym (++-assoc Γ Γ (B ∷ B ∷ Δ))
             -- NJ (Γ ++ Γ) ++ B ∷ B ∷ Δ ⊢ A
              = p⁺ [] (B ∷ B ∷ []) (Γ ++ Γ) h
          where
            h : NJ (B ∷ B ∷ []) ++ (Γ ++ Γ) ++ Δ ⊢ A
            h rewrite ++-assoc (B ∷ B ∷ Γ) Γ Δ
                   -- NJ B ∷ B ∷ Γ ++ Γ ++ Δ ⊢ A
                    = p⁺′ [] (B ∷ Γ) f
\end{code}

\begin{code}
  module NJ⇔ND where

    ⟹ : ∀ {S} → NJ S → ND S
    ⟹  ax       = ax₀
    ⟹ (⇒i  f)   = ⇒i   (⟹ f)
    ⟹ (⇒e  f g) = {!!}
    ⟹ (w   f)   = w′   (⟹ f)
    ⟹ (c   f)   = c′   (⟹ f)
    ⟹ (p Γ f)   = p′ Γ (⟹ f)

    ⟸ : ∀ {S} → ND S → NJ S
    ⟸ (ax  x)   = {!x!}
    ⟸ (⇒i  f)   = {!!}
    ⟸ (⇒e  f g) = {!!}
\end{code}

---

[^minproplog]:  Or, alternatively, as axiomatisations of minimal propositional logic.

<!--
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
    w   : ∀ {A B   Γ  } → LJ Γ ⊢ B → LJ A ∷ Γ ⊢ B
    c   : ∀ {A B   Γ  } → LJ A ∷ A ∷ Γ ⊢ B → LJ A ∷ Γ ⊢ B
    p   : ∀ {A B C Γ Δ} → LJ Γ ++ A ∷ B ∷ Δ ⊢ C → LJ Γ ++ B ∷ A ∷ Δ ⊢ C
\end{code}

\begin{code}
  forward : ∀ {A B} → ∀ Γ₁ Γ₂ Γ₃ → A ∈ Γ₁ ++ Γ₂ ++ B ∷ Γ₃ → A ∈ Γ₁ ++ B ∷ Γ₂ ++ Γ₃
  forward (C ∷ Γ₁) Γ₂ Γ₃ (here px) = here px
  forward (C ∷ Γ₁) Γ₂ Γ₃ (there i) = there (forward Γ₁ Γ₂ Γ₃ i)
  forward      []  Γ₂ Γ₃        i  = forward′ Γ₂ Γ₃ i
    where
      forward′ : ∀ {A B} → ∀ Γ₂ Γ₃ → A ∈ Γ₂ ++ B ∷ Γ₃ → A ∈ B ∷ Γ₂ ++ Γ₃
      forward′      []  Γ₃        i  = i
      forward′ (C ∷ Γ₂) Γ₃ (here px) = there (here px)
      forward′ (C ∷ Γ₂) Γ₃ (there i) with forward′ Γ₂ Γ₃ i
      forward′ (C ∷ Γ₂) Γ₃ (there i) | here px = here px
      forward′ (C ∷ Γ₂) Γ₃ (there i) | there j = there (there j)
\end{code}
-->
