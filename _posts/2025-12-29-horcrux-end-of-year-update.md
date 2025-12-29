---
layout: post
title: Horcrux End of Year Update
date: 2025-12-29
---

I'm almost 4 months in to building [Horcrux](https://github.com/mplorentz/horcrux), an open source app for backing up sensitive data to friends and family. The work is generously funded by [OpenSats.org](https://opensats.org) and since I've been working on my quarterly report for them I thought I would share a public progress update too. So even though this was written with a grant committee in mind, here is what I've been up to for the last 3 months:

# Overview 

I am just completing my first quarter of work on Horcrux, the best way to back up sensitive data to friends and family. This project was called Keydex for most of the first quarter, but I renamed it Horcrux about a month ago. To refresh your memory, this is a cross-platform mobile app that uses Shamir's Secret Sharing algorithm to split sensitive data into shares, then uses Nostr to backup those shares to trusted "stewards". This creates a secure backup where no computer or person has a full copy of the data, and restoring is only possible by consent of the stewards.

I'm pretty happy overall with the state of the app after 3 months. The app has basic versions of all the main features I wanted to implement, and I have been testing it in a private beta with several early adopters which gives me confidence that it will meet their needs. The app is far from done or perfect, and I have cut many features that I wanted, but having a complex cryptography app that's almost consumer-ready after 3 months is something I am very satisfied with.

# Key Learnings / Product Story

In my experience the most important part of building software is to always be learning from your users. I want to summarize what I have learned and how my plans have changed over the first 3 months of this product. For the TLDR; of what has been built feel free to skip to the next section. 

Before I even submitted my grant application I started conducting user interviews and I have kept up the practice of interviewing at least one user every two weeks throughout the project. My initial timeline had me releasing a public beta at the two months mark, but I have opted instead for these private testing sessions because 1) I learn more from them than an open beta 2) I want the freedom to keep changing the data schema 3) this is an app for very sensitive data, and I don't want people putting real data in until I have had a chance to do extensive testing and a security audit.

Early on I identified a few different use cases for this type of tool:
- inheritance planning - backing up essential passwords, backup codes, cryptographic keys, and other instructions for giving others access to your digital life/assets after death.
- border crossings - some users are interested in crossing international borders with sensitive data they do not have the keys to unlock. Think journalists, activists, etc.
- cryptographic key backup - although many good solutions exist for backing up cryptographic keys, social backup of Nostr keys, web3 wallets, or other key pairs is a desirable security/convenience tradeoff for some users and threat models.
- credential management for organizations - some businesses have ultra-sensitive permissions gated by traditional passwords (think root AWS account for a fintech company). Shamir's Secret Sharing with a special sandbox could help them grant temporary access to these systems only by consent of several parties.

I decided to focus on the inheritance planning use case because:
1. The users I interviewed were most interested in that.
2. It seemed the easiest to dovetail with an ethical business model.
3. It is a tool that I would like to use personally.

This focus helped me clarify design decisions and prioritize feature building. Some key insights for this user group from my interviews:
- Although the users setting up digital inheritance plans are generally very technical, the stewards holding their data are usually not. Even password managers are too complex for many of these users. This means the user experience for them must be extremely smooth and clear. 
- Although there is a very high initial effort to set up inheritance planning, most competing solutions neglect the maintenance (social and otherwise) to keep such a system healthy. 
- Although there are many physical metaphors that can help users understand how Shamir's Secret Sharing behaves, all of them have drawbacks. Initially I went with the terms "lockbox", "keys", and, "key holders" to describe the metaphor of putting things in a box that requires multiple keys to open. After some testing I switched to "vault", "keys", and "stewards". But I considered and tested several other metaphors like puzzles, shards, shares, mosaic tiles, mailboxes, and crystals.

So far on the project the biggest challenge has been making the UI intuitive enough for non-technical stewards to use. I had the basic backup and restore functionality working after just 3 weeks of programming. But making that functionality easy, accessible, and difficult to misuse has taken another 11 weeks and it probably needs another 11 to really be great (more on the future timeline later). This follows the old software adage that building the first 80% of the app takes 20% of the time and building the last 20% takes 80% of the time.

About 2 months into my 4 month timeline for this project I began to panic realizing that I was only going to be able to get about half of my planned features implemented. I was worried that this would turn into some half-finished software that no one except me would use. At this point I had done many user interviews but I hadn't really tested the app with any potential users because there weren't really enough features there to do a real test. I was able to push through and get all the basic features covered: creating a vault, inviting stewards via links, distributing keys to stewards, initiating vault recovery, responding to recovery requests, and fully recovering the data. Once I got to this point I scheduled more interviews to show folks the app. 

These interviews were tremendously clarifying. They confirmed that I had the basics right, but also confirmed what I was feeling already: I was going to have to cut features. I decided to lean more into the cryptographic key backup use case because it was a slightly simpler use case. It doesn't require backing up large files, which meant I could punt on implementing encrypted blob storage with Blossom. Because users don't need to do as much text editing in this use case I could get away without shipping to all desktop platforms and keep the app mobile-only for now. And I also decided to cut the P2P features I was trying to build - namely that no data would be stored on relays long-term to improve forward security. This greatly simplified account management, device migration, and the number of round trips needed to distribute keys and recover. The app will still work for the inheritance planning use case (and border crossings) but the UI won't be as optimized for those use cases.

I hope this was a good summary of _why_ I have built Horcrux the way I have. Below you'll find more detailed lists of my progress and some notes on future plans.

# Feature List

Here is roughly what the app can do today. There is no open beta yet, but I would be happy to give a live demo to anyone who would like one.

- Login with your existing Nostr key, create a new account, or use without an account. 
- Create an encrypted vault with arbitrary text (up to 4 kilobytes).
- Make a recovery plan for your vault, specify how many keys your vault will need to be opened, what relay servers you will use, etc.
- Invite stewards via an invitation link that prompts them to download Horcrux if they don't have it installed, and displays the invitation in app if they do have it installed.
- Initiate recovery of a vault.
- Respond to recovery requests to assist vault owners or stewards with recovery.
- Practice the recovery flow without exchanging real data.
- Wipe the vault contents from your own device and hold a key to your own vault for maximum security. 

# Future Plans

Here is roughly what I would like to accomplish before shipping Horcrux 1.0:
- rework recovery UX
- finalize data format and submit NIP spec [draft](https://github.com/mplorentz/horcrux/blob/main/NIP-draft.md)
- add the ability for vault owners to share out-of-band contact info for each steward
- (internal) security audit. I would love to pay for an independent audit, but I will need to secure more funding for this in the future.
- automated deployments
- public website, support email, privacy policy
- app store publishing

My OpenSats grant proposal included two projects, first Horcrux and then a Nostr group communication app. My rough timeline was to work on Horcrux for 4 months and the Nostr group app for 8 months. I plan to extend my work on Horcrux to at least 5 months to finish the above features and get a full release done. I will be interleaving work for the Nostr groups app at the same time, in fact I have already been putting some hours into it.

# Project Timeline

Below is a summary of my work with links to relevant commits and PRs, grouped into phases.

- Startup (2 weeks, Sept 7-20)
    - User interviews
    - name, design, branding research
- Initial backup & restore functionality (3 weeks, Sept 21-Oct 11)
    - Create a vault
    - Add stewards
    - Backup vault
    - Restore vault
    - Major PRs:
        - [Add Nostr key generation and secure storage](https://github.com/mplorentz/horcrux/commit/c6c5be576515ea8f853655b76271ea1ce21039bc)
        - [Add encryption and persistence of lockboxes](https://github.com/mplorentz/horcrux/commit/541c3e19ff032c912311f45de7c821fbec973b58)
        - [Add tests and helpers for KeyService and LockboxService](https://github.com/mplorentz/horcrux/commit/a0faad766e7d9769db8d293cf889c47ffe18828f)
        - [Add backup of shares to relays](https://github.com/mplorentz/horcrux/pull/6)
        - [Basic lockbox recovery](https://github.com/mplorentz/horcrux/pull/7)
- Invitation links, UI/UX pass, refactoring (7 weeks, Oct 12-Nov 29)
	- Added invitation links that can be shared with stewards to add them to a vault
    - UI pass on all screens to improve intuitiveness and functionality
    - Full refactor service layer, adopted Riverpod state management
    - Automatic relay management
    - Basic onboarding screens 
    - Set up development relay
    - Initial deployment to Testflight
    - Major PRs:
        - [004-invitation-links](https://github.com/mplorentz/horcrux/pull/14)
        - [Scan-relays-automatically](https://github.com/mplorentz/horcrux/pull/15)
        - [Add names to vault owners and stewards](https://github.com/mplorentz/horcrux/pull/19)
        - [Add Instructions field for stewards](https://github.com/mplorentz/horcrux/pull/20)
        - [Initial testflight deployment](https://github.com/mplorentz/horcrux/pull/23)
        - [Design Refresh](https://github.com/mplorentz/horcrux/pull/22)
        - [Add basic onboarding screen](https://github.com/mplorentz/horcrux/pull/27)
        - [Add vault explainer screen before lockbox creation](https://github.com/mplorentz/horcrux/pull/28)
        - [UI Cleanup](https://github.com/mplorentz/horcrux/pull/34)
        - [Add Screenshot / Golden Tests](https://github.com/mplorentz/horcrux/pull/9)
- Better onboarding, Practice Recovery, Self-stewardship (4 weeks, Nov 30-Dec 20)
    - Added separate onboarding flows for vault owners and stewards.
    - Added tutorial for backing up Nostr key during onboarding.
    - Added ability for vault owners to "practice" recovery (to test system without decrypting real vault data)
    - Added ability for vault owners to hold a key to their own vault
    - Reworked app colors and fonts
    - Rebranded app from Keydex to Horcrux
    - Major PRs:
        - [New theme](https://github.com/mplorentz/horcrux/pull/35)
        - [Onboarding Flow Redesign: User-Choice Account Management](https://github.com/mplorentz/horcrux/pull/36)
        - [Add account management screen with logout functionality](https://github.com/mplorentz/horcrux/pull/47)
        - [Practice Recovery](https://github.com/mplorentz/horcrux/pull/53)
        - [Fastlane: iOS and Android beta deployment automation](https://github.com/mplorentz/horcrux/pull/57)
        - [feat: Implement owner self-shard feature (006-owner-shard)](https://github.com/mplorentz/horcrux/pull/52)