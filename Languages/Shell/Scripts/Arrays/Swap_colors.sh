#!/bin/bash

# Write a shell script to swap any two colors of the rainbow from the current order as in Rainbow_colors.sh
# Use a temporary variable to store any of the values of wither element before swapping them.

rainbow=("violet" "indigo" "blue" "green" "yellow" "orange" "red")
echo "Colors of the rainbow:" ${rainbow[*]}

echo "Before swapping positions 0 and 4, the colors are arranged as:" ${rainbow[*]}

temp=${rainbow[4]}
rainbow[4]=${rainbow[0]}
rainbow[0]=$temp

echo "After swapping positions 0 and 4, the colors are rearranged as:" ${rainbow[*]}
