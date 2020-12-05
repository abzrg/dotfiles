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

# Plank need this to start. by default this variable is set to tty
XDG_SESSION_TYPE=x11

# keyboard
 # Increase key speed via a rate change
xset r rate 300 50
setxkbmap -layout us,ir
#setxkbmap -option
setxkbmap -option 'ctrl:nocaps'
setxkbmap -option 'grp:alt_shift_toggle'

# other stuff
# xrdb --merge ~/.Xresources &
~/.local/bin/picomstart &
# emacs --daemon &
# sxhkd &
# fehbg
# dunst &
# mpd &
# mpDris2 &
urxvtd -q -f -o &


### BSPWM+I3 ###
# sets pointer so that it's not just an X
#xsetroot -cursor_name left_ptr

# sets brightness to half
#xbacklight -set 50

# turns num lock on automatically
# xdotool key Num_Lock

# sets background


#exec bspwm
# exec i3 -V >> /var/log/i3/$(date +'%F-%k-%M-%S').log 2>&1
#feh --bg-scale Pictures/cityscape_26.png &
#exec i3


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
# exec dwm
# exec startede
# exec icewm-session
# exec jwm
# exec monsterwm
# exec notion
# exec startdde       # deepin-session
exec startxfce4
