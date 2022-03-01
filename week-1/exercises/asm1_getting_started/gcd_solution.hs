-- Load this file by typing ":l gcd_solution.hs" in GHCi.

-- Computes the greatest common divisor (gcd) of two numbers.
myGcd :: Int -> Int -> Int
myGcd x y
  | x == y    = x
  | y > x     = myGcd y x
  | otherwise = myGcd (x - y) y

{- (a)

myGcd 139629 83496 evaluates to 21.

If one of the arguments is negative then myGcd does not terminate in
general. However, if both arguments are equal then myGcd terminates
because of the first case split "| x == y = ...".  If the arguments
are not equal and one is negative then we can assume without loss of
generality that the first argument is larger than the second argument
because of the second case split "| x > y = ...". Hence, y is
negative.  In the third case split we apply myGcd to (x - y) and y.
This means that the first argument of myGcd becomes larger and the
second argument remains the same.  From this it follows that myGcd
does not terminate.

Similar arguments as above can be given if one of the arguments is 0.
-}

-- (b)

absGcd :: Int -> Int -> Int
absGcd x y = myGcd x' y'
  where
    x' = if x >= 0 then x else -x
    y' = if y >= 0 then y else -y

{-
absGcd does not terminate for all inputs. For example, absGcd 0 4 does
not terminate.
-}

-- (c)

absGcd1 :: Int -> Int -> Int
absGcd1 x y = myGcd (abs x) (abs y)

{-
An alternative solution uses the gcd function from the Prelude, which is
defined also for negative inputs:
-}

absGcd2 :: Int -> Int -> Int
absGcd2 = gcd

-- Note that absGcd2 0 4 terminates.

-- (d)

myGcdDouble :: Double -> Double -> Double
myGcdDouble x y
  | x == y    = x
  | y > x     = myGcdDouble y x
  | otherwise = myGcdDouble (x - y) y

{-
myGcdDouble 3.6 7.2 evaluates to 3.6 and myGcdDouble 3.6 7.1999999999999
does not terminate, because floating point arithmetic makes equality
comparisons very fragile, so better avoid them.
-}
