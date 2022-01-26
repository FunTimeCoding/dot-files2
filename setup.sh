#!/bin/sh -e

DIRECTORY=$(dirname "${0}")
SCRIPT_DIRECTORY=$(cd "${DIRECTORY}" || exit 1; pwd)
cd "${SCRIPT_DIRECTORY}"
FILES=$(find . -maxdepth 1 -name '.*' -not -path './.git' -and -not -path . | grep --extended-regexp --invert-match "(\.idea|\.gitignore)$" | awk -F / '{ print $NF }')

for FILE in ${FILES}; do
    ln -snf "${PWD}/${FILE}" "${HOME}/${FILE}"
done

ln -snf "${PWD}/ssh/config" "${HOME}/.ssh/config"
