# http://localhost:8080/app-path/hello

init:
	docker compose run --rm java sudo chown user:user ~/.m2
	docker compose run --rm java sudo chown user:user ~/.vscode-server

setPermission:
	docker run --rm -v ${PWD}:/work alpine chgrp -R ${shell id -g} /work
	docker run --rm -v ${PWD}:/work alpine chmod -R g+rw /work
	docker run --rm -v ${PWD}:/work alpine sh -c "find /work -type d -print0 | xargs -0 chmod g+x"

build:
	echo UID=`id -u` > .env
	echo GID=`id -g` >> .env
	docker compose build
	make init

consle_java:
	docker compose run --rm java /bin/bash

up:
	docker compose up

down:
	docker compose down
