# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

export EDITOR='vi'

alias l='ls -l --color=auto'
alias .='cd ..'
alias grep='grep -r -n'

PS1='\u@\h:(\W) '

unset rc
