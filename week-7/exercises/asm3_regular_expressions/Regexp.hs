module Regexp where 

import Parsers

-- (a) define the type Regexp here
data Regexp = Lit Char | Seq Regexp Regexp | Or Regexp Regexp | Iter Regexp deriving (Show, Eq)

-- (b)

str2regexp :: String -> Regexp
str2regexp s = completeParse expr s
  where
    atom = lit ||| pexpr
      where
        lit = do x <- sat (not . (`elem` "()+|"))
                 return (Lit x)
        pexpr = do string "("
                   e <- expr
                   string ")"
                   return e
    iter = atom ||| do a <- atom
                       string "+"
                       return (Iter a)
    sequ = iter ||| do i <- iter
                       s <- sequ
                       return (Seq i s)
    regexp = sequ ||| do s <- sequ
                         string "|"
                         e <- expr
                         return (Or s e)
    expr = atom ||| iter ||| sequ ||| regexp

-- (c)

-- TODO: this is the only assignment that I can't solve on my own :(

regexpParser :: String -> Parser ()
regexpParser = undefined

matches :: String -> String -> Bool
matches = undefined