// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./Ownable.sol";

contract VotingOracle is Ownable {
    
    Candidate[] candidates;
    mapping (bytes32 => uint) candidateIdToIndex;

    struct Candidate {
        bytes32 id;
        string name;
        string personalId;
        uint8 voteCount;
    }

    function _getCandidateIndex(bytes32 _candidateId) private view returns (uint) {
        return candidateIdToIndex[_candidateId]-1;
    }

    function candidateExists(bytes32 _candidateId) public view returns (bool) {
        if (candidates.length == 0)
            return false;
        
        uint index = candidateIdToIndex[_candidateId];
        return (index > 0);
    }

    function addCandidate(string memory _name, string memory _personalId) onlyOwner public returns (bytes32) {

        // hash the crucial info to get a unique id
        bytes32 id = keccak256(abi.encodePacked(_name, _personalId));

        require(!candidateExists(id));

        // add new candidate
        candidates.push(Candidate(id, _name, _personalId, 0));
        uint newIndex = candidates.length - 1;
        candidateIdToIndex[id] = newIndex + 1;

        return id;
    }

    function getAllCandidates() public view returns (bytes32[] memory) {
        bytes32[] memory output = new bytes32[](candidates.length);

        // get all ids
        if (candidates.length > 0) {
            uint index = 0;

            for (uint n = candidates.length; n > 0; n--) {
                output[index++] = candidates[n-1].id;
            }
        }

        return output;
    }

    function getCandidate(bytes32 _candidateId) public view returns (
        bytes32 id,
        string memory name,
        string memory personalId,
        uint8 voteCount
    ) {
        // get the candidate
        if (candidateExists(_candidateId)) {
            Candidate storage candidate = candidates[_getCandidateIndex(_candidateId)];
            return (candidate.id, candidate.name, candidate.personalId, candidate.voteCount);
        } else {
            return (_candidateId, "", "", 0);
        }
    }

    function update(bytes32 _candidateId) public returns (uint8) {
        candidates[_getCandidateIndex(_candidateId)].voteCount++;
        return candidates[_getCandidateIndex(_candidateId)].voteCount;
    }

    function testConnection() public pure returns (bool) {
        return true;
    }

    function getAddress() public view returns (address) {
        return address(this);
    }

    function addTestData() external onlyOwner {
        addCandidate("Candidate 1", "001");
        addCandidate("Candidate 2", "002");
        addCandidate("Candidate 3", "003");
        addCandidate("Candidate 4", "004");
        addCandidate("Candidate 5", "005");
        addCandidate("Candidate 6", "006");
        addCandidate("Candidate 7", "007");
        addCandidate("Candidate 8", "008");
        addCandidate("Candidate 9", "009");
    }


}