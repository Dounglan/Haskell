--Name: Doung Lan Cheung
--Email:dcheun01@syr.edu
--ex1
commonDivisor :: Integer -> Integer -> Integer -> Bool
commonDivisor q m n = (mod m q) == (mod n q)

--ex2
nand :: Bool -> Bool -> Bool
nand e1 e2 = not(e1 && e2)

--ex3
distance :: Float -> Float -> Float -> Float -> Float
distance x1 y1 x2 y2 = sqrt((x1 - x2)^2 + (y1 - y2)^2)

--ex4
onCircle :: Float -> Float -> Float -> Float -> Float -> Bool
onCircle a b x y r = sqrt((x - a)^2 + (y - b)^2) == r

--ex5
howMany :: Bool -> Bool -> Integer
howMany b1 b2
    | b1 && b2 = 2 
    | b1 || b2 = 1
    | otherwise = 0
        
--ex6
numDays :: Integer -> Integer
numDays year
    | mod year 400 == 0 = 366
    | mod year 4 == 0 && not (mod year 100 == 0) = 366
    | year < 0 = (-1)
    | otherwise = 365