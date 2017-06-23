pragma solidity ^0.4.11;

contract Cryptorrent {
    // string Metadata -- string[] arrays de d'url
    struct Url {
      bytes32 url;
      address poster;
    }
    address public owner;
    uint public price;
    modifier onlyOwner {
      require(msg.sender == owner);
      _;
    }
    mapping (bytes32 => Url[]) public myMetadata;
    
    // number of links in a metadata
    mapping (bytes32 => uint) public myMetadataUrlNumber;
    
    function Cryptorrent(uint _price){
      owner = msg.sender;
      price = _price;
    }

    function addMedata(bytes32 _metadata, bytes32 _url) payable {
        require(msg.value >= price);
        myMetadataUrlNumber[_metadata]++;
        myMetadata[_metadata].push(Url({url: _url, poster: msg.sender}));
        owner.transfer(this.balance);
    }
}