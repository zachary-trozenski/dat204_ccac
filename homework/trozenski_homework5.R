# Zach Trozenski
# DAT-204 FA20
# Homework #5

#1
# initiate the vector
s <- seq(from=2, to=98, by=3)
# A
# slice the first 5 values from the vector
a <- s[1:5]
print(a)

# B
# Create a new vector of slices
b <- c(s[1], s[3], s[10], s[21])
print(b)

# C
# create a negative subset vector and slice the vector
c <- -c(2, 18, 32)
new_c <- s[c]
print(new_c)

# D
# create an empty vector
even <- vector()
# intiate a loop over the vector and append vector with values where the statement
# 'if i modulo 2 is zero' is True
for (i in s) {if (i %% 2 == 0){even <- c(even, i)}}
print(even)

#2
# initiate variables
A = TRUE
B = TRUE
C = FALSE
D = TRUE

#i
A | B
# True

#ii
xor(A, B)
# False

#iii
(A & C) | D
# True

#iv
(A | D) & C
#False

#v
!(A &C)
# True

#vi
!(A & B) | B
# True

#3
# initiate master vector
numbers <- c(1:1000)
# intiate n/2 vector
eratos <- c(1:500)
# intiate empty vector
removal <- vector()
# create sieve loop: 
#initiate for loop to run over master number vector

# Hi Coral, I tried to figure this out but I can't get a handle on this.
# This is some pseudo ish code of what I was trying to do but I couldn't make it
# work. It's probably too Pythonic but I'm lost otherwise.

for (num in numbers[2:1000]) {
     if (num * 2 %in% numbers) {
         removal <- -c(removal, num)
       }
     }
numbers[removal]
print(numbers)







