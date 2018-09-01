module Cipher where

import Data.Char

caesar :: String -> String
caesar s = map (encrypt 3 ) s -- 3 is the rotate number
  where
    encrypt n x
      | x /= ' ' = chr $ (((ord x) + n - 97) `mod` 26) + 97
      | otherwise = ' '

unCaesar s = map (decrypt 3) s
  where
    decrypt n x
      | x /= ' ' = chr $ (((ord x - 97) - n + 26) `mod` 26) + 97
      | otherwise = ' '

runEncrypt :: IO ()
runEncrypt = do
  putStrLn "Enter some text to encrypt: "
  text <- getLine
  let encryptedText = caesar text
  putStrLn $ "Encrypted text: " ++ encryptedText

runDecrypt :: IO ()
runDecrypt = do
  putStrLn "Enter some encrypted text to decrypt"
  text <- getLine
  let decryptedText = unCaesar text
  putStrLn $ "Decrypted text: " ++ decryptedText
