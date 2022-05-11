**(a)** Define a Haskell function `match :: String -> Bool` that checks whether all parentheses match. You may assume that `()` and `{}` are the only kinds of parentheses. Note that a string can contain arbitrary letters of type `Char`.

Example: `match "(a{b} cd)()ef" = True` and `match "(xy{z}}" = False`.

**Hint:** Use a stack and represent this stack as a list.

**(b)** Write a function `risers :: Ord a => [a] -> [[a]]` that splits a list `xs :: [a]` into the list of longest non-empty monotonically rising subsequences of `xs`.

Example: `risers [1,3,3,4,1,0,2,6] = [[1,3,3,4],[1],[0,2,6]]`
