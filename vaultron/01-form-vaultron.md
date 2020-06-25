> Click on the command (`⮐`) will automatically copy it into the terminal and execute it.

The first step in this lab is to form Vaultron.

You need to export some environment variables to select a Vaultron flavor.

By default, Vaultron uses the Consul storage backend.

If you want to use Vault with the integrated storage (Raft) backend, export these environment variables.

```
export TF_VAR_vault_flavor=raft \
    TF_VAR_vault_oss_instance_count=5 \
    TF_VAR_vault_custom_instance_count=0
```{{execute T1}}

Now, change into the `vaultron` project repository directory.

```
cd vaultron
```{{execute T1}}

Form Vaultron.

```
./form
```{{execute T1}}

Click **Continue** to proceed to step 2, where you will define additional environment variables for using Vaultron.
