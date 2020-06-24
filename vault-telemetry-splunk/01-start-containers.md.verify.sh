#!/usr/bin/env bash
# shellcheck disable=SC2143
if [[ $(docker ps -f name=vtl-splunk --format "{{.Status}}" | grep -w healthy) ]]
then
  echo "done"
else
  >&2 echo "Splunk container is not healthy. Please ensure it is up and healthy before continuing."
fi