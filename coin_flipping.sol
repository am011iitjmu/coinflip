// Kindly give input as 1 or 0 for placing bet, 1 represents Head, 0 represents tails.
// Submission for dyeus web3 coin flipping challenge using solidity and Harmony VRF function 

pragma solidity ^0.8.7;

contract CoinFlip {

    mapping(address => uint) public balance; // kept public so that we can check balance
    mapping(address => uint) betAmount;
    mapping(address => bool) ongoingBets;
    mapping(address => bool) completedBets;
    mapping(address => uint) bets;
    mapping(address => bool) newAcc;

    event Lost(address add_loser); // event if user lost
    event Win(address add_winner, uint winnerBetAmount); // event if user wins

    modifier checkOpenBet(){ // to check if there is any open bet from current address
        require (ongoingBets[msg.sender] != true, "Open bet from this address.");
        _;
    }
    function vrf() public view returns (bytes32 result) { // vrf function provided by harmony
        uint[1] memory bn;
        bn[0] = block.number;
        assembly {
        let memPtr := mload(0x40)
            if iszero(staticcall(not(0), 0xff, bn, 0x20, memPtr, 0x20)) {
                invalid()
            }
            result := mload(memPtr)
        }
    }
// function to check if the current user wins or not
    function rewardBets() public { //
        uint winner = uint(vrf())%2; // using vrf function to generate random value 1 or 0.
        if(winner == bets[msg.sender]){
            balance[msg.sender]+=(2*betAmount[msg.sender]); // increasing the balance by twice the bet amount if the user wins.
        }
        completedBets[msg.sender]=true; // 
        ongoingBets[msg.sender]=false;
        if(winner == bets[msg.sender]){
            emit Win(msg.sender, betAmount[msg.sender]); // event in case the user wins
        }
        else{
            emit Lost(msg.sender); // event in case the user loses.
        }
    }
// BET INPUT SHOULD BE 1 OR 0 ONLY!
    function placeBet(uint amount, uint bet) checkOpenBet public { // function that allows user to place bet, bet input should be 1 or 0.
        if(newAcc[msg.sender]==false){
            newAcc[msg.sender]=true;
            balance[msg.sender]=100;
        }
        require(amount<=balance[msg.sender], "Bet amount more than balance."); // checking if bet amount is less than balance
        bets[msg.sender]=bet;
        betAmount[msg.sender]=amount; 
        balance[msg.sender]-=amount; // subtracting betting amount from the user balance.
    }
}