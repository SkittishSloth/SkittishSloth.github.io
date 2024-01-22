---
title: On Types
tags:
---

<section>
Types are often background noise in our day-to-day development work. Yeah, they're
there, and we think about them superficially - I need an `int` for this, or a `List`
for that. We give them lip service when we talk about classes, talking about "data"
and "behaviors". And that's fair - that's the basics. But, unless you're studying 
type theory or working on a programming language, I'd bet good money that you don't 
spend a lot of mental energy on types.

Let's change that, shall we?
</section>
<!-- more -->

<section>
<h3>What's a Type?</h3>

Wikipedia has a lot of good information on data types; here's the definitions it gives, 
and we'll go over each in turn:

{% blockquote Wikipedia https://en.wikipedia.org/wiki/Data_type#Definition  Data Type -> Definition %}
<dl>
    <dt>Syntactic</dt>
    <dd>
        A type is a purely syntactic label associated with a variable when it is declared. Although 
        useful for advanced type systems such as substructural type systems, such definitions provide 
        no intuitive meaning of the types.
    </dd>
    <dt>Representation</dt>
    <dd>
        A type is defined in terms of a composition of more primitive types—often machine types.
    </dd>
    <dt>Representation and behaviour</dt>
    <dd>
        A type is defined as its representation and a set of operators manipulating these representations.
    </dd>
    <dt>Value space</dt>
    <dd>
        A type is a set of possible values which a variable can possess. Such definitions make it possible 
        to speak about (disjoint) unions or Cartesian products of types.
    </dd>
    <dt>Value space and behaviour</dt>
    <dd>
        A type is a set of values which a variable can possess and a set of functions 
        that one can apply to these values.
    </dd>
</dl>
{% endblockquote %}

<section>
<h4>Syntactic</h4>
{% blockquote %}
A type is a purely syntactic label associated with a variable when it is declared.
{% endblockquote %}

This is probably the most appropriate definition when it comes to our day-to-day
uses of types. It's something we use to declare a variable:

{% codeblock %}
final String name = "Sloth";
{% endcodeblock %}

We're declaring a variable and saying that it's of type `String`. The compiler is 
going to take that information and then make sure all uses of `name` correspond to
other places where we declare something is a `String`, such as a method parameter
or another variable assignment. 
</section>

<section>
<h4>Representation</h4>
{% blockquote %}
A type is defined in terms of a composition of more primitive types—often machine types.
{% endblockquote %}


</section>
</section>

<section>
<h3>Ready Your Sets and Go</h3>

The important word in that definition is easy to gloss over: `set`. A type is a _set of values_. 
I'm pretty sure you know what a set is, but to make sure we're on the same page, a set
is a collection of distinct elements. It may have no elements - the empty set. 
It may have an infinite number of elements, like integers. 

There's one additional property of sets we want to pay attention to: _cardinality_.
This is the number of elements in the set - infinity for integers, zero for the empty set.
Cardinality is very important for what we're going to discuss. It isn't used in a 
terribly complicated manner, but it's very important.

There's also some operations that work on sets you want to keep in mind, namely union
and multiplication. Those will be useful later on as well. Quick refresher: union takes
two sets and combines them; multiplication creates a "set of sets" in a way, where each 
internal set contains an element from each set, for every element in each set.
</section>

<section>
<h3>But ... Types?</h3>

Yes, yes, we're getting to that. 

If a type is a set of values, let's see what that looks like. We'll start with a simple case:
`boolean`. Two possible values, `true` and `false`, so we could write it out as a set like this:

{% codeblock %}
{ true, false }
{% endcodeblock %}

This has a cardinality of two - two possible values for anything declared
as a `boolean`. Simple enough, right? Let's do a contrived three-valued set:

{% codeblock %}
StopLight = { RED, YELLOW, GREEN }
{% endcodeblock %}

Three possible values, cardinality of three. You can extend this to other types yourself,
but this is where the "Representation" definition of a data type becomes a bit more
meaningful. Integers and real numbers are both infinite sets. It's a little
difficult to represent such a range on a computer, so instead we're normally
limited by the hardware. Sticking with small types to keep things simple, in Java you have the `byte` and `short` types:

Type | Size (bits) | Minimum| Maximum | Range
`byte` | 8 | -128 | 127 | 255
`short` | 16 | -32,678 | 32,677 | 65,355

</section>

Notes:
- maybe break into multiple articles
- include the other data type definitions 