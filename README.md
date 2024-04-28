# Coast
Coast is a buy now pay later (BNPL) iOS app that transforms BTC into a practical payment option for everyday purchases. Users can buy electronic items by making a small upfront payment and collateralising the rest with BTC, then pay off the balance in regular instalments using fiat or BTC. Once fully repaid the BTC collateral is returned to the user.

# Images

![image](https://github.com/nkoorty/StacksBoston/assets/22000925/49bc0982-1588-437b-99de-196244ba245a)
![image](https://github.com/nkoorty/StacksBoston/assets/22000925/aa3e8be7-f652-4ed5-85b7-fdb173184263)
![image](https://github.com/nkoorty/StacksBoston/assets/22000925/f5c0a743-bd66-46dd-9e23-03369a79c62d)
![image](https://github.com/nkoorty/StacksBoston/assets/22000925/5ecb4a1b-05e7-4845-9aca-2dd02463facb)
![image](https://github.com/nkoorty/StacksBoston/assets/22000925/732c565e-32b1-4112-8b73-c1dd2a9d6daf)
![image](https://github.com/nkoorty/StacksBoston/assets/22000925/9403921e-f04a-4b2d-b146-9c8284e78e3a)



# Overview

Coast extends BTC's utility beyond a store of value by facilitating its use in daily transactions, increasing demand and transactional velocity. It also improves retention by incentivising the holding of BTC and sustaining liquidity positions by allowing for repayment installations. 

One of the significant challenges with using BTC for regular purchases has been its volatility and slow transaction times. Coast addresses these issues by providing a stable platform for routine purchases, thus increasing BTC's usability. Moreover, the app's decentralized framework increases trust and security, significantly reducing the reliance on traditional intermediaries found in standard credit and BNPL systems.

By building in the mobile user base, Coast meets widespread financial needs and simplifies the onboarding of new users with the option of fiat payments and Google wallets onboarding. The backend functionality is supported by a payment contract, which initiates BNPL plans. This contract sets the payment terms, records the user's identity, and links the payment plan to their Stacks account. It includes  functions to manage and verify repayments efficiently and add interest and liquidate collateral for late payments. Additionally, an escrow collateral contract handles the secure locking and unlocking of BTC, ensuring that it remains protected until all payment terms are fulfilled.


# Technical Architecture
![Group 3](https://github.com/nkoorty/StacksBoston/assets/22000925/f646533c-9256-45b6-924f-b68b409a0bea)
