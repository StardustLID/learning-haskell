module Tree where

data Tree t = Leaf | Node t (Tree t) (Tree t)

bfs :: Tree t -> [t]
-- bfs x = aux [x]
bfs = aux . (:[])
  where
    aux [] = []
    aux (Leaf:xs) = aux xs
    aux ((Node x l r):xs) = x : aux (xs ++ [l, r])
    

sortedTree :: Ord t => Tree t -> Bool
sortedTree x = isBST x Leaf Leaf
  where
    isNode Leaf = False
    isNode _ = True
    getRoot (Node x _ _) = x
    isBST Leaf _ _ = True
    isBST root@(Node x a b) l r
      | isNode l && x <= getRoot l = False
      | isNode r && x >= getRoot r = False
      | otherwise = isBST a l root && isBST b root r
