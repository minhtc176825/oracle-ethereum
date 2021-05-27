// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./Ownable.sol";
import "./OracleInterface.sol";

contract Voting is Ownable {

    mapping (address => bool) voter;
    mapping (bytes32 => address[]) candidates;
    

    address internal votingOracleAddr;
    OracleInterface internal votingOracle = OracleInterface(votingOracleAddr);

    function setOracleAddress(address _oracleAddr) external onlyOwner returns (bool) {
        votingOracleAddr = _oracleAddr;
        votingOracle = OracleInterface(votingOracleAddr);
        return votingOracle.testConnection();
    }

    function getOracleAddress() external view returns (address) {
        return votingOracleAddr;
    }

    function getAllCandidates() public view returns (bytes32[] memory) {
        return votingOracle.getAllCandidates();
    }

    function getCandidate(bytes32 _candidateId) public view returns (
        bytes32 id,
        string memory name,
        string memory personalId,
        uint8 voteCount
    ) {
        return votingOracle.getCandidate(_candidateId);
    }

    function vote(bytes32 _candidateId) public payable {
        require(!voter[msg.sender], "You've voted");
        votingOracle.update(_candidateId);
        candidates[_candidateId].push(msg.sender);
        voter[msg.sender] = true;
    }

    function testOracleConnection() public view returns (bool) {
        return votingOracle.testConnection();
    }


}