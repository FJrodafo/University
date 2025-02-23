#!/bin/bash

# Create an array that stores the first ten prime numbers. Iterate over the array and print out each element inside it.
# If you call the array as prime, ${prime[@]} can be used to find out the size of the prime array.

prime=(2 3 5 7 11 13 17 19 23 29)

for i in "${prime[@]}"; do
    echo $i
done
