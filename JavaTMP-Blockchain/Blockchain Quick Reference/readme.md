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


## Ethereum Accounts and Ether Token

## Decentralized Applications

## Mining

## ICO 101

## Creating Your Own Currency

## Scalability and Other Challenges

## Future of Blockchain

## References

[Blockchain Quick Reference](https://subscription.packtpub.com/book/data/9781788995788/)
[Github source code](https://github.com/PacktPublishing/Blockchain-Quick-Reference)
