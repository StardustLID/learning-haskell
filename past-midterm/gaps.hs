-- 2022 MT (The one I did!)
gaps :: [Int] -> [[Int]]
gaps [] = []
gaps (x:xs) = xs : [x:ys | ys <- gaps xs]