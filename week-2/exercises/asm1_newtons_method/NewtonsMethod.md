# Recap of Newton's Method

* Draw tangent line
* Improve the x every iteration

## Derivation

$y = f'(x_{n})(x - x_{n}) + f(x_{n})$

Put $(x, y) = (x_{n+1}, 0)$,

$x_{n+1} = x_{n} - \frac{f(x_{n})}{f'(x_{n})}$

## Square Root Example

$f(x) = x^{2} - i, f'(x) = 2x$

$x_{n+1} = x_{n} - \frac{x^{2} - i}{2x} = \frac{x_{n} + i/x_{n}}{2}$

Change of notation:

$y_{n+1} = \frac{y_{n} + x/y_{n}}{2}$
