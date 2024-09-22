-include .env

build:; forge build

deploy-sepolia: 
	forge create --rpc-url $(RPC_URL) --constructor-args "ForgeUSD" "FUSD" 18 1000000000000000000000 --private-key $(PRIVATE_KEY) --etherscan-api-key $(ETHERSCAN_API_KEY) --verify src/MyToken.sol:MyToken