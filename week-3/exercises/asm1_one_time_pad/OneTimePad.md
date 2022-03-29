The *One-Time Pad* is a provably secure encryption scheme provided the key is only used once. A message of length `n` is encrypted with a key of the same length by performing a bit-wise XOR. Every bit of the key is set independently of all others to True with probability 0.5. The encrypted message is decrypted by performing bit-wise XOR with the same key again. Here we represent messages and keys as lists of Booleans, i.e., they have type `[Bool]`.

(a) Implement a function `otp` that takes a message and a key and performs the operation described above. You may assume that the message and the key have the same length. Do you see a way to do this using `zip` and `map`?

Example: With `key = [False, False, True]` and `msg = [False, True, True]`, we have `otp msg key = [False, True, False]`.

(b) Is there a single function that can be used instead of `zip` and `map`? (Tip: Use Hoogle to search for a function with the right type.)