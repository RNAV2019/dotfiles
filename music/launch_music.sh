#!/bin/bash

# Launch CAVA (Tiling) - suppressing all terminal output
ghostty --class=com.ghostty.cava -e cava &>/dev/null &

# Launch FUM (Floating) - suppressing all terminal output
ghostty --class=com.ghostty.fum -e fum &>/dev/null &

# Disown the processes so they don't stay attached to your current terminal
disown
