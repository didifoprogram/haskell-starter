module MakePerson where

import Control.Monad

type Name = String
type Age = Integer

data Person = Person Name Age deriving Show

data PersonInvalid =
  NameEmpty | AgeTooLow | PersonInvalidUnknown String
  deriving (Eq, Show)

mkPerson :: Name -> Age -> Either PersonInvalid Person

mkPerson name age
  | name /= "" && age > 0 = Right $ Person name age
  | name == "" = Left NameEmpty
  | not (age > 0) = Left AgeTooLow
  | otherwise = Left $ PersonInvalidUnknown $ "Name was: " ++ show name ++
                " Age was: " ++ show age

gimmePerson :: IO ()
gimmePerson = do
  putStrLn "Enter a name: "
  name <- getLine
  putStrLn "Enter the age: "
  age <- getLine
  putStrLn $ func (mkPerson name (read age))
  where
    func (Left p) = "Error occurred: " ++ (show p)
    func (Right p) =  "Yay! Successfully got a person: " ++ (show p)
