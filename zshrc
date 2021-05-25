# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$HOME/.local/bin:/usr/local/bin:$PATH
export TERM="xterm-256color"
export ZSH=/home/glenon/.oh-my-zsh

ZSH_THEME="powerlevel10k"

plugins=(
  git
  docker
  docker-compose
  docker-machine
  kubectl
  minikube
  sudo
  systemd
  aws
  bgnotify
  fzf
  ssh-agent
  z
)

source $ZSH/oh-my-zsh.sh
export LC_CTYPE=$LANG
export BROWSER=/usr/bin/google-chrome-stable
[ -f "$(which most)" ] && export PAGER=most

alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias cfgvim="vim ~/.vim/vimrc"

# zsh plugins configuration
ZSH_AUTOSUGGESTION=/usr/share/zsh/plugins/zsh-autosuggestions
if [ -f $ZSH_AUTOSUGGESTION/zsh-autosuggestions.zsh ]; then
    . $ZSH_AUTOSUGGESTION/zsh-autosuggestions.zsh
    # change suggestion color
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'
fi

ZSH_SYNTAX_HIGHLIGHTING=/usr/share/zsh/plugins/zsh-syntax-highlighting
[ -f $ZSH_SYNTAX_HIGHLIGHTING/zsh-syntax-highlighting.zsh ] && source $ZSH_SYNTAX_HIGHLIGHTING/zsh-syntax-highlighting.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/vault vault

complete -o nospace -C /usr/bin/consul consul

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
