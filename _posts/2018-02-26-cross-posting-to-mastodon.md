---
layout: post
date: 2018-02-26-18 20:34:00 EST
title: Cross-posting RSS to Mastodon
tags: mastodon rss meta
---
Here are the steps I had to take to set up cross-posting from this blog to Mastodon. The format is a little rough, but hopefully it will help someone. 

I did this on my Debian server, but it should work with any RSS feed on any server that can run python.
1. Install [feed2toot](https://gitlab.com/chaica/feed2toot)
   * Install via pip:
      * Make sure you have python3 and python3-pip installed
         * `apt-get install python3 python3-pip`
      * Install the feed2toot script 
         * `pip3 install feed2toot`
   * Install via git. This is what I ended up doing because I made some modifications to the script (more on that below)
      * `git clone git@gitlab.com:mplorentz/feed2toot.git`
2. Connect feed2toot to Mastodon by running the following command: 
   * `register_feed2toot_app`
3. Create your configuration file. This allows you to customize the behavior of feed2toot. You can find the default configuration and a full list of options [here](https://feed2toot.readthedocs.io/en/latest/configure.html). In the file you will want to:
   * Change `toot_visibility` to `public` (Once you have tested it)
   * Paste your RSS feed URL into the `uri` field.
4. Test it. These commands will perform a dry run - they will not actually post any toots to Mastodon.
   * If you installed via pip: `feed2toot -c feed2toot.ini -nv`
   * If you installed via git: `python3 feed2toot.py -c feed2toot.ini -nv`
5. If things look good, you may want to go ahead and tell feed2toot to populate the cache. This prevents it from posting everything in your RSS feed the first time you run it for real. You can do this by running `feed2toot -c feed2toot.ini -p`.
6. Run feed2toot on a schedule.
   * I added the following line to my crontab to run the script every minute: `* * * * * /usr/bin/python3 /path/to/feed2toot.py -c feed2toot.ini`
   * Don't forget to change `toot_visibility` to `public` in your configuration file if you didn't already. Otherwise no one will see your toots!
7. (Optional) Configure feed2toot to only toot micro posts.
   * I have an [open merge request](https://gitlab.com/chaica/feed2toot/merge_requests/11) to support filtering items in the RSS feed based on a tag. For now you will need to install [my fork](https://gitlab.com/mplorentz/feed2toot) of feed2toot using the git instructions above if you wish to use this feature.
      * Change the `toot` line in your configuration file to this:
         * `toot={summary}`. This instructs feed2toot to post the content of your micro post instead of the title and a link.
      * Add the following two lines in the `[rss]` section:
         * `tags_pattern={tag_name}` where "{tag_name}" is the tag that you use for your micro posts. On my Jekyll blog I tag all my micro posts with the "micro" tag, so my configuration file says `tags_pattern=micro`.
         * `tags_pattern_case_sensitive=false`
8. (Optional) Configure feed2toot to strip HTML out of your content
   * My Jekyll blog includes HTML tags in the RSS feed fields. Feed2toot does not strip these tags out by default, so I opened a [merge request](https://gitlab.com/chaica/feed2toot/merge_requests/12) to change that. If you install [my fork](https://gitlab.com/mplorentz/feed2toot) of feed2toot using the git instructions above then you get this feature free of charge :)

And that's it! I can now make a micro-post on my own blog, and it will show up in my RSS feed, on [micro.blog](https://micro.blog/mplorentz), and [Mastodon](https://freeradical.zone/@matt). I'd like to set up another instance of feed2toot that will post links to regular blog posts, but that's a task for another day.
