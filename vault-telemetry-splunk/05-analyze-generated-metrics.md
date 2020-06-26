Now that you have generated some secrets and leases by logging in with the username and password auth method, click the **Splunk Web** tab and explore the updated metrics.

First, examine the metrics under **core** again.

1. Click **core** to expand the core metrics
1. Click the **handle** metrics to expand request handling metrics
1. Click **login_request** to expand the available metric types related handling of login  requests.
1. Click **count** to get a count of login requests handled; you should observe a chart with just 1 entry corresponding to your previous login with the root token in step 2

Finally, navigate to the **expire** metrics, which correspond to leases.

1. Click **expire** to expand the expiration metrics
1. Click **num_leases.value**
1. A chart with zero values appears; this is expected as no leases have yet been generated.

Feel free to continue exploring the currently available metrics before proceeding. For those you are curious about, refer to the [Telemetry internals documentation](https://www.vaultproject.io/docs/internals/telemetry) to get more information.

Click **Continue** to proceed to step 4, where you will generate somenew items in Vault and corresponding metrics.
