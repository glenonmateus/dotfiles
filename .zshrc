autoload -U +X bashcompinit && bashcompinit
autoload -Uz compinit promptinit
compinit
promptinit

# history
HISTFILE="${HOME}/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt SHARE_HISTORY

export PATH=$PATH:$HOME/.local/bin/
[[ -d "/usr/local/bin/go/bin" ]] && export PATH=$PATH:/usr/local/bin/go/bin
[[ -d "/opt/nvim-linux-x86_64/bin/" ]] && export PATH=$PATH:/opt/nvim-linux-x86_64/bin/
[ "$(command -v nvim)" ] && {
  export EDITOR=nvim
  export MANPAGER="nvim +Man!"
}

# vi mode
bindkey -v

# crtl + e
bindkey '^e' autosuggest-accept

# aliases
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'
alias zsh-config='$EDITOR ~/.zshrc'
alias tmux-config='$EDITOR ~/.config/tmux/tmux.conf'
alias myip='curl -4 ip.me && curl ip.me'
[ "$(command -v bat)" ] && alias cat='bat -p'
if [ -x "/usr/bin/dircolors" ]; then
  [ "$(command -v eza)" ] && alias ls='eza'
  alias grep='grep --color=auto'
  alias egrep='egrep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias diff='diff --color=auto'
  alias ip='ip --color=auto'
fi

# prompt
case "${TERM}" in
	xterm-ghostty|xterm-color|*-256color) [ "$(command -v starship)" ] && eval "$(starship init zsh)";;
esac

# plugins
ZSH_PLUGIN_AUTOSUGGESTIONS=/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -f "${ZSH_PLUGIN_AUTOSUGGESTIONS}" ]] && source ${ZSH_PLUGIN_AUTOSUGGESTIONS}
ZSH_PLUGIN_SYNTAXHIGHLIGHTING=/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[[ -f "${ZSH_PLUGIN_SYNTAXHIGHLIGHTING}" ]] && source ${ZSH_PLUGIN_SYNTAXHIGHLIGHTING}

# completions
[ "$(command -v k9s)" ] && eval "$(k9s completion zsh)"
[ "$(command -v girus)" ] && eval "$(girus completion zsh)"
[ "$(command -v terraform)" ] && complete -o nospace -C /usr/bin/terraform terraform
[ "$(command -v terraform-docs)" ] && source <(terraform-docs completion zsh)
[ "$(command -v gh)" ] && eval "$(gh completion -s zsh)"
[ "$(command -v zoxide)" ] && eval "$(zoxide init --cmd cd zsh)"
[ "$(command -v fzf)" ] && source <(fzf --zsh)
[ "$(command -v aws_completer)" ] && complete -C /usr/bin/aws_completer aws
# activate-global-python-argcomplete --user
[ "$(command -v register-python-argcomplete)" ] && {
  ANSIBLE_COMPLETIONS=(
    ansible
    ansible-config
    ansible-console
    ansible-doc
    ansible-galaxy
    ansible-inventory
    ansible-playbook
    ansible-pull
    ansible-vault
  )
  for COMPLETION in "${ANSIBLE_COMPLETIONS[@]}"; do
    eval $(register-python-argcomplete "${COMPLETION}")
  done
}
