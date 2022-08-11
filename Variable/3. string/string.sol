// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

contract WorkingWithVariables {
    string public myString = "hello world!";

    function setMyString(string memory _myString) public{
        myString = _myString;
    }
}