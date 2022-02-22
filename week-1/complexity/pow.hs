-- naive
pow _ 0 = 1
pow n e = n * pow n (e - 1)

-- efficient
pow' _ 0 = 1
pow' n e | e `mod` 2 == 0 = n' * n'
         | otherwise = n * n' * n'
  where n' = pow' n (e `div` 2)
