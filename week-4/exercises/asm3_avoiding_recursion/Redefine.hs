module Redefine where

{-
   In this exercise you are required to adapt the following function
   definitions of f, g and h such that foldl, foldr, zip, zipWith, filter,
   curry, uncurry, etc. will be used. That means, your task is to modify the
   lines 11-12, 16-20 and 24-29.
-}

f :: [[a]] -> [a]
f [] = []
-- f (x:xs) = reverse x ++ f xs
f xs = foldr partialRev [] xs
  where partialRev ys = (reverse ys ++)

g :: Eq a => [a] -> [a] -> [a]
-- g [] _ = []
-- g _ [] = []
-- g (x:xs) (y:ys)
--         | x == y = x : g xs ys
--         | otherwise = g xs ys
-- g xs ys = map fst (filter (\(x, y) -> x == y) (zip xs ys))
g xs ys = map fst (filter (uncurry (==)) (zip xs ys))


h :: [Int] -> Int
h = aux 0
  where
      -- aux z [] = z
      -- aux z (x:xs)
      --   | even x = aux (1 + z) xs
      --   | otherwise = aux z xs
      aux z xs = length (filter even xs)