Initialize Vault: the default


> Click on the command (`⮐`) will automatically copy it into the terminal and execute it.

The default initialization without arguments results in Vault using the [Shamir's Secret Sharing algorithm](https://en.wikipedia.org/wiki/Shamir%27s_Secret_Sharing) to split the unseal key in to 5 key shares with a required quorum of 3 unseal keys needed to successfully unseal Vault.

The default output of the command is table style.

```
vault operator init
```{{execute T1}}

Now that you have observed the default behavior, go ahead and reset Vault in preparation for the next step.

```
reset.sh
```{{execute T1}}
