Formulas in propositional logic are built from variables of type `a`, negation, conjunctions, and disjunctions.

(a) Specify a Haskell data type `Prop a` to represent formulas in propositional logic. The constructors should be called `Var`, `Not`, `And`, and `Or`.

(b) Implement a Haskell function `foldProp` that folds a proposition using separate folding functions for variables, negations, conjunctions, and disjunctions. The arguments of `foldProp` must be in the canonical order: i.e., first the folding functions (in the above order) followed by the folded proposition.

(c) Implement a Haskell function `evalProp :: (a -> Bool) -> Prop a -> Bool` using the `foldProp` function from (b) such that `evalProp v p` evaluates the formula p under the variable assignment v.

(d) Implement a function `propVars :: Eq a => Prop a -> [a]` using the `foldProp` function from (b) such that `propVars p` computes the list of variables occurring in formula p. Make sure that each variable occurs only once in the list.

(e) Implement a function `satProp :: Eq a => Prop a -> Bool` that checks whether a given formula is satisfiable, i.e., whether there is a variable assignment under which the formula evaluates to `True`. Note: Your implementation does not need to be efficient.

(f) Instantiate the type class `Show` for propositional formulas. Variables should be printed without `Var` and `And` and `Or` should be displayed infix as `&&` and `||`. Enclose all non-atomic subformulas in parentheses.

Example:

```
show (Not (And (Var 'A') (Var 'B'))) = "(Not ('A' && 'B'))"
```