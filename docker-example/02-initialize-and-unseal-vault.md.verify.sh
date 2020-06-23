#!/usr/bin/env bash
# shellcheck disable=SC2143
if [[ $(docker ps -f name=vtl-vault --format "{{.Status}}" | grep -w healthy) ]]
then
  echo "Vault server is healthy"
else
  echo "Vault server container is not healthy. Please ensure it is healthy, and that you have initialized and unsealed it before continuing."
fi


if [[ $(docker exec vtl-vault vault status | grep -qw Initialized | grep -w true) ]]
then
  echo "Vault server is initialized"
else
  echo "Vault server is not initialized. Please initialize it, unseal it, and login before continuing."
fi
