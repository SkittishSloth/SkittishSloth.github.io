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

Wikipedia has a lot of good information on data types, but here's one of the definitions it gives:

{% blockquote Wikipedia https://en.wikipedia.org/wiki/Data_type#Definition  Data Type -> Definition %}
<dl>
    <dt>Value space and behaviour</dt>
    <dd>
        A type is a set of values which a variable can possess and a set of functions 
        that one can apply to these values.
    </dd>
</dl>
{% endblockquote %}

There's four other definitions there, but they mostly break down to the same thing: data
and behaviors. Except `Syntactic`, which Wiki says doesn't help to provide an "intuitive meaning". 
That's technically correct, but it's still an interesting definition that we'll touch on
later.
</section>

<section>
<h3>Ready Your Sets and Go!</h3>

The important word in that definition is easy to gloss over: `set`. A type is a _set of values_. 
I'm pretty sure you know what a set is, but to make sure we're on the same page, a set
is a collection of distinct elements. It may have no elements - the empty set. 
It may have an infinite number of elements, like integers. 

There's one additional property of sets we want to pay attention to: _cardinality_.
This is the number of elements in the set - infinity for integers, zero for the empty set.
Cardinality is very important for what we're going to discuss. It isn't used in a 
terribly complicated manner, but it's very important.

There's also some operations that work on sets you want to keep in mind, namely union
and multiplication, a.k.a the Cartesian product. Those will be useful later on as well. Quick 
refresher: union takes two sets and combines them; multiplication creates a "set of sets" in 
a way, where each internal set contains an element from each set, for every element in each set.
</section>

<section>
<h3>But ... Types?</h3>

Yes, yes, we're getting to that.

First though, _is_ a type a set of values? I mean, Wiki says so, therefore it must be true, right?
Well, let's take a quick look at a super simple case: `boolean`. If you have a `boolean` variable,
it can be either `true` or `false`, which we can look at as a collection of values:

{% codeblock line_number:false %}
[ true, false ]
{% endcodeblock %}

The most basic definition of a set is a collection that doesn't allow duplicates; would duplicates
make any sense for our `boolean` definition?

{% codeblock line_number:false %}
[ true, false, true, true, false, true ]
{% endcodeblock %}

There isn't really any way to differentiate between the diferent instances of the values - if I say
our variable is `true`, how do I specify that I meant the second `true` vs. the fourth? Does it even
matter? Obviously, in real life, there's always different shades of `true` (listen to any politician
for a few minutes if you don't believe me), but in coding we really only have a single `true` value.
Likewise with other types - does it make sense to have multiple, different values of `3` for `int`? 
Or `Hello` for `String`? Probably not. So, I'm going to go ahead and say that a type _is_ a set
of values (plus behaviors, but we'll worry about that later).

So, back to `boolean`. As a set, we can write it out like this:

{% codeblock line_number:false %}
Boolean = { true, false }
{% endcodeblock %}

This has a cardinality of two - two possible values for anything declared
as a `boolean`. Simple enough, right? Let's do a contrived three-valued set:

{% codeblock line_number:false %}
StopLight = { RED, YELLOW, GREEN }
{% endcodeblock %}

Three possible values, cardinality of three. You can extend this to other types yourself,
but this is where the "Representation" definition of a data type becomes a bit more meaningful. 
Integers and real numbers are both infinite sets. It's a little difficult to represent such 
a range on a computer, so instead we're normally limited by the hardware. Sticking with small 
types to keep things simple:

|    Type  | Size (bits)  |        Minimum  |               Maximum |   Range |
| -------: | -----------: | --------------: | --------------------: | ------: |
|   `byte` |            8 |            -128 |                   127 |     255 |
|  `short` |           16 |         -32,768 |                32,767 |  65,535 |
|   `char` |           16 |  `'\u0000'` (0) |  `'\uffff\'` (65,535) |  65,535 |

The __Range__ column is what we're looking for: it's our cardinality. `byte` provides 255 different 
values, and `short` provides 65,535 different values. `char` _also_ provides 65,535 values, as it
takes the same number of bits as `short`; those values are just treated differently.
</section>

<section>
<h3>Everyone Loves Math</h3>

Remember those set operations I was talking about earlier? Well, since types are sets, those
operations apply to types as well. Yep! You can multiply types! Or add them! (You can also
subtract or divide, but those are a lot more complicated than we'll get into here.) And since
those operations work on two sets and create an additional set, that means when you apply
one to two different types, you end up with a new type. Confusing? Yeah, we'll work on that.

<section>
<h4>Product Types</h4>
This is probably one of the rare instances where multiplication is easier to start with than
addition - at least in Java land, anyways - so we'll begin with what are known as Product Types.
These are created by taking the cartesian product of two (or more) types, and it's something you
should be a little familiar with:

{% codeblock lang:java line_number:false %}
public class MyProductType {
    boolean myBoolean;
    StopLight someStopLight;
}
{% endcodeblock %}

Yep! Your good, old fashioned `class` is a product type. A product type is the cartesian product
of two different types - in this case, `boolean` and `StopLight`. When we take the cartesian product
of those two types, we get the following set:

{% codeblock line_number:false %}
{ 
    { true, RED }, { true, YELLOW }, { true, GREEN },
    { false, RED }, { false, YELLOW }, { false, GREEN } 
}
{% endcodeblock %}

That's the set of all possible permutations of the two types, and it's also all of the possible values
for `MyProductType`. The cardinality of the new set - 6 - is also the product of the cardinality of both 
types (2 and 3); if it helps, that's another way to remember it as a "product" type.

Keep in mind that it's not limited to just simple/primitive types:

{% codeblock lang:java line_number:false %}
public class MySuperProductType {
    boolean anotherBoolean;
    MyProductType myProductType;
}
{% endcodeblock %}

This class has the same permutations as above, but multiplied by two - one set of permutations for when
`anotherBoolean` is `true`, another set for when it's `false`.

I'm using `class` here, but any type that contains two or more places for data are product types. This
includes arrays, which are easy to forget about when you're thinking about types. Each element of the
array is an instance of the underlying type, so `boolean[5] arr` has a cardinality of ten.
</section>

<section>
<h4>Sum Types</h4>

Sum types are an easy enough concept to grasp, but they're a little difficult to represent in Java -
at least compared to product types. They're based on the `union` operation, which adds two sets
together and returns a new set with all values from each set (sans duplicates). If you think of 
product types as a kind of "and" operation between two sets, sum types are like an "or" operation:

{% codeblock line_number:false %}
Boolean = { true, false }
StopLight = { RED, YELLOW, GREEN }

MySumType = (Boolean + StopLight) = { true, false, RED, YELLOW, GREEN }
{% endcodeblock %}



</section>

</section>