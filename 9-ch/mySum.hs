-- The + operator is strict in both of its arguments, will force evaluation
-- of the values and the mySum xs.
mySum :: Num a => [a] -> a
mySum [] = 0
mySum (x : xs) = x + mySum xs

{- Example:

mySum [1..5]
1 + (2 + (3 + (4 + (5 + 0))))
1 + (2 + (3 + (4 + 5)))
1 + (2 + (3 + 9))
1 + (2 + 12)
1 + 14
15

-}
