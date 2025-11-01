#!/usr/bin/env bash

BASH_DIR=$(dirname "$(realpath $0)")
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
    cp 
    cp -r "$BASH_DIR"/"$i" .

done

popd

