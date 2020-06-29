#!/usr/bin/env bash
# shellcheck disable=SC2143

export log_dir="/home/scrapbook/tutorial/.log"

if vault secrets list --detailed | grep kv/ | grep -q 'version:2'
  then
    echo "done"
  else
    echo "K/V version 2 secrets engine is not enabled." >> "$log_dir"/04-perform-actions.log 2>&1
fi

if vault kv list kv/ | grep -q 50-secret
  then
    echo "done"
  else
    echo "Missing 50-secret from K/V secrets engine" >> "$log_dir"/04-perform-actions.log 2>&1
fi

if vault auth list | grep -q userpass/
  then
    echo "done"
  else
    echo "Username and password auth method not enabled." >> "$log_dir"/04-perform-actions.log 2>&1
fi


if vault list auth/userpass/users/ | grep -q learner
  then
    echo "done"
  else
    echo "learner user not present" >> "$log_dir"/04-perform-actions.log 2>&1
fi
