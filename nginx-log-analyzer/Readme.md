Here is a professional `README.md` for your **Nginx Log Analyzer Bash project**.

```markdown
# Nginx Log Analyzer

A simple command-line tool built with **Bash scripting** to analyze Nginx access logs and extract useful traffic insights.

This project is created to practice Linux command-line tools such as:

- `awk`
- `sort`
- `uniq`
- `head`
- Bash scripting
- Unix pipelines

The script reads an Nginx access log file and generates statistics about requests, IP addresses, paths, response codes, and user agents.

---

## Project Overview

In real-world production environments, servers generate thousands or millions of logs every day.

Analyzing these logs helps DevOps engineers understand:

- Who is accessing the server
- Which APIs are used the most
- Which errors are occurring
- What clients are sending requests

This tool automates basic log analysis directly from the Linux terminal.

---

# Features

The analyzer provides:

## 1. Top 5 IP Addresses

Shows the IP addresses making the most requests.

Example:
```

Top 5 IP addresses:

1000 45.76.135.253
600 142.93.143.8
300 178.128.94.113

```

Useful for:

- Finding heavy users
- Detecting suspicious traffic
- Understanding visitors

---

## 2. Top 5 Requested Paths

Shows the most requested URLs/API endpoints.

Example:

```

Top requested paths:

1000 /api/users
600 /api/products
300 /api/orders

```

Useful for:

- Finding popular APIs
- Understanding application usage

---

## 3. Top 5 Response Status Codes

Shows HTTP response distribution.

Example:

```

200 1000 requests
404 200 requests
500 50 requests

```

Useful for:

- Monitoring application health
- Finding errors

---

## 4. Top 5 User Agents

Shows the clients accessing the server.

Example:

```

Mozilla/5.0
curl
PostmanRuntime

```

Useful for:

- Understanding client devices
- Identifying bots/scripts

---

# Project Structure

```

nigix-logs/
│
├── nginx-log-analyzere.sh
├── server.log
└── README.md

````

---

# Requirements

Before running this project, you need:

- Linux / Unix environment
- Bash shell
- Standard Linux utilities

Check Bash version:

```bash
bash --version
````

---

# Installation

Clone the repository:

```bash
git clone <repository-url>
```

Move into the project directory:

```bash
cd nigix-logs
```

Give execution permission:

```bash
chmod +x nginx-log-analyzere.sh
```

---

# Usage

Run the analyzer:

```bash
./nginx-log-analyzere.sh
```

Example output:

```
Starting Nginx Log Analyzer...

Top 5 IP addresses:

1200 192.168.1.10
800 10.0.0.5
500 45.76.135.253
```

---

# How It Works

The script follows a simple Linux pipeline:

```
Log File
   |
   |
   v
awk
   |
   |
   v
sort
   |
   |
   v
uniq -c
   |
   |
   v
sort -nr
   |
   |
   v
head -5
```

---

# Command Explanation

## AWK

Extracts specific fields from the log.

Example:

```bash
awk '{print $1}' server.log
```

Gets the first field (IP address).

---

## Sort

Sorts the output.

Example:

```bash
sort
```

Transforms:

```
B
A
A
```

into:

```
A
A
B
```

---

## Uniq

Counts duplicate values.

Example:

```bash
uniq -c
```

Output:

```
2 A
1 B
```

---

## Sort Numerically

```bash
sort -nr
```

Sorts counts from highest to lowest.

Example:

```
1000 IP-A
500 IP-B
100 IP-C
```

---

## Head

Shows only the first results.

```bash
head -5
```

Displays the top five entries.

---

# Bash Script Explanation

## Define Log File

```bash
FILE_LOG="server.log"
```

Stores the log file name.

---

## Validate File Exists

```bash
if [ ! -f "$FILE_LOG" ]; then
```

Checks whether the log file exists before processing.

---

## Extract IP Addresses

```bash
awk '{print $1}' "$FILE_LOG"
```

The first column of Nginx logs contains the client IP address.

---

# Example Nginx Log Format

Example:

```
45.76.135.253 - - [18/Jul/2026:12:10:01 +0000] "GET /api/users HTTP/1.1" 200 532 "-" "Mozilla/5.0"
```

Fields:

| Field      | Description        |
| ---------- | ------------------ |
| $1         | IP Address         |
| $4         | Date               |
| $6-$8      | HTTP Request       |
| $9         | Status Code        |
| $10        | Response Size      |
| User Agent | Client Information |

---

# Future Improvements

Possible improvements:

- [ ] Accept log file as command-line argument

Example:

```bash
./nginx-log-analyzere.sh nginx.log
```

- [ ] Add colored terminal output

- [ ] Generate HTML reports

- [ ] Add error analysis

- [ ] Detect suspicious IP addresses

- [ ] Add Docker support

- [ ] Schedule automatic reports using Cron

- [ ] Export results as CSV

---

# Learning Outcomes

Through this project, I learned:

✅ Bash scripting fundamentals
✅ Linux command-line tools
✅ Text processing with AWK
✅ Log analysis techniques
✅ Unix pipelines
✅ Basic DevOps automation concepts

---

# Technologies Used

- Bash
- Linux
- AWK
- GNU Core Utilities

---

# Author

**Rana Zaeem**

DevOps / Software Enginerr

---

# License

This project is open-source and available for learning purposes.

```

This README will make your GitHub project look like a proper DevOps portfolio project.
```
