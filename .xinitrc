#!/bin/sh

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

# [ -d ~/Pictures/Wallpapers ] && feh --randomize --bg-fill ~/Pictures/Wallpapers/* &
feh --bg-fill ~/Pictures/gray.png
[ -f ~/.Xresources ] && xrdb -load ~/.Xresources &
picomstart &
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

# Gpg stuff
# source: https://forum.artixlinux.org/index.php/topic,2446.0.html

# Automatically start the agent
if [ -x /usr/bin/gpg-agent ]; then
 eval "$(/usr/bin/gpg-agent --daemon)"
fi

# For shutdown the agent if needed
if [ -n "${GPG_AGENT_INFO}" ]; then
  kill $(echo ${GPG_AGENT_INFO} | cut -d':' -f 2) >/dev/null 2>&1
fi

# LOOP
while true; do
    dwm >/dev/null 2>&1
done
exec dwm
