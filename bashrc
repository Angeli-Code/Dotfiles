# .bashrc
#
# Yeah.. super complex bashrc.. i know

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

PS1='\u@\h:(\W) '

# Aliases
alias l='ll'
alias ..='cd ..'

# Vim tingz
export EDITOR='vi'
set -o vi
