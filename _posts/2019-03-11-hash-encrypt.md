---
title:  "Networking review 1"
date:   2019-03-11
layout: default
category: network
---

## High Level

Internet Service Providers (`ISP`) provide internet access for end devices. ISPs themselves must inter-connect with each other. In reality, Internet is a network of networks, in which there are several `1-tier-ISP`s (`AT&T`, `CenturyLink`...) inter-connecting with each other.

## Packet Switches

Packets travel from one machine to another typically go through `packet switches`. They are usually either `router` or a `layer-2 switch`.

`router`s are used in `core-network`s while `layer-2 switch`es are used in `home-networks`.

Routers have a `forwarding table` which maps the destination IP of an incoming packet on one interface to one of its other network interfaces.

How is this `routing table` get set? It is done by `routing protocols`.

## OSI Model
TBD
