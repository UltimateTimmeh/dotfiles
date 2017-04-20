#!/usr/bin/env bash

# Get current directory.
DOTFILES_DIR=$(dirname $(pwd)/$0)

# General function for symlinking config files or directories.
# Symlinks overwrite existing files.
install_symlink_to() {
  SRC="$DOTFILES_DIR/config/$1"
  TGT="$HOME/$1"
  mkdir -pv "$(dirname "$TGT")"
  ln -sfv "$SRC" "$TGT"
}

# Install bashrc.
install_symlink_to ".bashrc"
install_symlink_to ".bash_aliases"
install_symlink_to ".bash_prompt"

# Install SSH config.
install_symlink_to ".ssh/config"

# Install xfce4-terminal config.
install_symlink_to ".config/xfce4/terminal/terminalrc"

# Install git config.
install_symlink_to ".gitconfig"

# Install Emacs24 and its config.
sudo apt-get install "emacs24"
install_symlink_to ".emacs"
install_symlink_to ".emacs.d"

# Install Sublime Text 3 and its config and user commands.
URL="https://download.sublimetext.com/sublime-text_build-3126_amd64.deb"
wget -P "/tmp" "$URL"
sudo dpkg -i "/tmp/sublime-text_build-3126_amd64.deb"
CFGDIR=".config/sublime-text-3/Packages/User"
install_symlink_to "$CFGDIR/Anaconda.sublime-settings"
install_symlink_to "$CFGDIR/Default (Linux).sublime-keymap"
install_symlink_to "$CFGDIR/Preferences.sublime-settings"
install_symlink_to "$CFGDIR/pylintrc"
install_symlink_to "$CFGDIR/Python.sublime-settings"
install_symlink_to "$CFGDIR/SublimeLinter.sublime-settings"
install_symlink_to "$CFGDIR/show_keyboard_shortcuts.py"
