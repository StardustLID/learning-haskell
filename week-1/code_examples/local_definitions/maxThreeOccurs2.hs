-- 2. Turn the `where` blocks into ` let ... in ...` expressions.
maxThreeOccurs2 :: Int -> Int -> Int -> (Int, Int)

maxThreeOccurs2 n m p =
  let
    max3 a b c = max a (max b c)
    maxVal = max3 n m p
    maxCount = count maxVal n m p
  in (maxVal, maxCount)


count val n m p =
  let isval x
        | x == val = 1
        | otherwise = 0
  in isval n + isval m + isval p
