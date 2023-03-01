---
layout: post
title: Reproducibility in my work
date: 01 Feb 2023
feature-img: "assets/img/blog/reproducibility/miro_map.png"
thumbnail: "assets/img/blog/reproducibility/miro_map.png"
image: "assets/img/blog/reproducibility/miro_map.png" 
tags: [reproduciblity, woodchester, coding standards]
---

It's been a while (over a year) since my last blog post! I'm hoping to get back into the swing of writing them fairly regularly but we'll see! 😄 In this post, I want to talk a little about reproducibility (how easy it is to repeat and adapt projects) and reflect on one of my own projects.

# The problem

A few months ago someone reached out wanting to extend my [research using genomics to examine the transmission of *Mycobacterium bovis* (the bacteria that causes bovine tuberculosis) between cattle and badgers in South West England](https://elifesciences.org/articles/45833) (also see short summary in my [blog](https://josephcrispell.github.io/projects/woodchester)). Unfortunately, although my are publicly available on my [GitHub account](https://github.com/JosephCrispell), repeating this work is not easy.

I wanted to reflect on why this is a difficult task and how I can improve the reproducibility of my work.

My first step in helping this person was to make sense of my codebase. I created a diagram using [miro](https://miro.com/) showing how each piece of code linked together and how the raw and processed data files moved from one to another:

<iframe width="768" height="432" src="https://miro.com/app/live-embed/uXjVPqsp-rs=/?moveToViewport=-1861,-824,3200,1198&embedId=140865863589" frameborder="0" scrolling="no" allow="fullscreen; clipboard-read; clipboard-write" allowfullscreen></iframe>

In the process of exploring and mapping the codebase, I've noted a few limitations in the reproducibility of my work, for example:

>- I used multiple languages (Java, perl, python, R, and bash)
>- The codebase was split across multiple repositories, none of which were specifically for the project
>- There are many manual steps
>- There are many input data files required without much detail on the content and source of these files
>- I haven't provided a guide for replicating the work
>- There is a lack of code modularisation and documentation
>- I've used full file paths throughout the codebase that are specific to my, now non-existent, computer

# How I could improve in the future

All of the above issues are avoidable and, over the last few years, I've started to better understand how to do this. As pointers for myself and others, I'll briefly address each of the above limitations here and consider how I can avoid them in the future.

---
## - I used multiple languages (Java, perl, python, R, and bash)
The more languages you use, the harder it is to understand each part and get them to work together. In my case, it also meant lots of manual steps moving from one language to another.

I used multiple languages because of the different types of analyses I was doing: 
- Perl, python and bash for processing the genomic data and interacting with bioinformatics software like [bwa](https://github.com/lh3/bwa)
- Java for analysing the large cattle and badger population databases
- R for the statistical analyses and visualisations

In reality though, I could have done all of the above in a single language (particularly R or python). In some cases (for example, for efficiency or access to specific methods) it may have been necessary to use a different language and you can build in direct connections between the different languages. For example:
- Use [reticulate](https://rstudio.github.io/reticulate/) in R to run python code and [rpy2](https://rpy2.github.io/) for the other way around
- Use [rJava](https://github.com/s-u/rJava) in R and [Py4J](https://www.py4j.org/index.html) in python to run Java code (rJava can be temperamental though! 😳)
- Use [invoke](https://realpython.com/python-bindings-overview/) and [Rcpp](https://www.rcpp.org/) to run c++ code from python and R, respectively

---
## - The codebase was split across multiple repositories, none of which were specifically for the project
Navigating across multiple repositories to find the code for a particular project is time consuming, particularly if the repositories contain code from a mixture of projects.

Each project should have a single repository that contains all the code necessary to run the project. [Read more on simple project structures](https://best-practice-and-impact.github.io/qa-of-code-guidance/project_structure.html).

---
## - There are many manual steps
The more manual steps there are, the more opportunities there are to introduce errors and the longer the process is to replicate. It is important to have opportunities for user input into the process (checking outputs are as expected)but that can be built into the automation process without the need for the user to run multiple pieces of code separately.

Building [Reproducible Analytical Pipelines](https://analysisfunction.civilservice.gov.uk/support/reproducible-analytical-pipelines/) are a great example of this and well worth looking into! 🎤🎵

---
## - There are many input data files required without much detail on the content and source of these files
Sometimes having many input data files is unavoidable but it is critical that we clearly record information about the data required. We should always include documentation alongside our data files, such as metadata files and data dictionaries.

An example of a really simple `metadata.json` file (that could accompany each data file required) might be:
```json
{
    "file_name": "OPN_RAW_Crispell_myHeightData_01-01-2020.csv",
    "description": "Information about my height",
    "url": "https://josephcrispell.github.io/",
    "data_source": "Joseph Crispell",
    "source_contact": "my_email@somewhere.com",
    "date_accessed": "01-02-2023",
    "date_last_updated": "01-01-2020"
}
```

In our `data/` folder we could also maintain a data dictionary (`README.md`), which could look something like:
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

Datasets currently present in data folder:

- `OPN_RAW_Crispell_myHeightData_01-01-2020.csv` - information about my height
```

---
## - I haven't provided a guide for replicating the work
There are amazing tools that can go alongside a repository for documenting our projects. Unfortuanetly, I haven't used them for the repositories associated with this project 😭. It is important to:
- Have a clear and concise [`README.md`](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-readmes) file in your repository that describes the codebase and sets out important things for the user to know. See some [great examples](https://github.com/matiassingers/awesome-readme)! 💕
- Create a [wiki](https://docs.github.com/en/communities/documenting-your-project-with-wikis/about-wikis) for more thorough documentation of your project. A wiki is a simple set of web pages that are directly linked to your repo. Here's my one for [HomoplasyFinder](https://github.com/JosephCrispell/homoplasyFinder/wiki)!
- Consider using tools like [sphinx](https://www.sphinx-doc.org/) (in python) and [roxygen](https://cran.r-project.org/web/packages/roxygen2/vignettes/roxygen2.html) (in R) for automatically generating project documentation that you can build on that you can host online (for example on [GitHub pages](https://github.blog/2016-08-22-publish-your-project-documentation-with-github-pages/))

---
## - A lack of code modularisation and documentation
My code is lacking some key features of reproducible coding (or what's present could be improved):

- Modularisation, breaking the code down into functions, libraries, and classes. By doing this we make our code more understandable and maintainable (read more about [modular code](https://best-practice-and-impact.github.io/qa-of-code-guidance/modular_code.html))
- Documenting my functions using docstrings ([python](https://realpython.com/documenting-python-code/#documenting-your-python-code-base-using-docstrings) and [R](https://josephcrispell.github.io/2021/07/26/creating-R-docstring.html) docstring help) that clearly describe what a function does, what its input parameters are, and what it provides as output
- Approaches to checking the code is working as expected:
   - Add in `if` statements and checks that the parameters are of the correct type, format, and structure with informative error messages
   - Add in some simple [unit testing](https://towardsdatascience.com/unit-testing-in-r-68ab9cc8d211) - this is code that you write to check your code is running as expected that we can run each time with change our code

---
## - I've used full file paths throughout the codebase that are specific to my, now non-existent, computer
I've used absolute file paths throughout my codebase, these are file paths that say specifically on **my computer** where the file is. It is always better to use [relative paths](https://www.itgeared.com/html-absolute-relative-path-links/#:~:text=Relative%20paths%20are%20very%20useful,not%20include%20the%20domain%20name.) that aren't specific to any compuyter but are relative to the location of the code.

# Some final thoughts
There are many more issues with the codebase. Making our projects more reproducible is always an area for development. 

Hopefully each of my projects gets easier to reproduce and I'll stress that it is a critical first step to make the code publicly available - being a part of the open-source community. (I've always loved this image below from the [The Turing Way: handbook to reproducible, ethical and collaborative data science](https://the-turing-way.netlify.app/welcome.html) that illustrates this!)

![Join the open source community (Image credit: Turing Way)](https://github.com/alan-turing-institute/the-turing-way/raw/main/book/website/figures/community.jpg)

Don't be afraid to put your code out there, it will always need improving but at least you are giving others the opportunity to see, use, adapt, and learn from it! ♻
