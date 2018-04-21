module Palindrome where

isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome x =
  temp == x
  where temp = reverse x
