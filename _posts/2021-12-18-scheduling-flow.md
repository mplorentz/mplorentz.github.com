---
layout: post
title: Scheduling Flow
date: 2021-12-18
tags: productivity
---

Flow state is an incredibly productive and rewarding place to find yourself. I think all programmers know the conditions required to find flow: a challenging problem, no distractions, and plenty of mental energy. I have always tried to create these conditions in my work day, but it wasn’t until recently that I listened to an [episode of the Huberman Lab Podcast](https://open.spotify.com/episode/72ejCLl57bquFBfEAjZEXU?si=v5rnTdLfS4-r1tdjZLtDxw) and considered *scheduling* flow into my day. Andrew Huberman talks about his daily routine and it inspired me to try to be more intentional about getting into a flow state every day.

## My Routine

My current routine includes a scheduled 90 minute “work bout” in the morning, and sometimes another in the afternoon. The morning bout is scheduled to coincide with the part of my circadian rhythm when it is easiest for my brain to focus.

I track the 90 minutes as three [pomodoro](https://en.wikipedia.org/wiki/Pomodoro_Technique) sessions during which I mute almost all notifications. 

Despite having a lot of tools and software to control notifications, getting everything into the state I wanted took more effort than I thought. I want to share my setup in case its useful to others. 

## Goals

In order to get into this habit I wanted to be able to put my computer into “distraction-free” mode as easily as possible. My requirements were:

- Launch distraction free mode via a single command or keyboard shortcut.
- Only be interrupted for emergencies.
- Communicate the fact that I’m doing focused work to coworkers and family.

## Implementation

- I start off my 90 minute work session using [Alfred](https://www.alfredapp.com/). I type “pomo” into the launch bar which runs a [custom workflow]({{ "/assets/Pomodoro.alfredworkflow" | absolute_url }}) I made.
- The custom workflow runs some AppleScript that starts my Pomodoro timer. I use the [Flow](https://flowapp.info/) timer app because it’s free and has AppleScript support.
- The AppleScript also sets my Slack status to “🎧 focused” and puts Slack into Do Not Disturb mode. This lets my coworkers know that I’m doing focused work and may not see their message right away. Slack gives them the option to punch through Do Not Disturb if their message is truly urgent. Slack doesn’t support AppleScript, but fortunately there is a good tool for it on [Microsoft Github](https://github.com/samknight/slack_applescript).
- Finally, the Alfred workflow sets my macOS/iOS Focus Mode. Focus Modes are a new feature in iOS 15/macOS 12 and it was this feature that actually gave me the motivation to set up this whole system. I have a custom Focus called “Coding” that allows notifications from Xcode, Fantastical, and my wife. All other notifications are muted. Unfortunately even macOS doesn’t support AppleScript anymore, at least when it comes to Focus mode 😢. So to turn my Coding Focus on automatically the Alfred workflow runs a bash script that runs a simple Shortcut I created in Apple’s Shortcuts app. The shortcut uses the “Set Focus” action.
- At this point I engage in 25 minutes of focused work - generally writing code. I try to minimize context-switching during this time to keep my focus. I find that staring at the compiler progress bar is better than switching to Slack, social media, etc.
- After 25 minutes are up, I take a 5 minute break to stand up, stretch, and check Slack.
- After 3 pomodoro sessions I run [another Alfred workflow]({{ "/assets/Unfocus.alfredworkflow" | absolute_url }}) I created that clears my Slack status and Focus. 

I wish it was more straightforward to set this up, but I have been getting a lot of work done this way. I hope if you are a knowledge worker who doesn’t already schedule “flow” into your work day maybe this has started the gears turning for you.
