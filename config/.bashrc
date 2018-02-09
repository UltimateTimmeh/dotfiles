# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Source global definitions.
[ -f "/etc/bashrc" ] && . "/etc/bashrc"
[ -f "/etc/bash.bashrc" ] && . "/etc/bash.bashrc"

# Source custom environment variables.
[ -f "$HOME/.bash_env" ] && . "$HOME/.bash_env"

# Source aliases.
[ -f "$HOME/.bash_aliases" ] && . "$HOME/.bash_aliases"

# Source fancy prompt.
[ -f "$HOME/.bash_prompt" ] && . "$HOME/.bash_prompt"

# Add $HOME/.gitscripts/bin to PATH
export PATH=$PATH:$HOME/.gitscripts/bin

# Turn off system bell by default
if [ -n "$DISPLAY" ]; then
  xset b off
fi
