newtype Word' =
  Word' String deriving (Eq, Show)

vowels = "aeiou"

mkWord :: String -> Maybe Word'

