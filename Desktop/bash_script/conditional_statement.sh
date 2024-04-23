#!/bin/bash
#read -p "What is your login name:" NAME 
#if [ "$NAME" = "$USER" ]
#then
#echo "Hello $NAME, how are you today?"
#else
#echo "You are not $USER so who are you?"
#fi


#another example of conditionals

read -p "Enter a number < 10:" NUMBER

if [ "$NUMBER" -lt 10 ];
then
echo "$NUMBER*$NUMBER=$[$NUMBER*$NUMBER]";
else
echo "Wrong insertion"
fi


