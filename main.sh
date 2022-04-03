##############################
### Aliases ##################
##############################

### ZSH ######################
alias zshc="micro ~/.zshrc"
alias zshu="omz update && clear && echo 'OMZ Updated ✨'"

### Shell ####################
alias c="clear"
alias h="cd ~/"

### Git ######################
# Pull
alias gl="git pull --no-rebase"
# Fetch
alias gf="git fetch"
# Fetch and pull
alias gfl="gf && gl"
# Clean file
alias gx="git clean -f $*"
# Display current branch
alias gcb="git branch --show-current"
# Copy current branch into clipboard
alias gcbcp="gcb | clipcopy"
# Display current branch commit HEAD (short)
alias gh="git rev-parse --short HEAD"
# Copy current commit HEAD (short)
alias ghcp="gh | clipcopy"
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

### Git (Jira) ###############
# These functions require that the issue code is in the branch name.
# Display current branch issue code
alias gcbc="gcb | egrep -o -E '[A-Z]{1,4}\-[0-9]+'"
# Copy current branch issue code into clipboard
alias gcbccp="gcbc | clipcopy"

### Micro Editor #############
alias m="micro $*"

### Docker ###################
alias dc="docker-compose $*"
alias db="dc build $*"

### Yarn #####################
alias yw="yarn watch"
alias yd="yarn dev"
alias yiw="yarn install && yarn watch"
alias yid="yarn install && yarn dev"

##############################
### Functions ################
##############################

### Git ######################
# Origin branch
function gorig() { gcom "🌵 Branched out from: $*" }

### Git (Jira) ###############
# These functions require that the issue code is in the branch name.
# Commit with prepended Jira code
function gcomc() { gcom "$(gcbc): $*" }
# Commit amend with prepended Jira code
function gcomac() { gcoma "$(gcbc): $*" }