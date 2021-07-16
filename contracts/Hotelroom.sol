// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract HotelRoom {
    
    enum Statuses {Vacant, Occupied}
    Statuses currentStatus;
    address payable public owner;
    
    event Occupy(address occupant, uint value);
    
    constructor() {
        owner = payable(msg.sender);
        currentStatus = Statuses.Vacant;
    }
    
    modifier notOwner { 
        require(owner != msg.sender, "You are the owner");
        _;
    }
    
    modifier checkStatus(uint amount) {
        require(currentStatus == Statuses.Vacant, "Currently Occupied");
        require(msg.value >= amount, "Not enough ether provided");
        _;
    }
    
    receive() external payable notOwner checkStatus(2 ether) {
        currentStatus = Statuses.Occupied;
        owner.transfer(msg.value); //blockchain recieves payment from user
        emit Occupy(msg.sender, msg.value);
    }
    
    
}