#!/bin/bash

# Find the position (index) where the letter o first occurs in the string merge from Concatenate_strings.sh
# Use expr index "$merge" followed by the word you want to find the index of.

distro="Arch Linux is cool"
echo $distro

arch=" and Awesome!"
echo 'Merging with " and Awesome!"'

merge=$distro$arch
echo $merge

wPosition=$(expr index "$merge" w)

echo 'The letter "w" in the new string first occurs at position: index' $wPosition
