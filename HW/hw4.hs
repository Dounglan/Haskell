--Dounglan Cheung
--dcheun01@syr.edu
--9.25.19
import Data.Char
--e1
--returns the list obtained by placing each ele- ment of xs into its own list. Ex) listify [1,2,8,3,5] returns [[1],[2],[8],[3],[5]],
listify :: [a] -> [[a]]
listify [] = []
listify (x:xs) = [x] : listify xs

--e2
--returns list obtained by “flipping” order of components in ps. Ex.flipPairs [(’C’,True), (’I’,False), (’S’,False)]. returns [(True,’C’), (False,’I’), (False,’S’)].
flipPairs :: [(a,b)] -> [(b,a)]
flipPairs [] = []
flipPairs ((x,y):ps) = (y,x) : flipPairs ps

--e3
--returns the string obtained by converting every lowercase letter in str to uppercase & vice versa; nonalphabetic characters remain unchanged
flipCases :: String -> String
flipCases [] = []
flipCases (fs:str)
    | isUpper fs == True = toLower fs : flipCases str
    | otherwise = toUpper fs : flipCases str

--e4
--returns a list containing all pairs of “neigh-boring” elements from xs. For example, neighbors [3,5,2,9] returns [(3,5),(5,2),(2,9)], whereas neighbors "abcde" returns [(’a’,’b’),(’b’,’c’),(’c’,’d’),(’d’,’e’)].
neighbors :: [a] -> [(a,a)]
neighbors [] = []
neighbors (x:[]) = []
neighbors (x:y:xs) = (x,y) : neighbors (y:xs)

--e5
replace :: Integer -> a -> [a] -> [a]
replace n s [] = []
replace n s (w:ws)
     | n <= 0 = (w:ws)
     | otherwise = s: replace (n-1) s ws

--e6

scrabblePoints :: [(Char, Integer)]
scrabblePoints = [('a',1), ('b',3), ('c',3), ('d',2), ('e',1), ('f',4), ('g',2), ('h',4), ('i',1), ('j',8), ('k',5), ('l',1),  ('m',3), ('n',1), ('o',1), ('p',3), ('q',10), ('r',1), ('s',1), ('t',1), ('u',1), ('v',4), ('w',4), ('x',8), ('y',4), ('z',10)]
--pt.a
--returns 'a' = 1
getValue :: Char -> [(Char, Integer)] -> Integer
getValue ch [] = 0
getValue ch ((x,y) : xs)
    | x == ch = y
    | otherwise = getValue ch xs

--pt.b
--returns the number that the string contains
scoreWord :: String -> Integer
scoreWord [] = 0
scoreWord (s:st) = (getValue s scrabblePoints) + scoreWord st

--pt.c
atLeast :: Integer -> [(Char, Integer)] -> [Char]
atLeast n [] = []
atLeast n ((a,b) :xs)
    | n <= b = a : atLeast (n) xs
    | otherwise = atLeast n xs

--pt.d
update :: Char -> Integer -> [(Char, Integer)]
                          -> [(Char, Integer)]
update c n [] = [(c,n)]
update c n ((x,y) : xs)
    | c == x = update c (n) xs
    | otherwise = (x,y) : update c n xs