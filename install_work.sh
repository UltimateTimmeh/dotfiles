#!/usr/bin/env bash

# Get current directory.
DOTFILES_DIR="$(dirname "$(pwd)/$0")"

# General function for symlinking config files or directories.
# Symlinks overwrite existing files.
install_symlink_to() {
  SRC="$DOTFILES_DIR/config/$1"
  TGT="$HOME/$1"
  mkdir -pv "$(dirname "$TGT")"
  ln -sfv "$SRC" "$TGT"
}

# General function for installing a git repository.
# Repositories are only cloned if the target doesn't exist.
install_git_repo() {
  if [ ! -e "$2" ]; then
    git clone "$1" "$2"
  fi
}

# Install pyFormex and its config.
REP="bumps:/srv/git/pyformex.git"
TGT="$HOME/Documents/pyformex"
CFG=".config/pyformex/pyformex.conf"
install_git_repo "$REP" "$TGT"
install_symlink_to "$CFG"

# Install TAVIguide-pp and its config.
REP="https://net.feops.com/gitlab/feops/TAVIguide-pp.git"
TGT="$HOME/Documents/feops/taviguide/taviguide-pp"
CFG=".config/pyformex/taviguide.conf"
install_git_repo "$REP" "$TGT"
install_symlink_to "$CFG"

# Install MITRALguide-pp.
REP="https://net.feops.com/gitlab/feops/MITRALguide-pp.git"
TGT="$HOME/Documents/feops/mitralguide/mitralguide-pp"
install_git_repo "$REP" "$TGT"
