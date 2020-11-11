# Zach Trozenski
# DAT-204 Fall 2020
# Homework 3

# 1A
big <- 2**53
# The the reason it's 53 is because there are 53 bits that can be used. If you
# were to go beyond the bit length then there would have to be some compromise made
# on precision because it couldn't reliably store the extra digits.

# 1B
bigNum1 <- 99999999999999999999999999999999999999999999999999999
bigNum2 <- 99999999999999999999999999999999999999999999999999998
remainder <- bigNum1 - bigNum2
remainder
# No R did not store the value correctly. It should have been one but I suppose that because the
# integer is too big to store, R lost the precision needed to do the operation.

# 1C
new_bigNum1 <- (bigNum1 * 10) + 9
new_bigNum2 <- (bigNum2 * 10) + 18
new_remainder <- new_bigNum1 - new_bigNum2
new_remainder
# No R did not store the number correctly in this instance either. The data loses fidelity as the
# numbers R is trying to work with excite the bit count it can store with precision.

# 2
floats <- c(1.0, 1.2, 1.5, 1.9, 1.99999)
integers <- as.integer(floats)
integers
# R hacked off all the floating numbers after the decimal point. It treats numbers we might
# round up (like 1.9) or down (like 1.2) equally and returns 1.

# 3
longFloat <- 1.9999999999999999999999999999999999999999999
int_float <- as.integer(longFloat)
int_float
# No this time R rounded up to 2. I think this is because the float exceeds the bit allocation
# and R loses precision trying to store the number.
long_float_transform <- (longFloat / 10) + 1.8
long_float_transform
as_int_now <- as.integer(long_float_transform)
as_int_now
# I ended up getting the same result as the previous instance. I think R just loses the ability
# to store values correctly when they get beyond a certain point and the rules under which
# it can operate change when the memory allocation is surpassed.

# 4
# 4a
library(ggplot2)
setwd('~/dat204_ccac/')
student_data = read.csv("Student_Data.csv", stringsAsFactors=FALSE)
#head(student_data)
#?qplot
qplot(x = grade, data = student_data, geom = "histogram", xlab = "Grades", fill=grade)

# 4b
study_session <- sum(student_data[,"study.session"])
total <- length(student_data[,"student.name"])
percent <- study_session / total
nice_percent <- percent * 100
nice_percent

# 4c
genders <- student_data$gender
males <- 0
gender_count <- function(full_col, counter){
  counter + sum(full_col[1:19] == "Male")
}
gender_count(genders, males)
genders
