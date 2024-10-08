# Automatic-Lottery-System-Easy

After an extensive exploration of blockchain technology, Gavin has now returned from Estonia. In this country, which has adopted blockchain on a significant scale, Gavin came across a lottery system that operates using smart contracts, eliminating the need for manual management. Inspired by this, he has decided to introduce a similar system in his own country.

Implement a smart contract for self managing lottery system as described below having the below public functions.

The lottery system planned by Gavin is as follows:

1. Anyone can enter the lottery pool by paying 0.1 ethers.
2. For every lottery, the pool requires 5 people to fill completely.
3. As soon as the 5th player enters the lottery pool, the smartcontract should randomly select 1 winner, and all the amount in pool should get transferred to the winner.
4. Hence, the pool will be empty after this, and the smartcontract should now start a new round of lottery for the next 5 players.


The smart contract must be accessible through the following public functions:

 

Input:
enter(): This function should be a payable function which should accept exactly 0.1ethers. For any other amount of eth, the transaction must revert. Players can enter the lottery pool using this function. After 5 players enter the pool, a player should be randomly picked as a winner and all the ethers in the pool must get transferred to the winner. After this, the pool gets emptied and the current lottery gets completed. The smartcontract should now be set to start a new round of lottery for next 5 players. If a player has already entered the active lottery pool, then the player cannot re enter the current active lottery.

 

Output:
viewParticipants() view returns (address[], uint numberOfParticipants): This function must have stateMutatbility as view. It must return :

a. an array of addresses of players who have put their eth in the current pool of the active lottery. The addresses in the array must be in the order of the participation of the players.
b. and, the number of players who have participated in the current active lottery. The function should return 0 if no player has participated yet.
 

viewPreviousWinner() view returns (address): This function should return the winner of previous lottery. If no lottery has been completed till now, then the function must revert.
