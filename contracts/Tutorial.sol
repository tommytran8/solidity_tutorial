// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Tutorial {
    //contract will generate a getter method on its own when you set state variable to public 
    int public count = -1; 
    
    function getHalf() public view returns (int) {
        return count / 2;
    }
    
    function increment() public {
        count++;
    }
}
