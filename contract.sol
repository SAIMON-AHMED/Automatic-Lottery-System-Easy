// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract LotteryPool {
    address[] participants;
    uint numberOfParticipants;
    address winner;
    mapping(address => bool) isParticipated;

    // For participants to enter the pool
    function enter() public payable {
        require(msg.value == 0.1 ether, "Invalid ether amount");
        require(!isParticipant(msg.sender), "You are already in the game");

        participants.push(msg.sender);
        numberOfParticipants++;

        if (numberOfParticipants == 5) {
            winner = participants[getRandomNumber(5)];

            // Reset state before transferring to avoid reentrancy attacks
            address winnerToPay = winner;
            numberOfParticipants = 0;
            delete participants;

            (bool sent, ) = payable(winnerToPay).call{value: 0.5 ether}("");
            require(sent, "Payment failed");
        }
    }

    // To view participants in current pool
    function viewParticipants() public view returns (address[] memory, uint) {
        return (participants, numberOfParticipants);
    }

    // To view the winner of the last lottery
    function viewPreviousWinner() public view returns (address) {
        return winner;
    }

    function getRandomNumber(uint max) public view returns (uint) {
        // Use block variables to generate a pseudo-random number
        uint random = uint(keccak256(abi.encodePacked(block.timestamp, block.prevrandao, msg.sender))) % max;
        return random;
    }

    function isParticipant(address player) internal view returns (bool) {
        for (uint256 i = 0; i < participants.length; i++) {
            if (participants[i] == player) {
                return true;
            }
        }
        return false;
    }
}
