import Control.Monad
import System.Exit
import Data.Char

flatText :: String -> String
flatText text =  [toLower x | x <- text, elem (toLower x) ['a'..'z']]

palindrome :: IO ()
palindrome = forever $ do
  line1 <- getLine
  case (pal line1) of
    True -> putStrLn "It's a palindrome!"
    False -> exitSuccess
  where
    pal x = flatText x == reverse (flatText x)
