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


# The Setup
res 0           # initialize s0
cpout $s0       #   by setting it to 0
res 128         # initialize s1
cpout $s1       #   by setting it to 128 (starting position of array)

# here we loop through the array, or every element of the given array (32)
# for each value in the array we search through the hash table to see if it 
# already exists, and we increment the number's value (the number is the key 
# in the hash table) by 1. Otherwise a new entry is made for the number.
# We do a check at the beginning to make sure the address of the array (IE 
# its recorded index) is not 64, if it is, the array is finished, and we 
# begin processing the hash table.

loop:
# here we check if the current array index (in $s1) is 64, if so we end the loop
res 64
cpout $c1                                                                           
# This is the address of the end of our array
cpin $s1
cpout $c2                                                                          
# This is the current address we are iterating on
res end
branch 1                                                                           
# if we are currently at the last index in the array we branch to end
# otherwise we check if the number is in our hash table

# we begin at the 0, the first hash table entry, and run through the entire hash table, comparing the value passed in $s1 to our keys.
# if found, we increment the value by 1, if not, we create a new entry
res 0
cpout $t1                                                                         
# this will be our placeholder for this loops place in the hash table
loophash:
# compare the edge of our hash table, to our current place in the loop, if we are at the end of the hash table, the entry was not found, and we 
# make a new entry
cpin $s0
cpout $c1
cpin $t1
cpout $c2
res new_entry                                                                      
# If we have finished searching the hash table, we create a new entry
branch 1
# otherwise we compare the entry in our hash table ($t1) to the array value 
# passed in ($s1) until we find it, and then increment that keys value by 1
cpin $s1
load $c1
cpin $t1
load $c2
res increment
branch 1
# if we do not increment, we move to the next hash table entry
res 2                                                                              
# change our place in the hash table
add 1, $t1
cpout $t1
# else, continue the loop
res loophash
cpout $t0
jump $t0

new_entry:
# here we create a new entry in the hash table, at the end of the current hash table (address stored in $s0), then increment $s0 to mark a new end
# and we put what the value of what is in the address stored in $s1, into the hash table as a key with a value of 1
# we load up the value stored at the index corresponding to what is in $s1
cpin $s1                                                                           
# res is now the address of the current array value
load $t1                                                                           
# t1 is the value of our current int
res $c1
# then we store that as the hash table key
store $t1                                                                          
# store the index at the end of the hash table
res 1
cpout $t2                                                                          
# t2 = 1 
res 1
add 1, $c1
# then we store 1 as the value
store $t2                                                                          
# we have now stored the value 1 next to the key
res 2
# we then increment the hash table size
add 1, $c1                                                                            
# create a new index / end of hash table
cpout $s0                                                                          
# this is the new end of the hash table
res 2
# NEED TO SUBTRACT HERE!
# and move on to the next index of the array, and jump back to the loop
add 0, $s1
cpout $s1                                                                          
# we are now on the next index of the array
res loop
cpout $t0
jump $t0

increment:
# here we are passed the current index we found a match with in the hash table
res 1
add 1, $t1                                                                            
# current place in hash table
cpout $t3
load $t2                                                                           
# $t1 is the value of our hash key
# we get the corresponding value, and add 1 to it, and then store it
res 1
add 1, $t2                                                                            
# increment that value by 1
cpout $t2
cpin $t3
store $t2                                                                          
# store that as the new value
# we increment the current index of the array we are looping through, and jump back into the main loop
res 2
# NEED TO SUBTRACT HERE!
add 0, $s1
cpout $s1                                                                          
# we are not on the next index of the array
res loop
cpout $t0
jump $t0

end:
# we hit this branch if we have finished running through ever element in the array
# $s1 = will now be storing the number occuring the most
res 0
cpout $t3                                                                          
# this will keep track of our greatest occurance
res 1
cpout $t1                                                                          
# this will keep track of our hash table index

loop_highest:
# we loop through our hash table values (offset of 1) to see which one is the highest.
# we have a max counter, that is stored in $t3, if there is a tie, we look at the
# key corresponding to the value and take the higher key otherwise we just store the 
# key corresponding to the highest occuring number in $s1
# if we hit the end of our hash table then we return what is in $s1
# here we return if we finished with out hash table (hit the end address stored in $s0)
cpin $s0
cpout $c1
cpin $t1
cpout $c2
res return
branch 1
# else we compare the value of the current key to see if it occurs more
# if it has a greater value, we reset the max, and save the key
cpin $t1
load $c1
cpin $t3
load $c2
res gt
# if the new value is greater than the current one, store it
branch 0, 2
# if it is equal, store the bigger key
res tie
branch 1
# else, run through loop again
res 2
add 1, $t1
cpout $t1                                                                          
# move onto the next hash table value
res loop_highest
cpout $t0
jump $t0


gt:
# we branch here if we find a hash value, greater than our max, we then save it as the new max, and record the corresponding
# key in $s1
cpin $c1
cpout $t3
res 1
# we subtract to get to the 0 offset to get the key corresponding to the value
# NEED TO SUBTRACT HERE
add 0, $t1
load $s1                                                                           
# this is the number occuring the most times
res 2
add 1, $t1
cpout $t1                                                                          
# move onto the next hash table value
res loop_highest
cpout $t0
jump $t0

tie:
# if we have a tie between max values, we have to choose the key that is larger.
res 1
# NEED TO SUBTRACT HERE
add 0, $t1
load $c1                                                                           
# c1 is the key of this hash entry
cpin $s1                                                                           
# this is currently out winning key
cpout $c2
res num1
# we do a branch, if c1 > c2, we set the $s1 to c1
branch 0, 2                                                                        
# if c1 > c2, set $s1 to $c1
# otherwise we set $s1 to $c2
res num2
cpout $t0
jump $t0
num1:
cpin $c1
cpout $s1
num2:
cpin $c2
cpout $s1
res 2
add 1, $t1
# then we return to the loop
cpout $t1                                                                          
# move onto the next hash table value
res loop_highest
cpout $t0
jump $t0

# finally if we finish running through the hash map, we return the number occuring the most times in $s0
return:
cpin $s1
cpout $s0
halt

