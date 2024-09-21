# Foundry

- [Foundry](#foundry)
  - [Project Basics](#project-basics)
    - [Create a project](#create-a-project)
    - [Clone verified contract](#clone-verified-contract)
    - [Dependencies](#dependencies)
      - [Remapping dependencies](#remapping-dependencies)
      - [Update \& remove](#update--remove)
    - [Project Layout](#project-layout)
- [Forge](#forge)
  - [tests \*](#tests-)
    - [writing tests \*](#writing-tests-)
    - [Cheatcodes](#cheatcodes)
  - [Deploying](#deploying)
  - [Gas Tracking, Snapshots](#gas-tracking-snapshots)
  - [Debugger](#debugger)
- [Cast](#cast)
    - [Read from contract:](#read-from-contract)
    - [Send transaction to contract:](#send-transaction-to-contract)
- [Anvil](#anvil)
- [Chisel](#chisel)
- [Advanced Debugging](#advanced-debugging)


## Project Basics

### [Create a project][1] 
  `forge init hello_project`
### [Clone verified contract][2] 
 `forge clone 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2 WETH9`
### [Dependencies][3]
`forge install transmissions11/solmate`

#### Remapping dependencies
```toml
# foundry.toml

remappings = [
    "@solmate-utils/=lib/solmate/src/utils/",
]

# Now import like 
# import "@solmate-utils/LibString.sol"
```

#### Update & remove
`forge update lib/solmate` \
`forge remove solmate`

### [Project Layout][4]

```
.
├── README.md
├── foundry.toml                   -------> Project conf file
├── lib                            -------> Libraries
│   └── forge-std
│       ├── LICENSE-APACHE
│       ├── LICENSE-MIT
│       ├── README.md
│       ├── foundry.toml
│       ├── package.json
│       ├── scripts
│       ├── src
│       └── test
├── script                         -------> Scripts
│   └── Counter.s.sol
├── src                            -------> contracts
│   └── Counter.sol           
└── test                           -------> Tests
    └── Counter.t.sol

8 directories, 10 files
```
- `test/` \
  where any contract with a function that starts with `test` is considered to be a test.
- Dependencies are stored as git submodules in `lib/`

# Forge
## tests [*][5]
```bash
# all tests
forge test

# specific test: --match-contract, --match-test
forge test --match-contract ComplicatedContractTest --match-test test_Deposit

# verbosity to include logs, event emits
forge test -vvvv

# watch for file changes
forge test --watch

# gas reports
forge test --gas-report
forge test --match-test testBurn --gas-report
```

### writing tests [*][6]

```js
pragma solidity 0.8.10;
import "forge-std/Test.sol";

contract ContractBTest is Test {
    uint256 testNumber;

    function setUp() public {
        testNumber = 42;
    }

    function test_NumberIs42() public {
        assertEq(testNumber, 42);
    }

    function testFail_Subtract43() public {
        testNumber -= 43;
    }
}

```
- `setUp` \
  An optional function invoked before each test case is run.
- `test` \
  Functions prefixed with test are run as a test case.
- `testFail` \
  The inverse of the test prefix - if the function does not revert, the test fails.

[Cheatcodes](https://book.getfoundry.sh/forge/cheatcodes.html) \
[Best Practices](https://book.getfoundry.sh/tutorials/best-practices.html)

### Cheatcodes

```js
vm.prank()
vm.expectRevert()
vm.expectEmit();
```

> [Traces][7] \
> [Fork Testing][8]

## Deploying
1. ~~Direct on commandline~~
```bash
forge create 
    --rpc-url <your_rpc_url> 
    --constructor-args "ForgeUSD" "FUSD" 18 1000000000000000000000 
    --private-key <your_private_key> 
    --etherscan-api-key <your_etherscan_api_key> 
    --verify 
    src/MyToken.sol:MyToken
```

2. ~~Private key from .env~~
```bash
source .env
forge create 
    --rpc-url $RPC_URL
    --constructor-args "ForgeUSD" "FUSD" 18 1000000000000000000000 
    --private-key $PRIVATE_KEY
    --etherscan-api-key $ETHERSCAN_API_KEY
    --verify 
    src/MyToken.sol:MyToken
```

3. Encrypted keystore file [.][13]
- Import private key to [keystore](https://book.getfoundry.sh/reference/cast/cast-wallet-import) 

  ```bash
  cast wallet import defaultKey --interactive
  forge create 
    --rpc-url $RPC_URL
    --constructor-args "ForgeUSD" "FUSD" 18 1000000000000000000000 
    --account defaultKey
    --sender 0x445...45fd
    src/MyToken.sol:MyToken
  ```
- Enter password

## Gas Tracking, Snapshots

[Snapshots comparison][9]

## Debugger

[Debugger][10]

```bash
forge debug
forge test --debug "testSomething()"
forge debug --debug src/SomeContract.sol --sig "myFunc(uint256,string)" 123 "hello"
```

# Cast
Cast is Foundry’s command-line tool for performing Ethereum RPC calls.

`cast --help`

### Read from contract: 
```bash
cast call 0x6b175474e89094c44da98b954eedeac495271d0f "totalSupply(uint256)" --rpc-url $RPC_URL
```

### Send transaction to contract: 
```bash
cast send  0x82...df5f "store(uint256)" 123 --rpc-url $RPC_URL --private_key $PRIVATE_KEY
```

# Anvil
[Anvil][11] is a local testnet node shipped with Foundry.

```bash
anvil -a
anvil --hardfork
anvil  -p
```

# Chisel
[Chisel][12] is an advanced Solidity REPL shipped with Foundry.

# Advanced Debugging
[No error on Revert](https://youtu.be/mmzkPz71QJs?t=7276)

[1]: https://book.getfoundry.sh/projects/creating-a-new-project
[2]: https://book.getfoundry.sh/projects/clone-a-verified-contract
[3]: https://book.getfoundry.sh/projects/dependencies#dependencies
[4]: https://book.getfoundry.sh/projects/project-layout
[5]: https://book.getfoundry.sh/forge/tests
[6]: https://book.getfoundry.sh/forge/writing-tests
[7]: https://book.getfoundry.sh/forge/traces
[8]: https://book.getfoundry.sh/forge/fork-testing
[9]: https://book.getfoundry.sh/forge/gas-snapshots
[10]: https://book.getfoundry.sh/forge/debugger
[11]: https://book.getfoundry.sh/reference/anvil/
[12]: https://book.getfoundry.sh/reference/chisel/
[13]: https://book.getfoundry.sh/reference/cast/wallet-commands
