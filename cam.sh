#!/bin/bash
CAMERA_DIR="$HOME/Videos/Camera"
SELECTED=$(ls "$CAMERA_DIR" |  sed 's/\.[^.]*$//' | fuzzel -d --prompt="Camera Recording:")

if [ -n "$SELECTED" ]; then
    scrcpy --video-source=camera --camera-size=3840x2160 --camera-fps=60 --v4l2-sink=/dev/video0 --no-audio --record="$CAMERA_DIR/$SELECTED".mkv
fi
