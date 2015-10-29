#!/bin/bash

# Get path to the root of the dotfiles repository
DOTROOT=$(dirname $(pwd)/$0)

# Create a backup directory, don't overwrite existing ones.
NR=0
while [ -d $DOTROOT/backups/$NR ]; do
    NR=`expr $NR + 1`
done
BAKDIR=$DOTROOT/backups/$NR
mkdir -pv $BAKDIR

# General function for backing up and symlinking configurations.
# $1 = Symbolic link target.
# $2 = Symbolic link path.
# $3 = Path of directory to which existing symlinkpaths are backed up.
backup_and_link() {
    if [ -e $2 ]; then
	printf "Backup up existing $2... "
	mv $2 $3
	printf "DONE\n"
    fi
    printf "Linking $2 to $1... "
    ln -sn $1 $2
    printf "DONE\n"
}

# Create symlinks to dotfiles.
DOTFILES=$(find $DOTROOT -maxdepth 1 -type f \( -iname '.*' ! -iname '*ignore' ! -iname '*~' \))
for DOTFILE in $DOTFILES; do
    backup_and_link $DOTFILE $HOME/$(basename $DOTFILE) $BAKDIR
done

# Create symlink to binary directory.
backup_and_link $DOTROOT/bin $HOME/bin $BAKDIR

# Create symlinks to emacs config directory.
backup_and_link $DOTROOT/.emacs.d $HOME/.emacs.d $BAKDIR
