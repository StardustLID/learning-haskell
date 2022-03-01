Write a Haskell function `cntChange :: Int -> Int` that computes the number of ways to change any given amount of money (expressed in cents) by using Swiss Franc coins. The order in which the coins are used does not matter. For example to change 3 francs using 1-franc coins and 2-franc coins, there are only two ways: (1,2) and (1,1,1). The combination (2,1) does not count as a different one. Recall that Swiss Franc coins come in the following denominations: [500 cents, 200 cents,100 cents, 50 cents, 20 cents, 10 cents, 5 cents].

**Hint**: Think recursively. The number of ways to change the amount $a$ using the denominations (kinds of coins) $d_{1}, d_{2}, \ldots, d_{n}$ is equal to the sum of

* the number of ways to change $a$ using $d_{2}, \ldots, d_{n}$, that is all but the first kind of coin, and
* the number of ways to change $a - d_{1}$ using all $n$ denominations.

Test your program thoroughly!