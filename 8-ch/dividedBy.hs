module DividedBy where

dividedBy :: Integral a => a -> a -> (a,a)
dividedBy num denom = go num denom 0
  where go n d count -- The num,denom, and 0 are bound to n,d, and count.
          | d == 0 = error "divided by zero"
          | n < d = (count, n)
          | otherwise =
              go (n - d) d (count + 1)

{-
10 divided by 2 ==
  10 - 2, 8 (subtracted 1 time)
     - 2, 6 (subtracted 2 time)
     - 2, 4 (subtracted 3 time)
     - 2, 2 (subtracted 4 time)
     - 2, 0 (subtracted 5 time)
-}

