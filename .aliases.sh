alias g='git'
alias gl='git pull'
alias gp='git push'
alias gm='git merge'
alias gs='git status'
alias gh='git log'
alias ga='git add'
alias gaa='git add --all'
alias gd='git diff'
alias gdc='git diff --cached'
alias gc='git commit'
alias gcam='git commit --all --message'
alias gco='git checkout'
alias gct='git checkout --track'
alias gcb='git checkout -b'
alias grv='git remote --verbose'
alias gb='git branch'
alias gbd='git branch --delete'
alias gba='git branch --all'
alias gbv='git branch -vv'

alias d='docker'
alias dp='docker ps'
alias dpa='docker ps --all'
alias dil='docker image ls'
alias dsp='docker system prune --volumes'

alias v='nvim'

# TODO: brew package exists, what about Debian?
#alias websocat="${HOME}/src/unix-tools/bin/websocat/websocat.sh"

alias k="${HOME}/src/virtualization-tools/bin/kubernetes/kubectl.sh"
alias ku="${HOME}/src/virtualization-tools/bin/kubernetes/set-cluster.sh"
alias kc="${HOME}/src/virtualization-tools/bin/kubernetes/set-context.sh"
alias kn="${HOME}/src/virtualization-tools/bin/kubernetes/set-namespace.sh"
alias kr="${HOME}/src/virtualization-tools/bin/kubernetes/show-resources.sh"
alias kp="${HOME}/src/virtualization-tools/bin/kubernetes/show-pods.sh"
alias kd="${HOME}/src/virtualization-tools/bin/kubernetes/show-deployments.sh"
alias kdl="${HOME}/src/virtualization-tools/bin/kubernetes/show-deployment-logs.sh"
alias ks="${HOME}/src/virtualization-tools/bin/kubernetes/shell.sh"
alias kz="${HOME}/src/virtualization-tools/bin/kubernetes/kustomize.sh"

alias stern="${HOME}/src/virtualization-tools/bin/kubernetes/kubectl/stern.sh"
# TODO: Does not work as well as argocd, segfaults, probably volume or permission issues
#alias argo="${HOME}/src/virtualization-tools/bin/kubernetes/argo/argo.sh"

alias cx="${HOME}/src/virtualization-tools/bin/kubernetes/kubectl/kubectx.sh"
alias ns="${HOME}/src/virtualization-tools/bin/kubernetes/kubectl/kubens.sh"

alias atl="${HOME}/src/monitoring-tools/bin/prometheus/amtool.sh"
alias au="${HOME}/src/monitoring-tools/bin/prometheus/amtool/set-cluster.sh"
alias ata="${HOME}/src/monitoring-tools/bin/prometheus/amtool/alert/list.sh"
alias ats="${HOME}/src/monitoring-tools/bin/prometheus/amtool/silence/list.sh"
