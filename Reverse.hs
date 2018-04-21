-- Reverse.hs

module Reverse where

rvrs :: String -> String
rvrs x = (drop 4 end) ++ (take 4 end) ++ (take 5 x)
  where end = (drop 5 x)

main :: IO ()
main = print $ rvrs "curry is awesome"
