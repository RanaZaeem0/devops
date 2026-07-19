#!/usr/bin/env bash
echo "Generating CPU load for 60 seconds..."

for i in {1..4}; do
  yes > /dev/null &
done

sleep 60

pkill yes

echo "Load test finished. Check the Netdata dashboard."