include docker/.env
include docker/deploy/.env
export


.PHONY: *

#install last modification by local machine
install: build-base build-final
	docker-compose -f docker/deploy/docker-compose.yml -f docker/deploy/local/docker-compose.yml run --rm composer
	docker-compose -f docker/deploy/docker-compose.yml -f docker/deploy/local/docker-compose.yml up -d --no-build --force-recreate --remove-orphans

#stop project containers by local machine
stop:
	docker-compose -f docker/deploy/docker-compose.yml -f docker/deploy/local/docker-compose.yml stop
#start project containers by local machine
start:
	docker-compose -f docker/deploy/docker-compose.yml -f docker/deploy/local/docker-compose.yml start
#restart and recreate project containers by local machine
restart:
	docker-compose -f docker/deploy/docker-compose.yml -f docker/deploy/local/docker-compose.yml up -d --no-build --force-recreate --remove-orphans
#remove project containers and anonymous volumes by local machine
remove:
	docker-compose -f docker/deploy/docker-compose.yml -f docker/deploy/local/docker-compose.yml rm -fsv

#deploy last modification by external machines
deploy: pull-base pull-final
	docker-compose -f docker/deploy/docker-compose.yml -f docker/deploy/${CI_COMMIT_REF_SLUG}/docker-compose.yml up -d --no-build --force-recreate --remove-orphans
	make clean

#commands for images
build-%:
	docker-compose -f docker/build/$*/docker-compose.yml build
push-%:
	docker-compose -f docker/build/$*/docker-compose.yml push
pull-%:
	docker-compose -f docker/build/$*/docker-compose.yml pull

#delete not used images and volumes
clean:
	docker rmi `docker images -f dangling=true -q` || true
	docker volume rm `docker volume ls -f dangling=true -q` || true

#
# Helpers for developer by local configuration
#

#run php worker
php-worker:
	docker exec -it -u www-data:www-data ${COMPOSE_PROJECT_NAME}_php php worker.php

#login to php conteiner
php-login:
	docker exec -it -u www-data:www-data ${COMPOSE_PROJECT_NAME}_php bash