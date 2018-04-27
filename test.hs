module Test where

myFunc :: (x -> y)
       -> (y -> z)
       -> c
       -> (a, x)
       -> (a, z)

myFunc xToY yToZ _ (a, x) =
  (a, (yToZ (xToY x)))

  
