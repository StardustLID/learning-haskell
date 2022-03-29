module DFA where

import Prelude hiding (Word)

type State = Int
type Alphabet a = [a]
type DFA a = 
  ( Alphabet a             -- alphabet
  , State                  -- initial state
  , State -> a -> State    -- transition function
  , State -> Bool)         -- test for final state
type Word a = [a]

alphabet :: DFA a -> Alphabet a
alphabet (x, _, _, _) = x

initial :: DFA a -> State
initial (_, x, _, _) = x

transition :: DFA a -> (State -> a -> State)
transition (_, _, x, _) = x

finalState :: DFA a -> State -> Bool
finalState (_, _, _, x) = x

{-
   Please indicate briefly why using accessor functions is useful.
   More readable, no tuple pattern matching needed
   ...
-}

accepts :: DFA a -> Word a -> Bool
accepts dfa word = finalState dfa (foldl (transition dfa) (initial dfa) word)

lexicon :: Alphabet a -> Int -> [Word a]
lexicon _ 0 = [[]]
lexicon xs n = [x:ys | x <- xs, ys <- lexicon xs (n - 1)]

language :: DFA a -> Int -> [Word a]
language dfa n = filter (accepts dfa) (lexicon (alphabet dfa) n)

-- Try to use map, foldl, foldr, filter and/or list comprehensions.