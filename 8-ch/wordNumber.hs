module WordNumber where

import Data.List (intersperse)

digitToWord :: Int -> String
digitToWord n = words !! n
  where
    words = ["zero", "one", "two", "three", "four", "five",
             "six", "seven", "eight", "nine"]

digits :: Int -> [Int]
digits n
  | n == 0 = [0]
  | otherwise = f
  where
    f = go n []
    go n nums
      | n == 0 = nums
      | otherwise = go (fst cur) (snd cur:nums)
        where
          cur = divMod n 10

wordNumber :: Int -> String
wordNumber n = unwords $ intersperse "-" $ map digitToWord (digits n)


test :: (Eq a, Num a) => a -> a -> a
test x y
  | y == 1 = x
  | otherwise = test x (y-1) * x
