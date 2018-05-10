module Ex5 where

-- a)
tensDigit :: Integral a => a -> a
tensDigit x = d
  where xLast = fst (x `divMod` 10)
        d = snd (xLast `divMod` 10)

-- c)
hunsD x = d2
  where d = x `divMod` 100
        d2 = fst d

-- 2)
foldBool :: a -> a -> Bool -> a
foldBool x y b
  | b == True = y
  | b == False = x

foldBool' :: a -> a -> Bool -> a
foldBool' x y b =
  case b of
    True ->  y
    False -> x

-- 3)
g :: (a -> b) -> (a,c) -> (b,c)
g f (a,c) = (b, c)
  where b = f a
