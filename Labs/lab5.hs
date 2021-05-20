--Dounglan Cheung
--dcheun01@syr.edu
--lab5.hs
--10.8.19

data Species = Flea | Wombat | Turtle | Gnu | Oarfish
               deriving (Eq, Ord, Enum, Show)
mammal :: Species -> Bool
mammal Gnu = True
mammal Wombat = True
mammal _ = False
----------------------------------------------------------------------
-- Problem #1:  Introduce the definition for new datatype Talent
--      (see lab writeup for requirements)
----------------------------------------------------------------------
data Talent = Brawn | Speed | Wits | GoodLuck
              deriving (Eq, Ord, Show)
----------------------------------------------------------------------
data Animal = Critter String Species Talent
              deriving (Eq, Show)
-- some sample Animals (used for examples)
wally, finn, bella :: Animal
wally = Critter "Wallace" Wombat Brawn
finn  = Critter "Finn the Fierce" Flea GoodLuck
bella = Critter "Isabel" Turtle Speed
----------------------------------------------------------------------
-- Add your answer for Problem 2 below this comment (include the type signature for newGnu!)
newGnu = Critter "AgentG" Gnu Wits
----------------------------------------------------------------------
-- A sample function
improve :: Talent -> Animal -> Animal
improve new (Critter name spec tal)
    | new > tal = Critter name spec new
    | otherwise = Critter name spec tal
----------------------------------------------------------------------
-- Problem #3:
----------------------------------------------------------------------
sameTalent :: Animal -> Animal -> Bool
sameTalent (Critter name1 spec1 tal1) (Critter name2 spec2 tal2)
    | tal1 == tal2 = True
    | otherwise = False  
----------------------------------------------------------------------
-- Problem #4
----------------------------------------------------------------------
smaller :: Animal -> Animal -> String
smaller (Critter name1 spec1 tal1) (Critter name2 spec2 tal2)
    | spec2 < spec1 = name2
    | otherwise = "Same species" 

