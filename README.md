## Пример docker окружения для web приложения(nginx,php-fpm,mysql,redis)

1. Установить зависимости:  
 - Docker v18.09+
 - Docker-compose v1.23+
 - Git  
 - Make  

2. Клонировать репозиторий:  
```
$ git clone https://github.com/ivankomolin/docker-php-app-blank ./
```

3. Указать свободный порт* в системе и домен, по которому будут отвечать сервисы:  
```
Переменная FREE_PORT и DOMAIN в файле docker/.env
```

`Не обязательно, если свободен 80 порт, он используется по умолчанию`

4. Собрать образы и запустить сервисы:  
```
$ make build
$ make up
```

5. Добавить записи с адресами сервисов в /etc/hosts:  
```
$ sudo make hosts
```

`Не обязательно, можно обращаться по ip, см: docker/development/docker-compose.yml`

### Результат  

После успешного запуска будут доступны следующие сервисы:  
 - http://example.local - Web сервер, который смотрит в директорию src
 - http://pma.example.local - GUI mysql  
 - http://rc.example.local - GUI redis

`Если FREE_PORT отличен от 80, то необходимо указывать порт через ":", например: http://example.local:1010`

### Херперы для работы  

Просмотр логов контейнера:  
make log-{service}, например:  
```
$ make log-mysql
```

Вход в контейнер:  
make bash-{service}, например:  
```
$ make bash-php
```

Остальные команды можно посмотреть здесь: [docker/development/Makefile](./docker/development/Makefile)
