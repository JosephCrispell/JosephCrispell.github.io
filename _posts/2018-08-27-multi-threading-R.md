---
layout: post
title: Multi-threading in R
date: 27 Aug 2018
feature-img: "assets/img/blog/multiThreadingInR/thumbnail.svg"
thumbnail: "assets/img/blog/multiThreadingInR/thumbnail.svg"
image: "assets/img/blog/multiThreadingInR/thumbnail.svg" 
tags: [R, programming, parallel]
---

Whilst I wait for a set of around sequences to be processed, I thought I would remind myself how to do multithreading in R. 

Multithreading basically means running multiple tasks at the same time. It is also called parallel programming. Most modern computers come with multiple cores: dual-core, quad-core, etc... Unfortunately, these cores aren't often used, I especially don't! 👀

Any independent task that you have to do alot should be multithreaded. For example, today I've randomly generated a large set of nucleotide sequences using this function:

```R
createRandomNucleotideAlignment <- function(n, length){

  # Initialise a dataframe to store the sequences
  sequences <- list()

  # Create each sequence
  for(i in 1:n){

    # Randomly sample nucleotides to create a sequence of nucleotides
    nucleotides <- sample(c('A', 'C', 'G', 'T'), size=length, replace=TRUE)

    # Collapse the vector of characters (nucleotides) into single string
    sequences[[i]] <- paste(nucleotides, collapse="")
  }

  return(sequences)
}
```
The above function samples from the nucleotides `c('A', 'C', 'G', 'T')` to generate a random sequence that is then stored in a `list` called `sequences`.

My task is to count the numbers of `A`s, `C`s, `G`s, and `T`s in each of a set of randomly generated sequences. Each sequence is independent and so the counting of the nucleotides in each could be done simultaneously.

So let's get started with multithreading in R!
  
```R
# Load the parallel library
library(parallel)

# Get the number of threads in the current machine
nThreads <- detectCores()

# Initialise the cluster of threads
clusterOfThreads <- makeCluster(nThreads)

# Register the cluster of threads
registerDoParallel(clusterOfThreads, cores=nThreads)
```

There is a little bit of set up! Firstly, I'm using the `parallel`, so that needs to be loaded. Then I used `detectCores()` function to find out how many threads I have on my computer (12). Then I use `makeCluster()` and `registerDoParallel()` to make and register my cluster of threads.

Next I wrote a simple function that, given a sequence, will count the number of times each nucleotide is present:
  
```R

calculateNucleotideFrequencies <- function(sequence){

  # Initialise a list to store the nucleotide counts
  frequencies <- list('A'=0, 'C'=0, 'G'=0, 'T'=0)

  # Split the sequence into its nucleotides
  nucleotides <- strsplit(sequence, split="")[[1]]

  # Count the number of times each nucleotide appears in the given sequence
  for(nucleotide in nucleotides){
    frequencies[[nucleotide]] <- frequencies[[nucleotide]] + 1
  }

  return(frequencies)
}
```

With the above function, the sequence is split back into nucleotides, and then each nucleotide is examined and the appropriate count is increased. I used a `list` to store the counts, so that I could each nucleotide as a key.

So we've initialise our cluster and we've got a couple of functions `createRandomNucleotideAlignment()` and `calculateNucleotideFrequencies()` to create and examine a set of sequences. So here's how to count those nucleotides in parallel:
  
```R
# Create a random set of nucleotide sequences
sequences <- createRandomNucleotideAlignment(300, 100000)

# Use multiple threads to count how many times each nucleotide appears in each sequence
frequences <- clusterApply(cl=clusterOfThreads,
                           x=sequences,
                           fun=calculateNucleotideFrequencies)

# REMEMBER to close the cluster of threads
stopCluster(clusterOfThreads)
```

The `clusterApply()` function will automatically assign each of the sequences in `sequences` to a 100 threads, 12 of which will be run straight away and the rest will be queued. A list of nucleotide frequencies is returned, with each position corresponding the sequence in the same position of `sequences`.

I spent ages trying to think of a good example to demonstrate the ability of multithreading, and I don't really think I found one! Here, I created very large sequences and with these large sequenes it is faster to count the nucleotides on multiple threads. 

Regardless of the example, hopefully what I have demonstrated here is that multithreading in R is very easy and I should be doing it more often!! All of the above R code is available [here](https://github.com/JosephCrispell/GeneralTools/blob/master/MultithreadingInR_27-08-18.R).
