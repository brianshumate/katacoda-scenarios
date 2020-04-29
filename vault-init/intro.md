[HashiCorp Vault](https://www.vaultproject.io) secures, stores, and tightly controls access to tokens, passwords, certificates, API keys, and other secrets in modern computing.

Before you can use Vault, the first step is to initialize it.

This can be done either with the [/sys/init HTTP API endpoint](https://www.vaultproject.io/api-docs/system/init) or with the [vault operator init CLI command](https://www.vaultproject.io/docs/commands/operator/init).

This lab guides you through initializing Vault in a variety of ways so that you can gain some familiarity with the process, outputs, and so on.

Vault is already running with a minimal Filesystem storage based configuration.

After each example initialization, you will have the opportunity to execute a clean up script that will reset Vault for the next example.
