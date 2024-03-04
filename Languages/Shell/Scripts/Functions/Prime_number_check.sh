#!/bin/bash

# Write a shell script that accepts a number and check if it is primer or not using a function.
# Prime numbers are only divisible by 1 and the number itself. 23 is prime, 21 is not prime. 1 and 2 are also considered prime.

read -p "Enter a number: " num

isPrime () {
    for((i=2; i<=num/2; i++)); do
        if [ $((num%i)) -eq 0 ]; then
            echo "$num is not a prime number"
            exit
        fi
    done
    echo "$num is prime number"
}

isPrime $num
