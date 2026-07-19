#!/usr/bin/env bash
set -e

echo "Installing Netdata..."
bash <(curl -Ss https://my-netdata.io/kickstart.sh)

echo "Creating CPU alert..."
sudo tee /etc/netdata/health.d/custom_cpu.conf > /dev/null <<EOF
alarm: cpu_usage_high
on: system.cpu
lookup: average -1m percentage of user
every: 10s
warn: \$this > 80
crit: \$this > 90
info: CPU usage is above 80%
to: sysadmin
EOF

sudo systemctl restart netdata

echo "Netdata installed. Open http://localhost:19999"