# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

PS1="\u@\h:(\w)# "
export EDITOR='vi'

# Aliases
alias l='ll'
alias t='tree'
alias neo='fastfetch'
alias todo='less ~/.todo'
