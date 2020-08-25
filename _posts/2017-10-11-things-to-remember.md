---
layout: post
title: Things to remember
date: 11 Oct 2017
feature-img: "assets/img/blog/thingsToRemeber/thumbnail.svg"
thumbnail: "assets/img/blog/thingsToRemeber/thumbnail.svg"
image: "assets/img/blog/thingsToRemeber/thumbnail.svg" 
tags: [remember, programming]
---


Today I am on the train to Belfast to meet with collaborators at the
<a href="https://www.afbini.gov.uk/">AFBINI</a>. To pass the time I am taking advantage of
the free wifi to add a post to store some useful pieces of code I always forget.

I am always forgetting simple coding solutions that I need often; I constantly find myself
googling something I had looked up just a few days before and the top links are always purple
(visited).

Below are some of the commands that I most frequently forget, although I find them extremely
useful:

- Unpacking a file whose name ends with ".tar.gz" in Ubuntu

```bash
# Options used:
# x    Extract files in tar
# v    Verbose - print out progress information
# z    Unzip file (Use if file ends with ".gz")
# f    Filename will follow
tar -xvzf fileName.tar.gz
```

- Reading a table into R whilst avoiding some annoying R habits

```R
# Options used:
# header=TRUE    There will be column titles in first line of file
# stringsAsFactors=FALSE    Don't convert strings (words/names) into factors (categories)
# check.names=FALSE    Don't let R run checks on column names
# Note that check.names = TRUE removes spaces and special chracters - USE WISELY!
tableName <- read.table(fileName, header=TRUE, stringsAsFactors=FALSE, check.names=FALSE)
```

- Read a file into R line by line (only feasible for small file!)

```R
# Open a connection to a file to read (open="r")
connection <- file(fileName, open="r")

# Get all lines from file and store in vector
fileLines <- readLines(connection)

# Close file connection
close(connection)

# Loop through each of the lines in file
for(line in fileLines){
    ...
}
```

- Set the plotting margin sizes in R

```R
# Setting margin sizes: c(bottom, left, top, right)
par(mar=c(5.1, 4.1, 4.1, 2.1))
```

- Initialise array of zeros in perl

```perl
# Initialise an array of 10 zeros
my @arrayName = (0) x 10;
```

- Remove special characters from string in perl

```perl
my $stringName = "Some string";
$stringName =~ s/\R//g;
```
	
- Change path to Java jre for Eclipse after Java update - not a piece of code but useful for Java coding!

    * Edit the `C:/Program Files/Java/jre1.X.X_X/bin` line in `eclipse.ini` file. 
    * The eclipse.ini file can be found in the `C:\Users\Joseph Crispell\eclipse\java-mars\eclipse\` folder on my Windows machine
	* NOTE: if you remove this line and the line (`-vm`) before, you'll never have to do this again!

- Change the amount of memory assigned to heap space for the Java virtual maachine used in Eclipse. The heap space is the memory used in the creation and removal of variables - I think!

    * Edit the two lines beginning `-Xm` in eclipse.ini file
    * `-Xms` refers to the initial amount of memory to assign to the heap space
    * `-Xmx` refers to the maximum amount of memory to assign to the heap space

- Function to change the alpha value of colour in R

```R
setAlpha <- function(colour, alpha){

    # Convert the input colour into rgb values
    rgbValues <- col2rgb(colour)

    # Place rgb values within rgb function and insert alpha value
    # Note that col2rgb returns rgbvlues from 0 to 255
    rgbColour <- rgb(rgbValues["red", 1], rgbValues["green", 1], rgbValues["blue", 1], alpha=alpha*255, maxColorValue=255)

    return(rgbColour)
}
```

- Get current date in R

```R
today <- format(Sys.Date(), "%d-%m-%y")
```

- Laying out plots in R

```R
# Set the layout of the plots within the plotting window
layout(matrix(c(1,1,3,2), nrow=2, ncol=2, byrow=TRUE))

# Set the margin sizes
par(mar=c(0.5,0.5,0.5,0.5))

# Create the plots
for(i in 1:3){
    plot(x=NULL, y=NULL, xlim=c(0,1), ylim=c(0,1), xaxt="n", yaxt="n", xlab="", ylab="")
         text(x=0.5, y=0.5, labels=i, cex=5)
}
```
![plot layout]({{ "/assets/img/blog/thingsToRemeber/plottingLayout.png" | relative_url}})

- Syncing a github repository

```bash
git add *
git add . -A # Removes deleted files
git commit -m "Write commit message here"
git push
```

- Get axis limits of current plot in R

```R
# Returns vector: c(xMin, xMax, yMin, yMax)
axisLimits <- par("usr") 
```

- Overwriting your progress statements in R using `\r`

```R
# Initialise for loop to demonstrate progress printing
 for(i in 1:100){

    Sys.sleep(0.1)
    cat(paste("\rFinished step ", i, " of ", n))
}
```
