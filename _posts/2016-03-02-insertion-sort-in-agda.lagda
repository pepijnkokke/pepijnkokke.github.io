---
title      : "Insertion sort in Agda"
date       : 2016-03-01 12:00:00
categories : [agda]
tags       : [agda]
---

I wrote this code a long time ago, and verifiying the correctness of
some sorting algorithm is pretty much *the* standard "Hello World! I
can Agda!" blog post---well, that and implementing the
λ-calculus---but I really wanted an excuse to test my Jekyll/Agda
integration.

Now, the version of insertion sort that I will write in this blog post
will be *correct by construction*. By this I mean that I will
implemented insertion sort as a function from lists to ordered lists,
where the type of ordered lists only contains ordered lists.
There are some concerns about whether this style of programming is the
right way to go. If you read a lot of Coq code, you will notice that
Coq programmers often implement functions without *any*
guarantees---e.g. they would implement insertion sort as a function from
lists to lists---and then prove the function's properties separately.
Personally, I have found that this style can lead to very clumsy code,
but there are good arguments to be made for its naive efficiency, both
in terms of time and space---if you don't need some property, you
don't have to compute its proof!

I'm getting carried away... Well, one last announcement in the public
interest. This post is written in literate Agda, and I've gone through
the effort of using the Agda hilighter. This means that all functions
and module names have links to their definitions---be it within the
post, or in the Agda standard library!

Obligatory "this is literate code, here are my imports."

\begin{code}
open import Level            using (_⊔_)
open import Data.Vec         using (Vec; []; _∷_)
open import Data.Nat         using (ℕ; zero; suc)
open import Data.Sum         using (_⊎_; inj₁; inj₂)
open import Data.Product     using (∃; _,_; proj₁; proj₂)
open import Data.Empty       using (⊥-elim)
open import Relation.Nullary using (¬_; Dec; yes; no)
open import Relation.Binary
open import Relation.Binary.PropositionalEquality
\end{code}

So the first question is "What do we want to sort?" The boring answer
would be "lists of integers", but let's be a little bit more
general. We can sort anything that forms a *decidable, total
order*. Basically, this means three things:

  - we have some type A;
  - for any x and y of type A, we have a *type* of orderings between
    them, which we write as `x ≤ y`;
  - we can actually get that ordering using `x ≤? y` or `total x y`.

Below, we define our module to work for any decidable total order, and
we unpack that order. If you have a look at `≤?` and `total`, you'll
notice that they do slightly different things. For some x and y, `x ≤?
y` will tell you whether or not `x ≤ y`, whereas `total` will tell you
whether it is `x ≤ y` or `y ≤ x`.

\begin{code}
module InsertionSort {c ℓ₁ ℓ₂} (Ord : DecTotalOrder c ℓ₁ ℓ₂) where

  open DecTotalOrder {{...}} using (_≤_; _≤?_; total)
  A = DecTotalOrder.Carrier Ord
\end{code}

The type A is already ordered, but it would be incredibly convenient
if it were also *bounded*---meaning that it has a value which is
smaller than everything else, and a value which is bigger than
everything else. Below, we define a wrapper for A which is bounded at
the top by ⊤ and at the bottom by ⊥:

\begin{code}
  data Â : Set c where
    ⊤ : Â
    ⊥ : Â
    ⟦_⟧ : A → Â
\end{code}

We still need to encode the fact that ⊥ and ⊤ are in fact smaller and
bigger than all other values. Below, we defined the order ≲ on bounded
Â... where we simply state these facts as ⊥≲ and ≲⊤:

\begin{code}
  infix 4 _≲_

  data _≲_ : Rel Â (c ⊔ ℓ₂) where
    ⊥≲ : ∀ {x} → ⊥ ≲ x
    ≲⊤ : ∀ {x} → x ≲ ⊤
    ≤-lift : ∀ {x y} → x ≤ y → ⟦ x ⟧ ≲ ⟦ y ⟧
\end{code}

Note that with the last constructor, we can lift the order of any two
values in A into ≲. However, if we only have a proof of ≰, then the
lifting is slightly more involved. Therefore, we define a function
which does this for us:

\begin{code}
  ≰-lift : ∀ {x y} → ¬ (y ≤ x) → ⟦ x ⟧ ≲ ⟦ y ⟧
  ≰-lift {x} {y} y≰x with total x y
  ≰-lift y≰x | inj₁ x≤y = ≤-lift x≤y
  ≰-lift y≰x | inj₂ y≤x = ⊥-elim (y≰x y≤x)
\end{code}

Another thing we can do with two values of type Â is compute their
*minimum*. This is one example where we deviate from *correctness by
construction*: we define minimum function ⊓, and only then prove its
correctness:

\begin{code}
  infix 5 _⊓_

  _⊓_ : Â → Â → Â
  ⊤ ⊓ y = y
  ⊥ ⊓ _ = ⊥
  x ⊓ ⊤ = x
  _ ⊓ ⊥ = ⊥
  ⟦ x ⟧ ⊓ ⟦ y ⟧ with x ≤? y
  ⟦ x ⟧ ⊓ ⟦ y ⟧ | yes x≤y = ⟦ x ⟧
  ⟦ x ⟧ ⊓ ⟦ y ⟧ | no  x>y = ⟦ y ⟧

  ⊓-conserves-≲ : ∀ {x y z} → x ≲ y → x ≲ z → x ≲ y ⊓ z
  ⊓-conserves-≲ {x} {⊤} {_} _ q = q
  ⊓-conserves-≲ {x} {⊥} {_} p _ = p
  ⊓-conserves-≲ {x} {⟦ _ ⟧} {⊤} p _ = p
  ⊓-conserves-≲ {x} {⟦ _ ⟧} {⊥} _ q = q
  ⊓-conserves-≲ {x} {⟦ y ⟧} {⟦ z ⟧} p q with y ≤? z
  ⊓-conserves-≲ {x} {⟦ y ⟧} {⟦ z ⟧} p _ | yes y≤z = p
  ⊓-conserves-≲ {x} {⟦ y ⟧} {⟦ z ⟧} _ q | no  y≰z = q
\end{code}

Insertion sort has rather complicated invariants. If we were implementing
mergesort, that we could define ordered lists as lists in which every
element is larger than those before it... But alas! Such a crude
analysis won't work for insertion sort! In fact, the only guarantee that
insertion sort gives us is that after one "bubble"---one iteration over
the list---the *last* element is sorted... and that after *k* insertions,
the last *k* elements are sorted...

So to implement insertion sort, we're going to need some way to represent
lists of which the last *k* elements are sorted. In fact, because it's
easier to implement, we're going to go with an encoding which ensures
us that at most the *first* *k* elements are still *unsorted*.

The `OVec` datatype below has three parameters: *l*, *n* and *k*. The
first of these is the lower bound... that is to say, of the sorted
part, the smallest element is *l*.
The second is the length of the list. One question that we've avoided
so far is the question "What sort of things can go wrong in a sorting
algorithm?" Obviously, the first thing that comes to mind is "it
doens't sort", but some other problems that it could have is that it
can *delete* elements, or *copy* elements. While keeping track of the
length doesn't solve *all* of those problems---if we delete as much as
we copy, we don't change the length---but it's a good starting point.
The last, *k*, is the number of still unsorted elements at the
beginning of the list.

There are three ways to construct an `OVec`:

  - we have the empty list, which has zero length, and zero unsorted
    elements... and a sorted segment of length zero with lower bound
    ⊤---this was the main reason to introduce Â;
  - we can add an element to the sorted segment of the list---as long
    as there aren't any unsorted elements in there yet---but we will
    have to prove that the new element is actually smaller than the
    current lower bound;
  - and finally, we can forgo all sorting, and just add some unsorted
    elements to the front of the list.

\begin{code}
  data OVec : (l : Â) (n k : ℕ) → Set (c ⊔ ℓ₂) where

    []     : OVec ⊤ 0 0

    _∷_by_ : ∀ {l n} (x : A) (xs : OVec l n 0)
           → ⟦ x ⟧ ≲ l → OVec ⟦ x ⟧ (suc n) 0

    _∷_    : ∀ {l n k} (x : A) (xs : OVec l n k)
           → OVec ⊥ (suc n) (suc k)
\end{code}

If we have a regular vector---a list which tracks its length---we can
turn it into a k-ordered vector together with some lower bound. (This
is the reason we're using vectors... if we were using lists, we'd have
another existential with the lists length in it.) Our naive process of
just inserting all elements in the vector as *unsorted* means that the
lower bound will be either ⊤ or ⊥. And we can show that!

\begin{code}
  fromVec : ∀ {n} → Vec A n → ∃ (λ l → OVec l n n)
  fromVec [] = ⊤ , []
  fromVec (x ∷ xs) = ⊥ , x ∷ proj₂ (fromVec xs)

  fromVec-⊤or⊥ : ∀ {n} {xs : Vec A n}
    → let l = proj₁ (fromVec xs) in l ≡ ⊤ ⊎ l ≡ ⊥
  fromVec-⊤or⊥ {.0}       {[]}     = inj₁ refl
  fromVec-⊤or⊥ {.(suc _)} {x ∷ xs} = inj₂ refl
\end{code}

And obviously, we can also turn any k-ordered vector into a regular
vector simply by forgetting about all the order evidence:

\begin{code}
  toVec : ∀ {l n k} → OVec l n k → Vec A n
  toVec [] = []
  toVec (x ∷ xs) = x ∷ toVec xs
  toVec (x ∷ xs by _) = x ∷ toVec xs
\end{code}

Finally! We've developed enough vocabulary to write down what it
really means to perform an insertion:

\begin{code}
  insert : ∀ {l n k} → OVec l n (suc k) → ∃ (λ l → OVec l n k)
  insert (x ∷ xs) = _ , insertAcc x xs
    where
      insertAcc : ∀ {l n k}
                → (x : A) → OVec l n k → OVec (⟦ x ⟧ ⊓ l) (suc n) k
      insertAcc x []       = x ∷ [] by ≲⊤
      insertAcc x (y ∷ xs) = y ∷ insertAcc x xs
      insertAcc x (y ∷ xs by p) with x ≤? y
      ... | yes x≤y = x ∷ (y ∷ xs by p)    by ≤-lift x≤y
      ... | no  x≰y = y ∷ (insertAcc x xs) by ⊓-conserves-≲ (≰-lift x≰y) p
\end{code}

Note that insert takes a vector with *k+1* unsorted elements, but
returns a vector with only *k* unsorted elements! To figure out why
this is, let's have a look at the code. First off, insert takes a
vector with *k+1* unsorted elements... which means that it contains
*at least* one element. We split off this element, and insert it
into the sorted portion of the vector with 'insertAcc'. In doing so,
we construct a list which is one element longer (as we inserted
an element) and which has a new lower bound, which is equal to the
minimum of the previous lower bound and the inserted element.

It follows fairly easily from the fact that 'insert' sorts an element,
that if we repeat 'insert' *k* times, we'll have sorted *k*
elements... and therefore the list.

\begin{code}
  insertsort : ∀ {l n k} → OVec l n k → ∃ (λ l → OVec l n 0)
  insertsort [] = ⊤ , []
  insertsort (x ∷ xs) with insert (x ∷ xs)
  insertsort (x ∷ xs) | l , ys = insertsort ys
  insertsort (x ∷ xs by p) = ⟦ x ⟧ , x ∷ xs by p
\end{code}

There is one thing we haven't verified so far---and I've hinted at this
possibility above. It is fairly simple to implement an insertion sort
algorithm with the *same* type which simply takes the first element
and repeats it *n* times.
So our types aren't perfect. However, such constraints are a little
harder to encode in data types. One approach would be to construct a
sorting permutation instead of working with an input and output list.
What we could do to make this code work is to give a separate
proof---though this would go against my correctness by construction
sensibilities---stating that if an element is in the input list it is
in the output list. However, as I mostly wrote this blog post as a
test case for my Jekyll/Agda integration... I'm not going to put in
the effort to do either.

\begin{code}
\end{code}
