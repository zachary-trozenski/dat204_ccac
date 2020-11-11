# Zach Trozenski
# DAT-204 FA20
# Homework 6

""" 
Create an object in the global environment called globVar and assign a value of 1 to it.
Run a for loop 20 times and add 2 to globVar during each iteration.
Check the value of globVar.  Did it update?
Now, reset the value of globVar to 1.
Next, create a function that runs the same loop and then run that function.
Did globVar update this time?
Why or why not?
"""
# create the global variable
globVar <- 1
# create a vector to use as for loop constraint
len <- c(1:20)

# run a for loop using the range of len as the loop constraints
for (i in len){
 globVar <- globVar + 2 
}
# print the value
print(globVar)
# 41

""" 
This ended up working because it directly affected the global variable globVar in place.
There was no copy made and the variable was altered in place.
""" 
# reset the variable to 1
globVar <- 1
# function to take a variable and run a for loop 20 times
glob_func <- function(variable){
  constraint <- c(1:20)
  for (i in constraint){
    variable <- variable + 2
  }
  # option print statement to show local vs global variable behavior
  #print(variable)
}
# call function
glob_func(globVar)
# print globVar value
print(globVar)

"""
This did not work because globVar was a local variable in the function and the global variable was 
not overwritten. I added an optional print statement to the function to print the value of the
local variable which returns 41. But since this is a local variable the global variable remains
unchanged.
""" 
