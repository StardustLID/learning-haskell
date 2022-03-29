module PrimeNumbers where

-- (a)
-- prime :: Int -> Bool
prime x
  | x < 2 = False
  | x == 2 = True
  | otherwise = and [ gcd x y == 1 | y <- 2:[3, 5..(round (sqrt (fromIntegral x)))] ]

-- (b)
primes :: Int -> [Int]
primes m = filter prime [1..m]

-- (c)
firstPrimes :: Int -> [Int]
firstPrimes m = take m (filter prime [1..])