#!/bin/bash

# Write a shell script that accepts a string and a substring from the user (use read command).
# Then check if the string contains that substring and print a message accordingly.

read -p "Enter the full string: " str
read -p "Enter the substring: " substr

if [[ $str == *"$substr"* ]]; then
    echo "Substring found!"
else
    echo "Substring not found!"
fi
