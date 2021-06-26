---
layout: post
title: Getting started with GitHub Actions
date: 30 Oct 2020
feature-img: "assets/img/blog/githubActions/thumbnail.png"
thumbnail: "assets/img/blog/githubActions/thumbnail.png"
image: "assets/img/blog/githubActions/thumbnail.png" 
tags: [github, actions, basicplotteR]
---

Today is the day I've started using [GitHub Actions](https://docs.github.com/en/free-pro-team@latest/actions). I found the following two resources really helpful:

- [Workflows specifically designed for R code](https://github.com/r-lib/actions/tree/master/examples)
- [A great blog post about R workflows in action](https://www.rostrum.blog/2020/08/09/ghactions-pkgs/)

GitHub Actions allow you to create workflows that will execute tasks on a certain action, like [`push`](https://docs.github.com/en/free-pro-team@latest/github/using-git/pushing-commits-to-a-remote-repository)ing changes onto GitHub.

Each time you complete an action (`push` changes to your repository), the workflow will be executed. For example, today I've added a workflow ([Quickstart Continuous Integration workflow](https://github.com/r-lib/actions/tree/master/examples#quickstart-ci-workflow)) to my [basicPlotteR](https://github.com/JosephCrispell/basicPlotteR) package, which does the following:

- Boots up a mac OS computer
- Checks R is installed
- Installs two packages:
    * [`remotes`](https://cran.r-project.org/package=remotes) for installing packages from GitHub
    * [rcmdcheck](https://cran.r-project.org/web/packages/rcmdcheck/index.html) - for checking R code
- Installs my [basicPlotteR](https://github.com/JosephCrispell/basicPlotteR) package
- Runs `rcmdcheck()` from the [rcmdcheck](https://cran.r-project.org/web/packages/rcmdcheck/index.html) package, which:
    * Checks all the function documentation
    * Runs all the examples for the functions to check they work
    * Checks all functions dependencies
    * Checks the R package structure
    * And many more!!

With this workflow in place, every time I edit the code for my [basicPlotteR](https://github.com/JosephCrispell/basicPlotteR) package, the above checks will be run and I'll know straight away if I have caused any problems!

GitHub Actions require a [YAML](https://www.tutorialspoint.com/yaml/yaml_basics.htm) formatted file to define the workflow. The *Quickstart Continuous Integration workflow* (available [here](https://github.com/r-lib/actions/tree/master/examples#quickstart-ci-workflow)) looks like this:
```yaml
# Define when the action is to be triggered
on:
  push:
    branches:
      - main
      - master
  pull_request:
    branches:
      - main
      - master

name: R-CMD-check

jobs:
  R-CMD-check: # Name of job
    runs-on: macOS-latest # Define OS you want to run action on, you can have multiple!
    steps:

      # Checkout (download) repository 
      - uses: actions/checkout@v2

      # Install R
      - uses: r-lib/actions/setup-r@v1
      
      # Install required packages
      - name: Install dependencies
        run: |
          install.packages(c("remotes", "rcmdcheck"))
          remotes::install_deps(dependencies = TRUE)
        shell: Rscript {0}
      
      # Run the rcmdcheck function on R package repository
      - name: Check
        run: rcmdcheck::rcmdcheck(args = "--no-manual", error_on = "error")
        shell: Rscript {0}
```

I saved the above YAML code in a file called [`.github/workflows/R-CMD-check.yaml`](https://github.com/JosephCrispell/basicPlotteR/blob/master/.github/workflows/R-CMD-check.yaml) in my [basicPlotteR](https://github.com/JosephCrispell/basicPlotteR) repository. Note, that I had to create the `.github` and `workflows` folders and explicitely push them onto GitHub using `git add .github/workflows/R-CMD-check.yaml`.

With the workflow pushed online, GitHub automatically started running the workflow!

![actions]({{ "/assets/img/blog/githubActions/thumbnail.png" | relative_url}})

As the above screenshot shows, the code for my [basicPlotteR](https://github.com/JosephCrispell/basicPlotteR) package needed some tidying up to get it to pass the `rcmdcheck()` checks! 😨

But I got there in the end!!! 🎉

![actions]({{ "/assets/img/blog/githubActions/badge.png" | relative_url}})

I added the status badge to the repository [`README.md`](https://github.com/JosephCrispell/basicPlotteR/blob/master/README.md) using the following markdown code in the top line:
```
[![R build status](https://github.com/JosephCrispell/basicPlotteR/workflows/R-CMD-check/badge.svg)](https://github.com/JosephCrispell/basicPlotteR/actions?workflow=R-CMD-check)
```
The path to the `badge.svg` file is in my repository but you'll find no trace of it - I am not sure why this is but the badge is working, so I'll not question it! 🤔

Well, I've been amazed by the power of [GitHub Actions](https://docs.github.com/en/free-pro-team@latest/actions) and I've only just started! I can't wait to introduce more complex checks and add workflows to all my repositories!!! 

Oh, and Happy Halloween!!! 🧡