alias v='nvim'
# TODO: brew package exists, what about Debian?
#alias websocat="${HOME}/src/unix-tools/bin/websocat/websocat.sh"

# Git
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

# Docker
alias d='docker'
alias dp='docker ps'
alias dpa='docker ps --all'
alias dil='docker image ls'
alias dsp='docker system prune --volumes'

# Kubernetes
alias dku="${HOME}/src/virtualization-tools/bin/kubernetes/set-cluster.sh"
alias dkc="${HOME}/src/virtualization-tools/bin/kubernetes/set-context.sh"
alias dkn="${HOME}/src/virtualization-tools/bin/kubernetes/set-namespace.sh"
alias dkr="${HOME}/src/virtualization-tools/bin/kubernetes/show-resources.sh"
alias dkp="${HOME}/src/virtualization-tools/bin/kubernetes/show-pods.sh"
alias dkd="${HOME}/src/virtualization-tools/bin/kubernetes/show-deployments.sh"
alias dkdl="${HOME}/src/virtualization-tools/bin/kubernetes/show-deployment-logs.sh"
alias dks="${HOME}/src/virtualization-tools/bin/kubernetes/shell.sh"
alias dkz="${HOME}/src/virtualization-tools/bin/kubernetes/kustomize.sh"

## kubectl
alias k="kubectl"
alias dk="${HOME}/src/virtualization-tools/bin/kubernetes/kubectl.sh"
alias dst="${HOME}/src/virtualization-tools/bin/kubernetes/kubectl/stern.sh"
alias dcx="${HOME}/src/virtualization-tools/bin/kubernetes/kubectl/kubectx.sh"
alias dns="${HOME}/src/virtualization-tools/bin/kubernetes/kubectl/kubens.sh"

## ArgoCD
alias a="argocd"
# TODO: Does not work as well as argocd, segfaults, probably volume or permission issues
alias da="${HOME}/src/virtualization-tools/bin/kubernetes/argo/argo.sh"

## Prometheus
alias dam="${HOME}/src/monitoring-tools/bin/prometheus/amtool.sh"
alias dau="${HOME}/src/monitoring-tools/bin/prometheus/amtool/set-cluster.sh"
alias data="${HOME}/src/monitoring-tools/bin/prometheus/amtool/alert/list.sh"
alias dats="${HOME}/src/monitoring-tools/bin/prometheus/amtool/silence/list.sh"

## glab
alias glc="${HOME}/src/version-control-tools/bin/gitlab/glab/context.sh"
alias glpc="${HOME}/src/version-control-tools/bin/gitlab/glab/push-create.sh"
alias glpcm="${HOME}/src/version-control-tools/bin/gitlab/glab/push-create-merge.sh"
alias glpfm"${HOME}/src/version-control-tools/bin/gitlab/glab/push-find-merge.sh"
