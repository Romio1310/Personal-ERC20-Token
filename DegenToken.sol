// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract DegenToken is ERC20, Ownable, ERC20Burnable{

    mapping(string => uint256) public items;      // Stores item names with their corresponding token cost
    string[] public itemNames;                    // Tracks item names

    constructor() ERC20("Degen", "DGN") Ownable(msg.sender) {
        items["Sword"] = 1 * 10 ** decimals();    // Sword costs 1 DegenToken
        items["Shield"] = 2 * 10 ** decimals();   // Shield costs 2 DegenTokens
        items["Potion"] = 5 * 10 ** decimals();   // Potion costs 5 DegenTokens

        itemNames.push("Sword");                  // Add Sword to item list
        itemNames.push("Shield");                 // Add Shield to item list
        itemNames.push("Potion");                 // Add Potion to item list
    }

    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);                        // Mint tokens to a specified address
    }

    function transferToken(address receiver, uint256 value) external {
        require(balanceOf(msg.sender) >= value, "Insufficient balance");
        _transfer(msg.sender, receiver, value);   // Transfer tokens from sender to receiver
    }

    function burnToken(uint256 value) external {
        require(balanceOf(msg.sender) >= value, "Insufficient balance");
        _burn(msg.sender, value);                 // Burn tokens from sender's balance
    }

    function checkBalance(address account) external view returns (uint256) {
        return balanceOf(account);                // Return the balance of a specified account
    }

    function redeem(string memory itemName) external {
        uint256 itemCost = items[itemName];
        require(itemCost > 0, "Item does not exist");
        require(balanceOf(msg.sender) >= itemCost, "Insufficient balance to redeem item");
        _burn(msg.sender, itemCost);              // Burn tokens to redeem the specified item
    }

    function addItem(string memory itemName, uint256 tokenCost) external onlyOwner {
        items[itemName] = tokenCost;              // Add or update an item with its token cost
        itemNames.push(itemName);                 // Add the item name to the list
    }

    function getAllItems() external view returns (string[] memory) {
        return itemNames;                         // Return the list of all available item names
    }
}
