// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract SecretVault{
    string secret;
    
    constructor(string memory _secret){
        secret = _secret;
    }
    
    function getSecret() public view returns (string memory){
        return secret;
    }
}


contract Secret {
    address secretVault;
    
    constructor(string memory _secret){
        SecretVault _secretVault = new SecretVault(_secret); //creating instance of a contract
        secretVault = address(_secretVault);
    }
    
    function getSecret() public view returns (string memory){
        SecretVault _secretVault = SecretVault(secretVault); //getting instance of a contract with its address
        return _secretVault.getSecret();
    }
}