# Alias
alias ip 'ip --color=auto'

if type -q curl
    alias myip 'curl -4 ip.me'
end

if type -q bat
    alias cat 'bat -p'
end

# on Debian
if type -q batcat
    alias cat 'batcat -p'
end

if type -q eza
    alias ls 'eza --icons --header --git'
end

if type -q kitty
    alias ssh 'kitty +kitten ssh'
end

if type -q tree
    alias tree 'tree -a -C'
end
