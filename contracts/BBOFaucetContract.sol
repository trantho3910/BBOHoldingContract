pragma solidity ^0.4.24;

import './zeppelin/ownership/Ownable.sol';
import './zeppelin/token/ERC20/ERC20.sol';

contract BBOFaucetContract is Ownable{
    
      ERC20 public bbo = ERC20(0x0);

      uint maxFaucetToken =  500 * 1e18; //500 token
      uint transferToken  =  10 * 1e18; //100 token


     function setMaxFaucet(uint value) onlyOwner public {
        require(value > 0);
        maxFaucetToken = value;
        
     }

    function setTransferToken(uint value) onlyOwner public {
        require(value > 0);
        transferToken = value;
        
     }

    function setBBO(address BBOAddress) onlyOwner public {
        require(BBOAddress != address(0));
        bbo = ERC20(BBOAddress);
        
     }


    function faucetBB0 () public {
        
    require(bbo.balanceOf(msg.sender) < maxFaucetToken);

     bbo.transfer(msg.sender, transferToken);

    }

    function () external payable {
        faucetBB0();
    }

  

}