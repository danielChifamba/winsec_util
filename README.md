# 🛡️ Windows Security Toolkit

A powerful, all-in-one Windows batch script for security auditing, system maintenance, and threat checking — built for everyday users and tech enthusiasts alike.

> **Run it. Check your system. Stay safe.**

---

## 📸 Preview

```
  ====================================================
       WINDOWS SECURITY TOOLKIT  v2.0
  ====================================================

   --- SECURITY ---
   [1]  Windows Security Center
   [2]  Windows Defender Full Scan
   [3]  Windows Firewall
   ...
   [35] Generate Full Security Report
   [36] Exit
  ====================================================
  Select option:
```

---

## ✨ Features

### 🔐 Security Tools
| Option | Tool | Description |
|--------|------|-------------|
| 1 | Windows Security Center | Opens the main Windows Security dashboard |
| 2 | Windows Defender Full Scan | Launches a real background antivirus scan |
| 3 | Windows Firewall | Opens firewall settings |
| 4 | Firewall Advanced Security | Deep firewall rule management |
| 5 | User Accounts | Manage local user accounts |
| 6 | Local Security Policy | Configure OS-level security policies |
| 7 | Group Policy Editor | Advanced system policy editor |
| 8 | Credential Manager | View/manage saved credentials |
| 9 | BitLocker Drive Encryption | Encrypt your drives |
| 10 | TPM Management | Check Trusted Platform Module status |

### 📊 System Monitoring
| Option | Tool | Description |
|--------|------|-------------|
| 11 | View Logged In Users | Shows all active user sessions |
| 12 | Check Administrator Status | Verifies admin rights and lists admins |
| 13 | Event Viewer | Windows event log browser |
| 14 | Services Manager | View and control running services |
| 15 | Security Services Status | Live status of Defender, Firewall, etc. |
| 16 | Running Processes | Full process list |
| 17 | Network Connections & Ports | Active connections and listening ports |
| 18 | Password Policy | Min length, lockout, expiry rules |

### 🔧 System Repair & Maintenance
| Option | Tool | Description |
|--------|------|-------------|
| 19 | System File Checker | Runs `sfc /scannow` to fix corrupt files |
| 20 | DISM Health Scan & Repair | Full Windows image health restore |
| 21 | Startup Programs | View all programs that run at boot |
| 22 | Clear Temp Files | Wipes Temp, Prefetch, flushes DNS |
| 23 | Flush DNS Cache | Clears DNS resolver cache |
| 24 | Windows Update | Opens Windows Update settings |

### 🕵️ Privacy & Threat Tools
| Option | Tool | Description |
|--------|------|-------------|
| 25 | Hosts File Viewer | Inspect for malware redirects |
| 26 | Scheduled Tasks Check | Spot suspicious or unknown tasks |
| 27 | Open Network Shares | Detect unexpected shared folders |
| 28 | Malware Removal Tool | Runs Microsoft's built-in MRT |
| 29 | Windows Activation Status | Check if your Windows is genuine |
| 30 | Installed Programs List | Full list + optional Desktop export |

### ⚡ Quick Actions
| Option | Tool | Description |
|--------|------|-------------|
| 31 | Lock Computer | Instantly locks your PC |
| 32 | Flush ARP Cache | Clears network ARP table |
| 33 | Reset Network Stack | Resets Winsock, TCP/IP, Firewall rules |
| 34 | Enable/Disable Remote Desktop | Toggle RDP with firewall rule update |
| 35 | Generate Security Report | Full `.txt` audit report saved to Desktop |

---

## 🚀 How to Use

### Requirements
- Windows 10 or Windows 11
- Administrator privileges (the script will auto-request elevation)

### Steps

1. **Download** `WindowsSecurityToolkit.bat`
2. **Right-click** → **Run as Administrator**
   > *(Or just double-click — it will request elevation automatically)*
3. **Type a number** and press **Enter**
4. Done ✅

---

## 📄 Security Report

Option **[35]** generates a comprehensive `.txt` report saved directly to your **Desktop**, containing:

- ✅ System info (OS, hostname, architecture)
- ✅ Administrator status & local admin list
- ✅ Password policy
- ✅ Firewall status (Domain, Private, Public)
- ✅ Security service states
- ✅ Established network connections
- ✅ All listening ports
- ✅ Startup programs (Registry)
- ✅ Open network shares
- ✅ Logged-in users
- ✅ Hosts file contents
- ✅ Windows activation status
- ✅ ARP table

**Useful for:** sharing with your IT support, keeping a monthly record, or spotting anomalies.

---

## 🛡️ Is This Safe?

Yes — this script only uses **built-in Windows tools and commands** (`netstat`, `sfc`, `netsh`, `reg query`, etc.). It does **not**:
- Connect to the internet
- Download anything
- Modify system settings without your confirmation
- Install any software

You can open the `.bat` file in Notepad to verify every single line before running it.

---

## 💡 Tips

- Run this **monthly** as a quick health check
- After a **security report**, look for:
  - Unknown entries in Startup Programs
  - Unexpected Listening ports (anything above 49000 that you don't recognize)
  - Strange entries in your Hosts file
  - Shares that shouldn't exist (beyond C$, D$, ADMIN$, IPC$)
- Use **Option 19 (SFC)** if Windows feels slow or apps crash unexpectedly
- Use **Option 33 (Reset Network)** only if you're having serious connectivity issues — it requires a restart

---

## 🤝 Contributing

Pull requests are welcome! Ideas for new options:
- [ ] Check for open RDP/SMB vulnerabilities
- [ ] USB device history viewer
- [ ] Disk health check (SMART data)
- [ ] Auto-disable unnecessary Windows services

---

## 📜 License

MIT License — free to use, share, and modify.

---

## 👨‍💻 Author

Built by **Daniel**  
*"A cool way to make sure your computer is safe for browsing and running smoothly."*

---

> ⭐ If this helped you, give it a star on GitHub!
