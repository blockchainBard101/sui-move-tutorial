# Installing Sui Move on Linux (Ubuntu)

This guide provides step-by-step instructions to install Sui Move, set up the `sui-move-analyzer` language server, and configure VSCode for development.

---

## Prerequisites

Ensure your system is updated and you have the necessary tools installed.

### **Step 1: Update the System**
```bash
sudo apt-get update
```

### **Step 2: Install Required Dependencies**
```bash
sudo apt-get install curl git-all cmake gcc libssl-dev pkg-config libclang-dev libpq-dev build-essential
```

---

## Installing Rust

### **Step 3: Verify `curl` is Installed**
Check if `curl` is installed by running:
```bash
curl --version
```
If not installed, use:
```bash
sudo apt install curl
```

### **Step 4: Install Rust**
You can install Rust in two ways:
1. Install Rust using the official installer:
   ```bash
   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
   ```
   after installing run to fix the PATH
   ```bash
   . "$HOME/.cargo/env"
   ```
   
2. If Rust is already installed, update to the latest stable version:
   ```bash
   rustup update stable
   ```

---

## Installing Sui CLI

### **Step 5: Install Sui CLI**
Use the following command to install the Sui CLI:
```bash
cargo install --locked --git https://github.com/MystenLabs/sui.git --branch testnet sui --features tracing
```

### **Step 6: Verify Sui Installation**
Check the installed version:
```bash
sui --version
```

---

## Setting Up `sui-move-analyzer` Language Server

### **Step 7: Download the Precompiled Binary**
Download the latest `sui-move-analyzer` binary for Ubuntu from the [releases page](https://github.com/movebit/sui-move-analyzer/releases/download/v1.1.8/sui-move-analyzer-ubuntu22.04-x86_64-v1.1.8).

### **Step 8: Rename the Binary**
Rename the downloaded file to:
```bash
sui-move-analyzer
```

### **Step 9: Move Binary to System Path**
Move the binary to a directory in your PATH, such as `/usr/local/bin`:
```bash
sudo mv sui-move-analyzer /usr/local/bin
```

### **Step 10: Grant Execute Permissions**
Make the binary executable:
```bash
sudo chmod +x /usr/local/bin/sui-move-analyzer
```

### **Step 11: Verify the Installation**
Check the installed version:
```bash
sui-move-analyzer --version
```

---

## Installing VSCode

### **Step 12: Download VSCode**
Download the latest `.deb` package for VSCode from the [official site](https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64).

### **Step 13: Install VSCode**
Navigate to the directory where the `.deb` file was downloaded:
```bash
cd ~/Downloads/
```
Install the package:
```bash
sudo apt install ./code*.deb
```

---

## Recommended VSCode Extensions

Install the following extensions for an optimal development experience:
1. [Sui Move Analyzer](https://marketplace.visualstudio.com/items?itemName=MoveBit.sui-move-analyzer)
2. [Even Better TOML](https://marketplace.visualstudio.com/items?itemName=tamasfe.even-better-toml)
3. [Move by MystenLabs](https://marketplace.visualstudio.com/items?itemName=mysten.move)
4. [Move Syntax by Damir Shamanaev](https://marketplace.visualstudio.com/items?itemName=damirka.move-syntax)

---

## Video Guide

Here is a video guide on how to install Sui on Ubuntu:

[![Install Sui on Ubuntu](https://img.youtube.com/vi/owSlmn_-p3I/0.jpg)](https://youtu.be/owSlmn_-p3I)
```
