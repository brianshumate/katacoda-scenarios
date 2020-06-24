#!/usr/bin/env bash
# shellcheck disable=SC2143

if [[ $(docker ps -f name=vtl-vault --format "{{.Status}}" | grep -w healthy) ]]
  then
    echo "Vault server is healthy"
  else
    >&2 echo "Vault server container is not healthy. Please ensure it is healthy, and that you have initialized and unsealed it before continuing."
fi


if [[ $(vault status -format=json | jq -r '.initialized' | grep -q true) ]]
  then
    echo "Vault server is initialized"
  else
    >&2 echo "Vault server is not initialized. Please initialize it, unseal it, and login before continuing."
fi


if [[ $(vault token lookup -format=json | jq -r '.data.policies[0]' | grep -q root) ]]
  then
    echo "Vault token contains root policy"
  else
    >&2 echo "Vault token does not contain root policy; you need to login with the initial root token before continuing."
fi
