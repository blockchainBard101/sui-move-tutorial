# Installing Sui on Windows Using WSL

This guide provides step-by-step instructions to set up the Sui CLI and development environment on Windows using WSL (Windows Subsystem for Linux).

---

## Step 1: Install WSL

1. Open your terminal as an Administrator.
2. Install WSL by running the following command:
   ```bash
   wsl --install
   ```
3. Restart your system once the installation finishes.

---

## Step 2: Set Up Ubuntu in WSL

1. Search for **Ubuntu** in the Start Menu and open it.
2. Complete the Ubuntu setup, including username and password configuration.
3. Verify the installation by running:
   ```bash
   lsb_release -a
   ```
4. Update your system and install essential tools:
   ```bash
   sudo apt-get update
   ```

---

## Step 3: Install Required Dependencies

Run the following command to install all necessary dependencies:

```bash
sudo apt-get install curl git-all cmake gcc libssl-dev pkg-config libclang-dev libpq-dev build-essential
```

Check if `curl` is installed:
```bash
curl --version
```

If not installed, run:
```bash
sudo apt install curl
```

---

## Step 4: Install Rust

Install Rust by running:

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

Update Rust to the latest stable version:
```bash
rustup update stable
```

Install Cargo if it's not already installed:
```bash
sudo apt install cargo
```

---

## Step 5: Install Sui CLI

Use Cargo to install the Sui CLI:

```bash
cargo install --locked --git https://github.com/MystenLabs/sui.git --branch testnet sui --features tracing
```

Verify the installation:
```bash
sui --version
```

---

## Step 6: Install Visual Studio Code (VS Code)

1. [Download VS Code](https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user) and install it on your Windows system.
2. Open VS Code using the Ubuntu terminal:
   ```bash
   code .
   ```

---

## Step 7: Install `sui-move-analyzer` Using Precompiled Binary

### **Step 6.1: Download the Precompiled Binary**
1. Download the latest `sui-move-analyzer` binary for Ubuntu from the [Releases Page](https://github.com/movebit/sui-move-analyzer/releases/download/v1.1.8/sui-move-analyzer-ubuntu22.04-x86_64-v1.1.8).
2. Rename the downloaded file:
   ```bash
   sui-move-analyzer
   ```
3. Move the `sui-move-analyzer` to `move it to Linux/Ubuntu/home/{name}/`

### **Step 6.2: Move Binary to System Path**
Move the binary to a directory in your PATH:
```bash
sudo mv sui-move-analyzer /usr/local/bin
```

### **Step 6.3: Grant Execute Permissions**
Make the binary executable:
```bash
sudo chmod +x /usr/local/bin/sui-move-analyzer
```

### **Step 6.4: Verify the Installation**
Check the installed version:
```bash
sui-move-analyzer --version
```

---


## Step 8: Install VS Code Extensions

To enhance your development environment, install the following extensions:

1. [WSL](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl)
2. [Sui Move Analyzer](https://marketplace.visualstudio.com/items?itemName=MoveBit.sui-move-analyzer)
3. [Even Better TOML](https://marketplace.visualstudio.com/items?itemName=tamasfe.even-better-toml)
4. [Move by MystenLabs](https://marketplace.visualstudio.com/items?itemName=mysten.move)
5. [Move Syntax by Damir Shamanaev](https://marketplace.visualstudio.com/items?itemName=damirka.move-syntax)

---

## Video Guide

Watch this video guide for additional help:

[![Install Sui on Windows](https://img.youtube.com/vi/owSlmn_-p3I/0.jpg)](https://youtu.be/pXfT1IXw5wg)

---

You now have a fully functional environment to build with the Sui blockchain. Happy coding!