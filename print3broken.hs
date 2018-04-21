module Print3Broken where

printSecond :: IO ()
printSecond = do
  putStrLn greeting

greeting = "Yarrr"

main :: IO ()
main = do
  putStrLn greeting
  printSecond
