//SPDX-License-Identifier: MIT

pragma solidity ^0.8.15;

contract functionExample{
    mapping(address => uint) public balanceReceived;

    address payable public owner;

    constructor(){
        owner = payable(msg.sender);
    }
    
    function getOwner() public view returns(address){
        return owner;
    }

    function convertWeiToEther(uint _amountInWei) public pure returns(uint){
        return _amountInWei / 1 ether;
    }

    function distroySmartContract() public{
        require(msg.sender == owner, "You are not the owner!");
        selfdestruct(owner);
    }

    function receiveMoney() public payable{
        assert(balanceReceived[msg.sender] + msg.value >= balanceReceived[msg.sender]);
        balanceReceived[msg.sender] += msg.value;
    }

     function withdrawMoney(address payable _to, uint64 _amount) public {
        require(_amount <= balanceReceived[msg.sender], "not enougn funds");
        assert(balanceReceived[msg.sender] >= balanceReceived[msg.sender] - _amount);
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }

    receive () external payable{
        receiveMoney();
    }
}