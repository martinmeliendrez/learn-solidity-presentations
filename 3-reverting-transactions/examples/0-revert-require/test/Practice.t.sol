// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/Practice.sol";

contract ContractTest is Test {
    Contract public myContract;
    address owner = address(2);

    function setUp() public {
        hoax(owner);
        myContract = new Contract{ value: 1 ether }();
    }

    function testSuccess1Ether() public {
        myContract = new Contract{ value: 1 ether }();
        assertFalse(address(myContract) == address(0));
    }

    function testFailure1Ether() public {
        myContract = new Contract{ value: 0.5 ether }();
        assertEq(address(myContract), address(0));
    }

    function testAsOwner() public {
        vm.prank(owner);
        uint balanceBefore = address(owner).balance;
        myContract.withdraw();
        uint balanceAfter = address(owner).balance;
        assertEq(balanceAfter - balanceBefore, 1 ether);
    }

    function testAsNotOwner() public {
        vm.prank(address(3));
        vm.expectRevert();
        myContract.withdraw();
    }
}
