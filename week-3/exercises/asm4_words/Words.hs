module Words where

-- (a)
split :: Char -> String -> [String]
split d s = case break (== d) s of
  (a, _:b) -> a : split d b 
  (a, _)   -> [a]

-- (b)
isSpace :: Char -> Bool
isSpace ' ' = True
isSpace _ = False

toWords :: String -> [String]
toWords s = case dropWhile isSpace s of
  "" -> []
  s' -> w : toWords s''
        where (w, s'') = break isSpace s'

-- (c)
countWords :: String -> Int
countWords x = length (toWords x)
