````markdown
# Server Performance Stats Script
https://roadmap.sh/projects/server-stats
A beginner-friendly Bash script that collects and displays basic Linux server performance information.

This project is designed to help you learn Bash scripting, Linux commands, and basic system administration.

---

# Table of Contents

- Overview
- Script Flow
- Commands Used
- Script Breakdown
- Linux Concepts
- Example Output
- How to Run
- What You'll Learn

---

# Overview

The script displays:

- CPU Usage
- Memory Usage
- Disk Usage
- Top 5 CPU-consuming processes
- Top 5 Memory-consuming processes
- OS Version
- System Uptime
- Load Average
- Logged-in Users
- Failed Login Attempts

---

# Script Flow

```
Start Script
      │
      ▼
Print Title
      │
      ▼
Get CPU Usage
      │
      ▼
Get Memory Usage
      │
      ▼
Get Disk Usage
      │
      ▼
Top 5 CPU Processes
      │
      ▼
Top 5 Memory Processes
      │
      ▼
OS Information
      │
      ▼
Uptime
      │
      ▼
Load Average
      │
      ▼
Logged In Users
      │
      ▼
Failed Login Attempts
      │
      ▼
End
```

---

# Script Breakdown

## 1. Shebang

```bash
#!/bin/bash
```

### Purpose

Tells Linux to execute this script using the Bash interpreter.

Without it, Linux doesn't know which program should run the script.

Equivalent to:

```bash
/bin/bash server-stats.sh
```

---

# 2. echo

```bash
echo "CPU Usage:"
```

### Purpose

Prints text to the terminal.

Equivalent to

JavaScript

```javascript
console.log("CPU Usage");
```

Python

```python
print("CPU Usage")
```

---

# 3. Variables

```bash
cpu_usage=$(...)
```

### Purpose

Stores the output of a command.

Example

```bash
name=$(whoami)
```

If

```
whoami
```

returns

```
rana
```

Then

```bash
echo $name
```

prints

```
rana
```

---

# 4. Command Substitution

```
$(command)
```

Means

> Execute the command and return its output.

Example

```bash
date=$(date)
```

Now

```
$date
```

contains the current date.

---

# CPU Usage

## Command

```bash
top -bn1
```

### top

Displays live CPU information.

Example

```
%Cpu(s): 2.4 us, 1.3 sy, 96.3 id
```

where

```
id
```

means

Idle CPU.

---

### -b

Batch Mode

Print once instead of opening the interactive monitor.

---

### -n1

Run only one iteration.

---

## grep

```bash
grep "Cpu(s)"
```

Filters only the CPU line.

Input

```
Memory...
CPU...
Tasks...
```

Output

```
CPU...
```

---

## Pipe

```
|
```

Passes output from one command to another.

Example

```bash
ls | grep test
```

means

```
List Files
      │
      ▼
Search for "test"
```

---

## awk

```bash
awk '{print 100-$8}'
```

`awk` works with columns.

Example

```
%Cpu(s): 3.0 us, 97.0 id
```

Columns become

```
$1 %Cpu(s):
$2 3.0
...
$8 97.0
```

Since

```
97%
```

is idle,

CPU Usage is

```
100 - 97
```

---

## printf

```bash
printf "%.2f%%\n"
```

Formats numbers.

```
5.23654
```

becomes

```
5.24%
```

---

# Memory Usage

## free

```bash
free -h
```

Shows RAM usage.

Example

```
total
used
free
available
```

---

## -h

Human-readable format.

Instead of

```
16354876
```

it prints

```
15Gi
```

---

## awk

```bash
NR==2
```

Means

Only process line number 2.

Because

```
Line 1
Headers

Line 2
Memory Values
```

---

Columns

```
$2 Total Memory

$3 Used Memory

$4 Free Memory
```

---

Memory Percentage

```bash
$3/$2*100
```

means

```
Used Memory
------------
Total Memory
```

multiplied by 100.

---

# Disk Usage

## df

```bash
df -h /
```

Displays disk information.

Example

```
Filesystem
Size
Used
Available
Usage%
```

---

Columns

```
$2 Total Disk

$3 Used Disk

$4 Available Disk

$5 Percentage Used
```

---

# Processes

## ps

```bash
ps
```

Means

Process Status.

Shows running programs.

---

## -e

Show every process.

---

## -o

Choose output columns.

Example

```bash
ps -eo pid,user
```

---

Columns

### pid

Process ID.

Every running process has a unique number.

---

### user

Owner of the process.

---

### comm

Program name.

Example

```
node

docker

nginx
```

---

### %cpu

CPU usage by the process.

---

### %mem

Memory usage by the process.

---

## Sorting

```bash
--sort=-%cpu
```

Sorts by CPU usage.

```
Highest
↓

Lowest
```

The minus sign means descending order.

---

## head

```bash
head -n 6
```

Shows the first six lines.

Why six?

Because one line is the header.

```
Header

Process 1

Process 2

Process 3

Process 4

Process 5
```

---

# OS Version

```
/etc/os-release
```

Linux stores operating system information here.

Example

```
PRETTY_NAME="Ubuntu 24.04 LTS"
```

---

## grep

Finds

```
PRETTY_NAME
```

---

## cut

```bash
cut -d= -f2
```

Splits text using

```
=
```

Example

```
name=Rana
```

becomes

```
Field 1

name

Field 2

Rana
```

---

## tr

```bash
tr -d '"'
```

Deletes quotation marks.

Input

```
"Ubuntu"
```

Output

```
Ubuntu
```

---

# Uptime

```bash
uptime -p
```

Displays

```
up 3 days, 5 hours
```

---

# Load Average

```bash
uptime | awk -F'load average:' '{print $2}'
```

Shows

```
1 minute

5 minutes

15 minutes
```

average system load.

Example

```
0.20
0.35
0.40
```

Higher numbers mean more work waiting for the CPU.

---

# Logged-in Users

```bash
who
```

Displays

```
Username

Terminal

Login Time
```

---

# Failed Login Attempts

```bash
lastb
```

Shows unsuccessful login attempts.

Useful for security monitoring.

---

## 2>/dev/null

Linux has three streams.

| Number | Stream |
| ------ | ------ |
| 0      | Input  |
| 1      | Output |
| 2      | Error  |

```
2>
```

redirects errors.

```
/dev/null
```

is a special file that discards everything.

Think of it as a black hole.

---

# Commands Used

| Command | Purpose                   |
| ------- | ------------------------- |
| echo    | Print text                |
| top     | CPU usage                 |
| free    | Memory usage              |
| df      | Disk usage                |
| ps      | Running processes         |
| grep    | Filter text               |
| awk     | Process columns           |
| cut     | Split text                |
| tr      | Replace/Delete characters |
| head    | First N lines             |
| uptime  | System uptime             |
| who     | Logged-in users           |
| lastb   | Failed login attempts     |
| printf  | Format output             |

---

# Bash Concepts Learned

- Variables
- Command Substitution
- Pipes
- Input & Output Streams
- Error Redirection
- Text Processing
- Process Monitoring
- Memory Monitoring
- Disk Monitoring
- CPU Monitoring

---

# How to Run

Make the script executable.

```bash
chmod +x server-stats.sh
```

Run it.

```bash
./server-stats.sh
```

---

# Example Output

```
======================================
SERVER PERFORMANCE STATS
======================================

CPU Usage:
4.82%

Memory Usage:
Total: 16Gi
Used: 7Gi
Free: 8Gi
Usage: 43%

Disk Usage:
Total: 98G
Used: 42G
Free: 56G
Usage: 46%

Top 5 Processes by CPU
...

Top 5 Processes by Memory
...

OS Version:
Ubuntu 24.04 LTS

Uptime:
up 3 days, 5 hours

Load Average:
0.32, 0.24, 0.18

Logged In Users:
rana

Failed Login Attempts:
None
```

---

# What You'll Learn

After completing this project, you should understand:

- Basic Bash scripting
- Linux command-line tools
- CPU, Memory, and Disk monitoring
- Linux processes
- Text processing using `grep`, `awk`, `cut`, and `tr`
- Input/output redirection
- Shell variables
- Command substitution
- Building real-world Linux monitoring scripts

This project is an excellent first step toward Linux system administration, DevOps, and Site Reliability Engineering (SRE).
````
