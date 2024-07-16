pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/PoloCoin.sol";
import "../src/PoloNFT.sol";

contract DeployPoloCoin is Script {
    function run() external {
        vm.startBroadcast();
        PoloCoin polocoin = new PoloCoin();
        new PoloNFT(address(polocoin));
        vm.stopBroadcast();
    }
}
