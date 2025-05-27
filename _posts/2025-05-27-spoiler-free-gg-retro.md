---
layout: post
title: SpoilerFree.gg Launch Retro
date: 2025-05-27
tags: solopreneur startup
---

For the first time in my career I'm taking a shot at solopreneurship: building and launching my own software in an attempt to support myself financially. My goal is to launch six product experiments in six months.

I recently ran my first experiment: a website for following professional Counter-Strike 2 tournaments without the spoilers found on other sites, [SpoilerFree.gg](https://www.spoilerfree.gg/). I learned a lot and had a great time building it! I'm sharing my rough notes in case it's helpful or interesting, but mostly to generate discussion with friends or anyone who is interested! So please if you have advice, comments, or questions find me on social media.

## Summary

I ran this experiment over 3 weeks, with the weeks roughly divided into: exploration and user research, building, and launch. Overall I had about 1000 people visit the site, the vast majority of which were from Reddit ads that I bought. I only had 1 person click the painted door experiment I put up for a pro subscription service. I also have 1 user (a different person) who signed up for an account and has been using the site for several days, but doesn't seem interested in the pro version. 

So overall something like a 0.01%-0.04% conversion rate, my success criteria was 5%, which was maybe too high, but in any case I didn't get a strong signal that this was solving a pain people want to pay to solve.

The biggest takeaways for me: 
- I should look for problems that people are already spending significant money or time to work around.
- I should budget more money for user interviews at the outset, and also after launch.

Below are some of my rough notes on how the 3 weeks played out:

# Week 1 - Research

Market research, Figma prototypes, and user interviews

- 2 expert interviews with folks who had built similar sites
    - 1 expert who had a similar site with a lot of users, but the site was free (they made the most money off associated Youtube videos). I should not have ignored the fact that users didn't pay. Although I could make decent ad money if I could grow my site to their size.
    - the other expert also hadn't made a lot of money or gotten as much traffic, but did share their source code(!) with me.
- Prototyping
    - I took the advice from [Michael Margolis on this podcast](https://pca.st/episode/b1dccb11-1356-4949-9eb9-39e1a533e9cd) and sketched out 3 mockups using [UXPilot](https://uxpilot.ai/?ref=matthew) and Figma and used these to generate discussion in my user interviews.
- 2 user interviews 
    - 1 was not a bullseye customer. This was a failure in my screener survey. I need to get even more specific without being leading!
    - 1 was a bullseye customer and organically mentioned spoilers as a problem, but didn't have strong alternate solution. The fact that they didn't spend significant time or money working around the problem is a signal I missed.
- Legal research
    - The main problem I had was matches being spoiled by the length of the match on youtube. There were a lot of other, smaller problems related to spoilers but this was the problem I wanted to solve for myself and it felt like the solution didn't exist. But research made me realize my solution (a custom player with the scrubber hidden) might violate the Youtube ToS. This led me towards minimizing this solution in the build, which weakened my value proposition.

# Week 2 - Build

- This part went super well. Was able to build really quickly with next.js and AI.
- Started with 3 1-shot prototypes (claude code (winner), v0, something else), picked my favorite and jumped into Cursor.
- Using [vibe-tools](https://github.com/eastlondoner/cursor-tools) to make plans for large features with gemini worked really well. Then I'd have Claude implement the plan one step at a time and check its work after each step.
- Updating cursor rules as I went
- I'm hosting the site on the free plans of Vercel, Railway, and Supabase. All three are new to me but seem fine.

# Week 3 - Launch

- I've never run an ad campaign but it was pretty easy to get started on Reddit.
- Got just over 1000 eyeballs on the site for ~$100
- Had some trouble figuring out why people weren't sticking around based on analytics alone. Wanted to do more user interviews, but the cost seems high for something that I think I stopped believing in.

# Conclusion

Overall I'm pretty happy with how things went. I enjoyed it a lot and learned a lot. I really believed this could be successful, and maybe it could be if I put more effort into it, but for now I'm moving on to the next thing.