module AbsoluteValue where

myAbs :: Integer -> Integer
myAbs x = if x >= 0
             then x
          else
            -1 * x
