# Mastering Bitcoin

Bitcoin is not simply a digital currency, but a network of trust that could also provide
the basis for so much more than just currencies. It isn’t money, it’s a decentralized
trust network. it was the most exciting technology I had encountered since the internet.

This book will teach you how cryptographic currencies work, how to use them, and how to
develop software that works with them.

Nature demonstrates that decentralized systems can be resilient and can produce emergent
complexity and incredible sophistication without the need for a central authority,
hierarchy, or complex parts.

Bitcoin is a highly sophisticated decentralized trust network that can support myriad
financial processes. The bitcoin network is a resilient network of simple nodes following
simple rules that together can do amazing things without any central coordination.

In the rest of this book we will examine the specific technologies behind wallets,
addresses, signatures, transactions, the network, and finally mining.

## CHAPTER 1: Introduction

### What Is Bitcoin?

Bitcoin is a collection of concepts and technologies that form the basis of a digital
money ecosystem. The coins are implied in transactions that transfer value from sender to
recipient.

Users of bitcoin own keys that allow them to prove ownership of bitcoin in the bitcoin
network. With these keys they can sign transactions to unlock the value and spend it by
transferring it to a new owner.

Possession of the key that can sign a transaction is the only prerequisite to spending
bitcoin, putting the control entirely in the hands of each user.

bitcoin is also the name of the protocol, a peer-to-peer network, and a distributed
computing innovation.

### History of Bitcoin

The bitcoin network started in 2009, based on a reference implementation published by
Nakamoto with the publication of a paper
titled "[Bitcoin: A Peerto- Peer Electronic Cash System](https://bitcoin.org/bitcoin.pdf)
."

### Bitcoin Uses, Users, and Their Stories

Bitcoin is an innovation in the ancient technology of money. At its core, money simply
facilitates the exchange of value between people like retail, contract services, Web
store, and Charitable donations

### Getting Started

Bitcoin is a protocol that can be accessed using a client application that speaks the
protocol. A "bitcoin wallet" is the most common user interface to the bitcoin system.

#### Choosing a Bitcoin Wallet

Bitcoin wallets can be categorized as follows, according to the platform:

* A desktop wallet was the first type of bitcoin wallet created as a reference
  implementation and many users run desktop wallets for the features, autonomy, and
  control they offer.
* A mobile wallet is the most common type of bitcoin wallet. Running on smartphone
  operating systems such as Apple iOS and Android, these wallets are often a great choice
  for new users.
* Web wallets are accessed through a web browser and store the user’s wallet on a server
  owned by a third party.
* Hardware wallets are devices that operate a secure self-contained bitcoin wallet on
  special-purpose hardware.
* The keys controlling bitcoin can also be printed for long-term storage. These are known
  as paper wallets even though other materials (wood, metal, etc.) can be used.

Another way to categorize bitcoin wallets is by their degree of autonomy and how they
interact with the bitcoin network:

* Full-node client, a client that stores the entire history of bitcoin transactions (every
  transaction by every user, ever), manages users’ wallets, and can initiate transactions
  directly on the bitcoin network.
* Lightweight client, A lightweight client, also known as a simple-payment-verification (
  SPV) client, connects to bitcoin full nodes (mentioned previously) for access to the
  bitcoin transaction information, but stores the user wallet locally and independently
  creates, validates, and transmits transactions. Lightweight clients interact directly
  with the bitcoin network, without an intermediary.
* hird-party API client, A third-party API client is one that interacts with bitcoin
  through a third-party system of application programming interfaces (APIs), rather than
  by connecting to the bitcoin network directly. The wallet may be stored by the user or
  by thirdparty servers, but all transactions go through a third party.

A mobile wallet is best for new users like Mycelium and Exodus.

A wallet is simply a collection of addresses and the keys that unlock the funds within.
Bitcoin addresses start with a 1 or 3. They can be shared with other bitcoin users who can
use them to send bitcoin directly to your wallet.

Until the moment this address is referenced as the recipient of value in a transaction
posted on the bitcoin ledger, the bitcoin address is simply part of the vast number of
possible addresses that are valid in bitcoin. Only once it has been associated with a
transaction does it become part of the known addresses in the network.

#### Getting Your First Bitcoin

* Find a friend who has bitcoin and buy some from him or her directly
* Use a bitcoin ATM in your city, [https://coinatmradar.com/](https://coinatmradar.com/)
* Use a bitcoin currency exchange,
  [https://www.forbes. com/advisor/investing/cryptocurrency/best-crypto-exchanges/](https://www.forbes.com/advisor/investing/cryptocurrency/best-crypto-exchanges/)
  [https://www.investopedia.com/best-crypto-exchanges-5071855](https://www.investopedia.com/best-crypto-exchanges-5071855)

#### Finding the Current Price of Bitcoin

"Who sets the bitcoin price?" The short answer is that the price is set by markets.

#### Sending and Receiving Bitcoin

Source Bitcoin wallet constructs a transaction that assigns BTC to the destination address
and signing the transaction with source private keys. This tells the bitcoin network that
source has authorized a transfer of value to destination’s new address. As the transaction
is transmitted via the peer-to-peer protocol, it quickly propagates across the bitcoin
network.

Destination’s wallet is constantly "listening" to published transactions on the bitcoin
network, looking for any that match the addresses in his wallets.

the transaction has been propagated to the network but has not yet been recorded in the
bitcoin transaction ledger, known as the blockchain. To be confirmed, a transaction must
be included in a block and added to the blockchain

## CHAPTER 2: How Bitcoin Works

### Transactions, Blocks, Mining, and the Blockchain

we will examine bitcoin from a high level by tracking a single transaction through the
bitcoin system and watch as it becomes "trusted" and accepted by the bitcoin mechanism of
distributed consensus and is finally recorded on the blockchain, the distributed ledger of
all transactions.

#### Bitcoin Overview

A blockchain explorer is a web application that operates as a bitcoin search engine, in
that it allows you to search for addresses, transactions, and blocks and see the
relationships and flows between them. Popular blockchain explorers
include [Blockchain Block Explorer](https://www.blockchain.com/explorer)

a Bitcoin payment request is a QR-encoded URL that contains a destination address, a
payment amount, and a generic description

### Bitcoin Transactions

a transaction tells the network that the owner of some bitcoin value has authorized the
transfer of that value to another owner. The new owner can now spend the bitcoin by
creating another transaction that authorizes transfer to another owner, and so on, in a
chain of ownership.

#### Transaction Inputs and Outputs

Each transaction contains one or more "inputs," which are like debits against a bitcoin
account. On the other side of the transaction, there are one or more "outputs," which are
like credits added to a bitcoin account.

The inputs and outputs (debits and credits) do not necessarily add up to the same amount.
Instead, outputs add up to slightly less than inputs and the difference represents an
implied transaction fee, which is a small payment collected by the miner who includes the
transaction in the ledger.

The transaction also contains proof of ownership for each amount of bitcoin (inputs)
whose value is being spent, in the form of a digital signature from the owner, which can
be independently validated by anyone. In bitcoin terms, "spending" is signing a
transaction that transfers value from a previous transaction over to a new owner
identified by a bitcoin address. Figure

#### Transaction Chains

The transactions form a chain, where the inputs from the latest transaction correspond to
outputs from previous transactions.

Destination or receiver’s key provides the signature that unlocks those previous
transaction outputs,

#### Making Change

Many bitcoin transactions will include outputs that reference both an address of the new
owner and an address of the current owner, called the change address. This is because
transaction inputs, like currency notes, cannot be divided. The change address does not
have to be the same address as that of the input and for privacy reasons is often a new
address from the owner’s wallet.

Transactions move value from transaction inputs to transaction outputs. An input is a
reference to a previous transaction’s output, showing where the value is coming from. A
transaction output directs a specific value to a new owner’s bitcoin address and can
include a change output back to the original owner. Outputs from one transaction can be
used as inputs in a new transaction, thus creating a chain of ownership as the value is
moved from owner to owner.

#### Common Transaction Forms

The most common form of transaction is a simple payment from one address to another, which
often includes some “change” returned to the original owner. This type of transaction has
one input and two outputs.

Another common form of transaction is one that aggregates several inputs into a single
output. This represents the real-world equivalent of exchanging a pile of coins and
currency notes for a single larger note. Transactions like these are sometimes generated
by wallet applications to clean up lots of smaller amounts that were received as change
for payments.

Another transaction form that is seen often on the bitcoin ledger is a transaction that
distributes one input to multiple outputs representing multiple recipients

### Constructing a Transaction

Sender's wallet application contains all the logic for selecting appropriate inputs and
outputs to build a transaction to his specification.

#### Getting the Right Inputs

Most wallets keep track of all the available outputs belonging to addresses in the wallet.

A bitcoin wallet application that runs as a fullnode client actually contains a copy of
every unspent output from every transaction in the blockchain. This allows a wallet to
construct transaction inputs as well as quickly verify incoming transactions as having
correct inputs. However, because a full-node client takes up a lot of disk space, most
user wallets run “lightweight” clients that track only the user’s own unspent outputs.

If the wallet application does not maintain a copy of unspent transaction outputs, it can
query the bitcoin network to retrieve this information using a variety of APIs available
by different providers or by asking a full-node using an API.

#### Creating the Outputs

A transaction output is created in the form of a script that creates an encumbrance on the
value and can only be redeemed by the introduction of a solution to the script. like “This
output is payable to whoever can present a signature from the key corresponding to
receiver’s public address.”

#### Adding the Transaction to the Ledger

The transaction created by Source’s wallet application is 258 bytes long and contains
everything necessary to confirm ownership of the funds and assign new owners. Now, the
transaction must be transmitted to the bitcoin network where it will become part of the
blockchain.

##### Transmitting the transaction

Because the transaction contains all the information necessary to process, it does not
matter how or where it is transmitted to the bitcoin network. The bitcoin network is a
peer-to-peer network, with each bitcoin client participating by connecting to several
other bitcoin clients. The purpose of the bitcoin network is to propagate transactions and
blocks to all participants.

##### How it propagates

Any system, such as a server, desktop application, or wallet, that participates in the
bitcoin network by “speaking” the bitcoin protocol is called a bitcoin node. Sender’s
wallet application can send the new transaction to any bitcoin node it is connected to
over any type of connection.

Any bitcoin node that receives a valid transaction it has not seen before will immediately
forward it to all other nodes to which it is connected, a propagation technique known as
**flooding**. Thus, the transaction rapidly propagates out across the peer-topeer network,
reaching a large percentage of the nodes within a few seconds.

##### Receiver or Destination’s view

If sender’s bitcoin wallet application is directly connected to receiver’s wallet
application, destination’s wallet application might be the first node to receive the
transaction. receiver’s wallet will immediately identify sender’s transaction as an
incoming payment because it contains outputs redeemable by receiver’s keys. At this point
receiver can assume, with little risk, that the transaction will shortly be included in a
block and confirmed. Although confirmations ensure the transaction has been accepted by
the whole network, such a delay is unnecessary for small-value items

### Bitcoin Mining

Sender’s transaction is now propagated on the bitcoin network. It does not become part of
the blockchain until it is verified and included in a block by a process called mining.
The mining process serves two purposes in bitcoin:

* Mining nodes validate all transactions by reference to bitcoin’s consensus rules.
* Mining creates new bitcoin in each block, almost like a central bank printing new money.

### Mining Transactions in Blocks

New transactions are constantly flowing into the network from user wallets and other
applications. As these are seen by the bitcoin network nodes, they get added to a
temporary pool of unverified transactions maintained by each node. As miners construct a
new block, they add unverified transactions from this pool to the new block and then
attempt to prove the validity of that new block, with the mining algorithm
(Proof-of-Work).

Transactions are added to the new block, prioritized by the highest-fee transactions first
and a few other criteria. Each miner starts the process of mining a new block of
transactions as soon as he receives the previous block from the network.

He immediately creates a new block, fills it with transactions and the fingerprint of the
previous block, and starts calculating the Proof-of-Work for the new block. Each miner
includes a special transaction in his block, one that pays his own bitcoin address the
block reward plus the sum of transaction fees from all the transactions included in the
block.

Sender’s transaction was picked up by the network and included in the pool of unverified
transactions. Once validated by the mining software it was included in a new block, called
a candidate block, generated by miner’s mining pool.

### Spending the Transaction

Now that Sender’s transaction has been embedded in the blockchain as part of a block, it
is part of the distributed ledger of bitcoin and visible to all bitcoin applications.

Lightweight clients can do what is called a simplified payment verification by confirming
that the transaction is in the blockchain and has several blocks mined after it, thus
providing assurance that the miners accepted it as valid.

## CHAPTER 3: Bitcoin Core: The Reference Implementation

Bitcoin is an open source project and the source code is available under an open
(MIT) license, free to download and use for any purpose.

Bitcoin Core is the reference implementation of the bitcoin system, meaning that it is the
authoritative reference on how each part of the technology should be implemented.

Bitcoin Core implements all aspects of bitcoin, including wallets, a transaction and block
validation engine, and a full network node in the peer-to-peer bitcoin network.

Application developers are advised to build wallets using modern standards such as BIP-39
and BIP-32

The Bitcoin Core architecture consists of the following main components:
![img.png](img.png)

### Bitcoin Development Environment

you will want to set up a development environment with all the tools, libraries, and
support software for writing bitcoin applications.

### Compiling Bitcoin Core from the Source Code

Bitcoin Core’s source code can be downloaded as a ZIP archive or by cloning the
authoritative source repository from
the [GitHub bitcoin page](https://github.com/bitcoin/bitcoin).

the git command to create a local copy (“clone”) of the source code:

```shell
$ git clone https://github.com/bitcoin/bitcoin.git
```

#### Selecting a Bitcoin Core Release

Before compiling the code, select a specific version by checking out a release tag. to
find the available tags, we use the `git tag` command. To synchronize the local code with
specific tag, use the `git checkout` command:

```shell
$ git checkout v0.11.2
```

You can confirm you have the desired version “checked out” by issuing the command
`git status`.

#### Configuring the Bitcoin Core Build

The source code includes documentation, which can be found in a number of files. Review
the main documentation located in README.md in the bitcoin directory. Carefully review the
build prerequisites. Review the instructions for compiling the bitcoind commandline client
on your platform.

#### Building the Bitcoin Core Executables

Next, you will compile the source code, a process that can take up to an hour to complete,
depending on the speed of your CPU and available memory. Type `make` to start compiling
the executable application.

If all goes well, Bitcoin Core is now compiled. The final step is to install the various
executables on your system using the sudo make install command.

### Running a Bitcoin Core Node

Bitcoin’s peer-to-peer network is composed of network “nodes,” run mostly by volunteers
and some of the businesses that build bitcoin applications. by running a bitcoin node you
contribute to the bitcoin network by making it more robust.

Running a node, however, requires a permanently connected system with enough resources to
process all bitcoin transactions. Bitcoin nodes also transmit and receive bitcoin
transactions and blocks, consuming internet bandwidth.

Bitcoin Core keeps a full copy of the blockchain by default, with every transaction that
has ever occurred on the bitcoin network since its inception in 2009. Bitcoin Core will
not be able to process transactions or update account balances until the full blockchain
dataset is downloaded.

You would run a Bitcoin node for the following reasons:

* If you are developing bitcoin software and need to rely on a bitcoin node for
  programmable
  (API) access to the network and blockchain.
* If you are building applications that must validate transactions according to bitcoin’s
  consensus rules.
* If you want to support bitcoin. Running a node makes the network more robust and able to
  serve more wallets, more users, and more transactions.
* If you do not want to rely on any third party to process or validate your transactions.

#### Running Bitcoin Core for the First Time

When you first run `bitcoind`, it will remind you to create a configuration file with a
strong password for the JSON-RPC interface. Run bitcoind by typing `bitcoind` into the
terminal.

#### Configuring the Bitcoin Core Node

Edit the configuration file in your preferred editor and set the parameters, replacing the
password with a strong password as recommended by bitcoind. Typical path to configuration
file:
Windows %APPDATA%\Bitcoin\ C:\Users\username\AppData\Roaming\Bitcoin\bitcoin.conf Linux
$HOME/.bitcoin/ /home/username/.bitcoin/bitcoin.conf Mac OSX $HOME/Library/Application
Support/Bitcoin/ /Users/username/Library/Application Support/Bitcoin/bitcoin.conf

```properties
rpcuser=bitcoinrpc
rpcpassword=CHANGE_THIS
```

Bitcoin Core offers more than 100 configuration options that modify the behavior of the
network node, the storage of the blockchain, and many other aspects of its operation. To
see a listing of these options, run `bitcoind --help`.

By default, Bitcoin Core builds a database containing only the transactions related to the
user’s wallet.

Set `txindex=1` in the Bitcoin Core configuration file. If you don’t set this option at
first and later set it to full indexing, you need to restart bitcoind with the -reindex
option and wait for it to rebuild the index.

Sample coniguration of a resource-constrained system:

```properties
alertnotify=myemailscript.sh "Alert: %s"
maxconnections=15
prune=5000
minrelaytxfee=0.0001
maxmempool=200
maxreceivebuffer=2500
maxsendbuffer=500
rpcuser=bitcoinrpc
rpcpassword=CHANGE_THIS
```

Once you’ve edited the configuration file and set the options that best represent your
needs, you can test bitcoind with this configuration. Run Bitcoin Core with the option
printtoconsole to run in the foreground with output to the console:

```shell
$ bitcoind -printtoconsole
```

To run Bitcoin Core in the background as a process, start it with the daemon option,
as `bitcoind -daemon`.

To monitor the progress and runtime status of your bitcoin node, use the command
`bitcoin-cli getinfo`.

Once you are happy with the configuration options you have selected, you should add
bitcoin to the startup scripts in your operating system.

### Bitcoin Core Application Programming Interface (API)

The Bitcoin Core client implements a JSON-RPC interface that can also be accessed using
the command-line helper bitcoin-cli. Invoke the help command to see a list of the
available bitcoin RPC commands:

```shell
$ bitcoin-cli help
```

to see help on the getblockhash RPC command:

```shell
$ bitcoin-cli help getblockhash
```

#### Getting Information on the Bitcoin Core Client Status

Bitcoin’s getinfo RPC command displays basic information about the status of the bitcoin
network node, the wallet, and the blockchain database. Use bitcoin-cli to run it:

```shell
$ bitcoin-cli getinfo
```

#### Exploring and Decoding Transactions

The API to retrieve and examine that transaction by passing the transaction ID as a
parameter:
```shell
$ bitcoin-cli getrawtransaction 0627052b6f28912f2703066a912ea577f2ce4da4caa5a↵
5fbd8a57286c345c2f2
```

The command getrawtransaction returns a serialized transaction in hexadecimal
notation. To decode that, we use the decoderawtransaction command, passing the
hex data as a parameter.
```shell
$ bitcoin-cli decoderawtransaction 0100000001186f.......
```
#### Exploring Blocks

#### Using Bitcoin Core’s Programmatic Interface

### Alternative Clients, Libraries, and Toolkits

#### JavaScript

### Java

## References

Mastering Bitcoin by Andreas M. Antonopoulos (O’Reilly). Copyright 2017 Andreas M.
Antonopoulos, 978-1-491-95438-6.
[Github source code](https://github.com/bitcoinbook/bitcoinbook)
