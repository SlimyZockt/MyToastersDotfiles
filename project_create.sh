#!/bin/env bash
SELECTED=$(fuzzel -d --prompt-only="New project name: ")
PROJECT_PATH=$HOME/Documents/$SELECTED/

if [ -n "$SELECTED" ] && [ ! -d "$PROJECT_PATH" ] ;then
    mkdir -p $PROJECT_PATH
    cd $PROJECT_PATH
    git init
    echo "Created the project $SELECTED in $PROJECT_PATH"
else 
    echo "Error: could not create the project $SELECTED in $PROJECT_PATH. Project already exists."
fi
