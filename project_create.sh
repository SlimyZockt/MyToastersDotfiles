#!/bin/bash
SELECTED=$(fuzzel -d --prompt-only="New project name: ")

if [ ! -d "$SELECTED"] && [-n "$SELECTED"]; then
    mkdir $SELECTED
    cd $SELECTED
    git init
else
    echo "Error: could not create the project"
fi
