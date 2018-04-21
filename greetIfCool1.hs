-- greetIfCool1.hs
module GreetIfCool1 where

greetIfCool :: String -> IO ()
greetIfCool coolness =
  if cool
     then putStrLn "eyyyyy"
  else
    putStrLn "Pshhhhhh"
  where cool =
          coolness == "downright frosty yo"
