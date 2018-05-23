module Ex4 where

--1
f :: [Int] -> [Int]
f xs = filter (\x -> mod x 3 == 0) xs

--2
f1 :: [Int] -> Int
f1 xs = length . filter (\x -> mod x 3 == 0) $ xs

--3
myFilter :: [Char] -> [[Char]]
myFilter = filter (\x -> (elem x ["the", "a", "an"]) == False) . words

--3
article :: String -> Bool
article "the" = False
article "an"  = False
article "a"   = False
article _     = True

myFilter' :: String -> [String]
myFilter' = (filter (article)) . words
