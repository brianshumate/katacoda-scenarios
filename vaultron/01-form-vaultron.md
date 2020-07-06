> Click on the command (`⮐`) will automatically copy it into the terminal and execute it.

The first step in this lab is to form Vaultron.

You need to export some environment variables to select a Vaultron flavor.

By default, Vaultron uses the Consul storage backend, but this example will use Vault with the integrated storage (Raft) backend by exporting these environment variables.

```shell
export TF_VAR_vault_flavor=raft \
    TF_VAR_vault_oss_instance_count=5 \
    TF_VAR_vault_custom_instance_count=0
```{{execute T1}}

Be sure to change into the `vaultron` project repository directory.

```shell
cd vaultron
```{{execute T1}}

Finally, it's time to form Vaultron!

```shell
./form
```{{execute T1}}

Click **Continue** to proceed to step 2, where you will define additional environment variables for using Vaultron.
