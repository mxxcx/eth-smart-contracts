pragma solidity ^0.4.0;
pragma experimental ABIEncoderV2;

contract Voter {

    uint[] public votes;
    mapping (address => bool) hasVoted;
    string[] public options;

    constructor(string[] _options) public {
        options = _options;
        votes.length = options.length;
    }

    function vote(uint option) public {
        require(0 <= option && option < options.length, "Invalid option");
        require(!hasVoted[msg.sender], "Account has already voted");

        hasVoted[msg.sender] = true;
        votes[option] = votes[option] + 1;
    }

    function getOptions() public view returns (string[]) {
        return options;
    }

    function getVotes() public view returns (uint[]) {
        return votes;
    }
}