#!/usr/bin/env bash

filename=$(basename "$0")
type=$1

if [[ $type == 'api' ]]; then
  docker compose -f ./pp.yml up --build
elif [[ $type == 'web' ]]; then
  docker compose -f ./pp-with-web.yml up --build
else
  echo "specify type, for example: ./${filename} web|api"
fi
