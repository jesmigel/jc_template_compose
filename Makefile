.PHONEY: build up down status test clean

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
	# Copy to Destination
	cp -rfp ./compose/$(_SRC)/* $(_TARGET)

clean:
	# Clear docker-compose.yaml
	@echo "#TEMPLATE" > docker-compose.yaml
	@
	# Clean test directories
	@rm -rf ./docker/*
	@rm -rf ./vol/*
	@rm -rf ./requirements/*

test:
	# Copy Source
	cp -rfp ./compose/$(_SRC)/* .

status:
	$(_PS)
