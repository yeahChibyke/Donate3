// SPDX-License-Identifier: MIT
pragma solidity >= 0.6.0 < 0.9.0;

import {Test, console} from "forge-std/Test.sol";
import {Donate3} from "../src/Donate3.sol";

contract Donate3Test is Test {
    Donate3 donate3;
    function setUp() external {
        donate3 = new Donate3();
    }

    function testMIN_DONATIONIsHundred() public {
        console.log(donate3.MIN_DONATION());
        assertEq(donate3.MIN_DONATION(), 100e18);
    }
}
