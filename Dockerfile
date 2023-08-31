
FROM debian:bookworm-slim
LABEL maintainer="Yannick Vanhaeren"

ARG DEBIAN_FRONTEND=noninteractive

RUN set -e; \
    apt-get update; \
    apt-get install -y mariadb-client mariadb-backup; \
    apt-get clean; \
    rm -r /var/lib/apt/lists/*

ENV TZ "Europe/Brussels"
ENV MARIADB_BACKUP false
ENV MARIADB_DUMP true
ENV BACKUP_DIR /backup
ENV BACKUP_RETENTION_DAYS 7

COPY bin/* /usr/local/bin/

CMD ["tail", "-F", "/dev/null"]
