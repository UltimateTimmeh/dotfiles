# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Source global definitions
[ -f /etc/bashrc ] && . /etc/bashrc
[ -f /etc/bash.bashrc ] && . /etc/bash.bashrc

# Add $HOME/bin to PATH
export PATH=$PATH:$HOME/bin

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
alias pysea='pyformex --search --'

# Command for launching the TAVIguide pyFormex version from within the coverage framework.
pyformex-tg-coverage() {
  if [ $# -ne 1 ]
  then
    echo "Usage: pyformex-tg-coverage WORKDIR"
    echo "Launch the TAVIguide pyFormex version from within the coverage framework"
    echo "inside WORKDIR."
  else
    cd $1
    python -m coverage run /home/tim/pyformex/pyformex_tg/pyformex/pyformex --redirect --oldabq
    python -m coverage html --omit='/usr/*','*test_*','*__init__*','/home/tim/pyformex/*'
  fi
}

# Commands for copying TAVIguide benchmark case files from feops1 to the local machine for testing.
BENCH_ROOT="feops1:/home/feops/TAV/Verification/SystemVerification/benchmark"
REPLAY_ROOT="/home/tim/tavireplay"
TEST_ROOT="/work/cases"
TEST_ROOT_ALT=${TEST_ROOT//'/'/'-'}

taviguide-pp-benchmark-copy() {
  if [ $# -ne 3 ]
  then
    echo "Usage: taviguide-pp-benchmark-copy TASK BENCH_ID TEST_ID"
    echo "Copy TAVIguide benchmark files necessary for executing TASK of TEST_ID, which"
    echo "is an instance of TAVIguide benchmark case BENCH_ID."
  elif [ $1 = 'seg' ]
  then
    scp -r "$BENCH_ROOT/$2/segmentation/*" "$TEST_ROOT/$3/segmentation"
    for FILE_NAME in "annular_plane.csv" "PR.mcs" "PR_aorta.stl" "PR_aortacalcs.stl" "PR_valve.stl" "PR_valvecalcs.stl"
    do
      mv "$TEST_ROOT/$3/segmentation/$2-$FILE_NAME" "$TEST_ROOT/$3/segmentation/$3-$FILE_NAME"
    done
    for FILE_NAME in "slice1.PNG"
    do
      mv "$TEST_ROOT/$3/segmentation/root_slices/$2-$FILE_NAME" "$TEST_ROOT/$3/segmentation/root_slices/$3-$FILE_NAME"
    done
  elif [ $1 = 'feapre' -o $1 = 'feapreqc' -o $1 = 'feapost' -o $1 = 'feapostqc' -o $1 = 'cfdpostqc' ]
  then
    scp "$BENCH_ROOT/$2/replay/$2_replay.py" "$REPLAY_ROOT/$TEST_ROOT_ALT-$3_replay_$1.py"
  else
    echo "Task '$1' not known. Choose one of: [seg, feapre, feapreqc, feapost, feapostqc, cfdpostqc]"
  fi
}
