## Install by local machine 

Requirements:
 - Docker v18.09+
 - Docker-compose v1.23+
 - Git
 - Make

Run these commands in an empty working directory
```
$ git clone https://github.com/ivankomolin/docker-php-app-blank ./
$ make install
```

After installation are available web applications:  
 - [http://127.0.0.1:9001](http://127.0.0.1:9001) - App
 - [http://127.0.0.1:9002](http://127.0.0.1:9002) - Mysql client for developer
 - [http://127.0.0.1:9003](http://127.0.0.1:9003) - Redis client for developer


## Helpers for developer

Runing php worker

```
$ make php-worker
```

Login to php container

```
$ make php-login
```
