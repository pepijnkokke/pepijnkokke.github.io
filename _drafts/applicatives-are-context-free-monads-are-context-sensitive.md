---
title        : "Applicatives are Context Free, Monads are Context Sensitive"
date         : 2019-07-21 12:00:00
tags         : [formal language theory, haskell, agda]
---

Over the past few days, there's a question that came up repeatedly, first [on Twitter][beka], then after [a talk by Simon Marlow on Selective Functors][coplas]. That question?

> What is the expressiveness of applicative and monadic parser combinators?

Folklore tells us that applicative parsers parse context-free grammars, and monadic parsers parse, well, at very least context-sensitive grammars. However, I've not been able to find a formal proof of the matter, or much writing on the topic at all!

Brent Yorgey has written about [a trick][yorgey] which allows you to parse any recursively enumerable language[^erratum] using applicative parsers, by using recursion to create a production rule for each word in the language, creating a (potentially) infinite grammar.
Brent argues that this means that this means parsers written using applicative parser combinators are way more expressive than context-free grammars.
Instead, I'd argue that Brent has misinterpreted the question. Brent isn't talking about applicative parser combinators. They are talking about applicative parser combinators *plus* the ability to use recursion to construct infinite grammars.

There's another problem with the question. Context-free grammars are an abstract grammar formalism. They describe languages, but they don't come equipped with any specific way to *parse*. Parser combinator libraries are *parser libraries*. They *are* a specific way to parse. However, there is no abstract notion of what parser combinators are; there are only concrete libraries. So while it makes sense to say that [Parsec] can parse "predictive LL[1] grammars," it doesn't make sense to say that parser combinators *in general* are context-free. It's not so much apples and oranges as it is thoughts of fruit and actual fruit.

$$
\texttt{<*>}
$$

TODO: 
- Define the problem: 
  * What languages can we parse using ONLY the subset of Haskell that is `pSymbol` and the functions in `Alternative` using a clairvoiyent, idealised execution model.
  * What languages can we parse using ONLY the subset of Haskell that is `pSymbol` and the functions in `MonadPlus` using a clairvoiyent, idealised execution model.



<!--
Over the past few days, there's a question that came up repeatedly, first [on Twitter][parsec], then after [a talk by Simon Marlow on Selective Functors][coplas]. That question?

> What is the expressiveness of parser combinators?

I spent some time at Utrecht University, and there the fact that parser combinators using *applicative style* parse context-free languages, while parser combinators using *monadic style* parse context-sensitive languages, was considered an obvious truth, part of the computer science folklore, but I've not been able to find a formal proof of the matter. So, let's try to give one ourselves, shall we?

# What are Parser Combinators?

Before we delve into the question of expressiveness, I---uh, I kinda have to explain what parser combinators are, right? Yes. Well, here goes! Parser combinators are an approach to writing parsers using higher-order functions. It's really neat, 'cuz the way you end up writing parsers is *really* close to how you'd write formal grammars, such as context-free grammars. 

That's all a bit vague, though, so in this section, let's build ourselves a basic parser combinator library, based on [Combinator Parsing: A Short Tutorial][techrep] by Doaitse Swierstra.

First, what is a parser, really? We could start out by saying "A parser is a function from a list of symbols to some value." A bit naive, but it gives us a type:

```haskell
type Parser s a = [s] -> a
```

That's a fine type for finished parsers---if we're willing to call, say, `error` in case of a parse error, at least. However, it puts you in hot water when you're trying to actually *write* parsers.

The problem is that your type promises that you'll consume the whole list of input symbols in one go, but if you're writing a parser for, say, C++ code, you don't wanna write that whole parser in one go. Somewhere in there, you might want to write a parser which can say "I had a look at the next few symbols, and they're the number 12. Here's the rest of the symbols back." 

For that, we'd need to change our type:

```haskell
type Parser s a = [s] -> (a, [s])
```

Lastly, parsers can be ambiguous, as there may be several different ways to parse a string. For programming languages, we usually want our grammar to be unambiguous, otherwise who knows how our compiler will interpret our program? However, in natural language, this sort of thing happens all the time, and is referred to as [structural ambiguity][structamb]. For instance, consider this sentence:

> I saw the person with the binoculars.

Did you use the binoculars? Were they holding the binoculars? From the sentence alone, there's no way to know!

If we want to allow our parsers to be ambiguous, we'll have to change our type a little bit more. Instead of a single result, we'll have them return a list of possible results, which is called the [list of successes][wadler] method. Using a list of successes has the lovely benefit that the possibility of failure is now also apparent from ours type---after all, a list of successes can be empty!

```haskell
type Parser s a = [s] -> [(a, [s])]
```

Okay, whew, that's it. That's our final type. We're not gonna mess with our parser type any more. Instead, now that we know what parsers *are*, we're gonna spend some time talking about how to build them, and how to run them.

Let's talk about that last one first! How do we actually run these things? For that first type, things were pretty clear, but now? Okay, to run a parser, we apply it to our list of input symbols. That gives us a list of successes. However, we only want finished parses which consumed the whole document. So, we filter the successes, keeping only those where the list of remaining symbols is empty:

```haskell
parse :: Parser s a -> [s] -> [a]
parse p inp = [ x | (x, rest) <- p inp, null rest ]
```

```haskell
symbol :: s -> Parser s s
symbol s' (s:rest) | s' == s = [(s, rest)]
symbol _  _                  = []
```

```haskell
succeed :: a -> Parser s a
succeed x inp = [(x, inp)]
```

```haskell
fail :: Parser s a
fail inp = []
```

```haskell
(<*>) :: Parser s (a -> b) -> Parser s a -> Parser s b
(p <*> q) inp = [ (f x, inp2) 
                | (f, inp1) <- p inp
                , (x, inp2) <- q inp1 ]
```

```haskell
(<|>) :: Parser s a -> Parser s a -> Parser s a
(p <|> q) inp = p inp ++ q inp
```

```haskell
(<$>) :: (a -> b) -> Parser s a -> Parser s b
f <$> p = succeed f <*> p
```

```haskell
(>>=) :: Parser s a -> (a -> Parser s b) -> Parser s b
(p >>= q) inp = [ (y, inp2) 
                | (x, inp1) <- p inp
                , (y, inp2) <- q x inp1 ]
```

```haskell
data Parser s a where
  Symbol  :: s -> Parser s s
  Succeed :: a -> Parser s a
  Fail    :: Parser s a
  (:<*>)  :: Parser s (a -> b) -> Parser s a -> Parser s b
  (:<|>)  :: Parser s a -> Parser s a -> Parser s a
  (:<$>)  :: (a -> b) -> Parser s a -> Parser s b
  (:>>=)  :: Parser s a -> (a -> Parser s b) -> Parser s b
```

# Applicatives are Context Free

# Monads are Context Sensitive

-->

[^erratum]: Brent argues that the technique can be used to parse *context-sensitive* languages, but the technique can convert arbitrary functions of type `String -> Bool` to parsers, and hence can be used to parse any *recursively enumerable* language. This is pointed out in the comments.
[techrep]: http://www.cs.uu.nl/research/techreps/repo/CS-2008/2008-044.pdf
[structamb]: https://en.wikipedia.org/wiki/Syntactic_ambiguity
[wadler]: https://dl.acm.org/citation.cfm?id=5288
[beka]: https://twitter.com/beka_valentine/status/1118924404040159232
[coplas]: https://di.ku.dk/english/event-calendar-2019/coplas-talk-simon-marlow-facebook/
[techrep]: http://www.cs.uu.nl/research/techreps/repo/CS-2008/2008-044.pdf
[wadler]: https://dl.acm.org/citation.cfm?id=5288
[yorgey]: https://byorgey.wordpress.com/2012/01/05/parsing-context-sensitive-languages-with-applicative/
[cfgparsing]: https://en.wikipedia.org/wiki/Context-free_grammar#Parsing
[parsec]: https://wiki.haskell.org/Parsec
[llparser]: https://en.wikipedia.org/wiki/LL_parser
