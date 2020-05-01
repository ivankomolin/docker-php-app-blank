.PHONY: *

#Указываем конфигурацию для docker-compose
#Можно использовать наследование через символ ":", последний файл важнее
export COMPOSE_FILE=./docker-compose.yml

##
# Сборка всех образов
##
build:
	docker-compose build

##
# Сборка конкретного образа
##
build-%:
	docker-compose build $*

##
# Выгрузка всех образов в registry
##
push:
	docker-compose push

##
# Загрузка всех образов из registry
##
pull:
	docker-compose pull
