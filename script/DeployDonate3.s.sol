// SPDX-License-Identifier: MIT
pragma solidity >= 0.6.0 < 0.9.0;

import {Script} from "forge-std/Script.sol";
import {Donate3} from "../src/Donate3.sol";

contract DeployDonate3 is Script {
  function run() external returns(Donate3) {
    vm.startBroadcast();
    Donate3 donate3 = new Donate3();
    vm.stopBroadcast();
    return donate3;
  }
}