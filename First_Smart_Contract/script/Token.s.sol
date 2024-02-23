// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";

import '../src/ERC20.sol';

contract Token is ERC20{
    constructor(string memory _name, string memory _symbol, uint8 _decimals)
     ERC20(_name, _symbol, _decimals)
     {}


    function mint(address account, uint256 amount) external {
       _mint(account, amount);
    }

    function burn( uint256 amount) external {
        _burn(msg.sender, amount);
    }
     

}
contract TokenScript is Script {
    function setUp() public {}

    function run() public {
        uint privateKey = vm.envUint("DEV_PRIVATE_KEY");
        address account = vm.addr(privateKey);
        console.log("Account",account);
        vm.startBroadcast(privateKey);
        Token token = new Token("Test","TST",18);
        token.mint(account,1000);
        vm.stopBroadcast();
    }
}
