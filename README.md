Building a stablecoin in this project.
1. Relative stability: Anchored* or Pegged -> 1.00 USD
    1. Chainlink price feeds
    2. Setup mechanism to exchange ETH & BTC -> USD
2. Stability mechanism (mint/burn): Algorithmic (Decentralized)
    1. new stablecoin can only be minted with enough collateral
3. Collateral: Exogenous (Crypto)
    1. wETH**
    2. wBTC**

*Ideal stablecoin is probably 1 that floats such that its purchase power tracks with
price of real world stuff. But floating stablecoin is much more difficult to design.

**Wrapped ETH and Wrapped BTC, ie: ERC20 compatible ETH and BTC. wETH and wBTC are 
obtained by sending ETH or BTC to a conversion smart contract that issues/returns an 
equivalent amount of wETH or wBTC.