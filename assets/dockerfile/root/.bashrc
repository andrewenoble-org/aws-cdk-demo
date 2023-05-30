# ~/.bashrc: executed by bash(1) for non-login shells.

# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
PS1='\w\$ '
umask 022

# You may uncomment the following lines if you want `ls' to be colorized:
export LS_OPTIONS='--color=auto'
eval "$(dircolors)"
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'

# Function to automate git config of email and username
function git-config() {
    git config --global user.email "andrewenoble@gmail.com"
    git config --global user.name "Andrew Noble"
}

# Makefile target code completion
# Credit:
# Cibin Joseph
# 2016-07-16
# https://stackoverflow.com/questions/4188324/bash-completion-of-makefile-target
complete -W "\`grep -oE '^[a-zA-Z0-9_.-]+:([^=]|$)' ?akefile | sed 's/[^a-zA-Z0-9_.-]*$//'\`" make
