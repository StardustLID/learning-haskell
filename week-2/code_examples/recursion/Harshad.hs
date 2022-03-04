module Harshad where

isHarshad :: Int -> Bool
isHarshad n = n `mod` sumDigits n == 0
    where
        sumDigits 0 = 0
        sumDigits x = x `mod` 10 + sumDigits (x `div` 10)
