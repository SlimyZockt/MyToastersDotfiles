#!/bin/bash
SELECTED=$(fuzzel -d --prompt-only="Marker: ")

if [ -n "$SELECTED" ]; then
    obs-cmd recording create-chapter "$SELECTED"
fi
