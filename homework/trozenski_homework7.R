# Zach Trozenski
# DAT-204 FA20
# Homework 7

## 1a - T(n) = (n^2 + n) / 2
# Use a loop to generate a vector with the first 20 elements in the series

# initialize the vector to run in for loop
twenty <- c(1:20)
# create for loop over vector 'twenty'; run the equation for each number in the vector; print output
one_ey <- for (n in twenty){
    num <- (n**2 + n) / 2  
    # cat the output
    cat(num)
    cat(" ")
}

## 1b
## Use another loop to create another vector with only the even elements from the vector from a.

# initialize the vector to run in for loop
twenty <- c(1:20)
# create for loop over vector 'twenty'; if number in vector is even run the equation; print output
one_bee <- for (n in twenty){
  if (n %% 2 == 0){
    num_2 <- (n**2 + n) / 2  
    # cat output
    cat(num_2)
    cat(" ")
  }
}

## 1c
## Generate the answers to a and b without using a loop
# start with number 1
number <- c(1:20)
# create empty vector
anti_loop <- vector()
# pass the number vector through the empty vector assignment since it will go one by one
anti_loop <- c(anti_loop, ((number**2) + number) / 2)
# print the values from the vector (this vector == 1a)
print(anti_loop)

# create a slicing statement to pull the even values
even_nums <- anti_loop %% 2 == 0
# slice the vector by the conditional even number statement variable
even_vector <- anti_loop[even_nums]
# print the vector
print(even_vector)


## 2a
## Create a vector of length 20 where the first value is 1 and each value after 
## that is three times the preceding value minus 1.  
## That is, V_1=1 and V_n=3V_(n-1)-1 for every V_n after V_1

# initialize the empty vector
num_vec <- vector()
# initialize starting value
start <- 1
repeat{
  # write equation and store output in variable
  i <- (3 * start) - 1
  # add the variable to a vector
  num_vec <- c(num_vec, i)
  # increase the size of the 'n' value
  start = start + 1
  # create the break statement
  if (length(num_vec) == 20){
    break
}
}
# print the vector
print(num_vec)  

## 2b
## Loop through the vector to change all odd elements to even by adding 1.  
## Do not change the elements that are already even
copy_of_vec <- num_vec
for (i in copy_of_vec){
  if (i %% 2 != 0){
    i = i +1
  }
  cat(i)
  cat(" ")
}

## 2c
# create a logical vector based on the condition of odd numbers
log_vec <- copy_of_vec %% 2 != 0
print(log_vec)
# slice the original vector by the logical vector and add one to each odd number
copy_of_vec[log_vec] <- copy_of_vec[log_vec] + 1
# print the new vector
print(copy_of_vec)

## 2d
# I preferred the loop but in terms of which is better, I might err on the side of logical
# vector slicing. It's much more terse in terms of the coding required and there are fewer
# moving parts to complicate the code. I would be curious to see on the computing side
# which method was more efficient.

## 3
#Using the superbowl.csv data, create a function called winCount() that receives an NFL team 
#as a character string and returns the number of wins that team has had.  
#If the team provided is not on the list of winners, 
#the function should return “Sorry, that team has not won yet.” 

# find which directory is referenced
print(getwd())

# change the directory so we can use the csv
setwd("/Users/zack/dat204_ccac/")

# load the libraries
library(stringr)
library(tools)

# load the csv file
superbowl <- read.csv('superbowl.csv')

# let's check it out
head(superbowl)

# extract list of unique winning teams for context
print(winning_team <- unique(superbowl$Winner))

# start function
supa_bowl <- function(){
  # solicit user input
  user_value <- readline(prompt = "Please enter the full name of an NFL team: ")
  # create a vector of all the NFL teams by gettin unique winners, losers, and those that
  # haven't made it yet
  all_teams <- c(unique(superbowl$Winner), unique(superbowl$Loser), 
                 "Cleveland Browns", "Detroit Lions", "Jacksonville Jaguars", "Houston Texans")
  # input validation to catch typos, non NFL teams, or garbage
  while (!(tolower(user_value) %in% tolower(all_teams))){
    user_value <- readline(prompt = "Please enter the full name of an NFL team: ")
  }
  # extract a list of winners
  winners <- tolower(unique(superbowl$Winner))
  # if the user input matches a winning team return the following:
    if (tolower(user_value) %in% winners) {
      # cat the team given
      cat("The")
      cat(" ")
      cat(toTitleCase(user_value))
      cat(" ")
      cat("have won the superbowl")
      cat(" ")
      # sum all the times the input team has been in the winner column
      cat(sum(tolower(superbowl$Winner) == user_value))
      cat(" ")
      cat("times.")
    }
    else {
      # if the input team has not won, print this
      cat("Sorry, that team has not won yet. But there's hope yet!")
    }
}

supa_bowl()

??qplot
