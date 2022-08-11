// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

contract StartStopUpdateExample{
    address public owner;

    bool public paused;

    constructor() {
        owner = msg.sender;
    }

    function sendMoney() public payable{

    }

    function setPaused(bool _paused) public{
        require(owner == msg.sender, "You cannot withdraw.");
        paused = _paused;
    }

    function withdrawAllMoney(address payable _to) public{
        require(owner == msg.sender, "You cannot withdraw.");
        require(!paused, "Contract is paused!");
        _to.transfer(address(this).balance);
    }

    function destroySmartContarct(address payable _to) public{
        require(owner == msg.sender, "You cannot withdraw.");
        selfdestruct(_to);
    }
}