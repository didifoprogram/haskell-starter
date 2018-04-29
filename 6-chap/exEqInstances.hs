module ExEqInstances where

-- 1
data TisAnInteger = TisAn Integer
instance Eq TisAnInteger where
  (==) (TisAn i) (TisAn i') = i == i'

-- 2
data TwoIntegers = Two Integer Integer
instance Eq TwoIntegers where
  (==) (Two a a') (Two b b') =
    a == b && a' == b'
n
-- 3
data StringOrInt = TisAnInt Int | TisAnString String
instance Eq StringOrInt where
  (==) (TisAnInt i) (TisAnInt i') = i == i'
  (==) (TisAnString s) (TisAnString s') = s == s'
  (==) _ _ = False -- for case Int == String or String == Int

-- 4
data Pair a = Pair a a
instance Eq a => Eq (Pair a) where
  (==) (Pair a a') (Pair b b') =
    a == b && a' == b'

-- 5
data Tuple a b = Tuple a b
instance (Eq a, Eq b) => Eq (Tuple a b) where
  (==) (Tuple a a') (Tuple b b') =
    a == b && a' == b'

-- 6
data Which a = ThisOne a | ThatOne a
instance Eq a => Eq (Which a) where
  (==) (ThisOne a) (ThisOne a') = a == a'
  (==) (ThatOne b) (ThatOne b') = b == b'
  (==) _ _ = False

-- 7
data EitherOr a b = Hello a | Goodbye b
instance (Eq a, Eq b) => Eq (EitherOr a b) where
  (==) (Hello a) (Hello a') = a == a'
  (==) (Goodbye a) (Goodbye a') = a == a'
  (==) _ _ = False
