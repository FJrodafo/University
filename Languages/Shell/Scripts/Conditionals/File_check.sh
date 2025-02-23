#!/bin/bash

# Write a shell script that checks whether a file exists or not. For the simplicity, keep the full file path in the script directly.
# -f allows you to check for file.
# Check the result by creating a file with the given path in the script. Run the script and check. Delete the file and check again.

FILE=$HOME/sample.txt

if [ -f "$FILE" ]; then
    echo "$FILE exists"
else
    echo "$FILE doesn't exist"
fi
