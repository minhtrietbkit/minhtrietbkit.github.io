---
title:  "Transport Layer One"
date:   2019-03-23
layout: post
category: network
---

## High Level

Transport layer sits on top of the **Network Layer** providing logical communication between application processes. Its packets are called **segment**s.

Routers don't understand transport layer.

The two main protocols in this layer are **Transmission Control Protocol** (TCP) and **User Datagram Protocol** (UDP).

Transport layer adds reliability to the **unreliable service** provided by the **IP** protocol at the Network layer.

## TCP vs UDP:

**Port number** is a concept in Transport layer. Lower layer doesn't understand ports. A port is a 16-bit non-negative number. The list of well-known ports (0-1023) is defined in [RFC 3232].
    
### TCP

1. TCP socket is identified by a four-tuple: destination/source address and destination/source port.
2. TCP uses two sockets:
   1. *Welcoming socket*: for destination to listen for incoming requests.
   2. *Data socket*: for destination and source to exchange data.
3. TCP requires *3-way handshake* before real data can be exchanged.
4. TCP segment's header has 20 bytes.

### UDP
1. UDP socket is identified by a two-tuple: destination address and destination port.
2. UDP uses one socket
3. Data can be exchanged directly without initial process.
4. UDP segment's header has 8 bytes.

Application | Application-Layer Protocl | Underlying Transport Protocol
----- | ----- | -----
Electronic mail | SMTP | TCP
Remote terminal access | Telnet | TCP
Web | HTTP | TCP
File transfer | FTP | TCP
Remote file server | NFS | Typically UDP
Streaming multimedia | typically proprietary | UDP or TCP
Internet telephony | typically proprietary | UDP or TCP
Network management | SNMP | Typically UDP
Routing protocol | RIP | Typically UDP
Name translation | DNS | Typically UDP
Popular Internet applications and their underlying transport protocols ~ {{site.data.ref.topdown}}