// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

interface OracleInterface {

    function getAllCandidates() external view returns (bytes32[] memory);

    function getCandidate(bytes32 _candidateId) external view returns (
        bytes32 id,
        string memory name,
        string memory personalId,
        uint8 voteCount
    );

    function update(bytes32 _candidateId) external returns (uint8);

    function testConnection() external pure returns (bool);
}