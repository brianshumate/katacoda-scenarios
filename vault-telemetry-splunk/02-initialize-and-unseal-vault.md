> Click on the command (`⮐`) will automatically copy it into the terminal and execute it.

The default initialization without arguments results in Vault using the [Shamir's Secret Sharing algorithm](https://en.wikipedia.org/wiki/Shamir%27s_Secret_Sharing) to split the unseal key in to 5 key shares with a required quorum of 3 unseal keys needed to successfully unseal Vault.

For this example, you can use just one key share to speed up the manual unseal process.

> **NOTE**:You might have noticed that when this step began, a proper `VAULT_ADDR` environment variable was set to a URL that represents the Vault docker container. This is done to ensure your commands address the correct server.

Proceed to initializing Vault with 1 key share and a key threshold of 1.

```
vault operator init -key-shares=1 -key-threshold=1
```{{execute T1}}


Now, copy the unseal key from previous output, and paste it when prompted to unseal Vault.

```
vault operator unseal
```{{execute T1}}

Finally, you are ready to login; copy the initial root token value, and paste it when prompted.

```
vault login
```{{execute T1}}
