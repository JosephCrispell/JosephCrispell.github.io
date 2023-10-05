---
layout: post
title: Create and update your python package unittest coverage badge with coverage_shield - a python package I built
date: 04 Oct 2023
feature-img: "assets/img/blog/coverageShield/coverage_shield_thumbnail.png"
thumbnail: "assets/img/blog/coverageShield/coverage_shield_thumbnail.png"
image: "assets/img/blog/coverageShield/coverage_shield_thumbnail.png" 
tags: [python, pip, package, coverage_shield, unittest, actions]
---

While I was creating my [`timesheet`](https://josephcrispell.github.io/2023/07/11/timesheet.html) package, I started learning about writing unit tests in python. While playing around with unit tests, I explored ways to add a coverage badge to my `README.md` in my repository and I came across quite a few tools:

- [`genbadge`](https://smarie.github.io/python-genbadge/) - generates badges (as images) for a range of python tools including a coverage one
- [`coverage-badge`](https://pypi.org/project/coverage-badge/) - generates badge as image
- [`readme-coverage-badger`](https://pypi.org/project/readme-coverage-badger/) - adds coverage badge to README if you have already run tests
- https://coveralls.io/ - generates coverage badge for readme but is an external tool that builds and tests codebase
- https://smarie.github.io/python-genbadge/ - generates svg badge for a wide range of packages and requires coverage report to be generated prior to running

For me, the main advantages of my `coverage_shield` python package are:

- It was and is a great opportunity for me to learn more about building a python package
- Runs on your local machine with a simple command line interface
- Runs unit tests, generates coverage report, adds/updates badge in README.md file, and pushes updates via `git` (if you want it to)
- Uses the [shields.io url structure](https://shields.io/badges) to show badge rather than creating an image of a badge that you have to store in repo
- Has a continuous colour scale (using a [seaborn colour palette](https://seaborn.pydata.org/tutorial/color_palettes.html)) from red, through yellow, to green


Some next steps:

- Getting it to work with pytest as well as unittest
- Releasing the first version


# How it works

`timesheet` has a simple command line interface:
```bash
python3 -m timesheet --help
```
```
usage: timesheet [-h] [-f [timesheet_file_path]] [-r] [-s [hh:mm]] [-e [hh:mm]]

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
python3 -m timesheet --file outputs/timesheet.csv --start
```
