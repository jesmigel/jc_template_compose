.PHONEY: build up down status test

_DOCKER=docker
_COMPOSE=$(_DOCKER)-compose
_UP=$(_COMPOSE) up -d
_DOWN=$(_COMPOSE) down
_BUILD=$(_COMPOSE) build
_PS=$(_COMPOSE) ps

build:
	$(_BUILD)

up:
	$(_UP)

update: build up

down:
	$(_DOWN)

deploy:
	# Copy compose file
	@cp ./docker-compose.yaml $(_TARGET)
	
	# Copy folders
	@cp -rfp ./requirements $(_TARGET)
	@cp -rfp ./vol $(_TARGET)
	@cp -rfp ./docker $(_TARGET)

status:
	$(_PS)
