module FileSystemEntries where

data FSEntry = Folder String [FSEntry] | File String String

-- (a)

fFSE :: (String -> [a] -> a) -> (String -> String -> a) -> FSEntry -> a
fFSE folder file = go
  where
    go (File name text) = file name text
    go (Folder name fss) = folder name (map go fss)

-- (b)

number :: FSEntry -> Int
number (File _ _) = 1
number (Folder _ fss) = 1 + sum (map number fss)

count :: Char -> FSEntry -> Int
count ch (File _ text) = length (filter (== ch) text)
count ch (Folder _ fss) = sum (map (count ch) fss)

-- (c)

paths :: FSEntry -> [String]
paths (File name _) = [name]
paths (Folder name fss) = [name ++ '/' : path | path <- concatMap paths fss]
