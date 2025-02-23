#!/bin/bash

# Write a shell script that accepts a number greater than 3 and prints the Fibonacci sequence up to that term. DO NOT USE RECURSIVE FUNCTION.
# Fibonacci series starts with 0 and 1 and the next term is the sum of the previous two terms.
# Check the result with 10 terms which should print 0, 1, 1, 2, 3, 5, 8, 13, 21, 34

read -p "Enter a number greater than 3: " num

if [ "$num" -lt 3 ]; then
    echo "Number must be greater than 3"
    exit
fi

# initialize first and second terms
t1=0
t2=1

#initialize the next term (3rd term)
nextTerm=$(($t1 + $t2))

echo -n "$t1, $t2"

fibonacci () {
    for ((i = 3; i <= $num; ++i)); do
        echo -n ", $nextTerm";
        t1=$t2;
        t2=$nextTerm;
        nextTerm=$(($t1 + $t2));
    done
    echo ""
}

fibonacci $num
