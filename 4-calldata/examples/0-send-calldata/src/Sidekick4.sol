// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Goal: Pass Calldata
// The Sidekick needs to be able to relay any calldata along to the Hero. Update the relay function to take the data and send it to the Hero as calldata.

contract Sidekick {
    function relay(address hero, bytes memory data) external {
        // send all of the data as calldata to the hero
        (bool success, ) = hero.call(data);
        require(success, "Call to Hero contract failed");
    }
}