var safeMath = artifacts.require("./safemath.sol");

module.exports = function(deployer) {
  deployer.deploy(safeMath);
};

