import Data.List

type Name = String
type Age = Integer
type ValidatePerson a = Either [PersonInvalid] a

data Person = Person Name Age deriving Show
data PersonInvalid = NameEmpty | AgeTooLow deriving (Eq, Show)

ageOkay :: Age -> Either [PersonInvalid] Age
ageOkay age = case age >= 0 of
  True -> Right age
  False -> Left [AgeTooLow]

nameOkay :: Name -> Either [PersonInvalid] Name
nameOkay name = case name /= "" of
  True -> Right name
  False -> Left [NameEmpty]

mkPerson :: Name -> Age -> ValidatePerson Person
mkPerson name age =
  mkPerson' (nameOkay name) (ageOkay age)

mkPerson' :: ValidatePerson Name -> ValidatePerson Age -> ValidatePerson Person
mkPerson' (Right nameOk) (Right ageOk) =
  Right (Person nameOk ageOk)
mkPerson' (Left badName) (Left badAge) =
  Left (badName ++ badAge)
mkPerson' (Left badName) _ = Left badName
mkPerson' _ (Left badAge) = Left badAge

safeTail :: [a] -> Maybe [a]
safeTail [] = Nothing
safeTail (x:[]) = Nothing
safeTail (_:xs) = Just xs

notThe :: String -> Maybe String
notThe "the" = Nothing
notThe x = Just x

replaceThe :: String -> String
replaceThe param = unwords $ go (words param)
  where
    go [] = []
    go (x:xs)
      | x == "the" = "a" : go xs
      | otherwise = x : go xs

-------
countTheBeforeVowel :: String -> Integer
countTheBeforeVowel xs = go (words xs)
  where
    go (x:[]) = 0
    go (x:xs) = if x == "the" && elem (head (head xs)) "aeiou" then 1 + go xs else 0 + go xs

----------
countVowels :: String -> Integer
countVowels [] = 0
countVowels (x:xs)
  | elem x "aeiou" = countVowels xs + 1
  | otherwise = countVowels xs + 0

-------
newtype Word' =
  Word' String deriving(Eq, Show)

vowels = "aeiou"

mkWord :: String -> Maybe Word'
mkWord xs
  | (countVowels xs) * 2 >= toInteger (length xs) = Just (Word' xs)
  | otherwise = Nothing


--------

data Nat =
  Zero
  | Succ Nat deriving (Eq, Show)

natToInteger :: Nat -> Integer
natToInteger Zero = 0
natToInteger (Succ next) = natToInteger next + 1 -- the last will be
                           -- natToInteger (Succ Zero) = natToInteger Zero + 1
                           --
integerToNat :: Integer -> Maybe Nat
integerToNat num
  | num < 0 = Nothing
  | otherwise = Just (go num) -- <-----
  where
    go 0 = Zero
    go num = Succ (go (num - 1))

-------

isJust :: Maybe a -> Bool
isJust (Just _) = True
isJust _ = False

isNothing :: Maybe a -> Bool
isNothing Nothing = True
isNothing _ = False

---

mayybee :: b -> (a -> b) -> Maybe a -> b
mayybee d f (Just x) = f x
mayybee d f Nothing = d

---

fromMaybe :: a -> Maybe a -> a
fromMaybe d Nothing = d
fromMaybe d (Just x) = x

---

listToMaybe :: [a] -> Maybe a
listToMaybe [] = Nothing
listToMaybe (x:_) = Just x

---

maybeToList :: Maybe a -> [a]
maybeToList Nothing = []
maybeToList (Just x) = [x]

---

catMaybes :: [Maybe a] -> [a]
catMaybes [] = []
catMaybes ((Just x) : xs) = x : catMaybes xs
catMaybes (Nothing : xs) = catMaybes xs

---

flipMaybe :: [Maybe a] -> Maybe [a]
flipMaybe (Nothing:_) = Nothing
flipMaybe [] = Just []
flipMaybe (Just x:xs) =
  case flipMaybe xs of
    Just ys -> Just (x:ys)
    Nothing -> Nothing

---
lefts' :: [Either a b] -> [a]
lefts' [] = []
lefts' (Left x:xs) = x : lefts' xs
lefts' (Right _: xs) = lefts' xs

-- with foldr

lefts'' :: [Either a b] -> [a]
lefts'' = foldr f []
  where
    f (Left a) as = a : as
    f (Right _) as = as

--
rights' :: [Either a b] -> [b]
rights' = foldr f []
  where
    f (Right a) as = a : as
    f (Left a) as = as

---

partitionEithers' :: [Either a b] -> ([a], [b])
partitionEithers' = foldr f ([], [])
  where
    f (Left a) (xs, ys) = (a:xs, ys)
    f (Right b) (xs, ys) = (xs, b:ys)

---
eitherMaybe' :: (b -> c) -> Either a b -> Maybe c
eitherMaybe' _ (Left _) = Nothing
eitherMaybe' f (Right x) = Just (f x)

---

either' :: (a -> c) -> (b -> c) -> Either a b -> c
-- ((a -> c) -> ((b -> c) -> (Either a b -> c)))
either' f _ (Left x) = f x
either' _ f (Right x) = f x

---

eitherMaybe'' :: (b -> c) -> Either a b -> Maybe c
-- ((b -> c) -> (Either a b -> Maybe c))
eitherMaybe'' _ (Left _) = Nothing
eitherMaybe'' f (Right x) = Just (either' f f (Right x)) -- fail D:

---

mehSum :: Num a => [a] -> a
mehSum xs = go 0 xs
  where
    go :: Num a => a -> [a] -> a
    go n [] = n
    go n (x:xs) = go (n+x) xs

niceSum :: Num a => [a] -> a
niceSum = foldl' (+) 0

---

mehProduct :: Num a => [a] -> a
mehProduct xs = go 1 xs
  where
    go :: Num a => a -> [a] -> a
    go n [] = n
    go n (x:xs) = go (n*x) xs

niceProduct :: Num a => [a] -> a
niceProduct = foldl' (*) 1

---

mehConcat :: [[a]] -> [a]
mehConcat xs = go [] xs
  where
    go :: [a] -> [[a]] -> [a]
    go xs' [] = xs'
    go xs' (x:xs) = go (xs' ++ x) xs

niceConcat :: [[a]] -> [a]
niceConcat = foldr (++) []

---

myIterate :: (a -> a) -> a -> [a]
myIterate f x = x : (myIterate f (f x))

---

-- take 10 $ myUnfoldr (\b -> Just (b, b+2)) 0
myUnfoldr :: (b -> Maybe (a, b)) -> b -> [a]
myUnfoldr f x =
  case f x of
    Nothing -> []
    Just (a, b) -> a : myUnfoldr f b
