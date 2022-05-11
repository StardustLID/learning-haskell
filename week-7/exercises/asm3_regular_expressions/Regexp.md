A regular expression (RE) is either a character (Lit), a sequence (Seq) or alternative (Or) of two REs, or the iteration (Iter) of a RE. For simplicity, we deviate slightly from standard REs: We omit the empty word, iteration requires at least one repetition, and we match only characters different from '(', '|', '+', and ')'.

**(a)** Define a type `Regexp` for the abstract syntax trees of REs using the constructors (Lit, Seq, Or, Iter) mentioned above.

**(b)** Write a function `str2regexp :: String -> Regexp` that parses a RE (given as a String) into its abstract syntax tree. Use the following grammar for parsing:

```
Atom      ::= Character | '(' Regexp ')'
Iteration ::= Atom | Atom '+'
Sequence  ::= Iteration | Iteration Sequence
Regexp    ::= Sequence | Sequence '|' Regexp
```

Use the parser combinators from the lecture; they are provided in the module Parsers.

**(c) Headache of the week:** Write a parser generator `regexpParser :: String -> Parser ()`. `regexpParser rex` is a parser that determines whether the RE `rex` matches the input. Write a function `matches :: String -> String -> Bool` that checks whether the RE matches the given string. Examples for matching:

```
Regular expression    matching inputs        non-matching inputs
------------------    -------------------    -------------------
"a(b|c)d"             "abd", "acd"           "abcd", "ad"
"ab+|d(e|f)+gh"       "abb", "deeffegh"      "abab", "dedgh"
```
