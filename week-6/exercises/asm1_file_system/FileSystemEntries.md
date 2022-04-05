Consider the following algebraic data type representing a file system entry.
```
data FSEntry = Folder String [FSEntry] | File String String
```

A file system entry is either a folder consisting of a name and a (possibly empty) list of file system entries, or a single file consisting of a name and some text. For example,
```
test = Folder "Home"
        [Folder "Work"
            [File "students.txt" "Alice, Bob",
             File "hint"         "You can use fFSE!"],
         File "Fun" "FMFP"]
```

represents a folder *Home* that contains a subfolder and a file.

(a) Define the Haskell function
```
fFSE :: (String -> [a] -> a) -> (String -> String -> a) -> FSEntry -> a
```

for folding values of type `FSEntry`.

Hint: You may find the function `map :: (a -> b) -> [a] -> [b]` useful.

(b) Define the following Haskell functions using `fFSE`:
* `number :: FSEntry -> Int`; such that `number fs` returns the number of files and folders in `fs` (including `fs`). For example, `number test = 5`.

* `count :: Char -> FSEntry -> Int`; such that `count ch fs` returns the total number of occurrences of the character ch in the text of all files in fs (and its subfolders). For example, `count 'a' test = 1`.

(c) Write the Haskell function `paths :: FSEntry -> [String]` such that `paths fs` returns the list of paths to all files in fs and its subfolders. For example:
```
paths test = ["Home/Work/students.txt","Home/Work/hint","Home/Fun"]
```

More precisely, a path to a file `f` in a file system entry `fs` consists of the names of parent folders of `f` and the name of `f`, separated by `/`, in the order of the tree hierarchy of `fs`.