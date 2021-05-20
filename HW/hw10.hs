--Dounglan Cheung
--dcheun01@syr.edu
--hw10
--11.20.19
import Data.Char
getInteger :: IO Integer
getInteger = do line <- getLine
                return (read line :: Integer)
getFloat :: IO Float
getFloat = do line <- getLine
              return (read line :: Float)

--e1
--(i) prompts the user to enter their name, (ii) reads in a line of text (in theory, the user’s name), (iii) displays a message greeting the user by the name entered, and then (iv) produces/returns the length of the line of text entered by the user
greet :: IO Int
greet = do putStr ("What is your name? ")
           name <- getLine
           print ("Hello, " ++ name)
           return (length name)

--e2
--returns a program that displays the string cs vertically (i.e. 1 character per line, w/ no quote marks), with all letters in uppercase.
shoutVertical :: String -> IO ()
shoutVertical [] = return ()
shoutVertical (c:cs) = do ch <- putChar (toUpper c)
                          putChar '\n'
                          shoutVertical cs
--e3
--returns a program that repeatedly prompts the user to guess a number and then reads in that user’s guess (an Integer), until the user enters num. (With each unsuccessful guess, the program prompts the user to try again.) The program yields an Int reflecting the number of guesses the user made.
guess :: Integer -> IO Int
guess num = do putStr ("Please guess a number: ")
               n <- getInteger
               if n /= num
                  then do putStr ("Nope, try again. Please guess a number: ")
                          n <- guess num
                          return (n+1)
                  else return (1)

--e4
--reads in a series of Integers, stopping only when it reads in the value 0. It then returns a list of all of the nonzero values it read (in the order they were read). Your program should not display any messages to the standard output
nonzeros :: IO [Integer]
nonzeros = do x <- getInteger
              if x == 0
                 then return []
              else do y <- nonzeros
                      return (x:y)

--e5
--reads in an unbounded series of Floats, stopping only when it reads in the value -1. It then returns a pair consisting of (i) the number of values read (not counting the -1) and (ii) the sum of those values (again, ignoring the -1).
calcSum :: IO (Float, Float)
calcSum = do x <- getFloat
             if x == -1
                then return (0.0, 0.0)
             else do (y,z) <- calcSum --y is the total number of floats ,z is the sum of the floats
                     return (y+1, x+z)

--e6
--reads in an unbounded series of Floats, stopping only when it reads in the value -1. It then displays the average of those values (ignoring the -1), along with an informative message; if -1 is the only value entered, then the program displays a message indicating that no average was calculated.
average :: IO ()
average = do putStrLn ("Please enter the numbers to average (-1 to terminate): ")
             (a,b) <- calcSum --(a,b) is a pair of floats bc the return value of calcSum
             if a == 0  --because calcSum, if you enter -1, then it returns 0 which will be 'a' 
                then putStrLn ("There were no values to average.")
             else do print ("The average is " ++ show (b/a)) 
