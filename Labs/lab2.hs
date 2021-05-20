--Dounglan Cheung
--dcheun01@syr.edu
--3.1
simple :: Integer -> Integer -> Integer
simple a b = a + 3*b
--3.2
twoForOne :: Integer -> Integer -> Integer
twoForOne items price
    | items <= 0  || price <= 0 = 0
    | even items = (div items 2) * price
    | otherwise = (1 + (div items 2)) * price
--6
admission :: Integer -> Integer -> Integer
admission adults kids
    | (adults <= 0 || kids < 0) = 0
    | (adults + kids < 8) = adults*65 + kids*49
    | otherwise = (adults + kids)*50

