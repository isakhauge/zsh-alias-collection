##############################
### Git
##############################
# Commit with prepended Jira code
function gcomc() { gcom "$(gcbc): $*" }
# Commit amend with prepended Jira code
function gcomac() { gcoma "$(gcbc): $*" }
# Origin branch
function gorig() { gcom "🌵 BRANCHED OUT FROM: $*" }

##############################
### Docker
##############################
# Start containers
function dcu()
{
	temp=$(pwd)
	cd $DOCKER_COMPOSE_DIR
	echo "🛸 Docker Compose Up ..."
	docker-compose up \
		-d \
		--force-recreate \
		--renew-anon-volumes \
		--remove-orphans \
		$DOCKER_COMPOSE_SERVICES
	cd $temp
}

# Shutdown containers
function dcd()
{
	temp=$(pwd)
	$DOCKER_COMPOSE_DIR
	echo "🌒 Docker Compose Down ..."
	docker-compose down \
		--remove-orphans
	cd $temp
}

##############################
### Dockerized Applications
##############################
# Composer
function composer()
{
	echo "📦️ => Spinning up Composer ..."
	docker run --rm -it composer:latest composer --version
	docker run --rm -it \
		--name composer \
		-v $(pwd):/app \
		-w /app \
		composer:latest \
		composer $* --ignore-platform-reqs
}

# PHP
function php7()
{
	echo "📦️ => Spinning up PHP 7.4 ..."
	docker run --rm -it \
		--name php \
		-v $(pwd):/app \
		-w /app \
		php:7.4 \
		php $*
}

# Famac: Start Phinx
function phinx()
{
	echo "📦️ You are running Phinx from the Famac PHP-FPM container"
	docker exec -it $PHINX_PHP_CONTAINER bash \
		-c "$PHINX_BINARY_PATH $1 -c $PHINX_CONFIG_PATH $2"
}

# Famac: Create Phinx Migration
function pcreate()
{
	phinx "create" "-- $1"
}

# Famac: Phinx Migrate
function pmigrate()
{
	phinx migrate
}

# Famac: Phinx Rollback
function prollback()
{
	phinx rollback
}

function prollbackref()
{
	phinx rollback "-t $1 -f"
}