# Installing Sui on Windows Using WSL

This guide will walk you through installing the Sui CLI and related tools on a Windows machine using WSL (Windows Subsystem for Linux). By the end of this guide, you'll have a fully functional development environment ready for Sui smart contract development.

---

## Prerequisites

1. **Windows 10 or 11** with WSL support.
2. Administrator privileges to install software.

---

## Step 1: Install WSL

1. Open your terminal as an Administrator.
2. Run the following command to install WSL:
   ```bash
   wsl --install
   ```
3. Once the installation finishes, restart your system.

---

## Step 2: Set Up Ubuntu in WSL

1. After restarting, search for "Ubuntu" in the Start Menu and open it.
2. Complete the initial Ubuntu setup, including setting your username and password.
3. Verify that Ubuntu is installed and functional by running:
   ```bash
   lsb_release -a
   ```
4. Update your system and install necessary tools:
   ```bash
   sudo apt-get update
   ```

---

## Step 3: Install Required Dependencies

Install the following dependencies in Ubuntu:

```bash
sudo apt-get install curl git-all cmake gcc libssl-dev pkg-config libclang-dev libpq-dev build-essential
```

Verify the installation of `curl`:

```bash
curl --version
```

If `curl` is not installed, you can install it manually:

```bash
sudo apt install curl
```

---

## Step 4: Install Rust

Install Rust using the following command:

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

Follow the on-screen instructions to complete the Rust installation.

---

## Step 5: Install Sui CLI

Use the `cargo` package manager (installed with Rust) to install the Sui CLI:

```bash
cargo install --locked --git https://github.com/MystenLabs/sui.git --branch testnet sui --features tracing
```

Verify the installation:

```bash
sui --version
```

---

## Step 6: Install `sui-move-analyzer` Language Server

The `sui-move-analyzer` language server provides enhanced features for Move smart contract development. Install it using:

```bash
cargo install --git http://github.com/movebit/sui-move-analyzer --branch master sui-move-analyzer
```

---

## Step 7: Install Visual Studio Code (VS Code)

1. [Download VS Code](https://code.visualstudio.com/) and install it on your system.
2. Open VS Code using the Ubuntu terminal:
   ```bash
   code .
   ```

---

## Step 8: Install VS Code Extensions

Install the following extensions to enhance your development experience:

1. [Sui Move Analyzer](https://marketplace.visualstudio.com/items?itemName=MoveBit.sui-move-analyzer)
2. [Even Better TOML](https://marketplace.visualstudio.com/items?itemName=tamasfe.even-better-toml)
3. [Move by MystenLabs](https://marketplace.visualstudio.com/items?itemName=mysten.move)
4. [Move Syntax by Damir Shamanaev](https://marketplace.visualstudio.com/items?itemName=damirka.move-syntax)

---

## Step 9: Set Up `sui-move-analyzer` in VS Code

1. Open VS Code settings with `Ctrl + ,`.
2. Navigate to **Remote > [WSL: Ubuntu] > Extensions**.
3. Locate the **Move Analyzer** extension and configure its server path:
   1. Open the terminal (`Ctrl + ``) and find the `sui-move-analyzer` path:
      ```bash
      which sui-move-analyzer
      ```
   2. Copy the path and paste it into the "Server Path" box in the Move Analyzer extension settings.

---

## Final Notes

You now have a complete Sui development environment on Windows using WSL. You're ready to start building with the Sui blockchain and the Move programming language.

For further assistance or troubleshooting, consult the [Sui documentation](https://docs.sui.io/).
``` 