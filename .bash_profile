export TERM='xterm-256color'

export PS1="\[$(tput bold)\]\[\033[38;5;2m\]\u\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;1m\]\h\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]\[\033[38;5;6m\][\w]:\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

if [ -d "$HOME/.local/bin"  ] ; then
     PATH="$HOME/.local/bin:$PATH"
fi
