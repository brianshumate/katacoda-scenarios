## version 0.4.2

Vault produces a rich set of operational and usage data to provide insight into the life of your Vault servers. One part of the data available from an operating Vault server is the [Telemetry Metrics](https://www.vaultproject.io/docs/internals/telemetry).

The [telemetry be configured](https://www.vaultproject.io/docs/configuration/telemetry) for exporting metrics or pulling of metrics depending on the solution used. Aggregated metrics can then be further analyzed in visual ways with dashboards and alerted on based on your criteria.

This scenario helps you to quickly deploy a simple Vault server with Telegraf and Splunk in Docker using Terraform to give you a basic idea of what is possible with the telemetry metrics and as a means to inform your own telemetry aggregation and analysis stack.

Specifically, you will do the following while working through this scenario:

1. **Start the containers** - this is where Terraform gets a chance to shine. By defining and applying a plan, we can orchestrate the entire deployment with Terraform, down to all required configuration items in each component of the stack.
1. **Initialize and unseal Vault** - Prepare Vault for use by initializing it and unsealing it. You will also login to Vault so that you can use it for the next steps.
1. **Perform actions to generate metrics** - Vault will generate some runtime metrics even in an uninitialized and sealed state, but you can use this step to generate additional interesting metrics that you can then check out in Splunk.
1. **Analyze generated metrics** - Use Splunk Web to analyze, search, and visualize your Vault telemetry metrics.

Click **START SCENARIO** to begin.
