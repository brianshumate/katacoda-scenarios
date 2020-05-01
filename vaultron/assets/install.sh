#!/bin/sh

# Version Variables
VAULT_VERSION="1.4.1"
TERRAFORM_VERSION="0.12.24"
# Get unzip
curl -L http://assets.joinscrapbook.com/unzip -o ~/.bin/unzip
chmod +x ~/.bin/unzip

# Get Terraform release
curl -L -o ~/terraform.zip https://releases.hashicorp.com/terraform/"$TERRAFORM_VERSION"/terraform_"$TERRAFORM_VERSION"_linux_amd64.zip
unzip -d ~/.bin ~/terraform.zip
chmod +x ~/.bin/terraform

# Get Vault release
curl -L -o ~/vault.zip https://releases.hashicorp.com/vault/"$VAULT_VERSION"/vault_"$VAULT_VERSION"_linux_amd64.zip
unzip -d  ~/.bin/ ~/vault.zip
chmod +x ~/.bin/vault

# Setup Docker registry
docker run -d --name registry -p 5000:5000 registry:2

# Clone Vaultron
git clone https://github.com/brianshumate/vaultron.git
