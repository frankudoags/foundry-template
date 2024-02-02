
# include .env file and export its env vars
# (-include to ignore error if it does not exist)
-include .env

default: fmt

all:; build test

fmt:; forge fmt

# Clean the repo
clean :; forge clean && rm -rf broadcast

# Remove modules
remove :; rm -rf .gitmodules && rm -rf lib && touch .gitmodules && git add . && git commit -m "setup modules"

# Install the Modules
install :; 
	forge install foundry-rs/forge-std 
	forge install OpenZeppelin/openzeppelin-contracts
	forge install vectorized/solady

# Update Dependencies
update:; forge update

#Run tests
run-test:; forge test -vvv
##-vvvv

# Builds
build  :; forge clean && forge fmt && forge build --optimize --optimizer-runs 1000000

anvil :; anvil -m 'test test test test test test test test test test test junk'

# use the "@" to hide the command from your shell 
deploy-goerli :; @forge script script/${contract}.s.sol:Deploy${contract} --rpc-url ${GOERLI_RPC_URL}  --private-key ${PRIVATE_KEY} --broadcast --verify --etherscan-api-key ${ETHERSCAN_API_KEY}  -vvvv

deploy-pegasus :; @forge script script/${contract}.s.sol:Deploy${contract} --rpc-url ${PEGASUS_RPC_URL}  --private-key ${PEGASUS_PRIVATE_KEY} --broadcast --legacy -vvvv

deploy-local :; @forge script script/${contract}.s.sol:Deploy${contract} --broadcast --fork-url http://localhost:8545

deploy-mumbai :; @forge script script/${contract}.s.sol:Deploy${contract} --rpc-url ${MUMBAI_RPC_URL}  --private-key ${PRIVATE_KEY} --broadcast --verify --etherscan-api-key ${POLYSCAN_API_KEY}  -vvvv