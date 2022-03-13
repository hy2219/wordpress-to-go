#!/bin/bash
HOME_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )/..
source "$HOME_DIR"/CREDENTIALS.sh

sed -i "" "s|___DB_USER___|$DB_USER|g" "$HOME_DIR"/docker-compose.yml
sed -i "" "s|___DB_PASSWORD___|$DB_PASSWORD|g" "$HOME_DIR"/docker-compose.yml
sed -i "" "s|___DB_ROOT_PASSWORD___|$DB_ROOT_PASSWORD|g" "$HOME_DIR"/docker-compose.yml
sed -i "" "s|___DB_NAME___|$DB_NAME|g" "$HOME_DIR"/docker-compose.yml
