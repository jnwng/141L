# TODO: Check if our add operation does add/subtract based on the signed bit
#
# value initialization
# we store the value at address 1 (count of epar we are looking for) in $s0
res 1               # value in address 1
load $s0            #   is stored in s0

# 32 is initial index of array but loop increments by 1
res 31              # index is 31
cpout $s1            # we store index in $s1

loop:
res 1               # increment index by 1
add 1, $s1             #   we add 1 to res (index)
cpout $s1           #   and copy it back into index

# Checking to see if we are at the last element in our array
res 80              # 80 is the last element in array
cpout $c1           #   so we put it in comparison to check for array end
cpin $s1            # s1 is our index
cpout $c2           #   so we put it 
res end2            #   in the other comparison 
branch 0, <         # is 80 < index, if so then go to end2

# Checking to see if we reached the end
res 0               # res 0
cpout $c2           # put res in $c2
cpin $s0            # put desired num in comparison
cpout $c1           #   we do a check
res end1            #   to see if this number is 0
branch 1            #   because if count=0 we jump to end

# Check array[index]
cpin $s1            # get index in res for load
load $t0            #   then load value at address 32 into $t0
cpin $t0            #   and then put it back into $res

# Checking for even parity of the value we loaded from the array
cpin $s0            # put count in $res
epar $t3            #   check even parity of $res, set $t3 to 1 if so, else 0
add 0, $t3          #   subtract $t3 from count (if even, count - 1)
cpin $s0            #   load count back into $s0

# Loop back
res loop            # set res to loop
cpout $t2           #   so we can jump to it
jump $t2            #   and jump

# End 1 - when we have succeeded in finding the desired num of even parity numbers
end1:
res 96              # endcase, set array index value @ address 96
store $s0
halt

# End 2 - when we finished going through the array and failed.
end2:
res 127             # Get the number 127
cpout $t3           #   put it in a temporary variable
res 96              #   and store it in
store $t3           #   address 36
halt
