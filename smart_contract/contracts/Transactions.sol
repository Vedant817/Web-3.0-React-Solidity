// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract Transactions{ //? Same as class in other languages
    uint256 transctionCount;

    event Transfer(address from, address receiver, uint amount, string message, uint256 timestamp, string keyword);

    struct TransferStruct{
        address sender; //? Defining type and name of the property.
        address receiver;
        uint amount;
        string message;
        uint256 timestamp;
        string keyword;
    }

    TransferStruct[] transctions; //* An array of TransferStruct

    function addToBlockchain(address payable receiver, uint amount, string memory message, string memory keyword) public{
        transctionCount+=1;
        transctions.push(TransferStruct(msg.sender, receiver, amount, message, block.timestamp, keyword));

        emit Transfer(msg.sender, receiver, amount, message, block.timestamp, keyword);
    }

    function getAllTransactions() public view returns (TransferStruct[] memory){
        return transctions;
    }

    function getTransactionCount() public view returns (uint256){
        return transctionCount;
    }
}