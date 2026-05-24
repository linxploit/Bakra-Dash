<div align="center">

```text
██╗   ██╗ █████╗ ██╗  ██╗██████╗  █████╗ ██████╗  █████╗ ███████╗██╗  ██╗
██║   ██║██╔══██╗██║ ██╔╝██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔════╝██║  ██║
██║   ██║███████║█████╔╝ ██║  ██║███████║██████╔╝███████║███████╗███████║
╚██╗ ██╔╝██╔══██║██╔═██╗ ██║  ██║██╔══██║██╔══██╗██╔══██║╚════██║██╔══██║
 ╚████╔╝ ██║  ██║██║  ██╗██████╔╝██║  ██║██║  ██║██║  ██║███████║██║  ██║
  ╚═══╝  ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝
```

# 🐐 BakraDash

**Advanced Social Engineering & Security Awareness Framework**

[![Bash](https://img.shields.io/badge/Bash-5.0%2B-black?style=flat-square&logo=gnu-bash&logoColor=white)]()
[![PHP](https://img.shields.io/badge/PHP-7.4%2B-777BB4?style=flat-square&logo=php&logoColor=white)]()
[![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)](LICENSE)
[![Templates](https://img.shields.io/badge/Templates-8%20Professional-purple?style=flat-square)]()
[![Platform](https://img.shields.io/badge/Platform-Linux%20%7C%20Termux%20%7C%20WSL-orange?style=flat-square)]()
[![Status](https://img.shields.io/badge/Status-Active-brightgreen?style=flat-square)]()

*Professional-grade social engineering framework designed for authorized security testing, awareness training, and red team simulations.*

---

[Features](#-features) · [Installation](#-installation) · [Usage](#-usage) · [Templates](#-templates) · [Architecture](#️-architecture) · [Ethics](#-ethical-use)

</div>

---

## 🔍 Overview

**BakraDash** is a lightweight and portable social engineering framework built for security researchers, ethical hackers, and red team operators conducting authorized security assessments and awareness exercises.

The framework provides a collection of professional HTML5 templates capable of simulating realistic user interaction scenarios during controlled engagements. Designed with simplicity and portability in mind, BakraDash runs entirely on a minimal Bash + PHP stack without heavy external dependencies.

---

## ✨ Features

| Capability | Detail |
|---|---|
| **Multi-Template Engine** | 8 realistic HTML5 templates for simulation scenarios |
| **Camera Interaction** | Browser-based camera interaction support |
| **IP Logging** | Visitor IP and request logging |
| **Real-time Monitoring** | Live terminal monitoring interface |
| **Cross-Platform** | Linux, Termux, macOS, and WSL support |
| **Portable Architecture** | Lightweight Bash + PHP backend |
| **Responsive Templates** | Optimized for desktop and mobile browsers |
| **Minimal Dependencies** | Simple setup with native PHP server |
| **Organized Storage** | Structured directories for captured data |

---

## 🖥️ Installation

### Prerequisites

- PHP **7.4+**
- Bash shell
- Linux / macOS / WSL / Termux

### Quick Start

```bash
# 1. Clone the repository
git clone https://github.com/linxploit/bakradash.git

# 2. Enter directory
cd bakradash

# 3. Install dependencies

# Debian / Ubuntu
sudo apt install php curl wget -y

# Arch Linux
sudo pacman -S php curl wget

# macOS
brew install php curl wget

# Termux
pkg install php curl wget -y

# 4. Make executable
chmod +x bakra-dash.sh

# 5. Run
bash bakra-dash.sh
```

---

## 🚀 Usage

### Start BakraDash

```bash
bash bakra-dash.sh
```

### Workflow

```text
1. Launch BakraDash
2. Select a template
3. Start the local PHP server
4. Share the generated testing page
5. Monitor incoming activity in real time
```

### Example Console Output

```text
🐐[*] Waiting for incoming connection...

🐐[+] Visitor connected
    📍 IP: 192.168.1.100

🐐[+] Camera snapshot received
    📸 Saved: cam_25122024_143022.png
```

---

## 📂 Templates

| # | Template | Scenario |
|---|---|---|
| 1 | Festival Greeting | Greeting & selfie flow |
| 2 | Online Meeting | Video meeting simulation |
| 3 | Live Stream | Streaming access page |
| 4 | Identity Verification | Verification scenario |
| 5 | Dating Profile | Profile verification |
| 6 | Support Chat | Live support interaction |
| 7 | Job Interview | Interview simulation |
| 8 | Doctor Visit | Telemedicine scenario |

### Included in Every Template

- Responsive design
- Professional UI layouts
- Camera interaction support
- Logging integration
- Mobile compatibility

---

## 📁 Project Structure

```text
bakradash/
├── bakra-dash.sh          # Main Bash orchestrator
├── ip_logger.php          # IP logging backend
├── post.php               # Camera snapshot handler
├── templates/             # HTML5 templates
├── captured_images/       # Saved snapshots
├── saved.ip.txt           # Visitor logs
├── logs/                  # Runtime logs
├── README.md
└── LICENSE
```

---

## ⚙️ Architecture

```text
bakra-dash.sh
│
├── Template Selection
├── PHP Local Server
├── Real-time Monitoring
│
├── ip_logger.php
├── post.php
│
└── templates/
```

---

## 🛠️ Troubleshooting

| Issue | Solution |
|---|---|
| `php: command not found` | Install PHP |
| Port already in use | Kill existing PHP process |
| Camera not working | Browser permission required |
| Wrong template loading | Restart the tool and clear cache |

### Manual PHP Server

```bash
php -S 0.0.0.0:8080
```

---

## 🔒 Ethical Use

This project is intended **strictly** for:

- Authorized penetration testing
- Security awareness demonstrations
- Internal security assessments
- Educational research
- Red team simulations within defined scope

**Do not use this tool for unauthorized surveillance, phishing, or illegal activities.**

You are solely responsible for ensuring your usage complies with all applicable laws and regulations in your jurisdiction.

The authors assume **zero liability** for misuse.

---

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch:
   ```bash
   git checkout -b feature/improvement
   ```
3. Commit your changes:
   ```bash
   git commit -m "Add new feature"
   ```
4. Push to your branch:
   ```bash
   git push origin feature/improvement
   ```
5. Open a Pull Request

---

## 📄 License

Released under the **MIT License** — see [LICENSE](LICENSE) for full terms.

---

<div align="center">

Built with 🐐 by **Mindless x Linxploit**

*For authorized security research and educational purposes only.*

</div>
