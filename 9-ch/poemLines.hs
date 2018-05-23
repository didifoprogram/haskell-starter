module PoemLines where

firstSen = "Tyger Tyger, burning bright\n"
secondSen = "In the forest of the night\n"
thirdSen = "What immortal hand or eye\n"
fourthSen = "Could frame thy fearful\
           \ symmetry?"
sentences = firstSen ++ secondSen
            ++ thirdSen ++ fourthSen

test = putStrLn sentences

-- Break up the string when we find a \n
myLines :: String -> Char -> [String]
myLines poem c -- c was '\n', now is parameterized
  | poem == [] = []
  | head poem == c = myLines (tail poem) c
  | otherwise = (takeWhile f poem) : myLines (dropWhile f poem) c
  where
    f n = n /= c

shouldEqual =
  [ "Tyger Tyger, burning bright"
  , "In the forest of the night"
  , "What immortal hand or eye"
  , "Could frame thy fearful symmetry?"
  ]

  main :: IO ()
main =
  print $
  "Are they equal? "
  ++ show (myLines sentences '\n' == shouldEqual)
