pragma solidity ^0.4.0;
pragma experimental ABIEncoderV2;

contract MultiSigWallet {
    uint minApprovers;

    address beneficiary;
    address owner;

    mapping (address => bool) approvedBy;
    mapping (address => bool) isApprover;
    uint approvalsNum;

    constructor(address[] _approvers, uint _minApprovers, address _beneficiary) public payable {
        require(_minApprovers <= _approvers.length,
                "Required number of apporvers should be less than number of approvers");

        minApprovers = _minApprovers;
        beneficiary = _beneficiary;
        owner = msg.sender;

        for (uint i = 0; i < _approvers.length; i++) {
            address approver = _approvers[i];
            isApprover[approver] = true;
        }
    }

}