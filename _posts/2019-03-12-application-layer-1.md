---
title:  "Application Layer One"
date:   2019-03-12
layout: post
category: network
---

## High Level

Sits at the top of the **OSI** model, the **Application Layer** provides services for applications via the **socket** API.

## HTTP

**HTTP** is a **stateless** protocol which uses **TCP** (instead of **UDP**) in the **Transport Layer**. From the developer's point of view, an application can use TCP via **TCPSocket Interface** and UDP via **UDPSocket Interface**, [more about that here](https://www.w3.org/2012/sysapps/tcp-udp-sockets/#interface-tcpsocket).

HTTP is defined in [RFC 1945] and [RFC 2616]. The requests are in plain text. You can try it with `telnet`.

```bash
telnet cis.poly.edu 80
GET /~ross/ HTTP/1.1 Host: cis.poly.edu
```
~ [Computer Networking: A Top-Down Approach (6th Edition)](https://www.amazon.com/Computer-Networking-Top-Down-Approach-6th/dp/0132856204)

Note that HTTP works in a **pull** protocol. This means the machine that receives data initiates TCP connection.  

## Cookies

**Cookies** is a feature to help make HTTP **stateful**. It is described in several RFCs. The latest as of this writing is [RFC 6265]. Cookies works because browsers/agents actually support it. If you try using an agent that does not support it, it just won't work.

## Web Cache

> A Web cache—also called a proxy server—is a network entity that satisfies HTTP requests on the behalf of an origin Web server.

~ [Computer Networking: A Top-Down Approach (6th Edition)](https://www.amazon.com/Computer-Networking-Top-Down-Approach-6th/dp/0132856204)

In a typical settings, HTTP requests from machines in a LAN network are routed to a web cache inside that LAN network. Web cache fetches HTML objects for other machines from remote web servers and stores a copy. Web cache will utilize this copy for future request for the same object instead of having to fetch it from the remote web server.

*Question* What if the cached object is older than what is served on the web server?

The answer is that whenever a web cache fetches an object from web servers, it stores a copy with the fetching time. Web cache typically sends a **Conditional GET** to web server with Header `if-modified-since:<time>`, asking if the object has been modified since the last time it was fetched. Response code `304` means the object has not been modified since.

## FTP

**File Transfer Protocol** is stateful and also uses TCP. 

It uses two TCP connections over:
* port 21 on server: for sending control commands
* arbitrary port on client: for sending actual data

The protocol is defined in [RFC 959]

## Electronic mail

A typical setting of how electronic mail works:

```
Sender's mail agent --> mail server A -> mail server B -> Receiver's mail agent
```

Mail agent could be a mail application (iOS Gmail app). 

### Connection between mail servers:
The protocol between mail servers B is **SMTP**, defined in [RFC 5321]. The sending server establishes TCP connection to port 25 of receiving server.

As compared to HTTP, **SMTP** is a **push** protocol in the sense that the machine sending data initiates TCP connection.

Just like HTTP, the protocol is composed of 7-bit ASCII-encoded commands. You can try sending these commands by initiating a TCP connection to port 25 of an email server with `telnet`.

### Connection between agent and its respective mail server:

1. Sender's agent -> Sender's mail server: **SMTP**
2. Reciever's mail server -> Receiver's agent: **POP3** ([RFC 1939]), **IMAP** ([RFC 3501] or HTTP

## Domain Name System
See more here [Domain Name System (DNS) Part 1](/network/2019/03/15/dns-1.html)

## BitTorrnet
See more here [BitTorrent Protocol](/network/2019/03/20/bittorrent.html)