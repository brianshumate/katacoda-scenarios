> Click on the command (`⮐`) will automatically copy it into the terminal and execute it.

The script `blazing_sword` is included as a convenience to quickly populate Vault with some initial configuration.

It uses Terraform and the Vault provider to enable an audit device, add secrets engines, auth methods, and much more.

After Vaultron is formed, you can run it like this.

```
./blazing_sword
```{{execute T1}}

The successful output will display a fair amount of detail about what was done.
