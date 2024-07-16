pragma solidity ^0.8.13;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract PoloCoin is ERC20 {
    constructor() ERC20("Polo Coin", "POLOCOIN") {
        uint256 amount_per_token = 1000 * 10 ** decimals();
        _mint(msg.sender, amount_per_token); // me
        _mint(address(0xAb5801a7D398351b8bE11C439e05C5B3259aeC9B), amount_per_token); // Vitalik
        // _mint(msg.sender, 1000); // daniel
        // _mint(msg.sender, 1000); // papa
    }
    function decimals() public view virtual override returns (uint8) {
        return 0;
    }
}
