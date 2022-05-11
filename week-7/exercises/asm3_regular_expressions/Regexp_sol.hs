module Regexp where

import Parsers

-- (a) Abstract syntax trees for regular expressions:

data Regexp = Lit Char 
            | Seq Regexp Regexp 
            | Or Regexp Regexp 
            | Iter Regexp 

-- Pretty printing of regular expressions via the type class `Show`: 

instance Show Regexp where
  show (Lit c)     = [c]
  show (Seq r1 r2) = show r1 ++ show r2
  show (Or r1 r2)  = "(" ++ show r1 ++ "|" ++ show r2 ++ ")"
  show (Iter r)    = "(" ++ show r ++ ")+"


-- (b) Parsing of regular expressions.

-- Atom ::= Character | '(' Regexp ')'
pAtom :: Parser Regexp
pAtom = pCharacter ||| parenRegexp
  where pCharacter  = do c <- sat (`notElem` "(|+)")
                         return $ Lit c
        parenRegexp = do char '('
                         r <- pRegexp
                         char ')'
                         return r

-- Iteration ::= Atom | Atom '+'
pIteration :: Parser Regexp
pIteration = pAtom ||| pStar
  where pStar = do r <- pAtom
                   char '+'
                   return $ Iter r

-- Sequence ::= Iteration | Iteration Sequence
pSequence :: Parser Regexp
pSequence = pIteration ||| pSeq
  where pSeq = do r1 <- pIteration
                  r2 <- pSequence
                  return $ Seq r1 r2

-- Regexp ::= Sequence | Sequence '|' Regexp
pRegexp :: Parser Regexp
pRegexp = pSequence ||| pOr
  where pOr = do r1 <- pSequence
                 char '|'
                 r2 <- pRegexp
                 return $ Or r1 r2

str2regexp :: String -> Regexp
str2regexp = completeParse pRegexp


-- (c)

{-
  The function regexp2parser constructs from a regular expression
  (represented by an element of the algebraic data type Regexp) a parser
  of the type Parser (), which consists of a function of the type 
  String -> [((),String)].
  
  Note: The type () is called the unit type. It consists of the single 
  element ().
-}

regexp2parser :: Regexp -> Parser ()
regexp2parser (Lit c)     = do char c
                               return ()
regexp2parser (Seq r1 r2) = do regexp2parser r1
                               regexp2parser r2
regexp2parser (Or r1 r2)  = regexp2parser r1 ||| regexp2parser r2
regexp2parser (Iter r)    = do many1 (regexp2parser r)
                               return ()

{-
  The function regexpParser turns a regular expression (now represented
  by a string) into a parser.
-}

regexpParser :: String -> Parser ()
regexpParser = regexp2parser . str2regexp

{-
  The function matches parses the regular expression (second argument)
  rexp, which is given as a string, and translates it first to the
  corresponding representation of the type Regexp. From the obtained
  element in Regexp, the function matches then constructs a parser,
  which it uses to check whether the string (the first argument)
  matches with the regular expression.
-}

matches :: String -> String -> Bool
matches input rexp = any (== ((), "")) (parse parser input)
  where parser = regexpParser rexp

-- Some simple test cases:

tests = [matches "abd" "a(b|c)d",        matches "acd" "a(b|c)d",
         matches "abcd" "a(b|c)d",       matches "ad" "a(b|c)d",
         matches "abb" "ab+|d(e|f)+gh",  matches "deeffegh" "ab+|d(e|f)+gh",
         matches "abab" "ab+|d(e|f)+gh", matches "dedgh" "ab+|d(e|f)+gh",
         matches "abbdabcbccbd" "(a(b|c)+d)+",
         matches "abbdabcbccbdad" "(a(b|c)+d)+"]