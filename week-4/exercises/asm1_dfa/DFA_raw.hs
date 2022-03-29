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
alphabet = undefined

initial :: DFA a -> State
initial = undefined

transition :: DFA a -> (State -> a -> State)
transition = undefined

finalState :: DFA a -> State -> Bool
finalState = undefined

{-
   Please indicate briefly why using accessor functions is useful.
   More readable, no tuple pattern matching needed
   ...
-}

accepts :: DFA a -> Word a -> Bool
accepts = undefined

lexicon :: Alphabet a -> Int -> [Word a]
lexicon = undefined

language :: DFA a -> Int -> [Word a]
language = undefined

-- Try to use map, foldl, foldr, filter and/or list comprehensions.