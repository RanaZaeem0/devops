# Basic DNS Setup

A beginner networking project from roadmap.sh demonstrating how to connect a custom domain to a Linux server.

## Overview

This project covers the fundamentals of DNS by configuring common DNS records for a custom domain and verifying propagation.

## Features

- Configure A records
- Configure CNAME records
- Configure WWW subdomain
- Verify DNS propagation
- Connect a custom domain to a web server

## Technologies

- DNS
- Cloudflare / Domain Registrar
- Ubuntu
- Nginx

## DNS Records

| Type | Name | Value     |
| ---- | ---- | --------- |
| A    | @    | Server IP |
| A    | www  | Server IP |

## Verification

```bash
dig yourdomain.com
```

```bash
nslookup yourdomain.com
```

## Learning Outcomes

- DNS fundamentals
- Domain management
- Name resolution
- DNS propagation
- Hosting custom domains

## Screenshots

- DNS records
- Successful DNS lookup
- Website loading from custom domain
