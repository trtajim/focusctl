# FocusCTL

<p align="center">
  <b>Say goodbye to distractions.</b>
</p>

FocusCTL creates a dedicated Linux kiosk user that can only access a single allowed website using Chromium kiosk mode.

Designed for students, online classes, schools, and focused work environments.

---

# The Problem

While attending online classes or studying online, it is very easy to get distracted.

You open your browser for a class:

- Join Google Meet / Zoom / online platform
- Check one notification
- Open YouTube
- Browse social media
- Start scrolling

Suddenly, hours are gone and your focus is lost.

The internet is powerful, but without control it can become a distraction machine.

---

# The Solution

FocusCTL creates a separate **focus user** on your Linux system.

Example:

```
Normal User
    |
    |-- Full internet access
    |-- Social media
    |-- Everything


Class User (created by FocusCTL)
    |
    |-- Chromium kiosk mode
    |-- Only one allowed website
    |-- No distractions
```

You simply:

1. Create a class user.
2. Login with that user before your online class.
3. The browser opens automatically.
4. Only your class website works.

Example:

```
focusctl createuser classuser password --url https://meet.google.com
```

Now login as:

```
classuser
```

Your computer becomes a distraction-free classroom.

---

# Features

- Creates isolated Linux users
- Chromium kiosk mode
- Website allowlist blocking
- Automatic browser startup
- No developer tools
- No incognito mode
- No password saving
- Openbox lightweight environment
- Easy user management

---

# Requirements

Supported:

- Debian
- Ubuntu
- Linux Mint
- Other Debian-based distributions

Requirements:

```
Openbox
Chromium
sudo access
```

---

# Installation

## 1. Install dependencies

```bash
sudo apt update

sudo apt install openbox chromium git -y
```

---

## 2. Download FocusCTL

```bash
git clone https://github.com/trtajim/focusctl
```

Example:

```
Cloning into 'focusctl'...
remote: Enumerating objects: 12, done.
remote: Counting objects: 100% (12/12), done.
Receiving objects: 100%
```

---

## 3. Enter directory

```bash
cd focusctl
```

---

## 4. Make installer executable

If you see:

```
sudo: ./install.sh: command not found
```

The file is not executable.

Fix:

```bash
chmod +x install.sh
```

---

## 5. Install

```bash
sudo ./install.sh
```

After installation:

```
focusctl
```

will be available globally.

Check:

```bash
focusctl --version
```

---

# Creating a Focus User

## Basic

```bash
focusctl createuser username password
```

Example:

```bash
focusctl createuser classuser mypassword
```

Default URL:

```
https://example.com
```

---

## Create Online Class User

Example Google Meet:

```bash
focusctl createuser classuser password \
--url https://meet.google.com
```

Example YouTube educational channel:

```bash
focusctl createuser study password \
--url https://youtube.com/@education
```

---

# Using Focus User

Logout from your current account.

Login with:

```
username:
classuser

password:
password
```

After login:

- Openbox starts
- Chromium launches automatically
- Website opens fullscreen
- Other websites are blocked

---

# Managing Users

## Change Allowed Website

```bash
focusctl seturl username URL
```

Example:

```bash
focusctl seturl classuser https://zoom.us
```

---

## List Focus Users

```bash
focusctl list
```

Output:

```
USERNAME             URL
classuser            https://meet.google.com
study                https://youtube.com
```

---

## Check User Status

```bash
focusctl status classuser
```

Output:

```
User: classuser
URL:  https://meet.google.com
```

---

## Delete Focus User

```bash
focusctl deleteuser classuser
```

Skip confirmation:

```bash
focusctl deleteuser classuser --yes
```

---

# How It Works

FocusCTL creates:

```
Linux User
    |
    |
    +-- Openbox session
            |
            +-- Chromium kiosk mode
                    |
                    +-- Allowed website only
```

Chromium policy:

```
Block:
    *

Allow:
    configured URL
```

The user does not need:

- sudo permission
- system configuration access
- browser settings

---

# Uninstall

From the project directory:

```bash
sudo ./uninstall.sh
```

---

# Troubleshooting

## install.sh: command not found

Example:

```
sudo ./install.sh
sudo: ./install.sh: command not found
```

Solution:

```bash
chmod +x install.sh
sudo ./install.sh
```

---

## Chromium not found

Install:

```bash
sudo apt install chromium
```

---

## Openbox not found

Install:

```bash
sudo apt install openbox
```

---

# Security Notes

FocusCTL is designed for focus and productivity.

It prevents normal distractions, but it is not a security sandbox.

A user with physical access to the machine may still modify the system using advanced methods.

For schools and public computers, combine FocusCTL with:

- BIOS password
- disabled boot devices
- encrypted disk
- restricted administrator accounts

---

# Roadmap

Future ideas:

- Multiple allowed URLs
- Time scheduling
- Automatic logout after class
- Admin dashboard
- Windows support
- Better kiosk lockdown

---

# License

MIT License

---

# Author

Created by Tajim

GitHub:

https://github.com/trtajim/focusctl
