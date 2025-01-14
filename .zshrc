autoload -Uz compinit
compinit

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin:$PATH
export EDITOR=nvim

# zsh history configuration
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt APPEND_HISTORY # append to history file
setopt EXTENDED_HISTORY # write the history file in the ':start:elapsed;command' format
unsetopt HIST_BEEP # don't beep when attempting to access a missing history entry
setopt HIST_EXPIRE_DUPS_FIRST # expire duplicate entries first when trimming history
setopt HIST_FIND_NO_DUPS # do not display a previously found event
setopt HIST_IGNORE_ALL_DUPS # delete an old recorded event if a new event is a duplicate
setopt HIST_IGNORE_DUPS # don't record an event that was just recorded again
setopt HIST_IGNORE_SPACE # don't record an event starting with a space
setopt HIST_NO_STORE # don't store history command
setopt HIST_REDUCE_BLANKS # remove superfluous blanks from each command line being added to history
setopt HIST_SAVE_NO_DUPS # don't write duplicate events to the history file
setopt HIST_VERIFY # don't execute immediately upon history expansion
setopt INC_APPEND_HISTORY # write to the history file immediately, not when the shell exits
setopt SHARE_HISTORY

# aliases
alias zsh-config="$EDITOR ~/.zshrc"
alias ssh-config="$EDITOR ~/.ssh"
alias tmux-config="$EDITOR ~/.config/tmux/tmux.conf"
alias nvim-config="$EDITOR ~/.config/nvim"
alias cat='bat'
alias ls="ls -F --color=auto"
alias ip="ip --color=auto"

ZSH_PLUGINS=(
  "/usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh"
  "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
  "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"
  "/usr/share/z/z.sh"
  )

for PLUGIN in "$ZSH_PLUGINS[@]"; do
  [[ -f "$PLUGIN" ]] && source $PLUGIN
done

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform
complete -C /usr/bin/aws_completer aws

eval "$(starship init zsh)"
