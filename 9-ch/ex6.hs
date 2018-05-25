--direct recursion, not using (&&)
myAnd :: [Bool] -> Bool
myAnd [] = True
myAnd (x:xs) =
  if x == False
  then False
  else myAnd xs

-- direct recursion, using (&&)
myAnd' :: [Bool] -> Bool
myAnd' [] = True
myAnd' (x:xs) = x && myAnd xs

--1
myOr :: [Bool] -> Bool
myOr [] = False
myOr (x:xs) =
  if x == True
  then True
  else myOr xs

--2
myAny :: (a -> Bool) -> [a] -> Bool
myAny _ [] = False
myAny f (x:xs) =
  if f x == True
  then True
  else myAny f xs

--3
myElem :: Eq a => a -> [a] -> Bool
myElem _ [] = False
myElem a (x:xs) =
  if a == x
  then True
  else myElem a xs

--3
myElem' :: Eq a => a -> [a] -> Bool
myElem' x = any (==x)

--4
myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x:xs) = myReverse xs ++ [x]

--5 [[1,2,3],[4,5,6]]
squish :: [[a]] -> [a]
squish [] = []
squish (x:xs) = deep x $ squish xs
  where
    deep [] r = r
    deep (x:xs) r = x : deep xs r
{-
squish = deep [1,2,3] $ squish [[4,5,6]]
squish = deep [4,5,6] $ squish []
return [] because squish [] = []

deep [4,5,6] [] = 4 : deep [5,6] []
deep [5,6] [] = 5 : deep [6] []
deep [6] [] = 6 : deep [] []
return [] because deep [] r = r

6 : []
5 : [6]
4 : [5, 6]
[4,5,6]

squish = deep [1,2,3] $ [4,5,6]

deep = 1 : deep [2,3] [4,5,6]
deep = 2 : deep [3] [4,5,6]
deep = 3 : deep [] [4,5,6]
deep [] [4,5,6] = [4,5,6]

deep = 3 : [4,5,6]
deep = 2 : [3,4,5,6]
deep = 1 : [2,3,4,5,6]
[1,2,3,4,5,6]

squish = [1,2,3,4,5,6]
-}


squish' [] = []
squish' (x:xs) = x ++ squish' xs

--6
squishMap :: (a -> [b]) -> [a] -> [b]
squishMap _ [] = []
squishMap f (x:xs) = f x ++ squishMap f xs

--7 bad!?
squishAgain :: [[a]] -> [a]
squishAgain [] = []
squishAgain (x:xs) = (squishMap (\x -> [x]) x) ++ (squishAgain xs)

squishAgain' = squishMap id

--8
myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy _ (x:[]) = x
myMaximumBy f (x:xs) =
  let
    y = myMaximumBy f xs
  in
    case f x y of
      LT -> y
      EQ -> x
      GT -> x
{-
 -- | Evaluation? | --
myMaximumBy f [1,53,900,10]

y = maximumBy f [53,900,10] .. x == 1
y = maximumBy f [900, 10] .. x == 53
y = maximumBy f [10] .. x == 900
return 10

f 10 900
900
f 53 900
900
f 1 900
900

= 900
-}

--8
myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy _ (x:[]) = x
myMinimumBy f (x:xs) =
  let
    y = myMinimumBy f xs
  in
    case f x y of
      LT -> x
      _  -> y

--10 [1, 53, 900, 10]
myMaximum :: (Ord a) => [a] -> a
myMaximum (x:[]) = x
myMaximum (x:xs) =
  if x > y then x else y
  where
    y = myMaximum xs

myMinimum :: (Ord a) => [a] -> a
myMinimum (x:[]) = x
myMinimum (x:xs) =
  if x < y then x else y
  where
    y = myMinimum xs
