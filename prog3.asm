# program 3

# NOTES
# Given array memory locations: 128 - 64
# Hash table memory locations: 0 - 64
# Hash table: 0 offset = key, 1 offset = value
# Global (before end label):
# $s0 = current place in hash table (the end of it)
# $s1 = current index (address) in the array
# Loop_hash:
# $t1 = current loop index
# $c1 = current hash table index
# $c2 = end of hash table (address)
# end:
# $t3 = greatest so far
# $t1 = current index in hash table (address)
# $c2 = end of the hash table
# Global (after end label):
# $s0 = current place in hash table (the end of it)
# $s1 = the number occuring the most


res 0        
cpout $s0    
res 128      
cpout $s1    

loop:
res 160 
cpout $c1                                                                           
cpin $s1 
cpout $c2                                                                          
res end
branch 1 

res 0
cpout $t1 # current place in hash table loop
loophash:
cpin $s0 # if we are at the end of our hash table, make a new entry
cpout $c1
cpin $t1
cpout $c2
res new_entry                                                                      
branch 1

cpin $s1
load $c1
cpin $t1
load $c2
res increment
branch 1
res 3                                                                              
add 1, $t1
cpout $t1
res loophash
cpout $t0
jump $t0

new_entry:
cpin $s1 # index in the array                                                                          
load $t1 # value in the array                                                                          
cpin $c1 # load address of the edge of the hash table
store $t1 # store that at this index                             
res 1
cpout $t2 # t2 = 1 
res 1
add 1, $c1
store $t2                                                                          
res 3
add 1, $c1                                                                            
cpout $s0                                                                          
res 1 
add 1, $s1
cpout $s1                                                                          
res loop
cpout $t0
jump $t0 

increment:
res 1
add 1, $t1 # add 1 to our current place in hash table
cpout $t3
load $t2                                                                           
res 1
add 1, $t2  # increment that value by 1
cpout $t2
cpin $t3
store $t2                                                                          
res 1
add 1, $s1
cpout $s1                                                                          
res loop
cpout $t0
jump $t0

end:
res 0
cpout $t3 # this will keep track of our greatest occurance
res 1
cpout $t1                                                                          

loop_highest:
cpin $s0
cpout $c1
cpin $t1
cpout $c2
res return
branch 1, <
cpin $t1
load $c1
cpin $t3
cpout $c2
res gt
branch 0, > 
res tie
branch 1
res 2
add 1, $t1
cpout $t1                                                                          
res loop_highest
cpout $t0
jump $t0


gt:
cpin $c1 # hash table index of next value
cpout $t3
res 1
add 0, $t1
load $s1 # number occuring the most                                                                          
res 2
add 1, $t1
cpout $t1                                                                          
res loop_highest
cpout $t0
jump $t0

tie:
res 1
add 0, $t1
load $c1                                                                           
cpin $s1                                                                           
cpout $c2
res num1
branch 0, >                                                                        
res num2
cpout $t0
jump $t0

num1:
cpin $c1
cpout $s1
res 2
add 1, $t1
cpout $t1                                                                          
res loop_highest
cpout $t0
jump $t0


num2:
cpin $c2
cpout $s1
res 2
add 1, $t1
cpout $t1                                                                          
res loop_highest
cpout $t0
jump $t0

return:
cpin $s1
cpout $s0
halt

