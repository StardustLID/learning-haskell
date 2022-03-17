type Vector = [Int]
type Matrix = [[Int]]

vecAdd :: Vector -> Vector -> Vector
vecAdd = zipWith (+)

matAdd :: Matrix -> Matrix -> Matrix
matAdd = zipWith vecAdd

vconst :: Int -> Int -> Vector
vconst = replicate

unit :: Int -> Matrix
unit 0 = []
unit n = [[if x == y then 1 else 0 | x <- [1..n]] | y <- [1..n]]

-- this t
transpose :: Matrix -> Matrix
transpose [] = []
transpose [v] = map (: []) v
transpose (v:vs) = zipWith (:) v (transpose vs)

tr :: Matrix -> Matrix
tr = transpose
-- example: tr [[1,2,3],[4,5,6],[7,8,9]]
-- = zipWith (:) [1,2,3] (tr [[4,5,6],[7,8,9]])
-- = zipWith (:) [1,2,3] (zipWith (:) [4,5,6] (tr [[7,8,9]]))
-- = zipWith (:) [1,2,3] (zipWith (:) [4,5,6] (map (: []) [7,8,9]))
-- = zipWith (:) [1,2,3] (zipWith (:) [4,5,6] [[7],[8],[9]])
-- = zipWith (:) [1,2,3] [[4,7],[5,8],[6,9]]
-- = [[1,4,7],[2,5,8],[3,6,9]]

-- extra: trace
-- trace :: Matrix -> Int
-- trace [[]] = 0
-- trace x = [[if x == y then 1 else 0 | x <- [1..n]] | y <- [1..n]]

-- Scalar (dot) product
-- version 1: loop / accumulator
skProd1 :: Vector -> Vector -> Int
skProd1 xs ys = loop xs ys 0
    where
        loop (x:xs) (y:ys) p = loop xs ys (x*y+p)
        loop _ _ p = p

-- version 2: explicit recursion
skProd2 :: Vector -> Vector -> Int
skProd2 (x:xs) (y:ys) = x*y + skProd2 xs ys
skProd2 _ _ = 0

-- version 3: using library functions (abstracted control)
twoComp :: (c -> d) -> (a -> b -> c) -> a -> b -> d
f `twoComp` g = \x y -> f (g x y)

skProd :: Vector -> Vector -> Int
skProd v w = sum (zipWith (*) v w)

skProduct = sum `twoComp` zipWith (*)

vecMult :: Matrix -> Vector -> Vector
vecMult m w = [skProd v w | v <- tr m]

matMult :: Matrix -> Matrix -> Matrix
matMult m1 m2 = [vecMult m1 v | v <- m2]
-- matMult [[4,61,0],[78,8,90],[59,11,-7]] [[31,-58,-10],[66,3,1],[49,25,1]]
-- [[-4990,1317,-5150],[557,4061,263],[2205,3200,2243]]