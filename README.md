# Docker image to backup MariaDB (maybe MySQL too) and files

See repository on [Docker Hub](https://hub.docker.com/r/brabholdsa/backup)

## Supported tags and respective `Dockerfile` links

- [ `latest` (*Dockerfile*)](https://github.com/brabhold/docker-backup/blob/main/Dockerfile)

## Environment variables

### DB

- `TZ` (default: `Europe/Brussels`)  
Define timezone.

- `USE_MARIADB_BACKUP` (default: `false`) **Warning MariaDB >= 10.9**  
Use `mariadb-backup` command.  
You should ensure that user account has sufficient permissions to read MariaDB's files from the file system.  
Don't forget to mount the `/var/lib/mysql` directory  

- `MARIADB_BACKUP_DIR` (default: `/backup/mariadb-backup`)  
Backup directory.

- `USE_MARIADB_DUMP` (default: `true`)  
Use `mariadb-dump` command.

- `MARIADB_DUMP_DIR` (default: `/backup/mariadb-dump`)  
Backup directory.

- `MARIADB_BACKUP_RETENTION_DAYS` (default: 7)  
Set backup db retention days.

### Files

- `FILES_TO_BACKUP` (default: `null`)  
Path of files to backup. If `null`, no backup are made.  
Various paths is possible (ex: `FILES="/path/to/directory-01 /path/to/directory-02"`)

- `FILES_BACKUP_DIR` (default: `/backup/files`)  
Backup directory.

- `FILES_BACKUP_RETENTION_DAYS` (default: 7)  
Set backup files retention days.

## MariaDB variables (required)

- `MARIADB_HOSTNAME`  
Specify MariaDB host name.

- `MARIADB_PORT`  
Specify MariaDB port.

- `MARIADB_USER`, `MARIADB_PASSWORD`  
Specify user and password with right permissions.

- `MARIADB_DATABASE`  
Specify the name of a database.
