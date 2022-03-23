module PropLogic where

-- define the data type Prop a here
data Prop a = Var a | Not (Prop a) | And (Prop a) (Prop a) | Or (Prop a) (Prop a)

foldProp
  :: (a -> b)
    -> (b -> b)
    -> (b -> b -> b)
    -> (b -> b -> b)
    -> Prop a
    -> b
foldProp var neg conj disj = go
  where
    go (Var x) = var x
    go (Not x) = neg (go x)
    go (And x y) = conj (go x) (go y)
    go (Or x y) = disj (go x) (go y)

evalProp :: (a -> Bool) -> Prop a -> Bool
evalProp v = foldProp v not (&&) (||)

propVars :: Eq a => Prop a -> [a]
propVars (Var x) = [x]
propVars (Not x) = propVars x
propVars (And x y) = propVars (Or x y)
propVars (Or x y) = uniq (propVars x ++ propVars y)
  where uniq [] = []
        uniq (x:xs) = x : uniq (filter (/= x) xs)

satProp :: Eq a => Prop a -> Bool
satProp (Not (Not x)) = satProp x
satProp (Not (And x y)) = satProp (Or (Not x) (Not y))
satProp (Not (Or x y)) = satProp (And (Not x) (Not y))
satProp (And x y) = or [all (evalProp (const v)) [x, y] | v <- [True, False]]
satProp (Or x y) = or [evalProp (const v) p | v <- [True, False], p <- [x, y]]
satProp _ = True

instance (Show a) => Show (Prop a) where
  show (Var x) = show x
  show (Not x) = "(Not " ++ show x ++ ")"
  show (And x y) = "(" ++ show x ++ " && " ++ show y ++ ")"
  show (Or x y) = "(" ++ show x ++ " || " ++ show y ++ ")"
