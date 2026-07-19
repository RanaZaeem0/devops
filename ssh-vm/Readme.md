# SSH Remote Server Setup

A beginner DevOps project from roadmap.sh focused on provisioning a Linux server and securely accessing it using SSH.

## Overview

This project demonstrates how to configure a Linux server for remote administration using SSH. It covers SSH key generation, secure authentication, and server hardening basics.

## Features

- Generate SSH key pairs
- Configure SSH key authentication
- Disable password authentication (optional)
- Verify secure remote access
- Basic SSH security practices

## Technologies

- Ubuntu Linux
- OpenSSH
- Bash
- SSH

## Prerequisites

- Ubuntu Server
- SSH client
- Root or sudo access

## Project Structure

```text
.
├── README.md
└── screenshots/
```

## Usage

Generate an SSH key:

```bash
ssh-keygen -t ed25519
```

Copy the public key to the server:

```bash
ssh-copy-id user@server-ip
```

Connect securely:

```bash
ssh user@server-ip
```

## Learning Outcomes

- Linux server administration
- SSH authentication
- Public/Private key cryptography
- Remote server management
- Basic server security

## Screenshots

Add screenshots showing:

- Successful SSH login
- SSH configuration
- Server terminal

## Project Reference

https://roadmap.sh/projects/ssh-remote-server-setup


