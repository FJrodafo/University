#!/bin/bash

# Write a shell script in that uses an array to store the names of the seven colors of the rainbow and prints it.
# Use an array to store the seven colors of the rainbow: Violet, Indigo, Blue, Green, Yellow, Orange and Red.

rainbow=("violet" "indigo" "blue" "green" "yellow" "orange" "red")
echo "Colors of the rainbow:" ${rainbow[*]}
