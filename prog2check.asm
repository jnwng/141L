# s0 will be the number we're taking the factorial of
# s1 will be the current accumlated factorial value.
# t0 will be the return value of multiply
# t1 will be the first argument to multiply
# t2 will be the second argument to multiply
# t3 will be the designated assignment variable.

# First, get our value from address 0
res 0
load $s0

# Initialize the saved accumulator to our first number
cpin $s0
cpout $s1

# <--------- Here's the beginning of the loop
startfac:
# Now we want to multiply the current number we're at ($s1)
# by $(s0) - 1, and store the return value into $s1.

# Let's set our counter down one
res 1
cpout $t3
cpin $s0
add 0, $t3
cpout $s0

# First, let's make sure we're not already at zero
res 0
cpout $c1
cpin $s0
cpout $c2

# If we've finished, go ahead and branch to the end.
res endprog
branch 1

# And now lets place the subsequent values into the requisite registers
# for multiplication

# The first number is the big one
cpin $s1
cpout $t1

# The second number should be $(s0) - 1
cpin $s0
cpout $t2

# And we end this by calling multiply of $(s0) and $(s0) - 1
# Let's also initialize our return to the default, 0
res 0
cpout $t0

res multiply
cpout $t3
jump $t3

# Returning from the multiply
backmultiply:
# Let's store the return value from multiply in our accumulator
cpin $t0
cpout $s1

# And we should be good to loop back up
res startfac
cpout $t3
jump $t3

# End of the program
endprog:
res 15
store $s1
halt


# This should take $t1, multiply it by $t2, and return in $t0
# Since we don't have a multiply operation, we're going to go ahead
# and add $t1 to itself $t2 times. (3*4) = 3 + 3 + 3 +3;
# -----------------------
multiply:

# If we're multiplying by zero, we can return.
res 0 
cpout $c1
cpin $t2
cpout $c2

res endmultiply
branch 1

# Let's go ahead and add once
cpin $t1
add 1, $t0
cpout $t0
  
# We'll use $t2 as our count, and we can go ahead and subtract one
res 1
cpout $t3
cpin $t2
add 0, $t3
cpout $t2

# And now we can loop back up and add again.
res multiply
cpout $t3
jump $t3

# Last loop
endmultiply:
res backmultiply
cpout $t3
jump $t3
