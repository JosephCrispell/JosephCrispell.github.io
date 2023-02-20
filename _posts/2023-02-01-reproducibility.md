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

# The problem

A few months ago someone reached out who was interested in extending my [research that used genomics to examine the transmission of *Mycobacterium bovis* (the bacteria that causes bovine tuberculosis) between cattle and badgers in South West England](https://elifesciences.org/articles/45833) (also see short summary in my [blog](https://josephcrispell.github.io/projects/woodchester)). Unfortunately, although the code for this work are publicly available on my [GitHub account](https://github.com/JosephCrispell), repeating this work is not easy.

I wanted to reflect in this post on why this is a difficult task and how I can improve the reproducibility of my work.

The first task for me to do to help this person that wanted to reproduce the work was to understand the code I'd shared and the required data files. I created a diagram using miro to show how each of the code files linked together and how the raw and processed data moved from one to another:

<iframe width="768" height="432" src="https://miro.com/app/live-embed/uXjVPqsp-rs=/?moveToViewport=-1861,-824,3200,1198&embedId=140865863589" frameborder="0" scrolling="no" allow="fullscreen; clipboard-read; clipboard-write" allowfullscreen></iframe>

Quite quickly from exploring the code files, I can spot many limitations in the reproducibility of my work, for example:

- I used multiple languages (Java, perl, python, R, and bash)
- The codebase was split across multiple repositories, none of which were specifically for the project
- There are many manual steps
- There are many input data files required without much detail on the content and source of these files
- I haven't provided a guide for replicating the work
- A lack of code modularisation and documentation
- I've used full file paths throughout the codebase that are specific to my, now non-existent, computer

# How I could improve in the future

All of the above issues are avoidable  and over the last few years I've started to better understand how to make my code more reproducible.

As pointers for myself and others, I'll briefly address each of the above limitations here and consider how I can avoid them in the future.

## - I used multiple languages (Java, perl, python, R, and bash)
The more languages you use, the harder it is for a user to understand each part and get them to work. In my case it also meant lot so manual steps moving from one language to another.

I used multiple languages because of the different types of analyses I was doing: 
- Perl, python and bash for processing the genomic data
- Java for analysing the large cattle and badger population databases
- R for the statistical analyses and visualisations

In reality though, I could have done all of the above in a single language like R or python. In some cases (for example, for efficiency or access to specific methods) it may be necessary to use a different language but usually you can build in direct connections between the different languages. For example:
- Use [reticulate](https://rstudio.github.io/reticulate/) in R to run python code
- Use [rpy2](https://rpy2.github.io/) in python to run R code
- Use [rJava](https://github.com/s-u/rJava) in R to run Java code (it can be temperamental though! 😳)
- Use [invoke](https://realpython.com/python-bindings-overview/) and [Rcpp](https://www.rcpp.org/) to run c++ code from python and R

## - The codebase was split across multiple repositories, none of which were specifically for the project
Navigating across multiple repositories to find the code for a particular project is time consuming, particularly if the repositories contain code from a mixture of projects.

Each project should have a single repository that contains all the code necessary to run the project.

## - There are many manual steps
The move manual steps there are, there more opportunities there are to introduce errors and the more time consuming the process is to replicate. It is important to have opportunities for the user to input into the process and check the code and outputs are as expected but these can be built into the automation process without the need for the user to run multiple pieces of code separately.

## - There are many input data files required without much detail on the content and source of these files
Sometimes having many input data files is unavoidable but it is critical that we record clear information about the data required. We should always metadata and data dictionaries.

An example of a really simple `metadata.json` file (that could accompany each data file required) might be:
```json
{
    "file_name": "my_data_file_name.csv",
    "description": "Brief description of data file",
    "url": "my_data_file_url.com",
    "data_owner": "organisation that provided data",
    "owner_contact": "crispelljoseph@gmail.com",
    "date_accessed": "01-02-2023",
    "date_last_updated": "10-03-2022"
}
```

In our `data/` folder we could also maintain a data dictionary (`README.md`):
```md
# Data dictionary
Details of the data files stored in the current `data/` folder.

## Naming convention

**TYPE_STATUS_SOURCE_DESC_DATE.suffix**

- **TYPE**: [OPN|SEC] to show whether this is an open (OPN) or secure (SEC) dataset
- **STATUS**: [RAW|PROC|FINAL] to show whether this is a raw (RAW), processed (PROC) or final (FINAL) dataset
- **SOURCE**: where the data came from
- **DESC**: brief [`camelCase`](https://en.wikipedia.org/wiki/Camel_case) description of dataset
- **DATE**: [dd-mm-YY] formatted date of when dataset last updated
- **suffix**: [csv|xlsx|tsv|txt|etc.] file format abbreviation

## Dataset dictionary

Datasets currently present in secure folder:

- `my_data_file_name.csv` - brief description of data
```

## - I haven't provided a guide for replicating the work

There are amazing tools that go alongside a repository for documenting our projects and I haven't used them for the repositories associated with this project. It is important to:
- Have a clear and concise [`README.md`](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-readmes) file in your repository that describes the codebase in the repository and sets our important things for the user to know. See some [great examples](https://github.com/matiassingers/awesome-readme)! 💕
- Create a [wiki](https://docs.github.com/en/communities/documenting-your-project-with-wikis/about-wikis) for a more thorough documentation or your project. A wiki is a simple set of web pages that are directly linked to your repo and great place to store detail on what your project is and how people can use it. Here's my one for [HomoplasyFinder](https://github.com/JosephCrispell/homoplasyFinder/wiki)!

## - A lack of code modularisation and documentation
Functions, libraries, docstrings, unit testing

## - I've used full file paths throughout the codebase that are specific to my, now non-existent, computer
relative paths

# Some final thoughts

There are many more issues with the codebase for analyses and making our projects more reproducible is always an area for continuous development. Hopefully each of my projects gets easier to reproduce and I'll stress that it is a critical first step to making the code publicly available. Don't be afraid to put your code out there, it will always need improving but atleast you are giving others the opportunity to see, use, adapt, and learn from it! ♻
