
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

You can also test via the [Stacks Explorer](https://explorer.stacks.co/?chain=testnet) by searching for your **contract ID**:

```
ST338P76HZYBD44YJ40WBR3Y50ENME6MXTD4NG487.nft-achieve-badge
```

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

---
