module Pascal where

pascal :: Integer -> [Integer]
pascal 0 = [1]
pascal n = zipWith (+) (0:lastRow) (lastRow ++ [0])
    where lastRow = pascal (n-1)

pascalSum :: Integer -> Integer
pascalSum n = sum (pascal n)
