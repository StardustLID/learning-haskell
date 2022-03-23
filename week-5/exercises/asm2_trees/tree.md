Recall the algebraic data type `Tree a` from the lecture:
```
data Tree a = Leaf | Node a (Tree a) (Tree a)
```

(a) Implement a breadth-first traversal on trees of the data type `Tree a`. Your function should traverse a given tree level by level (from left to right) and return a list with the elements that are stored in the tree.

(b) Write a predicate `sortedTree :: Ord a => Tree a -> Bool` that checks whether a tree is a binary search tree, i.e., for every `Node x l r`, all entries in `l` must be smaller than `x`, and all entries in `r` must be larger than `x`.
