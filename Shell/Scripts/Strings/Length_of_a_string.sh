#!/bin/bash

# Obtain the length of the distro string from Create_a_string.sh
# Add # before the variable name of print the length of any string variable.

distro="Arch Linux is cool"
echo $distro

echo "Length of the above string"
echo ${#distro} "words"
