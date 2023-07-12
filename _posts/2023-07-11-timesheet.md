---
layout: post
title: Tracking the hours you work with timesheet - a python package I built
date: 11 Jul 2023
feature-img: "assets/img/blog/timesheet/timesheet_blog_thumbnail.svg"
thumbnail: "assets/img/blog/timesheet/timesheet_blog_thumbnail.svg"
image: "assets/img/blog/timesheet/timesheet_blog_thumbnail.svg" 
tags: [python, pip, package, timesheet, unittest, docs]
---

# Summary

I've been working on a simple python package called [`timesheet`](https://github.com/JosephCrispell/timesheet), it's a simple tool to help you track the hours you work in a simple spreadsheet. My previously role had a brilliant flexible working strategy that relied on tracking the hours you worked through quite a clunky piece software, when I decided to leave that role I wanted to take a bit of it with me so I created `timesheet`.

The main aim of developing `timesheet` was to condense some of my learning so far into a simple example project as well as expand my practical experience of building python packages. `timesheet` has the following key elements I want to emulate across my work:
- Simple reuseable project structure
- Modular object oriented programming
- Unit testing with a high coverage
- Good documentation

I wanted to use this blog post to talk my experience building `timesheet` and reflect on each of the above key elements.

# Reusable project structure

To get me started I wanted the simplest possible python package structure that I could understand and work within. Tehre are plenty of useful resources on this (for example [here](https://docs.python-guide.org/writing/structure/) and [here](https://github.com/navdeep-G/samplemod)) and I landed on:

```
📦my_package
 ┣ 📂data
 ┃ ┗ Put all your data in here
 ┣ 📂scripts
 ┃ ┗ Python scripts in here designed to called directly in command line
 ┣ 📂tests
 ┃ ┣ 📜__init__.py # required so python code registered within package
 ┃ ┗ Unit testing functions in here
 ┣ 📂my_package
 ┃ ┣ 📜__init__.py # required so python code registered within package
 ┃ ┗ Package classes and modules in here
 ┣ 📜.gitignore # files to ignore (e.g. data folder)
 ┣ 📜.pre-commit-config.yaml # pre-commit workflow
 ┣ 📜LICENSE # open source licence
 ┣ 📜README.md # simple project documentation
 ┣ 📜requirements.txt # package requirements
 ┗ 📜setup.py # required for pip installation
```

Some cool things to note:
- You can install a reactive version of your package (with the above structure) with:
  ```bash
  pip3 install -e .
  ```
  in the package directory and the package will automatically update as you change the code
- Local imports of modules and classes work really well using:
  ```python
  from my_package import my_package_module_or_class
  ``` 

# Modular object oriented programming

# Unit testing with high coverage

# Good documentation
mermaid
tree generator
