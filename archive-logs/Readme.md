# Log Archive Tool

A simple Linux CLI tool written in Bash that compresses and archives log files with timestamps.

This tool helps system administrators and DevOps engineers manage logs by creating compressed backups that can be stored for future debugging, auditing, or recovery.

---

## 📌 Project Overview

Logs are generated continuously by applications and operating systems. Over time, these logs can consume a large amount of disk space.

This tool:

- Accepts a log directory as an input
- Compresses logs into a `.tar.gz` archive
- Creates timestamp-based archive names
- Stores archives in a separate directory
- Records archive creation history

Example:
