// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
    }

    function testGet() public {
        counter.get();
        assertEq(counter.get(), 0);
    }

    function testInc() public {
        counter.inc();
        assertEq(counter.get(), 1);
    }

    function testFailDec() public {
        counter.dec();
    }

    function testDecUnderflow() public {
        vm.expectRevert(stdError.arithmeticError);
        counter.dec();
    }

    function testDec() public {
        counter.inc();
        counter.dec();
        assertEq(counter.get(), 0);
    }
}
