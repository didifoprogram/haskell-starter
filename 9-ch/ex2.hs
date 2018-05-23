module Ex2 where

myWords :: String -> Char ->  [String]
myWords wrds c -- c was ' '
  | wrds == [] = []
  | head wrds == c = myWords (tail wrds) c
  | otherwise = (takeWhile t wrds) : myWords (dropWhile t wrds) c
  where
    t n = n /= c

