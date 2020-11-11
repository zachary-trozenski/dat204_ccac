# Zach Trozenski
# DAT-204 Fall 2020
# Homework #4

# change working directory & import ggplot2
setwd('~/dat204_ccac/')
library(ggplot2)

# load the csv into an object
avocado <- read.csv("avocado.csv")
head(avocado)

# 1a - year vector
for (y in 1:length(avocado$year)){
  years <- unique(avocado$year)
}
years

# 1b - Using a for loop, create a vector that contains the 
# total volume of avocados sold in each year across all regions.

# store length of the dataframe in a variable for cleaner code
df_len <- length(avocado$Total.Volume)
#print(df_len)
fifteen <- 0
sixteen <- 0
seventeen <- 0
eighteen <- 0

# initialize a for loop from first index to last row in dataframe
for (a in 1:df_len){
  # set condition to True year value in index is 2015
  if (avocado$year[a] == 2015){
    # create vector of True values
    fifteen <- c(fifteen, avocado$Total.Volume[a])
  }
  # set condition to True year value in index is 2016
  if (avocado$year[a] == 2016){
    # create vector of True values
    sixteen <- c(sixteen, avocado$Total.Volume[a])
  }
  # set condition to True year value in index is 2017
  if (avocado$year[a] == 2017){
    # create vector of True values
    seventeen <- c(seventeen, avocado$Total.Volume[a])
  }
  # set condition to True year value in index is 2018
  if (avocado$year[a] == 2018){
    # create vector of True values
    eighteen <- c(eighteen, avocado$Total.Volume[a])
  }
  # create a new vector of summed values
  total_values <- c(sum(fifteen), sum(sixteen), sum(seventeen), sum(eighteen))
}

# create new datafram with unique years and total values
totals_df <- data.frame(years, total_values)
totals_df

# 1c
names(total_values) = years
total_values

# 1d
#?qplot
annual_volume_chart <- qplot(x = years, y = total_values, data=totals_df, geom = "line",
                             xlab = "Years", ylab = "Total Volume", 
                             main = "Volume of Avocado Sales by Year", color = total_values)
annual_volume_chart

# 2
head(avocado)
qplot(x = type, y = AveragePrice, xlab = "Type", ylab = "Average Price (USD)",
      data=avocado, geom="violin", facets = year ~ ., color=type) + geom_boxplot(width=0.1)

### Comments ###
# I had a hard time deciding what I wanted to take a look at. But I realized it might be 
# interesting to examine what happened to the average price in each year. I came across
# the violin geom while poking around for a better way to visualize the data and combined
# it with a boxplot to view the quartiles, median, and outliers.
# Right away we see the disparity between organic versus conventional avocados in terms of price.
# It's most pronounced in 2015 but it appears that the prices begin to converge as time passes, 
# getting much closer in 2018. Furthermore we're seeing fewer outliers as time progresses in each
# of the two types. I would hypothesize that this has something to do with markets becoming more
# stable around the demand for the product, as well as organic farming becoming more
# accessible and widespread. 
# It's interesting to me that by 2018 the average price seems to have normalized to a much more 
# stable point than it had been previous. The violin charts for each have short and wide plots 
# which to me indicate a stablized market. However as a fan and avid consumer of the "alligator
# pear" it is absolutely insane that the median price for one single avocado is over $1.
###
