// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {ERC20} from "solmate/tokens/ERC20.sol";

contract Token is ERC20("Name", "N", 18) {}
