---
layout: post
title: Using time stamped prints in R and python
date: 21 Oct 2026
feature-img: "assets/img/blog/stampedPrint/stamped_print.png"
thumbnail: "assets/img/blog/stampedPrint/stamped_print.png"
image: "assets/img/blog/stampedPrint/stamped_print.png"
tags: [python, r, function, docstring, print]
---

Well it's been quite a few years since my last post and I thought I would start back with a nice quick post about print statements! 🤣

I've found it really helpful to attach timestamps to my print statements in my code, it helps me quickly (and crudely) see how long each step in my code has taken. I use a simple function in both R and python to do this and I really enjoy how even though the functions are written in different languages they look and feel very similar!

Here's the R function:

```r
#' Print (cat) text with a timestamp pre-pended
#'
#' @param text string to print using cat()
#' @param stamp_colour plain text colour ("red", "green", etc.). Defaults to "yellow"
#'
#' @examples
#' stamped_print("Try me!")
#' stamped_print("Try me!", stamp_colour = "red")
stamped_print <- function(text, stamp_colour = "yellow") {
  
  # Note reset code
  reset = "\033[0m"
  
  # Get colour ANSI code
  colour_codes <- list(
    "red" = "\033[31m",
    "green" = "\033[32m",
    "yellow" = "\033[33m",
    "blue" = "\033[34m"
  )
  if (stamp_colour %in% names(colour_codes)) {
    stamp_colour <- colour_codes[[stamp_colour]]
  } else {
    stamp_colour <- reset
  }
  
  # Get current timestamp
  current_time <- format(Sys.Date(), "%Y-%m-%d %H:%M:%S")
  
  # Print text
  cat(paste0(stamp_colour, current_time, reset, "\t", text, "\n"))
}
```

Here's the python one:

```python
def stamped_print(
    text: str = "", stamp_colour: str = "yellow"
):
  """Add timestamp to print
      
  Args:
      text (str): text to print. Defaults to "".
      stamp_colour (str): colour of timestamp. Defaults to "yellow"
  
  .. code-block:: python

  from datetime import datetime
  from pathlib import Path
  
  stamped_print("Try me!")
  stamped_print("Try me!", stamp_colour = "red")
  
  """
  # Note reset code
  reset = "\033[0m"

  # Get colour ANSI code
  colour_dict = {
      "red": "\033[31m",
      "green": "\033[32m",
      "yellow": "\033[33m",
      "blue": "\033[34m",
  }
  if stamp_colour in colour_dict:
      stamp_colour = colour_dict[stamp_colour]
  else:
      stamp_colour = reset    

  # Get current timestamp
  current_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

  # Print text
  print(f"{stamp_colour}{current_time}{reset}\t{text}")
```

It's a nice illustration of [docstring](https://josephcrispell.github.io/2021/07/26/creating-R-docstring.html) structure in both languages too!
