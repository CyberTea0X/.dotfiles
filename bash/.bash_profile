#
# ~/.bash_profile
#
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
	exec startx
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/anatoliy/.lmstudio/bin"
