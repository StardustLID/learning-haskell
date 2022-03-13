-- MT 2018a Q2 Triangular Numbers: my answer
triangular :: Int -> Bool
triangular n = go n 1
    where
        go 0 _ = True
        go x y
            | x >= y = go (x - y) (y + 1)
            | otherwise = False

-- MT 2018a Q2 Triangular Numbers: master solution
triangular' :: Int -> Bool
triangular' n = go 1 0
    where
        go x y
            | x > n = False -- index > number
            | x + y == n = True -- index + accumulator == number
            | otherwise = go (x + 1) (x + y)

-- MT 2018b Q2 Lazy Caterer's Numbers: master solution
lazycat :: Int -> Bool
lazycat n = go 1 0
    where
        go x y
            | x > n = False -- index > number
            | y + 1 == n = True -- prev triangle number + 1 == number
            | otherwise = go (x + 1) (x + y)