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

# Keyboard
## Increase key speed via a rate change
# xset r rate 300 50
# setxkbmap -layout us,ir
# setxkbmap us
# setxkbmap -option 'ctrl:nocaps'
# xcape -e 'Control_L=Escape'
keyboard-settings &
sxhkd &

## sets pointer so that it's not just an X
#xsetroot -cursor_name left_ptr
# turns num lock on automatically
# xdotool key Num_Lock
#sxhkd &
# emacs --daemon &
#xbacklight -set 50
# xrdb -load ~/.Xresources &
~/.fehbg &
~/.local/bin/picomstart &
unclutter &
mpd &
mpDris2 &
dunst &
# urxvtd -q -f -o &
xset -dpms &
touchpad &
xbanish &
nm-applet &
volumeicon &
udiskie &
dwmblocks &

# LOOP
while true; do
    dwm >/dev/null 2>&1
done
exec dwm

# exec enlightenment_start
# exec mate-session
# exec xmonad
# exec startlxqt
# exec startlxde
# exec awesome
# exec gnome-session
# exec gnome-session --session=gnome-classic
# exec startplasma-x11
# exec startplasma-wayland
# exec startfluxbox
# exec openbox-session
# exec cinnamon-session
# exec pekwm
# exec catwm
# exec startede
# exec icewm-session
# exec jwm
# exec monsterwm
# exec notion
# exec startdde       # deepin-session
# exec startxfce4
# exec bspwm
# exec i3 -V >> /var/log/i3/$(date +'%F-%k-%M-%S').log 2>&1
# exec i3
