#!/bin/bash

# Write a shell script that checks whether the provided number is +ve or -ve.
# 0 is considered +ve in this situation even though it is technically a non-negative number.

read -p "Enter a number: " num

if [ "$num" -lt 0 ]; then
    echo "$num is negative"
elif [ "$num" -gt 0 ]; then
    echo "$num is positive"
elif [ "$num" -eq 0 ]; then
    echo "$num is positive"
else
    echo "$num is not a number..."
fi
