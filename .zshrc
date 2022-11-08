if [ -z "$PS1" ]; then
    return
fi

if [ -f "${HOME}/.aliases.sh" ]; then
    . "${HOME}/.aliases.sh"
fi

AUTOLOAD_DIRECTORY="${HOME}/.config/dot-files/autoload"

if [ -d "${AUTOLOAD_DIRECTORY}" ]; then
    COUNT=$(find "${AUTOLOAD_DIRECTORY}" -type f | wc -l | sed 's/[[:space:]]//g')

    if [ ! "${COUNT}" = '0' ]; then
        for FILE in ${AUTOLOAD_DIRECTORY}/*.sh; do
            . "$${FILE}"
        done
    fi
fi

setopt nobeep
