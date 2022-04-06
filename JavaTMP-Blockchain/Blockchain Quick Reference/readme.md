# Blockchain Quick Reference

## Blockchain 101

## Components and Structure of Blockchain

## Decentralization Versus Distributed Systems

## Cryptography and Mechanics Behind Blockchain

## Bitcoin

## Altcoins

## Achieving Consensus

## Advanced Blockchain Concepts

## Cryptocurrency Wallets

## Alternate Blockchains

## Hyperledger and Enterprise Blockchains

## Ethereum 101

## Solidity 101

## Smart Contracts

## Ethereum Development

Here is a list of tools required for the development process:

- Code Editor or IDE: the official online IDE remix can also be used.
- Ethereum Wallet:This is required for the deploying and testing of a smart contract on the TestnNet.
- Solc compiler: This is for the compiling of a smart contract that is converting Solidity language code into bytecode
  for EVM to read.
- Truffle framework: This makes it easier to test and deploy the smart contracts.
- Web3: This is a JavaScript library and is used to communicate with the Ethereum node.

### Preparing for smart contract development

#### Remix

Remix is a fully functional online IDE, with the required features such as the compiling of code, running, connecting
with localhost, publishing code on GitHub, and so on.
[http://remix.ethereum.org](http://remix.ethereum.org)
[https://remix-project.org/](https://remix-project.org/)
[https://ethereum.github.io/browser-solidity/](https://ethereum.github.io/browser-solidity/)

#### Geth and Mist

We can run test nodes using `Geth`, although the task of connecting and mining of Ether in `TestNet` or `private net`
can also be done using the official Ethereum client, which is a Mist browser working on top of a Geth node.

The `Mist` client has various features such as being able to create Ethereum accounts and connecting with `MainNet` or
`TestNet`. We can deploy or watch an already-deployed contract on blockchain using Mist.

#### MetaMask

MetaMask is an Ethereum Wallet and an Ethereum browser. MetaMask enables us to interact with DApps and smart contracts
via our web browser without downloading the complete Ethereum blockchain. It is available as a browser extension for
Chrome, Firefox, and other browsers.

It lets websites fetch data from blockchain and also allows users to send transactions from the extension itself. With
MetaMask, it becomes easier to interact with Ethereum DApp within the browser.

#### Token standard

With Ethereum, decentralized applications can be created, and we can also issue tokens on the Ethereum blockchain.

The token standard is known as `ERC20`. ERC stands for Ethereum Request for Comments.

There are various other standards such as `ERC223` and `ERC721` that are also being used in addition to ERC20.

#### Methods in ERC20

Here are the methods specified in the ERC20 contract type; it is important to follow the given methods/events so that
the contract can be in the family of ERC20:

- `name`,
- `symbol`,
- `decimals`,
- `totalSupply`,
- `balanceOf(address _owner), transfer(address _to, unit256 _value)`
- `transferFrom(address _from, address _to, uint256 _value)`
- `approve(address _spender, uint256 _value)`
- `allowance(address _owner, address _spender)`
- `event Transfer(address indexed _from, address indexed _to, uint256 _value)`
- `event Approval(address indexed _owner, address indexed _spender, uint256 _value)`

#### Web3

`Web3.js` is a JavaScript Library; it can communicate with the Ethereum node through JSON RPC calls, by connecting to
the HTTP or IPC connection. `Web3.js` works by exposing methods that have been enabled over the RPC.

`Web3` can be installed via `npm` using the following command:
`npm install web3`

#### Truffle framework

Truffle is a development framework that makes it simple to test and deploy Ethereum smart contracts. Truffle can be
installed via npm using the following command:
`npm install -g truffle`

Truffle helps in contract compilation and linking along with automated testing framework using `Mocha` and `Chai`. With
Truffle, we can easily deploy contracts to any `estNet`, `MainNet`, or private Network ID. Truffle does everything in a
DApp, such as the compiling of contracts, injecting them into the user interface and testing to check for
vulnerabilities.

#### Ganache

`Ganache` is a tool introduced by the Truffle Foundation to run tests on the Ethereum blockchain created. It has a
command-line interface, but a graphical interface is also available when required.

### Working on a smart contract

Creating a smart contract, along with the process of testing the smart contract on `TestNet`:

- When you open Remix in the browser, by default, it opens the ballot.sol file; you can create a new file and start
  editing your first smart contract.
- Now let's create a constructor that will initialize the variables we have defined.
- Now, let's add the standard ERC20 methods to a separate contract; these are required to be present in an Ethereum
  smart contract.
- Our contract has to have address of the owner; this will help with transferring the coins when the contract is
  deployed.
- The minimum required functions for a Solidity file to be a valid ERC20 standard token.
- you can run it by pressing the Start to compile button on the right-hand-side panel in Remix.

## Ethereum Accounts and Ether Token

### Introducing Ethereum accounts

The state in Ethereum is made up of objects, each known as an account. Each account in Ethereum contains a 20-byte
address. Each state transition is a direct transaction of value and information between various accounts. Each operation
performed between or on the accounts is known as a state transition. The state transition in Ethereum is done using the
Ethereum state transition function. The state change in Ethereum blockchain starts from the genesis block of the
blockchain.

Each block contains a series of transactions, and each block is chained to its previous block. To transition from one
state to the next, the transaction has to be valid. The transaction is further validated using consensus techniques.

There are two types of accounts in Ethereum blockchain. Namely, Contract Accounts (CA) and Externally Owned Accounts
(EOAs). The contract accounts are the ones that have code associated with them along with a private key. EOA has an
ether balance; it is able to send transactions and has no associated code, whereas CA has an ether balance and
associated code. The contract account and the externally owned accounts have features of their own, and a new token can
only be initiated by the contract account.

#### Ethereum state transition function

In the state transition function, the following is the process that every transaction in Ethereum adheres to:

- Confirming of the transaction's validity and structure,
- The transaction fee calculation is done using the price of gas
- Certain gas is taken to cover the cost of the transaction.
- In this step, the actual transfer of value occurs.
- If the transaction failed due to insufficient balance or gas, all the state changes are reverted, apart from the
  payment of fees, which is transferred to the miners.
- If there is reminder fee available, then it is sent back to the sender, as change after paying the miners as required.
  Function returns the resulting state at this point.

The function is implemented independently in each of the Ethereum clients.

#### Genesis block

This is the first block of the Ethereum blockchain, just like the genesis block of the Bitcoin blockchain. The height of
the genesis block is 0.

#### Transaction receipts

Receipts are used to store the state, after a transaction has been executed.

#### Elements

Elements is composed of four primary elements:

- Post-transaction state
- Gas used
- Set of logs
- The bloom filter

#### Structure

Look at the structure of a transaction receipt looks like.

#### Transaction sub state

Suicide set, Log series, Refund balance

#### Messages

Messages are transactions where data is passed between two accounts. It is a data packet passed between two accounts. A
message can be sent via the Contract Account (CA). They can also be an Externally Owned Account (EOA) in the form of a
transaction that has been digitally signed by the sender.

Messages are never stored and are similar to transactions.

### Ethereum block validation

After being mined by the miners, an Ethereum block goes through several checks before it is considered valid.

### Disadvantages of Ethereum-based tokens

## Decentralized Applications

Decentralized Applications (DApps) are applications that run across a decentralized network and are not owned or
controlled by a centralized authority.

A decentralized application runs on what is typically a peer-to-peer network and is designed in such a way that no one
person or organization can control the functioning of the application. A decentralized application does not require a
blockchain. There were multiple decentralized applications before blockchain: BitTorrent, Tor, and Mastodon are all
decentralized applications that exist without the use of a blockchain.

## Mining

## ICO 101

## Creating Your Own Currency

## Scalability and Other Challenges

## Future of Blockchain

## References

[Blockchain Quick Reference](https://subscription.packtpub.com/book/data/9781788995788/)
[Github source code](https://github.com/PacktPublishing/Blockchain-Quick-Reference)
