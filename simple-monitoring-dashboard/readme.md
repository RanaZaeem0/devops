# Simple Monitoring with Netdata

A beginner DevOps monitoring project from roadmap.sh that installs and configures Netdata for real-time Linux server monitoring.

## Overview

This project demonstrates how to monitor system performance using Netdata. It includes installation, dashboard access, basic customization, alert configuration, and automation using shell scripts.

## Features

- Install Netdata
- Monitor CPU, Memory, Disk, Network, and Processes
- Access the Netdata dashboard
- Configure CPU usage alerts
- Automate installation, testing, and cleanup

## Technologies

- Ubuntu Linux
- Netdata
- Bash
- Systemd

## Project Structure

```text
.
├── setup.sh
├── test_dashboard.sh
├── cleanup.sh
├── README.md
└── screenshots/
```

## Scripts

### setup.sh

Installs Netdata and starts the monitoring service.

### test_dashboard.sh

Generates CPU load to verify dashboard updates and alert triggering.

### cleanup.sh

Removes Netdata and cleans up related files.

## Usage

Install:

```bash
chmod +x setup.sh
./setup.sh
```

Generate load:

```bash
chmod +x test_dashboard.sh
./test_dashboard.sh
```

Open dashboard:

```
http://SERVER_IP:19999
```

Cleanup:

```bash
chmod +x cleanup.sh
./cleanup.sh
```

## Learning Outcomes

- Infrastructure monitoring
- System performance analysis
- Linux services
- Bash automation
- Monitoring dashboards
- Alert configuration

## Screenshots

- Netdata dashboard
- CPU utilization graph
- Alert notification
- Running scripts
