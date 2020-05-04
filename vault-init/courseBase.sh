# shellcheck disable=SC2016,SC2148
VAULT_VERSION="1.4.1"
MICROVAULT_VAULT_SYSTEMD_UNIT="/etc/systemd/system/vault.service"
MICROVAULT_VAULT_CONFIG="/root/vault/config/main.hcl"
MICROVAULT_VAULT_ADDR="http://127.0.0.1:8200"
MICROVAULT_VAULT_DATA=/root/vault/data
PUBLIC_IP=$(ip route get 1 | cut -d ' ' -f 7)
IF=$(ip route get 1 | head -n1 | cut -d ' ' -f 5)

export VAULT_VERSION MICROVAULT_VAULT_CONFIG MICROVAULT_VAULT_ADDR PUBLIC_IP IF

# Get Vault release
curl -L -o ~/vault.zip https://releases.hashicorp.com/vault/"$VAULT_VERSION"/vault_"$VAULT_VERSION"_linux_amd64.zip
unzip -d  ~/.bin/ ~/vault.zip
chmod +x ~/.bin/vault
rm -f vault.zip

mkdir -p vault/{config,data,log}

# Vault systemd unit

cat << EOF >> "$MICROVAULT_VAULT_SYSTEMD_UNIT"
[Unit]
Description="HashiCorp Vault - A tool for managing secrets"
Documentation=https://www.vaultproject.io/docs/
Requires=network-online.target
After=network-online.target
ConditionFileNotEmpty=$MICROVAULT_VAULT_CONFIG
StartLimitBurst=3

[Service]
User=vault
Group=vault
ProtectSystem=full
ProtectHome=read-only
PrivateTmp=yes
PrivateDevices=yes
SecureBits=keep-caps
AmbientCapabilities=CAP_IPC_LOCK
CapabilityBoundingSet=CAP_SYSLOG CAP_IPC_LOCK
NoNewPrivileges=yes
ExecStart=/root/.bin/vault server -config /root/vault/config
ExecReload=/bin/kill --signal HUP $MAINPID
KillMode=process
KillSignal=SIGINT
Restart=on-failure
RestartSec=5
TimeoutStopSec=30
StartLimitIntervalSec=60
StartLimitBurst=3
LimitNOFILE=65536
LimitMEMLOCK=infinity

[Install]
WantedBy=multi-user.target
EOF

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

cat << 'EOF' >> /root/.bin/reset.sh
kill $(pidof vault)
rm -rf /root/vault/{data,log}/*
nohup sh -c "/root/.bin/vault server -config /root/vault/config > /root/vault/log/vault.log 2>&1" > /root/vault/log/nohup.log & > /dev/null
EOF
chmod +x /root/.bin/reset.sh

export PATH="/home/scrapbook/tutorial/.bin:$PATH"

printf "\n\nexport VAULT_ADDR=http://127.0.0.1:8200\n" >> /root/.bashrc

echo 'export VAULT_ADDR="http://127.0.0.1:8200"' >> /etc/bash.bashrc
echo 'export PATH="$PATH:$HOME/.bin"' >> /etc/bash.bashrc

systemctl daemon-reload
systemctl enable vault
systemctl start vault
