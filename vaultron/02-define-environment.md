> Click on the command (`⮐`) will automatically copy it into the terminal and execute it.

Vaultron relies on setting some environment variables to correctly communicate with the stack. Depending on which storage backend you choose, you'll need to set these environment variables prior to forming Vaultron.

Choose ONE of the following beased on flavor of storage you chose to form Vaultron with.

## Integrated storage backend

Users of the integrated storage (Raft) backend should export the following environment variables.

```shell
$ export VAULT_ADDR="https://[[HOST_SUBDOMAIN]]-8200-[[KATACODA_HOST]].environments.katacoda.com/"
```{{execute T1}}

## Consul storage backend

Users of the Consul storage backend should export the following environment variables.

```shell
$ export CONSUL_HTTP_ADDR="VAULT_ADDR="https://[[HOST_SUBDOMAIN]]-8500-[[KATACODA_HOST]].environments.katacoda.com/"" \
    CONSUL_HTTP_SSL=true \
    CONSUL_HTTP_TOKEN="b4c0ffee-3b77-04af-36d6-738b697872e6" \
    VAULT_ADDR="https://[[HOST_SUBDOMAIN]]-8200-[[KATACODA_HOST]].environments.katacoda.com/"
```{{execute T1}}

Click **Continue** to proceed to step 3, where you can learn about Blazing Sword and automating some Vault configuration.
