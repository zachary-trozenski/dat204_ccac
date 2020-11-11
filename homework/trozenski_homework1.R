## Zach Trozenski
## DAT-204 - R
## Homework No. 1

## 1A-C
one_a <- ((4^2) + 9) / (13 * 2)
one_b <- (18 + (sqrt(4 + (9^3) ) ) - 9) / (9 ^ 1/3)
one_c <- ((5/4) + 37 - (8^3)) / ((sqrt(5))/(37 + 9))

## 2
## Die 1
d_six <- c(1,2,3,4,6,6)
## Die 2
d_eight <- c(1,2,3,4,5,6,7,8)

## Roll six sided die
tumbling_dice <- function(dice_one, rolls=1){
  sample(dice_one, rolls, replace=TRUE)
}

## Roll eight sided weighted die
roll_for_accuracy <- function(dice_two, roll=1){
  sample(dice_two, roll, replace=TRUE, prob=c(1/12,1/12,1/12,1/12,1/12,1/12,2/12,4/12))
}

## Roll both dice and sum their values
roll_and_sum <- function(six_side, eight_side){
  sum(tumbling_dice(six_side), roll_for_accuracy(eight_side))
}

## Call the sum function
roll_and_sum(d_six, d_eight)

## Problem 3
## sample the roll function from problem no. 2 ten times with replacement
problem_three <- sample(x = roll_and_sum(d_six, d_eight), size = 3, replace=TRUE)

## create a boolean condition to match TRUE if any of the first three samples are >= 13
thirteens <- problem_three[1:3] >= 13

## sum all true conditions
thirteen_sum <- sum(thirteens)

## print the sum of the TRUE conditions
#thirteen_sum

## divide the sum by the ten rolls to produce a probability
probability_of_13_or_more <- (thirteen_sum/3)

## print a nice little statement
print("The probability of rolling greater than thirteen in the first 3 rolls based on a simulation of 10 rolls is:")

## print the probability in this simulation
probability_of_13_or_more

