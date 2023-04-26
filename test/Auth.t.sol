// SPDX-License-Identifier: MIT

pragma solidity 0.8.17;

import "forge-std/Test.sol";
import {Wallet} from "src/Wallet.sol";
import "forge-std/console.sol";

contract AuthTest is Test {
    Wallet public wallet;

    function setUp() public {
        // console.log("The caller", msg.sender);
        // console.log("This contract", address(this));
        vm.prank(address(1));
        wallet = new Wallet();
    }

    function testSetOwner() public {
        // console.log("owner", wallet.owner());
        vm.prank(address(1));
        wallet.setOwner(address(1));
        assertEq(wallet.owner(), address(1));
    }

    function testSetOwnerbyNonOwner() public {
        vm.prank(address(1));
        wallet.setOwner(address(1));
        vm.expectRevert("You are not allowed");
        wallet.setOwner(address(1));
    }

    function testFailSetOwnerMultiple() public {
        vm.startPrank(address(1));
        wallet.setOwner(address(1));
        wallet.setOwner(address(1));
        wallet.setOwner(address(1));
        wallet.setOwner(address(1));
        wallet.setOwner(address(1));
        vm.stopPrank();
        // msg.sender = address(this)
        wallet.setOwner(address(1));
    }
}
