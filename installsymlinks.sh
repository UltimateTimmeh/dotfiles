#!/bin/bash

# Get path to the root of the dotfiles repository
DOTROOT=$(dirname $(pwd)/$0)

# Set mode (default -f, could later be based on inline arguments).
if [ $# = 0 ]; then
    MODE=-f
else
    MODE=$1
fi

# Create a backup directory, don't overwrite existing ones.
NR=0
while [ -d $DOTROOT/backups/$NR ]; do
    NR=`expr $NR + 1`
done
BAKDIR=$DOTROOT/backups/$NR
mkdir -pv $BAKDIR

# Find all dotfiles and create symlinks to them in the home directory.
DOTFILES=$(find $DOTROOT -maxdepth 1 -type f \( -iname '.*' ! -iname '*ignore' ! -iname '*~' \))
for DOTFILE in $DOTFILES; do
    BASE=$(basename $DOTFILE)
    TGT=$HOME/$BASE
    if [ -f $TGT ]; then
	printf "Backing up existing $BASE... "
	mv $TGT $BAKDIR
	printf "DONE\n"
    fi
    printf "Linking $DOTFILE to $TGT... "
    ln -s $MODE $DOTFILE $TGT
    printf "DONE\n"
done

# Link $HOME/bin to dotfiles bin directory.
if [ -d $HOME/bin ]; then
    printf "Backing up existing $HOME/bin... "
    mv $HOME/bin $BAKDIR
    printf "DONE\n"
fi
printf "Linking directory of binaries $DOTROOT/bin to $HOME/bin... "
ln -sn $MODE $DOTROOT/bin $HOME/bin
printf "DONE\n"
