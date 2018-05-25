module ChapterEx where

import Data.Char

-- Data.Char
--2
onlyUpper :: String -> String
onlyUpper = filter isUpper

--3
firstLetter :: String -> String
firstLetter [] = []
firstLetter (x:xs) = [toUpper x] ++ xs

--4
allToUpper :: String -> String
allToUpper [] = []
allToUpper (x:xs) = toUpper x : allToUpper xs

--5
upperHead :: String -> Char
upperHead = toUpper . head
