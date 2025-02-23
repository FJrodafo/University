#!/bin/bash

# Use an until loop that will print the first ten multiples of the number four.
# An until loop will keep running as long as the test condition is false, just opposite to a for loop.
# Negation of the test condition [ $num -le 10 ] (as used in for loops); is [ $num -gt 10 ] .

num=1

until [ $num -gt 10 ]; do
    echo $(($num * 4))
    num=$(($num+1))
done
