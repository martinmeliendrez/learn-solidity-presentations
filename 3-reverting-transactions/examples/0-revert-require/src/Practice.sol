// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {

    // Payable contructor to accept and require a minimum of 1 ether
    constructor() payable {
        // Require at least 1 ether to be sent; otherwise, revert the transaction
        require(msg.value >= 1 ether, "Insufficient Ether provided");
    }
    
}