#!/bin/bash

# Using the example from Concatenate_string.sh replace the word Awesome with Fantastic. Display the contents of the modified string.
# Use merge="${merge/Awesome/Fantastic}"

distro="Arch Linux is cool"
echo $distro

arch=" and Awesome!"
echo 'Merging with " and Awesome!"'

merge=$distro$arch
echo $merge

echo 'Replacing the word "Awesome" with "Fantastic"...'
sleep 2
merge=${merge/Awesome/Fantastic}
echo $merge
