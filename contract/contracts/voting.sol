pragma solidity ^0.4.22;

import "./ownable.sol";

contract voting is Ownable {

  struct candidate{
    address addr;
    string name;
    uint32 votes;
  }
  mapping (address => bool) voters;
  uint8 limitCandidates = 0;
 candidate[] public Candidates;

  event NewCandidate(address, string, uint);
  event NewVoter(address, string);

  function addCandidate (address _addr, string _name) external onlyOwner {
    require (_addr != address(0));
    uint id = Candidates.push(candidate(_addr,_name, 0));
    emit NewCandidate(_addr,_name, id);
  }

  function addVoter (address _addr) external onlyOwner{
    require (_addr != address(0));
    voters[_addr]=false;
    emit NewVoter(_addr, "already available for voting");
  }
}
