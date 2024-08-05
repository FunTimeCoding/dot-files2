# bail if not running interactively
case $- in
    *i*) ;;
    *) return;;
esac

# no duplicate lines or lines starting with space
HISTCONTROL=ignoreboth
# append instead of overwrite
shopt -s histappend
HISTSIZE=10000
HISTFILESIZE=20000
# update LINES and COLUMNS after each command
shopt -s checkwinsize
# enable "**" glob
#shopt -s globstar

if [ -f ~/.aliases.sh ]; then
    . ~/.aliases.sh
fi

SYSTEM=$(uname)

if [ "$SYSTEM" = 'Linux' ] || [ "$SYSTEM" = 'Darwin' ]; then
    case "$TERM" in
        xterm-color|*-256color) color_prompt=yes;;
    esac

    if [ "$color_prompt" = yes ]; then
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    else
        PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    fi
    unset color_prompt

    if [ -x /usr/bin/dircolors ]; then
        test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
        alias ls='ls --color=auto'
        #alias grep='grep --color=auto'
    fi

    # not needed if already enabled in /etc/bash.bashrc and /etc/profile sources /etc/bash.bashrc
    if ! shopt -oq posix; then
        if [ -f /usr/share/bash-completion/bash_completion ]; then
            . /usr/share/bash-completion/bash_completion
        elif [ -f /etc/bash_completion ]; then
            . /etc/bash_completion
        fi
    fi

    export PATH="$HOME/sdk/go1.21.3/bin:$HOME/go/bin:$PATH"
else
    SYSTEM=$(uname -o)

    if [ "$SYSTEM" = 'Msys' ]; then
        env=~/.ssh/agent.env

        agent_load_env() {
                # shellcheck source=/dev/null
                test -f "$env" && . "$env" >|/dev/null
        }

        agent_start() {
                (
                        umask 077
                        ssh-agent >|"$env"
                )
                # shellcheck source=/dev/null
                . "$env" >|/dev/null
        }

        agent_load_env

        # agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2= agent not running
        agent_run_state=$(
                ssh-add -l >|/dev/null 2>&1
                echo $?
        )

        # shellcheck disable=SC2086
        if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
                agent_start
                ssh-add
        elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
                ssh-add
        fi

        unset env

        export GOPATH="${HOME}/go"
        export GOBIN="${GOPATH}/bin"
        export PATH="${PATH}:${HOME}/.local/bin:${GOBIN}:${HOME}/sdk/go1.22.1/bin:${HOME}/opt/apache-maven-3.6.3/bin:${HOME}/AppData/Roaming/npm:/c/Program Files/nodejs:${HOME}/opt/gnuplot-5.2.8/bin"

        export SDKMAN_DIR="${HOME}/.sdkman"
        [[ -s "${HOME}/.sdkman/bin/sdkman-init.sh" ]] && source "${HOME}/.sdkman/bin/sdkman-init.sh"

        LS_COMMON="-hG"
        LS_COMMON="${LS_COMMON} --color=auto"
        LS_COMMON="${LS_COMMON} -I NTUSER.DAT\* -I ntuser.dat\* -I ntuser.ini"
        export LS_COMMON
        alias ls="command ls ${LS_COMMON}"
    fi
fi

AUTOLOAD_DIRECTORY="${HOME}/.config/dot-files/autoload"

if [ -d "${AUTOLOAD_DIRECTORY}" ]; then
    COUNT=$(find "${AUTOLOAD_DIRECTORY}" | wc -l | sed 's/[[:space:]]//g')

    if [ ! "${COUNT}" = '0' ]; then
        for FILE in ${AUTOLOAD_DIRECTORY}/*.sh; do
            . "${FILE}"
        done
    fi
fi
