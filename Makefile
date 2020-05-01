include docker/.env
ifneq ("$(wildcard docker/.env.override)", "")
	include docker/.env.override
endif
export

.PHONY: *

#Сборка
build push pull:
	make -C docker/build $@
build-%:
	make -C docker/build $@

#Разработка
up down hosts:
	make -C docker/development $@
bash-% log-% restart-%:
	make -C docker/development $@

#Деплой
deploy config:
	make -C docker/deploy $@