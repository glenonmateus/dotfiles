export TERM='xterm-256color'

if [ $(which most) ]; then
    export PAGER=most
else 
    export PAGER=less
fi

if [ -d "$HOME/.local/bin"  ] ; then
     PATH="$HOME/.local/bin:$PATH"
fi

export PS1="\[$(tput bold)\]\[\033[38;5;11m\]\u\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;15m\] in \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;9m\]\h\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;12m\][\w]\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;15m\]\\$ \[$(tput sgr0)\]"
