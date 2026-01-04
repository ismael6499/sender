# 🔐 EVM Ownership Primitives: Immutable Identity

![Solidity](https://img.shields.io/badge/Solidity-0.8.24-363636?style=flat-square&logo=solidity)
![License](https://img.shields.io/badge/License-MIT-blue?style=flat-square)

A reference implementation of **Immutable Access Control** patterns on the Ethereum Virtual Machine.

This project isolates the fundamental mechanism of on-chain identity verification, prioritizing **gas efficiency** over flexibility. Unlike standard `Ownable` implementations which allow ownership transfer (consuming storage slots), this primitive enforces a permanent, trustless link between the deployer and the contract logic using bytecode insertion.

## 🏗 Architecture & Design Decisions

### 1. Gas Optimization (Storage vs. Bytecode)
- **Immutable Variables:** The contract utilizes the `immutable` keyword for the owner address.
    - *Technical Impact:* Instead of writing to contract storage (SSTORE) and reading via SLOAD (2100 gas cold / 100 warm), the address is injected directly into the contract's runtime bytecode during construction.
    - *Result:* Accessing the owner variable becomes a `PUSH` operation (approx. 3 gas), drastically reducing the execution cost for any access-control check compared to standard storage patterns.

### 2. Security Patterns
- **Hardcoded Trust Anchors:** By design, the ownership is non-transferable. This creates a "Trust Anchor" architecture where the authorized controller is deterministic and verifiable purely by inspecting the contract creation code, eliminating risks associated with key rotation attacks or accidental transfers.
- **Global Namespace Verification:** Leverages `msg.sender` within the constructor scope to cryptographically bind the contract to the deployer's public key without requiring signature verification logic inside the contract.

## 🛠 Tech Stack

* **Core:** Solidity `^0.8.24`
* **Concepts:** Immutable State, EVM Opcodes, Bytecode Optimization.
* **License:** LGPL-3.0-only

## 📝 Contract Interface

The implementation exposes a single, gas-optimized endpoint for identity verification:

```solidity
// Stored directly in runtime bytecode
address public immutable owner;

constructor() {
    owner = msg.sender;
}
```

---
*Reference implementation for high-efficiency EVM access control.*
