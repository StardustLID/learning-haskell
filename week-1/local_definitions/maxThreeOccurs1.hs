-- 1. Make all helper definitions local to `maxThreeOccurs`.
maxThreeOccurs1 :: Int -> Int -> Int -> (Int, Int)

maxThreeOccurs1 n m p = (maxVal, maxCount)
  where
    max3 a b c = max a (max b c)
    maxVal = max3 n m p
    maxCount = count maxVal n m p
      where count val n m p = isval n + isval m + isval p
              where
                isval x
                  | x == val = 1
                  | otherwise = 0
