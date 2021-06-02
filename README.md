# ORACLE ETHEREUM

### What is an Oracle?

According to "ethereum.org", they define: "An oracle is a bridge between the blockchain and the real world. They act as on-chain APIs you can query to get information into your smart contracts. This could be anything from price information to weather reports. Oracles can also bi-directional, used to 'send' data out to the real world".

Smart contracts are deployed to the Ethereum blockchain network to allow users to engage with them by submitting transactions that perform a function described in the smart contracts. Because smart contracts are public, they may be viewed of as open APIs that may be used by other smart contracts. 
The Ethereum blockchain network is a cluster of nodes executing smart contracts. To provide a consistent result, all nodes in the network must have access to the same set of inputs, which is known as the "determinism" property. This property will be used by the Ethereum to validate the smart contract's output - all the validators must produce the same result while the code is executing. 
To maintain this property, Ethereum must limit access to off-chain information from smart contracts. The reason for this is because if smart contracts are permitted to get data from external sources, even a little difference in time might result in a distinct set of inputs, then resulting in distinct smart contract outputs. Oracle Ethereum appears to be a viable answer to this issue. Oracle is a smart contract that gathers off-chain data and pushed it into the blockchain so that other smart contracts can use it.

### 2. How to allow a smart contract to retrieve off-chain data automatically?

The Oracle will be made up of two parts: a smart contract on the blockchain (the on-chain oracle) and an off-chain service.

The on-chain oracle provides public functions to emit events that cause the oracle service to be triggered outside of the blockchain. 

The off-chain oracle is made up of a number of services that will query the API and deliver the results to the contract. 

When smart contracts access the on-chain oracle and call one of the oracle's functions, the oracle emits an event that causes the off-chain oracle to initiate a service. It will then use the API to obtain the valid data that the blockchain requires. The data is then updated in the on-chain oracle by running a function of the oracle smart contract, and the data is returned to smart contracts that have access to the oracle. 

A smart contract can use this protocol to obtain off-chain data automatically. 

### Reference

"ethereum.org" 






