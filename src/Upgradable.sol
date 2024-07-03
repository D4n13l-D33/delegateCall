// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.13;

contract LogicContract {
    uint256 public totalSum;
    address contractadr;

    function add (uint256 a, uint256 b) public returns(uint256) {
        return totalSum = a + b;
    }
}

contract Proxy {
    uint256 public totalSum;
    address contractadr;

    constructor(address contractAddrs){
        contractadr = contractAddrs;
    }

    function setNewContractAddress (address newAddress) external {
        contractadr = newAddress;
    }

    fallback () external {
      (bool success, bytes memory data) =  address(contractadr).delegatecall(msg.data);

    }
}