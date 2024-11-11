// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract Example {
    uint256 constant a = 55; // value inside bytecode
    uint256 b = type(uint256).max; // storage slot - 0x0
    bool c; // storage slot - 0x1

    constructor() {
        // SSTORE - store to some storage location
        // SLOAD - read from some storage location
        bytes32 x;
        assembly {
            x := sload(0x0)
        }
        
        console.logBytes32(x);
    }
}
