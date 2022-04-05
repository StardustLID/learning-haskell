module NQueens where

generate :: Int -> [[Int]]
generate n = go n
  where
    go 0 = [[]]
    go k = [q:qs | q <- [1..n], qs <- go (k-1)]

{-
test for more than one queen in a row: easy
test for more than one queen in a diagonal: this is done by computing
  the difference in row (those are the entries in our list) and comparing
  it to the column difference, which we get by zipping with the list [1..]
  to the remainder of the list in question.
then test recursively for the remainder of the list
-}

test :: [Int] -> Bool
test [] = True
test (q:qs) = row q qs && diag q (zip [1..] qs) && test qs
  where 
    row q = all (/=q) 
    diag q [] = True
    diag q ((colDiff, row):qs) = (abs(q - row) /= colDiff) && diag q qs

naivequeens n = filter test $ generate n

{-
For the headache note a number of things. The order in which the tests
and generates happen are crucial. For list comprehensions with
multiple generators, the generators to the right are evaluated for
every element in the leftmost generator. Switching the order of the
generators means that we perform the recursive call only once.

Moreover, the earlier positions can be discarded, the better. For this
reason our improved solution first computes all VALID boards that are
one column smaller, then adds the possible assignments for the queen
in question and tests those again right away.
-}

queens n = genQueens n
  where 
    genQueens 0 = [[]]
    genQueens k = [q:qs | qs <- genQueens (k-1), q <- [1..n] , test q qs]
    test q qs = row q qs && diag q (zip [1..] qs)
    row q qs = all (/=q) qs 
    diag q [] = True
    diag q ((colDiff, row):qs) = (abs(q - row) /= colDiff) && diag q qs