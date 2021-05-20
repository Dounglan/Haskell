-- Name: Dounglan Cheung
-- Email: dcheun01@syr.edu

myTurn :: Float -> Integer -> (Integer, Bool)
myTurn val num = (num*10, ceiling val > num)
