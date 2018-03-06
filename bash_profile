export TERM='xterm-256color'

if [ $(which most) ]; then
    export PAGER=most
else 
    export PAGER=less
fi

if [ -d "$HOME/.local/bin"  ] ; then
     PATH="$HOME/.local/bin:$PATH"
fi

export PS1="\[\e[32m\]\u\[\e[m\] in \[\e[31;40m\]\h\[\e[m\]\[\e[36m\][\[\e[m\]\[\e[36m\]\w\[\e[m\]\[\e[36m\]]\[\e[m\]\\$ "
