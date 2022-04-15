---
layout: post
title: Open Web Calendar test
---

This is a test of embedding the [Open Web Calendar](https://github.com/niccokunzmann/open-web-calendar) in a static site. It seems to be able to handle an arbitrary number of ICal/ICS calendars. Anyone who wanted to add a calendar could open PR to this page adding a URL to their ics file in the iframe. Users are free to update their calendars at will. I created a quick Google Calendar for this test and put an event on April 15th, 2022.

Pros:
- Simple
- Free & open source
- Actual ICS calendar hosting is the responsibility of the people scheduling the events

Cons:
- Slow to load
- No button to copy an event to your own calendar
- Actual ICS calendar hosting is the responsibility of the people scheduling the events
- Reliant on openwebcalendar.herokuapp.com which could go away in the future (although the code is open source so another host could be found).

<iframe id="open-web-calendar"
    style="background:url('https://raw.githubusercontent.com/niccokunzmann/open-web-calendar/master/static/img/loaders/circular-loader.gif') center center no-repeat;"
    src="https://openwebcalendar.herokuapp.com/calendar.html?url=https%3A%2F%2Fcalendar.google.com%2Fcalendar%2Fical%2Fc_3bgcgq3l97aos2n1vhs4rtfl2s%2540group.calendar.google.com%2Fpublic%2Fbasic.ics"
    sandbox="allow-scripts allow-same-origin allow-top-navigation"
    allowTransparency="true" scrolling="no"
    frameborder="0" height="600px" width="100%"></iframe>
