#!/bin/bash

LOG_FILE=$1

if [ ! -f "$LOG_FILE" ]; then
    echo "Usage: ./nginx-log-analyzer.sh <server.log>"
    exit 1
fi

echo "=============================="
echo "Top 5 IP Addresses"
echo "=============================="

awk '{print $1}' "$LOG_FILE" |
sort |
uniq -c |
sort -nr |
head -5

echo

echo "=============================="
echo "Top 5 Requested Paths"
echo "=============================="

awk -F'"' '{print $2}' "$LOG_FILE" |
awk '{print $2}' |
sort |
uniq -c |
sort -nr |
head -5

echo

echo "=============================="
echo "Top 5 Status Codes"
echo "=============================="

awk '{print $9}' "$LOG_FILE" |
sort |
uniq -c |
sort -nr |
head -5

echo

echo "=============================="
echo "Top 5 User Agents"
echo "=============================="

awk -F'"' '{print $6}' "$LOG_FILE" |
sort |
uniq -c |
sort -nr |
head -5