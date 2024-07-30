
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract DegenToken is ERC20, Ownable, ERC20Burnable{

    constructor() ERC20("Degen","DGN") Ownable(msg.sender){}

    function mint(address to, uint256 amount) external onlyOwner{
        _mint(to, amount);
    }

    function transferToken(address _receiver, uint256 _value) external{
        require(balanceOf(msg.sender) >= _value,"Insufficient balance");
        _transfer(msg.sender, _receiver, _value);
    }

    function burnToken(uint256 _value) external{
        require(balanceOf(msg.sender) >= _value,"Insufficient balance");
        _burn(msg.sender, _value);
    }

    function checkBalance(address account) external view returns (uint256){
        return balanceOf(account);
    }
}
