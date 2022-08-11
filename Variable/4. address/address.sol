// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

contract WorkingWithVariables {
    address myAddress;

    function setAddress(address _myAddress) public{
        myAddress = _myAddress;
    }

    function getBalanceOfAddress() public view returns(uint) {
        return myAddress.balance;
    }
}