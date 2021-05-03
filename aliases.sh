##############################
### ZSH
##############################
alias zshc="micro ~/.zshrc"
alias zshu="source ~/.zshrc && clear && echo 'ZSH Profile Updated ✨'"

##############################
### APT
##############################
alias ags="apt search $*"
alias agu="sudo apt-get update"
alias agup="sudo apt-get upgrade"

##############################
### Shell
##############################
alias c="clear"
alias h="cd ~/"
alias xm="xmodmap $1"

##############################
### Snap
##############################
alias sns="snap find $*"
alias sni="sudo snap install $i"
alias snl="snap list"
alias snr="sudo snap remove $i"

##############################
### Git
##############################
# Pull
alias gl="git pull --no-rebase"
# Fetch and pull
alias gfl="gf && gl"
# Clean file
alias gx="git clean -f $*"
# Display current branch
alias gcb="git branch --show-current"
# Display current branch code (Jira)
alias gcbc="gcb | egrep -o -E '[A-Z]{1,4}\-[0-9]+'"
# Display current branch commit HEAD (short)
alias gh="git rev-parse --short HEAD"
# Restore
alias gre="git restore"
# Reset hard
alias grh="git reset --hard"
# Reset soft
alias grs="git reset --soft"
# Commit
alias gcom="git commit --allow-empty -m\"$*\""
# Commit amend
alias gcoma="git commit --allow-empty --amend -m\"$*\""

##############################
### Micro Editor
##############################
alias m="micro $*"

##############################
### Docker
##############################
alias dc="docker-compose $*"
alias dcb="dc build $*"

##############################
### NPM
##############################
alias nir="npm i && npm run $1"
alias nr="npm run $1"
alias nrd="npm run dev"
alias nrw="npm run watch"

##############################
### Yarn
##############################
alias yw="yarn watch"
alias yiw="yarn install && yarn watch"
alias yid="yarn install && yarn dev"