module Ex1 where

-- Exercises: Grab Bag

-- 1
-- a) b) c) d)

-- 2
-- a)

-- 3
-- a)
addOneIfOdd n = case odd n of
  True -> f n
  False -> n
  where f = \n -> n + 1

-- b)
addFive = \x -> \y -> (if x > y then y else x) + 5

-- c)
mflip f x y = f y x
