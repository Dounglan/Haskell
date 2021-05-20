--Dounglan Cheung
--dcheun01@syr.edu
--10.15.19
--lab6.hs
import Data.Char

--Problem 1
--returns the length of each string into a list of integers
lengths :: [String] -> [Int]
lengths strs = map (length) strs

--Problem 2
--returns a list with a float with its square root of it abs value
roots :: [Float] -> [(Float, Float)]
roots nums = map (\x -> (x, sqrt(abs x))) nums

--Problem 3
--returns a list of odd nums in vals
grabOdds :: [Int] -> [Int]
grabOdds vals = filter (\x -> odd x) vals

--Problem 4
--returns a list of pairs that contain a capital letter
uppers :: [(Char, Integer)] -> [(Char, Integer)]
uppers pairs = filter (\(x, y) -> isUpper x ) pairs

--Problem 5
--returns a list of integers based on r >= 3*k
puzzler :: Integer -> [Integer] -> [Integer]
puzzler k ws = [r+400 | r <- ws, r >= 3*k]

puzzler2 :: Integer -> [Integer] -> [Integer]
puzzler2 k ws = map (\x -> x + 400) (filter (\x -> x >= 3*k) ws)