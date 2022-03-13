-- MT 2019a Q2 Collapse: my solution (should be correct)
collapse :: Int -> Int
collapse n
    | q == 0 = n
    | q `mod` 10 == r = collapse q
    | otherwise = r + 10 * collapse q
    where
        q = n `div` 10
        r = n `mod` 10

-- MT 2019a Q2 Collapse: master solution
collapse' :: Int -> Int
collapse' n
    | n < 10 = n
    | d' == d = n'
    | otherwise = 10 * n' + d
    where
        n' = collapse' (n `div` 10)
        d = n `mod` 10
        d' = n' `mod` 10