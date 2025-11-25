// SPDX-License-Identifier: LGPL-3.0-only
pragma solidity 0.8.24;

/// @title Sender Ownership
/// @author Agustin Acosta
/// @notice Establishes an immutable owner upon deployment
contract Sender {

    // Optimization: 'immutable' variables are stored in the bytecode, not storage.
    // Since 'owner' is only set once in the constructor, this saves significant gas.
    address public immutable owner;

    constructor() {
        owner = msg.sender;
    }
}