module Ex1 where

eftBool :: Bool -> Bool -> [Bool]
eftBool False True = [False, True]
eftBool True False = [] -- this is like EnumFromTo 2 1, because True>False
eftBool True True = [True]
eftBool False False = [False]

eftOrd :: Ordering -> Ordering -> [Ordering]
eftOrd LT LT = [LT]
eftOrd LT EQ = [LT, EQ]
eftOrd LT GT = [LT, EQ, GT]
eftOrd EQ LT = []
eftOrd EQ EQ = [EQ]
eftOrd EQ GT = [EQ, GT]
eftOrd GT GT = [GT]
eftOrd GT _  = []

eftInt :: Int -> Int -> [Int]
eftInt x y
  | x > y = []
  | otherwise = f
  where
    f = go x y []
    go x y nums
      | x == y = nums++[x]
      | otherwise = go (x + 1) y (nums++[x])

-- better way
eftInt' :: Int -> Int -> [Int]
eftInt' a b
  | a > b = []
  | a == b = [a]
  | otherwise = a : eftInt' (succ a) b

eftChar :: Char -> Char -> [Char]
eftChar a b
  | a > b = []
  | a == b = [a]
  | otherwise = a : eftChar (succ a) b
