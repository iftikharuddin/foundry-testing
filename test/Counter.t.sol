// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

import {Test, console2} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
    }

    // must prefix test before a test func
    function testIncrement() public {
        counter.inc();
        assertEq(counter.count(), 1);
    }

    // prefix testFail for test failure case
    function testFailDec() public {
        counter.dec();
    }

    // expect revert "stdError.arithmeticError"
    function testDecUnderFlow() public {
        vm.expectRevert();
        counter.dec();
    }

    function testDec() public {
        counter.inc();
        counter.inc();
        counter.dec();
        assertEq(counter.count(), 1);
    }
}
