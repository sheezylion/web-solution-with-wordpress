#!/bin/bash

#Author: Adesokan segun

#Write a shell script to botain user's name and age from input and print the year when the user would be 50 years 

let CUR_YEAR=`date +"%Y"`
#echo -n "Enter your name: "
#read NAME
#echo -n "Enter you age: "
#read AGE
read -p "What is your name: " NAME
read -p "What is your age: " AGE
let FUT_YEAR=(50-$AGE)+$CUR_YEAR
echo "hello $NAME i will be 50 years old in $FUT_YEAR"

