#!/bin/sh
set -e

# Добавляем в /etc/hosts домен host, который является адресом хост машины
ip route | head -n 1 | awk '{print $3 " host"}' >> /etc/hosts;

exec "$@"
