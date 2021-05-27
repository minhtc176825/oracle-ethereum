# oracle-ethereum

This is an e-voting system which gets the data from the outside through "oracle".


# Installation
## npm install -g truffle

# ------------
# Steps to run the test

Open two terminal windows: 
* One in /oracle-ethereum/client 
* The other in /oracle-ethereum/oracle


# 1. Compile and run the oracle contract

## Open the terminal window of ./oracle

## truffle develop
It will open the Truffle development console: `truffle(develop) >`

## truffle(develop) > migrate 
This will migrate to the test network.

Now create an instance for oracle contract.
## truffle(develop) > VotingOracle.deployed().then(inst => {i => inst})


# 2. Compoile and run the client contract

## Open the terminal window of ./client

## truffle develop

## truffle(develop) > migrate

## truffle(develop) > Voting.deployed().then(inst => {i => inst})

# 3. Get the address of the oracle contract

In the terminal window of `./oracle`: 
## truffle(develop) > i.getAddress()

# 4. Set the oracle address in the client contract

Copy the address we have just got from above and paste into the following:

In the terminal window of `./client`
## truffle(develop) > i.setOracleAddress(<the above address, single quotes included>)
This allows us to access the data from off-chain through oracle.

## truffle(develop) > i.testOracleConnection()
Run this function to check if the connection is successfully

Now let's do some test.

In both terminal windows:

## truffle(develop) > i.getAllCandidates()

It must return an empty array because we didn't add any data from outsides.

In `./oracle` terminal:

## truffle(develop) > i.addTestData()

And check again in both terminal windows:
## truffle(develop) > i.getAllCandidates()

Now we must get the same result on both terminal windows - an array of candidate's id.

Some other functions we can test: 

## Get a candidate's information: 

## truffle(develop) > i.getCandidate(<_candidateId get from candidate lists>)

## Vote for a candidate: 

## truffle(develop) > i.vote(<_candidateId>)

After voting for a candidate, it will update the candidate's vote count on both the client and the oracle.