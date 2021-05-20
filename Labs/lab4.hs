--Dounglan Cheung
--dcheun01@syr.edu
--sumSquares :: Integer -> Integer
--sumSquares n = sum [m * m | m <- [1..n]]
--countVowels :: String -> Int
--countVowels cs = length [ c | c<- cs, elem c "aeiouAEIOU"
import Data.Char
----------------------------------------------------------------------
-- Task One:
-- For each of the following, uncomment the line and replace the
--   underscores/blanks by your answers.  (In some cases, the 
--   second blank can be deleted completely.)
----------------------------------------------------------------------
-- Generate the list: 
--    [601,602,603,604,605,606,607,608]
one = [w + 600 | w <- [1..8] ]

-- Generate the list: 
--    [False,True,False,True,False,True,False,True]
two = [ even w == True | w <- [1..8] ]

-- Generate the list: 
--    [[2,0,0],[4,0,0],[6,0,0],[8,0,0]]
three = [ (w, 0, 0) | w <- [1..8], even w ]

-- Generate the list: 
--    [(3,True),(6,True),(9,False),(12,False),(15,False)]
four = [ (w*3 , w <=2 ) | w <- [1..8], w < 6  ]

-- Generate the list: 
--    [7,6,5,4,3,2,1,0]
five = [ 8 - w | w <- [1..8] ]

-- Generate the list: 
--    [[1],[1,2],[1,2,3],[1,2,3,4],[1,2,3,4,5]]
six = [ [1..w]  | w <- [1..8], w<6 ]
----------------------------------------------------------------------
-- Task Two:
-- For each of the following functions, uncomment the definitions
--   and replace the underscores/blanks with your code.  Don't
--   change anything else.
----------------------------------------------------------------------
addToOdds :: Integer -> [Integer] -> [Integer]
addToOdds k nums = [ k + 400 | k <- nums, odd k ]

letters :: String -> String
letters cs = [ toUpper(x) | x <- cs, isAlpha(x)]