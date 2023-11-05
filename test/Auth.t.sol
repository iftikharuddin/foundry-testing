// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "forge-std/Test.sol";
import {Wallet} from "../src/Wallet.sol";

// forge test --match-path test/Auth.t.sol -vvvv

contract AuthTest is Test {
    Wallet public wallet;

    function setUp() public {
        wallet = new Wallet();
    }

    function testSetOwner() public {
        wallet.setOwner(address (1));
        assertEq(wallet.owner(), address (1));
    }

    function testFailNotOwner() public {
        vm.prank(address (1)); // this means for the next trx make owner address(1) and he should be calling the func
        wallet.setOwner(address (1));
    }

    function testFailSetOwnerAgain() public {
        // startPrank set the owner for multiple calls/trx
        vm.startPrank(address (1));
        // msg.sender = address (1)
        wallet.setOwner(address (1));

        // for stopping the behaviour
        vm.stopPrank();

    }

}