--Dounglan Cheung
--dcheun01@syr.edu
--10.16.19
--hw6

--LATEST VERSION
import HW6Defs
--e1
--define defintions of mage1..3, fighter1..4
mage1, mage2, mage3, fighter1, fighter2, fighter3, fighter4 :: Hero
mage1 = Mage 2 Health Potion
mage2 = Mage 4 Wealth Silver 
mage3 = Mage 7 None (Shield 5)
fighter1 = Warrior Brute []
fighter2 = Warrior Brute [Gold, Gold, Silver, Weapon 6, Weapon 3]
fighter3 = Warrior Archer [Potion, Potion, Potion, Silver, Silver, Gold]
fighter4 = Warrior Swordster [Silver, Silver, Gold, Gold, Gold, Potion, Shield 4, Shield 3, Weapon 2] 

--e2
--returns True if it is money, false if not
isMoney :: Item -> Bool
isMoney Silver = True
isMoney Gold = True
isMoney _ = False

--e3 
--return number of silver pieces it costs for hero to buy Item
cost :: Item -> Integer
cost Potion = 3
cost Silver = 1
cost Gold = 3
cost (Shield n) = 2*n
cost (Weapon m) = 1 + 2*m 

--e4
--calculates the default offensive-power level of hero
baseOffense :: Hero -> Integer
baseOffense (Mage p _ _) = p
baseOffense (Warrior Archer _) = 2
baseOffense (Warrior Swordster _) = 3
baseOffense (Warrior Brute _) = 5

--e5 
--calculates the value(expressed in terms of silver pieces)of all gold and silver pieces that hero has
wealth :: Hero -> Integer
wealth (Mage _ _ item)   --check the pouch of mages
    | isMoney item = cost item
    | otherwise = 0
wealth (Warrior _ items) = sum [cost x | x <- items, isMoney x]  --checks pouch for warriors

--e6
--determines whether hero has sufficient wealth to purchase item.
--mage w/ Wealth is able to buy any item with 1 silver piece
canBuy :: Hero -> Item -> Bool
canBuy (Mage p Wealth item) itemA = True
canBuy hero item
    | wealth hero >= cost item = True
    | otherwise = False

--e7 
--boostShields k hero adds k to the defensive-protection level of each shield that hero possesses.
boostShields :: Integer -> Hero -> Hero
boostShields k (Mage p abil (Shield x)) = Mage p abil (Shield (k+x)) 
boostShields k (Warrior style items) = Warrior style [buff a | a <- items]
    where    --helps for shield
      buff :: Item -> Item
      buff (Shield x) = Shield (k + x)
      buff item = item
boostShields k (Mage p abil item) = Mage p abil item --when mage doesn't have shield

--e8 
--heroPower hero calculates the total offensive power of hero
heroPower :: Hero -> Integer
heroPower hero = baseOffense hero + secondaryPow hero

secondaryPow :: Hero -> Integer     --helper for the weapon's power
secondaryPow (Mage _ _ (Weapon n)) = n 
secondaryPow (Mage _ _ _) = 0
secondaryPow (Warrior _ items) = sum [ n | Weapon n <- items]

--e9 (list comprehension/recursion)
--calculates the # of brutes in the list heroes that possess one or more gold pieces
goldBrutes :: [Hero] -> Integer
goldBrutes heroes = sum [ 1 | Warrior Brute items <- heroes, hasGold items]

hasGold :: [Item] -> Bool --recursion to test if the item is in list is Gold, then true. If not, then keep going
hasGold [] = False
hasGold (Gold: items) = True
hasGold (_ : items) = hasGold items