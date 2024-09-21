# Foundry zkSync


## Install and rollback
```bash
forge --version #vanilla foundry version
```

2. Install `foundry-zkSync`
```bash
git clone https://github.com/matter-labs/foundry-zksync
cd foundry-zksync
./install-foundry-zksync
forge --version # zkSynnc Foundry version
```

3. update `foundry zkSync`
```bash
foundryup-zksync
```

4. After use remove and roll back to `vanilla foundry`

```bash
foundryup
forge --version #vanilla foundry version

foundryup-zksync
forge --version # zkSynnc Foundry version
```

## Deploy
### MAINNET

```bash
forge create 
    --rpc-url $ZKSYNC_RPC
    --constructor-args "ForgeUSD" "FUSD" 18 1000000000000000000000 
    --private-key $PRIVATE_KEY
    --zksync
    --legacy
    src/MyToken.sol:MyToken
```

### testnet

To deploy locally on a zkSync local chain, you'll need `Docker`, `Node.js`, and `zksync-cli`.

[Setup testnet](https://updraft.cyfrin.io/courses/foundry/foundry-simple-storage/zksync-local-node?lesson_format=video)

[Deploy on localnode](https://updraft.cyfrin.io/courses/foundry/foundry-simple-storage/zksync-local-deploy)

# Transaction types

After deploy:
```
.
├── broadcast/[Contract_Name]                
│   └── 260                      ------>  0x0 transactions (zkSync testnet)
│   └── 31337                    ------>  type:0x0 if --legacy used, else type: 0x2 (Anvil)
```
[Read](https://docs.zksync.io/zk-stack/concepts/transaction-lifecycle) |
[Watch](https://updraft.cyfrin.io/courses/foundry/foundry-simple-storage/tx-types?lesson_format=video)

> This `0x2` type is the current default type for the EVM.


> The EVM and ZK Sync ecosystems support multiple transaction types to accommodate various Ethereum Improvement Proposals (EIPs). Initially, Ethereum had only one transaction type (`0x0` legacy), but as the ecosystem evolved, multiple types were introduced through various EIPs. Subsequent types include type 1, which introduces an _access list_ of addresses and keys, and type 2, also known as [EIP 1559](https://eips.ethereum.org/EIPS/eip-1559) transactions.
