module SquareRoot where

eps :: Double
eps = 0.001

improve :: Double -> Double -> Double
improve x y = (y + x / y) / 2

goodEnough :: Double -> Double -> Bool
goodEnough y new_y = abs ((new_y - y) / new_y) < eps

root :: Double -> Double
root x = root' x 1
  where
    root' x y
      | goodEnough y new_y = new_y 
      | otherwise = root' x new_y
      where new_y = improve x y

main :: IO ()
main = do
  putStrLn "Compute the root of:"
  input <- getLine
  let x = read input :: Double
  if (x >= 0) then putStrLn ("Square root: " ++ show (root x)) else error ""
  main
