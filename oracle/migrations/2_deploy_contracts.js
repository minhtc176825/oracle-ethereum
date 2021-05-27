const VotingOracle = artifacts.require("VotingOracle");

module.exports = function (deployer) {
  deployer.deploy(VotingOracle);
};
