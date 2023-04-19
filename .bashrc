# bail if not running interactively
case $- in
	*i*) ;;
	*) return;;
esac

# no duplicate lines or lines starting with space
HISTCONTROL=ignoreboth
# append instead of overwrite
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
# update LINES and COLUMNS after each command
shopt -s checkwinsize
# enable "**" glob
#shopt -s globstar

if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	#alias grep='grep --color=auto'
fi

if [ -f ~/.aliases.sh ]; then
	. ~/.aliases.sh
fi

# not needed if already enabled in /etc/bash.bashrc and /etc/profile sources /etc/bash.bashrc
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi
