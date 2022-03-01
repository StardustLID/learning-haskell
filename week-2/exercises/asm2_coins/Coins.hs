module Coins where

cntChange :: Int -> Int
cntChange x = cntChangeWith x denominations
  where denominations = [500, 200, 100, 50, 20, 10, 5]
        cntChangeWith 0 _ = 1
        cntChangeWith x (d:[]) = if (x `mod` d == 0) then 1 else 0
        cntChangeWith x denoms@(d:ds) = (cntChangeWith x ds) +
          if (x >= d) then (cntChangeWith (x-d) denoms) else 0