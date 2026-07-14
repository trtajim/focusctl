# FocusCTL

<p align="center">
  <b>Say goodbye to distractions.</b>
</p>

FocusCTL creates a dedicated Linux focus user that can access only one allowed website.

It is designed for students, online classes, schools, libraries, and anyone who needs a distraction-free computer environment.

---

# The Problem

The internet is extremely useful for learning, but it is also full of distractions.

A student starts an online class:

- Opens Google Meet
- Watches a lecture
- Uses an educational website

Then:

- Social media gets opened
- Random browsing starts
- Notifications interrupt
- Time gets wasted

The problem is not the internet itself.

The problem is that everything is available at the same time.

---

# The Solution

FocusCTL creates a separate Linux user only for focused work.

Example:

```
Normal User
│
├── Full internet access
├── Social media
├── Games
├── Everything


Focus User
│
├── Openbox session
├── Chromium kiosk mode
└── Only one allowed website
```

Workflow:

1. Use your normal account daily.
2. Create a focus account with FocusCTL.
3. Login to the focus account before class.
4. The browser opens automatically.
5. Only your class website works.

No distractions.

---

# Features

- Create dedicated focus users
- Chromium kiosk mode
- Website allowlist
- Automatic browser startup
- Fullscreen learning environment
- Lightweight Openbox desktop
- Disable developer tools
- Disable incognito mode
- Disable browser guest mode
- Disable password saving
- Easy command-line management

---

# Supported Systems

FocusCTL works on Linux distributions with:

- Openbox
- Chromium
- A graphical login manager

Supported package managers:

| Distribution | Package Manager |
|---|---|
| Debian | apt |
| Ubuntu | apt |
| Linux Mint | apt |
| Fedora | dnf |
| Arch Linux | pacman |

FocusCTL is mainly tested on Debian-based systems.

---

# Installation

## 1. Install Git

Debian / Ubuntu / Mint:

```bash
sudo apt update
sudo apt install git -y
```

---

## 2. Clone FocusCTL

```bash
git clone https://github.com/trtajim/focusctl
```

Example:

```
Cloning into 'focusctl'...
remote: Enumerating objects: 12, done.
Receiving objects: 100%
```

---

## 3. Enter the directory

```bash
cd focusctl
```

You should see:

```
focusctl
install.sh
uninstall.sh
README.md
```

---

## 4. Make installer executable

Run:

```bash
chmod +x install.sh
```

If you skip this step, you may get:

```
sudo: ./install.sh: command not found
```

---

## 5. Install FocusCTL

Run:

```bash
sudo ./install.sh
```

The installer automatically:

- Installs Openbox
- Installs Chromium
- Installs FocusCTL globally
- Creates required directories

After successful installation:

```
✓ focusctl installed successfully
```

Verify:

```bash
focusctl --version
```

---

# Creating a Focus User

Basic syntax:

```bash
focusctl createuser <username> <password> --url <website>
```

Example:

```bash
focusctl createuser classuser password \
--url https://meet.google.com
```

This creates:

```
Username:
classuser

Password:
password

Allowed website:
https://meet.google.com
```

---

# Example Use Cases

## Online Class

Google Meet:

```bash
focusctl createuser student password \
--url https://meet.google.com
```

---

## Zoom Class

```bash
focusctl createuser student password \
--url https://zoom.us
```

---

## Educational Website

```bash
focusctl createuser student password \
--url https://example.com
```

---

# Logging Into Focus Mode

After creating the user:

## Step 1: Logout

Logout from your current Linux account.

---

## Step 2: Select Openbox Session

At the login screen:

Before entering your username and password:

Find the session option.

Select:

```
Openbox
```

This is required because FocusCTL uses Openbox as the lightweight kiosk desktop.

---

## Step 3: Login

Example:

```
Username:
classuser

Password:
password
```

After login:

1. Openbox starts.
2. Chromium launches automatically.
3. Your website opens.
4. Other websites are blocked.

---

# Leaving Focus Mode

Simply close Chromium with Ctrl + w 

The Openbox session will automatically exit.

You will return to the login screen.

---

# Commands

## Help

```bash
focusctl help
```

---

## Version

```bash
focusctl --version
```

---

# Change Allowed Website

Change the website for an existing focus user:

```bash
focusctl seturl <username> <url>
```

Example:

```bash
focusctl seturl classuser https://zoom.us
```

---

# List Focus Users

```bash
focusctl list
```

Example:

```
USERNAME             URL

classuser            https://meet.google.com
```

---

# Check User Status

```bash
focusctl status <username>
```

Example:

```bash
focusctl status classuser
```

Output:

```
User: classuser
URL: https://meet.google.com
```

---

# Delete Focus User

Delete a focus user:

```bash
focusctl deleteuser <username>
```

Example:

```bash
focusctl deleteuser classuser
```

The user's home directory is removed.

---

Skip confirmation:

```bash
focusctl deleteuser classuser --yes
```

---

# How FocusCTL Works

Internally:

```
Linux System

             Normal User
                 |
                 |
        Full computer access


             Focus User
                 |
                 |
              Openbox
                 |
                 |
        Chromium kiosk mode
                 |
                 |
          Allowed website only
```

---

# Files Created

## FocusCTL data

```
/etc/focusctl/users/
```

Stores allowed URLs.

---

## Chromium policy

```
/etc/chromium/policies/managed/focusctl.json
```

Controls browser restrictions.

---

## Openbox configuration

```
/home/<username>/.config/openbox/
```

Contains:

- Startup configuration
- Keyboard shortcuts
- Chromium launcher

---

# Security Notes

FocusCTL is a productivity tool, not a complete security sandbox.

It prevents normal distractions but does not protect against an administrator.

A user with root access can bypass restrictions.

For schools and public computers, also consider:

- BIOS password
- Disable external boot devices
- Separate admin account
- Disk encryption

---

# Troubleshooting

## Chromium not found

Install manually:

Debian/Ubuntu:

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

## Browser does not start

Make sure:

1. You selected:

```
Openbox
```

at login.

2. Chromium is installed:

```bash
chromium --version
```

---

# Uninstall

From the FocusCTL directory:

```bash
sudo ./uninstall.sh
```

# Author

Tajim

