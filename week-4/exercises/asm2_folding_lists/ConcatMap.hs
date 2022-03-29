module ConcatMap where

import Prelude hiding (sum)

concatMap' f = foldr aux e
  where aux x = (f x ++)
        e   = []