In this assignment you will develop a Haskell program based on Newton’s method for calculating the square root of a nonnegative `Double`. Since the type `Double` is of limited precision, your square root function `root :: Double -> Double` will compute the square root up to some suitably small error `eps :: Double`. The tests assume that `eps` is equal to `0.001`.

(a) Write a function `improve :: Double -> Double -> Double` that improves your approximation. The first argument is the number whose square root you want to calculate and the second argument is the approximation you have calculated so far. Newton’s method says that if $y_{n}$ is an approximation of $\sqrt{x}$ then a better approximation is

(b) Write a function `goodEnough :: Double -> Double -> Bool` that checks whether your approximation is in the error bound `eps`. The first argument is the prior approximation $y_{n}$ and the second argument is the current approximation $y_{n+1}$. More precisely, $y_{n+1} is good enough compared to $y_{n}$ if

$|\frac{y_{n+1} - y_{n}}{y_{n+1}}| < eps$

(c) Use the functions `improve` and `goodEnough` to write the function `root`. As the first approximation you can use $y_{0} = 1$.

(d) Now extend this to work with I/O. That is, write a main function that asks the user for a number to compute the root of. Your main function then prints out the resulting square root for positive input, using the definition of `root` above, and starts over. For negative input your program aborts.

Example interaction:

```
Compute the root of:
1
Square root: 1.0
Compute the root of:
1024
Square root: 32.0
Compute the root of:
-7
```
