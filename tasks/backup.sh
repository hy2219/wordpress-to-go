#!/bin/bash
HOME_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )/..
source "$HOME_DIR"/CONSTANTS.sh
source "$HOME_DIR"/CREDENTIALS.sh
mkdir -p "$HOME_DIR"/backup

# backup wordpress container
docker run --rm --volumes-from "$WORDPRESS_CONTAINER" -v "$HOME_DIR":/backup busybox tar cvfz /backup/backup/"$WORDPRESS_BACKUP_FILE_NAME" /var/www/html

# backup database container
docker exec "$DB_CONTAINER" mysqldump --no-tablespaces -u "$DB_USER" --password="$DB_PASSWORD" "$DB_NAME" > "$BACKUP_DIR"/"$DB_BACKUP_FILE_NAME"
