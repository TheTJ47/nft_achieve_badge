<img width="1920" height="871" alt="Screenshot 2025-08-12 145440" src="https://github.com/user-attachments/assets/3edc1720-a1ad-4f4a-9a6f-e8e4993524bc" />
## 🏅 NFT Achieve Badge

A Clarity smart contract on the [Stacks](https://stacks.co/) blockchain for issuing achievement-based NFTs.
Designed to reward learners, builders, and contributors with verifiable, on-chain digital badges.

---

### 📁 Project Structure

```
├── contracts/           # Clarity smart contracts
├── tests/               # Unit tests for contracts
├── deployments/         # Generated deployment plans
├── settings/            # Network configs (Mainnet/Testnet)
├── Clarinet.toml        # Clarinet project config
├── package.json         # Node.js dependencies
├── tsconfig.json        # TypeScript config
├── vitest.config.js     # Vitest testing config
├── .gitignore
└── .gitattributes
```

---

### 🚀 Getting Started

#### 1. Clone the repo

```bash
git clone https://github.com/TheTJ47/nft_achieve_badge.git
cd nft_achieve_badge
```

#### 2. Install dependencies

```bash
npm install
```

#### 3. Check contract syntax

```bash
clarinet check
```

#### 4. Deploy to Testnet

```bash
# Generate plan
clarinet deployments generate --testnet --low-cost

# Apply deployment plan to Testnet
clarinet deployments apply --testnet
```

**Note:** Requires [Docker](https://docs.docker.com/get-docker/) to be running.

---

### 🌐 Live Deployment (Testnet)

* **Contract Name:** `nft-achieve-badge`
* **Contract ID:** [`ST338P76HZYBD44YJ40WBR3Y50ENME6MXTD4NG487.nft-achieve-badge`](https://explorer.hiro.so/txid/0x35cd9676c70a41fcc4da8849f6a97cb11ff704da1d227d232781786b955234ef?chain=testnet)
* **Transaction ID:** `0x35cd9676c70a41fcc4da8849f6a97cb11ff704da1d227d232781786b955234ef`
* **Deployed By:** `ST338P76HZYBD44YJ40WBR3Y50ENME6MXTD4NG487`
* **Fees Paid:** 0.02508 STX
* **Block Height:** `#3514076` (Bitcoin anchor block `#78983`)
* **Clarity Version:** 3
* **Contract Stats:**

  * **4** functions
  * **6** variables
  * **2** maps
  * **1** token
<img width="1920" height="871" alt="Screenshot 2025-08-12 145440" src="https://github.com/user-attachments/assets/efbdfe88-bc5f-481d-8a6f-38b31fadb167" />

---

### 🧪 Interacting with the Contract

Once deployed, you can run these in the **Clarinet console**:

```clojure
;; Award a badge (run as contract-owner)
(contract-call? .nft-achieve-badge award-badge u1 'ST2CY5V39NHDPWSXMW9QDT3HC3GD6Q6XX4CFRK9AG "First Milestone" "Completed first goal")

;; Check if recipient has completed
(contract-call? .nft-achieve-badge has-completed 'ST2CY5V39NHDPWSXMW9QDT3HC3GD6Q6XX4CFRK9AG u1)

;; Get badge metadata
(contract-call? .nft-achieve-badge get-badge-info u1)

;; Burn badge (switch sender first)
::set_tx_sender ST2CY5V39NHDPWSXMW9QDT3HC3GD6Q6XX4CFRK9AG
(contract-call? .nft-achieve-badge burn-badge u1)
```

Or use the [Stacks Explorer contract page](https://explorer.hiro.so/txid/0x35cd9676c70a41fcc4da8849f6a97cb11ff704da1d227d232781786b955234ef?chain=testnet) to call functions directly.

---

### 🧠 Features

* ✅ Achievement-based NFT minting
* 🔒 Permissioned mint logic
* 📜 Transparent Clarity code
* 🧪 Tested with [Clarinet](https://www.hiro.so/clarinet) + [Vitest](https://vitest.dev/)

---

### 📚 Example Use Cases

* **Education Platforms** – Reward students for course completions
* **Hackathons** – Issue badges for participation or winning
* **Open Source** – Recognize contributors with on-chain proof

---

### 👨‍💻 Author

**Tejas Bagal**
🔗 [GitHub](https://github.com/TheTJ47)
🎓 Empowering learners through tech and storytelling

