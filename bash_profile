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

function git_color {
    local git_status="$(git status 2> /dev/null)"
    if [[ $git_status =~ "working directory clean"  ]]; then
        echo -e $COLOR_RED
    elif [[ $git_status =~ "Your branch is ahead of"  ]]; then
        echo -e $COLOR_YELLOW
    elif [[ $git_status =~ "nothing to commit"  ]]; then
        echo -e $COLOR_GREEN
    else
        echo -e $COLOR_OCHRE
    fi
}

function git_branch {
    local git_status="$(git status 2> /dev/null)"
    local on_branch="On branch ([^${IFS}]*)"
    local on_commit="HEAD detached at ([^${IFS}]*)"

    if [[ $git_status =~ $on_branch  ]]; then
        local branch=${BASH_REMATCH[1]}
        echo "($branch)"
    elif [[ $git_status =~ $on_commit  ]]; then
        local commit=${BASH_REMATCH[1]}
        echo "($commit)"
    fi
}

PS1="\[$(tput bold)\]\[$COLOR_YELLOW\]\u\[$(tput sgr0)\]" # user
PS1+="\[$(tput bold)\]\[$COLOR_WHITE\] in \[$(tput sgr0)\]"
PS1+="\[$(tput bold)\]\[$COLOR_RED\]\h\[$(tput sgr0)\]" # host
PS1+="\[$(tput bold)\]\[$COLOR_BLUE\][\w]\[$(tput sgr0)\]" # directory
PS1+="\[\$(git_color)\]"
PS1+="\$(git_branch)"
PS1+="\[$COLOR_WHITE\]\$\[$COLOR_RESET\] "

export PS1

if [ $(which powerline-daemon) ]; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    source ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
fi
