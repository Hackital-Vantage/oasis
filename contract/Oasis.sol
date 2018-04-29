pragma solidity ^0.4.23;

import "./Ownable.sol";

contract Oasis is Ownable {
	address admin;
	//uint fund_balance;
	uint fee = 0.01 ether;
	struct Player {
	    //string name;
	    uint balance;
	    address playerAddress;
	    uint correctAnswer;
	}
    mapping(address => Player) playersMap;
	
	bytes32 question1 = "name of NYC river?";
	bytes32 question2 = "name of DC river?";
	bytes32 answer1 = "hudson";
	bytes32 answer2 = "potomac";
	
	enum GameState { Running, Stopped }
	GameState gameState;
	//Player[] public players; 
	
	function Oasis () public  {
		admin = 0x648A67564379AE8486dc6E29A5Aaf5fc4576Bc45;
		//fund_balance = msg.value;
	}
	
	function gameSet (bytes32 _question1, bytes32 _question2, bytes32 _answer1, bytes32 _answer2 ) external onlyOwner {
	     question1 = _question1;
	     question2 = _question2;
	     answer1 = _answer1;
	     answer2 = _answer2;
    }
  
	function getQuestion(uint _question) public payable returns (bytes32 question) {
		require (msg.value == fee);
		//players.push(Player(_name, msg.value, msg.sender, 0));
		if (_question == 1) {
		    return question1;
		}
		if (_question == 2) {
		    return question2;
		}
	}
	
	function checkAndTakeOwnership (bytes32 _answer) public returns (string) {
		//players.push(Player(_name, msg.value, msg.sender, 0));
		if (_answer == answer1) {
		   playersMap[msg.sender].correctAnswer += 1; 
		}
		if (_answer == answer2) {
		   playersMap[msg.sender].correctAnswer += 1; 
		}
        require(playersMap[msg.sender].correctAnswer == 2);
        address owner = msg.sender;
        address admin = msg.sender;
        return ("QmRFgaFQuHrENKxbgVjWY1g5oNMbQcGz9N6PvyhZePLEqG");
	}
	
}
