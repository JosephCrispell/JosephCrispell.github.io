---
layout: post
title: spreadPoints()
date: 07 Feb 2019
feature-img: "assets/img/blog/spreadPoints/spreadPoints.png"
thumbnail: "assets/img/blog/spreadPoints/spreadPoints.png"
image: "assets/img/blog/spreadPoints/spreadPoints.png" 
tags: [R, package, plot, base, github]
---

I've created a new [R](https://www.r-project.org/) function called `spreadPoints`, in my [`basicPlotteR`](https://github.com/JosephCrispell/basicPlotteR) package.

The `spreadPoints()` function is designed to add points onto an existing boxplot. The points are spread out to avoid overlap. It works a lot like the [`stripchart`](https://www.rdocumentation.org/packages/graphics/versions/3.6.2/topics/stripchart), but it doesn't spread points randomly. Here it is at work in R:

There is still work to be done on this function but give it a go and let me know what you think. You just need to download my `basicPlotteR` package:

```R
# Install the devtools package to install packages from GitHub
install.packages("devtools")

# Install my basicPLotteR package directly from GitHub
devtools::install_github("JosephCrispell/basicPlotteR")

# Load it!
library(basicPlotteR)

# Generate some example points - drawn from exponential distribution
values <- rnorm(n=50)
 
# Plot a boxplot
boxplot(values, xlab="",  ylab="", frame=FALSE, las=1, pch=19)
       
# Plot the points spread along the X axis
spreadPoints(values, position=1, col="blue")
```

![spreadPoints() at work!]({{ "assets/img/blog/spreadPoints/spreadPoints.png" | relative_url}})

The `spreadPoints()` function works with the following steps:
1. Split the `Y` axis into equally sized bins
2. Assign each `Y` point into a bin
3. Examine each `Y` axis bin:<br>
    a. Count the points in current bin<br>
    b. Split the `X` axis space available, to give the same amount of space to each point<br>
    c. Working from the middle, work out left and right assigning each point a new `Y` coordinate<br>
4. Plot the points with modified `Y` values

Well hopefully that's a helpful addition to the `basicPlotteR` package. Showing the underlying points on a boxplot is very important, particularly when there are only a few points available and I wanted a method that was non-random.

Still plenty of work to do on this, so give it a go and let me knwo what you think! 😊