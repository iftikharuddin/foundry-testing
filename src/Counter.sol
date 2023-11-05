// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {console} from "forge-std/console.sol";

contract Counter {
    uint256 public count;

    // Function to get the current count
    function get() public view returns (uint256) {
        return count;
    }

    // Function to increment count by 1
    function inc() public {

        count += 1;
    }

    // Function to decrement count by 1
    function dec() public {
        // This function will fail if count = 0
        count -= 1;
    }

    // Function to increment count by 1
    function testConsole() public {
        console.log("Before increment", count);
        count += 1;
        console.log("After increment", count);
        int newVar = -1;
        console.logInt(newVar);

    }
}
