module Phone where

import Data.Char
import Data.Map (fromListWith, toList)

data DaPhone = DaPhone [(Char, [Char])] deriving Show
phone :: DaPhone
phone = DaPhone [('1', "1"), ('2', "abc2"), ('3', "def3"),
                 ('4', "ghi4"), ('5', "jkl5"), ('6', "mno6"),
                 ('7', "pqrs7"), ('8', "tuv8"), ('9', "wxyz9"),
                 ('*', ""), ('0', " +_0"), ('#', ".,")]

convo :: [String]
convo = ["Wanna play 20 questions"]

--validButtons = "1234567890*#"
type Digit = Char

-- Valid presses: 1 and up
type Presses = Int

reverseTaps :: DaPhone -> Char -> [(Digit, Presses)]
reverseTaps (DaPhone (x:xs)) ch
  | elem (toLower ch) (snd x) = if (isUpper ch)
                                then [('*', 1),(fst x, sum (go (snd x)))]
                                else [(fst x, sum (go (snd x)))]
  | otherwise = reverseTaps (DaPhone xs) ch
  where
    go [] = []
    go (x:xs) = if x == (toLower ch) then 1 : [] else 1 : go xs

cellPhonesDead :: DaPhone -> String -> [(Digit, Presses)]
cellPhonesDead phone xs = concat $ map (reverseTaps phone) xs

-- 3
fingerTaps :: [(Digit, Presses)] -> Presses
fingerTaps = foldr (\(x,y) b -> y + b) 0

-- 4
--mostPopularLetter :: String -> Char
mostPopularLetter xs = findMaxx $ toList $ fromListWith (+) [(x,1)| x <- xs]

findMaxx :: [(Digit,Presses)] -> (Digit,Presses)
findMaxx (x:[]) = x
findMaxx (x:xs) =
  if (snd x) > (snd y) then x else y
  where
    y = findMaxx xs

--------- IGNORE ------------
myMaximum :: (Ord a) => [a] -> a
myMaximum (y:[]) = y
myMaximum (x:xs) =
  if x > y then x else y
  where
    y = myMaximum xs
---------------------------

-- 5
coolestLtr :: String -> Char
coolestLtr = fst . mostPopularLetter

-- 6
coolestWord :: String -> String
coolestWord = undefined

