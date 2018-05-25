module Cipher where

import Data.Char

caesar :: String -> String
caesar s = map (encrypt 3 ) s -- 3 is the rotate number
  where
    encrypt n x = chr $ (((ord x) + n - 97) `mod` 26) + 97

unCaesar s = map (decrypt 3) s
  where
    decrypt n x = chr $ (((ord x - 97) - n + 26) `mod` 26) + 97
