> Click on the command (`⮐`) will automatically copy it into the terminal and execute it.

The first step in this lab is to use `terraform` to start the containers. This is done with 3 terraform commands to accomplish the following tasks:

1. Initialize configuration
2. Define plan
3. Apply plan

Begin by changing into the `vtl` project directory.

```
cd vtl
```{{execute T1}}

Next, initialize the Terraform configuration.

```
terraform init
```{{execute T1}}

Successful output should include the message **Terraform has been successfully initialized!**.

Now you can define a plan file with the filename `vault-metrics-lab.plan`.

```
terraform plan -out vault-metrics-lab.plan
```{{execute T1}}

If this step is successful you will find the following message in the `terraform` output.

```
This plan was saved to: vault-metrics-lab.plan
```

Finally, if everything appears to be okay, apply the plan from the file.

```
terraform apply vault-metrics-lab.plan
```{{execute T1}}

If all goes according to plan and after roughly 3 minutes of time has elapsed, you should observe a message like this in the output.

```
Apply complete! Resources: 6 added, 0 changed, 0 destroyed.
```

You can confirm the container status with `docker ps` like this.

```
docker ps -f name=vtl --format "table {{.Names}}\t{{.Status}}"
```{{execute T1}}

Expected output should resemble this example.

```
NAMES               STATUS
vtl-vault           Up 2 minutes (unhealthy)
vtl-telegraf        Up 2 minutes
vtl-splunk          Up 2 minutes (healthy)
```
