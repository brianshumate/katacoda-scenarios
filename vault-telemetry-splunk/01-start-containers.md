> Click on the command (`⮐`) will automatically copy it into the terminal and execute it.

The first step in this lab is to use Terraform to start the containers.

This is done with 3 `terraform` commands, which accomplish the following tasks:

1. Initialize the Terraform configuration
2. Define a plan
3. Apply the defined plan

Once the plan is complete, the infrastructure will be fully configured and ready to go.

You are currently in the vtl project directory, `/home/scrapbook/tutorial`. All commands used in the terminal will expect you to execute them from this directory.

Begin by initializing the Terraform configuration.

```
terraform init
```{{execute T1}}

Successful output includes the message **Terraform has been successfully initialized!**.

Now, define a plan file with the filename `vault-metrics-lab.plan`.

```
terraform plan -out vault-metrics-lab.plan
```{{execute T1}}

If this step is successful you will find the following message in the `terraform` output.

```
This plan was saved to: vault-metrics-lab.plan
```

Finally, if everything appears to be okay, apply the plan from the file.

> **NOTE: The apply process will require about 3 minutes time to complete.** The time after you apply the plan would be a great moment to grab a fresh beverage or take a short break.

```
terraform apply vault-metrics-lab.plan
```{{execute T1}}

If all goes according to plan, you should observe a message like this in the output.

```
Apply complete! Resources: 7 added, 0 changed, 0 destroyed.
```

You can also confirm the container status with `docker ps` like this.

```
docker ps -f name=vtl --format "table {{.Names}}\t{{.Status}}"
```{{execute T1}}

Output should resemble this example.

```
NAMES               STATUS
vtl-splunk          Up About a minute (healthy)
vtl-vault           Up About a minute (unhealthy)
vtl-telegraf        Up 2 minutes
```

The vtl-splunk container should have a **healthy** status before proceeding to step 2. If the status is instead listed as **health: starting**, you need to wait a bit and check again until the status is **healthy**.

> **NOTE:** Vault is expected to be unhealthy when it is sealed; in this case, you have not yet initialized or unsealed Vault, so the status is correct and expected.

Once your vtl-splunk container has a healthy status, click **Continue** to proceed to step 2, where you will initialize and unseal Vault, then login to begin using it.
