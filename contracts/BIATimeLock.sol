pragma solidity ^0.5.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/TokenTimelock.sol";

contract BIATimeLock {
//using SafeERC20 for IERC20;
using SafeMath for uint256;
IERC20 public BIAToken; 
    
// Token reserve funds
  address public walletAdress;
   
constructor(
        IERC20 _tokenAddress,
        address _walletAdress
        ) 
        public {
        walletAdress = _walletAdress;
        BIAToken = _tokenAddress;   
        tokenTimeLock();
    }   

  
  //Unix epoc time for 1 July 2022 00:00:00
  uint256 public releaseTime1 = 1656633600;

  //Unix epoc time for 1 January 2023 00:00:00
  uint256 public releaseTime2 = 1672531200;

  //Unix epoc time for 1 January 2024 00:00:00
  uint256 public releaseTime3 = 1704067200;

  // Timelock Addresses
  address[3] public timeLock;
  

  event newTimeLock(address _timeLock,address _wallet,uint256 _releaseTime);

function tokenTimeLock() internal {
      
     //Team members timelock creation
      timeLock[0]   = address(new TokenTimelock(BIAToken, walletAdress, releaseTime1));
      emit newTimeLock(timeLock[0],walletAdress, releaseTime1);
      timeLock[1]   = address(new TokenTimelock(BIAToken, walletAdress, releaseTime2));
      emit newTimeLock(timeLock[1],walletAdress, releaseTime2);
      timeLock[2]   = address(new TokenTimelock(BIAToken, walletAdress, releaseTime3));
      emit newTimeLock(timeLock[2],walletAdress, releaseTime3);
                
    }
}


