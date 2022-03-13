#!/bin/bash
HOME_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
TASKS_DIR="$HOME_DIR"/tasks

sh "$TASKS_DIR"/substitute.sh

PS3='Please enter task: '
options=("start" "backup" "restore" "stop" "quit selection")
select opt in "${options[@]}"
do
    case $opt in
        "start")
            sh "$TASKS_DIR"/start.sh
            ;;
        "backup")
            sh "$TASKS_DIR"/backup.sh
            ;;
        "restore")
            sh "$TASKS_DIR"/restore.sh
            ;;
        "stop")
            sh "$TASKS_DIR"/stop.sh
            ;;
        "quit selection")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
