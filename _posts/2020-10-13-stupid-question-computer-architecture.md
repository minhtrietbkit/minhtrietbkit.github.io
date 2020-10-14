---
title: "Stupid Question in Computer Architecture"
date: 2020-10-13
layout: post
category: linux
---

A list of Computer Architecture questions so silly but keep tripping me from time to time.

1. How many bits of data are represented by a single memory address?
> 8 bits (1 byte)
2. One could say that "the value stored at address 0x0100100B is 4C". How do you know a single memory location is enough to store that value?
> The single memory location denoted by address 0x0100100B can contain 8 bits of data. 4C is a value comprised of 2 hexadecimals. A hex value contains 4 bits of data therefore 2 hex values give 8 bits of data, which fit into the 8 bits provided by a single memory location.

