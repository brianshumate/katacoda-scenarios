kill $(pidof vault)
rm -rf /root/vault/{data,log}/*
nohup sh -c "/root/.bin/vault server -config /root/vault/config > /root/vault/log/vault.log 2>&1" > /root/vault/log/nohup.log &
