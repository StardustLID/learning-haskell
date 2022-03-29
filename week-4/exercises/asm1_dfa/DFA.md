In this exercise, we consider deterministic finite automata (DFA). A DFA ($Q, \Sigma, q_{0}, \delta, F$), $over an alphabet $\Sigma$ consists of a finite set of states $Q$, an initial state $q_{0}$, a transition function $\delta: Q \times \Sigma \to Q$ and a set of final states $F$. The transition function is extended from letters to words (i.e., finite lists of letters) as usual: $\delta(q, []) = q$ and $\delta(q, x: w) = \delta(\delta(q, x), w)$. The automaton accepts a word $w$ iff $\delta(q_{0}, w) \in F$. We assume that the letters are taken from some unspecified type `a`. We represent the states as integers and leave the set of states implicit.

```
type State = Int
type Alphabet a = [a]
type DFA a =
  ( Alphabet a           -- alphabet
  , State                -- initial state
  , State -> a -> State  -- transition function
  , State -> Bool)       -- test for final state
type Word a = [a]
```

(a) Write accessor functions for the various components of the DFA.

```
alphabet :: DFA a -> Alphabet a
initial :: DFA a -> State
transition :: DFA a -> (State -> a -> State)
finalState :: DFA a -> State -> Bool
```

Use these functions in the subsequent parts of the exercises instead of pattern matching. What is the advantage of using accessor functions?

(b) Write a function `accepts :: DFA a -> Word a -> Bool` that returns whether the given automaton accepts the given word. Use a combinator like `foldr` or `foldl` instead of explicit recursion.

(c) Write a function `lexicon :: Alphabet a -> Int -> [Word a]` that returns all words over the alphabet of the given length. For example, for the alphabet of the characters 'a' and 'b', we have `lexicon "ab" 0 = [""]` and `lexicon "ab" 2 = ["aa", "ab", "ba", "bb"]`. The order of the words does not matter. There must not be duplicate words unless the given alphabet contains duplicate letters.

(d) Write a function `language :: DFA a -> Int -> [Word a]` that outputs the list of all words of the given length accepted by the given automation.

Hint: You may find functions `map`, `foldl`, `foldr`, `filter` or list comprehensions useful. The whole exercise can be solved without explicit recursion.
