module Complex where

-- Write your implementation of complex numbers here.

re :: (Double, Double) -> Double
re (a, b) = a

im :: (Double, Double) -> Double
im (a, b) = b

conj :: (Double, Double) -> (Double, Double)
conj (a, b) = (a, -b)

add :: (Double, Double) -> (Double, Double) -> (Double, Double)
add (a, b) (a', b') = (a + a', b + b')

mult :: (Double, Double) -> (Double, Double) -> (Double, Double)
mult (a, b) (a', b') = (a * a' - b * b', a * b' + a' * b)

absv :: (Double, Double) ->  Double
absv (a, b) = sqrt (a*a + b*b)

main :: IO ()
main = do
  putStrLn "Enter your complex number's real component:"
  a <- getLine
  putStrLn "Enter your complex number's imaginary component:"
  b <- getLine
  putStrLn ("Your complex number's absolute value is: " ++
    show (absv (read a :: Double, read b :: Double)))