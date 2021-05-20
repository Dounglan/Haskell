--Dounglan Cheung
--dcheun01@syr.edu
--10.9.19
import Data.Char
--e1
--removes the characters in the given string
zap :: Char -> String -> String
zap ch cs = [c | c <- cs, c /= ch ]

--e2
--returns characters that only occur once in the string, (zap function and `elem` can help solve)
--use elem to test if it shows up on list again, then zap the char off the list, otherwise add the single char to the recursion
solos :: String -> String
solos [] = []
solos (c:cs)
    | elem c cs = solos (zap c cs)
    | otherwise = c: solos cs

--e3
--check how many characters from string 1 to string 2, then used zapped version and recurse, otherwise
catalog :: String -> String -> [(Char,Int)]
catalog [] _ = []
catalog (c:cs) (str:strs) = (c, tot) : catalog (zap c cs) (str:strs)
      where
        tot = sum [1 | str <- strs, c == str]

--e4
--pta
--check if characters from s1 = s2, if yes, true, otherwise false, (ex. music w/ musician = True)
prefix :: String -> String -> Bool
prefix [] ys = True  --empty string "" is a prefix, sub- sequence, and substring of every string. Likewise, every string is a prefix, subsequence, and substring of itself.
prefix xs [] = False
prefix (x:xs) (y:ys)
    | x == y = prefix xs ys
    | otherwise = False

--ptb
--letters from string1 are in string 2 is true (ex.music w/ computer science = True)
subseq :: String -> String -> Bool
subseq [] ys = True
subseq (x:xs) (y:ys)
    | elem x ys = subseq xs ys
    | otherwise = False

--ptc
--is string1 a prefix of string 2? if no, take off a character, now prefix again, then is 1 a prefix to 2? if yes, it's true
substring :: String -> String -> Bool
substring [] ys = True
substring xs [] = False
substring xs (y:ys)
    | prefix xs (y:ys) = True 
    | otherwise = substring xs ys

--ptd
subsequence :: String -> [String]
subsequence [] = [""]
subsequence (x:xs) = add x (subsequence xs) ++ subsequence xs

add :: Char -> [String] -> [String]
add c [] = []
add c (y:ys) = (c:y): add c ys 
