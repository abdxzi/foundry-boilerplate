pragma solidity 0.8.19;

import {Script} from "forge-std/Script.sol";

contract HelperConfig {
    
    NetworkConfig public activeNetworkConfig;

    struct NetworkConfig {
        address priceFeed; // ETH/USD price feed address
    }

    constructor(){
        if (block.chainid == 11155111) {
            activeNetowrkConfig = getSepoliaEthConfig();
        } else {
            activeNetowrkConfig = getAnvilEthConfig();
        }

    }

    function getSepoliaEthConfig() public pure returns (NetworkConfig memory){
        NetworkConfig memory sepoliaConfig = NetworkConfig({
            priceFeed: 0x694AA1769357215DE4FAC081bf1f309aDC325306
        });
        return sepoliaConfig;
    }

    function getAnvilEthConfig() public pure returns (NetworkConfig memory){
        

    }

}