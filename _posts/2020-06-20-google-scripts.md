---
layout: post
title: Getting started with Google Apps Script
date: 20 Jun 2020
feature-img: "assets/img/blog/GoogleAppsScript/feature.jpg"
thumbnail: "assets/img/blog/GoogleAppsScript/feature.jpg"
image: "assets/img/blog/GoogleAppsScript/feature.jpg" 
tags: [google, programming, javascript]
---

So I've just started working with [Google Apps Script](https://www.google.com/script/start/).

> Google Apps Script is a [Javascript](https://www.w3schools.com/js/) based programming language that seemlessly links to google docs.

I'm creating a tool to update a [googlesheet](https://www.google.co.uk/sheets/about/) based on information entered into other googlesheets - ideally it'll save some time as before the updates were done manually every day.

I'm relatively new to Javascript and I am brand new to Google Apps Script. Thankfully there's plenty of help online. For general Javascript help check out the following:
- [w3schools](https://www.w3schools.com/js/) provides a huge amount of training materials
- [StackOverflow](https://stackoverflow.com/questions/tagged/javascript) never fails to disappoint to answer every weird and wonderful question

And Google has written some comprehensive documentation [here](https://developers.google.com/apps-script/reference/spreadsheet). You find that Google has created objects and methods for all the Google linked tools (docs, googlesheets, calendar, mail, etc.).

I've created a _DEMO_ workbook [here](https://docs.google.com/spreadsheets/d/1q7hWKZesEybEiQSCEUKbUtMFz8f4WAdPAnfSrrQodEE/edit?usp=sharing). Here is a quick gif of it in action:

![DEMO]({{ "assets/img/blog/GoogleAppsScript/GoogleAppsScriptsDemo_04-07-20.gif" | relative_url}})

Here are a few useful pieces of code I picked up during my work:

```javascript
// Open a workbook by URL
var workbook = SpreadsheetApp.getActive();

// Open the attached workbook
var workbook = SpreadsheetApp.openByUrl();

// Get a sheet by name
var sheet = workbook.getSheetByName("Sheet1");

// Get values from sheet
var values = sheet.getRange(row, column, numRows, numColumns);

// Change font colour of values in sheet
sheet.getRange(row, column, numRows, numColumns).setFontColor(colour);
```

The main quirk to working with Google Apps Scripts is that there isn't a terminal. Instead you can use the `Logger.log("string")` function to print to logs, which you can view by selecting "View" and then "logs" - this is surprisingly slow!! 😕 The other solution, which I use in my demo above, is to print to a google document. Here, I print messages to a sheet within a googlesheets workbook:

```javascript
function printToLog(logSheet, string, colour="black") {
  
  // Get the number of rows in the log sheet
  var nRows = logSheet.getLastRow();
  
  // Get the current time
  var timeStamp = new Date();
  
  // Pring to log
  logSheet.getRange(nRows+1, 1).setValue(timeStamp);
  logSheet.getRange(nRows+1, 2).setValue(string).setFontColor(colour);
}
```

I'd recommend taking a look at my [demo](https://docs.google.com/spreadsheets/d/1q7hWKZesEybEiQSCEUKbUtMFz8f4WAdPAnfSrrQodEE/edit?usp=sharing) workbook, it is amazing how easy it is to create menus and attach functions! Also, because Google Apps Scripts is based on Javascript there are no limits to what you can do!! 

> Note that the demo is read only, so you'll need to make a cpoy before you can play around with it.

Lastly, get into the Google [documentation](https://developers.google.com/apps-script/reference/spreadsheet), it is easy to search and well presented with great examples of how each function works. Enjoy! 😀