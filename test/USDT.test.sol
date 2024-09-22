// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

import {HelperConfig} from "../script/HelperConfig.s.sol";

contract USDTMockTest is Test {
    address usdt_address;
    address test_address; // Test value to learn multiple return values

    function setUp() public {
        HelperConfig helperConfig = new HelperConfig();
        (usdt_address, test_address) = helperConfig.activeNetworkConfig();
    }

    function testUSDTDeploy() public view {
        console.log(usdt_address, test_address);
    }
}
