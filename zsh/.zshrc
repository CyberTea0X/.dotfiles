setopt extended_glob
# VARIABLES
export DOTS="$HOME/.dotfiles"
export DOTSB="$DOTS/bash/.bashrc"

# ALIASES
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias dotsu='bash -c "git -C $DOTS add $DOTS && git -C $DOTS commit -m \"update .dotfiles\" && git -C $DOTS push"'
alias dotsd='bash -c "cd $DOTS && dotter deploy && cd - > /dev/null"'
alias dotsdf='bash -c "cd $DOTS && dotter deploy --force && cd - > /dev/null"'
alias dotsdd='bash -c "cd $DOTS && git pull --rebase && dotter deploy && cd - > /dev/null"'
alias dotse='bash -c "nvim $DOTS/.dotter/global.toml"'
alias dotsel='bash -c "nvim $DOTS/.dotter/local.toml"'
alias pkgclean='sudo pacman -Qdtq | sudo pacman -Rs -'
alias animedit="nvim ~/Obsidian/Anime-and-films/anime.md"
alias syncthing-gui="xdg-open http://127.0.0.1:8384"
alias active-units="sudo systemctl list-units --type=service | grep active"
alias diskusage="df -Th -xtmpfs"


alias dockeron="sudo systemctl start docker.service"
alias dockerre="dockeroff && dockeron"
alias runmyavd="emulator -avd test"
alias netrestart="sudo systemctl restart NetworkManager"
alias rewivepacman="sudo pacman -Sy --needed archlinux-keyring && sudo pacman -Su"

# GOTO ALIASES
alias hw='cd ~/Lessons'
alias dots='cd $DOTS'

copypath () {
    realpath $1 | xsc
}

pw () {
    echo $1 | openssl passwd -1 -salt cybertea --stdin
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
export PATH="/home/anatoliy/.bun/bin:$PATH"
# go install binaries
export PATH=$PATH:~/go/bin
# pnpm
export PNPM_HOME="/home/anatoliy/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
