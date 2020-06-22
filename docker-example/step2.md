Initialize and unseal Vault

> Click on the command (`⮐`) will automatically copy it into the terminal and execute it.

The default initialization without arguments results in Vault using the [Shamir's Secret Sharing algorithm](https://en.wikipedia.org/wiki/Shamir%27s_Secret_Sharing) to split the unseal key in to 5 key shares with a required quorum of 3 unseal keys needed to successfully unseal Vault.

For this example, you can use just one key share to speed up the manual unseal process.

```
vault operator init -key-shares=1 -key-threshold=1
```{{execute T1}}

Copy and paste unseal key and initial root token values when prompted to unseal Vault and login.

```
vault operator unseal
```{{execute T1}}

```
vault login
```{{execute T1}}
