// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract hadcoins {

   // Introducing the maximum number od Hadcoin available of sale
   uint public max_hadcoins = 1000000;
 
   // Introducing the maximum number od Hadcoin available of sale
   uint public usd_to_hadcoins = 1000;

   // Introducing the total number od Hadcoin that have been bought by the investors
   uint public total_hadcoins_bought = 0;

   // mapping from the investor address to its equity in Hadcoins and USD
   // its like public Address to both its equity and at coins and usd 
   mapping(address => uint) equity_hadcoins;
   mapping(address => uint) equity_usd;

   // mdifier is something that will check if an investor can buy or sell some at point
   // checking if an investor can buy Hadcoins
   modifier can_buy_hadcoins(uint usd_invested){
      require(usd_invested * usd_invested + total_hadcoins_bought <= max_hadcoins);
      _;
   }
   // Getting the equity in Hadcoins of an investor
   function equity_in_hadcoins(address investor) external view returns (uint)
   {
      return equity_hadcoins[investor];
   }
   // Getting the equity in USD of an investor
   function equity_in_usd(address investor ) external view returns (uint)
   {
   return equity_usd[investor];
   }

   // Buying Hadcoins
   function buy_hadcoins(address investor, uint usd_invested) external 
   
     can_buy_hadcoins(usd_invested){
       uint hadcoins_bought = usd_invested * usd_to_hadcoins ;
       equity_hadcoins[investor] += hadcoins_bought;
       equity_usd[investor] = equity_hadcoins[investor] / 1000 ;
       total_hadcoins_bought += hadcoins_bought;
     }

   // Selling Hadcoins
   function sell_hadcoins(address investor, uint hadcoins_sold) external 
   {

    equity_hadcoins[investor] -= hadcoins_sold;
    equity_usd[investor] = equity_hadcoins[investor] / 1000 ;
    total_hadcoins_bought -= hadcoins_sold;
  }


}

