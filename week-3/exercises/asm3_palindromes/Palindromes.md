Write a function `palindromes :: [String] -> [String]` that gets a list l of strings and returns a list of all strings `s = v ++ w` where `v` and `w` are strings in `l` and `s` is a palindrome.

Example: for the input `[riseto, han, votesir, nah, isetov]`, the output is `[risetovotesir, hannah, votesirisetov, nahhan]`.

Use only one defining equation with a list comprehension as its right-hand side. You may use the pre-defined function `reverse :: String -> String` from the Prelude.