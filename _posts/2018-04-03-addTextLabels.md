---
layout: post
title: addTextLabels()
date: 03 Apr 2018
feature-img: "assets/img/blog/addTextLabels/addTextLabels.gif"
thumbnail: "assets/img/blog/addTextLabels/addTextLabels.gif"
image: "assets/img/blog/addTextLabels/addTextLabels.gif" 
tags: [R, package, plot, base, github]
---

We're frequently wanting to label points in our scatter plots but they almost always overlap! 😠 Enter my `addTextLabels()` function.

`addTextLabels()` is part of my [`basicPlotteR`]({{ site.baseurl }}/projects/basicPlotter) R package and allows you to add non-overlapping labels to points on a plot.

The [gif](https://en.wikipedia.org/wiki/GIF) below shows `addTextLabels()` in action and compares it to the `base` R  function

![addTextLabels() at work!]({{ "assets/img/blog/addTextLabels/example.gif" | relative_url}})

To create these plots, generate some random points with:

```R

    # Create some random points
    n <- 45
    testLabels <- c("short", "mediummm", "looooonnnnnnngggggg", "0090292002", "9", "A Different label")
    coords <- data.frame(X=runif(n), Y=runif(n, min=0, max=100), Name=sample(testLabels, size=n, replace=TRUE), stringsAsFactors = FALSE)
```

Then you can remove the margins and set the background colour - only just figured out how to do this!! 🎉

```R
    # Set the margins
    par(mar=c(0.5,0.5,0.5,0.5))

    # Set the background colour
    par(bg = rgb(0,0,1, 0.25))
```
Lastly, make the three plots:<br>
1. Using the `base` R [`text()`](https://www.rdocumentation.org/packages/graphics/versions/3.6.2/topics/text) function
2. Using `addTextLabels()` without any formatting
3. A spruced up use of `addTextLabels()`

```R
    # With potentially overlapping labels
    plot(x=coords$X, y=coords$Y, pch=19, bty="n", xaxt="n", yaxt="n", xlab="", ylab="", cex=2, col=rgb(1,0,0, 0.5))
    text(coords$X, coords$Y, labels=coords$Name, xpd=TRUE, cex=2)

    # Plot them with non-overlapping labels
    plot(x=coords$X, y=coords$Y, pch=19, bty="n", xaxt="n", yaxt="n", xlab="", ylab="", cex=2, col=rgb(1,0,0, 0.5))
    addTextLabels(coords$X, coords$Y, coords$Name, cex.label=2, col.label="black", lty=2, col.line=rgb(0,0,0, 0.5))

    # Plot them with non-overlapping labels
    plot(x=coords$X, y=coords$Y, pch=19, bty="n", xaxt="n", yaxt="n", xlab="", ylab="", cex=2, col=rgb(1,0,0, 0.5))
    addTextLabels(coords$X, coords$Y, coords$Name, cex.label=2, col.background=rgb(0,0,0, 0.5), col.label="white", lty=2, col.line=rgb(0,0,0, 0.5))
```

A method to avoid overlapping text labels already exists within the [ggplot]() package ([ggrepel](https://cran.r-project.org/web/packages/ggrepel/vignettes/ggrepel.html)), but I was keen to write my own that will work with `base` R plots.

It took me a wee while to get my method to work but the final version works with the following steps:

1. Create a plot that you want to label
2. Create a set of labels and coordinates to match points on plot
3. Create a set of alternative coordinates on a grid, within the limits of current plot (use `par("usr")` to get axis limits)
4. Remove alternative coordinates within the space designated for each point's label (I used the `strheight()` and `strwidth()` functions for this)
5. Add labels to plot if they don't overlap with any other point's label. 
6. If a label will overlap, search the laternative coordinates from closest to farthest, once found:
    1. Add a text label at the chosen location and plot a line back to the original point
    2. Remove any of the alternative label locations that would overlap with the chosen location and its label
    3. Change the point's coordinates to be those of the alternative location

There is still work to be done on this function but give it a go and let me know what you think. You just need to download my `basicPlotteR` package:

```R
# Install the devtools package to install packages from GitHub
install.packages("devtools")

# Install my basicPLotteR package directly from GitHub
devtools::install_github("JosephCrispell/basicPlotteR")

# Load it!
library(basicPlotteR)

# Get cracking!!
```