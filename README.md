# coinflip-dyeus
Submission for coinflip dyeus challenge using solidity and harmony vrf.
Consider 1 and 0 as Heads or Tails while giving input.

Deployment address: 0xf19bbd288716e70B4774117448A0120d05947FcB

For transactions, refer to the images below.

COMPILING:
![Screenshot (433)](https://user-images.githubusercontent.com/72209443/166323713-52e2b260-1e43-4794-8466-c51f85f1bee3.png)


After successful compilation of contract, go to deploy and run transaction => select environment as injected Web3, make sure to add Harmony Testnet in metamask and use it for  deployment of contract.


DEPLOYING ON HARMONY TESTNET:
![Screenshot (434)](https://user-images.githubusercontent.com/72209443/166324417-66536629-276f-4d69-be71-c77f8b03e20d.png)


Make sure to confirm the transaction popup on metamask.


DEPLOYMENT:
![Screenshot (435)](https://user-images.githubusercontent.com/72209443/166324722-9629ca2a-1022-434f-92d1-87a8c0f8694f.png)

![Screenshot (436)](https://user-images.githubusercontent.com/72209443/166324733-c46d8dc2-2aa1-46fd-aede-7e7ff423181f.png)


After deployment go to deployed contracts, here we can function that are available to us for playing the game. Enter 1 for heads or 0 for tails in placeBet function along with bet amount, and confirm the transaction.


HOW TO PLAY:
![Screenshot (437)](https://user-images.githubusercontent.com/72209443/166325004-e4e07fe8-6992-4dc8-a13c-f5e87f5f940c.png)

![image](https://user-images.githubusercontent.com/72209443/166325355-0ee8436a-766e-4789-b44f-5dd608e6551b.png)


After placing the bet, call the function reward bet. It will show the result of the bet. In this case we case see the "event": "Win", which means that we won also we can verify this by checking the balancing of the wallet.


RESULT:
![Screenshot (439)](https://user-images.githubusercontent.com/72209443/166325497-785b846b-1010-43bb-97be-91fbd72e8de6.png)


Wallet balance in this case should be 130, as default balance is 100 and we won the bet of amount 30.


BALANCE:
![Screenshot (440)](https://user-images.githubusercontent.com/72209443/166325930-69ea3d39-96df-4c72-bb26-177f4b59ebaf.png)



