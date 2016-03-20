---
title      : One λ-calculus, many times...
date       : 2016-03-09 12:00:00
categories : [agda]
tags       : [agda]
---

Previously, I mentioned that one of the most common Agda blogposts
you'll find out there is implementing the simply-typed λ-calculus.
[Gergő Érdi][noshortcuts] even goes as far as to call it the FizzBuzz
of dependently-typed programming.

<div class="hidden">
\begin{code}
{-# OPTIONS --allow-unsolved-metas #-}

module LambdaCalculus1 where
\end{code}
</div>

Boop.

\begin{code}
module Syntax (Atom : Set) where
\end{code}

Boop.

<pre class="Agda Spec">  <a name="511" class="Keyword">data</a><a name="515"> </a><a name="516" href="#289" class="Module">Atom</a><a name="521"> </a><a name="522" class="Symbol">:</a><a name="523"> </a><a name="524" class="PrimitiveType">Set</a><a name="527"> </a><a name="528" class="Keyword">where</a><a name="533"><br />    </a><a name="538" href="#538" class="InductiveConstructor">Int</a><a name="542">    </a><a name="543" class="Symbol">:</a><a name="544"> </a><a name="545" href="#516" class="Datatype">Atom</a><a name="550"><br />    </a><a name="555" href="#555" class="InductiveConstructor">String</a><a name="562"> </a><a name="563" class="Symbol">:</a><a name="564"> </a><a name="565" href="#516" class="Datatype">Atom</a></pre>

Boop.

\begin{code}
  data Type : Set where
    El  : Atom → Type
    _⇒_ : Type → Type → Type
\end{code}

Boop.

<div class="hidden">
\begin{code}
  open import Data.Nat             using (ℕ; suc; zero)
  open import Data.Fin             using (Fin; suc; zero)
  open import Data.List            using (List; _∷_; []; _++_)
  open import Data.List.Any        using (module Membership; here; there)
  open import Function.Equivalence using (_⇔_; id; map; equivalence)
  open import Relation.Binary.PropositionalEquality
  open Membership (setoid Type)    using (_∈_; _⊆_)
\end{code}
</div>
\begin{code}
  infix 4 _⊢_

  data Sequent : Set where
    _⊢_ : List Type → Type → Sequent
\end{code}

$$
    \frac{A \in \Gamma}{\Gamma \vdash A}{\small ax}
    \quad
    \frac{A , \Gamma \vdash B}{\Gamma \vdash A \Rightarrow B}{\small{\Rightarrow}\!i}
    \quad
    \frac{\Gamma \vdash A \Rightarrow B \quad \Gamma \vdash A}{\Gamma \vdash B}{\small{\Rightarrow}\!e}
$$

\begin{code}
  infix 3 ND_

  data ND_ : Sequent → Set where
    ax : ∀ {A   Γ} → A ∈ Γ → ND Γ ⊢ A
    ⇒i : ∀ {A B Γ} → ND A ∷ Γ ⊢ B → ND Γ ⊢ A ⇒ B
    ⇒e : ∀ {A B Γ} → ND Γ ⊢ A ⇒ B → ND Γ ⊢ A → ND Γ ⊢ B
\end{code}

\begin{code}
  pattern var   x = ax   x
  pattern lam   x = ⇒i   x
  pattern _∙_ f x = ⇒e f x
\end{code}

$$
    \frac{A \in \Gamma}{\Gamma \vdash A}{\small ax}
    \quad
    \frac{\Gamma \vdash A \quad A , \Gamma \vdash B}{\Gamma \vdash B}{\small cut}
    \quad
    \frac{\Gamma \vdash A \quad B , \Gamma \vdash C}{A \Rightarrow  B , \Gamma \vdash C}{\small{\Rightarrow}\!l}
    \quad
    \frac{A , \Gamma \vdash B}{\Gamma \vdash A \Rightarrow B}{\small{\Rightarrow}\!r}
$$

\begin{code}
  infix 3 SC_

  data SC_ : Sequent → Set where
    ax  : ∀ {A     Γ} → A ∈ Γ → SC Γ ⊢ A
    cut : ∀ {A B   Γ} → SC Γ ⊢ A → SC A ∷ Γ ⊢ B → SC Γ ⊢ B
    ⇒l  : ∀ {A B C Γ} → SC Γ ⊢ A → SC B ∷ Γ ⊢ C → SC A ⇒ B ∷ Γ ⊢ C
    ⇒r  : ∀ {A B   Γ} → SC A ∷ Γ ⊢ B → SC Γ ⊢ A ⇒ B
\end{code}

Boop.

\begin{code}
  pattern ax₀ = ax (here refl)
  pattern ax₁ = ax (there (here refl))
  pattern ax₂ = ax (there (there (here refl)))
\end{code}

Boop.

\begin{code}
  struct : ∀ {A Γ Γ′} → Γ ⊆ Γ′ → ND Γ ⊢ A → ND Γ′ ⊢ A
  struct Γ⊆Γ′ (ax x)   = ax (Γ⊆Γ′ x)
  struct Γ⊆Γ′ (⇒i f)   = ⇒i (struct (∷-resp-⊆ Γ⊆Γ′) f)
    where

      ∷-resp-⊆ : ∀ {A Γ Γ′} → Γ ⊆ Γ′ → A ∷ Γ ⊆ A ∷ Γ′
      ∷-resp-⊆ Γ⊆Γ′ (here  x) = here x
      ∷-resp-⊆ Γ⊆Γ′ (there x) = there (Γ⊆Γ′ x)

  struct Γ⊆Γ′ (⇒e f g) = ⇒e (struct Γ⊆Γ′ f) (struct Γ⊆Γ′ g)
\end{code}

Boop.

\begin{code}
  weak : ∀ {A B Γ} → ND Γ ⊢ B → ND A ∷ Γ ⊢ B
  weak = struct there
\end{code}

Boop.

\begin{code}
  module ND⇔SC where

    ⟹ : ∀ {S} → ND S → SC S
    ⟹ (ax  x)   = ax x
    ⟹ (⇒i  f)   = ⇒r  (⟹ f)
    ⟹ (⇒e  f g) = cut (⟹ f) (⇒l (⟹ g) ax₀)

    ⟸ : ∀ {S} → SC S → ND S
    ⟸ (ax  p)   = ax p
    ⟸ (cut f g) = ⇒e (⇒i (⟸ g)) (⟸ f)
    ⟸ (⇒l  f g) = ⇒e (weak (⇒i (⟸ g))) (⇒e ax₀ (weak (⟸ f)))
    ⟸ (⇒r  f)   = ⇒i (⟸ f)
\end{code}

Boop.

\begin{code}
open import Level using (_⊔_)

record Interpret {a} {b} (A : Set a) (B : Set b) : Set (a ⊔ b) where
  field
    ⟦_⟧ : A → B
open Interpret {{...}}
\end{code}

Boop.

\begin{code}
module Semantics (Atom : Set) (InterpretAtom : Interpret Atom Set) where
\end{code}

<div class="hidden">
\begin{code}
  open Syntax Atom
  open import Data.List            using (List; _∷_; []; map)
  open import Data.List.Any        using (module Membership; here; there)
  open import Function.Equality    using (_⟨$⟩_)
  open import Function.Equivalence using (module Equivalence)
  open import Relation.Binary.PropositionalEquality
  open Membership (setoid Type)    using (_∈_)
  open Equivalence                 using (to; from)
\end{code}
</div>

Boop.

\begin{code}
  instance
    InterpretType : Interpret Type Set
    InterpretType = record { ⟦_⟧ = ⟦_⟧′ }
      where
        ⟦_⟧′  : Type → Set
        ⟦ El  A ⟧′ = ⟦ A ⟧
        ⟦ A ⇒ B ⟧′ = ⟦ A ⟧′ → ⟦ B ⟧′
\end{code}

Boop.

\begin{code}
  data Env : List Type → Set where
    []  : Env []
    _∷_ : {A : Type} {Γ : List Type}
        → ⟦ A ⟧ → Env Γ → Env (A ∷ Γ)
\end{code}

Boop.

\begin{code}
  lookup : ∀ {A Γ} → A ∈ Γ → Env Γ → ⟦ A ⟧
  lookup (here  p) (x ∷ _) rewrite p = x
  lookup (there p) (_ ∷ e) = lookup p e
\end{code}

Boop.

\begin{code}
  instance
    InterpretSequent : Interpret Sequent Set
    InterpretSequent = record { ⟦_⟧ = ⟦_⟧′ }
      where
        ⟦_⟧′ : Sequent → Set
        ⟦ Γ ⊢ A ⟧′ = Env Γ → ⟦ A ⟧
\end{code}

Boop.

\begin{code}
  instance
    InterpretND : ∀ {S} → Interpret (ND S) ⟦ S ⟧
    InterpretND = record { ⟦_⟧ = ⟦_⟧′ }
      where
        ⟦_⟧′ : ∀ {S} → ND S → ⟦ S ⟧
        ⟦ ax p   ⟧′ e = lookup p e
        ⟦ ⇒i f   ⟧′ e = λ x → ⟦ f ⟧′ (x ∷ e)
        ⟦ ⇒e f g ⟧′ e = (⟦ f ⟧′ e) (⟦ g ⟧′ e)
\end{code}

Boop.

\begin{code}
  head : ∀ {A Γ} → Env (A ∷ Γ) → ⟦ A ⟧
  head (x ∷ _) = x

  tail : ∀ {A Γ} → Env (A ∷ Γ) → Env Γ
  tail (_ ∷ e) = e
\end{code}

Boop.

\begin{code}
  instance
    InterpretSC : ∀ {S} → Interpret (SC S) ⟦ S ⟧
    InterpretSC = record { ⟦_⟧ = ⟦_⟧′ }
      where
        ⟦_⟧′ : ∀ {S} → SC S → ⟦ S ⟧
        ⟦ ax  p   ⟧′      e  = lookup p e
        ⟦ cut f g ⟧′      e  = ⟦ g ⟧′ (⟦ f ⟧′ e ∷ e)
        ⟦ ⇒l  f g ⟧′ (h ∷ e) = ⟦ g ⟧′ (h (⟦ f ⟧′ e) ∷ e)
        ⟦ ⇒r  f   ⟧′      e  = λ x → ⟦ f ⟧′ (x ∷ e)
\end{code}

Boop.

\begin{code}
  module ⟦ND⟧⇔⟦SC⟧ where

    ⟹ : ∀ {S} (f : ND S) → ⟦ f ⟧ ≡ ⟦ ND⇔SC.⟹ f ⟧
    ⟹ (ax _)   = refl
    ⟹ (⇒i f)   = cong  (λ f e x → f (x ∷ e)) (⟹ f)
    ⟹ (⇒e f g) = cong₂ (λ f g e → f e (g e)) (⟹ f) (⟹ g)
\end{code}

<div class="hidden">
\begin{code}
    open import Relation.Binary.PropositionalEquality.TrustMe renaming (trustMe to ???)
\end{code}
</div>

\begin{code}
    ⟸ : ∀ {S} (f : SC S) → ⟦ f ⟧ ≡ ⟦ ND⇔SC.⟸ f ⟧
    ⟸ (ax  _)   = refl
    ⟸ (cut f g) = cong₂ (λ f g e → g (f e ∷ e)) (⟸ f) (⟸ g)
    ⟸ (⇒l  f g) = ???
    ⟸ (⇒r  f)   = cong  (λ f e x → f (x ∷ e)) (⟸ f)
\end{code}

<pre class="Agda Spec">    <a name="7254" class="Symbol">(λ</a><a name="7256"> </a><a name="7257" class="Symbol">{(</a><a name="7259" href="#7259" class="Bound">h</a><a name="7260"> </a><a name="7261" class="InductiveConstructor Operator">∷</a><a name="7262"> </a><a name="7263" href="#7263" class="Bound">e</a><a name="7264" class="Symbol">)</a><a name="7265"> </a><a name="7266" class="Symbol">→</a> <a name="7268" href="#4354" class="Field Operator">⟦</a><a name="7269"> </a><a name="7270" href="#7228" class="Bound">g</a><a name="7271"> </a><a name="7272" href="#4354" class="Field Operator">⟧</a><a name="7273"> </a><a name="7274" class="Symbol">(</a><a name="7275" href="#7259" class="Bound">h</a><a name="7276"> </a><a name="7277" class="Symbol">(</a><a name="7278" href="#4354" class="Field Operator">⟦</a><a name="7279"> </a><a name="7280" href="#7213" class="Bound">f</a><a name="7281"> </a><a name="7282" href="#4354" class="Field Operator">⟧</a><a name="7283"> </a><a name="7284" href="#7263" class="Bound">e</a><a name="7285" class="Symbol">)</a><a name="7286"> </a><a name="7287" class="InductiveConstructor Operator">∷</a><a name="7288"> </a><a name="7289" href="#7263" class="Bound">e</a><a name="7290" class="Symbol">)})</a><br />    <a name="7300" href="https://agda.github.io/agda-stdlib/Relation.Binary.Core.html#4497" class="Datatype Operator" target="_blank">≡</a><br />    <a name="7308" class="Symbol">(λ</a><a name="7310"> </a><a name="7311" class="Symbol">{(</a><a name="7313" href="#7313" class="Bound">h</a><a name="7314"> </a><a name="7315" class="InductiveConstructor Operator">∷</a><a name="7316"> </a><a name="7317" href="#7317" class="Bound">e</a><a name="7318" class="Symbol">)</a><a name="7319"> </a><a name="7320" class="Symbol">→</a><br />        <a name="7322" href="#4354" class="Field Operator">⟦</a><a name="7323"> </a><a name="7324" href="#3553" class="Function">struct</a><a name="7330"> </a><a name="7331" class="Symbol">(</a><a name="7332" href="#3424" class="Function">∷-resp-⊆</a><a name="7340"> </a><a name="7341" href="https://agda.github.io/agda-stdlib/Data.List.Any.html#1227" class="InductiveConstructor" target="_blank">there</a><a name="7346" class="Symbol">)</a><a name="7347"> </a><a name="7348" class="Symbol">(</a><a name="7349" href="#4037" class="Function">ND⇔SC.⟸</a><a name="7356"> </a><a name="7357" href="#7228" class="Bound">g</a><a name="7358" class="Symbol">)</a><a name="7359"> </a><a name="7360" href="#4354" class="Field Operator">⟧</a><br />            <a name="7362" class="Symbol">(</a><a name="7363" href="#7313" class="Bound">h</a><a name="7364"> </a><a name="7365" class="Symbol">(</a><a name="7366" href="#4354" class="Field Operator">⟦</a><a name="7367"> </a><a name="7368" href="#3791" class="Function">weak</a><a name="7372"> </a><a name="7373" class="Symbol">(</a><a name="7374" href="#4037" class="Function">ND⇔SC.⟸</a><a name="7381"> </a><a name="7382" href="#7213" class="Bound">f</a><a name="7383" class="Symbol">)</a><a name="7384"> </a><a name="7385" href="#4354" class="Field Operator">⟧</a><a name="7386"> </a><a name="7387" href="#7317" class="Bound">e</a><a name="7388" class="Symbol">)</a><a name="7389"> </a><a name="7390" class="InductiveConstructor Operator">∷</a><a name="7391"> </a><a name="7392" href="#7317" class="Bound">e</a><a name="7393" class="Symbol">)})</a></pre>


---

[noshortcuts]: https://gergo.erdi.hu/blog/2013-05-01-simply_typed_lambda_calculus_in_agda,_without_shortcuts/
