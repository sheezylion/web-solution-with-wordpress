#!/bin/bash

#Author: Adesokan segun yusuf

#you can use let to declare variables in linus. Example below:

let X=20+2*8
let Y=X*9+2-65

echo The answer to X = $X
echo The answer to y = $Y

#Another way to declare variable without using let in mathematical operation
let VALUE="$[45-20]"
let P="$[VALUE+20]"

echo The result of VALUE = $VALUE
echo The result of P = $P

#The third way is to use double bracket
let Q="$((23*8))"
echo The result for Q = $Q
