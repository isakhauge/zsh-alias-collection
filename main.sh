##############################
### Aliases ##################
##############################

### ZSH ######################
alias zshc="micro ~/.zshrc"
alias zshu="omz reload && clear && echo 'OMZ Updated ✨'"
alias zshup="omz update"

### Shell ####################
alias c="clear"
alias h="cd ~/"
alias pwdcp="pwd | pbcopy"

### Git ######################
# Git
alias g="git"
# Pull
alias gl="g pull origin"
# Fetch
alias gf="g fetch"
# Fetch and pull
alias gfl="gf && gl"
# Clean file
alias gx="g clean -f"
# Display current branch
alias gcb="g branch --show-current"
# Copy current branch into clipboard
alias gcbcp="gcb | clipcopy"
# Display current branch commit HEAD hash (short)
alias gh="g rev-parse --short HEAD"
# Copy current commit HEAD hash (short)
alias ghcp="gh | clipcopy"
# Restore
alias grestore="g restore"
# Reset hard
alias grh="g reset --hard"
# Reset soft
alias grs="g reset --soft"
# Branch
alias gb="g branch"
# List branches
alias gbl="gb --list"
# New branch
alias gbn="gco -b"

### Git (Jira) ###############
# These functions require that the issue code is in the branch name e.g. FW-1234.
# Display current branch issue code
alias gcbc="gcb | egrep -o -E '[A-Z]{1,4}\-[0-9]+'"
# Copy current branch issue code into clipboard
alias gcbccp="gcbc | clipcopy"

### Micro Editor #############
alias m="micro"

### Docker ###################
alias dc="docker-compose"
alias db="dc build"

### Yarn #####################
alias y="yarn"
alias yi="y install"
alias ya="y add"
alias yw="y watch"
alias yd="y dev"
alias yiw="yi && yw"
alias yid="yi && yd"
alias yb="y build"

# Homebrew
alias b="brew"
alias bs="b services"
alias binfo="b info"
alias bin="b install"
alias bun="b uninstall"
alias bup="b update --verbose && b upgrade --verbose"

# Homebrew services
alias httpd_access_log="tail -f /opt/homebrew/var/log/httpd/access_log"
alias httpd_error_log="tail -f /opt/homebrew/var/log/httpd/error_log"
alias fpm_log="tail -f /opt/homebrew/var/log/php-fpm.log"
alias mysql_log="tail -f /opt/homebrew/var/log/mysql/mysql.log"
alias mysql_error_log="tail -f /opt/homebrew/var/log/mysql/mysql_error.log"
alias mysql_slow_log="tail -f /opt/homebrew/var/log/mysql/mysql_slow_queries.log"

##############################
### Functions ################
##############################

### Git ######################
# Origin branch
# Commit
function gcom() { git commit --allow-empty -m"$*"; }
# Commit amend
function gcoma() { git commit --allow-empty --amend -m"$*"; }
function gorig() { gcom "🪴  Branched out from: $*"; }
# gnewb <origin> <destination>
function gnewb()
{
	git checkout $1
	git fetch
	git pull --rebase
	git checkout -b $2
	gorig $1
	echo "The new branch $2 is ready ✅"
}

### Git (Jira) ###############
# These functions require that the issue code is in the branch name.
# Commit with prepended Jira code
function gcomc() { gcom "$(gcbc): $*" }
# Commit amend with prepended Jira code
function gcomac() { gcoma "$(gcbc): $*" }

### Homebrew #################
function bsr()
{
    for i in $@
    do brew services restart $i
    done
}

### Composer #################
alias ci="composer install"
alias cu="composer update"
alias php74="/opt/homebrew/opt/php@7.4/bin/php"
alias ci74="php74 $(which composer) install"
alias cu74="php74 $(which composer) update"

### Famac ####################
function logger()
{
    echo "NOTE: You have to be inside the Famacweb project to access the log.\n"
    LOGGER_PATH=./storage/debug_log/$(date "+%Y-%m-%d").log
    # Ensure the file exists
    echo "" >> $LOGGER_PATH
    tail -f $LOGGER_PATH
}

### SSH (TB1/TB2) ############
HOST_TB1="fdvhuset-be-tb1.vdc.no"
HOST_TB2="fdvhuset-be-tb2.vdc.no"
HOST_TB3="fdvhuset-tb3.vdc.no"
alias tb1="ssh isak@$HOST_TB1"
alias tb2="ssh isak@$HOST_TB2"
alias tb3="ssh isak@$HOST_TB3"
alias tb1_api="tb1;sudo su -;cd /data/web/apifamacweb/api.famacweb/current;"
