pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {ERC20Mock} from "openzeppelin-contracts/contracts/mocks/token/ERC20Mock.sol";

contract HelperConfig is Script {
    NetworkConfig public activeNetworkConfig;

    struct NetworkConfig {
        address usdt_address; // ETH/USD price feed address
        address test_address;
    }

    constructor() {
        if (block.chainid == 11155111) {
            activeNetworkConfig = getSepoliaEthConfig();
        } else {
            activeNetworkConfig = getAnvilEthConfig();
        }
    }

    function getSepoliaEthConfig() public pure returns (NetworkConfig memory) {
        NetworkConfig memory sepoliaConfig = NetworkConfig({
            usdt_address: 0x7169D38820dfd117C3FA1f22a697dBA58d90BA06,
            test_address: address(0)
        });
        return sepoliaConfig;
    }

    function getAnvilEthConfig() public returns (NetworkConfig memory) {

        // Deploy Moc contract in anvil
        vm.startBroadcast();
        ERC20Mock erc20_mock = new ERC20Mock();
        vm.stopBroadcast();

        NetworkConfig memory anvilConfig = NetworkConfig({
            usdt_address: address(erc20_mock),
            test_address: address(0)
        });

        return anvilConfig;
    }
}
