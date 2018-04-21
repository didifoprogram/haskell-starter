module GreetIfCool2 where

greetIfCool :: String -> IO ()
greetIfCool coolness =
  if cool coolness
     then putStrLn "eyyyyyy"
  else
    putStrLn "pshhhhhh"
  where cool v =
          v == "downright frosty yo"
