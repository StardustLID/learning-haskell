Complex numbers can be represented as pairs of real numbers: the first coordinate of a pair represents the real part of the complex number and the second coordinate represents the imaginary part. In Haskell, we can use pairs of type `Double` for complex numbers.

Note: For programming tasks such as this one, click the Test button in the Console panel to compile the code and run our predefined tests. But always ask yourself whether (and why) your code is correct. The tests cannot find all possible bugs!

(a) Write functions `re :: (Double, Double) -> Double` and `im :: (Double, Double) -> Double` that return the real part and the imaginary part of a complex number, respectively.

(b) Write a function `conj :: (Double, Double) -> (Double, Double)` that conjugates a complex number. Refer to the corresponding [Wikipedia article](https://en.wikipedia.org/wiki/Complex_conjugate) if you don't remember this operation.

(c) Write functions `add` and `mult` for addition and multiplication of two complex numbers, and write a function `absv` that returns the absolute value of a complex number.

(d) Write a main function with I/O so the user can enter a complex number and receive its absolute value. Example interaction, where the user types 3 and 4:

```
Enter your complex number's real component:
3.0
Enter your complex number's imaginary component:
4.0
Your complex number's absolute value is: 5.0
```

To pass the automatic test cases, your program must adhere exactly to the given format.