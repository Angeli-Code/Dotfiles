# .bashrc
#
# Yeah.. super complex bashrc.. i know

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

PS1='\u@\h:(\W) λ '

# Aliases
alias l='ll'
alias grep="grep -r -n"
alias vi='vim'

# Vim tingz
export EDITOR='vi'
set -o vi
