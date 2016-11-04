---
title        : "*zap* is why we can't have nice things..."
date         : 2016-10-25 12:00:00
categories   : []
tags         : [draft, process calculus]
---

There is always a point where nice theoretical work must touch the
real world---no matter how much it smells, and how sticky it
is---because, in the end, it is where we live.
Take the lambda calculus, for instance. It is a beautifully simple
system made up of three bits of syntax and a single rewrite rule, in
which you can write any function you would conceivable want to
write![^computable]

$$
\begin{array}{rll}
    \text{Terms}\;s,t,u
    ::=  & x             & \text{variable} \\
    \mid & \lambda x . t & \text{abstraction} \\
    \mid & s\;t          & \text{application} \\
\end{array}
$$

$$
\begin{array}{ll}
    (\lambda x . s)\;t \longrightarrow s\{t/x\}
    & \beta\text{-reduction} \\
\end{array}
$$

For instance, below we implement the natural numbers as lambda terms,
and write a program that does addition. In the second column, you can
see the execution of the program that adds $$2 + 1$$.

$$
\begin{array}{ll}
    0 &\equiv \lambda f. \lambda x. x
    \\
    1 &\equiv \lambda f. \lambda x. f\;x
    \\
    2 &\equiv \lambda f. \lambda x. f\;(f\;x)
    \\
    \,\vdots
    \\
    n &\equiv \lambda f. \lambda x. f^n\;x
    \\
    \\
    {\cdot+\cdot} &\equiv \lambda m. \lambda n. \lambda f.
    \lambda x. m\;f\;(n\;f\;x)
\end{array}
\quad
\begin{array}{rl}
    2 + 1 \longrightarrow
        &(\lambda n.\lambda f.\lambda x.2\;f\;(n\;f\;x))\;1
    \\\longrightarrow
        &\lambda f.\lambda x.2\;f\;(1\;f\;x)
    \\\longrightarrow
        &\lambda f.\lambda x.2\;f\;((\lambda x'.f\;x')\;x)
    \\\longrightarrow
        &\lambda f.\lambda x.2\;f\;(f\;x)
    \\\longrightarrow
        &\lambda f.\lambda x.(\lambda x'.f\;(f\;x'))\;(f\;x)
    \\\longrightarrow
        &\lambda f.\lambda x.f\;(f\;(f\;x))
    \\\equiv
        &3
\end{array}
$$

For these nice, pure lambda terms, the realisation that at some
point they'll *have to* touch the real world comes in two forms:

  - The first is the fact that we often want our programs to interact
  with the world in some way---to receive some input, and send values
  to our screens in the form of words or pretty pictures. The
  unpleasantness of this interaction is perhaps best seen in Haskell's
  IO monad, which allows interaction with the world, but nontheless
  quarantines it, in order to preserve at least some of the fantasy of
  the nice and pure system existing.

  - The second is the crushing realisation that lambda terms, in the
  end, must be run on a computer, and computers---with their operating
  systems written in impure languages, and their fallible
  hardware---are not nearly as deterministic as we make them out to
  be.

An ugly and inconsistent world can be dealt with: we must simply
acknowledge its shortcomings, and account for them. We cannot treat
communication with the world as if it were pure, but we must instead
communicate with the world over a *linear* channel.
This is [more-or-less what Haskell's IO monad does][HaskellIO].

The second problem is more difficult, because it messes with the
integrity of the *pure* parts of our term calculus.
In practice, our calculus doesn't just have the $$\beta$$-reduction
rule. It has two more reduction rules:

$$
\begin{array}{ll}
    t \longrightarrow zap & \text{crash} \\
    t \longrightarrow t'  & \text{soft fault}
\end{array}
$$

Let us assume that while we are computing $$2 + 1$$, a highly
energetic proton smashes into our memory, and flips a bit. This could
result in two things: either the memory is corrupted, and the
computation goes *completely off the rails*... or, the lambda term is
slightly different, *but still valid*.
For instance, instead of the computation above, we could end up with
either of the following two computations:

$$
\begin{array}{rl}
    2 + 1 \longrightarrow
        &(\lambda n.\lambda f.\lambda x.2\;f\;(n\;f\;x))\;1
    \\\longrightarrow
        &\lambda f.\lambda x.2\;f\;(1\;f\;x)
    \\\longrightarrow
        &\lambda f.\lambda x.2\;f\;((\lambda x'.f\;x')\;x)
    \\\longrightarrow
        &\lambda f.\lambda x.2\;f\;(f\;x)
    \\\longrightarrow
        &zap
    \\
    \\
    \\
\end{array}
\quad
\begin{array}{rl}
    2 + 1 \longrightarrow
        &(\lambda n.\lambda f.\lambda x.2\;f\;(n\;f\;x))\;1
    \\\longrightarrow
        &\lambda f.\lambda x.2\;f\;(1\;f\;x)
    \\\longrightarrow
        &\lambda f.\lambda x.2\;f\;((\lambda x'.f\;x')\;x)
    \\\longrightarrow
        &\lambda f.\lambda x.2\;f\;(f\;x)
    \\\longrightarrow
        &\lambda f.\lambda x.2\;f\;(f\;(f\;x))\leftarrow\text{fault}
    \\\longrightarrow
        &\lambda f.\lambda x.(\lambda x'.f\;(f\;x'))\;(f\;(f\;x))
    \\\longrightarrow
        &\lambda f.\lambda x.f\;(f\;(f\;(f\;x)))
    \\\equiv
        &4
\end{array}
$$

At this point, all things nice are lost.
We don't have determinism, as any term can non-deterministically
reduce to any other term.
Worse, we don't have *any* normalising programs---programs which we
know terminate---as programs *can* fault into bigger programs, and
this *could* go on forever.
The best we can do is willful ignorance. We write programs pretending
$$\text{crash}$$ and $$\text{soft fault}$$ don't exist, and hope for
the best... and for the most of it, that *actually seems to work*.

*For the most of it.* I won't go into details, because billion dollar
losses in car factories due to space radiation bores me so---*even
though the word space is in there*! However, the reality is that
crashes and soft faults *do* happen, and when programs are both
unprepared *and* mission critical, bad things happen.
The point is, these things are *rare*. Way too *rare* too warrent an
unrestricted reduction rule. It makes sense, then, to work under the
assumption that *only one* such an event will happen at a time.

Walker et al.[^walker2006] develop an extension of the lambda calculus
which, under the assumption of a "Single Event Upset". This extension
is so reliable that even in the face of photons crashing down from
space, this calculus retains all nice properties that we have come to
expect of lambda calculi.
Well, in the face of one *very lucky* photon. Still.

The idea is very simple: we simply perform every computation *three
times*. At any point in our code where we branch, we check if the
three computations are still in agreement. There's three things that
can happen:

  - They're all in agreement! *Great*!
  - One of them has crashed...
    so it must've had a $$\text{crash}$$...
  - One of them is disagreeing with the other two...
    so it must've had a $$\text{soft fault}$$...

If any bad stuff has happened, we simply restore that line of
computation from one of the other two, and carry on. As long as only
one bad thing happens at a time, we'll be fine.[^arbitrary]
They are able to do this by adding a new, primitive operator
implement is a majority voting $$vote_k(\vec{v})$$ function which,
when majority term exists amongst the arguments $$\vec{v}$$, returns
it, and otherwise is undefined. Safe function application is then
defined as follows:

$$
    \text{safe}\;f\;\vec{v} ::= f\;vote(\vec{v})
$$

The calculus itself adds of the duplication---eh, triplication---of
work as primitives to the calculus, which makes sense, as they want to
prove that it always has nice properties. However, most of this can be
translated back into the lambda calculus.
For instance, the calculus itself also adds primitive vectors, which
can be compiled as to maximise their independence---and minimise the
chances of them being messed up at the same time.
But that's hardware, so I don't care too much about the details---and
the lambda calculus is perfectly capable of representing lists.

What I do care about is their $$vote$$ primitive. Practically speaking,
this primitive computes *syntactic equality* on *unreduced* terms (up
to renaming). Interesting other programs that you can write with this
mechanism pending...
But for now, let's assume this mechanism is truly
benign[^selfinterpreter]---in their calculus, the use of $$vote$$ is
restricted to ensuring reliability anyway.


# *zapping* process calculus

Conceptually, if not practically, programs in the lambda calculus run
on a single computer. If they communicate with other programs, then
that is *through* the murkiness of the "world", and therefore our
theory cannot adequatly capture their interaction.

The same is not true for process calculus. Conceptually, process
calculus allows us to abstract over many different processes running
on many different computers. This also allows for different ways of
*zapping* processes.

Process calculus is to communicating processes what the lambda
calculus is to functions---though both can express the same functions,
their strengths and weaknesses differ.

$$
\begin{array}{rll}
    \text{Terms}\;P,Q,R
    ::=  & x(y).P              & \text{receive y on x, run P} \\
    \mid & x\langle y\rangle.P & \text{send y on x, run P} \\
    \mid & P \mid Q            & \text{run P and Q simultaneously} \\
    \mid & (\nu x) P           & \text{create a new channel x, run P} \\
    \mid & !P                  & \text{repeatedly spawn copies of P} \\
    \mid & 0                   & \text{terminate}
\end{array}
$$

The only real reduction rule of process calculus is communication: the
left process $$x\langle v \rangle.P$$ sends $$v$$ over $$x$$, and then
continues as $$P$$, and the right process $$x(y).Q$$ receives the
value $$v$$ over $$x$$, calls it $$y$$, and continues as $$Q$$.

$$
\begin{array}{ll}
    (x\langle v\rangle.P \mid x(y).Q)
    \longrightarrow
    (P\mid Q\{v/y\})
    & \text{communication} \\
\end{array}
$$

However, we can make a similar argument as we did above, and extend
the process calculus with $$\text{crash}$$ and $$\text{soft fault}$$.

$$
\begin{array}{ll}
    P \longrightarrow zap & \text{crash} \\
    P \longrightarrow P'  & \text{soft fault}
\end{array}
$$

This is where a small injustice must come to light. When I talked
about how exactly to evaluate programs in the lambda calculus, I never
mentioned *where* in the term $$\beta$$-reduction could be
applied. This makes sense for $$\beta$$-reduction, as it doesn't
matter in most cases. It also makes sense for $$\text{soft fault}$$,
as corruptions in memory could strike *anywhere*. But for
$$\text{crash}$$, this doesn't make a whole lot of sense---surely if
some part of the program crashes, the *entire* program comes crashing
down. After all, we don't have anything like a
$$\text{try}\ldots\text{catch}$$ mechanism.
So in the lambda calculus, we can only $$\text{crash}$$ the top-level
term. Not so in process calculus.

Process calculus also has new and exciting kinds of photons. Because
every communication *might* pass through the world---certainly those
which send values off to different computers---we have new ways for
seemingly well-behaved processes to go wrong! Two examples of
this are $$\text{packet error}$$ and $$\text{packet loss}$$---both
instances of $$\text{soft fault}$$, but both frighteningly more common
than lucky photons.

$$
\begin{array}{ll}
    (x\langle v\rangle.P \mid x(y).Q)
    \longrightarrow
    (P\mid Q\{v'/y\})
    & \text{packet error} \\

    (x\langle v\rangle.P \mid x(y).Q)
    \longrightarrow
    (P\mid x(y).Q)
    & \text{packet loss}
\end{array}
$$

And there are more problems! Fun! Our mechanism for fault tolerance in
the lambda calculus relied on comparing lambda terms *syntactically*.
However, in the process calculus, we can only send *names*. This means
that the only way to compare them is to see if the names are
identical---which they won't be---or by exhaustively communicating
with the process according to some protocol---after which we won't be
able to *actually* run them because we've already run them to check
for equal behaviour.

To solve this, we'd probably have to use something like higher-order
process calculus, in which you send entire processes. We could then
inspect them for equality, and send them back---or an ACK---to the
server for further execution.

And what about types? Walker et al. set up a type system for the
fault tolerant lambda calculus, but can we do the same for process
calculus? The problem is that type systems for the process calculus
rely on *linearity*. You can only be sure that communication goes when
when you strictly adhere to a protocol on both ends---and that
includes not sending an $$A$$ again because you think it might've not
been received while the protocol states that you should be sending a
$$B$$.

Fault tolerance interacts unpleasantly with linearity. Linearity
requires that we use every value *exactly once* whereas fault
tolerance requires that we do every computation *at least three
times*.

$$
\begin{array}{ccccccccc}
    & \rightarrow & C_1 & \rightarrow &   & \rightarrow & C_1 & \rightarrow &
\\A & \rightarrow & C_2 & \rightarrow & A & \rightarrow & C_2 & \rightarrow & A
\\  & \rightarrow & C_3 & \rightarrow &   & \rightarrow & C_3 & \rightarrow &
\end{array}
$$

Fault tolerance defeats strict linearity---we have to do each
computation three times, and check the result of these computations in
three separate processes. However, we can still be sure that in a
well-typed, well-behaved program, we will end up using each value
*exactly* three times.

The downside of this, however, is that we cannot implement this
behaviour in the linear-typed π-calculus. We will have to move to a
calculus which supports a richer structure of linearity---i.e. allows
arbitrary reference counting constraints.

Other problems which soft faults, is that they may result in
computations which are not well-typed and therefore may get stuck.


---

[^computable]:
    Given that you're a sensible person, and would only want to write
    computible functions---i.e. those for which an algorithm exists.
    (Or, formally: those for which a lambda term exists. Yes, I'm
    aware of the circularity.)

[^walker2006]:
    [Static Typing for a Faulty Lambda Calculus][FaultyLambda],
    *David Walker, Lester Mackey, Jay Ligatti, George A. Reis, David
    I. August*. ACM SIGPLAN International Conference on Functional
    Programming (ICFP). September 2006.

[^arbitrary]:
    We can trivially extend this approach to $$k$$ bad things
    happening at a time by running every computation $$2k+1$$ times.
    You know, for when you want to be *really* sure.

[^selfinterpreter]:
    We might be able to implement something *like* $$vote$$ when using
    the right reduction strategy using techniques from
    self-interpretation---even in [a typed setting][SelfInterpret].
    But that thought may also be a fundamental lack of understanding
    of self-interpretation on my part.

[HaskellIO]:     https://www.fpcomplete.com/blog/2015/02/primitive-haskell
[FaultyLambda]:  http://www.cs.princeton.edu/~dpw/papers/lambdazap-icfp06.pdf
[SelfInterpret]: http://compilers.cs.ucla.edu/popl16/popl16-full.pdf
