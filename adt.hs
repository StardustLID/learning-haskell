-- Consider binary trees with positive Int labels at the 

-- Define a datatype Heap of binary trees with Int labels at the nodes.
data Heap = Leaf | Node Int Heap Heap

-- Define the canonical fold on Heap
foldHeap :: b -> (Int -> b -> b -> b) -> Heap -> b
-- foldHeap fleaf fnode Leaf = fleaf
-- foldHeap fleaf fnode (Node x h1 h2) = fnode x (foldHeap fleaf fnode h1) (foldHeap fleaf fnode h2)
foldHeap fleaf fnode = go
    where
        go Leaf = fleaf
        go (Node x h1 h2) = fnode x (go h1) (go h2)

-- Write a function ... that returns the least label in a skew heap.
-- It should return 0 if and only if the given skew heap does not contain any labels.
-- The function many assume that the argument is a skew heap.
getMin :: Heap -> Int
getMin Leaf = 0
getMin (Node x _ _) = x

-- Write a recursive function merge :: Heap -> Heap -> Heap which merges two skew heaps p and q.
-- The resulting tree should be a new skew heap whose labels are exactly all the labels of p and q
-- respecting their multiplicity.
merge :: Heap -> Heap -> Heap
merge h1 Leaf = h1
merge Leaf h2 = h2
merge h1@(Node x x1 x2) h2@(Node y y1 y2)
    | x < y = Node x x1 (merge x2 h2)
    | otherwise  = Node y y1 (merge h1 y2)
-- Note: we don't care about balance here.

-- Define a function delMin :: Heap -> Heap that removes the least label from a skew heap (if there is any label).
delMin :: Heap -> Heap
delMin Leaf = Leaf
delMin (Node _ h1 h2) = merge h1 h2

-- Consider the following declarations:
mapT :: (Int -> Int) -> Heap -> Heap
mapT f Leaf = Leaf
mapT f (Node x t1 t2) = Node (f x) (mapT f t1) (mapT f t2)

sumT :: Heap -> Int
sumT Leaf = 0
sumT (Node x t1 t2) = x + sumT t1 + sumT t2

msumT :: (Int -> Int) -> Heap -> Int -> Int
msumT f Leaf z = z
msumT f (Node x h1 h2) z = msumT f h1 (msumT f h2 (f x + z))

-- Show that msumT f t 0 = sumT (mapT f t)