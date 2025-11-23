# 🔐 Identity & Assets: Ownership Implementation

Continuing my journey in the **Master in Blockchain Development** at **Blockchain Accelerator Academy**, these projects focus on two critical aspects of Web3 development: **Contract Ownership**

Coming from a **Java** environment, understanding how the EVM handles user identity (`msg.sender`) is crucial for building secure decentralized applications.

## Project: Sender (Ownership Basics)

The **Sender** contract explores the global namespace in Solidity.
* **Goal:** To permanently store the address of the person who deployed the contract.
* **Key Concept:** `msg.sender`. Unlike Java, where user identity is often handled by session tokens or JWTs passed in headers, in Solidity, the "caller" is an intrinsic part of the transaction context. This project sets the foundation for Access Control patterns (like `Ownable`).

## 🛠️ Stack & Tools

* **Language:** Solidity `^0.8.24`
* **Concepts:** `msg.sender`.

---

*This project represents the building blocks for authentication and economy design in my Web3 portfolio.*
