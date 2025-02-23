#!/bin/bash

# Write a shell script in that prints the number of colors of the rainbow from Rainbow_colors.sh
# Use echo ${#rainbow[@]} where rainbow is the name of the array.

rainbow=("violet" "indigo" "blue" "green" "yellow" "orange" "red")
echo "Colors of the rainbow:" ${rainbow[*]}
echo "Number of colors of this rainbow:" ${#rainbow[@]}
