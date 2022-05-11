We represent multivariate polynomials over variables of type `a` with Integer co-efficients using the following Haskell type.

```
data Monomial a = Mono Integer [a]
 deriving (Eq, Ord, Show)
 
type Poly a = [Monomial a]
```

For example, the Haskell value `[Mono 3 ["x","y"], Mono 1 ["y","y"]]` of type `Poly String` is a representation of the multivariate polynomial $3xy + y^{2}$. Note that polynomials need not be in normal form, that is, `[Mono 3 ["x"], Mono 4 ["x"]]` is an acceptable representation of $7x$.

**(a)** Write a Haskell function `evalPoly :: (a -> Integer) -> Poly a -> Integer` such that `evalPoly f p` computes the value of the polynomial `p` where every variable `x` is replaced by the value `f x`.

**(b)** We represent symbolic arithmetic expressions using the following Haskell type.

```
data SymbExpr a
= Var a
| Lit Integer
| Add (SymbExpr a) (SymbExpr a)
| Mul (SymbExpr a) (SymbExpr a)
```

Define the fold function

```
foldSymbExpr :: (a -> b) -> (Integer -> b) -> (b -> b -> b) -> (b -> b -> b) -> SymbExpr a -> b
```

for symbolic arithmetic expressions represented using `SymbExpr a`.

**(c)** Give the induction scheme for structural induction over `SymbExpr a` as an inference rule.

**(d)** Use the `foldSymbExpr` function from (b) to write a Haskell function

```
toPoly :: SymbExpr a -> Poly a
```

that converts an arithmetic expression to an equivalent multivariate polynomial. For example, the arithmetic expression $(3x+y)y$ can be converted to the multivariate polynomial $3xy + y^{2}$. Note that you do not have to prove the correctness of your solution.
