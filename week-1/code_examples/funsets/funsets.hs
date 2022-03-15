type FunSet = Int -> Bool

-- Indicates whether a set contains a given element.
-- why set before element?
-- contains :: Int -> FunSet -> Bool 
-- contains el set = set el

-- better:
contains :: FunSet -> Int -> Bool
contains set = set

-- Returns the set of the one given element.
singletonSet :: Int -> FunSet
-- singletonSet el = (\x -> x == el)
singletonSet el = (== el)

-- Returns the union of the two given sets.
union :: FunSet -> FunSet -> FunSet
union set1 set2 el = set1 el || set2 el

-- Returns the intersection of the two given sets.
intersect :: FunSet -> FunSet -> FunSet
intersect set1 set2 el = set1 el && set2 el

-- Returns the difference of the two given sets.
diff :: FunSet -> FunSet -> FunSet
diff set1 set2 el = set1 el && set2 el

-- Given a bound b, a set s, and a property 'p'
-- Returns whether all integers
-- in the range [-b, b] within `s` satisfy `p`.
forall :: Int -> FunSet -> (Int -> Bool) -> Bool
-- forall b set p = aux (-b)
--     where aux y | y == b = True
--                 | intersect set p y = aux (y+1)
--                 | not (set y) = aux (y+1)
--                 | otherwise = False
forall b set p = all p (filter set [-b..b])
-- forall b set p = all (\el -> p el || not (set el)) [-b..b]
-- testing code:
-- forall 4 (union (singletonSet 2) (singletonSet 3)) even
-- False
-- forall 4 (union (singletonSet 2) (singletonSet 0)) even
-- True

-- Given a bound b, a set s, and a property 'p'
-- Returns whether there exists a bounded integer within `s`
-- that satisfies `p`.
exists :: Int -> FunSet -> (Int -> Bool) -> Bool
-- exists b set p = not (forall b set (\x -> not (p x)))
exists b set p = not (forall b set (not . p))