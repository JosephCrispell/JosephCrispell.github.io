---
layout: post
title: Getting started with Google Apps Script
date: 20 Jun 2020
tags: [google, programming, javascript]
---

So I've just started working with [Google Apps Script](https://www.google.com/script/start/).

> Google Apps Script is a [Javascript](https://www.w3schools.com/js/) based programming language that seemlessly links to google docs.

I'm creating a tool to update a [googlesheet](https://www.google.co.uk/sheets/about/) based on information entered into other googlesheets - ideally it'll save some time as before the updates were done manually every day.

I'm relatively new to Javascript and I am brand new to Google Apps Script. Thankfully there's plenty of help online. For general Javascript help check out the following:
- [w3schools](https://www.w3schools.com/js/) provides a huge amount of training materials
- [StackOverflow](https://stackoverflow.com/questions/tagged/javascript) never fails to disappoint to answer every weird and wonderful question

And Google has written some comprehensive documentation [here](https://developers.google.com/apps-script/reference/spreadsheet/spreadsheet-app). You find that Google has created objects and methods for all the Google linked tools (docs, googlesheets, calendar, mail, etc.).

*So a few notes from me.*

Firstly, get started you can visit [here](https://www.google.com/script/start/) or create a new script by right clicking in your google drive, selecting *More* and then *Google Apps Script*.

Then you'll be working on Googles IDE (**I**nteractive **D**evelopment **E**nvironment). It's pretty basic, but it does the job and the code runs nice and quick for me.

![IDE]({{ "assets/img/blog/GoogleAppsScript/GoogleAppsScript.png" | relative_url}})

First thing to note is that you need to used a log file for print statements as a console doesn't exist:
```javascript
    Logger.log("I am a bit slow!");
```

To view the log file, click *View* and then *Logs*. These are quite [slow](https://stackoverflow.com/questions/60404784/very-slow-logs-with-google-apps-script-v8-vs-rhino) to appear! 😔

![Slow!]({{ "assets/img/blog/GoogleAppsScript/GoogleAppsScript_slow.png" | relative_url}})

So I've used it for a day and it has worked great. If you find yourself working on google documents then definitely consider automating your work with [Google Apps Scripts](https://www.google.com/script/start/)!

