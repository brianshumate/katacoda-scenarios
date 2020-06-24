> Click on the command (`⮐`) will automatically copy it into the terminal and execute it.

The default initialization without arguments results in Vault using the [Shamir's Secret Sharing algorithm](https://en.wikipedia.org/wiki/Shamir%27s_Secret_Sharing) to split the unseal key in to 5 key shares with a required quorum of 3 unseal keys needed to successfully unseal Vault.

For this example, you can use just one key share to speed up the manual unseal process.

> **NOTE**: You might have noticed that when this step began, a `VAULT_ADDR` environment variable was exported to a URL that represents the Vault docker container. This is done to ensure your commands address the correct server.

Proceed to initializing Vault with 1 key share and a key threshold of 1.

```
vault operator init -key-shares=1 -key-threshold=1
```{{execute T1}}

Successful output from initialization begins with an Unseal Key 1 and Initial Root Token. These values are used for the following steps.

```
vault operator unseal
```{{execute T1}}

Successful output from unsealing resembles this example:

```
Unseal Key (will be hidden):
Key             Value
---             -----
Seal Type       shamir
Initialized     true
Sealed          false
Total Shares    1
Threshold       1
Version         1.4.2
Cluster Name    vault-cluster-6fb2daa0
Cluster ID      5ba3f55d-f18e-2bf6-2313-61f1a349abaa
HA Enabled      false
```

Finally, you are ready to login to Vault.

Copy the value of **Initial Root Token** from the initialization output, and paste it when prompted.

```
vault login
```{{execute T1}}

Successful output from login resembles this example:

```
Success! You are now authenticated. The token information displayed below
is already stored in the token helper. You do NOT need to run "vault login"
again. Future Vault requests will automatically use this token.

Key                  Value
---                  -----
token                s.Jkdbfyg43bNouXwrycCAQQVJ
token_accessor       SrGXwd5q2ZWdQQK3hdvS8Zs1
token_duration       ∞
token_renewable      false
token_policies       ["root"]
identity_policies    []
policies             ["root"]
```

You are now ready to perform some actions that will generate new telemetry metrics to work with in Splunk Web.

Click **Continue** to proceed to step 3.
