#Указываем конфигурацию для docker-compose
#Можно использовать наследование через символ ":", последний файл важнее
export COMPOSE_FILE=docker-compose.yml:${CI_COMMIT_REF_SLUG}/docker-compose.yml

##
# Деплой на контур
# 
# Пример: make deploy
deploy:
	docker-compose pull
	docker-compose down -v
	docker-compose up -d --no-build --remove-orphans

##
# Итоговый конфиг после мержа конфигураций
# 
# Пример: make config
config:
	docker-compose config