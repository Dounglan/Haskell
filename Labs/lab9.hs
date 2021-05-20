---------------------------------------------------------------
--  Lab 9  (CIS 252: Fall 2019)
--     Name:Dounglan Cheung
--     Email:dcheun01@syr.edu
---------------------------------------------------------------
import Data.Char   
---------------------------------------------------------------
-- Example from the lab writeup
---------------------------------------------------------------
enigma w = do y <- getLine              -- line 1
              print (w:y)               -- line 2
              return (length y)         -- line 3
---------------------------------------------------------------
-- Your problems 
---------------------------------------------------------------
replaceMe = error "replace with your own code"

-- :t one should give       IO ()
one = putChar ('a')    -- replace with your answer

-- :t two should give       (IO Char, IO String)
two = (getChar, getLine)         -- replace with your answer

-- :t three should give    [IO String]
three = [getLine]      -- replace with your answer

-- :t four should give     IO [String] 
four = sequence [getLine]     -- replace with your answer

-- :t five should give     (Char -> Bool, IO Char)
five = (isUpper, getChar)       -- replace with your answer

-- :t six should give      IO (Char,String)
six =  getChar >> return ('a',['a'])       -- replace with your answer

-- :t seven should give    [Char] -> IO (Bool, Int)
seven = mystery 
    where
      mystery abcd = do  efg <- getChar
                         putStrLn [efg, efg, '?', efg]
                         mno <- getLine
                         putStrLn (map toUpper mno)
                         print (length mno)
                         qrst <- sequence [getChar]
                         putStrLn  (abcd ++ qrst)
                         return (isUpper efg ,length mno)