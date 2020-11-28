---
layout: post
title: Data ethics in practice with reveal.js
date: 27 Nov 2020
feature-img: "assets/img/blog/dataEthicsInPractice/thumbnail.png"
thumbnail: "assets/img/blog/dataEthicsInPractice/thumbnail.png"
image: "assets/img/blog/dataEthicsInPractice/thumbnail.png"
tags: [ethics, reveal.js]
---

I had a great opportunity to talk about data ethics in practice at the [ScotSoft2020](https://www.scotlandis.com/blog/events/scotsoft-2020/) conference. I decided this would be the perfect chance to try out the amazing [reveal.js](https://revealjs.com/) html presentation framework. 

I've tried plenty of different ways to create presentations (like [powerpoint](https://office.live.com/start/powerpoint.aspx), [Rmarkdown](https://bookdown.org/yihui/rmarkdown/ioslides-presentation.html), [google slides](https://www.google.co.uk/slides/about/) and [LaTeX](https://www.latextemplates.com/cat/presentations)) and I'm always keen to try out new (ideally [open-source](https://opensource.com/resources/what-open-source)) tools.

The [reveal.js](https://revealjs.com/) framework represents a wacky new way to create presentations - by writing them directly in [`html`](https://www.w3schools.com/html/html_intro.asp) and it is completely free and open-source!!🎉

Here are the slides I put together:
<iframe src="https://josephcrispell.github.io/standalone/data-ethics-in-practice/index.html#/" width="100%" height="480" style="border:none;">Browser not compatible.</iframe>

<br>
Here's a sneak peak at the [`index.html`](https://github.com/JosephCrispell/reveal.js/blob/master/data-ethics-in-practice/index.html) that makes the above presentation:

```html
<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<!-- Set the presentation title -->
		<title>Data ethics in practice</title>

		<!-- Add a favicon-->
		<link type="image/x-icon" rel="shortcut icon" href="logos/DataScienceCampus_logo_square.png" />

		<link rel="stylesheet" href="../dist/reset.css">
		<link rel="stylesheet" href="../dist/reveal.css">
		<link rel="stylesheet" href="../dist/theme/black.css" id="theme">

		<!-- Theme used for syntax highlighted code -->
		<link rel="stylesheet" href="../plugin/highlight/monokai.css" id="highlight-theme">
	</head>
	<body>
		<div class="reveal">
			<div class="slides">
				
				<!-- Slide 1: title -->
				<section data-background="branding/background.png">

					<div style="position: fixed; top: 750%; box-shadow: 0 1px 4px rgba(0,0,0,0.5), 0 5px 25px rgba(0,0,0,0.2); background-color: rgba(0, 0, 0, 0.75); color: #fff; padding: 20px; font-size: 20px; text-align: left;">
						<h2>Data ethics in practice</h2>
						<p>Created by <a href="https://josephcrispell.github.io/">Joseph Crispell</a> using <a href="https://revealjs.com/">reveal.js</a></p>
					</div>

					<aside class="notes">
                        Hi everyone<br><br>
                        ...

```

<br>
I've also put a recording of my presentation on [youtube](https://www.youtube.com/embed/vcZUtzn3z70):
<iframe width="100%" height="480" src="https://www.youtube.com/embed/vcZUtzn3z70" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<br>
I'm not great at writing `html`, so it took me a while to get used to the reveal.js framework. Once I did though, I found it amazing and I learnt a lot! 💡

If you're keen to try itself then head over the [reveal.js](https://revealjs.com/) page. Also, here's the [code](https://github.com/JosephCrispell/reveal.js/tree/master/data-ethics-in-practice) for my data ethics presentation on GitHub.
