module Ex2 where

data Price = Price Integer deriving (Eq, Show)
data Manufacturer = Mini | Mazda | Tata deriving (Eq, Show)
data Airline = PapuAir | CatapultsR'Us | TakeYourChancesUnited deriving (Eq, Show)
data Size = Size Integer deriving (Eq, Show)
data Vehicle = Car Manufacturer Price | Plane Airline Size deriving (Eq, Show)

-- myCar :: Vehicle
myCar = Car Mini (Price 14000)

urCar :: Vehicle
urCar = Car Mazda (Price 20000)

plane :: Vehicle
plane = Plane PapuAir (Size 10)

-- 1 Vehicle
-- 2
isCar :: Vehicle -> Bool
isCar (Car _ _) = True
isCar _ = False

isPlane :: Vehicle -> Bool
isPlane (Plane _ _) = True
isPLane _ = False

-- This
areCars :: [Vehicle] -> [Bool]
areCars = map (\x -> case x of
                      (Car _ _) -> True
                      _ -> False)
-- or
areCars' :: [Vehicle] -> [Bool]
areCars' = map isCar

-- 3
getManu :: Vehicle -> Manufacturer
getManu (Car x _) = x

getSize :: Vehicle -> Size
getSize (Plane _ size) = size


data Example0 = Example0 deriving (Eq, Show)
data Example1 = Example1 Int deriving (Eq, Show)
data Example2 = Example2 String Int deriving (Eq, Show)
