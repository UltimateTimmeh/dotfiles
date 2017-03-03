# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Source global definitions
[ -f /etc/bashrc ] && . /etc/bashrc
[ -f /etc/bash.bashrc ] && . /etc/bash.bashrc

# Add $HOME/bin to PATH
export PATH=$PATH:$HOME/bin

# Add $HOME/.gitscripts/bin to PATH
export PATH=$PATH:$HOME/.gitscripts/bin

# Set a fancy primary prompt
export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h \[\033[01;32m\]<\d - \t> \[\033[01;34m\][\w]\n\$ \[\033[00m\]'

# Use 256 colors in the terminal emulator.
# This makes the appearance of emacs in the terminal much fancier.
export TERM=xterm-256color

# Turn off system bell by default
if [ -n "$DISPLAY" ]; then
  xset b off
fi

# Control ls command behavior
alias ls='ls --color=auto'
alias ll='ls -lh --color=auto'
alias lla='ls -lah --color=auto'
alias l.='ls -d .* --color=auto'

# Control cd command behavior
alias .1='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias .6='cd ../../../../../..'

# Control grep command output
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Create parent directories on demand
alias mkdir='mkdir -pv'

# Colorize diff output
alias diff='colordiff'

# Safety nets
alias rm='rm -rvI --preserve-root'
alias mv='mv -vi'
alias cp='cp -rvi'
alias ln='ln -i'

# Make common commands shorter
alias calc='libreoffice --calc'
alias writer='libreoffice --writer'
alias impress='libreoffice --impress'
alias pdf='evince'

# pyFormex aliases
alias pyformex='/home/tim/Documents/pyformex/pyformex/pyformex --redirect --pyside'
alias pysea='pyformex --search --'

# Mount TAVIguide research case directory with sshfs
alias mount-webdav='sshfs net.feops.com:/mnt/shared/webdav /mnt/webdav -C -o allow_other'
alias mount-cluster='sshfs net.feops.com:bumper /mnt/cluster -C -o allow_other; sshfs net.feops.com:/mnt/running/tim /mnt/running/tim -C -o allow_other'
alias mount-tgr='sshfs net.feops.com:/mnt/shared/taviguide/cases /mnt/tgr -C -o allow_other'
