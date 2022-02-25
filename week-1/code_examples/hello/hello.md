_Haskell says hello!_

Since `Hello.hs` contains a Haskell program with a `main :: IO ()` function, you can run it without GHCi. On Code Expert, click either the Run or Test button to start the program. You can type your name directly in the console.

If you want to compile the program on your own machine, copy the program to a local file `Hello.hs` and then run the following commands from a terminal. This assumes that you have installed GHC.

```
ghc Hello.hs
./Hello
```

It is still possible to interact with the program in GHCi. After loading the file, `main` is available just like any other definition. If you evaluate `main`, the program will run inside GHCi.