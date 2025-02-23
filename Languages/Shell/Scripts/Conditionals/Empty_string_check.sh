#!/bin/bash

# Write a shell script that prompts user to enter a string (if user wants) and then checks if the input string is empty or not.
# Either use the negation -n or -z to check the if size is zero.

read -p "Enter a string (if you want): " str

if [ -z "$str" ]; then
    echo "Empty string"
else
    echo "String is not empty"
fi
