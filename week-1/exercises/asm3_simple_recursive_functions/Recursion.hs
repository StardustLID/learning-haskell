module Recursion where

-- Multiply two non-negative numbers. Only use addition/subtraction.
mult :: (Int, Int) -> Int
mult (x, y)
  | x == 0 || y == 0 = 0
  | x < 0 = - mult ((-x), y)
  | y < 0 = - mult (x, (-y))
  | x >= y = mult (y, x)
  | otherwise = y + (mult (x-1, y))

-- Integer part of the base 2 logarithm.
log2 :: Int -> Int
log2 x
  | x == 1 = 0
  | otherwise = 1 + log2 (x `div` 2)

-- Test whether the integer is a prime number.
isPrime :: Int -> Bool
isPrime x
  | x < 2 = False
  | x == 2 = True
  | otherwise = all (== True) [ gcd x y == 1 | y <- [2..x-1] ]
