--Dounglan Cheung
--dcheun01@syr.edu
--  CIS 252: Lab 3  (Fall 2019)
------------------------------------------------------------
import Data.Char       -- needed for isAlphaNum, etc.
import Lab3Defs        -- needed for various functions
replaceThisTextWithYourAnswer = error "Question not yet answered"
------------------------------------------------------------
--   An example problem 
--         (see the lab writeup for a solution)
--
--  Fill in the blanks so that zero evaluates to 5:
--      zero = ponder ____ ____
--
-- Problem zero is worked out in the lab writeup.
--
zero :: Integer
zero = ponder blank1 blank2
  where
    blank1 = 10
    blank2 = 5

------------------------------------------------------------
--  Fill in the blank so that one evaluates to 9.0:
--      one = sqrt ____
--
one :: Float
one = sqrt blank
  where
   blank = 81

------------------------------------------------------------
--  Fill in the blank so that two evaluates to False:
--      two = isAlphaNum ___
--
two :: Bool
two = isAlphaNum blank
  where
    blank = '?'

------------------------------------------------------------
--  Fill in the blank so that three evaluates to False:
--      three = challenge ___________
--
three :: Bool
three = challenge blank
  where
   blank = 4

------------------------------------------------------------
--  Fill in the blanks so that four evaluates to True:
--      four = perplex ___ ___ ___ 
--
four :: Bool
four = perplex blank1 blank2 blank3 
  where
   blank1 = 14
   blank2 = 29
   blank3 = 60

------------------------------------------------------------
--  Fill in the blanks so that five evaluates to [6,5,4,1]:
--      five = ____ : ____
--
five :: [Integer]
five = blank1 : blank2
  where
   blank1 = 6
   blank2 = [5, 4, 1]

------------------------------------------------------------
--  Fill in the blanks so that six evaluates to True:
--      six = teaser ____ ____
--
six :: Bool
six = teaser blank1 blank2
  where
   blank1 = '1'
   blank2 = 10

------------------------------------------------------------
--  Fill in the blank so that seven evaluates to 25:
--      seven = rebus True ____
--
seven :: Integer
seven = rebus True blank 
  where
   blank = 4

------------------------------------------------------------
--  Fill in the blank so that eight evaluates to "Go SU!":
--      eight = ____ : "o SU!" 
--
eight :: String
eight = blank : "o SU!"
  where
   blank = 'G'

------------------------------------------------------------
--  Fill in the blank so that nine evaluates to [9.0,8.0,7.0]:
--      nine = puzzler ____
--
nine :: [Float]
nine = puzzler blank
  where
   blank = 8.0

------------------------------------------------------------
--  Fill in the blank so that ten evaluates to True:
--      ten = riddle ___ 
--
ten :: Bool
ten = riddle blank
  where
   blank = '!'

------------------------------------------------------------
--  Fill in the blank so that eleven evaluates to [4.2,4.2,4.2,3.7]:
--      eleven = gnarl ____ 4.2
--
eleven :: [Float]
eleven = gnarl blank 4.2
  where
   blank = 11

------------------------------------------------------------
--  Fill in the blank so that twelve evaluates to True:
--      twelve = not (twister ____)
--
twelve :: Bool
twelve = not (twister blank)
  where
   blank = 3

------------------------------------------------------------
--  Fill in the blanks so that thirteen evaluates to 25:
--      thirteen = rebus (challenge ____) (ponder ___ ____ )  
thirteen :: Integer
thirteen = rebus (challenge blank1) (ponder blank2 blank3)
  where
   blank1 = 51
   blank2 = 8
   blank3 = 2