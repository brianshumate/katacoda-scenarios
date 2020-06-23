#!/usr/bin/env bash
# shellcheck disable=SC2143
if [[ $(docker ps -f name=vtl-vault --format "{{.Status}}" | grep -qw healthy) ]]
then
  echo "done"
else
  echo "Splunk container is not healthy. Please ensure it is healthy before continuing."
fi