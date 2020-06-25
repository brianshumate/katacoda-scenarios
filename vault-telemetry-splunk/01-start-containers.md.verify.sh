#!/usr/bin/env bash
# shellcheck disable=SC2143

if [[ $(docker ps -f name=vtl-splunk --format "{{.Status}}" | grep -w healthy) ]]
then
  echo "done"
else
  echo "Splunk container is not healthy. Please ensure it is up and healthy before continuing." >> "$HOME"/01-start-containers.log 2>&1
fi
