---
title:  "Encoding"
date:   2019-03-13
layout: post
category: linux
---
It's always been sort of a mystery for me how character is stored. I've always known it's gonna be just `0`s and `1`s but still, I guess I want to really understand it somehow.

[This](https://www.joelonsoftware.com/2003/10/08/the-absolute-minimum-every-software-developer-absolutely-positively-must-know-about-unicode-and-character-sets-no-excuses/) is a very good read on this subject. 

This post is going to summarize my understanding.

## ASCII
1. ASCII is an `encoding` - more on that later, but basically, it deals with how computer stores a character.
4. A *character set* is all the characters that an encoding can represent. `ASCII`, which uses 8 bits per character, has a character set of 2^8 = 256 characters.
5. `ASCII` is not the only encoding out there and it is not nearly enough to encode all characters of all the languages in the world.
6. Initially, `ASCII` really only needed 128 bits to represent what it was intended to (English alphabets, numbers and several other controlling signals). Being encoded with 8 bits, `ASCII` is wasting whole extra 128 possible mappings.
7. While `ASCII` is more than enough for English, imagine squeezing a language who has more than 128 characters. Indeed, a lot of language has such huge alphabets and `different people came up with their own use for the extra 128 bits`.  
8. Eventually, there are languages which contains more than 256 characters it self.

This is when `Unicode` comes into play.

## Unicode
1. *Unicode* is a mapping of a number with a character (a *code point* - a `Unicode`ish concept). The total number of code points is greater than 1 million.
7. `Unicode` doesn't have an upper limit of how many letters it can represent.
7. Unicode is not an encoding but a standard, mapping of a character to a code point. 

> `Unicode` solves these problems:
  > 1. If everyone agrees on the mapping of character-code point, everybody understands that `U+0048 U+0065 U+006C U+006C U+006F` is `Hello`, no matter where they come from.
  > 1. You just invent a new language? No problem, let's just add it to the `Unicode` standard since it has no upper limit.

But how do `Unicode` characters stored in the computer? That's handled by `Encoding`.

## Encoding

1. Computers don't understand or store characters. They only work with bits - 0 or 1.
2. When we store a character, we are actually storing a sequence of 0s and 1s, according to the *encoding* that is used to encode the character.
3. An *encoding* is simply a mapping of sequences of bits to  characters.
4. Unicode is usually encoded using `UTF-8` encoding, which is a *variable-width* character encoding and has different bit length for different characters [see more here](https://en.wikipedia.org/wiki/UTF-8#Description).


