#!/bin/bash
DotPath=$(pwd)
echo DotPath is $DotPath.
cd $HOME
echo The current working directory is $(pwd).
ls -a $DotPath

ln -sf $DotPath/.vimrc ./
ln -sf $DotPath/.config/alacritty/alacritty.yml ./.config/alacritty/
ln -sf $DotPath/.config/i3/config ./.config/i3/
ln -sf $DotPath/.config/polybar/config ./.config/polybar/
ln -sf $DotPath/.config/polybar/launch.sh ./.config/polybar/
