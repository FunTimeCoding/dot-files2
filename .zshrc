if [ -z "${PS1}" ]; then
    return
fi

if [ -f "${HOME}/.aliases.sh" ]; then
    . "${HOME}/.aliases.sh"
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

setopt nobeep
# record timestamp of command in HISTFILE
setopt extended_history
# ignore duplicated commands history list
setopt hist_ignore_dups
# ignore commands that start with space
setopt hist_ignore_space
# show command with history expansion to user before running it
setopt hist_verify
# share command history data
setopt share_history

export PATH="${HOME}/bin:${PATH}:${HOME}/go/bin:${KREW_ROOT:-$HOME/.krew}/bin"
export GOPATH="${HOME}/go"

autoload -Uz compinit
compinit

SAVEHIST=10000
HISTSIZE=20000

if type kubectl > /dev/null; then
    source <(kubectl completion zsh)
fi

if type zoxide > /dev/null; then
    eval "$(zoxide init zsh)"
    alias cd='z'
fi
