#!/bin/bash

# Write a shell script that checks if a given number is positive or negative using a function.
# Use read command to accept input from user.

read -p "Enter a number: " num

isPositive () {
    if [ "$num" -lt 0 ]; then
        echo "$num is negative"
    elif [ "$num" -gt 0 ]; then
        echo "$num is positive"
    elif [ "$num" -eq 0 ]; then
        echo "$num is positive"
    else
        echo "$num is not a number..."
    fi
}

isPositive $num
