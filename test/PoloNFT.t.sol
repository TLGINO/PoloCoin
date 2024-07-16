// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "src/PoloCoin.sol";
import "src/PoloNFT.sol";
import "./Owners.t.sol";

contract TestPoloCoin is Test, Owners {
    PoloCoin p;
    PoloNFT nft;
    address dummy_addr = 0x95222290DD7278Aa3Ddd389Cc1E1d165CC4BAfe5; // beaver build


    function setUp() public {
        p = new PoloCoin();
        nft = new PoloNFT(address(p));
    }

    function testFail_MintNoPOLOCOIN() public {
        vm.prank(address(owner1));
        nft.mint(dummy_addr, 'https://google.com');
    }

    function testFail_MintWithoutApproval() public {
        vm.prank(address(owner1));
        nft.mint(dummy_addr, 'https://google.com');
    }
    function test_MintNFT() public {

        vm.prank(address(owner1));
        p.approve(address(nft), polo_nft_price);
        uint256 allowance = p.allowance(owner1, address(nft));
        assertEq(allowance, polo_nft_price, "Allowance not set correctly");

        vm.prank(address(owner1));
        nft.mint(dummy_addr, 'https://google.com');
    }
}
