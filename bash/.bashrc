#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ALIASES
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias hw='cd ~/Lessons'

PS1='[\u@\h \W]\$ '

export PATH="$PATH:~/.local/bin"
export PATH=$PATH:~/.cargo/bin

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
