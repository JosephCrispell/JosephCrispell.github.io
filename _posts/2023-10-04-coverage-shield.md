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

# How it works

`coverage_shield` has a simple command line interface:
```bash
python3 -m coverage_shield --help
```
```
usage: coverage_shield [-h] [-d [directory]] [-r [readme_path]] [-t [tester]] [-g]

Welcome to coverage_shield! A tool to create and maintain a python package unit test coverage badge in README.md

options:
  -h, --help            show this help message and exit
  -d [directory], --directory [directory]
                        Provide path to directory to run coverage_shield in. (default: .)
  -r [readme_path], --readme [readme_path]
                        Provide path to README.md relative to directory provided. (default: README.md)
  -t [tester], --tester [tester]
                        Provide name of unit test python package you want to use. Accepts either "unittest" or "pytest" (default: unittest)
  -g, --git_push        Stage, commit, and push the updated README file (-r/--readme) using git. (default: False)
  ```

So you would run it on your python package repository with:
```bash
python3 -m coverage_shield
```

# Shields io


