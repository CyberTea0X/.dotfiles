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
alias dotsu='git -C $DOTS add $DOTS && git -C $DOTS commit -m "update .dotfiles" && git -C $DOTS push'
alias dotsd='cd $DOTS && dotter deploy && cd - > /dev/null'
alias dotsdd='cd $DOTS && git pull && dotter deploy && cd - > /dev/null'
alias dotse='nvim $DOTS/.dotter/global.toml'
alias dotsel='nvim $DOTS/.dotter/local.toml'
alias pkgdump='pacman -Qqen > $DOTS/packages/official && pacman -Qqem > $DOTS/packages/unofficial'
alias pkgdepl='sudo pacman -S --needed - < $DOTS/packages/official && yay -S --needed - < $DOTS/packages/unofficial'
alias mimesync='cp $HOME/.config/mimeapps.list $DOTS/mime/mimeapps.list'
alias mimediff='echo $(diff $DOTS/mime/mimeapps.list $HOME/.config/mimeapps.list)'
alias fehv='feh --auto-zoom -x --borderless --image-bg black --scale-down --start-at'
alias cheat='cht.sh'
alias xsc="xclip -selection clipboard"

# GOTO ALIASES
alias hw='cd ~/Lessons'
alias dots='cd $DOTS'

# FUNCTIONS
pkgdiff ()
{
    echo "Official packages:"
    echo $(diff $DOTS/packages/official <(pacman -Qqen))
    echo "Unofficial packages:"
    echo $(diff $DOTS/packages/unofficial <(pacman -Qqem))
}

open () {
  nohup xdg-open "$*" > /dev/null 2>&1 &
  disown
}

hyperlink () {
    echo "
    <html>
    <head>
    <meta http-equiv=\"refresh\" content=\"0; url=$1\" />
    </head>
    </html>
    " >  $2.html
}

PS1='[\u@\h \W]\$ '

export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.cargo/bin
# go install binaries
export PATH=$PATH:~/go/bin


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
