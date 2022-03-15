import Prelude hiding (gcd)

type DList a = [a] -> [a]

dempty :: DList a
dempty = \ys -> ys

dsingle :: a -> DList a
dsingle x = \ys -> x : ys

infixr 5 `dappend`

dappend :: DList a -> DList a -> DList a
dappend xs ys = \zs -> xs (ys zs)

fromList :: [a] -> DList a
fromList xs = \ys -> xs ++ ys

toList :: DList a -> [a]
toList xs = xs []


type Log = [(Integer, Integer)]

gcdLog :: Integer -> Integer -> Log -> (Integer, Log)
gcdLog x y log
  | x == y    = (x, log')
  | x > y     = gcdLog (x-y) y log'
  | otherwise = gcdLog x (y-x) log'
  where
    log' = log ++ [(x, y)]


type DLog = DList (Integer, Integer)

gcdLog' :: Integer -> Integer -> Log -> (Integer, Log)
gcdLog' x y log = (z, toList log')
  where
    (z, log') = gcdDLog x y (fromList log)

    gcdDLog :: Integer -> Integer -> DLog -> (Integer, DLog)
    gcdDLog x y log
      | x == y = (x, log')
      | x > y  = gcdDLog (x-y) y log'
      | True   = gcdDLog x (y-x) log'
      where
        log' = log `dappend` dsingle (x, y)

-- For example, try gcdLog' 16 20 []
