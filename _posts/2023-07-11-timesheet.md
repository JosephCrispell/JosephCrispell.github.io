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

# How it works

`timesheet` has a simple command line interface:
```bash
python3 scripts/command_line_interface.py --help
```
```
usage: command_line_interface.py [-h] [-f [timesheet_file_path]] [-r] [-s [hh:mm]] [-e [hh:mm]]

Welcome to timesheet, a tool to help you log the hours you work. You are using the command line interface for timesheet.

options:
  -h, --help            show this help message and exit
  -f [timesheet_file_path], --file [timesheet_file_path]
                        Provide file for timesheet (note if not created this will create file). (default: outputs/timesheet.csv)
  -r, --reset           Reset the timesheet file provided with file (-f/--file) argument. (default: False)
  -s [hh:mm], --start [hh:mm]
                        Add start time (hh:mm) to timesheet file provided with file (-f/--file) argument. (default: None)
  -e [hh:mm], --end [hh:mm]
                        Add end time (hh:mm) to timesheet file provided with file (-f/--file) argument. (default: None)
  ```

So you would add a start time with:
```bash
python3 scripts/command_line_interface.py --file outputs/timesheet.csv --start
```

Which updates a timesheet with a simple Comma Separated Values (CSV) structure:
|date      |start_time|end_time|time_worked|notes          |
|----------|----------|--------|-----------|---------------|
|2023-03-13|08:24     |12:00   |03:36      |nothing of note|
|2023-03-13|12:24     |16:24   |04:00      |               |
|2023-03-14|08:35     |12:05   |03:30      |nothing of note|
|2023-03-14|12:45     |16:55   |04:10      |nothing of note|
|2023-03-15|08:22     |11:51   |03:29      |nothing of note|
|2023-03-15|12:15     |17:05   |04:50      |nothing of note|
|2023-03-16|08:36     |12:06   |03:30      |a simple note  |
|2023-03-16|12:56     |17:03   |04:07      |nothing of note|
|2023-07-09|15:18     |        |00:00      |               |

# What I've learnt

The main aim of developing `timesheet` was to condense some of my learning so far into a simple example project as well as expand my practical experience of building python packages. `timesheet` has the following key elements I want to emulate across my work:
- Simple reuseable project structure
- Modular object oriented programming
- Unit testing with a high coverage
- Good documentation

I wanted to use this blog post to talk my experience building `timesheet` and reflect on each of the above key elements.

## Reusable project structure

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

## Modular object oriented programming

## Unit testing with high coverage

## Good documentation
mermaid
tree generator

# Next steps
