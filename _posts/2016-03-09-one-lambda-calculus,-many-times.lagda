---
title      : One λ-calculus, many times...
date       : 2016-03-09 12:00:00
categories : [agda]
tags       : [agda]
published  : false
---

I mentioned one another type of post which you'll find on any Agda
user's blog: implementing the λ-calculus. If you simply google "Agda
lambda calculus", you'll easily find tens of examples.

<div style="display:none;">
\begin{code}
module 2016-03-09-one-lambda-calculus,-many-times where
\end{code}
</div>


\begin{code}
module SetAntecedent (Atom : Set) where
\end{code}

\begin{code}
  data Type : Set where
    El  : Atom → Type
    _⇒_ : Type → Type → Type
\end{code}


\begin{code}
  open import Data.Nat             using (ℕ; suc; zero)
  open import Data.Fin             using (Fin; suc; zero)
  open import Data.List            using (List; _∷_; []; _++_)
  open import Data.List.Any        using (module Membership; here; there)
  open import Function.Equivalence using (_⇔_; id; map; equivalence)
  open import Relation.Binary.PropositionalEquality
  open Membership (setoid Type)    using (_∈_)
\end{code}


\begin{code}
  infix 4 _⊢_

  data Sequent : Set where
    _⊢_ : List Type → Type → Sequent
\end{code}

\begin{code}
  infix 3 ND_

  data ND_ : Sequent → Set where
    ax : ∀ {A   Γ} → A ∈ Γ → ND Γ ⊢ A
    ⇒i : ∀ {A B Γ} → ND A ∷ Γ ⊢ B → ND Γ ⊢ A ⇒ B
    ⇒e : ∀ {A B Γ} → ND Γ ⊢ A ⇒ B → ND Γ ⊢ A → ND Γ ⊢ B
\end{code}

\\[
    \\frac{A \\in \\Gamma}{\\Gamma \\vdash A}{\\small ax}
    \\quad
    \\frac{A , \\Gamma \\vdash B}{\\Gamma \\vdash A \\Rightarrow B}{\\small{\\Rightarrow}\\!i}
    \\quad
    \\frac{\\Gamma \\vdash A \Rightarrow B \\quad \\Gamma \\vdash A}{\\Gamma \\vdash B}{\\small{\\Rightarrow}\\!e}
\\]

\begin{code}
  infix 3 SC_

  data SC_ : Sequent → Set where
    ax  : ∀ {A     Γ} → A ∈ Γ → SC Γ ⊢ A
    cut : ∀ {A B   Γ} → SC Γ ⊢ A → SC A ∷ Γ ⊢ B → SC Γ ⊢ B
    ⇒l  : ∀ {A B C Γ} → SC Γ ⊢ A → SC B ∷ Γ ⊢ C → SC A ⇒ B ∷ Γ ⊢ C
    ⇒r  : ∀ {A B   Γ} → SC A ∷ Γ ⊢ B → SC Γ ⊢ A ⇒ B
\end{code}

\\[
    \\frac{A \\in \\Gamma}{\\Gamma \\vdash A}{\\small ax}
    \\quad
    \\frac{\\Gamma \\vdash A \\quad A , \\Gamma \\vdash B}{\\Gamma \\vdash B}{\\small cut}
    \\quad
    \\frac{\\Gamma \\vdash A \\quad B , \\Gamma \\vdash C}{A \\Rightarrow  B , \\Gamma \\vdash C}{\\small{\\Rightarrow}\\!l}
    \\quad
    \\frac{A , \\Gamma \\vdash B}{\\Gamma \\vdash A \\Rightarrow B}{\\small{\\Rightarrow}\\!r}
\\]

\begin{code}
  pattern ax₀ = ax (here refl)
  pattern ax₁ = ax (there (here refl))
  pattern ax₂ = ax (there (there (here refl)))
\end{code}

\begin{code}
  ∈-exch : ∀ {A B C} (Γ₁ : List Type) {Γ₂ : List Type}
          → A ∈ Γ₁ ++ C ∷ B ∷ Γ₂ → A ∈ Γ₁ ++ B ∷ C ∷ Γ₂
  ∈-exch      []  (here         p)  = there (here p) -- the swap
  ∈-exch      []  (there (here  p)) = here p         -- is here.
  ∈-exch      []  (there (there p)) = there (there p)
  ∈-exch (C ∷ Γ₁) (here         p)  = here p
  ∈-exch (C ∷ Γ₁) (there        p)  = there (∈-exch Γ₁ p)
\end{code}

\begin{code}
  exch : ∀ {A B C} (Γ₁ : List Type) {Γ₂ : List Type}
       → ND Γ₁ ++ B ∷ A ∷ Γ₂ ⊢ C → ND Γ₁ ++ A ∷ B ∷ Γ₂ ⊢ C
  exch Γ₁ (ax p)   = ax (∈-exch Γ₁ p)
  exch Γ₁ (⇒i f)   = ⇒i (exch (_ ∷ Γ₁) f)
  exch Γ₁ (⇒e f g) = ⇒e (exch Γ₁ f) (exch Γ₁ g)
\end{code}

\begin{code}
  weak : ∀ {A B Γ} → ND Γ ⊢ B → ND A ∷ Γ ⊢ B
  weak (ax p)   = ax (there p)
  weak (⇒i f)   = ⇒i (exch [] (weak f))
  weak (⇒e f g) = ⇒e (weak f) (weak g)
\end{code}

\begin{code}
  instance
    ND⇔SC : ∀ {S} → ND S ⇔ SC S
    ND⇔SC = equivalence ⟹ ⟸
      where
        ⟹ : ∀ {S} → ND S → SC S
        ⟹ (ax  p)   = ax p
        ⟹ (⇒i  f)   = ⇒r (⟹ f)
        ⟹ (⇒e  f g) = cut (⟹ f) (⇒l (⟹ g) ax₀)
        ⟸ : ∀ {S} → SC S → ND S
        ⟸ (ax  p)   = ax p
        ⟸ (cut f g) = ⇒e (⇒i (⟸ g)) (⟸ f)
        ⟸ (⇒l  f g) = ⇒e (weak (⇒i (⟸ g))) (⇒e ax₀ (weak (⟸ f)))
        ⟸ (⇒r  f)   = ⇒i (⟸ f)
\end{code}

\begin{code}
  cont : ∀ {A B Γ} → ND A ∷ A ∷ Γ ⊢ B → ND A ∷ Γ ⊢ B
  cont f = ⇒e (⇒i f) (ax (here refl))
\end{code}

\begin{code}
open import Level using (_⊔_)

record Interpret {a} {b} (A : Set a) (B : Set b) : Set (a ⊔ b) where
  field
    ⟦_⟧ : A → B
open Interpret {{...}}
\end{code}

\begin{code}
module SetAntecedent-Interpret
       (Atom : Set) (intp : Interpret Atom Set) where
\end{code}

\begin{code}
  open SetAntecedent Atom
  open import Data.List            using (List; _∷_; []; map)
  open import Data.List.Any        using (module Membership; here; there)
  open import Function.Equality    using (_⟨$⟩_)
  open import Function.Equivalence using (module Equivalence)
  open import Relation.Binary.PropositionalEquality
  open Membership (setoid Type)    using (_∈_)
  open Equivalence                 using (to; from)
\end{code}

\begin{code}
  instance
    intpType : Interpret Type Set
    intpType = record { ⟦_⟧ = ⟦_⟧′ }
      where
        ⟦_⟧′  : Type → Set
        ⟦ El  A ⟧′ = ⟦ A ⟧
        ⟦ A ⇒ B ⟧′ = ⟦ A ⟧′ → ⟦ B ⟧′
\end{code}

\begin{code}
  data Env : List Type → Set where
    []  : Env []
    _∷_ : {A : Type} {Γ : List Type}
        → ⟦ A ⟧ → Env Γ → Env (A ∷ Γ)
\end{code}

\begin{code}
  lookup : ∀ {A Γ} → A ∈ Γ → Env Γ → ⟦ A ⟧
  lookup (here  p) (x ∷ _) rewrite p = x
  lookup (there p) (_ ∷ e) = lookup p e
\end{code}

\begin{code}
  instance
    intpSequent : Interpret Sequent Set
    intpSequent = record { ⟦_⟧ = ⟦_⟧′ }
      where
        ⟦_⟧′ : Sequent → Set
        ⟦ Γ ⊢ A ⟧′ = Env Γ → ⟦ A ⟧
\end{code}

\begin{code}
  instance
    intpND : ∀ {S} → Interpret (ND S) ⟦ S ⟧
    intpND = record { ⟦_⟧ = ⟦_⟧′ }
      where
        ⟦_⟧′ : ∀ {S} → ND S → ⟦ S ⟧
        ⟦ ax p   ⟧′ e = lookup p e
        ⟦ ⇒i f   ⟧′ e = λ x → ⟦ f ⟧′ (x ∷ e)
        ⟦ ⇒e f g ⟧′ e = (⟦ f ⟧′ e) (⟦ g ⟧′ e)
\end{code}

\begin{code}
  instance
    intpSC : ∀ {S} → Interpret (SC S) ⟦ S ⟧
    intpSC = record { ⟦_⟧ = ⟦_⟧′ }
      where
        ⟦_⟧′ : ∀ {S} → SC S → ⟦ S ⟧
        ⟦ ax  p   ⟧′      e  = lookup p e
        ⟦ cut f g ⟧′      e  = ⟦ g ⟧′ (⟦ f ⟧′ e ∷ e)
        ⟦ ⇒l  f g ⟧′ (h ∷ e) = ⟦ g ⟧′ (h (⟦ f ⟧′ e) ∷ e)
        ⟦ ⇒r  f   ⟧′      e  = λ x → ⟦ f ⟧′ (x ∷ e)
\end{code}

\begin{code}
  ⟦ND⟧⇒⟦SC⟧ : ∀ {S} (f : ND S) → ⟦ f ⟧ ≡ ⟦ to ND⇔SC ⟨$⟩ f ⟧
  ⟦ND⟧⇒⟦SC⟧ (ax _)   = refl
  ⟦ND⟧⇒⟦SC⟧ (⇒i f)   = cong  (λ f e x → f (x ∷ e)) (⟦ND⟧⇒⟦SC⟧ f)
  ⟦ND⟧⇒⟦SC⟧ (⇒e f g) = cong₂ (λ f g e → f e (g e)) (⟦ND⟧⇒⟦SC⟧ f) (⟦ND⟧⇒⟦SC⟧ g)
\end{code}

<!--
  ⟦ND⟧⇐⟦SC⟧ : ∀ {S} (f : SC S) → ⟦ f ⟧ ≡ ⟦ from ND⇔SC ⟨$⟩ f ⟧
  ⟦ND⟧⇐⟦SC⟧ (ax  _)   = refl
  ⟦ND⟧⇐⟦SC⟧ (cut f g) = cong₂ (λ f g e → g (f e ∷ e)) (⟦ND⟧⇐⟦SC⟧ f) (⟦ND⟧⇐⟦SC⟧ g)
  ⟦ND⟧⇐⟦SC⟧ (⇒l  f g) = {!!}
  ⟦ND⟧⇐⟦SC⟧ (⇒r  f)   = cong  (λ f e x → f (x ∷ e)) (⟦ND⟧⇐⟦SC⟧ f)
-->
