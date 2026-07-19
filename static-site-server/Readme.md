# Static Site Server

A beginner DevOps project from roadmap.sh that deploys a static website using Nginx on Ubuntu.

## Overview

This project demonstrates how to configure Nginx to serve a static website, manage the web root, and verify deployment.

## Features

* Install Nginx
* Configure a virtual host
* Deploy a static website
* Verify HTTP access
* Configure basic firewall rules

## Technologies

* Ubuntu
* Nginx
* HTML
* CSS
* Bash

## Prerequisites

* Ubuntu Server
* sudo privileges

## Project Structure

```text
.
├── site/
├── README.md
└── screenshots/
```

## Usage

Install Nginx:

```bash
sudo apt update
sudo apt install nginx -y
```

Copy website files:

```bash
sudo cp -r site/* /var/www/html/
```

Restart Nginx:

```bash
sudo systemctl restart nginx
```

Visit:

```
http://SERVER_IP
```

## Learning Outcomes

* Web server configuration
* Nginx basics
* Static website deployment
* Linux filesystem permissions
* Basic networking

## Screenshots

* Nginx running
* Browser showing website
* Server configuration

## Project Reference



