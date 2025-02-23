#!/bin/bash

# Write a shell script in that accepts a command as argument and gives the location of its binary file:

location=$(which $1)
echo "Location of the binary of the command $1 is $location"
