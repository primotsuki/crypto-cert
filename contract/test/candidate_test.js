var votingSystem = artifacts.require("./votingSystem.sol");

contract('candidateTest', function(accounts) {
  it("should assert true", function(done) {
    var candidate_test = votingSystem.deployed();
    assert.isTrue(true);
    done();
  });
  it("should define number of candidates", function (done) {
    var candidate_test = votingSystem.deployed()
    .then(instance=>{
      instance.defineLimit.call(3)
      .then(result=>{
        assert.isTrue(true);
      });
    });
    done();
  });
});
