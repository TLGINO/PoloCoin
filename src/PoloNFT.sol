pragma solidity ^0.8.13;
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";


contract PoloNFT is ERC721URIStorage {
    IERC20 poloCoin;
    uint256 polo_nft_price = 300; // this is in POLOCOIN
    uint256 tokenId;
    constructor(address _poloCoinAddress) ERC721("Polo NFT", "POLONFT"){
        poloCoin = IERC20(_poloCoinAddress);
    }

    /**
     * Mint a new nft
     * @param _to  recipient of nft
     * @param _uri url of nft
     */
    function mint(
        address _to,
        string calldata _uri
    ) external {
        require(poloCoin.allowance(msg.sender, address(this)) >= polo_nft_price, "Contract not approved to spend POLOCOIN");
        

        poloCoin.transferFrom(msg.sender, address(this), polo_nft_price);
        _mint(_to, tokenId);
        _setTokenURI(tokenId, _uri);
        tokenId+=1;
    }
}
