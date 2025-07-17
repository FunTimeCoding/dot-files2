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
# TODO: Delete if this is really no longer needed
#export GOPATH="${HOME}/go"

SAVEHIST=10000
HISTSIZE=20000

type kubectl > /dev/null && source <(kubectl completion zsh)
type zoxide > /dev/null && eval "$(zoxide init --cmd cd zsh)"
type fzf > /dev/null && eval "$(fzf --zsh)"
[ -d /opt/homebrew/share/zsh-syntax-highlighting ] && source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -d /opt/homebrew/share/zsh-autosuggestions ] && source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

function powerline_precmd() {
    PS1="$(/opt/homebrew/bin/powerline-go -error $? -jobs ${${(%):%j}:-0})"
    # Uncomment the following line to automatically clear errors after showing
    # them once. This not only clears the error for powerline-go, but also for
    # everything else you run in that shell. Don't enable this if you're not
    # sure this is what you want.
    #set "?"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ] && [ -f "/opt/homebrew/bin/powerline-go" ]; then
    install_powerline_precmd
fi

unset LSCOLORS
[ -d $HOME/src/github/dircolors-solarized ] && eval $(gdircolors $HOME/src/github/dircolors-solarized/dircolors.256dark)
