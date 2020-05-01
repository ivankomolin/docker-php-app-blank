#!/usr/bin/env bash

/opt/wait-for-it.sh -s -t 0 ${MYSQL_HOST}:${MYSQL_PORT} -- \
/opt/wait-for-it.sh -s -t 0 ${REDIS_HOST}:${REDIS_PORT} -- \
sudo -EH -u www-data bash -c " \
	php listener.php
"