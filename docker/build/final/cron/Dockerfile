FROM docker:18.09 as docker

FROM alpine:3.8

COPY --from=docker /usr/local/bin/docker /usr/local/bin/docker

COPY etc/crontab /etc/crontabs/root

CMD ["crond", "-f"]