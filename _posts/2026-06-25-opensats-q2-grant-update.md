---
layout: post
title: OpenSats Grant Report Q2 2026
date: 2026-06-25
---

This is a copy of my quarterly report to [OpenSats.org](https://opensats.org), who generously funds my work in the Nostr ecosystem.

You can view the previous quarterly report [here](/2026/03/30/opensats-q1-grant-update.html).

## How did you spend your time?

> Describe your progress and accomplishments since the last report. Include links to pull requests, commits, and other work.

This quarter I spent the bulk of my time getting [Horcrux](https://horcruxbackup.com) ready for its public beta release, which I accomplished at the tail end of the quarter. Deploying a tool intended to hold people's most sensitive data is something I do not take lightly, and it has taken longer than I expected to feel confident that it is ready.

The highlights from the quarter are the implementation of a push notification system, a complete rewrite of the data layer, and many smaller bugfixes and improvements.

### Push Notifications

The push notification service sends notifications immediately upon important vault events like recovery requests, responses, and the availability of new vault data. It is critical to recovering vaults in a timely manner.

Key PRs: [#97](https://github.com/mplorentz/horcrux/pull/97), [#99](https://github.com/mplorentz/horcrux/pull/99), [#100](https://github.com/mplorentz/horcrux/pull/100), [#103](https://github.com/mplorentz/horcrux/pull/103), [#104](https://github.com/mplorentz/horcrux/pull/104), [#110](https://github.com/mplorentz/horcrux/pull/110), [#123](https://github.com/mplorentz/horcrux/pull/123), and the new repository: [horcrux-notifier](https://github.com/mplorentz/horcrux-notifier).

### Data Layer Rewrite

Horcrux's local database slowly evolved over the course of the project from a simple encrypted file storing a few Nostr events to a complex system with a dozen entities. It needed a serious upgrade for the long-term security, reliability, and concurrency needs of the application.

I replaced my homegrown ChaChaPoly encrypted JSON file with a SQLCipher/SQLite encrypted database using the popular Drift library for type safety and reactivity. During this time I also refactored the model layer to reduce complexity and duplication of data, which touched almost every part of the app. The result is a production-grade system that should be a reliable base for decades to come.

Key PRs: [#126](https://github.com/mplorentz/horcrux/pull/126), [#127](https://github.com/mplorentz/horcrux/pull/127), [#128](https://github.com/mplorentz/horcrux/pull/128), [#151](https://github.com/mplorentz/horcrux/pull/151), [#152](https://github.com/mplorentz/horcrux/pull/152), [#153](https://github.com/mplorentz/horcrux/pull/153), [#154](https://github.com/mplorentz/horcrux/pull/154), [#155](https://github.com/mplorentz/horcrux/pull/155), [#156](https://github.com/mplorentz/horcrux/pull/156), [#157](https://github.com/mplorentz/horcrux/pull/157).

### Bugfixes and UX Improvements

I also merged 16 more minor features and bugfixes, including an integrity check for share validation, fixes for overlapping recovery sessions, scanning UI for pre-existing vaults after login, better recovery status labels, and more.

PRs: [#237](https://github.com/mplorentz/horcrux/pull/237), [#239](https://github.com/mplorentz/horcrux/pull/239), [#108](https://github.com/mplorentz/horcrux/pull/108), [#121](https://github.com/mplorentz/horcrux/pull/121), [#133](https://github.com/mplorentz/horcrux/pull/133), [#146](https://github.com/mplorentz/horcrux/pull/146), [#180](https://github.com/mplorentz/horcrux/pull/180), [#181](https://github.com/mplorentz/horcrux/pull/181), [#182](https://github.com/mplorentz/horcrux/pull/182), [#96](https://github.com/mplorentz/horcrux/pull/96), [#116](https://github.com/mplorentz/horcrux/pull/116), [#137](https://github.com/mplorentz/horcrux/pull/137), [#140](https://github.com/mplorentz/horcrux/pull/140), [#148](https://github.com/mplorentz/horcrux/pull/148), [#183](https://github.com/mplorentz/horcrux/pull/183), [#242](https://github.com/mplorentz/horcrux/pull/242).

### Flotilla Contributions

I dedicated less time than I planned to [Flotilla](https://app.flotilla.social) this quarter, but I did ship a few PRs building on my Voice Rooms feature from Q1:

- Added video and screen sharing to calls: <https://gitea.coracle.social/coracle/flotilla/pulls/135>
- Added the ability to change audio devices during a call: <https://gitea.coracle.social/coracle/flotilla/pulls/112>
- Fixed an error toast when joining a call: <https://gitea.coracle.social/coracle/flotilla/pulls/113>

## What are your plans for next quarter?

> Outline your goals and plans for the next quarter. Be specific about what you aim to accomplish.

My main focus now is doing a full app store release of Horcrux. The main task remaining is a security audit of the codebase. This will involve a human, me and no AI, tracing the handling of all sensitive assets by hand to be sure that Horcrux lives up to the security guarantees it promises.

Aside from that I have a few bugfixes planned, as well as marketing materials like a proper website, support channel, and app store pages.

On Flotilla my planned contributions are largely tied to my own communities' pain points with the platform:

- Summary emails for recent group activity and upcoming events
- Governance tools like ranked choice votes
- Continued refinements to voice rooms