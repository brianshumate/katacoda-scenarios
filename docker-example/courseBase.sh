#!/usr/bin/env bash
# shellcheck disable=SC2016

export terraform_version="0.12.26"

# Download and install Terraform
curl -L -o "$HOME"/terraform.zip https://releases.hashicorp.com/terraform/"$terraform_version"/terraform_"$terraform_version"_linux_amd64.zip && \
unzip -d  /usr/local/bin/ "$HOME"/terraform.zip && \

# Clone repository
# git clone https://github.com/brianshumate/vss.git

# Set up Terraform configuration
mkdir -p /home/scrapbook/tutorial/vtl/{config,tfstate}
