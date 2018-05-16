module DividedBy where

data DividedResult =
  Result Integer
  | DividedByZero deriving Show

dividedBy :: Integral a => a -> a -> DividedResult
dividedBy num denom
  | denom == 0 = DividedByZero
  | signum num == signum denom = Result r
  | otherwise = Result (-r)
  where
    r = go (abs num) (abs denom) 0
    go n d count
      | n < d = count
      | otherwise = go (n - d) d (count + 1)

{-
10 divided by 2 ==
  10 - 2, 8 (subtracted 1 time)
     - 2, 6 (subtracted 2 time)
     - 2, 4 (subtracted 3 time)
     - 2, 2 (subtracted 4 time)
     - 2, 0 (subtracted 5 time)
-}
