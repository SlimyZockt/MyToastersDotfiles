#!/bin/bash
SELECTED=$(fuzzel -d --prompt="Marker: ")

if [ -n "$SELECTED" ]; then
    obs-cmd recording create-chapter "$SELECTED"
fi
