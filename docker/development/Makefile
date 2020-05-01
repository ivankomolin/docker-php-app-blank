#Указываем конфигурацию для docker-compose
#Можно использовать наследование через символ ":", последний файл важнее
export COMPOSE_FILE=./docker-compose.yml

##
# Запустить/пересоздать контейнеров из образов
# 
# Пример: make up
up:
	docker-compose up -d --no-build --force-recreate --remove-orphans

##
# Останавить и удалить контейнеры проекта
#
# Пример: make down
##
down:
	docker-compose down -v

##
# Запустить bash внутри контейнера
#
# Пример: make bash-php
##
bash-php:
	docker-compose exec -u www-data php bash
bash-php-root:
	docker-compose exec php bash
bash-%:
	docker-compose exec $* bash

##
# Посмотреть логи сервиса в фоллоу режиме
#
# Пример: make log-php или make log-nginx
##
log-%:
	docker-compose logs -f $*

##
# Перезапустить сервис
#
# Пример: make restart-php
##
restart-%:
	docker-compose restart $*

##
# Добавить записи hosts
# Можно добавлять или удалять адреса, т.к. производится замена всей секции ${DOMAIN}
# Необходимо запускать от рута, т.к. необходимо произвести изменения в файле /etc/hosts
##
hosts:
	sed -zi 's/#${DOMAIN} start.*#${DOMAIN} end\n//' /etc/hosts
	sed -i "2i#${DOMAIN} start\n\
		127.0.132.1	${DOMAIN}\n \
		127.0.132.2	pma.${DOMAIN}\n \
		127.0.132.3	rc.${DOMAIN}\n \
		#${DOMAIN} end" /etc/hosts
