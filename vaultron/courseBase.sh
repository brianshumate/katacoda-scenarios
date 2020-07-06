#!/usr/bin/env bash
# shellcheck disable=SC2016

export log_dir="/root/.log"
export consul_version="1.8.0"
export terraform_version="0.12.28"
export vault_version="1.4.2"

mkdir -p "$log_dir"

# ensure unzip and uuid-runtime are installed
apt update && \
apt install -y unzip uuid-runtime >> "$log_dir"/install.log

# Download function
download() {
  curl --fail --location --silent --show-error --output "$HOME"/"${1}".zip https://releases.hashicorp.com/"${1}"/"${2}"/"${1}"_"${2}"_linux_amd64.zip  >> "$log_dir"/install.log
}

# Install function
install() {
  unzip -d  /usr/local/bin/ "$HOME"/"$1".zip  >> "$log_dir"/install.log && \
  chmod +x /usr/local/bin/"$1" && \
  rm -f "$HOME"/"$1".zip
}

download terraform "$terraform_version" && \
install terraform && \
download vault "$vault_version" && \
install vault && \
download consul "$consul_version" && \
install consul

git clone --branch v3.4.4 https://github.com/brianshumate/vaultron.git
