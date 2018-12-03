par(mar=c(5.1, 4.1, 0, 2.1)) # Bottom, left, top, right

# Set the margins
par(mar=c(0,0,0,5))

# Generate seom example points
values <- rexp(n=150, rate=2)

# Create a boxplot for the rainfall in January across all years
boxplot(values,
        xlab="",  ylab="", yaxt="n", xaxt="n",
        frame=F, las=1, pch=19)

stripchart(values, vertical=TRUE, jitter=0.2,
           method="jitter", add=TRUE, pch=19, col=rgb(1,0,0, 0.5))

# Calculate the median rainfall
median <- median(values)

# Add median label
arrows(x0=1.35, x1=1.21, y0=median)
text(x=1.35, y=median, labels="Median", col="blue", pos=4)

# Calculate the quartiles of the distribution
quartiles <- quantile(values)

# Add quartile labels
arrows(x0=1.35, x1=1.21, y0=quartiles[2])
text(x=1.35, y=quartiles[2], labels="25% quartile", col="red", pos=4, xpd=TRUE)
arrows(x0=1.35, x1=1.21, y0=quartiles[4])
text(x=1.35, y=quartiles[4], labels="75% quartile", col="red", pos=4, xpd=TRUE)

# Calculate the position of the whiskers
whiskerInfo <- identifyWhiskersAndOutliers(values, quartiles)

# Add whisker labels
arrows(x0=1.35, x1=1.21, y0=whiskerInfo$Lower[1])
text(x=1.35, y=whiskerInfo$Lower[1], labels="Lower fence", col="purple", pos=4, xpd=TRUE)
arrows(x0=1.35, x1=1.21, y0=whiskerInfo$Upper[1])
text(x=1.35, y=whiskerInfo$Upper[1], labels="Upper fence", col="purple", pos=4, xpd=TRUE)

# Add outlier labels
labelOutliers(whiskerInfo$Upper)
labelOutliers(whiskerInfo$Lower)

#### FUNCTIONS ####

# Function to label outliers
labelOutliers <- function(values){
  
  for(i in seq_along(values)){
    
    # Ignore the first value - that indicates the upper fence
    if(i > 1){
      arrows(x0=1.35, x1=1.21, y0=values[i])
      text(x=1.35, y=values[i], labels="Outlier", pos=4, xpd=TRUE)
    }
  }
}

# Function to identify whiskers
identifyWhiskersAndOutliers <- function(values, quartiles, range=1.5){
  
  # Initialise a vector to store the whikser positions and outliers
  whiskerInfo <- list("Upper"=c(max(values)), "Lower"=c(min(values)))
  
  # Calculate the inter-quartile-range
  interQuartileRange <- quartiles[4] - quartiles[2]
  
  # Check if there are values above the 4th quartile + interquatilerange * range
  if(whiskerInfo$Upper[1] > quartiles[4] + (range * interQuartileRange)){
    
    # Sort the input values
    sortedValues <- sort(values, decreasing=TRUE)
    
    # Examine each of the sorted values
    for(i in seq_along(sortedValues)){
      
      # If found the first value that is less than or equal to the 4th quartile + range * interquartilerange
      if(sortedValues[i] <= quartiles[4] + (range * interQuartileRange)){
        whiskerInfo$Upper <- c(sortedValues[i], sortedValues[seq_len(i-1)])
        break
      }
    }
  }
  
  # Check if there are values below the 2nd quartile - interquatilerange * range
  if(whiskerInfo$Lower[1] < quartiles[2] - (range * interQuartileRange)){
    
    # Sort the input values
    sortedValues <- sort(values, decreasing=FALSE)
    
    # Examine each of the sorted values
    for(i in seq_along(sortedValues)){
      
      # If found the first value that is less than or equal to the 4th quartile + range * interquartilerange
      if(sortedValues[i] >= quartiles[2] - (range * interQuartileRange)){
        whiskerInfo$Lower <- c(sortedValues[i], sortedValues[seq_len(i-1)])
        break
      }
    }
  }
  
  return(whiskerInfo)
}
