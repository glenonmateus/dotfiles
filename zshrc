export PATH=$HOME/.local/bin:/usr/local/bin:$PATH
export TERM="xterm-256color"

export ZSH=/home/glenonmateus/.oh-my-zsh

ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(host dir dir_writable vcs virtualenv root_indicator background_jobs)
POWERLEVEL9K_DISABLE_RPROMPT=true
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1

plugins=(
  git
  docker
  docker-compose
  docker-machine
  kubectl
  minikube
  sudo
  systemd
  zsh-syntax-highlighting
  zsh-autosuggestions
  bgnotify
)


source $ZSH/oh-my-zsh.sh
export LC_CTYPE=$LANG
[ -f "$(which most)" ] && export PAGER=most

alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias cfgvim="vim ~/.vim/vimrc"
alias apt-update="sudo apt update"
alias apt-upgrade="sudo apt upgrade --auto-remove -y"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Debian Conigurations
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
[ -f /usr/share/zsh/vendor-completions/_fzf ] && source /usr/share/zsh/vendor-completions/_fzf

# Virtualwrapper Configuration
if [ -f "$(which virtualenvwrapper.sh)" ]; then
 export WORKON_HOME=$HOME/.virtualenvs
 export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
 source $(which virtualenvwrapper.sh)
fi
