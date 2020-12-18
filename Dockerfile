
FROM debian:buster-slim
LABEL maintainer="Yannick Vanhaeren"

ARG DEBIAN_FRONTEND=noninteractive

RUN set -eux; \
    apt-get update && apt-get install -y software-properties-common dirmngr apt-transport-https; \
    apt-get clean; \
    rm -r /var/lib/apt/lists/*

RUN set -eux; \
    apt-key --keyring /etc/apt/trusted.gpg.d/mariadb.gpg adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc'; \
    sh -c 'echo "deb [arch=amd64] http://ams2.mirrors.digitalocean.com/mariadb/repo/10.5/debian buster main" > /etc/apt/sources.list.d/mariadb.list'; \
    apt-get update && apt-get install -y mariadb-client mariadb-backup cron; \
    apt-get clean; \
    rm -r /var/lib/apt/lists/*

ENV TZ "Europe/Brussels"
ENV MARIABACKUP false
ENV MYSQLDUMP true
ENV BACKUP_DIR /backup
ENV BACKUP_RETENTION_DAYS 7

COPY bin/* /usr/local/bin/

ENTRYPOINT ["docker-entrypoint"]

CMD ["cron", "-f"]
