The function `concatMap :: (a -> [b]) -> [a] -> [b]` is defined as:
```
concatMap f = concat . map f
```

Another possible definition is based on `foldr` assuming that aux and e are defined appropriately.
```
concatMap' f = foldr aux e
  where aux = ...
        e   = ...
```

Give definitions for aux and e such that `concatMap = concatMap'`.