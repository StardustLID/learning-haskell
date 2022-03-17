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

twoComp :: (c -> d) -> (a -> b -> c) -> a -> b -> d
f `twoComp` g = \x y -> f (g x y)

skProd :: Vector -> Vector -> Int
skProd v w = sum (zipWith (*) v w)

skProduct = sum `twoComp` zipWith (*)

vecMult :: Matrix -> Vector -> Vector
vecMult m w = [skProd v w | v <- m]

matMult :: Matrix -> Matrix -> Matrix
matMult m1 m2 = [vecMult m1 v | v <- m2]