---
layout: single
title: Monads 101: A Practical Introduction
tags:
- monads
- design patterns
- functional programming
---

You've given up on all the other monad tutorials on the internet. You don't want to ask the LLM of the week for an explanation. Wikipedia keeps threatening you with Haskell and functors. Somehow, instead of giving up, you've ended up here.

I'm sorry.

But you're here nonetheless, so let's make the best of it.

## A `map` Is Already `flat`, Isn't It?

I took a long time to understand why the `Map` data structure was called that. Other names - associative array, dictionary, table - those made some kind if sense. But - and yes I'm old - a map to me was the thing you could never fold right after you spent ten minutes pretending you knew where the hell you were. Even now I'm not sure if I ever really understood the meaning of the namd, or if I just gave up.

Anyways, not long after I stopped worrying about that for whatever reason, functional programming started getting more mainstream - even taking a hold in Java of all places. As I started poking around through the new junk Java 8 brought, I kept seeing two new methods: `map` and `flatMap`.

If you or a loved one suffered from either of those, you may be entitled to compensation.

## Cut The Crap: What Do I Need to Know?

Absolute basics: `monad` is a design pattern, just like `Singleton` or `Builder` or `Visitor` - don't worry about all the math crap or type classes or anything. It's three functions and some rules, that's it. 

Technically, it's only _one_ function and some rules - but explaning that would be _more_ involved, so we'll pretend it's three.

### `unit`

The `monad` needs to come from somewhere; this is where. The `unit` function is the `monad` constructor - or more often a factory method.

### `map`

