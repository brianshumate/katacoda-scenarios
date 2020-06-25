#!/usr/bin/env bash
# shellcheck disable=SC2016

export consul_version="1.8.0"
export terraform_version="0.12.26"
export vault_version="1.4.2"

# ensure git and unzip art installed
apt install -y git unzip

# Download and install Consul
curl -L -o /home/scrapbook/tutorial/consul.zip https://releases.hashicorp.com/consul/"${consul_version}"/consul_"${consul_version}"_linux_amd64.zip && \
unzip -d  /usr/local/bin/ /home/scrapbook/tutorial/consul.zip && \
chmod +x /usr/local/bin/consul && \
rm -f /home/scrapbook/tutorial/consul.zip

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

git clone --branch v3.4.4 https://github.com/brianshumate/vaultron.git
