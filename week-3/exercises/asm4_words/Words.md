(a) Define a function `split :: Char -> String -> [String]` that splits a string, which consists of parts separated by a separator character, into a list of strings. Examples:
```
  split '#' "foo##goo" = ["foo","","goo"]    
  split '#' "#" = ["",""]
```

(b) Define a function `toWords :: String -> [String]` that takes a string and creates a list of the words in that string. A word is a string consisting of consecutive non-whitespace characters. A single character is already a word, but at least one character is required, so no empty words. Whitespace is the delimiter between words and does not show up in the resulting list. Do not use the `words` function from the Prelude in this task. Examples:
```
  toWords "This is a sentence." = ["This","is","a","sentence."]    
  toWords " lots of white " = ["lots","of","white"]
```

(c) Define a function `countWords :: String -> Int` that counts the number of words in a string.