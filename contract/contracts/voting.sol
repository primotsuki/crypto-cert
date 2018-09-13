// solium-disable linebreak-style
pragma solidity ^0.4.23;

import "./ownable.sol";

contract voting is Ownable {

    struct Candidate{
        address addr;
        string name;
        uint32 votes;
    }
    mapping (address => bool) voters;
    uint8 limitCandidates = 0;
    Candidate[] public Candidates;
    mapping (address => uint8) candidateToId;
    uint initialVotingDate;
    uint limitVotingDate;

    event NewCandidate(address, string, uint);
    event NewVoter(address, string);

    function defineLimit(uint8 limit) external onlyOwner {
        limitCandidates = limit;
    }
    function votingDate(uint _initialDate,uint _finalDate) external onlyOwner {
        initialVotingDate = _initialDate;
        limitVotingDate = _finalDate;
    }

    function addCandidate (address _addr, string _name) external onlyOwner beforeDate {
        require (_addr != address(0),"invalid address");
        require (Candidates.length <= limitCandidates, "limit exceeded");
        uint8 id = uint8(Candidates.push(Candidate(_addr,_name, 0)));
        candidateToId[_addr] = id;
        emit NewCandidate(_addr,_name, id);
    }

    function addVoter (address _addr) external onlyOwner beforeDate returns(bool) {
        require (_addr != address(0),"invalid address");
        voters[_addr] = false;
        emit NewVoter(_addr, "already available for voting");
        return voters[_addr];
    }
    modifier stillInDate() {
        require(now >= initialVotingDate && limitVotingDate <= now, "vote finished");
        _;
    }

    modifier beforeDate() {
        require(now <= initialVotingDate, "vote in progress, cannot add more candidates");
        _;
    }
}
