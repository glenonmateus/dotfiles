autoload -Uz compinit
compinit

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin:$PATH
export EDITOR=nvim

# plugins
ZSH_PLUGINS=(
  "/usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh"
  "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
  "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"
  "/usr/share/z/z.sh"
  )

for PLUGIN in "$ZSH_PLUGINS[@]"; do
  [[ -f "$PLUGIN" ]] && source $PLUGIN
done

# zsh history configuration
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt APPEND_HISTORY # append to history file

# aliases
alias zsh-config="$EDITOR ~/.zshrc"
alias ssh-config="$EDITOR ~/.ssh"
alias tmux-config="$EDITOR ~/.config/tmux/tmux.conf"
alias nvim-config="$EDITOR ~/.config/nvim"
alias ls="ls -F --color=auto"
[[ $(command -v bat) ]] && alias cat='bat'
alias ip="ip --color=auto"

# completion
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform
complete -C /usr/bin/aws_completer aws

# load prompt
eval "$(starship init zsh)"
