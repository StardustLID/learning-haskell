Consider the n-Queens problem, where we want to generate all possible solutions of *n* queens being distributed on an *n*-by-*n* chess board so that none of them can attack any other queen. Note that a queen can attack horizontally, vertically and diagonally.

Let us encode a solution of this problem as a list of `Int`, where the `i`-th entry in the list denotes the row number of the queen in column `i`.

Consider the generate and test approach. First generate all possible board assignments, then test whether each represents a valid assignment. Define the functions `generate` and `test` such that you can use them to define the `naivequeens` function as shown:

```
generate :: Int -> [[Int]]
test :: [Int] -> Bool
naivequeens n = filter test $ generate n
```

Test your definition for numbers between 4 and 8.

**Headache of the week:** Now define a new function that solves the Queens problem in a similar way, generating assignments and testing them, but such that partial assignments get tested as early as possible whether they can lead to valid full assignments. Thus, as much computation as possible can be discarded. Improvement should be obvious and you should be able to solve the problem for 3-5 extra queens compared to before in the same time.
