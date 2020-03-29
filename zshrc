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
  ansible
)

source $ZSH/oh-my-zsh.sh
export LC_CTYPE=$LANG
[ -f "$(which most)" ] && export PAGER=most

alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias cfgvim="vim ~/.vim/vimrc"
alias apt-update="sudo apt update"
alias apt-upgrade="sudo apt upgrade --auto-remove -y"

# fzf configuration
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh

# zsh plugins configuration
[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh ] && source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Virtualwrapper Configuration
if [ -f "$(which virtualenvwrapper.sh)" ]; then
 export WORKON_HOME=$HOME/.virtualenvs
 export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
 source $(which virtualenvwrapper.sh)
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
