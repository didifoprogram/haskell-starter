module Cipher where

import Data.Char

getPos :: Char -> Int
getPos x = ord x - ord 'a'

keywordGen :: String -> String -> String
keywordGen s kw = take (length $ concat $ words s)
  (concat (take ((length s `div` length kw) + 1) (repeat kw)))

shift :: Char -> Char -> Char
shift x y = chr $ (((getPos x + getPos y) `mod` 26) + 97)

vigenere :: String -> String -> String
vigenere s kw = zipWith shift s (keywordGen s kw)
