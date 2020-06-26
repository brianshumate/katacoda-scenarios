> Click on the command (`⮐`) will automatically copy it into the terminal and execute it.

This step will help guide you to generate new data in Vault and as a result, new telemetry metrics in Splunk.

## Static K/V secrets

You can generate some secrets with an incrementally increasing count to produce telemetry metrics for later analysis. For commands which will produce a great deal of output, the output is sent to a log file to keep the terminal uncluttered.

Enable a K/V version 2 secrets engine to begin.

```
vault secrets enable -version=2 kv
```{{execute T1}}

Now, generate 10 secrets.

```
for i in {1..10}
  do
    vault kv put kv/$i-secret foo=bar > 10-secrets.log 2>&1
done
```{{execute T1}}

Next, generate 25 secrets and update first 10 secrets.

```
for i in {1..25}
  do
    vault kv put kv/$i-secret foo=bar > 25-secrets.log 2>&1
done
```{{execute T1}}

Finally, generate 50 secrets and update first 35 secrets.

```
for i in {1..50}
  do
    vault kv put kv/$i-secret foo=bar > 35-secrets.log 2>&1
done
```{{execute T1}}

## Tokens & Leases

Now enable a username and password (userpass) auth method and login with it to generate some tokens and leases.

First, enable the auth method.

```
vault auth enable userpass
```{{execute T1}}

Next, add a learner user with the password **p@ssw0rd**.

```
vault write auth/userpass/users/learner password=p@ssw0rd
```{{execute T1}}

Now, login to Vault 10 times as the learner user.

```
for i in {1..10}
  do
    vault login \
      -method=userpass \
      username=learner \
      password=p@ssw0rd > 10-userpass.log 2>&1
done
```{{execute T1}}

Login 25 times as the learner user.

```
for i in {1..25}
  do
    vault login \
      -method=userpass \
      username=learner \
      password=p@ssw0rd > 25-userpass.log 2>&1
done
```{{execute T1}}


Login 50 times as the learner user.

```
for i in {1..50}
  do
    vault login \
      -method=userpass \
      username=learner \
      password=p@ssw0rd > 50-userpass.log 2>&1
done
```{{execute T1}}

Since you have been logging in with the username and password auth method, you are no longer logged in with the root token. Before continuing, login once again with the initial root token.

```
vault login -no-print \
$(grep 'Initial Root Token' .vault-init | awk '{print $NF}')
```{{execute T1}}

Click **Continue** to proceed to step 5.
