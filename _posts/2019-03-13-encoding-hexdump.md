---
title:  "Encoding And Hexdump"
date:   2019-03-13
layout: post
category: linux
---
It's always been sort of a mystery for me how data is stored. I've always known it's gonna be just `0`s and `1`s but still, I guess I want to really *see* it somehow.
This post is going to:
1. Give brief discussion about *encoding* because it's somewhat related to how data is stored.
2. Use `hexdump`, a powerfull tool available on many modern `Linux` systems, to see *each and every bits* of a file.

# Encoding

[This](http://kunststube.net/encoding/) is a very good post about *encoding*. I'm going to summarize my understanding below.

## Encoding

1. Computers don't understand or store characters. They only work with bits - 0 or 1.
2. When we store a character, we are actually storing a sequence of 0s and 1s, according to the *encoding* that is used to encode the character.
3. An *encoding* is simply a mapping of sequences of bits (typically 8 bits) to  characters.
4. A *character set* is all the characters that an encoding can represent. `ASCII`, which uses 8 bits per character, has a character set of 2^8 = 128 characters.
5. `ASCII` is not the only one encoding out there and it is not nearly enough to encode all characters of all the languages in the world.

## Unicode
6. *Unicode* comes into play. It's a mapping of a number with a character (a *code point*). The total number code points is greater than 1 million.
7. Unicode is not an encoding. In order to represent about 1 million characters, at least 3 bytes must be used. However generally 4 bytes will be used instead.
8. Unicode is usually encoded using `UTF-8` encoding, which is a *variable-width* character encoding and has different bit length for different characters [see more here](https://en.wikipedia.org/wiki/UTF-8#Description).
