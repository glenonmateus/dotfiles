#!/bin/bash 

# Save this script into set_colors.sh, make this file executable and run it: 
# 
# $ chmod +x set_colors.sh 
# $ ./set_colors.sh 
# 
# Alternatively copy lines below directly into your shell. 

gconftool-2 -s -t string /apps/guake/style/background/color '#282828282828'
gconftool-2 -s -t string /apps/guake/style/font/color '#a2a2a2a2a2a2'
gconftool-2 -s -t string /apps/guake/style/font/palette '#555555555555:#9c9c35352828:#6161bcbc3b3b:#f3f3b4b43a3a:#0d0d6868a8a8:#747445456060:#28288e8e9c9c:#a2a2a2a2a2a2:#888888888888:#d6d649493737:#8686dfdf5d5d:#fdfdd7d75a5a:#0f0f7575bdbd:#9e9e5e5e8383:#3737c3c3d6d6:#f9f9f9f9f9f9'
