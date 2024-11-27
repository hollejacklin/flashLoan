// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "./IVault.sol";
import "./IERC20.sol";
import "./SafeERC20.sol";

contract myFlashloan {
    using SafeERC20 for IERC20;
    
    function balancerFlashLoan(
            uint256 loanAmount
        ) external {
            address[] memory tokens = new address[](1);
            uint256[] memory loanAmounts = new uint256[](1);
            //USDC address 0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174
            tokens[0] = 0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174; 
            loanAmounts[0] = loanAmount;
            //Balancer vault 0xBA12222222228d8Ba445958a75a0704d566BF2C8
            IVault (0xBA12222222228d8Ba445958a75a0704d566BF2C8).flashLoan(
                address(this),
                tokens,
                loanAmounts,
                ""
            );
        }
    function receiveFlashLoan(
        address[] memory tokens,
        uint256[] memory amounts,
        uint256[] memory feeAmounts,
        bytes memory data
    ) external {
        //the actions after you borrowed USDC
        
        //repay USDC
        IERC20(tokens[0]).transfer(msg.sender, amounts[0]+feeAmounts[0]); 
    }
}
