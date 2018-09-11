pragma solidity ^0.4.23;
import "./voting.sol";
import "./safemath.sol";

contract votingSystem is voting {

  using SafeMath for uint32;

  constructor() public {
  }
  function vote(address candidate) external {
    require(!voters[msg.sender],"usted ya voto");
    uint8 candidateId = getCandidateId(candidate);
    Candidate storage myvote = Candidates[candidateId];
    myvote.votes = myvote.votes.add(1);
    voters[msg.sender] = true;
  }
  function actualCandidateState(address _candidate) view public returns(uint, string, address){
    uint8 candidateId = getCandidateId(_candidate);
    Candidate memory candidate = Candidates[candidateId];
    return (candidate.votes, candidate.name, candidate.addr) ;
  }
  function getCandidateId(address _candidate) view internal returns(uint8){
    require(_candidate != address(0));
    require(candidateToId[_candidate] >= 0);
    return uint8(candidateToId[_candidate]);
  }
}
