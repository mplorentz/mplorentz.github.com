---
layout: post
title: Nostr v SSB
date: 2023-01-18
tags: social decentralized nostr ssb
---

_This is part of a document I wrote up while researching Nostr on behalf of the company I work for, [Planetary](https://planetary.social). I’m sharing it here because several people outside have asked to see it. These are my opnions after spending 5 years in the Secure Scuttlebutt community and 1 week in the Nostr community, so there are certainly some generalizations on the Nostr side that are based on first impressions and bias and may not be reflective of every part of the ecosystem. It’s also worth mentioning that Nostr is very young and could change significantly. Indeed it will have to if it continues to grow._


# Summary

Nostr is “The simplest open protocol that is able to create a censorship-resistant global ‘social’ network once and for all.” Nostr is very young and the protocol is still in its infancy. It’s unclear whether its simplicity is naive or elegant, whether it can scale to millions of users both in technical performance and preventing spam and abuse. Nevertheless the protocol is easy to work with and has a vibrant community quickly growing around it.

The key difference at a protocol level is that SSB posts are signed and published to an ordered append-only log, while Nostr posts are just signed and sent to to relay servers. There are many other differences most of them hinge on this fact.

The main **advantages** it has over Scuttlebutt are:



* Onboarding is quick and easy.
* The protocol already supports editing, deleting, and ephemeral posts.
* You can use the same account with multiple devices.
* It is much easier to understand and implement.
* It has more active users, momentum, apps, and tools.


The main **disadvantages** it has vs. Scuttlebutt are:


* There are not yet any good systems to prevent abuse on public relays. There is no way to block or hide abusive accounts or posts in most apps, there is no standard way to report abusive accounts to relay owners, there are no blocklists being shared by relay owners, etc. 
* There is not yet any good solution to preventing spam on the network. The leading idea so far is adding a proof-of-work cost to publish a message, which is isn't a great solution imo.
* Nostr messages are unordered. This is what gives the protocol its simplicity and power, but it creates some side effects:
    * You can never know if you have all the messages from a given account, even your own.
    * You can’t efficiently sync messages between relays (yet). This results in awkward flows where users may not be sure where their data is or how to move it.
    * It may not be obvious when a relay is omitting some content on purpose.
    * Faking the timestamp on a message is much easier.

Here are some other **contrasts** that don’t fall clearly into advantage/disadvantage:


<table>
  <tr>
   <td><strong>SSB</strong>
   </td>
   <td><strong>Nostr</strong>
   </td>
  </tr>
  <tr>
   <td>Local discourse
   </td>
   <td>Global discourse
   </td>
  </tr>
  <tr>
   <td>Freedom of listening first
   </td>
   <td>Freedom of speech first
   </td>
  </tr>
  <tr>
   <td>Solarpunk, anti-capitalist vibes
   </td>
   <td>crypto vibes
   </td>
  </tr>
  <tr>
   <td>Slow rate of protocol change
   </td>
   <td>High rate of protocol change
   </td>
  </tr>
  <tr>
   <td>Poor docs + specs
   </td>
   <td>Good docs + specs
   </td>
  </tr>
  <tr>
   <td>Founder inactive
   </td>
   <td>Founder active
   </td>
  </tr>
  <tr>
   <td>Emphasis on relationships + governance to solve problems
   </td>
   <td>Emphasis on technology to solve problems
   </td>
  </tr>
</table>



# Technical Feature Comparison


<table>
  <tr>
   <td><strong>Feature</strong>
   </td>
   <td><strong>SSB</strong>
   </td>
   <td><strong>Nostr</strong>
   </td>
  </tr>
  <tr>
   <td>Self-authenticating data
   </td>
   <td>X
   </td>
   <td>X
   </td>
  </tr>
  <tr>
   <td>Identity portability
   </td>
   <td>X
   </td>
   <td>X
   </td>
  </tr>
  <tr>
   <td>Trustless servers
   </td>
   <td>X
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>Multi-device identities
   </td>
   <td>
   </td>
   <td>X
   </td>
  </tr>
  <tr>
   <td>Key rotation
   </td>
   <td>
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>Key delegation
   </td>
   <td>
   </td>
   <td>X
   </td>
  </tr>
  <tr>
   <td>Edit/Deleting Content
   </td>
   <td>
   </td>
   <td>X
   </td>
  </tr>
  <tr>
   <td>Peer to Peer Replication
   </td>
   <td>X
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>Binary Data
   </td>
   <td>X
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>Peer content moderation
   </td>
   <td>X
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>Aliases for identities
   </td>
   <td>X
   </td>
   <td>X
   </td>
  </tr>
  <tr>
   <td>Retweets/reposts
   </td>
   <td>
   </td>
   <td>X
   </td>
  </tr>
  <tr>
   <td>Impossible to fork feed
   </td>
   <td>
   </td>
   <td>X
   </td>
  </tr>
  <tr>
   <td>Easy to add new message types
   </td>
   <td>X
   </td>
   <td>X
   </td>
  </tr>
  <tr>
   <td>Hashtags
   </td>
   <td>X
   </td>
   <td>X
   </td>
  </tr>
  <tr>
   <td>Ephemeral Messages
   </td>
   <td>
   </td>
   <td>X
   </td>
  </tr>
  <tr>
   <td>Published social graph
   </td>
   <td>X
   </td>
   <td>X
   </td>
  </tr>
  <tr>
   <td>Private direct messages
   </td>
   <td>X
   </td>
   <td>X
   </td>
  </tr>
  <tr>
   <td>Private groups
   </td>
   <td>
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>Public groups
   </td>
   <td>
   </td>
   <td>X
   </td>
  </tr>
  <tr>
   <td>Emoji reactions
   </td>
   <td>X
   </td>
   <td>X
   </td>
  </tr>
  <tr>
   <td>Content warnings
   </td>
   <td>X
   </td>
   <td>X
   </td>
  </tr>
  <tr>
   <td>Web viewers
   </td>
   <td>X
   </td>
   <td>X
   </td>
  </tr>
  <tr>
   <td>User interaction required for relays
   </td>
   <td>X
   </td>
   <td>X
   </td>
  </tr>
  <tr>
   <td>Works offline
   </td>
   <td>X
   </td>
   <td>
   </td>
  </tr>
</table>
