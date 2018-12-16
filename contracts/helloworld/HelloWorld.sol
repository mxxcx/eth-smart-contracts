pragma solidity ^0.4.0;
pragma experimental ABIEncoderV2;

contract HelloWorld {
    string message;

    function setMessage(string newMessage) public {
        message = newMessage;
    }

    function getMessage() public view returns (string) {
        return message;
    }
}
