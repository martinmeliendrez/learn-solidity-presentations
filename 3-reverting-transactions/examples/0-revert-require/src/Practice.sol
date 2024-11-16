// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


// Goal 1: Require 1 Ether
// Add a payable constructor method that requires a 1 ether deposit.

// Goal 2: Owner Withdrawal
// 1. Create a public function withdraw that will withdraw all funds from the contract and send them to the deployer of the contract.
// 2. Require that only the deployer of the contract be allowed to call this function. For all other addresses, this function should revert.

contract Contract {
    address deployer = msg.sender;

    // @notice a non-privileged user attempted to access deployer-only method
    error NotContractDeployer(address);

    // Payable contructor to accept and require a minimum of 1 ether
    constructor() payable {
        // Require at least 1 ether to be sent; otherwise, revert the transaction
        require(msg.value >= 1 ether, "Insufficient Ether provided");
    }

    function withdraw() external {
        if(msg.sender != deployer) {
            // Revert with a custom error revert 
            revert NotContractDeployer(msg.sender);
        }
        //  Withdraw all funds from the contract and send them to the deployer of the contract
        (bool success, ) = deployer.call{ value: address(this).balance }("");
        require(success);
    }
    
}