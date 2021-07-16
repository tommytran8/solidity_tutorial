// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Ownable {
    address public owner;
    
    constructor (){
        owner = msg.sender;
    }
    
}


contract MyContract is Ownable { //inheritance allows you to obtain all attributes of another contract

    uint[][] public array2D = [ [1, 2, 3], [4, 5, 6] ];
    mapping(address => Person ) public userData;
    // mapping(address => mapping(uint => Person)) public logs;
    address public myAddress = 0x978C9c30554924AcF83722ffCa7e6a8DfE3E9a30;
    
    constructor (){
        super;
    }

    struct Person {
        string name;
        uint256 balance;
    }
    
    function setData(address someAddress, string memory name, uint256 balance) public{
        userData[someAddress] = Person(name, balance);
    }
    function setData(string memory name, uint256 balance) public {
        userData[msg.sender] = Person(name, balance);
    }
    
}