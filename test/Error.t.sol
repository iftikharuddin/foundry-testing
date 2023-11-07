// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "forge-std/Test.sol";
import {Error} from "../src/Error.sol";

contract ErrorTest is Test {
    Error public err;

    function setUp() public {
        err = new Error();
    }

    // expected to throw an error
    function testFail() public {
        err.throwError();
    }

    // vm.expectRevert
    function testRevert() public {
        vm.expectRevert();
        err.throwError();
    }

    // vm.expectRevert with param
    function testRequireMessage() public {
        vm.expectRevert(bytes("not authorized"));
        err.throwError();
    }

    // vm.expectRevert with custom error param
    function testCustomError() public {
        vm.expectRevert(Error.NotAuthorized.selector);
        err.throwCustomError();
    }

    function testErrorLabel() public {
        assertEq(uint256(1), uint256(1), "Label 1");
        assertEq(uint256(1), uint256(1), "Label 2");
        assertEq(uint256(1), uint256(1), "Label 3");
        assertEq(uint256(1), uint256(1), "Label 4");
    }
}
