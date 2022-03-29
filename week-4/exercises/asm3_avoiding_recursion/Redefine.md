Give equivalent definitions for the following primitively recursive functions on lists, without using explicit recursion. That is, use `map`, `foldl`, `foldr`, `zip`, `zipWith`, `filter`, `curry`, `uncurry`, etc.

Define aux explicitly before defining `h`, i.e., give a definition for `aux` that takes `z` as an argument and that is equivalent for all values of `z`.

```
f [] = []
f (x:xs) = reverse x ++ f xs

g [] _ = []
g _ [] = []
g (x:xs) (y:ys)
  | x == y = x : g xs ys
  | otherwise = g xs ys

h = aux 0
  where
    aux z [] = z
    aux z (x:xs)
      | even x = aux (1 + z) xs
      | otherwise = aux z xs
```