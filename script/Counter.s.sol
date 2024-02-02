// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {Counter} from "./src/Counter.sol";

contract DeployCounter is Script {
    Counter public counter;

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

       counter = new Counter();

        //uncomment this line to stop the broadcast when deploying on anywhere other than the local testnet
        vm.stopBroadcast();
    }
}
