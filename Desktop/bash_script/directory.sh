#!/bin/bash

#Author: Desokan segun yusuf

#Create a diretory named test00 inside /tmp and 3 blank files file01, file02, and file03 inside it and list them, then delete the file03 and print the time after deletion of the file

TIME=`date`

mkdir /tmp/test00
cd /tmp/test00
echo Test00 directory has been created
touch file01 file02 file03 
echo 3 files has been created
ls -l
rm -i /tmp/test00/file03
ls -l
echo filoe03 was deleted $TIME 
    
