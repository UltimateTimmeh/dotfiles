#!/usr/bin/env bash

# Get current directory.
DOTFILES_DIR="$(dirname "$(pwd)/$0")"

# General function for symlinking config files or directories.
# If LINKNAME exists, it is backed up (with datetime appended) to ~/.dotfilesbak.
install_symlink_to() {
  TARGET="$DOTFILES_DIR/config/$1"
  LINKNAME="$HOME/$1"
  if [ -e "$LINKNAME" ]; then
    BAKDIR="$HOME/.dotfilesbak"
    BASENAME="$(basename $LINKNAME)"
    DATETIME="$(date +%Y%m%d%H%M%S)"
    mkdir -pv "$BAKDIR"
    mv -v "$LINKNAME" "$BAKDIR/$BASENAME-$DATETIME"
  fi
  mkdir -pv "$(dirname "$LINKNAME")"
  ln -sfv "$TARGET" "$LINKNAME"
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

# Install Emacs24 and its config and theme.
sudo apt-get install "emacs24"
install_symlink_to ".emacs"
install_symlink_to ".emacs.d/themes/ample-zen-theme.el"

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
