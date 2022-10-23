---
layout: post
title: Cleaning up emails in gmail with Google Apps Script
date: 03 Jan 2021
feature-img: "assets/img/blog/cleaningEmails/thumbnail.svg"
thumbnail: "assets/img/blog/cleaningEmails/thumbnail.svg"
image: "assets/img/blog/cleaningEmails/thumbnail.svg" 
tags: [google, emails, javascript]
---

So Joanna was stuck with more than 17,000 unread emails in her gmail account and I'm struggling to handle it! 😕 So I figured I could use [Google Apps Script](https://www.google.com/script/start/) code to help.

Google Apps Script is a programming language based on [javascript] that's designed to work with the all the different Google apps (gmail, docs, sheets, etc.). I've [previously](https://josephcrispell.github.io/2020/06/20/google-scripts.html) used Google Apps Script to work with Google sheets.

Today, I've been writing some code to remove all the unread ebay alerts from Joanna's account. Here's the function I wrote to do it:
```javascript
function removeOldEbayEmails(){

  // Define the search string to identify emails 
  var searchString = "label:inbox is:unread from:ebay@ebay.co.uk older_than:1m subject:NEW!";

  // Get all threads matching search string
  var threads = getThreadsMatchingSearch(searchString);

  // Check whether thread search returned some results
  if (typeof threads !== 'undefined' && threads.length > 0) {
    
    // Mark as read and remove threads
    moveThreadsToTrash(threads);
  }  
}
```

I built the `searchString` based gmail's searching key words (loads of info [here](https://support.google.com/mail/answer/7190?hl=en-GB)). The search string does the following:
- `label:inbox` - look in your inbox
- `is:unread` - select unread emails
- `from:ebay@ebay.co.uk` - select emails from `ebay@ebay.co.uk`
- `older_than:1m` - select emails older than 1 month
- `subject:NEW!` - select emails with "NEW!" in the subject line

I wrote the `getThreadsMatchingSearch()` function to use a search term to retrieve email threads (email receive/reply chains):

```javascript
function getThreadsMatchingSearch(searchString){

  // Get all threads matching search string
  try{
    var threads = GmailApp.search(searchString);
  Logger.log("Found " + threads.length + " threads (conversations of emails) matching search string (" + searchString + "). Note that size limited to 500.");
  }
  catch(error){
    Logger.log("Warning! Unable to complete email search: " + error.message);
  } 

  return(threads);
}
```

The `getThreadsMatchingSearch()` function uses the [`GmailApp.search()`](https://developers.google.com/apps-script/reference/gmail/gmail-app#search(String)) function and wraps it in a try catch because Google sets a limit on the number of searches (see more info on the quotas [here](https://developers.google.com/apps-script/guides/services/quotas)). 

>Importantly, the maximum number of threads returned is fixed at `500`. If you've got more than this to handle, you can use a trigger to set multiple runs of your function.

Once I have retrieved the threads, I use this function to move them to the trash:
```javascript
function moveThreadsToTrash(threads, batchSize=100){

  // Work through the threads in batches (100 is the limit that batch operations can work on)
  for (j = 0; j < threads.length; j += batchSize) {

    // Select the current batch of threads
    var batch = threads.slice(j, j+batchSize);
    
    // Move the threads to the trash
    try{
      GmailApp.moveThreadsToTrash(batch);
      Logger.log("Moved " + batch.length + " threads to trash.");
    }
    catch(error){
      Logger.log("Warning! Unable to move threads to trash: " + error.message);
    }    
  }
}
```

As with the `GmailApp.search()` function the [`GmailApp.moveThreadsToTrash()`](https://developers.google.com/apps-script/reference/gmail/gmail-app#moveThreadsToTrash(GmailThread)) function has a quota limit so I've wrapped it in a try catch. It also has a batch size limit of `100` so I've worked through the `threads` array in batches of 100 (thanks to [this](https://gist.github.com/gene1wood/0f455239490e5342fa49) GitHub code).

If you think the above code would be useful, then you'll need to do the following:
- Open up the Google Apps Script [editor](https://script.google.com/home/start) (click on the New blank project)
- Paste in the three functions above into the `Code.gs` script
- Change the `searchString` to suit your needs
- Test run the script to check all is well
- If needed, set a trigger to schedule (click the alarm symbol in the left menu) to running the `removeOldEbayEmails()` function multiple times (*note that there are quotas on the number of services you can use in a day, which I quickly ran into*)

So far I've removed ~8,000 of Joanna's emails and set my script to run overnight so hopefully I'll a few more thousand overnight! 🎉 🗑️