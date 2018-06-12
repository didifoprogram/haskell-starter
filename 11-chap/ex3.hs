{-# LANGUAGE GeneralizedNewtypeDeriving, FlexibleInstances #-}
class TooMany a where
  tooMany :: a -> Bool
instance TooMany Int where
  tooMany n = n > 42


newtype Goats = Goats Int deriving (Eq, Show, TooMany)

--instance TooMany Goats where
--  tooMany (Goats n) = n > 43

-- 1
instance TooMany (Int, String) where
  tooMany (n, _) = n > 42

-- 2
--instance TooMany (Int, Int) where
--  tooMany (n, nn) = n + nn > 42

newtype DoubleGoats = DoubleGoats (Int, Int) deriving (Eq, Show)
instance TooMany DoubleGoats where
  tooMany (DoubleGoats (n, nn)) = n + nn > 42

-- 3
instance (Num a, TooMany a) => TooMany (a, a) where
  tooMany (n, nn) = tooMany (n + nn)
