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

# Advanced Debugging
[No error on Revert](https://youtu.be/mmzkPz71QJs?t=7276)


[1]: https://book.getfoundry.sh/projects/creating-a-new-project
[2]: https://book.getfoundry.sh/projects/clone-a-verified-contract
[3]: https://book.getfoundry.sh/projects/dependencies#dependencies
[4]: https://book.getfoundry.sh/projects/project-layout
[5]: https://book.getfoundry.sh/forge/tests
[6]: https://book.getfoundry.sh/forge/writing-tests