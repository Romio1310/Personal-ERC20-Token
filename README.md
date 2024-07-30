# Degen Token (ERC-20): Unlocking the Future of Gaming

## Simple Overview
Degen Token is an ERC-20 token created for Degen Gaming, designed to reward players, increase player loyalty and retention, and facilitate in-game transactions on the Avalanche blockchain.

## Description
Degen Gaming, a renowned game studio, has tasked you with creating a unique token that can be earned by players in their game and then exchanged for rewards in their in-game store. This token aims to enhance the gaming experience by allowing players to earn and trade tokens, purchase in-game items, and more. The token is built on the Avalanche blockchain to leverage its fast and low-fee transactions.

## Getting Started

### Installing
Since you are using Remix IDE and MetaMask, there is no need for local installations. Follow these steps to set up your environment and deploy the contract:

1. Open [Remix IDE](https://remix.ethereum.org/).
2. In the File Explorer, create a new file named `DegenToken.sol` and paste the contract code into it.
3. Compile the contract:
    - Select the appropriate Solidity compiler version (e.g., 0.8.0).
    - Click on the "Compile DegenToken.sol" button.

### Executing Program

#### How to deploy the contract

1. Connect MetaMask to the Avalanche Fuji Testnet:
    - Open MetaMask and switch to the Fuji Testnet.
    - Ensure you have some AVAX tokens for gas fees.

2. In Remix, navigate to the "Deploy & Run Transactions" tab:
    - Select "Injected Web3" as the environment.
    - Ensure MetaMask is connected and the correct account is selected.
    - Click the "Deploy" button and confirm the transaction in MetaMask.

3. Verify the smart contract on Snowtrace:
    - Copy the deployed contract address.
    - Use the [Snowtrace Verification Tool](https://testnet.snowtrace.io/verifyContract) to verify your contract by providing the contract address and source code.

#### Testing the contract
You can interact with the deployed contract directly from the "Deploy & Run Transactions" tab in Remix:
- Mint tokens: Call the `mint` function with the recipient address and amount.
- Transfer tokens: Call the `transferToken` function with the receiver's address and amount.
- Burn tokens: Call the `burnToken` function with the amount.
- Check balance: Call the `checkBalance` function with the address.

## Code
```solidity
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
```
## Help
If you encounter any issues, consider the following tips:

1. Ensure you have connected MetaMask to the Avalanche Fuji Testnet.
2. Make sure you have sufficient AVAX in your MetaMask wallet for deploying the contract.
3. Verify that you have selected the correct Solidity compiler version in Remix.

    For more detailed information, you can refer to the Remix IDE documentation or the Avalanche documentation.

## License
This project is licensed under the MIT License - see the LICENSE.md file for details.


### Notes:

- Ensure the deployed contract address is correctly copied and used for verification on Snowtrace.
- Adjust any details as necessary to fit your specific project setup and requirements.

Feel free to ask if you need any further assistance!
