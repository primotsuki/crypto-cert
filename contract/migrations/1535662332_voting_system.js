var votingSystem = artifacts.require("./votingSystem.sol");

module.exports = function(deployer) {
  deployer.deploy(votingSystem);
};