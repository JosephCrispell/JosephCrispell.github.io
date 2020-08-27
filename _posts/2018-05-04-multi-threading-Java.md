---
layout: post
title: Multi-threading in Java
date: 04 May 2018
feature-img: "assets/img/blog/multiThreadingInJava/thumbnail.svg"
thumbnail: "assets/img/blog/multiThreadingInJava/thumbnail.svg"
image: "assets/img/blog/multiThreadingInJava/thumbnail.svg" 
tags: [Java, programming, parallel]
---

Today I'm heading to Milan, Italy, to meet up with Joanna, who's been over there for the last couple of days for a meeting. To pass the time in the airport, I wrote this post about multithreading in Java.

Multithreading, as the name suggests, involves running multiple threads. A thread can be thought of as something that can run a single task. Multithreading is using multiple threads to complete multiple tasks in parrallel.

Up until last week I hadn't used any multithreading, but I got stuck trying to speed up some code and I thought it was time to learn. Also I built myself a new computer with 6 cores!

Multithreading in Java is amazingly well supported (although the code below looks pretty daunting) and it uses the `Thread` class. The `Thread` class, like any other Java class, can be modified (extended) to suit a particular task. Here is a general class structure for a task to be completed in parallel:

```java
// Create the class and give it a name
public class MyThread extends Thread{

  // Initialise variables you want to be able to access throughout class here
  public [TYPE] input;

  // Define how the current class can be created
  public MyThread(String name, [TYPE] input){

    // Assign a name to the current thread - using the position
    super(name);

    // Store other inputs here
    this.input = input;
  }

  // Define a run method - this will execute when thread started
  public void run(){

    // Complete your task here - using the inputs provided
    ...
  }

  // Create a method to retrieve whatever your task creates
  public [TYPE] getInput(){
    return this.input;
  }
}
```

Once you've created your `Thread` class, then you need conduct your multithreading. You'll need a different class, which might look something like this:

```java

// Create the class and give it a name
public class MultiThreading{

  // Define your main method - the place where you'll do the multithreading
  public static void main(String[] args){

    // Define the number of threads to be created (if more than number of
    // threads available, Java will automatically queue)
    int numberOfThreads = 4;

    // Initialise an array to store each thread object
    MyThread[] threads = new MyThread[numberOfThreads];

    // Define inputs for the thread to work on here;
    [TYPE] input = new [TYPE] ...;

    // Create each thread
    for(int i = 0; i &lt; numberOfThreads; i++){

      // Create and start the current thread
      threads[i] = new MyThread("thread-" + i, input);
      threads[i].start();
    }

    // Check the threads are finished
    waitUntilAllFinished(threads)

    // Do something with the output from each thread
    for(MyThread thread : threads){
      ...
    }
  }

  // Define a method to check whether threads are finished
  public static boolean finished(MyThread[] threads){

    // Initialise a variable to record whether all finished
    boolean finished = true;

    // Examine each of the threads to see if any aren't finished
    for(ExaminePosition thread : threads){

      // Check if current thread finished
      if(thread.isAlive() == true){

        finished = false;
        break;
      }
    }

    return finished;
  }

  // Define a method to wait until threads finished
  public static void waitUntilAllFinished(MyThread[] threads){

    // Initialise a variable to record whether all threads finished
    boolean allFinished = false;

    // Keep checking the threads until they're all finished
    while(allFinished == false){

      // Check whether all threads finished
      allFinished = finished(threads);
    }
  }
}
```

The above class looks pretty long, but I've added in some extra functions to check and wait until threads are finished. The code I've given is a skeleton for getting started with multithreading in Java. Thanks for reading, and good luck if you're going to be doing some multithreading of your own. I'm off to Milan!
