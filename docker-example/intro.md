[HashiCorp Vault](https://www.vaultproject.io) secures, stores, and tightly controls access to tokens, passwords, certificates, API keys, and other secrets in modern computing.

One part of the data available from an operating Vault instance is the [Telemetry Metrics](https://www.vaultproject.io/docs/internals/telemetry).

These are available for exporting or pulling depending on the solution used and further analyzed in visual ways with dashboards.

This guide helps you to quickly deploy a simple Vault server with Telegraf and Splunk in Docker using Terraform to give you a basic idea of what is possible and as a means to inform your own telemetry aggregation and analysis stack.

Specifically, you will do the following while working through this guide:

1. **Start the containers** - this is where Terraform helps. By defining and applying a plan, we can orchestrate the deployment down to all required configuration items in each component of the stack.
1. **Initialize and unseal Vault** - Prepare Vault for use by initializing it and unsealing it. You will also login to Vault so that you can use it for the next step.
1. **Perform actions to generate metrics** - Vault will generate some runtime metrics even in an uninitialized and sealed state. Use this step to generate some more interesting metrics that you can then check out in Splunk.
1. **Analyze generated metrics** - Use Splunk Web to analyze, search, and visualize Vault telemetry metrics.
