# Docker image to backup MariaDB (maybe MySQL too)

See repository on [Docker Hub](https://hub.docker.com/r/brabholdsa/mariadb-backup)

# Environment variables

`TZ` (default: `Europe/Brussels`)

Define timezone.

`MARIABACKUP` (default: `false`)

Use mariabackup command.  
You should ensure that user account has sufficient permissions to read MariaDB's files from the file system.  
Don't forget to mount the `/var/lib/mysql` directory

`MYSQLDUMP` (default: `true`)

Use mysqldump command.

`BACKUP_DIR` (default: `/backup`)

Backup directory.

`BACKUP_RETENTION_DAYS` (default: 7)

Set backup files retention days.

`SCHEDULE` (required)

Set cron schedule expressions. (ex: "5 4 * * sun" to say "At 04:05 on Sunday.")

# MariaDB variables (required)

`MYSQL_HOSTNAME`

Specify MariaDB host name.

`MYSQL_PORT`

Specify MariaDB port.

`MYSQL_USER`, `MYSQL_PASSWORD`

 Specify user and password with right permissions.

`MYSQL_DATABASE`

Specify the name of a database.
