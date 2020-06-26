Now that the stack is ready, you can access Splunk Web to have a look at the initial Vault telemetry metrics that are present.

Access the **Splunk Web** tab here in the scenario or if you prefer, you can [open Splunk Web](https://[[HOST_SUBDOMAIN]]-8000-[[KATACODA_HOST]].environments.katacoda.com/) in a separate browser tab.

Sign in to Splunk Web with these credentials:

- Username: admin
- Password: vtl-password

Acknowledge the _Helping You Get More Value from Splunk Software_ dialog by clicking **Got it!**.

Acknowledge any _Important changes coming!_ dialog by clicking **Don't show me this again**.

You are now ready to explore the existing Vault telemetry metrics.

1. Click the **Search & Reporting** navigation tab
1. Acknowledge any _Welcome, Administrator_ dialog by clicking **Skip**
1. Click the **Analytics** tab
1. Click **Metrics** in the left navigation to expand the metrics tree
1. Click **vault** to expand the Vault related metrics

A great deal of the metrics will not yet have values, but some such as the **runtime** metrics can be briefly explored to confirm that they are indeed present. Let's review a couple existing metrics.

1. Select the Vault runtime metrics by clicking **runtime** to expand them
1. Select **alloc_bytes.value**
1. A line graph will appear that should contain an indication of the memory currently allocated to the vault process expressed in megabytes.


Click **Continue** to proceed to step 4.
