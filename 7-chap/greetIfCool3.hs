module GreetIfCool3 where

-- Matching data constructors from Bool

greetIfCool :: String -> IO ()
greetIfCool coolness =
  case cool of
    True ->
      putStrLn "eyyy,what's shakin"
    False ->
      putStrLn "pshhhhhh"
  where cool =
          coolness == "downright frosty yo"
