#!/bin/bash

# Pass the sample.txt file as an argument to a script that counts the number of lines and words in the file.

lines=$(wc -l $1 | cut -d ' ' -f 1)
words=$(wc -w $1 | cut -d ' ' -f 1)
echo "Number of lines in $1 are $lines"
echo "Number of words in $1 are $words"
