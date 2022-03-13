#!/bin/bash
HOME_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )/..
source "$HOME_DIR"/CONSTANTS.sh
source "$HOME_DIR"/CREDENTIALS.sh

# restore wordpress container
docker run --rm --volumes-from "$WORDPRESS_CONTAINER" -v "$(pwd)"/backup:/backup busybox sh -c "cd /var && tar xvf /backup/$WORDPRESS_BACKUP_FILE_NAME --strip 1"

# restore database container
docker exec -i "$DB_CONTAINER" mysql -u "$DB_USER" --password="$DB_PASSWORD" "$DB_NAME" < "$BACKUP_DIR"/"$DB_BACKUP_FILE_NAME"

# set new url
source "$HOME_DIR"/tasks/set_url.sh
