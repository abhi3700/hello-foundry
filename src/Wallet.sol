// SPDX-License-Identifier: MIT

pragma solidity 0.8.17;

contract Wallet {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {}

    function withdraw(uint256 amount) public payable {
        require(msg.sender == owner, "You are not allowed");
        require(address(this).balance >= amount, "Not enough funds");
        payable(msg.sender).transfer(amount);
    }

    function setOwner(address newOwner) public {
        require(msg.sender == owner, "You are not allowed");
        owner = newOwner;
    }
}
