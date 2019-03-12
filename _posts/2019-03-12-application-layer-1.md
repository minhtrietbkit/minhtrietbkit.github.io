---
title:  "Application Layer 1"
date:   2019-03-12
layout: default
category: network
---

## High Level

Sits at the top of the `OSI` model, the `Application Layer` provides services for applications via the `socket` API.

## HTTP

`HTTP` is a **stateless** protocol which uses `TCP` (instead of `UDP`) from the `Transport Layer`. From the developer's point of view, an application can use `TCP` via `TCPSocket Interface` and `UDP` via `UDPSocket Interface` [see more](https://www.w3.org/2012/sysapps/tcp-udp-sockets/#interface-tcpsocket).

`HTTP` is defined in [RFC 1945] and [RFC 2616]. The requests are in plain text. You can try it with `telnet`.

```bash
telnet cis.poly.edu 80
GET /~ross/ HTTP/1.1 Host: cis.poly.edu
```
~ from [Computer Networking: A Top-Down Approach (6th Edition)](https://www.amazon.com/Computer-Networking-Top-Down-Approach-6th/dp/0132856204)

## Cookies

`Cookies` is a feature to help make `HTTP` **stateful**. It is described in several RFCs. The latest as of this writing is [RFC 6265]. `Cookies` works because browsers/agents actually support it. If you try using an agent that does not support it, it just won't work.