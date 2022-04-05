module NQueens where

-- Implement a function that generates all possible board assignments.

generate :: Int -> [[Int]]
generate n = aux n
  where
    aux 1 = [[x] | x <- [1..n]]
    aux m = [x:xs | x <- [1..n], xs <- aux (m-1)]

-- Implement a function that tests whether a given assignment is valid.

test :: [Int] -> Bool
test xs = aux [] [] [] xs
  where
    getUpDiag ys = filter (> 0) (map pred ys)
    getDownDiag ys = filter (<= length xs) (map succ ys)
    aux _ _ _ [] = True
    aux rows upDiag downDiag (y:ys)
      | any (y `elem`) [rows, upDiag, downDiag] = False
      | otherwise = aux (y:rows) (getUpDiag (y:upDiag)) (getDownDiag (y:downDiag)) ys

naivequeens :: Int -> [[Int]]
naivequeens n = filter test $ generate n


{-
  Headache of the week:
  Implement a function that solves this n queens problem in a more efficient way
  such that partial assignments get tested (whether they may be a valid full
  assignment) as early as possible. 
-}

queens :: Int -> [[Int]]
-- NOT really partial check. Will come back to finish this later
queens n = filter test' (generate' n)
  where
    generate' n = aux n
      where
        aux 1 = [[x] | x <- [1..n]]
        aux m = [x:xs | x <- [1..n], xs <- aux (m-1), diffRows x xs]
        diffRows x xs = x `notElem` xs
    test' xs = aux [] [] xs
      where
        getUpDiag ys = filter (> 0) (map pred ys)
        getDownDiag ys = filter (<= length xs) (map succ ys)
        aux _ _ [] = True
        aux upDiag downDiag (y:ys)
          | any (y `elem`) [upDiag, downDiag] = False
          | otherwise = aux (getUpDiag (y:upDiag)) (getDownDiag (y:downDiag)) ys