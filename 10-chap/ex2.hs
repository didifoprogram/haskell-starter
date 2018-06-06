module Ex2 where

import Data.Time

data DatabaseItem = DbString String
                  | DbNumber Integer
                  | DbDate UTCTime
                  deriving (Eq, Ord, Show)

theDatabase :: [DatabaseItem]
theDatabase =
  [ DbDate (UTCTime (fromGregorian 1911 5 1) (secondsToDiffTime 34123))
  , DbNumber 9001
  , DbString "Hello, World"
  , DbDate (UTCTime (fromGregorian 1921 5 1) (secondsToDiffTime 34123))
  , DbNumber 9900
  ]

-- 1
filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate xs = [x | (DbDate x) <- xs]

-- 2
filterDbNumber :: [DatabaseItem] -> [Integer]
filterDbNumber xs = [x | (DbNumber x) <- xs]

-- 3
mostRecent :: [DatabaseItem] -> UTCTime
mostRecent = maximum . filterDbDate

-- 4
sumDb :: [DatabaseItem] -> Integer
sumDb xs = foldr (+) 0 (filterDbNumber xs)
--or
sumDb' = sum . filterDbNumber

-- 5
avgDb :: [DatabaseItem] -> Double
avgDb xs = x / y
  where
    x = fromIntegral $ sumDb xs
    y = fromIntegral $ length (filterDbNumber xs)
