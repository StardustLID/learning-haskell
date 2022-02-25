This file contains two definitions of the exponentiation function `n^e` over the non-negative integers.
One is much faster than the other.
You can observe this by loading the file in GHCi, typing the command `:set +s` to print timing information, and evaluating the following two expressions:

```
pow  1 1000000
pow' 1 1000000
```

This example shows that it is still important to think about algorithms and their complexity when one uses a functional language.
