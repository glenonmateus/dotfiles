# Envs
if type -q nvim
    set -gx EDITOR nvim
    set -gx MANPAGER "nvim +Man!"
end

if type -q more
    set -gx PAGER more
end
