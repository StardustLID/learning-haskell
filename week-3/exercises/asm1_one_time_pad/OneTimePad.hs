module OneTimePad where

otp :: [Bool] -> [Bool] -> [Bool]
-- (a)
-- otp msg key = map xor (zip msg key)
  -- where xor (x, True) = not x
  --       xor (x, False) = x

-- (b)
otp = zipWith xor
  where xor x True = not x
        xor x False = x