#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '
# Add colors
PS1="\[\e[1;34m\]$PS1\[\e[m\]"

# Default browser for legacy apps
export BROWSER="firefox:xdg-open"

# VARIABLES
export DOTS="$HOME/.dotfiles"
export DOTSB="$DOTS/bash/.bashrc"

# ALIASES
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias dotsu='bash -c "git -C $DOTS add $DOTS && git -C $DOTS commit -m \"update .dotfiles\" && git -C $DOTS push"'
alias dotsd='bash -c "cd $DOTS && dotter deploy && cd - > /dev/null" && source ~/.bashrc'
alias dotsdf='bash -c "cd $DOTS && dotter deploy --force && cd - > /dev/null" && source ~/.bashrc'
alias dotsdd='bash -c "cd $DOTS && git pull --rebase && dotter deploy && cd - > /dev/null" && source ~/.bashrc'
alias dotse='bash -c "nvim $DOTS/.dotter/global.toml"'
alias dotsel='bash -c "nvim $DOTS/.dotter/local.toml"'
alias mimesync='cp $HOME/.config/mimeapps.list $DOTS/mime/mimeapps.list'
alias mimediff='echo $(diff $DOTS/mime/mimeapps.list $HOME/.config/mimeapps.list)'
alias pkgclean='pacman -Qdtq | pacman -Rs -'
alias fehv='feh --auto-zoom -x --borderless --image-bg black --scale-down --start-at'
alias cheat='cht.sh'
alias xsc="xclip -selection clipboard"
alias jo="joshuto"
alias animedit="nvim ~/Obsidian/Anime-and-films/anime.md"
alias seriousbg="feh --bg-scale ~/Pictures/bg/arch-kiss-blue.png"
alias syncthing-gui="xdg-open http://127.0.0.1:8384"
alias active-units="sudo systemctl list-units --type=service | grep active"
alias diskusage="df -Th -xtmpfs"


alias dockeron="sudo systemctl start docker.service"
alias dockerre="dockeroff && dockeron"
alias mysqlon="sudo systemctl start mysql.service"
alias runmyavd="emulator -avd test"
alias netrestart="sudo systemctl restart NetworkManager"
alias rewivepacman="sudo pacman -Sy --needed archlinux-keyring && sudo pacman -Su"
alias music="tmux new -s Music kew"
alias musicspace="tmux send-keys -t Music.1 Space"

alias shoot3s="sleep 3s && maim \"/home/$USER/Pictures/Screenshots/$(date).png\""

# GOTO ALIASES
alias hw='cd ~/Lessons'
alias dots='cd $DOTS'

pw () {
    echo $1 | openssl passwd -1 -salt cybertea --stdin
}

ta () {
    for i in {0..10}
    do
        if tmux a -t $i 2> /dev/null ; then
            break
        fi
    done
}

open () {
  nohup xdg-open "$*" > /dev/null 2>&1 &
  disown
}
openlatest() {
    open $(ls -t | head -n1)
}
# FUNCTIONS

pkgdepl () {
    local P=$DOTS/packages
    local OFFICIAL="$(comm -23 <(uniq -u <(sort $P/official <(pacman -Qqen))) <(sort $P/nosync))"
    if [ ! -z "$OFFICIAL" ]; then
        sudo pacman -S --needed $OFFICIAL 
    fi
    local UNOFFICIAL="$(comm -23 <(uniq -u <(sort $P/unofficial <(pacman -Qqem))) <(sort $P/nosync))"
    if [ ! -z "$UNOFFICIAL" ]; then
        yay -S --needed $UNOFFICIAL
    fi
}

pkgdump () {
    local P=$DOTS/packages
    comm -23 <(uniq -u <(sort <(pacman -Qqen))) <(sort $P/nosync) > $P/official
    comm -23 <(uniq -u <(sort <(pacman -Qqem))) <(sort $P/nosync) > $P/unofficial
}

pkgdump-show () {
    local P=$DOTS/packages
    comm -23 <(uniq -u <(sort <(pacman -Qqen))) <(sort $P/nosync)
    comm -23 <(uniq -u <(sort <(pacman -Qqem))) <(sort $P/nosync)
}

pkgdiff () {
    local P=$DOTS/packages
    echo "# Official packages:"
    comm -23 <(uniq -u <(sort $P/official <(pacman -Qqen))) <(sort $P/nosync)
    echo "# Unofficial packages:"
    comm -23 <(uniq -u <(sort $P/unofficial <(pacman -Qqem))) <(sort $P/nosync)
}

pkgdeps () {
    pacman -Qi $1 | grep -E "Required\ By|Name"
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

export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.cargo/bin
# go install binaries
export PATH=$PATH:~/go/bin
