-- Extend the data types so that expressions can contain
-- multiplication and division
data Expr = Lit Int | Add Expr Expr | Sub Expr Expr | Mul Expr Expr | Div Expr Expr
    deriving (Show, Eq)

-- Create Expr values corresponding to the expressions
-- (5 - 3) + 2 and 5 - (3 + 2)
e1 = Add (Sub (Lit 5) (Lit 3)) (Lit 2)
e2 = Sub (Lit 5) (Add (Lit 3) (Lit 2))

-- Write a function that evaluates an expression.
eval :: Expr -> Int
eval (Lit n) = n
eval (Add e1 e2) = eval e1 + eval e2
eval (Sub e1 e2) = eval e1 - eval e2
eval (Mul e1 e2) = eval e1 * eval e2
eval (Div e1 e2) = eval e1 `div` eval e2

-- Write a fold function for expressions.
foldExpr
    :: (Int -> a) -- Lit
        -> (a -> a -> a) -- Add
        -> (a -> a -> a) -- Sub
        -> (a -> a -> a) -- Mul
        -> (a -> a -> a) -- Div
        -> Expr
        -> a
foldExpr lit add sub mul div = go
    where
        go (Lit v) = lit v
        go (Add v w) = add (go v) (go w)
        go (Sub v w) = sub (go v) (go w)
        go (Mul v w) = mul (go v) (go w)
        go (Div v w) = div (go v) (go w)

-- Use the fold function to reimplement the expression evaluator
evalExpr' = foldExpr id (+) (-) (*) div

-- Write a function that returns the largest literal in an expression.
getMax = foldExpr id max max max max