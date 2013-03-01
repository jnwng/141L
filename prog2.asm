
# value initialization
res 0
load $s0  # Load the value at address 0, which is also our count register.
# Start up the saved accumulator register
# Set $s1 to 0
cpout $s1 

factorial:
# Get the value that we pulled from memory
cpin $s0
cpout $c1
# Put 0 in second comparison register
res 0 
cpout $c2

res endfac
# branch if count is 0
branch 1        

# Set $t0 to 1
res 1
cpout $t0

# Get our original counter into $res
cpin $s0 

# res = res - 1
add 0, $t2 
# and then store the result in $t2
cpout $t2       
# Set $t0 back to the original count
cpin $s1        
cpyout $t1
# And jump to multiply branch, with original number in $t1, and num -1 in $t2
# Set our multiply label to $t3
res multiply
cpout $t3
jump $t3

fac1:
cpout $s1       # Save multiply result

res 1
add 0, $s0
cpout $s0 # Subtract 1 from the original count

# Loop back with the count -1 value.
res factorial
cpout $t2
jump $t2

endfac:
res 8
store $s1


multiply:       
# multiply the value in $t1 by the value in $t2
# We want to add $t1 to $t1, $t2 times.
# Result in $t0

# We want to short circuit if the value in $t0 is 1
# Base case 1
res 1
cpout $c1
cpin $t2
cpout $c2

res endmul
branch 1        # If we're multiplying by one, go ahead and return.

# Base case 0
res 0
cpout $c1
cpin $t2
cpout $c2

res endmul2
branch 1        # if $t2 is 0, then return 1 in $res

# Get the accumlated value
cpin $t0
# And add one more copy of the original value
add 1, $t1
cpout $t0       # Accumulator register
# Equivalent to x = x+x

res 1
cpout $t3       # Store 1 in $t3
cpin $t2        # Get count
add 0, $t3  # Subtract one from count
cpout $t2       # Set count to result

# We've done one iteration, now add this number again.
res multiply
cpout $t3
jump $t3

endmul: 
# We multiplied by one at some point, send through the accumulated value in $t0 in $res
res fac1
cpout $t3
cpin $t0
jump $t3

endmul2:
# we multiplied by zero. This shouldn't happen, so we're sending out 1 in res.
res fac1
cpout $t3
res 1
jump $t3