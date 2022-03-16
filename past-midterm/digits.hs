-- MT 2020a Q2 Digits in Base Nine: my solution = master solution
digitSum :: Int -> Int -> Int
digitSum _ 0 = 0
digitSum n k = n `mod` 9 + digitSum (n `div` 9) (k-1)

-- MT 2020b Q2 Digits in Base Seven: my solution = master solution
digitProd :: Int -> Int -> Int
digitProd 0 _ = 1
digitProd k n = (n `mod` 7) * digitProd (k-1) (n `div` 7)