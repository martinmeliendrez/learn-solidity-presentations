// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract Example {
    uint256 public sum;
    uint256 public product;
    uint256 public x;

    constructor(uint256 _x, uint256 _y) {
        (sum, product) = math(_x, _y);
        x = _x;
    }

    function math(uint256 _x, uint256 _y) private pure returns (uint256, uint256) {
        return (_x + _y, _x * _y);
    }

    function increment() external {
        x += 1;
    }

    function add(uint256 y) external view returns(uint256) {
        return x+y;
    }
}
