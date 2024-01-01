#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# AUTOSTART X
if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi

# VARIABLES
export DOTS="$HOME/.dotfiles"
export DOTSB="$DOTS/bash/.bashrc"

# ALIASES
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias hw='cd ~/Lessons'
alias dots='cd $DOTS'
alias dotsu='git -C $DOTS add $DOTS && git -C $DOTS commit -m "update .dotfiles" && git -C $DOTS push'
alias dotsd='dots && dotter deploy && cd - > /dev/null'
alias dotsdd='dots && git pull && dotter deploy && cd - > /dev/null'
alias pkgdump='pacman -Qqen > $DOTS/packages/official && pacman -Qqem > $DOTS/packages/unofficial'
alias pkgdepl='sudo pacman -S --needed - < $DOTS/packages/official && yay -S --needed - < $DOTS/packages/unofficial'
alias mimesync='cp $HOME/.config/mimeapps.list $DOTS/mime/mimeapps.list'

# FUNCTIONS
pkgdiff ()
{
  echo "Official packages:"
  echo $(diff $DOTS/packages/official <(pacman -Qqen))
  echo "Unofficial packages:"
  echo $(diff $DOTS/packages/unofficial <(pacman -Qqem))
}

mimediff ()
{
  echo $(diff $DOTS/mime/mimeapps.list $HOME/.config/mimeapps.list)
}

PS1='[\u@\h \W]\$ '

export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.cargo/bin

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
