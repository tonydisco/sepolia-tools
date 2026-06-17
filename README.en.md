# 🦊 Sepolia Tools

🌐 **English** · [Tiếng Việt](README.md)

A **local** helper page for working with a MetaMask wallet on the **Sepolia testnet**:

- Connect MetaMask, view **ETH** and **USDT** balances in real time
- **Add tokens** to MetaMask via `wallet_watchAsset` (works around MetaMask's manual-import bug where a token shows "added" but never appears)
- **Mint test USDT** directly by calling the token contract
- Quick links to **faucets** for Sepolia ETH

Everything runs offline on your machine (a single static HTML file + a simple HTTP server). No backend, no data collection.

![Sepolia Tools screenshot](docs/screenshot.png)

---

## 🚀 Quick start

```bash
./start.sh
```

The script will:
1. Serve the app at `http://localhost:8765/`
2. Open your default browser automatically

Use a different port: `./start.sh 9000`

Stop the app: press `Ctrl+C`.

> Requirements: `python3` (preinstalled on macOS/Linux) and a browser with **MetaMask** installed.

---

## 📖 Usage

### 1. Connect & view balances
- Click **Connect MetaMask** → pick an account → the app switches to Sepolia if needed.
- **ETH** and **USDT** balances show immediately. Click **Refresh balances** to update.

### 2. Add USDT to your wallet
- Click **Add USDT token** → MetaMask shows an "Add suggested token" popup → **Add token**.
- Use this when MetaMask's manual import says "added" but the token never appears in the list.

### 3. Add any custom token
- Enter the **contract address**, **symbol**, and **decimals** → **Add custom token**.

### 4. Mint USDT
- Enter the amount of USDT to mint (the app multiplies by ×10⁶ for you) → **Mint USDT** → **Confirm** in MetaMask.
- Requires a little Sepolia ETH for gas.
- Wait ~15s, then click **Refresh balances**.

### 5. Get Sepolia ETH (faucets)
- Click **Copy địa chỉ ví** (copy wallet address), then open a faucet and paste your address.

---

## 🪙 USDT token (Test Tether USD)

| Property | Value |
|---|---|
| Network | Sepolia (chainId `11155111` / `0xaa36a7`) |
| Contract | `0x7169d38820dfd117c3fa1f22a697dba58d90ba06` |
| Symbol | USDT |
| Decimals | **6** |
| Mint function | `_giveMeTokens(uint256)` — selector `0xf5e3f1f7` (public faucet) |

> The mint selector was verified directly from the input data of a successful on-chain mint transaction — not guessed.

---

## ❓ Mint vs Faucet — what's the difference?

| | **Mint** | **Faucet** |
|---|---|---|
| Nature | **Creates new** tokens from a contract (increases total supply) | **Hands out** existing coins from a pre-funded pool |
| Used for | ERC-20 tokens that expose a mint function | Native coin (Sepolia ETH) |
| How | You call the contract function from your wallet | A website/service sends it to you |

**Native ETH cannot be minted** because no contract controls its supply — you can only get it from a faucet. ERC-20 tokens, on the other hand, define their own mint function, so anyone allowed to call it can create new tokens.

---

## 📁 Structure

```
sepolia-tools/
├── index.html        # the whole app (UI + logic)
├── start.sh          # start the server + open the browser
├── README.md         # Vietnamese docs
├── README.en.md      # this file (English docs)
├── docs/
│   └── screenshot.png
└── .gitignore
```

## 🔒 Security

- The app **never** asks for your seed phrase / private key. Every transaction is signed through the MetaMask popup.
- For **Sepolia testnet only**. Do not use with real assets on mainnet.
- The faucet funds and tokens here are for testing only and have **no real monetary value**.
