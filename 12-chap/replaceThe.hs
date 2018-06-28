notThe :: String -> Maybe String
notThe xs
  | xs == "the" = Nothing
  | otherwise = Just xs

replaceThe :: String -> String
replaceThe xs = unwords $ map (f (notThe)) (words xs)
  where
    f x y
      | x y == Nothing = "a"
      | otherwise = y

-- 2
countTheBeforeVowel :: String -> Integer
countTheBeforeVowel xs = go (words xs)
  where
    go [] = 0
    go (x:xs)
      | x == "the" && elem (head (head xs)) "aeiou" = 1 + go xs
      | otherwise = 0 + go xs

-- 3
countVowels :: String -> Integer
countVowels [] = 0
countVowels (x:xs)
  | elem x "aeiou" = countVowels xs + 1
  | otherwise = countVowels xs + 0
