module Factorial where

factorial :: Integer -> Integer
factorial 0 = 1 -- base case
factorial n = n * factorial (n - 1)

factorial 3 = 3 * factorial (3 - 1)
= 3 * 2 factorial (2 - 1)
= 3 * 2 * 1 factorial (1 - 1) -- now it returns 1 because n = 0
= 3 * 2 * 1 * 1

incTImes 0 n = n
incTimes times n =
  1 + (incTimes (times - 1) n)

