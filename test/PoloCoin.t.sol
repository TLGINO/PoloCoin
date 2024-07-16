// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "src/PoloCoin.sol";

contract TestPoloCoin is Test {
    PoloCoin p;

    function setUp() public {
        p = new PoloCoin();
    }

    function testName() public {
        assertEq(p.name(), "Polo Coin");
    }

    function testSymbol() public {
        assertEq(p.symbol(), "POLOCOIN");
    }

    function testTotalSupply() public {
        assertEq(p.totalSupply(), 2000);
    }
}
