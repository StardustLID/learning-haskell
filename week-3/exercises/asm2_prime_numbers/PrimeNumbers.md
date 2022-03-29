A natural number $n \ge 2$ is prime if its only divisors are $1$ and $n$. In other words, $n$ is prime if the set $\{x | 1 \le x \le n, n \mod x = 0\}$ is equal to $\{1, n\}$.

(a) Use list comprehension to turn this definition into an executable primality test. You may need to modify the definition for efficiency.

(b) Write a function that returns the list of all primes up to a given number .

(c) Write a function that returns the list of the first `m` primes.