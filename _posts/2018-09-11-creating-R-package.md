---
layout: post
title: Creating an R package
date: 11 Sep 2018
feature-img: "assets/img/blog/packageR/thumbnail.svg"
thumbnail: "assets/img/blog/packageR/thumbnail.svg"
image: "assets/img/blog/packageR/thumbnail.svg" 
tags: [R, package, basicPlotteR]
---

Today I'm going to write about creating an [R](https://www.r-project.org/) package 📦. It's very easy, and something I should have learnt a long time ago. Before I start, here are a couple of very good tutorials for creating an R package:
- [Writing an R package from scratch](https://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/)
- [Hadley Wickham's R package documentation](http://r-pkgs.had.co.nz/description.html)

**Why bother?** If you're like me and you still haven't embraced creating your own R packages then you'll be asking this question. It is going to save you *SO MUCH* time and make your code cleaner and easier to use. Get on with it!

**Why does it save you time?** Functions in an R package are in one place and documented. Packages are easy for other people to install and use.

Lastly, **packages are the building blocks of the R world**. By creating your own, you've joined the community of people continuing to make R the amazing language that it is. So let's get started!

To get started, you'll need to install and load a couple of packages:

```r
# Install necessary packages
install.packages("devtools")
install.packages("digest")
devtools::install_github("klutometis/roxygen")

# Load them
library("devtools")
library("roxygen2")
```

Then create the package folder:

```r
packageDirectory <- file.path("basicPlotteR")
create(packageDirectory)
setwd(packageDirectory)
```

I'm creating an R package for the code I wrote for a few functions I've developed to help with plotting in R. My package is going to be called [basicPlotteR](https://josephcrispell.github.io/projects/basicplotter).

So, we've created our package directory. If you navigate to the directory you'll find the following:<br>
- `R/` - The directory where you are going to put the code for your R functions. Each function can have it's own file (`functionName.R`), or you can chuck all your functions into a single file (`packageName.R`)
- `basicPlotteR.Rproj` - Some information for R about your package
- `DESCRIPTION` - Take a look, it's got the information about your package. See the contents of this file below.
- `NAMESPACE` - A file telling R which functions to provide documentation for with the R package.
- `.gitignore` - A file to be used if you're putting your package on github, as the name suggests it's what you don't want to put on github.
- `.Rbuildignore` - A file noting what is to be ignored when you're building the R package.

The DESCRIPTION file. It has the following lines, which I have edited for my package:
```
Package: basicPlotteR
Title: A collection of tools to help with base R plotting
Version: 0.0.0.9000
Authors@R: person("Joseph", "Crispell", email = "JosephCrispell@gmail.com", role = "cre")
Description: An R package containing all the tools I have developed to make plotting with base R a little easier
Depends: R (>= 3.4.4)
License: GPL-3
Encoding: UTF-8
LazyData: true
```

Right, back to working on the package. The first thing we want to do is add some functions. Here is a general format for a function:

```r
#' Short title for function
#'
#' Longer description of the function
#' @param first An object of class "?". Describe each input parameter
#' @param second An object of class "?". Describe each input parameter
#' @keywords Add some good keywords for your function here
#' @return Returns an object of class "?". Describe what the function returns
#' @export
#' @examples
#' # Add some code here illustrating how to use the function
functionName <- function(first, second){
	# Some code here
	return(something)
}
```

The code for the function is the same as for any function, but there is lot's of information about the function above it. The weird `#'` is a special comment that roxygen recognises. Roxygen is the package that we're using for our build.

Functions can be saved in a R script and put in the `R/` directory. I've created a single R script for each of the tools in my `basicPlotteR` package.

Flip! It takes a wee while to add the roxygen descriptions above each function - documentation is really important and useful though so it's worth it!

Once you're finished adding your functions, save the file and run the following code to update the package:

```r
setwd(packageDirectory)
document()
```

And you're done!! 🎉 It is amazingly straight forward and I should be doing it with all my R code. 

Here are a few extra notes of things I've learnt when building my packages:
- When using functions from other packages in your own functions, use the following format: `packageName::functionName()`. Also, add `@import packageName` tag into the roxygen information.
- For an internal function, a function that is used within your package but you don't want others to see it or use it. Remove the `@export` tag and add `@keywords internal`.
- To format code into roxygen function documentation lines, use the `\code{}` container
- If you want to attach data to your package, do the following:
	* Save each object of interest alone in a file: `objectName.RData`
	* Create a directory: `/data/` and put all the RData files in it
    * Add roxygen information into the functions file as if it were a function using the following:
    ```r
      #' Description of the object
      #'
      #' @name objectName
      #' @docType data
      #' @author Joseph Crispell \email{crispelljoseph@@gmail.com}
      #' @keywords data
      NULL
    ```
    * Any data attached to a package can be loaded using `data("objectName")`
  
I am now hosting my `basicPlotteR` R package on github (I created a <a href="https://github.com/JosephCrispell/basicPlotteR">repository</a> with all my package files in it). You can install it and give it a go with the following code:

```r
# Load the devtools library
library("devtools")

# Install the basicPlotteR package
install_github("JosephCrispell/basicPlotteR")
```

So that's how to create an R package. Start converting your R scripts now! 😊