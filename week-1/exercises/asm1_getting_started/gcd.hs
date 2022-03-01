-- This file is loaded automatically if you start GHCi in Code Expert.
-- Feel free to add your own definitions!

-- Computes the greatest common divisor (gcd) of two numbers.
myGcd :: Int -> Int -> Int
myGcd x y
  | x == y    = x
  | y > x     = myGcd y x
  | otherwise = myGcd (x - y) y
  
-- (a)
-- GCD of 139629 and 83496 is 21.
-- If one of the arguments is negative, the function runs indefinitely
-- because WLOG, for x > 0, y < 0, the first argument of myGcd increases after every iteration.
-- Similarly, if one of the argument is zero,
-- the other argument remains unchanged after every iteration.

-- (b)
absGcd :: Int -> Int -> Int
absGcd x y = myGcd (if x >= 0 then x else (-x)) (if y >= 0 then y else (-y))
-- The function does not terminate if exactly one argument is 0.

-- (c)
absGcd1 :: Int -> Int -> Int
absGcd1 x y = myGcd (abs x) (abs y)

-- (d)
-- `myGcd 3.6 7.2` raises an error because the Doubles are not converted to Ints.
-- There is a type mismatch.
myGcdDouble :: Double -> Double -> Double
myGcdDouble x y
  | x == y    = x
  | y > x     = myGcdDouble y x
  | otherwise = myGcdDouble (x - y) y
-- `myGcdDouble 3.6 7.2` outputs 3.6.
-- `myGcd 3.6 7.1999999999999` does not terminate.
