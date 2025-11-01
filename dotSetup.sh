#!/usr/bin/env bash

pushd ~/.config/

dotfiles=(
"niri"
"hypr"
"waybar"
"wezterm"
"fish"
"ghostty"
"fuzzel"
"tms"
"gtk-4.0"
"gtk-3.0"
)

for i in "${dotfiles[@]}"
do
    rm -rf ./"$i"
done

popd

