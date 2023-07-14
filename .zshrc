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
setopt HIST_IGNORE_ALL_DUPS

export PATH="${PATH}:${HOME}/bin:${HOME}/sdk/go1.20.6/bin:${HOME}/go/bin:${KREW_ROOT:-$HOME/.krew}/bin"
export GOPATH="${HOME}/go"

autoload -Uz compinit
compinit

SAVEHIST=10000
HISTSIZE=20000

if type kubectl > /dev/null; then
    source <(kubectl completion zsh)
fi
