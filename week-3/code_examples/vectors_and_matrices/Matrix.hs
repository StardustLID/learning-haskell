type Vector = [Int]
type Matrix = [[Int]]

vecAdd :: Vector -> Vector -> Vector
vecAdd = zipWith (+)

matAdd :: Matrix -> Matrix -> Matrix
matAdd = zipWith vecAdd

vconst :: Int -> Int -> Vector
vconst 0 _ = []
vconst n x = x : vconst (n - 1) x


unit :: Int -> Matrix
unit 0 = []
unit n = (1 : vconst (n - 1) 0) : map (0:) (unit (n - 1))

tr :: Matrix -> Matrix
tr [] = []
tr [v] = map (\x -> [x]) v
tr (v:vs) = zipWith (:) v (tr vs)

twoComp :: (c -> d) -> (a -> b -> c) -> a -> b -> d
f `twoComp` g = \x y -> f (g x y)

skProd :: Vector -> Vector -> Int
skProd v w = sum (zipWith (*) v w)

skProduct = sum `twoComp` (zipWith (*))

vecMult :: Matrix -> Vector -> Vector
vecMult m v = map (`skProd` v) (tr m)

matMult :: Matrix -> Matrix -> Matrix
matMult m1 m2 = map (vecMult m1) m2
