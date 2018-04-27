-- typeInference1.hs
module TypeInference1 where

f :: Num a => a -> a -> a
f x y = x + y + 3



a :: (a -> c) -> a -> a
a c a = a

a' :: (a -> b) -> a -> b
a' f g = f g

b' :: String -> Int
b' a = length a

