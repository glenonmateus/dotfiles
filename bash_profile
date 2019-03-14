export TERM='xterm-256color'

if [ $(which most) ]; then
    export PAGER=most
else 
    export PAGER=less
fi

if [ -d "$HOME/.local/bin"  ] ; then
     PATH="$HOME/.local/bin:$PATH"
fi

COLOR_RED="\033[38;5;9m"
COLOR_YELLOW="\033[38;5;11m"
COLOR_GREEN="\033[0;32m"
COLOR_OCHRE="\033[38;5;95m"
COLOR_BLUE="\033[38;5;12m"
COLOR_WHITE="\033[38;5;15m"
COLOR_RESET="\033[0m"

PS1="\[$(tput bold)\]\[$COLOR_YELLOW\]\u\[$(tput sgr0)\]" # user
PS1+="\[$(tput bold)\]\[$COLOR_WHITE\] in \[$(tput sgr0)\]"
PS1+="\[$(tput bold)\]\[$COLOR_RED\]\h\[$(tput sgr0)\]" # host
PS1+="\[$(tput bold)\]\[$COLOR_BLUE\][\W]\[$(tput sgr0)\]" # directory
PS1+="\[$COLOR_WHITE\]\$\[$COLOR_RESET\] "

export PS1
