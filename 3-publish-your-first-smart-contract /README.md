# Publishing Your Smart Contract

This guide walks you through creating, setting up, and publishing a smart contract using the Sui blockchain.

---

## 1. Create a New Package

Start by creating a new Move package for your smart contract:

```bash
$ sui move new <NAME>
```

### Write Your Smart Contract

Write the logic for your smart contract.


Build the package to generate the necessary artifacts:

```bash
$ sui move build
```

---

## 2. Set Up an Account

To publish and interact with your smart contract, you need a Sui account. If you already have one set up, you can skip this step.

### Create a New Account

If you're setting up for the first time, create an account by running the following command:

```bash
$ sui client
```

You'll be prompted to answer several questions:

1. **Connect to a Sui Full Node server**  
   ```
   Config file ["/path/to/home/.sui/sui_config/client.yaml"] doesn't exist, do you want to connect to a Sui Full node server [y/N]?
   > y
   ```

2. **Specify the Full Node server URL**  
   ```
   Sui Full node server URL (Defaults to Sui Testnet if not specified):
   >
   ```

3. **Select key scheme to generate keypair**  
   ```
   Select key scheme to generate keypair (0 for ed25519, 1 for secp256k1, 2 for secp256r1):
   > 0
   ```

The CLI will generate a new keypair and save it to the configuration file.

### Verify Your Account

After setup, verify the account using:

```bash
$ sui client active-address
```

This command outputs your account address (e.g., `0x...`).

---

## 3. Switch to the Devnet Environment

For demonstration purposes, switch to the Sui devnet environment:

```bash
$ sui client new-env --alias devnet --rpc https://fullnode.devnet.sui.io:443
```

Check available environments with:

```bash
$ sui client envs
```

Example output:
```
╭──────────┬───────────────────────────────────────┬────────╮
│ alias    │ url                                   │ active │
├──────────┼───────────────────────────────────────┼────────┤
│ devnet   │ https://fullnode.devnet.sui.io:443    │        │
│ mainnet  │ https://sui-mainnet.nodeinfra.com:443 │        │
│ localnet │ http://127.0.0.1:9000                 │        │
│ testnet  │ https://fullnode.testnet.sui.io:443   │        │
╰──────────┴───────────────────────────────────────┴────────╯
```

---

## 4. Request Coins

In devnet and testnet environments, you can request coins to interact with the network.

```bash
$ sui client faucet
```

Wait a few moments, then check your gas balance:

```bash
$ sui client gas
```

Example output:
```
╭────────────────────────────────────────────────────────────────────┬────────────────────┬──────────────────╮
│ gasCoinId                                                          │ mistBalance (MIST) │ suiBalance (SUI) │
├────────────────────────────────────────────────────────────────────┼────────────────────┼──────────────────┤
│ 0x...                                                              │ 1000000000         │ 1.00             │
╰────────────────────────────────────────────────────────────────────┴────────────────────┴──────────────────╯
```

---

## 5. Publish Your Package

To publish your package to the Sui network:

```bash
$ sui client publish
```

This command builds your package and uploads the bytecode in a single transaction.

---

## 6. Send Transactions

To interact with your smart contract, use the following commands:

### Call a Function
```bash
$ sui client call --package <PACKAGE> --module <MODULE> --function <FUNCTION>
```

With arguments:
```bash
$ sui client call --package <PACKAGE> --module <MODULE> --function <FUNCTION> --args <ARGS>
```

With type arguments:
```bash
$ sui client call --package <PACKAGE> --module <MODULE> --function <FUNCTION> --args <ARGS> --type-args <TYPE_ARGS>
```

---

## Video Guide

For a step-by-step walkthrough, watch this video tutorial:

[![Install Sui on Windows](https://img.youtube.com/vi/owSlmn_-p3I/0.jpg)](https://youtu.be/Ncg35fzNJ0o)

---

## Additional Resources

Refer to the [Move Book: Your First Move Program](https://move-book.com/your-first-move/hello-world.html) for more details on Move programming.



