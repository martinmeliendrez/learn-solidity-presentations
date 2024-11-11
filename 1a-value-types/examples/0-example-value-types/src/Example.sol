// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract Example {
    uint8 a = 255; // 0 -> 255
    uint256 b = type(uint).max; // alias: uint

    int8 c = 127; // -128 -> 127
    int256 d = -55; // alias: int256

    bool myConditio = true;

    enum Choice {
        Up,
        Down,
        Left,
        Right
    }

    Choice choice = Choice.Up;

    constructor(Choice choice) {
        if(choice == Choice.Up) {
            console.log("up");
        }      
        if(choice == Choice.Down) {
            console.log("down");
        }   
    }

    
}
