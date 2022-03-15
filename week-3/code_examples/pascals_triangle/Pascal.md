Pascal's triangle is an infinite triangle consisting of positive integers of the form
```
          1
        1   1
      1   2   1
    1   3   3   1
  1   4   6   4   1
```
and so on. It is constructed recursively:

* The first row contains a single 1.
* Any other row contains a 1 at the very left and at the very right, and every other element is the sum of its adjacent numbers one row above.

Write each one function that takes a non-negative number $n$ and

* computes the list of elements in the $n$-th row (starting at zero);
* computes the sum of elements in the $n$-th row.