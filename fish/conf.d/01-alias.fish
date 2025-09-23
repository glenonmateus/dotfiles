# Alias
alias ip 'ip --color=auto'

if type -q curl
    alias myip 'curl -4 ip.me'
end

if type -q aws-vault

end

if type -q bat
    alias cat 'bat -p'
end

if type -q eza
    alias ls 'eza --icons --header --git'
end
