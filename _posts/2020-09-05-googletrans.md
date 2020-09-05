---
layout: post
title: Using python's googletrans library in R
date: 05 Sep 2020
feature-img: "assets/img/blog/googletrans/GoogleTranslation.gif"
thumbnail: "assets/img/blog/googletrans/GoogleTranslation.gif"
image: "assets/img/blog/googletrans/GoogleTranslation.gif" 
tags: [google, python, R]
---

I've recently been exploring a survey dataset that is in French. I found a python library [`googletrans`](https://pypi.org/project/googletrans/) that uses the [Google Translate Ajax API](https://translate.google.com/) to translate text.

For me, the appeal of `googletrans` is that it works out of the box without an API key, unlike it's R counterpart [TranslateR](https://cran.r-project.org/web/packages/translateR/translateR.pdf). Ideally though, I'd still like to translate text in R...

The amazing [`reticulate`](https://rstudio.github.io/reticulate/) package in R provides a way of running python code from R. 🎉

So, we can create a simple python function to translate text and store it in a python script (`TranslateUsingGoogleTrans.py`): 
```python
def translate(text, translateTo):

  # Load the googletrans library
  from googletrans import Translator

  # Initialise the translator
  translator = Translator()

  # Translate the text provided
  return translator.translate(text, dest=translateTo).text
```

Then we can use that code in R to translate some text:
```R
# Load libraries
library(reticulate)

# Source the python translation code
source_python("TranslateUsingGoogleTrans.py")

# Translate some text
text <- "Je suis étonné que cela fonctionne si bien!"
translate(text, 'en')
```

`> [1] "I am amazed that it works so well!"`

I'm amazed at how well the `googletrans` package works and excited to adapt the code above for my survey data. I've also hopefully demonstrated how easy it is to link python and R code with `reticulate`, which I often use to take advantage of some of python's amazing libraries! 😊