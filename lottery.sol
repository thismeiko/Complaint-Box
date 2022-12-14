//SPDX-License-Identifier:GPL-3.0
pragma solidity ^0.8.13;

contract lottery{
//连接账户
//设置密码
bytes32 public answer;
address public owner;

//+1
uint public num;
uint public lotteryButton;
constructor(){
    owner = msg.sender;
}

function setSecretAnswer(string memory _text) public{
    require(owner==msg.sender,"Must be owner of contract to change secret message");
    answer=keccak256(abi.encodePacked(_text));
}

function guessSecretAnswer(string memory _guess) public view returns(bool){
    return keccak256(abi.encodePacked(_guess))==answer;
}

function testHash(string memory _test) public pure returns(bytes32){
    return keccak256(abi.encodePacked(_test));
}

function gainRight() public{
    num=1;
}

function getNum() public view returns(uint){
    return num;
}

function loseRight() public{
    num=0;
}

function setLottery(uint number) public{
require(owner==msg.sender,"Must be owner of conract to set the number");
 lotteryButton = uint(keccak256(abi.encodePacked(block.timestamp,block.difficulty,  
        msg.sender))) % number;
}

function Lottery() public view returns(uint){
        return lotteryButton;
    }
}




