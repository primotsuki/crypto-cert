var voting = artifacts.require("./voting.sol");

contract('init', function(accounts) {
  it("should assert true", function(done) {
    var init = voting.deployed();
    assert.isTrue(true);
    done();
  });
  it("should add an address", function(done) {
    var init = voting.deployed().then( function(instance) {
    instance.addVoter.call("0x5134c9845bd73a64552d2afab187154afafcd637")
      .then((voter) => {
        assert.isTrue(true);
        done();
      });
    });
  });
});
