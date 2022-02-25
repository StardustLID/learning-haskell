The purpose of this assignment is to introduce you to writing Haskell programs using the interactive environment GHCi. In principle, you could develop your Haskell programs directly in the editor on Code Expert. However, Code Expert only runs your programs with the prepared test cases. In GHCi, you can run your own test cases or evaluate and type-check expressions interactively, which greatly eases debugging.

We suggest reading the [documentation for Code Expert](https://docs.expert.ethz.ch/students/), which also contains a list of useful keyboard shortcuts. Please ask your teaching assistant if you need further help.

## Using GHCi
You have two options:

1. You can run GHCi on Code Expert by clicking the Interactive Shell (>_) button in the Console panel. This instance of GHCi has access to all files in the current project, so you can load your code directly from Code Expert. **Note that you have to restart GHCi after you have changed a file!**
2. Alternatively, install Haskell on your computer. The official Haskell website has instructions for all major operating systems. You will have to copy the assignments' files to your machine (and back to submit your solution). We recommend using a decent text editor that supports syntax highlighting for editing Haskell files.
Important prompt commands in GHCi are

```
:?                -- help
:load <filename>  -- load the file <filename> (shorthand :l <filename>)
:reload           -- repeat the last load command (shorthand :r)
:quit             -- quit (shorthand :q)
```
See the [GHCi user guide](https://downloads.haskell.org/ghc/latest/docs/html/users_guide/ghci.html) for an in-depth explanation of all available commands.

## Warm-up exercises
Read the file `gcd.hs` in this project and then solve the tasks below. You do not have to hand in your solution for this first assignment. Instead, refer to the file `gcd_solution.hs` and compare it with your answers.

(a) Use GHCi to calculate the greatest common divisor of `139629` and `83496`. What happens if one of the arguments of the function `myGcd` is negative? What happens if one of the arguments is zero?

(b) Generalize the `myGcd` function to a function `absGcd :: Int -> Int -> Int` such that ` absGcd x y = myGcd x' y'`, where x' is the absolute value of x, and y' is the absolute value of y. Does your function terminate for all inputs?

(c) Haskell has already many predefined functions. These functions are defined in the Prelude, which is automatically loaded when you start GHCi. Look at the [Prelude's documentation](https://hackage.haskell.org/package/base-4.11.1.0/docs/Prelude.html) and check whether you can simplify your previous solutions by using some of the predefined functions.

In general, it helps to know the functions in the Prelude by heart. Always have a look at the available functions when you solve future exercises!

(d) You can query GHCi for the type of an expression with the prompt command `:type` (or `:t` for short). For example, GHCi will output `Int -> Int -> Int` if you type in `:t myGcd`.

What happens if you apply `myGcd` to the decimal numbers `3.6` and `7.2`? Change the type of myGcd to `Double -> Double -> Double`. What is now the output of `myGcd 3.6 7.2`? What is the output of `myGcd 3.6 7.1999999999999`?