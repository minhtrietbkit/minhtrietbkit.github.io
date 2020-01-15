---
title: "Linux Memory - Part 1"
date: 2020-01-15
layout: post
category: linux
---

Ok, so this is not really about Linux but rather how computer works in general.

I'm gonna talk about

1. Virtual and physical address space and word length
1. CPU's word length and maximum virtual address space
1. Kernel Space and Userspace

It's not going to be an academic post but a summarize of points that took me so long to understand.

Let's get started!

First, let's talk about `virtual vs physical address space`.

Physical address space is the actual size of your computer's RAM - it's one of the hardware specs that you consider when buying a new laptop.

Virtual address space is the unreal abstraction of how the physical address space - it's the one processes see.

They are not related. And there's a mapping mechanism between the two.

Now, what is the `maximum size of the virtual address space`?

The maximum size of the virtual address space (or rather, the greatest number of different locations that the CPU can address) is decided by the `CPU's word length`. If your CPU's word length is 32 bit, then it can address up to 2^32 different locations, which means the greatest possible size of your virtual address space is 2^32 bytes (or 4 GiB).

Oh but wait, if there are 8 bits in a byte, then if the CPU's word length is 32, shouldn't it be able to address 2^32 bits? (or 512 MiB).

No. Think of this analogy.

The address space is a city. This city has 2^32 houses, each has 8 rooms. If you want to send a letter to John, you put his house's address on the letter. The postman can infer John's house from the address but not John's room within his house.

In the same manners, each of the address in the 2^32 address actually points to an array of 8 bits (or 1 byte). So the total address is 2^32 and the total manageable virtual address space is 2^32 bytes.

This leads to 2 other questions:

1. How does CPU address each of those bits?
2. What exactly does `manageable` mean?
3. Is memory actually seperated into blocks of 8 bits (or 1 byte)?

I don't know the answers yet but hopefully I'll find out later.

Alright, now what's with `kernel space` and `userspace`.

If you've used linux, you've probably heard of these terms or their equivalents. Today, I learn of one way to interpret what they are.

The address space is devided into kernel space and userspace. The ratio depends on the `instruction set architecture`.

From a process's point of view, it owns the whole userspace of the virtual address space. In reality, though, it
