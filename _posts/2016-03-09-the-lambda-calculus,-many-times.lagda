---
title      : One λ-calculus, many times...
date       : 2016-03-02 12:00:00
categories : [agda]
tags       : [agda]
published  : false
---

I mentioned one another type of post which you'll find on any Agda
user's blog: implementing the λ-calculus. If you simply google "Agda
lambda calculus", you'll easily find tens of examples.

\begin{code}
module 2016-03-09-the-lambda-calculus,-many-times (Atom : Set) where
\end{code}


\begin{code}
  data Type : Set where
    El  : Atom → Type
    _⇒_ : Type → Type → Type
\end{code}


\begin{code}
  module SetAntecedent where
\end{code}


\begin{code}
    open import Function.Equivalence using (_⇔_; id; map; equivalence)
    open import Data.Nat             using (ℕ; suc; zero)
    open import Data.Fin             using (Fin; suc; zero)
    open import Data.List            using (List; _∷_; []; _++_)
    open import Data.List.Any        using (module Membership; here; there)
    open import Data.Product         using (∃; _,_)
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

\begin{code}
    infix 3 SC_

    data SC_ : Sequent → Set where
      ax  : ∀ {A     Γ} → A ∈ Γ → SC Γ ⊢ A
      cut : ∀ {A B   Γ} → SC Γ ⊢ A → SC A ∷ Γ ⊢ B → SC Γ ⊢ B
      ⇒l  : ∀ {A B C Γ} → SC Γ ⊢ A → SC B ∷ Γ ⊢ C → SC A ⇒ B ∷ Γ ⊢ C
      ⇒r  : ∀ {A B   Γ} → SC A ∷ Γ ⊢ B → SC Γ ⊢ A ⇒ B
\end{code}

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
    ND⇔SC : ∀ {A Γ} → ND Γ ⊢ A ⇔ SC Γ ⊢ A
    ND⇔SC = equivalence ⟹ ⟸
      where
        ⟹ : ∀ {A Γ} → ND Γ ⊢ A → SC Γ ⊢ A
        ⟹ (ax  p)   = ax p
        ⟹ (⇒i  f)   = ⇒r (⟹ f)
        ⟹ (⇒e  f g) = cut (⟹ f) (⇒l (⟹ g) ax₀)
        ⟸ : ∀ {A Γ} → SC Γ ⊢ A → ND Γ ⊢ A
        ⟸ (ax  p)   = ax p
        ⟸ (cut f g) = ⇒e (⇒i (⟸ g)) (⟸ f)
        ⟸ (⇒l  f g) = ⇒e (weak (⇒i (⟸ g))) (⇒e ax₀ (weak (⟸ f)))
        ⟸ (⇒r  f)   = ⇒i (⟸ f)
\end{code}

\begin{code}
    cont : ∀ {A B Γ} → ND A ∷ A ∷ Γ ⊢ B → ND A ∷ Γ ⊢ B
    cont f = ⇒e (⇒i f) (ax (here refl))
\end{code}
