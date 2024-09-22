# Scripting
A simple deploy script
```js
// SPDX-License_identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";

contract DeployFundMe is Script {
    function run() external{
        vm.startBroadcast();
        new FundMe();
        vm.stopBroadcast();
    }  
}
```

## Call deploy script from a test

```js
// SPDX-License_identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";

contract DeployFundMe is Script {
    function run() external returns(FundMe){
        vm.startBroadcast();
        FundMe fundMe = new FundMe("sehbfiewf35433jnj");
        vm.stopBroadcast();
        return fundMe;
    }  
}
```

> When using `vm.startBroadcast()` msg.sender == deployer

```js
// SPDX-License_identifier: MIT

pragma solidity ^0.8.18;
import {Test} from "forge-std/Test.sol";
import {DeployFundMe} from "../script/DeployFundMe.s.sol";

contract FundMeTest is Test {
    function setUp() external {
        DeployFundMe deplotFundMe = new DeployFundMe();
        deplotFundMe.run();
    }
}

```

## Helper.config.sol

Scripting helps to deploy mockup

```js
// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import {Script} from "forge-std/Script.sol";

contract HelperConfig {
    NetworkConfig public activeNetworkConfig;

    struct NetworkConfig {
        address priceFeed; // ETH/USD price feed address
    }

    constructor() {
        if (block.chainid == 11155111) {
            activeNetowrkConfig = getSepoliaEthConfig();
        } else {
            activeNetowrkConfig = getAnvilEthConfig();
        }
    }

    function getSepoliaEthConfig() public pure returns (NetworkConfig memory) {
        NetworkConfig memory sepoliaConfig = NetworkConfig({
            priceFeed: 0x694AA1769357215DE4FAC081bf1f309aDC325306
        });
        return sepoliaConfig;
    }

    function getAnvilEthConfig() public pure returns (NetworkConfig memory) {}
}

```
Deploy Script:
```js
// SPDX-License_identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol"

contract DeployFundMe is Script {
    function run() external returns(FundMe){


        vm.startBroadcast();
        FundMe fundMe = new FundMe("sehbfiewf35433jnj");
        vm.stopBroadcast();
        return fundMe;
    }  
}
```
