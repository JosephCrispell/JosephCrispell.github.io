---
layout: post
title: Reproducibility in my work
date: 01 Feb 2023
feature-img: "assets/img/blog/reproducibility/miro_map.png"
thumbnail: "assets/img/blog/reproducibility/miro_map.png"
image: "assets/img/blog/reproducibility/miro_map.png" 
tags: [reproduciblity, woodchester, coding standards]
---

It's been a while (over a year) since my last blog post and I'm hoping to get back into the swing of writing them fairly regularly. Today I want to talk a little about reproducibility (how easy it is to repeat and adapt projects) and reflect on one of my projects.

A few months ago someone reached out who was interested in extending my [research that used genomics to examine the transmission of *Mycobacterium bovis* (the bacteria that causes bovine tuberculosis) between cattle and badgers in South West England](https://elifesciences.org/articles/45833) (also see short summary in my [blog](https://josephcrispell.github.io/projects/woodchester)). Unfortunately, although the code for this work are publicly available on my [GitHub account](https://github.com/JosephCrispell), repeating this work is not easy.

I wanted to reflect in this post on why this is a difficult task and how I can improve the reproducibility of my work.

The first task for me to do to help this person that wanted to reproduce the work was to understand the code I'd shared and the required data files. I created a diagram using miro to show how each of the code files linked together and how the raw and processed data moved from one to another:

<iframe width="768" height="432" src="https://miro.com/app/live-embed/uXjVPqsp-rs=/?moveToViewport=-1861,-824,3200,1198&embedId=140865863589" frameborder="0" scrolling="no" allow="fullscreen; clipboard-read; clipboard-write" allowfullscreen></iframe>

Straightaway from exploring the code files I can acknowledge many limitations in the reproducibility of my work:

- I used multiple languages (Java, perl, python, R, and bash)
- The codebase was split across multiple repositories, none of which were specifically for the project
- There are many manual steps
- There are many input data files required without much detail on the content and source of these files
- I haven't provided a guide for replicating the work
- I've used full file paths throughout the codebase that are specific to my, now non-existent, computer

