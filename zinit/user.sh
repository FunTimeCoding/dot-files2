[ -f "${HOME}/.aliases.sh" ] && . "${HOME}/.aliases.sh"

AUTOLOAD_DIRECTORY="${HOME}/.config/dot-files/autoload"

if [ -d "${AUTOLOAD_DIRECTORY}" ]; then
    COUNT=$(find "${AUTOLOAD_DIRECTORY}" | wc -l | sed 's/[[:space:]]//g')

    if [ ! "${COUNT}" = '0' ]; then
        for FILE in ${AUTOLOAD_DIRECTORY}/*.sh; do
            . "${FILE}"
        done
    fi
fi

export PATH="${HOME}/bin:${PATH}:${HOME}/go/bin:${KREW_ROOT:-$HOME/.krew}/bin"
export GOPATH="${HOME}/go"

type fzf > /dev/null && eval "$(fzf --zsh)"
type zoxide > /dev/null && eval "$(zoxide init --cmd cd zsh)"
type kubectl > /dev/null && source <(kubectl completion zsh)
type direnv > /dev/null && eval "$(direnv hook zsh)"

unset LSCOLORS
type gdircolors > /dev/null && [ -d $HOME/src/github/dircolors-solarized ] && eval $(gdircolors $HOME/src/github/dircolors-solarized/dircolors.256dark)
