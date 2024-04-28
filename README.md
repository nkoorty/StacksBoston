# Coast
Coast is a buy now pay later (BNPL) iOS app that transforms BTC into a practical payment option for everyday purchases. Users can buy electronic items by making a small upfront payment and collateralising the rest with BTC, then pay off the balance in regular instalments using fiat or BTC. Once fully repaid the BTC collateral is returned to the user.

# Overview

Coast extends BTC's utility beyond a store of value by facilitating its use in daily transactions, increasing demand and transactional velocity. It also improves retention by incentivising the holding of BTC and sustaining liquidity positions by allowing for repayment installations. 

One of the significant challenges with using BTC for regular purchases has been its volatility and slow transaction times. Coast addresses these issues by providing a stable platform for routine purchases, thus increasing BTC's usability. Moreover, the app's decentralized framework increases trust and security, significantly reducing the reliance on traditional intermediaries found in standard credit and BNPL systems.

By building in the mobile user base, Coast meets widespread financial needs and simplifies the onboarding of new users with the option of fiat payments and Google wallets onboarding. The backend functionality is supported by a payment contract, which initiates BNPL plans. This contract sets the payment terms, records the user's identity, and links the payment plan to their Stacks account. It includes  functions to manage and verify repayments efficiently and add interest and liquidate collateral for late payments. Additionally, an escrow collateral contract handles the secure locking and unlocking of BTC, ensuring that it remains protected until all payment terms are fulfilled.


# Technical Architecture
![Group 3](https://github.com/nkoorty/StacksBoston/assets/22000925/f646533c-9256-45b6-924f-b68b409a0bea)
