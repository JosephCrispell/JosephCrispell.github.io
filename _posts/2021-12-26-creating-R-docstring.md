---
layout: post
title: Creating an R function docstring
date: 26 Jul 2021s
feature-img: "assets/img/blog/docstring/thumbnail.svg"
thumbnail: "assets/img/blog/docstring/thumbnail.svg"
image: "assets/img/blog/docstring/thumbnail.svg" 
tags: [R, function, docstring]
---

I'm trying to get better at using [docstrings](https://en.wikipedia.org/wiki/Docstring) to document my R functions as I write them. A docstring is a block of comments that describe a function, its inputs and output. They are extremely useful tools to help your future self and others understand what your function is doing.

In R a simple template docstring for a function might look like this:

```r
#' Short title for function
#'
#' Longer description of the function
#' @param first An object of class "?". Description of parameter
#' @param second An object of class "?". Description of parameter
#' @return Returns an object of class "?". Description of what the function returns
#' @examples
#' # Add some code illustrating how to use the function
my_new_function <- function(first, second){
	# Some code here

	return(something)
}
```

The `#'` tells R that this isn't just any commented line, it is a commented line that forms part of a function's docstring. The template above can be read by the [roxygen](https://cran.r-project.org/web/packages/roxygen2/vignettes/roxygen2.html) R package and used to automatically build a package's help documentation. 

> In RStudio use `Ctrl` + `alt` + `shift` + `R` with your cursor inside a function to automatically generate a template docstring! 🎁

We can, and should ⚠️, use the template on any function we write. For example:

```r
#' Calculate mean value
#'
#' Given a numeric vector as input the function will calculate the mean value
#' @param numeric_vector A numeric vector to be used to calculate the mean
#' @return Returns a numeric value representing the mean of the numeric vector provided
#' @examples
#' values <- c(1,2,3,4,5,6,4,3)
#' mean_value <- calculate_mean(numeric_vector)
calculate_mean <- function(numeric_vector){
	
  # Check the vector provided is numeric
  if(is.numeric(numeric_vector) == FALSE && length(numeric_vector) > 1){
    stop("The input provided was not a numeric vector!")
  }

  # Get the length of the vector
  n <- length(numeric_vector)

  # Calculate sum
  total <- sum(numeric_vector)

  # Calculate mean
  mean_value <- total / n

	return(mean_value)
}
```

While [roxygen](https://cran.r-project.org/web/packages/roxygen2/vignettes/roxygen2.html) uses the docstring to build a function's help documentation, the [docstring](https://cran.r-project.org/web/packages/docstring/vignettes/docstring_intro.html) package allows you to use function docstrings on the fly! 🛩 

> Install (`install.packages("docstring")`) and load the docstring package (`library(docstring)`), put your docstring inside your function and run your function code, and then use the `?` in the normal way (`?my_function_name`) and the help documentation should magically appear!

I still need to go back to previous code and add docstrings but hopefully any new code I write I'll add them as I go and they'll be a great help to me and others that use my code in the future!