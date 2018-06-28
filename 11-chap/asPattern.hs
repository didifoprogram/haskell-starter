{-# LANGUAGE GeneralizedNewtypeDeriving, FlexibleInstances #-}
module AsPattern where

import Data.Char
import Data.List

isSubseqOf :: (Eq a) => [a] -> [a] -> Bool
isSubseqOf a b = go a b
  where
    go [] _ = True
    go _ [] = False
    go (x:xs) (y:ys) = (x == y && go xs ys) || go a ys

capitalizeWords :: String -> [(String, String)]
capitalizeWords = go . words
  where
    go [] = []
    go (w@(x:xs):ws) = (w, toUpper x : xs) : go ws

isLucky n = f (go n)
    where
        go 0 = []
        go n = go (n `div` 10) ++ [n `mod` 10]
        f xs = (sum $ take (length xs `div` 2) xs) == (sum $ drop (length xs `div` 2) xs)

sortByHeight a = go a (sort [x | x <- a, x /= (-1)])
    where
        go [] _ = []
        go xs [] = xs
        go (x:xs) (y:ys) = if x == (-1) then x : go xs (y:ys) else y : go xs ys


evenOdd xs = f (partition (even . fst) (zip [0..] xs))
  where
    f (even,odd) = [sum $ snd (unzip even), sum $ snd (unzip odd)]

addBorder picture = (star : ['*':x++['*'] | x <- picture] ) ++ [star]
  where
    star = take ((length (picture !! 0))+2) (repeat '*')



areSimilar a b = if (sort a) == (sort b) then f' (f (go a b)) else False
  where
    go [] _ = []
    go (x:xs) (y:ys) = (x == y) : go xs ys
    f xs = (length $ filter (\x -> x == False) xs)
    f' x = x == 2 || x == 0

-- Language exercises

-- 1
capitalizeWord :: String -> String
capitalizeWord (x:xs) = toUpper x : xs

-- 2
capitalizeParagraph :: String -> String
capitalizeParagraph = go 2
  where
    go _ [] = []
    go 0 (' ':xs) = ' ' : go 2 xs
    go _ ('.':xs) = '.' : go 0 xs
    go 2 (x:xs) = toUpper x : go 3 xs
    go 3 (x:xs) = x : go 3 xs

