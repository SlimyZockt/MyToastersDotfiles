#!/usr/bin/env bash

scrcpy --video-source=camera --camera-size=3840x2160 --camera-fps=60 --v4l2-sink=/dev/video0 --no-audio --record="/home/myt/Videos/$1.mkv"


