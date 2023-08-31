
FROM debian:bookworm-slim
LABEL maintainer="Yannick Vanhaeren"

ARG DEBIAN_FRONTEND=noninteractive

RUN set -e; \
    apt-get update; \
    apt-get install -y software-properties-common dirmngr apt-transport-https; \
    apt-get clean; \
    rm -r /var/lib/apt/lists/*

RUN set -e; \
    apt-get update; \
    apt-get install -y mariadb-client mariadb-backup cron; \
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
