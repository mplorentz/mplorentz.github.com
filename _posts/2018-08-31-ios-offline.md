---
layout: post
title: iOS Offline
date: 2018-08-31T12:00:00-04:00 
tags: offline ios
---

I take the internet for granted. I am used to having a fast, stable connection at all times. But recently I've been in several situations where I have slow or unstable access to the internet. When it happens it's usually a very frustrating experience. I'm driving and I can't get directions to my destination. I'm at home and the movie we want to watch won't load. Or I'm traveling and I only have a few minutes of WiFi every few days.

As an iOS app developer I don't usually consider offline use. Most clients don't see the value in it and don't want to support it. And for some applications it doesn't make any sense. But there are a whole host of people for whom offline use is a major feature. These include:

* Cell phone users with limited data
* Backpackers
* Subway commuters
* Residents of developing countries
* Residents of off-grid dwellings
* Preppers
* T-mobile customers
* Users in rural areas
* Users in disaster areas

Offline-as-a-feature has another huge advantage. Privacy by default. In a normal app much work must be done to secure user data. Any communication with the server must be encrypted. Logs have to be anonymized. GDPR regulations require special database organization and backup strategies. If any of this work is done poorly or not at all the user's privacy is compromised. 

In the typical offline-first app the opposite is true. Much work must be done to compromise the user's privacy. Extra code has to be written to send the user’s data to a server. The monetization strategy is less likely to sell out the user. Ads and analytics become impractical. The user is the customer and their data belongs to them.

I've been making it my personal challenge lately to see how many of my online tasks can be completed offline. I've gotten to prove out many of them this week on a cruise without any internet access. Here is a list of (iOS) apps that I’ve found very useful on my trip:

* Navigation: [Galileo](https://itunes.apple.com/us/app/galileo-offline-maps-and-nav/id321745474?mt=8)
* News: [NewsBlur RSS reader](https://itunes.apple.com/us/app/newsblur/id463981119?mt=8)
* Reference material: [Kiwix](https://itunes.apple.com/us/app/kiwix/id997079563?mt=8). Allows you to download Wikipedia, Wikivoyage, StackExchange, and more. Creates a great offline search engine.
* Music: [Spotify](https://itunes.apple.com/us/app/spotify-music/id324684580?mt=8)
* Movies: [VLC](https://itunes.apple.com/us/app/vlc-for-mobile/id650377962?mt=8)
* Books: [Kindle](https://itunes.apple.com/us/app/amazon-kindle/id302584613?mt=8) and [iBooks](https://itunes.apple.com/us/app/ibooks/id364709193?mt=8)
* Blogging: [Working Copy](https://itunes.apple.com/us/app/working-copy/id896694807?mt=8) + [iA Writer](https://itunes.apple.com/us/app/ia-writer/id775737172?mt=8)
* File transfers: AirDrop + [GoodReader](https://itunes.apple.com/us/app/goodreader/id777310222?mt=8). Still no good [Syncthing](https://syncthing.net) app for iOS :(

Most of these apps have now replaced their online-only counterparts for my daily use. Some of them are lacking in features or polish, but for the most part the enhanced privacy, minimal data usage, and higher reliability make them superior alternatives. 

Next time you‘re heading to an internet-free area check out some offline alternatives for yourself. You might find that you don’t need the Internet as much as you think.
