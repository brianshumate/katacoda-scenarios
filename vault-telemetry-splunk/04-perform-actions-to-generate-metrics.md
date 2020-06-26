> Click the command (`⮐`) to automatically copy it into the terminal and execute it.

This step will help guide you to generate new data in Vault and as a result, updated telemetry metrics in Splunk.

You will use the `vault` CLI for these steps, so run the following command to ensure that you are in the **Terminal** tab.

```shell
pwd
```{{execute T1}}

## K/V version 2 secrets

Generate some secrets with an incrementally increasing count to produce telemetry metrics for later analysis.

For commands which will produce excessive output, the output is sent to a log file to keep the terminal uncluttered. You should wait until the `$` prompt re-appears after executing each command before executing the next command.

First, enable a K/V version 2 secrets engine.

```shell
vault secrets enable -version=2 kv
```{{execute T1}}

Now, generate 10 secrets.

```shell
for i in {1..10}
  do
    printf "."
    vault kv put kv/$i-secret foo=bar > 10-secrets.log 2>&1
done
```{{execute T1}}

Next, generate 25 secrets (which also updates first 10 secrets).

```shell
for i in {1..25}
  do
    printf "."
    vault kv put kv/$i-secret foo=bar > 25-secrets.log 2>&1
done
```{{execute T1}}

Finally, generate 50 secrets (which also updates first 35 secrets).

```shell
for i in {1..50}
  do
    printf "."
    vault kv put kv/$i-secret foo=bar > 35-secrets.log 2>&1
done
```{{execute T1}}

## Tokens & Leases

Enable a username and password (userpass) auth method and login with it to generate some tokens and leases.

First, enable the auth method.

```shell
vault auth enable userpass
```{{execute T1}}

Next, add a learner user with the password **p@ssw0rd**.

```shell
vault write auth/userpass/users/learner password=p@ssw0rd
```{{execute T1}}

Now, login to Vault 10 times as the learner user.

```shell
for i in {1..10}
  do
    printf "."
    vault login \
      -method=userpass \
      username=learner \
      password=p@ssw0rd > 10-userpass.log 2>&1
done
```{{execute T1}}

Login 25 times as the learner user.

```shell
for i in {1..25}
  do
    printf "."
    vault login \
      -method=userpass \
      username=learner \
      password=p@ssw0rd > 25-userpass.log 2>&1
done
```{{execute T1}}


Login 50 times as the learner user.

```shell
for i in {1..50}
  do
    printf "."
    vault login \
      -method=userpass \
      username=learner \
      password=p@ssw0rd > 50-userpass.log 2>&1
done
```{{execute T1}}

Since you have been logging in with the username and password auth method, you are no longer authenticated to Vault with the root token.

Before continuing, login once again with the initial root token.

```shell
vault login -no-print \
$(grep 'Initial Root Token' .vault-init | awk '{print $NF}')
```{{execute T1}}

Click **Continue** to proceed to step 5, where you can observe the new metrics around the activities you just performed.
