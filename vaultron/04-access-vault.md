> Click on the command (`⮐`) will automatically copy it into the terminal and execute it.

You should now be ready to access Vault.

If you chose to use `blazing_sword` you will be logged into Vault with the initial root token and can begin issuing `vault` commands or access the Vault UI.

If not, you need to initialize, unseal, and login to Vault manually.

Here is a simple sequence for doing so.

First, initialize Vault with 1 key share and a key threshold of 1 while saving the output to the file `.vault-init`.

```
vault operator init \
    -key-shares=1 \
    -key-threshold=1 \
    | head -n3 \
    | cat > .vault-init
```{{execute T1}}

This command should produce no output when successful.

Now, unseal Vault with the **Unseal Key 1** value from the `.vault-init` file.

```
vault operator unseal $(grep 'Unseal Key 1'  .vault-init | awk '{print $NF}')
```{{execute T1}}

Successful output from unsealing Vault should resemble this example:

```
Key             Value
---             -----Seal Type       shamir
Initialized     true
Sealed          false
Total Shares    1
Threshold       1
Version         1.4.2
Cluster Name    vault-cluster-f6a41c2e
Cluster ID      3a4aca58-eaaf-ae81-6856-8dc8524c9404
HA Enabled      false
```

Finally, you can login to Vault with `vault login` by passing the **Initial Root Token** value from `.vault-init` file.

```
vault login -no-print \
$(grep 'Initial Root Token' .vault-init | awk '{print $NF}')
```{{execute T1}}

This command should produce no output when successful. If you want to confirm that the login was successful, try a token lookup.

```
vault token lookup | grep policies
```{{execute T1}}

Successful output should contain the following.

```plaintext
policies            [root]
```

-> **NOTE:** In addition to the tab inline, you can also access the [Vault UI](https://[[HOST_SUBDOMAIN]]-8200-[[KATACODA_HOST]].environments.katacoda.com/) in a separate browser tab.
