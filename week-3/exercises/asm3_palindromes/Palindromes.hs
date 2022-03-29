module Palindromes where

palindromes :: [String] -> [String]
palindromes l = [x ++ y | x <- l, y <- l, (x ++ y) == reverse (x ++ y)]
