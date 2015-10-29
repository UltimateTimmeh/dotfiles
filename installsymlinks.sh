#!/bin/bash

# Get path to the root of the dotfiles repository
DOTROOT=$(dirname $(pwd)/$0)

# Set mode (default -f, could later be based on inline arguments).
if [ $# = 0 ]; then
    MODE=-f
else
    MODE=$1
fi

# Find all dotfiles and create symlinks to them in the home directory.
DOTFILES=$(find $DOTROOT -maxdepth 1 -type f \( -iname '.*' ! -iname '*ignore' ! -iname '*~' \))
for DOTFILE in $DOTFILES; do
    BASE=$(basename $DOTFILE)
    TGT=$HOME/$BASE
    printf "Linking dotfile $BASE to $TGT... "
    ln -s $MODE $DOTFILE $TGT
    printf "DONE\n"
done

# Link all binaries in bin to $HOME/bin
mkdir -pv $HOME/bin
BINARIES=$(find $DOTROOT/bin -type f \( ! -iname '*~' \))
for BINARY in $BINARIES; do
    BASE=$(basename $BINARY)
    TGT=$HOME/bin/$BASE
    printf "Linking binary $BASE to $TGT... "
    ln -s $MODE $BINARY $TGT
    printf "DONE\n"
done


