#!/bin/sh
# shellcheck disable=SC2016

terraform_version="0.12.26"

# Get Terraform
curl -L -o "$HOME"/terraform.zip https://releases.hashicorp.com/terraform/"$terraform_version"/terraform_"$terraform_version"_linux_amd64.zip
unzip -d  /usr/local/bin/ "$HOME"/terraform.zip

# Get repository
git clone https://github.com/brianshumate/vss.git
