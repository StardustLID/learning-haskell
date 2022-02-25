{- Indentation errors -}

f x = x
  g y = y

h x | x > 2 = 0
| otherwise = 5

count val n m p = isval n + isval m + isval p
        where
      isval x
    | x == val = 1
    | otherwise = 0

main = do
  let x = 5
  in return x

{- Type errors -}

foo x = x + True

i x y   | x > y = i (x - y)
        | y > x = i (y - x)
        -- | otherwise = x

-- Pattern matching failure
maxi tuple
    | tuple == (x, y) && x > y = x
    | tuple == (x, y) && y > x = y

{- Logic errors -}

fact 0 = 0
fact n = n * fact (n - 0)

j x y   | x > y = j (x - y) y
        | y < x = j (y - x) y
        | otherwise = 1
