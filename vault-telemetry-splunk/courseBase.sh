#!/usr/bin/env bash
# shellcheck disable=SC2016

export terraform_version="0.12.28"
export vault_version="1.4.2"

# ensure unzip is installed
apt install -y unzip

# Download and install Terraform
curl -L -o /home/scrapbook/tutorial/terraform.zip https://releases.hashicorp.com/terraform/"${terraform_version}"/terraform_"${terraform_version}"_linux_amd64.zip && \
unzip -d  /usr/local/bin/ /home/scrapbook/tutorial/terraform.zip && \
chmod +x /usr/local/bin/terraform && \
rm -f /home/scrapbook/tutorial/terraform.zip


# Download and install Vault
curl -L -o /home/scrapbook/tutorial/vault.zip https://releases.hashicorp.com/vault/"${vault_version}"/vault_"${vault_version}"_linux_amd64.zip && \
unzip -d  /usr/local/bin/ /home/scrapbook/tutorial/vault.zip && \
chmod +x /usr/local/bin/vault && \
rm -f /home/scrapbook/tutorial/vault.zip

mkdir -p /home/scrapbook/tutorial/vtl/{config,tfstate}
