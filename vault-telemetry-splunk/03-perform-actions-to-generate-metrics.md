> Click on the command (`⮐`) will automatically copy it into the terminal and execute it.

## Use Vault

Export VAULT_ADDR to communicate with the Vault container.

```shell
$ export VAULT_ADDR=http://127.0.0.1:8200
```

Get a quick status.

```shell
$ vault status
Key                Value
---                -----
Seal Type          shamir
Initialized        false
Sealed             true
Total Shares       0
Threshold          0
Unseal Progress    0/0
Unseal Nonce       n/a
Version            n/a
HA Enabled         false
```