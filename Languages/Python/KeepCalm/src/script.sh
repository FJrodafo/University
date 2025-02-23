#!/bin/bash

# This script runs the Python command to generate a "Keep Calm" image.

python3 ./src/main.py \
    --width 400 \
    --text "keeeep" "caaaalm" "&" "continue" "coding" \
    --bg-colour "coral" \
    --text-colour "black" \
    --output ./src/output/test.png
