#!/bin/bash
MARKER_DIR="$HOME/Videos/Markers"
SELECTED=$(ls "$MARKER_DIR" | fuzzel -d --prompt="Marker File: ")

if [ -n "$SELECTED" ]; then
    /home/myt/.local/bin/MarkTool "$MARKER_DIR/$SELECTED"
fi
