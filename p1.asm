# TODO: Check if our add operation does add/subtract based on the signed bit
#
# value initialization
# we store the value at address 1 (count of epar we are looking for) in $s0
res 1
load $s0

# 32 is initial index of array but loop increments by 1 and 0 indexed
res 30
cpin $s1            # index is 32

loop:
res 1               # increment index by 1
add $s1
cpout $s1           # so now index = index + 1

res 96              # check to see if we are at the end
cpout $c1           
cpin $s1
cpout $c2
res end2            

branch 0, <         # 96 < ? then end2

res 0
cpout $c2
cpin $s0            # put count in comparison
cpout $c1
res end1
branch 1            # if count=0 jump to end

res 32
cpout $t0
load $t0            # load value at address 32 into $t0
cpin $t0            # load value at address 32 into $res

cpin $s0            # put count in $res
epar $t3            # check even parity of $res, set $t3 to 1 if so, else 0
add -, $t3          # subtract $t3 from count (if even, count - 1)
cpin $s0            # load count back into $s0

res loop
cpout $t2
jump $t2

end1:
res 95              # endcase, set array index value @ address 96
store $s0

end2:
res 127             # endcase2, set 127 to value @ address 96
cpin $t3
res 95
store $t3
