#
# ~/.bashrc
#
export PATH=$PATH:$HOME/.local/bin/
export EDITOR=nvim
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# aliases
alias vim='nvim'
alias bash-config='$EDITOR ~/.bashrc'
alias tmux-config='$EDITOR ~/.config/tmux/tmux.conf'
alias myip='curl -4 ip.me && curl ip.me'
[[ $(command -v bat) ]] && alias cat='bat -p'
if [ -x "/usr/bin/dircolors" ]; then
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
  alias egrep='egrep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias diff='diff --color=auto'
  alias ip='ip --color=auto'
fi

BASH_EXTRAS=(
  "/usr/share/fzf/completion.bash"
  "/usr/share/fzf/key-bindings.bash"
  "/usr/share/z/z.sh"
  )
for EXTRA in "${BASH_EXTRAS[@]}"; do
  [[ -r "$EXTRA" ]] && source "$EXTRA"
done

# avoid duplicates..
export HISTCONTROL=ignoredups:erasedups
# append history entries..
shopt -s histappend
# After each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# prompt
PS1='[\u@\h \W]\$ '
case "${TERM}" in
	xterm-ghostty|xterm-color|*-256color) [ "$(command -v starship)" ] && eval "$(starship init bash)";;
esac

# completions
[ "$(command -v gh)" ] && eval "$(gh completion -s bash)"
[ "$(command -v terraform)" ] && complete -C /usr/bin/terraform terraform
[ "$(command -v aws_completer)" ] && complete -C /usr/bin/aws_completer aws
