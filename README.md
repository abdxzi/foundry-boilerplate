## Foundry
**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

## Learning notes
[Foundry](./notes/note.md) \
[Foundry-zkSync](./notes/foundry-zksync.md)


Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/


# some helpful commands
```bash
forge remappings
forge test -mt testUSDTDeploy -vvv
```