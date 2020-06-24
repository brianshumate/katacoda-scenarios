> Click on the command (`⮐`) will automatically copy it into the terminal and execute it.

This step will have you generating some new data in Vault and as a result, new telemetry metrics in Splunk.

## Static K/V secrets

Enable a K/V version 2 secrets engine.

```
vault secrets enable -version=2 kv
```{{execute T1}}

Generate 10 secrets.

```
for i in {1..10}
  do
    vault kv put kv/$i-secret foo=bar
done
```{{execute T1}}

Generate 25 secrets / update first 10 secrets.

```
for i in {1..25}
  do
    vault kv put kv/$i-secret foo=bar
done
```{{execute T1}}

Generate 50 secrets / update first 35 secrets.

```
for i in {1..50}
  do
    vault kv put kv/$i-secret foo=bar
done
```{{execute T1}}

## Tokens

Enable a userpass auth method.

```
vault auth enable userpass
```{{execute T1}}

Add a learner user.

```
vault write auth/userpass/users/learner password=p@ssw0rd
```{{execute T1}}

Login 10 times as the learner user.

```
for i in {1..10}
  do
    vault login -method=userpass username=learner password=p@ssw0rd
done
```{{execute T1}}

Login 25 times as the learner user.

```
for i in {1..25}
  do
    vault login -method=userpass username=learner password=p@ssw0rd
done
```{{execute T1}}


Login 50 times as the learner user.

```
for i in {1..50}
  do
    vault login -method=userpass username=learner password=p@ssw0rd
done
```{{execute T1}}
