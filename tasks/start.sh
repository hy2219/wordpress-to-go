#!/bin/bash
HOME_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )/..
source "$HOME_DIR"/CONSTANTS.sh
source "$HOME_DIR"/CREDENTIALS.sh

docker-compose up -d

sleep 5

IS_INITIALIZING=1
source "$HOME_DIR"/tasks/set_url.sh
IS_INITIALIZING=0
