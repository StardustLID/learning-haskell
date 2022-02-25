maxThreeOccurs :: Int -> Int -> Int -> (Int, Int)

maxThreeOccurs n m p = (maxVal, maxCount)
  where
    maxVal = max3 n m p
    maxCount = count maxVal n m p

max3 a b c = max a (max b c)

count val n m p = isval n + isval m + isval p
  where
    isval x
      | x == val = 1
      | otherwise = 0
