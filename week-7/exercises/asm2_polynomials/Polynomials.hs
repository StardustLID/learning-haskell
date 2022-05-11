module Polynomials where

data Monomial a = Mono Integer [a]
 deriving (Eq, Ord, Show)
type Poly a = [Monomial a]

data SymbExpr a
  = Var a
  | Lit Integer 
  | Add (SymbExpr a) (SymbExpr a)
  | Mul (SymbExpr a) (SymbExpr a)
  deriving Show

-- (a)

evalPoly :: (a -> Integer) -> Poly a -> Integer
evalPoly f p = sum (map (evalMono f) p)
  where
    evalMono f (Mono c ys) = c * (product (map f ys))

-- (b)

foldSymbExpr :: (a -> b) -> (Integer -> b) -> (b -> b -> b) -> (b -> b -> b) -> SymbExpr a -> b
foldSymbExpr var lit add mul = go
  where
    go (Var x) = var x
    go (Lit x) = lit x
    go (Add x y) = add (go x) (go y)
    go (Mul x y) = mul (go x) (go y)

{- (c)

...

-}

-- (d)

-- toPoly :: SymbExpr a -> Poly a
toPoly :: Eq a => SymbExpr a -> Poly a
toPoly = foldSymbExpr var lit add mul
  where
    var x = [Mono 1 [x]]
    lit x = [Mono x []]
    add x [] = x
    add [] y = y
    -- `add` does not perform normalization
    add ((Mono x xs):xss) ((Mono y ys):yss) = (Mono x xs) : (Mono y ys) : (add xss yss)
    mul [] _ = []
    mul ((Mono x xs):xss) yss = (map (multMono (Mono x xs)) yss) ++ (mul xss yss)
      where multMono (Mono x xs) (Mono y ys) = Mono (x*y) (xs++ys)