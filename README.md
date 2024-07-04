# 🚀 Ubuntu Setup Script

This script automates the setup process for an Ubuntu system, including the installation and configuration of various tools and dependencies.

## ✨ Features

- 📦 Updates and upgrades system packages
- 🛠️ Installs Git
- 🔐 Installs Pass (password manager)
- ⬇️ Downloads and installs Git Credential Manager Core
- 🔏 Configures Git to use GPG for credential storage
- 🔑 Generates a GPG key and initializes Pass with the generated key
- 🌐 Installs NVM (Node Version Manager)
- 🟢 Installs the latest stable version of Node.js

## 📋 Prerequisites

- An Ubuntu system
- Internet connection

## 📖 Usage

1. **Clone the repository or download the `setup-ubuntu.sh` script.**

2. **Open a terminal and navigate to the directory where `setup-ubuntu.sh` is located.**

3. **Make the script executable by running:**
    ```bash
    wget https://raw.githubusercontent.com/mfadhlan24/setupUbuntu-firstly/main/setup-ubuntu.sh
    chmod +x setup-ubuntu.sh
    ```

4. **Execute the script:**
    ```bash
    ./setup-ubuntu.sh
    ```

The script will guide you through the process of generating a GPG key if you don't already have one. Once the setup is complete, you'll have a fully configured Ubuntu environment ready for development.

## 📝 Notes

- Ensure you have the necessary permissions to run the script.
- The script requires user interaction for GPG key generation.

## 💬 Feedback

If you have any feedback, please reach out to us at [admin@lanzzstore.com](mailto:admin@lanzzstore.com).

---

Happy coding! 🚀
