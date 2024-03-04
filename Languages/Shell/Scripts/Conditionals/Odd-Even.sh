#!/bin/bash

# Write a shell script that accepts a positive integer as argument and checks if the number is odd or even and prints "Number X is odd" or "Number X is even" accordingly.
# If there is no argument or more than two arguments or a negative number provided, display an error message: "You have to provide one non negative number".
# Use modulo operator % to check if reminder is 0 or not. $# gives the number.
# For number 182, the output should be "Number 182 is even" and for input 23, the output should be "Number 23 is odd".

if [ $# -ne 1 ] || [ $1 -lt 0 ]; then
    echo "You have to provide one non negative number"
elif [ $(($1 % 2)) -eq 0 ]; then
    echo "$1 is even"
else
    echo "$1 is odd"
fi
