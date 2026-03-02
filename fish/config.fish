function fish_prompt -d "Write out the prompt"
    # This shows up as USER@HOST /home/user/ >, with the directory colored
    # $USER and $hostname are set by fish, so you can just use them
    # instead of using `whoami` and `hostname`
    printf '%s@%s %s%s%s > ' $USER $hostname \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting
end

if type -q zoxide
    zoxide init --cmd cd fish | source
end

if type -q glab
    glab completion -s fish | source
end

if type -q starship
    starship init fish | source
end

for CONFIG in ~/.config/fish/conf.d/*.fish
    source $CONFIG
end

if test -d ~/.local/bin
    fish_add_path -a ~/.local/bin
end

if test -d ~/.config/composer/vendor/bin
    fish_add_path -a ~/.config/composer/vendor/bin
end

# pnpm
set -gx PNPM_HOME "/home/glenon/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
