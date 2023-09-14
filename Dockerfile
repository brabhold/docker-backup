
FROM debian:bookworm-slim
LABEL maintainer="Yannick Vanhaeren"

ARG DEBIAN_FRONTEND=noninteractive

RUN set -e; \
    apt-get update; \
    apt-get install -y mariadb-client mariadb-backup; \
    apt-get clean; \
    rm -r /var/lib/apt/lists/*

ENV TZ "Europe/Brussels"
ENV USE_MARIADB_BACKUP false
ENV MARIADB_BACKUP_DIR "/backup/mariadb-backup"
ENV USE_MARIADB_DUMP true
ENV MARIADB_DUMP_DIR "/backup/mariadb-dump"
ENV MARIADB_BACKUP_RETENTION_DAYS 7

ENV FILES_BACKUP_DIR "/backup/files"
ENV FILES_BACKUP_RETENTION_DAYS 7

COPY bin/* /usr/local/bin/

CMD ["tail", "-F", "/dev/null"]
