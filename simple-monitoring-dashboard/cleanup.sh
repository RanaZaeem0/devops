#!/usr/bin/env bash
echo "Stopping and removing Netdata..."

sudo systemctl stop netdata || true
sudo apt remove --purge -y netdata || true
sudo rm -rf /etc/netdata /var/lib/netdata /var/cache/netdata

echo "Cleanup completed."