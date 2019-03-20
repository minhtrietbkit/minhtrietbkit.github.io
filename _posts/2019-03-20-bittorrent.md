---
title:  "BitTorrent Protocol"
date:   2019-03-20
layout: post
category: network
---

## Definition
> BitTorrent is a popular P2P protocol for file distribution ~ {{site.data.ref.topdown}}

## Terminologies

Term | Meaning
------ | ------
torrent | all peers participating the distribution of a file
chunk | smallest unit of a file that is transfered between peers
tracker | a node in a torrent which keeps track of peers that are participating in the torrent
tit-for-tat | the incentive mechanism to decide which peer should get chunks

## How it works

Consider an example: Alice joins a torrent to download a file. The explanation is an interpretation of the same example in {{site.data.ref.topdown}}.

1. Alice registers herself with the tracker.
2. Tracker gives Alice a random list of peers.
3. Alice tries initiating TCP connection to each of these peers. Those that respond become her "neighboring peer"s.
4. At any point in time, Alice has a list of chunks each of the neighboring peers has.
5. Alice needs to decide:
   1. Which chunk should she request first -> Applying the **rarest first** rule, she will request the chunk rarest among her neighbors.
   2. Which requests (from other neighbors) should she send her chunks
      1. -> Alice chooses the 4 neghbors which are feeding her at the highest rate
      2. -> Alice periodically chooses a random peer to start feeding him. After sometimes, Alice becomes his "top feeder", in which case he will start sending his chunks to Alice and in turn becomes Alice's "top feeder". This is how new nodes get chunks.
      3. This incentive mechanism is called **tit-for-tat**

