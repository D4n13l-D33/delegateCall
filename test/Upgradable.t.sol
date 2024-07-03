// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {LogicContract, Proxy} from "../src/Upgradable.sol";

contract CounterTest is Test {
    LogicContract public logic;
    Proxy public proxy;

    function setUp() public {
        logic = new LogicContract();
        proxy = new Proxy(address(logic));
    }

    function test_Increment() public {
        LogicContract(address(proxy)).add(3,5);
        // assertEq(proxy.totalSum(), 8);
    }

}
