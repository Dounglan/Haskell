--Dounglan Cheung
--dcheun01@syr.edu
--hw7
--23.10.19
import Data.Char

--e1
--places ’i’ "mississippi" should return [2,5,8,11].
places :: Eq a => a -> [a] -> [Integer]
places x ys = map fst (filter (\(a,b) -> x == b) (zip [1..] ys)) 

--e2
--returns a boolean indicating whether the two functions return identical results for all values in that list
equalOn :: Eq b => (a -> b) -> (a -> b) -> [a] -> Bool
equalOn f g vals = null (filter (\x -> f x /= g x) vals)

--e3 
--given a list of non-negative Integers, produces a histogram string for the sequence
-- returns (histogram [5,3,1,4]; "*****\n***\n*\n****\n".
histogram :: [Integer] -> String 
histogram xs = concat (map f xs)
    where
      f :: Integer -> String
      f i = ['*' | x <- [1..i]] ++ "\n"   

--e4
-- mySort p xs sorts the list xs according to the binary predicate p. For example, mySort (<=) xs sorts xs in ascending order (just like the original isort!), whereas mySort (>=) xs sorts xs in descending order
isort :: Ord a => [a] -> [a] 
isort [] = []
isort (x:xs) = ins x (isort xs)
    where
      ins y [] = [y] 
      ins y (z:zs)
          | y <= z = y:z:zs
          | otherwise = z: (ins y zs)
--p = predicate 
mySort :: Ord a => (a -> a -> Bool) -> [a] -> [a]
mySort p [] = []
mySort p (x:xs) = ins x (mySort p xs)
    where
      ins y [] = [y] 
      ins y (z:zs)
          | p y z = y:z:zs
          | otherwise = z: (ins y zs)

--e5
--returns a list containing all of the integer ze- roes of the function f whose values are between 0 and limit, inclusive. (If limit is less than 0, then the function should return the empty list.) 
zeroes :: (Integer -> Integer) -> Integer -> [Integer]
zeroes f limit = [ x | x <- [0..limit], f x == 0] 

--e6
--returns a list that looks like xs except that the leftmost item in xs that satisfies predicate p is replaced by val. (If none of the elements of xs satisfy p, then xs is returned.)
--similar to #4
changeFirst :: (a -> Bool) -> a -> [a] -> [a]
changeFirst p val [] = []
changeFirst p val (x:xs)
    | p x = (val : xs)
    | otherwise = x: (changeFirst p val xs)

--e7
--partA
--English word “art” is translated to “artway” whereas “school” is translated to “oolschay”.
--Hint:The functions takeWhile and dropWhile (or span) are useful here. Also, because of toLower, you will need to import Data.Char.
translate :: String -> String 
translate cs
    | null front = cs ++ "way"
    | otherwise = back ++ "ay" 
    where
      isConsonant :: Char -> Bool
      isConsonant c = not (elem (toLower c) "aeiou")
      (front, back) = (takeWhile isConsonant cs, dropWhile isConsonant cs)

--partB
pigLatin :: String -> String
pigLatin cs = unwords (map translate (words (cs)))