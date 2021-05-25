#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# By default this variable is set to tty
XDG_SESSION_TYPE=x11

# Java gray window problem
export AWT_TOOLKIT=MToolkit
export _JAVA_AWT_WM_NONREPARENTING=1 # For matalab

~/.fehbg &
~/.local/bin/picomstart &
xrdb -load ~/.Xresources &
keyboardsettings &
sxhkd &
unclutter &
mpd &
mpDris2 &
dunst &
xset -dpms &
touchpad &
xbanish &
nm-applet &
udiskie &
dwmblocks &

# LOOP
while true; do
    dwm >/dev/null 2>&1
done
exec dwm
