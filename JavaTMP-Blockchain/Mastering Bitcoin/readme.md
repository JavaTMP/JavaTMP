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
$ bitcoin-cli getrawtransaction 0627052b6f28912f2703066a912ea577f2ce4da4caa5a5fbd8a57286c345c2f2
```

The command getrawtransaction returns a serialized transaction in hexadecimal notation. To
decode that, we use the decoderawtransaction command, passing the hex data as a parameter.

```shell
$ bitcoin-cli decoderawtransaction 0100000001186f.......
```

#### Exploring Blocks

Commands: getblock, getblockhash

Exploring blocks is similar to exploring transactions. However, blocks can be referenced
either by the block height or by the block hash.

#### Using Bitcoin Core’s Programmatic Interface

The bitcoin-cli helper is very useful for exploring the Bitcoin Core API and testing
functions. Bitcoin Core’s API is a JSON-RPC interface.

RPC stands for Remote Procedure Call, which means that we are calling procedures (
functions) that are remote (on the Bitcoin Core node) via a network protocol.

There are libraries in most every programming language that “wrap” the Bitcoin Core API in
a way that makes this a lot simpler. Remember, this requires you to have a running Bitcoin
Core instance, which will be used to make JSON-RPC calls.

### Alternative Clients, Libraries, and Toolkits

There are many alternative clients, libraries, toolkits, and even full-node
implementations in the bitcoin ecosystem.

#### JavaScript

* [bcoin](https://bcoin.io/)
* [Bitcore](https://bitcore.io/)
* [BitcoinJS](https://github.com/bitcoinjs/bitcoinjs-lib)

### Java

* [bitcoinj](https://bitcoinj.org/)

## CHAPTER 4: Keys, Addresses

### Introduction

Ownership of bitcoin is established through digital keys, bitcoin addresses, and digital
signatures. The digital keys are created and stored by users in a file, or simple
database, called a **wallet**.

The digital keys in a user’s wallet are completely independent of the bitcoin protocol and
can be generated and managed by the user’s wallet software without reference to the
blockchain or access to the internet.

Most bitcoin transactions requires a valid digital signature to be included in the
blockchain, which can only be generated with a secret key. The digital signature used to
spend funds is also referred to as a witness, The witness data in a bitcoin transaction
testifies to the true ownership of the funds being spent.

The payment portion of a bitcoin transaction, the recipient’s public key is represented by
its digital fingerprint, called a bitcoin address. Bitcoin addresses represent public keys
or scripts.

#### Public Key Cryptography and Cryptocurrency

cryptography enables the creation of digital secrets and unforgeable digital signatures.
Bitcoin uses elliptic curve multiplication as the basis for its cryptography.

In bitcoin, we use public key cryptography to create a key pair that controls access to
bitcoin. The public key is used to receive funds, and the private key is used to sign
transactions to spend the funds.

When spending bitcoin, the current bitcoin owner presents her public key and a signature
created from the same private key in a transaction to spend those bitcoin.

the private and public keys are stored together as a key pair for convenience. However,
the public key can be calculated from the private key, so storing only the private key is
also possible.

#### Private and Public Keys

A bitcoin wallet contains a collection of key pairs, each consisting of a private key and
a public key.

Private Key (random) -> elliptic curve multiplication -> Public Key -> one-way
cryptographic hash -> Bitcoin Address.

The useful property of asymmetric cryptography is the ability to generate digital
signatures. anyone with access to the public key and the transaction fingerprint can use
them to verify the signature.

#### Private Keys

The bitcoin private key is just a number on 256 bits. The private key is used to create
signatures that are required to spend bitcoin by proving ownership of funds used in a
transaction.

##### Generating a private key from a random number

The following is a randomly generated private key (k) shown in hexadecimal format
(256 bits shown as 64 hexadecimal digits, each 4 bits):
1E99423A4ED27608A15A2616A2B0E9E52CED330AC530EDCC32C8FFC6A526AEDD

To generate a new key with the Bitcoin Core client, use the `getnewaddress` command. For
security reasons it displays the public key only, not the private key. To ask bitcoind to
expose the private key, use the `dumpprivkey` command. The `dumpprivkey` command shows the
private key in a Base58 checksum-encoded format called the Wallet Import Format (WIF).

```shell
$ bitcoin-cli getnewaddress
1J7mdg5rbQyUHENYdx39WVWK7fsLpEoXZy
$ bitcoin-cli dumpprivkey 1J7mdg5rbQyUHENYdx39WVWK7fsLpEoXZy
KxFC1jmwwCoACiCAWZ3eXa96mBM6tb3TYzGmf6YwgdGWZgawvrtJ
```

The `dumpprivkey` command opens the wallet and extracts the private key that was generated
by the `getnewaddress` command.

#### Public Keys

The public key is calculated from the private key using elliptic curve multiplication,
which is irreversible: K = P * G, where P is the private key, G is a constant point called
the generator point, and K is the resulting public key.

#### Elliptic Curve Cryptography Explained

Elliptic curve cryptography is a type of asymmetric or public key cryptography based on
the discrete logarithm problem as expressed by addition and multiplication on the points
of an elliptic curve.

#### Generating a Public Key

Because the generator point is always the same for all bitcoin users, a private key P
multiplied with G will always result in the same public key K.

### Bitcoin Addresses

A bitcoin address is a string of digits and characters that can be shared with anyone who
wants to send you money. The bitcoin address is what appears most commonly in a
transaction as the “recipient” of the funds.

A bitcoin address can represent the owner of a private/public key pair, or it can
represent something else, such as a payment script.

The algorithms used to make a bitcoin address from a public key are the Secure Hash
Algorithm (SHA) and the RACE Integrity Primitives Evaluation Message Digest (RIPEMD),
specifically SHA256 and RIPEMD160.

#### Base58 and Base58Check Encoding

Base58 is a set of lowercase and capital letters and numbers without the four (0, O, l, I)
. Base58Check is a Base58 encoding format, which has a built-in error-checking code.

Base58Check encoding: a Base58, versioned, and checksummed format for unambiguously
encoding bitcoin data:
![img_1.png](img_1.png)

#### Key Formats

These formats are primarily used to make it easy for people to read and transcribe keys
without introducing errors.

##### Private key formats

The private key can be represented in a number of different formats, all of which
correspond to the same 256-bit number.

##### Decode from Base58Check

You can use Bitcoin Explorer to decode the Base58Check format on the command line.

##### Encode from hex to Base58Check

To encode into Base58Check (the opposite of the previous command), we use the
base58check-encode command from Bitcoin Explorer and provide the hex private key, followed
by the WIF version prefix 128

##### Encode from hex (compressed key) to Base58Check

To encode into Base58Check as a “compressed” private key, we append the suffix 01 to the
hex key and then encode.

##### Public key formats

Public keys are also presented in different ways, usually as either compressed or
uncompressed public keys.

##### Compressed public keys

Compressed public keys were introduced to bitcoin to reduce the size of transactions and
conserve disk space on nodes that store the bitcoin blockchain database.

##### Compressed private keys

Private keys are not themselves compressed and cannot be compressed. The term “compressed
private key” really means “private key from which only compressed public keys should be
derived,” whereas “uncompressed private key” really means “private key from which only
uncompressed public keys should be derived.”

In a newer wallet that implements compressed public keys, the private keys will only ever
be exported as WIF-compressed (with a K or L prefix).

### Implementing Keys and Addresses in Python

The most comprehensive bitcoin library in Python is pybitcointools by Vitalik Buterin.

### Advanced Keys and Addresses

#### Encrypted Private Keys (BIP-38)

BIP-38 proposes a common standard for encrypting private keys with a passphrase and
encoding them with Base58Check. BIP-38 proposes a common standard for encrypting private
keys with a passphrase and encoding them with Base58Check.

A BIP-38 encryption scheme takes as input a bitcoin private key, usually encoded in the
WIF, as a Base58Check string with the prefix of “5.” Additionally, the BIP-38 encryption
scheme takes a passphrase—a long password—usually composed of several words or a complex
string of alphanumeric characters. The result of the BIP-38 encryption scheme is a
Base58Check-encoded encrypted private key that begins with the prefix 6P. If you see a key
that starts with 6P, it is encrypted and requires a passphrase in order to convert
(decrypt) it back into a WIF-formatted private key (prefix 5) that can be used in any
wallet.

The most common use case for BIP-38 encrypted keys is for paper wallets that can be used
to back up private keys on a piece of paper.

#### Pay-to-Script Hash (P2SH) and Multisig Addresses

Although anyone can send bitcoin to a “1” address, that bitcoin can only be spent by
presenting the corresponding private key signature and public key hash. Bitcoin addresses
that begin with the number “3” are pay-to-script hash (P2SH) addresses, sometimes
erroneously called multisignature or multisig addresses. They designate the beneficiary of
a bitcoin transaction as the hash of a script, instead of the owner of a public key.

Encoding a P2SH address involves using the same double-hash function as used during
creation of a bitcoin address, only applied on the script instead of the public key:

```shell
script hash = RIPEMD160(SHA256(script))
```

##### Multisignature addresses and P2SH

the most common implementation of the P2SH function is the multisignature address script.
As the name implies, the underlying script requires more than one signature to prove
ownership and therefore spend funds.

#### Vanity Addresses

Vanity addresses are valid bitcoin addresses that contain human-readable messages. Vanity
addresses require generating and testing billions of candidate private keys, until a
bitcoin address with the desired pattern is found.

#### Paper Wallets

Paper wallets are bitcoin private keys printed on paper. Often the paper wallet also
includes the corresponding bitcoin address for convenience, but this is not necessary
because it can be derived from the private key.

Paper wallets can be generated easily using a tool such as the client-side JavaScript
generator at bitaddress.org.

A more sophisticated paper wallet storage system uses BIP-38 encrypted private keys. The
keys printed on the paper wallet are protected by a passphrase that the owner has
memorized.

## CHAPTER 5: Wallets

The wallet is an application that serves as the primary user interface. The wallet
controls access to a user’s money, managing keys and addresses, tracking the balance, and
creating and signing transactions. It refers to the data structure used to store and
manage a user’s keys.

### Wallet Technology Overview

The wallet contains only keys. The “coins” are recorded in the blockchain on the bitcoin
network. Users control the coins on the network by signing transactions with the keys in
their wallets. In a sense, a bitcoin wallet is a keychain.

Users sign transactions with the keys, thereby proving they own the transaction outputs (
their coins). The coins are stored on the blockchain in the form of transaction outputs (
often noted as vout or txout).

There are two primary types of wallets, distinguished by whether the keys they contain are
related to each other or not. The nondeterministic or deterministic wallet.

#### Nondeterministic (Random) Wallets

The use of nondeterministic wallets is discouraged for anything other than simple tests.
They are simply too cumbersome to back up and use. Instead, use an industry-standard–based
HD wallet with a mnemonic seed for backup.

#### Deterministic (Seeded) Wallets

In a deterministic wallet, the seed is sufficient to recover all the derived keys, and
therefore a single backup at creation time is sufficient.

#### HD Wallets (BIP-32/BIP-44)

HD wallets contain keys derived in a tree structure, such that a parent key can derive a
sequence of children keys, each of which can derive a sequence of grandchildren keys, and
so on, to an infinite depth.

#### Seeds and Mnemonic Codes (BIP-39)

HD wallets are a very powerful mechanism for managing many keys and addresses. They are
even more useful if they are combined with a standardized way of creating seeds from a
sequence of English words that are easy to transcribe, export, and import across wallets.

#### Wallet Best Practices

As bitcoin wallet technology has matured, certain common industry standards have emerged
that make bitcoin wallets broadly interoperable, easy to use, secure, and flexible.

#### Using a Bitcoin Wallet

The Trezor is a simple USB device with two buttons that stores keys (in the form of an HD
wallet) and signs transactions.

### Wallet Technology Details

important industry standards that are used by many bitcoin wallets

#### Mnemonic Code Words (BIP-39)

Mnemonic code words are word sequences that represent (encode) a random number used as a
seed to derive a deterministic wallet.

#### Creating an HD Wallet from the Seed

HD wallets are created from a single root seed, which is a 128-, 256-, or 512-bit random
number.

The root seed is input into the HMAC-SHA512 algorithm and the resulting hash is used to
create a master private key (m) and a master chain code (c). The master private key (m)
then generates a corresponding master public key (M)
using the normal elliptic curve multiplication process m * G. The chain code (c) is used
to introduce entropy in the function that creates child keys from parent keys.

HD wallets use a child key derivation (CKD) function to derive child keys from parent
keys.

Extending a parent private key to create a child private key:

![img_2.png](img_2.png)

Changing the index allows us to extend the parent and create the other children in the
sequence.

Child private keys are indistinguishable from nondeterministic (random) keys. Because the
derivation function is a one-way function, the child key cannot be used to find the parent
key.

Without the child chain code, the child key cannot be used to derive any grandchildren
either. You need both the child private key and the child chain code to start a new branch
and derive grandchildren.

The two essential ingredients are the key and chain code, and combined these are called an
extended key.

Extended keys are stored and represented simply as the concatenation of the 256-bit key
and 256-bit chain code into a 512-bit sequence. There are two types of extended keys.

Extended keys are encoded using Base58Check, to easily export and import between different
BIP-32–compatible wallets.

Extending a parent public key to create a child public key:

![img_3.png](img_3.png)

#### Using an Extended Public Key on a Web Store

HD wallet offers the ability to derive public child keys without knowing the private keys.
[https://gear.mycelium.com/](https://gear.mycelium.com/) is an open source web-store
plugin for a variety of web hosting and content platforms. Mycelium Gear uses the xpub to
generate a unique address for every purchase.

The ability to derive a branch of public keys from an xpub is very useful, but it comes
with a potential risk. Access to an xpub does not give access to child private keys.
However, because the xpub contains the chain code, if a child private key is known, or
somehow leaked, it can be used with the chain code to derive all the other child private
keys. A single leaked child private key, together with a parent chain code, reveals all
the private keys of all the children. Worse, the child private key together with a parent
chain code can be used to deduce the parent private key.

HD wallets use an alternative derivation function called hardened derivation, which
“breaks” the relationship between parent public key and child chain code. The hardened
derivation function uses the parent private key to derive the child chain code, instead of
the parent public key.

The hardened derivation function looks almost identical to the normal child private key
derivation, except that the parent private key is used as input to the hash function,
instead of the parent public key:

![img_4.png](img_4.png)

When the hardened private derivation function is used, the resulting child private key and
chain code are completely different from what would result from the normal derivation
function. The resulting “branch” of keys can be used to produce extended public keys that
are not vulnerable, because the chain code they contain cannot be exploited to reveal any
private keys.

In simple terms, if you want to use the convenience of an xpub to derive branches of
public keys, without exposing yourself to the risk of a leaked chain code, you should
derive it from a hardened parent, rather than a normal parent. As a best practice, the
level-1 children of the master keys are always derived through the hardened derivation, to
prevent compromise of the master keys.

The index number used in the derivation function is a 32-bit integer. To easily
distinguish between keys derived through the normal derivation function versus keys
derived through hardened derivation, this index number is split into two ranges.
Therefore, if the index number is less than 231, the child is normal, whereas if the index
number is equal or above 231, the child is hardened.

Keys in an HD wallet are identified using a “path” naming convention, with each level of
the tree separated by a slash (/) character.

The HD wallet tree structure offers tremendous flexibility. Each parent extended key can
have 4 billion children: 2 billion normal children and 2 billion hardened children.

BIP-44 specifies the structure as consisting of five predefined tree levels:

```
m / purpose' / coin_type' / account' / change / address_index
```

## CHAPTER 6: Transactions

### Introduction

Transactions are data structures that encode the transfer of value between participants in
the bitcoin system. Each transaction is a public entry in bitcoin’s blockchain, the global
double-entry bookkeeping ledger.

### Transactions in Detail

Behind the scenes, an actual transaction looks very different from a transaction provided
by a typical block explorer. We can use Bitcoin Core’s command-line interface
(`getrawtransaction` and `decoderawtransaction`) to retrieve “raw” transaction, decode it,
and see what it contains.

```shell
bitcoin-cli getrawtransaction 025b42bf2c357bb869ca720befbeb4ee6c591b775f760bd70eb73407ee093aee
bitcoin-cli decoderawtransaction 02000000000101490daa58bd187b115d689ab174fc0abce24fc76c1411d367a6ea6a304d5e50c70000000000fdffffff010ae60000000000001600144646cb2bf122b5605e8d0019d5f28e9be38f01ea0247304402203ab114d5c4ba7efe654d457c6800c27b4b68b15b073114461c92f05cbe164de7022054d072eba30bb9d3455de9e7591196139c0eaaba0c3cd7fdecc20b70e5aa9fe70121035f457146cdb73c96f92684f4109ef727257f7407717744fcf894e1e2dbc69fb645300b00
```

### Transaction Outputs and Inputs

Bitcoin full nodes track all available and spendable outputs, known as unspent transaction
outputs, or UTXO. Every transaction represents a change (state transition) in the UTXO
set.

When we say that a user’s wallet has “received” bitcoin, what we mean is that the wallet
has detected a UTXO that can be spent with one of the keys controlled by that wallet.
Thus, a user’s bitcoin “balance” is the sum of all UTXO that user’s wallet can spend and
which may be scattered among hundreds of transactions and hundreds of blocks. bitcoin can
be divided down to eight decimal places as satoshis. outputs are discrete and indivisible
units of value, denominated in integer satoshis. An unspent output can only be consumed in
its entirety by a transaction.

As with real life, the bitcoin application can use several strategies to satisfy the
purchase amount.

A transaction consumes previously recorded unspent transaction outputs and creates new
transaction outputs that can be consumed by a future transaction. This way, chunks of
bitcoin value move forward from owner to owner in a chain of transactions consuming and
creating UTXO.

The exception to the output and input chain is a special type of transaction called the
coinbase transaction, which is the first transaction in each block. This transaction is
placed there by the “winning” miner and creates brand-new bitcoin payable to that miner as
a reward for mining. This special coinbase transaction does not consume UTXO; instead, it
has a special type of input called the “coinbase.” This is how bitcoin’s money supply is
created during the mining process.

Outputs come first because coinbase transactions, which generate new bitcoin, have no
inputs and create outputs from nothing.

#### Transaction Outputs

Every bitcoin transaction creates outputs, which are recorded on the bitcoin ledger.
Almost all of these outputs, create spendable chunks of bitcoin called UTXO, which are
then recognized by the whole network and available for the owner to spend in a future
transaction.

Transaction outputs consist of two parts:

* An amount of bitcoin, denominated in satoshis, the smallest bitcoin unit
* A cryptographic puzzle that determines the conditions required to spend the output

The cryptographic puzzle is also known as a locking script, a witness script, or a
scriptPubKey.

#### Transaction Inputs

Transaction inputs identify (by reference) which UTXO will be consumed and provide proof
of ownership through an unlocking script. For each UTXO that will be consumed to make this
payment, the wallet creates one input pointing to the UTXO and unlocks it with an
unlocking script.

The second part is an unlocking script, which the wallet constructs in order to satisfy
the spending conditions set in the UTXO. Most often, the unlocking script is a digital
signature and public key proving ownership of the bitcoin.

When transactions are serialized for transmission on the network, their inputs are encoded
into a byte stream.

#### Transaction Fees

Most transactions include transaction fees, which compensate the bitcoin miners for
securing the network.

Static fees are no longer viable on the bitcoin network. Wallets that set static fees will
produce a poor user experience as transactions will often get “stuck” and remain
unconfirmed.

#### Adding Fees to Transactions

Fees are implied as the difference between the sum of inputs and the sum of outputs.

if you consume a 20-bitcoin UTXO to make a 1-bitcoin payment, you must include a
19-bitcoin change output back to your wallet. Otherwise, the 19- bitcoin “leftover” will
be counted as a transaction fee and will be collected by the miner who mines your
transaction in a block.

If you forget to add a change output in a manually constructed transaction, you will be
paying the change as a transaction fee.

### Transaction Scripts and Script Language

Both the locking script placed on a UTXO and the unlocking script are written in this
scripting language. When a transaction is validated, the unlocking script in each input is
executed alongside the corresponding locking script to see if it satisfies the spending
condition.

#### Turing Incompleteness

every transaction is validated by every full node on the bitcoin network.

#### Stateless Verification

The bitcoin transaction script language is stateless, in that there is no state prior to
execution of the script, or state saved after execution of the script.

A script will predictably execute the same way on any system. If your system verifies a
script, you can be sure that every other system in the bitcoin network will also verify
the script, meaning that a valid transaction is valid for everyone and everyone knows
this. This predictability of outcomes is an essential benefit of the bitcoin system.

#### Script Construction (Lock + Unlock)

Bitcoin’s transaction validation engine relies on two types of scripts to validate
transactions: a locking script and an unlocking script. A locking script is a spending
condition placed on an output: it specifies the conditions that must be met to spend the
output in the future. Historically, the locking script was called a scriptPubKey, because
it usually contained a public key or bitcoin address (public key hash).

An unlocking script is a script that “solves,” or satisfies, the conditions placed on an
output by a locking script and allows the output to be spent.

Unlocking scripts are part of every transaction input. Most of the time they contain a
digital signature produced by the user’s wallet from his or her private key. Historically,
the unlocking script was called scriptSig, because it usually contained a digital
signature. In most bitcoin applications, the source code refers to the unlocking script as
scriptSig. You will also see the unlocking script referred to as a witness.

Every bitcoin validating node will validate transactions by executing the locking and
unlocking scripts together. Each input contains an unlocking script and refers to a
previously existing UTXO. The validation software will copy the unlocking script, retrieve
the UTXO referenced by the input, and copy the locking script from that UTXO. The
unlocking and locking script are then executed in sequence. The input is valid if the
unlocking script satisfies the locking script conditions

an example of the unlocking and locking scripts for the most common type of bitcoin
transaction (a payment to a public key hash), showing the combined script resulting from
the concatenation of the unlocking and locking scripts prior to script validation:

![img_5.png](img_5.png)

The scripting language executes the script by processing each item from left to right.

Bitcoin transaction scripts usually contain a conditional operator, so that they can
produce the TRUE result that signifies a valid transaction.

If the result of executing the locking script with the stack data copied from the
unlocking script is “TRUE,” the unlocking script has succeeded in resolving the conditions
imposed by the locking script and, therefore, the input is a valid authorization to spend
the UTXO.

#### Pay-to-Public-Key-Hash (P2PKH)

The vast majority of transactions processed on the bitcoin network spend outputs locked
with a Pay-to-Public-Key-Hash or “P2PKH” script. These outputs contain a locking script
that locks the output to a public key hash, more commonly known as a bitcoin address. An
output locked by a P2PKH script can be unlocked (spent) by presenting a public key and a
digital signature created by the corresponding private key.

That transaction output would have a locking script of the form:

```
OP_DUP OP_HASH160 <Cafe Public Key Hash> OP_EQUALVERIFY OP_CHECKSIG
```

The preceding locking script can be satisfied with an unlocking script of the form:

```
<Cafe Signature> <Cafe Public Key>
```

The two scripts together would form the following combined validation script:

```
<Cafe Signature> <Cafe Public Key> OP_DUP OP_HASH160 <Cafe Public Key Hash> OP_EQUALVERIFY OP_CHECKSIG
```

When executed, this combined script will evaluate to TRUE if, and only if, the unlocking
script matches the conditions set by the locking script.

### Digital Signatures (ECDSA)

digital signatures can present proof of ownership of a private key without revealing that
private key.

The digital signature algorithm used in bitcoin is the Elliptic Curve Digital Signature
Algorithm, or ECDSA. ECDSA is the algorithm used for digital signatures based on elliptic
curve private/public key pairs, ECDSA is used by the script functions OP_CHECKSIG,
OP_CHECKSIGVERIFY, OP_CHECKMULTISIG, and OP_CHECKMULTISIGVERIFY.

A digital signature serves three purposes in bitcoin:

* the signature proves that the owner of the private key, who is by implication the owner
  of the funds, has authorized the spending of those funds.
* the proof of authorization is undeniable (nonrepudiation).
* the signature proves that the transaction (or specific parts of the transaction) have
  not and cannot be modiied by anyone after it has been signed.

Each transaction input and any signature it may contain is completely independent of any
other input or signature.

A digital signature is a mathematical scheme for demonstrating the authenticity of a
digital message or documents. A valid digital signature gives a recipient reason to
believe that the message was created by a known sender (authentication), that the sender
cannot deny having sent the message (nonrepudiation), and that the message was not altered
in transit (integrity).

#### How Digital Signatures Work

A digital signature is a mathematical scheme that consists of two parts. The first part is
an algorithm for creating a signature, using a private key (the signing key), from a
message (the transaction). The second part is an algorithm that allows anyone to verify
the signature, given also the message and a public key.

In bitcoin’s implementation of the ECDSA algorithm, the “message” being signed is the
transaction, or more accurately a hash of a specific subset of the data in the
transaction. The signing key is the user’s private key.

The function produces a signature is composed of two values, commonly referred to as R and
S. they are serialized into a bytestream using an international standard encoding scheme
called the Distinguished Encoding Rules, or DER.

In the transaction input there is an unlocking script that contains the following
DER-encoded signature from wallet:

```
3045022100884d142d86652a3f47ba4746ec719bbfbd040a570b1deccbb6498c75c4ae24cb02204b9f039ff08df09cbe9f6addac960298cad530a863ea8f53982c09db8f6e381301
```

That signature is a serialized byte-stream of the R and S values produced by wallet to
prove she owns the private key authorized to spend that output:
0x30—indicating the start of a DER sequence

* 0x45—the length of the sequence (69 bytes)
* 0x02—an integer value follows
* 0x21—the length of the integer (33 bytes)
* R— 00884d142d86652a3f47ba4746ec719bbfbd040a570b1deccbb6498c75c4ae24cb
* 0x02—another integer follows
* 0x20—the length of the integer (32 bytes)
* S—4b9f039ff08df09cbe9f6addac960298cad530a863ea8f53982c09db8f6e3813
* A suffix (0x01) indicating the type of hash used (SIGHASH_ALL)

#### Verifying the Signature

To verify the signature, one must have the signature (R and S), the serialized
transaction, and the public key (that corresponds to the private key used to create the
signature). Essentially, verification of a signature means “Only the owner of the private
key that generated this public key could have produced this signature on this
transaction.”

The signature verification algorithm takes the message (a hash of the transaction or parts
of it), the signer’s public key and the signature (R and S values), and returns TRUE if
the signature is valid for this message and public key.

#### Signature Hash Types (SIGHASH)

Bitcoin signatures have a way of indicating which part of a transaction’s data is included
in the hash signed by the private key using a SIGHASH flag.

Remember, each input may contain a signature in its unlocking script. As a result, a
transaction that contains several inputs may have signatures with different SIGHASH flags
that commit different parts of the transaction in each of the inputs.

There are three SIGHASH flags: ALL, NONE, and SINGLE. there is a modifier flag
SIGHASH_ANYONECANPAY, which can be combined with each of the preceding flags.

The way SIGHASH flags are applied during signing and verification is that a copy of the
transaction is made and serialized. The SIGHASH flag is added to the end of the serialized
transaction and the result is hashed. The hash itself is the “message” that is signed. By
including the SIGHASH as the last step before hashing, the signature commits the SIGHASH
type as well, so it can’t be changed.

All SIGHASH types sign the transaction nLocktime field. In addition, the SIGH ASH type
itself is appended to the transaction before it is signed, so that it can’t be modified
once signed.

Let’s look at some of the other SIGHASH types and how they can be used in practice:

* ALL|ANYONECANPAY - This construction can be used to make a “crowdfunding”-style
  transaction.
* NONE - This construction can be used to create a “bearer check” or “blank check” of a
  specific amount.
* NONE|ANYONECANPAY - This construction can be used to build a “dust collector.”

#### ECDSA Math

The math of ECDSA is complex and difficult to understand. There are a number of great
guides online that might help. Search for “ECDSA explained” or try this
one: http://bit.ly/2r0HhGB.

#### The Importance of Randomness in Signatures

the signature generation algorithm uses a random key k, as the basis for an ephemeral
private/public key pair. The value of k is not important, as long as it is random. If the
same value k is used to produce two signatures on different messages (transactions), then
the signing private key can be calculated by anyone. Reuse of the same value for k in a
signature algorithm leads to exposure of the private key!.

If the same value k is used in the signing algorithm on two different transactions, the
private key can be calculated and exposed to the world!.

To avoid this vulnerability, the industry best practice is to not generate k with a
random-number generator seeded with entropy, but instead to use a deterministicrandom
process seeded with the transaction data itself.

### Bitcoin Addresses, Balances, and Other Abstractions

Now that we have explored what is actually included in a bitcoin transaction, we can
examine how the higher-level abstractions are derived from the seemingly primitive
components of the transaction.

## CHAPTER 7: Advanced Transactions and Scripting

### Introduction

In this chapter we will look at more advanced scripting and how we can use it to build
transactions with complex conditions.

### Multisignature

Multisignature scripts set a condition where N public keys are recorded in the script and
at least M of those must provide signatures to unlock the funds.

This is also known as an M-of-N scheme, where N is the total number of keys and M is the
threshold of signatures required for validation.

For example, a 2-of-3 multisignature is one where three public keys are listed as
potential signers and at least two of those must be used to create signatures for a valid
transaction to spend the funds.

The general form of a locking script setting an M-of-N multisignature condition is:

```
M <Public Key 1> <Public Key 2> ... <Public Key N> N CHECKMULTISIG
```

where N is the total number of listed public keys and M is the threshold of required
signatures to spend the output. A locking script setting a 2-of-3 multisignature condition
looks like this:

```
2 <Public Key A> <Public Key B> <Public Key C> 3 CHECKMULTISIG
```

The preceding locking script can be satisfied with an unlocking script containing pairs of
signatures and public keys:

```
<Signature B> <Signature C>
```

There is a bug in CHECKMULTISIG’s execution that requires a slight workaround. When
CHECKMULTISIG executes, it should consume M+N+2 items on the stack as parameters. However,
due to the bug, CHECKMULTISIG will pop an extra value or one value more than expected.

Because this bug became part of the consensus rules, it must now be replicated forever.
Therefore the correct script validation would look like this:

```
0 <Signature B> <Signature C> 2 <Public Key A> <Public Key B> <Public Key C> 3 CHECKMULTISIG
```

### Pay-to-Script-Hash (P2SH)

Multisignature scripts are one of the most common uses of bitcoin’s advanced scripting
capabilities and are a very powerful feature.

A multisignature scheme like that offers corporate governance controls and protects
against theft, embezzlement, or loss. The resulting script is quite long and looks like
this:

```
2 <Mohammed's Public Key> <Partner1 Public Key> <Partner2 Public Key> <Partner3 Public Key> <Attorney Public Key> 5 CHECKMULTISIG
```

P2SH was developed to resolve these practical difficulties and to make the use of complex
scripts as easy as a payment to a bitcoin address. With P2SH payments, the complex locking
script is replaced with its digital fingerprint, a cryptographic hash.

When a transaction attempting to spend the UTXO is presented later, it must contain the
script that matches the hash, in addition to the unlocking script. In simple terms, P2SH
means “pay to a script matching this hash, a script that will be presented later when this
output is spent.”

Complex script without P2SH Locking
Script `2 PubKey1 PubKey2 PubKey3 PubKey4 PubKey5 5 CHECKMULTISIG`
Unlocking Script `Sig1 Sig2`
Complex script as P2SH Redeem
Script `2 PubKey1 PubKey2 PubKey3 PubKey4 PubKey5 5 CHECKMULTISIG`
Locking Script `HASH160 <20-byte hash of redeem script> EQUAL`
Unlocking Script `Sig1 Sig2 <redeem script>`

applying the SHA256 hashing algorithm and then applying the RIPEMD160 algorithm on the
result.

A P2SH transaction locks the output to this hash instead of the longer script, using the
locking script: `HASH160 54c557e07dde5bb6cb791c7a540e0a4796f5e97e EQUAL`

When Mohammed and his partners want to spend this UTXO, they must present the original
redeem script (the one whose hash locked the UTXO) and the signatures necessary to unlock
it, like this: `<Sig1> <Sig2> <2 PK1 PK2 PK3 PK4 PK5 5 CHECKMULTISIG>`

the redeem script is checked against the locking script to make sure the hash matches:

```
<2 PK1 PK2 PK3 PK4 PK5 5 CHECKMULTISIG> HASH160 <redeem scriptHash> EQUAL
```

If the redeem script hash matches, the unlocking script is executed on its own, to unlock
the redeem script:

```
<Sig1> <Sig2> 2 PK1 PK2 PK3 PK4 PK5 5 CHECKMULTISIG
```

Almost all the scripts described in this chapter can only be implemented as P2SH scripts.
They cannot be used directly in the locking script of a UTXO.

#### P2SH Addresses

Another important part of the P2SH feature is the ability to encode a script hash as an
address. P2SH addresses are Base58Check encodings of the 20- byte hash of a script, just
like bitcoin addresses are Base58Check encodings of the 20- byte hash of a public key.

#### Benefits of P2SH

The P2SH feature offers the following benefits compared to the direct use of complex
scripts in locking outputs:

* Complex scripts are replaced by shorter fingerprints in the transaction output, making
  the transaction smaller
* P2SH shifts the transaction fee cost of a long script from the sender to the recipient,
  who has to include the long redeem script to spend it.

#### Redeem Script and Validation

P2SH locking scripts contain the hash of a redeem script, which gives no clues as to the
content of the redeem script itself. The P2SH transaction will be considered valid and
accepted even if the redeem script is invalid. You might accidentally lock bitcoin in such
a way that it cannot later be spent.

### Data Recording Output (RETURN)

to record a digital fingerprint of a file in such a way that anyone could establish
proof-of-existence of that file on a specific date by reference to that transaction.

create UTXO that cannot be spent, using the destination bitcoin address as a freeform
20-byte field. Because the address is used for data, it doesn’t correspond to a private
key and the resulting UTXO can never be spent.

`RETURN` outputs are recorded on the blockchain, so they consume disk space and contribute
to the increase in the blockchain’s size, but they are not stored in the UTXO set and
therefore do not bloat the UTXO memory pool and burden full nodes with the cost of more
expensive RAM.

### Timelocks

Timelocks are restrictions on transactions or outputs that only allow spending after a
point in time.

#### Transaction Locktime (nLocktime)

Transactions with nLocktime specifying a future block or time must be held by the
originating system and transmitted to the bitcoin network only after they become valid. If
a transaction is transmitted to the network before the specified nLocktime, the
transaction will be rejected by the first node as invalid and will not be relayed to other
nodes. The use of nLocktime is equivalent to postdating a paper check.

But it can create another transaction, double-spending the same inputs without a locktime.
Thus, Alice can spend the same UTXO before the 3 months have elapsed.

#### Check Lock Time Verify (CLTV)

Based on a specifications in BIP-65, a new script operator called `CHECKLOCKTIMEVERIFY`
(CLTV) was added to the scripting language. by adding the CLTV opcode in the redeem script
of an output it restricts the output, so that it can only be spent after the specified
time has elapsed. While nLocktime is a transaction-level timelock, CLTV is an outputbased
timelock.

The CLTV opcode takes one parameter as input, expressed as a number in the same format as
nLocktime (either a block height or Unix epoch time).

To lock it to a time, say 3 months from now, the transaction would be a P2SH transaction
with a redeem script like this:

```
<now + 3 months> CHECKLOCKTIMEVERIFY DROP DUP HASH160 <Bob's Public Key Hash> EQUALVERIFY CHECKSIG
```

After execution, if CLTV is satisfied, the time parameter that preceded it remains as the
top item on the stack and may need to be dropped, with DROP, for correct execution of
subsequent script opcodes.

#### Relative Timelocks

Relative timelocks, like absolute timelocks, are implemented with both a transactionlevel
feature and a script-level opcode.

#### Relative Timelocks with nSequence

Relative timelocks can be set on each input of a transaction, by setting the nSequence
field in each input.

a transaction containing inputs with nSequence value below 232 (0xFFFFFFFF) indicated a
transaction that was not yet “finalized.” Such a transaction would be held in the mempool
until it was replaced by another transaction spending the same inputs with a higher
nSequence value. Once a transaction was received whose inputs had an nSequence value of
232 it would be considered “finalized” and mined.

#### Relative Timelocks with CSV

Just like CLTV and nLocktime, there is a script opcode for relative timelocks that
leverages the nSequence value in scripts. That opcode is CHECKSEQUENCEVERIFY, commonly
referred to as CSV for short.

The CSV opcode when evaluated in a UTXO’s redeem script allows spending only in a
transaction whose input nSequence value is greater than or equal to the CSV parameter.

#### Median-Time-Past

The timestamps set in block headers are set by the miners. There is a certain degree of
latitude allowed by the consensus rules to account for differences in clock accuracy
between decentralized nodes.

Median-Time-Past is calculated by taking the timestamps of the last 11 blocks and finding
the median.

#### Timelock Defense Against Fee Sniping

Fee-sniping is a theoretical attack scenario, where miners attempting to rewrite past
blocks “snipe” higher-fee transactions from future blocks to maximize their profitability.

### Scripts with Flow Control (Conditional Clauses)

Bitcoin Script flow control can be used to construct very complex scripts with hundreds or
even thousands of possible execution paths. There is no limit to nesting, but consensus
rules impose a limit on the maximum size, in bytes, of a script.

Bitcoin implements flow control using the IF, ELSE, ENDIF, and NOTIF opcodes.
Additionally, conditional expressions can contain boolean operators such as BOOLAND,
BOOLOR, and NOT.

In a stack-based language like Bitcoin Script, the logical condition comes before the IF.

#### Conditional Clauses with VERIFY Opcodes

The VERIFY suffix means that if the condition evaluated is not TRUE, execution of the
script terminates immediately and the transaction is deemed invalid.

#### Using Flow Control in Scripts

A very common use for flow control in Bitcoin Script is to construct a redeem script that
offers multiple execution paths, each a different way of redeeming the UTXO.

a simple example, where we have two signers, Alice and Bob, and either one is able to
redeem:

```
IF
  <Alice's Pubkey> CHECKSIG
ELSE
  <Bob's Pubkey> CHECKSIG
ENDIF
```

The condition is not part of the redeem script. Instead, the condition will be offered in
the unlocking script, allowing Alice and Bob to “choose” which execution path they want.

Alice redeems this with the unlocking script: `<Alice's Sig> 1`
For Bob to redeem this, he would have to choose the second execution path by giving a
FALSE value to the IF clause: `<Bob's Sig> 0`

## CHAPTER 8: The Bitcoin Network

### Peer-to-Peer Network Architecture

Bitcoin is structured as a peer-to-peer network architecture on top of the internet. All
nodes share the burden of providing network services. The network nodes interconnect in a
mesh network with a “flat” topology.

the largest and most successful application of P2P technologies is file sharing, with
Napster as the pioneer and BitTorrent as the most recent evolution of the architecture.

Bitcoin is a P2P digital cash system by design, and the network architecture is both a
reflection and a foundation of that core characteristic. Decentralization of control is a
core design principle that can only be achieved and maintained by a flat, decentralized
P2P consensus network.

The term “bitcoin network” refers to the collection of nodes running the bitcoin P2P
protocol. In addition to the bitcoin P2P protocol, there are other protocols such as
Stratum that are used for mining and lightweight or mobile wallets. These additional
protocols are provided by gateway routing servers that access the bitcoin network using
the bitcoin P2P protocol and then extend that network to nodes running other protocols.

For example, Stratum servers connect Stratum mining nodes via the Stratum protocol to the
main bitcoin network and bridge the Stratum protocol to the bitcoin P2P protocol.

### Node Types and Roles

A full bitcoin node is a collection of functions: routing, the blockchain database,
mining, and wallet services. All nodes validate and propagate transactions and blocks, and
discover and maintain connections to peers.

### The Extended Bitcoin Network

### Bitcoin Relay Networks

### Network Discovery

### Full Nodes

### Exchanging “Inventory”

### Simplified Payment Verification (SPV) Nodes

### Bloom Filters

#### How Bloom Filters Work

### How SPV Nodes Use Bloom Filters

### SPV Nodes and Privacy

### Encrypted and Authenticated Connections

#### Tor Transport

#### Peer-to-Peer Authentication and Encryption

### Transaction Pools

## References

Mastering Bitcoin by Andreas M. Antonopoulos (O’Reilly). Copyright 2017 Andreas M.
Antonopoulos, 978-1-491-95438-6.
[Github source code](https://github.com/bitcoinbook/bitcoinbook)
[online address generator](https://kimbatt.github.io/btc-address-generator/)
[Bitcoin Explorer - bx](https://github.com/libbitcoin/libbitcoin-explorer)
