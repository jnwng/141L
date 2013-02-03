# CSE 141L Lab 2

### Introduction and general comments

### Summary of ISA

Our ISA supports a very simple circuit design, relying on  a single implicit $res register that acts like an accumulator to do most of the heavy lifting. All operations that are implemented: add, branch, load, store, to name a few will use $res in some way shape or form. 


**res: ** Set $res to a 16 bit signed constant.

**Shift: ** Shifts $res by the amount defined by the decimal value of the operand.

**Add: ** Takes one operand register and adds its value into whatever is in $res.

**Load: ** Loads into a register the value at the address specified by $res.

**Store: ** Store into memory location specified by $res whatever value is in the operand register.

**Jump: ** Moves the PC forward or backward the amount specified in the operand register.

**Branch: ** Handles all branching, generally can check for less than, greater than, or equal to. Uses two special 'comparison' registers to do this.


…


### ALU Operations

We expect ____ ALU operations?
- Add
- Subtract (or signed add)
- OR
- ...
