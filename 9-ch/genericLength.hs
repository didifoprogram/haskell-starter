-- *Not* identical to the length
-- function in Prelude

length' :: [a] -> Integer
length' [] = 0
length' (_:xs) = 1 + length' xs
