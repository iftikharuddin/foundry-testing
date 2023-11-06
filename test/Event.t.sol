// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "forge-std/Test.sol";
import {Event} from "../src/Event.sol";

// forge test --match-path test/Event.t.sol -vvvv

contract EventTest is Test {
    Event public e;

    event Transfer(address indexed from, address indexed to, uint256 amount);

    function setUp() public {
        e = new Event();
    }

}