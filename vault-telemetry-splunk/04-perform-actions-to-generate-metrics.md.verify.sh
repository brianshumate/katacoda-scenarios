#!/usr/bin/env bash
shellcheck disable=SC2143

if vault secrets list --detailed | grep kv/ | grep -q 'version:2'
  then
    echo "done"
  else
    echo "K/V version 2 secrets engine is not enabled." >> "$HOME"/04-perform-actions.log 2>&1
fi

if vault kv list kv/ | grep -q 50-secret
  then
    echo "done"
  else
    echo "Missing 50-secret from K/V secrets engine" >> "$HOME"/04-perform-actions.log 2>&1
fi

if vault auth list | grep -q userpass/
  then
    echo "done"
  else
    echo "Username and password auth method not enabled." >> "$HOME"/04-perform-actions.log 2>&1
fi


if vault list auth/userpass/users/ | grep -q learner
  then
    echo "done"
  else
    echo "learner user not present" >> "$HOME"/04-perform-actions.log 2>&1
fi
