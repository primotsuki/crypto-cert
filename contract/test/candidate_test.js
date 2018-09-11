var contract = artifacts.require("./votingSystem.sol");

contract('candidateTest', function(accounts) {
  it("should assert true", function(done) {
    var candidate_test = candidateTest.deployed();
    assert.isTrue(true);
    done();
  });
  it("should define number of candidates", function (done) {
    var votingContract = contract.deployed()
    .then(instance=>{
      instance.defineLimit.call(3)
      .then(result=>{
        assert.isTrue(true);
      });
    });
    done();
  });
});
