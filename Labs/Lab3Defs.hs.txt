------------------------------------------------------------
--  Lab3Defs.hs
--       Definitions for Lab 3  (CIS 252: Fall 2019)
------------------------------------------------------------

module Lab3Defs where

import Data.Char   -- needed for various Char-related functions

challenge :: Integer -> Bool
challenge y = y > 50 || odd y

gnarl :: Integer -> Float -> [Float]
gnarl s e 
    | s < 6     = [3.7]
    | otherwise = e : gnarl (s-2) e

perplex :: Integer -> Integer -> Integer -> Bool
perplex x y w = (w > 2*y) && (y > 2*x) && (w < 100) && (x > 13)

ponder :: Integer -> Integer -> Integer
ponder x y = (div x y) + (mod x y)

puzzler :: Float -> [Float]
puzzler e = [e+1, e, e-1]

rebus :: Bool -> Integer -> Integer
rebus b k 
    | not b     = k+40
    | k == 0    = -123
    | otherwise = (k+1)^2

riddle :: Char -> Bool
riddle ch =  toLower ch == toUpper ch

teaser :: Char -> Integer -> Bool
teaser d r = even r && isDigit d 

twister :: Integer -> Bool 
twister w = (5*w /= 15)
