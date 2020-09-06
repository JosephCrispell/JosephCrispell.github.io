---
layout: post
title: Creating a progress bar in R
date: 04 Jun 2019
feature-img: "assets/img/blog/progressBar/thumbnail.gif"
thumbnail: "assets/img/blog/progressBar/thumbnail.gif"
image: "assets/img/blog/progressBar/thumbnail.gif" 
tags: [R, progress, basicPlotteR]
---

We've all been stuck waiting for a `for` loop to finish, or a particularly complex function. Over the years I have come across a few revelations when it comes to tracking the progress of my <a href="https://www.r-project.org/">R</a> code. Here they are in the order I found them!

1. The `print()` function

```R
for(i in 1:500){
  
	# Sleep for 0.1 seconds
	Sys.sleep(0.01)
  
	# Print progress
	print(paste("Finished", i, "of", n))
}  
```
![print]({{ "assets/img/blog/progressBar/for_loop_with_print.gif" | relative_url}})

2. The `cat()` function

```R
for(i in 1:500){
 
	# Sleep for 0.1 seconds
	Sys.sleep(0.01)

	# Print progress
	cat("Finished", i, "of", n, "\n")
}
```
![cat]({{ "assets/img/blog/progressBar/for_loop_with_cat.gif" | relative_url}})

3. The modulus operator (`%%`)

```R
for(i in 1:500){
  
	# Sleep for 0.1 seconds
	Sys.sleep(0.01)

	# Print progress
	if(i %% 100 == 0){
		cat("Finished", i, "of", n, "\n")
	}
}
```
![modulus]({{ "assets/img/blog/progressBar/for_loop_with_cat_and_modulus.gif" | relative_url}}) 

4. Overwriting a printed line using `\r`

```R
for(i in 1:500){
  
	# Sleep for 0.1 seconds
	Sys.sleep(0.01)

	# Print progress
	cat("\rFinished", i, "of", n)
}
```
![overwrite]({{ "assets/img/blog/progressBar/for_loop_with_cat_and_overwriting.gif" | relative_url}}) 

5. My new `progress()` function 😊

```R
library(basicPlotteR)

for(i in 1:500){
  
	# Sleep for 0.1 seconds
	Sys.sleep(0.01)

	# Print progress
	progress(i, n)
}
```
![overwrite]({{ "assets/img/blog/progressBar/for_loop_with_progress.gif" | relative_url}}) 

6. R already has one!!!! 😱

```R
# Initialise a progress bar
pb <- txtProgressBar(min = 1, max = n, style = 3)

for(i in 1:500){
  
	# Sleep for 0.1 seconds
	Sys.sleep(0.01)

	# Print progress
	setTxtProgressBar(pb, i)
}
close(pb)
```
![overwrite]({{ "assets/img/blog/progressBar/for_loop_with_baseRprogress.gif" | relative_url}}) 

Each of the methods of monitoring your progress are useful in different situations. Whilst the last two options look great, they are only useful inside `for` loops. The `\r` blew my mind and should work in most languages! The modulus (`%%`) is probably the one I use the most, allows me to check my progress without printing hundreds or thousands of lines to the screen.

Anyone who would like to use and see the code for my `progress()` function, you'll find it [here](https://github.com/JosephCrispell/basicPlotteR/blob/master/R/progress.R) on github. It is part of my [basicPlotteR](https://github.com/JosephCrispell/basicPlotteR) package.
