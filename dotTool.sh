#!/usr/bin/env bash
set -eu

BASH_DIR=$(dirname "$(realpath $0)")
pushd $BASH_DIR

echo $BASH_DIR

# if [ $# -eq 0 ]; then
#     echo "No arguments supplied"
# fi
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
"mako"
"noctalia"
)

for i in "${dotfiles[@]}"; do 
    # rm -rf ./"$i"
    # cp -r ~/.config/"$i" .
    echo "$BASH_DIR/$i"
done

echo "finished"

# rm -f  $BASH_DIR/tmux/tmux.conf
# cp -r  $HOME/.config/tmux/tmux.conf ./tmux/tmux.conf

git add .
git commit -am "$(($(git log -1 --pretty=%B)+1))"
git push

echo "finished"
popd
