#!/bin/bash

# Write a shell script that prints the multiplication table of a given number using a function.
# Use for loop for a more effective script.

read -p "Enter a number: " num

table () {
    for i in {1..10}; do
        echo $(($1*$i))
    done
}

table $num
