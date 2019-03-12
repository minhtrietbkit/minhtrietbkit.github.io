---
title:  "Cryptographic Hash VS Encryption"
date:   2019-03-08
layout: post
category: network
---
Recently, I had to dig up my knowledge about `Public Key Encryption`. I thought it was a chance to also take a look at `Cryptographic Hash`.

This post is inspired by this [WHAT IS THE DIFFERENCE BETWEEN HASHING AND ENCRYPTING](https://www.securityinnovationeurope.com/blog/page/whats-the-difference-between-hashing-and-encrypting). 

## Cryptographic Hash

### What is it:
  1. An algorithm which produces a fixed-size output (`digest`) for an arbitrary input
  2. For one input, there's only one `digest`
  3. A small change in the original text leads to huge difference in `digest`
  4. `digest`s are **virtually** impossible to reverse (obtain original data from `digest`)

### When to use:

* > Store a piece of data somewhere but do not want it to be understood by anyone.
  
A user database must store users' passwords. The developers don't want people who has the authority to access the machine on which the db server runs (such as system admin) to view the passwords. Developers store the `digest`s of the passwords instead of the plain passwords. When users log in, the passwords are hashed and the respective `digest` is compared with the DB.

* > Verify the data is not tampered.

Open source software typically lets user verify the integrity of the program by providing the `digest` of the binary. User can compare the binary file with the `digest`.

### Some notable cryptographic hash algorithms: 
  * `md5`
  * `sha1`
  * `sha256`
  * `sha384`
  * `sha512`

## Encryption

### What is it:

Encryption is also about making data unreadable. But the difference (from `cryptographic hash`) is that encrypted files are meant to be decrypted.

### Types of encryption:

1. `Symmetric` encryption: encrypt and decrypt with the same key
2. `Asymmetric` encryption (`public key` encryption)
   1. Data encrypted with `public key` can only be decrypted with `private key` (and vice versa)
   2. Can generate `public key` from `private key` (the opposite thing is NOT possible)

### When to use:

Clearly, encryption is used when data is meant to be readable only by some people. However, `public key` encryption serves other purposes:

1. Verify who sends the message: `sign`ing a message makes it possible to verify who the message belongs to by decrypting it with the coresponding `public key`. 
2. Make sure message can only be read by its intended receiver: a message encrypted with a `public key` can only be decrypted with the one and only corresponding `private key`.

> To `sign` a message is to encrypt a message with a `private key`. To `verify` the message's authenticity is to decrypt it with a `public key`.

### Some notable encryption algorithms: 

1. `Symmetric` encryption: `AES`
1. `Public key` encryption: `RSA`