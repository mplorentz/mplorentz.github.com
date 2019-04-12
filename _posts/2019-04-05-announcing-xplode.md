---
layout: post
title: Xplode - A script to reset your Xcodes
date: 2019-04-12
tags: xcode swift release
---

Every iOS developer has been there. A cryptic compilation error, a segmentation fault in the compiler, failure to connect to the simulator. How do you fix it? First you try compiling again. Then you clean the build folder. Rebuild again. Delete derived data? Maybe that will help. Nope. You search StackOverflow and something in the back of your mind asks if the walled garden is a sanctuary or a prison. There it is - you just needed to erase your simulator and force quit Xcode. Now  you can get back to writing code.

Is Xcode actually significantly buggier than other IDEs? I don’t know. But I know I’ve spent way too much time on Xcode issues that were solved by some variation of _turning it off and on again_. 

## Xplode

Xplode is a bash script that turns the things off and back on again. It  takes about 10 seconds to run on my machine, and has saved me hours of debugging time over the past few months. To be specific, Xplode 1.0 will:

* Clean the Build Folder
* Quit Xcode
* Delete Derived Data
* Reset all simulators
* Reopen Xcode

To install:
1. `brew tap mplorentz/tap https://gitlab.com/mplorentz/tap`
2. `brew install xplode`

To use:
1. Run `xplode` in your project’s directory.

## Why?

I have always been frustrated with Xcode’s cryptic and sometimes random errors. But on my latest project I found myself spending several hours a week debugging problems that turned out to be Xcode’s fault. More than once I have lost a full working day only to find out that Derived Data was to blame. My co-workers were having a similar experience.

My current client has several Swift frameworks that install one another via CocoaPods. Some of them have Objective-C dependencies and they aren’t always using the same versions of Swift and Xcode. I think this has been the perfect storm to bring out all the weird corner cases in the Xcode toolchain. After making one too many jokes about throwing my computer out the window I decided to take matters into my own hands.

The name "Xplode" (which I think came from my friend [Josh](http://jtbrown.org), thanks Josh) is leftover from the original design which was supposed to physically blow up your computer and order a new one from Apple, checking out your git repo and rebuilding your project when the new machine arrived. This version probably would have still saved some developers time and money, but was deemed impractical for other reasons. The second prototype used AppleScript to fill your screen with animated GIFs of explosions and people destroying computers while it ran through the steps to restart Xcode in the background. The AppleScript necessary to tile an arbitrary set of GIFs onscreen dwarfed the code that actually turned things off an back on again. Ultimately macOS Mojave’s permission dialogs killed that version too. Thus the current Bash version was born. It isn’t as much fun but gets the job done.

You can find the source code, open issues, and contribute at [xplode.computer](http://xplode.computer).
