#!/bin/bash 

# Save this script into set_colors.sh, make this file executable and run it: 
# 
# $ chmod +x set_colors.sh 
# $ ./set_colors.sh 
# 
# Alternatively copy lines below directly into your shell. 

gconftool-2 -s -t string /apps/guake/style/background/color '#1d1d1f1f2121'
gconftool-2 -s -t string /apps/guake/style/font/color '#c5c5c8c8c6c6'
gconftool-2 -s -t string /apps/guake/style/font/palette '#1d1d1f1f2121:#cccc34342b2b:#191988884444:#fbfba9a92222:#39397171eded:#a3a36a6ac7c7:#39397171eded:#c5c5c8c8c6c6:#969698989696:#cccc34342b2b:#191988884444:#fbfba9a92222:#39397171eded:#a3a36a6ac7c7:#39397171eded:#ffffffffffff'
