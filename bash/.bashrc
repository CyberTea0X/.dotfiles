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

# ALIASES
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias hw='cd ~/Lessons'
alias dots='cd $DOTS'
alias dotsu='git -C $DOTS add $DOTS && git -C $DOTS commit -m "update .dotfiles" && git -C $DOTS push'
alias dotsd='dots && git pull && dotter deploy && cd -'


PS1='[\u@\h \W]\$ '

export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.cargo/bin

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
