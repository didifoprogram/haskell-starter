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


data QuantumBool = QuantumTrue | QuantumFalse | QuantumBoth deriving (Eq, Show)
type TwoQs = (QuantumBool, QuantumBool)


data Person = Person {name :: String, age :: Int} deriving (Eq, Show)
jm = Person "julie" 108
ca = Person "chris" 16

sumAges = (age jm) + (age ca)
theNames = (name jm) ++ " and " ++ (name ca)
personList = [jm, ca]
young = [x | x <- personList, age x < 50]

 -------------------------------------------
data Fiction = Fiction1 deriving Show
data Nonfiction = Nonfiction1 deriving Show

--data BookType = FictionBook Fiction
--              | NonfictionBook Nonfiction
--             deriving Show

type AuthorName = String

--data Author = Author (AuthorName, BookType)

-- apply distributive property
data Author = -- (a * b) + (a * c) == a * (b + c)
  Fiction AuthorName
  | Nonfiction AuthorName
  deriving (Eq, Show)
-----------------------------------------

data Expr =
  Number Int
  | Add Expr Expr
  | Minus Expr
  | Mult Expr Expr
  | Divide Expr Expr
----------------------------------------
data GuessWhat = Chickenbutt deriving (Eq, Show)
data Id a = MkId a deriving (Eq, Show)
data Product a b = Product a b deriving (Eq, Show)
data Sum a b = First a | Second b deriving (Eq, Show)
data RecordProduct a b =
  RecordProduct {pfirst :: a, psecond :: b} deriving (Eq, Show)

newtype NumCow =
  NumCow Int
  deriving (Eq, Show)

newtype NumPig =
  NumPig Int
  deriving (Eq, Show)

data Farmhouse =
  Farmhouse NumCow NumPig
  deriving (Eq, Show)

type Farmhouse' = Product NumCow NumPig -- Farmhouse and Farmhouse' are the same

newtype NumSheep =
  NumSheep Int
  deriving (Eq, Show)

data BigFarmhouse =
  BigFarmhouse1 NumCow NumPig NumSheep
  deriving (Eq, Show)

type BigFarmhouse' =
  Product NumCow (Product NumPig NumSheep) -- BigFarmhouse and BigFarmhouse' are the same.

-- we can perform a similar trick with sum:

type Name = String
type Age = Int
type LovesMud = Bool
type PoundsOfWool = Int

data CowInfo =
  CowInfo Name Age
  deriving (Eq, Show)

data PigInfo =
  PigInfo Name Age LovesMud
  deriving (Eq, Show)

data SheepInfo =
  SheepInfo Name Age PoundsOfWool
  deriving (Eq, Show)

data Animal =
  Cow CowInfo
  | Pig PigInfo
  | Sheep SheepInfo
  deriving (Eq, Show)

-- Alternately
type Animal' =
  Sum CowInfo (Sum PigInfo SheepInfo)
--Sum First  |  Second
bess' = (PigInfo "Pig" 3 True)
bess = Second (First bess') :: Animal'


-- MkId :: a -> Id a
idInt :: Id Integer
idInt = MkId 10

-----
type Awesome = Bool
type Name' = String

person :: Product Name' Awesome
person = Product "Simon" True

data Twitter =
  Twitter deriving (Eq, Show)

data AskFm =
  AskFm deriving (Eq, Show)

socialNetwork :: Sum Twitter AskFm
socialNetwork = First Twitter


myRecord :: RecordProduct Integer Float
myRecord = RecordProduct 42 0.0001

-- or
myRecord2 :: RecordProduct Integer Float
myRecord2 = RecordProduct {pfirst = 42, psecond = 0.0001}

-------------------
data OperatingSystem =
  GnuPlusLinux
  | OpenBSD
  | Mac
  | Windows
  deriving (Eq, Show)

data ProgLang =
  Haskell
  | Agda
  | Idris
  | PureScript
  deriving (Eq, Show)

data Programmer =
  Programmer {os :: OperatingSystem, lang :: ProgLang} deriving (Eq, Show)

-- construct a value from the record product Programmer
nineToFive :: Programmer
nineToFive = Programmer {os = GnuPlusLinux, lang = Haskell}
test :: Programmer
test = Programmer Windows Agda

-------------------
data Car = Car {make :: String
               , model :: String
               , year :: Integer}
         deriving (Eq, Show)

data Automobile = Null
                | Automobile Car
                deriving (Eq, Show)
--------------------------------
data Quantum =
  Yes
  | No
  | Both
  deriving (Eq, Show)

-- 3 + 3
quantSum1 :: Either Quantum Quantum
quantSum1 = Right Yes

quantSum2 :: Either Quantum Quantum
quantSum2 = Right No

quantSum3 :: Either Quantum Quantum
quantSum3 = Right Both

quantSum4 :: Either Quantum Quantum
quantSum4 = Left Yes

quantSum5 :: Either Quantum Quantum
quantSum5 = Left No

quantSum6 :: Either Quantum Quantum
quantSum6 = Left Both

-- now product types:
-- 3 * 3
quantProd1 :: (Quantum, Quantum)
quantProd1 = (Yes, Yes)

quantProd2 :: (Quantum, Quantum)
quantProd2 = (Yes, No)

quantProd3 :: (Quantum, Quantum)
quantProd3 = (Yes, Both)

quantProd4 :: (Quantum, Quantum)
quantProd4 = (No, Yes)

quantProd5 :: (Quantum, Quantum)
quantProd5 = (No, No)

quantProd6 :: (Quantum, Quantum)
quantProd6 = (No, Both)

quantProd7 :: (Quantum, Quantum)
quantProd7 = (Both, Yes)

quantProd8 :: (Quantum, Quantum)
quantProd8 = (Both, No)

quantProd9 :: (Quantum, Quantum)
quantProd9 = (Both, Both)


-- no function type

-- 3 ^ 3
quantFlip1 :: Quantum -> Quantum
quantFlip1 Yes = Yes
quantFlip1 No = Yes
quantFlip1 Both = Yes

-- ... the rest

------------------
-- identical to (a,b,c,d)
data Silly a b c d =
  MkSilly a b c d deriving Show

-- :k Silly
-- Silly :: * -> * -> * -> * -> *

-- :k Silly Int
-- Silly Int :: * -> * -> * -> *

-- :k Silly Int String
-- Silly Int String :: * -> * -> *

-- :k Silly Int String Bool
-- Silly Int String Bool :: * -> *

-- :k Silly Int String Bool String
-- Silly Int String Bool String :: *

-- identical to (a,b,c,d)
-- :k (,,,)
-- (,,,) :: * -> * -> * -> * -> *

-- :k (Int, String, Bool, String)
-- (Int, String, Bool, String) :: *

---------------------------

data List a = Nil | Cons a (List a) deriving Show
oneItem = (Cons "item" Nil)
twoItems = (Cons "item2" oneItem)

------------------------
data BinaryTree a = Leaf | Node (BinaryTree a) a (BinaryTree a) deriving (Eq, Ord, Show)
insert' :: Ord a
        => a
        -> BinaryTree a
        -> BinaryTree a

insert' b Leaf = Node Leaf b Leaf
insert' b (Node left a right)
  | b == a = Node left a right
  | b < a = Node (insert' b left) a right
  | b > a = Node left a (insert' b right)

------------------------
-- As-pattern
f :: Show a => (a, b) -> IO (a, b)
f t@(a, _) = do
  print a
  return t

doubleUp :: [a] -> [a]
doubleUp xs@(x:_) = x : xs
