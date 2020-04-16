---
layout: post
title: phyloHelpeR
feature-img: "assets/img/projects/phyloHelpeRLogo.png"
img: "assets/img/projects/phyloHelpeRLogo.png"
date: 21 Nov 2019
tags: [plot, base, R, package, phylogenetics]
---

I've been working with phylogenies in R for a long time. I find the [`ape`](https://cran.r-project.org/web/packages/ape/ape.pdf) and [`phytools`](https://cran.r-project.org/web/packages/phytools/phytools.pdf) to be the most useful.

The [`phyloHelpeR`](https://github.com/JosephCrispell/phyloHelpeR/tree/master/R) is an R package to make a home for some of the functions I use a lot when building and plotting phylogenies in R. At the moment it is home to the following functions:

- `tanglePlot()` a function to plot two phylogenies based on the same sequences opposite one another so you can see how they differ.
- `runRAXML()` a function to interact with the command line phylogenetic tree building tool [RAxML](https://cme.h-its.org/exelixis/web/software/raxml/)
- `addSNPScale()` a function to add a scale to a phylogeny whos branch lengths are scaled to the number of **S**ingle **N**ucleotide **P**olymorphisms.

As you can see, this R package is a work in progress... As I don't work on phylogenetics anymore my contributions will be slow but hopefully I'll still add a few more helpful functions. 👍


