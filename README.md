# Nix - Arch

## Install

```bash
sudo pacman -S nix
```

add your user to nix-users group (permission denied error)

```bash
usermod -aG nix-users $USER
```

enable and start nix-daemon

```bash
sudo systemctl enable --now nix-daemon
```

## Set overview shortcut

kwriteconfig5 --file kwinrc --group ModifierOnlyShortcuts --key Meta "org.kde.kglobalaccel,/component/kwin,,invokeShortcut,Overview"

qdbus org.kde.KWin /KWin reconfigure

## Tmux + nvim wrong color scheme

    // only this line might not be enough
    set -g default-terminal "xterm-256color"

    // Needs this line also to overrides the default color
    set-option -ga terminal-overrides ",xterm-256color:Tc"
