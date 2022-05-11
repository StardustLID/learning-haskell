module Misc where

-- (a)

match :: String -> Bool
match = aux []
  where
    aux [] [] = True
    aux _ [] = False
    aux ys ('(':xs) = aux ('(':ys) xs
    aux ys ('{':xs) = aux ('{':ys) xs
    aux ('(':ys) (')':xs) = aux ys xs
    aux ('{':ys) ('}':xs) = aux ys xs
    aux ys (x:xs)
      | x == ')' || x == '}' = False
      | otherwise = aux ys xs

-- (b)

risers :: Ord a => [a] -> [[a]]
risers [] = []
risers xs = aux xs [] []
  where
    aux [] ys yss = reverse ((reverse ys) : yss)
    aux (x:xs) [] yss = aux xs [x] yss
    aux (x:xs) (y:ys) yss
      | x >= y = aux xs (x:y:ys) yss
      | otherwise = aux xs [x] (reverse (y:ys) : yss)