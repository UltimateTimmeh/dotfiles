#!/bin/bash

# Get path to the root of the dotfiles repository
DOTROOT=$(dirname $(pwd)/$0)

# Configure a backup directory, don't overwrite existing ones.
NR=0
while [ -d $DOTROOT/backups/$NR ]; do
    NR=`expr $NR + 1`
done
BAKDIR=$DOTROOT/backups/$NR

# General function for backing up and symlinking configurations.
# $1 = Symbolic link target.
# $2 = Symbolic link path.
# $3 = Path of directory to which existing symlinkpaths are backed up.
backup_and_link() {
    if [ -e $2 ]; then
        echo "Back up existing $2... "
	mkdir -pv $3
	mv $2 $3
	echo "DONE"
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

# Create symlink to ssh config.
mkdir -pv $HOME/.ssh
backup_and_link $DOTROOT/.ssh/config $HOME/.ssh/config $BAKDIR/.ssh

# Create symlink to xfce4-terminal config directory.
mkdir -pv $HOME/.config/xfce4
backup_and_link $DOTROOT/terminal $HOME/.config/xfce4/terminal $BAKDIR/.config/xfce4

# Create symlink to emacs config directory.
backup_and_link $DOTROOT/.emacs.d $HOME/.emacs.d $BAKDIR

# Create symlink to pyFormex config directory.
mkdir -pv $HOME/.config
backup_and_link $DOTROOT/pyformex $HOME/.config/pyformex $BAKDIR/.config
