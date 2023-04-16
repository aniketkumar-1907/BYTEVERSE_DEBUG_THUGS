// SPDX-License-Identifier: MIT
pragma solidity ^0.4.26;
 
// contract Chain {
//     string public message;
    
//     constructor(string memory initialMessage) {
//         message = initialMessage;
//     }
    
//     function setMessage(string memory newMessage) public {
//         message = newMessage;
//     }
// }

contract ElectionFactory{

    struct ElectionDetails{
        address address_dep;
        string elec_n;
        string elec_d;
    }
    
    mapping(string=>ElectionDetails) mainEmail;

    

    function getDeployedElection(string memory email) public view returns (address,string memory,string memory) {
        address val =  mainEmail[email].address_dep;
        if(val==address(0x0)) 
            return (address(0x0),"","Create an election.");
        else
            return (mainEmail[email].address_dep, mainEmail[email].elec_n,mainEmail[email].elec_d);
    }

    function createElection(string memory email,string memory elect_name, string memory elect_desc) public{
        address newElection = address(new Chain());
        
        mainEmail[email].address_dep = newElection;
        mainEmail[email].elec_n = elect_name;
        mainEmail[email].elec_d = elect_desc;
    }
}


contract Chain{

    //election manager address
    address elect_manager;
    string elect_name;
    string elect_desc;
    bool status;

    //  constructor(address manager , string memory name, string memory description) public {
    //     elect_manager = manager;
    //     elect_name = name;
    //     elect_desc = description;
    //     status = true;
    // }

    modifier owner() {
        require(msg.sender == elect_manager, "Error: Access Denied.");
        _;
    }

    struct Candidate {
        string name_candidate;
        string desc_candidate;
        string img;
        uint numVote;
        string email;
    }

    struct Voter {
        uint voter_id;
        bool voted;
    }

    mapping(uint=>Candidate) public candidates;
    mapping(string=>Voter) voters;

    uint totalCandidates;uint numVoters;

    function joinCandidate(string memory candidate_name, string memory candidate_description, string memory imgHash,string memory email) public owner {
        uint id_Candidate=totalCandidates++;
        candidates[id_Candidate]=Candidate(candidate_name,candidate_description,imgHash,0,email);
    }

    

    function fetchNumOfCandidates() public view returns (uint){
        return totalCandidates;
    }

    function fetchNumOfVoters() public view returns (uint){
        return numVoters;
    }

    function canVote(uint candidate_id, string memory mail) public
    {
        require(!voters[mail].voted, "Double Voting Detected");
        voters[mail]= Voter (candidate_id,true);//new vote registered in vote
        numVoters++;
        candidates[candidate_id].numVote++;
    }

    function CandidateWinner() public view owner returns (uint) {
        uint greatestVotes = candidates[0].numVote;
        uint candidateID;
        for(uint i = 1;i<totalCandidates;i++) {
            if(greatestVotes < candidates[i].numVote) {
                greatestVotes = candidates[i].numVote;
                candidateID = i;
            }
        }
        return (candidateID);
    }
    
    function getCandidate(uint candidateID) public view returns (string memory, string memory, string memory, uint,string memory) {
        return (candidates[candidateID].name_candidate,
        candidates[candidateID].desc_candidate,
        candidates[candidateID].img,
        candidates[candidateID].numVote,
        candidates[candidateID].email);
    }

    

    function fetchElectionDetails() public view returns(string memory, string memory) {
        return (elect_name,elect_desc);    
    }
}