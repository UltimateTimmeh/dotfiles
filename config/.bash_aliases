# Control ls command behavior
alias ls="ls --color=auto"
alias ll="ls -lh --color=auto"
alias lla="ls -lah --color=auto"
alias l.="ls -d .* --color=auto"

# Control cd command behavior
alias .1="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."
alias .6="cd ../../../../../.."

# Control grep command output
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

# Create parent directories on demand
alias mkdir="mkdir -pv"

# Colorize diff output
alias diff="colordiff"

# Safety nets
alias rm="rm -rvI --preserve-root"
alias mv="mv -vi"
alias cp="cp -rvi"
alias ln="ln -i"

# Make common commands shorter
alias rsync="rsync -avvhP"
alias calc="libreoffice --calc"
alias writer="libreoffice --writer"
alias impress="libreoffice --impress"
alias pdf="evince"

# pyFormex aliases
alias pyformex="$PYFORMEX_ROOT/pyformex/pyformex --redirect --pyside"
alias pysea="pyformex --search --"

# Alias for activating and deactivating VPN
alias vpn-on="sudo vpnc.sh"
alias vpn-off="sudo vpnc.sh -d"

# Alias for activating a work break countdown timer
alias pause="sleep 420 && google-chrome https://www.youtube.com/watch?v=WYs6Tud55Sc"

# Aliases for mounting some remote filesystems with sshfs
alias mount-webdav="sshfs kong:/mnt/shared/webdav /mnt/shared/webdav -C -o allow_other"
alias mount-cluster="sshfs feops1:bumper /mnt/cluster -C -o allow_other; sshfs feops1:/mnt/running/$USER /mnt/running/$USER -C -o allow_other"
alias mount-tgr="sshfs kong:/mnt/shared/taviguide/cases /mnt/tgr -C -o allow_other"
