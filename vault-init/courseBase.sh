VAULT_VERSION="1.4.1"
MICROVAULT_VAULT_CONFIG="/home/scrapbook/tutorial/vault/config/main.hcl"
MICROVAULT_VAULT_ADDR="http://127.0.0.1:8200"
PUBLIC_IP=$(ip route get 1 | cut -d ' ' -f 7)
IF=$(ip route get 1 | head -n1 | cut -d ' ' -f 5)

export VAULT_VERSION MICROVAULT_VAULT_CONFIG MICROVAULT_VAULT_ADDR PUBLIC_IP IF

# Get Vault release
curl -L -o ~/vault.zip https://releases.hashicorp.com/vault/"$VAULT_VERSION"/vault_"$VAULT_VERSION"_linux_amd64.zip
unzip -d  ~/.bin/ ~/vault.zip
chmod +x ~/.bin/vault
rm -f vault.zip

mkdir -p vault/{config,data,log}

# Vault configuration

cat << EOF >> "$MICROVAULT_VAULT_CONFIG"
  api_addr         = "$MICROVAULT_VAULT_ADDR"
  disable_mlock    = true
  plugin_directory = "$PWD"
  ui               = true

  listener "tcp" {
    address        = "127.0.0.1:8200"
    tls_disable    = "true"
  }

  storage "file" {
    path           = "$MICROVAULT_VAULT_DATA"
  }
EOF

export PATH=/home/scrapbook/tutorial/.bin:$PATH

nohup sh -c "/home/scrapbook/.bin/vault server -config /home/scrapbook/tutorial/vault/config >~/vault/log/vault.log 2>&1" > /home/scrapbook/tutorial/vault/log/nohup.log &
