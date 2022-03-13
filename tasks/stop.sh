#!/bin/bash
HOME_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )/..

cd "$HOME_DIR"
docker-compose down -v
