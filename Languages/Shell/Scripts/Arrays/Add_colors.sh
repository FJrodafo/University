#!/bin/bash

# Write a shell script to add an 8th color to the rainbow array described in Rainbow_colors.sh Let's say magenta.
# Use rainbow+=("magenta") to add the 8th color.

rainbow=("violet" "indigo" "blue" "green" "yellow" "orange" "red")
echo "Colors of the rainbow:" ${rainbow[*]}

sleep 2

rainbow+=("magenta")
echo "Adding an eighth color "magenta" to this rainbow..coz why not?"

sleep 2

echo "New rainbow:" ${rainbow[*]}
