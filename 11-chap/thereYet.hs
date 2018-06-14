data ThereYet =
  There Float Int Bool
  deriving (Eq, Show)

notYet :: Int -> Bool -> ThereYet
notYet = nope 25.5

notQuite :: Bool -> ThereYet
notQuite = notYet 10

yusss :: ThereYet
yusss = notQuite True

