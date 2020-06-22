Start containers

> Click on the command (`⮐`) will automatically copy it into the terminal and execute it.

The first step is to use `terraform` to start the containers. This is done in three steps:

1. Initialize the configuration
2. Define the plan
3. Apply the plan

Start by initializing the Terraform configuration.

```
terraform init
```{{execute T1}}

Successful output should include the message **Terraform has been successfully initialized!**.

Now, define a plan with the filename `vault-metrics-lab.plan`.

```
terraform plan -out vault-metrics-lab.plan
```{{execute T1}}

If this step is successful you will find the following message in the `terraform` output.

```
This plan was saved to: vault-metrics-lab.plan
```

Finally, if everything appears to be okay, apply the plan.

```
terraform apply vault-metrics-lab.plan
```{{execute T1}}

When prompted to confirm, type `yes` and press **return**.

If all goes according to plan, you should observe this in the successful output.

```
Apply complete! Resources: 6 added, 0 changed, 0 destroyed.
```
