---
layout: post
title: Mapping my skills development with a radar chart
date: 23 Oct 2020
feature-img: "assets/img/blog/radarChart/thumbnail.png"
thumbnail: "assets/img/blog/radarChart/thumbnail.png"
image: "assets/img/blog/radarChart/thumbnail.png" 
tags: [basicPlotteR, radar, skills, R]
---

I've recently added the `radarChart()` function into my [basicPlotteR](https://github.com/JosephCrispell/basicPlotteR/blob/master/README.md#radarchart) R package. [Radar Charts](https://en.wikipedia.org/wiki/Radar_chart#:~:text=A%20radar%20chart%20is%20a,starting%20from%20the%20same%20point.) provide a way that we can map scores in different qualitative categories.

I am currently developing my [Personal Development Plan](https://www.reed.co.uk/career-advice/personal-development-planning-what-you-need-to-know/) and I wanted to reflect on my current skills and what I'd like to develop.

I was inspired to learn more about the radar chart by the existing `radarchart()` function in the [fmsb](https://cran.r-project.org/web/packages/fmsb/fmsb.pdf) R package. The key the radar chart is positioning the axes equidistantly around a circle, and thanks to [Stackoverflow](https://stackoverflow.com/questions/5300938/calculating-the-position-of-points-in-a-circle) I didn't have to work this out myself! 💡

Here is my `radarChart()` function in action illustrating my current level for a range of skills and where I'd like to be over the next 6 months:

![radar]({{ "/assets/img/blog/radarChart/thumbnail.png" | relative_url}})

I consider these themes to be integral to my work as a data scientist and over the next 6 months I'll be doing the following to improve my skills:
- **Programming** - I'm happy where I am at the moment. I can confidently program in a range of languages.
- **Statistics** - A skillI'd like to improve. Currently I'm learning about geospatial statistics and [Small Area Estimation](https://www.adb.org/sites/default/files/publication/609476/small-area-estimation-guide-nsos.pdf) techniques to extrapolate statistics to small local areas with limited sampling.
- **Databases** - I've worked with big data sources for many years, but not much with databases. I'd like to learn more about how we create, manage, and query large databases. I'm getting started by using [MySQL](https://www.mysql.com/) to store and query trade statistics data.
- **Projects** - As a data scientist, I'm involved in many different projects. Managing my own and other's time is becoming increasingly important. I've just completed a [Scrum Master](http://www.scrumguides.org/index.html) training course and I am excited to learn more!
- **Web** - Web development is essential to disseminating and exploring data and an area I need to improve but for the moment I am happy with my current skill level. Most recently I used the `html` presentation framework [reveal.js](https://revealjs.com/) for a presentation about *Data Ethics in practice*.
- **Versioning** - Understanding version control and writing high quality robust code is something I am continually working on. At the moment I am exploring [unit testing](https://stackoverflow.com/questions/67299/is-unit-testing-worth-the-effort) and I'd like to learn more about [GitHub Actions](https://github.com/features/actions).

For me, this has been a really useful exercise. Taking time to reflect on my current skills and learning about the mathematics behind radial charts. The code for my [`radarChart()`](https://github.com/JosephCrispell/basicPlotteR#radarchart) function is available [here](https://github.com/JosephCrispell/basicPlotteR/blob/master/R/radarChart.R). Install my [`basicPlotteR`](https://github.com/JosephCrispell/basicPlotteR) package and give it a go! 🏁