# init keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
# export keyring
export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID GPG_AGENT_INFO SSH_AUTH_SOCK

# bspwm/sxhkd config
/usr/bin/emacs --daemon

# KEY REMAPPING
# If something goes wrong ever, just run
# setxkbmap -layout us
# DEPRECATED:
# setxkbmap -option caps:escape &
# QUESTION: does x11 start this automatically?
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

sxhkd &
ntpd -qg
exec dbus-launch &
sleep 2;
xcompmgr -c -l0 -t0 -r0 -o.00 &
exec bspwm

# leftwm config
#sh $HOME/.screenlayout/works.sh &
#/usr/bin/emacs --daemon
#setxkbmap -option caps:escape &
#ntpd -qg
#exec dbus-launch leftwm
