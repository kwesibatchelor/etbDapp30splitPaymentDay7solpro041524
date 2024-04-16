//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


contract SplitPayment {
    address public owner;
    // access control- define an address that is authorized to send the payment 
    constructor(address _owner) public {
        owner = _owner;
    }
    // crate array of address to send to and amounts , needs payable, memory, and public
    function send(address payable[] memory to, uint[] memory amount)
        // payable to fund the smart contract at the same time we trigger the payment 
        payable
        public
        onlyOwner() 
        {
            require(to.length == amount.length, 'to and amount arrays must have same length');
            for(uint i = 0; i < to.length; i++) { // // loop through the two arrays and for each entry we send a transfer to the corresponding entry 
                // access the to array
                to[i].transfer(amount[i]); 
            } 
        }
    
    modifier onlyOwner() {
        require(msg.sender == owner, 'only the owner can send transfers');
        _;
    }
}
