---------------------------------------------------------------
--  Lab 7  (CIS 252: Fall 2019)
--  Name: Dounglan Cheung
--  Email: dcheun01@syr.edu
---------------------------------------------------------------
import Data.Char   

data Meal = Lunch String Integer Char
          | Dinner Int Bool
             deriving (Show,Eq)
---------------------------------------------------------------
-- Your problems 
---------------------------------------------------------------
replaceMe = error "replace with your own code"
-- :t zero should give (String/[Char], [a] -> Int
zero = ("cis252", length [])

-- :t one should give       ([Bool], Char, Int)
one = ((2 > 3):[],'a', length [])          -- replace with your answer

-- :t two should give       Meal
two = (Dinner (length []) False)        -- replace with your answer

-- :t three should give    (Char -> Bool, [String])
three = (isLower, ["cislab7c"])      -- replace with your answer

-- :t four should give     [Char -> Char]
four = [toUpper]       -- replace with your answer

-- :t five should give     [Char] -> [Bool]
five = map isAlpha       -- replace with your answer

-- :t six should give      Char -> Meal
six = Lunch "problem6" 6        -- replace with your answer

-- :t seven should give     [[Bool] -> [Meal]]
seven = [map (Dinner 7)]       -- replace with your answer

-- :t eight should give     String -> String
eight = ("problem8"++)       -- replace with your answer

-- :t nine should give       a -> b -> a
nine = (\a b -> a)         -- replace with your answer

-- :t ten should give      Int -> Meal
ten = (\x -> Dinner x True)     -- replace with your answer

-- :t eleven should give  (Char -> Char) -> String
eleven = (\x -> x 'a' : "alright" ) -- replace with your answer


