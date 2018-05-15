module Recursion where

incTimes :: (Eq a, Num a) => a -> a -> a
incTimes 0 n = n
incTimes times n =
  1 + (incTimes (times - 1) n)

-- 1 + (incTimes (3 - 1) 2)
-- 1 + (incTimes (2 - 1) 2)
-- 1 + (incTimes (1 - 1) 2)
-- when (times -1) == 0 we return n which is 2
-- 1 + 1 + 1 + 2

-- We can abstract the recursion out of incTimes:
applyTimes :: (Eq a, Num a) =>
             a -> (b -> b) -> b -> b
applyTimes 0 f b = b
applyTimes n f b = f (applyTimes (n - 1) f b)

incTimes' :: (Eq a, Num a) => a -> a -> a
incTimes' times n = applyTimes times (1+) n

-- we can make the composition more obvious in applyTimes:
applyTimes' :: (Eq a, Num a) =>
              a -> (b -> b) -> b -> b

applyTimes' 0 f b = b

applyTimes' n f b =
  f . applyTimes' (n - 1) f $ b

-- ===================

