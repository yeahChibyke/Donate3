// SPDX-License-Identifier: MIT
pragma solidity >= 0.6.0 < 0.9.0;

import {Test, console} from "forge-std/Test.sol";
import {Donate3} from "../src/Donate3.sol";
import {DeployDonate3} from "../script/DeployDonate3.s.sol";

contract Donate3Test is Test {
    Donate3 donate3;

    function setUp() external {
        // donate3 = new Donate3();
        DeployDonate3 deployDonate3 = new DeployDonate3();
        donate3 = deployDonate3.run();
    }

    function testMIN_DONATIONIsHundred() public {
        console.log(donate3.MIN_DONATION());
        assertEq(donate3.MIN_DONATION(), 100e18);
    }

    function testAdminIsMsgSender() public {
        console.log(donate3.i_admin());
        console.log(address(this));
        console.log(msg.sender);
        // assertEq(donate3.i_admin(), msg.sender);
        // This test will fail because Donate3Test is the contract that deployed the donate3 address
        // in the setUp(); function, hence it will be the owner
        // While in this particular function, msg.sender is whoever is calling the Donate3Test
        // i.e., Us ->(calls) Donate3Test ->(deploys) donate3
        // msg.sender = us
        // i_admin = Donate3Test
        assertEq(donate3.i_admin(), msg.sender);
    }

    function testPriceFeedVersionIsAccurate() public {
        uint256 version = donate3.getVersion();
        assertEq(version, 4);
    }

    function testBTCDecimalIsEight() public {
        uint256 decimal = donate3.getBTCDecimal();
        assertEq(decimal, 8);
    }
}
