module Ex4 where

-- 1

stops = "pbtdkg"
vowels = "aeiou"

-- a
svs la lb = [(s,v,ss) | s <- la, v <- lb, ss <- la]

-- b
svs' la lb = [(s,v,ss) | s <- la, v <- lb, ss <- la, s == 'p']

-- c
noun = ["area", "book", "business", "case", "child", "company", "country"]
verb = ["beat", "bend", "bet", "come", "cost", "dig", "cut", "go", "fly", "give"]

nvn ln lv = [(n, v, nn) | n <- ln, v <- lv, nn <- ln]

-- 2
seekritFunc x =
  div (sum (map length (words x))) (length (words x))
-- quantity of letters in the String divided by quantity of words in the String

-- 3
seekritFunc' x =
  (fromIntegral (sum (map length (words x)))) / (fromIntegral (length (words x)))


{-
+---------------------------------+
- Rewriting functions using folds -
+---------------------------------+
-}

-- 1
myOr :: [Bool] -> Bool
myOr = foldr (||) False

-- 2
myAny :: (a -> Bool) -> [a] -> Bool
myAny f = foldr (\x y -> if f x == True then True else y) False

-- 3
myElem :: Eq a => a -> [a] -> Bool
--myElem e xs = foldr (||) False (map (\x -> x == e) xs)
myElem e = foldr (\x y -> if x == e then True else y) False

myElem' e = any (\x -> x == e)

-- 4
