// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Goal 1////: Pass Calldata
// The Sidekick needs to be able to relay any calldata along to the Hero. Update the relay function to take the data and send it to the Hero as calldata.

// Goal 2: Trigger the fallback
//In the makeContact method, send some calldata to the Hero contract that will trigger its fallback function.

contract Sidekick {
    function relay(address hero, bytes memory data) external {
        // TODO: send all of the data as calldata to the hero
        (bool success, ) = hero.call(data);
        require(success, "Call to Hero contract failed");
    }

    function makeContact(address hero) external {
        // TODO: trigger the hero's fallback function!
        (bool success, ) = hero.call(abi.encodeWithSignature("nonExistentFunction()"));
        require(success, "Call to Hero's fallback function failed");
        
    }
}