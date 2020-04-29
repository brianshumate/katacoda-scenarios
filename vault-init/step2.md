Initialize Vault: JSON output, please!


> Click on the command (`⮐`) will automatically copy it into the terminal and execute it.

The default initialization without arguments results in Vault using the [Shamir's Secret Sharing algorithm](https://en.wikipedia.org/wiki/Shamir%27s_Secret_Sharing) to split the unseal key in to 5 key shares with a required quorum of 3 unseal keys needed to successfully unseal Vault.

The default output of the command is table style.

In this example we are simply asking Vault to output the results as JSON.

```
vault operator init -format=json
```{{execute T1}}
