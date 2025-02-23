#!/bin/bash

echo -n "Please insert your input: "

while read line; do
    echo -n "$line" | wc -c
    if [ -z "$line" ]; then
        break
    else
        echo -n "Please insert your input: "
    fi
done
