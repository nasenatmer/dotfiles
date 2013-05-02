#!/bin/bash
############################
# This script copies any desired dotfiles from ~ to $dir and creates symlinks to them 
############################

########## Variables

dir=~/.dotfiles                    # dotfiles directory
files="cdmrc discusrc gitconfig ncmpcpp pastebinit.xml tmux.conf vimrc vim xbindkeysrc Xmodmap.bone2 yaourtrc"    # list of files/folders to symlink in homedir

##########

# move any existing dotfiles in homedir to dotfiles directory, then create symlinks from the homedir to them 
for file in $files; do
    echo "Copy any existing dotfiles from ~ to $dir"
    mv ~/.$file $dir/$file
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done
