-- ch2-ex2.hs
module Ch2Ex2 where

a :: String -> String
a x = x ++ "!"

b :: String -> Char
b x = x !! 4

c :: String -> String
c x = drop 9 x

letterIndex :: Int -> Char
letterIndex x = "Curry is awesome!" !! x

rvrs :: String -> String
rvrs x = (drop 4 end) ++ (take 4 end) ++ (take 5 x)
  where end = (drop 5 x)
