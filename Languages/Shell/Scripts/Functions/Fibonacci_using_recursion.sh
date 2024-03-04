#!/bin/bash

# Write a shell script that accepts a number greater than 3 and prints the Fibonacci sequence up to that term. YOU MUST USE RECURSIVE FUNCTION.
# Fibonacci series starts with 0 and 1 and the next term is the sum of the previous two terms.
# Check the result with 10 terms which should print 0, 1, 1, 2, 3, 5, 8, 13, 21, 34

read -p "Enter a number greater than 3: " num

if [ "$num" -lt 3 ]; then
    echo "Number must be greater than 3"
    exit
fi

echo -n "Fibonacci series for $num terms is: "

fibonacci () {
    if [ "$1" -le 1 ]; then
        echo -n "$1"
    else
        echo -n $(( $(fibonacci $(($1 -1)) ) + $(fibonacci $(($1 - 2)) ) ))
    fi
}

for ((i = 0; i < $num; ++i)); do
    fibonacci $i
    # Print a space between the numbers except the last one
    if [ "$i" -lt $(($num - 1)) ]; then
        echo -n ", "
    fi
done

echo ""
