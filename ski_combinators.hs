{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Redundant lambda" #-}
{-# HLINT ignore "Use id" #-}
{-# HLINT ignore "Use const" #-}

-- I combinator: identity function
i :: p -> p
i = \x -> x
-- i x = x
-- i = id

-- K combinator: constant function
k :: p1 -> p2 -> p1
k = \x y -> x
-- k x y = x
-- k = const

-- S combinator: substitution operator
s :: (t1 -> t2 -> t3) -> (t1 -> t2) -> t1 -> t3
s = \x y z -> x z (y z)
-- s x y z = x z (y z)

sk :: (t3 -> p2) -> t3 -> t3
sk = s k

-- S K K = I
skk :: p1 -> p1
skk = sk k