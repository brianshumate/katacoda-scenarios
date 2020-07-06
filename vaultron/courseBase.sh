#!/usr/bin/env bash
# shellcheck disable=SC2016

export log_dir="/root/.log"
export consul_version="1.8.0"
export terraform_version="0.12.28"
export vault_version="1.4.2"

mkdir -p "$log_dir"

echo "HELLO" >> "$log_dir"/install.log

# ensure unzip and uuid-runtime are installed
apt update && \
apt install -y unzip uuid-runtime >> "$log_dir"/install.log

# Download function
download() {
  curl --fail --location --silent --show-error --output "$HOME"/"${1}".zip https://releases.hashicorp.com/"${1}"/"${2}"/"${1}"_"${2}"_linux_amd64.zip  >> "$log_dir"/install.log
}

# Install function
install() {
  unzip -d  /usr/local/bin/ "$HOME"/"$1".zip  >> "$log_dir"/install.log 2>&1 && \
  chmod +x /usr/local/bin/"$1" && \
  rm -f "$HOME"/"$1".zip
}

download terraform "$terraform_version" >> "$log_dir"/install.log && \
install terraform >> "$log_dir"/install.log && \
download vault "$vault_version" >> "$log_dir"/install.log && \
install vault >> "$log_dir"/install.log && \
download consul "$consul_version" >> "$log_dir"/install.log && \
install consul >> "$log_dir"/install.log

git clone --branch v3.4.4 https://github.com/brianshumate/vaultron.git >> "$log_dir"/install.log
