---
layout: post
title: OpenSats Grant Report Q1 2026
date: 2026-03-30
---

This is a copy of my quarterly report to [OpenSats.org](https://opensats.org) who generously funds my work in the Nostr ecosystem.

You can view the previous quarterly report [here](/2025/12/29/horcrux-end-of-year-update.html).

## How did you spend your time?

> Describe your progress and accomplishments since the last report. Include links to pull requests, commits, and other work.

This quarter I split my time between my social backup tool Horcrux and contributing to the Nostr community space project Flotilla. Horcrux is nearly ready for an open beta release, but I jumped full time into Flotilla a bit earlier than planned to try to capitalize on the exodus from Discord following the announcement of their new age verification policies.

Horcrux got a full UI rework based on user testing along with a couple quality of life features and a ton of bugfixes. Here is the detailed list in roughly chronological order:

- Improved invitations links to work when Horcrux is not installed
- Fixed several synchronization bugs related to invitations and recovery plan changes
- Improved relay communication with an persistent publishing queue and retry system.
- Reworked Recovery Status and Recovery Request screens based on user feedback.
- Implement feature to auto-distribute vault keys to peers instead of requiring user interaction.
- Add UI for vault owners to distribute out-of-band contact info for each steward.
- Added Linux build of the desktop app (along with AI harness for cloud agents to test the app)
- Improved status banner on the Vault Details screen to more clearly explain the current state of the vault and any pending action items for the user.
- Improved the presentation of vault invitations according to user feedback.

You can find all 33 merged PRs [here](https://github.com/mplorentz/horcrux/pulls?q=is%3Apr+updated%3A2026-01-01..2026-03-31+is%3Aclosed).

On Flotilla my main project was implementing Voice Rooms, which are similar in behavior to Discord's voice channels. The full list of contributions I made in rough chronological order are as follows:

- Helped fix a bug related to signing in with Primal's new signer.
- Fixed navigation bug in Settings menu mobile devices.
- Helped fix an issue with uploading images on Android.
- Fixed a bug related to deploying a self-hosted instance Flotilla and improved documentation.
- Added voice channels (modeled after Discord) that integrate a Livekit server for WebRTC calls from within Flotilla. Contributed to NIP updates to standardize AV calls in NIP-29 groups.
- Deployed an instance of the pomade distributed signer to support email-based login w/ Flotilla.
- Working on starting a Nostr builder community-of-practice with a couple friends which will help me dogfood Flotilla as a space steward.

These changes were split into 12 pull requests across two repositories:

- [Flotilla](https://gitea.coracle.social/pulls?type=created_by&sort=recentupdate&state=closed)
- [Zooid](https://github.com/coracle-social/zooid/pulls?q=is%3Apr+is%3Aclosed+author%3Amplorentz+updated%3A2026-01-01..2026-03-31)

## What are your plans for next quarter?

> Outline your goals and plans for the next quarter. Be specific about what you aim to accomplish.

For Horcrux my plan is to do a full release of the app in relevant app stores. The major tasks to complete include:

- Implement background checking for notifications
- Conduct (internal) security audit
- Deploy public beta
- Submit NIP for shamir's secret sharing over Nostr
- Create marketing materials and website
- Deploy release to App Stores

On Flotilla my plan is to:

- Run usability trials with 3 existing non-Nostr communities who are exploring Discord alternatives. Their needs may shift the remaining goals considerably.
- Add video calls and screen sharing.
- Improve notification delivery options and reliability.
- Build a tool for consent-based decision-making (potentially as a third-party addon/bot)
