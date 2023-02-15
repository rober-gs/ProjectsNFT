// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract Tickets is ERC20, Ownable {
    constructor(
        string memory _name,
        string memory _symbol,
        address _to,
        uint256 _amount
    ) ERC20(_name, _symbol) 
    {
        _mint(_to, _amount);
    }
}

contract NFTFractional is ERC721URIStorage, Ownable {
    
    using Counters for Counters.Counter;
    Counters.Counter public counterNFT;    
    constructor(
        string memory _name,
        string memory _symbol
    ) ERC721(_name, _symbol) 
    {

    }

    /// @notice mintea un nuevo proyecto nft fragmentado.        
    /// @param nameTickets Nombre de los Tickets. 
    /// @param supply: Total de tickets.    
    /// @param symbolTickets: Symbolo de los tickets.    
    /// @param uriProject: URI de los metadata del nft.    
    function Mint(        
        string memory nameTickets,
        uint256 supply,
        string memory symbolTickets,
        string memory uriProject
    ) 
        public 
        onlyOwner
    {
        counterNFT.increment();        
        uint256 id = counterNFT.current();        

        address erc20 = address(
            new Tickets(
                nameTickets,                
                symbolTickets,
                owner(),                                
                supply
            )
        );

        _mint(erc20, id); 
        _setTokenURI(id, uriProject);
    }
}