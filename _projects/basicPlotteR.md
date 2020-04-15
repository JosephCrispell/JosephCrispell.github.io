---
layout: project
title: basicPlotteR
feature-img: "assets/img/projects/basicPlotteRLogo.png"
img: "assets/img/projects/basicPlotteRLogo.png"
date: 23 Mar 2019
tags: [plot, base, R, package]
---

`basicPlotteR` is an R package designed to help you making plots in `base` R. The `base` R package is the package that comes with R, it contains all those functions that makes R what it is.

There are loads of plotting functions available in the `base` R package. I try to use these as much as possible as I think they give me the most flexibility in how I create my plots. I designed `basicPlotteR` package to be a collection of additional plotting functions that add a little bit extra to the `base` plotting functions.

I'll keep adding functions to `basicPlotteR`, for the moment though my favourite is `addTextLabels()`. It mimics the `base` R function `text()` by adding text labels to an existing plot, but it re-positions text to avoiding any overlapping.

![addTextLabels]({{ "assets/img/projects/addTextLabels.gif" | relative_url}} "addTextLabels() function at work!")

There are loads more functions to play around with. Download the package and get started with the following code:

    # Install the devtools R package - for downloading packages from github
    install.packages("devtools")

    # Install basicPlotteR
    devtools::install_github("JosephCrispell/basicPlotteR")

    # Load the basicPlotteR package
    library(basicPlotteR)

    ...

To learn more, take a look at the github page [here](https://github.com/JosephCrispell/basicPlotteR).