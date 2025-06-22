# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

set -o vi

alias l='ll'

PS1='\u@\h:(\w) '
